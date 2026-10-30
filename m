Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793398289;
	b=beZUL12hU2WpiTRldiufxFkWm5eysdXQSAyTcjmf0bmSRG1M4vXPIFxPutv0MyW4EInN
	 evfYkLmHS6L3158ZISIwNbcogLQ1S+1Nw/pg0KwmIZS0ItO70HqbjnN1LkeRSi33yvOnr
	 T6VZ0qQE4jswfzUI5rYGg/xjJ+OOb9+DuE5bLzkssHpVKn9d/MRdiMbw9Ohll7OuQCvOJ
	 0c6w+ijPc0om+Lv4EJXJWhN+sfT6EfKi/srePRzAliApoCt1Xg0GwRyim7MW5Yaaeoloi
	 k24HlRdBDfXiWz+I1W+8Km6QEfPHfZstZxT8i6orutxhFnWrvPOgUPKiIbVvtJ2bFsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793398289;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=rc4SrQ0TK7BLfqKIW97TuJqq2gED56E31RIywFjvD0g=;
	b=EnBS5RdOokvCimthyOIQL8eN9sfE+eqkbeDo9xrV27lKrkP9TIf31TmKZUGqhV+gRgEL
	 nhc1PsRW1LBydl7OJQKV577fBi0m7Vqc8Ft7j7fCMNxn3T7hlWeasjPJFB8yoZU5ESR6J
	 sjMkvY16UoLmVGAsICWMMt86e/QnYvsvEprZ36+XCog8oc6ToQRhO0GxOUOqhQVtTVVZI
	 dKVfB3SdmSfbfLpcoKBVdXvssrZb2hzGkAl4lRyBUgKRIl3aKEXlH3VCL5QLyZQY+QLrO
	 qc9Y1GYDPTEI6FkA94EQ6kKxkO4heX2V3VmwES6LO+t4X/LULxrdiTwnA5IzSA7pmmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=XEjJWc3c;
	arc=none smtp.remote-ip=209.85.160.225
Received: from mail-qt1-f225.google.com (mail-qt1-f225.google.com [209.85.160.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F54606A324
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:11:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17F54606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=XEjJWc3c
Received: by mail-qt1-f225.google.com with SMTP id d75a77b69052e-5364c951da4so10986291cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:11:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793398288; x=1794003088;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rc4SrQ0TK7BLfqKIW97TuJqq2gED56E31RIywFjvD0g=;
        b=0QTqEA6GOFb7ORp3cmeYdZmRnEfbAmezA9elfeYjCnqT05TDfSFwCIuot2nnj5oD4g
         TrnWFs6L/BV7qWRkaR3AXE0nZN8P09dShw6dGykfKQ+TaWH3Vy28NnkE/pvBoq4bJ8yB
         vO7UfmjZtvZX0XCH8tmTxQHaxg+Rzuk5N2JtXQD0dPqHt2JEiVsaFWRc7HeM5k2LLBav
         V+S0qRAvZHUMK0v4VQYHfkbblFNPicUiY6lDtg+QgHVhGHpcLGDUHmWz1XPyyza3OmRQ
         87rU21O1/GS5b5y9ao5IIxwa5/6uejIfH5ZemUKu4hDhKWEdHuU4pHOvVWHw2i3OLkVL
         HtkQ==
X-Forwarded-Encrypted: i=1; AKwUvBxBGlvy4jKO+YN+83FDwAy9NMRnWD8NZTEYznm3d9cZlwEwkjXyVeGhuFlbnIk72YjVSSJHCeDwF1yS7qs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKsyeCX+fGjKYjuD7J8mvao7bsLEwO9jHCnCnmUlQ5IOeHRRhMH
	YZPZwai4Q41m9Z/7y9fOTHiNcE1oo2T0VCZewv3y6xNWsn1GIHMbf3Ab+/Bggc9Uy2w2qaH69sK
	zPfL0JHqtJI6M5CFYGiVzW8VZLr6bZ/YvEkKej1cObz6WvwSnFT1LjRxPfuoBUFk/0QlBPWY/rT
	csorWeoJQzYc2ni2PtwvVYJKVTmgxcFYbZlpfdE3P4w8ic8JHVJDYwqbbpeL0n+lU/Y7mnkEHV5
	CxijAeyIWkvs4Q7yfi+VB9rQjs=
X-Gm-Gg: AYBFou1L738WSzmL7ZgO4UnPo+73kZehkoF+B+IAQb9LgCLQOfRlF3B656St7/y61nR
	cyFBP31p4Z1JUYRlPfxZ6F9/KiY8UtQ4Qa7Y4deLtq9A3Aq69iWANg+nFWoXwbN2S06oZl2Uc23
	lkXkO3HpuoiE7g8rIwBCzwCW85YB506TQ1Vgw3ueh2TcLfg2G4BccQrYMsGYj2sV/yY9PYxwuxb
	Xyw8sdaGHdEzqUy6KFyb7UoqgTS/9hafNGl5OpecUCFMf4XvvFaaa2Ylpcn4Zax1eVbXloVJCMS
	v3wAVyz4xq90fRsFt345DcS23h6Nc3DcjC15apVjzIykbQq2l1rP9DGC0dOCbB/H3v4uImUu3Sd
	q6jaVKIjP9U9Q9mNtf1mjrWQlg1em47DNEcOn4v7p1hI6TLwbIkThzh/cEXIcHR3g7EUqdF+wyj
	DaPE2sWmmsEt5xWoZU+kz1r7FT7tLSJF84ISRdG/Ji
X-Received: by 2002:a05:622a:511:b0:536:9684:36b4 with SMTP id d75a77b69052e-542b7b0b9bcmr59487451cf.57.1793398287771;
        Fri, 30 Oct 2026 15:11:27 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id d75a77b69052e-54311d882b3sm173611cf.22.2026.10.30.15.11.27
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Oct 2026 15:11:27 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0d568830so2224224eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793398286; x=1794003086; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rc4SrQ0TK7BLfqKIW97TuJqq2gED56E31RIywFjvD0g=;
        b=XEjJWc3cuSFPPFMHnSJt+rfZifgBodpIIxx6ahIAZcpgTTXOmHgg+J2xa/KK4cIIpM
         wZ4bJwEujynBsDc6NQzJOhbT2RBp2uGFj+jmrhWmrBLq2i4hKlupypU0cpy/JuLNQWwP
         NlS08YkJl9DYFVvsXZDCZ4XnaDpZqZFFS2bI8=
X-Forwarded-Encrypted: i=1; AKwUvByWbYv8i+mllAFnyjrpY4bY7PMGqRIFAHYdJmAwpLWLnlBAQpxyHVmB0qSxLFQ7+WQG8pEmyBommYdEMXU=@vger.kernel.org
X-Received: by 2002:a05:693c:65d2:b0:36a:1f4f:3e9 with SMTP id 5a478bee46e88-36a4238badfmr5088014eec.20.1793398286353;
        Fri, 30 Oct 2026 15:11:26 -0700 (PDT)
X-Received: by 2002:a05:693c:65d2:b0:36a:1f4f:3e9 with SMTP id 5a478bee46e88-36a4238badfmr5087971eec.20.1793398285637;
        Fri, 30 Oct 2026 15:11:25 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4291e38fsm11413522eec.15.2026.10.30.15.11.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 15:11:24 -0700 (PDT)
Message-ID: <3c3ba65e-1f9c-4afa-95c5-925b972e0e21@broadcom.com>
Date: Fri, 30 Oct 2026 15:11:23 -0700
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
Subject: Re: [PATCH net v3 0/8] net: dsa: b53: Preliminary fixes
To: netdev@vger.kernel.org
Cc: Jonas Gorski <jonas.gorski@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20261030211617.288562-1-florian.fainelli@broadcom.com>
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
In-Reply-To: <20261030211617.288562-1-florian.fainelli@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/30/26 14:16, Florian Fainelli wrote:
> This patch series contains fixes to issues reported by Sashiko on the
> b53 PCS bug fixes being submitted, and then some more that came from
> code review and testing.
> 
> Except for issue #2, all of the other issues did trigger in testing and
> needed to be corrected.

Apologies for the double send, had a typo on netdev@vger.kernel.org.
-- 
Florian
