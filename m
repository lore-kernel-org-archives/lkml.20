Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793224649;
	b=0XEEq8OHv5ZiI/k8r/87UPqd7ptJtCMneVIgGJ2LmC0BDye/oVETntWz1GazH94pEnKX
	 s43cFtA2kjRb1/5hrjiLdzt7hbTMudXQZvcmSNNe9kF8vhwytcXYU+G+5M7o1e9qZL3sb
	 Zvx8dbvRAQrG94hP25eLhFzDJfzqrzlTD9THB+309/DhQFhPeYsQJmyLRVGEk6RP/5CV7
	 WvexKFiGaxrtiH289+gfsSiAZR9n3y1+CATlKz1EipI31FBJ6T0AbPUp9zVe/ML6YLn8v
	 sh1WHeZ9SR4W20R9HWSxOywWIAFvqsjWaRJpMwQeErsz/G6GDMe4B2NuDsOQe+0lp1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793224649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Nmob0PGZGbhgpel5Pzhl/DhX+5a07M/6tXtKDShuMAY=;
	b=YUMk6iaKT4MunmygfLDI0LEsiI+U2BjhZ2p10U6JVB3Soi3DTY575ni5RXazEA6jj/53
	 IJD1NpD1zeUSKtedpXgFh2tMyWh38feiBKsAZFuiYDDjiSZR33msrTFiJB9OsgFRpZwZd
	 pQhqoJLPweCa4tPz2mStM8P9NnnwRCACDQVvxREr+xLjMIXMPfcvgQ/l8jP6ysUxAwjYy
	 koETLvjsl7Mrt+LvVsPCty7Tawu7I80reG6deKiMa5KbEel+YdnVRz8nzqEkttInUjRFf
	 nmKS0g4ML+C9LsicKg47rH+UCxqwqbRzUqkR9itwSakbiPadXMWOqZRq9jp6RP2CJBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tsb2Mc8B;
	arc=none smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321AF606A33B
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:57:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 321AF606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tsb2Mc8B
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-53634b8328eso14134851cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793224648; x=1793829448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nmob0PGZGbhgpel5Pzhl/DhX+5a07M/6tXtKDShuMAY=;
        b=Tsb2Mc8BGe9O8MzLV5MjTldRsH/mdPqcyBLYayiQC1vD15CTOR+0wbRKk/wh4Y673v
         cGCooyKDfJVJ67YtcH/vyphZmtnXyTZHookTN4V71caM/HbJBh14gL9aqN0LwvPYJ7cN
         J1LlQErWqUw4x0SOhhsQE2i8Hy8n2N7HKgq6R/gjKsnJ4nuW205Jw00m2PZXnrQgj8UJ
         27cE9xfqcqAQqL5xLGpctv8+IgeznsQtmnNKo8vdsHGm/b4pQgB6TXx+4tTqUVEcDuaE
         rCqBvjImRM2FO4HbJQaPi3r5vLUDAVAGBNsu7YwG4XwQQ03aZYrz/Uf6K28UEzzwarql
         B4eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793224648; x=1793829448;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nmob0PGZGbhgpel5Pzhl/DhX+5a07M/6tXtKDShuMAY=;
        b=bHBQL+/OhzePm1YYV2SLmd9dwEZlB+E/vQyQ4xs+PVzUSdwFUkBaII+34MBXkD2/Yb
         1Sc/V6uQQLghdb2ILCFW8peE/mWnIoo2ETxBQlN8YbxUKIiMO+OIfjdsP613VZaNcTWr
         qXgj9gaCaXHm/sOcMnUyHNsDjxZKBbhrU8euNBV07qqy5niNNVI/DT2//yNhLqaeZJfp
         9LKdRFOTct4vVjor8rnthnjgqO3mbSoPsfG02xKZYUcBG2w+H8MizPV5ElQ/4zy47f1t
         xHAtf9X1W5GVKugZeLcJFBHAF2oBFWQZc3jqcOBeHiNm8N/Eg+nhjBtkGz9yRryxBCVT
         dkew==
X-Forwarded-Encrypted: i=1; AKwUvBwE5LLTYlpM68eCvxPYhmn94zt2vRXYWwO5DhrmrQoENfU7POQy416p61NPGWeydEEYgbH8kuo+a/fbW6s=@vger.kernel.org
X-Gm-Message-State: AFq9FYJuumXoaUvgxSIQXVnE6mxmgpciSQ0KF0rg3ARFWzGlJy4U95nI
	vjGT8zACN+jRPQphHWdCrNyXpfNBoJIoX2qSxDKpGp3OEtG8yEp/8ncntZkRyQ==
X-Gm-Gg: AYBFou1QFN4pNScpAEAPFw3y+hSqUMdfkBQWIl10nnE85bdw/t1TZzi1jDIUS66Huzo
	FYax7a7WDyWUe6wvnQjeLHQlbLbXmOUdgEA7xx0zqFUX5d+JV+ePL6PZJm5TJfQTXibqqjOUtRM
	edpILiYF0RIZCyl5BAJQs4WVHiQA1mW1mbCTOIvlnudgqZQXxCYtu7Jz+TtlymdIAYFLUU6+U42
	qh3kh5QD3/nQGYtRG/WHwYjmAPJa4794uBwHGmCmIP0LImZ1Rkw7XK8y3lttw34GWgS8pv30Y6D
	LpSWDfrVGXlDoDStse1Gewii/01h55Tqi8QUI4gsgTVYeiHEXkl72YzcXtFkHW5XBfiy8ZZvGlx
	Tqmxgm5zhb1cio4YJa5SUhePlXZYklOT1YGW7ruBhiHonWXaofDPLVhljpvwTB017WeBGoU+HfF
	L0RBp2DPlHG/YxKwJMy7s7dChSQi6O95qLnRZKvx/ALxlyRDV07RaAYl5YFyobDRymh7tKHyLDd
	F7qhrOESPRhezO6GDr+5seFFEbz6YLMlEF4+EUn+W0rItb2jAQ2MAUK49s+39T2QNt93yxUm6Wu
	4ewS10SNmFo4nqI7Uq7VMl0v80YnxPcJxpNuKztPD12ayXE4taHdyA7BR9Eo3JblxtQz+fJOZI9
	Nvw==
X-Received: by 2002:ac8:5a54:0:b0:536:35e1:b5 with SMTP id d75a77b69052e-53fc8fac376mr65585691cf.1.1793224647994;
        Wed, 28 Oct 2026 14:57:27 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c6c4e7565sm69904596d6.15.2026.10.28.14.57.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 14:57:27 -0700 (PDT)
Message-ID: <3a7c5852-820b-4991-a14e-c74b8ce76db7@gmail.com>
Date: Wed, 28 Oct 2026 14:57:24 -0700
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
Subject: Re: [PATCH 6.6 000/168] 6.6.161-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20261028165943.089486480@linuxfoundation.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261028165943.089486480@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/28/26 09:58, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.6.161 release.
> There are 168 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 30 Oct 2026 16:59:22 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.6.161-rc1.gz
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
