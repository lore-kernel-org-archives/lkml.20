Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793033998;
	b=pUYoHEpEcRxIw5vmpy2EW9M180L+uRLnPqdJZ/1N8vtfJEKhe6oFyPDOtYzFv29gF7H2
	 iwXTIB+uvcGbNmz7i2FbQh90y3qwyDdQioA24euR1eE9tJ4RdQuHEbrWinohRrC3s5VYz
	 wRju8XJrI6Wi7iYQ0rn0U/9ifYFbXF6uIaysVpgH2iCFhAEpHQrps9+vyqtayE3AmLNtV
	 FJfz4J1tLe5W1Oyp5VjKV02y0/YHycifE+Ot18s9Is6PU9IcOLdy8tSou4ll+5XQlRq/Q
	 bptSuLowEbEnQj76PqW7tHwNmVwBmKLR4bSwa0FH8Kj8YX1RBBqP6F8PkDwo4OOGXfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793033998;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=tz9jpCHJuuihYoFsJHjUWPfDZzHDI+xFwdCkQ387VRI=;
	b=f7eL3uQZLMkLpFN1SRhXxSJcdzF8HPxXxKmnPj5zPHJU8n8wbL4fL0kfGpjozuRs4uFv
	 Jj+Y/Yj0hOJEQBf8/YE8/6a/nPTkYEEqnbeh5CS+WjPM+KKcA4EtqLc20W/PXUtcAGmS6
	 peHZsgKWENw/PeUklARDNFVYAhgrEGwlmH+Aff2fD2xuORPiiXZt80Fsx+knmlYHz32Lz
	 ukQpAM9VwF3YuIcisACQKXUIpZhBDi5U7T/gAIDlexORn4QEr0TawG6yJIwSyz8SCpIXx
	 Fkr6tsr10s1lUaJ3m361HiO/yrRqSW1ybAAYvJRUe3eH8iZ3vwDozQrsqyFqy9gsfOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qafq3Lke;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65D3606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:59:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A65D3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qafq3Lke
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ac451e128cso2361374a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793033997; x=1793638797; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tz9jpCHJuuihYoFsJHjUWPfDZzHDI+xFwdCkQ387VRI=;
        b=qafq3LkeHnyOINw5rQ2/rqLBP154JO0BfwUIFdzu5xROQ2AcHWKQufHGzhn4ZmdL7N
         RjdIy1SFQtZbkION6WPUWq/U53tz0aRowVFSicvPvybpJxXi7jZTQqZwUdEsATmiVEF3
         +E0fjpT559dz2DS4dyFzzEf4WoYiX83WyVeRG62vb7pp19f4tIUUVoXGHmGhP7iRW49u
         YDfWxkhY5CDdcHlz6ErF8yWMJMI/61yBr3n/+Y7AhabO87SsSBvduKenAVUr4WJmzylk
         XwF3Zpd0TJeK7yA/AO3ac/6vIY02SPkiBqhZJlOLub6HvmAzIiY0Ydx9TiKh89Ee1oL6
         KZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793033997; x=1793638797;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tz9jpCHJuuihYoFsJHjUWPfDZzHDI+xFwdCkQ387VRI=;
        b=CQB9kbjGCArpBHX7j4PNKXh8QEVKCTtfqlIXyd29tUeXo7X0Af5j98ONYNmag4LB26
         uRtC+u3ZPw5MqlCegSOYC7Mx92HQR0FVdy/phCcp9eYmFtIejbHgAGXRgXqPriItkwJt
         JTiN7ZbUHULR380V/BO5vP7e2e+qssUQ2qNWFXXAu8WYFwlaBk2r510HQ21Dvz1zGywN
         FGtAW585yOOdTS3/lGAlTqYG5kR3FHetXwl4hCzhputCzkJ//D3bAte+U7lqAC0nxZqK
         /EVKngHAh+izwgT6iow4UfeuVYsf4S6oy6a8GEacV7cIsqZWlup8w9/nMAh3RAXUs1zT
         zAeQ==
X-Forwarded-Encrypted: i=1; AKwUvByUM8JN6tjrr9GbheF3gfHr4kcufAJmmuHFbEu9A09gF2dQ+hmwoz58nJ5aN3MZ1zHwCV1JtOLPtC8wTvI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRh3zqky0PU6t2abXIuO2BAgOpQLA9sg9Lu179AHHibRW/lOrU
	nZB3DSw37Q4okN/hymF6E1YYRhZP311nyAXTOgF39O0r7Th08MtHQKlB
X-Gm-Gg: AYBFou2I/lY5zjYY0z/m+q6Upj33wTmqlk3uEJ4soVYkltTlxG6wBoN0Z11UQ34+QNH
	SzfBGByABIS47+qhIP1wr/Oh/UbVTRfP8u+aTgFozwR/VYHFT3cPt9imRMZy7vewV4XKYEex9UK
	AlpHh+yiIPFV3QGeBERgVfG9G2w8VzF62Hu7ogl66NLJRwE8gdM+6qRlgLBiSmB8K6FTiZMzV84
	AmNcr1ysyk1292e/VNffJiOZWEOrCNBKhl42jdJKYfolpHTOktN6QxO/K2wEsfs2bRHdEatSNlO
	jSqbK4KRN3lnUs/SzPVFw4NQhOkW/1FQrzXE++RHEsB2wohqRb4jj5BWaB7Aqes1kgMhwepjUAw
	ra3eQzBa1vNWR03ZD+S5MbFDSecSpaox5eqbwFDm1Nd+4AOR0EY6hfXOl4xwpIHHRC8j//b+USV
	W/tpxHY7CPN6WzWVVPupzKeL7uUW+Z8mZPyQGfLXCJ6r0LJJXI1Mabr8xoR6vycLlW8CTk+01Ol
	RbUAGg/H7TaHyv3El0lNyqY7OQWkrgSHRdo2cBzn9RnI+mgJiVg5sLD4N1F75RihO7s8TzMFMWF
	PZChFK0=
X-Received: by 2002:a17:90b:3ec2:b0:3a8:1a1a:7895 with SMTP id 98e67ed59e1d1-3adeae6d30bmr5210154a91.18.1793033996922;
        Mon, 26 Oct 2026 09:59:56 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae4066aec8sm173335a91.15.2026.10.26.09.59.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 09:59:56 -0700 (PDT)
Message-ID: <17e72e8e-42ba-4d81-9249-e02ecb1ef695@gmail.com>
Date: Mon, 26 Oct 2026 09:59:54 -0700
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
Subject: Re: [PATCH 7.2 000/231] 7.2.13-rc3 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20261025125805.309934791@linuxfoundation.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261025125805.309934791@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/25/26 05:58, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 7.2.13 release.
> There are 231 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Tue, 27 Oct 2026 12:57:40 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-7.2.13-rc3.gz
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
