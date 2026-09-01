Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1F347DFA9
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 16:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788281263; cv=none; b=d7FQGmRTb0+WJIp9hUYs3pkyX+xRSld6DCij5G+j/Ft/TtVSUsfBCTOxI8+EVAKEcBW3LmY2ksl9qjPKmCGvGRUFjx8iGP1OiS0HpYm5AwMme/5rYx2VBaJGsV47ereK0vgJH2rvQisPu5y5Hl/HdKhaeeOPzUdl/Jq9OCHESYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788281263; c=relaxed/simple;
	bh=hXcx+zWej0g5jt49mEsC6y+RCbKQYJzwcUjDvMMMrbU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RKxpHov/kHL639k9aFihFasdJIZvsr3604W3eSJAufC9pVVquV7KofwQ/XFfnTIP+YgzIQgKj1voHrwteIKbk6rlci9PVg0C3IM/yOsKnjK0kFwGc4VjQbozTvZ+yCR1dWC+M8+ye47eYLRUdXi6m8utigpvViBiKsBVPaqCN/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=B3gt/XmZ; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="B3gt/XmZ"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-45837e52d8aso92962fac.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788281259; x=1788886059; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ZUuS5KsY6EoA6yaoBJmvArPf16bQqatmcGtTHp56E8=;
        b=B3gt/XmZd4m7f5LZ0Npk5/x4+N2o6zlNrvAEeNKMLQe3+CfKl+G0R8LlUHK0qBuya2
         q7UUibJFmJ3RcSzx/u7ZL5hbkE7Ldo0UDagwz8cRuklHS5Yx0McLVG9h9En2DEWyqyzf
         hgNzV/gcsfkSJZcutNmvnIBxWBGlU6ENURuA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788281259; x=1788886059;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2ZUuS5KsY6EoA6yaoBJmvArPf16bQqatmcGtTHp56E8=;
        b=fp0Rt0GFfYxa47O9Q5fSylmgHOoHiks6iB1jb6zW2xHYJuCRPRmk8OQ7cWcCFOI2b+
         wZ6OIsRelW6rsnXLVj7kwrXnHcOcaVsfaj7Ul4Vf+9zTj3P2V94TYmUvNesEhK2ar6zL
         GEaHSiGxCLCzXqiodKTOkMubpZdvzTt7fATO/nkwTqcfBAP5Z5L2LF3Nj4tr6GYPI/Gt
         vTfYzZUNTZqFRIVnN6Q+wyh+1H7gx9OMXF4/kcRrKJawcFxLOXCRj/ehsrLcih0h2ED7
         kDPW0yONnTNjLBiFY6iJLl4TJu9XZlUkrs+j1RCUPCvr1RZ0yktMQo42GibgPQk7e8UK
         sseg==
X-Forwarded-Encrypted: i=1; AHgh+Rrbhwcqq4kbtYkJcF3NU/cO5vW3H6/M1kJr4rh3DuS6rWfRj5gpsvPO8KKZvUsjd4SNXJOd6Utmn96wTMo=@vger.kernel.org
X-Gm-Message-State: AFuF++m3+CmMSOUf91uos6CQ7RuTgfBzhbWj4UJ95A2cRT+IGwlFHANX
	qdA3ATw+RJEO6g+EB/cT75iLnZt12l4wqH8wLmNvq9UuTYsxi6jMm42Z0jxf2MYOvBA=
X-Gm-Gg: AYBFou3HDEnmTvil/ZkjNs9w02Y0etAKkUW8SzkeoCRufDMDbtEihJRKLACanzh8rVB
	keiQvLh7y1hyF+BgovPpw7RD33Xv+xLLTXNZzSZFEIcMaILvS0gxoHeNx9TdUlWcvOYKGcuUbYq
	XoAYIF7MWhIRmn6JCAg0dguCEqE28wHZdDxE+WPGY/LvIz40xs8rTEY9Z3JZVFTTApWFQw/V+Jx
	lp6f1vmwG5MRiV22yFG6UE1Z/sk6n47/ff7J5vG+DZrH8pDlZdPHlIHyL2RPSeyLmnJfa238ogj
	rzRwoTnwAlkVrIOBuiaV/Q3yDWEj+EgcNVUkVYb7xcG6yRoXM8MqyUsXhjV7mO+DxQHYlE/AvJ1
	OdOCUUQ5DfwvJnqXP0U2i3ktofg+f3IVT+FUA5FdQZTfspqLZwErGN3Ai8Sp84533AqUL1AuIrs
	ftDiNz7FoupvaWmznq6UCms8uRq3n13aZQpJOIyvMrFdcV1V4zxM+fAoJsLCFQCbcfSjiU
X-Received: by 2002:a05:6870:8094:b0:43a:19fb:8b99 with SMTP id 586e51a60fabf-46af568c963mr9831277fac.9.1788281259524;
        Tue, 01 Sep 2026 09:47:39 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-46f2d4b266esm219881fac.0.2026.09.01.09.47.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 09:47:38 -0700 (PDT)
Message-ID: <aa5f3249-f81a-4b61-830e-f2702ec28d7f@linuxfoundation.org>
Date: Tue, 1 Sep 2026 10:47:32 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5.15 00/69] 5.15.220-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260831133358.601894154@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260831133358.601894154@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/31/26 07:34, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.15.220 release.
> There are 69 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Wed, 02 Sep 2026 13:32:19 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.15.220-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.15.y
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
