Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794608823;
	b=jyndCmGxuR38tsxlLtA0oT3E+CaQPHYB2/bY4LaHC4eD8WI/AXpemutIIRjjiZUpGJ+Q
	 rRGoDbJ4iaTEs9Xsv+liobufb7B0shexldiDVScxC++1hZpVysvbZJdrUL7+3ICofuaum
	 XYP3Pm8xd2dzMlwe/WfoSd4owh07KzGqbf1remcQscA+/o+pGt+4y0ndO5knVyorjLFOU
	 wH12lwhrMpuW3LSTX04SAWTqbutwWVD2jDVwOQirPIMPh5wGZug0+wtebUS4H+AGTojOb
	 3JpnbED6rLU/H4CZObLD7Ct7dROtVvkFCDpxiMeA7jmfUBlryqtSTCY1Mc7kpamo4qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794608823;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=8JTpanzVHjsYyfTqgNv/v2AlQs8qfVxkL+bAMQRdOVg=;
	b=Lv3wtgRgJlRT6Sw66ocLDdXGthA6BlSgRdhs60Qe2GbGuSfF0NiJ5qHEpdTEtKRQxYyX
	 UXWDsElsP4a+XdKfj9s58b7C/op5wG669DwjW/O5cvow98Z0Ydq3IFrEmd6u+pcrB+1FE
	 yFN4mFhUY4l9rkAfFwF12v7xojcu077y+6UyBh3Ed0qVH7kB8RBDQOLHMaA6sKEkYL2po
	 6ggkJ7gD6DEm9phmAEgX9d+L9R1hX07X30eB+RnF+4bIWrtb58bKkaU9xgUpGuzjt8/nJ
	 rCCyUgdtCIZU4ilhuESXVGYjFESy3Ia/EU+KKSEaWLDJEaAxYekW67u7n2z3L7u2Y0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=HTZmBt7k;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B303E606A880
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:27:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B303E606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=HTZmBt7k
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-862a19300b7so62933a34.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794608821; x=1795213621; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8JTpanzVHjsYyfTqgNv/v2AlQs8qfVxkL+bAMQRdOVg=;
        b=HTZmBt7kVlvIFj0VHzxypN/lFbppQC6d/M762WuWYQM+v+gVMhPK0c6HemCCH1AY2m
         oOtHvuAofxZ6p7ijl258adFNAw2gUli3rZsYkdxCay4R6bixPoT+XEl0ApoLsL4DnRdw
         zPBfaAUrPD/d9bYFrJJrPhKblwwUr//Qd5hqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794608821; x=1795213621;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8JTpanzVHjsYyfTqgNv/v2AlQs8qfVxkL+bAMQRdOVg=;
        b=bSCtEEEIkQk/KyKtEAl0cUfm47IaYHUdkRrHAWzIwHeNfjP4sUFvh5qJ4tLPby0HVM
         a0quon+HCriUBzjtRfG7tzfDAHjYpcmvSTQFJH6w7LP1MfFBbJXMoOPjWUz7m0BVCIKN
         izsF71vsiV5NmDXXVbY5+rTGEn86x8wHNSZ3Cnjwu1EOnHxq5xaUHAngnKBPL9s/7uJ4
         VoZ/Nc4dS7NNxi2Y5E4Fox4p2APT3+s33jKPvSs7WF4XYLwGQSAkWBkT+23nWd04O35M
         yCu8aMJAQM/dyuMCuSKWSAZcutcgLxf2JomqtJIUhzBpI2rTi5+l+1A6EBOqxYQ2o4fC
         D2bg==
X-Forwarded-Encrypted: i=1; AL+hErHCcoFQM6F34tX5sqAYMrihOndZm8hUtNnJMRgEwa6NVOEQeLNAuVHrwTpFFnVdB3D5ut7fdg3qkyBwgsA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TbGXQPTqZG/YuRSQt1TaXCg/r1BQQICjbIlOqmjJO1m43uD9p
	j4gVg8zEyhmxabnEje1hfUMEut0domtLFPLuvcBnXxLiqjxRQIrEIh3qWOWTUq11RL4=
X-Gm-Gg: AYBFou3mgmPGvXKZfmsq3PnMyRoO7mi1nD13ZnvqI25272EQV9MnSgMy4TBEniqBZL+
	FeocIttNIWS3fQ6mVTM5qmuqmi6hxeJ2IMpOufQrtjZ6H5fiswSMCCo2Zd6kfg2jbxbtwLFzosC
	AORtRPukduWSx8bv9hE5PODnCBGMoem5cbIL9SY52/e4EmgVMZFVYwhG+OZ4AsK240w/aDtPaJE
	qz2gYqvZr9QavcBf7ozTQ8BDWE5ZouG3/f4KhLmN3tf2+mrOFWyRerijtembRpbZxRrJyFSyhAo
	nThv+jMtimQXYMZHxlRqZgRcIcmWlfWbcS9MJMedgVP5swGY/80lEYY5GWvRY9OiWOCdtjQaVy0
	H/m4BRcfGqulrTP4Mm25yf0HZIUQfYvoiEoaJKl3sqAw1fRsESLRLjEc6SK8OXylaJud6M3SgLr
	s5B44gzGf0prRSJCQOQYv//Bv6mJ2j1UN4fSwfPPoBpDzjrBV6fYmAgQmXQMqjuvSgZrjVv+AnT
	h1MMYWLzxdDHRSNeONVpEV9BTACb5OqKySSLbqCOfKRv7JONvv/Eaz/u8UQK9eTD8MwyklilcPv
	ZV4f1N/tJ0XwxNOnavkJ315KGuCG+6G1GkgMeVc=
X-Received: by 2002:a05:6830:924:b0:7dc:c7aa:22c7 with SMTP id 46e09a7af769-862895381c3mr4868916a34.0.1794608821646;
        Fri, 13 Nov 2026 14:27:01 -0800 (PST)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628813346esm3412398a34.17.2026.11.13.14.26.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 14:27:01 -0800 (PST)
Message-ID: <0b626ecf-3c4b-42d4-887a-9b11dc473edf@linuxfoundation.org>
Date: Fri, 13 Nov 2026 15:26:58 -0700
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
Subject: Re: [PATCH 6.18 000/686] 6.18.64-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261113153820.902362109@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261113153820.902362109@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 08:42, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.18.64 release.
> There are 686 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Sun, 15 Nov 2026 15:36:17 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.18.64-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.18.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h
> 
Compiled and booted on my test system. No dmesg regressions.

Tested-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah

