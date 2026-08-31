Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C35399899
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788195693; cv=none; b=h7RN70Zsov83Led8AYWueZ8sykeo+inCJWOF5hEoHBVP9vFgW1+Ko2PMQWX7oRhUaDCFzl01ppnSpVTbBpNd4IGn2ra72u2LaKGFwVR4V+/TNHXTzSWU/tzZOKAViFtgHvZH9Am3zA9P5+IRxnhfAGEqkFvAYSiNn2COmV3jtsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788195693; c=relaxed/simple;
	bh=yq3sAt1weRagllmnbj8GWuHou+5wuA4UeE2rWNk0/Hw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PKRInmVbidVvGVBpIyStfsYi07aiOZijQi6e9sjCF0Q73rYxm0IWOywoQDvkkr5+S5Y+KN3C2lwFd68V+ZBzMpNvM9bRvJbb8/b6gwCmQTGWXGwehMQEHelbAvPKZMJmtGa3J/CDN1lacwYkumc0DfvycekeHM4qeOiW5pbKsqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ASrt7BFH; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ASrt7BFH"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cbedd5aece4so74578a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788195692; x=1788800492; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=awVImKUzcLY0/XtG0S5LJamAqn3OfyX50g+7J1OI4Wo=;
        b=ASrt7BFHVe7ceSoYNaaNisfasAOlX+OfJjnhBW9M6o/hELrQctWdosYgA17XCPuVnN
         DEnkih+M63jruMl/33QYA5XymSA0cuUSOkncXvOBcrCDRyTt2iBPR0DeCx8d4upVAm7/
         z7uJlqfXWBCo8wMUzf23DAkRro+m/KPb+54nA/IicRXgxbXthDcBRoLMrEGvIKLtw8PD
         N5ih6uzSLOFn0+dl7Y3WVk6qeIW1qR6I7gBkEi/e45hXAw07kr3kMVrI1f46fSQSzozO
         x23ebu1ZiA1vj5HL0DsLMdkHMCvYCdvslxjQ3Ipr5AXA+/nE+gDgWdvti1xb3e5cPUl0
         vzbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788195692; x=1788800492;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=awVImKUzcLY0/XtG0S5LJamAqn3OfyX50g+7J1OI4Wo=;
        b=gfPdbYvPNC9Vzqx3PRk1K6VlpaTQ48Z3sFWfQiIx6OwdgS1A6QqsTkx+OABiejieUM
         FLSRQaphunU5rIYtS93U7jMafNYGlChODOZen3M+LlbnYIxlLs2STzHDGyTYysFIoMIS
         3iS7CRatBvXVDrCyyHQSDp9aUrJSZuFVlWjRFido2q0dpgQncrB0X+xtoOSwGXPx8yj3
         5g9qvagHAFZHPAFPzaPkhvm3EhU7gDxk2fr2obFcxoGlLtIb2hMhozm2ZXvBL8IB1ATC
         liLCSZYN4liu1eZsRSCw8XSoLgrlKJ2JEcylLdh/S1zvlzcnJZmQJo/VPJ9O7hX5y0qV
         HadQ==
X-Forwarded-Encrypted: i=1; AKwUvBxX3rBXgJ0qvZMK4j77qOIsUVItThHxwDB26DkP1hRPaSOPMWtBnpG8sBXI7+CWpdA+ybQmlK33SdOD7QA=@vger.kernel.org
X-Gm-Message-State: AFuF++n6Cyl1cf4YKM15FHJdMf2iw4lppng0XpVP4hn3YXhZkbb+Jd2v
	8zYs/hPUotwDms/Efkbjx0NZu1QJwLBjL0fcPn7DaOmgTBjPz965nvgd
X-Gm-Gg: AYBFou0Jxe0M+oQNuaFdxL6Y2m2GPya2cKAlMLf+NcDaMxMu831W5L+JoyMfEM1Ao8q
	1o28URtrsN7nmHb0Kaz1pK+t+Nav9PzwWSphBCJ1qgG8p9K55cS/TkII9zrfHKOON+BEf+AeZWA
	6Q/ZUx9NNpwKOhIk4wZo9/B7lx4cnM31ZD4qP0KzkI/pqswmveRZm2Y5aLxDC4Svr5rh7i9w78S
	cWdv5nYi+sc2db/TKgRUw/sZBEUJeLvn42ibUQfQauf+qgpTxFrF64lbGLn7KuTfslzCvOKmBEF
	Hw73O2ja7sQ0dWr1foS0aZvcQtceVGw4iQvpkFFVzDsCM5upbB3kbkbb+exGI50yxhnUm6YyA8u
	eZ6lIGVJlfriwBNV/MBwtgEoYYKeRUhzSWypSasOrbPL29R+2dRMBlCKs2YIRh3kMKoyErIcOvd
	zuY52q/GnAyiff8yzVNBW13AU5LfnzfFSE7XwC0cL4yfZ+BSHEQRfG9BGnPPm/NWG9BRU5Z5g/U
	zMAvfkisUO8ftss9MO56fE6rKdntQ==
X-Received: by 2002:a17:90b:4fc7:b0:37f:e5b1:ec4b with SMTP id 98e67ed59e1d1-398da5e8fa5mr9325730a91.5.1788195691825;
        Mon, 31 Aug 2026 10:01:31 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286fa37fa5sm34437702eec.29.2026.08.31.10.01.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 10:01:30 -0700 (PDT)
Message-ID: <bbf4711c-f12c-42d8-95f7-0f21df214b71@gmail.com>
Date: Mon, 31 Aug 2026 10:01:35 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5.10 00/43] 5.10.269-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20260831133358.571886287@linuxfoundation.org>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20260831133358.571886287@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/31/2026 6:35 AM, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.10.269 release.
> There are 43 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Wed, 02 Sep 2026 13:32:19 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.10.269-rc1.gz
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

