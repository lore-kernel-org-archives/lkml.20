Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794714487;
	b=3dVjdXwhgF/vWUKAdIpULTp5c9L0QHooGncWQpiySkpG92g09tareAfuJO0P+5NAPCOT
	 1OR4iyyaWC0F8n8RfEWJFoeMrXX+1Kc/L6kHW3iUmIGJ1eTR3EapR7GDXIiv0jQgFSLEV
	 yx2nOEctLoP0UAZc8L0AXrR7BtWs5lGn+ohgvyeW9FAC4JavItunUQe4NFOkQIPCkHBXx
	 82z6DmSxNt7KYZ/7oAuxwneZc1vdeFZIf+1vj20YmqThJvTW1mjFu5aOPn4J3wc+vCvhT
	 K5qrhLN+R8ITN3PK7BnnBnEj01J25amJOpp03iNgsePtFP26nZSugeRR7ngJ/PknvNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794714487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=koJgHflpF8SlmhITyVQWyV+LPgkeAJc/hP06L9RsOYI=;
	b=F2V+Kfo7xccuWcNBgYKhzWR31sKQP/lQpYL7HAc1HBCKqJENfAughtGdBI3tJ28msDZ6
	 5mthmcRbjF02QT8poOsYMXQH+aiK3F8U5yzHDzIfutdCwUD+/QbGutLtOsTLRotfwXRHL
	 2BT5kmpqlYWvYMzAl63bPoCXO6zu2lamHfthWNtwxPuWdf43hGuvACzrCgNCCYLxD36Ne
	 IfWB/fCx6EAwHg/RBH/M/uk2PFKeuFX83TJkvd1JofUK72uK1yfCD1OT9zvWXr5qOmz7d
	 ZBEb2COCf9RUuaPZNc8TH5URdRjq3EFJ3ygI03SwL/WeykeXihoc4/vdDV1ROmZiltw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b183+LWr;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4665D606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 03:48:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4665D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b183+LWr
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36e795af1d4so1704487eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 19:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794714485; x=1795319285; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=koJgHflpF8SlmhITyVQWyV+LPgkeAJc/hP06L9RsOYI=;
        b=b183+LWrZFM0bv0LIXdbfL6FW/5eUn2mEGH7ooYlP86N7E5uEfzcrKvKo4HKAKacxv
         GqV0dysJkB7meYrGx87aZE+fCxomVCXUMduyJD73Zgmcj0puzmcUhF0MzKt+RM8cE8u3
         /3szSVzA9HIR4/XE9TJh7h9/5vMbEMJLeweZtnrZfKdEGc2AWJZQF6XvYh1jee0OGNVP
         lSdaRpAbzDg4CCbLX71SNKq1wJzqX4tAwesTMwSbeo60lSD7M1Lqk6AP2QWG4W5ZIh6b
         pO9+2qonCSweRR7vdT+SZWk+WOSn/Wz6alFcj6r4EWTisZAITnDRhwDSI1XIOongLCYf
         yXoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794714485; x=1795319285;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=koJgHflpF8SlmhITyVQWyV+LPgkeAJc/hP06L9RsOYI=;
        b=au+rLs1vo4P0JMgKZUYmeadE1SkFbQKDSlSslDxUG9OKuG8r4Kl89pjc27R3eDJHOY
         8W1EOs24XJBDprY2OD0DjBZTchxCl1QZXLyo+apQqEumJNnr+53EFIOPqrMYOz8RzeVi
         xpajw3N9ukaBc1WxrtecywMn25+iCZms4T+Znu3+TXLvyoNgFdwDmuWLC5TKBOzXxTIL
         GhDY5i6nQMnMds3RWylvMAR8ceAlm7WkwBMgjzi4hru0R/cqk7ZpLLnkYeyXxtw0+6Wt
         WydTId5RFAx/RnhFBMUiO15oJtnH3iU5Jhu3s82hcVlvX7QPe/ryWF2z5yY/bSc+AAu1
         N5BQ==
X-Forwarded-Encrypted: i=1; AL+hErEO4+h8F4qIRfnE1AyjIl+hblsMNebaj+I/WMl0q/AyxiKt/GwKwnDTKhJEe5zCgRHNQD3AVpMK5t1+qeU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TimBsnx4blT3cdxhKlSTfJXussPmzTip6d1N6mxvstxeflQzO
	6rfdBleczZq+nJViruCm+WNcMvcGcbE799gQiZzwbe9QQVd3Nxtb6F+O
X-Gm-Gg: AYBFou0oqJu7GAGGNHcZK0PvAXlIRMEWUe45gXLos8uP2J8piEw+IFzUJdeYRy5y0sK
	2QjrJl7HVzJWeOvtZehW6tmn7itfINps64Op8Ij49rvbsZbLfMpfi1ZG4yALH+vqnLIjbdHh3eR
	80Jt7xJZY6A/yTOmxuH0d2/9EnGKYBeparoXRauJRhqxfSOgBIWW3PNMpVpynhqWBsc4jHFQL5w
	2FKmQ2bB+CApHfULeZ0olMYq5NzasSD8Gdyyg/OCatbLr0oA6ve0vvzpDJaQ7txJuubJiVWoBXn
	lclHYXCt7Cd1byJIxGBz85sEkFVj5PlH7FD91j7Q+GitFS5H14I4To3vBHgMaFEUZKPbk44fekJ
	6SXezBpWgEakzyOjXnKeElM56uvUgouULrKG+COm8UvSBqPXxSfPavWwoF9cFHpxDW17+aDIHSM
	tFx8OHxmEWW8YGb5ctsMXcQ9TgARg9ZohWPSrWHhXzashQmL0MxW7b/TkRHUL6IKFPRgOQMdYl6
	fjWN+itpR+ZCBGqMQIRrbMZ17vhFl2myk/LBvvh2yk/0J3UHUPyKut0YYLi2aMvQMouSKPuxh+t
	5YqS5hY0zkMNauiTVmrYEqmN+KeWFtZqew==
X-Received: by 2002:a05:7300:c00b:10b0:36a:647b:2d7a with SMTP id 5a478bee46e88-377db7c8ac3mr10822333eec.0.1794714485325;
        Sat, 14 Nov 2026 19:48:05 -0800 (PST)
Received: from [192.168.100.6] ([121.144.254.242])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm37381434eec.21.2026.11.14.19.48.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 19:48:04 -0800 (PST)
Message-ID: <84aaed30-5259-47cc-88b2-437b81efc90f@gmail.com>
Date: Sun, 15 Nov 2026 12:48:00 +0900
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
Subject: Re: [PATCH 6.18 000/686] 6.18.64-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261113153820.902362109@linuxfoundation.org>
Content-Language: en-US
From: Joungmin Lee <leejm516@gmail.com>
In-Reply-To: <20261113153820.902362109@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/14/26 12:42 AM, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.18.64 release.
> There are 686 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Sun, 15 Nov 2026 15:36:17 +0000.
> Anything received after that time might be too late.
> 

Hi, Greg:


6.18.64-rc1 successfully built and booted in my system without any notable
regressions.

Distribution: Gentoo Linux
Architecture: x86_64 (ASUS Zenbook UM3504DA)
CPU: AMD Ryzen 7 7735U
iGPU: AMD Radeon 680M

[    0.000000] Linux version 6.18.64-rc1-900-myllvm+
(user1@gentoo-zenbook) (clang version 23.1.5, LLD 23.1.5) #3 SMP
PREEMPT_DYNAMIC Sun Nov 15 12:36:52 KST 2026

Tested-by: Joungmin Lee <leejm516@gmail.com>

Best,
Joungmin

