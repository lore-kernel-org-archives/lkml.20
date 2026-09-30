Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4EF04D179B
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 21:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790802815; cv=none; b=jeylv3dRULY/AvdmRT6rm5OrXsEr8A76GJguRImNkRGmBhlV/YZBDwSe2nq1dAZlT/J/L0t1EnUZ9Y2ZTGsFDbDTpnh1OCyuks0cT6o2q2cXia1/XfOPRn5t0BUQXRNZihGeLKb/0YYg1dFn4RwsAlr0BPSPxDGeUdgddJGJ5eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790802815; c=relaxed/simple;
	bh=o4a0qUdaCSeRTwNJi1IOPcOPxBAbrFqAapS0BQWB/no=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F9sxDxGKUImpLDF2s7h0dmK7iilLaQGYIZ/qb7aVF3UvDnDf2/1Ihp10e5cy0Z46Zick4zEuUBaoq4v8mjU1IZlub1ZSisZ2Pd1XzJm5Biyj5OYCTBQ3u8IJRQ+TaEm3jhCCCBMt4OeVjCBo1GA24e4k3ppeUuuUnk0LM2uOgTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lUo0tNMR; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lUo0tNMR"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-343479e6005so159002eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790802813; x=1791407613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SP935/Mgxo94G/ukIIaM0Nv0lGPr7XbT3BTHdxiOkHE=;
        b=lUo0tNMRObaU895AFRkXtuGJoCIEZSZJGQUjQnVtA6TLQEtUYRm4VMDaqLxGPWJTks
         rXjWz0Rbjh8cDZzXuOgUQxdIAkZf62evLE45Y3c6hnQXW3APVt8B9sArSbpKFsBvuOwb
         FR+ZJ45EvXKil0DKTVoTWRrwKk2zMNiguJirmxN+UAnn9i7QkvSEg3w+xGpu3+TMongr
         MT01hwuir8fYg8ioVUPx+nUar62gj3CdjioKgLiIoQ++eD7tanWymKTWZ+1bxxlrkSxY
         bf5NnLOgBPo5gO7tx84ygHLAaHrpzfp3J3Tbgn9yEvZC+rUohx54LSCIsoutIARSsuVY
         U+LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790802813; x=1791407613;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SP935/Mgxo94G/ukIIaM0Nv0lGPr7XbT3BTHdxiOkHE=;
        b=UOYcvth1uEOaVi1uT+tfO23Y+lA0KhHfQ1z8UjRWVLN2gSovmaNrGg+AzZ3p9dUzF5
         ccWBnSZbMgS6NveAj8x9PwDpnvNefO6DsUO2BP1yYrcQFapFv83BHF9mD+4KU5fqiZs0
         Iu4ySPfqxtM34tsDaSwOPhNv16zxdf0ldWkTjgCBc638EDsiHrwHJhg8vkMA945HXuFW
         7ipGAL/ld9Mk5ZzqYqQzF7F+uCpGkLvNOUTl8BXWayNc3L+R9o+OtO0Tujx8N4PnPnfv
         aEpffkR2WcrWQEYZWatuC1lU+O8nRPjD1ZORRqquYmZ6XHeRzmvaGE8PfEqsIBR1tfPE
         CLzA==
X-Forwarded-Encrypted: i=1; AKwUvByCMBMtrbEnXK66xbUgTgmbqcvi+nWNQWYoZXp4yPNsqjbine25F+QsmIR28J337uu400TcHnHnNFWY7tY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZSMvn477eGgOp1+W3DnbFd6NgEsCUDeARB1fiDtfrxIFqx7wx
	BeEzd0x9tWutMxsVZLe36H2pdG0NJ8t3pXhtYpfvJ7m+MC2JLdFnW9a4
X-Gm-Gg: AYBFou1sdV2VfCFPJHgH16owh653WHhfkvkv9kx2oQu9fLRtKeZtkRYGsPzGganuUTY
	9KmhkC0YNHZJAYG4lbqCNu/z0eGbEE45dbUQhVusQ6izO24Pfm5VKiCtoBFNTpC81gk9QvoyU7t
	347mQch1ACYLO+MF/LONDDtfcAJ/J7TUnMy/Mew2v3+fxnJALtFYtMixWrq7F7/iRcsGWd3TSRj
	d8lDDvi/RBb+n6tTFQYKZByWyVq9IAJuJHPyOKyuPDRQkRPkDsWHa6oQDyPgLNGMxhdUPYcv8qQ
	No5c3WZYj9nkdYhqog0zPq88MKSI6jByT4wcjADrAJj8zTPiQnGKhHKPf1X61ukUxwhnOn0+sLj
	zXFIksW9vO/1r+06hfxo6SuOztyl/2qWzMRbtiIb3umJALj2mTFyJo23xy1xthgTG+JxOTcGylh
	IIde2F4d7KfiW1rBfYmrtiptENJJHJ/Ao1OsJiIghHDm3nMk6UGScNizeLsgoLo9noTogtOF688
	A6ceMk4LondSSp4VW7dTI5lnyH/MQK8yedHW8M=
X-Received: by 2002:a05:7300:f282:b0:341:6bbe:b9d6 with SMTP id 5a478bee46e88-34db13785b1mr695867eec.1.1790802812513;
        Wed, 30 Sep 2026 14:13:32 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34db31623b6sm1428918eec.7.2026.09.30.14.13.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 14:13:31 -0700 (PDT)
Message-ID: <4e73ef22-ee24-42ab-8e24-5f6d911bc5f8@gmail.com>
Date: Wed, 30 Sep 2026 14:13:31 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.18 000/395] 6.18.55-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20260930152340.591469096@linuxfoundation.org>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20260930152340.591469096@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/30/2026 8:24 AM, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.18.55 release.
> There are 395 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 02 Oct 2026 15:23:04 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.18.55-rc1.gz
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

