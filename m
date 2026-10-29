Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793287202;
	b=arMOngoEO1NnTu14ciSPhjY7RvtseR8MkwzLAhI5N9Iob6guO4x+iF9O5OJ+YWvZV9Ai
	 /lyB+LHVPG1VCdagCTnn99eGS4Vz4Zao/v1o9Z9UTjDSwR7368W8cEysVpT3E+M6sCyv2
	 YtqNizfQH05DTFReKjvM7hBL4u7agwf0eguhtE0/iGmCbqBUARATgzsitil9cXeSvAduK
	 hLJr2oHbr9JiCEQpZ2uz5PYxsPPeV2Seuz9Vj/cZkFtzr1b0/dJGUlfo7wdo/mKjzABGH
	 B9UyDfSq5KmcR3C8zWdzm1iXcLqoLy8LjoSJ+KZg4hbNhqDQG3JTRG+h9D18u2xk8Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793287202;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=x473ufmcJ5W3DLAFHIuNnT5Lpmdr63e0NBlGNs5sk3o=;
	b=rnEoWBcC0VgIROMoAJEr4pOO4hdnMa82fq8ui4Mn9H6Hjpg9VXR4v1lJFWuc15NdZmK4
	 Z/6FCR7RpT5ZGgr0rerHsi7FUlrb/pP0g1gEUuKD/WS0j9sxnErXTUog3YsQ2N3OI8xNL
	 onNfS1919WcT9m8g8tOlZO+tOhpK9Nw1nwNNz8L5ysEb0qUA8VuQzO/Nf+fQ6+B4WDxFa
	 bMAOFgKsL0FvrvwgU4sXqEt82eN6egbuGG5ocMCmGJ2/7Gpuvyi9OWtRe8Dm/zzcG0BA/
	 aI+IAQmWj3+Ej/ZshMbE2zTeZnC5Y1K3fefMGcRQJPbUV7elTTiFECGhbvCULKAHqlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=dMbfqC92;
	arc=none smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CDD606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:20:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77CDD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=dMbfqC92
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6deb848ddd7so1730928eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1793287199; x=1793891999; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x473ufmcJ5W3DLAFHIuNnT5Lpmdr63e0NBlGNs5sk3o=;
        b=dMbfqC92YyXt2EJ6qqq0TeQI8ZcYJlvA+L4HQAfALpXt1DoG/dV4NajcMHZzAVNyNF
         tHvT3fbft+VzXRNllk1ys4eBCzRkDEoQATRbvjimQuyLpmAM6nUR+OnPZ4gPTvGlOMGu
         PrTiS8M1ccbzeZb/RmtdKVELL8JeIG1GVcmtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793287199; x=1793891999;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x473ufmcJ5W3DLAFHIuNnT5Lpmdr63e0NBlGNs5sk3o=;
        b=HNo+6P0zofVn2menIizjtoax7w5KpFbKpam2j4oBHOPMX/zk6k5NAtEeZmVkvTL/nL
         Q7iJlGLzv3ziXj45aRcGp8mUZmLL4NsjywI8Pa1VClUTMO2UQjPUgoHxLAE2k78hGLs9
         r9KaC2AjAYEx14xESDNXHCKpMShDUI71TFQODYTPLVvGP7u81EQlu/E3HDgsc8AeDsId
         HhYb2OiI3KFxbzppXRyPhaqpYqzLknpZb37dXm7Obpnyqmd+4GRB1GGaAJrmimYEc1T6
         FDvm9mVhhAQnDUO6iM7EuNSVWu7ZK/Nb0WXq8oFWTr4NdvFUn2DdkffwaZheY9qqpE2m
         XsYw==
X-Forwarded-Encrypted: i=1; AKwUvBzxKQi8H57iglmd/wl5wZeJILDV8xMBz5Y2yINaxgsTz2Cn6jfBsRik21ezAN8zP1Ic+w9zpupkrsplOpc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVtNyEyxF5P2SB7/3ssXB9Wn6HLPSOC+A3CQseBbH4XxOQJfTj
	hsyPZCkh671O5yRxy52DKVAfx2O3kDmqqORc+hR8PylSLojbE5NPVSGqVnHbvf8IHyA=
X-Gm-Gg: AYBFou2/rYd7Yfm/PTgJivRySyckSzn+t3tjriEBfZKlylzRvBRRWMq52GoN+lA6StJ
	9W8ox56/M+Gj08mc14V1nosA4OAcqmkpBz5judoNVyUOP11Jk4n7vLc5bDDkXdGprr4/h2j30zy
	c/vy8bcqZFm4JaGblKy5NggZOM8ACLMKKDcj0Bgl0RILQUmnvr/VC3RDFSlPrdF5GrqdyhDsN+D
	/Ij1OFODcQJSRIJ57hQVBargw47V4CSuFo7bRm6ymtXGuHZwDumxARb51m23S0Z3p1695sM2iim
	gB6IpfgQfWb91IDwvAof/1kZmsbwpsJ0IA461Gvb6fH8dipYcZzTPtaHAhotEVcxgz9hAg1r3lT
	4P4LcgSUVMdAMEkjJUByFyElYEsYjPiL3GHTLM0FgYEPt/uyVAto2/bhckM8I02VEVj2uZcFVy3
	NYkdHRj+BiD6g7s0PuMMUPyGVH4kG5nF3V8ZHbfVA9fEv1DwmJUehAlh+/3GzKA7v9zh8MXBocy
	IpFrIhPQZ6s+CYFeaTQd7rZBy3TP6Qxl5QFjlxutfuV/GdPFAuzuE3gOWLbuxv92Y5SPvEBNYy9
	wREQY0Se2NX3UkStjIQZFOAWDDBkOe5pPiM8Qw==
X-Received: by 2002:a05:6820:1c96:b0:6de:d2c1:e95d with SMTP id 006d021491bc7-713f01f0633mr3625060eaf.72.1793287199393;
        Thu, 29 Oct 2026 08:19:59 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a8b793fe7csm4994076fac.15.2026.10.29.08.19.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 08:19:58 -0700 (PDT)
Message-ID: <d6d7f806-c771-4b8b-aeb5-c3e1308780f8@linuxfoundation.org>
Date: Thu, 29 Oct 2026 09:19:55 -0600
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
Subject: Re: [PATCH 7.2 00/88] 7.2.14-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261028165942.107695352@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261028165942.107695352@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/28/26 10:59, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 7.2.14 release.
> There are 88 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 30 Oct 2026 16:59:22 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-7.2.14-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-7.2.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h
> 

Compiled and booted on my test system. No dmesg regressions.

Tested-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
