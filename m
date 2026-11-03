Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793749923;
	b=yykA+/qVEGP2JXyY8l0PEDVEZcdYVQtwxaWcOynWVrBfL0HRTpjlXt2WDh6ZTMxbs48d
	 Rf2EsVl3a/U+pN4ihhdej2tmz1Uj5PNnYFQ7OPtLML3/Mz694eqWV9vt7d5ds79MYZKt4
	 a+C2CXzP0E4ezHEOGIVfGxW8nYOlJ8pS8HWRMsA57r9WvN3JnveP6Wrlo0AlsFi71OEy7
	 bddkmeG0NXZjklocXB3tG5WKU6O0zGn1iwn8sdzCCQjWGyfOVPp+Qp3hI5Es0l3m/01Y4
	 9SfnBl+oMDwl/ytDraQLidqvaPU4jAtgAbTMRmIl6hJuGmE67rFuLgv9G1plVoQOQaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793749923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=YK0Xr740yMaz303kQAw5xU/hri305+ZpCPlJBa3zu5I=;
	b=BA2DzqxtYs6jS/y6r52nS9jt0n221ujDL4AQpByPRhpQtDIWzycZNT7bKiDD98IBHRls
	 e3J8VmIm3Deu5aSmthIZ5AzwDUAFC4pjDSn9eATCv4KXVJca8BaZtjXq2MVkU3KV1tL/6
	 wVuMDAO8veb2/yYdnehiwYSfQi8cQQUxFTGs0ZxjuBNamPoWhqsNWTF1M74Lc35w9Sxlp
	 AHIkGHHgxJ9TvibPpkz2NDURDgswQ//vaqtEUP9s97JnWFwGx5NlC5SNJnIjYCw69wDFS
	 pN8F8zfvMq1PjJ+GJ3IEfMxtlUi372wRkyZ9SRY2qZicTTSs9MXkbCLU2+LkpfSF5OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ibeH9DzR;
	arc=none smtp.remote-ip=74.125.229.133
Received: from mail-dl2-f5.google.com (mail-dl2-f5.google.com [74.125.229.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67364606EE9A
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 23:52:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67364606EE9A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ibeH9DzR
Received: by mail-dl2-f5.google.com with SMTP id a92af1059eb24-1ac216daf7dso60594c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 15:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793749922; x=1794354722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YK0Xr740yMaz303kQAw5xU/hri305+ZpCPlJBa3zu5I=;
        b=ibeH9DzRIx4RfJPxFHevHlDLr/xdu4QlU9YCsTEV7vBw0l4zutu1+wX3cGgEFI0Up+
         CVu0HBGKpCLnauFhvNuKxdWvE/qXcbaTNrYSZKDwDqF/iH2b7xd0T5PgFqQwR7BDn0pa
         Rq1D90uB+attIqkpLE2zIEaD5/5JfR0laKPNMuYywldn2ktuZtRARf+yB6gMO6LqXH3a
         hEFFwo2eCeXcLrFsUYt0aR79LL7Zm/IG9nk+H074IXsetu1oYEevVpEpoge21ZwSDkZe
         UC9DLBOB+CdzmX6Wz71LszCuBKJN1fdZfHa9hb4u8IeSILYNKVjY8c97A8kW9FbNWbPl
         fWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793749922; x=1794354722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YK0Xr740yMaz303kQAw5xU/hri305+ZpCPlJBa3zu5I=;
        b=1mnnLF6iJU+WP8mNAa59brFDSdDXXDlfhpSG83pwqMhNfsWot4jjVFZU1lXBvkDwC7
         fcar4/6iE3kf1NdEoGyreLOJDjT8lwivPpDYhQL8LIEjJtk3mRkZiljRvJ6cZgC/1gs1
         xaNkO58u59y8d3culAEtqAUFVJwKru0PDQ44s0E6647YsMaiFuLIhG5LnsxFmt1cwigY
         xbZbqEBRAJgbG1230vKdeyI4pxwHlaUCg/3zctWlqS5nYIsHeKTZP6OBCCO9Xgl55EVD
         kVtu8xIXG/KyaxPT7ELSzmSS4jPNX3jBjeDIRJfJiuJwtwfiTPMtvqrYfBI6/rwSyDDz
         HW+Q==
X-Forwarded-Encrypted: i=1; AKwUvBymjVgXJIBEYvbc3xrZKiemGAnmnBSpbjBZI6GPx4XZczCWVEhLR83c7Ldy8W9V+O3pm4g3kHja0KX3Zd0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QPH/LgQgnm/zM0I9jB+TpsVsln42kvuHcisz4lcizwZJqo3ZX
	CgjpLBgWvSnsxFGN8IZiE630TVrGkhGAh/otmJUmayn/u5tno1LG1syT
X-Gm-Gg: AYBFou0yax9NnT3fJ28BFsZX9E88zuMMLyjcyS6Ls6ydGPCXG7vrP9zKUDTOlg7sbeZ
	hTHeOy9vYOkMmBKfojvtxD+f6yisoNloGZLhFv4iwAY31nBRXTVJ19Xtpxkb9XUxfnKrfRNJCv4
	FZN5d9cMae6L9fdmVLDet8o2TTvYaKJH7q02zS/EUA+sWqU7Q+3Ppp+6ty9XXMZlJfW8Os7/hmr
	BqSlKUZ+9i1mCfqrzlJ5GFTEfO1L9rxUzWnW+K2mufxUZdSCQKTJFpTIL7iEKtHaJOAWkQbGfSg
	uqERKQy0na704acVlD3oS3FvFPU3GSoauT6OORh3J1v7g8H1g/qtiIPK4hAh67RLe1gEdqTv4jD
	kiuigsULd3XOkEzRQG22JFh2+lnATR6Rm0xjedyUdxuGT61QMQ67ymioUEKgreaAZP2yMvjDlF7
	q9FMl1gPUUE4fahRFNYKLqko1CwRrPOHTnisbTFcvmcgSLUCw1bpIoGF6ZiMHbo1Gf+3zN0I2Hv
	+CcGpdSLF6gMmN/I1gthertH7QNdvjtr1rTzZRuMSNQ6Y06XFQfsQllyghuUT89QntScV6ad4KT
	N6QUi2tc5l8stHRuCUkeRmZLeoD6Y6XH/9rIaBVtbi9q
X-Received: by 2002:a05:7301:6405:b0:366:83dd:4704 with SMTP id 5a478bee46e88-36a423dc7f8mr22151511eec.17.1793749922079;
        Tue, 03 Nov 2026 15:52:02 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:6d::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca39b3b7esm1439560eec.28.2026.11.03.15.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 15:52:01 -0800 (PST)
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
	sdf@fomichev.me,
	almasrymina@google.com,
	bobbyeshleman@meta.com,
	asml.silence@gmail.com,
	razor@blackwall.org,
	daniel@iogearbox.net,
	leitao@debian.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v2 6/7] net: devmem: size TX net_iovs from the dmabuf sg table
Date: Tue,  3 Nov 2026 15:51:51 -0800
Message-ID: <20261103235152.1904727-7-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103235152.1904727-1-sdf@fomichev.me>
References: <20261103235152.1904727-1-sdf@fomichev.me>
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

