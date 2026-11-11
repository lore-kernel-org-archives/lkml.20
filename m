Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.67
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794437268;
	b=dqAU+YM2SlmSo7GSAwbkBtd3av3ehPCqhS6WdBGrTn3Fmzn/TJaVAJ+/qE9Wh3iCe6eA
	 c4k90/aVd5V+ruXPvydWfguDDZ+bDqOZOJeY2yuV9VPNRc/Yb6TgZ9whLELxkErn/vmlW
	 buSkQdGfoMFA4jZ/p3FrWYCS8jAMZuk3lJ5gwnOrmqb3Pi7mVFpRJTKXoRKD+0sWepnZd
	 3iccPqnCWjzLy48WyCRiQfz2l+ZIKYH1onWSDBpgfw08zLm2F89IBXXqFKVBCi2axrlMh
	 NDtsmb/0JICUeHovPb3EDCGEu+QRRw8rxuRYCXp+dzJ0hUJanAp3/qjJJVqld23wiVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794437268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=4hN7C3+Ii9TScat9ZCbbeY9Q6fb9s0by3LwxPMo02TQ=;
	b=RHqstdI6Qax184s25J/EKza3TA5o9/0ZFVOwliTUSTYCEDr2mmLUndyS7k7FYAQh6usV
	 259w6xgn9Ob6cbk+RCLezxH/2OHBJ+yDr53sJxRnAHLMdGTM5VLlcV+AHRTy+E7e/bQ7t
	 tDmAjKK1jWcQ9wez2Q35oNRe9O3cCLZX2axT/1psKkmOqjcvkfDepVuLc7BhBTk7Ldut6
	 PvUgdxyER9LEcAWsVzxTAjB0hQOwJU+5G5EJGJn/1JhAvLozk7uvtT2fQXLOoWs/ifkij
	 runW/6CsNxulrkwMx6O56bDC0TNRP+4IKZtZSXN9gp1hxk3ttc0Z7DyySRSuAo8Bp/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nAJkqCHw;
	arc=none smtp.remote-ip=74.125.82.67
Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C44E60A5BD3
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:47:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C44E60A5BD3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nAJkqCHw
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-18818daa3e7so169613c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794437267; x=1795042067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4hN7C3+Ii9TScat9ZCbbeY9Q6fb9s0by3LwxPMo02TQ=;
        b=nAJkqCHwpwdzkCPHLl4r4j1xM5P8yXkPiLbuxvWdfJkCzJFRVh9IqYWdfCmu2LNmtK
         JmnG3ovMF7UV/pO/Di9viQu8YL4X6aERpCTcyLNeNO8RcY2jQYGs4UExELnm4RV2Gujb
         8QUMF/Sgu+hPOo8o+7QmfIKc+BEXG1P3ZhjJZePFMKFB0qlxMMlvnrJMtDP7MxpXnVWi
         oB0YMQzBTHq891Nx0126X71VAeGvz3/eCd1Jl4eI+QlcG1X8Bl+qGSAm0TKWH+khyRZT
         i03NxJUoShTj7voGFTXFI7C614Hg0Ed5VAqb7O0derPNFtfH68AkNSvQ5KDYPQlITmkZ
         pKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794437267; x=1795042067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4hN7C3+Ii9TScat9ZCbbeY9Q6fb9s0by3LwxPMo02TQ=;
        b=mPB9CatLx3LAOjuPMgclcMPxxL0oOMcJV2XZuGGvmyuI4uAq8BiAB1UiS2uTFTeUPQ
         gRyTtcG6w74eqwxM7ZO9HlKGQhH+gBS8NcLkx2hIRZ0vGuXEvQUzy58gFr7qaIjbgawS
         WLvrObGG/wUmYF10ZLgMtg2iKkjHxq0KYlDir85fItcHsHCceJWshEcC4ShcL1rbiA0/
         vpxkHKSMmMyfw57dN3SoA2EvHiWfKA2wkJ0f92maVifa7ZWiC8Q1H185du9N+eVZX5+U
         TSpSRQWq+ZYQav7KLvOL+amRfJM+4nJyVKb9rMkJIAqtKwVNEzuAwL2L40HbICXEFwdP
         ujtg==
X-Forwarded-Encrypted: i=1; AL+hErHRr9V9byQxHIwqKRvSBab0Ce7CVxjTgKt/jatzkEMAywQjdDzyiO/xFlQr3BkJrflHwbabjabBnvweHbM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9R0TRID7q1sqeXQ4FWs4MxroKumIKJrLW5TSKswdcBx8nGxo6l
	UU5RGcYUTD/NfIGis1uV30nS1sCkwz/OXoAp8EEbkX53sJHSy3//sZdcEFOwrfggT4c=
X-Gm-Gg: AYBFou3/KTO9QckOFhaev6fEw0PtgX6d9+B+oP5vnvP0n0DgB99HdqcC9URf9JwJgTj
	eolcHzyzBCykVispv6OnQiP9rqBiNGyS3r/yL5uAyQRTVaXO3kujhuqE8RJMP7zGCX5TbEFNSW+
	XZoBd542+p8EH3oIx8vHNRhGQ94cWLgF8CEKytPVcEFegz+RSIJTd+e5jguh6tCLFMZqhtBFhJC
	ULNtoIUhxUBhBhHgQcmTd+NtVp9sOhklZvHrCwnJp9Q5vOpuj2G7UUM/eB5vL0wynojsvMo2nGa
	rX5buGTxkll/XEHLbkoODdWUe/asG5sSphpsCfelvRwFMK6VVu6TOTrrmdlWKSYH/N5D4M6g7P3
	Pz3eAXy1oPGSTAYwL3YpkE16pi89aBF7yfU/7ASvLY0GOnaXz4n9F9B/CbhyKCqwfkPGo5sTbr/
	Svz/PTdMkKB6mwhfIN0yOqmwXLc1yypB5SZ/PbQKQsAzsMTkZ185hbgzpprjxgrFDrdO9RqokYz
	b8/HzW7n/Afz+cSUNrRXgcCdWorfC5gUAmRyBsaJsZOlpVuQL8xOAUcyH9sgGSFTiqbBK/ffQbE
	xqmcPgGJK+nf+9HdcYYriuc=
X-Received: by 2002:a05:701b:4212:10b0:1b2:459d:331f with SMTP id a92af1059eb24-1b4f5f5c6b9mr742611c88.16.1794437267067;
        Wed, 11 Nov 2026 14:47:47 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:71::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b4efc2sm16602523c88.15.2026.11.11.14.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 14:47:46 -0800 (PST)
From: Stanislav Fomichev <sdf.kernel@gmail.com>
X-Google-Original-From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	andrew+netdev@lunn.ch,
	edumazet@kernel.org,
	horms@kernel.org,
	shuah@kernel.org,
	almasrymina@google.com,
	sdf@fomichev.me,
	leitao@debian.org,
	dtatulea@nvidia.com,
	asml.silence@gmail.com,
	bobbyeshleman@meta.com,
	daniel@iogearbox.net,
	razor@blackwall.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v4 4/5] net: devmem: size TX net_iovs from the dmabuf sg table
Date: Wed, 11 Nov 2026 14:47:39 -0800
Message-ID: <20261111224740.2744522-5-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111224740.2744522-1-sdf@fomichev.me>
References: <20261111224740.2744522-1-sdf@fomichev.me>
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
- skbs keep their size, only the frags get larger

The net_iov size doesn't depend on the device. A frag is never larger
than its skb, and the skb is never larger than the device's
gso_max_size. TCP sizes skbs to fit, and validate_xmit_skb() segments
bigger ones. gso_max_size is 64KB unless BIG TCP is enabled. With BIG
TCP, page frags can already be 64KB or larger, for example with
MSG_ZEROCOPY from huge pages or with 64KB pages. So drivers that
enable BIG TCP already have to handle them. bnxt doesn't handle them
yet. It has a 16-bit BD length and needs a separate fix.

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
Reviewed-by: Mina Almasry <almasrymina@google.com>
Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>
---
 net/core/devmem.c      | 28 ++++++++++++++++++++++++++--
 net/core/netdev-genl.c |  2 +-
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/net/core/devmem.c b/net/core/devmem.c
index c6868f39261a..713528048897 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -303,6 +303,20 @@ int net_devmem_bind_dmabuf_to_queue(struct net_device *dev, u32 rxq_idx,
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
@@ -313,11 +327,11 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
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
@@ -342,7 +356,6 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
 	binding->vdev = vdev;
 	write_pnet(&binding->net, sock_net(nl_sk));
 	binding->uid = sk_uid(nl_sk);
-	binding->niov_shift = niov_shift;
 	xa_init_flags(&binding->bound_rxqs, XA_FLAGS_ALLOC);
 
 	err = percpu_ref_init(&binding->ref,
@@ -387,6 +400,17 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
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
index 9c5bf17b04e5..d2ccb1090496 100644
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

