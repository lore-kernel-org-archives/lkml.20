Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793040078;
	b=Ec9wwFidQ0H4FCMaAVrAUnDRmH5wLCEPLrAxklZQcIKb+zFUxYAn/3BuzAtnfov36AUs
	 2oCGGQxGmOamrl+y9/e4Pn/X7omdeTyHQDEjWcY/MUA2Qd2MXtJfNYOPeIdv7vLu6tvia
	 uy+iINqqN6e1THrGdrxsA/pagSonsEqHbWOVip2bjxKja7az2fVb12p6CRTfSMOE9YdmU
	 dHcXKKxfkOHAHeJS14CZHksgC0GGfRcBhqiMzyMnmrazCxnN05Qe4o+TO3hQlGZWTNDbT
	 k+zlj2LjTHFlov5dIq7QDHCUWSKK7v/xADHtKLcpQO9cJ473Z1HMRH8tGgW2TTJfKKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793040078;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=g1SrbF6MexHYCEG2Z9HqDiWdRSH1K217RRXRSida3VI=;
	b=ZfwKYpZkB6zSpfNclTzPWLuj+VsuK8waiBZnstS0A5eHvRDDwAJbu1x9++Onqz5FcjeK
	 1+UsioFOZ4FhShqfXDIWkyctbhRu0Ytx7JpiuZ2+unbhjKgebaE6S7uMal2C15GNQ3l8Z
	 hhYbZmjnTTn7jxT2UZC5aUWQ+X1qVAS09dJXwZF/xcFppgTJ7a7a8lWkmDEQ66kMeulih
	 Y1AtOh/rpTbkiS3FdjEfmH4IyVMQDEM8ynX8ZZZB5oN9UjCQjCKsDXgNMx8jArA/7m4us
	 nsEI4SpcyOfGnNZZlayyf4xYkAXr4dZ3TPD/i0x8sttswNi4V9oDSJ3YJhBlZPEGxEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=Gs72zGSW;
	arc=none smtp.remote-ip=209.85.160.41
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98256606A325
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:41:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98256606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=Gs72zGSW
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-4a822463a22so1855621fac.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1793040076; x=1793644876; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g1SrbF6MexHYCEG2Z9HqDiWdRSH1K217RRXRSida3VI=;
        b=Gs72zGSWLplhI4YGGyxTLX6F3MV/6q75OPBFoK0d54H4NG0ayR/xMgS29zw8VNY3Xx
         En2PKwL712VHdJFpxx2QT5nnIGwiC9vm0iI0dS0RIyIz2df8TVlhj5IGP5x22qsUO6Ly
         aKp2hSu2WqgpzhrIcswbCU5rZeYhJ7ma8F0U4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793040076; x=1793644876;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g1SrbF6MexHYCEG2Z9HqDiWdRSH1K217RRXRSida3VI=;
        b=N7v0XhdKgoPd32TW/743JOdAQHPZ0BeRyLeymMG7zyQM5wr8BeHPMGwKZkW2AD4bul
         LuuPzvUldbFULR8EVaVX9dNLbTrOcgBy+zsloIy+dmRiaDQwYcvcmwJFt73CWO/lGwbD
         g4G/kjeGOzYYY8Luj7gJ9ScRlhL+Y3QvTp+ZPQjOpcYSHlbmHoJEhsc8Hj332RmX3xoW
         WGSnUZS+nFKdEF5g2kxo8xPlTUatvCmqEud6r6CLkhgMHttmHpK3uBrVtewxLp8t3kEy
         sZXELHLsp9CjgKYnvo3p1oUIkglL7HdEbTSjxehPw71o+Zb3CVynG2b26FZq680QEv+B
         NsQw==
X-Forwarded-Encrypted: i=1; AKwUvBwSGEpv2xjGnVlPW0OKH2eZocZWPltQWHpYWzJL44RNJBblkPnZh2JnpeStoBkYLVxttMxQQMmTuWZyYRY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIiKRljvRnGQkvHHQK8U+tV338Z+QfEnQG7RMESCbbSrrNbhVBI
	xR/j1Pe1h4pjnjMW8W1d3jE/Po4+nZFQe17IEmip/nRzKywJWLKO7PnCsMjL49WZ2vI=
X-Gm-Gg: AYBFou2ItpRGk+kNoZz/C8E092mVASEv1sv7si/7KGTsWADpNooegpH/tn/qwmNRcnt
	vesTcDvF8b/qhjjA3Oo47nhsVXnFvLRAlz21Hb8tZuHeNDgKdOihY8ZiwuwD9fRwFSVHQk0AN8b
	Tckibbx8ej6oLD/xEuQ4J6fnYUtfhyfZrWwPx3fre9D0eYb3fE5l10QvgbdeBjEKH2/MjqfT5vT
	Tv2Ft2+C11f9lGxqab1tL8zKRYL/s+zS0a+ujOKQRU16YsqNyjh7u0MeSDs6z4pyq12MQogbKML
	dwRD32EbFiGQDaHTuPK555HFUHlRI9zaq76hyvq/HxVXsIFmmh52HKp6kwbWaRGU/mwtA5SzgIu
	70ITqBsl9T1RpxZ2vwxVyr54J4ZzZeVysXbkKPsXnj+NMj/YwsAP8yN7Z0/43/ZLJ4uLyI/oEou
	wqrtLsuM8GF4ccLZhljb0uqvTd3nOw5VIASswfYktbJUAIk6twfj9LbwYTouMCdFFO+V+2SJ9Uc
	rqGJI6O7Sz/A0Lj9IUQ65d2xHCfdgp3417eTM7iGry95wbjyowFXmbiA08Syj9bIA==
X-Received: by 2002:a05:6808:c40a:b0:4f5:c4b9:dbfa with SMTP id 5614622812f47-55c0030f23amr5326997b6e.48.1793040076466;
        Mon, 26 Oct 2026 11:41:16 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c04074375sm6051582b6e.1.2026.10.26.11.41.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 11:41:15 -0700 (PDT)
Message-ID: <855636a8-36f3-412d-b4e6-d780fd1ff85c@linuxfoundation.org>
Date: Mon, 26 Oct 2026 12:41:08 -0600
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
Subject: Re: [PATCH 6.18 000/193] 6.18.59-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261023163714.201276352@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261023163714.201276352@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/26 10:34, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.18.59 release.
> There are 193 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Sun, 25 Oct 2026 16:36:50 +0000.
> Anything received after that time might be too late.

Might be late but here it is.
  
Compiled and booted on my test system. No dmesg regressions.

Tested-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
