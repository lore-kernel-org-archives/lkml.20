Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE69392807
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 16:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788281162; cv=none; b=mtRvC+wwYL1r31DraXrDYiOFQRkglAsQ1pS70nCqh6LEQo2qg0WxlPUvVRC1d0y+mmxWCasMiwxkQuZKY+ACIKAe4PZpajFTxeEk4l095sSNB0fh3sWnDSdDhZHxQPwnf5Cx9SNYpNezjCqyqS9ajVU1BxEOzJYUsGunMI+YfA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788281162; c=relaxed/simple;
	bh=UYUPD7JgwryIKNVtCnoJgUs9pzPFe048Yg5ClrK2qRg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rO9EVSnyJ/z2tTHRXExvVwME/jc64DJ+JZNFcX1hbyQ55aFG4TXM6tWsOyzJpDEWAzJp1KmfEvWk/J73jaFoy/1pHO8FyDJHxk+UruqgMunK2nk5qn9wXuWy5NssWub8ojyc40zSuaRn64IqB8iGDmtN68VYoMjjs2DnPejFBIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=aAMJ9WCZ; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="aAMJ9WCZ"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-4650773fa99so42705fac.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788281160; x=1788885960; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/hHZXaeBv2IvcIvud5R7QHHLCYnONKsJzwC8o/GJ/kk=;
        b=aAMJ9WCZhL54dhUpwfuXozSZNHAvv6GIP9IiJNLofonZysP14L4A6sd2DMbDZ99VtZ
         j20TSqVJ1EVlkOQ/UK+Rf4W/cyub9i0bHZxjGaFPU8+XsS5B5dBUqIKhdRcgHvHAlO7i
         s2R7SyHcYUAjJYtUYh0s2NwFZP6u0iJaGE6YM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788281160; x=1788885960;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/hHZXaeBv2IvcIvud5R7QHHLCYnONKsJzwC8o/GJ/kk=;
        b=P2ANdwXQm+Y8trR6dffaw2I62FF7Vsx3MWyMj37jR22osH3/R8SbpqtZg5RSDf0bhe
         le2eqxt0205RzqutoF4ig+oRuf0tVr4BOlSytqnXwP0s0zdCbCW/MiHCTI+ArXlV/QMQ
         rJ2UsIOOZnrPpRV6rX1/fKrUNGxZ9GUTPe2K159MrBidHSzg9hnsMu94tk3G4Vpr8uyS
         NaIR8pWpufMjd9O4BcQvPHk7UvnrPDCsWj0dm52lmOjzzfji5hW75w4CRfCc1yF27FOs
         LZ5yPOazBkPUE6Snv3AKR/lSHyZSCr43B6Oc+JO/WlZL5kZDFeH7cBPXwjVXQBVkfS/6
         PUyg==
X-Forwarded-Encrypted: i=1; AKwUvByCybEW745Q1VJZRQzUC2G+sDitBL+tSQ8Fq3cccj4EVBWgEOylvjcKlgRXLbrBK+fBB861WllI10QtSn4=@vger.kernel.org
X-Gm-Message-State: AFuF++m1d6skjLbCZIAC04SxyyNuBeYOonfwAEORz2SHi5dK0trFo9Xt
	d0+STCE21p4iFHdhwLVN38A2rPAW4jf4EdcNimCoH7xQdG/VCKFhj3lyEKsUGJg4W1Y=
X-Gm-Gg: AR+sD10+ukAIZ1OJSANuUv9ygQ2JWAG7b3QeBYheG+0XZVinn32iLAh4OCKm3Npr5tg
	HIPVsE60pBfWDnpNXoadDIUUJj69dHwMAJsLtq452rOg8DWZ0/iwKSVszBhIQplea4C6yIHE8BA
	eYwZZVJkZ6DhwIPlEirXrTs+WVhBxTErvw4hb03imEwAGh2pjFT1SvaeJ7PhxhX/hZXFnPbdK+S
	FveuRyUaEpf2xtiFMVDP/4VLdKTlLOBJLZJWk+un28/ZUMUaAUt9TlcgeORD1hX9rtxiJWzQAVR
	6JUkE6LUoCiOQtsOGh3phphPxDAl8rWicqUQfJU6bAqgW/C+mIBvepQPx//wuVxuxNi5X1WcqK2
	7LtRIrESYsmNNcZTj2oCbFVTQmPrxMJt8lyAsFL9bfw0IGy0eKoe1Bd3V054FmvpBvZYOBeUvi/
	9ya10SH/0h8aQgAriXuqickeq2XxxIZNmWsxMV9IKF7pHkvV8Fgbg+MoTlRIK4gkMd7T5p
X-Received: by 2002:a05:6871:cc1b:10b0:466:ad49:d0f6 with SMTP id 586e51a60fabf-46af542e37emr6739032fac.7.1788281159759;
        Tue, 01 Sep 2026 09:45:59 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-46f336c72f2sm124082fac.18.2026.09.01.09.45.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 09:45:59 -0700 (PDT)
Message-ID: <08331aff-3195-47e0-bb56-dd4a5fde074b@linuxfoundation.org>
Date: Tue, 1 Sep 2026 10:45:53 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.12 00/99] 6.12.108-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260831133359.740409777@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260831133359.740409777@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/31/26 07:33, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.12.108 release.
> There are 99 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Wed, 02 Sep 2026 13:32:19 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.12.108-rc1.gz
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
