Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793990900;
	b=uzb0VUpyr292BJNBiUKiLHkMkWGAyCrjSBlKU2cDh7AltxUtCBaqt25syLkG+wSllGy4
	 BrOpAaSbcwOrsur5SdWHEzBZfYBrIRChXbcSKoTN9Hj4oGJISJUJNXVhFc2tNrw2N8h/F
	 elrMhdZ7uh0oqubNoQ3uFc37I6G2wtkIca2fT8QlN3OfGxf6RGnUApf/QSgdd1kQMQ3pz
	 SiObCSAF7KQdKNeOJPSJWo+7EnxCsJw4LTZGS5ZwU7+BZANU9EFjAZZE6QEQB43Xop6pr
	 zFplfSdzALqpLyoOa+UhcGFIyfF6Kl7RCs5sJ17Fblo/5JOeRN9tY8YHswbK4kSFoVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793990900;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Lh7QAjeNlS39ktI+dlJIULFlvwkgAS1H1OKsWGYccyg=;
	b=1dU6mbXyPknO29aCyI1sEp1EMMuw2y7FelHdblzW5vpeCpQAlNz7kZMTcTr+X9uEn+LW
	 r0L85lORmuHoqXB/+vaEmAbEcpQfcTQgY55wIhPW5QUjcjT8I7ZZc9NR8aRDbEDJ7gnLA
	 7ESN28YjeYVKE9On3elMpysQoNbWlm7JAfNSxc95IFipZ7WSTggkIbjRTKqB9OWwmHmKM
	 nR90kqlYI+HpLyvL6c0CY1ln150c6aIYly9HN6iGLpXOhpTUVUuvwbIHrXv/7fyrOUgOK
	 Iv8fgmrTSRaokDxVqcZGHzrDoZ/3WdHMFB0os5CxviRPoy/2P6sSWKNYzJQ7l02NvpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SFFBC08W;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2948606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:48:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2948606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SFFBC08W
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36f8cdd30beso1342565eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793990899; x=1794595699; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lh7QAjeNlS39ktI+dlJIULFlvwkgAS1H1OKsWGYccyg=;
        b=SFFBC08WcZtGzmZeMUwARd5K2V6POj20bd8u0XsZSWDzfnpZ3TMWQqLqV1Fx4HUWTd
         mr4mQRoJlC9AuJ2ReOuQ4l07U5SCIDdM2i2O2y79k5jLzNxcmKzO06Y+SxAeeFnTimax
         bPISaRFa37iAoDFl8Uo5DIuIlF4NATPqX5YIQD2MXwipjO2N0FNWoG537jXWrq+L/9dj
         usC0S5+y8c1fZYR0bhM5znk9tGwRABkXdWWowDA+RBzovAIXFgUr0q8soeLEcG7Jj2xc
         tqOR+VtEJCFbdjF+rvfvQRFbeGy2xCzhYMxItRi0bMslQ10TzG30XfwrZp4PixlZFJ/p
         Dk0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793990899; x=1794595699;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lh7QAjeNlS39ktI+dlJIULFlvwkgAS1H1OKsWGYccyg=;
        b=TZXsxHaK1DZQl27tf2LcPtoioTPryTdotezykGBfCDqvZfY2Ytdubwz0b/uliooUXj
         0AlRGplFmxitRTIPJw2NmUXQbBX+sXW8TUV9KwK0RgIzlkW0lEZRGFEh8TGTc+v079FO
         Rzg8wisOmNXouYx9bEqWAafKL9v+uGDrXoumGUkRhUHH6jSn1eDlkw3HYiRCcfg3dJXx
         FGpC1gGNYbI2P0hYUh+qKfM2AGn5D3Sq58X7h2WLXeDu7Ja3ca8tPxch5dTVUrt164I4
         HeM6/p85bXd0/Wc0w1S1CGq4H0BW7YvF96RSyw2zIaKtwJsgbOnqACL09Bc+9HSLB88U
         C3PQ==
X-Forwarded-Encrypted: i=1; AKwUvBz5u9E8TlxMAzosFZRm65YcPuO+yHolZAkDJojYu+4joIkmkU01xjhZ1fZ8ea/qhbLkNxgGWeL9qxz1p00=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/q0pzq9KQJ0vNtxtO9q4e+kRodPafJMQ+jcigQh/Q/te8S/O0
	Zx0WWLPll8ezwxsf+ZYxaKkdZGczYsTYJSIGkPLVcjO69UCjnCx/6+bl
X-Gm-Gg: AYBFou0hsSVIDYHmltGJnlKn9DzvHeRN1FqU5l+fa7qukadXAzbNfJpeRG9c4Mk6uvM
	dTN+7LGOAIccZBDu5EmN/3EB22GDxA6rqjFK7fCczYKYLI+hQJB8UKz30G4gQNW8ZNoGpWFWy4K
	fn+q375vzppTz1P1RCBjOQI/M0ZbihqttW3fryaJBnDyccYM1CLxPpEaExeMPFlwcM942rgWQl3
	dUQGWLadNOVfk6WkgqkGbB6GfN7a+qXVD8MfYFebNacshUgTUA5v+RcpUufVHJX2OFWyQqkuN0W
	bhcQWqgYQcB6kC4ej4nt1najzlnXbV5vv1ZUhOI4RwD3vOdXxaKiHXqf0/bfpEpuiKolFhLnmhB
	R+09COzBfu3y9Ef/Vhv9qlqXgTgRLBCCOKDKRi+r84jM7Bl9j9w/Xi85i+ZdJOxvQLJG6vOMtOD
	pVu0vc4pzjnYNCoIMbdK/RySXHLoXcY5Y7bhMbN75bo6uqWUvMA+6wRYqNR3Qr/XDLNJycp4/cj
	GS7zwEAmsFmmYVadSXbMu44YMNbo+8uUyECaFiKnmQYPeAKPaZEsAE+mEIJvf4xXDKTuFUNqZX2
	LLyfSP0d8E5b+iwajL3FPtcyKlaoavK/
X-Received: by 2002:a05:701b:4588:20b0:17d:7b45:f927 with SMTP id a92af1059eb24-1b25d3499d6mr4163431c88.33.1793990898558;
        Fri, 06 Nov 2026 10:48:18 -0800 (PST)
Received: from [192.168.100.6] ([121.144.254.242])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4879adsm8661940c88.6.2026.11.06.10.48.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 10:48:17 -0800 (PST)
Message-ID: <60362312-e40c-4d23-8476-1b554fee19da@gmail.com>
Date: Sat, 7 Nov 2026 03:48:11 +0900
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
Subject: Re: [PATCH 7.3 000/547] 7.3.2-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261104211038.406938024@linuxfoundation.org>
Content-Language: en-US
From: Joungmin Lee <leejm516@gmail.com>
In-Reply-To: <20261104211038.406938024@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 11/5/26 6:03 AM, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 7.3.2 release.
> There are 547 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 06 Nov 2026 21:07:23 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-7.3.2-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-7.3.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

Tested on my ASUS Zenbook UM3504DA running Gentoo Linux.

Kernel: Linux 7.3.2-rc1
Architecture: x86_64
CPU: AMD Ryzen 7 7735U
iGPU: AMD Radeon 680M
Compiler: Clang 23.1.5

The kernel builds and boots successfully.
No dmesg regressions observed compared to 7.3.1.

Tested:
- Video output: OK
- Wi-Fi: OK
- Audio: OK
- USB: OK

Tested-by: Joungmin Lee <leejm516@gmail.com>

P.S. This e-mail is sent again to all CCs as I first sent an email to
only Greg by mistake, sorry.

Best,
Joungmin

