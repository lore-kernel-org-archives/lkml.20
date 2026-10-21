Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792582360;
	b=sEIrIB/Ykn/8m9r55KqCJpdauIelIwa4h/W6tXetCswTwP4wOQOaWNduuH6FAZ3fG+qj
	 a2cb0/E1i4IjCj/PR+hZJR3WpgDs4EpJjBUNDgOE/kGkOjDlWeUWKTaEB1g++zaLjw7fC
	 WOamE2w1uvFEzeJMBar4cSz4UUNDTmiSM0Mb9+j1mPQ8K8Gkg3zNCUyi9XUSbQ4cM6Sjg
	 sQN23Oe5jRDjxSssbsLEQ6SjQlFpShMlydmr0vh2PQMYuC3Hygcs+i0JlgkoRbgQmonZd
	 Ate8ul35zN8nWHB6A7Kc/wmbqD1DOaZIONJZkyRuhrYSUfhtUqUXFUFTjfOVybEMiZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792582360;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=xyl3CnVvMpFrRVxhlof0NYmw37iq2GNFSsVdxr9ncrc=;
	b=tBhdqUZ+8EdA4zxp0yRk97V8F9gmlfPB84L9LdEvdOxHvQks/Ot/PwK0N5wnpx9rH68s
	 rYaRaR3f32D389LOd9Ys9pUjaIx1HM50x8W2b6P5lTOBGPXDE38fnOtzfcx/sJVSifWKV
	 iLPRFU1hZEXNGdFTORPnS8lCHWA6V+z/fbcQDVNKiXUdV+U8xvDXFSP8+NjDQ1ZXskp43
	 NYxlnwx2tuJShBTn69kbGKv7QLDasO9ngOaG1zspcEFXuCE034wTbal0xJTn3WjBqw3F+
	 sT8K3OeyEPgRlMzDnqbv5RPcwg5CMpcUdGKDvzANO0/02pSo8yUAhBkWI6nzy6k94JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DWQFTKYP;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=neyGB9I+;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BF7606A326
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:32:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8BF7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DWQFTKYP;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=neyGB9I+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792582358;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xyl3CnVvMpFrRVxhlof0NYmw37iq2GNFSsVdxr9ncrc=;
	b=DWQFTKYP0f8Z2SKXci9XgvqqzP/D1QsRFQcuuAjnkgWLLMDL3bVzlg0WoQoV37zLLBhjLt
	RermL9qO3Q0t5R5Gf3+ZFrXlUbi3rJ+7dmuLJRvBNPMKOkqHxTie4F/0KcrLvcAYTjfoCR
	Q06c8Ki5FzEzN88Btri/o+jk4dL0Wg0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-656-DLpy6e4IPJi2u67jNeUV0A-1; Wed, 21 Oct 2026 11:32:37 +0000
X-MC-Unique: DLpy6e4IPJi2u67jNeUV0A-1
X-Mimecast-MFC-AGG-ID: DLpy6e4IPJi2u67jNeUV0A_1792582356
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48c430f0f01so500617f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792582356; x=1793187156; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xyl3CnVvMpFrRVxhlof0NYmw37iq2GNFSsVdxr9ncrc=;
        b=neyGB9I+UBWtnQnBAiSIIx8sSNKcZo3FCFjhirHRInG7kttXdJ6krZFN5cw7FGTzlN
         tqdkEAJzDWBouVp7FAtyDivGsaq52+tYWFPNxuq7zWBSv6lJXFv/yWwNQCFqSeNEUvJj
         xVlsGu7ojvzOk39d8VIFrpGq58oB1zL3S/sRcn/7hbUyZEJ87GUSnwm2rx/xdIULu+dt
         ebc9IHQOijuMZzlCpvcexhSLuuD5n1voVdAneBze9PN7Gy5VKlrwiCgpXy96PlDVVoQR
         6uminrHtNj9B2bad3nkIbR23+SpMh4C6E5PCRIEleOOcRbYcAm5rvH9hdFNmw/cI/IE6
         GSkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792582356; x=1793187156;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xyl3CnVvMpFrRVxhlof0NYmw37iq2GNFSsVdxr9ncrc=;
        b=ZfrfPYMsg6cC0Q9BBRA1qnrUzTKaq7dRudxZr5N3emFdyurEi7k7M5WzmAOM+Hskco
         z4/cDFxf3Ata6BF5Os9sH2p+/IqsLM2p3s5vu3FROYowaJymwp6fs/TFBiCB6cgLRiDR
         dzwqZOSEOwLzaFGj+0KlGE7aZ3j2tos+gFLWBAZWXhG+hGGa2Zq78P6qqzsEQPukhGaP
         k9QdxLUjRZuBiX4g2HKGAp2+Uu9YuWY3qVJa0EX96AEaM1sJVdNF1dof3H8ScU3/5oX/
         jFru2u5RATAV5s+WjHD/2d04lBgX7Nd+a7yfLfmGM2ZOv3JAmyWoJ7k1UqZfJwtm6E0U
         XC9g==
X-Forwarded-Encrypted: i=1; AKwUvByATZXdcEWaRt3wQZt1/LPsR7A1JEkmt67bZCqpK6M2fCfcLsoBUB99b2MOmoSOVNo3BFk7iYava7ncOms=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbtr6cDnIrV84MljHRKr10cZ0UYfHIuZUqHtRH4XIubtNaFEXf
	Q4Fzd41Zb1MtYj49KxdBJd8trVwpZCt95Nm4Ja0Mydo9sjMkXk5/bAWbQ5hUp4oOIUrAMmL3+p6
	uLRQL+hDEtWWZu3QI1r03twqv3k8b49OBaP7BDtDp07N0L0a9Otl/wthZZrfOQLkNIg==
X-Gm-Gg: AYBFou1XZh0LrAmdXGr6a0c0/KI5eicLStHRRlM/JiLGBHdHtlHW60LmbUdv5psD0wZ
	3eu9gBbOFelU0f+Hqu3xWGnR/OX9Jflv4ro5z2vQv+26viGdRaKG+80IhQirFix4jSFbWUG31ux
	RvhrP8VeEl9TTusX6pnenGFIcf5l7Zs0YqtgzTABiPzrwk8iqjBWwcwlFSZFeU9WZaFfLVNXWmV
	1G9wVljGns4zU7zbndIb01HWe/ZZOlbotc8cOeSmEzuEk0QBZhKyJx0Lr76XOFAf57CyznCcWLL
	IS2X4g9OsJyu9tH39HHFMuSyihnN0p/8v1dTe0et6hA8nL5PhVgygd7nO4PS1reo0LkCBuUY/JK
	5aUK+FWugwWHN4TRH5OijgW7Py4SSkYjAbmGQcCzzn92hf+nQbFbw5Ybu7RjlnzXrhjKGMb6OrA
	==
X-Received: by 2002:a05:6000:1a86:b0:48a:ffc4:72e0 with SMTP id ffacd0b85a97d-48e26427bbemr3945597f8f.4.1792582356097;
        Wed, 21 Oct 2026 04:32:36 -0700 (PDT)
X-Received: by 2002:a05:6000:1a86:b0:48a:ffc4:72e0 with SMTP id ffacd0b85a97d-48e26427bbemr3945544f8f.4.1792582355599;
        Wed, 21 Oct 2026 04:32:35 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828cd1sm4908466f8f.22.2026.10.21.04.32.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 04:32:35 -0700 (PDT)
Message-ID: <bad72d8e-f424-4be7-8376-30ff0155e2d7@redhat.com>
Date: Wed, 21 Oct 2026 13:32:34 +0200
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
Subject: Re: [PATCH] net: sfc: run hardware-classified UDP packets through GRO
To: Edward Cree <ecree.xilinx@gmail.com>, manpacket@gmail.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-net-drivers@amd.com,
 linux-kernel@vger.kernel.org
References: <20261018-sfc-gro-udp-v1-1-f7bf378178f8@gmail.com>
 <e6e5a292-0512-47d0-964b-249ff35074ac@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <e6e5a292-0512-47d0-964b-249ff35074ac@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/19/26 15:38, Edward Cree wrote:
> On 18/10/2026 22:05, Michael Baikov via B4 Relay wrote:
>> From: Michael Baikov <manpacket@gmail.com>
>>
>> This commit partially undoes changes made by the commit e79255de8581
>> ("sfc: Do not pass non-TCP packets into GRO code"). Those changes made
>> sense back then, but now GRO can help with more message types. Instead
>> of passing just TCP packets driver to GRO now also pass UDP packets.
>>
>> Tested on SFC9250 with a UDP_GRO socket.
>>
>> Signed-off-by: Michael Baikov <manpacket@gmail.com>
> 
> This seems sensible enough, but I wonder whether, instead of doing GRO
>   on TCP|UDP, it would be better at this point to just pass all protocols
>   to GRO and not try to be clever about it in the driver.  I don't know
>   how likely other ipprotos are to grow GRO support in the future, or
>   whether the front-end check in the driver (potentially adding cycles to
>   every RX) is more expensive than having random IP go partway up the GRO
>   stack to then be kicked out onto the non-GRO RX path, given that
>   there's not likely to be much high-rate traffic that's neither TCP nor
>   UDP (whereas when we wanted to separate those two there was potentially
>   much more value in doing so early).
> So on those grounds I think there's a case for a straight revert of
>   e79255de8581, 

I also agree a clean revert would be the better option.

Please note we are in the merge window right now, you need to wait
until net-next re-opens for the new revision.

/P

