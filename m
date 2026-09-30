Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767613DFC8F
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 21:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790804604; cv=none; b=l9rsG5VZVFlIlZxzG+SX6nZz1FFxbQtPM+KaPIosOKzCJqkvSRs/W7cFxZK2TrCxYRYNEvITIMj49CorxG0hlrSLSsrJuZek60DJvbdd2DinomePHzqvNptF+rmWjjiJn2q1l2OEZazUDbdNeSbPoOKdzZuv3E7HgHDq4hv3Pdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790804604; c=relaxed/simple;
	bh=bBR8nRQ8XAmNXA0T6elTngU/deKR9ybB3YQ04hMzTJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GAhAjfuA5hksZE35o9e86EOBQJVLU6GNMZZWyiaxW9rljVF40KPT9Qz1PhgyRRh45loxJ0QOW/y16LAdneR58DljU7Cs1lBfYZNlue4pqAvtc2132cFjtqk8QNuDX6aWm1L0CbEucDyF5mIaQRbAcnVF+0v67tRF6dJnZ1SA1TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=faaUXHNR; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="faaUXHNR"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-34b14db40daso1195307eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790804600; x=1791409400; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8lkawhUgZ2z6Rbax51KT4StG2qQ9CPt6IcVwt464ZjQ=;
        b=faaUXHNR4L8nRJ8vO/PYkNKPq3hSFqNds09T+IV8AWwxGnvjPxRB86HwDtkvVFPw+t
         G24ffAKJxiI31zp9T3WnqZMPbx76R9PMm0VGbK3Njt8qXaM8naWrgd+Gr1CIQP3E9JEf
         nN3JLJ+JBtUgtvqf5Wl1pIQkL5GC4q5wA5kj3wJSp35tuPtOqbYtdB7Iok5/fNfCodUv
         f7AjpRPnKL1lXWArkdfOwqI1i2w//f5BZp56Q+eIw47zcgFoeQYr3DI2wzI3NW7UK8ir
         mPUWF6ZexkkrBWuV1fDSsDqGcttQGF63mltpCKZNIbDTPUbowbuFCxFVjORL5EnuLNEi
         5a3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790804600; x=1791409400;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8lkawhUgZ2z6Rbax51KT4StG2qQ9CPt6IcVwt464ZjQ=;
        b=VHAVO3YI6m6m765dVPIRKf1ABsRGp2lFnx5/4WEFhKGKdbMdABxaoXm4iP2WPNIZI+
         AZalDc69M4sh5cU6dxUW0LCCFgztOVp1QZ5X9rvczZt5HPRzCGJN4HzW0l48cpkALY3C
         h33QG5QYff2ZGsIsb5EbP2f8QxwSgLC5iFgkLHIo5aO2OdgqOgl4Km+tHfZadGWkYTNF
         uZRzOoBm1vKk3QxJtXrXaVtIfdV2N5reP6ILwj4CB4ITuNXsrTFfTmQRpOKmFZp91A7S
         JsvQlMVKAL1O4UCynfskD+l5l2ZJcFgsIsHdJyLdsglpWbbaSxITi5GPCe2ZQrc2VlaT
         iJ2Q==
X-Forwarded-Encrypted: i=1; AKwUvBwAmZ04yqERbn/7/+p7/8J9ctY4M1rjeT2w1RqsGT6cJ99DZJG0Xx529zEEhv+VtSa272ie1OvjrXRr23k=@vger.kernel.org
X-Gm-Message-State: AFuF++l6TKSfgZYpoudxz0vbqxXu3KDfsNDVF31pO78f+5c5KGyiwtyj
	Vcl536msy5XGKEeIiAtBqqzoxRxKFo7hC0SeHPRvkPkH7v91v7ckbIU0
X-Gm-Gg: AYBFou2FB2K9FV0FbU0vgSbhCEUmSFY4O8/p2a1qio5tyWaMpIHS3UJ0zalXDMxlNAG
	VGoi6WcfSJR/9dvjtdjWb6kU1s7sCJ4PpJV42telHp6cnnpvxnN+l3yXLHKX4fJEjOrUFVPFUoT
	OsXHA+FZF8+nxZtKFFz/qG/GDztCspq75HotKC2CjnKMOy9pIyOq34zqNIxKQnEFnzbnUjeEDoD
	l6bWQIF2HAGbYj3EdE0lHgn1IZlxbqswvjDcHBV3+HOQAedg4UW4YSYQUGqD7AzUWJCkyHgxVuB
	vuH03TBxWPeDAqMMPDBUvKiYw1u0iO1vyJcTPvaH8nx13DCNjj9KHWnlKKZjc3RJ8a33qmkLeAs
	jS118lWSh3tdZYCJryufL/Vd/cKSd1P27LklWHjRWT24uzRh8R4Lpko4j68IqVI4sXz3ksXsPTM
	lHJXaEhtXL4S0pkD+mMcc1H8V72u04GKhSCvDV9SOJaot/+1XztaAdH/HvZpp8ysXX3ZyWsaSrj
	IR9YvazeYngi9DN6v+FpeRGO3OEaY+hfxmCW3w=
X-Received: by 2002:a05:701b:2914:b0:147:9ad0:cf15 with SMTP id a92af1059eb24-14dcf494d00mr686116c88.22.1790804600394;
        Wed, 30 Sep 2026 14:43:20 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14df48c45cdsm762620c88.16.2026.09.30.14.43.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 14:43:19 -0700 (PDT)
Message-ID: <d7429656-810d-4146-aaf4-4c6997c4f030@gmail.com>
Date: Wed, 30 Sep 2026 14:43:18 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.6 0000/1193] 6.6.158-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20260930152434.301151190@linuxfoundation.org>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20260930152434.301151190@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/30/2026 8:11 AM, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.6.158 release.
> There are 1193 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 02 Oct 2026 15:23:04 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.6.158-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.6.y
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

