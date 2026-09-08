Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68E551A73B
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859656; cv=none; b=DUGQhnj3dUwr3aPx6pUS3ml3eyyOkPxpvyO1T3UajBeRWr9rp/UqT9qnzszsZF5RqIFABlU5LN/pD+ZXQ0gspzA/xrfUDiYYPuAAlWtq7vGS0q0ne1AJNdxd/xqAgE1BcaJhqdqYMmKBC5vBq+oBzg4rdBA0OHWEjA/iZZa1RrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859656; c=relaxed/simple;
	bh=v1yrABLqTIc4p4oIhmVVXLM9npjaIwFrBh2oITikhJQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E4f3f4LkveWqNgNFBJpcnU7JSCmvxO/uP9yCwwZEcAie3m9BNmpYfWb9NLmbZf5K2Hzpw4sdMcJ1b8IvUUiSmdZyPot+tICn17VNOYAEuMlCygT8SJqOfZj1lHiOIjCNgyXf5mZeYt56HuMeO96+KV2CYXjM/cFHeUylKXOnoJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CQWOPWVK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZNtyYWtd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CQWOPWVK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZNtyYWtd"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886LbRx3299061
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 09:27:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T2Fw9kXaPhm+WFCHLv34WUuWlY76aGBJfM0UIKwCGCo=; b=CQWOPWVKyI05Y0+r
	AXLwGt8XaWXgzDaxWsxfXr5m8nH1/5v6qrqhfU84ywRTF2c0lbfUjN3lRdtoE74c
	ZEELb0sE6KziI2Yn8s83VNVMflM5pWSLy4kb0ctowMOfgH9VnMS+TWpxhuau3+4g
	B08OYRBhFSTijn3Gi/yFNiMRpjEt5VyL9qglM1IeqqY7Vdd0mxeAEM4mH+CDzvJ2
	a2Ki5AJAcaeraWayQg3HNradTB8Viql/mqziG5V7UjXsimrAvGkDk472D4BuGcZI
	/AmFCyOjbEhupy+/LQgfPg9I5K5CXmy+ovmYtJ+jyVHI4KMfSfZsYYwCKsP3saBU
	iSr7Ig==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjb0p96uu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 09:27:34 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1c62f0d60so5770903a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788859653; x=1789464453; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T2Fw9kXaPhm+WFCHLv34WUuWlY76aGBJfM0UIKwCGCo=;
        b=ZNtyYWtd0nJ/TaphDdh9G5AkwffzFm2aSPx2GF0IMZQ1AYjsXkM1lzYHxgmH5d1RIt
         bxqbcRzrl372YLscAEK2q7awGcjYh6/jAIXR3iVydK4YXnBrzRKyfK849cEzYIYtWF1v
         gh345L2MbVjtlPYV5lniNhtvKzV0m6We4zoV7BS6yg027ultvNxR2WMvhPZqf2bV01+b
         mvN4LSXLZmUzAsFRaYpK51RveHzXIxLxzOX13BgybcjBWyaRACyPwBDG2snAqlLMDK8/
         VplIGIDhjntx88KKnNYUk8OCLRM6jnno6xNG5LOko/XBLnotPbvX9zfGayyY+B2DGmq0
         EbvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788859653; x=1789464453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T2Fw9kXaPhm+WFCHLv34WUuWlY76aGBJfM0UIKwCGCo=;
        b=BDfNddt4q2kupBJBLcCH9D9XzwL0dqXcRQgPBoGNMFksw7hOQ+4AEkxdqiCTjqDa23
         ozw8tIq3AvEcZj8ImOScVTC4IILeMxDwxDVAhZh+lmixAVaQIFU8su51V+8PVNkByNd+
         Ll+sn+2kVBYoXFaDYLz8nsTXkpy4D1ksV9PciapFbRJeIFmNJd6NenKtbNoQUNJ4w8L2
         JFdMjsx2qNvOzgkvcsp1fzWfwea9fT/xp+Vnislu7g9dr5yoRdTBS51rKQH9OqHAkywc
         iEDkB5SV31GIw4XtG3YS2yK7ulW/hy8d3kD6zOxlnEs7Wjw30CL5hEo5Hp/QasIcBX8P
         lILw==
X-Forwarded-Encrypted: i=1; AKwUvBz6psdNta/mS+pl0knonipjsALy4xzUcgg8gzGgzNKqBBjZKFbd2jr7dOF3RBG5JFnfyEef5l9h7Y/jLxA=@vger.kernel.org
X-Gm-Message-State: AFuF++lLTdqQT10pOE8bInBC9vjLr8RCI1CA9B7+dBmviFIk5HuBmIEs
	IYGWuStBMdkRTOkpYtvhemno141Y9X251+mYNzSjCzQOhWH2RTk/9EjQav2PEzslymS1xSO7/qM
	dZhpBrAvziwmjl/w7p7rI90qHLa+WgKksN6r+z6e4ZfYNyM2GK7qbz9TFWKgnRiPhuSo=
X-Gm-Gg: AYBFou1bjpoFdCoq8MAQ8TDcl5yP4LycKSu19fkWRPzihSkB6STqAhEyLhg4i7BdITl
	Acgs7RCBkfuVzb2dHTltxIjE3sxlyJjLHJROTiHjp+/TsqJiFdjDQiSYOErniY5rsh+nnZM0Vek
	7n4ZDxxEG5B51ck8mUWO2N0rLySBQpsL6A3ZF6RPqqJuxgQNN1b3wyaolRKspvcLRG3ZO9JLPk7
	WM07zNN+jcGb7L0q1b+niWluZDezt/3fhXQ02iBuT9d7m8V1nR3dUbq8igz+8g0uBhHgU+Haqyk
	DxmbJL32kuYtSF79QTt6btmR5i8gT1bovZ5/kl7Q8NPf7nqkdxO/EqPccPrDjLoLEF/nbXbccfW
	2MJCO9nt4bTWJLh4Qb+mv+nlJIA==
X-Received: by 2002:a05:6a20:158d:b0:3da:34a7:6444 with SMTP id adf61e73a8af0-3da3a15ac1cmr42378264637.26.1788859653428;
        Tue, 08 Sep 2026 02:27:33 -0700 (PDT)
X-Received: by 2002:a05:6a20:158d:b0:3da:34a7:6444 with SMTP id adf61e73a8af0-3da3a15ac1cmr42378212637.26.1788859652906;
        Tue, 08 Sep 2026 02:27:32 -0700 (PDT)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339befe870sm38281492eec.30.2026.09.08.02.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:27:32 -0700 (PDT)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 14:57:23 +0530
Subject: [PATCH v6 2/3] bus: mhi: ep: Add mhi_ep_queue_buf() API for raw
 buffer queuing
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-lb-v6-2-66755ceb16cc@oss.qualcomm.com>
References: <20260908-lb-v6-0-66755ceb16cc@oss.qualcomm.com>
In-Reply-To: <20260908-lb-v6-0-66755ceb16cc@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788859644; l=4480;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=v1yrABLqTIc4p4oIhmVVXLM9npjaIwFrBh2oITikhJQ=;
 b=pUyRZkK6h0COQR474EbyLkb7OrnUpLeg7axWfwaaOxZ5hvOhZmKBzcnbKCQjj+QprxGAOWqLR
 nADgwWscWG6DqZpZw/DO7tmX3R+DZ+y+4JiRtb7HGHo2zq4wbP4rsAw
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-ORIG-GUID: p8eDncp9-GZ4tABOHY-_PpomHeHnjKKz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA5OSBTYWx0ZWRfX+bRqbaPuk9Vt
 0/cKOEcTw9Mked6YQph1rdMzP4GlhMu6xGPm2zRB7DuaLXHV8g4e/UeF5PArNuwgJd1atRl8SK/
 kptnGoNXfczlQzN8F/QVMC8L1Zx66xY=
X-Authority-Analysis: v=2.4 cv=HL3z0Itv c=1 sm=1 tr=0 ts=6a9fd506 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=27Ti7_ZD70JoqEhemiIA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: p8eDncp9-GZ4tABOHY-_PpomHeHnjKKz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA5OSBTYWx0ZWRfX3n889dO5QOmP
 0qH/VlfkNlc3d1aiZPLenDHNINoYGMRumo9LG9I540w0drvHrAezENeGeKAlJQ8O2gtZ5zi8xel
 bVZ7YS5ZtD8+vg5yD9aXG68h6rLVqvADm6yMC+oHSvfabhOvoNGGGoJlfYI8U37rxB+nJCh33DV
 6rG5KzxrbYdSbNb205VIzMKny1h8gN2lmTu7eYhAN+DmXhIoNIzBB8XQ2zfseA6vTjdpi9LPrq9
 2p8vF56twE7wos90gx1mbxbN9qbVRxF7EE93jmSY6H+o7zSVLKZVaPILTv9rXDmqodXY4qhJMd+
 lHRfdivNHfUKKPnz65JeIZ1QizLY59TSIXkWdOL+m8r1yx2v1FBq8FdHOWYbR6c/xTUSDtRPcRa
 3kOhWdbR1WbPHtrTwQOnAhEA6TQHM8Xje/ofHpcKW53LUI3pYrJZh7cBjsWMp4GaYbsvwz4sAj4
 ofkZZDFdSmjwVAM9A/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080099

Some MHI endpoint clients do not use socket buffers and need a way to queue
raw buffers for DL transfers. Add mhi_ep_queue_buf() to support this use
case.

Refactor mhi_ep_queue_skb() to delegate to a new internal mhi_ep_queue()
helper shared by both APIs, and rename mhi_ep_skb_completion() to
mhi_ep_buf_completion() to reflect its broader use.

Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
 drivers/bus/mhi/ep/main.c | 29 ++++++++++++++++++++---------
 include/linux/mhi_ep.h    | 16 ++++++++++++++++
 2 files changed, 36 insertions(+), 9 deletions(-)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index db7ee6547eefa75995393f761ac3b66a6e37112d..4b8dcd0273ad94e7fbcf7ab0209f13b17deb6d0c 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -504,7 +504,7 @@ static int mhi_ep_process_ch_ring(struct mhi_ep_ring *ring)
 	return 0;
 }
 
-static void mhi_ep_skb_completion(struct mhi_ep_buf_info *buf_info)
+static void mhi_ep_buf_completion(struct mhi_ep_buf_info *buf_info)
 {
 	struct mhi_ep_device *mhi_dev = buf_info->mhi_dev;
 	struct mhi_ep_cntrl *mhi_cntrl = mhi_dev->mhi_cntrl;
@@ -532,22 +532,22 @@ static void mhi_ep_skb_completion(struct mhi_ep_buf_info *buf_info)
 
 	mhi_ep_ring_inc_index(ring);
 }
-
 /* TODO: Handle partially formed TDs */
-int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb)
+static int mhi_ep_queue(struct mhi_ep_device *mhi_dev, void *buf, size_t len,
+			void *cb_buf)
 {
 	struct mhi_ep_cntrl *mhi_cntrl = mhi_dev->mhi_cntrl;
 	struct mhi_ep_chan *mhi_chan = mhi_dev->dl_chan;
 	struct device *dev = &mhi_chan->mhi_dev->dev;
 	struct mhi_ep_buf_info buf_info = {};
 	struct mhi_ring_element *el;
-	u32 buf_left, read_offset;
+	size_t buf_left, read_offset;
 	struct mhi_ep_ring *ring;
 	size_t tr_len;
 	u32 tre_len;
 	int ret;
 
-	buf_left = skb->len;
+	buf_left = len;
 	ring = &mhi_cntrl->mhi_chan[mhi_chan->chan].ring;
 
 	mutex_lock(&mhi_chan->lock);
@@ -570,13 +570,13 @@ int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb)
 		tre_len = MHI_TRE_DATA_GET_LEN(el);
 
 		tr_len = min(buf_left, tre_len);
-		read_offset = skb->len - buf_left;
+		read_offset = len - buf_left;
 
-		buf_info.dev_addr = skb->data + read_offset;
+		buf_info.dev_addr = buf + read_offset;
 		buf_info.host_addr = MHI_TRE_DATA_GET_PTR(el);
 		buf_info.size = tr_len;
-		buf_info.cb = mhi_ep_skb_completion;
-		buf_info.cb_buf = skb;
+		buf_info.cb = mhi_ep_buf_completion;
+		buf_info.cb_buf = cb_buf;
 		buf_info.mhi_dev = mhi_dev;
 
 		/*
@@ -615,8 +615,19 @@ int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb)
 
 	return ret;
 }
+
+int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb)
+{
+	return mhi_ep_queue(mhi_dev, skb->data, skb->len, skb);
+}
 EXPORT_SYMBOL_GPL(mhi_ep_queue_skb);
 
+int mhi_ep_queue_buf(struct mhi_ep_device *mhi_dev, void *buf, size_t len)
+{
+	return mhi_ep_queue(mhi_dev, buf, len, buf);
+}
+EXPORT_SYMBOL_GPL(mhi_ep_queue_buf);
+
 static int mhi_ep_cache_host_cfg(struct mhi_ep_cntrl *mhi_cntrl)
 {
 	size_t cmd_ctx_host_size, ch_ctx_host_size, ev_ctx_host_size;
diff --git a/include/linux/mhi_ep.h b/include/linux/mhi_ep.h
index f6383a57a872bf3cdea236ae9fe65f4ec8747b3e..852f331f03fda5c0212585de7d6f4eb9f8270609 100644
--- a/include/linux/mhi_ep.h
+++ b/include/linux/mhi_ep.h
@@ -304,4 +304,20 @@ bool mhi_ep_queue_is_empty(struct mhi_ep_device *mhi_dev, enum dma_data_directio
  */
 int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb);
 
+/**
+ * mhi_ep_queue_buf - Transfer buffer contents to host over MHI Endpoint
+ * @mhi_dev: Device associated with the DL channel
+ * @buf: Buffer to be queued. On success, ownership passes to the MHI stack;
+ *       the caller must not free @buf until the DL transfer callback fires
+ *       with result->buf_addr equal to @buf. On failure, the caller retains
+ *       ownership and must free @buf.
+ *       Note: if @len spans multiple host DL TREs, the DL transfer callback
+ *       fires once per TRE, each time with result->buf_addr equal to @buf.
+ * @len: Size of the buffer
+ *
+ * Return: 0 if the buffer contents have been transferred successfully, a
+ * negative error code otherwise.
+ */
+int mhi_ep_queue_buf(struct mhi_ep_device *mhi_dev, void *buf, size_t len);
+
 #endif

-- 
2.34.1

