Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF631531617
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790066497; cv=none; b=h3wC4Q1kKErKRpLwjFGktpNdOmfUt/tUYv0tq97MiJcuhxXZKSRwjxCGukeerkLK5WiIb0cM34CTt3AsE7iLeXa78VuGZu27J2ebhEDvEL3n6/OnY1S8yU5KUaZiIW5+fi2WKGLla9dGvqx0ylSoQ4mD2XFOn7Oa/coltTCCZis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790066497; c=relaxed/simple;
	bh=Yizwf49hTgGWK0f7w1A7hUDvewrlrBBNlQW6FGUza3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LU+x55+6yTV18y/Rtp7xWQD9mpTr5uaCFm9Wd23ym8GrcowkaqQLhFIqYJNZyquqUFgO5eev/XGYktuPrWAg9EPDz4EH7rMsXN1iDx8kMi+b3gBmn1eoDh8X+mk5YTyUpA1XfOxa9hgNkMwkSpN5g1SEhhAR2jrlxRvigL29gZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sjt1Mp2j; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sjt1Mp2j"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2df4aa80a73so17059035ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790066493; x=1790671293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lbIdLkWcjcYqMS1e8Ux9cE0ST5iQLHRVAtymRNEq84E=;
        b=sjt1Mp2jbhMxQSI8jMmRRwck5TEaCW+Evr6xB4ogE38WqQ3+zCY73oTvj58q2GY1Bn
         triD6lQXGmu1Hd+nIvJrcm9nZfTowab6oXcLGRWKISIkN57ebZUebq3K+SSBWUKjtsfV
         +PCSWA6TS87WHlZhIJXUVcQ/FsiUWWEQDc5W7p2ubLJBRsN7i6dznT0bUlaQs2cV8fU0
         mJCAX6Hj3f6hi1RZtJjHvJIDnHC1G9IwcQgdajbGZNrUZUaAlvO7zZ68llp8qnVST2Da
         Byq9MoapsjFL61t8G38+hZxKRwM2mNk8mflD86KODO5oqMbxUhHP6yWG46BXSnbTxpRc
         ySPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790066493; x=1790671293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lbIdLkWcjcYqMS1e8Ux9cE0ST5iQLHRVAtymRNEq84E=;
        b=Hcd4ujd7PSObBbQJ5BTI91W1xgZCLndV4AGfMoI6a+EY56SrLy8Hlb/nyfvEX+jk4U
         HpID3TipyuMIVb2fvUXi4FqHWsXpcNrXGnpaoeoUnj0bTwrVxO694ERNGpKzKu6PJcIj
         BQ16FFgrtKJKBQeEzS3OipNazye/cqA16EGKxBhojpBz0HBzwGsm+gDPbna3IMlclxiC
         xN3Cv3Ps+HQKT/v/bUQtTB3xisbSe37Gco48BjF76kOed/xet3ISxAMNtKHcEXdhGzb3
         NMTOEmTSL87PaLHRLkk2jK7+29vevfxu1NZFfzxte6MgWzEnI25yXMB+MQ7vhpi9v9Bi
         te9A==
X-Forwarded-Encrypted: i=1; AKwUvBwc2QvoK9Fzx2r9EFeRzYdEcZ2ZUul3+t+Ho343D9qdgdt1mL4N6Z3BsYVQfEdI2hFG6gp9jyTlWIlnq1s=@vger.kernel.org
X-Gm-Message-State: AFuF++kCkYJLdO/Qxcz+6vN0NacC3vX1NE32kZnp+CrU5OBguJt6SFx7
	hR3Sw+Yyx7HZzuiZsqVB0A0X4dH9H1JTYJIBh/QXwDNSxH+lrm+aRMGs
X-Gm-Gg: AYBFou3EevWIv0pnT5E5cDAw2trpiMm2856uOeEaSnClNbq009QWGJiKxmDOzcS7EQv
	w/Z7vyDJaNIDW3e1Q4MQWbG4cXbh0VcVnovHF6dwHHe2oHb58VUATurSkcnj475KqVXjNl1NTMF
	cYZvH1LpkWsKk6q0DIkCDbFRKLgFGsJpmWtgw+x/uTK9ZFQleNYWlSA7a4Lf7TK+7ljy8vNlrKY
	j0glK74zzVI18fvieyXTpr8uBk+7vkZUdhpERVvoM9dG81ME3uLSNYX5sHNj8ibD1ZglcgV/7Zq
	Kj+OOCiAr50R0fCuCpBsJ5qtqv5QtzSU8jCCLDDturCfbNei3Sz+RUk4aQZFe3t76eV77V8rdQI
	pmCH5vgzHGIyTl/FSVPZCEe9P1gO9bU3YCdccBFqQl1rT+tMrgrDbN6GFuGBc9wFC9bijtdtWSH
	hqpfpuT3ho5cGxk40KRQHq3j+CMfXOOKCxU0yfFgGo47BPnaEA/xRFtHzS4RStHvuNlR2BuRryx
	FpY2eWP363/9Q+ksp5fYrTNesJETlQsDbIa1A==
X-Received: by 2002:a17:902:cf4c:b0:2dd:c053:82f4 with SMTP id d9443c01a7336-2df60b46f92mr5284585ad.43.1790066492911;
        Tue, 22 Sep 2026 01:41:32 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a1e:2e81:7320:b519:cd9:fed2:d000])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d047dafsm6084765ad.52.2026.09.22.01.41.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Sep 2026 01:41:32 -0700 (PDT)
From: Yuchao Zhang <ndaugoing@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	toke@redhat.com,
	jhs@mojatatu.com,
	jiri@resnulli.us,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Yuchao Zhang <ndaugoing@gmail.com>
Subject: [PATCH v2] net/sched: sch_cake: prevent shaper corruption and stall in cake_overhead()
Date: Tue, 22 Sep 2026 16:41:24 +0800
Message-ID: <20260922084124.36858-1-ndaugoing@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <179000041222.2160803.11108326722307773525@kernel.org>
References: <179000041222.2160803.11108326722307773525@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In cake_overhead(), the header length up to the transport layer is
computed using logic borrowed from qdisc_pkt_len_segs_init():

        /* borrowed from qdisc_pkt_len_segs_init() */
        if (!skb->encapsulation)
                hdr_len = skb_transport_offset(skb);
        else
                hdr_len = skb_inner_transport_offset(skb);

However, cake_overhead() suffers from several issues:

1. When segs == 0 (e.g. from dodgy GSO packets where gso_segs is not
   recomputed), the multi-segment arithmetic underflows: (segs - 1) wraps
   to 4294967295, causing cake_calc_overhead() * (segs - 1) to produce
   an enormous length. When charged in cake_advance_shaper(),
   time_next_packet is pushed decades into the future, permanently
   stalling the CAKE dequeue queue.
   Fix this by returning cake_calc_overhead(q, len, off) for segs <= 1.

2. When the transport header was never set, skb->transport_header holds
   the sentinel value ~0U. skb_transport_offset() returns ~65535, which
   is not caught by a negative offset check. skb_header_pointer() fails,
   and hdr_len stays ~65535, charging ~66 KB per segment to the shaper.
   Fix this by mirroring qdisc_pkt_len_segs_init() and checking
   unlikely(!skb_transport_header_was_set(skb)).

3. Both skb_transport_offset() and skb_inner_transport_offset() return
   signed int, but hdr_len is declared as unsigned int. If post-enqueue
   mangling (such as BPF packet trimming via bpf_skb_net_shrink())
   produces a negative offset, hdr_len wraps to near UINT_MAX, causing
   corrupted header length accounting.
   Fix this by declaring hdr_len as int and falling back to
   cake_calc_overhead(q, len, off) if hdr_len is negative.

Fixes: a41851bea7bf ("net: account for encap headers in qdisc pkt len")
Cc: stable@vger.kernel.org
Signed-off-by: Yuchao Zhang <ndaugoing@gmail.com>
---
v2:
 - Accurately describe the impact as shaper accounting corruption / stall
   rather than OOB read past the allocation per Sashiko review.
 - Fix pre-existing high-severity integer underflow when segs == 0 by
   checking segs <= 1.
 - Import companion check !skb_transport_header_was_set(skb) from
   qdisc_pkt_len_segs_init() to prevent unset transport header sentinel
   (~0U) from inflating packet length to ~66 KB.

 net/sched/sch_cake.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/net/sched/sch_cake.c b/net/sched/sch_cake.c
index dc93267029e7..45969c1b95fc 100644
--- a/net/sched/sch_cake.c
+++ b/net/sched/sch_cake.c
@@ -1413,21 +1413,28 @@ static u32 cake_calc_overhead(struct cake_sched_data *qd, u32 len, u32 off)
 static u32 cake_overhead(struct cake_sched_data *q, const struct sk_buff *skb)
 {
 	const struct skb_shared_info *shinfo = skb_shinfo(skb);
-	unsigned int hdr_len, last_len = 0;
+	unsigned int last_len = 0;
 	u32 off = skb_network_offset(skb);
 	u16 segs = qdisc_pkt_segs(skb);
 	u32 len = qdisc_pkt_len(skb);
+	int hdr_len;
 
 	WRITE_ONCE(q->avg_netoff, cake_ewma(q->avg_netoff, off << 16, 8));
 
-	if (segs == 1)
+	if (segs <= 1)
 		return cake_calc_overhead(q, len, off);
 
 	/* borrowed from qdisc_pkt_len_segs_init() */
-	if (!skb->encapsulation)
+	if (!skb->encapsulation) {
+		if (unlikely(!skb_transport_header_was_set(skb)))
+			return cake_calc_overhead(q, len, off);
 		hdr_len = skb_transport_offset(skb);
-	else
+	} else {
 		hdr_len = skb_inner_transport_offset(skb);
+	}
+
+	if (unlikely(hdr_len < 0))
+		return cake_calc_overhead(q, len, off);
 
 	/* + transport layer */
 	if (likely(shinfo->gso_type & (SKB_GSO_TCPV4 |
-- 
2.53.0

