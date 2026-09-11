Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620F83DA5BA
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789110038; cv=none; b=aINxCTVROk6oiqfPndX9sQ0Astk7h20TibMCCzdJgVGyaNjPn6i0g63l3zj8xcVvfyjLt9ZwsNR3Jsow/M2Vlz9n2C8Ck4yQxXwAzqvieKUCGxaMzqiXr1B9lBsiuN1GG0zU3XhoBgga+T+ozqN5kVU+9zYRuLEnPIeiXbImkBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789110038; c=relaxed/simple;
	bh=WK14kF4EOiz8WnbFV9tZuZCiFiCbHnSjpwVMdu0yWYg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=inz7+Oc+qdpqanfdz8OqivY4MKCbVMZOLCbgB0Y/xbg2YR1VaURGfgRJ3zPD/bMhH/gYT2ZSZGXPkIFkIpc4dAl1WOzfHYwKrz/qOPSSDMbMqCnSgtcNlkMGN8T68EQl9uIPej4PVocRscPv3TZzq72KOIgLDY5+CCxRblV17aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SntMglK8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H6kMNA2K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SntMglK8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H6kMNA2K"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B6kYAx3709595
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:00:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KeXCEwNC4fRFjlbOCrwn9li1Urokjxh0CwWMHmoG4No=; b=SntMglK8u85aI4Ww
	NS15XRYuNs9vhkivmKz1UiaRVxbYiVuG5KsQSEBKWJND3nZu1pEna1+8CbVOBdM3
	OEWNFyjCdxbYWxTLXSDhoEAX9+QVZXIxSHF2JHr9dAYRrw0g2vLDjDDXufioQJgT
	iXaYRAn2ZCftr7FZtIYmEPK7jW3tBEFzzbwXjuY/lynVYQpvCrL86xkrnrwwWmes
	VUoyWlkhTlBxCEm4kUOXz1Zgn2WVMMobFgWNrTpq9y3hkFujr7s4lDO1b5CuRIqE
	wzznIHT6t8oypCPiKUvhOXq3IWrVa0oA07yZCiBWNk7+fIkGCBnIMKS+f72+KXfI
	X3zrDA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm5q41jsr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:00:16 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398e1f7d1a5so828294a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789110015; x=1789714815; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KeXCEwNC4fRFjlbOCrwn9li1Urokjxh0CwWMHmoG4No=;
        b=H6kMNA2K5OV9fzPNGQWAz8k6h49iQgFbLgODsOU2MUS7qs5JNS9M8eCJnKWPKwmpaP
         EyZcZ7B2AWsyIkfDq5AXs2XiOo/a6erA3zrmqPTXommG2fUMrbeamP3RZBlcVjzBjZrc
         /7o/XZcJtLDx6ls8sbHRz24DE5ABjRUSoziHy3T5F/b+AGz1bz6l85G+9ubWrDb1nryg
         0WraGb6k8x+Mqt6b0P6lTF0VL/PejmPeJtJPSV8s+sAlC0KzOeQF4C4INwO23cqgTRpd
         vAf7REWbb97dmVnJmO4WjvTitNckC/L4xiI1jqd19qNYqB/VevwZdC1Q6RyUMt9oN4GV
         +H8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789110015; x=1789714815;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KeXCEwNC4fRFjlbOCrwn9li1Urokjxh0CwWMHmoG4No=;
        b=ZPE1lunZrf3avZbzU2EwXxwn7XqEuEGWAdvcTy9GQp60hwsN/TxC90pvfJ9II0F9m9
         /0UbfuksRWLTcGnagZ0LB/8cbhiywz+7/ae7lOTodt8hdxwN5Ylcp61CfKgXVqCSXvq7
         XwrhwuAvpxkl75bUpKqck+lchnJ5zJEq+EYWcy9H4gSFrr4qZpm62yWE/3PqjQptXO3K
         sH8IDB20th5Mz8p1Y6avr5qjz1TTxP/h4ZV1UpfGZ9TRTZKh7V6zYcZTbcbmd9I5F3un
         a78fLoCfh7+yq1lr+RIcu2fERGk/VtdF+Cppm5fVncFpHmLytsRtX5ohoshcYliVmYkI
         7Czw==
X-Forwarded-Encrypted: i=1; AKwUvBxgjDs1AjXBF0x5kR+PAbnh75cB6nMQKmOSbJHS60TtuO7nejkfNPOiAwN+Sotda5G+lzXVz39N/GWKKJk=@vger.kernel.org
X-Gm-Message-State: AFuF++nUSndgskCp/u//6ur9p5ye/vhmRxRa39JPitdJfV6c9tLchh+n
	SWSKYzSN0XW6IIjwkMJGD4DT4II453te8AfehuZ/IT89pJ/XTMo7RhyPc/C/XYlAgSzmAxlHXse
	wfJbtOcVPSpyaGAhWvH2EAGXIVH9NdJmrVgMxgMu8skbNMycrHtup3sDzXkAyDF3yNsU=
X-Gm-Gg: AYBFou0hXr9FsNkyEXowGdb5/H5ge11+o3LicIc3ifq7gFRDOh0p6ejuDBCviXwT0ar
	/WsxF98h8osBmVovXa+bAjOKM3UY6AB6xlpxHv//luujU/ecrDuMj5wxIOQsZBhz+x44zzmUwAQ
	uzSy7GO/7xVEo2At99oBrikD8iE+/VRR1gABQF4RT3kpt+u+v6nP991M5hRXERwWpWNorUSnX1q
	2V4GMnO5xCP24X7M+1ffrL0mdwY6/wFVB8nCaVW/+YkPTjAs0mOLZr6/NQnWpjpg7zEVvqRMtK9
	m2JeULp3e4cPUcggi8ne1RhIRCZu50HCbDj+WBObaa0tqrHXnRtzhadFRFq3On1+emJplRJn8Z3
	qI2gADpIxEUQGSYO6+HvJe0WdmDmweyDIyaI=
X-Received: by 2002:a17:90b:528b:b0:398:9c0c:7c71 with SMTP id 98e67ed59e1d1-39d9c35a3ccmr4600098a91.24.1789110015221;
        Fri, 11 Sep 2026 00:00:15 -0700 (PDT)
X-Received: by 2002:a17:90b:528b:b0:398:9c0c:7c71 with SMTP id 98e67ed59e1d1-39d9c35a3ccmr4600015a91.24.1789110014699;
        Fri, 11 Sep 2026 00:00:14 -0700 (PDT)
Received: from hu-arandive-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e9a8a9sm3799532eec.13.2026.09.11.00.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 00:00:14 -0700 (PDT)
From: Aniket Randive <aniket.randive@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:29:52 +0530
Subject: [PATCH v9 2/2] i2c: qcom-geni: Add dynamic transfer timeout based
 on transfer length and frequency
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-master-v9-2-77ac458344e2@oss.qualcomm.com>
References: <20260911-master-v9-0-77ac458344e2@oss.qualcomm.com>
In-Reply-To: <20260911-master-v9-0-77ac458344e2@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Dmitry Guzman <Dmitry.Guzman@mobileye.com>,
        naresh.maramaina@oss.qualcomm.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Aniket Randive <aniket.randive@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789110003; l=5876;
 i=aniket.randive@oss.qualcomm.com; s=20260325; h=from:subject:message-id;
 bh=WK14kF4EOiz8WnbFV9tZuZCiFiCbHnSjpwVMdu0yWYg=;
 b=cfr3RKHUK1mVL30/osItLwyNJY/nue0fQhMRoECppqbxf1VUEoMs6jRVDxjStxHYx7ULUn9GX
 CCO08czr8yMAUoIiJ6YPRTJt4ZFKsQE1uynsG9xbOLlN7Vmlwlcuey5
X-Developer-Key: i=aniket.randive@oss.qualcomm.com; a=ed25519;
 pk=4o37X1ZqGbCO/T2SR8kq/HnWvq0yb1RUlFuNukovbQk=
X-Proofpoint-GUID: T-mnfefVzomeOjjJGEdBDq4r5dnE3xzM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA5NSBTYWx0ZWRfXwE8fWvTz2LvE
 8m2kaJUheW1mVfJ1Ac/EmRxI+OmMczn8pqHGXMbAB976DAgoIF71tny+l2sFYEai7ViShmtFft0
 9HobaWYlwgP4X4Lj5Lq/0Evsh5AUtHU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA5NSBTYWx0ZWRfX/SwRfYa5qoD3
 YNVYHvHV4egB6vlc39StnVuzj38NozBGJj7N3Bk5Y87C0VWc0ObSNqS4kP9U9QGU+nQVymvR5V1
 3PZUL3wBxNeXVGgAU4wY5vczgm8iKY3oiBKZSKAtMkqGOF0LxFQTOy9i3NHF4fp8tkwGTQpx+2u
 PNoAUnhCJjuVgnCvbGNV1arFs1TGFSstHX8UTvCddcUaiqSfXT72WUJFDrttEEkqyPv6m0IdHDg
 Tb4JzfjOVORIjFel2ZUPGpXlPR00QUcCVsYE3EY2zBTMpW6ndnuX60dpzvQ64/4aMEQw3iC1o6A
 /3ARGMACaS91z/HW/6TkdHnNYS/ez0xz7EO3VabflrOfdy6SJa+u/hXHeki0bKv30RDm7uFCOqk
 l8ZJUzP+YOLBfrdlS2bimjlLWXG779xXM3DNX/kMTOqmIVe1ERuVqeqR/DcEQpM6T41HI2pWmmM
 he3469wgaiw08TeTWyg==
X-Proofpoint-ORIG-GUID: T-mnfefVzomeOjjJGEdBDq4r5dnE3xzM
X-Authority-Analysis: v=2.4 cv=Wsa+otfv c=1 sm=1 tr=0 ts=6aa3a700 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ZP9fceawhsPimmF_JtQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110095

The driver uses a static XFER_TIMEOUT of HZ (1 second) for all transfers
regardless of message length or bus frequency, causing unnecessary
delays on error paths.

Use i2c_update_timeout() API to calculate transfer timeouts dynamically
based on message length and bus frequency. update the timeout per message
for FIFO, SE-DMA and GPI single descriptor transfers. For GPI multi
descriptor transfers, calculate the timeout from the combined length of
all messages, as completion is reported only after the entire batch has
finished.

A 10x safety margin over the theoretical wire time is applied, with a
300ms floor to account for I2C clock stretching and other situations where
a slave may keep SCL asserted for an extended period, including faulty
devices holding the bus.

Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 48 +++++++++++++++++++++++++++++++-------
 1 file changed, 39 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 658636c1ee0e..203f4d627ca1 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -79,9 +79,14 @@ enum geni_i2c_err_code {
 
 #define ABORT_TIMEOUT		HZ
 #define CANCEL_TIMEOUT		HZ
-#define XFER_TIMEOUT		HZ
 #define RST_TIMEOUT		HZ
 
+/* 9 bits per byte (8 data + 1 ACK), 10x safety margin */
+#define I2C_TIMEOUT_SAFETY_COEFFICIENT	10
+
+/* 300ms floor: budget for clock stretching; slave may hold SCL low indefinitely */
+#define I2C_TIMEOUT_MIN_USEC		300000
+
 struct geni_i2c_desc {
 	bool no_dma_support;
 	unsigned int tx_fifo_depth;
@@ -513,7 +518,10 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 	}
 
 	cur = gi2c->cur;
-	time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
+	i2c_update_timeout(&gi2c->adap, gi2c->clk_freq_out, len,
+			   I2C_TIMEOUT_SAFETY_COEFFICIENT,
+			   I2C_TIMEOUT_MIN_USEC);
+	time_left = wait_for_completion_timeout(&gi2c->done, gi2c->adap.timeout);
 	if (!time_left || (gi2c->err && gi2c->err != gi2c_log[ADDR_NACK].err))
 		geni_i2c_cancel_xfer(gi2c);
 
@@ -555,7 +563,10 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 		writel_relaxed(1, se->base + SE_GENI_TX_WATERMARK_REG);
 
 	cur = gi2c->cur;
-	time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
+	i2c_update_timeout(&gi2c->adap, gi2c->clk_freq_out, len,
+			   I2C_TIMEOUT_SAFETY_COEFFICIENT,
+			   I2C_TIMEOUT_MIN_USEC);
+	time_left = wait_for_completion_timeout(&gi2c->done, gi2c->adap.timeout);
 	if (!time_left || (gi2c->err && gi2c->err != gi2c_log[ADDR_NACK].err))
 		geni_i2c_cancel_xfer(gi2c);
 
@@ -633,7 +644,7 @@ static void geni_i2c_gpi_multi_desc_unmap(struct geni_i2c_dev *gi2c, struct i2c_
  * geni_i2c_gpi_multi_xfer_timeout_handler() - Handles multi message transfer timeout
  * @dev: Pointer to the corresponding dev node
  * @multi_xfer: Pointer to the geni_i2c_gpi_multi_desc_xfer
- * @transfer_timeout_msecs: Timeout value in milliseconds
+ * @timeout_jiffies: Per-message completion timeout in jiffies
  * @transfer_comp: Completion object of the transfer
  *
  * This function waits for the completion of each processed transfer messages
@@ -643,18 +654,18 @@ static void geni_i2c_gpi_multi_desc_unmap(struct geni_i2c_dev *gi2c, struct i2c_
  */
 static int geni_i2c_gpi_multi_xfer_timeout_handler(struct device *dev,
 						   struct geni_i2c_gpi_multi_desc_xfer *multi_xfer,
-						   u32 transfer_timeout_msecs,
+						   unsigned long timeout_jiffies,
 						   struct completion *transfer_comp)
 {
 	int i;
-	u32 time_left;
+	unsigned long time_left;
 
 	for (i = 0; i < multi_xfer->msg_idx_cnt - 1; i++) {
 		reinit_completion(transfer_comp);
 
 		if (multi_xfer->msg_idx_cnt != multi_xfer->irq_cnt) {
 			time_left = wait_for_completion_timeout(transfer_comp,
-								transfer_timeout_msecs);
+								timeout_jiffies);
 			if (!time_left) {
 				dev_err(dev, "%s: Transfer timeout\n", __func__);
 				return -ETIMEDOUT;
@@ -778,8 +789,24 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[],
 		dma_async_issue_pending(gi2c->tx_c);
 
 		if ((msg_idx == (gi2c->num_msgs - 1)) || flags & DMA_PREP_INTERRUPT) {
+			size_t total_len = 0;
+			int j;
+
+			/*
+			 * All TREs except the last carry the BEI bit, so a single
+			 * completion interrupt fires only after the entire batch has
+			 * drained on the wire. The timeout budget must therefore cover
+			 * the combined wire time of every message in the batch.
+			 */
+			for (j = 0; j < gi2c->num_msgs; j++)
+				total_len += msgs[j].len;
+
+			i2c_update_timeout(&gi2c->adap, gi2c->clk_freq_out, total_len,
+					   I2C_TIMEOUT_SAFETY_COEFFICIENT,
+					   I2C_TIMEOUT_MIN_USEC);
 			ret = geni_i2c_gpi_multi_xfer_timeout_handler(gi2c->se.dev, gi2c_gpi_xfer,
-								      XFER_TIMEOUT, &gi2c->done);
+								      gi2c->adap.timeout,
+								      &gi2c->done);
 			if (ret) {
 				dev_err(gi2c->se.dev,
 					"I2C multi write msg transfer timeout: %d\n",
@@ -899,7 +926,10 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
 
 		if (!gi2c->is_tx_multi_desc_xfer) {
 			dma_async_issue_pending(gi2c->tx_c);
-			time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
+			i2c_update_timeout(&gi2c->adap, gi2c->clk_freq_out, msgs[i].len,
+					   I2C_TIMEOUT_SAFETY_COEFFICIENT,
+					   I2C_TIMEOUT_MIN_USEC);
+			time_left = wait_for_completion_timeout(&gi2c->done, gi2c->adap.timeout);
 			if (!time_left) {
 				dev_err(gi2c->se.dev, "%s:I2C timeout\n", __func__);
 				gi2c->err = -ETIMEDOUT;

-- 
2.34.1

