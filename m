Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.79
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792635519;
	b=1M/GMuiNsnweU0kZVttUzDo1mr4lvjcaINzh7yXS7UmxzwTZQr97OrMJ/mLJVrKDdhI0
	 WHT6fmmSpJNFTA6g/hARt1+OS5/pIXpH3USmZfF7BYM+RQL/Vc+n5Hr+wSgdZi3MwoQVY
	 cNZO5APSD9gVerOmhN8aLyqytakMhI8CM2Bg3XSqb7Px1taA4/K/p9QwRVR9qo8t5OdHS
	 GSacTMtDq4puHnYOc5B/1lNrRncYg1dK8wJxaB3CjmGa11N+QXmOWyCVSNkegx3M5QYVY
	 gq3oMQTyJUXpbDZBQGglF5bDb4VndZ3b9ZQsqUNFmA3pFfBeKGNlpaF942ld09ZEB9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792635519;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=V/bK1oHMn1rt+dKdcCYOSmcwkHw/5HHuvQOfHL/lIbY=;
	b=hwa0CM+NahbSmdRjPDKLHG2kLZIL8LIwPFSA7oUW0qUzrXsOwnfSaf+yc19QPdB/NDzH
	 X7kCuF2h3DnLj+XrFc5wAFeuqo2j2+CkNAZJL8RytEKsrDcF4CaGLCXArNxUNHmF+7nzQ
	 C5hJBL/Q3r5y6O27lCBqEv0VmIiXjDefrn3efXHlreTjHTliyDeKCRdh94flkdK5ZS+di
	 V+Sf9vwSIDbjxa2Yw4TQdzqati8EOL444FI789hPl4NRgeZy+7zbwpsSAUgEKmrkNGF/s
	 Ke7LBzKC9HeaNIPfoZCkJv3q3r9kjUbID6CdmdewoKuNPqiFrC3f9ptvREew+En7riQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HgAXSlwc;
	arc=none smtp.remote-ip=95.215.58.79
Received: from mta1.migadu.com (out-79.mta1.migadu.com [95.215.58.79])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79253606A336
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:18:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79253606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HgAXSlwc
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ooqyk9o6+mpPrkv3GOQDSDUiZawfX8BzqiIhm5l6pnQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792635503; v=1; x=1793240303;
 b=HgAXSlwchmv9Y+9KUXMqqEP/X3dvSR4dnagDzZyQV+xIkneaqn9/Mevv0XToW189HH8UMw4d
 w5SpfGVvRFduIkWS3FUDNKxEK/i3LgWWusv1sAwtkoB6kl9DTC5Pl7hweELWfDiPGfZMuJ/WePj
 BurxRwlRCGPDBb0udenPRyrs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e1ec92438c6690db;
	Thu, 22 Oct 2026 02:18:23 +0000
X-Mizu-Trace-ID: e1ec92438c6690db
X-Migadu-Flow: FLOW_OUT
Message-ID: <b3091ab0-0e1b-4835-ae36-14978af46fa3@linux.dev>
Date: Thu, 22 Oct 2026 10:18:12 +0800
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
 <51ccddcc-53b0-47cd-9526-ccd825f0f6d9@linux.dev>
 <CAL4Wiip2F59XO3BrjUHVrFqYMuD-LxNmZXhtftkV-JG0Ya84Yg@mail.gmail.com>
From: Qingfang Deng <qingfang.deng@linux.dev>
In-Reply-To: <CAL4Wiip2F59XO3BrjUHVrFqYMuD-LxNmZXhtftkV-JG0Ya84Yg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2026/10/22 1:55, Eric Dumazet wrote:
>> What about NETIF_F_FRAGLIST?
> I do not see your point. Can you elaborate?
>
> There’s also nothing left to gain on fraglist packets.
>
> SKB_GSO_FRAGLIST packets already go through skb_segment_list(),
> which just unchains the original skbs without copying, as the fraglist
> test run showed.
>
> Frag_list skbs that aren’t fraglist GRO go through skb_segment(),
> which with NETIF_F_SG already shares the pages of the chained skbs
> instead of copying them.

I've run selftests and confirmed that NETIF_F_FRAGLIST is unnecessary here.

One extra finding: passing NETIF_F_SG conditionally can avoid an extra 
reallocation in skb_linearize().

segs = skb_gso_segment(skb, chan->direct_xmit ? NETIF_F_SG : 0);

