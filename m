Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F1E3B995D
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 05:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791610393; cv=none; b=mvLXY09BfFSgsZCKMEoneozIY0GDK4Gtpvf5z1C24K+LwX+iS2Jr3Gyr+TSfPjvdnKoAT9L20xT1ZHG3+xs2lFMZPMSrL/0aT+bJCpYMgpZeGPTbT2qWpMN1npaeeHcw8T/oy3CQGNn7JeEiFcEBGf1kCHjnFzS1MQIOcadY6Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791610393; c=relaxed/simple;
	bh=KwPkXKwHhY0MGsm9sQ6jA/6OmjR/oIXJK6V7dFaiufE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sRErYqhRPC494O38NlTIQdMPeCnIVws+/vOL/hlks/p3vWglXnfeRXHOtC2XwQVmzKt7F2mEWzNBgNkJJvXUtDyy3nFT4jaIsA9joc5phUIWnBMxSE50JrRNFKgEk76Kr/rzFUIxvV37rU9KtG4/xymxh8m8BnTPvL7yhTImpyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ck4l1rOd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HMav1lfT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ck4l1rOd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HMav1lfT"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69A3PtYB3692470
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 05:33:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KgcDUP83Bl5
	a2s5ql/jyk1n3BPOJSPT0F3Csq2uM3lY=; b=ck4l1rOdaOSCD2cGuEfmSjZIYpE
	l2va/9M0i5NRozCw9gdhYA4KtPMr2zfNMIYwgLqh7SbvK3TWCMhiqrK2WNqmAk+r
	f/0rGBIpq9Y273LNwh0tUFxGqIy2jXf5OkyAQ/8yah4BIUmgNkDcotA8laSm8qiB
	M0CU08lC3Oi6qWbVPMrnRqm1G73aPebQlK99z48RxVKwIeOjQW4sELdg2NF/Omsr
	Epk7IStiTZTOoi0xBuXzWAnP2MKCWVUFhO0dZsTon8yK6J+0h04bNTa0SApioQ3Q
	+brEl6YriKafBuK5bSVgL7q/fO/klbBKssI/JM64SBB2JETVS/1UONoJCOA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7deug832-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 05:33:10 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-88a10162189so571799b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 22:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791610389; x=1792215189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KgcDUP83Bl5a2s5ql/jyk1n3BPOJSPT0F3Csq2uM3lY=;
        b=HMav1lfTdl2xm8Nmd4zrMxUbA9PUbbvmsjC2Hf/IEmkiPRFrRfmMJTxQGiadWiOxlR
         JRDkrJ502qoc0hn/YMWVa9IyBhYiiXGGmIeIkMAywvnWcNqvhPHnkMeilB6TKbRo3dZH
         Ovk0pxsL6w6IAAWxaYIUjqMn/DQ58EZzvt26ke43qUIh/fSznrJXyIHmir6mKyEtND8t
         gg3KsdPkroWTVF85LgU6gVMgaIi2F6RXD1jaJWJYtBTXPYieBKc1thfaSEPMFTkUNZSm
         dfx0xjjpRjHh40VUq2gAs4Yj/JRVyaw/OhbyemMOwao4s3wwI18wkFP/twgRAEynF6VW
         Fwvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791610389; x=1792215189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KgcDUP83Bl5a2s5ql/jyk1n3BPOJSPT0F3Csq2uM3lY=;
        b=cQ1siUjqKAqcJN7zDsQ9FWrBMSQlHTbjGXNwwXtX5/xMOy99NKc+LB0QZS+dpHGnuD
         J93OPZ6cLgpRN0uFOtIZBpC6GgXMEwTdRWB4bgalFyKWlfIPkScOe8zKRrko/W8X7KNd
         o5czKpSkbR9ydSgAPWmrO6669dMdaqUSzO0S7iP1kc5B41YO8Kn/au5Yowd/AqiuYu6E
         yTlxSBm6tqJvpC98lsB4kaJb5tyH81QDBoncmfLN+TEfOoXh8UHAnkjjxMiVFjUtlueU
         geGJc7Xv46Iotjl6MX5PX3Pfvy4qfmnh5PTO9sWKot4XTNgLcQnvcBNBqN0KpoGobgDF
         PtIQ==
X-Forwarded-Encrypted: i=1; AKwUvBwXa4RT3Q54zRnfhXf8aeO4WGAnYhwcj5PI5c85nBu7e9eEryRcnySgklrFRfeiVa2246GMLE0LkCSP5VM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJsU/XNGAgdEUGAtApmdOKwsd6r4h9ZsljA9+JQzv57zDD77And
	PKSLqGFxaRbLU9ZZa8Or4pjVwAX3/FDdHF0SfzND6GZTY17NzQwR3EFPkd0WUhcaeGV4H+89Dzu
	qd3qEUx5USvu7AT+ZD096Whkh4BRKdLv1KNfdGb5Ll1/sqXDemLsTcHobfF/w/axGSBs=
X-Gm-Gg: AYBFou3WhHvtmVlddAV+JHAb9ITFypGWBUpftBdGCoZmrdP1TRhOEV+Gywdw/Nzcump
	ibKMQAifDL302witxT0SA5ii+knZnE3Oqfy1j1btU9L9gC7v01CGqACaU17sC5WY/9fSFpZ3s5i
	lcC4b7aQjAN8vmnI1cQCIGdbMuOvxfcNptGXqIckBnBqQPoOtjw4DSaX9m0IWoDaEIm9GXnfLMA
	ozrf6Ww/gRGHn+snOSbIJRpxPbyQzae2y1o9Qy0nQmLr28fTm1vHqmSurIJlBy/H9qQyKOcYLs7
	dXaR4nOhxAItJSotGUVG+tzZDk7DQ74e4NFfJz2g8Ge6PEeqrsoAmL4z1FB2vlR9COMRFh1V7fW
	vF1HM1wth08VgBMbMAhzStr3ovwjXQg8=
X-Received: by 2002:a05:6a00:2793:b0:874:478a:f7e1 with SMTP id d2e1a72fcca58-897c75e83e9mr3158489b3a.25.1791610389514;
        Fri, 09 Oct 2026 22:33:09 -0700 (PDT)
X-Received: by 2002:a05:6a00:2793:b0:874:478a:f7e1 with SMTP id d2e1a72fcca58-897c75e83e9mr3158475b3a.25.1791610389076;
        Fri, 09 Oct 2026 22:33:09 -0700 (PDT)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89928fd8469sm174028b3a.61.2026.10.09.22.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 22:33:08 -0700 (PDT)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        mathias.nyman@intel.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, p.zabel@pengutronix.de,
        wesley.cheng@oss.qualcomm.com
Cc: sriram.dash@oss.qualcomm.com, jack.pham@oss.qualcomm.com,
        krishna.kurapati@oss.qualcomm.com, shazad.hussain@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Subject: [PATCH v3 1/7] usb: dwc3: qcom: Keep wakeup IRQ enable/disable balanced on failed resume
Date: Sat, 10 Oct 2026 11:02:40 +0530
Message-Id: <20261010053246.2991984-2-faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261010053246.2991984-1-faisal.hassan@oss.qualcomm.com>
References: <20261010053246.2991984-1-faisal.hassan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: HPyGonRGP3_9W_XG2a-YUlN0PY0Bt81O
X-Authority-Analysis: v=2.4 cv=Aud7T+9P c=1 sm=1 tr=0 ts=6ac9ce16 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=ZXqkfniAK1spq4Hy8MUA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDAyMSBTYWx0ZWRfX4aqQ1aHeSO+v
 A2cgqxgXHZX8PMWV/phPLVZSNKKnIriO96O6iJqIiqUIU1BaueBXsBzAAGjbCS5GYOKu8wPmGia
 zrmGnyfB7Y3OJuhNWwF2s4a980TVOGI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDAyMSBTYWx0ZWRfX2Yv41+9yiixh
 /ZZZIiNlFh3pZH4b2HJwZ86/qseo6lusw8iGvVHd7/U+GqEaqg6N7oP33arXLdc6xP89fdQKQYr
 HGbuXZZx+YfV7t3l+xg4pnRc6L0+n43KKRvZKRl07UdHFQR7Rj+tuijZ7RUdgd02Lo/+GSe1cE6
 LhD6c8Rn9iwCEhUm7NT4nEG2zSa4s1EWjIgA2XPrcVXc3RPfgUHeCxy0HULm9Ur0vdhf6x8EAAW
 UNqf8zT1wXtbK+/d8ExSRsyOL6JWSFxyrziTLW+7O21rvqlhMKYV0xaoxOePFToWxb5sI/UZnrX
 2CqCvbKTJkBAeBN6/8W/u5oq+vBWcGR3STKzB4+MPNgLKmCRkiErGbt2ODFAJ4NNSDK/r/AkNc5
 Hco+wRah+Zb+DGboqMGb+qiRZwjoKPtrI5Rg+zr/34TARSZ2mZNXHqJHWlbfTkOCiT3DGoGxOBn
 geU79hZfhQN+q2yjPmA==
X-Proofpoint-ORIG-GUID: HPyGonRGP3_9W_XG2a-YUlN0PY0Bt81O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100021

dwc3_qcom_resume() disables the wakeup interrupts before enabling the
clocks. If clk_bulk_prepare_enable() fails, it returns with them
disabled. The next suspend returns early on is_suspended without
re-enabling them, and the next resume disables them again, so every
failed resume leaves the disable depth one level deeper and host-mode
wakeup is lost for good.

Re-enabling them on the error path is not safe either: the
level-triggered ss_phy interrupt can stay asserted, and the handler
can't make progress while the controller is not resumed, so it would
fire continuously.

Track whether the wakeup interrupts are armed and make enabling and
disabling them idempotent. A failed resume now leaves them disarmed and
balanced, and the next suspend arms them again. Disarm them in resume
regardless of the wakeup setting, so interrupts armed by a runtime
suspend are also disarmed when system resume runs with device wakeup
disabled.

Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index d44f093ac243..d4fda4dd81f6 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -81,6 +81,7 @@ struct dwc3_qcom {
 	enum usb_dr_mode	mode;
 	bool			is_suspended;
 	bool			pm_suspended;
+	bool			wakeup_irqs_armed;
 	struct icc_path		*icc_path_ddr;
 	struct icc_path		*icc_path_apps;
 
@@ -323,16 +324,26 @@ static void dwc3_qcom_disable_interrupts(struct dwc3_qcom *qcom)
 {
 	int i;
 
+	if (!qcom->wakeup_irqs_armed)
+		return;
+
 	for (i = 0; i < qcom->num_ports; i++)
 		dwc3_qcom_disable_port_interrupts(&qcom->ports[i]);
+
+	qcom->wakeup_irqs_armed = false;
 }
 
 static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
 {
 	int i;
 
+	if (qcom->wakeup_irqs_armed)
+		return;
+
 	for (i = 0; i < qcom->num_ports; i++)
 		dwc3_qcom_enable_port_interrupts(&qcom->ports[i]);
+
+	qcom->wakeup_irqs_armed = true;
 }
 
 static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
@@ -377,8 +388,13 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
 	if (!qcom->is_suspended)
 		return 0;
 
-	if (dwc3_qcom_is_host(qcom) && wakeup)
-		dwc3_qcom_disable_interrupts(qcom);
+	/*
+	 * Wakeup interrupts may have been armed by an earlier runtime suspend
+	 * even if wakeup is now disabled, so always disarm them. On failure
+	 * they stay disarmed, as a level-triggered wakeup line could otherwise
+	 * keep firing while the controller can't be resumed.
+	 */
+	dwc3_qcom_disable_interrupts(qcom);
 
 	ret = clk_bulk_prepare_enable(qcom->num_clocks, qcom->clks);
 	if (ret < 0)
-- 
2.34.1

