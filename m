Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792511025;
	b=Gisfs1+DhELuci+/Oy2OFZC8o+nCrZWfYQexYDzp0prnLpG5aY9PnQJQYjy//Add/a+U
	 QQrYK/Gbfl1EeKnIhKfmk2bJ53QnBLFQM2a1/uACC6oQsLjfFS7tWbSZXibCLKPMkwlUi
	 dVNV2PvtB9w4Y5k180cOQfwl7IfI8lBgLd4mRlUDOEI77VGg63qACeEEabh7MnfN2W/ht
	 hSaEtuaxOb7nqsCdzaCMnaThnIVhODgNbF9OFR82godT7Swx1PZhf8XV2Z1iz+bbfXOhC
	 mVc+LWU0uF9xW7OmHRTwAkPNJQnTl8LhQ0/483yPh32YpmiHb6qUHbfWWSokMir8Z+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792511025;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=y8SXWaXVp6eHYei7hOYj5YehcGSooBIEj+1T2E6N2dU=;
	b=FlmXQXG05F7/Tmaw0fNcoqIY/bag3JBiF5BzlwKgPOj+5PqSFZ0IKPZ9Sz0sumDiufnm
	 kmY+UDgQkIdrHjAvIyQn9NOmXBeu3gMVM96tA0tSO4vXUOGoVZVh5FhGcd0CB86P6r6Bi
	 i7O7Q6ERvDoUskoNXGfyKL8/Utd+8L6EOxvwZFlWI5hrXNUx93fWaoPD2Jai7HrqjVEI/
	 GawrduS1rSDzJ8i9GI3uFWKOc3ej5pqE09ZPmiH9LSh8pFk4dJH8n+7xgb+H5iis/vMpL
	 p60SsZGhedsO8BPvSUHwzOyUIxWwfetI9YY6aoRZtJwXoOiFy2DjWcrGm3qu0ssK7Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=MkOpQip9;
	arc=none smtp.remote-ip=74.125.224.100
Received: from mail-yx1-f100.google.com (mail-yx1-f100.google.com [74.125.224.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8493A606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:43:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8493A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=MkOpQip9
Received: by mail-yx1-f100.google.com with SMTP id 956f58d0204a3-66fca0709caso2760972d50.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:43:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792511024; x=1793115824;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=y8SXWaXVp6eHYei7hOYj5YehcGSooBIEj+1T2E6N2dU=;
        b=cXRUP5cvWGICZOTI0uadTzWtRHDJzpcvlyZfzA+ZGQ4JfJY3pz9j/6WzXdyerlDqOI
         3QeDU9sD62lvbRRbAe0Ww+1/McpDMJFeOLX2kvW78HqTqs5ly5e8t3QVcIVHFesEBBhW
         cVWwpn8d6MvBTe+kiNJx/S74P8N5ytbzU8js1tzlNZ0jyl80v3w8Xrp+KpUakJB6uJ+B
         YSL3f6pSmQHxaLzDLH7kc4PvAoexGCoo/Wl8r0DQ5o9jI+2Ci9Y+JdfU6vNR15jlJB5Y
         rZnwNKp1pff7hX94aaBUzVLUd1uNt3qzhnvEnrInEliwYsrucQ3FjIZo6d7j8dYKbFPg
         PSKw==
X-Forwarded-Encrypted: i=1; AKwUvBy3yuZ+SPSScTathq0VLPtSeH6qh6X9gb3MB9ua3Pfo2rD4bf/jQOY1ZwukSmzibuHp2YlpDh7T+0XAkLM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIr7xeEckKNgo+buq/2Kt87uQN0v9LVFojgaJPleHl4vkHipx99
	pfTJ/Fsbt/vZaQqraASDg6/P+GwdOhC/BKhcFQnhPi30aX9Qq1jhVIpqYtaYI22ui+IpuNYtQjs
	FJ+6TsgauNuEoJBx1RGCU3dVmAzShQaGhdqt8uGvbFnabcG1OK803IscY9TsSKqXiIxvFWWbcKH
	nmt6H4r9dyBVDbBSDf9cX3uQ/3dI9jzOu36SHoIOOX+VwlRL+oTob0mk+igc5drj+ItNYPufIjA
	3ODL19s6NTqr8/r5YMwiYxP
X-Gm-Gg: AYBFou0ZDK8gcd0VvyP+MIYEhhCcpqX1l/DSMN7XgMG5JFo+fD24jGLnA0dg0bYGrqQ
	tOWcbh+YOGuj++WxAaQnnoWM4BF6/jtAe6PztOdbZ+uFCWaDO2hk1ZsOt8Y0Ikj4vhxb2eMaXRl
	TMzeOKqJrywACWNbzkWWAaMlJiIhJ8ceDAdJ1FRtxs16J6IXEXE2jUtqbBCYd0kIA5N4e5mSo3h
	bIV7ULNd1/yJCtfZHPiYOA30MFs1JOyB1cQJfPL9A5HnewtWFmpKmxQRd6k42sKc5QoHdsJmeDs
	DRfJB5+aJWPuA/VnwrLdxq7GgIfWFq/EV0zN/uORqgErwTcYW1TL8Qpbzzj+5wghJqAI9c6Z+ZG
	pQ2dp5DNwxI6iMh5by9AL48Qorp8OyMmSd0FkaXUFFPxcCavhQqBv1HFvdVTDN4gJOiFP9OdeiJ
	CArWYiPQ3Jac7bUJbdFoUF3Mu3TDKVPrMIdKb/MwAL
X-Received: by 2002:a05:690e:4885:20b0:679:a4f8:e47e with SMTP id 956f58d0204a3-679ca742028mr2233290d50.32.1792511024446;
        Tue, 20 Oct 2026 08:43:44 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-17.dlp.protect.broadcom.com. [144.49.247.17])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-679b1f4031esm242989d50.39.2026.10.20.08.43.44
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Oct 2026 08:43:44 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-533928ef33aso46171981cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792511023; x=1793115823; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y8SXWaXVp6eHYei7hOYj5YehcGSooBIEj+1T2E6N2dU=;
        b=MkOpQip9TRLogJxJsR6nTo1Bj8isvFnwVOu/OeCcjYemELko7EG+FQzTStDXU8sYeG
         oj8ck80CBTsFNFRPCqr6gdgbi88/D2VZPqNlcpAXgcoarJQnhOwak8CepUE/cuan7FgZ
         8509eIgJVYfkr3ae3xzDaNPLQWyzIaySNsgqQ=
X-Forwarded-Encrypted: i=1; AKwUvBx+97BqICfz56i6IiHuXdtBuBQ25L0TN4icyWxRWINtRtr0QhE4aA6inCxB7T7vrKHlEI8+A74zBMdLKuk=@vger.kernel.org
X-Received: by 2002:ac8:5ac8:0:b0:532:a5f4:df25 with SMTP id d75a77b69052e-536460c6fb8mr171853221cf.57.1792511023439;
        Tue, 20 Oct 2026 08:43:43 -0700 (PDT)
X-Received: by 2002:ac8:5ac8:0:b0:532:a5f4:df25 with SMTP id d75a77b69052e-536460c6fb8mr171852561cf.57.1792511022781;
        Tue, 20 Oct 2026 08:43:42 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-536660162efsm62610011cf.27.2026.10.20.08.43.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 08:43:42 -0700 (PDT)
Message-ID: <a111e15d-9bfa-4b38-a52e-ffa1d305fd0a@broadcom.com>
Date: Tue, 20 Oct 2026 08:43:40 -0700
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
Subject: Re: [PATCH net v2 1/2] net: bcmgenet: recover from a failed resume
To: Nicolai Buchwitz <nb@tipi-net.de>, netdev-bot+sashiko@kernel.org
Cc: opendmb@gmail.com, bcm-kernel-feedback-list@broadcom.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, f.fainelli@gmail.com, justin.chen@broadcom.com
References: <20261019-nb-genet-fini-dma-net-v2-1-b85f6b92654a@tipi-net.de>
 <179250090686.3135.17597197349680697960@kernel.org>
 <a033b1e2dd424000dc5669f88bed0c89@tipi-net.de>
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
In-Reply-To: <a033b1e2dd424000dc5669f88bed0c89@tipi-net.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/20/26 07:16, Nicolai Buchwitz wrote:
[snip]
>> [Severity: Medium]
>>
>> With WoL not in use, can this early return leave an external PHY powered
>> for the whole sleep?
> 
> Yes, but IMHO also pre-existing: phy_init_hw() in the failed resume powers
> it up and it isn't started again. Before this patch suspend hung instead.
> Not leaving the half state behind is arguably a better way.
> 
>> [...]
> 
> I really need to find a WOL capable genet board, so I can test these 
> code paths too ....

It should be somehow possible to exercise that code path on a CM4 by 
having the system enter the "freeze" sleep state and have GENET 
configured for WoL. We can discuss offline how to get there if you are 
having issues with that.
-- 
Florian
