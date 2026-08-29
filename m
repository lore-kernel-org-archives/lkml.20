Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845F735B62F
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 15:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788016528; cv=none; b=r0T6732t3T7qud9L1pkpFOG/4mvD6DMCapUNmIPxsX/lzpBFvDqYG7U7EgXylLNEVc6+66Ua7bUFGSxdkzpqKxl+EGHT7pVOGumsakssn96gOs62G7wNY1zMcVYe7P9GlkYa1jMJ+eZoua3D1PMmhI1UUOp2skvfI3ba2xhS9xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788016528; c=relaxed/simple;
	bh=2g1jcR6uSj/fLbQ1ZfTuZpbVq4hnSBK93DtZe1wTTjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KFlLxxFmd3fefrcnNLG4UhmpS6zzxJgaBGBbPGmHxxBsnImxRfw1zgTB0u+lMCeHLi5KJeq+stfOrDfCz+qfViJnBlHXx4kxQgVTqJpT5cD4spEsBTutV0pFEFjBOLA0wktLRsOFe3NEfi3jLw+KC7KxPBEplSuTLJVaa9o7cak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=b+kY+nOf; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="b+kY+nOf"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3969e82ff8fso2192059a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 08:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1788016526; x=1788621326; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tTPBv+P5dDJ4eNQ72046GHeSjyxFhgiVslksovlmkwc=;
        b=b+kY+nOfElOO/fWTPDDuN7H+JailJNLDawMA5VRAlY6rFZpJOWLLpAY0+0eq0rAacm
         ASf3fEx/sBnde/+uI9sS+xS/PVwqlWBRzb/lY5jxZx4yyvGWu++f1HM7OYq9Dd7cbxHV
         Rg5yEZfK9VkRqwjktqWvXgJ1qaH8ixHvf+8K6kN7bCY60ck8UQWLUxRSy9ierlSd8aiU
         ltrmTmzSqf6gXtzPwGBTfEAQlwdJ5Fi7+WS8mM+WvRcIYWt98FbXhU5viD/SJTnARLMo
         AtmUbbJPKGrtfn+KmmRrIu0Zb7QVRzvvoKOtq1K+zQMj8piPqIvcckSnbCaHgOeoci4O
         WTeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788016526; x=1788621326;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tTPBv+P5dDJ4eNQ72046GHeSjyxFhgiVslksovlmkwc=;
        b=Z0GlQ0czh/ardi2tt3u1ygSwrDSU9ebrMzB75yJExG1JBUjuUMDeg7/MZWGSyKrD2T
         FS8dZ5kIJg02dEcTKe5F5i3B1YCQ8bLk8M5Mb3wynb0o3f3clU47KC+u7rX4GRT2Hokj
         OPPd1RgxaAvTd7COVqFoD0O2cMW7SxGlS31cvQ4dzgW2Ow6AOEVgNptBZqjEW3OtoCe8
         F7iVJvtEAYKq0rx5yixUjiI/aVRSqxIocglisWh5/sClzQfvAW/G9HQ4m153tXbyYyQ5
         n0z0Qq1ZftJROloEFH32lWhQafR1KTU1B/q61ueVIPlxkweRWcGdkG9rdiML0j0Y7UO4
         Zqzw==
X-Forwarded-Encrypted: i=1; AKwUvByHSOTQiAFWpdB6ztuskF4m4LDQJIVghC1glgA+fXEMfFNs7eR7Z0EVVhRXqlKkP51RueNq+LFg6s77vOQ=@vger.kernel.org
X-Gm-Message-State: AFuF++k6mkvVuDHxygXBMyZB/sEziF1hjVimD/log8T00WzmoZIaVvmB
	SEkfHxWKZ9Q9boV65XswTrTWk3Jb2HfbcEDCpR4MoWuEdj91gHNq1ifoPlaPCXG4a5I=
X-Gm-Gg: AYBFou1VEuCkZ4wlPM/l53QSOe74w0NJ8eXGGZZ3JkWwjQYcwe3iTJ6PmY03F2QXT0O
	b5d4WAKLqoeW6qOo/bVWxJZ8Qw7ypWHyHLEPE9ZQvfWGUGt0+SlmqUM+2jmhX30GXJ/ASKesdUJ
	xnY8niaVAOUSdxiUx0ANQ+jThrnoeaXC782ZzbnZmxg2wJs3INxriPUTOKbyUrHZI+5qrYhmXWP
	/Hp5x/ZeNCdkydGHZQy7xVORqZsREzOKioJtX66iTmSAqgizWGfEZzMApT4FJXvfLYOhA0N5BgY
	LZSh5WB+mWBznBJ/4AEEiGrO0UzNv9037P9AriX3NzdtJA73BTa1Cj+A1LYADLV9CjqdiaC5H2z
	WS07Ny84XiERoZB8eaWQRN31z5PYMFzXvro7zamw9YxG9em9umIQcKiex0up/8LQOMzQsFyAXVZ
	e6erkwgzG0l8ofmS/JCOU/3XjChxdUViBSSLNqY3JxEg==
X-Received: by 2002:a17:90b:5443:b0:395:4de0:b78f with SMTP id 98e67ed59e1d1-396d0d4cf4emr24828890a91.1.1788016525770;
        Sat, 29 Aug 2026 08:15:25 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:4f::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396ddc58f3dsm7464280a91.16.2026.08.29.08.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 08:15:25 -0700 (PDT)
Date: Sat, 29 Aug 2026 08:15:24 -0700
From: Joe Damato <joe@dama.to>
To: Pavan Chebbi <pavan.chebbi@broadcom.com>
Cc: netdev@vger.kernel.org, Michael Chan <michael.chan@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	horms@kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH net] bnxt_en: Prevent queue stop with deferred completions
Message-ID: <apL3jDnQuMfifkj6@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>, netdev@vger.kernel.org,
	Michael Chan <michael.chan@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	horms@kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
References: <20260827230233.94878-1-joe@dama.to>
 <CALs4sv1v7E_pxmdcNzxf8GyR7=-B26J5Z1YZ7fc4Y2Oc7Le8yg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALs4sv1v7E_pxmdcNzxf8GyR7=-B26J5Z1YZ7fc4Y2Oc7Le8yg@mail.gmail.com>

On Sat, Aug 29, 2026 at 02:57:59PM +0530, Pavan Chebbi wrote:
> >         if (unlikely(bnxt_tx_avail(bp, txr) < bds_needed)) {
> >                 netif_txq_try_stop(txq, bnxt_tx_avail(bp, txr),
> >                                    bp->tx_wake_thresh);
> > -               return NETDEV_TX_BUSY;
> > +               goto tx_busy;
> >         }
> >
> >         /* BD backpressure alone cannot prevent overwriting in-flight
> > @@ -77,7 +77,7 @@ netdev_tx_t bnxt_sw_udp_gso_xmit(struct bnxt *bp,
> >          */
> >         if (!netif_txq_maybe_stop(txq, bnxt_inline_avail(txr),
> >                                   num_segs, num_segs))
> > -               return NETDEV_TX_BUSY;
> > +               goto tx_busy;
> >
> >         if (unlikely(tso_dma_map_init(&map, &pdev->dev, skb, hdr_len)))
> >                 goto drop;
> > @@ -235,4 +235,17 @@ netdev_tx_t bnxt_sw_udp_gso_xmit(struct bnxt *bp,
> >         dev_kfree_skb_any(skb);
> >         dev_core_stats_tx_dropped_inc(bp->dev);
> >         return NETDEV_TX_OK;
> > +
> > +tx_busy:
> > +       if (txr->kick_pending) {
> > +               u16 kick_prod = txr->kick_prod;
> > +               struct tx_bd *txbd0;
> > +
> > +               txbd0 = &txr->tx_desc_ring[TX_RING(bp, kick_prod)]
> > +                                         [TX_IDX(kick_prod)];
> > +               txbd0->tx_bd_len_flags_type &=
> > +                       cpu_to_le32(~TX_BD_FLAGS_NO_CMPL);
> 
> Should we not do a bnxt_txr_db_kick() also? It maybe a good idea to do
> it in success case also instead of bnxt_db_write..

When this function returns, the caller writes the doorbell, so we should be
good. 
