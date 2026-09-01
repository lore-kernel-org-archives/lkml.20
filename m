Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D58345ED7
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 00:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788223513; cv=none; b=r8ovFHPJefFAOdPRWVCs8xXKS1Xedwxm1PsG4PLHWxBuq0FHDGp0GU+fPv2JmuiJWHei00U/NgwUkjDhyy4O4Jz7oQPkeuO4ubycSLweanYfXgl96xMxn7+LcCN4nP08bcwLahJ2H4gawfkOTUgCasSr7N6fYufBOvGu8XZNSW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788223513; c=relaxed/simple;
	bh=b/cr/GpR99/g2ZRVZTnX+M72uIFpbYKpxinXPlmHQt8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qSvq/AAsWfjBj8ujCGamj/tutcJdUc5qBxTvh5teEbgkJI0gIGJwB/LvpeHFX1BkNMBHrSLyvG03CK7DCQ8esz6nvPvSTcRN/YCyoCg5aVUnftwewBaPuwVM3o5DfQD3k8d3mj33Wz/hyUPDhNmWHxnFXAfnl1Qkxu/DxayffMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=msjPzU/b; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="msjPzU/b"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d91ff7d9acso14744545ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788223511; x=1788828311; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ayLUeYsEczkt1CuWOz3uZQfDpFUlPJaeekAPDfzeJMk=;
        b=msjPzU/bBNC1kjc4OO8gR8SwwF8XuRLTjNtMQ48M+LK2q26fmA4wwDdNkJUJFAnywc
         YZrExXXKEekF4BI/FwlSzwUeTgSksFk9khtG0r6Q3beacvRb7V4eXpbEG4ioR0H+Ggte
         7sjujhYZTnjEg3LT21vILdgUFW2yvjcbUAfmwIIkI4f5VMJ+wvclzc67uIgdR/GhkC8g
         aNVAo1Xx8wuQtIvlmLrO4Tph1SsB90nivY0l4QT0k5ahvsYnEkkH/VqLucoxJWSD4sf7
         gv24eOXT4AjXrerTfOlCzI3GH7odAMwYjxAsqCL6GtKMoJNCBZ948wtWDHgQdTGaPUKL
         ozYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788223511; x=1788828311;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ayLUeYsEczkt1CuWOz3uZQfDpFUlPJaeekAPDfzeJMk=;
        b=hmPhPApUlJYqc1kUI0VJPan1JU7iDEuTSXtAPzcZA9MvgSIvQiiDZ9afdXKPq4e4vy
         TkH5lfjcmM/VzLqVGWBry8iTIQwXGAktt0OzDQalK9AnFAVLH/PCkq9kQVLZg20pVwzO
         ygH59CGNPrS9bP882WoUnUch9whV3jCCFfUIzNR7MEvFWZkzmDoQdBs13MI5FOSz2Av9
         yZDuI+2NNtIkEg+Tl3jBWmGEbA9CSblMMaDFRoqZ9M2+mGqg/BzRk007k0LRu5HVZq37
         b0fQycZr22b8KZDVUFHk3467qOIy7muyoOUGoNvi5KdBnSal079ZecBDRNeMjKVj/pQZ
         6+yQ==
X-Forwarded-Encrypted: i=1; AKwUvBzshwuUnaTjFClhO+HHJnH6jcq3nsw3pkDpFHqtFdDyaW80tvL1ea+yNjd8QGBQdvPp4wF2N6tQW0LsPnE=@vger.kernel.org
X-Gm-Message-State: AFuF++nZedwEitmlejaggEOS9omaIZtt4w++QgSOiKuHm4xHM8p07FfN
	qDy80RbWPotyxNO6McZrFJTLwMvuHvN+nrhlDDid1VhX1mPTLHXF2Npz
X-Gm-Gg: AYBFou0FfsvSz27lZ48D6zbVckRxbtFcdytJwzNAe7Rdw31wifgfPfddTx4GZb8+uxG
	xIsdsCwU8Y2ieDdvOl7mfbAaPCpPqehvRXnjR/GtsTmoIG1G+8MKlOPu1GM62KyaMCbwZ7yEPQR
	KF1H/N+dRFST3i3ZB6jCVGlVTjoYWiwLwhL6USMVm+vRVyZiYeKRc8aDYIFOKaI2fm9igNgs8vi
	WRKjHjKZLHA4mUPzMSAVFKVymi4YtUAXsUWHTphn7RUQgenqSmW3lve15BDvPIr5Niq00wJffTj
	80bw3Enkkelb+Swhzl2FtxFMBQVJ1djx/ca701XrbEFjIawJ3SpIj8k1+Gg1Zfz1MrCOJ4/KkF8
	46vtSj3DFreUol2WSn1EhD07W77BkLKxmB7nMZ+eAf8nvipZGYabNCWDdo9oBwADmJ/Qrr5TpKo
	8t7PUPVFY0i2qLPDm8+bf2OjF0ywlpyjmtVdwXdxrA1Om8APXT8+SI2+r6TvGiBE4V4xXA2ACI0
	PVdCKBYBMb/0SafVRNXR8Dxfh8UJ60=
X-Received: by 2002:a17:903:4b08:b0:2ca:e62c:9e96 with SMTP id d9443c01a7336-2d74dc51c7cmr475653825ad.5.1788223510826;
        Mon, 31 Aug 2026 17:45:10 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9e3cf8sm36111824eec.24.2026.08.31.17.45.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 17:45:10 -0700 (PDT)
Message-ID: <89a183a6-945a-4f85-aa2d-821bf25903ba@gmail.com>
Date: Mon, 31 Aug 2026 17:45:09 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7.1 00/76] 7.1.13-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20260831133359.185608553@linuxfoundation.org>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20260831133359.185608553@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/31/2026 6:33 AM, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 7.1.13 release.
> There are 76 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Wed, 02 Sep 2026 13:32:19 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-7.1.13-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-7.1.y
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

