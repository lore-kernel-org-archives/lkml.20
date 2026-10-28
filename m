Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793221954;
	b=GVSW96EVcLn9rwRERdazDtdlxuUI3TnoQI2IH2t2tbqzUdORsCF7nnscG30RBGb0eAd8
	 AHhPNv0YJoRPP6/1WiQRnkOjsd0/vCjhojUv9HN3E8Z6mAP2bpAFnxKig2GXrhlaflfY1
	 uq0aetXrxmoB9cej4Ff4wAVFkeNduxPmrMdWKTqRmafwFpt7uPaMymZp7xAeFnEtFQK+1
	 36c3QkOmYGwbGtqkIP0M6u4UhlxA+M7uOHBScevu3vjRE6ilevsajWfvhERWBGToE9Fy3
	 /g4m5dUCoP3TXRDkSIU9+qmbOMg/x/sYdCL2NtbkKWMTi3rJxLCkD7rJaUSHHFrDpcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793221954;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=82VJuvmKc1OoqFuJLY+l5up9uTowgLJIPwv+wCQN7vo=;
	b=GWFtek3x1dbolP5BGMpBPw4xLVUspmPURslmi0yfvGMF2S8Z3qZYVLr66OXdXSzQ5jyR
	 x0UOgT7fYoChftzbnfoxguA+Q1J+I2MI+ob6xiBtCgFGIgd84MYvUE+vSqZo/qye556Ys
	 AJIEct3i8+3K9xZVuEb8v5kdkIEGtKbDpesidDNLKZDvRnwcur1V9l12VQeARoB070JFC
	 aB2YupmD0mDBdKyZ0bUtY9tJl5/nDdsocLGWPWi+CqPglaNvu7mHMgpXzugHcDwtA4piW
	 DkqkeAOIZKMVGcaE8InimUO+4Oj9KOcHqyZaRWe525V3rHbINOZGLMWHRp6/ltvgS+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jCtW4bL8;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FA5606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:12:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32FA5606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jCtW4bL8
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1a2af4c8d00so408293c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793221953; x=1793826753; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=82VJuvmKc1OoqFuJLY+l5up9uTowgLJIPwv+wCQN7vo=;
        b=jCtW4bL8ViyeaPeGnkvFW0Tzyl2oJjwAx+AaO1JohvbXzWXa5Tl400aetJxSp2/g2b
         F7QGxATCzvbMzO4Tpnf2AdjeNhF06hg2rmS7jnCt4rJimBqjGXl26MNBvjCLzyKyirrn
         M3z2JoBV6xqTH+c8Z2rtkdhWnvQd/TRWi6abLIIr1uivkt7TyVpsm5LRqzqFWqjwXzZl
         H8SkJ7c5uHdqj2q4/Hb0f/dRHQgiRR4176TkgCVBMk9fq6Ii4sQG1e2ua58o81Uxw7vY
         I6uxnJ3BpOh2sdYuxyqjC1lGzpc5vcgTAJYtQU11zPzAu4op2oMg+ue7HUvb/ttxyMMZ
         m0sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793221953; x=1793826753;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=82VJuvmKc1OoqFuJLY+l5up9uTowgLJIPwv+wCQN7vo=;
        b=q9VrDMRZamQVgIWaP7s3JqWQb9ZlzUXlO+Jus5i1N8pt/Sk2aoqGnhCM0Y+masDEc3
         hejUJdqN43iUETCCiRrJqJjP3SuQtD6HEaYZuZmWR1FcZIzDpuaCMc0KCODixabouQzY
         iUC/nz299wq5DWAdLgASnWKGEwGOQJnYQmvSazI9lWXBsBLFtfFmXukZE4Hli9BnTN17
         0SM2la3sd2ndlkY4P15T7hVpq2lKA3I6oRqjshGk2p2sQ9s7un1H/hJeJof6+0B/34rz
         EA7yz/3eSaZW5FMr+xa03EBVxyrgSSNt9mO4WCMmnDV/GJItR8uWGPKv0Q7ePNQdNesE
         +jlA==
X-Forwarded-Encrypted: i=1; AKwUvBzlKgdeow5eeoT7E6L488k59OFbyEXoRG5QefYlcC6JPULwbnVpiOEMkuDDXiMV25pnHFl2U2E3m6bOO4w=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLjIRSRipkQVFZoqTbe6ZBWBB5U+7/VTug2FgYgyBz+zfUcevV
	f3IrEf8WzrvXXxwQOsmzCfk8FU707v1XS1U7R0gBTY0Mowdpp0m5ynMy
X-Gm-Gg: AYBFou0BOvqy5bv8dgZ2DTN15ZxYffUy7jcqUv/ZYEekC7VGo7l4yTHnBnTFP8J40c/
	al5g7U4Lh9DWyo+HYg7Ugr7l3OiLKxk+kJdGbieHZJeHuWeTiKfiPFwkjT7KQXmcCoAZ7eoQS+C
	AjwwqUYs0a7pXZZzk1SHQld3J3vrSFA8fifmRBeoKcLqzKB1hWwF/PqskTwv2n7pBxDeqy96rDL
	zeCuD9xrCT+2h/7N7XaSSrRSP9GVt1efzO6Id3kYsK+abCFLRF8mAjX3eJ01nFLg8PSuq4uA93C
	oEyj/OTZuiUehkA4/CGieMKqvctLPEyooh+vzSAUiokxPLGbnkaCIoi4jAaX9wGLp0WxLyfxF9o
	diCeFyRNF04tYoQS1GrF8lAN5m6y30UL8FXp6++5BOiFtRrrgttIldINp59Ok44W558b+1dJEb8
	pj6Yl0mQF3OE9nwauTS0UtGD1lyOESJSiKdUn3xzCVb8MfRpcGNWnBiVxihUzLyXzWQnRsIvrnz
	j3TB5IXnzh+CU0T16fp/jVcKBNblyCZEfAlmR7YIAkosmR6BAvyrSaiLJyTdwr085Wxzr9neASu
	8A2T0y/+7sqIRqv2Xry+Gjw6S64IgrrAK5yfszTKdopGPvW3yYaKGZ8Q
X-Received: by 2002:a05:7023:88c:b0:143:2984:6518 with SMTP id a92af1059eb24-1a6ce209cdbmr5369225c88.39.1793221953208;
        Wed, 28 Oct 2026 14:12:33 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75a37093esm7126375c88.3.2026.10.28.14.12.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 14:12:32 -0700 (PDT)
Message-ID: <f09f94df-c5e7-45d5-86a6-50be145f6655@gmail.com>
Date: Wed, 28 Oct 2026 14:12:30 -0700
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
Subject: Re: [PATCH 6.1 0000/1887] 6.1.191-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20261028170459.200466217@linuxfoundation.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261028170459.200466217@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/28/26 09:34, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.1.191 release.
> There are 1887 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 30 Oct 2026 17:02:34 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.1.191-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.1.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

The ARM 32-bit kernel fails to build with:

In file included from arch/arm/probes/uprobes/core.c:9:
./include/linux/highmem.h: In function 'memcpy_from_folio':
./include/linux/highmem.h:427:21: error: implicit declaration of 
function 'folio_test_highmem'; did you mean 'folio_test_hugetlb'? 
[-Werror=implicit-function-declaration]
   427 |                 if (folio_test_highmem(folio) &&
       |                     ^~~~~~~~~~~~~~~~~~
       |                     folio_test_hugetlb
cc1: some warnings being treated as errors
host-make[6]: *** [scripts/Makefile.build:250: 
arch/arm/probes/uprobes/core.o] Error 1
host-make[5]: *** [scripts/Makefile.build:503: arch/arm/probes/uprobes] 
Error 2
host-make[5]: *** Waiting for unfinished jobs....
   AS      arch/arm/lib/csumpartial.o
   CC      lib/math/lcm.o
   CC      drivers/video/console/dummycon.o
   CC      sound/core/control.o
host-make[4]: *** [scripts/Makefile.build:503: arch/arm/probes] Error 2
host-make[4]: *** Waiting for unfinished jobs...

this is due to 341d4e6294d9 ("highmem: add memcpy_to_folio() and 
memcpy_from_folio()"). We would need to also back port 00cdf76012ab 
("("mm: add memcpy_from_file_folio()")
-- 
Florian
