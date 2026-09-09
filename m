Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9E8563FA3
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788966901; cv=none; b=bTy7tHtXSeHZvfN3bwScmMOUmJCm4Gq/dlznktoEZklXGb25ZEjK1+dclrsvSMysiUXvGcV4MFNvxAITJNTOo/ErQcTJE+djVIhoBgOpUdtnjpHEpOt5z2M+gKWYeSd8nhJG07hFl/XHf7zSH7OK0Zt43dzQq1ESuEsu0RgIaB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788966901; c=relaxed/simple;
	bh=CzXLOmxgDqahnxvEdsm2tQ0tAQuF+lJlxppti2FcKYE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hc2cYY3UrLyYfd5WvMBBeaCEQ2Do360s7McETr3VCE22W0EA9g5u3HV++Ov+OkbNi7HONdZ1AeKOCrESWAXXSBIatqAlNECj0nRPY+As3xpEyArMDApg0zCnrT9Qt3eDGV9gsnqoUXHE/jVRXCF0yAoUilyrwtGEdkB1sm+0Rjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MFT+TMQU; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MFT+TMQU"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49d0b98d6d0so39591925e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788966898; x=1789571698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Hgb+fNNqz3kjuFAqgV/JYmpECXZZxwWjRWGYVFo2S8=;
        b=MFT+TMQUj5FkFJJ2+j75E22nkp95SeCl79pTFjL2DSGrrns/qZX5of+sE2/bzs79te
         /c/5wLrgcTdUinp/oVThapsde0DBEuaMJ2OsvkimU5pY6kVY+cF1qNSIUXyoM97t26G3
         +sJmkNjo5COtHfM2lGOSFA/eqV5Dt1+69WO9tl991aqIf+Ult9hwk79YSCdItJX9V3Zv
         +9olFzSMkBTJTrgaW3TAu2yzPsdcHF2yyhX9AA6wfydSJEcDuDN9ZyoNqgAaQ4q4rYTC
         Zr7+uuSWIj3aAoDOXWTzpxUT0wB6/uGVjZy9fhzCvZZKNdt2kqcU34/8RWc66lx+pGkr
         Lrww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788966898; x=1789571698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5Hgb+fNNqz3kjuFAqgV/JYmpECXZZxwWjRWGYVFo2S8=;
        b=EnBkXTVL2xI6MyEWpQ2+4ibV3EX1naC0FCIpT4ex5JY3Gk3Ep4nirWho2mFnTJvDOh
         UvvlqPo0HIq0Klc7xiIX3B1FOtUY4LmvSP6OeeyhWy1YYE8Ebw5qgJf5SAVURd2tjnjJ
         WvAQGbEefi0N9Kb5FDcPpAMnzS5l9JjdVNfWAmjP/g7l3YhaTZg/4HHEYZmGzMNfDUmI
         q6ehg2bmmqRZtvOXN2eTwv0qmdolY8XfujRyryyeXp7lFBRt0hjssuG9vku+B9YP9I6i
         ebo4M7rHzIQFfjCnCIYGwKLjC9+qskdj+7L/6Q89MipYe3WQRgwjSUlObTPQ2aRMFtoi
         dGjQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/4pWKpwGTuK3Tw7QLh775K8JOBkb/AVWu0pnsf9nu9NsohaXAUvCQzHk9iQl7f7H1dViayLyrIO6TPaU=@vger.kernel.org
X-Gm-Message-State: AFuF++nw8TQ5IWPaLldFzFDqkl+wHegjhb3w7J+7n5JoqIkAGEd9t/ee
	SSxzZ5z+b5x3lpVZ2L/p+LZxkCwHj8XLW+bsd5jLTIjfCIrsDZQ5Jwr6
X-Gm-Gg: AYBFou2GEdY63cNN/sDMO9BUAuTAiPUfGC6fgpKy+roQp8Q9adfLWJbz6iGqWBBUnFz
	jFrNgmHZA3YKb/93A7kU8iQoZyObpSFpsmtZAjgsWm2MvJxaM8UU9aRIsokN/51aZG3tlVXUJ35
	TefxmI8E7DvUMv102OhXCVGxntx1kolSnnsZ1hC/54cpyZO7KYHZ7M9AlItVEDzzfaLd8Pf9W1b
	dD4ArWzaCs6Ya9wduSnXWyNt0F6zAaWegOGFLZ9SLz8QTkFbvaRiOxeXiH3VJ+ttaKPYkNfqmjq
	sMlrljvYQmoh8nkYw5uqS/fMyhdJfYlVDWka1wpSRb4859h1dHK6htWTNn0urMJVUOkalgxyxhh
	p7z16INFituiW7DzSaCDkAKd/eRBfyyuW4HemLx4FsusRHchHdDRu8yMxSwuOnvSqR8Zt/6XnK/
	FL679znr6ubyz4C9xonM2+3qm1txd5Mqw4rgfvH6LMIDjTMxaaNdHYbPWsKGGLTTGhLgIHynnjf
	OuDiyVAn8YwwJE0nyl6bhxlNf0tUj/zIq/YT5T5vAo=
X-Received: by 2002:a05:600c:198d:b0:49c:fa21:1c7c with SMTP id 5b1f17b1804b1-49d1ed0b452mr66471895e9.17.1788966898403;
        Wed, 09 Sep 2026 08:14:58 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49cf755c22esm483644155e9.0.2026.09.09.08.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 08:14:57 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Johan Hovold <johan+linaro@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Michael Scott <mike.scott@oss.qualcomm.com>
Subject: [PATCH 2/2] phy: qcom: qmp-combo: check qmp_combo_com_init() in the typec callbacks
Date: Wed,  9 Sep 2026 17:14:43 +0200
Message-ID: <20260909151443.10276-3-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909151443.10276-1-okerixx@gmail.com>
References: <20260909151443.10276-1-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qmp_combo_typec_switch_set() and qmp_combo_typec_mux_set() tear the common
block down and bring it straight back up on an orientation or altmode
change, but they discard the result of the bringup:

	qmp_combo_com_exit(qmp, true);

	qmp_combo_com_init(qmp, true);
	if (qmp->usb_init_count)
		qmp_combo_usb_power_on(qmp->usb_phy);

If qmp_combo_com_init() fails - a regulator, a reset or
clk_bulk_prepare_enable() - it unwinds what it had brought up and returns
an error, leaving the clocks disabled.  Both callbacks then carry on and
qmp_combo_usb_power_on(), and dp_aux_init() after it, write PHY registers
with no clock running.

Propagate the failure instead.

Fixes: 2851117f8f42 ("phy: qcom-qmp-combo: Introduce orientation switching")
Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 7d740ed0ce16..44b6f29926dc 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -4924,6 +4924,7 @@ static int qmp_combo_typec_switch_set(struct typec_switch_dev *sw,
 {
 	struct qmp_combo *qmp = typec_switch_get_drvdata(sw);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	int ret = 0;
 
 	if (orientation == qmp->orientation || orientation == TYPEC_ORIENTATION_NONE)
 		return 0;
@@ -4938,15 +4939,19 @@ static int qmp_combo_typec_switch_set(struct typec_switch_dev *sw,
 			qmp_combo_usb_power_off(qmp->usb_phy);
 		qmp_combo_com_exit(qmp, true);
 
-		qmp_combo_com_init(qmp, true);
+		ret = qmp_combo_com_init(qmp, true);
+		if (ret)
+			goto out;
+
 		if (qmp->usb_init_count)
 			qmp_combo_usb_power_on(qmp->usb_phy);
 		if (qmp->dp_init_count)
 			cfg->dp_aux_init(qmp);
 	}
+out:
 	mutex_unlock(&qmp->phy_mutex);
 
-	return 0;
+	return ret;
 }
 
 static int qmp_combo_typec_mux_set(struct typec_mux_dev *mux, struct typec_mux_state *state)
@@ -4955,6 +4960,7 @@ static int qmp_combo_typec_mux_set(struct typec_mux_dev *mux, struct typec_mux_s
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	enum qmpphy_mode new_mode;
 	unsigned int svid;
+	int ret;
 
 	guard(mutex)(&qmp->phy_mutex);
 
@@ -5012,7 +5018,9 @@ static int qmp_combo_typec_mux_set(struct typec_mux_dev *mux, struct typec_mux_s
 		qmp_combo_com_exit(qmp, true);
 
 		/* Now everything's powered down, power up the right PHYs */
-		qmp_combo_com_init(qmp, true);
+		ret = qmp_combo_com_init(qmp, true);
+		if (ret)
+			return ret;
 
 		if (new_mode == QMPPHY_MODE_DP_ONLY) {
 			if (qmp->usb_init_count)
-- 
2.55.0

