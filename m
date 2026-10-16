Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296FD4A64DB;
	Fri, 16 Oct 2026 12:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792155304; cv=none; b=uRjLKqlOa2kT34b7vVT4V/QbvYc77Z6NVs3lcnhcrx69+TJj8Lvhbc/RR8NSFbooDZ1YvD8IzcfbzwnkAPI7OBijS6LWQojjn7p1dlbTpBu+BeLnYiGjQ3CfU5Vtn9eStw8xtrrAbqSoWLDUyxZZ/mYh9kHL266XQx75j+1h+dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792155304; c=relaxed/simple;
	bh=o6J5i2u49YowKa18Af6jXb6RXCYP7we3Zmk8baG15Nw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Iw6rAzJdwMEPJlZeu/SuOU82W8DoQJ+C9ADqJP4pAm/KHgLY3wf4HfpQ7nz18Hcefi2U4sy7FSp42rlJispKKnvfOME7QcY5dxw4mEMWklPRevS2HOcX6kAQf6hVgZbcJ5vuvC+FZlDzFMahUMl08R4bOvjbn4J/CPECnx9ffGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IRFLj9MZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IRFLj9MZ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E942FC2BCF4;
	Fri, 16 Oct 2026 12:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792155304;
	bh=o6J5i2u49YowKa18Af6jXb6RXCYP7we3Zmk8baG15Nw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IRFLj9MZ7YJf63ldWKLNU2X0NQHURQ2Ig8ZAxhaIAe5lFKHyUpjU/i0PtlD8QT9US
	 bM+ffq6N/KNFgIKK7n9fJ3r4tF48QISztMT4AP1Wvpzvh9tYDBMF21ZTHCchiJE3eR
	 mlJj8YH52vuNWkvViM0+xmG2htHffUopCMckKonxFbrxZJ6NeLlihD/w+aoHGS3Vuc
	 iNa+QmQnrz4wWOy5A7pkjwJbJLvGqRGDm2BZisATeWVVOB2sdm8MUvN1klrCSQ4ctw
	 1Bb9/MuOZTF/j0H+4nXOIQ3oRrx0zeZLiqCNOmtVJc3rEAUGLBLW/FxNCIsUDNWpZs
	 klyysyRR7DGRA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D60D1CCF2C2;
	Fri, 16 Oct 2026 12:55:03 +0000 (UTC)
From: Ishu Brar via B4 Relay <devnull+patches.brar.si@kernel.org>
Date: Fri, 16 Oct 2026 18:23:13 +0530
Subject: [PATCH 3/4] drm/msm/a6xx: Program the PDC sequencer on Adreno 620
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-adreno-a620-v1-3-4a7ed6210d7d@brar.si>
References: <20261016-adreno-a620-v1-0-4a7ed6210d7d@brar.si>
In-Reply-To: <20261016-adreno-a620-v1-0-4a7ed6210d7d@brar.si>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ishu Brar <patches@brar.si>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792155300; l=3539;
 i=patches@brar.si; h=from:subject:message-id;
 bh=Ysw8EJ3fjj06d5areFyTNj9oO7rlFN0mqP5y7DWvPYM=;
 b=2wLz7ueVtHuJYtf3X4PO2TO7TcGCaLsgfFcbS63waQlpqkuN5WeC4UK3ikI0Q32Jom1skzupF
 Lhrrnt+n/keAVZpWP5ONtE8s9yc0mHxW6I8lQ1oTmI9nJvnH0BaUxMz
X-Developer-Key: i=patches@brar.si; a=ed25519;
 pk=Ds+E23E3ntzjPzuBDyVRkOouclcNI5k75R+N42yJtCk=
X-Endpoint-Received: by B4 Relay for patches@brar.si/default with
 auth_id=1189
X-Original-From: Ishu Brar <patches@brar.si>
Reply-To: patches@brar.si

From: Ishu Brar <patches@brar.si>

Unlike the rest of the A650 family, the A620 does not get its PDC set up
by AOP (the downstream devicetree has no pdc_in_aop for it). Without the
sequence, the RSC never acks the second power-up ("Unable to power on
the GPU RSC") and the device hangs.

Program the sequence from the driver, taking the xo, mx and cx resource
addresses from cmd-db instead of the hardcoded ones.

Assisted-by: Claude
Signed-off-by: Ishu Brar <patches@brar.si>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 662f09bec..e567e8027 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -686,6 +686,7 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 	u32 seqmem0_drv0_reg = REG_A6XX_RSCC_SEQ_MEM_0_DRV0;
 	void __iomem *seqptr = NULL;
 	uint32_t pdc_address_offset;
+	u32 mx_addr = 0x30010, cx_addr = 0x30000;
 	void __iomem *pdcptr;
 	bool pdc_in_aop = false;
 
@@ -697,8 +698,17 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 	if (IS_ERR(pdcptr))
 		return;
 
-	if (adreno_is_a650_family(adreno_gpu) ||
-	    adreno_is_a7xx(adreno_gpu))
+	/* Unlike the rest of the A650 family, A620 has no PDC setup from AOP */
+	if (adreno_is_a620(adreno_gpu)) {
+		pdc_address_offset = cmd_db_read_addr("xo.lvl");
+		mx_addr = cmd_db_read_addr("mx.lvl");
+		cx_addr = cmd_db_read_addr("cx.lvl");
+		if (!pdc_address_offset || !mx_addr || !cx_addr) {
+			DRM_DEV_ERROR(gmu->dev, "No PDC resource addresses in cmd-db\n");
+			return;
+		}
+	} else if (adreno_is_a650_family(adreno_gpu) ||
+		 adreno_is_a7xx(adreno_gpu))
 		pdc_in_aop = true;
 	else if (adreno_is_a618(adreno_gpu) || adreno_is_a640_family(adreno_gpu))
 		pdc_address_offset = 0x30090;
@@ -766,10 +776,10 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS1_CMD_WAIT_FOR_CMPL_BANK, 0);
 	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS1_CONTROL, 0);
 	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS1_CMD0_MSGID, 0x10108);
-	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS1_CMD0_ADDR, 0x30010);
+	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS1_CMD0_ADDR, mx_addr);
 	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS1_CMD0_DATA, 1);
 	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS1_CMD0_MSGID + 4, 0x10108);
-	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS1_CMD0_ADDR + 4, 0x30000);
+	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS1_CMD0_ADDR + 4, cx_addr);
 	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS1_CMD0_DATA + 4, 0x0);
 
 	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS1_CMD0_MSGID + 8, 0x10108);
@@ -780,11 +790,11 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD_WAIT_FOR_CMPL_BANK, 0);
 	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CONTROL, 0);
 	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_MSGID, 0x10108);
-	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_ADDR, 0x30010);
+	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_ADDR, mx_addr);
 	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_DATA, 2);
 
 	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_MSGID + 4, 0x10108);
-	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_ADDR + 4, 0x30000);
+	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_ADDR + 4, cx_addr);
 	if (adreno_is_a618(adreno_gpu) || adreno_is_a619(adreno_gpu) ||
 			adreno_is_a650_family(adreno_gpu))
 		pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_DATA + 4, 0x2);

-- 
2.56.0


