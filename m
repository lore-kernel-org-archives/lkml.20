Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6F74908CB
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 17:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789406808; cv=none; b=ctSIaT33AHhmerM1BJSZdY2D8LVddcwaPlxHnEVG8ehc4978YvNmz4w2aUPrLE5CpTEFkeIrpIMdmkUkI+idVF2BFEI3lz/BjQ/pQOQLhfFPWObb2o9iSLo/cddzlr8wHLs6BPGW01kQvUw9Pk2j1jIqOT6XD70KAQ94qbPToIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789406808; c=relaxed/simple;
	bh=pU8YoxfaiYcGyjJ2bzXSTvUUJeEHYPgFb5yIn8TMU+E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gghq2qOl1o1u6EjmpxJwLCVxV96ICXnyqHhI//PY5lpF3gMZIe1BHKf+u5C5tsheM/+bdSoxhVQxh+sJA9isKtLNp/ipNO/4LwY5qmOlwg9EHGcBjz24CxbOzPXNt4AwltBD84wSOpcfhFZCqBQpjFkHhYh+dmM8yZzc3JPETIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RMaNdIe5; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RMaNdIe5"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469b2e1d7so1865093b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789406806; x=1790011606; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=glDU7GH43DqZJrOds8Mk6qv3pqgdcJGDTfDGiTxJPj8=;
        b=RMaNdIe54u4lbXgKVC/jQYdBF42D/paAE82PDjZe1J6caXLEMSyuH5frSe5hfmf1Rr
         qv7vtvIn3//zKzNJLP9v3N16fK3RlCnnPvZy36YyDPECP+ACjT6Pd6y7OgjFsGiGNbi7
         S3NDGNMTAPqAb0kDuiJnNKPUkdXQlli+yk9poC/aLEDAI49OkncgS95+1Lp/T5GUy65t
         FOkqdCkVaJMD+hcF/K0Nk4GWB186+7kfCq/Zk2O9YA0FTwkrzu+lovSO+BJKSby4U43E
         Y4bgT6Gkf+ZyAsaS5HbNFdZUn23CjAXr8rNtRCPX1Brtu19S/622BsWrEDS1KwqBEjqJ
         aXrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789406806; x=1790011606;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=glDU7GH43DqZJrOds8Mk6qv3pqgdcJGDTfDGiTxJPj8=;
        b=dmnwS3g2yco5qpSeApHnH1kqg9Uut8dd1NvN77ffoGWRqJR5pPKjCbhX+C6ZNTnuH7
         XHNILniuy4i8chogWrAKp9WrpJW+sIZaHrognnk5D4Sei+3T6eS+qO9JRIzZRaFt7S7Y
         PHjF/iRV0ApmPpaATADVo7zntZi7qT1edQVqUymHRWcWtcEgFKGt/vOovSVVa5mtUwPV
         tMhdj4dMeDGkfkPaePFz19hpNQNDV5cDZ1RKYucdP9awFf1qgC3cQuOsAStWhAm3W+vG
         78c3+IgeF6nTK+te6jJZaZdT0aZY+65webjA59maSTwMJt7qNoh2h8/ylyoQqqFeJSkw
         QAeg==
X-Forwarded-Encrypted: i=1; AKwUvBzsZWZ7R2fqwEO9Zi/vY+KDLhStNXiNQlj5Yxgcwc5WEt5I8rPDFX6j684NKLk2qYIYp8s40DSxyuRmZpM=@vger.kernel.org
X-Gm-Message-State: AFuF++mDdraIsIw8QQ5guUNzSnA58CZRdBohGlOKMwJxVFk9IOLYiuJU
	C35ma8UnfXQUuI9ThPAsz0kARKvg0JnGurztLbXtA4Fq0Q+W0hYklf53
X-Gm-Gg: AYBFou179qykayVXwUAvL65dYSr9Gag7VLloP/AcnMjFTTiJBk2bNVbP+rg2KUKSkkV
	eX5RmfesZasGOuStU7reC1/SIc6/Dv/cYYGhFRI3qxWb0zprSI1lI+6Hl7EqpoEM+hBuvNih/UR
	VTwwX3clZwyU76WnEUuMC47Idg095T7U/eLJ+pq/OvAe2tzHA1rEDO7TC+HhQTY21mdolYvpGmC
	CYrCENTDAc3KStqWDr1/BKWzgQb13lJhw0MjTcVpcfPaGqsbHJ4fkx5CPb0+wTdk4Qrx2TRH5Cx
	MXROsZFZEWOSxjd2owRTVkN/fzIJ7W2dib0iND+WhZ3cxS0MpTwtC6Tw5xzhQDeOvK5LD4cxpgP
	a9lllCofzXSTMwCCaA2KrhkGC/2edN6mWGS1nRqe0zkSlMil3iEGQ7IwQTk5qoUOQEpHM41oQTZ
	uxqFBRTDLLJkkHeisEFWQTDfsCwXFwu7wrHr/jwUA84tEVpAzhO+mO7FPEC5PES0Z2vE01t5hFr
	OH8nubC92+c0DmOrLXXaAOENA==
X-Received: by 2002:a05:6a21:918c:b0:3cd:61d5:f342 with SMTP id adf61e73a8af0-3db404eff3emr8925150637.9.1789406806046;
        Mon, 14 Sep 2026 10:26:46 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c6529a71sm5483635a12.5.2026.09.14.10.26.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 10:26:45 -0700 (PDT)
Message-ID: <f37a16b7-b9e3-45f4-8ecf-409a4eeee674@gmail.com>
Date: Mon, 14 Sep 2026 10:26:43 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5.15 000/935] 5.15.221-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20260912065526.833703348@linuxfoundation.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20260912065526.833703348@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/11/26 23:50, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.15.221 release.
> There are 935 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Mon, 14 Sep 2026 06:54:17 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.15.221-rc1.gz
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
