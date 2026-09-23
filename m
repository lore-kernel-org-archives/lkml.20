Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C8353FD28
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 17:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790182818; cv=none; b=goi/wHz5tXg1ED448cIUnX9rCNHguOOf4EsoBM9kxTiW9HlbDq9y7tVdEItF+2GqAst//NR5rgvXTIczF/EyV841uvnS4afYzCGQHiAVSJuH+dv7ekEHtacmzBWUqe4G+/N87EDr/7EcyyKSgaXBoGAUB+6arDTYMzs3/d1++5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790182818; c=relaxed/simple;
	bh=sGc6PJ0ESI7aHX7FRKJfITiyKS1azlW6j7agq0JY1UQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uy80GYFBCS7xxbWQvDKU8SZenTVtvhipbr/iIUJ1bv0YFHPGRzP+nUatot2MPOxz6NZbcUVaC6AuX8zaQg7Y2X/aQC+q69pbnnJLOYSzy0HfJIRVLXhY9/TKfcu3HFZqznGHZjZLhFdubmQbk/1/rG11kxvdNBLANbheFtR5Wis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D1BXr7hr; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D1BXr7hr"
Received: by mail-pz2-f40.google.com with SMTP id d2e1a72fcca58-8748f34b1f2so692897b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790182813; x=1790787613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zS39PJcT1oQj1VI+hAMdqo5YKZWOz03P5HuPkkDO3U8=;
        b=D1BXr7hr3nz3+z2BR57/MNCw75SG37vRiam7uTqORXArxmgjvVuoJOkJqGmE57mbTG
         s4s+ElQPhf8Di8AQW8eFxVXQjs1V665EddN79qATTa3Xoex5+SL+iFVaaGbFGJjk1Dwu
         G7kySfdFMfAnZdYiF1FySkPirWClUu3VzLy+esoeLfzQ9LMGNiM5UaJnhl+0dytVaYxF
         pbIudF4DnTq+uDE/4ouwwahVVUiGvLbQXGW1nOQklhDv7qJZSoFWFjy+gS5G02R+NgsJ
         ou2VVev0wVJ3ME7LWaJNZ0VRMWL7tfBe/d1KNgyStSeW1TnOYSh0e6JlBSjVgEIr4hQ+
         YMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790182813; x=1790787613;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zS39PJcT1oQj1VI+hAMdqo5YKZWOz03P5HuPkkDO3U8=;
        b=1ZMRjKwZSaV1OEjYGoPdrZqbsV/EmgwX1A8UfeD17CGJBiEI8fUdt8BQKg/W7oGMPU
         s+3Wx9nCWmxYNJAt73oSGp4nJq9+0Gl44r6dbNyEWkNJAuREqklFLiYWfIamEXNxUxgf
         VDO+QvjjXsVUh/XzPs5mjDXD3aV9A3ptmFdZtI9DAtUPnS53tZhdJlOrvLsaG/Z8rhWL
         DeQjD++S2DEz+qkMb54nRmP4r98HbeTjtSTqdtSqor2YWZxIf5mMg9UJ+7Upu+mNpZBQ
         fc0HSx26i6u1feng8FXU2eCTmGwCWs2ZP/vPbjBSumlXhafi4+fnz3n501gc5qsBUD+i
         o3TQ==
X-Forwarded-Encrypted: i=1; AKwUvBwf9ytgNDz8GJ29VGYzNGaMeYq1h+u1g9xelSqdWwYReuXjsoQjEBUTprbMf8G14Kbd8nNW+gK6prjdlJM=@vger.kernel.org
X-Gm-Message-State: AFuF++nLTiB58JEuM5sRvlOEXM7StBQiW0al7EaBdL+guiuRsWueTge9
	OaYZNLumByXj62Wsrb5oLEjwOfzULfcF9+6+gL1omlnwQ/KaCcdFcoWS
X-Gm-Gg: AYBFou0QXdTFJ2xXERF23l0LrUN/XfXnTKl3T1r1yE/6oUKpq1BH0STZuCSypnbdvPl
	nKehvDyewG5hzisYevTEm+Tsaj5qbsUcZIovP3EoTK31RRRQMLL0ePgBCLoBZXVaGa62A3UAFJh
	AMlYNJa6G/Njg4kzHZRBNb5ylPtxLBtXLAmiCVg2S+zRdowfn7tt5ke3AWNuUps7ySwRESmNkxo
	YXMIb1sY5j4MmFpoW8cqmVZ5DzG5qMldd38ccBK5cwJ7NCmGCQquEgfgncs2E17N3ZLf2iVtkar
	FACALuGuaAv+B4jUlpRXZmnY747bakfZWn6H94b0yx6jfioG4jQ7jqKM3G5R+xY2CUa9+jUgFeT
	nyNFIHCD9pmp9fk1j9zP0S3Zbbysb0mC4K8H27981p6D1a1Vv7rkcNOKh8LaRvzPIcDSeHC4aqt
	0raL9yd7P6edw/QQpduo5FHDJgoQIy/EKZzPrcFofXFW7ZJI+92SXrxdf1vN7pZhUeUmGl7g/kP
	7c4XJrco3ru
X-Received: by 2002:a05:6a20:d529:b0:3dd:a197:cf22 with SMTP id adf61e73a8af0-3ddf82868fbmr2949364637.70.1790182812807;
        Wed, 23 Sep 2026 10:00:12 -0700 (PDT)
Received: from [10.14.5.0] ([192.19.161.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1dadae4fsm1630251b3a.40.2026.09.23.10.00.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 10:00:12 -0700 (PDT)
Message-ID: <8fbc43b4-c38a-49c1-b6c9-77899760ca71@gmail.com>
Date: Wed, 23 Sep 2026 10:00:12 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7.2 000/438] 7.2.8-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20260923140644.756254324@linuxfoundation.org>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20260923140644.756254324@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/23/2026 7:00 AM, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 7.2.8 release.
> There are 438 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 25 Sep 2026 14:05:46 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-7.2.8-rc1.gz
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

