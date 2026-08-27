Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FE54B04BA
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787853609; cv=none; b=eGD3GIreCQjX18wx/lQjcz1CKcSxXwugUYpkt9n89TEg2ZSiL2kA5HCxQPKy5l8xJ+FTSAaHJfxkkIq4SP2kh+3/UYDjvtpy8/O6/8X/ZkLdWlbxjq5q82M7hV8PCUMACF3eFTVo+7h8AVedGIIKmk9bP9XCemwpTNtwDaou+18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787853609; c=relaxed/simple;
	bh=FBDw/I4Waykly4lZ3CvAqJEIzFElSwmZ1beXrSZKiUM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cLKSXKjm4BrjFAcyNX6XYCaB+jcA3HVqZDpt86DUtN2mAMl7HEUkGeUCRnjFJAkRsi+IRfS8RGpVhmbip11Ky1ONv+UwvyV1+K4he1c8Q901aW5w0JOoLwTiLP9cqJoTDHjByBLuXKT41n/uvFV7cdooJxkD7huFA8gX0/aQ5P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pDQZIbHU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rh6ePSkG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pDQZIbHU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rh6ePSkG"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RHXlEN4084312
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:00:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B6gN3x8PKcm1sNfVijcrAK0H0yaVuRFKl9zQpFpFyM8=; b=pDQZIbHUJFoO0VNv
	eLtmuCZWX+K91CL/bR6Gxfkg3W00iGUL+3F8bY4OQ9aMJ+dUJfSXaPAcAOUo70x8
	kfJaERqNh+dD5h44D1P1of3B76gFEEc+xyfid8SvrUtgEKnK234l55y/URLtWOXU
	hz1MLLB08hffmyiExn94SkWFcdBWI5PC8ES1q33DxkTDF5IBs/AhzziPYglDV9ux
	zYpWLLfCVT1NB4RgoljWFcjRuxsOTokKAdmE3igRN97keIM4En4oSlAraqxL0Kn+
	Y6793eJlXfNSeTn2Ekwfm12EnyTZEGGu/dCuDqpCO1ZXaRs9SHVUk1nrsL+eiDhz
	WjhGqA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4game7svgn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:00:07 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc132709c76so271127a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787853607; x=1788458407; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B6gN3x8PKcm1sNfVijcrAK0H0yaVuRFKl9zQpFpFyM8=;
        b=Rh6ePSkGSC3x4Cbr+C7J27OFe+tawd9DKdBzkK16Wk2qurA9ZhGbVg6QOXuyvOCsDx
         pQaGfpYKFtAVYDPq3NDiXRQYlxhGutk4VYtt0e7KGwryKtFpXkkVDiiFsEa6JnLrp8Ye
         kMdnNSvJnKqJVY7b6WRUazafTd2NnIW8tJRFvwxRF/9NOGE3hL1A9qNycU+yV9rD8NTw
         gAz0SnH+z2Yq1E5OdccdJoptyAs5E56Q+57583vBLwQ8N18EpyyT7CB/do0HhUQ4OUJN
         dRIKPkZkpIpAp0eKpF6r9+8Ab1OPveb94pxLFfkI8o0XGs760K1U9CDRMGTn83MLynF2
         a6rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853607; x=1788458407;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B6gN3x8PKcm1sNfVijcrAK0H0yaVuRFKl9zQpFpFyM8=;
        b=pDlpvGBdu9dJP05pg5fsEF/KMhRlHtSawWRJxMxcNhMyp0OLDeCbxUNmvkh+9rJyah
         vcHsaC5DuNKsZcfkoperncJojSWO/1WZICXrMRD6zjBrBs/jpZfw/Z5iy1gs15N34wq7
         w7zcQT54kmWX4Pq++9ktxGp5YhwYpRs2G3adR2yQoh1PPsuspbjNtd3jBJtvOGRP/mHF
         mBoohEMiqXHfpMN1fMWZzx4iampvoEC/cdqPL2RQLGMTSD41U6n9ljNLxfrDsyZxwmV7
         A2w7qIcSQpvk4C/ASMBqdcMNq4zdn/WU+WoQq2wCYruQ0pkuI829GGAht4r/0zoS8/ZC
         x1HQ==
X-Forwarded-Encrypted: i=1; AHgh+RorPQHuXTjWK9Z5559t97o8tw6tuFZ+35dvJGVLqw/uOrTsqAfDV824leGLNLGUFDPd6fhkIkp0dlegU+I=@vger.kernel.org
X-Gm-Message-State: AFuF++lCupLREzva5dU5tn5ar5xFHd2fhvMimlro+Ii616TfqC6U7g1/
	5yzE0Fmo8LDTFgIm567JuaDiVt9tAKz5NTq6HGjLbwXtlIRhpAomEnh09iHwv6xaluZxEpyMsx5
	UgFmiqFJ/9aW0jjR+oxU2YaR2/qleSDRNKzTLqhTAsVCHX8/RSL0rhFcMnUmaCpTxyqI=
X-Gm-Gg: AR+sD108YOlvw2wyhFali/5jq4oPa54wSABBx7bYriYRhri3LXHZv/kDiZ22lQjyB3l
	OBHwWLpxN90pWGMlxYtBahGlzQRJYLhN7FNwuiXO0iVW0zTLE4pSSjQVXpIvn/j6Efyd54lvLOX
	+EVb8EF4VmybdylaKo3rkYJkZcDnBxk2QTr3ipBC5qRtwavbo6uWRzGjkR6hXjdoBewet+DCzRW
	sxSMmF/oWMw7JhRFziESR0Uxk5kcwhHbwK6FOqayGe9ApQfaqHq1eP40YPhlDX6lDlflpDHTX+R
	ShXjc923YMWcYA3ChwC/BtfDnofo+XTqKjcc5YCNewbDQdcmT9mMdeV51lFT3loLn0aRxEL/1xh
	4/9Y8/SrLJ1x8gfQWnMwhhXBJ5IgOeAfhBA==
X-Received: by 2002:a05:6a21:a09:b0:3b4:61f:1fec with SMTP id adf61e73a8af0-3d26668474amr1671817637.2.1787853606521;
        Thu, 27 Aug 2026 11:00:06 -0700 (PDT)
X-Received: by 2002:a05:6a21:a09:b0:3b4:61f:1fec with SMTP id adf61e73a8af0-3d26668474amr1671648637.2.1787853605873;
        Thu, 27 Aug 2026 11:00:05 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a905cf38sm27437523c88.12.2026.08.27.10.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:00:05 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 23:29:22 +0530
Subject: [PATCH v2 5/9] serial: qcom-geni: Use geni_se_set_rate() for
 source clock configuration
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-5-091697dbeb02@oss.qualcomm.com>
References: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
In-Reply-To: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
To: konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787853566; l=4351;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=FBDw/I4Waykly4lZ3CvAqJEIzFElSwmZ1beXrSZKiUM=;
 b=VgT+A7/GZ3REIZN+WvvXjm2mcwdMPEtOIvgaOslmKLbXnHIQq4y29ZStj5qCPOq4RYkmX7ljr
 HOmcb3nAFZ0Da7puZcMuSC0WA2YWZwrcgHSUyzzEkCpxqrXAY+WlvJD
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX8bzUH4Jd1m+v
 5Ghvhj65QUGiCNK8LvxlJvHMv7McNigstqGCXBSsgEs+XOXaR9QFBsCBGG5C8wpQLEAiExo38Q8
 cUGT39T2toSdLLac/enBInok95XD8SsA249zJ0e0oXuiG2Q4qKyw3X/k1uDXicxg4cDdvo1e7iy
 NqmyvSnv1hNva15xmi1joJgMG/jRfNtyeaL1uJjl2KLHArgwiGHTYW2JSnmW1P04fT3xThiK+qQ
 ZrvglRGPxD8RR+KQ4l8I5cGeiDiDGSJY7lp3u/iStxhyDD4Q2AChZgd54wk9pjLnaxyV+2n3Aqx
 +3NqqaDyppXYTzTUICkpzBO2GWTghcQTrIQ00vV81LeAFNA9/XYt+ismbJOq0tkQ4oLtYVlbf76
 hlBcPznjr1qJIea6tPGSEj2z57Xaeos7MXDcJcuZ8dJxACD+yWHuZps9irnuFSYjAyzhu1wcMTW
 WQTH54D8qzlKs7iv9XA==
X-Proofpoint-GUID: 6RoquH1D6oJ9ts19HMtKvpsVANepVZs-
X-Authority-Analysis: v=2.4 cv=Yrc/gYYX c=1 sm=1 tr=0 ts=6a907b27 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=_eeGUSGHzPgYkwSUgSAA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: 6RoquH1D6oJ9ts19HMtKvpsVANepVZs-
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX6pVxOX9gWXon
 46qHl610aWolbTzt5cSBhhs/KFAyoYOTCgjOR3UMHKmJ6IxiUTQZlxX8B9IqSMnqVWFN0esOxFa
 jdKZX0Ku1gVX1k2MiRsQh2KuNpfvduc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270151

On the SA8255P platform there is no Linux clock handler for the SE
source clock, so the driver has no way to compute the divider needed
for a requested baud rate. To work around this, firmware instead
exposes the SE HW supported source clock frequencies as OPPs on the
perf domain device.

geni_se_domain_attach() now populates clk_perf_tbl from
the performance-domain OPP table, allowing firmware-managed
platforms to use geni_se_clk_freq_match().

Call geni_serial_set_rate() unconditionally from
qcom_geni_serial_set_termios(), and use geni_se_set_rate() instead of
dev_pm_opp_set_rate() so clock programming is handled centrally by
the GENI core, independent of the underlying clock-control mechanism.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/tty/serial/qcom_geni_serial.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 3633723acef8..23ecd137c521 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -114,7 +114,6 @@ struct qcom_geni_device_data {
 	bool console;
 	enum geni_se_xfer_mode mode;
 	int (*resources_init)(struct geni_se *se);
-	int (*set_rate)(struct geni_se *se, unsigned long baud);
 	int (*power_on)(struct geni_se *se);
 	int (*power_off)(struct geni_se *se);
 };
@@ -1474,7 +1473,10 @@ static int geni_serial_set_rate(struct geni_se *se, unsigned long baud)
 
 	uport->uartclk = clk_rate;
 	port->clk_rate = clk_rate;
-	dev_pm_opp_set_rate(uport->dev, clk_rate);
+	ret = geni_se_set_rate(&port->se, clk_rate);
+	if (ret)
+		return ret;
+
 	ser_clk_cfg = SER_CLK_EN;
 	ser_clk_cfg |= clk_div << CLK_DIV_SHFT;
 
@@ -1513,7 +1515,7 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
 	/* baud rate */
 	baud = uart_get_baud_rate(uport, termios, old, 300, 8000000);
 
-	ret = port->dev_data->set_rate(&port->se, baud);
+	ret = geni_serial_set_rate(&port->se, baud);
 	if (ret)
 		return;
 
@@ -2039,15 +2041,19 @@ static void qcom_geni_serial_remove(struct platform_device *pdev)
 static int __maybe_unused qcom_geni_serial_runtime_suspend(struct device *dev)
 {
 	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
+	int ret;
 
-	return port->dev_data->power_off ?
-	       port->dev_data->power_off(&port->se) : 0;
+	ret = port->dev_data->power_off ?
+	      port->dev_data->power_off(&port->se) : 0;
+	if (ret)
+		return ret;
+
+	return geni_se_set_rate(&port->se, 0);
 }
 
 static int __maybe_unused qcom_geni_serial_runtime_resume(struct device *dev)
 {
 	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
-	struct uart_port *uport = &port->uport;
 	int ret;
 
 	if (port->dev_data->power_on) {
@@ -2056,8 +2062,8 @@ static int __maybe_unused qcom_geni_serial_runtime_resume(struct device *dev)
 			return ret;
 	}
 
-	if (port->se.has_opp && port->clk_rate)
-		return dev_pm_opp_set_rate(uport->dev, port->clk_rate);
+	if (port->clk_rate)
+		return geni_se_set_rate(&port->se, port->clk_rate);
 
 	return 0;
 }
@@ -2116,7 +2122,6 @@ static const struct qcom_geni_device_data qcom_geni_console_data = {
 	.console = true,
 	.mode = GENI_SE_FIFO,
 	.resources_init = geni_se_resources_init,
-	.set_rate = geni_serial_set_rate,
 	.power_on = geni_se_resources_activate,
 	.power_off = geni_se_resources_deactivate,
 };
@@ -2125,7 +2130,6 @@ static const struct qcom_geni_device_data sa8255p_qcom_geni_console_data = {
 	.console = true,
 	.mode = GENI_SE_FIFO,
 	.resources_init = geni_se_domain_attach,
-	.set_rate = geni_se_set_perf_level,
 };
 #endif
 
@@ -2133,7 +2137,6 @@ static const struct qcom_geni_device_data qcom_geni_uart_data = {
 	.console = false,
 	.mode = GENI_SE_DMA,
 	.resources_init = geni_se_resources_init,
-	.set_rate = geni_serial_set_rate,
 	.power_on = geni_se_resources_activate,
 	.power_off = geni_se_resources_deactivate,
 };
@@ -2142,7 +2145,6 @@ static const struct qcom_geni_device_data sa8255p_qcom_geni_uart_data = {
 	.console = false,
 	.mode = GENI_SE_DMA,
 	.resources_init = geni_se_domain_attach,
-	.set_rate = geni_se_set_perf_level,
 };
 
 static const struct dev_pm_ops qcom_geni_serial_pm_ops = {

-- 
2.34.1

