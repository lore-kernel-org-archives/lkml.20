Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0F8511192
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 17:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788544673; cv=none; b=YzYlU07wCs99OQunHMvgVN8cV0ls1e4fbJbkmzlR+oD8Q8M231n+kaLEfwRMu/bexWNQGqPmwedAzscGZ0z7VEVyhWJKAHr8p8FhDp6SEuS4RvDX5IueROYuI6MueR5kfKYdCJspqVs4QIQeXYAfs2+v7vtmwaFNBOcIb4O6wgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788544673; c=relaxed/simple;
	bh=SSdKA8aPi6Eb8JDii0pSei85yNM9d7eeM43+xAQL63M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IaWcCGpaOJ1qhhXSwdLC614rCoFHsDXhpEbotHngnTt6xTr7P8enl23CRXoaPPh6bCl3E7CemMWHxrK7MGif7mPkMHwSLYrL2URhVa2uYKDDQ8XpOaZixqpuynIcohc4Z+He3AypfYx6RqzwR8eMzz2OmW7LrGnyRuZZ1ALvdvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZIUjUm8i; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZIUjUm8i"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4b21f09ec76so1061814b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 10:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788544670; x=1789149470; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jxL9xWJoyXLMWiLXTBKm65nu9qcQOBFMxo0Z1T8WZso=;
        b=ZIUjUm8iqfXDPwqblE+3Jgr2Nnl5f9fAaJGIRy/Ta7WGOYLYKVxjnzksOvTJReU3rK
         trsN7ZkLYDyhhwkST8NQBRmIcC0bDsrB0Pf/6/OZzZ+ddLedZSwJ1TnmZVcoQxZDYzap
         uPml95VEs97OIvyhhGoylYOpPuVJp/kasVrw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788544670; x=1789149470;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jxL9xWJoyXLMWiLXTBKm65nu9qcQOBFMxo0Z1T8WZso=;
        b=XKkETMLyRa9c9dJrLIAzKmFJ91x68Fe8CyDdM8h9Xx4dSwBMnhvghfxRxxIleUHDxJ
         ugGjQX5nKoLsLbcQmlgsjGJoQNbqj3kb/LJLDb8h6nsAeduTjf28ej1p88zFWA18fNmv
         O4AOUYvrkU9YA6MRQFzNJdaGIw6VVKPS2zL3RJS3WU2WQM+AgiB6x9dEB+wFcLv+LGbd
         61vqaj0Db4CVflbJCrxyG0RDrUjM9XPhQSXGV/9uJw8S0GA6pdcMob1+jSsdJfOwlhPj
         PlUzjdDkaaHo/2LoYx23YuuPu8ok6z0fK248Ls1al5PZtFf9bT+1uHARfO7QiQnu25Uu
         VgtQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJ2Dhv31FJdx6H240XHNw4fGaWI4geSPmWxZhTToyVYbK/NAUL7wtdow6/G5vLJVaBuRRKKleZoi2sU78=@vger.kernel.org
X-Gm-Message-State: AFuF++kK8ceQNuyJLjPK5w0a0I2NqegNk9PWkJvzjPwU2tKzd1RpqLkO
	HTA+/jn0SiVejx6quEFCEN98duBf0TaX87r4XnQ/ZA2v/HmIEUhV/z3vztzbRbrl9Kc=
X-Gm-Gg: AYBFou2DczhquaLT/q+5Nll8u+irIAYM/sYoizlGmS5zYiLqa0WcErtDdYLpbqlj+w4
	9nXgT+/TZkKHEm6tEPPndLeTC4vhPASkq+eyLENqBeKn+yBPZ1zw+LQUFVLy9zDctCRtdBBmezK
	zzKI01Z5eEpjUTKvyNRK56Kmf4C8naa8SeeFQG+usx2+k39jO4zR4BnjhiVweplqzl6wZifN8v3
	poSZ7kggJEoyUymycbyTWlnpHS5PMH4PYvBtLNMwyhBPrE6lShJgYD2dtvImK/WWPiLUWVGOk9I
	bCn90lYP6tMnaLyJwpjgkytFH9gRE2627QMvgv4rsyrpOtYzJKezVSJf2WBQVRWQ/Sp/Oav8wAu
	iEKQbplSTJ7PnoiUPxrSx9/GPWtSUL6yJjAWvntnEGJK3QGsf0+pROUr/5QhDtENjeShc4+dlMl
	F8ztF5XHS08sCUwOqiU5g97zu7ccRAZfGqMgRjbpof1Sk4iiq6uBK8ckdbx12mmW+0Q5/V+WQ15
	hPAv18DEw==
X-Received: by 2002:a05:6808:13c8:b0:4b2:9d0d:ffa with SMTP id 5614622812f47-4b95bf9c315mr6608717b6e.0.1788544669623;
        Fri, 04 Sep 2026 10:57:49 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b97167bd69sm3087057b6e.13.2026.09.04.10.57.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 10:57:47 -0700 (PDT)
Message-ID: <14f16376-a0fa-4ea4-b14f-65eac5839bc0@linuxfoundation.org>
Date: Fri, 4 Sep 2026 11:57:43 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools cpupower: Fix signed shift UB in amd_fam14h_idle
To: liujing <liujing@cmss.chinamobile.com>, Thomas Renninger
 <trenn@suse.com>, Shuah Khan <shuah@kernel.org>,
 "John B . Wyatt IV" <jwyatt@redhat.com>, John Kacur <jkacur@redhat.com>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260903082644.5149-1-liujing@cmss.chinamobile.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260903082644.5149-1-liujing@cmss.chinamobile.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/3/26 02:26, liujing wrote:
> From: Liu Jing <liujing@cmss.chinamobile.com>
> 
> In amd_fam14h_get_nb_power(), the expression `1 << 31` performs a
> signed integer shift, which is undefined behavior in C.
> 
> Fix it by using `1U << 31` to perform an unsigned shift.

How did you find this problem?

> 
> Signed-off-by: Liu Jing <liujing@cmss.chinamobile.com>
> ---
> --- a/tools/power/cpupower/utils/idle_monitor/amd_fam14h_idle.c
> +++ b/tools/power/cpupower/utils/idle_monitor/amd_fam14h_idle.c
> @@ -270,7 +270,7 @@
>   {
>   	uint32_t val;
>   	val = pci_read_long(amd_fam14h_pci_dev, PCI_NBP1_CAP_OFFSET);
> -	return val & (1 << 31);
> +	return val & (1U << 31);
>   }
>   
>   struct cpuidle_monitor *amd_fam14h_register(void)
> 
> 
> 
> 

thanks,
-- Shuah

