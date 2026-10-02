Received: from mail-qv2-f41.google.com (mail-qv2-f41.google.com [74.125.230.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB03501292
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 17:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961119; cv=none; b=iGDuVbpCH7kqRKKE3BbETUSxm/wIFWnbVe5/H99UhgZ4Z95h67HRuGSCo2Se6AmP7bJBP/BtVh4VAqP5Wvvo+6Styr6jwo4D/gStgaQgg1nadOcENXLKhiCeczv2mx0LEGXIR0tybUriLWW8VIWAXAJZWM6e7X6C0CTWWtGn09U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961119; c=relaxed/simple;
	bh=9iWiLeHeXnIJI/lcv7EGA9Q9oUsxmKM0h3HsxY6J+1s=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=DQQNDRXxbiVph0Z8myZyuI/yzX+VDTAARpXFQH9o+GJ6tV4YNJWqV1mDwrEaODeoJitt/9M26JiKxWKuVdBn5umprhKCVAY7c9CqoU/kW0C0qdSmvzXhRdfsGkJ529a2SOVVXRoaYXxEnnk4HEEaB3rx2HocTdpWPei/0MxfTAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FAzfggcU; arc=none smtp.client-ip=74.125.230.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FAzfggcU"
Received: by mail-qv2-f41.google.com with SMTP id 6a1803df08f44-91782711448so1180106d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 10:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790961110; x=1791565910; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=78WQxbjUnQrJhyVO1dcpGQV/qKspNnaK49GmbKiN3lI=;
        b=FAzfggcU7g7AfSkWfoLc5t8GEJpg83LmuvdDC1OhWF4rQRwhbuKRIVzLmylO6QunxU
         +0uK2aRUAseC0Fr0hCHlM905ZFyA/8AZK/RwqdRqtO0ICUp1YwbPEgaVpFXD7QlgHVzG
         q8bRG4txEDLFrEVxzWRrkH+xS5hYyIWRS4D+moZrshOuhsQWUkZlXlz42uWzCyUfa2Ra
         oeNGpjwJG7QnFQne9GxXRtIlWCvOUrZEIhN+zGORXziQxPGFnkJtp926RtQm284J6PxO
         F89K3rD+EzQKqRwsGQFSpehNlVQS0BPfacKn9QQvuHotsbdKUrtO0wOEw5l2xYcN/M55
         uHOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790961110; x=1791565910;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=78WQxbjUnQrJhyVO1dcpGQV/qKspNnaK49GmbKiN3lI=;
        b=mRNwskmwOtYharrbsJXJ7NqYHhmSHZ6V+JaFQyMYDKaS1MXdBvSRr1w3sM8ZsSciz5
         FyC1hikorODUHqezmynANDQjP4LvkyRw7wZXOGUfFkjmbWPHjv6isSLeHPrQAebLlMiF
         mpewYGGKRjTHvKJxgHeX7Q0IUfWbB3AiXgQJ+GOSHTg5PD9cKE2UqDViZ2WXaohT03Av
         GLKLruxpU0m+wGm/OGPZGyrlgi5EtAT2uRPIptQW+QQt82EaAlmqUdQf+OEEVJVG35CZ
         wtmftRv/OnKSmS3LD5Rs9WKjnRXe9XW7mSJCvAIDBWz5TUdLI6IsRb4xlNhnD5Q/oINE
         g6iA==
X-Forwarded-Encrypted: i=1; AKwUvByloDLyHQdE/AXrFBOYuHrnyC6tYZJtMQXDwEWuqbCostnp/pAI2L5/n/WCjU3M6sEqF5NC68w/WOVYqYM=@vger.kernel.org
X-Gm-Message-State: AFuF++kY9paBGIxhDCDT+QwYd6NUAA/kDhbLChGPjgJujeDSFx6snHIW
	KBbbHOKNc82etsHG64lnEom59CkbCNRsk979reKWLJM1VNP5eICEIvwa
X-Gm-Gg: AYBFou0xKiXA4oGF8wZQtuDApjixwDoDsZh/ryM2MfypgoME1DhIM8JsD5Af9c+LyZM
	OoeNUGetJg2b5CbvwG0PzA3mtKy4gdDKf2raik0AEWBiOXhK3dNhEu8KGFI1ykNzY3JJFcZ4h39
	AyTpbovAkLBF6qZt87ztdJhG1yQXROVGH+fEG8gJecc4+WKWwSmIPM7vQVsoXSRMTS4I+NQEZx2
	lUUDCtbfp/weU8U5bB2onTxwWPZd5ml50I1NXh4U2z2orGqGrgD83iXbwb9Oy+0TIKx+Tgh3TJo
	FtcheGie1DuKWZqQcs31DC06nALbC5UKUChclPmc5wDuZ71W6Cf5arHwRkSxUuYT5XYm2EXUSqZ
	QoH0NdrwtO9kjWlGNugMXlbOPG9S7K4isKWAvK47wI5eTKmIdCx39enQAb8WJflAMWdT1w0gEGz
	q3ZrWjRjuRE25dHOXRLdZo2kLta0aMxQGeWBR8894qGBjYzw4rzX8QWA39BXYJvOUiyjYBgzwoM
	A0nV9kisUaLz0ubKpERTj+OFg==
X-Received: by 2002:a05:620a:1728:b0:939:8373:b552 with SMTP id af79cd13be357-93ce7a955a2mr596693585a.1.1790961109773;
        Fri, 02 Oct 2026 10:11:49 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca1a63d8sm266316885a.12.2026.10.02.10.11.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 10:11:48 -0700 (PDT)
Message-ID: <6f58df26-16f1-45f4-a5a5-c8e97c936944@gmail.com>
Date: Fri, 2 Oct 2026 10:11:45 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 7.2 000/457] 7.2.9-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20260930152346.024115587@linuxfoundation.org>
Content-Language: en-US
In-Reply-To: <20260930152346.024115587@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/30/2026 8:21 AM, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 7.2.9 release.
> There are 457 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 02 Oct 2026 15:23:04 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-7.2.9-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-7.2.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

On ARCH_BRCMSTB using 32-bit and 64-bit ARM kernels, build tested on 
BMIPS_GENERIC:

Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

