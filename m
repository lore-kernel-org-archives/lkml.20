Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF0B43CE45
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787828268; cv=none; b=t4VFmfgULjxOv7rOnNHN4RgiA8ABRxGN0VsHQaPlrXjafQdeexnbgefeU5XrDHZI06ti9oWzM4uKW2NWl/oyeME4IoejXHEO6r0SizeneibZeDoilkdyo1hG8Mp245RLN3PL3l26pDQNmTqQlFgqeMmppKzF7A6GNP8l0zF6sE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787828268; c=relaxed/simple;
	bh=ZZqfBGCZfSe4hR0/zIUzrYcpc4DmFc9ey6Ju3c4LDuA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gPHDJF/l2XxyL+XlFmfFgjtJ6o5pdn23lyUNLhwwAuGW/kSsBx3UpvDfpk1Qu5UI/oQevJgqClqy8ZaDxG1NCeA8HfG6jtcrxTfsXSCMGcYfP26WoX1gUh3H/KNhIDTs7lbCR6/rEdxrIzyums8LoaN7KjDCKHI8X0lc4hS2puM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RbJqce52; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RbJqce52"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc1cf287ef8so1161218a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 03:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787828265; x=1788433065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ntmVipoSayOwXs57Kc1THh0tKdh0WN7s/EHA02RtOpA=;
        b=RbJqce52Hdp8RQ7BGkrDX7TqTGwQZ8PHZvbYP6vaQ00Jf9IatpJ3bbQYMo6r10J7Ay
         PsAqgWwsCKlYCA2CGNWfyqOEKLCNnlgndbTi+hYa0KeTSNKcOT6uuRzqa3YvuRby6cY6
         uHEfFVt8ap8CoOWlIRBPyAAxr6Ccx8+RepizU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787828265; x=1788433065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ntmVipoSayOwXs57Kc1THh0tKdh0WN7s/EHA02RtOpA=;
        b=V7pMIfU2sWRFhJsFrJ30BWDZXPa3vXPlFcAtYD7Q3gKA0njN7MbyaxfZ/NYeqnUISz
         7800H+BXsRjFZQjYbVfrBxyT4nQ1JzE1AYG/SMBqFaNsauL1ibES2zL/bcOLQCpny9nF
         p7r9SL29mVkzlkHJCg88NNkZHx7ss+p9Iga+83hOl77ChYMlRe19iFddBwyVKT2j9o+J
         FrbVY4X9Grm4tQqjDJ9qFQwFeWw9dvmv0kkEV+WTs9ECpsg3BcbpoOz0rUz48YnveNhn
         imX+I26qgMtgd8VVYkN+lfvEpzR+SaIfqOdZC0GwQT5h98BQd05Ox7TDa+tTIFUoGp/d
         dx9Q==
X-Forwarded-Encrypted: i=1; AHgh+RrS9bw49KTB4eWWSDCLv1TX+qPnTu2nlt8O/qtt/AG5MYRvm7wOJWZ+bV4itO18yKJ1GQlaVbPF+lF9FBo=@vger.kernel.org
X-Gm-Message-State: AFuF++luExf2HK3w7ad5cMYMGUN89rYZyApXKmRl8odBH0PH32JXGgNu
	N49PIW3bRkjhC+SRsKYpujtHJnjF3Ri1bzLpviPlMIiFufdiuOWA+VZuY0gRFm0CoQ==
X-Gm-Gg: AR+sD11p8eo4tNsDjD+mzWNG/X+0rDh2TL1WL7my+hhWhcps46sle/f/rmo9oBGYisn
	k5RMneJPgfeyaNFHzOR7/TK3tPNWPOhwaYU2Ud3zJ1BV5YDXfeDpkIokmvTU3Iyim0ivBsBjl2e
	IVKOsZQmUqVuO4Jzz1a9lruwBD7ORHwUn1s+LLaTMI7AiApR6qDvqIOv/9lQBPPOrpytU4EqeBE
	FkFx6qSdtUme3buAvZx5mGKLX7k2Yyw0pClzejl2mcHQIeuZQ4t0bI68OATdk4lutidd2CNvyLy
	qwS8IH/HmH5ZwEDFYvBLifJdT6LHbjc7lcVjOJ6l2liXjLr3Z10Lwzoq2qDKmrtPAqchul5L4/Q
	/rG6bn74dWwaxhDLzGi+QrMoJo2qoGFREE3lSJrZvLXGAeMkFf0FBDb8HhHisn0HN6UvB2QHFJU
	BAj1iQF6K5CT6DkEXa1Lewgh9MBJuhiZoJNDglAHz16ajb/zlma7AiVNunfFQldkmSLVNPWEvdj
	6HxO/a9g36w5CaoTVu7IUfErDistbZ/y4FfoNnkJiYyvJqQGzJM/eoSrQ==
X-Received: by 2002:a17:90b:3fc4:b0:38f:dec8:f7e9 with SMTP id 98e67ed59e1d1-3966d443146mr29645548a91.12.1787828264658;
        Thu, 27 Aug 2026 03:57:44 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:b7d8:fa42:587e:234d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b186807bsm2434123a91.12.2026.08.27.03.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 03:57:43 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-pwm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jitao Shi <jitao.shi@mediatek.com>
Subject: [PATCH] pwm: mtk-disp: Fix period readback
Date: Thu, 27 Aug 2026 18:57:36 +0800
Message-ID: <20260827105738.8570-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The period value stored in the register is the number of clock cycles - 1.

Account for the offset when calculating the period in nanoseconds. This
fixes the discrepancy reported by the pwm core when CONFIG_PWM_DEBUG=1:

    mediatek-disp-pwm 1100e000.pwm: .apply is not idempotent
    	(ena=1 pol=0 281500/499875) -> (ena=1 pol=0 281500/499750)

Calculation discrepancy in the driver was found by AI run by a colleague
while debugging another PWM related issue. Check against SoC datasheet
and fix done by the author.

Fixes: 3f2b16734914 ("pwm: mtk-disp: Implement atomic API .get_state()")
Cc: Jitao Shi <jitao.shi@mediatek.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/pwm/pwm-mtk-disp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-mtk-disp.c b/drivers/pwm/pwm-mtk-disp.c
index b5409e15dac8..68a4512e821a 100644
--- a/drivers/pwm/pwm-mtk-disp.c
+++ b/drivers/pwm/pwm-mtk-disp.c
@@ -212,7 +212,7 @@ static int mtk_disp_pwm_get_state(struct pwm_chip *chip,
 	 * period has 12 bits, clk_div 11 and NSEC_PER_SEC has 30,
 	 * so period * (clk_div + 1) * NSEC_PER_SEC doesn't overflow.
 	 */
-	state->period = DIV64_U64_ROUND_UP(period * (clk_div + 1) * NSEC_PER_SEC, rate);
+	state->period = DIV64_U64_ROUND_UP((period + 1) * (clk_div + 1) * NSEC_PER_SEC, rate);
 	high_width = FIELD_GET(PWM_HIGH_WIDTH_MASK, con1);
 	state->duty_cycle = DIV64_U64_ROUND_UP(high_width * (clk_div + 1) * NSEC_PER_SEC,
 					       rate);
-- 
2.55.0.887.g758fc8c411-goog

