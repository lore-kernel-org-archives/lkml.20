Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794183274;
	b=SXyjNJGMb4R8JBFKQXLaD6pw5aBAMWhERvOOQVBwF3S7R40jTxsS96cPN+YYbYWG4QOu
	 kYh5m3xEKgXtnFq9Q0YZTHtV5N9yet9blrWuwvRodaznz0adeDeiecu7iqgQjbNGbjG1T
	 JYPIFin9V6U7XwlM8zUgGOh1BHDBjMGouklx+sb2OfIVtNERxzFbuXHpr7yRxrBtTTl5i
	 nmy/faqcIHVtFcOX2TTuWteT1QVKVXm7GaydeJLtbR8jQbP4rL/NbTN6P8jRO5J9cdQOk
	 38+i+5w48Vv6x5ZJufEGecHICEztQUzYXlg436M7ZdI6ZLI/6AAfM+dAQEDzczBpmyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794183274;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=PKbaPQsHHOhvacrmvvpMN5t1cCuxJyoRdKRaZq+8jRY=;
	b=Tuj2uyXAJV5OqZycw+NQvVALT3beQJ4bq7apDrX0NWbrwl/XjEmwjc1CS+mTCP/2ZHzw
	 eaHi+zbqmhVS/CQFc+g0b8HyBH6P2X2SsV9MyJQqdYbxiUe+2P78U60ynUWsJGDTPAFuw
	 c9miKEqCYLe2cG7zKeTLgY4BdAYgHKqJVZ1V40k9R0Es73Iqn5MSQkv4WIGlzmKsQnZlP
	 vQl0CIXJxQyr/lry5pWkX0VGxWJKwVFRHsE2wx6jEtjtwRdFD5H+h2ALPLvdgCnCNDfZ8
	 YlTWWtmKW52r9Q29UWaqjY6+LOgB0Y0McJ+8UM0h2IKTum+r3unWAA2AtW35jJdJrVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZWSuo7o1;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6DD606A320
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 00:14:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE6DD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZWSuo7o1
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8b68e59ab33so237279b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 16:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794183273; x=1794788073; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PKbaPQsHHOhvacrmvvpMN5t1cCuxJyoRdKRaZq+8jRY=;
        b=ZWSuo7o1a8UnAu8ncnh5mn3fSiYXc6RaBhlIVj34wIGCkP5oIgEI3ZIhR1PPCStR99
         es4VkceP4A/YQn5zgOskoYrNJsBpiioGXm3dcDwHrc8p0VGbjsVLtf3jpirm4WdIHvyo
         sfNsyrKFGOVtf3DpRkI6+42XEXYU3fPJOpGpRxgKiZsKwZhZe+DhMXYaEjvOE2B1uIef
         L9Z6YW+NrmHGtXWy9t7wPwht+DC66M6tPa8JwfVAfUPQ1K3aT8E0L2RedPDVvIOz+JCS
         igIyLiHooDBiJvvx/F62nscNzDw0Ur+9CODjcwXv/BkqGwA+wl8dx6yOae32sk1bvulp
         nZ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794183273; x=1794788073;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PKbaPQsHHOhvacrmvvpMN5t1cCuxJyoRdKRaZq+8jRY=;
        b=LhgzfpByFgnJL+Ek10ef/GVoHOhwdeTrfDFy9O/VbGgM4LpzZiYljvCx8Mm9hjs7YV
         5OIwNS+KO3xl2t3jLaqIrDJlfKdk/xtCyI6lUjZ8a0xBli1vq2vGjqCozOvH+ElrZV8x
         FGH7iQfmR/D/rTLDZh5UuYDO6202euVawbH4dtOHTAuPWqcnmKlvNMyofuedmGQ4w7mK
         lGSWIoegQ/ySNk/yhPfJU50xKlT4OWwR9FyhebcuJA2nc8XraKIeKVoEaBPQ2A87dKX5
         99ZQEUNEq3/Zdd7C2Py8V56+ibRE5bp0hI+Z4KQyiX2OWksH5mhAAlKjzaKmrf2C26VY
         j0nQ==
X-Forwarded-Encrypted: i=1; AL+hErH51ApPu3hWyV4J2UdcSxbM013HFYYl2HYHE+B3sjXHwjjYYptc8r5Rk2+dEY0ERxr9SvoTatoxO1MOgoc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FFGjYBfdtPHOcLaF5LZlVzJZpTIZfWb+Rj1DIH0v/g+mcmsJ6
	5C0Oan+mAD+WHvsMjfHGbf/FTR+XUf+OmBPPodkY2XA7yxbc/VlF6jdv
X-Gm-Gg: AYBFou2R+91ZNRdhkNS9fBSV1bwg0AOx0hO6BUde9lIW4tXbQUICOoIKGdMHBgFHw6W
	Nq5HY1zSuKo+I4WSfNP+MM5qjEWIce3HIRF5gn3HAWZZrHGa4KMGoW/Er4Xij1UMuijMAem2phj
	YYWaI0D5ooVK/JlTTN+OO/n9BXIeW1JKKidzY5cZruS+SOlXoO+gKArwF2qGv0764GjpZ8WFKg/
	Fg13TwdVPK0oyGSlxmtBrldKGWzKv4KnHZpEWT1dyyswbv0R5Sv9T6MQvjrOSrNkslwelBAqvHP
	wAZzI3UaDBvd4Gqbo7PdizLAQ/fE7gdkk4Jb4TNFdZ1DnCBHQifDXGA5hBAFlHuaN4l5OPtmWce
	6Iun/8TxWvPAt//44yJSc/SEpeG3ZGc/YqmQsFaLMi1iOA8I16OPpVlCEqXbWH3TQsS1JAjd1Pv
	bOwN0sS6qjLGdt8UY+mPvtbNZiXpHY8UjEYTncsFDGBN65+a/wDzrcDzktUjfUbUkE54Ir1qo13
	yrRFq/69t3GQi6SngGbRem/kVkc47nbE2rOlOeQ91g2z5Cu8ex1gngRn4B1ivH2KgvpLHZ/6qk7
	LChCGPUcJ2oKHAZvf4r6SvME7VUds3W3gUDeVho2lnO7CcTb0+9pMXPqBzvvKoZhwUR9ViY0QzP
	0bhA=
X-Received: by 2002:a05:6a00:9a3:b0:897:ffff:c18a with SMTP id d2e1a72fcca58-8b66c3a7923mr2227291b3a.7.1794183272958;
        Sun, 08 Nov 2026 16:14:32 -0800 (PST)
Received: from [172.19.1.51] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b649821abesm777951b3a.34.2026.11.08.16.14.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 16:14:32 -0800 (PST)
Message-ID: <faa957ac-badf-4027-b86b-e12b8dd4bc7e@gmail.com>
Date: Mon, 9 Nov 2026 08:14:16 +0800
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
Subject: Re: [PATCH 2/2] dmaengine: ma35d1-pdma: Add MA35D1 PDMA driver
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, vkoul@kernel.org,
 Frank.Li@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, kees@kernel.org, gustavoars@kernel.org,
 linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20261103022202.2139674-1-shanchun1218@gmail.com>
 <20261103022202.2139674-3-shanchun1218@gmail.com>
 <au4GkvPTXmcvReoj@monoceros>
Content-Language: en-US
From: Shan-Chun Hung <shanchun1218@gmail.com>
In-Reply-To: <au4GkvPTXmcvReoj@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Uwe,

Thanks for your review.

On 11/7/2026 12:57 AM, Uwe Kleine-König wrote:
> Hello,
> 
> On Tue, Nov 03, 2026 at 10:22:02AM +0800, Shan-Chun Hung wrote:
>> +#include <linux/mod_devicetable.h>
>> [...]
>> +#include <linux/platform_device.h>
> 
> Please don't use <linux/mod_devicetable.h>. <linux/platform_device.h> is
> good enough to provide of_device_id already. If you insist on full iwyu,
> please use <linux/device-id/of.h> instead.
I will remove it.
> 
> Best regards
> Uwe

Best Regards,
Shan-Chun
