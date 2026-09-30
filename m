Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D0B3CF21F
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790795312; cv=none; b=Yr6+h5EZ9yf/jiEjveps9AnH8AMSeA2Fhx2KtaFrzSgi8LNELPxiOd0SENIE7ZraStjg11a7x93UdsZfy5H/z5XR09Jg+d8S93BbdvT6QrG8CV3L57ltOyjlRu0GLhvmBQUPcvOwDYNB6PnsouG8yB0RmVL7IVmxF3ri8amkipk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790795312; c=relaxed/simple;
	bh=vqOV2uF0Ci7vXHGhVG0nXnSb9mu5dZuiChUCnPPFeKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O4AHJXPpP79I6TdbIZvyLfHNrHhjkG+7fEUm5i28FgxXpTjildDabKQdBm2vqOPnEMti6+Tk9pliN607AgeRAmfkPnZy/qXPyzdqk4PWF2vsdkuswcKSttaMoFcHh25+293G0Ok8RApkcPMUEIFBur2c9EaE0v1xQa5AlSeTYgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aj49PHtq; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aj49PHtq"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-144f79153f5so27172c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790795309; x=1791400109; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d+JAldsdHwPu3ZufnjHdhfOy8fAoKYsgi/utsa5zT7w=;
        b=Aj49PHtqiWX3cSC51EUQelc6hrWLHGBYxA+5Z+aXsyLFn9JdaTpxQnUrO5PUvAAYTb
         PIX/MrKSzQSeeLOKC5fT7lM2HKWGDoz62VkESNNZhLCVAScdmG7DrVIyIngClS5nYekX
         Rz+CO+uq4Qrh4cREmRaFPc+QmPd/yU/zap6gjZEKvRN5zNM0XmsSd5p/j9z/FmskClJC
         S3ZALSBvNEGmkhjrtFtOO6ntznuIf2mMQ3aRqp7PBqGjHguoqbOUhxlxbvL7m3jHX5vi
         oAjmJYhCbs0GF3G2lItBTaruHno6AwgtGmLdhdOJryPomEediJvbQkieXiIP+kkWBh6X
         2unw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790795309; x=1791400109;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d+JAldsdHwPu3ZufnjHdhfOy8fAoKYsgi/utsa5zT7w=;
        b=xJDPcocsKQpn8Gq6rs6CO6Q+KGiV5KXF8ykU4i1DnZL+FjaN7z+sh0MElLCsIKi4rD
         rriyJ8R1hmnRRsRX1iIMZT2Fo1H2eGt7ADsLid8rxZ5R1zfF0b3HWozzz/Rry0AKzISv
         WhbQQ0H2P1BcUca3Anl3HlJsb7VV96DUqvXDztymgKjuR4nRR/RlgYlljRJPJLxbFzKg
         cHOnAfII3z4Kzor6xJnOKQYYQb9Di8xdwbn2fiAKwcvGoMkayHQisjgQ6kBOhJMMn0k7
         CcFk9bjAkVb2M2TagP54hlecm8gAJhXuIzGShwPNzGjpg9KIL+tbgm+oQRfVFbgpCt1G
         vAmQ==
X-Forwarded-Encrypted: i=1; AKwUvBzGrKzVlePyPWn9zxdoNHb57a+05IF7rI7EYsNSboddwO1lsdydCLlg70LfxJUlFGcv7+si0jWX+uYxoWM=@vger.kernel.org
X-Gm-Message-State: AFuF++kFGaQ2JmUGajoJqQhTXE26v7iNc1SWnPDOiN0ESrWzUEzUM5ft
	pIuYjeJVYBGXeQW/DtHxJ7qFmGGlTN19N/5qb0ku7HuGmwFgG2MOguly
X-Gm-Gg: AYBFou3iX2PhxoibzD4+bi1Mcyyg2MUP/Lv0oX53/FQw7tYQx2MaZ4y1N0VX2eXZ3v2
	BSPiq4c8OfojVQfeb2XeWQOs4HrC90Xeh8IlAlBQ+YRzkBJzonjD0V4VxFlaPRqgwMxuKPh7ky4
	ezygyAcLdj71j2VpzX4F6mdHCwQKXRf0N3IVh0+A/+DnGIb5e+cs5oDC7/VwKQZd0zgZDaZvuvd
	0+jcr9vNbnud324r5fSXbGFXLhhYQg4Liu3JhWr5wLp9TFWGKYixp+MLP9eKVCwlj7r7LOjJA8m
	NlosnSosNxag3oWKvAsYjIIsJk06yGC7G9/Y2zXW1EvxePzBiK17WfRZw2yZCli+FvHXQ3Xsssl
	JBZMb2cS+Z7Zsi+kACGv1j2daTDBWGSWq53DAw4pwt8KTcVzTnsvbYmXpyjvEwzK+GsSmQGCqKf
	5wUd9VD/XroIYpiarnoXXjft7DbQZb74SezEcU2mIiMiSNGppdWWI7wHOMRrmWDoGm6zoyg+Evk
	qhkMa22DYcVWNsUJEFOtKjVoe2+4xnRC71fqMc=
X-Received: by 2002:a05:7022:1588:b0:143:1bb1:32ff with SMTP id a92af1059eb24-14dd129c6bfmr508585c88.16.1790795309223;
        Wed, 30 Sep 2026 12:08:29 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14df359f15asm285867c88.4.2026.09.30.12.08.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 12:08:28 -0700 (PDT)
Message-ID: <a9cb7dee-2c63-46e1-ac1f-ad996b4eff6c@gmail.com>
Date: Wed, 30 Sep 2026 12:08:26 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.12 000/877] 6.12.112-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20260930152414.738996857@linuxfoundation.org>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20260930152414.738996857@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/30/2026 8:15 AM, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.12.112 release.
> There are 877 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 02 Oct 2026 15:23:04 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.12.112-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.12.y
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

