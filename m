Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792453801;
	b=GaDmK0zZpGcwvNBJneD0mIkxeA8xri0ykXHNuNMW6yd4jA4UG1nA+/KQK10Hvfp4HXnk
	 EdIZFSoOIf/l0J/WRovobabhZRSG1qvqF/QsQqgv7FfS3c07VB3nxlokInbLJeUcjjj7b
	 4HLi5p3eIDzgVKQ44SHz5eIynf12mL8GZdaa9KTVN2PG4QZkjS40kMhswPSrMwDVtHUfH
	 VQxoUrsbm7EwA1y8Qz/e1/TzXVpcG6Pe3XVsmNFuIxSctbEkEsOFEzEuqDsorHPFYoxSC
	 TpUDB47alHYZR8gR4a4kP/KJv/EHipYQSDci46LdjZTBv0bB0Eov46n/yzrEHjdS+fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792453801;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=DD8Fwe5v4TmgrbD+fiaZCMxv0O6FicbhV371nOaahNo=;
	b=JjG8XBhG1+QYtZXmQc6V/Ny6obH4PQpyFTw5anWSABGcVvqQNLiSlofRB/4emNzA9229
	 qKBhtUpHLwmQ19T9gHzKULnmWHhsfzlSelj5yb1AAKjia7PYul+dqQfca9loyi7TkB7in
	 n3VZDhESouIa+blG7JT4w8OXpf30k9xXS0cA0QaY1n6mcsPYpVyAJpWzUSNuh/1cTg681
	 myUHKmsaYDlL/6X80XSvAoGKSC2cpvE6/kJPkfvQlr/Y0wTPJg3NvRouj238XV4rq9qSs
	 Uu2fcAQJSgXRqIF3PT1u6iNiUcByFoUfFHe5kyNrpYkCbmX7m8Z4yfQEVO1ZoAiklQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=BuBitvpw;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DF7606A319
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:49:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32DF7606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=BuBitvpw
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-8256106635eso1147038a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1792453799; x=1793058599; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DD8Fwe5v4TmgrbD+fiaZCMxv0O6FicbhV371nOaahNo=;
        b=BuBitvpwDNha2KoIMFUJffgsDubBjIpaqFrYn8XYX9wcTIZ36LW31ysJLNvqiEN1x/
         Bo08/cpMI7CbvzNBVfP92BIIAjTE7Wirrx+OQJAr8aVbZUQjGZUlvMuihQ76VrJ10vAe
         bfydW3rcaLyRdsFezRDA6GlT2OHLpVsN3drz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792453799; x=1793058599;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DD8Fwe5v4TmgrbD+fiaZCMxv0O6FicbhV371nOaahNo=;
        b=aUenQw9ZiCPs8D/3P1HDRwT2tQTt1KoD2w5oJEuC4DFdySLhZspgtCaaSTyOpACA2z
         mDznGWtVk4V7nqCDdlMENa5SKpiusDg9E4fZHoSjgCwQiJw9r39kkyVOD+WgGsky1qxP
         Bsx3ZDJRTrSXAsOlZJlTYFEjepWmlS1aS1qu/Fv40Q5AF8Rl3Moo/w5fMlouZW4lJigK
         5rVMyO18zix6/sGsD0ABimg9td36y2nUEUHH4tl5WbSF2MrzdNuej2DMxqODgQ+pPjNX
         1+2yFfrQuGatC3Rz51jHpRxUAp7ZUPMeicSK26GYAJbGd4kuYCDToOEfnSppQzkzw3or
         jRxA==
X-Forwarded-Encrypted: i=1; AKwUvBwbQcCcNhg4X6RrDwA6CaT7hxUm8N8Kibhs+adX2ZWXdA/NIXaQOsBawJo3F8Y7+pVbNpRyBRO+lB/oCmM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKk7YNuIzXvm0Q32FqKeT+XDItZn4JvgkRyXd4K6ajAYUunXqpb
	oEOQJew/C8joM4jvZ2f6kSF8Cf150Hxid6fMuBqesYEZbzMD6O7JNqt0c6fweTobRxj1TlVvl5Q
	oymAfkBg=
X-Gm-Gg: AYBFou0qnBjrEYuHEZR9DB9h96K6ElpU3oIxnrqxPYAUj4ggNfhdzrb9FjTB+SJ1SwR
	nQSr+5an4tK2uRTjCC9XKqIR0wmqmQhjx43NR1Zu5yqA6tAjad8ZkBSMcHu4BsooHXptr3G5xW1
	uRGpJdu+SeLdK/q0XjrbzAowzH7q1SYUk/8sXl3bWUYFTnQFJ8T2RlSWVZy3jmTij6HAFIJehcT
	ioxRVeN+1CwnTJGl/2ApGDo7JFTRKNcko1oeu6a79gZ04E6iLK0k0lyL/AURZ4bK39DZ1ioXrKT
	IikyPn5FmMtNBwNvWR431/Us74+GnOshjjfN0RDieRlcIrS3OfMLsd05M4XcH6gValzjpuQLPjo
	xgVGfH72I59wycfnZjcZbfS2/aTxkWtCwpwlhM2rGbfJctDllQz6Fxp0pOv8gSZ9WH8BXDGEIBW
	zFDGpYvwqwr2uV1pURBqlljIMVSeOCMxUvgPUqZfU5eFVok2lTpzabWzb917KwQijHgQLno0QmV
	mnjEAhc
X-Received: by 2002:a05:6830:83b4:b0:7fa:5c68:d04d with SMTP id 46e09a7af769-8450097d1fcmr9148770a34.23.1792453799136;
        Mon, 19 Oct 2026 16:49:59 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-842a53d8a52sm10631518a34.11.2026.10.19.16.49.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 16:49:58 -0700 (PDT)
Message-ID: <c93ef8f1-5d63-4a99-ac1c-c07ed233e22d@linuxfoundation.org>
Date: Mon, 19 Oct 2026 17:49:51 -0600
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
Subject: Re: [PATCH 6.12 000/869] 6.12.114-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261017160036.979869304@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261017160036.979869304@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/17/26 09:47, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.12.114 release.
> There are 869 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Mon, 19 Oct 2026 15:59:15 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.12.114-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.12.y
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
