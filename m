Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792453655;
	b=wzC9EODkqXzwqwxkSVb0mr+aacNrAcP4waMa4M/hC7zRMHVH4O93EagcTHjyI/89wmU9
	 M4yGG1whgnz1MVbl0ROUXcyKvUubaTcXySuutilKBmbaTO4SVcVG5pwejzZsqPHWTEJVQ
	 WR70NcN/WJ06o2d+hYekP3G/QgHKcwVF5tHL58em2Uab/qYOAkEZ2gMoLMh9Hl8BusKvD
	 R6PSEG0d29NrhrtfSsHt0ndoA83IGyi+RN6sYw5cDu88nj74nhd6ylyjXzzlbqCEtZoSW
	 tJtyP9cgeEAJ9deY/6MgDz52uremGFsBMmTKnMIch669JO8OJkTRQITuSWjGuHHvpJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792453655;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=lLQd+nNRjjQK1gHuHRMSTNd9Ep3awT51rCIPEqdoOwU=;
	b=u1lYBTPBaKoS/ctJclHBSBZob8/+v6bc6ormaQ/5pB+uJoetN52y/Z0OziDAxrWolo+p
	 S+Msxpbgnj9qpCI5nlhOPunYeBXPW2adbsrailzN65mSGbWvFIVRRfJzS+mTYpaGMgbBX
	 N+lcmel1y4D/Em6SUs+PJhz1WGeuUSzvRVvt8UMs84vxmFRwMnmcpLctQOpg6SvrMc2CE
	 P0NSjlL2nMRneYwh2obGlrzgLfGJ763DpRAu7+xjQzynuz4hzUJYSHobkjk7S6OXfp4EK
	 DTrKUtmuej+poiX/XK+kXF7dTDRiPyVGfeHSa/p3KfpfOeO1mLuu8De7DvZ7X6yvzEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b="Y/jD3FPy";
	arc=none smtp.remote-ip=209.85.160.41
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F674606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:47:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F674606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=Y/jD3FPy
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-48eee44b908so1418778fac.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1792453653; x=1793058453; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lLQd+nNRjjQK1gHuHRMSTNd9Ep3awT51rCIPEqdoOwU=;
        b=Y/jD3FPylWjjHvpYVkAntC5BIW5CE/zvq0KO48i+MtJnE0jvRu3R3f8A4uY4GEcc1G
         9T1sggxqOhZXHC+eivG8C0X3Dz3OEvTLRlCC5ZSuT0Ic2+hAOPex4akbpX/mQDVc8lI4
         u7g/fbKZp0sxbkcP2bxtzMMhgV6TIqFuEGV9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792453653; x=1793058453;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lLQd+nNRjjQK1gHuHRMSTNd9Ep3awT51rCIPEqdoOwU=;
        b=UZmgwSeFRU9zaYhm/n5N2lPFIwPL5mi4zTaniBo9V5jMeZwYOgpabo9Fsiwli7J9nV
         UtXvWbV227YO4d+VW/2bUdVyXgm9XVBDPhLsFaIVPRT2tzqCSI3V108URU/M7thZBMXV
         1NXUI8F/DO4oJ1xBROMtv4yOolFNo56gtFSqnntKj2inZYny/GKhmcfNmJ/RLO5B88Tg
         SIgrJKni/5M944upRQA+Ub86mFKLfsqPHQCu6bpqS6I57/CHMwwyiM0OhIetkmryFv+1
         zvJBBBISzR0IAiZeSynBb9W2YAiF6XILMYh7pf4+oN73eX5+6O/9xk421wKrpDB0inZ7
         WMBQ==
X-Forwarded-Encrypted: i=1; AKwUvBxIyxmlFULCnMdsxErmGHSRSiZ0juqW1dub4nNt0Nzl8Ojcwc3Hmj/KvJxzbqZR9T9rDI8D8QhJO1m/+yU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmS1nEx+4RIrlPLPtLfg3Tiei8qwNWUCK7LclZp6Ym2dzYQ7cq
	8wT516kKQ7hoSWdHS/5yEKuE/rdkCmwHy9xqPl1mqf2P8mY1oWzpNtvnPj4KlXfJT4I=
X-Gm-Gg: AYBFou1BEamZiKPjRJWYD9piNRQv+HyMguVN/f1o5Tgl06SC6naVSevcurjw95Shlcq
	IBp8hPhRnfDzjg2EwIbQ5bfKMoEZEx97ithCwS48Jp4TyU56eUGRa866N4ESdn38Ak4U4EuSpVI
	uO3a70CvNdvrfX21FOitL0oLR73A3Mi9yxdg+bF+So2d3q2vXL+hUnPjEUCeF77SFm+Tn5zVHj/
	LSXxuJwoVjaZA+dftE7J78oNf/plR5cjCofYQyA/OK00Tt90q+5Xy5k3l+x4lnOyqCXiosiCwwo
	X8tY+oA6PF9IkQBlM3ffA9blFZAbhYlHneN9KoDMPfWvkvX6ptSfE2wewnVPDXl+AoszGDQFo1W
	bvrEEWwxceSzdZtik4QVPX2/IRZt1XaYMsSAE1MQItzjsYUGZCfcASlCz6MwrPpm3I9sA/iZ57l
	DpPrf9h39/N2qlu074NHH28mW3o1VHEcIJ4Uh+f5jIz9nF+3wqf2OGThIFm7G1HI9flswVaPtyW
	8ws0iOVT9eMfNX07PfEWRJova3jELXxKefLLTMlYWXhEjKOdfhKayU5KgquuHLfM3mxwzDQ1zmC
	KvI0l2Mn3pI=
X-Received: by 2002:a05:6870:6b95:b0:4a2:4c6c:c9d5 with SMTP id 586e51a60fabf-4a7575d32dcmr6867719fac.7.1792453652907;
        Mon, 19 Oct 2026 16:47:32 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a73b2dc57dsm9724967fac.1.2026.10.19.16.47.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 16:47:32 -0700 (PDT)
Message-ID: <3f8954f1-7a06-4901-add5-fe81b3e0ae8f@linuxfoundation.org>
Date: Mon, 19 Oct 2026 17:47:27 -0600
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
Subject: Re: [PATCH 6.18 00/52] 6.18.58-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261017155104.830766652@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261017155104.830766652@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/17/26 09:54, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.18.58 release.
> There are 52 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Mon, 19 Oct 2026 15:50:51 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.18.58-rc1.gz
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
