Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792436597;
	b=N6TXe2SxU9Z7usI1tr+blXZjNEnEH5VcSDxnu94KnPyVWXRqRe7r7p7V5fZlTYXhPAA6
	 34MnztdFOfGrDmMfrb8mo1svgakvHWMKat46Gj+84nWu0i5oEUnbdwuOLca0cVYE975ka
	 sE9Im5w745Gtz9V+45+vJD/15nWTGEqB5GsucyP3ULTQW5vW637lC9dILOcQ+ep+iwt9m
	 pmbJ+tLHueccc63ZN8sV80RMrVTHw1dJeNr2Z5twSQCU7kmXTeBvCb1RWTUZF9ScIE8YG
	 pfGLBvCfSy7hrt2FHW3ojWnRtLVRilNI1CaSzQp9Hjg9hlwseIeNT6COBLjwLd6XNiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792436597;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=zwQ9u0fSM+DQnMR6u0nh+yQlIZlqj4FNm9oRCXT8s+I=;
	b=BrRli6Nlf3F9SO8+Y1ehssftprlRaAcvZIkaSoATZmvDkEavCZRnyu3Mi9B42chirrtB
	 shLi2Ho4wFgSxTP5tdEpRfa3hRzSMv+Ad/itXA0qU7xhophmqxccg4O01BB+qc1zRsyug
	 E3x0Z7h39lVVmh21myYlDsx8icIDC0pRhJzQRvocNpgoJRcs8WOXcz54ONhXi+iDv51Im
	 X4g1DIFU0f+PXQLGcVVYrsxiDvr+2+kNzG1mVKgg365S8QaOyF/rpUDYvmkQ5GuTQ/VFX
	 vMEyD/L5qp2xLiiEhKb7JGgepRLNXcqcih947Je4u9pf/LNJAiuw5ClEiR5d3eJneFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="SURF/8Cg";
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD21606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:03:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAD21606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SURF/8Cg
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cd5d2dafeccso816611a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792436596; x=1793041396; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zwQ9u0fSM+DQnMR6u0nh+yQlIZlqj4FNm9oRCXT8s+I=;
        b=SURF/8CgkNjhyggV1vHabzT5HCG8ZPYK4de42JYHtxtERqLWnOX+pXGLoUfiAIxSSc
         S4JGVUD7+0/WDoDkfY8w1rq57FcNu2x/+j44W0cN0hHUxvbPhCMWWLb11zoilEk9zo/s
         wgPvAzot/FKY8Rn5aIDnzysZwn87EYY+FFyVVnKptN0T9sAPyZ1+ecZ9LDfrew3SG2DA
         ktmylYFID9huR3u31lvT/XRwL22/uUsANtJAAocgCMbqDPF1IgKxW1HuifEPGhf6Tb3Y
         XFuyP2MmOJomLbxD1yBhA4ENzW2HOVcoZCMvLRUSRz5SMzPJ1uohNaleLP+vRDv8eEi2
         daCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792436596; x=1793041396;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zwQ9u0fSM+DQnMR6u0nh+yQlIZlqj4FNm9oRCXT8s+I=;
        b=14Roow3kzvr4ovUS+reh1D+F0jsQxTt+8kAwWKo7jAQnuWpNKnlZoTmthxa9SawFTw
         KxeS0hn1S7yNqaN58BsdWuRZnUjxBgzILjHDMC2IJQw1NBdP/a67u3iQkD7zUE613uMg
         rxUHQKLfjAkFTVEoyXQ3oa4o020c/BCCW/Yf0lEww2A7AalZL2lU/lakuCMQhnsisdu/
         jjyMP+oifpKMTN5No/GlbNU4nexmuIu0XkoYsyGiOTAqQjKPJgTrYqf/tQ1T0FQ35+I/
         3N2cXKiwL0faTrkO1sMqGLk53ZHN345WnxrEa/slep4aFtLbL/zG8SuvXv7RXaZPKJLi
         iLbQ==
X-Forwarded-Encrypted: i=1; AKwUvBwHHzVMvAYEdw9FCqpXb5h0+h8n2MyVcKMZiyGjnVXwHxdQ9CTlUrCtVKPLb/MkRmeMty8H6ljn3s5Pr1k=@vger.kernel.org
X-Gm-Message-State: AFq9FYITJ7/mf/UfIUGORYNqCuRZfx2BQHMXfDt9ULWdkV6kF2+LWVgC
	Wov1yVzSOhin7K2VQPcQ/K+vmaz/m67FJRhvNfTwqICFOSOzV3gd0/FJ
X-Gm-Gg: AYBFou1ytKF1EJbjK4aeS8F3df+b1PwvXM3+BvMfaLhnWQ0AkJTOoTlAOy/T1qOvUNL
	FC9CCIGnVbB8KNU7uVJNzl9OYtjmLLILM3Jew5LO+Nup8BKIQy1B+GhpiEWXJAj5rxOxvr8pKPe
	d8BX302GrGCXjjW2eFoWroLV2IpcBGp1xZMbTuSW7yXhAOqHZo5ZRrLGoJsoT0jI7WeGLf1vilj
	V21dZiUSCkwsEXjMIT7CkayOXHFVzcRe8sCkhZDndRvf/3B8dcohex5fseUerBlaUUR0edPp5Dt
	HylPtFw27kp/iG6YRZo8ZWg8mAk1zc9gyNIEO+tG4cjB03IIVk5vIyKcn+Mv0R2UTmzxsr6wgKp
	uUXtcioQtkoz+tt8p1ANlNnaNKuo3AaX1ju2TfpQHheCxHR5KQpQlroY7lThjuQ7g8PXmiTc7WS
	5XsTAyQah/3uNGmShZfAHgJO5LvaDgahA8gcvH8SkhKipHt3Gt6H0DzrCZV8bG24wxxjwJH47Hj
	1uOWot8OXWKoarHaQdSvThH
X-Received: by 2002:a05:6a21:498f:10b0:3e2:678a:b521 with SMTP id adf61e73a8af0-3e2678ab8f5mr535254637.71.1792436595996;
        Mon, 19 Oct 2026 12:03:15 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549c7034sm4220834a12.16.2026.10.19.12.03.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 12:03:15 -0700 (PDT)
Message-ID: <5fbcd61c-a997-471f-8a63-9f70f323bcdf@gmail.com>
Date: Mon, 19 Oct 2026 12:03:07 -0700
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
Subject: Re: [PATCH 7.2 00/10] 7.2.12-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20261017155059.698368299@linuxfoundation.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261017155059.698368299@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/17/26 08:54, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 7.2.12 release.
> There are 10 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Mon, 19 Oct 2026 15:50:51 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-7.2.12-rc1.gz
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
