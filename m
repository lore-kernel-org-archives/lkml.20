Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792434578;
	b=q7zCRFwpnV+nmLeh4O9g7/hHlH3ti5QZZ04gt8ecnRu/Ozw6migKY6TlTQjvNIpr+WdU
	 jqrzTrcUARx1n0YRH1wB/RM+X9Y4TUaymb8NtoS1KonXkog4EJrbqQcZAOwN8JyAauNhV
	 5EtjL+4BT0VEIkUq0TNmmJOJwV9b+ieIhsoXKUigJJo6T7vftInHWDWDNMLeHBUgNfZtl
	 pDcQy2ppQSXr591iSzBqWPuZP7sTWZpccqnBvDK5d33/H46bm0Yz3dfdoXs75QmE9N8NK
	 QMP8Diw0QifiE4Ez7BB/FkUUMnchLqsrjdTkKPwqJ1ZyMZ99kWLuuteN6/ekQX058tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792434578;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=jSBiV7ul+0Ul9MLE/H5BpAaYAk0aqMfUljP7X5tbwpw=;
	b=EVSmQlVss/sMhCH+BN/czJTTi+E+826GkjeU30wzc/J+9a0uPRvhV4fpdmAbaus+zQaY
	 dOVhfPygrbGDHEAh5vWHWdJWZVBt60OWmboKWgqvORus3DaUGlCH5OQbFsgh/wChnuhdC
	 RZtqPAi/JqZc0GskZVeSIGV6d3axFZ4g56t/0cPOMEbFIAIgFRQH+R4SYK+OXxHMjyv83
	 nnqNcsfqraxAiDFiLgNG9cPNlLUQXSqAEZsN3vm1SNaNMED2Kip9HZIrnMMvuoWhk5B/i
	 jPZ+UgeT3ggMBdLsVcI+vqooJXMz1g3dkOTmOyiYpK3Y4leoeoxhQk0TwMnkio0wmgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YKfHipk3;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9AE606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:29:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C9AE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YKfHipk3
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e5d0ee1951so15932425ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792434578; x=1793039378; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jSBiV7ul+0Ul9MLE/H5BpAaYAk0aqMfUljP7X5tbwpw=;
        b=YKfHipk3Wi83rizz/EWO30DPPheCuy9J9OmvthKmNGtuEoK8Pb+EucZUTJGGRn4dmP
         XQjRPbdI79HzDEzEQkBXytw17phqWORjxadrbkdTHmtJfjIryM2ouBGzm61Lw0Y0l7D4
         +hRsjXIILWMmTh2dolAE6rytJuZiWp4IuxQFnzkX34dgvJc/sCiNJxG6PNHpWtnJb3IH
         /2T1R4UcYnCqkTL6boWGXAn/0fVLsHc7F1q6p9Mj7J53QitfvH3J+TanMP2+ZaO6amd9
         t7Q6dwkDbulWee5RHD7pLmxGEu9nVLtlOawdRhjKYD9BV4ZWOuzz1Aq8L7lZ5zJXRxAS
         EcoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792434578; x=1793039378;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jSBiV7ul+0Ul9MLE/H5BpAaYAk0aqMfUljP7X5tbwpw=;
        b=fLa+h4c8LicgrtDSz7jjkHf4pbwgwdj0+6Egqf3gczsaTAT03PMfiukFRoOWSiqwpZ
         mZfMCz+69XMaJRPPD50SZWyGxiCU3pFw0fpbpin9X4QbbO782934FgGS6T5NL1ePtYjM
         ZAtSwaQcIcvbw++WJ969Rr8WoFNSmJ3vkKucGQ2xEiBLaHu92N1mkQKCWho/edxMny3+
         TYbkT33jyfpJr5sGlhY6ziK2Z5+JpfK5u+BBbQWcbBKVu147IZjFN9fkyw4FLUPlkhoq
         Ww0VmFTXCyr4342+GOxYsXNx9XxmjoXvPD4p6onh4gWVWPsF1kw1fjJKEE2SAOo1MehH
         tUkw==
X-Forwarded-Encrypted: i=1; AKwUvBy9bcOOBS2HH2YYJGcAPwchKfGG2gi98aym1RSvO1LvD+khYqIWfFSXfVdZpwbJ5OIKUItqkdQ6eti8oHs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLcajEtwD3c8ts+p6CEVhriECzR/IUqZz3rT4C7kwgD9p4Mqocc
	yJ3+M/RDb2TDvd5E5Y8KjIAHKXAyHjIU5uKqFT+6ShVrCtfXAJ8SWd/Y
X-Gm-Gg: AYBFou2bRQ4+ZMH94RlR60V2QUddL1J78ba1J4xahyRXGR6K1WPB7zBQVXUaRcPP8GQ
	AmfeWruPPXGFwZVQ53XfcIonncOV0Fl1wiYmm2yZLfhVCR9STlS/RqFsYRZTY5k/07qibgf/NR+
	0z/HRknQxRk7j5Y5unuld1s/9oFixC1V+c+9JsVuqHdHzioU/27Xr+2i+46Ly1EpYFEkhEJHYR7
	foPfTIGzLA5mTPqRmewOb/yxj0NcJdU55wyFDjx6pjb1Q1FrWDM8dGSf9F2Mx3jTnr+xgijnc1+
	XXljdbApp5twaBv1a1Piu6NrSuZepUkJsmSQNSBi4VavZDuHBDz221N0G4kr6ySKAnPv+oeu4nF
	5yiVA/TOIDQZSvITysjoJmxFxjU7stLibTVtxITqHsktHZl7ZPNBU58OCy8EhElES+mAbWrtXZJ
	XfjUsB35fKYoaE1Kn7XWz8cUbx0JqlRkDCVvGsvQUOpPsf24pPw9e4CXSWVm65fPXfTq6g2PSgU
	DmMRH9jiODxlulAD8b3HWnc
X-Received: by 2002:a17:902:f546:b0:2dd:ad73:c938 with SMTP id d9443c01a7336-2e9a6d40f02mr71830455ad.25.1792434577572;
        Mon, 19 Oct 2026 11:29:37 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea13c7ddc9sm5303515ad.0.2026.10.19.11.29.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 11:29:36 -0700 (PDT)
Message-ID: <8bef225d-f3aa-403c-aab4-f629aa197b3a@gmail.com>
Date: Mon, 19 Oct 2026 11:29:34 -0700
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
Subject: Re: [PATCH 6.18 00/52] 6.18.58-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20261017155104.830766652@linuxfoundation.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261017155104.830766652@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/17/26 08:54, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.18.58 release.
> There are 52 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Mon, 19 Oct 2026 15:50:51 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.18.58-rc1.gz
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
