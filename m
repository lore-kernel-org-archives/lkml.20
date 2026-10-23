Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792786134;
	b=IDhY6jpXXBy5IhavMBFK0yiNxrfQqEXRNd1dR0Mp9zCXqIgVaCpi+gAoGLFMghFJPZ9M
	 njzGviI9tETLOGIbnND/2lZ8iOxmKRBKvgoQPgVxklGwjaZBlpvxIIK8NdS8xcjJhWbIt
	 lGjsqspm9CJGpZhHLxRzmzgr/x7jbfIyPp8GAPPHbbnXHO4fhErgX+RqbLtm8NCgn9idj
	 WTc6AOvrouEHY7EtOXfpj4SDTTzvz2G7pCvE2awFQ/vBguc0m8PO0mKr3NoTU6SZIFUdo
	 GyrD7gZwfhHWtxY9r4udu7mT+xRDRbYjX6+Bxzo4GTL4ACXkJYRCARec1Dvdp4XrE2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792786134;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=wTZgu3dpY8yCPiHCSe3dgdypZFuw0DXkkwwCRyTZNgY=;
	b=rROYis2RtPVfPIBpy27JEwcxR80K6aKzIleSwIbgP0/6CTra7+jEwllQowoOHjB+VtL3
	 bJI0AfuQ00YuEmoVrmJ3yI/882nbilGgAFfRwuM779Smzv8IoQKxqOCINFTwJEH8a5d2P
	 WuICbRHDICcokrev0OZjbLMXzvrr4/ARwFEmZiDIQSoFEVT5kLqHIhZq1lBgdKqIlmDwY
	 sxwCf7onAmurd6jMMehce6sI6oNVYvR27FwjzjnabZklAZBTGnJybuEEQ5lEgc2GB5h0A
	 q7X4No70nDDKg9/Q/eH/qBjtGOhjNfTYXbijZubbL9oufttaAqKgPfpc9Pq+DH7Ko7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=YAOvWiQO;
	arc=none smtp.remote-ip=209.85.160.225
Received: from mail-qt1-f225.google.com (mail-qt1-f225.google.com [209.85.160.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F034606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 20:08:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F034606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=YAOvWiQO
Received: by mail-qt1-f225.google.com with SMTP id d75a77b69052e-530e75d1ba1so9928641cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:08:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792786133; x=1793390933;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wTZgu3dpY8yCPiHCSe3dgdypZFuw0DXkkwwCRyTZNgY=;
        b=aFytUVYiYuhebsniKcP3c5J+gvglCOmUo6bfZw+VMFWXDM1l0DRK/v014Q8Ta0TuZj
         PnoLDNjqmxZUOM4bdt9cF1Y21lo0M/V7U3uFMKXcJhlqujb7HJzCDwWnAXLSYHewBEo8
         BX9QKPmzuRR3FOy0VN1hB9D4T7hjQX03nb0zJbaWuqyBqHAtyNQylznGfzWMV6KP3bfg
         q1dsWp8gfyiLLvyJ7MlZi/+v6OuNTvYGCvYneGQ5McHCWDZ3PQ9mGLl8Xi8QByp89gPe
         4hBnAdY2el3XLBli5fjcIHJLBpy2W5Oyv3Ea7bdgLnYZKdvhmditwmXNJcm1mxXUMaxU
         b83w==
X-Forwarded-Encrypted: i=1; AKwUvBwWQoeuoDavVF+RE4DtZ0IxJdJGWi/EdULce1Nsh9CQsq7CX0YuGhwVmSUBPf8NyAtx4vY/rr9sGB/rioc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJywvQ11RVtI06NvklmLddqM1lbf5LP0fDN0miLogisTt6btkkW
	/wPeG6JCd0sPjLdJODsKmYHIlqOBw8rJGYJj0w5TgBPfsWVymRa3Fp2qeDXEhZ2/z75a2J/uQPA
	PzMbwDVyIaynP2bEvRrqNqsFNGXzVkWJbs6aWTRcBsDj9V3aJSYCEwuYmKjgNgbj/t2VHOjxjJ+
	jrNVwb2puwQomEJrc0a/5yV1KpNGcsRZPRks0IfH5ZBPlcmFA8OYvr8eqGO2mbwnb9ZD88n6zX9
	7aLxEyzEzvaiN6meAY3+sMPjWE=
X-Gm-Gg: AYBFou3naO0OQHbyvTsorOga4m0/vd7+mZ+5Ii0ylSm/ubbWUETrID1UKB2Quqd3r+i
	kQU9cmww42YT/BxciwJNMng/p+s6iQ+ZXeWYEf2bsPpAsR7ZRA9jaRpQBdMIAqFRns/yUaSQ9Ul
	kLAspoilbDiJQ6+uFSql2q0NL/VHiN0ZNIFqLZv5yGKKpcSQk1QT7VHNSffQCl67mkVhD7FA775
	MG/K6UxUmQe1UmSOfbQK1Q9vBMMir8LHVfSgdVpilT8WhjKxuj8J2EtidV4V0R0GJIcNg41DIuv
	XE/B5SAr7y2+JwPa6rds3ULxpsSx+Zaffd+tFN41e0iHdRybjJma+ZIZvqQ8cz81SpXo+Q1Qdup
	qETFmTl2A3MqwXG35IZBb7LMFjfgYFofFG7Tf5Rr6oCNGVoDHmekbMz1OMiz79H4d26NPmzWfJ8
	Fi52rn5B3wNOfvz7XWEwkqDwmZsY+SpQpzDk+we9c6
X-Received: by 2002:a05:620a:25c8:b0:93c:735c:2477 with SMTP id af79cd13be357-940ef8bceaamr21481685a.21.1792786133102;
        Fri, 23 Oct 2026 13:08:53 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-23.dlp.protect.broadcom.com. [144.49.247.23])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-9402edfb628sm19213885a.5.2026.10.23.13.08.52
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Oct 2026 13:08:53 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso2130873eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792786131; x=1793390931; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wTZgu3dpY8yCPiHCSe3dgdypZFuw0DXkkwwCRyTZNgY=;
        b=YAOvWiQOx8OoeCvVmx87RYx8/77SQARgJwZOL31KlT+bQIRg9wM+uG3mKqbjMB3+8N
         ppFb1u1Ie8WWFp6DI4x6asTiZdpwsjYTECdcepmJYcipyX+pQh2wPvYUbpKB0yjOFmqQ
         hyozQBJgImnc8AunBOZVjAbPhXyhhW/TQc6Ps=
X-Forwarded-Encrypted: i=1; AKwUvBy4TUJHQI/aty+eBkvTaYMkgitHiqaduGbQwtgyWHWz512IFD8LK4oYFfqHMVIpTwkBeMhXfJWm1udBnhk=@vger.kernel.org
X-Received: by 2002:a05:7022:672a:b0:15a:4155:3d9a with SMTP id a92af1059eb24-1993f6d826dmr200563c88.47.1792786130924;
        Fri, 23 Oct 2026 13:08:50 -0700 (PDT)
X-Received: by 2002:a05:7022:672a:b0:15a:4155:3d9a with SMTP id a92af1059eb24-1993f6d826dmr200474c88.47.1792786130014;
        Fri, 23 Oct 2026 13:08:50 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2eefbsm775867c88.7.2026.10.23.13.08.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 13:08:49 -0700 (PDT)
Message-ID: <bbc66ce1-8d8d-4d35-9314-98fe14082690@broadcom.com>
Date: Fri, 23 Oct 2026 13:08:47 -0700
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
Subject: Re: [PATCH net] net: bgmac: fix oversized RX frame check
To: Jakub Kicinski <kuba@kernel.org>, Rosen Penev <rosenp@gmail.com>
Cc: netdev-bot+sinfo@kernel.org, netdev@vger.kernel.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Felix Fietkau <nbd@openwrt.org>, linux-kernel@vger.kernel.org
References: <20261023005313.3946390-1-rosenp@gmail.com>
 <179271707120.3327.4775409276963055481@kernel.org>
 <CAKxU2N-_Th-ksPst_1KR3W1nYWoZpWR2Sjfo=RWroot5A1RR8w@mail.gmail.com>
 <20261023123637.1aba3995@kernel.org>
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
In-Reply-To: <20261023123637.1aba3995@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/23/26 12:36, 'Jakub Kicinski' via BCM-KERNEL-FEEDBACK-LIST,PDL wrote:
> On Thu, 22 Oct 2026 18:00:53 -0700 Rosen Penev wrote:
>>>   - How the issue was discovered, e.g. hit in production, hit during
>>>     development, syzbot report, manual code inspection, LLM or static
>>>     analysis tool scan.
>> I added Suggested-by in the commit. LLM only used for the description.
> 
> Suggested by is for suggestion of how to write the code,
> if Florian reported it appropriate tag is Reported-by

This was a suggestion, so I think it is appropriately being used here.
-- 
Florian
