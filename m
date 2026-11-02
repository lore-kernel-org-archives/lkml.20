Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793589553;
	b=gdvBAU8ryD/2dx1zE4gMmgc93Qrzp4pKNVY7i+4RcYR3eB4uj1mXEZHsZ1ScOyU4wVPx
	 uZVYUFbxFK5PS6XJ7oxl5caNAd6D2CB3UT1cKMiR14juAVZs7tZNuu2wz+AvESWEStQXu
	 RFFYoNJGlrdr9GCi2P9qEOfsKq+k4uOEMp6X6Zw1CSJKuzXpzepmgzKUsBMRWrS4zYwOu
	 2haP6hI7KTtEnJSCb4oc1PHklN43sUil8sGS/T9unJV4LeU+AQifO5sMW8vRpZhEHTOon
	 ilQSvDrFaSfou36Gc9QfnNqQA4V0h3bw2ImKBSoqOzSdz+G8QBgF+VCEx90Bt0zWf9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793589553;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Pq7i3VhC2u37X3a2faYflIcKZg9HRolwFH3fa/oNdq8=;
	b=KNlND/jmFASmX4WGd/154oYY8rn+SpGS+qTzK3hgRJnfgTJDig83uCRubncwqQ+c0hDu
	 Pv/r01Nmqft6uf1jDfMlR2WNYLIxT3ysNQP49zRf2rDcLtebp0yJof+P9cF16fRc/UH+H
	 FW7FU3/iwsLVEpY3utrJFfTn0BJomRDDaH9BEdMdrvuGc0XVpWD4l5fL3/Oofhk/Ffaj+
	 0zuCiwlhcCJ3N8Z4Qtok1pjkYBkvNhHS296BM4e36a9CAIj1a6DWWWH53UTsTXCiXtUUG
	 yfPFx7/1LavXEzCDKdYhy4vDorcmXCopuSRLUrgcXr2ZM/J6tGHUIjJBQ2bRe+o/5DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0c4lNAqb;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD286606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 03:19:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD286606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0c4lNAqb
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e8f2c3ad6bso14992485ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 19:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793589552; x=1794194352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pq7i3VhC2u37X3a2faYflIcKZg9HRolwFH3fa/oNdq8=;
        b=0c4lNAqbAvc8AsVXd5NU8F1DHR4DwN4NTrsozwI15qfIQWOterjv+nT1KBRXjrRt1c
         dZyeR+imfEBPM1DpcuT3hEt/NPiscPltdOtGM10Es0jdEN+aVSYheQ0s0Irjd+jh3JVD
         rOAaK/CBiek7Y1Bntw9Ab2sazue6F9QgBPEmPPNNTE+dzZTh44SFWPXYGtGY5hXDdAS/
         c3F3kEGSNBML4pnSKP/wMMV42Z5ZyJcmBamJYOHz3wD2DyO/FZ5G9OM4AyshV6+5L70p
         XLhRERyHe3ZdCoxrKkwybkxfkeXD61g2DffpSWZwt5GA2DF3UAH24C3Ya9mSrq3XnjaL
         TSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793589552; x=1794194352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pq7i3VhC2u37X3a2faYflIcKZg9HRolwFH3fa/oNdq8=;
        b=u6dShlUPVRv9DhKaJoP9ik9G76HIwwLv0q8FQHdGEU8oTEpX2Gge/SxXWTFXdB5YER
         YZJyiFQ3n/Aml83vQ3hpwxFysEINXRgPBaH1r3UhGxtM3luxi98f3k3J/lZRgDLZOtpr
         NaV6+pvsORD79eYhz25enj2lJKfXQx1WhPe+wWF5pG0y81wqHyJ7N65Wdm8u7xFIenZS
         kwMXrw2AcSO6wZYrf/N3B+RTfRmy3SVPC6Hi63vqaB7ANOpuzEwhDNv+3HBMqabNDsd3
         i5vmkU4eZXIhsY2CVG6CDYkG2ra6s4s35qC/dH3pJxiadWzJtPauBHYNc5OLBm3E4nFO
         H9vg==
X-Forwarded-Encrypted: i=1; AKwUvBwYSBp5RplWiW+wJedSk1RHE46c004Yr0OXTACPiQKNpUD2/QoZYNK0h0z8kFhbL9uaI1uGNO6bJzXooww=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YWzjRqd+bY3A3ajkkzzhSKfFZIWuQ2EcdGTraDWMCeWde6TSa
	iesNuLgP1zX8bqyDz/sliiQYJk21lmHEmApRzeRIfCP3FrJoAHAv5ITm
X-Gm-Gg: AYBFou1xPLotENf1E186vu3/SO5HnLNEOnoSmZ+Q8eWFx7RN1IAGuASR3tvzfdegVia
	WMZGEjvy9ORfWLm2bS8onWUe14j/2qxiANdlXs+hYJPbaH/GIruYCSCZNYZ95mfB4wKkqxyGj87
	XySGuJOXYFqwrvi9DLoflU0+Re3EcoY9s7XGyX+BkdX2gwhxHLIPQdhbN+j0Ft1RvOf6/0gb2/Z
	cv89FX3pA0AxQc6RTJHg2/ucFrIYYWppekaFgmUzT6p95pV4XbzuH3o9uQTR1rrPvHq1zT5HA1X
	D932id0OcQVKeJvJoSGHtNiLphoD/4OpcsIUKewzSTioGrcT/rYpaMzGesH/Df8V3zg+pNkfhyD
	9B3ZdSdMFvhYH79M2YpOOm/Yf2QKIDDym/EADZ8Wtl9WwkGObuLHPY3eWRpKlJBTnzPVnQ//mR5
	2mRsjiOVXlLeOuUwpH4Kf5AgWvf8UrMbeAY5MN+omphiWH8VpB+QmTj/OgkCudq5aRQguyRCVcf
	dYTJTIQQc7heDV2LxsuseZr01kfK6YQLdlB76ckJerSufildbArA402WtZWeSawfsAf81nnJj67
	f90kX+abTeWrmvnCB8N6uqjW0ehCQda7nDjo+IV4m2MTP1NJOvXtLc6rBB1yBPrx+8euhhd8U3Z
	mEJ4vmEXTgfDjdndke90zO+uq5GGp7j0SjE8SNaM6doZrEorlrzxm+P8xoQPI5zuxvsLq7fCnMc
	f377G6L9oBMLn2ZOvcDRp30F0=
X-Received: by 2002:a17:90a:dfc5:b0:3ac:ad90:7090 with SMTP id 98e67ed59e1d1-3ae897dd47amr7489423a91.67.1793589552079;
        Sun, 01 Nov 2026 19:19:12 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae85cb1bfdsm7752417a91.0.2026.11.01.19.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 19:19:11 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] platform/x86: dell-lis3lv02d: Add Precision M4800
Date: Sun,  1 Nov 2026 19:19:10 -0800
Message-ID: <20261102031910.82286-1-rosenp@gmail.com>
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

The Dell Precision M4800 has an accelerometer on the i801 SMBus which
is not described by ACPI, so the driver currently skips it:

  dell_lis3lv02d: accelerometer is present on SMBus but its address is unknown, skipping registration

Reading the WHO_AM_I register at address 0x29 returns 0x33 (LIS3DC),
the same address as the sibling Precision M6800. With this entry the
sensor is detected and reports sane values:

  lis3lv02d: 8 bits 3DC sensor found

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dell-lis3lv02d.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/dell/dell-lis3lv02d.c b/drivers/platform/x86/dell/dell-lis3lv02d.c
index fe52bcd896f7..ee61b08324ad 100644
--- a/drivers/platform/x86/dell/dell-lis3lv02d.c
+++ b/drivers/platform/x86/dell/dell-lis3lv02d.c
@@ -52,6 +52,7 @@ static const struct dmi_system_id lis3lv02d_devices[] __initconst = {
 	DELL_LIS3LV02D_DMI_ENTRY("Latitude E6530",     0x29),
 	DELL_LIS3LV02D_DMI_ENTRY("Precision 3540",     0x29),
 	DELL_LIS3LV02D_DMI_ENTRY("Precision 3551",     0x29),
+	DELL_LIS3LV02D_DMI_ENTRY("Precision M4800",    0x29),
 	DELL_LIS3LV02D_DMI_ENTRY("Precision M6800",    0x29),
 	DELL_LIS3LV02D_DMI_ENTRY("Vostro V131",        0x1d),
 	DELL_LIS3LV02D_DMI_ENTRY("Vostro 5568",        0x29),
-- 
2.56.0

