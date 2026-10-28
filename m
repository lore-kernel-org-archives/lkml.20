Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793218554;
	b=rkKoYZxwAt42mqeEXNSLsz57U/kUeJMQwIvJ0Yk5YB4ecSl5Go0oAEAzbH/4szNLj6lf
	 vIwh3Lsjjos7sGKKMg9GE69uKLanZKjzFu7kfcI/Y8vB+GNMASYaY02G+/qJ9JuQfh6JX
	 W61FFUG/REm86pF1v2xoOyMB9M+59gQqUgwFdWAOpTJBzGPBmyRGYIaNpzXHEATFJTlt9
	 yA0H3okTvAJ5CAzyEX3xDwpFNes0Bxz4hBX+SlGtA9TsRufAwoZWlykbsUQfb9xyMCley
	 NWJtl+XXJVNTuAgKbglpNsVWOZu9WvDWJWAuWHMirjzjFP4FAhPOslwCpTUWSyEOWBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793218554;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=sE7YL0Mu7zAtP+r+dItmrpgUYmZe1QgZ8AhEij2E0bY=;
	b=AqjWCp3rIQf3M7TgFxg2+tyTbis3wQACcrAQ6ub2o9sn/zfQTvzMi1P2WTQBR8gNRQIH
	 nMDDYA4JvwEdZU5dAFqyfbDeIjZXcp5NOzfQ4P0DU1MCOuxbYiYdbMqMmP7Wx3QDhy4KG
	 LO91khZsJaal3VWcz6IeSHIzLTfPFXOVsYxG1hyc5NtACbhdvlXPQSbiKw+Niw1kX9JWE
	 nk8w8dvf9wqew42wck3bSakH9asOjSlgQLAH/eJRR55u+r/K9hAnuKBNo5GMUbRXmLhBF
	 r76/CLFsMP20dDBjnKFntB3iLEuG2yKJiI2qaqUUi6Niao879IpvpYsUUSOKcPbul5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bG7XSkYB;
	arc=none smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EA5606A322
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:15:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7EA5606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bG7XSkYB
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-53381e53b80so16952261cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793218553; x=1793823353; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sE7YL0Mu7zAtP+r+dItmrpgUYmZe1QgZ8AhEij2E0bY=;
        b=bG7XSkYBkwwgMP269A8xYjsaFH+uLKqQJIdQBZXRjpfHMIIb9tAu3xbQw19i+0ZZZw
         duWLzjdfOEJWrHrH53HDvcT+zhVzmyHGzHN9GlLXcC3RDP68WvNG/JRCFvTXDjD+PomR
         EoSo1+qz2ZGSFgS/2HAqOhHZtT8ytoZ+4AuenPf4Y12llLhX+tWCiz8yhsGMvuB9fcSk
         EPP6Sek4wII29a7wxxHyNUZQVSyIYoKhMspqIo2OQ6P26Jzl+sbIH9qrzEpdQgFc7EPJ
         zrxygZINHngixt6Y7KN5i+2CTxa60xHD/V2c3FFDqp5Qpe2dwXkRKgZEhMQtqsj578SS
         HH3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793218553; x=1793823353;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sE7YL0Mu7zAtP+r+dItmrpgUYmZe1QgZ8AhEij2E0bY=;
        b=yJQezjq6e8fGgLLDFmgSUU6LV7g/nMVPl87px3iaXvtnxFZnUF4fL3WR92k/FfP70N
         gq1bG9L9MR+AEZf0YxNaJJqB8cu2+YN3rKSmccd+eWZE9Qjqw7QsArkkJ5O6JCJZ9Wpv
         VF+FZ5kL7sYIe4F8lq4wqTlOcLzSA1ytbMtKR+J/Akni/2W56IsO9XBrgj93YUN4Mq3u
         5dnBjX5cpLrvxmUE8vavQfaX1sdIpaOpoiklki2CwpvV6nkdYGPP7V90BpWkx3aR5YF0
         15QEo/1vKKfh9RTmAYhGBj6KK+rzvqfFV7E6DqoQsK/FE7nbqdM4/JoCKwjRi+IFRpvM
         Udcw==
X-Forwarded-Encrypted: i=1; AKwUvBznULzAHFpqu6wjjdcqsO8aqydnUMWrHXjoXFtrtrfpMNPukO5+VOJpdcuH+Rot+O+zoKqeyq3P+M3ojuQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKb5LWl0Y1bQLUfUp2kWCzS2d1QXtJsA9W5MhA+1lXSIzDXx/5
	WEmtn/br5gNErfl20tmXk4BPosPZ65YcXhsB8wKOerwDS3aUyMcbLHZB
X-Gm-Gg: AYBFou3d8iJ3pv7h2lvb1SFX2sOttP7AsfmxjkVlRUDPOAF7Tb13vZ4Yq+At0GcBkpP
	WVLRqCd+7xRHqupPo21bRHwNyq7XTtsq9sD+YrzTA91UHkCSNmu7PwidxDLjnJA90uxx6fSjUER
	gPqMK2fxxluXRaN2uwNGYku6uwAWMsMvbi4I2vCb3dh1pnuvK7UB97CfI7N0Bvx1rDC1ARrzdEJ
	xMGn9A8KCN/jnoymUU0+RGORotUsTKmLN1xpBr4qE6eaIlXiTwc33ELswxI4W/MEoo9CLGjrCz8
	R3nfpHKom8pU9ITX/J65BmlqpfrmEUjVH480r3p0gPijiEzJf3QgBqPhdPIuP3aGc3y1BYcimM0
	kC6sIkSE6D3k8vRNp4cJ6EUrXlrf/URBvgT/4dGYqz9qka7JLySLz1t5AxyOGLRbIbLRTlazhvN
	rZ52iAazvobqmFIXW5qwLDTMYn+vDs7xjs0u8wxz7mwRPP3FEOGq1x3TuF+TNnvN7kEdAHUnDET
	kaeChFhiYuTuf6z13nXjG9GSe+NbILLBR9sql3IIRErz1Lt088/9P33xZ/UoEnYtm7llgmCm5DT
	cNx3fx3pc/O7GEA0v5+PVd/fJYF0imCLSSwmLoyeGTFkBTyXZC+TsOvi
X-Received: by 2002:a05:622a:506:b0:535:2794:851c with SMTP id d75a77b69052e-53fcbfdf35bmr60489901cf.39.1793218552723;
        Wed, 28 Oct 2026 13:15:52 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-538394c38easm112809151cf.7.2026.10.28.13.15.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 13:15:51 -0700 (PDT)
Message-ID: <131ac3f8-8658-4b78-bc0c-746cc49cc526@gmail.com>
Date: Wed, 28 Oct 2026 13:15:46 -0700
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
Subject: Re: [PATCH 5.10 000/516] 5.10.273-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20261028170003.522232767@linuxfoundation.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261028170003.522232767@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/28/26 09:52, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.10.273 release.
> There are 516 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 30 Oct 2026 16:59:22 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.10.273-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.10.y
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
