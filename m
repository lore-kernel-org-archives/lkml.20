Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F377B485920
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 21:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792012713; cv=none; b=QRDo/TyEGp6TJhWz/zEAwm3rOJYq3k1TzMMOn14qe2ZwUlPfw2PnoOK4AzUxcbS0214nUD3VDJsoVvZUlbxFgw0FU+t3wbTzIRtYZjVcEJYWV0rx3c3PewasrgluhRMFJyIBhQrHGzveWuAyjDWDpDC2O6AsXVWv5C7UCNQRfOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792012713; c=relaxed/simple;
	bh=Y0DvBWI+BZCsUB8TIe1s5HesTMuUsn2dMO58K2fiaZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dfnFhDuwQYMZAu/Yon6RsgdlipikgwSonfbz8kPZH+/geWTxzcoxQd/9XmlNFl0UAt1gb5VvHqjMkIjl8dNLVvs3elxAvZcem8kf+CX2e2eDWFYQ3IzUvVAJu+9vpHvpdM93FxZQ82MVEwxUh7kbw6oeXcuwe19nMKbzGbw4op8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b/+LZHC0; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b/+LZHC0"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93e706a6ba9so588432485a.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792012711; x=1792617511; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZQvRlCYoMMgwjA+XyVsNGaS2zRGK6+FIJmhvRdNh+DU=;
        b=b/+LZHC0andF8UMOaAYZITI6ULxKECm3d0ncnJY0PsMLG5bjYzAj4z0gEP7t0Qz+kz
         FXIpjN6k5hiKbAiR1zT+zkRLQL9yFQRsz6y6Z6lifdWy2EMCA7P7nlD18xkuWMW5lf7y
         PnCts1jCvB0FDIwisiYjWDCmTN7Kvj283Xw8WR4mhYJ48B7fcR5XC+nTUlxCPYAMN+wB
         MNXdFs7SQvQVz3OQxNl2c4yZBm5FPJ4gYvhZcy3XR3vukMTcezeUAgpy6UpzNE6OJWU7
         JeVA8hwk1SyyyANxd2rC/9O5vc3nhnZtbobimBmX/Yk0Ma96Bp3qU838Q+opEjq36PDH
         /N2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792012711; x=1792617511;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZQvRlCYoMMgwjA+XyVsNGaS2zRGK6+FIJmhvRdNh+DU=;
        b=DXwkDAWiqdGnR1H56NBzFuiQKizALTW3x4qJdBtIUssBxgglmhUggWdgDCwGxZcnzW
         UJZwidWvKevmpEaYPC9OIGHs2pIeZJjArjKhh2RgSFMl4qpcvpi45fYp57N+XD9RpgRb
         l91tV1idTsc5LjCA4AmHTRI1aNHJxluiZa1S+Gw+AzecO9W3Ew4kvpsoIHJuKp0AJN3N
         PwvmaA5LwgurThXwWIiHpyTC7WsDJ/m/a08cPYbFrrqIz/DVzqqnlP9l2x+bfRK3NoA+
         UiNPGK1YPF80QLkqEajs4Votf9edc6lRwIgz++NT6bK11/XMUzSrqm0K7Ow1tRzy9MHE
         g/uQ==
X-Forwarded-Encrypted: i=1; AKwUvByfGhDggFoE+qiAQS7Tmwaa/PHaJz2ApzI2l/fWMlYVPGCODXDhQqHBbWNVKm04tTymM6zkeIWH2LOnQBQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOFFbCbchNszVaTaqOK4jN/Dq4yk5hnBx4QLngWvi4YKq3LwEm
	f3DfH69pntBwKjAQ2FhcYNAWU45nJ5hR5JDrRS9M2R2aAORXRCiG5If66Q9zWQ==
X-Gm-Gg: AYBFou0tKK77UroQAo7P2IVHXfcRQYmD9vvtiOWjttd//5tGGCkaB64WZviuHOTGlVo
	PUZNYUsVxw6OuvDyuEywnewZSydPnW+I01d8i7Uxbl65YADNNyeYsHd2telLHKnFF5jHACEtF29
	QNS43Qv0M0Yse284W3YTI4A6njtaxq02VrYo401F+WJUrwoa3u1nN/7V8IWczIUYHPrmPwpzicL
	B4FKYDFb5Kvr1ucWU+oVv/pY7M/MQDMf6mTEPiyEGnPJ/hu2sAAMjrvw2KVwKz8ymvXM/I4FTuT
	W1Ss3cv9lsQO5+l+1XMTz/02KDSNvkRWC7G9lMQWbdCjSUORq/pEtc5IpLX/4+16pHQIAmnZiPw
	6gINOlvDOiBWN20eGEDVpuQeF3as7ZcaE3zbCFu8aP1y6CzJuKvV5x2LnR8Le1SJSfW0z7zvXHb
	5eKGB3IJ8utd32uG4SHffOtwxW5LpyzTr0LD7dXuaNGCNrAbxM1QJpbZvE9nRNlVowFN4AaYvyM
	jj8D4nUv9xPxCt48TKGNpLp
X-Received: by 2002:a05:620a:4552:b0:93e:5821:2c57 with SMTP id af79cd13be357-93ebd2244d7mr3063691685a.22.1792012710742;
        Wed, 14 Oct 2026 14:18:30 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef5051c4csm601360685a.29.2026.10.14.14.18.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 14:18:30 -0700 (PDT)
Message-ID: <14d347be-4ac3-45e4-9b5f-9df2fedcf6dd@gmail.com>
Date: Wed, 14 Oct 2026 14:18:26 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.18 000/632] 6.18.57-rc2 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20261014123820.008483134@linuxfoundation.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261014123820.008483134@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/14/26 05:50, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.18.57 release.
> There are 632 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 16 Oct 2026 12:37:22 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.18.57-rc2.gz
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
