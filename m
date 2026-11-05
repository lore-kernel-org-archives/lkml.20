Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793917272;
	b=CQKaxQagRwCJbp3tuJIsXZespvNxeR0EINi/kgAkkTQa2nhOxqCLgY8751bZkYK1dHzg
	 TXbolTyuoaVx7eB7ZkXNwadMn0hi5MscNUmdK7Gb5z52cV1+r/RnevkvHSlmHazTqR2JE
	 ladR2Mm2jczHGObd4EgZDpbaR2TCw0ZcOoJ1QCS8JUemT8y1QCeTB+BLfSe3jrg2Q91SO
	 S32LmiX9uEp6AIHIOkyzR2WJ8x/CVbrHnlc7deQGkr+JLygEQoSkMM5RymEp1Mc3IrE85
	 D7WmJyQ7HhswU8Y67syWUdCv5mvzO8Zu6jHcOWBFx3YeyZXN95cL9BnK4pt5k29U1gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793917272;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Acd/QpdNjaZoFfEYKM7452m8zFvnMYypavI01EcAq44=;
	b=r3JNScU864Uhv1U4ssF+sY/jGGbQwTeuIuztqw0xZQNYgFJce1vUnHy+wcpYlfZiiefY
	 QewAALbELRD2lRAs69r+jkbtiwQfA9qJpQoRoln1qJsMs4ufFl8K3COtWosKIrv53FGJa
	 2rn/o305qT9yliA9ZlVeGDyHkSuiZyE2ETE5FvmIzqzXA8IJxEuW7JRPsEDR9DNH3+Q9X
	 /HQxsaCgRcJej+ovcXd3d2jdBP5V0LiuS5iv9VCNhI7xQ9TUR/Ghy46YmtUgItcaxLoi2
	 8At/5+Sb8Q5QXjuUjz9ozFOjT5i7fwQWZO1vVKSs3v8YNYptlsfymjZF3I9LsJwpEjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gpahHltS;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3AF606EE8A
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 22:21:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A3AF606EE8A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gpahHltS
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35829219da8so1147713eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 14:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793917271; x=1794522071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Acd/QpdNjaZoFfEYKM7452m8zFvnMYypavI01EcAq44=;
        b=gpahHltSOyFyzTfMXDIYVv/IO8fAwDTU17+d5bpsCt+yDVFs0wG1xrAMoRJicRmKPa
         gKI8s57ZpODIASUIp5wXVVvn0dIMueFV6tmFExcufTlIvRDJ4FwcnjfpO1YiuNJYskh9
         wLBlCA5zt/TFk4FPt/ikmVcTIxK+DS/GQI6BDUCn7xk5eRTj+QDNPe7/IfzP0+PoqJDO
         f6Klxp95jMLnpk15i8axVytxSGb3KcE2gi3iZOQscKPFpp/t5tmXo2nxodEhCP4PNuci
         E7Zsalf+0684reRO+DpFrYWLcmSLFMcGH2zy2tw6XNi9+YUIR+sge4x6dG1zkuero/lF
         dJQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793917271; x=1794522071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Acd/QpdNjaZoFfEYKM7452m8zFvnMYypavI01EcAq44=;
        b=P27SksmD8pocjBAankUinzpv4+ipNdlItKqaPbZd3WuQNJA/GrHjkYaP9iBFIhKRer
         ZUcI4HrPrGXfWN9xjxkeSd6+w843nUV26KXgRjTWsi+AxEqy5ApWffwnkOAO0slmGEPI
         FCqUZsdiYuIWgwsK8bdvGt7sf9rrqY0D6MzqcTCC1568dOuU9bOHhyRXNyEyOklPoHcb
         MH9xfnOY4raHaN9xLJh4I5U9bg3fNiRF0gszigoS3EfI1Z3rToATxisF7iWqnGhuyYUS
         DOkTjSWRWQeOAS7RPeyqSmAUpiETsDXZieF8aUlGPCeHtndOLrZeroOjunblEHecMlB1
         20JA==
X-Forwarded-Encrypted: i=1; AKwUvBzq1A5Elu5KRJEJOpvwQ6o8JnPR0oPsOktkmBM9BsPjXr7tgVbgz/HoGHPYEXwRWMoT9h/ZqTYhvcPWyvk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9R0RkvwNzDx8YTMr8F/YZ96RKDLdlf4nCvbJ34oPa6U9CtAJMV
	j4ifSC6YPCR9fl4P1egq/8rEsdYfKFS/7RuW6Lels4aMspGDVusD9BJu
X-Gm-Gg: AYBFou2cWiFdzpE6bMYJ6I0UIVv+oOm5vpUN9nAsCpaIfEXf8J8JpRdL47aVFuWaKEW
	H9P/1DrFr2XCeBR1Yb1AyccaH643VNL3g44pSUmydJGqvF3SrLV1A/+7oSEEJccwdUF/tJEXYCh
	uxKyk/aSp3GYBAjR+1teZBbfzxnPV7blK4Kl7zjp8j7wF1QyFnN6F5600m9gE2tt23dBnMl24JW
	K6rVR8C1UXIk0NJV4viJF2eaCLRjQTrBY/+9xKG9wfMkieN/SCECQJ65aCQNFlGHbgC65qogsNt
	QQcBz8FVNViyz0o/JVJ00npt0zqBcfb+aVM6zLYirGIxF9F9MtvlfRm/U6tCLxJqP1OAntQxyRm
	w61pSOKxyKkBSLBF6eXZrHFcoPn1s0a8DQJaZoFGFMUrnXx69WwQ9o5I9BLy7VZG4NXOh27kfWv
	CzpzWW5ovHULy9d3Rua2bgzaBl9tIG8nGtWTOHllVj6ss6W1oECEibY/zdm7PJQ9GCsU/e5ZmL9
	pP/92FVXNlcnYfmGBaZ3U87MBlM6cBHR/3sjSueD5xdpTgEsbWRejKc4JkHwmtau1gOp0wR5q7A
	CbTmTXsw5+vV6dDPwY0WYnA=
X-Received: by 2002:a05:693c:8854:b0:36c:a1bc:6102 with SMTP id 5a478bee46e88-36f6f88bc79mr764065eec.0.1793917270504;
        Thu, 05 Nov 2026 14:21:10 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:72::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8d44500sm51197eec.5.2026.11.05.14.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 14:21:09 -0800 (PST)
From: Stanislav Fomichev <sdf.kernel@gmail.com>
X-Google-Original-From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	edumazet@kernel.org,
	horms@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	saeedm@nvidia.com,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	alexanderduyck@fb.com,
	kernel-team@meta.com,
	sdf@fomichev.me,
	dimitri.daskalakis1@gmail.com,
	almasrymina@google.com,
	dtatulea@nvidia.com,
	bobbyeshleman@meta.com,
	asml.silence@gmail.com,
	daniel@iogearbox.net,
	razor@blackwall.org,
	leitao@debian.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	leon@kernel.org
Subject: [PATCH net-next v3 8/9] net: devmem: size TX net_iovs from the dmabuf sg table
Date: Thu,  5 Nov 2026 14:20:57 -0800
Message-ID: <20261105222058.944293-9-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105222058.944293-1-sdf@fomichev.me>
References: <20261105222058.944293-1-sdf@fomichev.me>
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

PAGE_SIZE TX net_iovs cap devmem skbs at MAX_SKB_FRAGS pages (~68KB),
which makes BIG TCP ineffective.

TX net_iovs only need to be DMA contiguous. Use the largest power of 2,
from PAGE_SIZE up to 2MB, which aligns every DMA segment of the dmabuf:
- 2MB hugepage-backed udmabufs get 2MB net_iovs
- no UAPI change, TX addresses are dmabuf offsets
- skbs are still bounded by TCP's size_goal, only frags get larger

The net_iov size doesn't depend on the device: frags are capped to the
device limit when they are built, and many frags share a net_iov.
Capping the net_iov instead would only split frags at net_iov
boundaries and allocate more net_iovs.

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
Reviewed-by: Mina Almasry <almasrymina@google.com>
Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>
---
 net/core/devmem.c      | 28 ++++++++++++++++++++++++++--
 net/core/netdev-genl.c |  2 +-
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/net/core/devmem.c b/net/core/devmem.c
index 19c039ed2cb2..98c9594dbf99 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -181,6 +181,20 @@ int net_devmem_bind_dmabuf_to_queue(struct net_device *dev, u32 rxq_idx,
 	return err;
 }
 
+static bool net_devmem_sgt_aligned(struct sg_table *sgt, size_t size)
+{
+	struct scatterlist *sg;
+	unsigned int i;
+
+	for_each_sgtable_dma_sg(sgt, sg, i) {
+		if (!IS_ALIGNED(sg_dma_address(sg), size) ||
+		    !IS_ALIGNED(sg_dma_len(sg), size))
+			return false;
+	}
+	return true;
+}
+
+/* niov_shift == 0 picks the net_iov size from the dmabuf, TX only */
 struct net_devmem_dmabuf_binding *
 net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
 		       struct device *dma_dev,
@@ -191,11 +205,11 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
 		       struct netlink_ext_ack *extack)
 {
 	struct net_devmem_dmabuf_binding *binding;
-	size_t niov_size = 1UL << niov_shift;
 	static u32 id_alloc_next;
 	struct scatterlist *sg;
 	struct dma_buf *dmabuf;
 	unsigned int sg_idx;
+	size_t niov_size;
 	size_t niov_idx;
 	size_t i;
 	long err;
@@ -221,7 +235,6 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
 	binding->tx_max_frag_size = dev->netmem_tx_max_frag_size;
 	write_pnet(&binding->net, sock_net(nl_sk));
 	binding->uid = sk_uid(nl_sk);
-	binding->niov_shift = niov_shift;
 	xa_init_flags(&binding->bound_rxqs, XA_FLAGS_ALLOC);
 
 	err = percpu_ref_init(&binding->ref,
@@ -266,6 +279,17 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
 		goto err_unmap;
 	}
 
+	if (!niov_shift) {
+		niov_size = SZ_2M;
+		while (niov_size > PAGE_SIZE &&
+		       (!IS_ALIGNED(dmabuf->size, niov_size) ||
+			!net_devmem_sgt_aligned(binding->sgt, niov_size)))
+			niov_size /= 2;
+		niov_shift = ilog2(niov_size);
+	}
+	binding->niov_shift = niov_shift;
+	niov_size = 1UL << niov_shift;
+
 	if (!IS_ALIGNED(dmabuf->size, niov_size)) {
 		err = -EINVAL;
 		NL_SET_ERR_MSG_FMT(extack,
diff --git a/net/core/netdev-genl.c b/net/core/netdev-genl.c
index 384fdc5ae514..bfd229bd31ca 100644
--- a/net/core/netdev-genl.c
+++ b/net/core/netdev-genl.c
@@ -1261,7 +1261,7 @@ int netdev_nl_bind_tx_doit(struct sk_buff *skb, struct genl_info *info)
 	binding = net_devmem_bind_dmabuf(bind_dev,
 					 bind_dev != netdev ? netdev : NULL,
 					 dma_dev, DMA_TO_DEVICE, dmabuf_fd,
-					 PAGE_SHIFT, priv, NETLINK_CB(skb).sk,
+					 0, priv, NETLINK_CB(skb).sk,
 					 info->extack);
 	if (IS_ERR(binding)) {
 		err = PTR_ERR(binding);
-- 
2.53.0-Meta

