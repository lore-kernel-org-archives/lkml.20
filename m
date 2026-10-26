Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793039926;
	b=IPmRvuSpiorPKiYw1nJm9T3UIGMZsOM/4NeiCJQb4OW/e+vF5w/XiVZTBZj9sR2mkEw7
	 E3gyZZ/E7hA5wnFzQicWl0Xb0skGX91GRAuCeZGNqMuni5PEWWLAC60Obk+JW6aQA3Rk7
	 qzW3MKhHzYtpvnJ43JWpYT/xKHUBT0rWH1cpNpueyArmmCiYHeoTRwtQNbCpXPgvvm9kM
	 66sb638da+AApayo957FSYoLWDrqkKXPJRLT0XyMS0mrNxH0yqr0Js3DUt3P5eHdTLImr
	 9X89ne56gfPmLouc2iAYJeT6SPpnWzmOfDJle6d0RYrK7S1RC4Ir25NiXCfRnYKPfDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793039926;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=qtkfCa1ACFlx/Umc0D+/jZFN6SiMdUN5vaZm0FGpPXQ=;
	b=d22AA0bKHU2Ga8J5SrgtBopFFxCB65TC49gbNswODLUfAjUhMO4A9XT2ADZXmedEZ8Is
	 EAbm45/MsXP/28pOu/85b6F+tq+6Ys+Za/Ibgc50GO7CyqwYeAGri2zx4v+f4/opQ8sbl
	 O8yXHO1ly48/PvNWhFWdI7pnlu/sKw713eHaB650En4+24PDYaYCqEMJHIF/0hjOAfKtX
	 2HfOsxCIVLhZ9+dVag243M0JMt4Kwg9l3xc7wzG5Niok47XkI/mac2TpVPiInc3ZPeQl6
	 6KFeBLa9S0pCMsoJ42o7vfLqcABsGOa79VeauDBHRbfbK5g/+oG5koV2T/WY2OVotsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=gbqFxgya;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D37606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:38:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33D37606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=gbqFxgya
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-8241a56cd70so2160351a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1793039924; x=1793644724; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qtkfCa1ACFlx/Umc0D+/jZFN6SiMdUN5vaZm0FGpPXQ=;
        b=gbqFxgyaSJpwnPMXEHEl8DRMN0FH5f+eZmyf7f2x5yINhWDC0h+TI9fLbmGVXrriTb
         IVX2UKfZbpWhTHtZSiooDsuNCBRCnMLM30hT6S3h50adSBK7Pw2Deh6iFyu8CBclN/z4
         9C4rCb+Un3r64IpzDxakAemSIEHFSiRml0wqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793039924; x=1793644724;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qtkfCa1ACFlx/Umc0D+/jZFN6SiMdUN5vaZm0FGpPXQ=;
        b=mPF+tBnZWIUed9+DlA+UoHujdHSEU14v749xQUUe4WonZRWQnFJ0H7dd6z++PrPPVp
         BcwnWhLDyAuxBIGQeAMw9rxCQjMBGEleicBObX01cNBgXtihH73hSUTz73yGJ1OqPNYr
         shO6+AE8qAkosXCczzUovq8mC8fsjg32P1NFBhkP4c7ARtV8pgslpSCnumVbeQHEORZe
         sdTM41SykPLkFo63iXq6p4YkQO1z+ghZjfPEbc6NGbQaC3pxHmy4JSLByDbH2HGpt6po
         s9xsqJKk7F6xI2u8XG2VEA8SxIAGRtfCX3t+UIs6TCy4IVmsxFAD3HAd7Oj5JMd5DZAB
         iU3Q==
X-Forwarded-Encrypted: i=1; AKwUvBxVOTXp4cPejHFCu3PVbRZKCelE7HV5CKnFFGI//knUjmT6QUfmGVtoTjyBYlLCFpkmtE65jSuHxvUHQnY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFfHPZAlWs/NPI+ap6a8GrBrj2X50UDwiUp5/a8EK+vD6udtsQ
	v4lY1lxTHs+j63l5bplPj7nDygYWxw3FxxmF2yUhfDwg//mK03vTCRBIKK7KgkKyxVQ=
X-Gm-Gg: AYBFou29Y8LpCw48EqNR+i61nSrd2P+O1ykcwdHh1v7TAIPzuvSdbfvAhGrSNRkaUEd
	tD+iTnHDw50mLB2Hc336iJB66j7u/txJQUxpd8Tgk/o38qPRIyG6orYW1rSpPWI9p0Q+4xveJPu
	9NT1zdsaEQfQLUUYDGyo26ygBglTwBR6QPCOmXsDic13XzwxxLJgVukVtLkmvpbFELlc+wHS9N8
	vDXExw5nH2Dt0H9JAIP7FMJmZk8Ko8DMGTBLSVUTlMkmqrA99YZu5wbG9k9E8ZpXJ9kFxR/h1L6
	jn/sKwcdfjTjqeyD/2Gfm25QmLPYT9Uf1oWa+JfoQRCuSC/crI9DF5q1K05lD2ih80HgkxqM36K
	setpynyIvnFqnFA3gWg8suiuCnYAmC7kFmyMR3+G1JMzZe2KZvY5UfxaTnGQuhox91lPVK5f4Y7
	iKuU0Vy77/g3tvMJ+czbAlvK8TGCGhhuuYsoVtZwjqOIF+GbusRSDLPTcb9zKpPiUSsj0wxRjGl
	EMaVoCKA7bM9GfczpGxDyDMDIGQl1aINof5pVmRe1hxZAezLPodKzdn3CnP5avUVR4=
X-Received: by 2002:a05:6830:2b11:b0:834:b015:aed2 with SMTP id 46e09a7af769-850fda467b9mr5329495a34.6.1793039924057;
        Mon, 26 Oct 2026 11:38:44 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fa99bd35sm8395712a34.8.2026.10.26.11.38.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 11:38:43 -0700 (PDT)
Message-ID: <a072b675-62ef-4076-b3fe-7a344516e992@linuxfoundation.org>
Date: Mon, 26 Oct 2026 12:38:38 -0600
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
Subject: Re: [PATCH 7.2 000/231] 7.2.13-rc3 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261025125805.309934791@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261025125805.309934791@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/25/26 06:58, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 7.2.13 release.
> There are 231 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Tue, 27 Oct 2026 12:57:40 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-7.2.13-rc3.gz
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
