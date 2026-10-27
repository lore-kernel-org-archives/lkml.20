Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793078017;
	b=1nRLAi+WzC7YuZJNjWa211/c6qSiV80O+n2DoT6Y+X3x2ii3J3DLP1gxsD5JoU5d5mAd
	 jgGxwORSKZSvDZ43pLfNIIQxp/Ld2Ozo5PfH6NsYdrALZlbFjhb+wcJVFVx8anVbFFv78
	 o3zz9AUJO7rrFp6Ld8/+umwyEpEFUsO81163x3k7yhme3qKZYLrcE7Edn62MZ7Ram+Kig
	 IrMxVZ47ZGLrC7Lwgoe1sXdQaHx6RiOAmBLF0RguwxMkogO1LR2g9S/FQ05ePome0proC
	 6ZVTRWjXDaXuZlY7P82XS8/XXxZvz6VMOSbFwAc4nebEW3cKFTzZfE8NMwt1zTOWndQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793078017;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1iBMHqRtb9KCVWuGmA0rW9gEgHupGsvkbN3KIIR5/gI=;
	b=0VWNzHX4yI2ifqGGE0+BBikHXkBv10Fht2DsliqFAS6P90xnuT4HUx+9o8KPC5mLPAcD
	 QmnAFaeGQ1y0cPkt0WK0Ou7vU+oKHhz5s0+p6pORtJYZtGuDVe1ylYwgjWTpga/xhUqFK
	 ZU4zdcPzztQiEIDiulbvVx/OjGOtXlGAR3XWoveEFBIa2K0zXMaKBbh1GQKWcw3xk2WRt
	 eHrlogQZV796i4IU3TzCh80uDVkQtpIRkDMUYGUIBZeHE5F+4Bliy9Q+FwFjZ/rVd1g2r
	 R1KIt5kNXAVMRvgf2q3XOo706OeH3n6qK5cFgQ+l9eKkFDQpXMD8wbfQSk49vJVup6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UE6MPSbJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YgygeuuI;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5387606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:13:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5387606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UE6MPSbJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YgygeuuI
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R2EupY1908802
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:13:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1iBMHqRtb9KCVWuGmA0rW9gEgHupGsvkbN3KIIR5/gI=; b=UE6MPSbJn3gFw3KV
	Mt0Ojo//+jZfYPRB36SH/wfSKeUV2FfJioEL2fwTzaxA1mN6wSqbL/ZQUMP8NF4E
	mW0iXtxeb1EnPykG3ix/kA28l8nQL9B01dFLgIP1HusyLmnxp4ZgYHmXrLu2KMs4
	zeko3eRTEtDN9bJgy0Z34zXcitxVlVE23ggmm0PYi2BB7+3MgikVy/KOnjAAeYWn
	c+vW8dbuxD08+4P9EKBaMz0LWcU9Q/gGApoVLCB4Elgvdwbzl2Xu7SPJguvNCtGw
	UFuOFRECsLLLCdzU+lw1hIcJ2JpElouxysPPCYCzn7YtD/zgouxSo9OmeQ45znDM
	aqtjAg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hje3d9dfk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:13:36 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-139b62317d0so1611082c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793078016; x=1793682816; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1iBMHqRtb9KCVWuGmA0rW9gEgHupGsvkbN3KIIR5/gI=;
        b=YgygeuuIHl2uDjHsnaPW9oKaiRxNFWp4br9LPhZB1GsrJ1S8AMhRBdkHW+7dVWUVTD
         TR4oVZbiBLuUXWEx/tgN2tArNVPJghwRaFxjgk8+cjyM7TcGRCWfyhr92RaOa4CbFKxk
         dtPuf3gU6gt9OksaJi3FyUpLda2U95e1qpnvnEI8jMhd0xXX3PKv/WvEdSVta3tQKdSF
         QhtcxujITKUshOHGLTpyIEQRSk8uV4EWGTJPzipJxqAmrfHxczc/a1f97h+cs/MP5Lcg
         Wh1ERbxEN4mjWUOeaix7RbfZgocwlnMLpjW1S3wLdwGh8Ib2XK8nz/SSGWlcCdU1ZtMy
         0ECQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793078016; x=1793682816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1iBMHqRtb9KCVWuGmA0rW9gEgHupGsvkbN3KIIR5/gI=;
        b=sZUeLvB52Opk501edq9Lb9WvqBRLzVYMOKJ42qvsIYEeJwMofPLBchva56y5j1Ul/4
         TcP5qHIMOC75NS5efOAWgSKB/9CFq8ZmKVLPOZeibGVlwyqS4bAUge/G21B3Iso/ONjh
         1wD4VjH+rbh8Ol0i0LdUwcqQiMjVA/HxNVupv3ej3knjUUA3oh/wwKqXE0NwpBiohgkK
         P7Jk3/vXVPU78E9lGz5kx0IN25WojaQLrdhTyl2oN7hX3GDXEYQlC+szs04QUqKlz8kZ
         oOUeQ48ec5xi910ZU1eSFYZLDcsUwVKL/wr7pWhlhmY8070Iot8WB6yq1TERRD4ZYpy6
         5C2g==
X-Forwarded-Encrypted: i=1; AKwUvBxa+0YjoMXALP/ZTcGmW5d2Y5DJtUF16v+aKcE0jaiOYULomN/fjo3mvKo6dcbzUuypzbcqG0FwcJbG+fQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKhW76PfnR+zhzsmUPdOY2jYf8bxB3UYjukTiDMOxrXW1VntJGp
	rPw3PVM4dVhOYaJ/pgAdFBplIdd8jOy2nEj1Ew6gAbdauq6Pdkqa1ahu9S1c/6cm6vca250rcqx
	mACzsVTWSE6HcYWM8CQ/Le82SUl5vykTywuOIetnDQyp5lh1tfSEaRew3Gbr1xN1aQm0=
X-Gm-Gg: AYBFou0tonRQdn+zJh0/ClE0Rk/LF89mGMexF9rMwYVqTZ+d+RgTE8Nt1xLpWQyHHuH
	LKprPJzgt+SbU6YW7KEJkJUJdMFiO4E86+8glELTeBVl2tnCtsgsr64cLhx83faeF9U37FcFZqM
	X+nNU+/DMKbpgT6s8os4l3xYTUnOZQBXScb/mnC57/2qerwpjyeJSg3PFLZgd6ltTmGLWQJfAUH
	gaSB0jCt6jP/+Oyzuyo5Rp6UQWovQ3F5Gj2dy0KHQUOpWo84bOIJw6mZR8GJ9zrDYfvh7wTpceC
	EfZ++nn8x1sASzTgLfD/eNtAxJUz7MConnpVA0thKo3ePZzH2benzWsZXoOxT9nlRyXZHMX1V3A
	SPXNIcv6RdeL34GaFAHcADp/krBNaDJaLjA==
X-Received: by 2002:a05:7022:7f06:b0:186:3f0c:bd09 with SMTP id a92af1059eb24-1992afd1fb5mr13347954c88.5.1793078015255;
        Mon, 26 Oct 2026 22:13:35 -0700 (PDT)
X-Received: by 2002:a05:7022:7f06:b0:186:3f0c:bd09 with SMTP id a92af1059eb24-1992afd1fb5mr13347923c88.5.1793078014660;
        Mon, 26 Oct 2026 22:13:34 -0700 (PDT)
Received: from hu-arandive-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a249c331sm62298866c88.17.2026.10.26.22.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 22:13:34 -0700 (PDT)
From: Aniket Randive <aniket.randive@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 10:43:17 +0530
Subject: [PATCH v3 3/3] i2c: qcom-geni: Add bus recovery support for GPI
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
Message-Id: <20261027-20260826_aniket_randive_oss_qualcomm_com-v3-3-7f2a6e572de9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793077998; l=6226;
 i=aniket.randive@oss.qualcomm.com; s=20260325; h=from:subject:message-id;
 bh=oHW16ZLA84x86i3H4S8T1Hpo95kIY9SzvYZ1URod7wo=;
 b=7EPpT6xhz/3IQ+T5APz+XgApRVRSNwvbib5bjIh9yPnOKdfTuaWIQdknSvpESo7IyGbPrJG2P
 DY5sOzyiPStAikTCQ88gqN0mIiPkQSAusGncaVeDZzzfcuP1b4PpIu8
X-Developer-Key: i=aniket.randive@oss.qualcomm.com; a=ed25519;
 pk=4o37X1ZqGbCO/T2SR8kq/HnWvq0yb1RUlFuNukovbQk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAyMCBTYWx0ZWRfX6NEJwBqq/N/O
 eGDuNRHmWzhuvp6iQicIUR0ifa8rtX7iIotPY7Amz6Oh7wDOz5IPs+pPnZXi7uo7VV0TxWpVn/4
 NxL+2PXc0YUAMRj3h2AkfVGXA+GDc3g=
X-Proofpoint-GUID: TJR8mrXkz8P0hIOSca9a49kFM212fEqP
X-Proofpoint-ORIG-GUID: TJR8mrXkz8P0hIOSca9a49kFM212fEqP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAyMCBTYWx0ZWRfXy96A4sVv3TCm
 gt+vu3aepSwe/NVu5hhM4piWqhULCQti7XQVzfYYyboeXhHQMgTvyC5oF5H1+szX7Vha1xn3iyO
 mna+k9Fx2yS2MxtqZgEzi57O2OiRXmGVj+frbzKh9xKxpQ2rgb+xnpBFNlRgrfYGVIcIZ3JJbqm
 YGcTdFXyR2hU1clKxUJANsf3XE9a8akIsjU945uPbFdgCTq8kEh2blv2WEoLAZsdsP+eydpcwrx
 mwzXs70GYnQzdrNzBofjk844PvYMbVe5pGtpm9rY7US1UZ8KBk/4TywEluCHJVaAxwkGM4DxVd+
 QJ/5y//GILFgA/tXe+C3tG3Q287Eq7B9K+uSL8Hl71mWaETCol+55xEKRccrduFBjdKUeaErNCQ
 bt1RfzBVDhJFLiZ7OhOrXtMZhkU7oZM5Z9S45B9lJ8B3oWi/sOS4BJxf12JW3FkZOFMPkXgMCPC
 cnaB3FmCyAkpNIBw+3A==
X-Authority-Analysis: v=2.4 cv=SN/Xx+vH c=1 sm=1 tr=0 ts=6ae03300 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=k1huG3081okQl_w4-uUA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270020

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

Use the adapter timeout for GPI recovery commands, and preserve the DMA
configuration error code when GPI setup fails.

Stop recovery on a GPI command timeout and report DMA termination
failures. Do not issue another command or override the timeout with a
bus-idle result, since DMA cleanup may not have completed successfully.

Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 107 ++++++++++++++++++++++++++++++++-----
 1 file changed, 94 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index d9e86f110ae9..ac9d1875b54f 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -1065,13 +1065,81 @@ static bool geni_i2c_needs_bus_recovery(struct geni_i2c_dev *gi2c, int ret)
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
+		ret = dmaengine_terminate_sync(gi2c->tx_c);
+		if (ret)
+			dev_err(gi2c->se.dev, "DMA termination failed for bus cmd %u: %d\n",
+				cmd, ret);
+		return -ETIMEDOUT;
+	}
+
+	return gi2c->err;
+}
+
 static int geni_i2c_recover_bus(struct i2c_adapter *adap)
 {
 	struct geni_i2c_dev *gi2c = i2c_get_adapdata(adap);
@@ -1105,20 +1173,35 @@ static int geni_i2c_recover_bus(struct i2c_adapter *adap)
 		return -EBUSY;
 	}
 
-	ret = geni_i2c_fifo_bus_cmd(gi2c, I2C_BUS_CLEAR);
-	if (!ret)
-		ret = geni_i2c_fifo_bus_cmd(gi2c, I2C_STOP_ON_BUS);
+	if (gi2c->gpi_mode) {
+		ret = geni_i2c_gpi_bus_cmd(gi2c, I2C_BUS_CLEAR);
+		/* Do not issue more commands after a timeout: DMA cleanup may have failed. */
+		if (ret == -ETIMEDOUT)
+			goto out_pm;
+		if (ret)
+			dev_dbg(gi2c->se.dev, "GPI bus clear returned %d, issuing stop anyway\n",
+				ret);
+
+		ret = geni_i2c_gpi_bus_cmd(gi2c, I2C_STOP_ON_BUS);
+		if (ret == -ETIMEDOUT)
+			goto out_pm;
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
 	else if (!ret)
 		ret = -EBUSY;
 
+out_pm:
 	pm_runtime_put_autosuspend(gi2c->se.dev);
 
 	return ret;
@@ -1359,10 +1442,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
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

