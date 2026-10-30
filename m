Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793397997;
	b=m35dTsuOUn0mk2GHnnIqySdANYbtQ5F1tU/KT2spYL7M0NwRJhu8obsx3J9/+DC/bU4e
	 AKja5yU/ODR/SyO2PVkAaIiymifVquvBNhjthHk9JauB0hL5SUNdmVa+Ewr3Oi/YQK9RR
	 hqEQEAfbGn+jIUlZoPErTpLp63hy3ib6+kxTnI0146eXZgmiqVhcnZwIPBdJgeIa+sW3D
	 rY/wBNPKaCaIe0+9iWcuX1VBEXKbzbqlXIBnIZpBAAIUfuSdP8VJFQ8/Us9uA/fF4Xy+L
	 8p5LT5thtLOeKErVBeKvpcOVTkyiYCcchrcKXqU2mkph++ZLBclarJ3Ixb6Nb3gYdBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793397997;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=VallrhWYbAQ8j+mRUozNpVRyDn2TOg/EyzhjcGGEMLE=;
	b=Tz9uzgesFnzMPuuchNBQeKhgFm8CSjiWcaJBdxduDYcFqwLKBTUsEbeOs83CTKroa8EV
	 INYHe0xhCbvymC3DsZpuNnKZs1DhWFHOwiOGXOdCRrxT6z9+1c+le5szccJ3S8bjZRcZ+
	 WixEiRfflfU+4s2zDKVdGYwZYB+ET2mpcCRCpG9iHf3+pLG96jVebRdG6iLvYji7qcrM/
	 EcXy9MNvDsR/nJpbD8Db42f1R+0XvHddlEvnIU5dEWtpLVtUynF+JDKs9ibDNfcB+k0ie
	 KrV3n/h8kOIic6Kkjs/IMvl0nAR0amf3QMTV8QSBQEbZCnN/O6bhZjHTyIkXR9DsVug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TgDau+pR;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D500A606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:06:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D500A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TgDau+pR
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33fb4680717so310720eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793397996; x=1794002796; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VallrhWYbAQ8j+mRUozNpVRyDn2TOg/EyzhjcGGEMLE=;
        b=TgDau+pRgokZi6Y5+vOyGN1+QdCqzjrQXUBgII0EQAtWMADF9adtWhTlhN6g3R9A69
         YSdbMak7XkVm0oMPP3C7O++/GxO+3QLRXG3psL+Pgb9GtNjOCjmDnToq2Bg3ZcBkDffg
         b6hBZIpMqZ4F/D9ppplNx3NWTBVraDWB1CVnWRU+8OyKSHUz/Zo7ru+/h96pUecBQHQ8
         oR+pLa0+q3HEK43mCMvyHsyNrxyE6jyUu3Pirdo2zodrgBjHgo3LoYZL64+BvhrkGO4b
         dK6DdagT6/3S/eE1r0IuFp9W2tAwrLHPzPy2JK6WYQAhRmSjd1mSDNFK90int7co5z+9
         FGNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793397996; x=1794002796;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VallrhWYbAQ8j+mRUozNpVRyDn2TOg/EyzhjcGGEMLE=;
        b=HmUGrGxSxSE4DA8Vu7fUOyxqxq+wcgpd9UX00qrNo2jd0jvDi7qdj4vIMYZM7DNZCd
         u6H5xyS0JAxRmCNsv5+PUTQKZddiB+7SwwdINguSYXEfL8k1C3lIsSJheiQBO9B4MtSa
         QaVmdDqI3tiNBmNWi9JfdsfTwHh8/mNV5qQA5WepzvXnGuH78Iyh72oxCaCaplaB2pze
         Pb//zP73rwyiTHHUR155XYAJ/SDmxZMZXA1Bl6sGUh4MrtVPLg4xgipcpNS5NSsBay+v
         EMbuWg3AC/mTtn+BFxvGrxhmZtVWBBjgaXm4/le/QA/3oyBRF54vdPfAzDOnstrdqwGR
         HrGw==
X-Forwarded-Encrypted: i=1; AKwUvBxDxbhDoM3pI3Mj3wG7VRc+/Lyb4qhplVpnE0OV4neTW6Bh1Ey5LVaOGvSk47oYigEsfqP+PndocJRGWm0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIe7oA9cQKy+V5TqS5Ey2brJmRRHXd12CD0AV+nd++AcfMlu486
	VWYsEbPHeZR3TsiYVHepwDJfh5pl3jtpDT4CyofkMWDKjcTBW28DlfpJ
X-Gm-Gg: AYBFou3WUQxjGY7cpicXGq7am7d5D8ZIyRMqSEwBYIzxr+CrTvLGSrj925mhVZtmoqR
	Wu/3IVL5WyZtyLb/zMpZxyDts8pZL8jAgD6xCqX2Hci4UJ3UAsyIstVziTv7taHh+hq7J71kiK5
	vkpXHhhB1/xv6ya7lqrZUu8GpTSW9dLqkk3XpApejR9uUyM+Rpjz8hpY2dZBB04VoyZMg5YcJtu
	b309T+ysqCanXczdiZhtF3cfU4zLXYDulzRCIQ16dKm8AlIT6k8yLEEJ0kuCgKdF5vB3xHH1Wlp
	izLbytJs04nesawYf3MOGPDlCdJZgNWfIdG+WG4GNF7hKG+ohSmTPjvKSVsS+w6VwZ+oi8w3/Jf
	7yIqJauukJcwLEK1whg6WSxRwD1lx3ed60PPR0iHJB908NPPR3qoun0MmOauRwVSXr+hbBYZwei
	b5KwOhiPjB3WtU2AdXdPB2t/d4Xpz9lGhbV+SIKp3StxTF/0MBo/jrKJW77okcVmYTgHjuuc5LD
	SRfhwNkvTaj29zD2y2IxLypIZU7v45wi+yvod2XssCYgy/qn9nbTgTmkxxmNBWLM0PYMYBvVC6h
	dydYCch55dI//AxHsJryf+10CX3XOV3ymVUeJHob/JevCKL8qi+AkxMA76sS/CV7lgTnAM9p1Sm
	6Hg==
X-Received: by 2002:a05:7300:8e:b0:36a:119d:a099 with SMTP id 5a478bee46e88-36a422062f9mr5616341eec.5.1793397995862;
        Fri, 30 Oct 2026 15:06:35 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a429018casm8965957eec.14.2026.10.30.15.06.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 15:06:34 -0700 (PDT)
Message-ID: <547303c0-478a-4ee4-9c9c-281e62ac4a69@gmail.com>
Date: Fri, 30 Oct 2026 15:06:32 -0700
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
Subject: Re: [PATCH 7.2 00/10] 7.2.15-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20261030121255.257615100@linuxfoundation.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261030121255.257615100@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/30/26 05:15, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 7.2.15 release.
> There are 10 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Sun, 01 Nov 2026 12:12:50 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-7.2.15-rc1.gz
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
