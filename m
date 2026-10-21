Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792589418;
	b=e2RtPrdJ9PPvVVbleI/kYSa/8/JtEkFy6OeUhq+ELxhcjqCG6NvirNPoowGC3nnFtC85
	 hkGnWQDrAuTfhlGasZkrid50GFKiH/QXO5tWwYNPnUUH3jFXyzqx85wdsS9DzjKgEjfpY
	 qihZbJr+ntq4Tw1VzttwWMAg5WzcZfoECrpjyIpdAiLyPNyKIDREfu4h14QwtV/nOtkr5
	 izwGIHTscSomV68QyUu76dXkNKUKSoV2IsKMYHbzpD/uM5s1qAwJQPTIhc2vEFe2VzC97
	 XCKWQiHfKpNyBdhZksHp9SmF28NOcZb5E3ihu1QxKlgv4yzdg2at2aghBhF7FvetBZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792589418;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=CX/gb5BMuxJndjanTuV1AP23DsP7m8B+9mkrfYNPMJ4=;
	b=PSyRjcnBdzT0uiP6qFbXcWEzy8fKWGXK/HWYJ2so6mTpCZlxK3mcepSkUexxyFXjFnFd
	 Et1/j0acnJUsDYX+RqfPRlPTFQQvj88NajVG60cWgl+M7E+2WGscJvMwzrih7gMbvKTv2
	 BkYfL6dbutwQn1bZ9O/yqQrHNEClP5t5lUj4YVuTXkzh8GbDeAV8EnSMGgyKA85ZXaWdD
	 2FgM1tRIEIPaSqu5+78d+yxWC6ItsXSUUuHuTdkZf5UY+jiZfG30TFswfGzLOUYBldRuT
	 I2cw1OXPtE9MdKRXNWUVyTZFCT5eDgh1wF8y9Rl8+9oyNnkmezZLUDfdM4Djg8SCerA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gHlLiQo2;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="fy9Mjvj/";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8BB606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:30:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E8BB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gHlLiQo2;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=fy9Mjvj/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792589416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CX/gb5BMuxJndjanTuV1AP23DsP7m8B+9mkrfYNPMJ4=;
	b=gHlLiQo2E2dL7bMQwmwUAvUGHjw8JICMOFhzPoqhMaszcWq6up+wW+ypPV/BTmgRldMpsl
	oPYPiqJySApNlaqXDNuJi7LkU4Vg19qlis/SqJqYwBsvtCEny+bouLqXus6Rq+kZvxITd0
	jF81b3hmSh9nTXfBiTLUjnGp3E0E4pU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-240-CkL8t-94O8OdIzNyWABlvw-1; Wed, 21 Oct 2026 09:30:14 -0400
X-MC-Unique: CkL8t-94O8OdIzNyWABlvw-1
X-Mimecast-MFC-AGG-ID: CkL8t-94O8OdIzNyWABlvw_1792589414
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-6b1d43907c2so931343a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792589414; x=1793194214; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CX/gb5BMuxJndjanTuV1AP23DsP7m8B+9mkrfYNPMJ4=;
        b=fy9Mjvj/AtO92MMu6zqsftDYsJUiOuNyMkysomcAjnU2VCbrXAjO3sNpommUIq44X9
         QRQyqqd5l3EU+xqb1ulppQoXM281dlVX8cxSF4E9r8WGuSKoRt2Z1PFeavNhgbjP2iD/
         YENrBBElBAuZx61Ag+CR1UCXG18vchGNFf7zHvs2qVDcjQRQCaP3FOTZo2mvbS+5+M8e
         L3PRQr5rjXqtYW7Q+hllDP/XDCayNQWGmT17sZQ99UWnca1OyWWXlFWlWlvv9SzuOW7T
         3wG7js4JkBj89i1Gx6z6y+kJ/PZQP99Vt90dSK/Um2qUwe/fSW5N20jc1YqkqW85X/wv
         QRBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792589414; x=1793194214;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CX/gb5BMuxJndjanTuV1AP23DsP7m8B+9mkrfYNPMJ4=;
        b=i4TP/oFr334DsEHM5FYGupr97PQPDCLOZI+o5cU8mnZRLwkz+toMo+J8BDVImQ20+B
         +Z7Kcg+6awjzFzZcy3nWIXGpIZB/rdNNMZlBm2KgAZTi2gvX4tSMMfV49lydulPU+4NC
         ZNAJAlF5vZwN22QLgiiOIkFCRNowDV4nECiiMjkY6/WeTnXUgwYOltIsO0QCOjKe2hGc
         +7PU8d/NUjAwRv6zwKoI7ESx2TQdnFd/Uzt2yxvjqzVplsQDc4gCG+lHvicYbS9MpqrD
         Qj1ZtcoI9s0npn9TAMHOYlyNuw5dTpHAB+E9mdxJ/HElGlnxHgrQd1c6BUQ9XZPJ5oHr
         HEcQ==
X-Forwarded-Encrypted: i=1; AKwUvBywFDmWBlQkxGYLSQzG+5ibQVIUuvOcy7JffRAncXklT2bcPHUyGx0k/HH0TqW/ByHp+KOEANuayACDHSU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdzuGo3/2KTblay8bBYRSI4WAaVcFLQ03F012zX4AMGRrMp8YT
	hW80y52UgRd6nZUTyoxKUV72FFHwg06M7f+SRMjuPvMEZTbLzZi51+5PqiJvN7gNdRip560A3x9
	5MSoctXQc5QGyOkaCixnCznAAbAS+Gxyxw/yuZ2jOfjS1Gx61odcqofCNtg0qdIuV+Q==
X-Gm-Gg: AYBFou1pekwKKk3I04SN8zGQCIK9cvya4o/9zyGPgS45ejZxKgZh/yanz/yf4lPxyl3
	S/G5FiFG2PbPKDh5DcM9CWwFRUY2TMTsawNEeOHjufsSfNeKsa59BlyW++2vOzFmFedhJKCIK0L
	PZ51x7AP402GxzyckDaKybSHgpr9xYrgU01PG6In5dwwP/D9r6npC3B7lPE+C4JoEfq4J+1HeYH
	mxaSvAXMEpBtxSLPkl0A+VkjNumjzqfoJo7n4zap2Ow+mFj9yNHuqMLTA5yb+AYmn1u8WzLADWn
	Fc7S+2y7Fi2dJyvPSaq1TZePSCSiZ52SccB9gT4SUcLhh4e9J3T7y3910ewvOSGTDYgH09f/v51
	k+V3ryCPmh3VMCl+j+2soVWZQUj15OKchEDa4u+z3uvlWgVZMpKxF3h7UysERLqIj6pbSDuwXcw
	==
X-Received: by 2002:a05:6402:548e:b0:6b3:f821:2a9e with SMTP id 4fb4d7f45d1cf-6b408eb21f5mr1628503a12.20.1792589413533;
        Wed, 21 Oct 2026 06:30:13 -0700 (PDT)
X-Received: by 2002:a05:6402:548e:b0:6b3:f821:2a9e with SMTP id 4fb4d7f45d1cf-6b408eb21f5mr1628461a12.20.1792589412847;
        Wed, 21 Oct 2026 06:30:12 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b40313258dsm842223a12.28.2026.10.21.06.30.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 06:30:12 -0700 (PDT)
Message-ID: <361bbccf-6ce7-4b1f-bd55-4d8270423320@redhat.com>
Date: Wed, 21 Oct 2026 15:30:09 +0200
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
Subject: Re: [PATCH net-next v2] amt: make the per-tunnel group and source
 limits configurable
To: Omar Ramadan <omar@blockcast.net>, Taehee Yoo <ap420073@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Simon Horman <horms@kernel.org>
References: <20261015231825.2852054-1-omar@blockcast.net>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261015231825.2852054-1-omar@blockcast.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/16/26 01:18, Omar Ramadan wrote:
> A relay caps the state one gateway tunnel can hold at AMT_MAX_GROUP (32)
> group records and AMT_MAX_SOURCE (128) source records, counted across
> all of the tunnel's groups. Both are compile-time constants. An SSM
> receiver uses a source record for every (S,G) it joins, so a gateway that
> needs more than 32 groups or 128 channels through one tunnel has the
> excess joins dropped, and the relay operator cannot raise either limit.
> 
> Add IFLA_AMT_MAX_GROUPS and IFLA_AMT_MAX_SOURCES, read when the link is
> created, like IFLA_AMT_MAX_TUNNELS. Zero or an absent attribute keeps the
> current defaults. Gateways drive these allocations, so the policy caps
> them at 1024 groups and 4096 sources per tunnel, and strict_start_type
> has it validate them, and any attribute added after them, strictly.
> Report both limits in amt_fill_info().
> 
> Assisted-by: LLM
> Signed-off-by: Omar Ramadan <omar@blockcast.net>
> ---
> v2:
> - No code change. Rebased on net-next 518bf436318e.
> - The amt_policy[] hunk now carries one line of context. In v1 that
>    context included the IFLA_AMT_DISCOVERY_IP entry, which patch 3 of
>    the pending net series [1] rewrites, so v1 did not apply to NIPA's
>    combined net + net-next branch. This version applies to net-next
>    with or without that series; with it, the result matches a 3-way
>    merge of the two.
> - v1: https://lore.kernel.org/netdev/20261014221334.2443184-1-omar@blockcast.net/
> 
> [1] https://lore.kernel.org/netdev/20261015220648.1545576-1-omar@blockcast.net/
> 
> Notes:
> - At the policy ceilings, with 256 source buckets per group, one tunnel
>    can hold up to 1024 * 4 KiB group records (176 bytes plus 2 KiB of
>    buckets, a kmalloc-4k object) and 4096 * 192 bytes of source records,
>    about 4.75 MiB. At the defaults it is about 152 KiB.
> - The IPv6 outer transport series ("amt: add an IPv6 outer transport",
>    posted 2026-10-09) also appends attributes after IFLA_AMT_MAX_TUNNELS
>    and sets strict_start_type at its first one. Whichever is applied
>    second will be renumbered after the other and drop its own
>    strict_start_type line.
> - Tested on net-next 518bf436318e, alone and with the net series [1]
>    applied, in an x86_64 KVM guest with the iproute2 companion patch,
>    which follows once this is applied. The defaults read back as 32 and
>    128, 1024 and 4096 round-trip in text and JSON output, zero keeps the
>    defaults, and 1025 or 4097 is rejected by the policy without creating
>    a device. An 8-byte IFLA_AMT_MAX_GROUPS is rejected as an invalid
>    attribute length, and the same request with 4 bytes creates the link.
>    tools/testing/selftests/net/amt.sh passes 6/6. W=1 builds with IPV6=y
>    and =n, sparse, and kernel-doc report nothing new.
> 
>   drivers/net/amt.c        | 15 +++++++++++++--
>   include/net/amt.h        |  5 +++++
>   include/uapi/linux/amt.h |  8 ++++++++
>   3 files changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/amt.c b/drivers/net/amt.c
> index 81d26ef82..30cff8de4 100644
> --- a/drivers/net/amt.c
> +++ b/drivers/net/amt.c
> @@ -3162,6 +3162,7 @@ static void amt_link_setup(struct net_device *dev)
>   }
>   
>   static const struct nla_policy amt_policy[IFLA_AMT_MAX + 1] = {
> +	[IFLA_AMT_UNSPEC]	= { .strict_start_type = IFLA_AMT_MAX_GROUPS },
>   	[IFLA_AMT_MODE]		= { .type = NLA_U32 },
>   	[IFLA_AMT_RELAY_PORT]	= { .type = NLA_U16 },
>   	[IFLA_AMT_GATEWAY_PORT]	= { .type = NLA_U16 },
> @@ -3172,2 +3173,4 @@ static const struct nla_policy amt_policy[IFLA_AMT_MAX + 1] = {
>   	[IFLA_AMT_MAX_TUNNELS]	= { .type = NLA_U32 },
> +	[IFLA_AMT_MAX_GROUPS]	= NLA_POLICY_MAX(NLA_U32, AMT_MAX_GROUP_LIMIT),
> +	[IFLA_AMT_MAX_SOURCES]	= NLA_POLICY_MAX(NLA_U32, AMT_MAX_SOURCE_LIMIT),
>   };
> @@ -3235,8 +3238,10 @@ static int amt_newlink(struct net_device *dev,
>   		amt->max_tunnels = AMT_MAX_TUNNELS;
>   
>   	spin_lock_init(&amt->lock);
> -	amt->max_groups = AMT_MAX_GROUP;
> -	amt->max_sources = AMT_MAX_SOURCE;
> +	amt->max_groups = nla_get_u32_default(data[IFLA_AMT_MAX_GROUPS], 0) ?:
> +			  AMT_MAX_GROUP;
> +	amt->max_sources = nla_get_u32_default(data[IFLA_AMT_MAX_SOURCES], 0) ?:
> +			   AMT_MAX_SOURCE;
>   	amt->hash_buckets = AMT_HSIZE;

Sashiko noted that with this setting is very easy to livelock the host.
At very least you should scale `hash_buckets` accordingly, possibly move some
processing out of the RX path.

/P

