Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D9D525A9D
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904668; cv=none; b=F1zPRTTqmmoEWwHfllY1bbLRrfxa80OiRsLrARcFqXdnJXONAACafHigml126agXYN0ajQudpHJaAYmQjYTMp7u7tZ3HQIFAwe0rl1HchpNet+pCcItJ2MZaTZ5hfv5EWGIfZ0VO0sSl8uuzAdmL72Vy6JAZJbFGuJG3o9hjk0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904668; c=relaxed/simple;
	bh=bz0c0FzRoFwONs0INWzutnRV3/uG+7US0x6YY49BHmk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C4JLSfCjKtTMAbNX2gYL0pnogoZoJNmTSscmc8NQiFounEcoAmJ+0LEZIMf8H+EkT5N2zvDksmV6n7FBQeQtSaj08Ja9eStH/ej41X1X/iom8fjHYOFi0IQ7KwYk8f4TRM3JTMyYV3wofOF8N+FSfYnRyFg+BBn4sQqf5qSzUJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=iM3WoLBE; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="iM3WoLBE"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48870973bddso1891564f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1791904663; x=1792509463; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7hnlvbehMSyPR6UnmFPNMKU268xjGZhcR+ZNGcu0l5I=;
        b=iM3WoLBE1VaZjLLXEMM9S+0ic9vr81RCtyR+I4wPQQWz4a78U0FJw2uQ223vH6wK3v
         bubob/J8xvnfFs+5vbGFbkoFgqGp0jKqPr5M9VO+NAOzgAsOJYZyI1zPLbR6FBN+EZTe
         vIKmPX2oZN8l/+hSG5LTIQV7SDXydRwSzOElYhVqFg1lhd5U7GZmmiiZLacLyBf6TaOK
         mF3dMNKBb+1NREbFyrzlyE159ptUqdOgNf9no4DFvjfN8SKZPWkjB+w9Uyo0WYQybP6n
         TMPXaDpFPzEn9X+fkny27+fEkW8eEspw9wMYn9vm0125qFBU06/qLh5b8k6WyJI2Ubw0
         iITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904663; x=1792509463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7hnlvbehMSyPR6UnmFPNMKU268xjGZhcR+ZNGcu0l5I=;
        b=IyiJSMWACNYZ5wCs0njXS/2pMA/FJ7zcrXEcDL51ZGAPZybSak2SsneIuHMt2/B3BV
         f579AS7VYEqpqYJnFhrOo/9k076uFNIocHdlpSjVCZINGhTgmpS0d8x/l3GkQhvsrsjH
         FJUwYMj1pijvZP4c0gc/TzeBRgwukF+LbsBCQ7D9zOrnWWkxpVDBk2mMWJ0AB9XqzkIX
         C7vddM9mTx2qtQ4MwyobbId305Gxc7F7iXLibqWe5xIAlFrRwc+Y4qMhxJ9odobJ7qiq
         fhXAnM5CvUYu/bwNyS36/nE7JeoKILFE8+c3pLMlFcvbVH/pLyX15JNaK6LlgxgCM+Ul
         VNyg==
X-Forwarded-Encrypted: i=1; AKwUvBylEGshLrKUgZXb6s/joHJHQyaov+OXzZTpxv7LjwB4vejBpL3248RHm9jZmBld8NTf4yKUi4827bue27Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYLa8rYgH3t7j9z0h8rb3N7N2xnCkTuys2lbm/u87z8eJnCwhTdt
	ipEexwdnL05kWVNLvQn+G1reCwztIAKbO+abBM08erGZhIEckZmd0pHAVOrnpdPcxf0=
X-Gm-Gg: AYBFou21ZS94DKpBYA7rQx+V3IzAxPaL4tTkaJUugtrVo/d8nK0UKRofva6OKgF5Egy
	Z32ZQnuNMERGpdl62HNh32hjy7ZDsvtzcMS0Te5xb6YkCDkik4iJt8tHMtlXzXAVAq+iJ+03BxN
	ucWCE/Lwo8ESM+Aw2d6ij2h9VlNDZsLWj94JEGII5TmMWchH8DYFkUX9Y5Axr76ZPTPfMnIb8gO
	LqOWBU7fMLY0Euiz/1wbZm5fJL1T4WwdUdW2EfOio/lspjq9WzEh17249g/eQ1o2EQnYWueZhnd
	Gve+njeU8lhbnUYAr3610+WveOAFpIycGx5qJCEocYTHCwyj7o8Uth7fDpUPR+GeTkZm9xYDXaV
	ZS7yV276jWPwPcfIYPH2PA6wDXbJZ1P7mai0AoBlUDPz4H4oTQSb0nf3IZnZCtiAxeb2Q/H45I0
	cXenVjvCfeQGKf061o247iNe9yRiSc84oG0ZwmGtwH2OmyzZI/lWPLo38vFJE8+l6/cYxlubToa
	t43/s2Pb5kNkpuZuhfdzEUGrV1ezYzuFPF/SE3L8AcH7ALECQ==
X-Received: by 2002:a5d:444d:0:b0:48c:585b:8825 with SMTP id ffacd0b85a97d-48dbace132fmr20717882f8f.18.1791904663170;
        Tue, 13 Oct 2026 08:17:43 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48de0aaabb8sm6529743f8f.15.2026.10.13.08.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:17:42 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 13 Oct 2026 16:17:02 +0100
Subject: [PATCH v2 03/13] media: sony-starvis2: Always program the sensor
 in window mode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-media-starvis2-v2-3-3670722d250a@raspberrypi.com>
References: <20261013-media-starvis2-v2-0-3670722d250a@raspberrypi.com>
In-Reply-To: <20261013-media-starvis2-v2-0-3670722d250a@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

If the requested region matched the defined active area then
the driver switched to all-pixel mode. This left the possibility
that the active area was incorrect and not reading out the area
expected.

Switch to always requesting window mode to avoid this potential
mismatch.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index c7fbc5c132f4..20f3489b58d3 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -918,9 +918,7 @@ static int starvis2_program_window(struct starvis2 *starvis2,
 	int ret = 0;
 
 	cci_write(starvis2->cci, STARVIS2_REG_ADDMODE, 0x00, &ret);
-	cci_write(starvis2->cci, STARVIS2_REG_WINMODE,
-		  v4l2_rect_equal(crop, &imx678_active_area) ? 0x00 : 0x04,
-		  &ret);
+	cci_write(starvis2->cci, STARVIS2_REG_WINMODE, 0x04, &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_PIX_HST,
 		  crop->left - imx678_active_area.left, &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_PIX_HWIDTH, crop->width, &ret);

-- 
2.34.1

