Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B519370ACE
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 17:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788974892; cv=none; b=UbVwBX+pck60n1rmY8JzlzLD+uRJMx1CtyNZJwGSbOZmXebNCSV0z2uIUuu8Bl+vqWRsae1n6jKjfQR1gtShwDUXF4YvZgXk8PKWpKvzZLy5EcFkhS3HntdsS6Fuotx+Jk794IQqiLVHib7+l43VBcPt3gW7e/vdm0Z5vocFtn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788974892; c=relaxed/simple;
	bh=8NppacfHdLDtG5JzX2FZPUFkGO0XjyIiwYMs140ZnjM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZCPcRQrLfhCzV4pQl2VA1eydixnYiMn75vCklfi18voY+1CwiczDBnx1W47JAjYUsf/nvfAzNkQg0fuRxTfTBydqNuTdyxjhvtUBtIzc+CAXl5n2IRSfgYoqrfpsxRpnMTonETZ5F6mfxr8BU2KGicxEc9GyqNGSURoXNisJ9E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K0wnXL3e; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K0wnXL3e"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d90ba1d807so6908295ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 10:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788974890; x=1789579690; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7iMcbjfyMphX5/lME4IhFQ/AbOnN1ivDHYpPPxczf78=;
        b=K0wnXL3e+a0Xg+ju9TofH2rpLNcivHUTzxjaV5C+n0HVnZ62drz9e0wfu/WvR+bnW7
         VLtYl42chhRnOsAHuZF2eiTN5Z7SHHyfkWbSAZEmVeTtbLpxsEjuFP009veuq6vl0Ky8
         8nXjjR0v7yIbf4eW6zBYdQBnmChHLUeTUbQLKCN8VbxDw/0nYGuCPeD0yRj9Uzie6vGY
         BncO31hXgtd3yaSc5CGUc/SKoTCvE5r/1pQ1EgnOvduq/1/X9lN/YuMONSfjtQ6Z8aJr
         IhQhuxEOXbNxSdWVE6TuC7ytFZHeJa0BH0HRy32ALJ0sEcM/kE98uB3/jO/QAHR6/Gr4
         3zOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788974890; x=1789579690;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7iMcbjfyMphX5/lME4IhFQ/AbOnN1ivDHYpPPxczf78=;
        b=P3am0R87280a4Ew3Z7ouo27iUy3W31khkRs2O5W2kNFLgVTdfdo7KiylhWEWcNsKKh
         gLgXhaAuRSmbteG+aYzL/I9P9QQRXM69FdqW0xBhvoDNbvdbvB/TxkaxNv8u8orGK/TP
         bBX7CvW1S3fmOdxn7sDvzx8Nw/0cgYFeiRxetrZKI6K3Au8W2BXsEWVIqPabsTV+qqHA
         q8fqZzGsCwcxruE1QyNg0rddMToPwbwA5e1zx+W506Jxr5kZThCoHhLp81VVUedPKjgE
         YV/z4XyzGfKsFO0ReT5mFmzxYj0GIybfPVntK94QPhe7LQxvK8dX9+y+4fqLd6Hq4tzm
         fgmw==
X-Forwarded-Encrypted: i=1; AKwUvBw+igTgft2nzP+zliMs8uX8ZJZJ1Ec4037DywybZOLO78gHTPwZj3MdoAmC0Un/shvZlpA7FSOxXShzze0=@vger.kernel.org
X-Gm-Message-State: AFuF++lqwCUcqi6fi7cnFEN6jL5Cd9elt5YHcO/m/1zoXIJamb95xBv5
	oGGMFr8f95P2P6FgElq/g4vee3qfeB1u3R7mJ4GvSCwnSEghgXF6QNPp
X-Gm-Gg: AYBFou2Nvinuq+mp/KcKCv1iBVun/RVeqFYgkxr9BhzTbH8BIPRL/AYO+dG+Iqiuzxo
	rF/tdkowIU6dZ7YUyzfifOCJqedG5W1zI4cPJR5Mq3xhmQWCTtLpPyhP7L5tD1UV5x4KBnppzRh
	kBoSuOAy7e/dZtJ4pWBp7ldEfW3GxOb5oXfVn2hhNqD7PTipE6emnUSZWLmTQh5B0nvB/+T4siu
	ywGlMIQHuPUBCKLmAQuVqcBxxJ7qNhWwkn2cBlaM+Re6yt+5CI8anxcI6j7rOD+06LK92xR45xk
	o32RV6Bmwvbgw4HJJIEZtnjeLSmvkMx4kfEwLk6tMOgkyfwN3SVkh7ASBPjLmemV2DOvLjDyvjg
	Ein5siTpuhq87ElTmpwBYpfGaYNzNrpPlC7IcmpIenGkcqplgiiBwXJ4korJe+nTqGjI90eGug2
	KIg1A8AHhCzl1+dNBBv2pQTLBHVbF37Z5DEpp1hDmOoIFauGpShbF3vKxzpj75CLNxYKNCIoR5z
	KGbJBu4YVDJGDglt85GGFZt7A==
X-Received: by 2002:a17:903:46cd:b0:2db:39da:90f2 with SMTP id d9443c01a7336-2dd07809f49mr31004255ad.8.1788974889883;
        Wed, 09 Sep 2026 10:28:09 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1497e9e5sm76340935ad.38.2026.09.09.10.28.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 10:28:06 -0700 (PDT)
Message-ID: <04d98c16-9f87-483d-a4e3-b79cc586d537@gmail.com>
Date: Wed, 9 Sep 2026 10:28:04 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.18 000/583] 6.18.51-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20260909134237.773280130@linuxfoundation.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20260909134237.773280130@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/9/26 06:34, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.18.51 release.
> There are 583 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 11 Sep 2026 13:40:31 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.18.51-rc1.gz
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
