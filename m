Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246679;
	b=Il+omuGtvUfi06KuPInqJJFwkO41hwXI7E3HosBKsFEU8vwxs5BbOby8jyflqP5onF+a
	 qJpe5oAIszTCiLnRh8EofHSSSqaX/4VWAPXZq51U/HPtMmBaY9k5EBeHlnxKAFlkghIMe
	 CkpddVhW3y7SBMNMeQFNT4vbVybnjcjidxqyW2vTGjVSLjRQf4AREbWDhF35KsJYmrL3r
	 mFKkvrDdUlZVMSppKz87wJLQQJPLAOnghUQ5k04jwAWBzqNKw1ufeYm7TJfttUiL0hYs9
	 UXXJvHgzp7n3u7cCR/AVohCSYgAqIWtrScDe9JEbVRPrpSrwws9yLxKNAgfEfvG2YhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246679;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6lQZd1bM6K+vPoeN+FFObtB7PVIN9WoNQwEnxWfTQwg=;
	b=KZKJrnJAr3ceZFu1s4vN2Vwbo5KwQiQvgA2mhqmhc+lfY5rVN1bB3J6ccJJnPCEAREZz
	 iaKrJB6c9UGUlHfSA5ajboiT0A+sEg+j41TJAxHo3oopt8gU5NLgz1cf9UVOULs4EWf28
	 or4XK68G3AhEQS07Zl0mv/RKgyFoWVMLrp89uaMK8jSPq4Gx7hIDhEQjCZTDRrOR0d9Qu
	 ra+sFSIiUWNq0evegD0djU8GxD9bhmdBfHCYVb9m61cvsaZz6LJCAs3T8EGA0kSc/HXx0
	 JEieOrTqlk7jlBw1yTccCEinVeBoHPa3RuiUIL02LOpeSUVBycNae//Q7FiJDiau5yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DqxDxWVm;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0112B60A6F5E
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:51:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0112B60A6F5E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DqxDxWVm
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so14301575e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246677; x=1794851477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6lQZd1bM6K+vPoeN+FFObtB7PVIN9WoNQwEnxWfTQwg=;
        b=DqxDxWVm2jDxmK4udNQYVIWf5RIMEf21R+orE7szvtO0MXuyxYTUGjhckc+tPkSj9K
         YOlAg31NZnuT9kcPSFyh2AEpIhLXXuqviBFBgrZ2K23132Q+SojVEMmARzdvDd/TRvr7
         Aavdrw9iwZHihHLsXe9hVnsiaqdl5cLP19WOyEjgt2CcY+H+B1NExryRWBRoVXgwE+Re
         LwVlxW9yj505iJ4NvEUmKmhYfkt+80m9Ixbp3KbghbduWpo0Z2XDN5VIlVmHBU4klubV
         AIlg3hl7JbZOzUNzdDnRaKkxgQrbL8c29EqOquqUjTnJKEjdtD8aicBYlXS2fz2yQX6y
         K0OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246677; x=1794851477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6lQZd1bM6K+vPoeN+FFObtB7PVIN9WoNQwEnxWfTQwg=;
        b=kW1jlG+bLT+s6L+sowoTKP7ZAg7Xwt+Pyj7CpXmhgdjwnsirwcejhG6++6OIhO+m/J
         lPkPMBqeMWzhjo0d35Yoa6Bk6PKsAFoENH8N96z3YBvByD02C5O2kQ91iwP/+WaGJouQ
         1TYn8dptmFIM+l1GRKlJ/865FpH3fo8pZjMkJ0F9a2lMhRZWKrwAsus71a5oGctM5Z+D
         a2fkEc2aml4YQgQsdxqAWfG9OscJiKiERjBA/3ieHxuIVLAoWIBLBjaqjcz6vDGnBI56
         +L1nvAq8yY099Q9fLFSHA/oj18TUsfKsoL25kuuW8JG7/oWXlZOueMrXo3wEciPKkh54
         KdDA==
X-Forwarded-Encrypted: i=1; AL+hErE36aMAJimkfAaUcbkfrwBQPwOTdjMxDmKLpB6GduxLlyMFRMUgYsj4VbkTBg9O0B/8CfklwVfjVMbekIw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9US4nLXozu1+MdRGdN/R9bohfMbx6yiTBmk/LnlCTqosEuVjIP
	CwkMcl/k1hRzSqBdWyHttoFltngn47l+5EnT7oNrVoySUr9yCQk87Cil
X-Gm-Gg: AYBFou0BKhRzWRKH2kY9+7LybeGfT5h8QUpRMqmaL3Hpxm43PhSPYn3galqb2f0Ta8k
	0hXQWZ/vPsqXEv+MKh1T0ky8MKyaDzhmQFipMSN1E5CTxyUy8H3FZUgaLsAs2ZPuIqO/JnqCSWl
	040W1x+nAgoWOBZ+xEBK2QsH7kZFnpfTCfQdlcXqX4x5wNiiMI4a9AXkh6KcoF87DwRyEZNoDT3
	lxk5uBhZn0jk1hsc2hk2yCq4oBIwzCRNsv60O5B1G9XReGoVoocRnN8tvZalUOgCJ8/FbbOLxtv
	Uc9wLDKFtEMvfq5Q/OWMFBCyTTy9tFK5r66MSLD6THomGksayElZ+lp0lwbAW0bDoqBpOnfFOCi
	w16+dIu/5lvC1CYyyK/eD+Ggz6LTS4lqffUBuHzBUElkKEzgCojcF1ADZ14CzkcdI4sjj2/7KdW
	l6UrCjnmzyMrfuUFV5hgqli4dyNrQL4cvvQedNC6QiBYEPObq7/B875cOz6Fuwf5gGFISE2ajTI
	8pSuxrwgVzW+GBUpBe7c+SZrDBfVH5r3UyQ8yYo+RPa3Pb9WU05SfI7RbTRxY0NtFroWuWNeWWP
	cAZGvA/QmFC5Mmj8YU4HJyZPUSDEd2vO9H1pW2inTlMfbfIyMfjyX5n9za6nr01U7h+qn+WVf7U
	+M+j/PysN0PbU1tdZYY91c2XwOKPQZzixqDDvSa0EgYm507d26VMYHXu7pVAItnhYxm6EpIe+Fk
	6fOj9MZva0bpI5bVhQ4AMxORShs9RR3GUmP9rjO9l+bZ31RWDCnN2k7QaxWAGVJ2TEhbBfkRizY
	ch0wI7FoV5YlL4GEiBGVL8RNiA9bNkVT1AC8EBH5Gq9xMqDiTM=
X-Received: by 2002:a05:600c:3e88:b0:4b0:bc65:b9b5 with SMTP id 5b1f17b1804b1-4b963c8809emr85435405e9.35.1794246677280;
        Mon, 09 Nov 2026 09:51:17 -0800 (PST)
Received: from jernej-laptop (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a4238sm200717f8f.54.2026.11.09.09.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:51:16 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 09/11] staging: media: cedrus: h616: use the 256-bit DDR mode
Date: Mon,  9 Nov 2026 18:50:14 +0100
Message-ID: <20261109175016.42061-10-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109175016.42061-1-jernej.skrabec@gmail.com>
References: <20261109175016.42061-1-jernej.skrabec@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the DDR mode in VE_MODE set to 128-bit, which the driver uses on
all SoCs, the H616 H.264 engine reads corrupted reference chroma, while
luma is fine. H.264 and VP8 P frames come out with bit-exact luma, but
with about 22 dB PSNR chroma. H.265 and MPEG-2 are unaffected.

The vendor library selects the DDR mode based on the VE IC version. It
uses the 256-bit mode without the 2 MiB reconstruction write mode on
the H616, and keeps the 128-bit mode with the 2 MiB reconstruction
write mode on older SoCs, like the H6. Doing the same on the H616 makes
all codecs bit-exact (tested with BA_MW_D, CABA2_Sony_E,
vp80-00-comprehensive-002, AMP_A_Samsung_7 and MEI.stream16).

Make the VE_MODE DDR settings a variant property and add an H616
variant, which uses the 256-bit mode. Replace the FIXME about the
DDR mode with a description of what the vendor library does.

Fixes: 1f24d4307515 ("staging: media: sunxi: cedrus: add H616 variant")
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c    | 14 +++++++++++++-
 drivers/staging/media/sunxi/cedrus/cedrus.h    |  2 ++
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c | 14 ++++++++++----
 3 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 6c6aa45f5f96..09b789640646 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -27,6 +27,7 @@
 #include "cedrus_video.h"
 #include "cedrus_dec.h"
 #include "cedrus_hw.h"
+#include "cedrus_regs.h"
 
 #define CEDRUS_VP8_MAX_WIDTH	4080U
 
@@ -679,6 +680,17 @@ static const struct cedrus_variant sun50i_h6_cedrus_variant = {
 	.mod_rate	= 600000000,
 };
 
+static const struct cedrus_variant sun50i_h616_cedrus_variant = {
+	.capabilities	= CEDRUS_CAPABILITY_UNTILED |
+			  CEDRUS_CAPABILITY_MPEG2_DEC |
+			  CEDRUS_CAPABILITY_H264_DEC |
+			  CEDRUS_CAPABILITY_H265_DEC |
+			  CEDRUS_CAPABILITY_H265_10_DEC |
+			  CEDRUS_CAPABILITY_VP8_DEC,
+	.mod_rate	= 600000000,
+	.ve_mode_ddr	= VE_MODE_DDR_MODE_BW_256,
+};
+
 static const struct of_device_id cedrus_dt_match[] = {
 	{
 		.compatible = "allwinner,sun4i-a10-video-engine",
@@ -726,7 +738,7 @@ static const struct of_device_id cedrus_dt_match[] = {
 	},
 	{
 		.compatible = "allwinner,sun50i-h616-video-engine",
-		.data = &sun50i_h6_cedrus_variant,
+		.data = &sun50i_h616_cedrus_variant,
 	},
 	{ /* sentinel */ }
 };
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index 572e70a94b3f..78efd3938c77 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -181,6 +181,7 @@ struct cedrus_dec_ops {
 struct cedrus_variant {
 	unsigned int	capabilities;
 	unsigned int	mod_rate;
+	u32		ve_mode_ddr;
 };
 
 struct cedrus_dev {
@@ -204,6 +205,7 @@ struct cedrus_dev {
 	struct reset_control	*rstc;
 
 	unsigned int		capabilities;
+	u32			ve_mode_ddr;
 
 	struct delayed_work	watchdog_work;
 };
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
index 444fb53878d1..b66d855daaf8 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
@@ -36,11 +36,16 @@ int cedrus_engine_enable(struct cedrus_ctx *ctx)
 	u32 reg = 0;
 
 	/*
-	 * FIXME: This is only valid on 32-bits DDR's, we should test
-	 * it on the A13/A33.
+	 * The DDR mode depends on the SoC. Like the vendor library, use the
+	 * 128-bit mode with the 2 MiB reconstruction write mode, unless the
+	 * variant says otherwise.
 	 */
-	reg |= VE_MODE_REC_WR_MODE_2MB;
-	reg |= VE_MODE_DDR_MODE_BW_128;
+	if (ctx->dev->ve_mode_ddr) {
+		reg |= ctx->dev->ve_mode_ddr;
+	} else {
+		reg |= VE_MODE_REC_WR_MODE_2MB;
+		reg |= VE_MODE_DDR_MODE_BW_128;
+	}
 
 	switch (ctx->src_fmt.pixelformat) {
 	case V4L2_PIX_FMT_MPEG2_SLICE:
@@ -254,6 +259,7 @@ int cedrus_hw_probe(struct cedrus_dev *dev)
 		return -EINVAL;
 
 	dev->capabilities = variant->capabilities;
+	dev->ve_mode_ddr = variant->ve_mode_ddr;
 
 	irq_dec = platform_get_irq(dev->pdev, 0);
 	if (irq_dec <= 0)
-- 
2.43.0

