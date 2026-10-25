Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792955999;
	b=Awv/E8E26+sPNicdt0ULQNfjirRLB2Q5ekpgCknaeBBT4zXcGiN2FJsOy7ywz+lJNK/F
	 NdMAlen6mzpkF0nLNbRTBKV8OXhByRex8rgqiWtbJsidGuNFr/aEnmnpsUeJFxtbNxZGB
	 ORuoJYu9IBVgH4oKQdNQeYzextBCkyaB1PR6EJyZVNfVJyKyaxxvJPEUy51LZtCA0zNZ4
	 kUnWKw/Caf8bQfyBij40hU196CHxWIv6kIcwmFy+Qm2GDd8VYEHR3eF7k+yVZ6GxstPL3
	 IYjP/FqL146DFhVC01JP7esfxJIkboosu5Osc9R1w3AhNkYY1vjEBqftYAhz7y1rFIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792955999;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=WCgwFDtfTJTyMxxPB/i3TG8L8ZoI2yM1l0zgDGnEJFg=;
	b=jRjaRJtzdfhfQ7kyRvURu+XNS32SkDbs28I89dWApHo0CGkD9Bqrq2bzwkGNKvnudpbp
	 DrDf9hG0c9+bR+O/fjWSBKseRlOFM6qNyo5Qkyj7ey1LZ1kp2N7EhjREFO/ywWclcrMrl
	 E89dXCFH7aEx8FEEZ5RdfcimAg4OUHJUVmQpqQqHLBQ5hPepn6vFIngARbZBnSztkgg7x
	 5AO2zVjnlR67/i8LL22XOslySAbxEna0KUfatNtiTajObYKIszx23s0idCfdS4WX/JeOi
	 EapOM3PQIIxIJ9GTw3hWdO8d0nZQd6FHp+qWrkPPbsAYU+7G55/bS4sNBmmQHEcD6Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KoyB3i6x;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9834F606A334
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 19:19:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9834F606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KoyB3i6x
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-16079d54c17so1811851c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 12:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792955998; x=1793560798; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WCgwFDtfTJTyMxxPB/i3TG8L8ZoI2yM1l0zgDGnEJFg=;
        b=KoyB3i6xaZsFLoXQqvdb5LVBXh7TLCe6dqoBruoOd/Qm22FpuhOLM4WIndM9mn216G
         tQDu9OCapXeKxZrPUNVZY64aRJrYST3s9dW7JHQi8KWwg6tx4HNc3cfrmvVkUWzBMKT9
         gbGMu93pLc1SD1Ht55DL2C3g6Fy/FCykETBWTSdadOdCbBGZ65s/P+ZA0ydgmKczdsOE
         d95BE1N5CB/m/Wi+CPKboOIBzKc+XsWxQd43SvPfFYPcMnQ7GpCkFLigFvAHbtd1RH06
         3CJBQ+D4V6t8WbaQec3ldPIhT9yhgfJJh1OVs9YPU0sQt9vA3Pi+YX06Gcgu4YDD9ph0
         ffMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792955998; x=1793560798;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WCgwFDtfTJTyMxxPB/i3TG8L8ZoI2yM1l0zgDGnEJFg=;
        b=bNdxpB8jhLFHfEf73I6Hq7Y3o8hLICRh+D5WFHW6NoV4/VP9kqyG7oXP6/Ds0N5qY2
         cHGbMnztoaLJEVHREWto2WfqE/7RA4XJsrHDOXcz7XWVNURbKm/j5dv90rlsE3l1/pGd
         BVVnBNcMTfNpQ422b2BfovzIymqDtNPcOx0/MMtgJotKq4VFJ9YktqBG74lgIJ19wuu5
         zqN+5Nnm7b1Qz7U+I2OQa3AqlFn3d5YFq4m24K2PX5zlj+LZVGSrZfX/pnflPSSAB05/
         7dvv8Kb+jyZjL1ipPdEpCcKVKCqh4fdBf3AP9XsZsRHCHAHQAJnaoc1eIgCr67Uniu5z
         Llyw==
X-Forwarded-Encrypted: i=1; AKwUvBzqcrU2sH1v35IKb0fe2h/Actvl/iKwqImeKxPh+srluqzw6W09C5EBnF+hONUPeY4N0weIIg8Vx3cM3xs=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3/oBZOhSNzKIQgXbcfDW6JZWzWDK5UHw+0fcIegqyEujnzPZm
	f8TJHWbkBwtmEkmFP3UNuLsXLEPM1DNmoZ8csKe6kuFSrMY9iASyfQssEXST8eaQ
X-Gm-Gg: AYBFou06hpO6IlRUjvSHtFmnujDNM4aQFj4wL3IeCwlu3AenQvoNJrj+obH5DlRhixH
	97nNxHy5CuVwPjFmnTneJ5obGdeJZdMJQD65u4TfQ/ZFP7ZXrSHzide/kJ3VQhrUimTfL/RQYcX
	1QahHcG75c1aG5aHzyzjoP3dlsBAp+GK0RITPUx938Z42K1+nKKz8f+3ZW2iKVdK9n96iUE2uva
	tDoQaUZQiTh9pJsYHxLZcIuNgzEXP39+BsNZ7kPmYTDmhWGdReoTLn1INi6+1egKDmDYcdA7HJs
	/F0tMPD4ecQb+okaBl/rsT2Gk9ewKcmfcH3jlaMz1KE6wpeCuPOFMkwPKtp3ugmL6/DOEdJsWDO
	4IZnCt5vpVDOBKPk3LCrFulBOKdOo9jVQjZdlfrnc9s2if8urJOCsrkmq8qcejkXC5Do24BoOpw
	bMn2hisV6bv4wyEETa2rA88ox4w4lzYGoJal2rp9HjLpNUlCO9LtMCfF+GxuZ3qBnZR4pqXv8xc
	o5vDRGBhZJF/TlKXu8N+WkUw3UpQboqpz2C7z/7qacLRC4bDu3wZxIIz28FkVGxyVeNOzyUBOfZ
	my6nONO7X6MuZBX71VT+Pe80c0P0iw==
X-Received: by 2002:a05:7022:5f14:b0:144:de98:eec1 with SMTP id a92af1059eb24-1993571a23bmr6933077c88.11.1792955997486;
        Sun, 25 Oct 2026 12:19:57 -0700 (PDT)
Received: from ?IPV6:2600:8802:b00:1f81:d121:605b:ad3:d032? ([2600:8802:b00:1f81:d121:605b:ad3:d032])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369ef6a71easm16319342eec.5.2026.10.25.12.19.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 12:19:56 -0700 (PDT)
Message-ID: <96828518-81e3-4c58-b9c8-65f46beb7111@gmail.com>
Date: Sun, 25 Oct 2026 12:19:56 -0700
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
Subject: Re: [PATCH v2] MIPS: Cobalt: Include legacy IDE ports in the PCI I/O
 window
From: Florian Fainelli <f.fainelli@gmail.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-mips@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Bjorn Helgaas <bhelgaas@google.com>, open list <linux-kernel@vger.kernel.org>
References: <20261022163106.1410595-1-f.fainelli@gmail.com>
 <alpine.DEB.2.21.2610250247210.42255@angie.orcam.me.uk>
 <ff0e6a32-af88-432b-a976-2a432f625cb2@gmail.com>
Content-Language: en-US
In-Reply-To: <ff0e6a32-af88-432b-a976-2a432f625cb2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10/25/2026 12:16 PM, Florian Fainelli wrote:
> 
> 
> On 10/24/2026 7:55 PM, Maciej W. Rozycki wrote:
>> On Thu, 22 Oct 2026, Florian Fainelli wrote:
>>
>>> Changes in v2:
>>>
>>> - implement Maciej's suggestion to reserve PCI resources first
>>>    and then the rest of the peripherals
>>
>>   Thanks.
>>
>>> diff --git a/arch/mips/cobalt/pci.c b/arch/mips/cobalt/pci.c
>>> index 85ec9cc31d66..29fd052766b2 100644
>>> --- a/arch/mips/cobalt/pci.c
>>> +++ b/arch/mips/cobalt/pci.c
>>> @@ -14,6 +14,8 @@
>>>   #include <asm/gt64120.h>
>>> +#include <cobalt.h>
>>> +
>>
>>   Hmm, why do you need it here now, a leftover from testing?
> 
> Yes indeed it was a leftover from moving code around until I settled on 
> the current approach.

Actually I take it back, it is to provide a declaration for 
cobalt_pci_init() otherwise we get a warning with -Wmissing-prototypes 
since the function used to be static and now it is not.
-- 
Florian

