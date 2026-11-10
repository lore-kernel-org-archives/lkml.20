Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285574;
	b=NbEHFpjMipYT0aP6W9jdu5kCXP05fZnmv4miu0g9zp6hmLaa36FVVNE/a7y8syFn8bCb
	 QOvz0iE6oR/2NVvVVT9ZUs6ngppdSB0I9hlZ4XXWAjveqmU2x82D0pT/0oWjpWBoPgB8+
	 q9MjUYBCKaXsCUG1bb82ZzKIutgtmFdkx4AZat7CRNwOEsZXW4kHFToeR91QQJ+d6oP7M
	 dXXXVwHSdN+YCjpqZ4nzG97AwZ/fG58Neuk+h/yRWVIypzBSy+kRN4O0dNqmathm3J7Mg
	 9HolDbaChihYN4mtsB8PGWeix4mDL07SzqNdMNHtywR4+b9VOwkqyfOLVcJj/sE67TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285574;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=ZTaaMQzGS8QNSoGQ53tnXJ4N7sHJOtT6oTrtA5AXGsc=;
	b=LFM1JfhftXOmMqx+h5L8a7fcGziZm8jvaEizHwDfJGM8B65ijLcJGX6IHYuiFhgfLzAi
	 opkRlXPqvhYxPAi6DkIJpxE8owlZ5EgRX0Adu0mIH5R2w3a2Hhn/HnD1KSxwrLvT2zOq3
	 UCr/yhvDDkLsz9TsdEOVdJk74GoGaYWtI1vaVxC1rPPoo3tyNGWwwzA48KXoznn/P/EdU
	 5JAsJp9Cosf/+tLg8x69oDY2pHPhZ0FOkw/POjzLc4pCZPS+WrZex9CpMewsMbYcZOfud
	 Vtc9e3RC5CMs5HLNshysiQhWxw8+0SiOBd+PjetIpAgUvUe23p1RewOVXx4Oc220NYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=YTofFLaf;
	arc=none smtp.remote-ip=209.85.160.98
Received: from mail-oa1-f98.google.com (mail-oa1-f98.google.com [209.85.160.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B1E606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:39:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06B1E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=YTofFLaf
Received: by mail-oa1-f98.google.com with SMTP id 586e51a60fabf-4a77dcc4ca0so1058636fac.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:39:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794285573; x=1794890373;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZTaaMQzGS8QNSoGQ53tnXJ4N7sHJOtT6oTrtA5AXGsc=;
        b=SMsmt5rK0A5PamygvLyhcaEh/cevPsEDJC4uhNfdVAnm242Zb54xJxVIh4n17lyclC
         /Gv4BkfRpqzkREe2r+zsTdv/6Iua1bQVkUTQW3ekEb94/MEjcdwYJ6H5LyFtXNWM1Akh
         T/873bGG2SWJuUfOH0L1+c5B1j1tc/G48iRujE8/0xEBMYZEwoG2QjMnw3EgDhWHB441
         jggzMzU9Cp7FZmaJSugF8cuixvoQ0MLk2w848wxM2HgBGndnjiSjJB09BXCPk2Tc4bQC
         dqzhZbauS+bugYfRSgzk3tEnB/2qPGYMmDz4cd8M03h6YEoat/bGAnUDx9h6Q3JNCwgS
         M2bw==
X-Gm-Message-State: APuU4Z/MzAeD1u7Y2KoXFMCa6sh60Fa1TWRAX4OevTFIfZMHDigxo6K8
	cfGvjrqd+szkL5/23zQZDYrNd2Shynpn092ryTuuPKSiiGc9Facaa+QdLe7jAh+3Wpa4BCBN7hP
	tjR9070xaewRJN9G1JiLs+XCSkq5qUwwX+5VzYPSAWck0MQ6pYP0l1xHkku4kE0t9Yjv1mnYt78
	POUMsPyYuPLH9MhuIrGoZjoTEFUfYUAgINzPwLjm5UOLn/QFvvvE0Na1KFnzAQcs/yRn50NM7K+
	BkmSDaz1xBYi7AjoWRntGEg
X-Gm-Gg: AYBFou2bFO9QpgkVTGpKbY1GbrEZjy0O8dHGSB+BEHZOPcFePR5drjDQ/q/ivd0EbFJ
	M2hmizoM31PrFBPzZPdcMjAbmjGLS4FDklNoukLMf0rptqgzdIS1X6SATBXAHP1mYFm7RPX2tIF
	0wC7VsKJJ5Jlh+TVe3dD4MJupYe4NKiHlTKDg98cT61OX92zY6o83lEkqVnwjOUAaijv5UgqbND
	lqSQMohyNOFFRvQOGeeF14V7jaKk9PmGwKf2P1Y+RsUYsFB9+WFf8DE4UUUQQ/ctFl3gi0b2js7
	4Qlhf9xBHkbyfF1K/h5I7qHM3fXQejwXTE6qIKP4qdC9vTHIeBSzVz5WcQ97C82HVVghd4+aXOR
	cM+XmarALVLrckX83Cf/zg+DLlfMI32hA0uPJl5VukrwHKr4P9wZWXRg/vwtZjTGpQ3u9tlkLdD
	V1fRMZPgKrKOHPcXNlQhy6E4KWW25sSLI4K+wYS4Wn
X-Received: by 2002:a05:6870:c0c:b0:494:396:1205 with SMTP id 586e51a60fabf-4ae22587c9emr819758fac.14.1794285572912;
        Mon, 09 Nov 2026 20:39:32 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-4ae22d281cdsm12973fac.1.2026.11.09.20.39.31
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Nov 2026 20:39:32 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36ecd5db581so857688eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794285570; x=1794890370; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZTaaMQzGS8QNSoGQ53tnXJ4N7sHJOtT6oTrtA5AXGsc=;
        b=YTofFLafwRDlrOxoYwhV/HcHf2FlSAVCoau3G2jEYYTSXRaro7btfU9QIKGgK1g0KE
         uVe4TQjXluXoirWvpcMeR6WUWwqHx3+UapBdXhJ9fPGg3/e5A7wcsAFSp/jl+faoPPBf
         9nvuY1xYpuLFTF3XMo6iVBD5dDX4wBo6Z6a0E=
X-Received: by 2002:a05:693c:80ce:b0:372:1be6:110b with SMTP id 5a478bee46e88-3751f0780d9mr1623972eec.15.1794285570319;
        Mon, 09 Nov 2026 20:39:30 -0800 (PST)
X-Received: by 2002:a05:693c:80ce:b0:372:1be6:110b with SMTP id 5a478bee46e88-3751f0780d9mr1623924eec.15.1794285569697;
        Mon, 09 Nov 2026 20:39:29 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm3604548eec.17.2026.11.09.20.39.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 20:39:29 -0800 (PST)
Message-ID: <5766e56e-b98d-4df8-9378-4efc078ef1e8@broadcom.com>
Date: Mon, 9 Nov 2026 20:39:29 -0800
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
Subject: Re: [PATCH 4/5] gpio: brcmstb: don't turn platform_get_irq errors
 into -ENOENT
To: shao.mingyin@zte.com.cn, linusw@kernel.org, brgl@kernel.org,
 linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, geert+renesas@glider.be,
 andrew@codeconstruct.com.au, wbg@kernel.org, opendmb@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, jelonek.jonas@gmail.com
References: <20261107161256805UKbBUjg-wlWpCWzE2fBjl@zte.com.cn>
Content-Language: en-US
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
In-Reply-To: <20261107161256805UKbBUjg-wlWpCWzE2fBjl@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 11/7/2026 12:12 AM, shao.mingyin@zte.com.cn wrote:
> From: Shao Mingyin <shao.mingyin@zte.com.cn>
> 
> When the "interrupt-controller" property is present, brcmstb_gpio_probe()
> maps any platform_get_irq() failure to -ENOENT.  This swallows
> -EPROBE_DEFER (the parent interrupt controller may not be probed yet),
> so the device never gets retried and the GPIO controller is permanently
> unavailable.  Return the original error code instead.
> 
> Fixes: 19a7b6940b78 ("gpio: brcmstb: Add interrupt and wakeup source support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

