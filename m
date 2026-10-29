Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793288405;
	b=EynE5lmXVYQxTZlGhsR+/uI3NTe7MkaOJ6mrdLqIGE27SCTd1Cr9O8GbEtXgVmZk8SON
	 +nAtFO8/Isi3FgY1avkQxXBRXv9TW0HLn3sYU8MbID6k2YE/gEUOBW4GBbyJ65Me2QUUM
	 lU/naJzZaJKguYmzBxO3XI/rnr5QIdTIBlM10EsHqGxK+SNU3bO66tZJlYwGAhCEJFtme
	 7OCCKanPMolNGCHUua/f7zc2jol4kFQi67aRvlWpQYwZXOOWF7rGzagtQ0t/QYkwP4472
	 wgQ5VStCci4SgfvmOlOMSv5rZbVkvjZkMZ9bObqDl/btOaulJ89Cq/Ut//0UP3ASfNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793288405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=p3YvkGpbJ75egK6OsWORSXS1tksyIAY2QOnekRB2s34=;
	b=Oh+P4OWDBuGypBxnok4yzGMFSwNzClPSY4tLEeOF29SIyXaOR34Li4HJF+oIlFG1PEFa
	 yM+hUKh+t4VcfH9D+A6vlPkuw0d2m4lq29v2tueNiPSzmv83y6hA18ss36RANSOkWCW93
	 n5p4WTevQIAH7UL+7+drHRKVyapzH8hNKDdLSqzkYvANFdkmahdETPpHmgfok3GS22K1Z
	 lxoZaSkqr8MbCExUnsbN+XsYG8w9hcAgAeKB9TUF7KChgTZi2hLTr6xR3iWT43OxjzdSF
	 83GlCgu8ZB7qptugtHaIYtnhL2CsL+bLaeL8/NNWUe4YnvK7xBrmWTO/Z5D6XvxSqEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=SlnaW63b;
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBAC606A320
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:40:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDBAC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=SlnaW63b
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-843b6f8e2c7so2554984a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1793288402; x=1793893202; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p3YvkGpbJ75egK6OsWORSXS1tksyIAY2QOnekRB2s34=;
        b=SlnaW63b7+BWoAx43Ve1PjR43XZ3s03l14lqyvTO69cYQC4gmjK8QAj+ZP35BkhjaY
         Z0L/5zN94AxTa63hC9be9zBDjvzCCijanGOYYT7pjjC2TwkKz4QR5aZzt7pvknhHVdM9
         at/93Zy5JiM5YRV6AGqg6G35glnr1wMZY4E/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793288402; x=1793893202;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p3YvkGpbJ75egK6OsWORSXS1tksyIAY2QOnekRB2s34=;
        b=qhLBVwW1Bq3HVBvR+zHbA7QsGuUJudVANKpHw5pNHCjaxvISbyDCq7vJA660Gs102/
         4gGqU+6DRG3PPGJPHhuk7DOVVby+3Z5zzoavrH/TiT5s+xuh0i/bbnMgAUCpt6W1u7jZ
         +Zk6XTX2HoaUlZ1HGUPJw75kgr7RcReSybKiCyZRaUuHHB3ciWB1QxHKXbYZsLB+X1oc
         zuyl/nujEI5FujMU9Feco4b1rJV0uDLOpRPzhrYdEBos35VOTmEQhGWO95xW7ohELh3A
         LpMl/HWxGt7V+AZAkz6xoZZcIr6bhhvr/jnfRd3zhQRqfuf0ryZml0fllSSIFsFSQBxS
         ha9Q==
X-Forwarded-Encrypted: i=1; AKwUvByKG3ZRiHfdSQc5VWn4GOrziiloMTPTIIsDlz7Pl8tWBAsaKnqAy8uvQvSiOPFzV3BJX+BnZ7/G1qOrxFY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLGXe+dxb2gev27ichx0THXFWwSBbLtDeYq+OQgNZcg2K7SrPTc
	nqSwQT1Rj5+oS1AX4CpARTlaNnVGsur8or/ADYRnS6UXuzxFr2uYnjd3c890qZR25CQ=
X-Gm-Gg: AYBFou3RQyRLGBsccCCnQR9DB8wKU/kIo6fZH2Jp7CVknghPihJu0XvQGk0rG34a0SB
	lFJJ76osnVNNTrKBwc55AQLER+V2P+Vpuk3usT4zRSYtPy+uU9hGXDJM3w23XR6ax1X+GGc3mtr
	8qiR8VGTLUOAvF5kbP0S2UiAXQxRRgF/slR7zjtms35xwzOBr4a+XGaA9xHC+YNyplCaL2dSVcL
	TiQ0xVnrbgNxDj2AdTtK6XmepN76joQSWnuMxTXM1oswRVTXy9dBZ3Fhqe0uVwzsgBzwJVmwfhu
	5ZY9K4wHmP0I83wo1VaOQj7gviWmMzMPVJTR4Nw6CaLEEV1Wr9oWFxoK6Cg17k6WlJNzLF/U8z8
	FRx+bj2UdrQwYrkdfSfX8U2gT7hSKH3bCjLLhIAq/jeUegu+hscMeD2XVF2LVg1EOefWQ241+p0
	QO5jlBr1c6eZ8RT88/fLpkS8XMc9iC+9VmOVE+TLGsjug5dTWuDEmhSSyanyLLfCsCpRLQK0aEU
	gjEcb5GBRVHX14Naxwh6+NOPXiz1ZyCUezSF5D7LeXpzbGb2jermqgGyz7JZ6TdE+u+3mNLCagb
	rvIW9ZWKky/WB6tu7GcE0Utx+DVNF4mFJwWPodqeeTTeP8y0poQYx+kuPc0=
X-Received: by 2002:a05:6830:b16:b0:845:3cfe:601 with SMTP id 46e09a7af769-85ab2504c5bmr5675751a34.0.1793288402519;
        Thu, 29 Oct 2026 08:40:02 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d33e3696dsm135839a34.1.2026.10.29.08.39.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 08:40:01 -0700 (PDT)
Message-ID: <c0500cba-eb48-4421-82ec-b276b1c9453e@linuxfoundation.org>
Date: Thu, 29 Oct 2026 09:39:55 -0600
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
Subject: Re: [PATCH 5.15 000/571] 5.15.224-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261028170008.009143722@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261028170008.009143722@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/28/26 10:52, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.15.224 release.
> There are 571 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 30 Oct 2026 16:59:22 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.15.224-rc1.gz
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
