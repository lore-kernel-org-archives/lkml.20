Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4E62DE6F8
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 00:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788221752; cv=none; b=ceFNdSP+P1KMNwtd/R6b3ikDRWqsYVsS0iFTvk+cgvo+vSMLYr5xc3xLcdn/N3Tm/UF5wRwkZNGm58eFGoMSsI1c1YpNqwvoJCwQiym2uLVOv9wHBTk6pQo/Yy/YIjPDYgnqYMRMQlKCrgD4YlPIeFIZ0Js3143ZGR09yMtFAmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788221752; c=relaxed/simple;
	bh=yCGJm1jGkR5RuGr2i5gkhz3GBdsvJF4mNpsE9U0bBo4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WXGi0lLm9V/puKG0uNjH/vwbbRWftaYy2Yh+718askI4yrQeGkGDVbIVAmrUN+GBmt6gwKqUqtrlne4hVmh+idOttfnqJrEWO7AtWVnlICkacuaui6Ah5S4fraIYD3Pw3fNxFioBUuXcBAi0Ov1vVlzYQO7x8oXT+sPK+g2Xec4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d9WoiCtk; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d9WoiCtk"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3969e82ff8fso4391817a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788221749; x=1788826549; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VfqEXN2Uyf15PT99s9ZwevHcWniSGZO3B8ZSbTXjUBU=;
        b=d9WoiCtkaMNFsYbeMa1iAraKNC+yOAWARLz05OqE0V/PsTPuqfFgdqtY1MHfecdBO1
         J44u6mT+eF76rWqpECjrrUVGOCnvywd60d4T2EOeRm5NARRuIif/YtKQ9QecOP1BF9Ud
         EvqYRQpqhb3K+H2DRVFKBs49apdLe0QNZ2yT+qmFaxVOVoJppWDuT8R4EEuAlcHit0pt
         fVv9ehb4NN5CzEdgz3YG1lP6Q8U5fS0/LwAXw+7eKolWNKDHki7uXSt+d5AVzE5tEjnS
         GfHmOxjLNK1oaQaq5394ZCg+WAFESRbnNuCELNqvnvqKV+rgKOLXzOOlMOzrBeYRGZo+
         jo6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788221749; x=1788826549;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VfqEXN2Uyf15PT99s9ZwevHcWniSGZO3B8ZSbTXjUBU=;
        b=OpDRgpFtCbF0BGh5ROauNFdede9AXcW9C1PJ+ZRJ+Gb7AiHPY/+H//BkTgBY73JzR+
         Ms7zacabfxxqhKrxSl/ECOXoaJ27v8u9fAn9u9cPoKGwy/n6kAiHwlmWTxFPRwcBHXvi
         5ZliLFV0pw0pfqV9z6AjTqMmcMBzrpdmxhJAQQFIL9n766piPwdcCC3rmICON9j2lnTF
         adlKz2LwiBIRoW4Yzu+HkJo+4T2Vz30tgPuVcVmG3qTKlYpTNWoApRMNu0b7h3wjL7dQ
         5KYiE1RPrwP3HNb165NJBbrfKuaCAg6kGDsZqiwitBshqHB8H7imnFB0xrCJ5GR/shp4
         20Jw==
X-Forwarded-Encrypted: i=1; AKwUvBxUHtcAeZc2n6umgWIVzQC/GrjHc9L/QM6ly3flzrXRZYRyPcL1NPPxTJa+FBTsZ55ITTgThZ0/sPP+KDI=@vger.kernel.org
X-Gm-Message-State: AFuF++lFB7C8NJl36ExsRHPK5gB0Vwu7LPLQ2fwJEXWHt03zB5SK20ui
	kuIq+gNZ0S/Pia6iFnigmOhvIpOGmQhs1NAoJ3DxyUliUSnNQIVO2UlT
X-Gm-Gg: AYBFou0tr0mt2ZD1e6LF8pQLSQ7QrJkcVsCiBYY1VP9MsKqvOgErJpbJ/lnSf4YSVXb
	JKy/dc21/4agatplmkSjAz28+C2tjXZJthK2OOKgsKSk/w99epcFKhEWNI6//0uOD6NI7D1IwL7
	l35DC9K0/7iy0OTzDgSDe3DEE6NKft/i8ZV/7lAV1q4+wCH575+M+wLAwuaaodcu43OBBjLo8Xa
	kzeFSOYOg4pVK/jPvFQtx3qf7tLYfv1ZDsTFnabcgAIcx8be1zYBDew3szF4DQGauyDoyfSiAy6
	4BrU5ahzCxZgyNJrlaYsQrVdHot2xPm4pUT/qadEMiGmICS5xIi78bNdTO9dOWsY3lPzUoKZAlD
	OfmrMjYxyTDNUN8X7F5GjuUo64DYIosrrrZ33kC+AL9RwbHr3xBFco8rge3VI6496JAKowci9y2
	sGuPK7BasIMORTDrJ5g04SPVwV1ZZmSMnf3qiIIgdr2cW1MWaMWBTDy0Sr0qpFak9VvtvYKBxUl
	im3AxBiztIUeHXA1m0XhQYaJdcSnw==
X-Received: by 2002:a17:90b:530c:b0:381:1c96:829b with SMTP id 98e67ed59e1d1-396d0d4c43amr46596844a91.3.1788221749583;
        Mon, 31 Aug 2026 17:15:49 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d3fdf6sm32745466c88.6.2026.08.31.17.15.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 17:15:48 -0700 (PDT)
Message-ID: <478c7bc6-bdd7-45c1-ae8f-cc7e672912de@gmail.com>
Date: Mon, 31 Aug 2026 17:15:48 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.18 00/83] 6.18.49-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20260831133359.207714926@linuxfoundation.org>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20260831133359.207714926@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/31/2026 6:33 AM, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.18.49 release.
> There are 83 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Wed, 02 Sep 2026 13:32:19 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.18.49-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.18.y
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

