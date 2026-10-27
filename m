Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793133030;
	b=EwshYpCRPjmhLdsQBl1Haa/vAAy+auEIVxIuHIlLdhF4jv5p1lVIjwvHAygxL2GxhB/i
	 k2D/umdsZuwOKeDl7U5hbTDTI+9FW5VqvH7w5QjIzFDC9hHks7Qq64ynnN4f7numPZuKK
	 ypii6ctzRIYyQAdMKlRQmRr7PIsiuMCi2sTFnD0voRyVKtnVujccxLsxfvRP3kzX+PXiD
	 i02EYnXv+gIg3JS40KnnkMXz4CencY+LNdrMGv9qg0OazuArCnIZOr5BM6JI0Qsq4gSmr
	 eSSVbOmMbfx/ouRH2puYfHhHN51EMm/+dDKxCCakMlWrAeYLtUqtqac0wMXeqTLAubg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793133030;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=w74HKg/oDTjmjEJFvFMQJp2IljljHah9hQnQWOM3p64=;
	b=e3DBPIVq3/jOYdHIqPcgTyvQwziFs2A5KHSCIYew/CHN7ucwp/fLT5svFJU2+LGW5N3J
	 LeMpSia7HM+nPUayk5DD33xVT4NdLxlmhCAO7SH1JsmzjMgO5jKVrhc/+VmYSfv1ztzud
	 5xvZtw8NbeQhhwmYPJ1dy3IakB3UoyJGGMT9J3IruaJCoT3cowoEk1dpvWl1HydyxRcoK
	 oa9DI+MaJg9HZ5V8ivaoWRpqKuNLk4WzXDXftcC0UOuDlOBl3hJSAhBl2CqkCxpJCyviH
	 hueLEgGj4zD4cZAt6Zp/vQeKp6enzGnX+cFciMp46mA/zA5fvkYuZJKzJlLjQPjLxNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=MiUoP6K7;
	arc=none smtp.remote-ip=209.85.219.99
Received: from mail-qv1-f99.google.com (mail-qv1-f99.google.com [209.85.219.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45455606A320
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 20:30:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45455606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=MiUoP6K7
Received: by mail-qv1-f99.google.com with SMTP id 6a1803df08f44-91791ec1b83so2777686d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:30:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793133029; x=1793737829;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=w74HKg/oDTjmjEJFvFMQJp2IljljHah9hQnQWOM3p64=;
        b=au3X4p93uwRDsSaLE7Ohv0T4OY+ChpBb9DJFPFsXRKqzPEdkDFyPgA7ufiSMPT/jzV
         pmvprfZSMOiwpKqHTX3tlWRE5GdaamZoqUdRhiE+ZRxKLeE7eNi76CdOw8gsHiOezxZq
         pBYgK+tCs4753gHfbwVShZCD2ZmHp+YKKiSZWmTY4WY6V00eCAgfiv724u5puSgjlsBi
         07cCO1s58c4Kn5usT23VCanea3Fd63hH8UaU4SRWZTTOQfN83IHPmn0PubZCfFjvIjtK
         Hz+9ladNB00ERBUMCXMVDlE3zBRvEg8OuKyKIUCCViLhlfc14l3XhRLkhZ4nqI819y/U
         +aaw==
X-Forwarded-Encrypted: i=1; AKwUvBydeHRcin+y7wpuW/VfeieXmdR3ibeqVHX0w9LA0RFmtEot24d/7UgpNULoA+KuAkAA+wTuI4HhQo7z+VQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJBHt7JTLRdCz4UVRLjvf3mHPVlx0LG3F6DOac7rJ5KDRs8+Wgm
	g/YAV3YQgo+KZRUPZCY2GXqc0R3hGP+LzXonOv++24JptItrdDCj5yPwIAfN/9E/5k3DZr+78VV
	DH+RzpXHxH/rvCCGzopUIP5Vy8Ym3ElSwHIpzCLdcn6/6Jqv6qJEIh8pGA8KQHdtw+SZ3/rPm6S
	7kHJav9eSbjsMIFcGO0wD6HUVFkkFCyVTSwPdImKX4xvPe2uMN6o+giLUDkloLdNvTE2Hr5HA/O
	+rjzaO4VR6zc6xFDidvtkfTr0c=
X-Gm-Gg: AYBFou1SZIkR7jhNDxOr9h38NCyGzSNS48s1gM1LKMYVGmqbaR4mu8IkykjKWpoF18K
	TgNnIbaaray8zh6+iPzHtYpbm5dJ2YhcYQTkvU+kZcOCoR2h3mpZkGW/0ZLQuHhdcLiGCcIa1o8
	Vs9z4toakkzCo8EWCMWaAB5ssPpO2sKCW+ucJOdrv+WdmxkREZXDvz/EaSFkKgk108XEk5iclcl
	njce67hRjQGVlH3mgzstuS4NYNwxHa26MU74a04rzi0D1s97QsyH4cjDmiHPWXRXGHzsu/rJhzL
	62/53uFLaUU18SuI1yVJEwV0DTR2Bupcu+lLsaC2k0W+vcTuaj4sJVvNtyhUd5ka5MTIDBHKlIO
	NLEKebQWopHXmjx9aN+gr56auiBxg0wckg0tuJQFMuAdPg6s53oROO4Zc3Kaj2Ov4HB9PH2LB8S
	cLtYNZRRiL69D/B4E3eztYzwlkmNmGBpnI8dOm8lpy
X-Received: by 2002:a05:620a:4102:b0:940:cdec:c867 with SMTP id af79cd13be357-94408d509e6mr6062585a.70.1793133028898;
        Tue, 27 Oct 2026 13:30:28 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-23.dlp.protect.broadcom.com. [144.49.247.23])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-940f06747besm158909785a.8.2026.10.27.13.30.28
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2026 13:30:28 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3abfcf726dcso381112a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793133028; x=1793737828; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w74HKg/oDTjmjEJFvFMQJp2IljljHah9hQnQWOM3p64=;
        b=MiUoP6K7na3x3fcnsbpxqS9CwUkCp9Af8e36FkNToyKIi1kD93WwFY/JzWqqUjjCVt
         J17AmeBvRyOXYsv3sZ6oZoGUhAgZl/QVZi06pZNxktrlAho1e7k2KqI7OMCuNKHaFo35
         9dOop1vTF0tWgNqiGqLv/7IiA1yX06fDllmBo=
X-Forwarded-Encrypted: i=1; AKwUvBwUvVRiSDkJ3WijsdkYNFGRI3piO/d/q3IRLvQqeHArbttRUTZzNb4EL8NxiMDP+jgdZ3H7LXARSwGDMWI=@vger.kernel.org
X-Received: by 2002:a17:90a:d00f:b0:3a8:5d1f:59ad with SMTP id 98e67ed59e1d1-3ae580dd6c5mr164203a91.43.1793133027283;
        Tue, 27 Oct 2026 13:30:27 -0700 (PDT)
X-Received: by 2002:a17:90a:d00f:b0:3a8:5d1f:59ad with SMTP id 98e67ed59e1d1-3ae580dd6c5mr164171a91.43.1793133026771;
        Tue, 27 Oct 2026 13:30:26 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae578f19b3sm398088a91.17.2026.10.27.13.30.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 13:30:26 -0700 (PDT)
Message-ID: <057b41c1-4952-41a6-8e7c-d1549d9213c7@broadcom.com>
Date: Tue, 27 Oct 2026 13:30:24 -0700
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
Subject: Re: [PATCH net 0/5] net: dsa: b53: Preliminary fixes
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, Jonas Gorski <jonas.gorski@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 linux-kernel@vger.kernel.org
References: <20261027202230.3539646-1-florian.fainelli@broadcom.com>
 <179313278971.3327.16155760995395298868@kernel.org>
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
In-Reply-To: <179313278971.3327.16155760995395298868@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/27/26 13:26, netdev-bot+sinfo@kernel.org wrote:
> Hi!
> 
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
> 
>   - Whether the issue was actually triggered, or is only theoretical
>     (e.g. found by code inspection). If it was triggered please include
>     the symptoms, like the stack trace or error messages.
> 
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
> 
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

Except for issue #2, all of the other issues did trigger in testing and 
needed to be corrected.
-- 
Florian
