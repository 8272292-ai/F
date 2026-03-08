<!DOCTYPE html>
<html lang="ar">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>Farida & Mohamed</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            min-height: 100vh;
            background: radial-gradient(circle at 20% 30%, #1e0b14, #0a0104);
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Segoe UI', 'Arial', sans-serif;
            overflow: hidden;
            position: relative;
            touch-action: pan-x pan-y;
        }

        /* خلفية متحركة من الدوائر */
        .bg-circles {
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            overflow: hidden;
            z-index: 0;
        }

        .circle {
            position: absolute;
            border-radius: 50%;
            background: rgba(255, 45, 117, 0.03);
            border: 1px solid rgba(255, 45, 117, 0.2);
            animation: moveCircle 20s linear infinite;
        }

        @keyframes moveCircle {
            0% { transform: translate(0, 0) scale(1); }
            33% { transform: translate(5%, 5%) scale(1.1); }
            66% { transform: translate(-5%, -2%) scale(0.9); }
            100% { transform: translate(0, 0) scale(1); }
        }

        /* الحاوية الرئيسية */
        .container {
            position: relative;
            z-index: 10;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            width: 100%;
            padding: 1rem;
        }

        /* القلب الضخم مع تأثيرات متعددة */
        .heart-wrapper {
            position: relative;
            width: 260px;
            height: 260px;
            margin-bottom: 30px;
            filter: drop-shadow(0 0 40px #ff1a5e);
            animation: levitate 4s ease-in-out infinite;
        }

        @keyframes levitate {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-20px); }
        }

        .heart {
            position: absolute;
            width: 130px;
            height: 130px;
            background: linear-gradient(145deg, #ff2d75, #ff1755, #ff4d8c);
            transform: rotate(-45deg);
            left: 65px;
            top: 65px;
            box-shadow: 
                0 0 100px #ff2d75,
                0 0 200px #ff2d75,
                inset 0 0 30px #fff3;
            border-radius: 0 0 30px 0;
            animation: heartbeat 1s infinite alternate cubic-bezier(0.45, 0.05, 0.55, 0.95);
        }

        .heart::before, .heart::after {
            content: "";
            position: absolute;
            width: 130px;
            height: 130px;
            background: linear-gradient(145deg, #ff2d75, #ff1755, #ff4d8c);
            border-radius: 50%;
        }

        .heart::before { top: -65px; left: 0; }
        .heart::after { left: 65px; top: 0; }

        @keyframes heartbeat {
            0% { transform: rotate(-45deg) scale(1); box-shadow: 0 0 80px #ff2d75; }
            100% { transform: rotate(-45deg) scale(1.15); box-shadow: 0 0 180px #ff2d75, 0 0 250px #ff80b0; }
        }

        /* حرف F بشكل فني */
        .letter-f {
            position: absolute;
            z-index: 20;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            font-size: 80px;
            color: #fff5f0;
            text-shadow: 
                0 0 30px #ff2d75,
                0 0 60px #ff2d75,
                2px 2px 0 #ff80ab;
            font-family: 'Brush Script MT', 'cursive';
            font-weight: bold;
            line-height: 1;
        }

        /* النصوص الرئيسية */
        .names {
            text-align: center;
            margin-top: 10px;
        }

        .name-big {
            font-size: 58px;
            font-weight: 900;
            background: linear-gradient(135deg, #fff7f0, #ffd9e6);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            text-shadow: 
                0 0 20px #ff4d8c,
                0 0 40px #ff4d8c,
                0 0 60px #ff2d75;
            letter-spacing: 6px;
            line-height: 1.2;
            margin-bottom: 10px;
        }

        .sub-message {
            font-size: 28px;
            color: #ffb6c1;
            background: rgba(30, 10, 15, 0.4);
            backdrop-filter: blur(4px);
            padding: 12px 30px;
            border-radius: 60px;
            border: 1px solid #ff80ab;
            display: inline-block;
            margin-bottom: 20px;
            font-style: italic;
            box-shadow: 0 0 30px rgba(255, 45, 117, 0.5);
        }

        .extra-note {
            font-size: 20px;
            color: #ffa5b9;
            opacity: 0.9;
            text-shadow: 0 0 10px #ff2d75;
        }

        /* تأثير الجسيمات */
        .particle {
            position: absolute;
            pointer-events: none;
            z-index: 100;
            animation: rise 3s ease-out forwards;
            filter: drop-shadow(0 0 5px #ff80ab);
        }

        @keyframes rise {
            0% { transform: translateY(0) rotate(0deg); opacity: 1; }
            100% { transform: translateY(-300px) rotate(360deg); opacity: 0; }
        }

        /* نجوم ثابتة */
        .star {
            position: absolute;
            color: rgba(255, 200, 220, 0.4);
            font-size: 15px;
            pointer-events: none;
            animation: twinkle 3s infinite alternate;
        }

        @keyframes twinkle {
            0% { opacity: 0.2; }
            100% { opacity: 1; }
        }

        /* توهج متحرك عند تحريك الماوس */
        .mouse-glow {
            position: fixed;
            width: 300px;
            height: 300px;
            border-radius: 50%;
            background: radial-gradient(circle, rgba(255, 45, 117, 0.3) 0%, transparent 70%);
            pointer-events: none;
            z-index: 9999;
            transform: translate(-50%, -50%);
            transition: 0.03s;
        }
    </style>
</head>
<body>
    <!-- خلفية دائرية متحركة -->
    <div class="bg-circles">
        <div class="circle" style="width: 400px; height: 400px; top: -100px; right: -100px;"></div>
        <div class="circle" style="width: 600px; height: 600px; bottom: -200px; left: -200px;"></div>
        <div class="circle" style="width: 300px; height: 300px; top: 30%; left: 10%;"></div>
        <div class="circle" style="width: 500px; height: 500px; bottom: 20%; right: 5%;"></div>
    </div>

    <!-- تأثير ضوء الماوس -->
    <div class="mouse-glow" id="mouseGlow"></div>

    <!-- المحتوى الرئيسي -->
    <div class="container">
        <div class="heart-wrapper">
            <div class="heart"></div>
            <div class="letter-f">F</div>
            <!-- تم إزالة التاريخ 17/7 -->
        </div>

        <div class="names">
            <div class="name-big">FARIDA</div>
            <div class="sub-message">Mohamed Loves You · إلى الأبد</div>
            <div class="extra-note">✨ حب عمرى ✨</div>
        </div>
    </div>

    <script>
        (function() {
            // إدارة الجسيمات عند النقر
            function createParticles(e) {
                const x = e.clientX || (e.touches && e.touches[0].clientX);
                const y = e.clientY || (e.touches && e.touches[0].clientY);
                if (!x || !y) return;

                const symbols = ['❤️', '💖', '💘', '💕', '💞', '💓', '💗', '🌸', '✨', '⭐'];
                for (let i = 0; i < 12; i++) {
                    const particle = document.createElement('div');
                    particle.className = 'particle';
                    particle.innerHTML = symbols[Math.floor(Math.random() * symbols.length)];
                    particle.style.left = (x + (Math.random() * 80 - 40)) + 'px';
                    particle.style.top = (y + (Math.random() * 40 - 20)) + 'px';
                    particle.style.fontSize = (Math.random() * 30 + 20) + 'px';
                    particle.style.animationDuration = (Math.random() * 2 + 2) + 's';
                    document.body.appendChild(particle);
                    setTimeout(() => particle.remove(), 3000);
                }
            }

            // أحداث النقر
            document.addEventListener('click', createParticles);
            document.addEventListener('touchstart', createParticles);

            // قلوب متساقطة تلقائياً
            setInterval(() => {
                const x = Math.random() * window.innerWidth;
                const y = window.innerHeight + 20; // تبدأ من أسفل بقليل
                const p = document.createElement('div');
                p.className = 'particle';
                p.innerHTML = ['💖', '💝', '💗', '💓', '🌸', '🌺'][Math.floor(Math.random() * 6)];
                p.style.left = x + 'px';
                p.style.top = y + 'px';
                p.style.fontSize = (Math.random() * 24 + 16) + 'px';
                p.style.animation = 'rise 4s ease-out forwards';
                p.style.animationDuration = (Math.random() * 2 + 3) + 's';
                document.body.appendChild(p);
                setTimeout(() => p.remove(), 5000);
            }, 400);

            // تأثير الماوس المتوهج
            const glow = document.getElementById('mouseGlow');
            document.addEventListener('mousemove', (e) => {
                glow.style.left = e.clientX + 'px';
                glow.style.top = e.clientY + 'px';
            });

            // إضافة نجوم ثابتة في الخلفية
            function createStars() {
                for (let i = 0; i < 60; i++) {
                    const star = document.createElement('div');
                    star.className = 'star';
                    star.style.left = Math.random() * 100 + '%';
                    star.style.top = Math.random() * 100 + '%';
                    star.style.fontSize = (Math.random() * 20 + 5) + 'px';
                    star.style.animationDelay = Math.random() * 3 + 's';
                    star.innerHTML = '✦';
                    document.body.appendChild(star);
                }
            }
            createStars();

            // تغيير حجم الدوائر الخلفية مع حركة الماوس (اختياري)
            document.addEventListener('mousemove', (e) => {
                const x = e.clientX / window.innerWidth - 0.5;
                const y = e.clientY / window.innerHeight - 0.5;
                const circles = document.querySelectorAll('.circle');
                circles.forEach((circle, index) => {
                    const speed = (index + 1) * 5;
                    circle.style.transform = `translate(${x * speed}px, ${y * speed}px)`;
                });
            });
        })();
    </script>
</body>
</html>