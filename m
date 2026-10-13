Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58DD37B413
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 19:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791920845; cv=none; b=YhOsocRZcZQ9kgkWUxo1Z8C2YNsusYyHO4bPKzf6UY76HG2XX7K24thka6WVlNmBOj93kVJcp2If+KvE+7qvo/p8UYkhiXb4TiYwqw+LsiWlr9m8rKlJ1/y2DE9kTFvBC2GFMMJEAmCLyMUB8Ol79DIY2/drtGsu/yb2Tfhn89I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791920845; c=relaxed/simple;
	bh=xkNdboA04KFzUV3kNY2lng94XpmmiyHm8J7T5ogGRxc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Be7ZL/rJHbu+PfM0gLCZh3cLDW3VQhSuz2ji5nBq8Sl4oykxlIbQqtBlSW/OA+Id0xa270/3G3fB5Ibf+1d4jQcru9UBirl8el0FSzTAKnsbc5xHAauNMQx7JU07N7lKPvTYmRHMmIRQzhNIHhj65s90NHd1UMOzET+6Lxk8p/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tJUqOy4q; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tJUqOy4q"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-91b8b456dbeso21392576d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791920842; x=1792525642; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NTjEEqSqe2isomaMSLDVTGf6TgdKb/jqa049850vzw8=;
        b=tJUqOy4q/oQzmdqeH1LYctKeAGChJEWcDs4k+GVHAOZshwUBUvOJzwuwfl9xuzrQZ+
         8vBS516VMFNSF+yBwJwtbTgj2x0TxEA+gM1mUjPXfCNZv8IavaVrTM5p5qcK46MOsEtY
         e1BC+3PpeypRRbfjH7HeMBKEv3wmu2T4civuIfhfnWA/dssYdOzdNV7leHidfHfcHdKu
         INYl8H6X7SHDLf+kGJrxu5Ktn1ZWgTqj91+eBhugXind65ZZDw0IhL9gHhc3qUvB8is7
         d5t+W8Rw8XbD2YTBSOt5MV4BLkx/jNHinLFj2XGitgx1pmOg+e5gV9M3pcMKdpFua7tx
         dOsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791920842; x=1792525642;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NTjEEqSqe2isomaMSLDVTGf6TgdKb/jqa049850vzw8=;
        b=w2Qw/t69S7u9gMvSr/2t6l/ABxKRffe5KjTKUvZDhkPAHvOb+KgnVWwLO/VvPPiMAX
         ucIUhnKyxyobSr4vZojPSr4XFBEYXwyblwqAL+9Hb/ki+nT2FJ64aK093tlDP+9FINhJ
         89N6R2pyTIlfopGUZU8S36/9pv8BFAFENRj+czqLJY9z2k9n/XuHx/WDhMyvd1+b8qjn
         panDWEkkrfezDuDHrdBrJAMV+x0WVM5xFn/fE8LxV6sk9lZMy/Wqfj1zhP07o+AQBjKU
         HOqf0dZLtdHsg2uimcIbJkB4mxpbjJ2rBChBqm1UAPmxQxv14j8QE5f8uxq3aQ5be2w3
         E18w==
X-Forwarded-Encrypted: i=1; AKwUvBx5SYucYsjjLn7YB04LzEV8n/DeVdcybRXY7av0lERRtBtMhdD5Cl04vs8OqVBHa1xGyPjX8qhv8S6DIHQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJo9Nh/Loj1XcYcC02zJNmS1AdNqGNgTWxmnTieUl0M6lQSIRRg
	T6qaE9pe8o44HF6SijOEJDNtaXx/xsIdA+xhi28fsOilrWjarvDVmm2NJT5eDw==
X-Gm-Gg: AYBFou2nvfDhP7HAP/ynY0p3AbNiDzNF4nCMjABy565CJGdoRmGVaj0cSHOkT8ik0vV
	UlanciJz6Fv75HCgUELi983V/F7pDqBTfORdyF8L5WknQPlwgPCdjOVrwb5KQa2wym/Xm7IEEj2
	l4fQ20mZJTmj7/ilQrCry5+M76ADh+WhDxO82uNTaeAoTGykC4Kkzu+DEvet72a2T/Xcewja9xY
	cLqW/Zj2J3CV2g5BEjGBr3q6Jfeb1kE0+6z5YfjsPYBXa7ZR3rVAbGUdzlaYAfDjz6Hb2vyLCQ0
	QZ+pXrKPSJ8nWio0HBfXI/AArXnDMMHuRvzkbt58PhbUoZ+kr4N1wM6tnDjHmoQtIwK4WIdsffz
	bsd4Rn3GwQk+RVdkPw21BQLjigi2J4Hy8NU+10PQim/wd0iS7oxgks3giyZxvzR2orj6yFsFB3v
	aYmgl90i5GDJH8u/Nel5zf5Al4Fp1meggy78ntc7rHEZeGXBWy+WL9Y17yH+JWKyxhmlk9qj9PH
	//zj4q9sP4kjl608HHRAigH
X-Received: by 2002:a05:620a:40d5:b0:93a:f9:614a with SMTP id af79cd13be357-93ebd21ffc4mr2195060185a.34.1791920842369;
        Tue, 13 Oct 2026 12:47:22 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef5090050sm312910585a.40.2026.10.13.12.47.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 12:47:21 -0700 (PDT)
Message-ID: <0873cca2-2f48-42bf-9297-e543981161b3@gmail.com>
Date: Tue, 13 Oct 2026 12:47:17 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7.2 000/281] 7.2.11-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20261013112855.045212108@linuxfoundation.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261013112855.045212108@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/26 04:35, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 7.2.11 release.
> There are 281 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Thu, 15 Oct 2026 11:28:22 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-7.2.11-rc1.gz
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
