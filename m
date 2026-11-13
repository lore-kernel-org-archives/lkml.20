Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794597772;
	b=jPlhTrKM3YTivLimXJ4OEYroeeZBe7j0Yp+VymSUeQuOs4Ko/ik9nkX0cxWKK08BEBU1
	 OpzmYBbcaEkhkL03HQfyberYM2yasgw+ceeEX3/9kwUJO21hO1JJ0xGasOA7NgS3JkOdw
	 lPEl4P0jGA5ksvW1m6L7krG6OR+VwC7GjGKweT3BZt9qrvuPsqIwvDJfU85U4rA7Y1qNN
	 jJv4iGpSpGINtAQkt4vV3JOd8SY/MedqbLpxR/R/rHe9d0S/hFQ+rZ81SYBZ6pO348uXL
	 +L/ywvyklDPFv0acKYTOjF1snGQX+Xpbn3VVK9FGjFtGLbUouwc4yxVxcVdzyDmAoyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794597772;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=hG1EB293hxr3Jgg2QdT4ZHxs80rfcC0WBpvazP602rI=;
	b=rLb87eyxdu1b+7AfYT7Mq0GBKZzJZCvrogBdpEf7EIOPNDAb6ndgnU+TGxHlsCaBkPhg
	 2GoTeep8+Ray2i826DJcR+TK8qdTxVQ/YT1qsuwivBzEl4J5XonPS1KwUsuu/soIb1vhx
	 G5atnW5eLaKHYbbOLed43lptAwsUdDHUhMHXVFgr3THwT7D/7Fr5kOxEkqOJjLrjibENb
	 A59KJw4LbR6iPAji9DdScQO9PrdNqg8KkWg3kX4NqmEts59a4BN1uknj8FJvoOp86ASOM
	 cYdgUNLmHsynnakTAbW1qyvOxEqiXJgfwl3iALO6QBk0YugsAjuUl7td4pfFDew4bUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YHabU7Om;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E6E606A335
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:22:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42E6E606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YHabU7Om
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8b67f25e6e1so764201b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794597771; x=1795202571; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hG1EB293hxr3Jgg2QdT4ZHxs80rfcC0WBpvazP602rI=;
        b=YHabU7Omftu3FhVQ7LIw5wOHLJ2zWV9rZoxp4VsZ6gZ1NUrAtNBjyNE55BVLGWVpCl
         x0NObRNP3TA8Kez5zn5gD2QojUceNcb+yasw4i6Hux+5mMmxV81X7prFEGJng9ZSbme/
         fJflg1FDC6Ex7z8M1V/6BEX2pY9vgpa5jO3sudYMd1rnsZRN/AE2GRzY7LaX4+sev5Yc
         j3lKVREvcd6zeoi8qSwmY+JIWIZPGahFN9iRmKq9qROXXjfaYtxJ7xxo4SWDFPY9Gmob
         rK6GHieNhieFYHsTjxum9PCjtPe5Zb/j06sXj+Fi8Oo8r9KhEaEPcvsPp0SxkDZMLSAy
         GKmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794597771; x=1795202571;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hG1EB293hxr3Jgg2QdT4ZHxs80rfcC0WBpvazP602rI=;
        b=TonwiW85ns80LAJt8Zf8M05qXW7mpopamJWdQ8BmQc/lOzTddkt+nh6+qjR5fyCgnp
         fBDyai8hsi2bHyY9d3WXKCeLSpJdVAqMP796/UDCpTCsz7wDx564ra1W7LQbSFD+QNd9
         vbsBw07dh/SfeyQe4qb/u4mqNiKp8crF6wvhpei+hHCE8T2EvC70sNFxvoVoAJiBCPaL
         miAV4HZoaHfRfao+FABpCm35d+bG5pJ5El+fXv6F+uzSab0nWBeddjygGEFebojd0tsw
         t3m6gJl5bzTnnUxxp6eMOWGuzrW00u44E4fw2eS+aliFW15pFAs8bLvEJaM5i7ItJsDe
         0WhQ==
X-Forwarded-Encrypted: i=1; AL+hErHR0QwgmEyPiVAHxKEq5IUPo7fjy86iIoRx3J22xWlkh/SNmLf/FkSbcIw5CTk9fmj5D3dQp3C3P8ixECo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7bwmHX/vvDToSJQL+aykgc4U5Tkhjoh9TXb7KHMzrY4Wu9uvU
	latYQkfYStZzROuh8ZuN68/bi2SmTtwnAE4mclgkyFdW4JwtfF/6w8bZ
X-Gm-Gg: AYBFou3Aw/oA6jcvxFDT/jM5oBO6oHLAhpdkRMKvq9Go3JD2jfUEtmOXpeSAPIgw/VK
	iEqspcqEcdin+IIa1yJt6kOPUHuSvSlPbXbh8EdnGVNqQr5VC7lXt9bZWzSjl4MezUVUruAoy6S
	iD82fvQmznWp4ESk68+OZs0AIqj9K50wW45wZM5RDrgQzmqSS73a2XDtFiYJWwH6ut7a51vaI9P
	wYJEruCSwrqlAnSOtXkVjvAah0JneU0cBGUcuD+dVSDL9mfBPOciBgmlGsRo0i0EuMzQxFIyKAf
	NNo6mbboveJPIOrkjB9gZNtDoQvfh5lwIDfGu73EUuMm/ssKghPMXbdNEpv5jW/MGn4kUlxGtF/
	DjOOlsFtJs2LPylpV/2Zd69GXK+oS5sfGdfPxKEjJund2ekoAVY/xVwgir47wcrtnLLJSKz/lAv
	3BM2kg+q/gM7iTm3uH16tWpLrXOqQpYXY2vsGeNxZbE+lfhkNFAeR25mOkAdgdQi5KlLUWCLpfw
	Edkk65qOfrGLbQDrzSomRR228yio9jPm+dy+1KxdtwMfH11nV3j9FyFZaem+pcGwaFR2MiZkxsz
	NycOrKVcIuTD9aLx+5lt05u9COYzo+JP/E8a/m5u9t8hEkDW8dOKZKSGxTZXXPIBtkmvwR4o1zX
	MLQ==
X-Received: by 2002:a05:6a00:b49:b0:8b5:ffa4:d618 with SMTP id d2e1a72fcca58-8beb6b771d3mr3233331b3a.43.1794597771515;
        Fri, 13 Nov 2026 11:22:51 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed1d6207fsm1601457b3a.32.2026.11.13.11.22.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 11:22:50 -0800 (PST)
Message-ID: <36d38251-994a-471b-94b7-d1356326355c@gmail.com>
Date: Fri, 13 Nov 2026 11:22:48 -0800
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
Subject: Re: [PATCH 6.12 000/670] 6.12.118-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20261113153811.177190860@linuxfoundation.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261113153811.177190860@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 07:42, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.12.118 release.
> There are 670 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Sun, 15 Nov 2026 15:36:17 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.12.118-rc1.gz
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
