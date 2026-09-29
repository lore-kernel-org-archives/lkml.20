Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEEF53F88A2
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651874; cv=none; b=CeQesbysi5B9t7iMJmFlLM5t+nk91YsCvFMJGK/GMPMiJ0KNOzULgR0ZPCkLku/YKdALDtTKclsUndUN7YMIs2+LDLQ7vJg0CZh4o6sZMpKZ0Ea6Kk/25XSEySxxwPXCntfpkGGgViDZeaHKF8ES9fjHIF6cxUT7ZZHTzUv9L8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651874; c=relaxed/simple;
	bh=rARwHkFKjjbvU4trPhh8WewFiGLZGn3L4375nqv/M2U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ANGsCExCJ1909yUw/kAPAyrouMDUa1nY2GLuAG1Be9FVJIYCL33+UziIG82RdaAtRJw5o8hDIVYPNAmS/tTovf+Xt+VDD6Wl0FuLelx+e5W/WjcDafGuZQ1xKpHUlRQQVMUsUlhHAcY51KG4caEFwcuox9OaZbst7AvgY2c2Pds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UsgkN6yF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KPFdO3M8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UsgkN6yF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KPFdO3M8"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T0iqqX2959553
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:17:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gtcvnUkmVqQAt+w19mrphwNYznnIA8lvytR0upTmt8I=; b=UsgkN6yFojUiuOd3
	DOCjn11uCmmzBbcO9ysR/mgKI240zYFG/7WDi4NudPTl+zLm0W676rPem4wQyFbA
	CZoevaxAvaayMeObkQo2Nc/7GAVlhgbzbF8mHjUyYjk6f9lmw4y7S65DzuYWOf7/
	M9mf+hmfUfW2ELT0p5QW92QCTcUrjnFzs0PcrOwIF8VlwD8+s+2Vb3f0QvzLJQUC
	tYZL/VAqzI4qTP71OkGlDdRBlvRZZROaxDCEk5QcJVeXbivFbuXlfIOmuC9hYbiJ
	uqA6+jWLAKP/ZOyoodAQKU1fSSUNFNE8GjVaEy6uw9KSK/4PuEK+JQzNtjhvgfNZ
	1bzOxg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h01vkgnk3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:17:47 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1431ba79941so3561207c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 20:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790651866; x=1791256666; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gtcvnUkmVqQAt+w19mrphwNYznnIA8lvytR0upTmt8I=;
        b=KPFdO3M8NgxBuHoj6NN8ILF73XmKlbPOS72qnwPCT6SGdP6nbtMWk7HyOHX4/MoFul
         7LH+dTdjEFlY4XOOfRha5bxkpVwXoIo6cCp7NvBaQ1O5qgMtXeF8vlfcDRaIzQSg63Vr
         1sST1KcUobsi+9SX+wHwM8dW9nQ5hBeEh5UeC1lpZBDHYxRRY59uT7soPBPLsnsTs/wF
         5ZvFJu8IYxZS2+WscUBAjbPT0984VTZezatnQGAZgobtNUdc6JSA9K8XobkfD64tW1Oe
         /JS5HOFcibMKnqg0xguPgWUOfR+m8w5xPIRIzE1DDHoP/3TG0de0P8Sl6IL4uBvtiMFR
         5l1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790651866; x=1791256666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gtcvnUkmVqQAt+w19mrphwNYznnIA8lvytR0upTmt8I=;
        b=opfro/nuarjVf48+mATf45FDoo9HmJlVkn9NK8eXtYYNXKerYXpbYsuKhJDSgJJ3uS
         dCy6sDpdNnwcZnXE0i11jRJsIkbjGWCb6Cemu2uC6l2Oo4IgFLIU1wBpGwS6jFOAJfoX
         1BQTcZwqpHNaGc6AZLdvLKSvFdKRtPSA0RakEZyDCAVXAyF2uoOHwvDKDbxc30qbEeTv
         p8tB19AhHYMcUwiYhmL6un6i8zWMD0h77HfiwY+fU3vSZLICTfsEPi2ac7hRl3NCq1E/
         3DYJik9XC/fMvQhu7xHeIuXMk1rBWaS6Sh51olhCLuRYm1m+gM2tuqZrhYdVkb4sv9Jz
         5fsQ==
X-Forwarded-Encrypted: i=1; AKwUvBwXCFPqCGaLK/MuMT/ggM6G28fLZyhK9ixsjnY3iv5u/pEzzngiToURSepiXnPJVx4flJ1nwAj5E/AKbpU=@vger.kernel.org
X-Gm-Message-State: AFuF++lV9CphE6SvZrjmEi/QOiEKmEON0GTEf6o8/CPrxOLKJC4YoUzH
	3YGUNyLyNQE/5FVgHMQBnxsCwDSBbVz/etmZwhttqg34yR9F42JSBoOmZ73n8R8db3wZhBKd3b1
	0twi7ceHMbxKKCrJEMdAmOxP2dAmhWOOq45JmdC+L34H448AFimFC6KxXO/LnI1vP5A==
X-Gm-Gg: AYBFou1Bll1xlAwgDqcfHrRKbX63nC62Her5pEbMAJ/SxRH8QWy/gYzNRxgvXT2KoRA
	IzqciWxfJbZsQXXe1oxR0+X1sbuPl7Z1LajHe9p2s4K2CH/zzPuNELiDnsrx0nT/Xvj9TnSA29w
	rEHER4GjoOS21uy0JYzfQpt2yk5AZneqgTEDoivDjqdc5/jIGUolcGyPbN+5dAQNzT8sATWG8B2
	kw+kqEq+liSDgW/T0Ic8dX7DliveBu1fM9tl1rAnphiiGwqQyaqENN4uYXhQ1VpaZVs1OHgHqfn
	n79A/BOQtkzrwSMtN4c734ofyo155A0Zg7E96ZgjaPyeRYmk5IgKhDNuPO1j/dnszsWfRMsFEuF
	WRgwdSsOXiEJclfWG01bjCI1TdwFREbp3mvPLiCb98Hh0NeFZGbvRwv0a2SI=
X-Received: by 2002:a05:701b:428e:20b0:143:298e:913d with SMTP id a92af1059eb24-146d096d371mr12208808c88.47.1790651866230;
        Mon, 28 Sep 2026 20:17:46 -0700 (PDT)
X-Received: by 2002:a05:701b:428e:20b0:143:298e:913d with SMTP id a92af1059eb24-146d096d371mr12208779c88.47.1790651865636;
        Mon, 28 Sep 2026 20:17:45 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ad4028a9sm24789368c88.11.2026.09.28.20.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 20:17:45 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 20:16:52 -0700
Subject: [PATCH RFC 01/10] mailbox: add direct synchronous send support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-riscv-rpmi-tee-abi-v1-1-04908b81d885@oss.qualcomm.com>
References: <20260928-riscv-rpmi-tee-abi-v1-0-04908b81d885@oss.qualcomm.com>
In-Reply-To: <20260928-riscv-rpmi-tee-abi-v1-0-04908b81d885@oss.qualcomm.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Rahul Pathak <rahul@summations.net>,
        Anup Patel <anup@brainfault.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Amirreza Zarrabi <amrzar@gmail.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, op-tee@lists.trustedfirmware.org,
        devicetree@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxMiBTYWx0ZWRfX9YXLjw+Btkkj
 7+ODEzWbGGdpTqrkQ5GEja/mKEK7JN/+SPLlDqINf8F2iH+MSYPWzQXeP183uXB3g5W5So8tvM8
 DQMLtWFyATKU6z4nPwzur53ofpB7nkJ/+jR7vs/rxKL6rvlOOgu+MaPZK9/wvhNv/F96g9Ls1Hv
 cV8GzKuO/OZDhAFfPYcqfoAnox/Sr2coqKpp7rIrBOuFgcbOR/yrzx5qifHHZwlz6sHsTW4tg06
 ZriSQkuh5MC4IauFHymCV58I729UHwWKBYKBdZY5KiqySaQ1IHSRrRGFCrYA3iqsgt1BukBCt62
 wH4467QKudGaS/zsJ5csAuwdrLCNQD4qTPrdGFmqcSiClBXkaAga3oUxQ1Hdo2WFlp0Aqhm+zwx
 sP1MPZ4XVZda5kni7mcvl1lgR0lcfoTKEhojhRVF1VqOuden4kkmG+EouOB4f0iUSf+T1Mxr9yr
 UOqktaX3yW8XTxYIS2Q==
X-Proofpoint-GUID: PWAUNQrco6M0kaNkdS_4qN90TMndMqoi
X-Authority-Analysis: v=2.4 cv=VcVir1p9 c=1 sm=1 tr=0 ts=6abb2ddb cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=F4dQRpG-GgUDkkGoPlYA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: PWAUNQrco6M0kaNkdS_4qN90TMndMqoi
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxMiBTYWx0ZWRfX4/lfFqFjz/SU
 4DusYNhrc4VEqDKJ6P6Jf/QiqLO+YT9cZoooPdm2PEZ60nkl6oBX5ZxBqr+lPwc6AUiMVDBOvKj
 /UQ1rg4WbKn9ecPr/q5e1iR7sTzMH/4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290012

Some mailbox controllers can complete a transaction entirely within
the calling context, without going through the queued TX state
machine or a TX-done interrupt. Add a synchronous send path so their
clients can request one and wait for the result directly.

Controllers advertise support via the new send_data_sync() op and
clients opt in by setting tx_sync when requesting the channel.

Channels bound this way must not call mbox_chan_txdone() or
mbox_client_txdone(), and mbox_send_message() and mbox_flush() now
reject them, since only mbox_send_message_sync() is a valid
transmit path. The client remains responsible for serializing calls
to mbox_send_message_sync() against mbox_free_channel().

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/mailbox/mailbox.c          | 72 ++++++++++++++++++++++++++++++++++++--
 include/linux/mailbox_client.h     |  3 ++
 include/linux/mailbox_controller.h | 10 ++++++
 3 files changed, 83 insertions(+), 2 deletions(-)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index efacd24a085d..c640b19de608 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -166,6 +166,12 @@ EXPORT_SYMBOL_GPL(mbox_chan_received_data);
  */
 void mbox_chan_txdone(struct mbox_chan *chan, int r)
 {
+	if (unlikely(chan->txdone_method & MBOX_TXDONE_BY_RETURN)) {
+		dev_err(chan->mbox->dev,
+			"TX-done notification on direct synchronous channel\n");
+		return;
+	}
+
 	if (unlikely(!(chan->txdone_method & MBOX_TXDONE_BY_IRQ))) {
 		dev_err(chan->mbox->dev,
 		       "Controller can't run the TX ticker\n");
@@ -187,6 +193,12 @@ EXPORT_SYMBOL_GPL(mbox_chan_txdone);
  */
 void mbox_client_txdone(struct mbox_chan *chan, int r)
 {
+	if (unlikely(chan->txdone_method & MBOX_TXDONE_BY_RETURN)) {
+		dev_err(chan->mbox->dev,
+			"TX-done notification on direct synchronous channel\n");
+		return;
+	}
+
 	if (unlikely(!(chan->txdone_method & MBOX_TXDONE_BY_ACK))) {
 		dev_err(chan->mbox->dev, "Client can't run the TX ticker\n");
 		return;
@@ -278,6 +290,9 @@ int mbox_send_message(struct mbox_chan *chan, void *mssg)
 	if (!chan || !chan->cl || mssg == MBOX_NO_MSG)
 		return -EINVAL;
 
+	if (chan->txdone_method & MBOX_TXDONE_BY_RETURN)
+		return -EOPNOTSUPP;
+
 	t = add_to_rbuf(chan, mssg);
 	if (t < 0) {
 		dev_err(chan->mbox->dev, "Try increasing MBOX_TX_QUEUE_LEN\n");
@@ -308,6 +323,43 @@ int mbox_send_message(struct mbox_chan *chan, void *mssg)
 }
 EXPORT_SYMBOL_GPL(mbox_send_message);
 
+/**
+ * mbox_send_message_sync - Send data and wait for transaction completion
+ * @chan: Mailbox channel assigned to this client
+ * @mssg: Client specific message typecasted
+ *
+ * For a channel bound with tx_sync, ask the controller to transmit @mssg and
+ * only return on completion. This function may sleep and must not be called
+ * from atomic context. @mssg must remain valid until this function returns.
+ *
+ * The direct synchronous path does not queue @mssg, does not use active_req,
+ * and does not use a TX-done notification. The client must serialize this
+ * function against mbox_free_channel().
+ *
+ * Return: 0 on success or a negative error code.
+ */
+int mbox_send_message_sync(struct mbox_chan *chan, void *mssg)
+{
+	int ret;
+
+	if (!chan || !chan->cl || mssg == MBOX_NO_MSG)
+		return -EINVAL;
+
+	if (!(chan->txdone_method & MBOX_TXDONE_BY_RETURN))
+		return -EOPNOTSUPP;
+
+	if (chan->cl->tx_prepare)
+		chan->cl->tx_prepare(chan->cl, mssg);
+	/* Try to submit a message to the MBOX controller synchonously */
+	ret = chan->mbox->ops->send_data_sync(chan, mssg);
+
+	if (chan->cl->tx_done)
+		chan->cl->tx_done(chan->cl, mssg, ret);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(mbox_send_message_sync);
+
 /**
  * mbox_flush - flush a mailbox channel
  * @chan: mailbox channel to flush
@@ -326,8 +378,11 @@ int mbox_flush(struct mbox_chan *chan, unsigned long timeout)
 {
 	int ret;
 
+	if (chan->txdone_method & MBOX_TXDONE_BY_RETURN)
+		return -EOPNOTSUPP;
+
 	if (!chan->mbox->ops->flush)
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	ret = chan->mbox->ops->flush(chan, timeout);
 	if (ret < 0)
@@ -343,7 +398,9 @@ static void mbox_clean_and_put_channel(struct mbox_chan *chan)
 	scoped_guard(spinlock_irqsave, &chan->lock) {
 		chan->cl = NULL;
 		chan->active_req = MBOX_NO_MSG;
-		if (chan->txdone_method == MBOX_TXDONE_BY_ACK)
+		if (chan->txdone_method & MBOX_TXDONE_BY_RETURN)
+			chan->txdone_method &= ~MBOX_TXDONE_BY_RETURN;
+		else if (chan->txdone_method == MBOX_TXDONE_BY_ACK)
 			chan->txdone_method = MBOX_TXDONE_BY_POLL;
 	}
 
@@ -355,6 +412,14 @@ static int __mbox_bind_client(struct mbox_chan *chan, struct mbox_client *cl)
 	struct device *dev = cl->dev;
 	int ret;
 
+	if (cl->tx_sync) {
+		if (!chan->mbox->ops->send_data_sync)
+			return -EOPNOTSUPP;
+
+		if (cl->tx_block || cl->tx_tout || cl->knows_txdone)
+			return -EINVAL;
+	}
+
 	if (chan->cl || !try_module_get(chan->mbox->dev->driver->owner)) {
 		dev_err(dev, "%s: mailbox not free\n", __func__);
 		return -EBUSY;
@@ -380,6 +445,9 @@ static int __mbox_bind_client(struct mbox_chan *chan, struct mbox_client *cl)
 		}
 	}
 
+	if (cl->tx_sync)
+		chan->txdone_method |= MBOX_TXDONE_BY_RETURN;
+
 	return 0;
 }
 
diff --git a/include/linux/mailbox_client.h b/include/linux/mailbox_client.h
index e5997120f45c..32b1d5ad3bfa 100644
--- a/include/linux/mailbox_client.h
+++ b/include/linux/mailbox_client.h
@@ -21,6 +21,7 @@ struct mbox_chan;
  * @knows_txdone:	If the client could run the TX state machine. Usually
  *			if the client receives some ACK packet for transmission.
  *			Unused if the controller already has TX_Done/RTR IRQ.
+ * @tx_sync:		Bind the channel for mbox_send_message_sync().
  * @rx_callback:	Atomic callback to provide client the data received
  * @tx_prepare: 	Atomic callback to ask client to prepare the payload
  *			before initiating the transmission if required.
@@ -31,6 +32,7 @@ struct mbox_client {
 	bool tx_block;
 	unsigned long tx_tout;
 	bool knows_txdone;
+	bool tx_sync;
 
 	void (*rx_callback)(struct mbox_client *cl, void *mssg);
 	void (*tx_prepare)(struct mbox_client *cl, void *mssg);
@@ -42,6 +44,7 @@ struct mbox_chan *mbox_request_channel_byname(struct mbox_client *cl,
 					      const char *name);
 struct mbox_chan *mbox_request_channel(struct mbox_client *cl, int index);
 int mbox_send_message(struct mbox_chan *chan, void *mssg);
+int mbox_send_message_sync(struct mbox_chan *chan, void *mssg);
 int mbox_flush(struct mbox_chan *chan, unsigned long timeout);
 void mbox_client_txdone(struct mbox_chan *chan, int r); /* atomic */
 bool mbox_client_peek_data(struct mbox_chan *chan); /* atomic */
diff --git a/include/linux/mailbox_controller.h b/include/linux/mailbox_controller.h
index 26a238a6f941..c7dc098324ef 100644
--- a/include/linux/mailbox_controller.h
+++ b/include/linux/mailbox_controller.h
@@ -18,6 +18,7 @@ struct mbox_chan;
 #define MBOX_TXDONE_BY_IRQ	BIT(0) /* controller has remote RTR irq */
 #define MBOX_TXDONE_BY_POLL	BIT(1) /* controller can read status of last TX */
 #define MBOX_TXDONE_BY_ACK	BIT(2) /* S/W ACK received by Client ticks the TX */
+#define MBOX_TXDONE_BY_RETURN	BIT(3) /* TX completes by function return */
 
 /**
  * struct mbox_chan_ops - methods to control mailbox channels
@@ -28,6 +29,14 @@ struct mbox_chan;
  *		transmission of data is reported by the controller via
  *		mbox_chan_txdone (if it has some TX ACK irq). It must not
  *		sleep.
+ * @send_data_sync: The API asks the MBOX controller driver, in non-atomic
+ *		context, to transmit a message on the bus and wait for the
+ *		transaction to complete. It returns 0 if the transaction
+ *		completed successfully or a negative error code otherwise.
+ *		The controller must not call mbox_chan_txdone() or
+ *		mbox_client_txdone() for this operation. Concurrent calls for one
+ *		controller must support them, serialize them internally, or
+ *		return -EBUSY for a conflicting transaction.
  * @flush:	Called when a client requests transmissions to be blocking but
  *		the context doesn't allow sleeping. Typically the controller
  *		will implement a busy loop waiting for the data to flush out.
@@ -53,6 +62,7 @@ struct mbox_chan;
  */
 struct mbox_chan_ops {
 	int (*send_data)(struct mbox_chan *chan, void *data);
+	int (*send_data_sync)(struct mbox_chan *chan, void *data);
 	int (*flush)(struct mbox_chan *chan, unsigned long timeout);
 	int (*startup)(struct mbox_chan *chan);
 	void (*shutdown)(struct mbox_chan *chan);

-- 
2.34.1

