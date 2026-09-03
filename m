Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1274B442B1F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 08:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788423622; cv=none; b=AMUoDOS9ZFH5pNzprclETu1YnD5cxtPvqMeCU8jF2Qrv/qjpbhVF+cXV0rrdIkUEvuA6a+SS8+6l+hyX80kCH2awvLrvWbuYxyUqvNZSCOGxoGb1VSjj2LoUVCkD8VRLhjZtEfPr7EGbaxDJJrx4E2gkBPW3fLb5qZwyq+z3oDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788423622; c=relaxed/simple;
	bh=tvdtMyEtOu1RNXfZKxxmwK+g7oU0uFtfK6RL75o67vs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tcQwPEB9a3y1B+srztN1D/T3fzcrpjujP4BdCJ0YkpNS3XEIxfCLEV0rCVoxthuWereGypSVXNeufebYBjGrk7QyPrHQv3wTs870h3EMnCOtfX2/elKBIZWKD+1D4xpQ0U1yDQXZihH5Rtkv3oU42c1oB7PD/TyextfctpKCj+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LbK1YzNZ; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LbK1YzNZ"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d91ded8174so18460655ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 01:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788423617; x=1789028417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1U812yxaafxSGhCI1gFsBnn4eRLRGSwsqnn6M2QiaRI=;
        b=LbK1YzNZKlqP/RB6kWCZNjTyZ2D9J7okRF3DrZCMC0bmkAU2JkgWfO2ZL0R3AgtXJC
         aTpx7l7Nh3I23+DTAc2PvbIavQsyiHjv5hN7mr7NCXX1SL/IM2xQCpbM/nH8T5586jWo
         6LreFtRWcySeKddCFqZVHh6Z3VEBZwWmnNBPdHiejQ/PcG93cJ4qZhP954OKO1fcwpN/
         NV5iLbDhWKguHPEDJBc0Ygo3wFfqKgnJQ5hanuqosPzIbpa61tpKz1+DJUM6ZjpMyP8x
         5dA9EzT+Ey/raExR2XE+HD8nSRStTk13wt1pe5aKB+E5IwBwpQCKI55dUz4QD1XFEyvQ
         moAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788423617; x=1789028417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1U812yxaafxSGhCI1gFsBnn4eRLRGSwsqnn6M2QiaRI=;
        b=B2NT2eQbL8FKRdWapMPo/Lg1NoFwjV8PV1gQdyqfl/6hR0Uh5JijGZMdASrtitELj4
         S/vTf0A2MkJC53rVAg7sC0zTXPnNg5ZsgDVZA82mnDuQxRafO8U7ttXZ0bNdC8jezWRx
         2zQJyqDgB/tTHz+Yj5tnOX5aSMiG8k+D9CLzkzBE5uNQsVBAkUwHhF/2Cq3vXgIO+/Tq
         9t6CB0uSIyGPYo2WwZfcd+5lQvGovZUMhKZl/FIFNoe3rvWukqZa2ON3GxI1/fgBPn3l
         V/z3n6pa/jxMzUwAVf5i3ALNUCcnHSH0fz7umMdR5HzO3eLPBM+87NumAjTMN/EyhQzw
         i3wA==
X-Forwarded-Encrypted: i=1; AKwUvByGRIpqqdM+vNiETeXYnwj/VJjyaqUjH7II4Gf3VYMmF86Bqoq9YdklO9n4IRU8ApPMgJG/Ny0uYyj4Go8=@vger.kernel.org
X-Gm-Message-State: AFuF++mdAitjE6jevgmrI8jZZC8IE7/6Gx1CVh/zNR7kdVt0vZNHs+tr
	15SWr4A68HGRgo2udDgXAju8zPfuFvy2RHx/So/xkYBSZWxlJpMlTDM=
X-Gm-Gg: AYBFou1gIF2zLZESCv6De3yH1g80f7ZEa+lnGir2ZnZv+WZ/18pbVCsh010OuuzumZP
	WvbVMucSIaLEgHUUaaYtly0l6ts0V/ki3tEz3c1he66FbiYfe0Zj2GSTld4eG8CsM82k6uMdgmd
	ohJq8bzVmGGrsVMvy+izdCDTT2HPx1xp7Djamc7ul5G+cOX7AF9Gt1McMZ+ePmZ2F6kJKkE45Q0
	RTmkQikJlZrDFP7pALv3uKz4oR3ZQCal5eaVuFuvY+nJpYQSCdtOBsfeqCqWfWvBdGxzC6oDP3g
	pIXSywRNqsMlTj1/c5szTbBOjZI3qFqyp8vxpRiimu+mvB92sk8XI5ugSS2M8pgmy+jPRVVtOmc
	EulJoL/xUvJzqArxp0nHoIEi/qrzxNgsXu7JGeShL0r9I1J6IEFbF9mXERAe2iuBJEngukObg5P
	jNwNK1S03JSoOpo7Kkc7iYEMo8QakEGr2wJdeiDD9VGqbTWm2E+iRy5dYfPTjlkQ4oTVd3T+USA
	pJ1lCS0NXKaAgXk
X-Received: by 2002:a17:903:388e:b0:2d8:df44:a5c2 with SMTP id d9443c01a7336-2daec78383cmr140649095ad.20.1788423616934;
        Thu, 03 Sep 2026 01:20:16 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:6496:3266:b22d:ab57:a1be:ef30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dafe92ae86sm6602045ad.40.2026.09.03.01.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 01:20:16 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Samuel Kayode <samkay014@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Donggeun Yoo <donggeunyoo.kernel@gmail.com>,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] regulator: pf1550: fix division by zero in the ramp rate selection
Date: Thu,  3 Sep 2026 17:20:09 +0900
Message-ID: <20260903082010.4024603-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

set_machine_constraints() calls the set_ramp_delay() op when either
constraints->ramp_delay or constraints->ramp_disable is set. The
regulator binding documents regulator-ramp-delay = <0> as the way to
disable ramp control, and of_get_regulation_constraints() turns that
into ramp_disable = true while leaving ramp_delay at 0, so the op is
called with a ramp_delay of 0. The range check rejects negative values
and values above 6250 but not zero, and the value is then used as a
divisor.

The mapping is also wrong for the values that do pass the check. The
hardware offers two rates, 6250 uV/us and 3125 uV/us, selected by
SWx_DVSSPEED in SWx_CTRL1. Dividing 6250 by the requested rate and
taking bit 1 of the quotient does not map monotonically onto them: a
request for 1500 uV/us selects 6250 uV/us, while a request for the
faster 2000 uV/us selects 3125 uV/us.

Replace the division with a direct mapping onto the two supported
rates. Requests at or below 3125 uV/us get the slower rate and anything
above it gets the faster one. A ramp_delay of 0 asks for ramp control
to be disabled, which this hardware cannot do, so it gets the fastest
rate; pfuze100 handles the disabled case the same way.

Fixes: 7320d41c29bb ("regulator: pf1550: Add support for regulator")
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
---
Compile-tested only, I do not have PF1550 hardware. The register
semantics were checked against the PF1550 data sheet rev 3.0, table 28
(SWx DVS setting selection) and the SW1_CTRL1 register description.

 drivers/regulator/pf1550-regulator.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/regulator/pf1550-regulator.c b/drivers/regulator/pf1550-regulator.c
index 610eac9bb9cb..5394bc784e1d 100644
--- a/drivers/regulator/pf1550-regulator.c
+++ b/drivers/regulator/pf1550-regulator.c
@@ -49,17 +49,26 @@ static const int pf1550_ldo13_volts[] = {
 static int pf1550_set_ramp_delay(struct regulator_dev *rdev, int ramp_delay)
 {
 	int id = rdev_get_id(rdev);
-	unsigned int ramp_bits = 0;
+	unsigned int ramp_bits;
 	int ret;
 
 	if (id > PF1550_VREFDDR)
 		return -EACCES;
 
-	if (ramp_delay < 0 || ramp_delay > 6250)
+	switch (ramp_delay) {
+	case 0:
+		/* Ramp control is disabled, so use the fastest rate. */
+		ramp_bits = 0;
+		break;
+	case 1 ... 3125:
+		ramp_bits = 1;
+		break;
+	case 3126 ... 6250:
+		ramp_bits = 0;
+		break;
+	default:
 		return -EINVAL;
-
-	ramp_delay = 6250 / ramp_delay;
-	ramp_bits = ramp_delay >> 1;
+	}
 
 	ret = regmap_update_bits(rdev->regmap, rdev->desc->vsel_reg + 4, 0x10,
 				 ramp_bits << 4);
-- 
2.53.0

