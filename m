Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FC34EC65E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449952; cv=none; b=YBri6IJmx2Cqzhi9TvFngHwZe0h30t46FEmuYHItUFaR7mriryrtyrm/bl15R74qbsfZpOYhv7pUD37AEEwvA0pAn2es07P8018T55oQIu9ZhUY1qy3V/JESHuhvnqAVjOmSKx8xr/wNlIBnPKsSkVF0IynP4V1tSTmhQLtCf6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449952; c=relaxed/simple;
	bh=xjwKwPBAoS+oJeXPhEfFoGavfUt9KF+S7kYGFE2+60o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gYYYvRf+qmDScBdLhNB3FyRsuGjbxwlsgSZ+CUYaopcm6enX5bn4vfCNaeiaTvsclFXy39TMgBgGn2+z5Bqc+7IPrBaLp7zEK+rTzqHvFyDEXPnm6/F9SIkgmTqzapiJRtrLyLhHKe/YCpxX1k9F5zF7lF7MjgDhCxcLRmmKmkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=htH1XWM4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gKmNKuyP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="htH1XWM4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gKmNKuyP"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DAg974158268
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 15:39:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WTCQhZSlp6i
	Q94A2uQ2RNllsv6nihm2FSeg0BHczjqw=; b=htH1XWM4GuiTGwG9KmhjqcKZIjp
	Fza4ezihA+UjerSGESnSpfGtrJDEVWuU5DppkNswIxRle0FfR7hBLUhWooo6S9Cw
	BCNC2MHUMoA/DVdr7x77Uukm9s/L4whItrgPxr4j6kMP1M2RpAKvLc8E/QuJtD53
	QOdClVhWW2h94IUGcHFro0wKVzAz8ZlFYsNt3vjuEq3NNcD3YJ1LWTnEfl60YOB+
	wsi3fhKjqhj6hZyOEbzh36vOYYUjv5Zbr9lloy+kGvuwBUIlLZbDoXMdgwtEDXp3
	6+LyBH6hCA76wr7h16tTx3EYe0f4sWrKPSD2yjn5q27VSLSEyerYXxMn/tw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf5pdsr2m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 15:39:08 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-853402198efso2357694b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788449947; x=1789054747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WTCQhZSlp6iQ94A2uQ2RNllsv6nihm2FSeg0BHczjqw=;
        b=gKmNKuyPacBrBEJB3r0QwdUPpKHYcMkMzqEfE8MwhP92n+CnfCzcpmMeyinNC5UoIs
         lCLp7O5rekxN0uBVpXSqMAsgN3lM9/obXOv923Ywe/pC1PcfjUyrHHeOVxf//etT7p+w
         xRFP5Tdb2wek/vKCoPL3+YunDZQbazckF6ODPf1OeModenNyNb5V1b4jEAIv3i8kVwRW
         0dzQVE0SKaSfn1S44vrNHITF8f1UBzJsbWV1g+DsB1yvoSOY+2rbOesRy7bMwzck5aKV
         z/d8jBJ7aG2uOQUfjE23IDI8T8ESx1mSdGlzqmEvX+che7ZCvyspH6TDT5tSpHdNu5A1
         ywWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788449947; x=1789054747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WTCQhZSlp6iQ94A2uQ2RNllsv6nihm2FSeg0BHczjqw=;
        b=QT0RyLc8O2pMkjzf+9G/aVFcsfrz1aMSRQyo3UtsGFCE/dBzmEOVQJB9ElB+o9tzUx
         ydWysu5VTI+uWxnRjZ5ol5plz0ljcOHSegDSmJiLwqVUy6DpgxzNi+eZsc8RHTvIEzg9
         pofHOA4giMTSTpS4lh3NNuOnJ4j/8lKQu21F5F5TFVOrV+oIoTEdBkMvtkr5iRM8AlRR
         54nZGkOJ26PhpW7FQrFj++ctXCt0K5U04N7WFRGrXMYRP0OKNEoR00wp5c/df1jpUaAZ
         aHB9KWu6tIqNW/chmY+T0iBK/0plIsAheW+R85tlQPu7kC9AQjwlXQIy7wwTeTM7vNCS
         otNw==
X-Forwarded-Encrypted: i=1; AKwUvBxNjvnSIjv6eFmt5PbswkALYPFoadd9Kuie68Z4KVNqHAUMpzQsS+1jc/dL5c9cwkAofNRETGFMx3c7Lxw=@vger.kernel.org
X-Gm-Message-State: AFuF++nhplRWGxImVlNfVc/9K7pW4RuB8JA1kmBBzC8FXhq0uFqB9ae0
	eLM4Iss7CLgJAhI/zTqmtkDTit132tcFu4NJj6N3l217x2cMms3G36UWUe2ocLfw7Y/vN6KhCp0
	E587n3M5WyXzPXn52To5mSrSuKDUi4H31ZthBXkMDCLdigK8Qjppdv2HjHwuVd/hiSyzfCntWLX
	I=
X-Gm-Gg: AYBFou1NxxtPu3alPt3BLJfy58mvI1rRyFj3e5ipMETaZr4wqXVzRvmDS/qMYuhIXhf
	tkk/ipX+sI8NqkOxVzDf7+r2iQqcQk3vofLACV1tGEYuN69mICf6LBpnLb4BKDEyXp5RvR45SMJ
	x8BI3R1fx+Fz4U74lYGNWv1m9JDP7vLQDdGKY7rtSOx+W0v8ANsNoaX1PSh1fvWmG3vKYe15WuW
	iv7T7kWY8LEltfki6AxeieXIKcGT1tpoc2kwxNqRABk9lKNMHOWdcVBekrew051MTSWEj72O390
	/9W5q9Gykxy/KhXLxP3rnJWb92EjTOLhs48ShnVAxRJkKlTseWFJK78rQaAlQ1mvz/2y/61mgqr
	UhGe6zLM+BahKI7LRDJMsQmj/hIVaNsck
X-Received: by 2002:a05:6a00:300d:b0:848:6c9c:4074 with SMTP id d2e1a72fcca58-85ed1d08cdemr21215606b3a.1.1788449947082;
        Thu, 03 Sep 2026 08:39:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:300d:b0:848:6c9c:4074 with SMTP id d2e1a72fcca58-85ed1d08cdemr21215520b3a.1.1788449946441;
        Thu, 03 Sep 2026 08:39:06 -0700 (PDT)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86153027951sm81069b3a.40.2026.09.03.08.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:39:06 -0700 (PDT)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: Sriram Dash <sriram.dash@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/7] usb: dwc3: qcom: Support broken suspend for SA8255P
Date: Thu,  3 Sep 2026 21:08:26 +0530
Message-Id: <20260903153827.3463313-7-faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260903153827.3463313-1-faisal.hassan@oss.qualcomm.com>
References: <20260903153827.3463313-1-faisal.hassan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEzNiBTYWx0ZWRfX3yh2NO0GyqWG
 F1QPkNlhOKC9feDH12a3MZ7s86xi20cNz9qDIbcoMKvhdVMUbc4XJMSKmjka6rS4eMpNQi/EMbE
 TxOktLMMepbX0pPN043E46Zsyk7eL98=
X-Proofpoint-ORIG-GUID: qCrGuMNPbL9A0GULRlFg0UssxFz5dkN9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEzNiBTYWx0ZWRfX9m4hEJKfmqBO
 fzmwNqVuTyVYVkqC8zC5f4E4UY1Lt4VEZpv0Bpx6w+bA5Jv90+PKyGAyD9cIH3udUxE7Kpwxujv
 Xk83ey22kxaCBoOF3iHfQNc4ovoKyyX7svrv09UQKBF9IZ13Hr8SjTGtKalBgoOx8IVjxCtdvyD
 f3aP0ho/7HZbvDHXrmwHWZc9nsBOZgztpNgBTHyHvHVGYzixPdy99VfwGbkHrILqRc/2miROUs8
 mNmdmTCWvZES1nBoZy/X7X+pJw6q2QZ1VNdD7YOcRU8hob2tw5T3mSM69WY8SRDNhDGBDUNaaDy
 fe0CXpfhmXQFY2vh1LZ7aMArdzqmd1+Cf7MNod/xHsvCj7nZrFAIY6BvDf9VUKXa+7y3iQ2Bx0P
 cGAHp5g0Ssv8WSLW0y8L4SsOAdftiK+8XArrITT21zZZvVQ4APl9VNAqKRaqgiRZUxPmq7KCY2I
 ue5nIokxj8iqDu5Fugw==
X-Authority-Analysis: v=2.4 cv=RsL16imK c=1 sm=1 tr=0 ts=6a99949c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=uWzvkLexRb9NFxrCvYAA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: qCrGuMNPbL9A0GULRlFg0UssxFz5dkN9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 clxscore=1011
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030136

During APPS Suspend, the clock controller unit disables all clocks
to the CPU and subsystems, causing the controller to enter the
Power-On Reset (POR) state. This results in the loss of
Qscratch programming.

Upon APPS Resume, the USB controller does not have the proper
PIPE_UTMI_CLK_SEL or VBUS_VALID. Hence, if only the High-Speed
PHY is used for a controller capable of SuperSpeed operations,
the controller will assume it should use the USB3 PHY and not
the HS PHY as configured before APPS Suspend. This behavior
disrupts the normal operation of the USB controller. Similarly,
if the controller was operating in device mode prior to
APPS suspend, and VBUS_VALID signal is not set after APPS resume,
this will cause the PHYs to transition into the suspend state.
This behavior disrupts the normal operation of the USB controller.

Address the issues by ensuring that the PIPE_UTMI_CLK_SEL and
VBUS_VALID are handled properly after the system resumes from
APPS Suspend. This is crucial for maintaining the correct
operational state of the USB controller and preventing
unintended suspensions of the PHYs.

Also, as the controller is starting from POR state, make
sure the controller Reset is performed.

Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 128 +++++++++++++++++++++++++++--------
 1 file changed, 100 insertions(+), 28 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 6d25f81800a7..e58a9ca23b00 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -68,6 +68,10 @@ struct dwc3_qcom_port {
 	enum usb_device_speed	usb2_speed;
 };
 
+struct dwc3_qcom_priv_data {
+	bool broken_suspend;
+};
+
 struct dwc3_qcom {
 	struct device		*dev;
 	void __iomem		*qscratch_base;
@@ -85,6 +89,13 @@ struct dwc3_qcom {
 	struct icc_path		*icc_path_apps;
 
 	enum usb_role		current_role;
+
+	bool			broken_suspend;
+	bool			ignore_pipe_clk;
+};
+
+static const struct dwc3_qcom_priv_data sa8255p_dwc3_qcom_priv_data = {
+	.broken_suspend		= true,
 };
 
 #define to_dwc3_qcom(d) container_of((d), struct dwc3_qcom, dwc)
@@ -335,6 +346,23 @@ static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
 		dwc3_qcom_enable_port_interrupts(&qcom->ports[i]);
 }
 
+static void dwc3_qcom_select_utmi_clk(struct dwc3_qcom *qcom)
+{
+	/* Configure dwc3 to use UTMI clock as PIPE clock not present */
+	dwc3_qcom_setbits(qcom->qscratch_base, QSCRATCH_GENERAL_CFG,
+			  PIPE_UTMI_CLK_DIS);
+
+	usleep_range(100, 1000);
+
+	dwc3_qcom_setbits(qcom->qscratch_base, QSCRATCH_GENERAL_CFG,
+			  PIPE_UTMI_CLK_SEL | PIPE3_PHYSTATUS_SW);
+
+	usleep_range(100, 1000);
+
+	dwc3_qcom_clrbits(qcom->qscratch_base, QSCRATCH_GENERAL_CFG,
+			  PIPE_UTMI_CLK_DIS);
+}
+
 static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, pm_message_t msg)
 {
 	u32 val;
@@ -388,6 +416,28 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, pm_message_t msg)
 	if (!qcom->is_suspended)
 		return 0;
 
+	if (qcom->broken_suspend && !PMSG_IS_AUTO(msg)) {
+		/*
+		 * Only system suspend fully powers off the controller and
+		 * puts it into POR state. Runtime suspend does not, so skip
+		 * the reset on runtime resume to avoid needlessly clobbering
+		 * state that was never lost.
+		 */
+		ret = reset_control_assert(qcom->resets);
+		if (ret) {
+			dev_err(qcom->dev, "failed to assert resets, err=%d\n", ret);
+			return ret;
+		}
+
+		usleep_range(10, 1000);
+
+		ret = reset_control_deassert(qcom->resets);
+		if (ret) {
+			dev_err(qcom->dev, "failed to deassert resets, err=%d\n", ret);
+			return ret;
+		}
+	}
+
 	/*
 	 * For runtime resume, always assume wakeup was enabled.
 	 * For system resume, check device wakeup capability.
@@ -415,6 +465,14 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, pm_message_t msg)
 				  PWR_EVNT_LPM_IN_L2_MASK | PWR_EVNT_LPM_OUT_L2_MASK);
 	}
 
+	if (qcom->broken_suspend) {
+		if (!wakeup && qcom->ignore_pipe_clk)
+			dwc3_qcom_select_utmi_clk(qcom);
+		/* Make sure vbus valid is set for PHYs after PM resume */
+		if (!(dwc3_qcom_is_host(qcom) && wakeup))
+			dwc3_qcom_vbus_override_enable(qcom, true);
+	}
+
 	qcom->is_suspended = false;
 
 	return 0;
@@ -449,23 +507,6 @@ static irqreturn_t qcom_dwc3_resume_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static void dwc3_qcom_select_utmi_clk(struct dwc3_qcom *qcom)
-{
-	/* Configure dwc3 to use UTMI clock as PIPE clock not present */
-	dwc3_qcom_setbits(qcom->qscratch_base, QSCRATCH_GENERAL_CFG,
-			  PIPE_UTMI_CLK_DIS);
-
-	usleep_range(100, 1000);
-
-	dwc3_qcom_setbits(qcom->qscratch_base, QSCRATCH_GENERAL_CFG,
-			  PIPE_UTMI_CLK_SEL | PIPE3_PHYSTATUS_SW);
-
-	usleep_range(100, 1000);
-
-	dwc3_qcom_clrbits(qcom->qscratch_base, QSCRATCH_GENERAL_CFG,
-			  PIPE_UTMI_CLK_DIS);
-}
-
 static int dwc3_qcom_request_irq(struct dwc3_qcom *qcom, int irq,
 				 const char *name)
 {
@@ -637,6 +678,15 @@ static struct dwc3_glue_ops dwc3_qcom_glue_ops = {
 	.pre_run_stop	= dwc3_qcom_run_stop_notifier,
 };
 
+static const struct property_entry dwc3_qcom_props_broken_suspend[] = {
+	PROPERTY_ENTRY_BOOL("xhci-reset-on-resume"),
+	{ }
+};
+
+static const struct software_node dwc3_qcom_swnode_prop_broken_suspend = {
+	.properties = dwc3_qcom_props_broken_suspend,
+};
+
 static int dwc3_qcom_probe(struct platform_device *pdev)
 {
 	struct dwc3_probe_data	probe_data = {};
@@ -644,8 +694,8 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	struct dwc3_qcom	*qcom;
 	struct resource		res;
 	struct resource		*r;
+	const struct dwc3_qcom_priv_data *priv_data;
 	int			ret;
-	bool			ignore_pipe_clk;
 	bool			wakeup_source;
 
 	qcom = devm_kzalloc(&pdev->dev, sizeof(*qcom), GFP_KERNEL);
@@ -654,21 +704,33 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 
 	qcom->dev = &pdev->dev;
 
+	priv_data = of_device_get_match_data(dev);
+	if (priv_data && priv_data->broken_suspend) {
+		ret = device_add_software_node(&pdev->dev,
+					       &dwc3_qcom_swnode_prop_broken_suspend);
+		if (ret)
+			return ret;
+		qcom->broken_suspend = priv_data->broken_suspend;
+	}
+
 	qcom->resets = devm_reset_control_array_get_optional_exclusive(dev);
 	if (IS_ERR(qcom->resets)) {
-		return dev_err_probe(&pdev->dev, PTR_ERR(qcom->resets),
-				     "failed to get resets\n");
+		ret = dev_err_probe(&pdev->dev, PTR_ERR(qcom->resets),
+				    "failed to get resets\n");
+		goto err_remove_swnode;
 	}
 
 	ret = devm_clk_bulk_get_all(&pdev->dev, &qcom->clks);
-	if (ret < 0)
-		return dev_err_probe(dev, ret, "failed to get clocks\n");
+	if (ret < 0) {
+		dev_err_probe(dev, ret, "failed to get clocks\n");
+		goto err_remove_swnode;
+	}
 	qcom->num_clocks = ret;
 
 	ret = reset_control_assert(qcom->resets);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to assert resets, err=%d\n", ret);
-		return ret;
+		goto err_remove_swnode;
 	}
 
 	usleep_range(10, 1000);
@@ -676,12 +738,12 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	ret = reset_control_deassert(qcom->resets);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to deassert resets, err=%d\n", ret);
-		return ret;
+		goto err_remove_swnode;
 	}
 
 	ret = clk_bulk_prepare_enable(qcom->num_clocks, qcom->clks);
 	if (ret < 0)
-		return ret;
+		goto err_remove_swnode;
 
 	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!r) {
@@ -708,9 +770,9 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	 * Disable pipe_clk requirement if specified. Used when dwc3
 	 * operates without SSPHY and only HS/FS/LS modes are supported.
 	 */
-	ignore_pipe_clk = device_property_read_bool(dev,
-				"qcom,select-utmi-as-pipe-clk");
-	if (ignore_pipe_clk)
+	qcom->ignore_pipe_clk = device_property_read_bool(dev,
+							  "qcom,select-utmi-as-pipe-clk");
+	if (qcom->ignore_pipe_clk)
 		dwc3_qcom_select_utmi_clk(qcom);
 
 	qcom->mode = usb_get_dr_mode(dev);
@@ -757,6 +819,9 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 clk_disable:
 	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
 
+err_remove_swnode:
+	if (qcom->broken_suspend)
+		device_remove_software_node(&pdev->dev);
 	return ret;
 }
 
@@ -773,6 +838,9 @@ static void dwc3_qcom_remove(struct platform_device *pdev)
 	dwc3_qcom_interconnect_exit(qcom);
 
 	pm_runtime_put_noidle(qcom->dev);
+
+	if (qcom->broken_suspend)
+		device_remove_software_node(&pdev->dev);
 }
 
 static int dwc3_qcom_pm_suspend(struct device *dev)
@@ -867,6 +935,10 @@ static const struct dev_pm_ops dwc3_qcom_dev_pm_ops = {
 };
 
 static const struct of_device_id dwc3_qcom_of_match[] = {
+	{
+		.compatible	= "qcom,sa8255p-dwc3",
+		.data		= &sa8255p_dwc3_qcom_priv_data,
+	},
 	{ .compatible = "qcom,snps-dwc3" },
 	{ }
 };
-- 
2.34.1

