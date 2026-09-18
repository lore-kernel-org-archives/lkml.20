Received: from mail-ot1-f100.google.com (mail-ot1-f100.google.com [209.85.210.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF98451C04F
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 17:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789753322; cv=none; b=AMHI7Qm8GbJfHGPLezinV+mIeDcItu3eGai0gwwj2snbQf4lhD28iOeRa1xzFmFmPUZS1VjMS2xutegPx/TwLidugSV6sGopBJHDM/M4AH/DZIahStgC+vQ5KXZSfEUsTQETsH7zsA+95pQV6uSfIvWoSqACR43dzYstpAQpyMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789753322; c=relaxed/simple;
	bh=+isudBCsCI+8QRhr/NaUqSPzjNiQcWhaERtf4h61Jmk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H718GLbLrWuDSOTDRDYz6rtYlTUCgm/GjKwNWjhGfySIG52RndgrF/9QcF3bjm09abjGVwnPzdscrpxNrl8n+6IyLBvLqfqOOvMjCWHx8cJeLbihzYHictFJEfSEehgIVUWLDOLXsdweB6J+LcPrgZ47MBa237PE7RJ2hAOjO70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=eg3H6TfT; arc=none smtp.client-ip=209.85.210.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="eg3H6TfT"
Received: by mail-ot1-f100.google.com with SMTP id 46e09a7af769-80576d65d8eso374117a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:41:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789753318; x=1790358118;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LTw8O/yK91y4RheqROz1F5sp+F9hbbCwTxlZ78Kfrtk=;
        b=NrCToAk45KjIZNh/SpT+7oEjCxFq+Fw0tQTWCEUFvxsxqp/6c6+R1x6ow6lxKsjGHG
         kVH4heM7r2kJRl6zEraUAEk/34iYFGEFllH5Eg87IYKQCkvxoR7b2f/p5PN+uIjQ8NTJ
         m4P8zC3h81sU85+HhGfB/GrQSi2k1atVskBrqE3wgtSXbPqvcGrN/N0W2sV0pixDtbuX
         h1RzDL5mW7/dlOMFmSEQliQ17Nct/YGyglEdum+ooO60VceyDH8xsO4uRqSEicFyUxDS
         /2PPR0pRio7WlWAZPcgTH/JVZLV0uoYDiN0QeDbItFm4PbEQz8SGnDsNkRMm9TvEE4Sa
         5ChQ==
X-Forwarded-Encrypted: i=1; AKwUvBxS0KaNDORGJP7wK1FaNJdec60ftuvqiZp+y8Kkrhd9A0oJpNKz9ax8ebed4mbOoWG7YtdPgYWgazCA5Vw=@vger.kernel.org
X-Gm-Message-State: AFuF++nGXR7n+cAAYjdNSPEb9H+VfSgLPMQ+y4zywqIEZVSZ1LjhFaSd
	Mq6NvE2GYM8hjegdL3RRNw08dkqdmDk2m61Jks4XH3vPji+hkAyu2GwsuFyHY0ZXCPCo8GvPP9B
	gfUP3+wFZ+kHE4iuhO99kUCS1aikUCZ01JRvCf2aHplDYmGS+Zvg1vfkUJCGi39954w+xpgAIL4
	DxfsiFqtDcZTUbR2n3ns7oiaOtGGbprtZyXlr64AUNy9me9qr5L7dYAmF5GUPte3z5GGLxFPM1N
	ICbr1hM3jRQo5ZZ9hZVaYNX
X-Gm-Gg: AYBFou2ls5tT/WEtp7cvo2shbgLfR0UuW7uKvlGx7zXTo1B7mYxepcq8+1QBMuqnDFo
	xXmhuvdhFJMj4brEl2iextRExnsWeBmBnaWxGz2BUKQiOuqR/asizXaLaDNb3pjqDfDl2Sh9Bd/
	/8sfoBdy0LKxiXgDEJwtKIiycQGqfiJzQxipjE2Rd+0BOgssq1VhoHfOJ1gbtSxSco7D3a3ilZd
	fHWt6BGjEpe9bktP/5s4JMECx51pn0/N9EbZhSr76xM+rCWhY8s4eM4jp15bihxwIBVzOVAU30N
	HT8C27y3SqsU5RiPnS6kLWKLc57yzzTnFrSZwz9S6eFzT5Dc9vN0XzaNA+nFPT/vMxUa4pqRhQ+
	ARSwtXzxBIpv93XcubYcWfD5OJ/mMqlXJsr1KkU1UOaB4ZrsGJtF6jXzMUv1qwYjUuUCEykACDC
	N8GrUDM3KI0ERrsP0p9zXOno7FoQcj2Xn7UXyOKhCT
X-Received: by 2002:a05:6830:2545:b0:806:6e79:c7e8 with SMTP id 46e09a7af769-80ddfd6c125mr4040123a34.2.1789753317847;
        Fri, 18 Sep 2026 10:41:57 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-8107d879f9fsm24273a34.5.2026.09.18.10.41.57
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Sep 2026 10:41:57 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2dd1631d291so12456965ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789753316; x=1790358116; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LTw8O/yK91y4RheqROz1F5sp+F9hbbCwTxlZ78Kfrtk=;
        b=eg3H6TfTNektoKL+Gi8E2YXI57wi7+N57S1K0cYyjneuyyBR/LMhecpOF+SV92dgjj
         MX19CFpdDKSa/U2/vk7QdqAg5gYpOIFH1gspSFenivd5z+pMukYOWCuKNCocS734WVLA
         qRGLE6YDvX196FGWZwihms6BMffca0zpZliuU=
X-Forwarded-Encrypted: i=1; AKwUvBwf7vz8aKr3JnLwwg1RYe+58bEZqyg/BDU9Anf8Z1BfsJ/5d4l2gQTTyDi7ck+H6wuskTLrvyEs+eGJ4s4=@vger.kernel.org
X-Received: by 2002:a17:902:f611:b0:2db:2376:6e8a with SMTP id d9443c01a7336-2ddb1ab5841mr69288885ad.9.1789753316091;
        Fri, 18 Sep 2026 10:41:56 -0700 (PDT)
X-Received: by 2002:a17:902:f611:b0:2db:2376:6e8a with SMTP id d9443c01a7336-2ddb1ab5841mr69288345ad.9.1789753315540;
        Fri, 18 Sep 2026 10:41:55 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17ba30dsm322255ad.46.2026.09.18.10.41.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 10:41:54 -0700 (PDT)
Message-ID: <d954c225-ed1f-4849-90c8-51891b1976e9@broadcom.com>
Date: Fri, 18 Sep 2026 10:41:53 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 7/8] net: bcmgenet: zero-initialize Transmit Status
 Block in bcmgenet_add_tsb
To: Nicolai Buchwitz <nb@tipi-net.de>
Cc: netdev@vger.kernel.org, Cursor <cursoragent@cursor.com>,
 Doug Berger <opendmb@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Zak Kemble <zakkemble@gmail.com>,
 Simon Horman <horms@kernel.org>, Ryo Takakura <ryotkkr98@gmail.com>,
 linux-kernel@vger.kernel.org
References: <20260918000732.276506-1-florian.fainelli@broadcom.com>
 <20260918000732.276506-8-florian.fainelli@broadcom.com>
 <f8918542ababe3af39ce6f2f5ee55948@tipi-net.de>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <f8918542ababe3af39ce6f2f5ee55948@tipi-net.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 9/18/26 04:03, Nicolai Buchwitz wrote:
> Hi Florian
> 
> On 18.9.2026 02:07, Florian Fainelli wrote:
>> bcmgenet_add_tsb() pushes 64 bytes of headroom onto the skb to form the
>> Transmit Status Block (TSB) but only assigns status->tx_csum_info when
>> skb->ip_summed == CHECKSUM_PARTIAL. For packets without checksum offload,
>> or for other fields within struct status_64, the status block contains
>> uninitialized stack/heap memory from previous skb operations.
> 
> The MAC only reads tx_csum_info when the descriptor has DMA_TX_DO_CSUM,
> and bcmgenet_xmit() sets that only for CHECKSUM_PARTIAL.
> The stale value seems to be never used?
> 
> Did you hit an actual failure?  Otherwise this would be a 64 byte memset
> on every transmitted packet.

Nope this is entirely theoretical, and one could argue that this could 
create a slight drop in performance, happy to drop that one as well 
since we never really experienced any actual issue.
-- 
Florian
