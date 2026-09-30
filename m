Received: from mail-dl2-f12.google.com (mail-dl2-f12.google.com [74.125.229.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0031424655
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 22:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790807455; cv=none; b=O33fteLfj5B8g/d/CBAAUiTD8niFYWeg4+mPy11JRQKpT8xlXNc5Kgo9a9tcoR7taynJCwaanYBCTopPfAnBbqOtL74EebPE+HsBmLxis8U2XXY5T9qQqT9/gddXwTgalDnmGOqGlodI4yolM3F2vYeDoKd+yPTiWaEI5QbjV3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790807455; c=relaxed/simple;
	bh=KeH/wdLc3pIBM3h4KTbENqpk8QupNvfzPsLZCFCXyA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HI66BV/rj5AG6JXh8VYySQ5I2DjcrdhdVKvS3bEPcpzWexb60JdQrn31TeRoO4KY2PfKHG7Di1p8D6RilRIwSsDyLGfbKF9AKKxViAOpORA80FAIatJ4Ea1AGxRx+cBEQm1rDm6tb0mbITdSts9fCpmzWOcZx1R+vk+/ekiPsUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DDCBt4W7; arc=none smtp.client-ip=74.125.229.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DDCBt4W7"
Received: by mail-dl2-f12.google.com with SMTP id a92af1059eb24-142dd04f7f2so4360159c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 15:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790807453; x=1791412253; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SctRVBh2XMR8BEHKgf52Y5FElqtO+9fDYfFxFd+FYrA=;
        b=DDCBt4W7zENMXmT4V5jExTy19x1uUgbO6HLQu4BXyWHRKhVGqVX+Zaa4fb6exOw4KV
         In+sEgj0AL1o0bPa7ONqtLcg2YVjKjCngVXMWbdZNfRAl8hdqKgddkQDFvPxu+SEZzW2
         T10clPbzvOgYfu/g4BiHzmIoewgM5W38i9lHDm/IYXbFjzzcka6DwN5EzHkLpC0WBT7Z
         XA6aDXkCG+VTijnqvzpYbWu8Mp3B/NTtq8Nhg7o0Ngipcice1QRN7bkNWNUwwhK9X+Hf
         xIk+ziLr84PHEELc0VcHEkLxNn98AlvkH36qxJV42rjAsO5Rj1nrinwCT5so0qH4j586
         oKiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790807453; x=1791412253;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SctRVBh2XMR8BEHKgf52Y5FElqtO+9fDYfFxFd+FYrA=;
        b=ie9/8zkyK3oawLhWnoHZG4Q30qhOaB9KchF5if8gtHBprHbjyK+iaI3lnfq93ASFph
         28gGugdmXYUGj/7+bvC1Z/ZM6BEoaz596SQ8T4oJOMfix3w6IL9C8a+f9jze/HYWe/9X
         3s56rve91i0W1M81Omigu5Lq2Fa5solWcAf2/ucDIjdCIMInTVA3MVazaX5PfEaChiO2
         8a7NpLoXF5b7DqyPWAglvA4KG2RWG8bMSHRYhYjkOhoRsTxuDCT1u8CWyUYxNc+7AzFY
         IFDGa05GgfGc77eVh1VPuP97HJ4O5hhN1gf0xg1J74I0oRW3JKfjFzRTmJzWxjFYFa/A
         +nug==
X-Forwarded-Encrypted: i=1; AKwUvByowY+NM/4mL2lajkEWLmTKQTq7pWhP+a3qZRvE8b4n3QwrHFqmaCJOVFaZbrE3aNbQeoPwBWLAx9f6PtE=@vger.kernel.org
X-Gm-Message-State: AFuF++lc93i4uGcUOSLKuNAzB8gtMfvdTbgjiqxJgK2Rpd8+5uiD/72J
	067/xDnqc2i6uBOl4wh+yFa5O4/0BqCz1aIHUEscADe/+BWdNZ/6oPbH
X-Gm-Gg: AYBFou3kUQaRv+HEC6Z8VElw0xrVV7mw9NtDOUkO0eQ6yr+0F/3jcs7QMifQ8XTwdye
	lce5zNUs8n4z/F/hsPBtQ2GC0C3R7OVGcMjqeOc06pFOt1veJi+pFSrOwO3p1oYoGJIWR/g+dLd
	O43kdCbuiPDMVvm+B5gMavpvmo6yVdc6klKpKKOQ2osKM7JS9mdGac+AJPKuYszPwhKGDRIsIi1
	NyUQxKzr79MgTmrhD8oFfvETXclR29mQ0j0Naiv72rNvt7x2GV8Tpu8oq8fdx8mq6VMRT/r6mNe
	qJM5aS3T89mq0YJ88mA863xysMZ6C41rDIK3vXn5nAz2b2x/R2pzcf4O/biq6zHkC260OrnrnU7
	lskIhMs2XlBqy7T9PdJZ7cQlU5huK03LdGAtIYH58IsX5+y8FMu6WQyQl4/UD9qHIt90dvr9ZrD
	j6hUQVtsdYxrsNOKAQ/zj4sE/jorq6Ku4UoDtuukJfxdMv8eq2DaXATTim+HZ08182CVRLRxvIS
	+jmwB6IE4LUXSR883p1moEQhLfJndOW2qI7l60=
X-Received: by 2002:a05:7023:a56:20b0:141:51fa:e609 with SMTP id a92af1059eb24-14d2cd25362mr2498682c88.0.1790807452434;
        Wed, 30 Sep 2026 15:30:52 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14df3bb4a2fsm1281395c88.8.2026.09.30.15.30.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 15:30:51 -0700 (PDT)
Message-ID: <4fe680d4-1104-48b2-bf44-a2241e85a1b9@gmail.com>
Date: Wed, 30 Sep 2026 15:30:50 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5.10 000/595] 5.10.271-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20260930152347.700140858@linuxfoundation.org>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20260930152347.700140858@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/30/2026 8:18 AM, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.10.271 release.
> There are 595 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 02 Oct 2026 15:23:04 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.10.271-rc1.gz
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

