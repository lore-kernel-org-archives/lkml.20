Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627926;
	b=ToPSxxnP5uB8JqZ8kCqMItY0Sxk+xxyVu0JWFuBu3YUVydMLpSWIYhf3uX/s6Phc78GI
	 bWprMjCcbKgX/Q74oXGoxawBLV5vUiJfW1Wv+r/d1Ma2CQCg6naxvM4cmXqAHtiq+yLDp
	 PtQzTTI+LIL2pljAD+IrsYyqDOIk3Ke95/cyH8S8tRC4+B9j+h0w5Ya9BW6UJ3wpOM6xY
	 cwTSb1RJw2QanCrmEqAd8Il+zA7s1H6WgazOUznvDhBsbeQwPHoJjFqo5HVR6zMgiegu1
	 3WM3jb2Cc43ZrEGUfVVGfUvm+Ec50q8C6v+2nESKMzHuakRzukL9wO9s7oIbB0JsYWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627926;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=PPd47h4FlbzZ042j0mcFuN0ZCfNMGQpqhNceN++4sfw=;
	b=QPlx3Oy1NZwluRT6Da8u3m3aL5FU2jpY4MMhEyLIFLuy1gbRlAS5XgYyA85MAzm9JWPI
	 uVbeoULc3widthF54aw/awzXtP3PcyXDUEpoqCg0qPKYXBkuxNmOranm/pJV7f1V1Jmmb
	 kGq4FDkaNTsjp3y7q5zHemgaYwkwxRcX8PjeDuNj2+WTqyXugz9KGVR/RjUvRvTn3c/FX
	 9DWERnhMB3CReBVBRq4BcqSEaIDB95Vd/EymGmKe4z3/heKo2TbR4WknA04T7mSzm4M/B
	 tSwrHmtwr+apoQ/Xk6zEKK6BaCB0am1Hjj7B52o9vUIQEacWxVbUWUayuKFH51w8dLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fi66maNa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4845160A3832;
	Mon,  2 Nov 2026 13:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fi66maNa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A37931F00A25;
	Mon,  2 Nov 2026 13:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793627926;
	bh=PPd47h4FlbzZ042j0mcFuN0ZCfNMGQpqhNceN++4sfw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Fi66maNaBSe7wxYtENZ3NIuzjqJC0b+LNF/XFdPBzuFYHcmBZdllKQF6vXZes0RXx
	 3OneYBpz0md48Jn1q8xa7r/bkedO+x8OwwqR0xPTut6EGm8PHp4PsPoqOfQISZXehj
	 AhBlsQg3Qp5k64NtZDPWcXQ5pHyCaeb7Bx3wAF96GTNPZDTf7Qr7wV7TxpGknNN1SH
	 QxUUT5Hsklbg1vHXhDNRrOH9OaKHDBylpv1APXmbG0RRQcqv+fy91q50Ktglucp5vO
	 mM0gPzlEZftLsVwrnqsg8AAN4+/znT1MHGG/yJ4hukmHuipa2UFwvvPqvbzgca6Yxq
	 lmu44tiT3fnGg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 02 Nov 2026 14:58:37 +0100
Subject: [PATCH 2/2] phy: qcom: qmp-combo: Update SC8280XP USB3 PCS
 settings
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
Message-Id: <20261102-topic-usb3_sequence-v1-2-5b144f5e6865@oss.qualcomm.com>
References: <20261102-topic-usb3_sequence-v1-0-5b144f5e6865@oss.qualcomm.com>
In-Reply-To: <20261102-topic-usb3_sequence-v1-0-5b144f5e6865@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793627920; l=2053;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=H07VnyclxWVKrz7jfPLBmeZ1m0WMloGoYIqBSyPC9i0=;
 b=w3My4vn7Em8KigtF7Tvs9imN1bwOHkg/e8JX8WpPuSqUpCbyCFZmXJhLaW6W6oXyq1Cy2+AUW
 IusERjfaMVRC1JZwm6ocD68pal62bvfBTrvKf9nQutWy+X8imkcWLLh
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Update the settings to match the latest hardware reference guide.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 2a8c39b81973..6f83c9d4aa30 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -1951,20 +1951,21 @@ static const struct qmp_phy_init_tbl sc8280xp_usb43dp_rx_tbl[] = {
 static const struct qmp_phy_init_tbl sc8280xp_usb43dp_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V5_PCS_RCVR_DTCT_DLY_P1U2_L, 0xe7),
 	QMP_PHY_INIT_CFG(QPHY_V5_PCS_RCVR_DTCT_DLY_P1U2_H, 0x03),
-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_LOCK_DETECT_CONFIG1, 0xd0),
-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_LOCK_DETECT_CONFIG2, 0x07),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_LOCK_DETECT_CONFIG1, 0xc4),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_LOCK_DETECT_CONFIG2, 0x89),
 	QMP_PHY_INIT_CFG(QPHY_V5_PCS_LOCK_DETECT_CONFIG3, 0x20),
 	QMP_PHY_INIT_CFG(QPHY_V5_PCS_LOCK_DETECT_CONFIG6, 0x13),
 	QMP_PHY_INIT_CFG(QPHY_V5_PCS_REFGEN_REQ_CONFIG1, 0x21),
-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_RX_SIGDET_LVL, 0xaa),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_RX_SIGDET_LVL, 0x33),
 	QMP_PHY_INIT_CFG(QPHY_V5_PCS_RX_CONFIG, 0x0a),
-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_ALIGN_DETECT_CONFIG1, 0x88),
-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_ALIGN_DETECT_CONFIG2, 0x13),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_ALIGN_DETECT_CONFIG1, 0xd4),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_ALIGN_DETECT_CONFIG2, 0x30),
 	QMP_PHY_INIT_CFG(QPHY_V5_PCS_PCS_TX_RX_CONFIG, 0x0c),
 	QMP_PHY_INIT_CFG(QPHY_V5_PCS_EQ_CONFIG1, 0x4b),
 	QMP_PHY_INIT_CFG(QPHY_V5_PCS_EQ_CONFIG5, 0x10),
 	QMP_PHY_INIT_CFG(QPHY_V5_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL, 0xf8),
 	QMP_PHY_INIT_CFG(QPHY_V5_PCS_USB3_RXEQTRAINING_DFE_TIME_S2, 0x07),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_USB3_POWER_STATE_CONFIG1, 0x68),
 };
 
 static const struct qmp_phy_init_tbl x1e80100_usb43dp_serdes_tbl[] = {

-- 
2.56.0

