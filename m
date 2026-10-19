Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792453520;
	b=y6tuRMGk1VQH+cKZjaFY5IZl5LPc24GkKf8RBKvMGaazl71vf9RkArjWyfYtI/PtXm/3
	 t+SQC6a0FR+7lparNPUhM0Op7ria+x74XmfpaiFtnCjO55k33Koe9btXUi8g9L6pgGQn5
	 0p8hUBHjjhhE2qC+I+Xbc7D7bR3mZ269j0qQteHJOIqeypNSfchi8H6WnWa2N5Ra/yp4M
	 xNAA0iRy1pBqHMATfg2pWUUFjkH9OvsfImIx0hIPf+uXvOCjQMUpL0MRZkGts9gNDpp3s
	 JDeE1pjUAhAzvwnx7tWyFPAz/xth4gGJqSPUKPV0QHZZOxmMvPhfSAtHxwsCUc5BTwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792453520;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=L+dMPBvak1er1V+6J06MJbguYRMeFQgiyOwZtRIbZB4=;
	b=JUFfLt+4KfDmFr89lG7za1Xqowefy/Ru5XrtPxwmWIRnZTyZDiaD5RrZ31/YWd5A1yPp
	 PgN+smk49+n1hxZY4Z1RaJb49SiQFIdJCu5zEUR6Gb6HBGVRAqUVJuj0+sXVDxVslKMDR
	 46S0zDHYSiKyksx7d2fqnnVaO1e2leBLWue9dR+AfZOiBQIQkNDXJ/sRD0ji2jPzvwyLK
	 7zBzWr9p/6WE42q9XXGSd5nwwP6ZHwH+e9ItwnN/Muth7pe8zkMHkEGwPPoXggLGetHV5
	 U7+7idK0zRXiIzYPsUnxwkRBomuBVmz3wBolDGvoE0BB+wxGe3ZeLnnCwDuBzSPLtOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b="IPCxG7f/";
	arc=none smtp.remote-ip=209.85.167.170
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E09C606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:45:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E09C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=IPCxG7f/
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-54cd7de2d42so226785b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1792453512; x=1793058312; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L+dMPBvak1er1V+6J06MJbguYRMeFQgiyOwZtRIbZB4=;
        b=IPCxG7f/fn7yzrJoGtOxwWQox53CKy8jYBxBOEVQxz87XwK3rQnw9eotO6Nc3CWAIT
         CWqi4ncgjN9vJ2Y+tWEeHXtGLvCnG1Z2EMtycJKVsM8aaHwjdUjvdK6z8Q37OHkgi4I0
         1+znvuDGzLJ9dn3Oh5OOw0gz/IXkgVbQs14J8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792453512; x=1793058312;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L+dMPBvak1er1V+6J06MJbguYRMeFQgiyOwZtRIbZB4=;
        b=r54tppdm6Prflj3Zw7OpVISZSZLowHzk0eU7T2Zuo3xphWIoCL/Vtp3ib6W9nduxmH
         izfEDJ556ce1enRj2gWaAwBnuk2gRAH5x/U8PhTyOzRxf5oVEv3zVkw08qJVgkuwCie+
         BgRArQrtboFAOY5e6UFZoiwWoibXViNM6znOHL4WCaKFRLbsiFJTG4xfWkJqDdT4IPZT
         1sm1w2XgH4XOp2CzwMpyq+PHaQJDexJibQR40EwIsmF989bZXFMGMoAOil416T22WLYF
         9VCiOzREp2TYCnmX8wFwL4Dj3DyOrbaboJ/H2t+tSRo25nOwV4vAdl/43gd6FE+BoyHz
         dzCg==
X-Forwarded-Encrypted: i=1; AKwUvBwK90Lh7G0qrueBqt5Toc8pTJ0VWIYe+ovrsxtnSqLU+cf9i9xhrxBGvKtdGGAHHTMYPWxT6kcGntlWIiE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIXVKExlTZXK4rVd+DGRR6srVCygw7Hs9e+kw+Kl1QtO1sxI6ev
	LCjfTX1xgWgq07tbiyRZUUpVOOrBF+mimCGwJJRs3SfGjVDC+6Aw3Wnt6gI1eJuupd4=
X-Gm-Gg: AYBFou2z6sHAihZQNJfiXgMRZOFmqzXvFE8Bw/MN6J3meHpWFCCbOal5+UACtp7nAmj
	tcrpjh/bUO42ROpGPr+7IDHBeU5Sw1MR2krtw6PYxISRRao8eTX0HhYt43yDFGvM5KgPVkgVa3T
	3oPeqrK3rmZ+VPRAe6EfjaqvxbcVPyYyVsMLOk6Q/pJxwYVgpomXbEJvljEX8DX7EJIzVuAxZ96
	qMopCfVo8fIlEeXlkP9qgOSrchfHbDGdqEO05D90SEABBsXPEfFdEUlU9y0PrTbIVxI2vtx6qhY
	gXHhwwKghlDbr/HNG3tKh42MEmTX9R8T5cJukXZ9o9rMncArfF8m6b1gTqKjBpm1FIhWM95Upfi
	DJSQEukQTMuz2GD7Ug+jhkpOP+lEVgLrjMSG1wRA46xwXjXvG8VxDOFyP+RO6OV2RKvKOOQbOpd
	GO+7yjtIS8IaM+eNqfPfSgUacPsVkgtQAhXVq7pYwkASahzX77whtS9CW1W/YNpr27GTK/D0qwE
	9RXePo=
X-Received: by 2002:a05:6808:220d:b0:4a3:fefb:899b with SMTP id 5614622812f47-53cc5b5bc4cmr8945280b6e.7.1792453512583;
        Mon, 19 Oct 2026 16:45:12 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-54481784097sm3856223b6e.3.2026.10.19.16.45.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 16:45:11 -0700 (PDT)
Message-ID: <aba623e5-01d2-4822-bba1-48133bbbea65@linuxfoundation.org>
Date: Mon, 19 Oct 2026 17:45:07 -0600
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
Subject: Re: [PATCH 7.2 00/10] 7.2.12-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261017155059.698368299@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261017155059.698368299@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/17/26 09:54, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 7.2.12 release.
> There are 10 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Mon, 19 Oct 2026 15:50:51 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-7.2.12-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-7.2.y
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
