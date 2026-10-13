Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C0251B19F
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 22:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791930129; cv=none; b=AZ1uMjs3Kby24FZbL0oNJY6C7Hv9mtZTZ50LrgblPwHPmFmK06c0VTrdJKMZfPam33EjsLbZApRKwXH8fDkNc/NwFQ4Vs3pyQ8OFKWla+vpP0OBzORIVtfyBV/iH88QtH2EbCL0LkIWSJrZep6sKbW5CYXEZn51aNcH1cj9/So4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791930129; c=relaxed/simple;
	bh=i/NPyVftPT0T12Rd9vFHPH/Apd81QBDPn2/gafvAB8w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sL7vtzgdzwyYALjdRjvucmPzNH+Ts4c3H+f8Tng3OcBo0kCu0u2TYJsBqjQ+AERGRH16x8vAX7U43i2HNM/UvrA5cAAIxTTS2ymZQ+vxg61WG8x0WLqTaWLlgu+hlfNaDyi7FfcnMgul9wfBmDUyIBhsleetxay004x4SE2SBXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZOCnhEMV; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZOCnhEMV"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-48e9476e26aso1016800fac.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1791930126; x=1792534926; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KmKTSpwOIU42qw50Al/lTDECXTvDeMIBF7vVv/OZdxw=;
        b=ZOCnhEMVzvAqvzzmC4nvoLuuUg2gDlahIYFe5hGbc6FEQavPcgYAr9OGcFa0vQF04S
         94zMqSUfSfNJSAVubuLWjGLECJSa+kI5xMvyVbf94TjcXTBkRo0XNQ9AY/PRtQFxr0aK
         7bEO7ds+PNfSacosCqmcqsX5gwHx5okwATBFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791930126; x=1792534926;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KmKTSpwOIU42qw50Al/lTDECXTvDeMIBF7vVv/OZdxw=;
        b=ThjqughfBGWvdY1ntaAPQFMD/BibSm3csP4F+G1iTHM1RgtWQzpgeiD46a9KhUEDBf
         uXhOTniPb2F0hU8p1qd+Y4Lfmqn31955qy+bFQm/xKCZYO0ZtKL/seXrOT3uTAUqBQy4
         RRqo3gC6HhkXppmXR2Oflfwk7F50YyZHr54zmjoeK6NF2um3m+6FmvtDPbjmsiYzFaYn
         ttBe/rdEspuTcG/6BCL9Ge6O0RT1xRyHkjcQgM+g5yLk8IS7YVK8UWmbZabhKaLKLbh5
         IQmsBTwLBjeAonwyu9/JTlZfYAswjVqmPitpaAvfht5+oacUn6ibjX1o5aTG4qcgDBd3
         yXrw==
X-Forwarded-Encrypted: i=1; AKwUvBxx1IIWYSWVyyu8yAEkhXc0vLagKcMXpra5d87w7ydiAILYQQWphkBZbgANA5It9S1LDTsu+wcQQF40pqU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHPjNK2vhVf92DFQV3bJ3VmsROCGFr+sLYQAcfEZYR4t5GLQMm
	Fk5QEkMwsRv0Za+OAPNOszj6SdnlcXK0mJJFra9+2aqW61ZGlLk+SLaFpY7pMaL+C2g=
X-Gm-Gg: AYBFou2WUzRYdkIfA4nDRMCWFHfx37b6mcwAj1jEGxl0jh2IQ2lSJjc4WoCFcazvSo8
	8Fhk7qJFVpPY7NhrWwqnKBQVQpG4EsPiDHlJVS6zBX3cpzoTj53UZcBKplAkyeM/8kH6lpyUtEW
	iQ+rqhq0mDbVOrxSysPeW1uatXJ9H42pcUNcOnrRH8ZArWmgyuX+QIhXYT4+JgNznKJvZcoC0c6
	B4janNzHok6vAzo0aM1lYweOq8+y7qjDzyiopJWctG702UtqfRikNUQIvXk74xu375KY8P0WVMK
	5KkWcewcqMY55whLnvb8p83KQkvuThompWdq7fWAYwuLU7ySVUGms9v9rCxgswpexFpHngRbdew
	EsyoGbJFWd+ZiKnx4Y6D35Eb1IfoKKK1geIxz0AB8YTtwfElpCj1gK6sPsKEGCH+MpORk+bczRv
	jPmHdcA5rkQonU3j8+mJ251RbNzr2o/C7TRk017e25ACr8EsGwy1E3d/o3zglt0ObpSsvfCXf6Q
	cdQ5boGBZVAc0sziA==
X-Received: by 2002:a05:6808:1241:b0:4f6:808e:3838 with SMTP id 5614622812f47-50c582328f9mr13009581b6e.52.1791930126129;
        Tue, 13 Oct 2026 15:22:06 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-50c0c5fe7d0sm15210133b6e.2.2026.10.13.15.22.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 15:22:05 -0700 (PDT)
Message-ID: <d204bc9c-531c-45c8-9959-9ffa1aa691f9@linuxfoundation.org>
Date: Tue, 13 Oct 2026 16:22:01 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7.2 000/281] 7.2.11-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261013112855.045212108@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261013112855.045212108@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/26 05:35, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 7.2.11 release.
> There are 281 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Thu, 15 Oct 2026 11:28:22 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-7.2.11-rc1.gz
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
