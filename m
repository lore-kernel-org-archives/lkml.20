Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC973A3E68
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 18:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788979459; cv=none; b=EF4IiP7eABXKk6lgCoXEHMneq/daauCCHAkI2BDU4N17VeVi+LQyVamn7/1I5EU5AuqKK0nhkcZX5IFTJztgZraA0hdCSzPMxcW7TldQEOz3JzS2gu0ysKWdUiOjOf8Q94O3LwuYkzbjBHjVEuvn25I+GOGUHKdolBCYpg2Lm5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788979459; c=relaxed/simple;
	bh=GBJlCUhbFJ2h8LJzp7/8I5Sp8G1WbZOYa7N7EatzZPA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WCY0JR3n7M9d1cUIIPR9kw2d6teUmffNRzq+Mqskzdum4i5DaD6+Owckiq3zXiIhnff4erODQ6NtqIU0qjQebtVpQ+zPArYlifTEKD1zu6XI2nMTKwpWL/50jFKJLzBD9zdtvhBQhJOGJ99fATxISrWMR/u9phNbzJmN7+XBnpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kCbXy0uZ; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kCbXy0uZ"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ee1f9bso15647865ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 11:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788979457; x=1789584257; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xE4MhgXXi1uL0qo0jklt/DxI0WtmnC1JMz4tFPrlno4=;
        b=kCbXy0uZ5KiprFRbcqXyZCO/2NnSNE7m64msXyfyrpNu3tQnS5l0h/nvmEHyVKmkvf
         wKC9kDsD6IxGdJUqdd76e3j8dJml9dpiCf5razU4ybb9nxz72uRUvprMNdfcd1DDh6x4
         i1L3hN5O0yVotTRNw1+yIx9bvv85jZqZI6bAZdnupHk3YYoATezr6mYdzmlYkKxGafON
         Qyy/w9vg+UZQyloSdPuX/dh4UAykvM7yK4Q0V1z7mxW5t2fy0//cMrDettlXvP8go1Uf
         0RxY5aAeHeUtxevoAvJtSgLHkAlb4LOT7yg4Fi6X/qYsOGCM2Qrol92pRNhB1OSwvGzT
         24bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788979457; x=1789584257;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xE4MhgXXi1uL0qo0jklt/DxI0WtmnC1JMz4tFPrlno4=;
        b=myM+WXjgIbeeFD9zUkvR7JCCV2ycXhsYBzHUa/8brmWPkqXjSlc+KGWtBRs6JsT728
         0YBmQGRq0JqzF1KlTPkoy9cYK2OPr6rE3nXdZRzsI8zg22DamS0gMd3ZPqMWdw+95N+Y
         rS0ucNQw8sIZs8QJDufzVTKqRxpO0SRwpcWcmixMTrtEqiXTkVDgHY+NotbLrXt7Pn/m
         CCDZ3CAR2rvb9a6bjK+nMlFakB4LUB79qRuFhtM+jFhUuXXHNtVcP1kFWZRjOSYLahuP
         7hsjBWQ+Dc7hLsa7Gpo/yjJTc+aYmmHGDD00SvK5uiVNOoJG+5Y00FOOYndW5xuoDWRx
         3SrA==
X-Forwarded-Encrypted: i=1; AKwUvBwfxvF4WoipCZmsBOEhnI/J8dTUqGPVHrbCWSJzQNZXl9cm+YPoUQvrcfoB/tty+043nTYujnkfUadZ1Yc=@vger.kernel.org
X-Gm-Message-State: AFuF++km5Woz2oe+lp+pFXsG7MbJwlQ0oS9lmCoXG9dpppAvzft6KZr+
	8pCiYV0x7biUcBqtq0fzU5NG0A0/y+4vnjAbg0KTcDsoD5rQrxFljQVe
X-Gm-Gg: AYBFou3+SNy56fCs99/9jAuEjR43hIErIiJljCNZnmt0tUgDoXB3Sx/dwLVVb1RaOUy
	QSJFsX0NQXrPwXovR1FIdod4+0xPinP5KuBDawf3vykAmCU1QaNybx4ggveARZaMh9lFmKTwizr
	fvW7X2oo3QpNb2kML3sDEdSvFRebPcHsATup7WCGMTHdHjo9Fs5bdCL9QyK3fhil/nefyBTAzB4
	ii+XL8Sai+UY9ytCp6AlVfL7xZ95mHuhDXOpq8C35Q3yASrrMVbMXFJ//aHBmdxe7CpiGKjqCNo
	rQp4pwbBifd4Jc/QHLSUst1wlv0qyWiEjPrO3qvcxX4vWRkK/aoA9x++CZRFO064WwuV/DpOcTM
	3gF/COv+o9dSY4Y0SZTMZ1P/wHPGgUH3PesxENT3eaEoa4IDRRsnM1X2iHLrM6jodjK0TSLETW4
	CkCu2rPViytJpnVEZADy3RcaA/vZnZ+U+A+l/CSItYo0T8J6Zi3br4IXdq1g7Qd87szKNN8S2K3
	UwlZtk41SMLDrPQ9Ox6u5BECA==
X-Received: by 2002:a17:90b:270b:b0:398:c9be:cca8 with SMTP id 98e67ed59e1d1-39bac13b38dmr11758975a91.2.1788979457285;
        Wed, 09 Sep 2026 11:44:17 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3397d6d1c16sm7741767eec.13.2026.09.09.11.44.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 11:44:13 -0700 (PDT)
Message-ID: <99110247-7f33-444e-b37e-eae8e641c45d@gmail.com>
Date: Wed, 9 Sep 2026 11:44:09 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7.2 000/556] 7.2.5-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20260909134230.441546314@linuxfoundation.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20260909134230.441546314@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/9/26 06:34, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 7.2.5 release.
> There are 556 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 11 Sep 2026 13:40:31 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-7.2.5-rc1.gz
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
