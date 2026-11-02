Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627980;
	b=1Uf3dDmyIOKljbwtEUXYhymnmyQ0HLZqghKA5aDuR5Y704zbWPydqj1dY2041icRX45k
	 yqVgpWOVfnsNiSKxGYM/OvrURSkK13v1DnSF6pBVExFEiXHqRwwGYF7iW9/196v0alKSk
	 GgvCtDAP6Z/jYOM2ckaU0ssGYMRwejfXWZPj+G4Xaf5mor9xLzwbkVauVAwJ55CTZ9yYA
	 eqdROgkjH9A++10PtsNc7TfMCRyNvKYjwlbZUCYZoGNrpdtWVcGxoDhGon2MF3r592qbE
	 TKX5xMsUV12ddnNtN9kuYkUTO8c/lRx9TBj56B5+syRwejiFY9eQbSypwbI7ozbgzeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627980;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=tljb7rtsPlQzIzEu/bBj+fXHIpowDv+rky87XRZ9VDw=;
	b=inR9dpRUHnsex51vomY+63dkA+cbKvMuO+ECGB93FZiRsavem69NXlmjkpxIxYpGKmh+
	 PvCzjZArVlrGvNXXFzDTHPlFqLBlYjCi93s7KaboO2EWYjkZ+zd97+YC/8bQWJCy3vEOa
	 eHfJKO2gYqeJCSgNimYjcnKIapaOXKLXXNX6YQuYtDJn20Xv2Zkq5J9fxLyrk1cqtGslg
	 1eX3N6wG7SzUjA52p5NtfXibF4RMNDblrxBePC2QsD+mBPHGKqyp4I31Kaqi6OTGvxSQx
	 r+s+AQzihCLOlOSEk+9BTr+wfX1VfgURZhc6i+8p5jOGMa9LY2VUMQjO1N34RokdaFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lkxNKFQ1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB0760A2606;
	Mon,  2 Nov 2026 13:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lkxNKFQ1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D4AE1F00A1D;
	Mon,  2 Nov 2026 13:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793627979;
	bh=tljb7rtsPlQzIzEu/bBj+fXHIpowDv+rky87XRZ9VDw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=lkxNKFQ1odMKOTvdBvqxcuVuYTL69XNHDMMAahN6rPpg4qNwXrFENKPaWKHscQw0Z
	 Hq1rVTSFgWM6pTDVEx+R0Uy9WoZOoesyGi2rhboSzIpcQUXW1amB4WOqBL8t643VjT
	 1Q2a/wILsjbd2E564vFxVeqJGAoDZ/JzKrFlYriUqhwYJOakK8mMA07UCrFP5688xD
	 RgEwTFtSlJI/V7QT8F8O3vJbWy/3Wp8E4WDjQDiirMJlFVHR7eLvLngfBXiohkD+Qr
	 rrZJJk/P1xpLqS4FYxaZS6DeDG8JGuidvBoRdvHCLkAWM2r/iSAPaBIAzb3Afn4T1R
	 4m0RDVe/T9Qjw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 02 Nov 2026 14:59:33 +0100
Subject: [PATCH 2/3] phy: qcom: qmp-combo: Make v4/v5 targets use the right
 clamp
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-topic-qmp_aon_clamp-v1-2-141c2cb6cdf6@oss.qualcomm.com>
References: <20261102-topic-qmp_aon_clamp-v1-0-141c2cb6cdf6@oss.qualcomm.com>
In-Reply-To: <20261102-topic-qmp_aon_clamp-v1-0-141c2cb6cdf6@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793627973; l=3162;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=Jg/cbnzut80B0V7M8OEuBOh1vCJVvAzHbp5LGbo5Akk=;
 b=7etytahGwQHJJkXpWYpzhowAkBH5VofuSlugtYIwvyKJoxmC7f4Fu285zPjvzN0nnmfAOQ3fc
 36EUJo9p9UeADxWAC35/OmzBJoKVbxBjHfUwuPZxVYvPsiDvCLAdGpY
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The clamp in PCS_MISC may or may not exist on some of these targets,
but in any case it's not the right one to assert. Switch over to the
one the hardware programming guide calls for.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c  | 7 ++++++-
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5.h | 1 +
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 1c7b653975f1..84b9d6f3969c 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -159,7 +159,7 @@ static const unsigned int qmp_v45_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= QPHY_V4_PCS_USB3_AUTONOMOUS_MODE_CTRL,
 	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = QPHY_V4_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR,
 
-	[QPHY_PCS_MISC_CLAMP_ENABLE]	= QPHY_V4_PCS_MISC_CLAMP_ENABLE,
+	[QPHY_PCS_CLAMP_ENABLE]		= QPHY_V4_PCS_CLAMP_ENABLE,
 
 	[QPHY_COM_RESETSM_CNTRL]	= QSERDES_V4_COM_RESETSM_CNTRL,
 	[QPHY_COM_C_READY_STATUS]	= QSERDES_V4_COM_C_READY_STATUS,
@@ -186,6 +186,7 @@ static const unsigned int qmp_v5_5nm_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= QPHY_V5_PCS_USB3_AUTONOMOUS_MODE_CTRL,
 	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = QPHY_V5_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR,
 
+	[QPHY_PCS_CLAMP_ENABLE]		= QPHY_V5_PCS_CLAMP_ENABLE,
 	[QPHY_PCS_MISC_CLAMP_ENABLE]	= QPHY_V5_PCS_MISC_CLAMP_ENABLE,
 
 	[QPHY_COM_RESETSM_CNTRL]	= QSERDES_V5_COM_RESETSM_CNTRL,
@@ -4699,6 +4700,8 @@ static void qmp_combo_enable_autonomous_mode(struct qmp_combo *qmp)
 			qphy_clrbits(pcs_aon, cfg->regs[QPHY_PCS_USB4_CLAMP_ENABLE], CLAMP_EN);
 		else
 			qphy_clrbits(pcs_aon, cfg->regs[QPHY_PCS_CLAMP_ENABLE], CLAMP_EN);
+	} else if (cfg->regs[QPHY_PCS_CLAMP_ENABLE]) {
+		qphy_clrbits(qmp->pcs, cfg->regs[QPHY_PCS_CLAMP_ENABLE], CLAMP_EN);
 	} else if (pcs_misc) {
 		qphy_clrbits(pcs_misc, cfg->regs[QPHY_PCS_MISC_CLAMP_ENABLE], CLAMP_EN);
 	}
@@ -4717,6 +4720,8 @@ static void qmp_combo_disable_autonomous_mode(struct qmp_combo *qmp)
 			qphy_setbits(pcs_aon, cfg->regs[QPHY_PCS_USB4_CLAMP_ENABLE], CLAMP_EN);
 		else
 			qphy_setbits(pcs_aon, cfg->regs[QPHY_PCS_CLAMP_ENABLE], CLAMP_EN);
+	} else if (cfg->regs[QPHY_PCS_CLAMP_ENABLE]) {
+		qphy_setbits(qmp->pcs, cfg->regs[QPHY_PCS_CLAMP_ENABLE], CLAMP_EN);
 	} else if (pcs_misc) {
 		qphy_setbits(pcs_misc, cfg->regs[QPHY_PCS_MISC_CLAMP_ENABLE], CLAMP_EN);
 	}
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5.h
index 36cc80bb9059..1d1688b3d7ba 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5.h
@@ -11,6 +11,7 @@
 #define QPHY_V5_PCS_PCS_STATUS1				0x014
 #define QPHY_V5_PCS_POWER_DOWN_CONTROL			0x040
 #define QPHY_V5_PCS_START_CONTROL			0x044
+#define QPHY_V5_PCS_CLAMP_ENABLE			0x08c
 #define QPHY_V5_PCS_LOCK_DETECT_CONFIG1			0x0c4
 #define QPHY_V5_PCS_LOCK_DETECT_CONFIG2			0x0c8
 #define QPHY_V5_PCS_LOCK_DETECT_CONFIG3			0x0cc

-- 
2.56.0

