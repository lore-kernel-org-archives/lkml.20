Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627978;
	b=jaw1Orj5UsItgfKMnQ9gpL+R2Tk+fhSSgUA/DeQZ/5r/scsBV8O+/TJJ3QVtt81KUqec
	 eF45HtXNwQYAH/TiZyC+u85xi8Ju9hmjgea7Hdpza2SjuTPXNPnGgUOlse7bZj1mwVPgF
	 274MnZnLfnJDr1h6u3uRdwVQlM0thcBPKNqBjBhPC8ZgBww8AIrLBrpag7hs++zqrNYRZ
	 K0fMBQ7hKEa40Si4yvTh/AnZnJ3KkYcs3q9Sc8s7nXIwubWjfuYFu/CIS4Ef90jT3JSkV
	 aonxya8x4kQubXeGc357M6Y8LYAfMnxgfsre6vAe2xZnNS4pXO4u2mvDg1YMyL0jVnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627978;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Rse/YC9ktFD3iTURhqAd9fVTwoAUpW32zPZZFufJXZ0=;
	b=zmo4nJaZaoTnwBJDU0X8amXW8+29I0dR5/CAwh8n7wB+K4dTZVg+FYYTFE1i5iV/5y6Q
	 DE2wpYeemdgB3U/tLlp5uvdWM8Y8LozWhQenTj6F3dmqNAsPQfgrjXz3HG+aEdK9bHbFi
	 B/IHvCPBx3VIZ1PETck5YbXK4yA2L2fM4SfCieDtcQy3PMHOgSWSwf0/1Wfcf9M/l2G2N
	 Ynsb92vZ2rVt18NYweYTtiHmi4VCn1f4mjhCe4OtPKtVdgvfGvYY+99fitSblmvoUa/c7
	 i7oQ9ad7UdgiM1glBS9SsZvYb2Ni4spcvEvQGK80AfFb+S+ZR/Ob6Evb6bQ44qHxP/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZS2t3qUk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FA860A5BC6;
	Mon,  2 Nov 2026 13:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZS2t3qUk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 333241F00A1A;
	Mon,  2 Nov 2026 13:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793627977;
	bh=Rse/YC9ktFD3iTURhqAd9fVTwoAUpW32zPZZFufJXZ0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ZS2t3qUk4CUiDINRk52HiwnIsDx/HxkYIoN79KF9NQfz0YgvyLcVWEoeJgSBEo9tD
	 ffAFCE4WUQlEHeh4xfRIo6AKU5OTGqxJx+LusnbyUzqXs+smBfkVpI8DWFjcx/Fx4e
	 7hrH6fCRjtziyhjwZWSGxvaG+KoE8qwUWWK4qUU2gCj7lfTlOttbKzBAbQMp/JJTge
	 9cn8mABaJ2vd6cV62bDl4BhIe7a80Z5hhGEKzjKfClChoIADujcvR+IK/FKF4sV3My
	 XOoeQL6XhjiokeSLysgbvo3+Tkpak0MdKBV3cV6XBHf6MbgxanEYRZ68UpQLVZtQTw
	 EEW1V7WKm9wPA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 02 Nov 2026 14:59:32 +0100
Subject: [PATCH 1/3] phy: qcom: qmp-combo: Separate PCS misc clamp mapping
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
Message-Id: <20261102-topic-qmp_aon_clamp-v1-1-141c2cb6cdf6@oss.qualcomm.com>
References: <20261102-topic-qmp_aon_clamp-v1-0-141c2cb6cdf6@oss.qualcomm.com>
In-Reply-To: <20261102-topic-qmp_aon_clamp-v1-0-141c2cb6cdf6@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793627973; l=3634;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=ZMDcgcYPPUkRm87FwlhtfXTmJGjtzjYLaZTdEAefy2k=;
 b=sEBJg1L0GwYfD7rwKeZpaWVjCkmQUXCN/Oa2Qr1xAJb13wj+KWb8yMQg/kw4q9nq7O2Uda0VX
 6RWfO485amACeD5kt8stOcb45i4VEEcmjoI86WZ2oApiqgtXIi+m/qY
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

PCS clamp offsets can belong to different register windows. Using
QPHY_PCS_CLAMP_ENABLE for both the AON and PCS misc windows conflates
those layouts when a PHY has both controls.

Add QPHY_PCS_MISC_CLAMP_ENABLE for misc-backed platforms and use it for
misc-window clamp accesses. Keep QPHY_PCS_CLAMP_ENABLE for PCS/AON
clamps.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index aa9dc9716574..1c7b653975f1 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -101,6 +101,7 @@ enum qphy_reg_layout {
 	QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR,
 	QPHY_PCS_POWER_DOWN_CONTROL,
 	QPHY_PCS_CLAMP_ENABLE,
+	QPHY_PCS_MISC_CLAMP_ENABLE,
 	QPHY_PCS_USB4_CLAMP_ENABLE,
 
 	QPHY_COM_RESETSM_CNTRL,
@@ -131,7 +132,7 @@ static const unsigned int qmp_v3_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= QPHY_V3_PCS_AUTONOMOUS_MODE_CTRL,
 	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = QPHY_V3_PCS_LFPS_RXTERM_IRQ_CLEAR,
 
-	[QPHY_PCS_CLAMP_ENABLE]		= QPHY_V3_PCS_MISC_CLAMP_ENABLE,
+	[QPHY_PCS_MISC_CLAMP_ENABLE]	= QPHY_V3_PCS_MISC_CLAMP_ENABLE,
 
 	[QPHY_COM_RESETSM_CNTRL]	= QSERDES_V3_COM_RESETSM_CNTRL,
 	[QPHY_COM_C_READY_STATUS]	= QSERDES_V3_COM_C_READY_STATUS,
@@ -158,7 +159,7 @@ static const unsigned int qmp_v45_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= QPHY_V4_PCS_USB3_AUTONOMOUS_MODE_CTRL,
 	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = QPHY_V4_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR,
 
-	[QPHY_PCS_CLAMP_ENABLE]		= QPHY_V4_PCS_MISC_CLAMP_ENABLE,
+	[QPHY_PCS_MISC_CLAMP_ENABLE]	= QPHY_V4_PCS_MISC_CLAMP_ENABLE,
 
 	[QPHY_COM_RESETSM_CNTRL]	= QSERDES_V4_COM_RESETSM_CNTRL,
 	[QPHY_COM_C_READY_STATUS]	= QSERDES_V4_COM_C_READY_STATUS,
@@ -185,7 +186,7 @@ static const unsigned int qmp_v5_5nm_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= QPHY_V5_PCS_USB3_AUTONOMOUS_MODE_CTRL,
 	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = QPHY_V5_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR,
 
-	[QPHY_PCS_CLAMP_ENABLE]		= QPHY_V5_PCS_MISC_CLAMP_ENABLE,
+	[QPHY_PCS_MISC_CLAMP_ENABLE]	= QPHY_V5_PCS_MISC_CLAMP_ENABLE,
 
 	[QPHY_COM_RESETSM_CNTRL]	= QSERDES_V5_COM_RESETSM_CNTRL,
 	[QPHY_COM_C_READY_STATUS]	= QSERDES_V5_COM_C_READY_STATUS,
@@ -4698,8 +4699,9 @@ static void qmp_combo_enable_autonomous_mode(struct qmp_combo *qmp)
 			qphy_clrbits(pcs_aon, cfg->regs[QPHY_PCS_USB4_CLAMP_ENABLE], CLAMP_EN);
 		else
 			qphy_clrbits(pcs_aon, cfg->regs[QPHY_PCS_CLAMP_ENABLE], CLAMP_EN);
-	} else if (pcs_misc)
-		qphy_clrbits(pcs_misc, cfg->regs[QPHY_PCS_CLAMP_ENABLE], CLAMP_EN);
+	} else if (pcs_misc) {
+		qphy_clrbits(pcs_misc, cfg->regs[QPHY_PCS_MISC_CLAMP_ENABLE], CLAMP_EN);
+	}
 }
 
 static void qmp_combo_disable_autonomous_mode(struct qmp_combo *qmp)
@@ -4715,8 +4717,9 @@ static void qmp_combo_disable_autonomous_mode(struct qmp_combo *qmp)
 			qphy_setbits(pcs_aon, cfg->regs[QPHY_PCS_USB4_CLAMP_ENABLE], CLAMP_EN);
 		else
 			qphy_setbits(pcs_aon, cfg->regs[QPHY_PCS_CLAMP_ENABLE], CLAMP_EN);
-	} else if (pcs_misc)
-		qphy_setbits(pcs_misc, cfg->regs[QPHY_PCS_CLAMP_ENABLE], CLAMP_EN);
+	} else if (pcs_misc) {
+		qphy_setbits(pcs_misc, cfg->regs[QPHY_PCS_MISC_CLAMP_ENABLE], CLAMP_EN);
+	}
 
 	qphy_clrbits(pcs_usb, cfg->regs[QPHY_PCS_AUTONOMOUS_MODE_CTRL],
 		     ARCVR_DTCT_EN | ARCVR_DTCT_EVENT_SEL | ALFPS_DTCT_EN);

-- 
2.56.0

