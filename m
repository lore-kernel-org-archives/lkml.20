Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794008483;
	b=DLqZj1pVVWM02RU4HhOVsQD5MNYcpO55VUOrNwBaYJP4GERQ3ufr+wZwnq1mx9BD9qEs
	 Ur4tZTOnGtnnTMiB4kNaAlbJsVV4otMatREFxkTdeRNfb6pII8oW+z5ERrKJI6jsQZV1Q
	 +OI/8Grpi1ohNuWrxqG3OV7KBYmDSFH8DzGzc0mooqUF+ah0LOT8Lb8nd9edcdJitWUfl
	 zOMlRFmHC+lnJp5TTbWm3x++t6oOnBGXI/tvJQvQ3PGRtg+Y/czgjamG/ndG38t75Fe/m
	 uPDv0Q8trpYwavqLai1ln8aEsUzs0pW1M8lJVo+9xMYAx05DCXgaJDv7rNnE6ftdlYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794008483;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=hMBEnef/2C6VY7J0rq6xUNhjJQKuBdQi9fpeFe3UBP0=;
	b=Gt/ENW9eKd8Gk9hx+XI5dMrGlQgrtRqyNQbD3uNxtuUQ07w/zu53LHXNyBdclL9Lr3Lu
	 VcTCLuCIBeLuOD2L7NdHK5BoWUc4VJ03Z73vBtpD2vZStj3eAs9cxEdU/tByvCRl7MhbT
	 cK+7NBh01ZOUZlW+YtQSaGoFNfap6N6HJQYO37YDAPhZJ5FRDZjDD1UU2ebe4A0U/2Mgm
	 v5DYm2PESwtOc65b69sNDvoOIBhboOOyIqcPPtzVzR5Zatzhs7l/P3X5kwI9bNj/qYHqC
	 28fmzhWX1L/QoZwcF013tONCHQxLlkIS7Cd/V6XClTJ6nJNVnQ5ZWY4MxnZcN97kz6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=LhhOovMu;
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8702606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 23:41:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8702606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=LhhOovMu
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cd6a7b62ce8so491073a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 15:41:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794008482; x=1794613282;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hMBEnef/2C6VY7J0rq6xUNhjJQKuBdQi9fpeFe3UBP0=;
        b=NZwca9xQJEUWwXz/3zAnCbKoE8iz/8dnj3tI9s7/T5/TsG6EJX08XTj0m8EngeyU6W
         FySGTomO/zpJ88gQqRz1wsanteW7/huVJygpRu6LQgPjQVJWcQojwilBg6gyri8K42c9
         Z5dpgB2AI8Yd3j1pMeArCx3bfG+ePF9KG1yqsgWS9/97qFUKEzSFs9ER692q29OVA1Jh
         uNsu7FJjgVu7P1yOs7gogcKTO2ifqCs0v7ekcowA+Xn/kb6O4BBOasosGmuIw1RbEyv/
         tuWiRs1QXDfRfME5y5/qD7Z/Lj/mI2VsV58gXGxNzwYaxQkvPDEbu+MsyoFEL6YevaeX
         fnbg==
X-Forwarded-Encrypted: i=1; AL+hErE5+iyx3dvQHQlGfuodVEQ4Lo63AgbuMA5/GNEjPNrXTdREuS7afU5lFVER09JQhsaROarWk6Lcc307w0w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Jte8MErisEq/ExdLxd5tRuIVjnFASDJMtp6HubjlRaBCWROE/
	HQVKUUWbU9LRm2ldKnyJg4XJ2ChBuLYOu5EoeruX9YpaQxuTg+ssDfkZT676V7PjVvdPtum1gA0
	pivkmqb9ZWc8E+Zw1yvgdR7wH/64d6XoZ6T3dg7f6I8oTl26YHGzE7Nu+Ubap1oVHnrQwXyJa4X
	C11GsnM9BQll9+DOlYeBHk8/nXHHIdRCmQbXF+1MsTj+Cy1HQhplkm84GGAdItbgeeMWumavaOf
	6tHdhramujkwGZJpX/Q0y1w
X-Gm-Gg: AYBFou2msM/ONbdOrzxkDLAZ2wo1eVhRaTLCUWTM1i4CaNRW/1ud8iopSZKJrJ18L/U
	XWMF7irlxmNapL4hzyyiPhXk6GIhNjBcU7z/UQzmiqYO8rfQGvGsPXJcKFYK18KkPOGg/l8oU2l
	1jhv1qIiO2TUhzXoGFPwEJN6lOo1ht9MCr6CdHBpG4n7PaRnOREVlKikchR6Tc1rQw0buzG4jnT
	2wRl7ZQhdDbRMzHmxCBQHRoYVwluDaobAQOi2JOMzXQSRr6lnmPXGFz2UFOO64swvZP9luerKmr
	Kyy6LNMeKXUoejEw8mUWqrYHMqRTX7wsbcwPK6/QZ7JxC+2h6NLzOP/3xSsB+T4PSpxU4/DIv5k
	8bMUdQNGRz5Oz36U39oKR6ozDvyV44r/gtAnAinwL1MKlcsodDWwIR9ZiJ09JEeyCRkUg4BpC8v
	9xiVZ/2qKDF59dVh7O9VjStaVcydvf9NqlDPs9rApn
X-Received: by 2002:a17:90b:3892:b0:3ac:77c8:ac29 with SMTP id 98e67ed59e1d1-3b0db6d78bdmr3585201a91.15.1794008481775;
        Fri, 06 Nov 2026 15:41:21 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b105933801sm395678a91.7.2026.11.06.15.41.21
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Nov 2026 15:41:21 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1a5005fd0f8so1304820c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 15:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794008480; x=1794613280; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hMBEnef/2C6VY7J0rq6xUNhjJQKuBdQi9fpeFe3UBP0=;
        b=LhhOovMuZu8O/cV/KMOqIDymxCHCF9r5j6iuzZH48q2TUEr4aCpxFKQuGawj5j/giY
         NXF19i2AonMKD3YZLBKHRAMCEV4/DB6+owDncLBI4PQg5suUQQjinjcyAMHi8I1UYWwQ
         icY2k2tAIRHeka39/p3GbGCRoeuQqbA93fXNs=
X-Forwarded-Encrypted: i=1; AKwUvBwMvU8/FgOm2bvrIrHbakwYspTnanTbIOjVYvzqCnFRDYzK1wRBJBacqXBWo+RXmCjUuCyQAHWQQi9mwH0=@vger.kernel.org
X-Received: by 2002:a05:7022:f101:b0:174:cf1b:235c with SMTP id a92af1059eb24-1b25d38507bmr4463655c88.43.1794008479821;
        Fri, 06 Nov 2026 15:41:19 -0800 (PST)
X-Received: by 2002:a05:7022:f101:b0:174:cf1b:235c with SMTP id a92af1059eb24-1b25d38507bmr4463610c88.43.1794008478957;
        Fri, 06 Nov 2026 15:41:18 -0800 (PST)
Received: from [192.168.1.179] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4d36efsm9170226c88.17.2026.11.06.15.41.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 15:41:18 -0800 (PST)
Message-ID: <0d59cd31-909b-4ed9-ab86-ed6ceae6ca03@broadcom.com>
Date: Fri, 6 Nov 2026 15:41:15 -0800
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
Subject: Re: [PATCH v3] MAINTAINERS: fix bouncing {sbranden,rjui}@broadcom.com
To: Jiri Slaby <jirislaby@kernel.org>, Ray Jui <ray.jui@broadcom.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org,
 Scott Branden <scott.branden@broadcom.com>
References: <510bf9b037c522ccfba270926c95170291115ef3.1793602003.git.jirislaby@kernel.org>
 <CAJ8Y1dTUmFXTHnoPuYMNKULVdaQPtr4S8OiCqhHKZ05WeyGCFA@mail.gmail.com>
 <b9537359-9558-43b3-975f-de2a1017e463@kernel.org>
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
In-Reply-To: <b9537359-9558-43b3-975f-de2a1017e463@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 11/5/2026 10:09 PM, Jiri Slaby wrote:
> On 02. 11. 26, 17:20, Ray Jui wrote:
>> Thanks, Jiri.
> I am not sure who can pick this up, I tried couple of recipients without 
> much success... I give up resending this for now -- you will likely need 
> to pursue this yourselves. Maybe feed it through some your (broadcom) tree?

Yes, I will pick this up, thanks Jiri!
-- 
Florian

