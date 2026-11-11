Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415145;
	b=ZQ45F1IYaaIaUTTjPLB+zDletfzKySLAs9GKcoIGg1xDUpOxZmlaoNcFUrBiZvJOBM9R
	 jcwh6aXBaUdLY0sYjnZVVJ6nA+J65yWeI9FLQYGqwao4imMwpbcv99ZdzRQZnjzGf65Vh
	 W4UaKrU/bEl5PJoS7pG8CiCE8AlluwDtTTgcEISuVKyGGmmRKZp5+3XzNvDT8gCM264IK
	 VdJu373Ai5W8TaHK9z49JKMme4VS+amTfftkOQmro3Wuj+yMoBQiyZOygKcTPWdfZp5RI
	 tq/By1WWt5F7rqIuJ/m0VnFPDuUOWHPq4Bl2kypMwINrYWcuzrnEvop1t4GzJ3J4R+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415145;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+GAFVM+nLFUYlbY24SmfVdNvtcwr0CEHKsDIq3Mqz6E=;
	b=LMtKwW5g4pZtw05OicuMMGziZCYHrUU5P0kCscW6hmo4RoEggE++LA6GsGp9HdugiWWm
	 mEt2D3dH7tYU0eXLj5tE9CsQr54JZJ0uClL1iC+uGLLnOE9EFr3Ka4dewosj7UnYzcGUs
	 relOF/GDywXwZ3PSiFCIkGrobegRuvYtmTyuBr4+/wCK70Jkpmi8odp3iKcmXMCZfCNLO
	 5EC032VntKPYQFHbr98UQDhk13tkIOJ/Ymd+WrH5QahAKjhFxOzcH9VNO4GtWDguWOYjJ
	 Y5Ip5e3+iV5gsrT2D9luoUWhJHNxgjWKIXKwWfh/z0pOc1yFuNmIHG2/UMVvxmIYoJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0PZz5x5e;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF99D606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:39:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF99D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0PZz5x5e
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-15dd124bbe7so4965705c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794415144; x=1795019944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+GAFVM+nLFUYlbY24SmfVdNvtcwr0CEHKsDIq3Mqz6E=;
        b=0PZz5x5eHBw3K6mpcni11E/lTzj1+7m5+R/krepWhFnAMPn5mR3q6fhN6hiu1a3Vf8
         Yojr9XbefGUzWKhq4QF16opBq077iq/a/eg/FAVEC352b46kPXxc0hf9Dh/3ex7NVhPf
         lvf2ku778b5L7LWaOXq2EkR9/w/9NpB9aMkudukVJJkz6iR1pBTWcz5yCRV2Z4yrCE+p
         pIrkOyky+ZCd4vbpzqMR60C2igOFsBmynVJiCs0EyWwOmQjdNY5Zg545fl9KhLwuPfYL
         kM/MhiuWLt7N7zjcOBXl+AY7ff/zWtrY/IJlgpBnMSXlvuQkGlK3iqVwdYSutd5Ja5UR
         lGRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794415144; x=1795019944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+GAFVM+nLFUYlbY24SmfVdNvtcwr0CEHKsDIq3Mqz6E=;
        b=wRSdyBXOiI/ifRr1C/cflioCEekqJbWNdKg5rr3VpnKkW/v/3WLQVowRH6u+9TAoRk
         y5EzlaoDzuzyNWrW+4aZh13r/90YCFOzFXHLwpnrdK+YdcIijZ37L/1zcrG3BJnbyP5Q
         ohZNbtrKIy17zUTTNTJDNN1mExFHm/I1GOgjPEXQsdNsTlCpt9jKvslqD+qJkTOwib1J
         D5SnM07uZ07uki4YZZH5ZENDODh2mjZCKuOvNr8W+MmOQp/TADR2JfMcR6Sr/JL2nV9N
         N3lQUyHSfzGomN/nWrx+AnlJt16DNkbmwrTAAy0l//EfqsH749MjHI8O1C5om6pocODB
         uBiA==
X-Forwarded-Encrypted: i=1; AL+hErEIGZFPnDvcCca62zjQ04w2CwBEEzj26IcNIEzF2ncAqDQyIVA1lkuYjLGw7ZgoElW8U6xzTNN1JjmUtgk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zMrBYHKLnuSnD/lUgyazM1Bh1aNCU7Z5pfLtRKoS3FPX6KRP9
	RGWsuux3CoH4OyMHeMiOAZw3XeyDcJKeZYzTWZlSJSkF0yyqNZj/wu6L
X-Gm-Gg: AYBFou2rRAY70mpgdHpn7OvyDzk1rBzjbS9IalLXykHiiL3FYJds9Ptk59AFBOz36wG
	qNkAfgPybw1JLRO5WYyTp/KFDK5HR7/lDldnBePkmKLuuHbV2CEtHSf5tVGdYBJ2Z8+oV9pcPeJ
	uk9SQosMVORtfBFxtP+fDlvO5OLSt44Lp7K9HxG7zkMIBV64VhZSaTZ4FpP2m3cpECCvpxdza/x
	4IZr1xTmu4p6+SBcuJpTfJna6WJaCl94xw67CTAgsGEsWN1GbMCtePPqMClJZMxZT3iVKV4eXS9
	rbyd/q4mW2ithUKANMFm/7d8LdkZcsJgR0YTMvt/z51VhW8xX5DTq8hSAhjsHtAJc8SuZ4hikzn
	Bok5h8ugVrTnbGHIsK33hEkL8gat12Ytyfd1cKvG6towMZcuA/LKKdrN+wdYGTra1hPYMplWwpi
	cQCe15t2p8hKuchOR4AY68xgPwcLWrM0ga3Vhco+YMW+E3MWq3TOB5Pi4TUxdguFXpCw1h6Ow5J
	0utuLDlfHi5MiH9UEhehFU7EVSmRJ0+r1wyXMXUw1Tfq3Gc5gYZ99knNw6jf4w6RW86O3nHAIZc
	oIoSPj+qi1uNQWelsRgGHSZicw+OvG3BAQtGkUQkoZ+9d9g=
X-Received: by 2002:a05:693c:8201:b0:376:98e7:eeb0 with SMTP id 5a478bee46e88-37698e7ef92mr3137525eec.7.1794415143641;
        Wed, 11 Nov 2026 08:39:03 -0800 (PST)
Received: from himanshubakshi ([2401:4900:1c2d:8feb:6d7e:ed5:ad5f:62ed])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520bf3e18sm35046496eec.16.2026.11.11.08.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:39:03 -0800 (PST)
From: himanshu bakshi <himanshu.bakshi478@gmail.com>
To: gregkh@linuxfoundation.org
Cc: andy@kernel.org,
	error27@gmail.com,
	cenzhang@linux.microsoft.com,
	dennylin0707@gmail.com,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Himanshu Bakshi <himanshu.bakshi478@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v4] staging: fbtft: remove unused fbtft_init_dbg()
Date: Wed, 11 Nov 2026 22:08:19 +0530
Message-ID: <20261111163819.143147-1-himanshu.bakshi478@gmail.com>
X-Mailer: git-send-email 2.56.0
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

From: Himanshu Bakshi <himanshu.bakshi478@gmail.com>

The fbtft_init_dbg() macro is not being used, so delete it.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
---
Changes in v4:
- Add Reviewed-by from Andy Shevchenko.

Changes in v3:
- Fix tag formatting as requested by Andy Shevchenko.
- Add revision history and testing details following review feedback.

Testing:
- Built the fbtft driver successfully.
- Verified that fbtft_init_dbg() has no call sites in the kernel tree.
---
 drivers/staging/fbtft/fbtft.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft.h b/drivers/staging/fbtft/fbtft.h
index 40a7567df1eb..16459e4e0ba0 100644
--- a/drivers/staging/fbtft/fbtft.h
+++ b/drivers/staging/fbtft/fbtft.h
@@ -420,13 +420,6 @@ module_spi_driver(fbtft_driver_spi_driver);
 #define DEBUG_REQUEST_GPIOS_MATCH   BIT(30)
 #define DEBUG_VERIFY_GPIOS          BIT(31)
 
-#define fbtft_init_dbg(dev, format, arg...)                  \
-do {                                                         \
-	if (unlikely((dev)->platform_data &&                 \
-	    (((struct fbtft_platform_data *)(dev)->platform_data)->display.debug & DEBUG_DRIVER_INIT_FUNCTIONS))) \
-		dev_info(dev, format, ##arg);                \
-} while (0)
-
 #define fbtft_par_dbg(level, par, format, arg...)            \
 do {                                                         \
 	if (unlikely((par)->debug & (level)))                    \
-- 
2.56.0

