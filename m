Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8F84FB9CD
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789565923; cv=none; b=CTkL86kXNkp6y+fvso9M4bKMlYApFfqKaXJOLk8fon6qwU36kKSLsTMJ4zTKuomDsWYsP8EaJ4e5Tcpmxp986JXU0RUzYfDN4BQlnvYC0KilXlv8FUAjw7teL1eUq5loCc6jwx/Q44VbeKa12332u/0/nAHibDNSTqOjP7TEwOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789565923; c=relaxed/simple;
	bh=86UCdyC3JJqGMy9n7TXi2uBPfsFRRtLZVG2Nqr9rMlo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=huw8oBHrZUcLSeNnd+QALYBRbkrGXPyOn36pOnA5CH2mUGt0KTmFLsjf2Ir92X49KQVRQKw/A7+yC+5X1MzA6rG22WwpWDrIZWlwUmY1Lk3ol7q/NpTvq765HHf+GjtypRa6wppoDkywSzl1R9YdHck50u1VIEul2McUbtZf3Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UwQ1WNw4; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UwQ1WNw4"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso8577475e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789565905; x=1790170705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xz3HK6DDtKRl1abjqqVH54CfvADyJSGzyjE+gIk1aBg=;
        b=UwQ1WNw4sDNybG8rfYDBGYPd1Lm47Q0gYKYXb7JF0psXjX+MqHUIPB/iqVInc+TmWg
         WgHL5iFnohxvIPHWoPK9JAefGeDXirf8FAs4Gmd3m1C4pGxPp+W6ctEZJeeJJPuuv7G5
         1WVHi2y8KTPEE7hdVnVWXV9znbaR03M5ayHKnvFFTYP2WJGTTPBWhtvQqKu4eYUbM1IF
         HltElHUNOf8Ws4UBPVsni9JiYqLjVFsxqGaq/kP0RDni4gkidstglFFkQEtTmSIqzlIP
         axHGPIYbq67ojbN2hx+Lb+ghK+UVLwoaCbUTVPylSZ6PpW863qr294wigMTAMnN12Dmn
         9IGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789565905; x=1790170705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xz3HK6DDtKRl1abjqqVH54CfvADyJSGzyjE+gIk1aBg=;
        b=OiH/84T2i87DVsLPO9sv90Bg0ddsbJ7CnvHk0h6Dqw4tdpXc+FyY/PD31SApV8Fg+H
         NPTMeSTRUf9I1xidgxy+mjEjBfGhRcej3bycJ4roELQO2RrJ9cwLiJdWs+5gfO/Px0uJ
         6cAnmIfdf79lsWzN6VjI3lJmN+APZoaErHJK3j845bR4uPfFNqT8RFiXSgR0Nc/8WVdr
         zNQ6gkmsGNOHdoaIFx4LC8ZmfE4NScX1iVtX5nl+uq/XDbdFYqz3TVLWwygya4t5STbq
         m7LE28KTxM/ULefshDxINEdSUXrQK1riEt5IueTdqDBvKhXsnBC0tZ1wafmf+SWm/OAZ
         AJgA==
X-Forwarded-Encrypted: i=1; AKwUvBx9QP3TJ0Q7Xa0skRAnQcRos6kpwKZ9ooB9yUEq2qaY2GqKlhnIxgBjP0eZ5ySoMqJhC0YOFDjlxIH0ZH0=@vger.kernel.org
X-Gm-Message-State: AFuF++kcDIjkNzB+RvlfqCrlOqRIs/Apy7u2zaWOxQxOGuo6t9FPbJZR
	QHyoF5dlp6Pkc2fEZbx+eLgsH7ui3jBSwrp0gPZW2vQicVAQj9Mth5Z9
X-Gm-Gg: AYBFou1jOEP8V110FenzSMTTbP38JlN1M+8Xeyhu0pzTKDXCyIGX2AhzNJ5gyRCOrcn
	Txz0TwIosHTWLS4/UAA4INpplblXPZwmFzQW5blW1nTBbq6LRMQaerwR//+iSk9nDi9oz7nhHxg
	5zc3jHEGa87EtQ35iAaKV9DoZ1Ny51v1RPKBD37+Rt5D4pYvmIextGIDd+riuLtWZcFjJDkhMyw
	WkrPbmhmPE4C2F7+blcdJmcbuEWzSJ4cKbtGvv0950l/Q6YJ8W7Go7tYJAGhiLnKN5LlIQfQvyp
	auvpW1Ad9fZFm/U8O0konig+fqAoiCCXGuP5RPasrP/lQ1NtjAYdLxL3u6PC9dDiMtHIoy4T22k
	m6AkGw6fjQji0bxz2PsaNF4BHhph1mkIk0B+wMkJwdubLcWep7MepGsBK80G0vzZgmRNq0ZE1tX
	kom/r0yl74basXYh6LwMDgd3WXZaV1kGYKvz9zHxEPQRBA7wxP5MYe7Z2Hr/uEIdlNqfGh6mDBP
	8Y3K0E4zdRU56T02C1NbQ==
X-Received: by 2002:a05:600c:8b61:b0:49e:6891:27a8 with SMTP id 5b1f17b1804b1-49eb732e411mr28499095e9.25.1789565905075;
        Wed, 16 Sep 2026 06:38:25 -0700 (PDT)
Received: from localhost.localdomain ([194.154.195.114])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49e83da9a7csm77085295e9.11.2026.09.16.06.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 06:38:24 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3 2/2] phy: qcom: qmp-combo: check qmp_combo_com_init() in the typec callbacks
Date: Wed, 16 Sep 2026 15:38:14 +0200
Message-ID: <20260916133814.3977-3-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916133814.3977-1-okerixx@gmail.com>
References: <20260916133814.3977-1-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qmp_combo_typec_switch_set() and qmp_combo_reconfigure_phy(), which the
typec mux callback and the USB4 init path use, tear the common block down
and bring it straight back up on an orientation or altmode change, but
they discard the result of the bringup:

	qmp_combo_com_exit(qmp, true);

	qmp->qmpphy_mode = new_mode;

	/* Now everything's powered down, power up the right PHYs */
	qmp_combo_com_init(qmp, true);

	if ((qmp->usb_init_count || qmp->usb4_init_count) &&
	    new_mode != QMPPHY_MODE_DP_ONLY)
		qmp_combo_usb_power_on(qmp->usb_phy);

If qmp_combo_com_init() fails - a regulator, a reset or
clk_bulk_prepare_enable() - it unwinds what it had brought up and returns
an error, leaving the clocks disabled.  Both paths then carry on and
qmp_combo_usb_power_on(), and dp_aux_init() after it, write PHY registers
with no clock running.  qmp_combo_usb4_init() already checks the return
value of qmp_combo_reconfigure_phy(), but never sees a failure from it.

Propagate the failure instead.  Both callbacks record the requested mode
or orientation before the bringup, and skip the hardware entirely when
the next event asks for what is already recorded, so on failure put the
previous mode back and forget the orientation: the next Type-C event for
the same setting then runs the bringup again instead of being treated as
done.

The PHY is still left logically initialised with its clocks off until
that retry, which is the state any forced bringup failure already
produces and which these callbacks have no way to report to the PHY
consumers; what changes is that the register writes that would fault no
longer happen here.

Fixes: 2851117f8f42 ("phy: qcom-qmp-combo: Introduce orientation switching")
Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index f6d3320a59d9..ccdf71730dc7 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -4601,6 +4601,9 @@ static int qmp_combo_usb_set_mode(struct phy *phy, enum phy_mode mode, int submo
 
 static int qmp_combo_reconfigure_phy(struct qmp_combo *qmp, enum qmpphy_mode new_mode)
 {
+	enum qmpphy_mode old_mode = qmp->qmpphy_mode;
+	int ret;
+
 	dev_dbg(qmp->dev, "qmp_combo_reconfigure_phy: switching from qmpphy mode %d to %d\n",
 		qmp->qmpphy_mode, new_mode);
 
@@ -4615,7 +4618,11 @@ static int qmp_combo_reconfigure_phy(struct qmp_combo *qmp, enum qmpphy_mode new
 	qmp->qmpphy_mode = new_mode;
 
 	/* Now everything's powered down, power up the right PHYs */
-	qmp_combo_com_init(qmp, true);
+	ret = qmp_combo_com_init(qmp, true);
+	if (ret) {
+		qmp->qmpphy_mode = old_mode;
+		return ret;
+	}
 
 	if ((qmp->usb_init_count || qmp->usb4_init_count) &&
 	    new_mode != QMPPHY_MODE_DP_ONLY)
@@ -5166,6 +5173,7 @@ static int qmp_combo_typec_switch_set(struct typec_switch_dev *sw,
 {
 	struct qmp_combo *qmp = typec_switch_get_drvdata(sw);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	int ret;
 
 	if (qmp->qmpphy_mode == QMPPHY_MODE_USB4) {
 		/* QMPPHY has no orientation handling in USB4 mode, don't cache the setting */
@@ -5186,7 +5194,12 @@ static int qmp_combo_typec_switch_set(struct typec_switch_dev *sw,
 			qmp_combo_usb_power_off(qmp->usb_phy);
 		qmp_combo_com_exit(qmp, true);
 
-		qmp_combo_com_init(qmp, true);
+		ret = qmp_combo_com_init(qmp, true);
+		if (ret) {
+			qmp->orientation = TYPEC_ORIENTATION_NONE;
+			return ret;
+		}
+
 		if (qmp->usb_init_count || qmp->usb4_init_count)
 			qmp_combo_usb_power_on(qmp->usb_phy);
 		if (qmp->dp_init_count)
-- 
2.55.0

