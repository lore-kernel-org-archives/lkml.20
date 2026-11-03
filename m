Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793723012;
	b=KUfwzjlDaL3B5KfcD0kSemPxM48FnzsG0Wk/rjza7pLanHQva1s9C4d70J8FAuzticR/
	 GpZYicBrcbiqCk3V3nGY8URdT/w/B9kT8Lx7PhVXFomrRZkDEIlujHSHBZIc6Lypv7Mon
	 /Lzb39GI505KfXUW6ZWN3mE9P9s4pWnEx6LVhDNr0PeYdpaf3zW15Cr7WuV33jv8SHXRb
	 aIZ6idtG0iCvnfJ67zYTUctGRO4M8ndFMVoqUad5TTiVnixutTZqeuX2weH0ErWxHAH4+
	 8t5+1EA0nku6WERwsFyXHEvF8aX82jpSoBQdG+8baEigv+DeBm6wpT12YsjWAjz6ZCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723012;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=9VsMG0ZVwtVW7+osviETCc9BDdPpuMXt1m2c2HzrSlg=;
	b=BQRxJZGfVnDtG+R+NBP3eEHuf3i40GwwMokv/u+xtaWVxAKKsNvUfASX+4sMNpa9E+Cv
	 DYruRStxO9hOBqgSd7Wyt0iBlOxdjgwZyuWvKLkUoLN+tFqt/NVmX9vQ6zP/Aj2Y8HeD1
	 Apwj2bKwExF144V3xC8OxAwrQVQ6DBjBSbtwTRmLWkvJB+tTsphY4+13BQ/N8drC9emqV
	 hyI0WXHkmrZWkARhswJ8/5PNzA1arGSbZdkH7zNPsfXNyGziOo0nheubG/OymGBp+bZbS
	 VxjkEV5pmO2Lvj92AkrT9x712jbRm6Q0o2NEatadnCbD4mG+GPbX8K/Pmupuvxjg2Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--lrizzo.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="YW/pKNRw";
	arc=none smtp.remote-ip=209.85.218.72
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C35606A32D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:23:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3C35606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--lrizzo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YW/pKNRw
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c44903d6927so455808866b.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793723010; x=1794327810; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9VsMG0ZVwtVW7+osviETCc9BDdPpuMXt1m2c2HzrSlg=;
        b=YW/pKNRwSm5tGIE91eH6g8zAz9IXBaDjjoJBQr8N11TFOP4YzESNOBkHYtRzxCq2ow
         KZhRYnPhQZfPKcLYUnGPXYod4oEQ6eI29VBoWuXLR/cVfKBDlPBYCSlNHs89Odjq1sqU
         0PTFreFsAAOfEno+C09cvb+XCJGDbDEIV8+NYp/7I89KC279HZKqugZNe4a3bwQkytj3
         XQh4lyJGnAbq2MWNU+6H3F6C9eBuVShjltWv7KmsdRr0gQfvp7F9hcQlwi+SdILlDQKh
         kgmTEFHmsOHUZOq8OelYq1baf0v2qUGKM23PV9bRIQ8sOlDcuj48RwGM+KHi0vEwXkxj
         06CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723010; x=1794327810;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9VsMG0ZVwtVW7+osviETCc9BDdPpuMXt1m2c2HzrSlg=;
        b=hp4qwOSrzAN5xyiCDGcpvZwN/PEYtXQZ/Blb8CcavCyWcMTUfTosjK1wu9xMa6K1q0
         AnuLU3F1jnmJeAwHchzcvRQ9Iz+tcgMMnu5YV+EvVlE6MGaRrNMFHYVrbWV78S4AesNz
         QLmqmdok8kR7lPr/3XpaJ29ywj67GwLfFKIp3v09CX67W8RgpU+qMQByuY3Y6iONGwpl
         KlrVjXi0Dkn5sToKvE6tbyHPinWa2CUk6CdEmRW7UrnG3UeRPzHdwhfDuD7tebbg2sVp
         EN2m6C//8So2p27bamFQf7ZS24/RV396oygjLwdEtJ5AuEcGrLboy1MltYNrf0p2Rxdg
         nC1g==
X-Forwarded-Encrypted: i=1; AKwUvBwWyF+E1SEnUpHhHK75FNrvI8HgD3FT0utThIZ9D/Xuf7MAJQ4/izj+O4GkRZFYs8+8EkHC2VVjkfu9C5M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9S52ZkCGHHvsW63OVRIKbPLfge6vw4oZLJmHx+YhTtSx4cwf6Y
	FNizOeZPc92i0pXMvcNF7W9y6mGXf+tz9e8Y8hJxQNpj5Wj84edS2TmK9UZUiRIfrK+vuFDdnGH
	X7O3uDQ==
X-Received: from ejeb13.prod.google.com ([2002:a17:906:194d:b0:c4d:5f4:bb5e])
 (user=lrizzo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:906:f582:b0:c34:e9fe:82ed
 with SMTP id a640c23a62f3a-c4ca7aac4f0mr1166497966b.28.1793723009807; Tue, 03
 Nov 2026 08:23:29 -0800 (PST)
Date: Tue,  3 Nov 2026 16:23:24 +0000
In-Reply-To: <20261103162326.3615979-1-lrizzo@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261103162326.3615979-1-lrizzo@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261103162326.3615979-2-lrizzo@google.com>
Subject: [PATCH iwl-next v3 1/2] libeth: add __libeth_rx_alloc() to specify
 allocation flags
From: Luigi Rizzo <lrizzo@google.com>
To: intel-wired-lan@lists.osuosl.org
Cc: netdev@vger.kernel.org, Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Luigi Rizzo <rizzo.unipi@gmail.com>, Brian Vazquez <brianvv@google.com>, 
	Joshua Hay <joshua.a.hay@intel.com>, Larysa Zaremba <larysa.zaremba@intel.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	linux-kernel@vger.kernel.org, Luigi Rizzo <lrizzo@google.com>
Content-Type: text/plain; charset="UTF-8"

libeth_rx_alloc() calls page_pool_dev_alloc_netmem(), which always
allocates with GFP_ATOMIC | __GFP_NOWARN. Drivers also use it to fill
their Rx rings at open or on queue reconfiguration, which runs in
process context before the queues' NAPI is enabled. There, the caller
may sleep and GFP_ATOMIC is needlessly restrictive: it can neither
reclaim nor compact, while the initial fill can allocate tens of
thousands of buffers across all queues.

Add __libeth_rx_alloc(), which takes a gfp_t parameter and passes
gfp | __GFP_NOWARN to page_pool_alloc_netmem(), and make
libeth_rx_alloc() its GFP_ATOMIC wrapper.

Signed-off-by: Luigi Rizzo <lrizzo@google.com>
---
 include/net/libeth/rx.h | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/include/net/libeth/rx.h b/include/net/libeth/rx.h
index 0e736846c5e8a..1333850f421a3 100644
--- a/include/net/libeth/rx.h
+++ b/include/net/libeth/rx.h
@@ -96,20 +96,24 @@ int libeth_rx_fq_create(struct libeth_fq *fq, void *napi_dev);
 void libeth_rx_fq_destroy(struct libeth_fq *fq);
 
 /**
- * libeth_rx_alloc - allocate a new Rx buffer
+ * __libeth_rx_alloc - allocate a new Rx buffer
  * @fq: fill queue to allocate for
  * @i: index of the buffer within the queue
+ * @gfp: allocation flags: GFP_KERNEL where the caller may sleep (e.g. the
+ *	 initial fill of the ring), GFP_ATOMIC from NAPI
  *
  * Return: DMA address to be passed to HW for Rx on successful allocation,
  * ```DMA_MAPPING_ERROR``` otherwise.
  */
-static inline dma_addr_t libeth_rx_alloc(const struct libeth_fq_fp *fq, u32 i)
+static inline dma_addr_t __libeth_rx_alloc(const struct libeth_fq_fp *fq,
+					   u32 i, gfp_t gfp)
 {
 	struct libeth_fqe *buf = &fq->fqes[i];
 
 	buf->truesize = fq->truesize;
-	buf->netmem = page_pool_dev_alloc_netmem(fq->pp, &buf->offset,
-						 &buf->truesize);
+	buf->netmem = page_pool_alloc_netmem(fq->pp, &buf->offset,
+					     &buf->truesize,
+					     gfp | __GFP_NOWARN);
 	if (unlikely(!buf->netmem))
 		return DMA_MAPPING_ERROR;
 
@@ -117,6 +121,18 @@ static inline dma_addr_t libeth_rx_alloc(const struct libeth_fq_fp *fq, u32 i)
 	       fq->pp->p.offset;
 }
 
+/**
+ * libeth_rx_alloc - allocate a new Rx buffer from NAPI context
+ * @fq: fill queue to allocate for
+ * @i: index of the buffer within the queue
+ *
+ * Return: as __libeth_rx_alloc().
+ */
+static inline dma_addr_t libeth_rx_alloc(const struct libeth_fq_fp *fq, u32 i)
+{
+	return __libeth_rx_alloc(fq, i, GFP_ATOMIC);
+}
+
 void libeth_rx_recycle_slow(netmem_ref netmem);
 
 /**
-- 
2.56.0.385.gac671c819a-goog

