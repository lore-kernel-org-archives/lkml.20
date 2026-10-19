Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792443973;
	b=ZPfhk7bg0QyUKPiSA+1BRouLgGNCVIS2y40MIT04DOFJzbS/s+0H+Aac4NtxkjMtThgz
	 GzpHWat8nLgDcD0vLHF4b2+o/hDe438cXkZcc9C+RoUKESsO9YFEWc+lP70xPFFdMcykP
	 1LWNMdq4bUSR56lXAijni8Hy2jO8lRIeRiezyXrbiHAPaI2Q++eKMAqFb2vo8VsrQs3Kf
	 lg3xnOT2Lz0h4hMuHm/vrnluSUpjkm9PRTTxN+J5Hxpj2hi9K0a9jrCzyCvjGFuObq4gY
	 BlBUaFuHgVnpgcgBY+Nvze892vbQb+blGTSCfOS+tbq1YMUNhOIJZy/a5p7p4TLm3Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792443973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=WqVC5CFEQLN+eiA8h21jf2v2wQ711iAVIxvEEPes1m4=;
	b=hMw5aHSz5ilOp4E+BiP+dYsSVVdHx20spJUzQHnniJZF1RRVmW2y8yKRKnaMMqSnh1I+
	 av26Ol/OVCP3IUduysTJ+5L0FP1PjkqBpE2ofLHFULfNF9LMtQ0QGa1jotRHnjhKYRqF+
	 anbBZ2pLeuAq5YH9Fgh5zQpowZq9a2u1YADYNAVEnr0aKUlMdnXjbifpYd+ReT52U/asT
	 SgNuV0KuzYqXyLkMfhbWnZ/LI1yaTs6wSZAVkROgEz/bBN4LKhl/RMmANEP8wYaWpKQ/F
	 Zx2qn1vk7sQuJL80CX5INtGa+B+xDwS9FyLV3xaUPEU1qgMyJ66D/SYMlg/cs3xG+ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--lrizzo.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=dpX3I1Oc;
	arc=none smtp.remote-ip=209.85.218.72
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFC5606A325
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:06:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BFC5606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--lrizzo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=dpX3I1Oc
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c3f8e149ccfso243361066b.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792443972; x=1793048772; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WqVC5CFEQLN+eiA8h21jf2v2wQ711iAVIxvEEPes1m4=;
        b=dpX3I1OcHLNS2fqeWjFDj9D8EkiAUIUv6c3JhQLfrP9NRsQwQDhxre0oALunj+W1Qj
         MvHuVfZ8jh4DTKEB4MHiHIG6d1eox/pz9VfwcEiRzcMeHJHObmKoJs65fuF7KkFMdLjr
         Kp9R+4WqfGEDy2eCzDLULeiORAlx/0MLHguWrRfonCYTHRwOVvfYgHcqlfkHPW5h7okA
         C10zp2HJUo/Wv1C0eI1aP8ljiklHTUUju6SLLga2rEiQ6ACrRiEMqlmosMv6RkvyGfZF
         pukj0x5Nrr3yCseyV8/w66P8b749eGWgh867q08+2h++RWXYK1y6ja9KWVmO7qRFSmvl
         SgSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792443972; x=1793048772;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WqVC5CFEQLN+eiA8h21jf2v2wQ711iAVIxvEEPes1m4=;
        b=OlqGuA1PmLcppgmHG/1yYwNX8t9ejKJGNxnyXEY+i7aTiRPWTE77L7Zbz9hS6ho9X0
         QhLAEFLyRKXptI3d/vb8YRM0VdOrmWAN18B3Havbk9VL624f8gSIAaGqjVRXKND762Jr
         jSULkZ++rdyAfqvqTry+ZeP2GQD/VMCA/3jGl8dc/9571ReBWBQ9llKLkQTaRXyClgZF
         HsUYXVWuizaEnOeWvAGco0l8tNRiJtWhQFZHXN/SkPubRoognnSIq/G2hpsvvqVUnXfM
         1COHNnVo8kJqFUt50X2nHlRHR9LYYm2miCz6S5BM7d4FCGpS0HrNgHQYPLyIARdK6rKn
         HZ4w==
X-Forwarded-Encrypted: i=1; AKwUvBxN4YtiXSDXTukm9yOx2fqXsW89SQZGunIO1RDgRJK2imYolSwu9pRYKUZ45pMkD3ED9kJsnOlNUtqiei8=@vger.kernel.org
X-Gm-Message-State: AFq9FYK88JS5T91FPCfB8XvheM2BgJNfYkjDr87c2939LTMONkQubc72
	8ID9cR5cDdj2oAoZZzb/PPUzZkkKj4bOgpaFRbNdfHST6fYH1B9k19pz592puYycPKIaz9iCWmw
	Bo3Zang==
X-Received: from ejbm7.prod.google.com ([2002:a17:906:2587:b0:c3b:6442:c974])
 (user=lrizzo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:9617:b0:c29:d31f:7d73
 with SMTP id a640c23a62f3a-c419d83b528mr591194766b.9.1792443971745; Mon, 19
 Oct 2026 14:06:11 -0700 (PDT)
Date: Mon, 19 Oct 2026 21:06:03 +0000
In-Reply-To: <20261019210604.2433620-1-lrizzo@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261019210604.2433620-1-lrizzo@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261019210604.2433620-2-lrizzo@google.com>
Subject: [PATCH iwl-next v2 1/2] libeth: add libeth_rx_alloc_gfp() to specify
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

Add libeth_rx_alloc_gfp(), which takes a gfp_t parameter and passes
gfp | __GFP_NOWARN to page_pool_alloc_netmem(), and make
libeth_rx_alloc() its GFP_ATOMIC wrapper.

Signed-off-by: Luigi Rizzo <lrizzo@google.com>
---
 include/net/libeth/rx.h | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/include/net/libeth/rx.h b/include/net/libeth/rx.h
index 0e736846c5e8a..14a528ea8a075 100644
--- a/include/net/libeth/rx.h
+++ b/include/net/libeth/rx.h
@@ -96,20 +96,23 @@ int libeth_rx_fq_create(struct libeth_fq *fq, void *napi_dev);
 void libeth_rx_fq_destroy(struct libeth_fq *fq);
 
 /**
- * libeth_rx_alloc - allocate a new Rx buffer
+ * libeth_rx_alloc_gfp - allocate a new Rx buffer
  * @fq: fill queue to allocate for
  * @i: index of the buffer within the queue
+ * @gfp: allocation flags: GFP_KERNEL where the caller may sleep (e.g. the
+ *	 initial fill of the ring), GFP_ATOMIC from NAPI
  *
  * Return: DMA address to be passed to HW for Rx on successful allocation,
  * ```DMA_MAPPING_ERROR``` otherwise.
  */
-static inline dma_addr_t libeth_rx_alloc(const struct libeth_fq_fp *fq, u32 i)
+static inline dma_addr_t libeth_rx_alloc_gfp(const struct libeth_fq_fp *fq,
+					     u32 i, gfp_t gfp)
 {
 	struct libeth_fqe *buf = &fq->fqes[i];
 
 	buf->truesize = fq->truesize;
-	buf->netmem = page_pool_dev_alloc_netmem(fq->pp, &buf->offset,
-						 &buf->truesize);
+	buf->netmem = page_pool_alloc_netmem(fq->pp, &buf->offset,
+					     &buf->truesize, gfp | __GFP_NOWARN);
 	if (unlikely(!buf->netmem))
 		return DMA_MAPPING_ERROR;
 
@@ -117,6 +120,18 @@ static inline dma_addr_t libeth_rx_alloc(const struct libeth_fq_fp *fq, u32 i)
 	       fq->pp->p.offset;
 }
 
+/**
+ * libeth_rx_alloc - allocate a new Rx buffer from NAPI context
+ * @fq: fill queue to allocate for
+ * @i: index of the buffer within the queue
+ *
+ * Return: as libeth_rx_alloc_gfp().
+ */
+static inline dma_addr_t libeth_rx_alloc(const struct libeth_fq_fp *fq, u32 i)
+{
+	return libeth_rx_alloc_gfp(fq, i, GFP_ATOMIC);
+}
+
 void libeth_rx_recycle_slow(netmem_ref netmem);
 
 /**
-- 
2.56.0.212.g129ede20d9-goog

