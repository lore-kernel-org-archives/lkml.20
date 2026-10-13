Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5003A4521
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791933338; cv=none; b=Q8iHJEZPk9gGCiNQN9F3M4W2GK3QyoI/XmhUJ/d8VzFvApMv/cBtlotZIN2JDfo5q7EvWEYxLaVvEbE8Onq4gb3ITjdgo+JoxjaWn/HjClv6DaSxq7Ko3rJ/qIE4PRQ3AHUZbIDItm+oSt/fNOGNzAAY6IM1Wnm4E3oGbRa50Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791933338; c=relaxed/simple;
	bh=bJtFuAfjAsK2013vUx7Og4Fl2Xotxf6AIMZPLzNs+QI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U46VgbUyEBQVfzr5xhCRe0lV5FHmvvIXUjcSUNnrZTr1KMXFsf7m20X7K9zZJgxkC4kN0pziRrINg/vRJze0huZtm0H7Rm62wL3DelWktHKvO4VB0sln+WpsZywgEjX3/7aA/wSsdu9INc1vw1tjsuCtLT0X2kaX0uAZyXod93s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Lx9dK1Fi; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Lx9dK1Fi"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7f432ac553fso3971559a34.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1791933334; x=1792538134; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dmwu/a/YbEyOYEh3D24w+BEmPqrGxVIF7pjSO5iEBzs=;
        b=Lx9dK1FiBppAA7ATxu3OT0at4cRsoql7/Fy32S3ayzf5nTSdl6UjaUEGKhrp6GDIm+
         9/sDLn4lv58aBtO39SiU/dZYjHBCt2PkKrRvW9h3l4PapJJE88ZIt0Uq3ZgDsAYRn+ke
         p6jb4oEr3UCF3nF7k1DiHpdxrh0Q6TE16HTeA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791933334; x=1792538134;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dmwu/a/YbEyOYEh3D24w+BEmPqrGxVIF7pjSO5iEBzs=;
        b=MQ3cNz+wvHALGCm3DppEg6E08A61bqu1+px8eMIzoQ7oGBRVkoX7PyOu5TCdQfLT7v
         U8tH7F3cnmTlsDU1bjLiDcwvQgb2qt7o+1x20ivnChSQ2yzeesJoE7ZCkk36KCvPfOkC
         158zPIMALwHnZE5LSaf80+Pt5IbcK6/47CJJUlnzPWgcVX410WgrMqvUnNCGaiN9r4ot
         llswQx8CEsMiEu9Sz6VVeUij6dmlENn7LZwLZCY0/WYvYZmjpHSlM7cz/LQte8wMtNCY
         a3hBQp1TmertxXwKTU6egXoCFYtcCgib5pSrnpUPrjxpr70mkfp8hn4oYtAUStUHP5+d
         bdgg==
X-Forwarded-Encrypted: i=1; AKwUvByXZt1/5L0XxIRJE/gv0NXQIE/vXcrjKNWaslJze1IuaScfPye1ZZWSBNqdQS+aV47QA/DxfTRX+5rBJ6c=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmSGGfRYynb2MZEw3kSWRBq1CKr4rc4qzBMpomFEBsKkBlIvbx
	v1RioHXg4KfJGsHqDRaQ/emYMZrWeoWBPaUu21iq370EipnJvDQ/DxOs4YG1t5XAn0c=
X-Gm-Gg: AYBFou15zsD3sEXmsBILjHO1p9G9GZXFOWPD7V80sd/EMGiaSSL/8fNjY9ZB5nfBnyT
	iJimGIJZTLYSldNJMWtuQ94wQCq/53K9xwSyrMCrhfrTaSDowmaWkcZhEaK5vyru3SEKhUxwUnQ
	YKRbB1eo1aRjnBRSLWl4KshTuOn/RJMdukYIUHtWGMyF6APjiQCTKAJLuY4dSV4uz64AakIlKtR
	mfj8gx2RqSBZEm1CHWyKTQmHyzs0e8apl3gc36flen4iuoiFiV14BnCQqawasUS24vuLECDhAfM
	xs+LneGlm0/lLGvAfPIQxLXkbYmS3fdUR0zSob9AzrP5h2euaRjxJaViEnBUAvhKVVO85js5zky
	xEj/2FLo1bSFpgqBeA9l9PHM3KgUDh5/X91HoIG2FCNFWZv2KvybYeH8Zm6KuA6QP/gF1X23Y55
	CZ8AJDXjT0hCreFUEJRhURY2uEryBWIMf+5RHCjBBrxTLRx6PSrjE+kIc+YIaNRoWMhRRFGe2dq
	OGYT1po
X-Received: by 2002:a05:6830:828a:b0:822:a76e:95a3 with SMTP id 46e09a7af769-8308b71a774mr14023795a34.0.1791933333694;
        Tue, 13 Oct 2026 16:15:33 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-83618a94fb0sm8058530a34.24.2026.10.13.16.15.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 16:15:32 -0700 (PDT)
Message-ID: <b63c8496-a3b6-454c-914c-1f94b122b4dd@linuxfoundation.org>
Date: Tue, 13 Oct 2026 17:15:28 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.12 000/497] 6.12.113-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261013112907.864180619@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261013112907.864180619@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/26 05:32, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.12.113 release.
> There are 497 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Thu, 15 Oct 2026 11:28:22 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.12.113-rc1.gz
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
