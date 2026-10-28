Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793213990;
	b=ks5cdiikNgl760BrmwvLr9OLkateBPmeVV3o9R476SDC2H/XSkFCc6hrogoV9BCnOIIx
	 x+GYFxb/Ep0u+Y7W39nCvwGye0gCCqT1a8ZqFnuBxyYeIJPRAOnvL0MVUS38Ruy8+17uC
	 Z9JQPUHqXRHM6N9yhr+1sauslbx4moW0/zNGqpVHzkNk36dBgfKSUeZPCeQRKza60CiWL
	 jA9sXe9b0XUjMQYY31bLfWPOpMPY/t60k8T+pMDzWV2y1GLIHFly8xRSJeg78cOX/aQyl
	 BHPqokHOlEg0g2bbwg8OSEMQIgX9THSmk+fVUCrqDIILcFL43DGnbHMTEXQdqBDhbzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793213990;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KgcDUP83Bl5a2s5ql/jyk1n3BPOJSPT0F3Csq2uM3lY=;
	b=Z3W2+PkxLGGsXGZ+emWeGlNDnWrW13U1sk541FudAHvtgtXBH862X5PCs51amCX+riad
	 ZCyC+0JPX8OYCjvH8WK52ZImZEDdgRYFrDYt1qpG6yN/qj9Qp6Pyv0bFzHUrcs5Yncc6I
	 uxwvkxcSB3Qly5zr9C/d9rwU/p1WiZgJwKCKPL2uSJnjnXfgv4qswFxDw79kr6ZfeoUr/
	 OU3oWnHqKq/uR6Ri0AQUesPG/MQKaCo0yxdVInqMej16i1/wAKEMomNVlFS9LLJI/i+A4
	 zie59BJgZucseEPBm809T+YY5ymU8Fc0+LdifxylvJ8Gs/oeQwbnTQ783PLZ90tPnBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="pIhyG/vn";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=We4tUeLj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99143606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:59:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99143606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pIhyG/vn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=We4tUeLj
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SIcLjG1918603
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:59:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KgcDUP83Bl5
	a2s5ql/jyk1n3BPOJSPT0F3Csq2uM3lY=; b=pIhyG/vnmam6DilkyHyPOyvYlzT
	/vZHuBjxwY6qGjRivCp3/1plEEIwEyuiEUlmVZYwLicmPhIsUaJ92iKP5kz9Hwta
	9HIe+KVRjIdGf3ErF0boW+GYPrueX224JfkEEaqGSUCA130gfTguo+rD3SuKa+vW
	l3XF/eZPnkdu0OFEDl7cui7/BLwQ9GH3oNj+KxumcnT6UQREbktrYK4tloI10RLB
	6XOgD7zCx7qrhjuut6KopOg5iEfP8mN5wX3aH3JSBNBsKHX97UVLTWQ0uU9MCZCN
	saf4TKLzS4kZpd8eiPlDW0P65ZD0NDntbEGPC2/5wUBaCmnjlbYddpuMLGA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpgpr2v8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:59:48 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0d568830so2545318eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793213987; x=1793818787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KgcDUP83Bl5a2s5ql/jyk1n3BPOJSPT0F3Csq2uM3lY=;
        b=We4tUeLjz8FjUuA4EGKwdwgGBkVlyeUdHC63vVJKvS25af9aY6uoaTNQ9dDoYzjRTO
         Fdl8AQbiKC5CC/6tAfJTBH1Lohq2rfVQQDKpk+/QafUpe+QGew52sLcO/+jWXr/Kjt0j
         YuogEa0fBl39DP6CIjrCUg+TDxnxZwUYm/i6r7sUJtfpn5TU/Zku9MUFCkWRzMvHjHSk
         9R0SG+gTaBSITVa7JkwuI7QGZo5vUDTk2g3gABNmHpiRQ07L1idNmli+t1yfb3MBylOC
         j4iTlUuBGDEG9lG8X5sL4QXLx8H+pvEFJZeHGB9bQhnzP96I3m+wsGTeVBGjMkG1W1Kq
         YhnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793213987; x=1793818787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KgcDUP83Bl5a2s5ql/jyk1n3BPOJSPT0F3Csq2uM3lY=;
        b=Kmh9QQoPTZJfnQeA0KUbNWerchx772+9pK53WgnVG1Q42eyxghocWrTZOdKLd7ZAgh
         lvrlgv1tYwtKmTsOqB23SoBHZrtjqMRoTWhgNub/rxeG1GdTMOnn+8+0BB0V6b3l23dG
         fIYMYwjxUXfFpIatZO4fIqlydBq8irZxs4ZRJAT74J8jINrrGTmVGo2NkTswlL/4ZVbn
         jbJgJMqOIv9zfZf4RYH6YI9uSSUn5v9jTNMp++Y7q6MA+G/7ZlnFjbSu1xdPKkDhUkv1
         uL3XgPXZ90UQWLxtexgN0gIAQxQAxxUgDM3AFcVAaGy1bxA+r3/H/tV7LD6XPE8yFQIn
         zS8Q==
X-Forwarded-Encrypted: i=1; AKwUvBxOLduut3XOTaCwBIbJv17/FmcibyaPSMYftdorRM2zlOWRK7VpNzyZ7Z3H/A8DHBKr3dSVZeK57nGmN4g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLeDsvlOhACS1uGPQ7f1qXROHAq7jD1M9udeZpaVzOWBJmRhqb
	AytOCvRzxrY8Zv0RJWJYRqaS4FVFIx04zW4+2wvNjIs2uJh9QpfH7TQODuldmY6hlne1xo2HSry
	2cACGEJFX0tCk/xZb/V565VjBXkSLz+CejTHWruWWvbxWDQCVIwzDyTH8EOKMi5Q/IdM=
X-Gm-Gg: AYBFou36o9ds2vWWEXye1Z+Mpu00MlzguVq1uRniMNgfIhNOxmp2OEHHxlz/BjxP1Vm
	99mkO0NRsrunWxhzOWsOspYp69tnoAestoNoufM1i/krM5JW8TgAWYJ7/vas7468KxpbbZf8Z2K
	sBAEm96ChsUYVubx36PtJUkXUCKDv6ftk+zO8bT6y8N0ISb1m9f5DSPSeiOBSlN5mP/7qxbuDxh
	YzAKoeuSglQG3DJyb8NmfitWtd/m462WoPbRiqy/1zGFjXKzItB+udBV58tq59dEV9YksyJ6T4x
	/X2v7h+vhg4FqIdp/mErLR21F9MfULK1enlCu3tBhTitoD7ahdX3/rUI9XotLb9z2rxvUUYWxGj
	q/5FU/7FnL1KJL9BNc/Cj6HySKojorFpNHKXNtvnuWaG25ToM96q+aXXah0P5dZdc2Qq4hRixUk
	6SZzXbuw==
X-Received: by 2002:a05:7301:7e0a:b0:353:7e33:664c with SMTP id 5a478bee46e88-36a20401baemr4316299eec.37.1793213987077;
        Wed, 28 Oct 2026 11:59:47 -0700 (PDT)
X-Received: by 2002:a05:7301:7e0a:b0:353:7e33:664c with SMTP id 5a478bee46e88-36a20401baemr4316256eec.37.1793213986385;
        Wed, 28 Oct 2026 11:59:46 -0700 (PDT)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239a56e9sm8639936eec.27.2026.10.28.11.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 11:59:45 -0700 (PDT)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: linux-usb@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/7] usb: dwc3: qcom: Keep wakeup IRQ enable/disable balanced on failed resume
Date: Thu, 29 Oct 2026 00:29:31 +0530
Message-Id: <a7e3c1e094be9cb4a282925a6c09e11bf746234f.1793212717.git.faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1793212717.git.faisal.hassan@oss.qualcomm.com>
References: <cover.1793212717.git.faisal.hassan@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA3NSBTYWx0ZWRfXyR1z8bO5Ivcm
 3XFTTOqRl7hCjU+/nc0KEDASDez0NuVQj9/yKkzv07qfcdgdMCLHp1DO4enEE4iCgrT1R4fcHu0
 ksIGGtg38cDtEPtb8h2+nLYWH04yj9cOocwCJBqwORaTvA9t/sy1f5aUFUphXVuhYooCN7XDyRa
 HJTcr3YualWWNixcYKxUef+yA/kkeO3xQe+mmR9A/fuyuXh83zsFlEPO2ssThJUzGO8PUSXNtea
 +ubhor4s3kPrp/h+jZnz9RHwC5AxjyXMvP9U26rH4Iq8Fb6JhEGPIkSLtoDvEIikRM+F/DAOi3Y
 sx4x06+uxzr/lZ0xY4tD+xSaSSvoOZ/vzm51j76nUy3Z2/rPvF5bRuSwbVFanviGLpd4VQ1V/wE
 Mii2/3VULoefDE3SrDj7MXEfFIde5C/98rdITzaNLThwyLXpRntgKUU04cirqKIgnPWINV6PaEK
 oBl3wNQ07tMqxlrDCsQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA3NSBTYWx0ZWRfXxnq8M1iDu4bx
 vwYqpth8n8iBt+0LSAHUAYbyVi6AY0qXDOtS3ZwldLqRJYHZ92nPrP/pWN1lnS+0rnV34Xk44zk
 bzvYpYvH8y4wXopfju0Vvxmyk6VXuWg=
X-Proofpoint-ORIG-GUID: NlsswxloFQ9hlLTxWT9N3V_qYhoXAkNh
X-Proofpoint-GUID: NlsswxloFQ9hlLTxWT9N3V_qYhoXAkNh
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6ae24624 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=ZXqkfniAK1spq4Hy8MUA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280075

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

