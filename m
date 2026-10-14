Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1155748F858
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792009989; cv=none; b=iQuHmCph4tIVdxGj3fDkXsFt9sjWxgjBtR6M/r2yVJbvzD2PlfaZJHX37XwKDqlKVjy3FF0DxlB3gZrasNEwbBP1x6meq6GlvIjDSUQdePxUvJmeGebklb72ZpGmwDbLJFvz9+4ZPr/1iQiniSM/NT0Ws4nfkwgIHwt9UPUzY0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792009989; c=relaxed/simple;
	bh=7gVQWNdu44u7syl2CpxBqBL3hioj2qZM5WHUTPtetmY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Isy/LB/1nTHIubnOjSYQ/Mfdw98ltOcAyhUIuyLtxk0reCzAglO9FLnUHwUaLQV25DRSJvIBhIE8ehxJSKr20BlPoF9d53bu4IVrvn+yOhfstmHE2pYY55idJ6akoEMj7gYXLTKLRawHMMtad4aEApde8PO5RCMzhrZRXZcQP6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IILAcWaJ; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IILAcWaJ"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-91b834592afso35067176d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792009987; x=1792614787; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pnlTwXurTKZ2zk8thHhM/pDYxwWJL3S5XvgmwZlUXBA=;
        b=IILAcWaJW09/WrSAXqxs1i8w/bGc3q9RvdzGZ5yGLjKxr1XITcx0tTfyCOe6fLcJnO
         kZBsvOZAyL0OkJntmqyeOdP70Tqy/0IvGEY+vJm1bkhHwssvwgOK4/Ch1j1yVJK2r5yn
         ocW585+7mpfLqfSQpmIaqQxk/mweJb+zSFaL9/gbIirnv5cpztmR3Sn31DTQYSAPtYq4
         YM/1lkmMqMfrGWw3bf46VnabLEuayHbSFn42//WzvbxyQJktzeOp+IBw+cKHOxl2xiy2
         XT7SuC/Z0zbYdh7jqkJ74HA3L+ZTw04o0FzkodZy3jP7dChStuOKsdEEioIxWW84daPW
         JA9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792009987; x=1792614787;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pnlTwXurTKZ2zk8thHhM/pDYxwWJL3S5XvgmwZlUXBA=;
        b=d5OtDinmPa3FMipNW1nEngDf0vJmiATIMeDYn9QvX26HWCFbr4YEJQTt5Z/yMTq1jU
         t+oUWzE5HYg0biIri63pD6eY+QYW3MMo33nDt14RP4Umay0zRgJmacfAE6cWio8EXExj
         54nCJ8YHPam2wUiiPlwCxOSH61GKdPHQWi8MVbZRMC0QbN5eZtu9SBAMf2cl8FN0wdKM
         vAwtVjActiObaaJQNoY037O/abOLw1PDXLL6Tu7YmXwV5FR2F4n44503vGA3rUxX0cZu
         FwsUbu5Tw0rshRV3bSefEK7FPFXSJrb4DnX9KThg2MAAqHRoAXjgMzV33O4uYI2Vod/a
         Yiog==
X-Forwarded-Encrypted: i=1; AKwUvBwz7H7JrA8dJaPxVNf0FZo0waOxdHUe3OSVbN2bsDWSe+li4eTyRZjx6Cpf1M7LgzP9dQmMtOh+uDfMi3g=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5tyKa/kpwSRIM7Zoe5hDKUz0+syCHdVEoA3cYNu8rR6vyV6qj
	zYsoVVf1WRjlGldtGYzGHddz4Pk2ME/ibImXrvMCK8tOynlq0JXC4nhA
X-Gm-Gg: AYBFou01+cJbruTB5LA1Atm0+VgtIYjwSVM3A4Klmvqz2NAsBkVc7ASL+4/8pDYcTXs
	Gp8hY+BbMzfDfNeqjnpC6LXhpiReBUu4bxoPUcflJHJBrlF2vTEEirf2vf7mypvh9zO3JrZwslb
	3RcpiDoaqKNSubQadjgSi/mh/juFZod9CdZzchuPMazTqgHskzBSiL8lA0d71KjrZEjXHOHn6Z6
	sFHLjssfVswcDGSvB/SdorGuJ5CvP5uzEUlSjbnuXFTMjBik4VdTGkSsoVVYa6ZmMK5YHfQR7Tw
	Cq4vhFKhJOdihKm8wgMEJa0Yd8NoX6XreN9fx5Jn6Tz3Z3My3GcCXE5oLIiYIMWho9qNgOncawD
	D3R1qWEwn9JfHkEanlbydRrm7CXKw0pNgxO7YAdh1kRGkrqjJSonx5MJU0pXHs1q0GlOKHgzLz8
	BVLtKsl88SqpTMjIAVqPdtORVIrbhLLhMJecPKvI4VzlW6ns1FruBkjohp5qdiphR2wNmDg18Pu
	s2VSboTyPiu68MAHnCl4lvb
X-Received: by 2002:a05:620a:44c8:b0:939:fde0:a71b with SMTP id af79cd13be357-93ebcd2c13amr2744492885a.0.1792009986696;
        Wed, 14 Oct 2026 13:33:06 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef50095bbsm583476785a.9.2026.10.14.13.33.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 13:33:05 -0700 (PDT)
Message-ID: <5931df06-6048-41fe-a262-575e2079067b@gmail.com>
Date: Wed, 14 Oct 2026 13:33:00 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.12 000/505] 6.12.113-rc2 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20261014123803.944920639@linuxfoundation.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261014123803.944920639@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/14/26 05:50, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.12.113 release.
> There are 505 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 16 Oct 2026 12:37:19 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.12.113-rc2.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.12.y
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
