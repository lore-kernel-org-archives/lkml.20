Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792819078;
	b=QZvz6zp+w0kNxerRv+aB/Is3a55UbsPocfWLhbu4phczinK5zts430IrDVO4WCWeYNCI
	 W0Hy5PU2qAdS4e4IsrfOHMCdScOilUYOstrwQgSJTuHXLOD6EBg0oHYXFjI/U+V9ppfLP
	 s2WpdP/6MF+UBw/n/pbgdoA195Yz9FNEmIo0O0+loIfgtcN5FdVotUtpyMTzH9EW3nM2/
	 DAv2idKnwI6ktlBG//6f4347WeWMxm7HblCQdmTYZb/RY5wgSPjxnrEXZETG46xNFmh2f
	 +MAIAq5KLx6oowGE23KUTOhN90922wHFhDypM9LKh+8yaDvmcNCPuGImZHx62/HUIaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792819078;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=R5RTMRDgBHbdaHQQjXNxkkrON+mCCRdxQpHSQ4eueTI=;
	b=LKMkJRcpKid1R4MElXywxXgTIwV7P0dr8iyKSs6pdMKNwxmQ5sq9fH34vGtLVIX46ed7
	 NVGVjFKm+at7WEEO8AjkGIMsDWWDT8sUfdx/1rdXl1A4ihImhD8s3BjmuzM+EHrW7030J
	 IZUc6oe/md0oFVRWxNrO3waUSijKoq/spOw+hxrRlJ4XlKNK21IOvEFYSrJqaYLfERbSy
	 Skmqe+IhxslW/1TTbxnXaNhIdl6maKoViSV6iTnr8RnISaG7HvQG2HC5Rwb2YbAX+9cyL
	 Or4x/x3BVRUdhkd4+B4uL1lCFtik6M5GaenCgleVBjFOXe8pYzNRisoyNHkgz/CUzRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=0bMKtieo;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DE7606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 05:17:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15DE7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=0bMKtieo
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso973718f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 22:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792819076; x=1793423876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R5RTMRDgBHbdaHQQjXNxkkrON+mCCRdxQpHSQ4eueTI=;
        b=0bMKtieouAfS3uwa1jldQkSuAxsN7La3/muoj/f5t0+64kropOJau13OsOZqHvK6Pj
         6M/bqTbCXN0qUN3Wx1uw9oCaOMsMh7C5oJxw7Xe1Wd+TAU84C9PgVWGl7Mz/DgmKCG5Y
         4hRwMYeMR7sfdH7JRdepEV/nc+ADDz2+yGGoz02scyM1WX70rxhBIQ6QVIsuG/99d084
         QcRAiMIM3NIwK4iiKAcU8egx4XBX2JV3okws92FyakXmxO5U/+xvataBTzoUk2F/6Pmi
         CLpP5OwE+kpZgDJL6mi5EN7HXqvUyIWhPeEqIxuEyPAu0DVIwSqwGwxb/zVXdkrGViga
         /nzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792819076; x=1793423876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R5RTMRDgBHbdaHQQjXNxkkrON+mCCRdxQpHSQ4eueTI=;
        b=Oew5j0ZFIL8IqD1JCDt+CVQ3h7qglcjfEU7qFWrqSPQ9emDGC0C2788tEq0tZ+QJ2q
         QzKiWaoayjQ6z7D26+b07XqCbMlAItZ4PtOp4UAPANdeXbAOwwlZCd3r1mRtzPmASICf
         FNp5FouuVcPomOst2lRMB4QqiLYKEs3rVB1y8cfRGvqLO9Stg0ksmchN/bjZQpW0csBN
         EOjqmj2Ni6T17DFMcftQgWpQ+ADI2OTXmUWY8LxmRFiHzmRe4WLrY8m232jZmbZk0Ipq
         1RCyxVimwQHI9XoU62ZC3iA2eqC1cfqz06NqUOEg2tBkmOGYAZcBnuiIh7F095ZnKYU+
         6gDw==
X-Forwarded-Encrypted: i=1; AKwUvBzFtOovy33JAPXrY2CgXRop6LiGiveyOjLCc/XXFAQHYINY5l1sAO2QmSnuEsHFWNE5+jyyWZXtQBvI6UQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKjxVmQeFMct3yHihf1j8VnzoMGVaJWGbH2TDfD2wu9etiSrRvD
	ReZ3nAnqbnD5cdc6P4GOGiELByMmJwYVP2zSmUk1Pv4grY7fQK0rUVmSkE4Ff6bPaC0=
X-Gm-Gg: AYBFou24PgmMrXOlN+Oiuqm54mYIbPNKNn0mAT7FxKzedCeJ5VkicbRMpezEvGoJ+CB
	AdEX7kokEcsH4ZrSqWN/8e9XdT7kNWYYmaxoBSJD4GfPTfx1FB3EwgbgaPAt4xSd3RD5yTCjBQy
	UNmNRMjamEEf4Sdk0a2Smboj9wepARijFYPtYB0AAEo1WCYYRXTOZXY2KsrNpvwyKpKCo+p3rf3
	FDON2c5RON4+G6vo3IqCv00iZnOjy/6jYPMDxDYvMWmbX5de5Sy7ZtD8s4+E4N+n4iJRlMAFxwp
	1yfmpDeeKX/m9X1BUW8vPLGx9qzA56zMjP8Kce82NMDCuirD2/G8RDwbbIwYdd8YA+mr6ExwNa4
	j2ORWIb0E8Hmx1yFavLXfHGio22kLw1Emt2E9QwG4sJVwiXdWHCuO/DA+W2AQT84pqdk3kxVJHj
	vdhr0q6t//2XBNrG8c+Cu6g2m9pP9PMNaB26k10TkNA8wrQcBZatL9cCSPRq6TGxLXEJCr1en1T
	zOVoAHQWvfeo0G/HgKbHDsalC+5vc0OEe/BTdlFNpT5IOWtWT9GdeMWGjNpqO+syqZp0T+dU/Jh
	OLKdYRTwDEM=
X-Received: by 2002:adf:f7c9:0:b0:48d:bafc:a409 with SMTP id ffacd0b85a97d-48e3eb8fb51mr1030940f8f.26.1792819075998;
        Fri, 23 Oct 2026 22:17:55 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9c3:9990:89bb:701c:1852:56c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3418sm1914646f8f.41.2026.10.23.22.17.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 22:17:55 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Linus Walleij <linusw@kernel.org>
Cc: Paul Cercueil <paul@crapouillou.net>,
	linux-gpio@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH] pinctrl: ingenic: Add the X1600's 32 kHz clock output
Date: Sat, 24 Oct 2026 07:16:39 +0200
Message-ID: <20261024051639.67806-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
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

PC26's function 0 puts out the RTC's 32 kHz clock. The vendor device
tree calls that pin setting "rtc32k-enable" (function 5 is its
"rtc32k-disable"). Add an "rtc32k" group and function for it.

Used on a HiBy R1, whose Bluetooth chip takes it as its sleep clock: on
a cold boot without it the chip does not answer its reset, with it the
chip comes up. The clock on the pin was not measured.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 drivers/pinctrl/pinctrl-ingenic.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 1aa6a6dc1209..ac6e2a152bdd 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -2452,6 +2452,7 @@ static int x1600_pwm_pwm6_b20_pins[] = { 0x34, };
 static int x1600_pwm_pwm7_b10_pins[] = { 0x2a, };
 static int x1600_pwm_pwm7_b21_pins[] = { 0x35, };
 
+static int x1600_rtc32k_pins[] = { 0x5a, };
 static int x1600_mac_pins[] = {
 	0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39, 0x3a, 0x3b, 0x3c,
 };
@@ -2511,6 +2512,7 @@ static const struct group_desc x1600_groups[] = {
 	INGENIC_PIN_GROUP("pwm7-b10", x1600_pwm_pwm7_b10, 1),
 	INGENIC_PIN_GROUP("pwm7-b21", x1600_pwm_pwm7_b21, 2),
 	INGENIC_PIN_GROUP("mac", x1600_mac, 1),
+	INGENIC_PIN_GROUP("rtc32k", x1600_rtc32k, 0),
 };
 
 static const char * const x1600_uart0_groups[] = { "uart0-data", "uart0-hwflow", };
@@ -2557,6 +2559,7 @@ static const char * const x1600_pwm6_groups[] = { "pwm6-b9", "pwm6-b20", };
 static const char * const x1600_pwm7_groups[] = { "pwm7-b10", "pwm7-b21", };
 
 static const char * const x1600_mac_groups[] = { "mac", };
+static const char * const x1600_rtc32k_groups[] = { "rtc32k", };
 
 static const struct pinfunction x1600_functions[] = {
 	INGENIC_PIN_FUNCTION("uart0", x1600_uart0),
@@ -2581,6 +2584,7 @@ static const struct pinfunction x1600_functions[] = {
 	INGENIC_PIN_FUNCTION("pwm6", x1600_pwm6),
 	INGENIC_PIN_FUNCTION("pwm7", x1600_pwm7),
 	INGENIC_PIN_FUNCTION("mac", x1600_mac),
+	INGENIC_PIN_FUNCTION("rtc32k", x1600_rtc32k),
 };
 
 static const struct ingenic_chip_info x1600_chip_info = {

base-commit: f33a24cc012d34f25bb9942681bd478a1757b806
-- 
2.39.5

