Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792588899;
	b=BibptTvqBej7ktDpgoO94/IxSCjA/RlOhM0BDuCNtN6iub6Z9G8/ElCO0D85Nngs1qK8
	 Zwsbyvk2e1VLOhcrfW+Y5l6l6nNhBIRP4u96zkwXB7ZUAKre15SQp7uUP7DBfuyBRSfGZ
	 VLpiwe7AtLqUxIibNUueuBkLkM8wd2Wuo8SFSkT8ayse7NoKhksmH74i/ytKQ2hBIKAnH
	 0MtEAmCC9KQ96A9kxi0yJu5xtx4jxsTP6KlQD1bjwXry0SSvy80wkijnf7xhYifJL06wk
	 /pjgmAZvhmKirTG7+dMPOMNv509PUE+nZD/Oap5HiitcGsvAZeOLqdrosgMpclEexZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792588899;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=x0hyuR29EsatIH4jXUcnLqsaQxGY69D2I/F2suEOs6k=;
	b=CBfUVsAq5X4Ugs1ISttlxpNCPOYPyumQ0jupKa0L6E4dX5ivJ7HcoIUfdP6QcNrr8XGl
	 L84R0bFKNVnpjiq/rz89+KZRIZhmXxncjgNfF4V7LCe3uk7VfXW/PEiJpTjDUckdG+h0+
	 k2c7qbEDDpO1KGa3OrSvmo74IORR2FQWqfQmKhIoczHYXEH34MwViGOdHuqqAhU9xhg+Y
	 aclOSVVgmjNJRbRTKVeaMBsHpB4l8WZpZDwj75Iw6C7/5M+0JLw06ViIo2bsfjp1SRGRI
	 9EiI/4NTXfh4b0UPjlk1Dggjyj8VV60HCveVNVQBnwIaSAXK+R0r9ZDv15O/RmUJ+ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=e180YJHV;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07647606A320
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:21:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07647606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=e180YJHV
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-89f28c3ac7bso246234b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792588898; x=1793193698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x0hyuR29EsatIH4jXUcnLqsaQxGY69D2I/F2suEOs6k=;
        b=e180YJHVepsCv54W0AVhdWLwXLwDFE8Grr8nxycwr2FfbIMOUj+vHQOPVywswu8VVL
         PpeImxZx0CDGX1S7mFJtE0oIIBByMjyZvKm9lwr3A7Q4zC67Xws+f3Ex695bcAxBTmoQ
         DTfENxSQQCVFi8H13Juvn+Q12Lk2tGey+ZM4PEEDKhI8N28OzD+00yI56hVGmomNTeF0
         ehgCjFIFykmQc3gm0j9tCiPc9LXdAif35doTHXDIsFUWS/doK4psd3dpPpkMvuJUUWOi
         +qrCFh2GyCYHBx1Kj9DE7AyQNqZt/yKxOgM3UnPC7b41ffEirYA2CyA4B+l6UFF+Df3q
         lSSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792588898; x=1793193698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x0hyuR29EsatIH4jXUcnLqsaQxGY69D2I/F2suEOs6k=;
        b=fsaeSUrP5+P10iVxn7DscRDOcdOjFxygy8aiethkOUNqg7NRT8SrAS8PZBi7R+yXn3
         EKKeCQrBceTKGrXIqTomBF2bdevKyGUHqDAuoLMz7/igR+USe2K5VKUC816mrf8vtf82
         wrj/C5hpBIGt3sskTtlQXpuFuynTPrFXQd7FPAWCAm+e3JNIA/u6A3iHetxUkzWUBdAT
         Y6ZO66Q9v15NukMYJQHz14Ng9PDHMa8bjXnv4pItDRTR9v75bJjsq1MMZQM3y8xK+9bs
         hUlFitaeiK4DfcYExMfT6DsOxUbUgo6UNzk7b5qzPV6L/HWuSF6z4rszQMUGyaYommzA
         Jqjw==
X-Forwarded-Encrypted: i=1; AKwUvBzPVGWBdvhQliqoF5v4fKGsjwWeAW9Tcn8TZIoeAEplknziBtfZ6EWqE5qL0tnmDvktmMnqxwsaO6/AkXM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMpPq72IbhFFmLP3BmfHYZLPyqmF2HZjtwJUcADMuTAplYGLka
	CHfb8FIhwoZ/ZJ5zI9Fsx1ozICnafKKNkVKdXjcmJozqM0YmFYFN/eif
X-Gm-Gg: AYBFou2EEHM86RIjvCv1bGqmclz5bm8MYQ0Zw5QOT/5MlRQhy72UM0m0jtqCo9L4whZ
	GMg7Jq5rNatw9yJHMmgay2cvpI4dYpfyrYyJ4V1f4Eshdf4Yx4G6H83nfbUZDZnH/1wvB6rxlJo
	HnbVePqmuKQRbTrVa9/qXlRr6IQ05e+zYxATeMePhi4IYyrcHIDoUwmNYZfRekgCKKK1gjc1fiL
	G5jojVCZOAYdg2E0qbmo3KywSe/lD4HZDjkwsaJ1j9t44OKnW9njsJJ/sqofabxY09UO1Qic33k
	Yv6TSoDmb5ag5UslC0FXG11DDsW1Fwr17mp6C+oXgK5booo2r5vH1xt3g+opal0tplA7CUGKwfG
	0lFFN0HuJmNX4NuGeteLnw3LThFtZZdE+hUGlbZqj0Ctp0mBm/Qbp6Jx57vSBicPDtniuk/zyJf
	KTYdx2xKwo591RfM/pfN7lWDZktzVpUHHAVTDcuuDiI3w1mzm5NUDyqCPyQh0HoMGghIOT49nRs
	IMEeMAmFLtVUEsh0BGjTthTZZy8L+TvIW1dCnYBM9dfuzXIimv3qEZUHVNWAV5ScO6356mU+DIq
	QtolSEvnb478XHpT8vaydOAyDknhPmohx7dS+UCtrUK/c6mssuNBuR2B6tKoEnvCxDy/KepPBvZ
	zVNpOWiiJFxzvKEEcajNCiccy1mIpHcWqv20=
X-Received: by 2002:a05:6a00:4504:b0:89c:6b2e:8413 with SMTP id d2e1a72fcca58-8a089d35b1bmr1709553b3a.40.1792588898285;
        Wed, 21 Oct 2026 06:21:38 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895ff8dbsm881861b3a.52.2026.10.21.06.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:21:37 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Guodong Xu <docular.xu@gmail.com>,
	Yixun Lan <dlan@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Alex Elder <elder@riscstar.com>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] reset: spacemit: Fix the RCPU2 PWM reset registers
Date: Wed, 21 Oct 2026 21:21:30 +0800
Message-ID: <20261021132130.3026998-1-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Every entry in k1_rcpu2_resets[] uses RCPU2_PWM9_CLK_RST, so asserting
or deasserting the reset of any RCPU2 PWM from 0 to 8 acts on PWM9
instead. Each PWM has its own register, RCPU2_PWMn_CLK_RST at offset
4 * n, as k1-syscon.h already defines.

On a Milk-V Jupiter running the vendor kernel, which uses RCPU2 PWM2
for the fan, the RCPU2 registers read:

  0x00: 0x4  0x04: 0x4  0x08: 0x1  0x0c: 0x4  ...  0x24: 0x4

Only PWM2's register has its reset deasserted, which matches one
register per PWM.

Use the matching register for each reset. No in-tree device tree uses
the RCPU2 PWMs yet, so this has no effect on current boards, but it
would break the first one that does.

Build-tested only (riscv defconfig, W=1); the fix could not be tested
at runtime, as mainline has no RCPU2 PWM node to exercise it.

Fixes: c479d7cf06c3 ("reset: spacemit: add support for SpacemiT CCU resets")
Signed-off-by: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
Reviewed-by: Yixun Lan <dlan@kernel.org>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---
Changes in v2:
- Drop the Assisted-by tag (Philipp)
- Collect Reviewed-by tags from Yixun, Troy and Philipp

I used Claude to help find the bug and read the vendor driver. I
checked the register dump on the board and the patch myself.

v1: https://lore.kernel.org/all/20261017140805.3278709-1-alan.tseng.cs@gmail.com/

 drivers/reset/spacemit/reset-spacemit-k1.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/reset/spacemit/reset-spacemit-k1.c b/drivers/reset/spacemit/reset-spacemit-k1.c
index 8f3b5329ea..dbd783c138 100644
--- a/drivers/reset/spacemit/reset-spacemit-k1.c
+++ b/drivers/reset/spacemit/reset-spacemit-k1.c
@@ -154,15 +154,15 @@ static const struct ccu_reset_controller_data k1_rcpu_reset_data = {
 };
 
 static const struct ccu_reset_data k1_rcpu2_resets[] = {
-	[RESET_RCPU2_PWM0]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
-	[RESET_RCPU2_PWM1]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
-	[RESET_RCPU2_PWM2]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
-	[RESET_RCPU2_PWM3]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
-	[RESET_RCPU2_PWM4]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
-	[RESET_RCPU2_PWM5]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
-	[RESET_RCPU2_PWM6]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
-	[RESET_RCPU2_PWM7]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
-	[RESET_RCPU2_PWM8]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM0]	= RESET_DATA(RCPU2_PWM0_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM1]	= RESET_DATA(RCPU2_PWM1_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM2]	= RESET_DATA(RCPU2_PWM2_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM3]	= RESET_DATA(RCPU2_PWM3_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM4]	= RESET_DATA(RCPU2_PWM4_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM5]	= RESET_DATA(RCPU2_PWM5_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM6]	= RESET_DATA(RCPU2_PWM6_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM7]	= RESET_DATA(RCPU2_PWM7_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM8]	= RESET_DATA(RCPU2_PWM8_CLK_RST, BIT(2), BIT(0)),
 	[RESET_RCPU2_PWM9]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
 };
 
-- 
2.43.0

