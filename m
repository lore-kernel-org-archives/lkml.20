Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793394326;
	b=4gFSqs3dAcgAbtFZRDVEAE1seSyFSxH7UMoMGU+KKSv/GVix0TCJNT1i2W/d9HNxuSY7
	 6ObYkG9Nn4HdtEfAzs0ITZ887TbZlAelilm+w6R04GQUxgSuqW0mj6FSj1L8FWitZ1EYv
	 NrIrkRMgoW3HBzd5u5lHnH+4hTEzQxXHozP++byVKLWHA+lAva80MDvsw8BTeZdalxKPK
	 CL7s0KaQPcceizxs0mK0XvM9DDlQfPAP2OgDp2e2d8tSlA9dZYWNk9u5qEgdFyUXs2kIo
	 1wgWNhYT3nA9aKIZI69PcyUY8gr1x8+i6df4GSaV0t4X+dArSatES6/gZY/t5bmL8gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793394326;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Y7H7nb9mTg2yg96+dA1v16VbiSLf+tKxcACbeKkZCEw=;
	b=r9v6NLEdlAWlB2rQWav4882PXD3WpZ0UiHO3IXDtqxLQYJasAIsZY+d2VDOwEA3+o9Bq
	 XxXQtC5gVIEjBbQynDNwITTs9jB/O2GxPsqDpnZrq5kqt0Ro2BbkzVBDyUFUnrXTWXgKL
	 eHN96RF9qXi3QeH07RnKFZv5Hr3Rtd6kEUQfYJxWlb6HDCDK9zGDuOx4RL2YPa9ZLlnyJ
	 QhUNl9QY+d6UaKOdg/trV5q0yEQYkitlNv0cO4/QEob4F4lcN9PG73Pj+4sOe3O3+5swR
	 La0FvDnA56X42kjmhYsLH8/0GG5vy7l0lM4KduidP/8Ihfb6McRTrQykQ5fnQItMugw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=cIFigwcs;
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83798606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:05:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83798606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=cIFigwcs
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-845f3fa7f38so524176a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1793394323; x=1793999123; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y7H7nb9mTg2yg96+dA1v16VbiSLf+tKxcACbeKkZCEw=;
        b=cIFigwcsUzF2Ea1wKU6hHLN9UxujibfQ/SQr9OWt/QSZPp3s7gXfTg7oRDGepbn5Nj
         HJgV9jvzvHJd2/g/esIE8e0Ok483KChqxpATCF5YaSacRnZMq5p92Og73wiFxz33sRDH
         sLpRf7WvZHNGkWjnSZkG3aTxVCNTqNWb2578A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793394323; x=1793999123;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y7H7nb9mTg2yg96+dA1v16VbiSLf+tKxcACbeKkZCEw=;
        b=A5IRC+Dq5RndEmXNk1Ui4P11CIYEVj0IYe8/l16VIN7eNG+JExPZ/1WY9TQFNbjuWg
         IWwP9PbUz7l9H7rnBXZ+JZK4uufq4hWv9juIqNqaKR7BYEsMIUWidKmC3ePlReyjiHg4
         zWOynLMcZvL8ftSD7qDqm6HtIdu9xnTYZamspNJnKlYx0IgBwc5MgLwp7rbaS7Ejavpz
         F6qkPpT8UuVT5AQfPEP8n4hax2jzwTRmAlBRzMsYxMiZmqti9wOWbHniGcqRzhij5LOH
         1vjJx2M+85EgoYJXaaw50De01yycj+IT+xRfrocfDEvAY7WOlpnK0iFcTtMY+6UTAnlH
         XMEg==
X-Forwarded-Encrypted: i=1; AKwUvBxwh7HKw6IVDwQps01qfK/3s17dLwgdb4WYCnGUnYajZAv+bRNpqiG9415b20Ruq97MAhyTGgJTxPC4LiY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvZAsLfvZVKLq+RovmopCy9dSSDa0wlWa7tIOMnylGCiq8zaaY
	wc9OhNNXshQHtJFbqSNkakxrh4uOWDSHpoYinKrYJXaici0ArY0fYVi76AX1F+8wsSY=
X-Gm-Gg: AYBFou2unzpr68tcRIeeC56ky3zMkrfx6ttuP1yODs8JsuU9DdaAmWzxnhUke2yrIBZ
	h9slFUk1FhJmxoOvVPBqTZO2FYKPnV2KeEVAapCxnZ2fbgWjDkibZoty73i/Q72lGlstKI50sJa
	I/+ZVR+Ix75hMZX2VysC54eZH9BxCCPUkKDl9hAS5f1WahvoQaNs+QNWDte12sgxmO9huW1jmAQ
	Zifm1zVxsZkSE/cM2521Eh0UabzyOVOOFuFiUOBATkNDgbC0P5n9bqpS29TZfSad6aXcGt67pqd
	Z6vOxqnZhEs3AqEhuOPvhLPVTsrrTDKwcWqHmjiTcnhHkJbA06Gka6rBKFILWoHFA+pEZJPzeCI
	aQCist0XKTt4jrmdaEUNdVZAD1psPbFYGh/J1notzmq88qSEsydVnMP7/KXv9TYgpSpYMo3gKPb
	MmYPDGBKPI43SLf+A3JdMi7zoteXZO677lRHZ7Bd+YyZEad22W1kzCdyvCXwGg2WFXAM0RrY7TV
	zM7CqfCtYA3W+LRcvn8AeOobtNm5TPLmvIg2tynZh5dLqBAPqMvNiDUPoRpmARlP+4IlRDByhjI
	BMxe0z4Yzev7Z5dfy+JtAi3T4/Zpk36oOpiD6w==
X-Received: by 2002:a05:6830:640e:b0:821:a94d:3b51 with SMTP id 46e09a7af769-85d36660667mr2466155a34.25.1793394323484;
        Fri, 30 Oct 2026 14:05:23 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d3545b875sm2999366a34.5.2026.10.30.14.05.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 14:05:22 -0700 (PDT)
Message-ID: <01c04f5c-5a39-4a51-ab0a-4bb4dd89b80a@linuxfoundation.org>
Date: Fri, 30 Oct 2026 15:05:19 -0600
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
Subject: Re: [PATCH 7.2 00/10] 7.2.15-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261030121255.257615100@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261030121255.257615100@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/30/26 06:15, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 7.2.15 release.
> There are 10 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Sun, 01 Nov 2026 12:12:50 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-7.2.15-rc1.gz
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
