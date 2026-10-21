Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792602239;
	b=P88HeanM0eRa/vthmd5p7V/RKgXk+ITQtwQj4Z3IISJycSwo/cNrmBrleNyPCAxDWtkp
	 kb5SjW58EHGVXztUhyfgaJr43fdN8NKeRg2J1UeLixKzbLnobMqaFHfaDWe4PRE13tb25
	 XFM1MFvjzT8itVs7UsAeLkxWSUMgzORt785KcBhimNCYxQGPxxf2q9lZhtshmfFFNVeMU
	 jqwdvOgeKvE0tKi3hOaL3E0D1UywyKR0GQwOktke/KAsHpx4YVweLKxYmgqDHGZg3ih8d
	 AoQOdEk3xHHp+dpScL/6kmEjq7chfESOXBQ3SPOWHL3s4DVTZj1nZw2fm/bLuWYokqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792602239;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=XxkAtzk3cuV4R/7ZEJ4B77roig8TiSn44g1A3T9utgI=;
	b=B6dVj+b0AZrrbB2PSTKpASJKt2XwmuwgHeYD5GXB+bhO6juw+EQiTJL3mUEQDl1yRzOR
	 FqjuDqa0jmoRfurv3vNy7lfkfw36X3+ZPQsbeKPBxn4+TpUpv8hkVlz1L8XDjoUa6diSm
	 CJPHlhYhBWMAmFo7QbPBfTPp4r91YDHbftkRdCuG+f1QpuRsyWyhrXDmWDYgCdDWeNl7i
	 2tef7EbtUB0s8uD4knvy5AOhxvBvnqJ5sjYg+nEPE25xgyn5VJk+wDxcwN4Xivjfc/Cgh
	 Zg/hntddZZUlOLs97mxrfoFfG8weMNTaJkEP2sJ/pFyFUmFEnkLqsa6aAioTvwAducA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OKzhBjGE;
	arc=none smtp.remote-ip=95.215.58.166
Received: from mta1.migadu.com (out-166.mta1.migadu.com [95.215.58.166])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F55606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:03:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8F55606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OKzhBjGE
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=xxzknvAGwBqrx+ryt5T3qM3aIvNfAZ9P3IcDt4rnT4w=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792602236; v=1; x=1793207036;
 b=OKzhBjGEncpgo3Uz3/LILxAqU/+xcGGiC7mavksAJYiq3PMGFkBOisxga95iE3oHTTuyKuhB
 M6cpiiUbcmVjfp75wVT6QnKK+Ui/yyjMS1BAZAZsCmOKVzrhmHTOh4+AZbDa6bzIAftpDE2xSeR
 qiZVGnmdkMLCYqQCxM8nt4/s=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d445459a510384bd;
	Wed, 21 Oct 2026 17:03:56 +0000
X-Mizu-Trace-ID: d445459a510384bd
X-Migadu-Flow: FLOW_OUT
Message-ID: <51ccddcc-53b0-47cd-9526-ccd825f0f6d9@linux.dev>
Date: Thu, 22 Oct 2026 01:03:48 +0800
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
Subject: Re: [PATCH net] ppp: linearize bridged packets when required
To: Eric Dumazet <edumazet@kernel.org>
Cc: netdev-bot+sinfo@kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Breno Leitao <leitao@debian.org>,
 Kees Cook <kees@kernel.org>, Taegu Ha <hataegu0826@gmail.com>,
 Tom Parkin <tparkin@katalix.com>, linux-ppp@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 James Chapman <jchapman@katalix.com>, Sashiko <sashiko-bot@kernel.org>,
 Felix Fietkau <nbd@nbd.name>, Pablo Neira Ayuso <pablo@netfilter.org>
References: <20261021023608.55867-1-qingfang.deng@linux.dev>
 <179255036282.3290.8488375760281728576@kernel.org>
 <c0f348bf-0e13-4cb1-8014-cd9b7787bfe6@linux.dev>
 <CAL4WiirRPnbSBgcoh8Aiq8zGVzsy34w9uaqAgSKQwpgJ0ht7aA@mail.gmail.com>
 <315a8794-db40-4d0f-9e4c-0cad66174bff@linux.dev>
 <CAL4WiiouaJ5QU24uKt=CuxpfgHmWHS5oxoE2E_C6KFCLbDh0+w@mail.gmail.com>
Content-Language: en-US
From: Qingfang Deng <qingfang.deng@linux.dev>
In-Reply-To: <CAL4WiiouaJ5QU24uKt=CuxpfgHmWHS5oxoE2E_C6KFCLbDh0+w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/22/2026 12:31 AM, Eric Dumazet wrote:
> Le mer. 21 oct. 2026 à 12:27, Qingfang Deng <qingfang.deng@linux.dev> a écrit :
>>> +       case PPP_IP:
>>> +               skb->protocol = htons(ETH_P_IP);
>>> +               break;
>>> +       case PPP_IPV6:
>>> +               skb->protocol = htons(ETH_P_IPV6);
>>> +               break;
>>> +       default:
>>> +               goto drop;
>>> +       }
>>> +       skb_set_network_header(skb, PPP_PROTO_LEN);
>>> +
>>> +       segs = skb_gso_segment(skb, 0);
>>
>> Passing zero features to skb_gso_segment will linearize every segment
>> prematurely.
> 
> Good point, PPTP and L2TP do not need linear packets.
> I will pass NETIF_F_SG: checksums are still computed in software by
> skb_segment(), as openvswitch does, and ppp_bridge_xmit() linearizes
> segments only for channels without direct_xmit.

What about NETIF_F_FRAGLIST?
