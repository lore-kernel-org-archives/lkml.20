Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792756756;
	b=Hb0VPc7NYwhv98mC8Ah2PX7yXMzMZgPwBdbyVf7H5iw0l5lk5EMkxPt8D6vEhE+BqrK/
	 qD7N4rniYmbPGT7zQjtFFiTpxG6l0Ek6IW788Kmc7cqmrAS2991EkLN6nobf8Jx4kjyUj
	 ZFhNPnNhmgmOHbmvIQoBFzGTCblIdz6CoQnSJYPW/5zT37/P8jSg2fQV7oToyKVjBatuO
	 VQ23zunht6TyZq8fZkDgpUTA5aFwSDSFSXnP4lKysYTDbuS8yOl2fY+B3flMH36rUoskX
	 SPLR+vl9Y+dpdglmKqSYPb0jxUj9tuuUeNGYV4Wmm9ZfStq7OlQeQ+wpTmd+av6HRDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792756756;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=na6xSLnE3Pm8ngp1HS/VIQjflttDtqVqQqL2aDwuLBY=;
	b=vqnHs8mUeDMciEJZHeEDe2br4hDh6wUXlTRCkSjgUcbVIGjNSVkzmFJGfvVbk5ctsu5v
	 J/6FBiANT/fKVJMDtL8L27oJdEY50c3W6YwZUclXOx8AjMnbhKsE3eGrelHf3wusdDDIT
	 O0+RVTeo7oEYFvyaQSwX3Gq1h9CIPz6Ud3h3vAIZN5ZNttqBPMdLjTEnZtyWH4yYtDEA0
	 MCq2DhXNW0lB7pwVVxDQO5KjE50RBh3W8Vl9/mT2FDEYfKrZYiHcV6977dRYGlFVXy6/D
	 L2VgZHvUzqUAwMsgeCcBW8dl6UbQ5wKohx/U5RvVpuJVcrnKnYKoeitN2rgExreo29w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Koch2Aal;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dqXiNvpS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DAE3606A326
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:59:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DAE3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Koch2Aal;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dqXiNvpS
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAASKD2463082
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:59:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	na6xSLnE3Pm8ngp1HS/VIQjflttDtqVqQqL2aDwuLBY=; b=Koch2Aal/g0tnV2H
	XlAFj5CvuGHn5/ZdQ9q3MbzgEoHnN1JPkpnfhqAeAmWstNwKkucHiTd/hguxbv1U
	jEvj1gJYDqUiCpjmNrMFAxwdqIWpyR97PoBgAT5l27vJGWdTK5Z9mLjQ6aN08vtP
	8Lwqvp4XCUhYgJ8MSLpij8RF3XJ0bdyEPDF4Il56ZCbEvdt2zIwrcxmSKwt9CQqU
	DS0lcS6oiUJgLMbj1X07yV7yk1YPEd8BHXXUQYGMk0/l0cTE6XY3KtwmLidxX7Jr
	2E1ZFKnV38ReDZQWAtzQwWcR1yEMSiCPRxH0WDG5EOzCpJ0YTObzch9W3dkRzxVf
	lUjwbg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnyw41db-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:59:13 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3692c5b061bso2429606eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 04:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792756753; x=1793361553; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=na6xSLnE3Pm8ngp1HS/VIQjflttDtqVqQqL2aDwuLBY=;
        b=dqXiNvpSkUHYIQ3k3ueuZfDfV2sOUx/omvQlWTErSPhmdexk3MldJm6jiti/mcmpdQ
         ygTXFWy0C+gECbrcVSnxE2n4hrLiqymwgdwDOJncysDjtOoTNRZD258xLAWgG4Z/04vj
         /+W6XKa/g+hzHm9rQ1/GkgK3ewkF86wh3/6IA4zErWY1ivEuDmApi4P8ow4u8w3FUwt5
         0DmkTSN1N2O4H7hY2dF93qhjOI+z7WcFuz5X5svyxrxUR+X9pUo2e33FNTQGm4SIfFbV
         chJEKPj+NK6dvIy+9RPn4FWhvVkxXvNrFQ+QY+yXK5v/OWWLQfFsb6MB8H4HSg58vta6
         nViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792756753; x=1793361553;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=na6xSLnE3Pm8ngp1HS/VIQjflttDtqVqQqL2aDwuLBY=;
        b=x2UtOFFW8WyUTWBv9axIsW00EX95FUd7/xdWn1swl4tzs37jh6GOrsjFTgHMPv8oqx
         0EXm+7LK/WQSPeb2yYT/KVBfNdpXxqaEbBFqH9iyiWerE3fYPb1IrkYweNB3qrU6+l6g
         QPbG3SCKN2qEdrGSt6z4VZz85rT2KmMn2pTRLAxUE+18ip3cXIaKVI2MK3kdsw+FvaTH
         6R548/KdXjY1tKWRGSV92UtfqROMqdsy0YO05pNieZ4vu1YUPnxh7iw+EDCOVcZ6vHau
         +gk+LRkvaQbwRxWRGDancUDZCSsm6JnNppzO8uYwnmG2IvoHmTmBfHrnHXJrX14Lcauh
         aCtQ==
X-Forwarded-Encrypted: i=1; AKwUvBxXxZV48P3OddU3TlF4KTkInze7zQJpPMngRNKlaC/r5vd75yEkk/J93x28JseN+0X7miJIXa8Z+eOMX9c=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCcFdXysVQYwH2iPSjfr5X97yn/eXz1scARDssCIdX3nF2P/Di
	f8M/c2Cyt6d9EjKCGoCKe/szmlyHhdi9RdYxDMTiVThYZ3Xv1NqomLfBhb2rE4S8OyRWPNKGGFU
	t/tDdZiWOERnZ9cJZDHbpgqlrGZAVA5m5l+TdD63N1Tel3B1173V7YZ/WGgtzk/4ejWs=
X-Gm-Gg: AYBFou0C95La/hUUVIImDTnghWjBxvexBg7wOGtBhhF94dYxncBaa6zs3lz9oo8lAEJ
	RfTCSwfbttYD2/pkhbVOa9rkDNYeU7MqikRIWZT8Txn9RXxRRz6wZtxRswhxdN8E9GjWNL7soRs
	AnXIdaSPQiDYFOtVmio2xtTQiytR602YKgv0+d9qFNcVK1pc2CyjogdicnxQ5J9IuucpLRfpThF
	z8hVKMBPx3ua5PPQRILjxYFBySKdqN+fg1J2EK920126pN9nSBqrqQ8zl242q3LL9e9CDw7IhW2
	rFLpcyM2JXLJ09JEDKZoS3u7O6Rne6kfCC5znz1JBnYu+gsP44W6DS4o7TLJOQYFau5fSutZhSi
	jQhwvOl9G5p3UmyMc+brGynnt4I8cx25U2w==
X-Received: by 2002:a05:693c:4083:b0:367:414a:c8db with SMTP id 5a478bee46e88-369d975c6c1mr3066319eec.14.1792756752590;
        Fri, 23 Oct 2026 04:59:12 -0700 (PDT)
X-Received: by 2002:a05:693c:4083:b0:367:414a:c8db with SMTP id 5a478bee46e88-369d975c6c1mr3066266eec.14.1792756751838;
        Fri, 23 Oct 2026 04:59:11 -0700 (PDT)
Received: from hu-arandive-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9d5ea64sm8786134eec.5.2026.10.23.04.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 04:59:11 -0700 (PDT)
From: Aniket Randive <aniket.randive@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 17:27:59 +0530
Subject: [PATCH v2 3/3] i2c: qcom-geni: Add bus recovery support for GPI
 DMA mode
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
Message-Id: <20261023-20260826_aniket_randive_oss_qualcomm_com-v2-3-93572b453d6f@oss.qualcomm.com>
References: <20261023-20260826_aniket_randive_oss_qualcomm_com-v2-0-93572b453d6f@oss.qualcomm.com>
In-Reply-To: <20261023-20260826_aniket_randive_oss_qualcomm_com-v2-0-93572b453d6f@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: naresh.maramaina@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Aniket Randive <aniket.randive@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792756735; l=6225;
 i=aniket.randive@oss.qualcomm.com; s=20260325; h=from:subject:message-id;
 bh=4XUqVRHPT/nOQcSpYQFNUSSQOV8f0erhy6EgBgADG/k=;
 b=yZ+JJUchkli5/Ca6hUN4VwPukd7U2SgSV7eE8lHilPsi2ArYFrtf94BQ3x+M0G1LrWm/qN/AS
 PiX6P1KQdZdDxtmq/oWim4sjAQDAGrzF65mhpk53xjTZeRVmT6QZsA2
X-Developer-Key: i=aniket.randive@oss.qualcomm.com; a=ed25519;
 pk=4o37X1ZqGbCO/T2SR8kq/HnWvq0yb1RUlFuNukovbQk=
X-Proofpoint-GUID: YS_j6_7phlDhJrJ64411g5oR_MQz5mnG
X-Proofpoint-ORIG-GUID: YS_j6_7phlDhJrJ64411g5oR_MQz5mnG
X-Authority-Analysis: v=2.4 cv=dphOmFg4 c=1 sm=1 tr=0 ts=6adb4c11 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=tOGb6KSYT5r5fpq5OAUA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0NiBTYWx0ZWRfX707wW+4UYs8f
 Hi5x9+EsNKQux1BtLvmjXMEtmS8S7qwmmxg+MIAyGMlmeRZbIoOkPa9+8ZgqpSuxFYe3GpQZ+7k
 sKvIOCk4TDjdqIGvJLANJkl5BWEY33Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0NiBTYWx0ZWRfXyy2trwlXaaOK
 EaQwN1GgKAGm8I6HcvpDcZzsaIJggA+G/VQKsjU9wDBNjVAaI5fH1P+HAJyuWAw7NQfFMRiVpDc
 l2YuaM1QBfaxZQ6ZzU6rmAITdp9j5FWDW4Lf0rIzrxz1V+HLB2iPKS2x5jK/XMMpdkThbomERCu
 iYdY2HVW1yq2LpGpyC7dOzCqAk29Dt/ZSLsDEGl6PBmHp5beHdlPwAPS6LZk1k+lFdbR47SgdRU
 ymHZFRYnyO8TuE2kEhfVwhliQ8vZxZOP2M6F9HcbtiR5pk9oKuTPjjesxPK75qBE6xbvq5Kab3Z
 oXgPnrZkxUnNKrfJvCJ4zyvQP8w/bo6s13WcGLhr56XH/rz7m4SNUD2/MwoTsmNQimEy01rEsJj
 vGcuANN0EcD+ApalqBdCJd/QiQDkAEB2wH2L9M1+Gh3Vpa9RWuCM18SvnXJfAZXGwuysikLHmGk
 IxpjU3vER7kcJQaeSNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230046

I2C transfers in GPI DMA mode can fail with -EIO when a target holds
SDA low, leaving the bus stuck and preventing subsequent transactions.
The GPI completion callback reports a NACK and a genuine bus error
alike as -EIO, and the existing recovery path switches the SE to FIFO
mode which is not valid in GPI DMA mode.

Add bus recovery support using the I2C_BUS_CLEAR and I2C_STOP_ON_BUS
opcodes issued via the GPI TX DMA channel. Guard the -EIO recovery
trigger with a SE_GENI_IOS I2C_BUS_FREE check to skip recovery when both
SDA and SCL are already released. Extend the recovery callback to dispatch
through the GPI DMA path when gi2c->gpi_mode is set.

Use the adapter timeout for both FIFO and GPI recovery commands, and
preserve the DMA configuration error code when GPI setup fails.

Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 104 ++++++++++++++++++++++++++++++++-----
 1 file changed, 90 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 065d7240de04..31f811bdc051 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -1034,7 +1034,7 @@ static int geni_i2c_fifo_bus_cmd(struct geni_i2c_dev *gi2c, u32 cmd)
 	reinit_completion(&gi2c->done);
 
 	geni_se_setup_m_cmd(&gi2c->se, cmd, 0);
-	time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
+	time_left = wait_for_completion_timeout(&gi2c->done, gi2c->adap.timeout);
 	if (!time_left) {
 		dev_err(gi2c->se.dev, "timeout waiting for bus cmd %u\n", cmd);
 		geni_i2c_abort_xfer(gi2c);
@@ -1065,13 +1065,82 @@ static bool geni_i2c_needs_bus_recovery(struct geni_i2c_dev *gi2c, int ret)
 	 * -EPROTO and -ETIMEDOUT indicate bus errors where the target may be
 	 * holding a bus line low. ARB_LOST (-EAGAIN) on a single-controller
 	 * bus indicates a stuck target, not a real arbitration loss.
-	 * GPI DMA mode extends this trigger separately.
+	 * In GPI DMA mode the completion callback reports NACK, BUS_PROTO and
+	 * ARB_LOST alike as -EIO, so the SE_GENI_IOS I2C_BUS_FREE check
+	 * distinguishes a genuinely stuck bus from a benign NACK. Recovery is
+	 * skipped when both SDA and SCL are released (high) after the STOP.
 	 */
-	return !gi2c->gpi_mode &&
-	       (ret == -EPROTO || ret == -ETIMEDOUT || ret == -EAGAIN) &&
+	return (ret == -EPROTO || ret == -ETIMEDOUT || ret == -EAGAIN ||
+		(gi2c->gpi_mode && ret == -EIO)) &&
 	       !geni_i2c_bus_is_free(gi2c);
 }
 
+static int geni_i2c_gpi_bus_cmd(struct geni_i2c_dev *gi2c, enum i2c_op cmd)
+{
+	const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
+	struct dma_async_tx_descriptor *desc;
+	struct gpi_i2c_config peripheral = {};
+	struct dma_slave_config config = {};
+	unsigned long time_left;
+	unsigned long flags;
+	dma_cookie_t cookie;
+	int ret;
+
+	config.peripheral_config = &peripheral;
+	config.peripheral_size = sizeof(peripheral);
+
+	peripheral.set_config  = 1;
+	peripheral.pack_enable = I2C_PACK_TX | I2C_PACK_RX;
+	peripheral.cycle_count = itr->t_cycle_cnt;
+	peripheral.high_count  = itr->t_high_cnt;
+	peripheral.low_count   = itr->t_low_cnt;
+	peripheral.clk_div     = itr->clk_div;
+	peripheral.op          = cmd;
+
+	ret = dmaengine_slave_config(gi2c->tx_c, &config);
+	if (ret) {
+		dev_err(gi2c->se.dev, "dma config error %d for bus cmd %u\n", ret, cmd);
+		return ret;
+	}
+
+	desc = dmaengine_prep_slave_single(gi2c->tx_c, 0, 0, DMA_MEM_TO_DEV,
+					   DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
+	if (!desc)
+		return -EIO;
+
+	desc->callback_result = i2c_gpi_cb_result;
+	desc->callback_param = gi2c;
+
+	cookie = dmaengine_submit(desc);
+	if (dma_submit_error(cookie))
+		return -EIO;
+
+	/*
+	 * cur and err are shared with geni_i2c_irq() and the GPI callback
+	 * i2c_gpi_cb_result(); both write err (the IRQ handler under
+	 * gi2c->lock). Reset them under the lock before issuing the transfer.
+	 */
+	spin_lock_irqsave(&gi2c->lock, flags);
+	gi2c->cur = NULL;
+	gi2c->err = 0;
+	spin_unlock_irqrestore(&gi2c->lock, flags);
+	reinit_completion(&gi2c->done);
+	dma_async_issue_pending(gi2c->tx_c);
+
+	time_left = wait_for_completion_timeout(&gi2c->done, gi2c->adap.timeout);
+	if (!time_left) {
+		dev_err(gi2c->se.dev, "timeout waiting for GPI bus cmd %u\n", cmd);
+		dmaengine_terminate_sync(gi2c->tx_c);
+		return -ETIMEDOUT;
+	}
+
+	/* ARB_LOST and BUS_PROTO may be expected during recovery; treat as success */
+	if (gi2c->err == -EAGAIN || gi2c->err == -EPROTO)
+		return 0;
+
+	return gi2c->err;
+}
+
 static int geni_i2c_recover_bus(struct i2c_adapter *adap)
 {
 	struct geni_i2c_dev *gi2c = i2c_get_adapdata(adap);
@@ -1097,14 +1166,23 @@ static int geni_i2c_recover_bus(struct i2c_adapter *adap)
 		return -EBUSY;
 	}
 
-	ret = geni_i2c_fifo_bus_cmd(gi2c, I2C_BUS_CLEAR);
-	if (!ret)
-		ret = geni_i2c_fifo_bus_cmd(gi2c, I2C_STOP_ON_BUS);
+	if (gi2c->gpi_mode) {
+		ret = geni_i2c_gpi_bus_cmd(gi2c, I2C_BUS_CLEAR);
+		if (ret)
+			dev_dbg(gi2c->se.dev, "GPI bus clear returned %d, issuing stop anyway\n",
+				ret);
+
+		ret = geni_i2c_gpi_bus_cmd(gi2c, I2C_STOP_ON_BUS);
+	} else {
+		ret = geni_i2c_fifo_bus_cmd(gi2c, I2C_BUS_CLEAR);
+		if (!ret)
+			ret = geni_i2c_fifo_bus_cmd(gi2c, I2C_STOP_ON_BUS);
+	}
 
 	/*
-	 * Recovery succeeds only once both bus lines are released. The bus
-	 * state is the authority, while a clean opcode status with either
-	 * line low is a failed recovery.
+	 * Recovery succeeds when both bus lines are released. Trust the bus
+	 * state over the opcode return path, which cannot flag a benign
+	 * recovery event in GPI mode.
 	 */
 	if (geni_i2c_bus_is_free(gi2c))
 		ret = 0;
@@ -1351,10 +1429,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	if (!gi2c->gpi_mode) {
-		gi2c->rinfo.recover_bus = geni_i2c_recover_bus;
-		gi2c->adap.bus_recovery_info = &gi2c->rinfo;
-	}
+	gi2c->rinfo.recover_bus = geni_i2c_recover_bus;
+	gi2c->adap.bus_recovery_info = &gi2c->rinfo;
 
 	ret = i2c_add_adapter(&gi2c->adap);
 	if (ret) {

-- 
2.34.1

