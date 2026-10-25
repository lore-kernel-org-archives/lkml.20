Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792955783;
	b=5VllZRrWMX6E7xTebL1G7KFcCcsxeR5LGo3mU+FgwpyxtiWG18ZHLUJ2uV5xLfaaZC4y
	 0YyCcys+w+mKl9XoQLDKkNpZjfRuREWLZu9BD54ziwGtBeaDhbZVmHSR2LsMEDs2ekmtL
	 RbbD7n2lCM9RA+n27qeVWBHje6zbb5H9Jo2fS0DDxzug/yC+R44mp1luz2C0pYok8Fso9
	 ROgZWnGlH21okDMbRy1Ya1fF5DlGHVgIS3J+qfqBDNr+n4mRaZeEpxeXIDAwzQ0VVPCJ3
	 XndKbaeilcBHvLQOZbXuDC0935uCdDN45Y8VNf3LFP/XdyaP2mcolmlhZMSmWzOyUBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792955783;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=LM2FwdNguq/ImKJvR0xsuDikculPVtq7hMnmk6i3FnU=;
	b=zrixitReUdkOstgH45+T9aKOLJx1rIVP1aIvUEsAiJKIsSGzPneva6QtMcb0UheqStcl
	 7Mikv++ZYamZAULb/UcooCpdB5jAhuqknxVnkbriZI1fjGUx1qsFRO9nyP7fop0S8G3dw
	 hgnoPpru5WMvmEE7L6CA2amaIzsVKUlUzk92OjHTXD5bjDySGX8ps4ghx7t5phmBhKsRk
	 Q3cd33l+OEfvc0E2VBVCjmPbksQ+2yqBv612VVZ7SeOWWVoRZYWhT49uzKqclLO8pmC4W
	 ZSr9DZ6rfmWqqUWyfeDqnelVswDEGu28s2ucZE/NGac+gE+o/L3RMpRtUMnckow5+bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LmQqjF89;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B4A606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 19:16:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42B4A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LmQqjF89
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35f1f76ea84so3985919eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 12:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792955782; x=1793560582; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LM2FwdNguq/ImKJvR0xsuDikculPVtq7hMnmk6i3FnU=;
        b=LmQqjF89Fdy3ENWR6BlHs9G6JK8iFLBDxSlyZjjqMxLW9ZCO5hSafen5NswiVziYha
         CJHv36Xuddf4S3CSuuGZTxVoeKYYqfb5tWxGZH9Jkfc7XPH/14OYbuhgeSQY3R6DMK0S
         8xgUD6I4XiDeS0XQ7j5bZR/we66S5VPbUda6Qia77GlsruZ+T0WVjQZtBEj/XVeOw+j3
         061uYSESGZfU0Nh8d0Kuc+NejGMk6iIUQHQJMP+VN7yct+YTOF+5eyw3ZyteMtErbIVq
         GZPxgr189fQzkZRyRcgwr1WA/ZImSXPlQBezsyvqMpt70WaRJ9zJQJwd4xnEhLo33ytt
         0y0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792955782; x=1793560582;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LM2FwdNguq/ImKJvR0xsuDikculPVtq7hMnmk6i3FnU=;
        b=m0hg6GZbS0caXNB4PVbsMLrZ7M8390AEysJRRmISHWhSrttIjTFKydrsguYrr8GdL+
         E34rd/EErsnA2YIijXvUUqGo/l0FBol4VNNUKFUK+1TT+MLRgP0GWDpqCc8xGbT2S74w
         i3sZU9MQkSQ3dEWxdJNMPDGUNMnwCilBkfAFftO2dLaI8n2fLG+9taD3pFN7rlf3iO1Q
         LQ5H6QkC6CZEv/4InXR0f+Tdqg0cfn7V+DklaJA04kQqAZ7NBdJCoTzHHXVe+rNSGPqE
         LXwVeIQJz2GCbQzlV6mbL1gx6L5ZVhd1Odxe/jdbKg0MlH2/l7PGblh+vxww1Zn25Gr2
         kmfQ==
X-Forwarded-Encrypted: i=1; AKwUvBzTadhaLqCN3lcDukx4XNXsLjbDIe7YnlBgC/3mc183yCD5ssltjBGSTPQ4TOZm/T8elkfPSCSnsyjRKoE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJEgcQ6ntDpnGTsgrxylKscHubEKroCGdWLHiuN5KcDwki4VOma
	ON8vkNwEfP2sPvfDbwLS/YzMRPGbbO/ZueFfGxsjB2m/HdFNLuyN/LWm
X-Gm-Gg: AYBFou1GvvVSfiyrglWKl71gNjV2K0DTspl1irKdS7/Nh6HjlUTckgJv4vuVH5U+RJ+
	trofEQAn46kwFggVttjOdiNIfcRGXvoBqjE9Of3ut8UX0wGQuN+oXWYiBW5M9GClHQwp/xT1EPR
	jpPYpchtDny30KkHy+qgiKQUUXO81uthkQ8oGhdu9GyvtmyytUsuzt/F+jLYJeUoBKAgZrlPjoo
	GQCqz5r1jJy4lPueSHOAIsN30QW51wZDP4kv3Tr1deXyMtw+DtCF81ikYkpoHJTOpl+l/eDFTkJ
	2/XFr+8m0ndSY0Uko+nuBNL2rSh5dNkI2zEtCggR0+ijwzkgI8tGkJ93STIRKl41r5XX67gF0HC
	0lLtY6OWJd0WGmxPbbNbvJDBnUCzzRlvsa7Ax0pTbU5FkIqnes5sJURJ9KqpHZSyeI36KxoLg/9
	jJ5Ex/ivyhYB0fDsFLufKyV1spImN6G9pR5ySFRIT2VxpdPLPAgilqBxPR3OB8ZM8u0ic03C2iD
	CvJ69bgMvN+qbRkijMClNyQaY1RPXrI6Ox2XfmwRXVgsBtCfV8QYxRg6qWyVOx6DibZaf5CXA2N
	e1SMR+LO0VQWKFKiXScmO1DsVaIJmAa0bgOiKaM0RprYk5JNL9HstPSJHApXKWuP4eZNRADZzbB
	LUGZprzJvkiEtD66m5YrAgZt6
X-Received: by 2002:a05:693c:4195:20b0:34e:c001:1486 with SMTP id 5a478bee46e88-369e84daa95mr8406622eec.8.1792955782167;
        Sun, 25 Oct 2026 12:16:22 -0700 (PDT)
Received: from ?IPV6:2600:8802:b00:1f81:d121:605b:ad3:d032? ([2600:8802:b00:1f81:d121:605b:ad3:d032])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369f44bd644sm10603999eec.15.2026.10.25.12.16.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 12:16:21 -0700 (PDT)
Message-ID: <ff0e6a32-af88-432b-a976-2a432f625cb2@gmail.com>
Date: Sun, 25 Oct 2026 12:16:20 -0700
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
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-mips@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Bjorn Helgaas <bhelgaas@google.com>, open list <linux-kernel@vger.kernel.org>
References: <20261022163106.1410595-1-f.fainelli@gmail.com>
 <alpine.DEB.2.21.2610250247210.42255@angie.orcam.me.uk>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <alpine.DEB.2.21.2610250247210.42255@angie.orcam.me.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/24/2026 7:55 PM, Maciej W. Rozycki wrote:
> On Thu, 22 Oct 2026, Florian Fainelli wrote:
> 
>> Changes in v2:
>>
>> - implement Maciej's suggestion to reserve PCI resources first
>>    and then the rest of the peripherals
> 
>   Thanks.
> 
>> diff --git a/arch/mips/cobalt/pci.c b/arch/mips/cobalt/pci.c
>> index 85ec9cc31d66..29fd052766b2 100644
>> --- a/arch/mips/cobalt/pci.c
>> +++ b/arch/mips/cobalt/pci.c
>> @@ -14,6 +14,8 @@
>>   
>>   #include <asm/gt64120.h>
>>   
>> +#include <cobalt.h>
>> +
> 
>   Hmm, why do you need it here now, a leftover from testing?

Yes indeed it was a leftover from moving code around until I settled on 
the current approach.

> 
>   With that removed, unless proved otherwise:
> 
> Reviewed-by: Maciej W. Rozycki <macro@orcam.me.uk>

Thanks v3 incoming.
-- 
Florian

