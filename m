Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C124E3EC4
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449930; cv=none; b=DmaR94gdgAnoQTYXKHtl9C0dd8uCcb1ZjpIgkGHaufPLHnKwRrIldoGBL7yA8RIDwoeFiCtESM0y6XvU3hGlL1kOWCPTW1fKYQCUkGFz6a/rShl4mS60RCLeC8d2jTjq8PQ0XdOP1/rINJTV3nXqH1nOBGR5Y68xqeGkqRAgF1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449930; c=relaxed/simple;
	bh=4vXFe8mDn022Y/B25bfpbZTEc3rDqMffSWmcEmGusgA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=khSnMmxAnaJaeMFhrJrD1d7QM42DWbYGSxUKOae6pMst44M88HQtBbPawfFGaRhsWtpGZAvTGcTKWvt6XHHiU2a/oYzokAtr91GyK6v/omh7BLDzpmeU2Iuky0YCURBlNRfkf/Om4V5Q/3q60ca0RZ14cju0+PiQx5jsrzKvBZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sqq2ijWc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j3p20I4b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sqq2ijWc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j3p20I4b"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DARAA035590
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 15:38:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7DMo5aLM7KO
	0xZZuqnuCa7iNDZoWTd8Rp83SaIim8bw=; b=Sqq2ijWcT0SNyBCiTdXleYzVIjK
	+kj43fUvy9GKD0Cfu6UuuqZOgc6zoYODmiUyVymagv02D2J8F3snItulaT8ERDUk
	81ZsL8k00XTWzlD1FO0mWxxVSlFky2cOJInswXWv1DRmAwYdoKn3eAb5HaSSRHMU
	oE+r0TKnlSlhmBqWKPQgedP5R4VtdL6GgNsxyx29bZKNYn1Gp7AV23i6oiGfQzyx
	2kOgs7P1PoQ3ijou0d9c3DCndrC7WZHDw+nCEtl5jhH2rvgR2bkWsMWiScy40dAV
	1B6OR1XekvdpXtvhw7OBFWuhhCQfknLuN2V6C66I7PSpXpVbaNVHDoq6mQw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf51m1vp2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 15:38:48 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-85722fc5a21so3632694b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788449928; x=1789054728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7DMo5aLM7KO0xZZuqnuCa7iNDZoWTd8Rp83SaIim8bw=;
        b=j3p20I4bPkm/jwMKErhOetutNUX1gUjIC+T5FvHqXwz/bJREml0DGUZ6zYHQvhLvTF
         ZNAlWtcx07dcaDF7RH4FRCKZRw8z7U6tPv3uWBCMFqF3r/x5z4LChtBjVyQtNUcqD+Rr
         BRGygb1fgt0MMAjjZnn7b+0HfJPSpsSF8IO/yPtA/xzjzG3BHcFR+qvxurjGu18eCbXK
         t9gwn4gt/NUrWMo1C2VZ9oCNpm/ITWJhstT8rFscEbbWL7vecrXfJTVcL+IHXWUtjf7o
         IwXj4ygfpR7qjSPv8dBpeGLKBrPm9vRnID68DSq6kEkzN0uaw66b62ahqSRGLaprq2fX
         uBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788449928; x=1789054728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7DMo5aLM7KO0xZZuqnuCa7iNDZoWTd8Rp83SaIim8bw=;
        b=SQf6YsLcH8hV982FTIoLWcoLqkMQTBjmxO0c70sI7mm8snajUweYQmVGZ/igF+Qr9C
         FKKC0ZXYahkIhfgMwoU46ej+LjaDRt1qVTM5N9EQzjauTVfXUKF4XHcumUPvwxYdw25Z
         IfxKEvOysbfVmJTpIFeFWOMObBG6JxXX26/Hb3g4R5XO98BQN7C/pmlciKUwF51fVp/Y
         03swd42ISPBvzUnTBblQKoegFu+xMLr53hSiGJd8r5vBpvawp+45KE8HQNPON0Yfwb6U
         iRDbSpoTF7mI0CD1QkF+ev/NRN8tqONChyf2KEw1bJ9Zpt1Qj5hCTLJpCBiXQaANImnE
         piJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHDVh3z4TY7aDkWhYOF7CTSZPRw/fBKteK6ZpXyx3vKLdesSXbzVYrpE5dYnHZ4jBxNgXDkcMKAfGl1Mc=@vger.kernel.org
X-Gm-Message-State: AFuF++mvd1cE6UZeQdwuTPPWbsinrCpJW+zhJLKz7HR5H9pJryFRwEkf
	SuurhJG4O10cKh6Ww6uwmOxROxXFs/QuASchmhgaLEpTF4++2hKiFEnGsN8A9jKoAN/yfv5J3fE
	9VLNw/X7Z+VP4vXjiTQycpSKs+KQ9jxJ5TrWKmvrENFZDGtHgMnUg9EUX8Zyo6gxbt1o=
X-Gm-Gg: AYBFou0R1iSyb/+HsspT54Kn8/6oKxLnwwV3gf3SGrwRmm2Hd8lCmN5o5qq9/pyBcN9
	TcUVDWFbJL5q0Id3qMwWt0MxLO8yylxM+nmYbzsl4NJoJl4rz92ml6SiZkMEAxVhb+bOKHxCEQS
	1dHNsHr8/pI3OiXm/Yn+85VonvihKS9ZNja/VBTepmJibSg4BZi/r0mVA4yE1ItcKZvzeHy8nec
	qA0jrYRbtY6VNksFu/kWn+KOgFWh3fHaKJ1ARNU529fwoWPtvi8Yr7IgJQgsAFG0/1c5xsGIbcB
	NtwauY98JB8sM4T9bn4R3+/jAlpVio4YRpDntTX26xYpdWFjXHnB7VPuQL/lu7gvJH7vREjwF/I
	3Mm/Oi7N0SiVzl3H2Spm7S2DqdQUXZQf9
X-Received: by 2002:a05:6a00:2309:b0:84a:29a7:f650 with SMTP id d2e1a72fcca58-861630c5ce5mr1026b3a.0.1788449926223;
        Thu, 03 Sep 2026 08:38:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:2309:b0:84a:29a7:f650 with SMTP id d2e1a72fcca58-861630c5ce5mr932b3a.0.1788449925461;
        Thu, 03 Sep 2026 08:38:45 -0700 (PDT)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86153027951sm81069b3a.40.2026.09.03.08.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:38:44 -0700 (PDT)
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
Subject: [PATCH v2 2/7] usb: dwc3: qcom: Distinguish PM and runtime suspend/resume paths
Date: Thu,  3 Sep 2026 21:08:22 +0530
Message-Id: <20260903153827.3463313-3-faisal.hassan@oss.qualcomm.com>
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
X-Proofpoint-GUID: 6oWX8MRA-44SgWC9OXxyRhtkBW81JHqF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEzNiBTYWx0ZWRfXwOKX0SPHahva
 HoFOnLiDEOLNmHhTOs1VkMLNabrJCgQrsgGHvDD+xrBgukeMqJhVwASW04C1mJuJgcIiZCu3TK2
 rtVH21paTg9+7RMspbp6VUz7UYukSvC7nvLSRulCi8FmNKJ4vxbjuWYsOlrZ9oJ9/RQ1DMh0Q29
 TIyoXLjR3EStgIh5gw5OWx/DG+mwZrVJfL0RLZbVwz7XsIqVKM29KAEsQ4orqUcXgFvWLQTXqXS
 PTxx1PDplgZWHqjS2Xq1Lq4ZM9wVdBR0DRp5es0rMTC3ASVl8CF55RA1UJ9W2sBXcp6zGJiYb9Y
 c7ji/wnTiU8I3Qcr7M+rAyAmf9ShhIEiSJEiSXHS4u0pqQ42Ri761FFH5VIJcSHCcxNm3g8TTLG
 UdJtDNG19tmjcGlLKQM7L8CI6D8SpthYC9xpu01c8X3tM3LwKb9lfE+lDywO+Qc2e8Fahy2dhLg
 O5waEftXV1idfAXSS6w==
X-Authority-Analysis: v=2.4 cv=X8Ji7mTe c=1 sm=1 tr=0 ts=6a999488 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=tqe-1LZTDOhu2qnNqD0A:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEzNiBTYWx0ZWRfX05HrsilFMBbI
 cEEB2/yBdaJK4a2jBpbY6WPwTKB0ArhJ7kLMiTK0/cPa0tOteKgwwbudzwOlL3voOBcxRAKq+h2
 tX6XOnS+xxmZmcNPALnds1UoxL8R45c=
X-Proofpoint-ORIG-GUID: 6oWX8MRA-44SgWC9OXxyRhtkBW81JHqF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1011 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030136

The dwc3_qcom_suspend() and dwc3_qcom_resume() functions
handle both system PM and runtime PM paths but cannot
differentiate between them, preventing distinct power
management strategies.

Refactor suspend/resume functions to accept pm_message_t
instead of boolean wakeup flags. Use PMSG_IS_AUTO()
to identify runtime PM (PMSG_AUTO_SUSPEND/RESUME) versus
system PM (PMSG_SUSPEND/RESUME) paths.

Preserve existing wakeup behavior: always enable wakeup
for runtime suspend, check device_may_wakeup() for system
suspend.

Follow dwc3/core.c pattern to enable future per-path
strategies like differentiated power states.

Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 34 ++++++++++++++++++++++++++--------
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 49698a31b2f4..6d25f81800a7 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -335,14 +335,24 @@ static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
 		dwc3_qcom_enable_port_interrupts(&qcom->ports[i]);
 }
 
-static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
+static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, pm_message_t msg)
 {
 	u32 val;
 	int i, ret;
+	bool wakeup;
 
 	if (qcom->is_suspended)
 		return 0;
 
+	/*
+	 * For runtime suspend, always enable wakeup.
+	 * For system suspend, check device wakeup capability.
+	 */
+	if (PMSG_IS_AUTO(msg))
+		wakeup = true;
+	else
+		wakeup = device_may_wakeup(qcom->dev);
+
 	for (i = 0; i < qcom->num_ports; i++) {
 		val = readl(qcom->qscratch_base + pwr_evnt_irq_stat_reg[i]);
 		if (!(val & PWR_EVNT_LPM_IN_L2_MASK))
@@ -369,14 +379,24 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
 	return 0;
 }
 
-static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
+static int dwc3_qcom_resume(struct dwc3_qcom *qcom, pm_message_t msg)
 {
 	int ret;
 	int i;
+	bool wakeup;
 
 	if (!qcom->is_suspended)
 		return 0;
 
+	/*
+	 * For runtime resume, always assume wakeup was enabled.
+	 * For system resume, check device wakeup capability.
+	 */
+	if (PMSG_IS_AUTO(msg))
+		wakeup = true;
+	else
+		wakeup = device_may_wakeup(qcom->dev);
+
 	if (dwc3_qcom_is_host(qcom) && wakeup)
 		dwc3_qcom_disable_interrupts(qcom);
 
@@ -759,14 +779,13 @@ static int dwc3_qcom_pm_suspend(struct device *dev)
 {
 	struct dwc3 *dwc = dev_get_drvdata(dev);
 	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
-	bool wakeup = device_may_wakeup(dev);
 	int ret;
 
 	ret = dwc3_pm_suspend(&qcom->dwc);
 	if (ret)
 		return ret;
 
-	ret = dwc3_qcom_suspend(qcom, wakeup);
+	ret = dwc3_qcom_suspend(qcom, PMSG_SUSPEND);
 	if (ret)
 		return ret;
 
@@ -779,10 +798,9 @@ static int dwc3_qcom_pm_resume(struct device *dev)
 {
 	struct dwc3 *dwc = dev_get_drvdata(dev);
 	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
-	bool wakeup = device_may_wakeup(dev);
 	int ret;
 
-	ret = dwc3_qcom_resume(qcom, wakeup);
+	ret = dwc3_qcom_resume(qcom, PMSG_RESUME);
 	if (ret)
 		return ret;
 
@@ -819,7 +837,7 @@ static int dwc3_qcom_runtime_suspend(struct device *dev)
 	if (ret)
 		return ret;
 
-	return dwc3_qcom_suspend(qcom, true);
+	return dwc3_qcom_suspend(qcom, PMSG_AUTO_SUSPEND);
 }
 
 static int dwc3_qcom_runtime_resume(struct device *dev)
@@ -828,7 +846,7 @@ static int dwc3_qcom_runtime_resume(struct device *dev)
 	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
 	int ret;
 
-	ret = dwc3_qcom_resume(qcom, true);
+	ret = dwc3_qcom_resume(qcom, PMSG_AUTO_RESUME);
 	if (ret)
 		return ret;
 
-- 
2.34.1

