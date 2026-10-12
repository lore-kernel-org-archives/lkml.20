Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A944A6CE5
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791822065; cv=none; b=Kd1XUztF5j1V/g5ctGwOQ0MxksKk8+wjggTiw+vcr0acyQwbb/k//IfbTRSbqn3C4PtarN9xCCYMRntp4p3JmRPr5M/j2r17MoRutdCb7ZTNfk+rk/s9hqR8hxhf+KekSrOzhqFM4P0lxrjZQmniCOXCmIuK/ZUWH6WKsk3bHjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791822065; c=relaxed/simple;
	bh=M0JGwBW7mrHwnbqHncSpPEi7zCT+FqGhYHkZknEXRtk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m1FyJLw7k69ep6PDm8hASO++Tg+uxohq2039gQuOT/mWmCaGFxlHPhrrr93gI1HWBBHfqOzONw4hKF+K2880Ja9cy7+hL1/n6aCspd99bWZli8VRvBi4IBQEBlfAfuNJ0GCA7s/8T7KeTJAFLPRHwKJ8mGCyvk1jy5XXDrXEzOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ILN3AUGV; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ILN3AUGV"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33e6279a1d7so282015eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791822063; x=1792426863; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=100dkfxHGFXdSa4nJokPxTSjLK3e/Vooj6icmrrZBFU=;
        b=ILN3AUGVqW1TneXkRl74p0z/V8QVEr7BoVgyiM088wNeAXxxANgNdj2u5AsZ6EJsgj
         bpxO+zkOmA7xem8gSd8GYRlBYmyMeaPGYGHzq4AxYnObTHZnzRDSztzt53zPAtDJJKcu
         QbsXB/fW8BzI5BuRuEIr6bGPHUFN1kLXyH1CjLTV1Gl9HbuKynKoB1uRvFIjCARA5boL
         S6tfqHINAWQ93KgrdmflHspFVuw/B9Z7htzpr6emmvAPFfbVtLmYp/v3uPoKj3/nHbzf
         s2p1nVMTQsYjypEe6eIIoyoC1v0M3mLx2DC1vHgVXTrMbdc02Yyt37OfQPGK0RHuuKeZ
         c2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791822063; x=1792426863;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=100dkfxHGFXdSa4nJokPxTSjLK3e/Vooj6icmrrZBFU=;
        b=LZ83cHg0fAl58q4aqyl86zRmiQ2DfSShhAMas+blOtQC9hfSVgVkd5ME9nOltdKRbR
         kCMrJtnL5d8b0icNPf+Y3ud3NfpnjkfV8RKXWjNx4varzQLGD6HaySIbpBLMjAuB63Mj
         TLIuFWfR+pGpcg4kR+dpBa+9yA3TudFRjvxxMxHU4QlAvJO7HgFC/QuBgbS5yC0XhVrZ
         b9AMlSf8qIMlhledicZJTsHelaokPYGjfx98r7+zHRxauFLYpiuWpLyl7NteCciU2FJT
         uQ+mJTell5P4EvmUE7nBUQAgOqNAKOBTBcMfwW5g4rchSvO+YUOf+Vgrr+bMSaEk0Vhj
         1I7g==
X-Forwarded-Encrypted: i=1; AKwUvBwzW2xbtkBfYjki/zzx/aMhPTAe0ucD4YbIbj1dV8zy31gzLk+oEe4MT98Il38b/5H0LKu+nVyoDOtg4VU=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9ckaLifk5cI9HFsjvIK+ZKqzgfncG2Ni6IQf44xHuRSz0v+hT
	ABRSCFSGTY07Xx/POkEbMpI36jIz++CX1KRhkVAKo5BuMu5TRGKGsgWJ
X-Gm-Gg: AYBFou2extrJUQ9Qord0AzoEHkT0AJ+ptjK66JBsfjM2fZp9HwJT5SuYILyUg3sHqiR
	8YpXuG61UVtZQS2qNbklMfDpHwcWHRLTlW4ntD03TaDFJN7MRq44JqsDwneVlMJxRXUm5ZKidRg
	ux3S0y0w9N6XMAm2quOSs5mguyTalVUqHxhIz7Ue/KzH7rOQqkWsdSwlo21slqimpLJc2vcsPlH
	1u6DiVxvHB7KdG1zNnvHl4gNG0P9YDnnEwjICVF9h0qBJecUEDmUW+FL8jP5msBuQtDS9wd7pfX
	Q0KzFMPUboZXwcdsGrTQUDK8Jxfye5N5LQOazBaiU8PSACsTZDAI01OPWQvOjmhaqYNTVtx4PBm
	zglZWSBDLYPiPMpHCryqoGfhyLr0fl1fp3yD9HflpmNRt6TjwBd1UOTdAGtimS3xhJownVogceI
	TQaiAl5igPEri+Bjz7EPZXgdXrHL2FGCFruKQVSeAuM04ShvpFrT9dgcFEUSHrj1Q1xYDqubmwz
	9LOd3eRwQIl5MwVbguCxQJh
X-Received: by 2002:a05:693c:4002:b0:35b:232e:c0c7 with SMTP id 5a478bee46e88-35b232ec517mr3252116eec.13.1791822062882;
        Mon, 12 Oct 2026 09:21:02 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b556sm46550456eec.9.2026.10.12.09.20.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 09:20:59 -0700 (PDT)
Message-ID: <f29aa81d-80c5-4ec6-9117-f928230b35b5@gmail.com>
Date: Mon, 12 Oct 2026 09:20:57 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7.2 000/428] 7.2.10-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20261009140946.008206689@linuxfoundation.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261009140946.008206689@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/9/26 07:05, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 7.2.10 release.
> There are 428 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Sun, 11 Oct 2026 14:08:23 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-7.2.10-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-7.2.y
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
