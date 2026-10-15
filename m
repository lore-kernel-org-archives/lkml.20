Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093EC375F83
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792074669; cv=none; b=b3r758GL/XA+P0z7FrJg6O6HvTbyC0m5IpopiJ1m1mEWvgA8pcaPYzIgADCqEoOSmFqja1Uyt40crI60PsPEMeSw+vFnR252PqzPrrXAQt/Rmd5kcpj6HHNrguyrZczU7VLyCPRN3QfB5M9XzSHg8ahXfDGzHdzKNgUwVJ8cc1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792074669; c=relaxed/simple;
	bh=y12SkFZBhK0fI2ed1EWiDFhRpo/NRWE4u5YiPrdg2S8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AwiNSimmggKRu8HAHLHQrL4G/owq1czWl0+ZEiCUEQ5+FtZTDnD6rsQtHW37uCC8GqqJi4v2N6txHVbOR16iltmg29SiV9mn1OzTA2GOrhAu8dfUmcJcNimb/k0ah2+/94ygGgo7GA5k7R/OqT2tEU5bW0TJTFBFUcEF06sbi8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XFQHvnO1; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XFQHvnO1"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso798580a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792074666; x=1792679466; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0jkEYHjLo8jNN8eE1fYtwRLdm9c3yFjMKrL4K6thYMM=;
        b=XFQHvnO1juSXhYtVgDAHhSX22yRVlYd51l/5bKGmGM4jNLHktdoNbSeMq2T+qCrEgO
         Sy6ZZJFvy4jO1nVRR/NO3XXVKcpgvLS0FsSjOqtH5mUy8iGFI9V0d8fFFyWWAGIrJnGJ
         lg+6Rt7Djp3iw/OeQvsVCa8YYz/2gunad5B/kHzvZwJYpwkLPKPMmbv0aK9EXlFv5Ui0
         y8yBQ+GvSPrxeRX7HUMJc0K3F5KdaUhJTfJmcUjxJd+oulk38Meq85uQYoerMMM0XePc
         PxuUgnhkjmXOzDWcI8F/AQRhQ0Nf3eg+5kXv5nKi3ajo7wW3jmj7r1Nps5kIbf+1S9eM
         qRTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792074666; x=1792679466;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0jkEYHjLo8jNN8eE1fYtwRLdm9c3yFjMKrL4K6thYMM=;
        b=Jtuu+iEb+8vIxyePwVV4NlazCxaTjmEEprBlBe1QZdmQ1uASeyy+AYHrQGY+kGkxuu
         IG7xF2MantpykQs77c0uyzRsWELJnzUKzwa/NElYumNcF/tBvYrqsCOpJpc/RVNYEHji
         8nV7yEWS1jdbQX/l+J3uZKTkneEKn1CHsDMgYFEEtSO4UUFVhT8dlJanpGyepHD6WTh2
         y2u5Y0a2T8sdJCti+vY0P30MqHSIIk1/XIC31I3NaY4MPIPvcvkGCPsCFcrFCzPCe/YS
         zcFL9OUdWH4tokVIyAIZjBW51zKv4fsSQo4Upn5XTvBkSNpQ2MhmwFqNbrXZxZiVoEFp
         yg/A==
X-Forwarded-Encrypted: i=1; AKwUvBx7zyx540S1w24U4IWZh4TQLoK/WuSrfR7Ivsdfnjaf2n3SFJ3y94kTawdMd5u/LXb1dUxP6LQ+8OY2PZs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZC+CX88oYUd2ZAgD02K61/cgvX01BTs+UU5GM0hE1lMojXsfI
	SNEWbTeTwQvsG0Tppnb8BNPmqANwwGMJHy4lg3dVYNrGSP/+O8l77hNr
X-Gm-Gg: AYBFou3mJx9WJ/TU0qspfzrZ0N0Q5GuXr+ZPPKRczwPDubj7W6hNZFYLM7bErT90vFN
	ks9v98WyqRUPsK6vUkNK98jhw5Ggt7oXLaRYqeVDYNe3OmCoufMxWNmfvwWSR3Uhvlpz3WWOCZE
	+z8JWgy0nbvDO3MM7YeM/fYV06oGW7wNQldCUHhMwvn6iKktuxraRr1uW1ibTw8JijM9F/5EEk8
	IbqbqvjYvFPspjdw8KVWnsCkLytz+sBfFwP7CHOawCuuAFEWjJU4FwekmEQFz6IWWWcvGkbMNJb
	WMmVq1pc6hWt4GFI770oc+1S8o9vldBZtJY53ybHq2h+6vZPuZgHGa7Uow0Ia17k49kieulkZzZ
	ZPRsTmTyC58cSLOcfGCnXK94HSH+Jtb7ugWlOajBzc/UNePy2YI4v90Uv17+y7ldQbL9v/s9h1D
	XRWT02j57HFIg0z0RhiF/YQ4RVB6zIT4n6/kjIOxM/mmCX2OmGKwO/vuVJSWEkIx2393fO1VkF2
	A==
X-Received: by 2002:a17:90b:35cc:b0:3ab:2737:3392 with SMTP id 98e67ed59e1d1-3ab3afce21emr15969397a91.53.1792074665725;
        Thu, 15 Oct 2026 07:31:05 -0700 (PDT)
Received: from dev ([163.43.243.221])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac93085784sm2139180a91.1.2026.10.15.07.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:31:04 -0700 (PDT)
From: Yuya Kusakabe <yuya.kusakabe@gmail.com>
To: Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 1/2] seg6: skip the route refcount in seg6local IPv6 lookups
Date: Thu, 15 Oct 2026 23:31:00 +0900
Message-ID: <20261015143043.seg6-lookup-noref-v2-reply-900be250@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261014015819.f26040ee1b2adb4a90798df8@uniroma2.it>
References: <20261010-seg6-lookup-noref-v2-0-51c09dd98197@gmail.com> <20261010-seg6-lookup-noref-v2-1-51c09dd98197@gmail.com> <20261014015819.f26040ee1b2adb4a90798df8@uniroma2.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

On Wed, 14 Oct 2026 01:58:19 +0200
Andrea Mayer <andrea.mayer@uniroma2.it> wrote:

> For a packet queued with NFQUEUE, the okfn runs later from nf_reinject(),
> under the rcu_read_lock() of the nfnetlink verdict handler. Is "that same
> section" accurate for that case?

No, it is not.  The lookup and dst_input() still run within one RCU
read-side section, but for a reinjected packet it is the one of the
verdict handler.  v3 will say so in both patches.

> With RT6_LOOKUP_F_DST_NOREF, ip6_pol_route() no longer calls
> ip6_hold_safe(). If the route it finds is released on another CPU during
> the lookup, the packet can be dropped without an ICMP error. Before the
> series, when ip6_hold_safe() did not get the reference on the released
> route, the packet went to the next policy rule, or to ip6_null_entry and
> its ICMPv6 Destination Unreachable. As far as I can see, only packets that
> race with the release are affected. It is still a change in behavior, and
> it would be worth at least mentioning it in the commit message.

Agreed.  v3 will mention it in the 1/2 message, along with the fact
that ip6_route_input() has the same window.

> It would be good to keep seg6_lookup_nexthop() unchanged for the BPF
> helpers, also while a route is being released. One idea, as a refinement of
> the split, could be a common lookup function with a noref argument. For
> example, seg6_lookup_any_nexthop_noref() would call it with noref set, and
> seg6_lookup_nexthop() with noref clear, keeping the refcounted lookup it
> had before the series. What do you think?

That works better.  In v3, seg6_lookup_any_nexthop() will take a noref
argument, seg6_lookup_any_nexthop_noref() will set it for the seg6local
input actions, and seg6_lookup_nexthop() will keep its refcounted
lookup.  The skb_dst_force() fallback goes away, and with it the
-EINVAL that Sashiko pointed out.

pw-bot: cr
