Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792811044;
	b=nfLWpsymtYD0TjZTCXViXcvQKUw55ZN6i5/8ae8Vm/r6ar6hIqPWVPeiIjHCDLkpst5F
	 y+8H5v3oqbF1+rlkZmbZjtwTmHLQCS8gi/R1l4ZCsMz/6/Z5IpMYM8LVhGWdEh63t2A79
	 lUBzJz5AaR5Dj9a7XFPHH4rSK2AhgBCv7oPrFlFj+FwMMeMzx9QCGX465xL3JUj+JsmrT
	 narcjUvyzhjjd5YrIdQu6vgNHVfV8GqAkbuRpY9rljRa2Yv8rBegbvhIWA1eOI7YfBW/F
	 D08cEjV3LlQ66XUFg2Eg1A5LrOiJMxPu91yN//cP6VgSiR7JacTJWHh82N5LI8WIYmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792811044;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Hs4kepycTRBAy17QyXDZeRCyHZAEsRiAGe7625jFRXk=;
	b=Gvkrj4PdK6oUv+B3gCvHye8EJuQ9diWXAMcMudmZ+cSc0mVT2zZn35yF+Kwq1VB56Aft
	 4TFO7zMyEL97uI3RnRwuxXuwx7ZPzB2EWHw2mOvQ/AtltuP2kRz4xDyRv1z0aN6BQzgW5
	 /T/7UyFwPqR0yaeqY6quzvkylXjU/vtrcSD0PV9diKyIi+W+rpMAyqb+2yL5y19l1dv6N
	 3N7HckrCBjl1MCa4c7OhMoRCfkMvR36ZIAUBIpK27QnvxG68SL5iySnk8VsBnoYv5LpnO
	 BU5e0p29DI5xpnWXHS0kI4binZGl7Nc7vPuTb/EF7TBMkolGRFGAWzo6qCwm8M5ezpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=f5TcGnJD;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A814D606A320
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 03:04:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A814D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=f5TcGnJD
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3662e7a9299so6409428eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 20:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792811043; x=1793415843; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hs4kepycTRBAy17QyXDZeRCyHZAEsRiAGe7625jFRXk=;
        b=f5TcGnJD5/0A13Dz23oyZjpdqIzw9RLj99NWY/iNJZ19+LhciMcWqq37S1Pww8zF28
         65In6iR3dSE7FMunQ6H5/pBzL2g51Xp0z/zI4+/xqOBOWH41UcqszUhsOWSy1dyD1fs3
         GV9xGGQqJAQW90pM3UAlhf1SeyhpeVCgfr7vJoCkk3YrZj4xMm8clOMXkWBjrrJRyjfV
         MyO3RGe8puxLgvr3hJugzg79d4eo4MYiqSoQUIM0b6ar9IFWXXMEnqzeNpfrtyrB3kur
         YF9jEeB9jk5Y2+QEhYp0ee1lxmdBREUJjOIwAyp0xKn9bk6DcRWT6KMAnvRZWyrknZn6
         QzxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792811043; x=1793415843;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hs4kepycTRBAy17QyXDZeRCyHZAEsRiAGe7625jFRXk=;
        b=S2HyHCDyFXWwlzYFesXr78djuHgQLvSMAESWTOxRIO8FmMXdHiv96XozSAn2srnJTr
         ILUqFEmLpKADWcqByhg8P2A06ZtEDoQ6PlzzlbraUV1Cyl6kvdaT2PSm3wvnU/PGCl/p
         hKUs/XNBCV4agsbRPkv/DCUlzZjACsH1efxTslIm4Cve87Hfo4Cdn2JL4r+8QlF+X9BP
         KsKlTsRCUnowiwyasrn98E7pMANpsv/LYnJYIuEczOHsFvD5OzUmEG5conolTwCfFZAG
         3ZZKqufq5PtWDHGg5G6545oYl/BvW4sDfHNt3zuE5MNokRxIyxYMqMkfnUM7ckshVpwQ
         mG3g==
X-Forwarded-Encrypted: i=1; AKwUvByvfEwT+lDU7i9PWNpgd2ouQaDwCGcub+pnH7/aVYw77ij0Tdfrk3iMZ3KNFP3ClqQlxNIt8Bv64CeAUvU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKLEEtaHBHD71Se9ZfwDoeS9vbe+ZhQHF36Kq1Jzi39v1I7Csl
	lIpj4C7N9nZX10yf9HAQLEiAi33/BR/PkK026FtXPKEc7VwRUZTUTXQ0No17hq22uKpFKa5UaKv
	8CNXbHL4mcLjHWpiXiq7tqR4KXw==
X-Received: from dlbek20.prod.google.com ([2002:a05:7022:c94:b0:167:6177:d54])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:4615:b0:369:2505:380 with SMTP id 5a478bee46e88-369e84e80d5mr1578756eec.24.1792811042353;
 Fri, 23 Oct 2026 20:04:02 -0700 (PDT)
Date: Sat, 24 Oct 2026 03:04:01 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261024030401.852598-1-almasrymina@google.com>
Subject: [PATCH net] idpf: free the skb on TX DMA mapping errors
From: Mina Almasry <almasrymina@google.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: Naman Gulati <namangulati@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Mina Almasry <almasrymina@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Naman Gulati <namangulati@google.com>

When a DMA mapping fails in idpf_tx_splitq_map() or
idpf_tx_singleq_map(), the unwind walks the buffers with
libeth_tx_complete(). The first buffer is still typed LIBETH_SQE_FRAG
(or LIBETH_SQE_EMPTY if the linear data mapping itself failed) at that
point, so it is only unmapped and the skb is never freed. The callers
return NETDEV_TX_OK and do not touch the skb either, so it leaks.

Free the skb at the end of the unwind.

Fixes: d9028db618a6 ("idpf: convert to libeth Tx buffer completion")
Signed-off-by: Naman Gulati <namangulati@google.com>
Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 drivers/net/ethernet/intel/idpf/idpf_singleq_txrx.c | 2 ++
 drivers/net/ethernet/intel/idpf/idpf_txrx.c         | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/intel/idpf/idpf_singleq_txrx.c b/drivers/net/ethernet/intel/idpf/idpf_singleq_txrx.c
index e3ddf18dcbf51..010903260ff6f 100644
--- a/drivers/net/ethernet/intel/idpf/idpf_singleq_txrx.c
+++ b/drivers/net/ethernet/intel/idpf/idpf_singleq_txrx.c
@@ -228,6 +228,8 @@ static void idpf_tx_singleq_dma_map_error(struct idpf_tx_queue *txq,
 
 	/* Update tail in case netdev_xmit_more was previously true */
 	idpf_tx_buf_hw_update(txq, idx, false);
+
+	dev_kfree_skb_any(skb);
 }
 
 /**
diff --git a/drivers/net/ethernet/intel/idpf/idpf_txrx.c b/drivers/net/ethernet/intel/idpf/idpf_txrx.c
index 885df6294ad94..a92e2457781e6 100644
--- a/drivers/net/ethernet/intel/idpf/idpf_txrx.c
+++ b/drivers/net/ethernet/intel/idpf/idpf_txrx.c
@@ -2606,6 +2606,7 @@ static void idpf_tx_splitq_pkt_err_unmap(struct idpf_tx_queue *txq,
 	struct idpf_sw_queue *refillq = txq->refillq;
 	struct libeth_sq_napi_stats ss = { };
 	struct idpf_tx_buf *tx_buf = first;
+	struct sk_buff *skb = first->skb;
 	struct libeth_cq_pp cp = {
 		.dev    = txq->dev,
 		.ss     = &ss,
@@ -2621,6 +2622,8 @@ static void idpf_tx_splitq_pkt_err_unmap(struct idpf_tx_queue *txq,
 		libeth_tx_complete(tx_buf, &cp);
 	}
 
+	dev_kfree_skb_any(skb);
+
 	/* Update tail in case netdev_xmit_more was previously true. */
 	idpf_tx_buf_hw_update(txq, params->prev_ntu, false);
 

base-commit: 7076f684d5132e6a6145e1da2fa74771ecd052e5
-- 
2.56.0.257.gf7497c7d27-goog

