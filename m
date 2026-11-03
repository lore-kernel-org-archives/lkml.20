Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793713854;
	b=NZEuXj0A8/I93xxChBiiO2YCenVcbUbbrKBpvvUhjjwkfBNdneNbD+3UVCFkUDOYaRQJ
	 zxGso4zqLZs2oHZTcBpMIcg9132JHMDRtQN0ZCD2fVBLwuaWjsNMi8Ykv4U4ZI/6wqTml
	 +yIgxxpk2cTKfov0odSQmIZjaVXNksRgw4PuWgxyNz97UFUXC4jUzqQgEMe3hdoTY1S0G
	 +IFQ5X70dUQzlLUhKnNLkhwCATSeOfIH1qp/1XHre04XNDXWv08nxUsRYqYVL9tK3Mp9g
	 oyvflFsuRR6voMuwZewrPGg3/5vGOJ1ZnFZFLIK6Cp3OfWgQn4Ed9J4Ti34UkOTCG+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713854;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3ocX26OOcgyW/a7Ke5hFuvKM7A1eBK7k3voEhoZoCQs=;
	b=uVGYnAkKz24ioCNFZSCK8EuXN739g/UkxqFhyAsTxnt7TJ8ZctGuRRsjY/e4oj4aXl5n
	 j9PjYKBqD+ImSb4QV7z5FDyOZw3ZXjLuvYbK/jv5M+0exEQtZva0VjEu4EmKTQxL0ADDd
	 4rZpvgQptGvrrM/MQVZNDmeaxkvCV1petUn1MZCd+6i+xAKbqaKo3ZKASrIMZlpH9VDdC
	 6K4jwDGTqipptfIT6R1Wdg1p3cUKcdgOQKESHLzXc5+WyJfXWH52GjxQC7sP0+jWgl365
	 UnK0vmI7FbpSaMriTGU88x1uk9f1bPE2UIpXbY5npOtVvl+o48YnU4iN3ACrKE0MCxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=delYMtwG;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9636606D83C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:50:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9636606D83C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=delYMtwG
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1a2761c69fbso7120115c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793713852; x=1794318652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3ocX26OOcgyW/a7Ke5hFuvKM7A1eBK7k3voEhoZoCQs=;
        b=delYMtwGTqYS7f0IlLuOXyVktSrNGiUXD76DSBtagvGOQHEGAQ+yN5T2/bltP/StHn
         3DN4DpB+Nbob90iMlcL0IKT5T97zSVAhCPJY24vgD/f/zoCrM4eAUn+j4WzeOK0/CttI
         OFPYxMUP0TC+QJ9HhYEcMU/8gLkymTqKQnIcD8sO29qhX0EfLvJf6LygobZYFhem1EKH
         v+aL0LxduTA2gNTngbL6uEf2/LgAO5K0TqyueKv7xTObm4S3a9X8bK0Dbid5K/4y4xQx
         0StQFV+QdynEoMuTEKpoEMHy7ixuwwZtLODE0rhEGPH9Q8/etFpddKAZdSMLdEiAILmu
         6xSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793713852; x=1794318652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ocX26OOcgyW/a7Ke5hFuvKM7A1eBK7k3voEhoZoCQs=;
        b=1YXxUMkGWtzOQqcfpHv4dzqLIowLK3DZjv+YDxYptsiNdIJbd9QeHtUT/WJjyamNoC
         IRkDBBvTROohx0yoHBYplKyE24Db1gLLDX2ZJ+gxZnHI1oYSrtSFg2OtrDedeOwZtxDR
         kOADNVsC0b5gobshJ8DY3zlZHyl4tVdZpP9mUNi0+J1/y/hlqELLFqCMYHnM9kqN8d9D
         iDfTfY7SYgQbKH+mzOBK/c6X95XFNWL1aapK+TlR0fXgLEDEnFyFRFAbrqTf94K4nLpQ
         0ATkfaWwFi+9AbD0Ebuz9MC8tJ01Ell2bthiyL31aFuegLMgqa0oq3VkxmtAjeNffrUk
         4hJQ==
X-Forwarded-Encrypted: i=1; AKwUvBzTQZel5lQKVI2y+tVJtTWifnInXN+n/ASpTpxuHY7DZD3pdFw433Dr3Bsxoo5zCojXmsFeeU9ftjbh1N8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+RjYVShycN2KTXWBnh7cGMcNr6DCYGHY9SaO6s0Kqzbf9SynVX
	Sk1GHYxaGZDrnEk0JsI4H59Yj3Gsf0+rj/gHM/XB0yB5wWCdbJF+I1d/
X-Gm-Gg: AYBFou0UfxgmW4aKaTJ8kZMAiYMMSN/lXAEfOPsroemi1QQbU/oUL5W4skaSsVu5TyT
	/0/ohp3yE0apcGUL4fl2PIM36xSvyGQbdoSzwpJTxgANP1P7lCtyAAYwqgPtlsxk4obDzkGrPeO
	8aOB1W4boHUr8TyGkKMXWuYq4S9Ds8vMGQoJRcTIry85NjRdzAe79thYXcareXsVIjGGeMs+jSn
	lNhJ8BJ0A4A6fOldHn1OEmmC8euQ3/IY6pIy5rpzFiGDoo+I5mtp2EwRFRPYP+WpQ0fb60uzK3i
	OqnA8LEGWs7Drk9/BSTmsFQElDcN0eMv1mJSGlmGj7XQO7iUedrdLF6Iadp1TrKo9nGVYA/2xw/
	JOnb+gNcV4SCbZ1Ki+HrYPokdnY3b3IWj2clXfC1H0d5I/hN6Ohi/9uWQ01fL4s8E8MVHBnd3HE
	fNT7dYT20cTx3EtUJxJwIpUVE7Nr828toqYea7y1JyYEBq4W18IMz0HnSRWTk9k65ZlyarZ5/Cr
	ngF4rh8rZeTyfvoPa7z2btbGW+HI6Q74jz1ap/YBavcKBeOmL/Psp+jGjyZrYNvk0g4iS5MiVev
	kTEDqY2R4BnyDX/iwSNMC0Gqp95oEbgdiDXRA5E/ljCcug==
X-Received: by 2002:a05:7022:1113:b0:1ac:9da7:e86e with SMTP id a92af1059eb24-1ac9dc67128mr17912610c88.30.1793713852224;
        Tue, 03 Nov 2026 05:50:52 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1abcd6f1sm42222184c88.20.2026.11.03.05.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:50:51 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: vkoul@kernel.org
Cc: neil.armstrong@linaro.org,
	mani@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	val@packett.cool,
	wesley.cheng@oss.qualcomm.com,
	abel.vesa@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] phy: qcom: qmp-combo: Leave the USB PCS alone in DP-only mode
Date: Tue,  3 Nov 2026 22:50:51 +0900
Message-ID: <20261103135051.1668-1-26rote@gmail.com>
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

The USB PIPE clock is not available in DP-only mode with or without
this change. For USB, the only visible effect is that phy_init() no
longer times out.

On a Lenovo Y700 Gen 5 (TB323FU, Kaanapali) with a USB-C monitor
in pin assignment C, resume from s2idle fails with "phy initialization
timed-out", the dwc3 resume returns -110 and USB stops working.

Fixes: 896277138c13 ("phy: qcom: qmp-combo: register a typec mux to change the QMPPHY_MODE")
Fixes: 89563a152973 ("phy: qualcomm: qmp-combo: Add preliminary USB4 support")
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
Changes in v3:
- Correct the last paragraph of the commit message. Drop the system
  hang: it needed an out-of-tree dwc3 change [1].
- Say that the PIPE clock is missing in DP-only mode either way [2].
- Rebase on next-20261030. No code changes. Tested on v7.3 as in v2.
- Pick up Reviewed-by from Abel and Acked-by from Mani.
- Kernels without 89563a152973 need a variant that does not count the
  USB user in DP-only mode.
- v2: https://lore.kernel.org/all/20261023123512.1912-1-26rote@gmail.com/

[1] https://lore.kernel.org/all/20261102220456.1687-1-26rote@gmail.com/
[2] https://lore.kernel.org/all/20261102220450.1670-1-26rote@gmail.com/

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

base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
-- 
2.43.0

