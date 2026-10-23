Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792745274;
	b=MCZzYUkLMS7htfLckn2lGJH67wxf/yFQ8FNQ6ZzcNVvmO6/x23fdxkFBlH06rERnt0Ga
	 1IKcB1ycty8mocEe6ub9ZkiRFO9FmbEzgOUt/b00+S8expbjC+8OSIkMAWj0wKoKbc+Zo
	 SxVaNS21IlvJFZi7U9MGvs8B9NncHWsZqCN09+dcErKETBBgu147OtSvL6DI/Uw/dXx4y
	 M+B/l8uiX1g7KdSzhMnT4NqUmJgai1HKbmV8hpL4zw4eYbiQGmMkFN6LBo5T7X1AdVbRm
	 pWYm7UAtAw2H2LgouHsjgVwcM6PdvDnuwX7oCjVUcd/0rt7JwYr9uL6YC6lIPg+31PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792745274;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:In-Reply-To:References:Date:Message-ID:MIME-Version:
	 Content-Type;
	bh=mcXosW2OV7Dzgaxf9eJAPNhpQPkL1o5sHEtJNdoFfAE=;
	b=rWAbwBwNfheX87GXfLOB0ouaZfkifj55bVsUnp7k38sws6+q/kswyHxi0kcYzX1BwaWT
	 Wqe5wz3U3O/GPelJWIEB+9LxjJC67vLx6esJ/diMnPijGaLhnqK8ua9cTZEsnkwcjoBWD
	 zPetiwf+B/xKfEd2VAEAVG8jA7ZcpbJKxdehNNaq6vbjI16YiMtZXXlHOKhCyhpzxd+SC
	 7LV5jrAmYl67ZRuUKfTNE8nogNHvXOxB3vz+Mu9NDjTW9NouosG+NVedAhUf93rB5fBRz
	 v3umYWZRSg8jwgdwkIeNfiLG1ORg8gpSOY04ArPQ3PgaAi4gPnVDT0ssGNgrJb4NaTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=waldekranz.com;
	spf=pass smtp.mailfrom=waldekranz.com;
	dkim=pass header.d=waldekranz-com.20251104.gappssmtp.com header.i=@waldekranz-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=VRGTnBSi;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB24B606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:47:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB24B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=waldekranz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=waldekranz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=waldekranz-com.20251104.gappssmtp.com header.i=@waldekranz-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=VRGTnBSi
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b3dd83e779so1001902a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 01:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=waldekranz-com.20251104.gappssmtp.com; s=20251104; t=1792745272; x=1793350072; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mcXosW2OV7Dzgaxf9eJAPNhpQPkL1o5sHEtJNdoFfAE=;
        b=VRGTnBSiwDJKAy16ONtQ4HusEuGeVtV/5IMrKHq0pwuvXbDxGSdfUxDNRe3ab5hQ+4
         JC0WkH4BNwJTtfFnWz+L4Gol60o8Iprh50mHZ2tmLV55r7i+IeySPmTT+Y9dgwczcYHQ
         AZYZLUhREM3nGXuM6gqrnpjmObByH7eRUyXTi6fXahCJDzVSn6OMFWApcQbvBdsSOv0G
         nSZU6KHOTCRY/F82PPIh+c8wzrq3/vDdgp8GsRt2ztDIJZeWZMiG+X1vUiFTJJE6mv7X
         qKw9bsbbOgyA95WINOs4kM6mC42Pd/T/Zp6B+x9xauQIuUd3LWXVq7baQ0FYV5LKbFVW
         TIUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792745272; x=1793350072;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mcXosW2OV7Dzgaxf9eJAPNhpQPkL1o5sHEtJNdoFfAE=;
        b=wZZPANn9fJqHo+90J1ExzwuLDUVFNb3vh774A5qFA+BqhmzNdjPqU/TeyDLV5o9QfI
         vMcpxra7E+wHpxV5LxulidZGopLhhGp1pbi6nF3vv7H9Dleu5dOJtqzm7jaMxdtGhUql
         GU7Epbw2nXoqr9Yq+25X5wUg5F6lm4RZD05rRtql+dMcF1OLjx1bo3Y6/sJ11aI8ade9
         9LnAkkcAHYUTsv8Ilf63fCUAfcRk39hfKU/nJQWTmIlFSvOZlTPxp9W1NQGR1k18l+g6
         FDIvCN0AqdSzaCPbJldfybvFO85PMs63AydOdvklGZIMWVq2C7LsP5C8cUsveEy3PUrZ
         4gQw==
X-Forwarded-Encrypted: i=1; AKwUvBxvqLzGwaeviabRdrLY72rOHhMhMw5rIvx518vvNpIZhCyNaS8tDgyQaFfv8tZnYIvpXQx48pVS7CeR0Jc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIaUODz/lQqSHdqqMcqP2YpmJNa5TyUEiVYge8r3E9pQYE69H+B
	XF+dj3c+XSA3qZljbfJvlcRBP5N5O/3Ff+Wcn2yfN/9lmiv6GupqVI2wvd/4KDq2X/CaN9cKv+S
	JvXwuFJg=
X-Gm-Gg: AYBFou1lAwUsvN0DMI5LpudE/oc/gom/mxbkInyJanyZew8k8bsWO4TxOf6X8kYUq7Y
	D/T4QcDgyTqBHW+T/jAXqABnRs2qVsTPoT3MjB9qd71t4jKCdTlggL62oHLC3YjLveR1E19NKL0
	OnzgRjwYpIAkr3ksuipbk+PhJT9hJ/275JBRxMsdbLjnDTZvc0GHNWrZeopsg1M7YXRPKdlSbj0
	4e8yO0o6goBPnqXj/jhyqC/HqfCj+JRiMmzxtBHAUfFOAZ9qS17UTUkl2Or6dZ1pRd7Kghx2AmG
	HEe9BmcVGI43NKUq5U21I8fMMysOGDp8TmMY8R6Jr5oCs2jgbstrGHzxTbAYwMuj2nxw5d44zpV
	pnkZSkXPXcl3JCkIqD8q+myT4ApKGySCYDsElHj5Vs34bpyHmwqMjQxnKvdzTKuop+K71apJvVM
	xKq3T1fIwEFB/4ZlGwfxHXS2seao07kLSmpfoptL3mos1ik+CTjUzML5SuWSOSC3JXHYPX7AP87
	ribGU2pe+dD/RxwGY5vBHmqdR27xTCJo915dS59T7r/yoDeHsjYw9HTEFN7pFyi6HJq1pH53Oz7
	4EGqFJwbrZEpL31/bfjRcJ1MM63WUY0x3Ck5Af5Mi9LtIU98olyzLxCr5OQiy3sEvmH3n3uqnAt
	ZkiKmWdULy1w+TFg=
X-Received: by 2002:a05:6402:5004:b0:6aa:9284:9a99 with SMTP id 4fb4d7f45d1cf-6b432b14825mr2549227a12.6.1792745271895;
        Fri, 23 Oct 2026 01:47:51 -0700 (PDT)
Received: from wkz-x13 (h-79-136-22-50.NA.cust.bahnhof.se. [79.136.22.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b432cc9775sm840508a12.28.2026.10.23.01.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 01:47:51 -0700 (PDT)
From: Tobias Waldekranz <tobias@waldekranz.com>
To: Cheng Yongkang <teel4res@gmail.com>, Nikolay Aleksandrov
 <razor@blackwall.org>, Ido Schimmel <idosch@nvidia.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, bridge@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: bridge: do not bypass port state for MST
 without VLAN filtering
In-Reply-To: <179268538303.70821.3493915601694605045@gmail.com>
References: <179268538303.70821.3493915601694605045@gmail.com>
Date: Fri, 23 Oct 2026 10:47:50 +0200
Message-ID: <877bj8iz0p.fsf@waldekranz.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain


Hi Cheng,

On tor, okt 22, 2026 at 08:26, Cheng Yongkang <teel4res@gmail.com> wrote:
> br_mst_is_enabled() is true when the bridge MST option is set and the
> port has a VLAN group, and nbp_vlan_init() installs a VLAN group on
> every port even when VLAN filtering is disabled.  While it is true,
> ingress treats the port as forwarding and egress skips the
> BR_STATE_FORWARDING check, so that the per-VLAN MST state is enforced
> instead.  That state is only checked when VLAN filtering is enabled,
> though: br_allowed_ingress() returns early otherwise, and
> br_allowed_egress() only checks frames that were VLAN-filtered on
> ingress.
>
> With MST enabled and VLAN filtering disabled, no port state is enforced
> at all, and a port in BR_STATE_BLOCKING or BR_STATE_DISABLED still
> forwards traffic, defeating STP and MRP loop protection.  MST can be
> enabled in this configuration, since br_mst_set_enabled() only requires
> that no port has a VLAN, for example with default_pvid 0.  In that setup
> a BLOCKING port kept forwarding broadcast frames while MST was enabled,
> and stopped when MST was disabled.
>
> Commit 8dca36978aa8 ("net: bridge: fix use-after-free due to MST port
> state bypass") stopped this bypass during port deletion by also
> requiring the port VLAN group; the bypass itself remained.
>
> Also require VLAN filtering in br_mst_is_enabled(), so the normal port
> state checks apply until VLAN filtering is enabled.
>
> Fixes: ec7328b59176 ("net: bridge: mst: Multiple Spanning Tree (MST) mode")
> Assisted-by: LLM
> Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
> ---
>  net/bridge/br_private.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/net/bridge/br_private.h b/net/bridge/br_private.h
> index ff746f036f54..85065304597e 100644
> --- a/net/bridge/br_private.h
> +++ b/net/bridge/br_private.h
> @@ -1953,6 +1953,7 @@ static inline bool br_mst_is_enabled(const struct net_bridge_port *p)
>  	/* check the port's vlan group to avoid racing with port deletion */
>  	return static_branch_unlikely(&br_mst_used) &&
>  	       br_opt_get(p->br, BROPT_MST_ENABLED) &&
> +	       br_opt_get(p->br, BROPT_VLAN_ENABLED) &&
>  	       rcu_access_pointer(p->vlgrp);
>  }
>  
>
> base-commit: f4377bf85887f57b59abb5479f7660a81ffe4449
> -- 
> 2.34.1

I suppose the other way to fix this issue would be to require VLAN
filtering being enabled in order to enable MST filtering.

From a user perspective, that seems natural since you need to associate
packets with VLANs (i.e., have VLAN filtering enabled) in order to make
any use of MST filtering.

From the bridge's perspective it might be less desirable since it would
mean that the two options would become entangled - the bridge would have
to refuse VLAN filtering disablement while MST is enabled.
