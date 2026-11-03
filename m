Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793745819;
	b=QYR8DiLGD9qpBr3EwYnyhYQUb1IkgmuJJLsHyvt51Yj+SCuQaJ1aivV6jsSwMRB4FLpo
	 OtxtD55+qMhZ1Qb/MQUnjPTqp4DWOP9VVhk9+80PSVQpa7BNNY2+nYcDVCcM8R7VrMOfS
	 PXy73MTBD3lpx3XbjRtCwqDhAbq7Awc94A5DTBOQvhAYaRg77F8TdSLJ4MXVcI8WsUHdd
	 Fhx7FrljbKX3cte3K9N1G09VNc+oYQDZdKvR9y6E/mQaHUgF+nhplX6Pcn45FQcH2kIeM
	 SNLrjquZg5VobhjkX/mmUCIEHx6sbYbCysjmo1vsZA5K7j8bUSFy0JL6k+94/iN4j8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793745819;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=IhCBPBTLwLGQ2yRs8VzMKJOKNOT0+JfZ5wDmbhkJDiQ=;
	b=2FWUZ1zt5DZY8L7LmTf/C1WaVxqWXpBFM+zVQr6py8rtHcjf6IVBOL3wk5XvPMZYTx1u
	 gugguJLrV7Be9ykG+3ygxRnqhqzIdNd7T0VoR4du6g/Atb73KT6MLbg+swRrpEcGvHCQY
	 h0TzvqcUS0KsQRC+0JZjxDDOu70iincQXKGZwT7O1nyURLXx4nhfYgpZsDypIIvcDblED
	 NoMUr0slhjfVDeHFWGe8eE1AWVMQCAaV+KA/lha27jkR5fzLO8RrNIM/sxuQToNgMlf/B
	 zE5yIcEMHCs+mOwD/U7eJX7F02fbsx/FA/VapSNj31m7cY7TxgUwqdhjdjzVLE4VEBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=elZzqx0I;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C947606A333
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:43:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C947606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=elZzqx0I
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-35eaf84cc66so39647eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793745818; x=1794350618; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IhCBPBTLwLGQ2yRs8VzMKJOKNOT0+JfZ5wDmbhkJDiQ=;
        b=elZzqx0I9zUMK6X1CLUpsfa4tiVNA4Al3XQoNBswiAzn7PdnkFah/8QEJ78wE+73+6
         vcn4lTEjiGv5nQ2lU4XVFQC1Z+iAOcAtw2XjQuVRwOfN6os4LS3pSxrEHJdD49oka5qo
         /rzXXfKf5TyRoI9+yPg0GBcAMdBWGgPmqqBv/ym0Y/GjO99OCCJyxaisq6Jv+KcRwJNS
         kKZs5VE2vs73M8KiLA5B5S3AwP/uag67O7cQCXiUriJlXPwQT/A7NJivpSoGaBtFLmf6
         A1+/1gsnouh4JM/sLtAVWxBkzq0L9Kvfs7iIefUdIAejv+SYym/2GiHcN69H/0/3aXER
         SpjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793745818; x=1794350618;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IhCBPBTLwLGQ2yRs8VzMKJOKNOT0+JfZ5wDmbhkJDiQ=;
        b=s8BUR1zqPj+0T63ddJlFeTk/4tM2ERc5Nvn7Jjqbil6taYmDMo4yJypuRpXcgaiTW0
         x6q34b2qylsulhC/zfn7+SBf0UczDWA5YxgQj+Ptux0KthUduG0JcQi4ngYFVv95tCcK
         kWEXZ7dXCci8kQQur0Ry6x7AuseDHqvGHLXtiaJ/IM34xPnuaKHP8t0pRr7O6dXQKzMs
         ho0PITzJq87U1iY45MeS8VywkJMrtFZcXeZdLZ6ZcDnOT7bZ+gFDGVqNVFcFZRQQtprk
         2b76J/CQoqQqMwf4pd+cKP2gRKUdaVuSzpSAFWtImNIfOMv74HvK7cwCkQkDQkN2WZ2t
         4beA==
X-Forwarded-Encrypted: i=1; AKwUvByprWTJDNw9g8289WU3YU2GrbAGYAZgnNbk13GwHm5rlfrjw7vIDx/VGaxdPKiNxBcaTqZZ6t83NfxVr90=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kPDc3hcWLv5HvOPh4+Kw1UkXaD8plaZ1KEmBDW5fgvl2IcB0L
	mzxNk/6F+t24hfAVGfl2+xvIknXoQGQDzS8BWfn6z87kWvRYZJgIXy/x
X-Gm-Gg: AYBFou34g+d6zdrV8m4qy7O3fEybimED24+PP3kYTSzRPDorZpGD9+kWxqM98kPUgNu
	72W8Qh4kI92UJX/LtMR+vbUjNoe51VEYKmdSbkIzp69Cy2q0V1mRht9EK30uDJIyLekZDs0P7dj
	hKAyN3f3ZZR68LEP8yiN9CVc9J6I99Z/TffuIG20FApW5XbfGhl0BtQ2EQ2nwqkWdIEOgQ4eTtu
	B3cb06xPU7YRUsrKBEgD1sirfLecG2sFM1672GBX25Eod6Ij+ZpaAIKt/iDO8thIf3OIY5sWVcJ
	OHWyRCKnMKbGNba3OMypOOuc9TCQRLNUY41CdNxLOl/Ij5QPDY2BVQ8x5RdVWJ1q++qOL6dYm2l
	ax4F25DudhqvrC8SKO3gYj4EtxFX/7goqF34WNfMhSvg3Dux+H8G+Is8ufW2ifWcLEcMGgUWF8A
	UhktjTQJQv9ly0Pxjva56VcSEZMdUBY9Ct2QFb6Xjwd5rjjXWTyXjnLIw6sHsQnsefCrlFY+gmw
	Dp3ivh5HkzkDCNSB1JRJOpC4XId/LpbzBDoMUO8C64N6JneBC3t2l9kEDPUcg+KKQKG5LRkLQNj
	O9iVKqU3Duzn9q5MZoYPZA==
X-Received: by 2002:a05:693c:8204:b0:369:f3e3:4277 with SMTP id 5a478bee46e88-36a424596e2mr23371850eec.38.1793745818528;
        Tue, 03 Nov 2026 14:43:38 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:69::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a6d3dsm1323591eec.7.2026.11.03.14.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:43:37 -0800 (PST)
Date: Tue, 3 Nov 2026 14:42:22 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jakub Kicinski <kuba@kernel.org>, Willem de Bruijn <willemb@google.com>, 
	Eric Dumazet <edumazet@kernel.org>, Kaiyuan Zhang <kaiyuanz@google.com>, io-uring@vger.kernel.org, 
	Stanislav Fomichev <sdf@fomichev.me>, Paolo Abeni <pabeni@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, Simon Horman <horms@kernel.org>, 
	Pavel Begunkov <asml.silence@gmail.com>, Jens Axboe <axboe@kernel.dk>, 
	Bobby Eshleman <bobbyeshleman@meta.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>
Subject: Re: [PATCH net-next v2 1/4] net: fix skb->unreadable propagation in
 skb_split() and skb_shift()
Message-ID: <aupjSE3HVsbuEzsh@devvm16445.scu0.facebook.com>
References: <20261102231827.4088254-1-almasrymina@google.com>
 <20261102231827.4088254-2-almasrymina@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261102231827.4088254-2-almasrymina@google.com>

On 11/02, Mina Almasry wrote:
> skb_split() and skb_shift() do not accurately maintain skb->unreadable
> when moving fragments between skbs:
> 
> - skb_split_inside_header() moves all fragments out of skb into skb1
>   (leaving skb with nr_frags == 0 and only host-readable linear memory),
>   but leaves skb->unreadable set on skb.
> - skb_split_no_header() unconditionally copies skb->unreadable to skb1
>   even if 0 fragments were moved to skb1 (k == 0), and leaves
>   skb->unreadable set on skb when splitting at skb_headlen(skb) moves
>   all fragments into skb1 (!skb_shinfo(skb)->nr_frags).
> - skb_shift() neither propagates skb->unreadable to target skb when
>   shifting unreadable fragments into an empty skb, nor clears
>   skb->unreadable after all fragments are shifted out of skb.
> 
> Fix all three cases so skb->unreadable accurately tracks whether the
> remaining fragments in each skb are unreadable.
> 
> This issue is theoretical and was found by manual code inspection and
> LLM review; it was not triggered in production. Verified with the
> net_core KUnit test suite; not tested on real hardware.
> 
> Fixes: 65249feb6b3d ("net: add support for skbs with unreadable frags")
> Signed-off-by: Mina Almasry <almasrymina@google.com>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
