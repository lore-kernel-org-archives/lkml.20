Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792758918;
	b=FPBkWDbOie43m2JeHl9KSHkqnz3paQgEpln0TJt9hNi+55FgkUFl2ufBO6AKMp5aMOER
	 P34+RopTGvGDOVmIMi44CsyLqHFYW5MhDxoTEwSHaTP5iblNLcT/1oMrLzmp14DVzLgZI
	 SpACCEa9oTd02YgbXqigOFwGHlSUZADKiIRFesUJzoBDJ+BBBRg2gTHeQatYrVXcfRdVK
	 52Ylx5F6WUTDgKqHkv7G7c3QJ4+5sEGN5Rsbs+IRwuF9rMlKf0YDnDIyURkNFc3PMaMsN
	 mWK6weBIa8aipeyr1y3YQ6oDr8X/cY+b9Mz4bP79xMQQetktIWO11j0Yr/jIWxY2rAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792758918;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MqyQtE1h9yD+Uynuj0QWyaJV566vcpdQv5oWHCYlWoE=;
	b=SHVZKU9whlRw0eIf1np4tUipZNhxdb1GVJhcavwuluajBerLIvCabx8p81i1BoqauRD7
	 1+JhUMO/2qGirLJfRXsvFNd2XuuyjcvfggAmtb1qOTG+OMHO+9U9nNuh00dwBd8XJBuiX
	 hJ19RQcrc7SddQsdxOPGnqwUAQy2qCxcmOEbQNZc6eFqjdGDzgTIMdTyCMGb1pjirQLC+
	 gVegEiQwquNQdhOa1wwfQGIMQ3B/JgnfmQev9mv4siBM4SHQrPO0EcOpH47Td8r37TMXz
	 cVoBxVtvJk74ilSr27vNVPMPj+kFztW7K0oyjbUVKFdpYpnPvI1EvldnvPb7GtNnByA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dqrxOdjS;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BE9606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:35:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30BE9606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dqrxOdjS
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cd61a2dfd7aso215274a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 05:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792758917; x=1793363717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MqyQtE1h9yD+Uynuj0QWyaJV566vcpdQv5oWHCYlWoE=;
        b=dqrxOdjS3l+s8RthfNOi7Tu/0ignoAMOFflmDH60BDOIbFqOoMMskTsFsw0Jm60SqU
         LsAHLl8wj6vHjuh5cS5kvUQGubE35ffVqxnDAlMNnGhvXfAdAFJh7I/kvGcFTSj/0LWt
         3YarO9NlqkAt/aALB91wfqnlgm10116MxvvxMFmktw9LTEv9TI2iowm3TGLjwHduNztX
         fenwsXFKHfLSNksvKQvkpUyoBYjmla4SyrOMifFhOoRLAkcQpHz2XNFddXCfqod1ARFH
         yohqeiJ8GKpoAi+XIIpgHQ0TN/JEDd35PuUrslPWIVObKtZFUI9bEadVrWLbbLdiFV2V
         57Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792758917; x=1793363717;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MqyQtE1h9yD+Uynuj0QWyaJV566vcpdQv5oWHCYlWoE=;
        b=LRASJqMGzqAsWswNv9KEmrJffIKASEckJV2e+g2/6kw97KpguLeznvl0YANsnAGPMj
         Ysu8OKccCcWxmvHz+N47dZ3zUIbnLHMZxxF3Ewdx48DPOFHAIdquEktd4lPZb5VSHBmC
         g2sGL2yoRzJM9IjULkaW/EbvGdlNqMEAfybCy3UQOh5DhpCxNsueWsJ3vk2FfBUySOhx
         SvdT2b8y0OU7zyOewjcwCUVVVRZTLvHvAtGPN6LSHyrcHFaAVGYuOz2Em51qM5SObG+L
         X/FCfd2AlhvN6Iimomd3zuTorZyJuOy/ReQ1QGqbM7kd8HYyh4vcYZErZuQOZWyXAPt2
         5ncg==
X-Forwarded-Encrypted: i=1; AKwUvBylj1rhzDs316S8KOZtaJ8RSspD1MrgaN8F6CEP9+zt+bUpd1lGJxHs6GYQjuZGydMr4dcB2GT/ZefuHRw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLkK6AOu3IIDBCeQcc9w2qFmtiRjvzT4vx+Qb/+6J6sQlaO3kRW
	+SMol0R18wHZn6+KT2tf2/02sa2DKuIstIERy8NExJB9y+cp6gyaxT2s
X-Gm-Gg: AYBFou0TtIkowREzEz8z0BHvTeKH2C+XtGT9qpvIjm756nAZa8Xw0M480yhcqFRLIHm
	Ec8RWzYHl6CZLPsudhr7jf9Ows4zlDx7N4RHeeCfTIHEYnga2r7WbxNR6M+dj/Mb234AtSJRYvz
	KNOHHR9c0FNlveo8D6vyz6R6jJA5sNUY2b2o4JRnB0bEOwkcPG+5OJrXBr/HpWpj2dG5Ivo5xl+
	LTmVqDGxqKaAIiECWafPPfzM+NhaKYGPMOvsz4VsTj6loLDkGV480JygQZrqpucnAc1yF5wRsht
	SOOOdMTSITJJh0igF9F/5CVRwhHy2XPPrEuGx8RFEqImaMnEJ72mUjycwHZR4j91ULFb1Io+y+G
	TdKr4awUkPgzUA2f6ijNo8USGRktm2i+gFSgF8OOFlwiKNt8Q1PmLqLyfD1ml8LPZ2lVlbxgQ8S
	v0GGcO1jVLG0tJmV7hSaPPfHo5AeRjnLuk81PeQDzBVWXmx3RDNzwZfPEq2CxzuC3KbVIx9uvuL
	nDmGnsOC4Alw8+XNOWlCTiNuOpTkykvwSXHbOo/Uw/SV7+IW8eh44Zf6onacWMSKS0pNvc=
X-Received: by 2002:a17:90b:3810:b0:3ac:80dc:f40a with SMTP id 98e67ed59e1d1-3adce5ebc38mr1652472a91.16.1792758917389;
        Fri, 23 Oct 2026 05:35:17 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3addd7fb873sm129139a91.7.2026.10.23.05.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 05:35:16 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: vkoul@kernel.org
Cc: neil.armstrong@linaro.org,
	mani@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	val@packett.cool,
	wesley.cheng@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] phy: qcom: qmp-combo: Leave the USB PCS alone in DP-only mode
Date: Fri, 23 Oct 2026 21:35:12 +0900
Message-ID: <20261023123512.1912-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
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

In DP-only mode (DisplayPort pin assignments C and E) all four lanes
belong to the DisplayPort PHY and the USB PCS stays powered down.
Three paths still touch the USB PCS in this state:

- The USB controller can exit and re-init its PHY in DP-only mode, e.g.
  across a system suspend that loses power. qmp_combo_usb_init() then
  programs the USB serdes, lane and PCS tables over the DisplayPort
  configuration and times out waiting for PHYSTATUS, and
  qmp_combo_usb_exit() resets and powers down a PCS that is not in use.
- qmp_combo_typec_switch_set() powers the USB PCS off and on when the
  orientation changes in DP-only mode, e.g. when a DP-only sink is
  plugged in the other way round while the mux is still in DP-only
  mode.
- qmp_combo_reconfigure_phy() powers the USB PCS off again when the
  port leaves DP-only mode.

Skip the USB PCS in these paths in DP-only mode. Keep the
qmp_combo_com_init()/qmp_combo_com_exit() reference and usb_init_count,
so that qmp_combo_reconfigure_phy() powers the USB PCS up when the port
leaves DP-only mode.

On a Lenovo Y700 Gen 5 (TB323FU, Kaanapali) with a USB-C monitor
in pin assignment C, resume from s2idle fails with "phy initialization
timed-out", the dwc3 resume returns -110 and the following xHCI resume
hangs the system.

Fixes: 896277138c13 ("phy: qcom: qmp-combo: register a typec mux to change the QMPPHY_MODE")
Fixes: 89563a152973 ("phy: qualcomm: qmp-combo: Add preliminary USB4 support")
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
Changes in v2:
- Also skip the USB PCS in qmp_combo_typec_switch_set() and in the
  power-off of qmp_combo_reconfigure_phy() in DP-only mode, as the
  Sashiko review of v1 pointed out [1]. Since 89563a152973 the mux keeps
  usb_init_count when it enters DP-only mode, so these paths see a
  non-zero count there.
- v1: https://lore.kernel.org/all/20261022165219.1368-1-26rote@gmail.com/

Tested on v7.3 with the qmp-combo mux changed to keep usb_init_count in
DP-only mode as in phy-next, on a Lenovo Y700 Gen 5 (out-of-tree board
support) with a USB-C monitor in pin assignment C: s2idle resume, a
replug in the other orientation while the mux was still in DP-only
mode (qmp_combo_typec_switch_set() then left the USB PCS alone), and a
USB 3 stick afterwards, which enumerated at SuperSpeed. Kernels without
89563a152973, where the mux drops usb_init_count in DP-only mode, need a
variant that does not count the USB user there either.

[1] https://lore.kernel.org/all/sashiko-outbox-181846@kernel.org/

 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 28 +++++++++++++++--------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 187f0cd11f6c..f1b565852caf 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -4459,10 +4459,12 @@ static int qmp_combo_usb_init(struct phy *phy)
 	if (ret)
 		return ret;
 
-	ret = qmp_combo_usb_power_on(phy);
-	if (ret) {
-		qmp_combo_com_exit(qmp, false);
-		return ret;
+	if (qmp->qmpphy_mode != QMPPHY_MODE_DP_ONLY) {
+		ret = qmp_combo_usb_power_on(phy);
+		if (ret) {
+			qmp_combo_com_exit(qmp, false);
+			return ret;
+		}
 	}
 
 	qmp->usb_init_count++;
@@ -4484,9 +4486,11 @@ static int qmp_combo_usb_exit(struct phy *phy)
 		return 0;
 	}
 
-	ret = qmp_combo_usb_power_off(phy);
-	if (ret)
-		return ret;
+	if (qmp->qmpphy_mode != QMPPHY_MODE_DP_ONLY) {
+		ret = qmp_combo_usb_power_off(phy);
+		if (ret)
+			return ret;
+	}
 
 	ret = qmp_combo_com_exit(qmp, false);
 	if (ret)
@@ -4511,7 +4515,8 @@ static int qmp_combo_reconfigure_phy(struct qmp_combo *qmp, enum qmpphy_mode new
 	dev_dbg(qmp->dev, "qmp_combo_reconfigure_phy: switching from qmpphy mode %d to %d\n",
 		qmp->qmpphy_mode, new_mode);
 
-	if (qmp->usb_init_count || qmp->usb4_init_count)
+	if ((qmp->usb_init_count || qmp->usb4_init_count) &&
+	    qmp->qmpphy_mode != QMPPHY_MODE_DP_ONLY)
 		qmp_combo_usb_power_off(qmp->usb_phy);
 
 	if (qmp->dp_init_count)
@@ -5087,12 +5092,15 @@ static int qmp_combo_typec_switch_set(struct typec_switch_dev *sw,
 	qmp->orientation = orientation;
 
 	if (qmp->init_count) {
-		if (qmp->usb_init_count || qmp->usb4_init_count)
+		bool usb = (qmp->usb_init_count || qmp->usb4_init_count) &&
+			   qmp->qmpphy_mode != QMPPHY_MODE_DP_ONLY;
+
+		if (usb)
 			qmp_combo_usb_power_off(qmp->usb_phy);
 		qmp_combo_com_exit(qmp, true);
 
 		qmp_combo_com_init(qmp, true);
-		if (qmp->usb_init_count || qmp->usb4_init_count)
+		if (usb)
 			qmp_combo_usb_power_on(qmp->usb_phy);
 		if (qmp->dp_init_count)
 			cfg->dp_aux_init(qmp);

base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
-- 
2.43.0

