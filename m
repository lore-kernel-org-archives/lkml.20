Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF61448BBE
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 12:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787833689; cv=none; b=pwDBLHC7lcxKhr1m0vksvQeZrmJCyDis8ibrC91qzKJpcs5NicFrxqT4eCzVaYKi1uS+RAzR5A1J7NQcApXkjW/bAHZo9pqHDsGfiAy8z7K6haopClI3x/cm0RX5yHVCk1dwwPZDPL4f9vFfYIIIL6+nJfbw/4YO4RjJFdT0cCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787833689; c=relaxed/simple;
	bh=ZeptbrLh2OAqJST6zmSGFm03zkKujLOAAacfUDgoLFY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pxa9pwgsnbBpFcKaJs7obmDecEDgI3UR0vup3U1jbBl+Gr9DBfOyHJ/609+WzKoxE+oy139jcTTXP3uJn31DnFGEe9HjY06T8ZVzRH4h/2ehIJRE1miVx/hLDOGX+/iZyi9RfW9/BljRUrfq1fxkKkwP+zParpjMdboP0F++Lvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UWu+isjq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H3tLGYm6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UWu+isjq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H3tLGYm6"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RCBvmW166457
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 12:28:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Z1YXiYze4iuUm3nc80GrxGrzMdPVj6ylSouQ8wpXYM=; b=UWu+isjq0r3IJa/i
	2lJm9/uDXti5yQp25nAZsQwAschWsAd63j3uVO1CXaD/oMJK4yVfysbpOXv37kKm
	Dyfsamaq5o9AiBUwqnEAj3EUfqvoevWXSt1bQrvoovPhAj5HNLRifwLl8q5RKYUN
	3hbKogaLTymE29ZnEVnMF9Tj1VAJjIEDQ46jkDacO9PFSrKvKkBlT7ivucwUbvU9
	tO2n8K0tlJbBDyuDttqwo5LhFszXVZzVJR4eK47klLp03dtreukilbJfjfywDWCO
	WCngNJDBN6xs9FpoAgh0a5e95f3pY5MdkhR2DVSDaN9vumg+75bUN7wngCQ+09zE
	Oyfxqw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga4egkpxf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 12:28:06 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e475f83a2so1246678a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 05:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787833685; x=1788438485; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Z1YXiYze4iuUm3nc80GrxGrzMdPVj6ylSouQ8wpXYM=;
        b=H3tLGYm69mMofBzW4q8Gmm/q7r5SSk77vfAcIJt5n5QshOxPOd0bCwm6bj3Sqt6LRY
         06QQPwgoI7aOh23biZHsT7cXc5JAvdgV4Bpqn9vExsEf335e29F1uZCE6S0vreJVhZDB
         /K3THoqbHHfkvZO5TgqDfnBuGec9bEwpmtotDEzRI1DfyeoZzcV5gW5bbaBfgmTiAS0O
         b+rHvPB/sIICCdF3ARdDX8fL7tJdbhl+DgcjAWDR0iznPn3GbbkqNqGNV6C35dy06eVD
         WKwNLmDHvS2shq5Vrp70RfxHaFnRSGrTjt2cezMq0HuDr9NUTTuK92GwBC7nQ3ZI6EW2
         6MtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787833685; x=1788438485;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Z1YXiYze4iuUm3nc80GrxGrzMdPVj6ylSouQ8wpXYM=;
        b=QL+cezDdYHNYTKDpIxkeeik2/oBnOH58K9FuSlwoBbAcbe6g4h+HO5gSKCFKDq8ZNJ
         ZiWY3ImMXNEyz9/QROTjj/kwjC+GXW8rOLHskxhddwZ1nFOEnV8nBLJBQm8Wb/GmorEm
         8kE6sbPNC6X86WuRLQbRYf5d6/h/kA/q6ifi6rz/pMNS3sIanjXEqxUAOsd15zVMDFO8
         skQrK8fBdvsxtoft19Dwk/dHyspT5Y3wAoqN0bn14OhhXpxsKCHScUXr4aBBbaKZUW/z
         cx2fu6yqCknydN0TWUjGYURivAgeKi5KEOjcWhH/pB8O6f/yppv6wNcqhnn0wUn9P6Ds
         TiCg==
X-Forwarded-Encrypted: i=1; AHgh+RqthCH5uPOgfsZ3/Ayxx4XyhbTKKXCluotnfXyX6ovg+rEhv8KRlcBXLD8Bqa9EtJnxgBY8gioNmimAKNA=@vger.kernel.org
X-Gm-Message-State: AFuF++mx4ZUeNnqS0Pg8cd2reIUtI0wXfBAp9pp+eC/RM45b29mLkv2O
	hp89Ro7ikpdihtFnEsORK5muKZztKvDhdPcSY5w5nx0o6aFThr588ivn4mKvHB0dt9i4YdXsccG
	liCMln/wZFBi0CfmUVK1Ybe20vbvPN/yVoHtL5GN+52mJ7dBXFq7J4LWmQAJW2psXDIk=
X-Gm-Gg: AR+sD13rM22uh7cQ+iPIwHrkGXrhMWMtQweVuVIlaFU9nz1h7ODrnHhk2vE4vYlbrb5
	5dV+3MTgyAKqt/8xEqZzsavTQEcTLVSglqlqQasH2juQXk11l3RgLro5pDzEkZWunNLAZFlcRr3
	pVaIOCCLnWOsXmYcC05k1W1zXgjS2fF+JpTcfeSStUB+XQWO3m/GcZI6OZso2eJWc/BEorSWysM
	2KH8Fy0CNTNT3QrrBtas9LS4RtGSRDt2VZ/1i/IP54pGstBzCMs8qURji4rFJrUGHblWY2apRB6
	ZtTAWRyDWEbgqXd/c9qQ4+r49MHZ5ATkI1F8eHCp2H2Xo4Awqaq7xcqJgnxA24umkLwdtEf+iV5
	pRR22w/wZJfR693dv+V+gEGS1Grc2pvIgxnw=
X-Received: by 2002:a17:90a:d2ce:b0:393:1d92:db5 with SMTP id 98e67ed59e1d1-3966d3dc5ecmr31793505a91.10.1787833685414;
        Thu, 27 Aug 2026 05:28:05 -0700 (PDT)
X-Received: by 2002:a17:90a:d2ce:b0:393:1d92:db5 with SMTP id 98e67ed59e1d1-3966d3dc5ecmr31793376a91.10.1787833684918;
        Thu, 27 Aug 2026 05:28:04 -0700 (PDT)
Received: from hu-arandive-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fcfa3asm2707690a91.6.2026.08.27.05.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 05:28:04 -0700 (PDT)
From: Aniket Randive <aniket.randive@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 17:57:51 +0530
Subject: [PATCH v8 2/2] i2c: qcom-geni: Add dynamic transfer timeout based
 on transfer length and frequency
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-master-v8-2-596bc81c5cf9@oss.qualcomm.com>
References: <20260827-master-v8-0-596bc81c5cf9@oss.qualcomm.com>
In-Reply-To: <20260827-master-v8-0-596bc81c5cf9@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Cc: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Aniket Randive <aniket.randive@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787833673; l=5805;
 i=aniket.randive@oss.qualcomm.com; s=20260325; h=from:subject:message-id;
 bh=ZeptbrLh2OAqJST6zmSGFm03zkKujLOAAacfUDgoLFY=;
 b=cun3mFMSgdZ9V4Zeqxn7Jif5Dm2wuXhB8pTyKVDbrK/2FCEGUctvr7pKC+4mTurIt9PErFxta
 71yXrJrYb1pB4bWcWcrsVmzGVrwC28NVDklcd7QbclbyKsV+9k8dXGE
X-Developer-Key: i=aniket.randive@oss.qualcomm.com; a=ed25519;
 pk=4o37X1ZqGbCO/T2SR8kq/HnWvq0yb1RUlFuNukovbQk=
X-Proofpoint-GUID: VxPmQHfvy5uwe008g53ZbHe8qsNwnshN
X-Proofpoint-ORIG-GUID: VxPmQHfvy5uwe008g53ZbHe8qsNwnshN
X-Authority-Analysis: v=2.4 cv=DsRmPm/+ c=1 sm=1 tr=0 ts=6a902d56 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ZP9fceawhsPimmF_JtQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDEwNCBTYWx0ZWRfXxOyDG1L41+eQ
 xw1gr1VHscqTGZAjTcfLZ4AJFtA2eE1WQdr1qHIQwNo9n0yvZixX0PXiB+YClTZi2tG3Z1JkyJ/
 qoZMv7gu5HCW2f/QNhfMkwCFcwJdNUsZefk2VCNj/abzadldaoRFf4QXWy9pORD9ePM+j3rFCzY
 HDs/y1kolIJrgwSTGUob8p8XEGQSfpG8WQ9KeNoE8aZbU70cnx+ZxOAYx6Obq4shQ4I8tpAiNhm
 81aIJXsczkIaOKpF+SWpJ6rxGY7z46I4suvmoIwEK6eLo1s1J/14tHzS/cKYJS2uMDnpLcaGEew
 ICj3iWQA4YYaqfklVm26MxKOP56TEhLg2yTaT2QxvespvascJJeNKqHsAgh5ROEynPZ5zESqemO
 yUB5D9UBBXjvu8THT3tfcA9pmVeTISht5WRlZXoe/Y4qYRqKfltjEdHfO9U++2oSVnDtMbngWc8
 tTnN6rpB1E9vYS4Mvcw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDEwNCBTYWx0ZWRfX5t3YL7FEqfik
 RCA/qKytOGTNkhRZkzfntfSEPaR41NHmRaNM7zKO2yJ3mLiln8cXVFyRGPNKIgXEk7fq1XQjG4Z
 H/7utNcAldjgmZhDdi936bn08a6XrnM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_05,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270104

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

