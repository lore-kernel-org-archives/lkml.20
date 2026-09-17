Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB32A4FE2D5
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 17:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789667317; cv=none; b=hagNTSpPwKacqxAIc+lxc3Q6PW32R/wsUqFzgx2ni+hKWkDOTh9uOz1Y0fKQohoR9jM+FEL+bKmUB4HvlPYXsTDBe9qVTxiujylNBQ49qkIp/3YDEu7CM9gDMdts0yqzb/4tThMIxDfQbKNL5XkaR5oJDH1zFB9/HgidmK++a2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789667317; c=relaxed/simple;
	bh=tG+fI11akea3wSt6NDDMVs1aLWaYurwM1JJh6xLITCY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RPItC2jsDEb9qvIIw8qv6RT46BAIAyzbfjPkXmOsV2m42+JN12iDQhfyD8hbXepWwbJHuww9e+/E+3YgxpXobCT1ecqbJRPJunBEZ09n/2oNbIYRR6WV9/7W+gsNoJAX6mW8W5GAMOcGXwYKLFnrfTjeS/0WISQWJwCz+l6i6kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P9iZImR6; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P9iZImR6"
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc5256c2a4bso538597a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 10:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789667315; x=1790272115; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+WJglaSlo/017XuHFl5nKEZgkW9Nb7XN1yne3AQp+sI=;
        b=P9iZImR6XdsBbAa5VZvsJAQcpyTa8BDdjhaifHnNq0lzZAC0sgMNYBCQeMeFdYbaw+
         ywgqaM7uuEa1938pKEF0XsxtzinhQlk9pDjdElpnACz9A5Dsf5z6R7q8Eklv68b52UAf
         Nz7F7sQtS+G9FeJl+HZXt3f0tybAT/dHP4XLYdEG2tZ8Avvrn205LoEGjAdX3L85eN06
         x5hNBUwvdsJ6QRaFd2rLarS3aTaHlwAwxWVPu2uiwhHBAW249DpnkC0MEABs8DjxJ7Yo
         g6c7F1YG9GLz0L/0IzVAhpuQSlogV+QQwD+JXASiwHY9LtFYM2JBotRo3HIAFLOE2XNn
         DudA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789667315; x=1790272115;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+WJglaSlo/017XuHFl5nKEZgkW9Nb7XN1yne3AQp+sI=;
        b=qAoUxX6Riqe4sl3dgnwWEGodzj25z8lP6HQchYya0PigcnbUhsJreSCz3qrBK2mtdP
         QWM6ANMAB2AUgkK9JaPbGwGlJYlQT6R8O6rKVLzn1BvvkaN04JhPc0xet10S8Liydlg1
         kFsq4XuVDSoBgQAxU039UR+mS8azhzbeTKkVD2NBXkz3vNXgsupF/vB8v+vAwIl7MkBo
         rO+uGP84Y4QP3kzmTR2nALGTU9b0gJ806t0lHDiYxark5ZIpEqNfUoOvVNMBmGSyK7j6
         r4krm+RT9SjsgYWfkwJNVTDL/fwj7iCpxWEzSfe+ndVUpqXrLZhJRICb0/CVaasodEJ/
         DRXw==
X-Forwarded-Encrypted: i=1; AKwUvBx5MNwomHd6II3QQrQ7lRFmHrm757ClMjKKFcUenSbNtJk6J7/t8vysBXX+Rr84BTrrE7BD39dh67zLs5Q=@vger.kernel.org
X-Gm-Message-State: AFuF++lwH4o8D37SKBhyKcy8e7Xw5ljkcvRsq7acT9E1pYrI43yjtNTu
	8nm4wV5/nfJZXgdCxg2A/wftGW4iYxJEzBo1mU8cR8ashOWyUPtbJDvS
X-Gm-Gg: AYBFou10BkJ4N259meSINlsuIMqOs2NWnflL1haSRin/TJp+aa2oWWnNUHTCcHvsglv
	D1eHG/I8ldwpf80rLNlsfUigehgb8TAP7/OZlVa9D/K63Q++udkQgR8UbiIomrvhh6xg2PRuk/Z
	ZBrzGDnOuLv7oWFShbP9wQNSZv5FzMoDb5dF55lwy8sykz4eE9ftfdn2Wlu9sdHIPMNA9GHOAPb
	ulII6YzffLebs0tm2HGJiZ/ib3rBSVR3X8eI/1nJ95iPdkWitKBAB2J4J8tQ8FYxP1MTHoeKTEU
	qr+LHmSVek6Z3ma5C7jKBvjsiTCQbAZi8TvJmOy6KT/mukV1vIOaELo/Zq9GKp9vMvsbXAya4D5
	uUVE8uEWpl6wLdYLjw1WDmPg3Nvwkxk9WxS0Hzs8/yzWt3sluTStpgXycvrQOqygcn4f/olF8VS
	93DRkWoBs1ykmQ120CcHsTFgS8Ze1czB94+ED/ZmQRA9UF4aRl6Mocg6UKEULNCRsYK3g2Hfskm
	45jxi25qWeiq9ifVqUmNpysqg==
X-Received: by 2002:a17:90b:5383:b0:39e:4c80:f682 with SMTP id 98e67ed59e1d1-39e4c80f749mr2185907a91.33.1789667315218;
        Thu, 17 Sep 2026 10:48:35 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e52d5bac3sm129238a91.2.2026.09.17.10.48.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 10:48:33 -0700 (PDT)
Message-ID: <6145337f-5350-489f-a5da-84cd1079ac78@gmail.com>
Date: Thu, 17 Sep 2026 10:48:29 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.18 0000/1250] 6.18.53-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20260917151551.901433442@linuxfoundation.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20260917151551.901433442@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/17/26 07:56, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.18.53 release.
> There are 1250 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Sat, 19 Sep 2026 15:13:46 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.18.53-rc1.gz
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
