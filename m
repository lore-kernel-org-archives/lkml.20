Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB4E4AE11E
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788197116; cv=none; b=JjzLBrJ4cA0xHAsUJFLFIVt8jYVGgKzY3bV3HSpLXfS5rrUlfSF6/PP5ySKQ2sG9e6Fulxc1FbTgU7FRnbvr1O2Bf+BQeHSK62t4kgF4uBqjGYJAL/tL18PypqQGid5oTEqgFRiqwMxihxaUPO8D6ywYAX7eynPEr8S/sqO6pI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788197116; c=relaxed/simple;
	bh=AHbx0/i7Pgt9YZiuONnuRmcHvLJTE+va4kW7G4fKV+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ya3cuTCEuI+/4Z3bdTCaNJA86lMTbsDen6UhJIYaokHn2sarXjj5AYroLygeR1yY8KXFMkTpCgthl/NNeuzqnXjSziXWw9SkzLTw4MRWApiFMDec4hIzizmzq0RQEgnrE6aBYTSJnBEVD14BoyhaoHSM6QvaHlagt0dnHIeqAfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dZKuaFdQ; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dZKuaFdQ"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d5335cf904so36147785ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788197113; x=1788801913; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XK77W5HmajvK4RgjL9G18trFUO/IP7eMuuZI6UF8qGs=;
        b=dZKuaFdQGBVg0RM2DFlUP2u1rNto8vnfy6argN7oKH5JQ82YvZxDoyJBAFw9O9JZOn
         AeuRUFa3AnpiRG47GGMv/IjzWbVNV/cxPJMJumB0ng4uEteKm4RKgAFCRVK1YJIoydmq
         yR15gsgpCVjIfUQYeGfTNInniWlt3qQI9ikVZ6X7UuFoJIfIbILI7vLVlMbYp2kVlgnj
         SoKaMF1G+3JlV/x/5dPdXoP5TWfSrZ+W5Q03KlcWeUKHSPHsBl+Kyym2M6k63Z+otqs9
         +hCDRbSloNWeeIpL46FUet6TpeaJSmSK/BU2NGUCYv/qMrMKa2Sn87R3ShXvEe6mtm0e
         bpXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788197113; x=1788801913;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XK77W5HmajvK4RgjL9G18trFUO/IP7eMuuZI6UF8qGs=;
        b=PgzIUVnX+9KrBCYC1ek4rNsHVVMDbIznzzZ5gZbTqDFwu5z3tUBz6IdqaPlb2e/KeE
         LH0znCUIDkgLhAXXO+C1E/I/PEijs9QpuYG1f6joELcInmnP0F/Gh4VsysF9h4WQrDCV
         T25nN3WWqvZ5MmfqPZg73qflMuJUf7qSpHWf9eweLdRQ9VXudZuoJCe7qlChl5aeFhG+
         EzmgI5btiYmE4H6jeXv1YGRr2O4qp1icARNyZ67Wtkbyo+lg0Q5FAz4tF6TfX809ZviT
         Zy8Qjmb9a+1z+ettpDxJ5tjzDFJvV+nW5Z2Ty8OtmTE6qYRBDw3oeH0TgSV0btz73+ke
         wmxQ==
X-Forwarded-Encrypted: i=1; AKwUvBwMATU9HpLeCRWSZW81Xt+S7CEP7IRFiwL7oMBnAWyEucOCXVym9L9YKcUKx1mfiblXBsWDZEdXRerLslw=@vger.kernel.org
X-Gm-Message-State: AFuF++nOLO0yICmPEhCfD79GdjT08PZEh7FFqoxnMu19tj2zM+vnHUfj
	DW6me9M1f1XDuOkCfE30XB9/lw/Sfru0nRum8eNImZx4D6Cu81akrlWF
X-Gm-Gg: AYBFou08ghFPIhOwfwHaR6WnTu525DheIMxjPEjA9bkFOAsW7nEvR/YDX2f+OyE/JNm
	e38dKRNx8zwUYDSC+qZs9Sh5cQ8y3bhZuCAydrHA+e2f7ssFSi9QxE1pl+c10S4IEMyG3awWEX+
	S6QSG5IVFOva54mG0Zs4IScGkT2fGfjLidgori6olO0q94Ava6LTk+FHWFm+r/C1MKDKS+eYGvQ
	HaBSekLs2vMgT3nv1wb/jVT8gYAuIIXaXGr9TxoMweqLOPXpGsEGQ9laTO7qUn3Xvr99YU3ZKu2
	Uy9zTYhLShE4iIdlxMo/czEtslVll/n/wnhkEP9WPgxf0NA8jI3oEiSjvVeAF1PuRNPRp2Uj5qJ
	MT/+sYGlcb/wp4sM99UUqm0GEC3NS5wSplqT0ry9Jgl0lB4CNOTMWBjsEuF3as9ioOT3IbVjEdb
	kSbXOlR74Nv8EFw7UUB977RQ8XtKjL3RApjs+1RLzijlm3cFyd8iVKzZaD2dcdbhrRLr45QOgrw
	aYG6WNSsJd+3YX1zxhA1lw+Sxww0A==
X-Received: by 2002:a17:903:324e:b0:2c9:deec:f564 with SMTP id d9443c01a7336-2d94a8d59acmr32476955ad.13.1788197112756;
        Mon, 31 Aug 2026 10:25:12 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b28ab0571sm23256193eec.4.2026.08.31.10.25.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 10:25:11 -0700 (PDT)
Message-ID: <5893399d-bef6-4888-acaa-3bb4ca3ffc01@gmail.com>
Date: Mon, 31 Aug 2026 10:25:19 -0700
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
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20260831133358.601894154@linuxfoundation.org>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20260831133358.601894154@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/31/2026 6:34 AM, Greg Kroah-Hartman wrote:
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

On ARCH_BRCMSTB using 32-bit and 64-bit ARM kernels, build tested on 
BMIPS_GENERIC:

Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

