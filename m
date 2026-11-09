Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794248961;
	b=EPJYKtyU1vP7Fd5yxayvJI2F/f75psgScfIU88uSRUsNZBwUBssMD4zuU5/8jcNBE+Q1
	 fGfpx8E17gh7rbdF65UyHEhopGIvK9oe2+Ln96/D2/xjZy7tLw+MRodYD371loqITR4Tm
	 gAGIqbzOkH8kNLkjbyJFIT5FqW4ThRBZwjVwaU/DImANE0AMkkU6z3ox9G15lMB7CRoK1
	 Rm0g/79FaGjFup/3G7cg5oMbMVGnDoLIvvXG5/2jPP6z29TALkUQ+SU/qYB7AnehWRIOl
	 90MLOIxH2dL6AH5+1pU+P6xtVACCFa269vtP9kEdlZeB+D/W+VLg28GZyqcUR0vwIiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794248961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:In-Reply-To:Subject:Content-Type;
	bh=TyNlOaE6r53YabDf7NgKAHxeTjKkEmLPqy6LNOwpSOw=;
	b=5aaH+pAbfh03c3wh29NtSN510fxAv2D77Kho7Ytx62sc3/X4KnUXKxAd+LFioUxR9dis
	 TAfy/4yrD9eBnLw9QsFHmD9YfHErRO7eVvyUF5iHXshpChsqqfKyzEWkH15I5lWzxqmsJ
	 3FEf/7+S36xyEgZYsiXXGO69FfLURpxuitWaNCz+AAsMHH7Rl9qgdtdFevBDfluCA/B1b
	 q6k2pkyNg3vxnyl4V4M+a9O/XHMIHXtdIA+CEvPYrZ/lLmGJTbfIQMh59zk7WeiU+rXwy
	 0kdNI6NbGkFTkWJJPBQiidZjv8im/i9bK58u1EZWKcHlIj5vtqesfwQOQRXEg8F1Vfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wVPmauA8;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC5F6070ED5
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 18:29:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAC5F6070ED5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wVPmauA8
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-33e5ae86ff2so721838eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 10:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794248960; x=1794853760; darn=vger.kernel.org;
        h=content-type:subject:in-reply-to:cc:to:from:message-id:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TyNlOaE6r53YabDf7NgKAHxeTjKkEmLPqy6LNOwpSOw=;
        b=wVPmauA8OdLBNUi//iUcElADcRibZhBlYmRzMsqGWZwocRzhlB8pAEZUyTVONutmzP
         YHGl7m7d5gmKZ+kHy+amcdGR0AdGQnPC70uqhqLev+qT0zS5gLE0OQedk71PD93HuDHe
         d4AmF+8Op5QqLeFTRnHezx/ld31iyUN1GiwdR9gI83FoQB/p3kN+M6POA5UihECgoHE8
         nuCiIhx0et4FR8tdMwbyimQJYCdpUxlrmR1+YMHy6otayeUpxcz8AVkru0zzf6Ais/I4
         VVUtRfQ+Vg5feQX7YYsyKpySiIOvAMZA1iGgR5VhnDI5k3Uv8f3/btggB3XTDbZErZLZ
         HL3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794248960; x=1794853760;
        h=content-type:subject:in-reply-to:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TyNlOaE6r53YabDf7NgKAHxeTjKkEmLPqy6LNOwpSOw=;
        b=AWktUCYRXeFAsZyyBikcdu6/D7orPq8ZP+TuMQ9oxDUovOXoRMIRYTpqshci1uWIVs
         sxn5LZrs1hr32dc3DAzwt0A0rjXgZqQF2fb77UvM7r0Bi68EQJ0tU2Mabr+nE4IKQgL/
         MO3X8lUDQ0pjr3IkQLtEfZCodpi6F9HeELVaSVWbK/QBlAQOtYqR8+XEgzmOo3tcjovY
         pBmvfT1UoxC2NJ29C60IIgrCi8eVGbpKf8K2BbJpsQkze20eJ3dvoXBRjfbqmSY/Jvh5
         Ix8Oel8F/NGcv1erPF96TYSvIXMGNjA+/9cbwmQ5ZfohdUgoiQB1fuNq2Net5w/aqM/u
         wR3A==
X-Forwarded-Encrypted: i=1; AL+hErHdVE90NbYRdO/8/hquh8pvIx3dbhQ5X2cNTE/zKNht3CobUje85fvQjLMR2Thz+SgyfdRY5OJwtN/F3gg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9y/wqKfHJ473ILTaF5Exh0GUqZbPOz/j5iLK4ymZnoca0uQIAe
	ln9sCHMcNPwOU13vxV4qD7t3w4n7bWGMp6iOXZjrJ2Z+qaLzUkiHSmiy
X-Gm-Gg: AYBFou1L4YDONje8RiGNCvszL0/FYdUcbpCLOpI+9aCwMsyr76XuzuuCO9CvKqklhkG
	l2Cf/IEI2EIuDWxHPO5AoS9U9uHQMHMlj6ih5p7QQ1ev2iPOKLdyW2vrUqSkK3qPpdMsP14mwAg
	DX5CokKP29iuNVOBSiwZ3PQAEEAMOx4Tq1pYcHKHqzGaxeOfxo5KpvCjb19tQT3m81S0r7N+Zma
	qdkGQctmqbbDJy40/pOuNVfgquKKezIT9Fd+jbYhnKkB86H2iZ4iAt+LYztdDifBpCaz//MCIOo
	NVCaZv0dHBNWRgLdn6PjiMa6O7bLOSXsqeEnPLTY196TbFzjnwHVMOjAaILiiFufQ8mCxThMfjo
	cVNiFz38MqEkK3aodItI+gUeaLqIC0gC0WPKrJJ6iPvn7oowDSXd9hucEBcux1HIulJ+XETQ94G
	wspqSRshi4zllkL+g5Vd0KcD/JVD2BIvywZV6dNgq5SOsbNtv2tqrO5V0kUQ8Zpp8l1FypSLW6H
	S6zjxWuw1s+2zVsn3cWxciq7p3RXwjwptQNGZbN4eU+CWW03GssJDXq1ucxy8D6cbwSHPmWtTiK
	2qLlXJTxsIewMBV+9GsWog4=
X-Received: by 2002:a05:7300:e9dc:10b0:36d:3c0f:cc85 with SMTP id 5a478bee46e88-3751c82b5e5mr145592eec.5.1794248960011;
        Mon, 09 Nov 2026 10:29:20 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:41::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520512ec1sm99440eec.12.2026.11.09.10.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 10:29:19 -0800 (PST)
Date: Mon, 09 Nov 2026 10:29:18 -0800
Message-ID: <8025f6aed4bc33298e8be50280ab72e4@gmail.com>
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
In-Reply-To: <179418738174.994134.464817117967884735@kernel.org>
Subject: Re:  Re: [PATCH net-next v3 7/9] net/mlx5e: lift the netmem TX frag
 size limit
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

> [Severity: Low]
> Is U32_MAX really the largest length an mlx5 data segment can describe?
> The commit message says:
> 
>   TX data segments have a 32-bit byte count, so devmem TX frags don't
>   need a size limit.
> 
> Bit 31 of byte_count looks like it is the inline segment marker rather
> than part of the length:

[..]

> Would a value that matches the hardware, such as (1U << 31) - 1 or SZ_1G,
> work better here? The commit message would need updating to match.

Let me switch to SZ_1G to be 100% safe.

---
pw-bot: cr
