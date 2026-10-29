Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793291363;
	b=2F8bn9nGk5h9yBzn5VMIkFdQYY6Ng7bycyZCPiH1Gg7iiCwBo9+cGjQwikifB4XjgfYd
	 27QNyWMiG6GDK5vJdm6/triuYIM53DWG/n3hoyxVYfrFeenE7xA1agI7bzW+U/Y59Mj7o
	 DP8lGe3xzKrtayUgTVLx3vZENwY4SqSSskK0FSWQKtD2PHKpP5oWG+iCS7s0X5k+/qFoz
	 m7rKnTy2Czsj80GIlW3F10sN7vg6mR+A6Ws5zcSA64cCsVV8utXG//rTE6bD1X8rlOztp
	 vmumr53RHyMqS6udngQZlggTFtkEF53gYjDSzjC+vJKiDCpTgFeeXSwj3q4sSaR/h4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793291363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=HO+j6ign2yj4NoqgE38MT77slEhL72UAiKeSfh5MQb8=;
	b=ppTfV46dWuSwU2iZXks3oN39AcKUgVqC+oKavoC0RLsmp21F6nLb3+xl/KONNKGZ7wwZ
	 ZAV2hBoPWRleoxN4VKXZpWbDhyN+mg/iIV3i0hUXbMh/V3NNA37XMAdk+9/w0ojz2fil4
	 IfJggLI0vWBVBJUm65k4KUAEp2NPAliHQfIWk2GGyFWWqR8ABwof/dl3yGZv9eRbHugzj
	 jr3K+Ia1b/CpXQuLI7eoDyyW8qnrws8GGOnse1BXvUmevs7Qp6+iADQvuB7uqT0/yw54l
	 dbFYmg5cmHY6To8Au0l/g34OAU2nkR1MB5SKkG4YOA2BPY6iqAv50Cbqfg8LGSyqtGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rSahb8w6;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8683606A323
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:29:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8683606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rSahb8w6
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8a05b210703so1244055b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793291362; x=1793896162; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HO+j6ign2yj4NoqgE38MT77slEhL72UAiKeSfh5MQb8=;
        b=rSahb8w6dMZA/vBGQ+1QSwH466DAUvGXEojg+saw4FZp5AolDh3+WEm/WEpq/8NNPI
         VAv0Kw6epULXELT9Mshcu8bL8Kc1BFidz/9N63sweSxCDLxzyEBMI9EmlocYQcRhMd0G
         rf4373BUKFG9/X02Ddz2soK40FsjSFaRXfxP68MSgLWKoNwI8hmZQWCGsSsd++opETRS
         +Y1ilGMkpn4o5b9k+CVwrx5KeSuh/JUjD+56pAJgDlKua1xGqth08yTmGzsKeWT0HzD9
         RTncmYs+CuX8lT+tf4xIYetLZQyMt5SypbrXCsNYRF3u4OTZyy0yh4y1qZ/cY5FFh6MM
         tVjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793291362; x=1793896162;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HO+j6ign2yj4NoqgE38MT77slEhL72UAiKeSfh5MQb8=;
        b=MVsrUS1Ek8RagjLWuwQbt2xZUl8sKqvick41RXGO3g+tngpO938lTM4UC/v5mbRhQZ
         zKLFKU7/XJ8bJNGdpnlTe/J1jn9LU6p/KW59XT8hvX2YiSf9GQAopknVke3LMYo2+jls
         UTq2vIYjJP1HHNl0VRzEJzH47q8fQl+zS6O5xMzQ0hQcHw+NW2vWhlfh3DXHyiFtWwAX
         w3aS0VanCIcN+uNzSSMUXxgnuqVNd2na6OqVZzY8juUofeNRiBJHVDNuH1b7UnqYbHor
         8bFxAtPB2qE1IFUJF1hUc2lHXktj6GJnKuUp+pOHIUHpTwjga1Yk5CUqvPy2lw048Azd
         WUaw==
X-Forwarded-Encrypted: i=1; AKwUvBxsuHdUyLjWtbi6P2tB9qRF74ZjJ8+9VymwbhBuAPQcoWPtqAgELy364M4xWvWeOZV06CYN5ZKhb+wU470=@vger.kernel.org
X-Gm-Message-State: AFq9FYIne2u7WV5SA19pXzo9QCiJUlY70OsO8DwmS23hkT4O6wKzjpqW
	h7v3uuvK9qOv3rR9TZ0L0bZgkIK0AktQQvDebApJUnawf7YvjVLk2h/Q
X-Gm-Gg: AYBFou0sl0Y5U4QiaqhsIhLHdtbMGm/i9v6/jf/KMDgTNLCkTu1mkFYSWE9HROML6BC
	2i2bldBZzoXMGaH0YuULKfjVdY8VB36RpyYygdlLJnIEsNkcjcOkRj5JZm1drhzFGvfeOXIpAfl
	/2+h3z78JppdcapSTKIkvRo/lgdOaUpubNGFkpCkRDzvidQ2DOUsC4kzd9gyKLWYE2STl3aLKBj
	IEQ0pdQNPLkJkHIHJqZfNqpjAsIkJRL0I/OuV8oPOYI/tlNENXYLnomj7rsGTKSN9xCarafmv9R
	5VZ2QiAW/UTXvmqwEGzZunWN/9UXM3BHzYe3Erzm0TJlzWLb3EK7OeaZEvRqllOlZsmI9psHlrS
	yLie8p5UqSm+niE7msazqYgJTnPhOPUtltnK+Youx6Cpvkw9XHLAcS4XkBct+9JckKJcW7I88ac
	59amtIV5Z934h+On2vL6iXZ3thSaVAzfvowvClQgzP7HrK00KOlF+7MZirzblS9qC2GsoM9kDwX
	SHGnzrLbre+YeAGahE4mlt/6fLlU0IVKzFWCFsJjLNcpSGL+75VYzpurgbtAzvBAWJI9uv3M6ar
	XF1MIGavFhLQqUxzr+40R3IUl7eq+mA2WIMGP5mHGzymRO19zlUA+Ag7
X-Received: by 2002:a05:6a21:4c0f:b0:3e2:76f0:ac27 with SMTP id adf61e73a8af0-3e902325a74mr5014369637.40.1793291362131;
        Thu, 29 Oct 2026 09:29:22 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a989adecadsm114437b3a.41.2026.10.29.09.29.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 09:29:21 -0700 (PDT)
Message-ID: <56e68cda-6c37-4d4f-b3fd-725cf432feff@gmail.com>
Date: Thu, 29 Oct 2026 09:29:18 -0700
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
Subject: Re: [PATCH 6.18 000/109] 6.18.60-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20261028165942.357251485@linuxfoundation.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261028165942.357251485@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/28/26 09:59, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.18.60 release.
> There are 109 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 30 Oct 2026 16:59:22 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.18.60-rc1.gz
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
