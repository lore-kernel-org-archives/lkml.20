Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.193
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794248963;
	b=zXZkvv6fRxXZ1XT+9HCeIwgSd4537hSYVaxFu+cMfaKQIsBbpABBmDQgeCEdmtcbWyz3
	 AmkHomxNblnsGhOLJZ9toCu3ftc9AO511kLXNK5b/NlmKsZr7F7CEC2eNg6VV58Xs3f06
	 NF/7P5dfPMmkg3y1JV/bdPZ1sPRkehhM88VLL6VcZJuZX/1eEayXNIsrfAkfPwbDbbSnQ
	 TovUsKfB1avXqHZlyJbBIKr1xcZyq458wbmxPT+l+agSDhxBT+Bu3P+x3CK66E3o9i0Il
	 FjLP/wVF5ate4vc5lsgi5HwFEOFNFiZzEQkGrttKUCbC6v/vBtNB2EiRD7gijvGJLLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794248963;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:In-Reply-To:Subject:Content-Type;
	bh=KcVmoMQgperP1wPlpI/4lZIUWk5pcHjD9u34purQ6ks=;
	b=Gxg2k1SWYESKaxmJiC3394Z2o0J6+KKv27YRIqeGmb+CsVLzm6VZ9KntJDLsx/lnRzvM
	 90HKUiKv/+BnxyzseuS5xyXQwQFDftoy46Bd9Mtn/1WBnZArKDLoKahkha1J3vdZruz7M
	 qgWfuzRYyjvhPIrBZiBspUl6cNooPp0qXwq3PSAQKyibSuPIjGNgY1yu1x0qBLHBypZOy
	 4HuD78nX69B5CyQ+ZoicWx9+hfOJrH3GlCmeMT11mFZoZBKQ+sCINHp+EO+P11nejHsJz
	 7rhXLMeouMmgPsuMC5ZI/JMg7am30YFx5Wyi8h5+x4l4vVfMdUjcb3+4VA7+1mbbBDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X7wedxBS;
	arc=none smtp.remote-ip=74.125.82.193
Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A9C60A383F
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 18:29:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61A9C60A383F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X7wedxBS
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-36fb88ea38cso1498213eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 10:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794248962; x=1794853762; darn=vger.kernel.org;
        h=content-type:subject:in-reply-to:cc:to:from:message-id:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KcVmoMQgperP1wPlpI/4lZIUWk5pcHjD9u34purQ6ks=;
        b=X7wedxBSS8iZNbIq3uVV6Lk387o+XeGOfTW6Zk2cySFVKqEWn7Djj69lXsU8s/kpKz
         tJiJ1NC1pNUqxiy43lTvIzQnaR1XWltnvNswRXYTYKvJhMy1Ym9sy/gLTRWhTzeoZy/r
         kf9IurJNAyUB0JwvE50fsKX5uraHf+5WXfCjtNq7xr/i9v+AGqhqYTaRQLpfpje/s44G
         JAaCcBLIk5pgtY0fMS2yln/+byA2YY2Cjh8Vsy4CPhQB/kcoPBKf8PLdF0pQZM0hwa2X
         mCEmy0QrvQXIQcY0xkadgOuk8+FykA/urSyQYxogIANNQn5HVGBPGbcSPTXfDKNUDh9f
         93Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794248962; x=1794853762;
        h=content-type:subject:in-reply-to:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KcVmoMQgperP1wPlpI/4lZIUWk5pcHjD9u34purQ6ks=;
        b=t2u9t0Kems0bwqBFz7S87ygHRv0vyT7gCvNiM5AXDyQdmoHGITmvYQg6wCPupIrYn0
         z0jBYXf/Ko/37RkE0se/XrpEXLAW4g3pFCZR7b2QsAsmbngrmIenxDamRuJyYREJc74k
         ccz7eQ7sfW4J3Bnb+zsbqQ9f3LInLgNzWkvgTv/DsMWPKWgMoDpc1TOZI280WU+Iomsl
         IV0+O1f2YHu6yVH3iXHTUeJQMrd58Yw6RJkL1/92bsEj/QTJFG88g9q2G0dgyMXaD2+/
         j8Djsd78l8v3imZVs287n+YS25C/v5X7YXd9cIw1fv9LFXWkBeM78sUikNH1MZueuiJh
         uu2Q==
X-Forwarded-Encrypted: i=1; AL+hErE9I8X9QvvsZHzd//kBk/zYsdUWsXNcmhZrtMssyAzfq0HR5LrUWuSLv/Ixr481fiOXSEp62q/jh52o+EA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9DTO2C7LYyCHsgYSh9a2MrmhhI9MsSesv7IJYhbqwJqcn8aozB
	MLKIXck0RyxppL88KX/oR2qzM9bpWGMJBc4f0MUTjOIGuDpI76fZVTLd
X-Gm-Gg: AYBFou2bfAytVVweFdXzsAbXOl4NBdyh1vr5I5vR8/oQd5UCdU+yKjsoi+y8IuTsuze
	kmtXtkbm7egc81NFG/OlXPyVrjT9LYlFnr++Rf3mzFGN0Q2IDSp8A4qsT8QkSgMmtZszd+T8rc8
	tGYtz4PjGj4vQOg+1VzDyJ55pPwrGoWc+yiM/nl445jDuoSisx0FsqG8Y40Etx9imiDLCxiJbeN
	wX7glaFy7LMUbhH0cRe/VbApEabaPFvuXM3+75mbCJwYDb2qGVnqVQcYLRKH5vNucMXYoEoBvHZ
	CA0H9SaQZPNnpy7sD6JNRA57hicJ1lPnC41jk5bMC13OC55tiZRrUd/FbL6XTfHzS0uIvmr/aDq
	n3/fPxzsHmzV859MlMvW4uMRnRE6Of+xTqX9TkpOLYfW/cTnb+/PEqE1VVkmdDFbZPQzA9d88Q0
	v8oa1IK43zeklSVPMA1O+7CuWBLlUMPrRZWr5top0xw5opyljeCOWv7sPu9UUHokpDq85KIhipS
	pC41U7nqUiqt+ASoKlWuvxTs5iNmlQdWK7ZFaCODj2v3VWOn+FDaSL5laH+pVc1qIE3SBQ3G3fn
	/pCTEykYYyUw9k3ZcuD1f/U=
X-Received: by 2002:a05:693c:8312:b0:36a:2473:9b2f with SMTP id 5a478bee46e88-3750a20b93bmr299470eec.23.1794248962308;
        Mon, 09 Nov 2026 10:29:22 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:73::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060c4b6sm117168eec.15.2026.11.09.10.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 10:29:21 -0800 (PST)
Date: Mon, 09 Nov 2026 10:29:21 -0800
Message-ID: <86219505a92ebc720950d87dc76662f3@gmail.com>
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch,
 edumazet@kernel.org, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, michael.chan@broadcom.com,
 pavan.chebbi@broadcom.com, saeedm@nvidia.com, tariqt@nvidia.com,
 mbloch@nvidia.com, alexanderduyck@fb.com, kernel-team@meta.com,
 sdf@fomichev.me, dimitri.daskalakis1@gmail.com, almasrymina@google.com,
 dtatulea@nvidia.com, bobbyeshleman@meta.com, asml.silence@gmail.com,
 daniel@iogearbox.net, razor@blackwall.org, leitao@debian.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-kselftest@vger.kernel.org, leon@kernel.org
In-Reply-To: <179418737701.994134.5100743053640770189@kernel.org>
Subject: Re: [PATCH net-next v3 4/9] net: devmem: add a per-device netmem TX
 frag size limit
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

> > @@ -734,6 +734,7 @@ zerocopy_fill_skb_from_devmem(struct sk_buff *skb, struct iov_iter *from,
> >  
> >  		size = min_t(size_t, size, length);
> >  		size = min_t(size_t, size, iter_iov_len(from));
> > +		size = min_t(size_t, size, binding->tx_max_frag_size);
> 
> [Severity: Medium]
> Is this the only place the new cap is enforced? The netmem.rst text added
> by this patch says "Devmem TX frags are capped at
> netdev->netmem_tx_max_frag_size". TCP MTU probing looks like it can merge
> the capped frags back together later.

[..]

> Could tcp_clone_payload() compare skb_frag_netmem() and stop merging once
> the binding cap is reached? Another option is to skip MTU probe
> coalescing for unreadable skbs.

Hmm, let me comment on Mina's patches, might be easier not to merge
netmems in tcp_clone_payload at all?

> [Severity: High]
> This isn't a bug introduced by this patch, but the same merge check in
> tcp_clone_payload() looks like it can also combine frags from different
> net_iovs. skb_frag_page() returns NULL for both frags, so the page
> comparison always passes and only the offsets are compared.

[..]

> Should the merge test compare skb_frag_netmem(), the way
> skb_can_coalesce_netmem() does? Nothing later in the series changes
> tcp_output.c.

Mina is gonna take care of this:
https://lore.kernel.org/netdev/20261108013838.1454450-3-almasrymina@google.com/
