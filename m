Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1394419305
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788198641; cv=none; b=lULpq5uB78o3ASmWR5B1NV37ElQo8YaNN3b/rfkgDSfr604uD/f0GB+Z8AS5GsSfCC2IlWMezTkFnDaEt7GiZUTtBIHl6mTzLQr02KR9qIZOVkUMvwIQGrH8NRPmycNKyOqd7FB+/QlyG0EDZW81UWVzIoAGZJAjuJynXgO7l5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788198641; c=relaxed/simple;
	bh=nQ2OzwrZKHaYxYFAxN/IhfHiA9sv4Jp6iArmTITeQhw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gq6VO4W9fBTgYTZaPZU9IWzEhB8p9X9tjtNiGFZksX2XqMJ96zlpF3RGSyX/vDDOkm8PJFxbXkIPtWDl8PH693izGx3eGZIVDQAYDhTMPC6Qbj7zx2KILpwpvqywHhrp6jkI3WFo45OFuaBiC3N8ATrDFeIw//eQniMnEXtNkBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S/oltlbC; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S/oltlbC"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cb5b8572b70so3920555a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788198639; x=1788803439; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lbLc580QKHQB87a0tif0AwXX4z/fpS9vCcyNo+ew9kM=;
        b=S/oltlbCt6lBZCxNqdstpDKnhvZAoLgxtKCxeUoeHULMTVU53Onck1foXJwSuDXATk
         xnf41dM6syuuPiuvL3M8evj5pUcxcBUdhLgHZN7xvKeK1uUw33YdQm87JlcwVt8TTdAA
         w0Uwerriqlzza0dhSVaW1VvcFE7SF8Bsy4OGrKE2ZGdygWApjS7vusbRphTFEZYHkzi3
         DGZ3bbUyDiFGe0kqs2CXYk9AHCaRhxUFkW9yiadZBBGAtLACMO1T2UUst1eADiPdvHRC
         8AaNa0giJszb6pom59Q17OYYmEKghwMuxaPAFcardAfvF4vWPbsn1KP/M4RTLXL8D36F
         +TtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788198639; x=1788803439;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lbLc580QKHQB87a0tif0AwXX4z/fpS9vCcyNo+ew9kM=;
        b=c0a/6qkU5bjz52Ajj5rySZgHSX4k7mhNFjlkFosZdtTJB/c4AbtGWp30L/3tUaXnpV
         NkuMgBeDlsGQ/BHrgjSJ1kSgYaP7JiVuA05uMubCiqZ5TEc9sHl27JpYTgJx3XsiuvD5
         mrnyRqUwIHWqvUnU4uBwv5nw9pYIJSEzomKxYg6jYrQKxZ3bR3qkTG8Xw1C6KLBsHgBe
         0wLBYeDfOeeGyuOkR3JAD0w9Tn6DwDKDWV7hwEAwh8KXuTBZoMcD5vQmriivN3KDyW1I
         3H+Vl4+RCAHl3qHt7kGWiWUqmQHBtFgxnD6riSXdeptwH68DZaBgTCZR266SPIieKFFM
         Q8HA==
X-Forwarded-Encrypted: i=1; AHgh+Ro+qo5LDwwbu6KJCepu+q3tV7IGa83MuD715AZT+b+fyzOPd1Is9lvT9OLA4UC4eNzDajpDCDykeUGC8hQ=@vger.kernel.org
X-Gm-Message-State: AFuF++knZrgK1dcZt0xct7Qy4pXpBbjLD33t9mUzrxcm3k2EqByysVNL
	VIo1chB6MaA9pGDbNGl4B8vzpgBLSyNbEk6W+ZR8MkudMoDduNJSzjeT
X-Gm-Gg: AR+sD10uJp1n2CYU4iOuHYpe1USnifNsXVssqXpa5gYZHS1m9zDK0mJQCh1NuEs++2x
	AvBJxCq4G5tTSQmEyevVxElvAiKkk0tGbbnseV4IsQf68IK9K07KP4othss5+IoT4sAvgxIquny
	HEIO/pdYxS0F7DTByh8Q3do208KxfyYMtq3LoJwBLHgheQzLFgrfwGt/6v2OCglkLZKdBoE6zE4
	Ts194weXduqg7hED8/UvgLHUVezccFKVSVqlhnXz292MWONUNdv39sVri9moAaU4xJUfBFbi/QN
	ENtp9enanePubsuJLOrH7HWuPh+B8bRFOPNlI8sVbs2LwciIMq60K4sXlQxoBRTf9RhKiyGBeXF
	TXxqtD9y5Sy0JL4+QWulOcKcLvwrjgAAffCUV4GEFLQep1Jv0nNcCeK5mQyMzOX/YbbJWFXqyDO
	VfdbMewb6IGAOBiuHCm77/tElDjMpUsbn1FJvCsE8IZDxobfQeU1Sv6yko9YOxLdNb5/yYkJCOl
	GfPG3a8JXTFCKroX6UFXtQKW0qjCw==
X-Received: by 2002:a05:6a20:9f92:b0:3d2:3e73:29eb with SMTP id adf61e73a8af0-3d7adec0469mr4503090637.1.1788198638790;
        Mon, 31 Aug 2026 10:50:38 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f95a160sm31383185eec.18.2026.08.31.10.50.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 10:50:38 -0700 (PDT)
Message-ID: <674bb3e7-e61a-4535-bdde-beff6bd1c2ea@gmail.com>
Date: Mon, 31 Aug 2026 10:50:46 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.1 00/92] 6.1.187-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20260831133359.482388899@linuxfoundation.org>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20260831133359.482388899@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/31/2026 6:33 AM, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.1.187 release.
> There are 92 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Wed, 02 Sep 2026 13:32:19 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.1.187-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.1.y
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

