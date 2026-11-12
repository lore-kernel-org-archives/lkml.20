Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794511316;
	b=g09So3C94/XhgO0xS+uKjpyC1/V1WwPHnet2DMMwLneIIUun6hkeYoGEMEa4Y8T6kgdL
	 VZQkQAqISL8wgDDZP480Mhoqfj9sv3Wnynm125Tc8t52pt3+SgfzgI8zmhCEZJ1CgKGa7
	 0P6u2lMpCQIy7klfv0UfHm0JHmlolLc3WHRw4rd6++HUVPULeykwloRwsH2OFzPGAIPUH
	 T/A4A+7yT7ybO54ENbC2nCYGubp4dsupvYrG6qPtQypO+RBowm/CajYmzzFqgyN+SknPI
	 iK+JqLJMfPY1e22FLlnsv+PB3ugerD+wA2Eem/Hnf3AvySnJf0vljLJ1dzRploLyIyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794511316;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=01sL97ssAo9+QnpHtaCzSuqPvKdXMurbEXs7EQQ6WQY=;
	b=gcVWk+5GKXHwPeB9kjsAkmTiC0pYxbChaAMQEYd6JW6mc9Ef8K+44derXKyarRzbiO6p
	 AqX0oNOGOcTEcUJ/BIwJrUgUmhCybE5RosY2HQuo/QQjx78x1dLcwIYISeMh8dYQmKdD+
	 qy39aoZTsw03+fZQsOzgUhmKZO/hOnUW+O0toksBGeuuA7+xTFqLrJ382jIEwRpP6zg1n
	 Z/q/6Kd4sICeGpW9wX/YGnje8xnqmDs5ZeF0pNoFPHEACVCfVZvBZN2wBHZGMkq14BFWc
	 0VCNTTH2DBj2pAvHSM+awv4E3HAP4sWEiwoMjPTmZQZL9Xbn76UIUZOx8RxylFeCUQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XryGaR31;
	arc=none smtp.remote-ip=209.85.222.176
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EC1606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:21:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49EC1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XryGaR31
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-93e515769d3so8854885a.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794511315; x=1795116115; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=01sL97ssAo9+QnpHtaCzSuqPvKdXMurbEXs7EQQ6WQY=;
        b=XryGaR31B5ngrL4TkY5JKI8s/l0YrSvOED2HMkhUaYiyQcWTWrU8K8NbwJufCLwSBA
         7YxQKvHJkNdUZaV1YTiuhCc9sOeqAwTNjELeNQGUB827v/6LeB4kroWT0MdJjf95N3g/
         403nAVntpIL80gVaOkshrX878wldPB733TJLTp+7IPRUqjSS4aNGfcZFfWDGwrOYoaFi
         ChRI5a8Yu7UbHCkQJJ+LxHWRAKdfLhGowvUWfOUxjZGmiHV0rfYVHMRBtVfqMwk0sn8D
         bp9qDgD+Ne1JWHCxIN2l47sXnOZLJjuSZkqaDJUWFtQQmb4UROflT5qu/rpeXtPaPBeR
         GCCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794511315; x=1795116115;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=01sL97ssAo9+QnpHtaCzSuqPvKdXMurbEXs7EQQ6WQY=;
        b=QxGEazbutHesb1TYHEFjd5Vm6NcpgyVJJ2CwTiPGejfdCPyzYEQb2jKGvPdrP1J3Hr
         3O2o8O3RLB46RMD5Q4abdnmhlLZ8NtZm4jcbJY5CtYF0MKXrcbERilnoFeoPMpKrAvYt
         yt/NI7r37wRbFfO2PJRvZQUY62CjJCc6ZcOqjTmzHc1GixyIq8LsCRXMkMS32Q1xsoYJ
         2VCyYIM5La5jrq3XiHVDm0pAdOD5tnvM546+OVz0fO0H8NdjtBQuFbmkZD+gmC3vERga
         SMZYiT8QDajTmpXLGlMZEVInQjCJ/OyRt46UoReHyj1rFnhg3V2ruLqv2R3rOQnmkZvO
         ZJ4w==
X-Forwarded-Encrypted: i=1; AL+hErFr43arqNDqlZtu70grkCbWP+A3IlmN7/WDfF2voCzl1WhEytvTP4ghaN6hIMPPeqyHFumgChAz8E8Z+ds=@vger.kernel.org
X-Gm-Message-State: APuU4Z9J6AIExvxxSHmB/IOff98YtJKEX657m6amT+CBIv9gDW1w0p/0
	vuvsrzTKRFW+z9hnJEu7n7F/BIokcx3pKGMHVXI/HRtxEmPetK5DGnabz0gYaA==
X-Gm-Gg: AYBFou3g3QJFUG2MlpIurADOtIzkhlcO+QAx0gl0z8a5aUkzsJjR2EWff90l9i2B7An
	iKyiaQYBJXZVhZA5xfjjVOgaAh+tWGjFn8VNUiBbnfbcWA8EzfoOiSx8U/MG08Ygith4IPgXVCH
	/u/7LE6t1HCKORMVAaLquodHuvG9LsxPSrlRF+CbNaXRzp78Tlfo/Bh5dIP649qj34TMdXaE8ly
	B0maFeiuFbH1gYQ/+QcW8Ggrbs9+axeD8r7WYukTmQEBF2fFmwIWk+L6lWqOXZjUOv4Hl7MVydO
	tB8+Mx2JbebC5GTtQZjucYIBJLK8ZLhNZSPvxY2ToRvaGf36UclRMcep+dMl3Wy2g9lDntnNVBz
	mfRtCAEmcksu8SWu7D4Kt6yGhDbkTC6wMfkNQ0uORNAEOkJE3TCM+vmidBCsn+CKvM34ZIL6kXo
	YYkoYO0wiwTGEAzReLEeN7bzJq8r5rLJki9Gjj+KWzJ5sLdjSazPkYyKa4y5OgQYVFoLrf06/L1
	0EvzfYOw21wsv6vQmlEAcJdD5VYOPm0oyKcks1rYoe8V+89GdhEJ7aCaayujeQ5KPpSgfNU/p6e
	un/QxRfagAZfmGZ0MJP3xKMcRps62yFc+jS6zuMUT9FKUMMMZIg63CMX
X-Received: by 2002:a05:620a:4109:b0:93f:3e39:efa1 with SMTP id af79cd13be357-9494bb85894mr67625385a.23.1794511315258;
        Thu, 12 Nov 2026 11:21:55 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c80387dsm8362885a.13.2026.11.12.11.21.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 11:21:54 -0800 (PST)
Message-ID: <01705c8c-2043-40d9-bd4a-446081eac4a5@gmail.com>
Date: Thu, 12 Nov 2026 11:21:52 -0800
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
Subject: Re: [PATCH] MIPS: SiByte: Add missing sb1_cache_error() prototype
To: linux-mips@vger.kernel.org
Cc: macro@orcam.me.uk, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 open list <linux-kernel@vger.kernel.org>
References: <20261110223651.2698860-1-f.fainelli@gmail.com>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261110223651.2698860-1-f.fainelli@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/10/26 14:36, Florian Fainelli wrote:
> Fixes the following warning:
> 
> arch/mips/mm/cerr-sb1.c:165:17: warning: no previous prototype for ‘sb1_cache_error’ [-Wmissing-prototypes]
>    165 | asmlinkage void sb1_cache_error(void)
>        |                 ^~~~~~~~~~~~~~~
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

There are many more, let me squash them all and resubmit.
-- 
Florian
