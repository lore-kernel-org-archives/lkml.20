Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794254263;
	b=ApCJTWJA4quYTA59/lUQEDPhNT5gyGfLOOZrbkyXNY28MsIg3313S8ZrSVIZksoAWLXN
	 Qz4ebZ9CCeBh1cNcsQwzHOMXn3ts1sdWcKwHwDGxNEiPYkUt2pTtt/uvcyHCAvP22rq7r
	 +50Gd7b+TqTLaJTdgnmF+jYbrxCwwkhBGupLGPBGlvwtK9FmVzwfNIkpZ3DkqYnFcufMU
	 FMbhjbJnKIdiZucamk6HeF2xlBwL3iEv0VnEiPMXGpkPCuIKw0Lcxg2v98ugp/iiYoJyP
	 vL0fkkjMLppMLXP19cHRt458yMKY+HL+9PcS7vhgoDb+d6hfydTo8eA0skfoj9TWRWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254263;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ryF0rmPWcCuMTxrcqtqsxigxvgIcsmr1UjpxNs2pfHE=;
	b=KYqaDMpiaHQQzoDtL+NqFRhsesFLZIl8kZQ6TYOQkomQVM8A29r9G8g7PrxZA0FwM7ej
	 WvBb+NMqUAFGwdqMJDuasJQRj78xean2q0U/7ZkZdrFsmOmE4+yjJDUh/3aaW4DFtnECK
	 qDYAKNvpkuWKhaAZlZOvb/LiWtUF/aOkP2T5Mbxz5RD81mm/3RRpYnAuL+PR9MNqOrraj
	 T/yeW7xpt+pThaXVsRB7k4AA76Rw23rKFI4km5vpGkxtgOuG+xL6NZEfx9o33qg07LBj2
	 rEOpjGunu/qLnoJEGb+/d9mzJZCRHAuWi59Ek2qe4SxZPo0e2yEettUqmcn11ZLDGeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e1HJJ82k;
	arc=none smtp.remote-ip=209.85.222.180
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2271606A330
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:57:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2271606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e1HJJ82k
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-93f2049ea7aso84252885a.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 11:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794254262; x=1794859062; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ryF0rmPWcCuMTxrcqtqsxigxvgIcsmr1UjpxNs2pfHE=;
        b=e1HJJ82kBcWJUsFuMYCNVRTseii7BKHVa0wrxxYryqX81e3us/3alHzH1L/B9vQnlr
         yW8KYGSJK8wi2+Tk4w0YyOAFYpMgpW5iRSUyMRgNZ/UxYrkMf5oIgK5YqMYZB0xze5EW
         x+C1Uj47YCIiCL09Ut/UY5zrvIwXuOcujegS0ldMoQtIwoN4r48hY+UBmVuPmUmrezPH
         2nJNLdyFUIcwHhnKO+jrLqwmHGaeG+AOFIljl9Q4N374z+Vl2sQDT6+75qxP40MgmKzq
         jRuJIp2BbyN8jIigbr43JNqsVAez50rJPQOeVQv7MzOF5Ic/5jxsUPLrVP9yekQQL5JV
         KSrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794254262; x=1794859062;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ryF0rmPWcCuMTxrcqtqsxigxvgIcsmr1UjpxNs2pfHE=;
        b=m+AvMk3b25H4GBgrJ/PLfaBl+9scSKhplwMKHZdZfpSZXILQORpbSMGme+Ig8PZka4
         JGA8dm9ColWPn/Wew8yJxx9W7sjR+xbC1u+c5X4Avz7cfJg9gZ8Khr6CHs+e9A8yS3DZ
         Kick5hFFxwgpAjuTS7f7rF17gM0rxtmdxeMqpsoGMadkIxNUmEGIR63v07ZbwQOJb5ZL
         UbatxRGv3qZXhFFCm5/et9OtOfOULGCxefkVu+8p5Ttl357fLFj0RRTEkOuhHGc6eG4v
         mRvtfMfJoCNSlADnf5xEqEmT4WK622dlUIsmiKVlB68DWB8mLEK2C3BRb/MfBAnsE0oT
         s9ew==
X-Forwarded-Encrypted: i=1; AL+hErHhJ1x/Tk3VNu7tmvC3Sm1vaEBF/KTm1fFvk6P76wD8XLMNmEaTn8t6Tx5pLjtWbN1kxUACpigmSkooqL4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1IvAl98Dxt1kg879yfpN/1SFwyLkBE5mIc5OfRo22OKzgTEke
	Fhi6AyJ3JMHOr6MKwIhOcd56OFLCwDs87iGmKxmGE7HUX800F7XCIYsw
X-Gm-Gg: AYBFou3DQGVXt/y2C+RlGQsIaK0HaFf/Np4wpfc4iUb+rcORCdPxpga+EMRROqENhGP
	9jDJ7y7mzLXUuWxJb9TnKNkIK9SmsVUL7uZKuSEZLPHVAEfwGevlL93zFxsUU0v9ykevkBgJeEZ
	6zZse0I7BmyYBJMSfWQTsQjKJ7YDoyJ5wCNbMkCu8g/57FOIuuke/VCpj0gkg9BNE9f75kcuBGt
	D5g4t17nNL1fql+wywM9oUuOvStGTozVtBcD/lVWd1lq97WiO+Znlfu3t1pLrBHXpexPpJiTn/j
	n0ujVQDItgiLuJttWB3vuda8x0cNWM4wMKLkgl45EJL3dW9uvOy3TzNMgGEa6/S2I7gGMzCxUck
	T6UwIhpcYmWEdnrDGxxXJE6T4Y6Ca92pV/AE/bamSxLR/0sxrxUF1FmHbSjzwvRo/o6wMx8VAVw
	q3EO1JrWsYNNKovfaEGan4SI4sCEuQ/ch0OFPYzbBKiE2XqGeYtm39o0nrAY69AN1HwR9ZVClLk
	lybccbEXtbkfcwnkAkx5D9gyVFx/+yHPponLlPg3P1MgLNUD11SAe7b8zzIcj2i5WqMf1/y/cpD
	JToGJjyZX6xp6qWgCCcqu4SmLNPz0x/t0e6htAoyP4WGoo28NSPzx4I=
X-Received: by 2002:a05:620a:439e:b0:93f:1ed3:a9d7 with SMTP id af79cd13be357-9479f2f0ecbmr86867985a.27.1794254261502;
        Mon, 09 Nov 2026 11:57:41 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e61b8f8sm54770985a.1.2026.11.09.11.57.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 11:57:40 -0800 (PST)
Message-ID: <4bf059ba-3a8f-4378-9f4a-b2704034ac9c@gmail.com>
Date: Mon, 9 Nov 2026 11:57:37 -0800
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
Subject: Re: [PATCH 6.18 000/869] 6.18.63-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20261107134852.069646174@linuxfoundation.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261107134852.069646174@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/7/26 05:44, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.18.63 release.
> There are 869 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Mon, 09 Nov 2026 13:46:08 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.18.63-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.18.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

On ARCH_BRCMSTB using 32-bit and 64-bit ARM kernels, build tested with 
BMIPS_GENERIC:

Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
