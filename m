Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CC931B10B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 16:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788281047; cv=none; b=CFNScZrupvKXy70ujyQ2jpdYQB+Z63tXW3HAVH1ueYvDggs4C6Tiar6k4JTtazqRtbyc51renP2uXoCJTD9IPYr6vCtoUA8pBxjrKOXFZ6L0X71woTIEPTeoFoaF72mFG1sVKEtAll8NCPHb/mbJOj73BAvnVJmcQKVtjMz1sVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788281047; c=relaxed/simple;
	bh=lBssdOL4h0dDqyFCQ04Yu5KOZOoreuzJ9iq3r1VKZ/Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gkkg7pRINVyRXHU9TBudZbmVWpGSUwn9H4SQEerFDZX5pCDoFjuL3wIalr2OegCLIRVnr+XN/Yzl2UeQYgkgL9GzSth3+4x2Nqw007ZRIUN4y1xxhhZlULUi2I2crGn+6g4BcJgtdX19ZGEMGUqzKWE0dpLD9j5366TeW/VUuh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AhPYUvVY; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AhPYUvVY"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7eb34c17b96so4363632a34.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788281044; x=1788885844; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OKR0Q5O9wNc6TWb0BqTKUYLMLU6iV3p1EeGlnxaUPrc=;
        b=AhPYUvVYsqMkZ4HsqFsnVlFVDP/HCwkPc8BSK4/2oKEtDnh+YNeXqg5Gj52M1eC4nD
         6onFp9jt0lTHJRmiA8wbPesGxE2DBYzSjUc+1K04CY6kOKuN9JAdo5teXkYZSlcSFxlH
         LCEHxfmKyGrlK9JSLTCPPGgxL+MXak3kYPvSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788281044; x=1788885844;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OKR0Q5O9wNc6TWb0BqTKUYLMLU6iV3p1EeGlnxaUPrc=;
        b=LDOaF9/NVUH+R47kYb0MnrSkXbNxpImta8eABQOjllVmsc2Y/N105dLzWXPFxMyY7k
         pP8cpWNLOkoanHixGg08SOGJ9dojGtw/65W/uZV35UBlc2NP/oVB9HJn+HxPKAtok/rZ
         c10J4beVjWz+Xxbzifrmjr1oUjuJ5ASsdoyzrEed4tB5fZiT9wxYkaR0bndAzm06kqWJ
         UZK/eLjjihJBw/T3q9+r7IYfGMR8+WthLESORwwYFQPRANKkTkzYVQbkjAJyKoFHdkrt
         QlSA6PbliDFD5cj6OOfeYVVu01gfUOgg4KmLVD/ILB4aanWqAdyk+347I/9nczm9euOj
         m9Tg==
X-Forwarded-Encrypted: i=1; AHgh+RryNEa2LQUUHmQsDpBCkiR3Hpi04rChckdFCYUk09deI13Km1uc/o+Y03bcohV9j6uwbu2WjMVlWVybzK4=@vger.kernel.org
X-Gm-Message-State: AFuF++msDkN5U9UIwU4WbCz2bBFp/UKULBj6VORFLhmrvTnSKsuDVkEC
	EeTvERONJkbzuM7IeYPl3pzn2+vXKtG0nbZAl/cYJfkX8Zkt3kMJiuUvK3T0BVTnXDM=
X-Gm-Gg: AR+sD11t89KXd8Qz7Ie3E9sbI4DXUGBWWGBxtQaSuZBAweqIiwTnS7A+v+yXyWdEn36
	NAQRzVunf/Q/T+JhQl50u+PQj2ab4csuysdYpCzdZpaNCWyWdn9xliOB21QVN114Ud4J7ZYud1l
	rqoVUYpIg4BvUMyHMA87/TzwkdPl9pAie7E4ChHhgtFINaBfCrcGLxO7r2TzmdG4aWMlyNHnRT2
	xGKD8TbUHr383QwoV16h010ihk/MWsPXqeBASnmk3Q/JD/9Q5HfMVk21W08uoqe383l27qVoL+e
	J01RdJewbctjhKANddeCgca0m4xd4cA7Qzbm9CWawjdYMD+NcNdARPEdMMsNw3Rx/zSlIyrn/+i
	plATi7DbJcnXksGNIUCamQweQ6hNcsuPerRbhx7Jy/6b17tuk3C/XWb8e2yib7XCnEszSsVFzyh
	yCGVh2/YF21NhaLo9/vjFTVSjckSuJ8depUnjBjdk3FXI8Kr2SSWBMkKJ8YaalDD/uecmp3Q==
X-Received: by 2002:a05:6808:bc9:b0:4b3:7b31:8df7 with SMTP id 5614622812f47-4b39824817bmr35286429b6e.14.1788281044022;
        Tue, 01 Sep 2026 09:44:04 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b3a1995f2fsm11396298b6e.11.2026.09.01.09.43.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 09:44:03 -0700 (PDT)
Message-ID: <58e592ce-3354-4165-bf7e-93fee744339c@linuxfoundation.org>
Date: Tue, 1 Sep 2026 10:43:56 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7.2 00/71] 7.2.3-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260831133359.055927882@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260831133359.055927882@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/31/26 07:33, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 7.2.3 release.
> There are 71 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Wed, 02 Sep 2026 13:32:19 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-7.2.3-rc1.gz
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
