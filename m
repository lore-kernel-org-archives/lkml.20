Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793078013;
	b=0h0aqIr8G5WO4A31iw4exsaIuM3BNXMtRSoRb4WrE6NxYBb93WbgYPb3K1DdzeilD7rR
	 PMlWkDimd1cdJpT9Zi4aIYM+tpHcps+OQVIaW4QCT362VmMua3HmsCmTbBf4FTFK0Tf2S
	 jZD3pJwqAUbYDuxe/DjMM4CXfFN7I1t2X4KPUK/RdiSn5rtGdPQsiKDBWlmF4SFbkMjtx
	 6sUbzqN5Rh2dAWuvz/fNqfRvpaz4tL9OdSRIA5+ZTHrolRJ+RHBDrFdPRCDTDPlf6Q/Qs
	 Yw1e4NzAbGq81yy3bBtdVm80ooWD8qqxC/jPISjjNXgWCNWIQSI6nj9TdlDTtCpQ4Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793078013;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uErim8DukeMDkRNj1wJHSqyu4bz95cd5diBOlAokiJM=;
	b=ghWmSKy39V9iLqZaGFxBoiYXEja3osRWzRx3OiWtjlkbDk5LLG25Ews8ToV/trurknc+
	 LV9RuZdd9plGJ+fkuvyYqyK3mchMt7c5VqqjqfDyKyUTctHrFyf/nVm18Qk3xoy5/TegH
	 yUHkClCxBQlBAEhep2WDjXk8hjBD2nkUTGlyOXVwOEMOymNAlkiX7JAebaE26P0DweZi5
	 1f7IccVUT3rXm7uzHbz6eK/Se4wai1VqlO4hQ8XApUkWtK2hUmYjxxQzxThv5O7h9S2aa
	 cVqVcrRzfD4UNi4i3ickNpR5+d1ekeXPyBCSFt9rGxHUllpjCT2YfHMbOpMf/gu47pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mHt0KsrW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kQmJR63L;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AAC606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:13:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85AAC606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mHt0KsrW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kQmJR63L
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R2F1VV321760
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:13:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uErim8DukeMDkRNj1wJHSqyu4bz95cd5diBOlAokiJM=; b=mHt0KsrWIUvVK/Ud
	3qrjsNy9MVEu/Gx238ReKuiXjzFR4LlI4ifCCuav7qbbSwhX3SCWcMeOkyUnALB4
	JIW69YYYk/YsTHtFpXbSAODBa0PV2q28l/oC/LItWX216mzrJ6tes0slMCYuZlNF
	3oSFKdVJZ0RcBIi3PNbeGRQyEAIIm6+2ie0G6Ov+0gCPO54slFw8m2gzYoPQGCe3
	fZoKGMhYsfG6rLRTcB9ckC8+TeiT2+1UNvKLZReHF3QB5nx7O1sQ1bHAT8UMnuy6
	cCkNcNlWAfRKG5WuHZ5beG9F/C0IUyAU+bmFTkKY3+PT9N0Pg1pYWJ5s53wWHqyg
	5m/j2w==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjbmma0je-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:13:31 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1a2f2ea3c3cso1504170c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793078011; x=1793682811; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uErim8DukeMDkRNj1wJHSqyu4bz95cd5diBOlAokiJM=;
        b=kQmJR63LhsUmiAgPk16k2r2ibkhLz9LOLtD+EUeXkFGCECUXuEcuqu5pXB6ofGKQ4O
         ghSN2EfqpKVVKSKIM1R4gEh+7RA8oTOkMn8NaxO8ZsP3BDPr5LCpWHadIPw/2TT6TxQ8
         ApBMhmFNDTBg1NxYUgEdIYdIeOS3Rq/9LXuFteMTW6F+krHnq7Ieo2wBNl4n6dUN8b2l
         /IXPwzgOJLqV3MIOkspY8G3SqwTrzuDxMrfi+Up0+s2jI429qpjHAyTA6Vl67Crrf2k/
         4ZEMZiniYW6Css3CY5X5NIYBR5TYSOqSoIT9XYKjj6RIGs1Bw/u6g/9nee33RWHGRyFQ
         S1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793078011; x=1793682811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uErim8DukeMDkRNj1wJHSqyu4bz95cd5diBOlAokiJM=;
        b=MOfH3JxJZ/2SIfaeBncCsaoNC2qLB0qid46UfEF+h0xp00JnoQlRNCT8mSbXV6XhNx
         7+JqI11hoiinobjGd8fW+FDw89fBPJSngejH20BWlLihnNeewlVxQnWOQ/nQ3cWpBKMg
         txqaAPbfk4UigoNwB2Ke0oIkQQypVGsEbH4951TRsPKuBxlOQz1mYAEi/TdNc7frbRng
         BnyaEndy+OAty6m2RPTwa+RjypXhrD6M10dVGi0DDZ5bhflR7SKnAUTYtyXHoDDxcdiO
         2tQCOFX7+Vil991F+geb4Ohgo+4EapdAAhNI2fWVz6PlLJdhXEV97pfVTyF5CEjD9W8B
         4nTg==
X-Forwarded-Encrypted: i=1; AKwUvBxk8+ZF2wrSxKbToxdrAC9STI0Mf/zd6x3zbgnrOFt58JgaGMThrHlEBf4ZUv8SbSoKSjyBGFtUPtSZb9Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYIO3SryCcYCvILUr+liH3AnbqWF0HIyOa9l4rmPjUc7Sqd3+2wj
	BA3NW4dw6IO0rHhRFjeHBS4rWejLmv1xDLPhUjoDa6A/+gLQzI9hkbAOAPPdP5bQKRliP7AXN2y
	BcZpIyW2TD3y2duH/JlML1oU91pguHitaPizTn9RZwAUZgboPyE7LKBshO5pu9PR8qOU=
X-Gm-Gg: AYBFou2RHGjScokxBWVU2NirZ/2Zv5X0uvXett2GVc7Ag9OGFormuTU98TbUNi5GhLw
	4x7bqanuFWM9+jxAsNPzSUm2pF4HnULyN+LNPoqIEk3f9JgDGuCgm7c4fc3kC316fRE4nbeyK9I
	+tRcB8BPzoX8NzVWmr2Xhcuyi+H/ko+zDRk4GY2/um4V8JRy2QSzRZNXA0/TqMAoak+UXiYXs3l
	goMM+iw/5ytxnJr3nIelletrc1CL9FwC/w4s4/V9cxlD6wvy8H5W8Q0Bw5JRKQdzVdZD8byaOOQ
	onI/CTGPPMTFg6Ce7oHmf3Ru57WslE/OpmO6fmQiSR3RbCieyJcvRfysdRGqAtRxpnLFLsUIFdX
	A/CKiBhvQqdP83YBWuQr2XopyaXM2W6nL2A==
X-Received: by 2002:a05:7022:1509:b0:14f:99a2:1715 with SMTP id a92af1059eb24-19937caa4famr13817155c88.39.1793078011016;
        Mon, 26 Oct 2026 22:13:31 -0700 (PDT)
X-Received: by 2002:a05:7022:1509:b0:14f:99a2:1715 with SMTP id a92af1059eb24-19937caa4famr13817132c88.39.1793078010406;
        Mon, 26 Oct 2026 22:13:30 -0700 (PDT)
Received: from hu-arandive-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a249c331sm62298866c88.17.2026.10.26.22.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 22:13:29 -0700 (PDT)
From: Aniket Randive <aniket.randive@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 10:43:16 +0530
Subject: [PATCH v3 2/3] i2c: qcom-geni: Add bus recovery support for FIFO
 mode
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-20260826_aniket_randive_oss_qualcomm_com-v3-2-7f2a6e572de9@oss.qualcomm.com>
References: <20261027-20260826_aniket_randive_oss_qualcomm_com-v3-0-7f2a6e572de9@oss.qualcomm.com>
In-Reply-To: <20261027-20260826_aniket_randive_oss_qualcomm_com-v3-0-7f2a6e572de9@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: naresh.maramaina@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Aniket Randive <aniket.randive@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793077998; l=6402;
 i=aniket.randive@oss.qualcomm.com; s=20260325; h=from:subject:message-id;
 bh=o0J0kibqlXhO4DIPwCCWCQC+HGKMENvQOqka+uOfX5g=;
 b=V2Z1AU6IZYdSF9BjNCoW+Gq3OSvp1lc5Pci9dZ8L82xzNaPAWV4aIoiKmbrTIK6IYP1vuMbWE
 L/sw3zlTWlsDp/DDbXy8REE1ST5LBND335SsjHphYPmQlU2GAs+mDtG
X-Developer-Key: i=aniket.randive@oss.qualcomm.com; a=ed25519;
 pk=4o37X1ZqGbCO/T2SR8kq/HnWvq0yb1RUlFuNukovbQk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAyMCBTYWx0ZWRfXy6mXec+whrFE
 KM7qAfcHFHKmNmYiKsBQzn1LbPkxZgJ1ec6JM4b7FMGbZaigAEtrgH3ypwzzdRgsy/zibUx0VAf
 EjW4GHJ4lrHRaFW3BhIvSH/oUaz/5NQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAyMCBTYWx0ZWRfXz08IsLYf4NRt
 CtJAjk+mqYwcn4Ibsfw3y+ga7+WDEj/azRZFxK5MrNMCgx+G/AYmjA9yMI91OLbPYhjaIqWSsbq
 jjftZmypREiGMhrAG+kww6767T0DcI0LckFvf/SOWagzOWRq1c+caMJznNaK4su1uMju42IdUOM
 S92RK3VKc+9P9ZpnwgGs3gdYKMQXsDYf+CX3qPoBo8bOnYbWFOPrU5FteqA+EMEyWrxdEfRipMN
 VUpaS46aVr48LMUld9OGZPKnU5CTVK17BJHUGlKDThLKxCusEm3ccfhb8cmCymSHWJQYCJTMkQ2
 wUHC14dC2PY1Z9bGMqW2RfuKsziPCzMYQNijH4MXCRlhVMcWcTQDNSEmFDh3qJYFqk4/mXvA2R+
 j/oS7lZxKOrowpfqFFS4m+ekyEr4RUwYtuX6MBqWbR4O2z/pmpMfWGhEqdlf0JX/bSDobkgbs7L
 UsnwyMZxvIgzVTDTuIQ==
X-Authority-Analysis: v=2.4 cv=PrkG/AM3 c=1 sm=1 tr=0 ts=6ae032fb cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=c5Wb_hjG3JCSEPZH9V0A:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: PN8XF8ExcF_Wq1u9vadxCld-Y8GeoWDs
X-Proofpoint-GUID: PN8XF8ExcF_Wq1u9vadxCld-Y8GeoWDs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270020

I2C transfers in FIFO mode can fail with -EPROTO, -ETIMEDOUT or
-EAGAIN when a target holds SDA low, leaving the bus stuck and
preventing subsequent transactions.

Add bus recovery support using the I2C_BUS_CLEAR and I2C_STOP_ON_BUS
hardware opcodes to restore the bus to an idle state. Check the SDA
line state through SE_GENI_IOS.RX_DATA_IN and skip recovery when the
bus is already free. Trigger recovery automatically from
geni_i2c_xfer() on -EPROTO, -ETIMEDOUT and -EAGAIN (arbitration-lost)
errors, and register the recovery callback through i2c_bus_recovery_info
to allow recovery via i2c_recover_bus().

Use the adapter timeout for recovery commands. Configure the serial clock
and bus timing after runtime resume so direct calls to i2c_recover_bus()
do not depend on an earlier transfer having configured them.

This adds bus recovery support for FIFO mode only.

Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 127 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 126 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 60b6273f538c..d9e86f110ae9 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -34,6 +34,7 @@
 #define I2C_READ		0x2
 #define I2C_WRITE_READ		0x3
 #define I2C_ADDR_ONLY		0x4
+#define I2C_BUS_FREE		(RX_DATA_IN | IO2_DATA_IN)
 /* M_CMD params for I2C */
 #define PRE_CMD_DELAY		BIT(0)
 #define TIMESTAMP_BEFORE	BIT(1)
@@ -145,6 +146,7 @@ struct geni_i2c_dev {
 	u32 num_msgs;
 	struct geni_i2c_gpi_multi_desc_xfer i2c_multi_desc_config;
 	const struct geni_i2c_desc *dev_data;
+	struct i2c_bus_recovery_info rinfo;
 };
 
 struct geni_i2c_err_log {
@@ -316,7 +318,7 @@ static void geni_i2c_check_addr_data_nack(struct geni_i2c_dev *gi2c)
 {
 	if (!readl_relaxed(gi2c->se.base + SE_GENI_M_GP_LENGTH))
 		geni_i2c_err(gi2c, ADDR_NACK);
-	else if (!(gi2c->cur->flags & I2C_M_RD))
+	else if (gi2c->cur && !(gi2c->cur->flags & I2C_M_RD))
 		geni_i2c_err(gi2c, DATA_NACK);
 }
 
@@ -1013,6 +1015,115 @@ static int geni_i2c_fifo_xfer(struct geni_i2c_dev *gi2c,
 	return num;
 }
 
+static int geni_i2c_fifo_bus_cmd(struct geni_i2c_dev *gi2c, u32 cmd)
+{
+	unsigned long time_left;
+	unsigned long flags;
+
+	/*
+	 * Clear cur so the IRQ handler does not attempt FIFO watermark
+	 * filling or draining while the recovery opcode is in flight.
+	 * cur and err are shared with geni_i2c_irq(), which reads cur and
+	 * writes err under gi2c->lock, so take the lock around this reset.
+	 */
+	spin_lock_irqsave(&gi2c->lock, flags);
+	gi2c->cur = NULL;
+	gi2c->err = 0;
+	spin_unlock_irqrestore(&gi2c->lock, flags);
+	geni_se_select_mode(&gi2c->se, GENI_SE_FIFO);
+	reinit_completion(&gi2c->done);
+
+	geni_se_setup_m_cmd(&gi2c->se, cmd, 0);
+	time_left = wait_for_completion_timeout(&gi2c->done, gi2c->adap.timeout);
+	if (!time_left) {
+		dev_err(gi2c->se.dev, "timeout waiting for bus cmd %u\n", cmd);
+		geni_i2c_abort_xfer(gi2c);
+
+		return -ETIMEDOUT;
+	}
+
+	/*
+	 * ARB_LOST and BUS_PROTO interrupts may be reported while the bus
+	 * transitions from stuck to idle during the recovery sequence.
+	 * The opcode completed successfully so treat these as success.
+	 */
+	if (gi2c->err == -EAGAIN || gi2c->err == -EPROTO)
+		return 0;
+
+	return gi2c->err;
+}
+
+static bool geni_i2c_bus_is_free(struct geni_i2c_dev *gi2c)
+{
+	return (readl_relaxed(gi2c->se.base + SE_GENI_IOS) & I2C_BUS_FREE) ==
+	       I2C_BUS_FREE;
+}
+
+static bool geni_i2c_needs_bus_recovery(struct geni_i2c_dev *gi2c, int ret)
+{
+	/*
+	 * -EPROTO and -ETIMEDOUT indicate bus errors where the target may be
+	 * holding a bus line low. ARB_LOST (-EAGAIN) on a single-controller
+	 * bus indicates a stuck target, not a real arbitration loss.
+	 * GPI DMA mode extends this trigger separately.
+	 */
+	return !gi2c->gpi_mode &&
+	       (ret == -EPROTO || ret == -ETIMEDOUT || ret == -EAGAIN) &&
+	       !geni_i2c_bus_is_free(gi2c);
+}
+
+static int geni_i2c_recover_bus(struct i2c_adapter *adap)
+{
+	struct geni_i2c_dev *gi2c = i2c_get_adapdata(adap);
+	u32 ios;
+	int ret;
+
+	ret = pm_runtime_get_sync(gi2c->se.dev);
+	if (ret < 0) {
+		dev_err(gi2c->se.dev, "bus recovery failed, error turning SE resources:%d\n", ret);
+		pm_runtime_put_noidle(gi2c->se.dev);
+		return ret;
+	}
+
+	ret = gi2c->dev_data->set_rate(&gi2c->se, gi2c->clk_freq_out);
+	if (ret) {
+		dev_err(gi2c->se.dev, "bus recovery failed, error setting clock rate: %d\n",
+			ret);
+		pm_runtime_put_autosuspend(gi2c->se.dev);
+		return ret;
+	}
+
+	if (geni_i2c_bus_is_free(gi2c)) {
+		pm_runtime_put_autosuspend(gi2c->se.dev);
+		return 0;
+	}
+
+	/* Bus clear cannot recover a target holding SCL low. */
+	ios = readl_relaxed(gi2c->se.base + SE_GENI_IOS);
+	if (!(ios & IO2_DATA_IN)) {
+		pm_runtime_put_autosuspend(gi2c->se.dev);
+		return -EBUSY;
+	}
+
+	ret = geni_i2c_fifo_bus_cmd(gi2c, I2C_BUS_CLEAR);
+	if (!ret)
+		ret = geni_i2c_fifo_bus_cmd(gi2c, I2C_STOP_ON_BUS);
+
+	/*
+	 * Recovery succeeds only once both bus lines are released. The bus
+	 * state is the authority, while a clean opcode status with either
+	 * line low is a failed recovery.
+	 */
+	if (geni_i2c_bus_is_free(gi2c))
+		ret = 0;
+	else if (!ret)
+		ret = -EBUSY;
+
+	pm_runtime_put_autosuspend(gi2c->se.dev);
+
+	return ret;
+}
+
 static int geni_i2c_xfer(struct i2c_adapter *adap,
 			 struct i2c_msg msgs[],
 			 int num)
@@ -1037,6 +1148,15 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
 	else
 		ret = geni_i2c_fifo_xfer(gi2c, msgs, num);
 
+	if (geni_i2c_needs_bus_recovery(gi2c, ret)) {
+		int recovery_ret = i2c_recover_bus(adap);
+
+		if (recovery_ret)
+			dev_err(gi2c->se.dev,
+				"bus recovery failed: %d (xfer error: %d)\n",
+				recovery_ret, ret);
+	}
+
 out_pm:
 	pm_runtime_put_autosuspend(gi2c->se.dev);
 	gi2c->cur = NULL;
@@ -1239,6 +1359,11 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
+	if (!gi2c->gpi_mode) {
+		gi2c->rinfo.recover_bus = geni_i2c_recover_bus;
+		gi2c->adap.bus_recovery_info = &gi2c->rinfo;
+	}
+
 	ret = i2c_add_adapter(&gi2c->adap);
 	if (ret) {
 		release_gpi_dma(gi2c);

-- 
2.34.1

