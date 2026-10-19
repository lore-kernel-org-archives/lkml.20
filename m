Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792453960;
	b=qk8elnZ5ARFFrRVxE9D800lqFbum1dJmYq2k+o+Zz0dSNVaGSRXM7FlFebFa5xlL8Een
	 lgK+/OY2xAoHty4x4OGA86VlWjJCn/ly5bqDPpW0N2lHShaWB6BBMSmn+7XXH8AJoZFS0
	 Z/41yI7JsIlYfMlLrup6xNr9Cr26GqRmCsgxQMPmVHjce3jWAEl7AGsD6W59mf8+6Yaow
	 TE6atDmYrn4ruXPFl5IW43a5RBNWo/zhPmB1jkLPPdJEkLLGRV4mmo34qCjXXhVbvt+WY
	 SG/rcqfW4ekmXKSDMdXKzN4a7ra6mwNyPQmBv3aw2amQjgNlk1KZXh8LNAdZBiVnUNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792453960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ttyZRwyHx05poioOuaGhTlTLSeN4ZZB8Cywga9DS7rE=;
	b=sFRe9lM3eApHMlwAIATj4l75eRrKE5PZrLyI4hAzcx2cv2SccMIInd6HvS08iDPISKdA
	 GbOt4i/zbAsNNFyv613IXNxfgzPkiD4wFvUeJd1zv5R3h8TH14UKB1EWn5olkdMNHpGCc
	 /4yu651tMjiz/FPXbJvVrcEhxW4c2rvDhC/RFDXvfdhoTtCBL+oHI5kQKNKY7uxZgkdj5
	 FIAOuZJlx7ikfGltdwkVVi3nSECwQ8aI5PK40qqBqB9j+xzcWlyc43WWupuwjZFom5TWS
	 WLaFJ6McIqzxtRy1AP7Xt3bjuLc0ypi4NpYB3L3u0htRyTELdQDx+/HfX/XLsOUDjuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=E0GhOSPE;
	arc=none smtp.remote-ip=209.85.167.180
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C27606A319
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:52:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63C27606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=E0GhOSPE
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-4e4a4d77e5bso118801b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1792453958; x=1793058758; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ttyZRwyHx05poioOuaGhTlTLSeN4ZZB8Cywga9DS7rE=;
        b=E0GhOSPEw4CVufvXJcUm/MzvnPHsf+6Nn4h31TKm9XkHR/q3Cyn9Ljd0MFY942ksY6
         YhGNWwanrbgMDFbBIoaSaPlqnifprzm02MqMPZmKrNEUB4OMzej8YztcDy2kkxIAcqC/
         nrF0/QYQiIqOWDjxwYi77cAdBEKFNXF81KDEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792453958; x=1793058758;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ttyZRwyHx05poioOuaGhTlTLSeN4ZZB8Cywga9DS7rE=;
        b=NBiJ0BMJgNyEYRlExJrH+wpQMQOWza/N8hxKZzJZWcVuqj0uZI1rP9BrVhhlJbqW1y
         67eONNuhbNjlXa8JqU8+SuGpMh5K9SoIvqfz6DXQUm1TJXXJQ8y6nxrsq2RW7sN2mIEk
         K9tprVlOHGE+4062tXHRRw9dBNhoRtdhDnEmMeK4wwaHx3R2F+6fgzEgx+SU43tu0ar9
         UYTq1rLORwgXBL/gQFRWkFyppWcrC8vXEE29Vbf08YPUk0sdTy+cP0LOgXhoeITW8WIX
         EIzVwRHFETAXvCOD5/rW3Ml8Zwo9/rub/GD+1+fkl6TCjCMviRP9p+bZ+LT+B2KzeqKl
         6cjw==
X-Forwarded-Encrypted: i=1; AKwUvBxDyACZi9I3wx35yiu0H2SZhw90aCvC5yv8CFRYMfzn0uGP78d+qIX4OlVkM5n381vdyEfFl1dUKxBGnKc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJf8dIbXywonKiF7npGdD+l1V07RqpOaeTx7OyxaSmIe7HSqPoH
	WA0WE/uMq8lxHUKEFI9Z5iQ51Ql5rh2uNVy23+a9GCyRAQYhEuzlFYrPajzrlegqiSk=
X-Gm-Gg: AYBFou0IB/AOlfn4erl3EBiBf3Q3yxIog5sYguuzcI3lpiSvO9I+PxC83Bbq+IrLEpG
	lXMRNypy1Q7rMIAWFDj8z7o4MzZ7wzEB6wOuyZOBApmlsS7E5EPyvZ7LV2G9N95vFU4/pZnUS3N
	gYNLaFlj+lLgcBLRiINlsChsQy47knWhbYF4mkftX+qFc3U22YF3Z9/1UCwGa3wBON9xVsomKEb
	Sk8hAjHzBhMsWVWSHV55yNC9xjx5E7Rmx332kWVlIORBkIWaFXwAJwXbKwNsVsHk9tc5SEliUUs
	TRgX/RPNXfyb9H7cqwc5yptpYPHM5dtOwCQSEdUTw8c5A6EYH9tHZd9o2l7s/1DcNj5AxCMTw3j
	ZivGdoA18kq1KV+oVPBkIy1l6Y0/vM8FTQsMQne0Pu9pIg6bgyJotBJ1P6RwcwNf93EDW5o2vN/
	jIkVDFnDPiYO8z9d+oFClBt6tU66GpUmuloam/+4OxTxlDfTbptsZtlnvi+vOLBTkTJTtO38H9l
	rvSj9P1
X-Received: by 2002:a05:6808:f0a:b0:4dd:f8bb:e1bd with SMTP id 5614622812f47-54d90fa2165mr420470b6e.13.1792453958309;
        Mon, 19 Oct 2026 16:52:38 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5388c1654e9sm7801946b6e.8.2026.10.19.16.52.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 16:52:37 -0700 (PDT)
Message-ID: <0357c306-e1ab-4a66-91cb-2002c1f23f79@linuxfoundation.org>
Date: Mon, 19 Oct 2026 17:52:32 -0600
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
Subject: Re: [PATCH 6.6 0000/1674] 6.6.160-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261017160431.119607952@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261017160431.119607952@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/17/26 09:37, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.6.160 release.
> There are 1674 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Mon, 19 Oct 2026 16:02:05 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.6.160-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.6.y
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
