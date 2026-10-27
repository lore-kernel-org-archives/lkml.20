Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793090884;
	b=uOxgEM0q/exIFbXLf+HbPyYRheHN8tb7umhyuLo4sRL8NtLrxkwBc9b/CrU8S7EfpTSS
	 R8/JQyeFSbM7hLHeQgfzXJsU+CdeLFtHwuVNT1vv02BiA6Fz/KeiOtkJaaC5giwpjOZ7L
	 WvI3exGn/7LpFepEB80X1QLhiCOnL0stRN5nB4D07rQJUDlbSD8WnKv4FyUSbZ8cMbfCS
	 gjDuwcQTw7tp/atUo/Grq8ZoLBkJaz1gyzUN211NqpmEfC8XiXYB5FJ4S2k52BiwHyJoc
	 V2QqooTcRHwdTSrI7t/SlKxFJZOQTTT4U20a2XsSMrS7a4AzBRic5zUKeR7ejel/o0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793090884;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Reply-To:Subject:To:Cc:
	 References:From:Content-Language:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=iYhHDjJRr+xqN1H/R/LCOfBwAItVWeWnf6KB9UCfWMw=;
	b=omgBdKOTjhDnYJdpOnujGqyF74v+0c4Z5o5CfHB0EZvxlopzR1lzRkf1blELu53/OYHu
	 Plq41aLWOFgAnup9Ri7Zq11VR+TojA6nZK6pPObPJhKpHm6tUSYSbPQV6ZfcxICcZ4pid
	 nOkxKPV7KWKfKYyb4/nufFtnuR3EZfRB6YCkIQCtxP+jZC0Qq8PbfaQzoGbAxDugkDvYf
	 JdKI1ZwR+PlZm1QO6AgCG4I4cQKAadZffrSMoJP1PYOknzuop9uKjtqCv9brUM9skzeoi
	 vh4uG9eBCGi/f37wxbsbGgg+PGHV9dqbm5PLT3yk5eBef5LKCkJ/eI+80uC6OhG/W1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=6wind.com;
	spf=pass smtp.mailfrom=6wind.com;
	dkim=pass header.d=6wind.com header.i=@6wind.com header.a=rsa-sha256 header.s=google header.b=BeSQUFLf;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97E4606A326
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:48:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A97E4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=6wind.com header.i=@6wind.com header.a=rsa-sha256 header.s=google header.b=BeSQUFLf
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48b127f1cc8so485490f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1793090882; x=1793695682; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iYhHDjJRr+xqN1H/R/LCOfBwAItVWeWnf6KB9UCfWMw=;
        b=BeSQUFLfFpWE3/3/tLdSkrkJ49Z9pYNYkIl61PWJuJj/fRnG9z7nD8o9RY0T3bnD0y
         4+HJMHBgtudzPyAZVBfNe2ptvTzwiNVKsLsh2bvjWsC5N/AOE9Be7ImHyFJE2aIHsK4U
         WLdpFY3MtPJQEYbCD2VUB9RNOjntYoGPLP2tmZlwbPrMo7UHaehd3VSZ3u344CasmVky
         mBV9OspWzB7jTxU1Q11GKBRKi5N/8VTt5aKf6m3HO8+Rg6E4BY5rPfkaIOLZ3hJxDb1z
         oCM0ClEz+zl9KTMlLf/Cr/X7Qw5hwJjsRGRjNU0JZahu8w/HssH0NW2gyAsSsbXdDJp8
         yU0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090882; x=1793695682;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iYhHDjJRr+xqN1H/R/LCOfBwAItVWeWnf6KB9UCfWMw=;
        b=1Bx/SfT6FjzgY21UZ8IwWIQDrewtrELL5ic1zeLbsPVRn08trgQ/gNwOCUWazSfYue
         0eVKLOYx20O/EMRg3Ley8LKxpOHPcVr3cg+03pqfgmUKKiUtamkzpyQAexVPXQwfScYj
         pJOCgvzvSL2ENAYkNjT8yTlgJxxMvCcXonRr4Rp+1ZNZH/xIgh1D2+HBSo1wfnFfhxMr
         w+JXZ+/MIfaLEQim03KiYHNI+PJLKYwUFYmxoCjDMyrlb2+n/kVUk/VINx4a25W/lNav
         kYSCOwrdOTBtwK/EI3L7ehKj/6Htw36QX7pvwVJpRfKxS5qhIMRp9cW+6g5Z4fb1oxFv
         OmtQ==
X-Forwarded-Encrypted: i=1; AKwUvBzreOo/SQ+O0xWJjvJCDcx9aYwkdRegbxmNrE+l5TcBViJVtnWncTnjqakvxOV4dldck2bnRkOOJQb0RQ8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKflix400YlPQ39GanPTLDJ3sErjocDTUzcNIa/cqE7jOqWaBll
	ja6GfJxwaIxBhW07owdatecWVXA5zaPPpZjFVbEKF2s/9jiCxQTTLZ/CkO2ssQLQ0Og=
X-Gm-Gg: AYBFou2izJwXtkd4mg5ZeEfKDNf4i3T6OGzEGMviZZa6ANeK56pMYHINurbWBuwKxMG
	RwhZPDeGu7Y7vP2T2Ksse4RSK7HflDcYe/29ha7C/B1mL64ZNArtfUqrreWGbp2XF3dJxFBDuOI
	w48RtIH0k1DhZ6J1c9GC7A0EC5UwS9Gw0EIBbbi6+OrHRnYIsZX9g2zHNwhmp5005oT3kHezbPG
	ngEKZwZcqRoaQSfoyyDAKdl4gU+1rr8MAQggOfJZsuM7ay9YtKo0BZ9dO+kOg0CJHrWbhpu7KJq
	4sDuVC6lVFwQwrXwoo0cwKunFaSYNfjrn6zzAPOQtRR0bKW1ceHrY0VES6Eze7FfAGG0YUvPN4+
	A5XRFvTzdgBDUMV5ScTyy8lLtXKR68WPQSrPSOCngIEWwr75CyrrpMWWhrOp9FbSooAOwE+hH8j
	S857Kemq+yss15eSN8fDj15NH+erwHhwDa6b/5fjJNHXNRNHvBqKbBvAKGLdpQuH2IjG7r9wCye
	yjKWEeOnTtO7OQGoENwVebJrqiG8K/EfMgZ+Jt7ZbI70Fh/JucGfo47q0iPatuN9mmVIxtUjsWA
	vAt/G3UghmuaRP/AbPLzduJS5p47b1ZgyX9tEK2M+qBFV7z7uHP9cA==
X-Received: by 2002:a05:6000:40c7:b0:48a:f5c5:d067 with SMTP id ffacd0b85a97d-48e3eb36376mr20214446f8f.2.1793090881972;
        Tue, 27 Oct 2026 01:48:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:ab7:2110:6a1d:efff:fe52:1959? ([2a01:e0a:ab7:2110:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3a1csm21700112f8f.16.2026.10.27.01.48.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 01:48:01 -0700 (PDT)
Message-ID: <89f607a9-c353-4a32-9362-1a5017b580ab@6wind.com>
Date: Tue, 27 Oct 2026 09:48:00 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH net v2] gtp: Require 'CAP_NET_ADMIN' when joining the gtp
 multicast group
To: Anil Kaushik <anilkaushikwireless@gmail.com>,
 Pablo Neira Ayuso <pablo@netfilter.org>, Harald Welte <laforge@gnumonks.org>
Cc: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Simon Horman <horms@kernel.org>, osmocom-net-gprs@lists.osmocom.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261023073738.2436362-1-anilkaushikwireless@gmail.com>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <20261023073738.2436362-1-anilkaushikwireless@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



Le 23/10/2026 à 09:37, Anil Kaushik a écrit :
> The gtp generic netlink family sends notifications on its "gtp"
> multicast group when a PDP context is added or deleted, and for GTP-U
> echo responses. They carry the same attributes as a GETPDP reply: the
> MS and peer addresses, and the TEIDs, or the TID and the flow label.
> 
> GETPDP requires CAP_NET_ADMIN, but generic netlink lets any user join a
> multicast group by default, so an unprivileged user in the network
> namespace of the gtp device can read all of this. Found by code
> inspection.
> 
> Fix by marking the group with GENL_MCAST_CAP_NET_ADMIN, like the psample
> "packets" group. Only users with CAP_NET_ADMIN in the user namespace
> owning the network namespace can then join it.
> 
> This is still weaker than the check on GETPDP, which needs
> CAP_NET_ADMIN in the initial user namespace: in a network namespace
> owned by another user namespace, its root can join the group, but not
> use GETPDP. Genetlink has no multicast group flag for the initial user
> namespace, and ioam6 pairs its ops and its group the same way. This fix
> blocks the unprivileged users.
> 
> Tested by joining the group as root, as root without CAP_NET_ADMIN, and
> as an unprivileged user:
> 
> Before:
>   root: joined
>   root without CAP_NET_ADMIN: joined
>   nobody: joined
> 
> After:
>   root: joined
>   root without CAP_NET_ADMIN: EPERM
>   nobody: EPERM
> 
> Fixes: 50aba46c234e ("gtp: add notification mechanism")
> Signed-off-by: Anil Kaushik <anilkaushikwireless@gmail.com>

Reviewed-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
