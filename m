Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793830662;
	b=5Br5wWwv1L9IQ9Ges/8/Q3/LrV29cHDhkapGbmGue7YQGpilpX9bBLa8bfTXin4XvjMQ
	 KZIvrGzIg/6QxZiwLpAB5TIEvU1lJ1wQxTTzi8rfUU8DRYhpcexIoktGGVRvPexIkfzvh
	 Gyg/V+oI8gau5I66r3Slyc2GmnpLDChkoAfPOToa4wpitBR/WyhM5n7wRxt+31Z85dy/H
	 edGzFcoRiHuHn4cPEzXSDOZklTEdkvKhjEaAOKcUozQ6QiG1wnJXJeWF492MWFfD3LZCB
	 5Nwwn0W57I0sb0lYTBFvFeK0Jck8xppnHqikqSY+KJeHPvkGUE9nptDic1EpVw/Xq9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793830662;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Zy3RXc1tcA1988kqstuh2d2K+SulFtJvQ4wEaNytXWM=;
	b=QSSHQMKk3bQiAswYCq+ogJSqn+Kljkt573oKMVwzy3w5RE9dnmnx/jJ8H8mlTwVp1fNV
	 0Gk6t4AVjy6vhbYkZCgEKt+WnobomlOQPoDEWJySCbkFdMB4SnrftlbOz9e/xWXtFi2pT
	 vVf2DWWMHpBFGEOENaNWEck8UnUk9uMwC2BEzbuvK4us/Z9wCELOZVWvnA0ceGpx+zNox
	 mO7gmwJeevLgdz2Q0BLYF+NBdF9kwe1vrg+Nv5OTYkFJKtldWbSUuZc5QF2z0S2CH7Ftf
	 h2kqWSuYCey8CKPACQHJvdjYIve5fS4JiLV6LM+gXRHd3UpwXvhAYwa2XT4NerLxKtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="qaU5Bh/f";
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35E8606B2DD
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 22:17:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B35E8606B2DD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qaU5Bh/f
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49d05d51553so7737515e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 14:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793830660; x=1794435460; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zy3RXc1tcA1988kqstuh2d2K+SulFtJvQ4wEaNytXWM=;
        b=qaU5Bh/fshSgJu62sZhaTu854dvUlDVHlI1EBoyktBoP8tU3YMkAFiwxwjL8zN5OWU
         rzSX51M6x0kV0TIyKdNQxU6xZutlYvQeFk5rCEpT4ucJWy0PphtNXcu4fa1op+JHIf6+
         OXkXRkflD7otwrVlZbDdigMOQU7c35UQa7/BQYUxXj0354/NN+pRKBUmlvDJaiDcQfjY
         sTy4JM3ukykXS51Rnih0X8VDNN+yCJRGoPf3at4AoM4Pvsw/RsPIpKHbtNU+IVncvwxI
         7gXHJ5Pp41ajcuxoJtz8iIPebh/jU0+le0WGKtEqCfs0eo454TKm6AO6yyl+6GSjfSTy
         VNnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793830660; x=1794435460;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zy3RXc1tcA1988kqstuh2d2K+SulFtJvQ4wEaNytXWM=;
        b=pnu5s+LN4zN0ZwZgZiKWBnjS5BhDc5tVd/cGdqVN1fvRc/5QyrUSufa9Xs9KN6DCbg
         zmyc+z9T+Xl1Gzt8JmKxchpnGKVxsIkh8d4xUvcd01flLcNDilm5GDooNzcD9wksyiB7
         tQgTraRCcFc5A3tM197xEEjzu74/X/KH8GzCya7LiTeZ7jF1qY/BSRASweMhmMbV/cK8
         pKXRt0zAHGNZ8arqouhi+xuvoIprG0IWtMR6JtmEJ/JaGhAqJQG5RxWKSc3ToBVekXXS
         jPh0VXDksp30LCbh6zbAuatgqi15cLRrSHrYY5Xvw9YapHEk5uQTFcbdMik/so1RA1fj
         vm/A==
X-Forwarded-Encrypted: i=1; AKwUvBwtjUqaiAjxyDwQcXmehgBmYU2y49A83XrcCmyJTHmqTwr86rERwm/hSDbyS6ffW3CWebZn61PNQBUWt/Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EKoELu8uYtQjV0iPhYtO71fHApSqVpX/u5JDSsMdEp/F84XQG
	EWWX3tgV3v0U8ZjZsIsPjKgG2c6IxPCcN1c+i3nSIAsf4IrTv4YyHcog
X-Gm-Gg: AYBFou1a/m0cZOPdykpkHktBWi0i4mimZyYx3sC4tvuHRulZ2oMznwURBO5wVNR42TV
	APwh/3U/43XnaEveH70RBIvFCYtfO4Ff9hRMsR6UV54q5+zlvGPI7x3WrIXbcBWOYj/HugaDVsS
	zoBfBw0DcPw3cWoonCjBGxxLEcL7qI8XYQ/dcFIn6e5vk3zMr5Cp+4BOMhgekHOjj/FE2aEXJkL
	GDa74gWh9mtyofTmV2myM2oM3varirVjyj31m7yUkURtaqaYjY+nmoLgFWVKbUnK69tfr81nWyg
	b/BPZoWG6Ouj5rXNms0+q7iQb5RYOKh4xW45UNK2XZojU7WzcDaiFGKbfuTTyfdyfaKVCql17ut
	uQO47O99NVP8B21EJSmGCY4B+G2kAmX+lbYf7laEP7MuhCq5Oj2GW+tN4Rkr19StnuwGAhVgHfS
	hAtXvRdEHGcQoAyJByLW5TqsSqkpvDs8Jflrcy6oCWBZk2mAi1ReMre12JeY2WP1HjWuqvLfRpx
	3flX0aQ+hgdJOCL3ZIlLDJ17CIDOywDI7C03fzzriz1RcdqZCUnoxnVgb4ul/7MmeaqMQC4xRur
	ASeo2YKrI+S/mYWSgTcH70Tl
X-Received: by 2002:a05:600c:1f93:b0:4a3:2f35:38b6 with SMTP id 5b1f17b1804b1-4ac180f1e69mr370561825e9.24.1793830660020;
        Wed, 04 Nov 2026 14:17:40 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56b78d656sm16661715e9.0.2026.11.04.14.17.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 14:17:39 -0800 (PST)
Message-ID: <7b3388a4-31c1-4966-af92-367e1219cb42@gmail.com>
Date: Wed, 4 Nov 2026 23:17:38 +0100
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
Subject: Re: [PATCH v2 3/3] kho: fix bootmem sizing
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Pratyush Yadav <pratyush@kernel.org>
Cc: Alexander Graf <graf@amazon.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Chen Pei <cp0613@linux.alibaba.com>, George Guo <guodongtai@kylinos.cn>,
 Kexin Liu <liukexin@kylinos.cn>, Sourabh Jain <sourabhjain@linux.ibm.com>,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20261104-kho-bootmem-sizing-v2-0-b0d1a834780f@kernel.org>
 <20261104-kho-bootmem-sizing-v2-3-b0d1a834780f@kernel.org>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261104-kho-bootmem-sizing-v2-3-b0d1a834780f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/4/26 5:50 PM, Mike Rapoport (Microsoft) wrote:
> Bootmem areas are sized from overlapping views of the memory reserved in
> memblock:
> 
> * the global area is sized from all reserved memory, including memory
>   allocated on specific nodes, so on NUMA systems everything allocated
>   on a node is accounted in both the global area and the area of that
>   node.
> * per-node sizes are calculated after the lowmem and the global areas
>   are reserved. With CONFIG_NUMA=n all memblock regions belong to node 0,
>   so the lowmem and the global areas are accounted in the size of node 0
>   area and scaled once again.
> 
> As a result, bootmem is about twice bigger than it should be on NUMA
> systems and about four times bigger with CONFIG_NUMA=n. On small systems
> reservation of the bootmem may fail and then KHO gets disabled.
> 
> Make the areas cover separate parts of the reserved memory: the lowmem
> area covers allocations below ARCH_LOW_ADDRESS_LIMIT, per-node areas
> cover allocations above it on each node and the global area covers
> allocations that are not bound to any node. Calculate all sizes before
> reserving any of the areas.
> 
> With CONFIG_NUMA=n the global area becomes empty and it is not reserved.
> 
> If ARCH_LOW_ADDRESS_LIMIT covers all memory, as may happen on arm64, any
> area can serve lowmem allocations, so don't reserve the lowmem area.
> 
> Bootmem sizes in MiB in x86 QEMU VMs, before -> after:
> 
>                      CONFIG_NUMA=y     CONFIG_NUMA=n
>   1G,  1 node         176 ->   92       320 ->   80
>   4G,  1 node         508 ->  332      1264 ->  316
>   16G, 2 nodes       1268 ->  704      2944 ->  736
>   32G, 4 nodes       2296 -> 1224      5196 -> 1300
>   64G, 4 nodes       4344 -> 2248      9664 -> 2420
> 
> Fixes: 3dc92c311498 ("kexec: add Kexec HandOver (KHO) generation helpers")
> Reported-by: Kexin Liu <liukexin@kylinos.cn>
> Reported-by: George Guo <guodongtai@kylinos.cn>
> Closes: https://lore.kernel.org/all/20260904025101.9959-1-dongtai.guo@linux.dev
> Reported-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> Closes: https://lore.kernel.org/all/20260922131217.698809-1-sourabhjain@linux.ibm.com
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
