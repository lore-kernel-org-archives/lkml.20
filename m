Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793288691;
	b=JvoM6lFqrtGVrzsdMLpWvXD0e1KmEu5Qbg4VNeNJ7zu4cABke9CAQZjWqwPrbc5W99uR
	 AaooacCMA9Nwl5mlXt584NyJ8L4xyRCCLFq1wlHiMnf0A7xAGrNJpMv/KZdDFZUCo9Ypu
	 9tEmQjCqpX++yEnBPhrlTYjku9mhXpH8HAECLbMe8jpVlFI09lwtnElelkwNFs5KA5Ef8
	 R4csfj6u8HGx9Qhca87U53PBRYyB7UB2VEojyqU96dgmBKmy5euqseM/wcgpQScWGvSNt
	 aj2lDjeRn62bcE8Tfslzuz9+fTRnmn5wZtrSJNBM64iof/kv9YWXAe7LUdHi+iPvWgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793288691;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Reply-To:Subject:To:Cc:
	 References:From:Content-Language:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=ER2y3dWOiovf6F9A0olmy29Jmgyf+6P1MJIOyxbksLA=;
	b=yinOrvixb+sjFXvkPZMEZj0exChetOPBjdI8qZ7cFgdUeV30TlKyDelyQw4SYAU39nfC
	 qI1RKDvy3XYlfVa5Mgi5bNySqu9WL5Az0WK2K1I2FTVsKbsM5Rv28UiDTpc2ff4XGeRjt
	 VV9gvOOkGLu9fEu4+LZFKdubJydt4jzbPYUSP5dP6sZmW0RotfR11Sz3kb46HmwSsM/nX
	 IDIMEBHllfrxJEufoPN/5gq1Vug4yOHSZUHiruLBB/ZzI0GxBdFsmjtPFwa0VKi72pIk8
	 RfI30iUoJVhviyT0PbohvTkmVsujC/NW23Peiu5FNwLfYKAirEL2pAj77ZFXFeCQ8CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=6wind.com;
	spf=pass smtp.mailfrom=6wind.com;
	dkim=pass header.d=6wind.com header.i=@6wind.com header.a=rsa-sha256 header.s=google header.b=AAAbxfPh;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BE7606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:44:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0BE7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=6wind.com header.i=@6wind.com header.a=rsa-sha256 header.s=google header.b=AAAbxfPh
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6aa046a99c6so472697a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1793288689; x=1793893489; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ER2y3dWOiovf6F9A0olmy29Jmgyf+6P1MJIOyxbksLA=;
        b=AAAbxfPhwUsSIjVYyAQzQSjlJ7yc1F3sIQgkiBFKAsay2Tcm9cwzgM3Ny8yfdbgk9M
         xzlbNBpCU2dDDYGzdNmuEyG+Ek8Y5S2kwTx8KutOTRPVS86HQJ3sjdUEOVtL4oerk7+x
         aK6gMgohcgc9N3Fgli/cu3wRNdy3JZl5Na9hah/kCJgtTp8UB79m47q0ghWGrBekgwia
         EWIA0XAdSxJEHNtAt8AlpfSNBApmAwh2/85CP6Z8WR+c7n+iyPawHnk9/T1RtPi/Ef30
         7t9qg5UdYWne77oM5GenAUaIXi+w/6/fcsVIkycsZPFoomGif76NlMRD5P8gxEGzZ7lz
         JEWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793288689; x=1793893489;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ER2y3dWOiovf6F9A0olmy29Jmgyf+6P1MJIOyxbksLA=;
        b=HloTYOuxpH213my8HkxMXw49LyU4tQrK/Zjc58bAkzMXyozSZqAhyox8wnWpr1RHlM
         RGA+DuvwqgkDgdg6IE4FecMF9GPn5th8WgjSAvBSYSPy4D4Gjzd0nYapF4RxgaaWVCAi
         CaaUDJ9B7H0I8h9dzHynwi2B1ZzWUuwnUcaxRYKerwfSQFyWlIdycwlzXjlbrVx/9FBW
         uwg2Gyvuqg68gEeRRqMVRPGhGLnK4KnLZKfQ4h6OoqTcmc+3/G6e1KhR69vDQdm3PlDV
         I2xHr27+qCrIgTZACFVVGdFpFCzP9oO56GyT/PYBxsBOVlAWjxTB9MvOlaK7lzspFyKh
         4oiw==
X-Forwarded-Encrypted: i=1; AKwUvBxiZdv4GVJns/n+tflJWxJk7Ou66JXVj5xHnWe0IieqHwXSuQSSLx0YrCrmyxOTy1XqrkUWia3YDUzMQNI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJ1Sev1pasRBk3uLa/qliJm8RFdmFUsv8c8KVaHccgFcnGUjb0
	R0URISkrs9o+YcPvr3X3Q724U8Muj81NRPnNqEMW5a6kQ2xsk6MsmTsXB3wb7j0D/8k=
X-Gm-Gg: AYBFou3LORPABpK2Z71KJjoEILBEaaaiAq//ExkJyeE2R577ZKcWaoejiZ9oqftU9j/
	AhrxeB0E4SkeooElDFtT9w3p8uxqCLs/jgRVQ+GmajsbKGsB/AeKE47AsnJ1asvNupHpjrrTIZA
	TOLzXYtd8RfCi83khhxsxUc4k6t767vygbT3elaPQLxYXQRIfgStq7K8RF/EV4iJmhPOfSoqGov
	icPHKzCO2Cf7jQev752qcD6G8sCPIOIdNBpNyTweoEV1IVxP3DDqnD9b5oMBlOOeDL9ykG95T8A
	SbzoqEuWEivi3GbhBbpk1bN3yx8Bor1r+gctGuifVDNsZGFhMKral1n49cyp8EeaDvylIt+8kgH
	1FKhFYn+vmnXXz0LENN191BOPEsDWEylAS2WXXARPf4Vimd3gw9+ZdQe4ZcBauKy/x03thyZx0b
	847bJyqDNVo82E4vDmW36nK343vcfWE43FPPKpOQaiKD2viFNpgj9c0d9B0eODnlItXjBH3Xozu
	Rj4VIrnsLAMAdXed6NnhdTSTf0axAaJBtqtI076H1TD5793sYasrtUGDI2iYtpNNdy85h+oJrEW
	coJIqrKWSzFXvoIwx7Yy1o+Q/md+m77hAiCuwZ7FCvtLKib9mWM7flxUVWSQ+bHzs2HwgkAZB1+
	kAxhXqA==
X-Received: by 2002:a05:6402:a2c7:10b0:6b1:bc2e:5d52 with SMTP id 4fb4d7f45d1cf-6b49cbea455mr5233462a12.3.1793288688626;
        Thu, 29 Oct 2026 08:44:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:ab7:2110:6a1d:efff:fe52:1959? ([2a01:e0a:ab7:2110:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b497cfd6ffsm2575185a12.24.2026.10.29.08.44.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 08:44:47 -0700 (PDT)
Message-ID: <7fc6fa79-af42-49e8-8b41-00ad4a4d9b74@6wind.com>
Date: Thu, 29 Oct 2026 16:44:46 +0100
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
Subject: Re: [PATCH net] genetlink: Reject joining multicast groups no family
 owns
To: Anil Kaushik <anilkaushikwireless@gmail.com>, netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Ido Schimmel <idosch@nvidia.com>, XingWang Xiang <v3rdant.xiang@gmail.com>,
 Alice Ryhl <aliceryhl@google.com>, linux-kernel@vger.kernel.org
References: <20261029062214.3407223-1-anilkaushikwireless@gmail.com>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <20261029062214.3407223-1-anilkaushikwireless@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 29/10/2026 à 07:22, Anil Kaushik a écrit :
> genl_bind() checks the GENL_MCAST_CAP_* flags of a group only when a
> family owns it. For a group ID that no family owns, it returns 0, so any
> user can join it.
> 
> A family registered later can get that ID, and the socket stays a member:
> nothing checks it again. An unprivileged user can join the free IDs, load
> a family module with CTRL_CMD_GETFAMILY, which calls request_module(),
> and then receive the notifications of a group with
> GENL_MCAST_CAP_NET_ADMIN or GENL_MCAST_CAP_SYS_ADMIN. For example the
> drop_monitor "events" group always gets ID 1, and is free until the
> drop_monitor module is loaded.
> 
> Fix by returning -ENOENT from genl_bind() when no family owns the group.
> Nothing is ever sent to such a group, so joining it has no use.
Moreover, a user should retrieve the group index before joining it. It seems
weird to join it without this step.

> 
> Found by the Sashiko review of the gtp multicast group fix. Tested as an
> unprivileged user who joins all free IDs, then loads gtp and
> drop_monitor:
> 
> Before:
>   joins: ok=62 EPERM=2
>   gtp/gtp (ID 15): member
>   NET_DM/events (ID 1): member
> 
> After:
>   joins: ok=19 ENOENT=43 EPERM=2
>   gtp/gtp (ID 15): not member
>   NET_DM/events (ID 1): not member
> 
> Link: https://lore.kernel.org/netdev/179324692107.3134.14443689892607921337@kernel.org/
> Fixes: e03781879a0d ("drop_monitor: Require 'CAP_SYS_ADMIN' when joining "events" group")
> Signed-off-by: Anil Kaushik <anilkaushikwireless@gmail.com>

Reviewed-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
