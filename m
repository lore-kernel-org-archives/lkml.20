Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792790909;
	b=Zlj2WLoaQFbNZFI1ULuv9Fk/CbTqkRhjmfgwztGO4C1mTbvsIud1mOgSBOi1pvWJZgk+
	 CqoUlCIqV71P3XLX7AayfAwSNRIJ7sCmDqA+BYxWvEgaBcpqv+VZi9IsDcfjap0Bf2Bju
	 yUb6sojGSUQhyVo8vrQlJKxWKozJRIVMs02qvmUQ9sVAd/bL3i7j1N7FT/Xm+wnITK3U6
	 hX1NxsTxghjOSP7spyRpWucgnGnwQU5u19XEhMrjdtf4CsnHXjoNDZ9VbzgnOcrJgjaPV
	 NtfiCdrwATBWzlT6K8sxWG/Qz3DuanaDCYIBUb4xS3alULiGDjuzQva9ZwpkUc/e9Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792790909;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=exTyhi+p6FLosAtSIlBuccnoi48symIvLRodBYfafn8=;
	b=bpifGKhohE0A4JxpC9df3mFOl7MQtGbThSjBgcbLgD8WHzu3zVEH0YjNFzi0k4I+L7v5
	 qkzDMvc9mtVgTJA36apqgmmUsTS9GX9VSaa0vtZCOLi5cBOHS4e+yb1UVqndR0mldUtu+
	 97js99F0yN1l3yGN0oK30T+886ljLcE6WTiCA17sD3TLJOGryN+6zc+gsW4iA4RnJX7kw
	 b7zc54zI9TcvIudFHTlNeCl/d/1Dny5EsMxdLyD2clYC1s1RcrezEXxsBxtBLHE6nx0uf
	 QKDVz5Sc8lJ0UTm2KfdqO10QjRWcM45+N2Nq8CES6qUvTIDkJ87gIwhQUsrx8/twrpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RIZz1Qjm;
	arc=none smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C32606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 21:28:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7C32606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RIZz1Qjm
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-530e75d1ba1so10337341cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792790907; x=1793395707; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=exTyhi+p6FLosAtSIlBuccnoi48symIvLRodBYfafn8=;
        b=RIZz1Qjmk10fIdkgzwkJRcomIo7yExgzdo6BsvW3muJbljRQjRgZkiEIPIWJScqNWu
         U5AKvYzVz9GZiYZh7NM/oYDfIor4zjwW98JNlD73HKIcUp2isUiNMeuySrZwQzCF+g6J
         C/7q03P9eC6lYQD0eOFIP3ttbzK+mjTpZsnpFB72Oc5PFWuUwl6KEMPtDdaCdsyty+1l
         NUNOrhSqNibqKLxVPa0lH3L+GmGgxFTSN5Z0zGMIM7PgwYIys3F8jMN3hrRtejlKZRUb
         1VmJlnHyxeJ+lOYESROIXa+LifC/iceRliizXUibV/jAqStWfp4z3yVY4r+td1uB/Xt6
         3BIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792790907; x=1793395707;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=exTyhi+p6FLosAtSIlBuccnoi48symIvLRodBYfafn8=;
        b=PwHTjUN1/RE0yiu7gyzb4PYmMI3hhL6G0yRkh/FELMe3jntggLjzClxa0cGMFeFbr8
         bmhA+i1sqPHSn1RrrOjyS/gqysq8YI6/F8ECmgxYO2DzAAPQeMsEW597ptKDWkQpcx3O
         7tLkvDnkA3QDAQ04S5HbU/aTKuQs1k+CglkE5KX4dDXNlVFFvpZ/EkYTifdDuRoIo7nW
         3jFDKQ+NaLyZ+9i6zgcor9PAYKj7nAq4JnhHrUJsXY1L6s8rTk7II9pOdovjrUw8BSK9
         ZYHdu2HNrhPlue8FClhpQzfI8qQiVfxYuXiAQUbF5UKHiwueqkXino2jAiNZyO8N4EdU
         D4dg==
X-Forwarded-Encrypted: i=1; AKwUvBzsxXoZJhN5uWEnTnp9NaLRYnmRx1/VKBFXDmMvfMtAkQkWzdprdALz1KmwSLHi+26DY96+S1yUGHmpimc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLC4Jl2Qjg/Dm/TrmOTZWHnsnqvNjRIDxQHg0O4Rpv2pvQkaGBc
	P5Lmvq2uuV4x5ru0bUub60Kkg0NmCa3QwJU4wp/tf1+yMfeZhLy42AGg
X-Gm-Gg: AYBFou1R5bQAXIHrHBNBLjHh5Rbxvr+VMhOSD6ZHnfAfI6fLQSHOMUdn9hB3qjt8kBB
	LSQBwYzPLJBdwYQ1zjX2i4nbyYspLSv3cR6sVaUHYBAHq3sabJ0OHlRI38JTUI8I/QteJi3KVic
	P7FEjgHzWn6NZdMsgRS0c/wJdNhApSReEDk25KxEKREZkPVvuylnnWygwzUt+RIshIYkHLqzmOD
	EnX1Sl+zmLAzAMOO4gpDqWmDIH4Pdzn5q54Hf+fyNJAQHDcPPHgwDqp6OFhL+b4zhxnOMty24PB
	jpdvv8U5fuRdt3vHLTXm75d7hSN3pTIztCFY6AKJvCvNj6W9B1p39Xt/0CqubttXYe1ndReoVj+
	LNnFtK00nRyjnMlcceAzmUkFd9OvWr5tJNO5PLvTYUElT4ZKYULK1ZJMRmzDvEIoenFDEz4kI0H
	vh3J4b4rdkTSH/ZK41KSl/TWK1cbl900cgiM54ah6v6ObGLTXbjR6widK95+V+bG+VSs6fYe6CF
	1ugaAhhdjvqwZEp9dDZrUeINOOsBk4qncZORGerIc65wnW7hP9h4+k1H87A5OIbdKBHlXpWOFff
	3NdcpTg=
X-Received: by 2002:ac8:5a44:0:b0:536:6c87:ebd7 with SMTP id d75a77b69052e-5383b741db3mr1986071cf.69.1792790907516;
        Fri, 23 Oct 2026 14:28:27 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47cb85f3sm4781676d6.36.2026.10.23.14.28.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 14:28:26 -0700 (PDT)
Message-ID: <b79c26ec-5da6-4292-a72d-6ea3298ab7df@gmail.com>
Date: Fri, 23 Oct 2026 14:28:22 -0700
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
Subject: Re: [PATCH 6.18 000/193] 6.18.59-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20261023163714.201276352@linuxfoundation.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261023163714.201276352@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/26 09:34, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.18.59 release.
> There are 193 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Sun, 25 Oct 2026 16:36:50 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.18.59-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.18.y
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
