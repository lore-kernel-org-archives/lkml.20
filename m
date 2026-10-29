Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793297804;
	b=XZq2g4hFwfvNa1uLGqv6ZUqlZYCmSTDsFVaaUemIWZsu6Mie/wsEo/7/4kEeDWI7C2JO
	 I8/yQBFL+wSYtnd7yA1AOHqVKmfSja94zwGhSu3LxTINEIJNjq20VZezOHhQpVT83TUyi
	 4WoZ0aJ31YJ22fsTRp+nwTUuNsLV5kI/YVWBri8KZhth3CVyQQ+sJG6Uv0/XqoMypOu7X
	 1m6NArrvxoQl1JSGma3ZE1yk4Jd2lN+XlyFa2rLXxQV3ebh4B7FrzOKpnO8WaSo8dlI7F
	 huBt4sncUQyFL1I9FG38iAXZ9GPMSvptqy7HvsHTOq6hJT2BfznwUlHt+7AayvowuYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297804;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=99z/FjcazCZQi4D66B/SibaBChuRIkU7h/mfNRp/Qdw=;
	b=vhTtj7dyiaOqvmMODpntEC+mEG16i0NkadwhnxhRCSUW49ZS/E6bYtIaalvVpWEfbn9Z
	 SVAnh5ZmvCfTZ+Cm7syGKDHTdLO40Z0YIVkvG9a8PhGtw5vvl6/ZpYVuyJKgxk094a1Le
	 dR73hn7TUGhLOXwZazAQgmAcUXABMNpHqSn38U0ivg7XVeQThNhKyxxGp04EPmNixnzvs
	 pPjmwlY84M8TsmhMtvPtosJRK96ewgYUaAWyQ1Rik+Xi87SRTD8yaio2Os1K9w4bQvjjj
	 Dqp+b+/zABW2RlNAw7JaLM3Afsu+a1sPdBz08jSuSx7zxgh5OpON7YVA5nD3GXXrm9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VrYzhrJ0;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6983560A380B
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:16:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6983560A380B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VrYzhrJ0
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cd5d2dafeccso1436584a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793297804; x=1793902604; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=99z/FjcazCZQi4D66B/SibaBChuRIkU7h/mfNRp/Qdw=;
        b=VrYzhrJ0pOifKYg/rQ42XohWgLtymI0J3+G2RhlXh7enIkiCM6k7YxfLvUBxT7AnDZ
         aAPpwAHi8PRDK4jJozJOfvwofoG3X4IFvMZHHrsSRva2sviTsNi4nvGHGb14LuJhjlGN
         nfvsdfYg6TvM1P7i244m9nQ4PyiQ68Yt/WYK7WAROj36PqO/CMeHsDSyFofgiaUXy40J
         jJcewKtkafTVl5kD1Z7s5qSzV926t3bMmiAmjJB00M/rhCFwA+onIKZVT6/H5Iw1saXl
         lJGTT0E3DXKvbnu5N6WSDS8TUcfFEHJFYvc7D6zfWvkCCxFQkaaeSROIP3htdPQWJAUt
         6K2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793297804; x=1793902604;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=99z/FjcazCZQi4D66B/SibaBChuRIkU7h/mfNRp/Qdw=;
        b=diNUOkgStyknDx+lL+dVmKuESDZxuDmWrWkj9KBHHZfFEFy2YfCBdghwUY7WA2gx0j
         doPR6KTzsVNY15hyig3rgQYIo/DrUQirKBs9zvmFXAAt/AlcI9aP5J24oXmCiLs+mooX
         x/NCPrqZvlzvAScBEMoCZGofSEdvoKIcs5WunGo4cCR129ICmM1qYbyYWvKysaQNp5iq
         A2CdQo7r2pER23pfvyKYe9+wCslPRRibMUmeyFRmDTekrkjThiTTscH56DgEvhi34upF
         DpINmgmRGa0jhdDM6TztdXlAK90cTD8qIGvXM188LpH7yxmksr5lT99ymutDXO4VYmTh
         DMXw==
X-Forwarded-Encrypted: i=1; AKwUvBxGFYnOQQlQERBNWNYQ67jl91TJYmvol2ffWA86J8yrv4tAQ+hExYJBf12QzJgE0ZqIQHyYYBd24xeXIrE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXJQX4hO/WO1plEi69GlvLde4fTGTG73XI0aFerOLysg4jdtap
	xsNj5InnqQcVwUU7g2AiFj3isgOvZ9BuqeCsnAVjfC0xvAagIp6C21XL
X-Gm-Gg: AYBFou2qxEB4NW0zHQWTNyrcvJmR4WWO1l8MdWYptjOutn97xWkregQhEsp3ZwSV3se
	dw+Mmc5eIgjRAgRlxsT7wTrr8DMai3Ae9z90UN6rckfK3+0SDdp3oBHi2j579PqvEE/c1nKdC05
	us6f9Q9Q9jGDBZETUE3+Mi7UF/P1QiW3pNsGhbABhGDZgtvED3Ao3UhXLB8axDxbOb2egOp1DOA
	E6pM5ZW5+wG5+NpHMqhyg4cHoAphPg8z1eag/MCrOjgYUYc95brOScAiiqkQssyiQdePgcOV1pk
	KBH7gRrkNQGqSgo64zA+VUjy3WRA6YInUNAsUNIHUY9a9hCoRsVLnQCdZHEH0KChPsm26re0PrQ
	4DSym5m4u48c3kf9AR/HsQu3JFFgxe8lfeBUoLbHbCjCId3kyO9fHtr4GgC/PmS/erZgDkctn87
	6PvcfBMwqmWSrKSlhnk5e0yooE+CG4QT3WlZDn3vPS9Ipt+NPO77keMKMJmj/NpJz6gh3x4l1k0
	etkcmldaD4aWL5A9xCAGfVts/ze5u9XQfifHpjMD0nDgWwdKE24prO8b/MCv1TcOVao83KDvDst
	JFVd1byKVnT5mlkk8SLmheNsbyc3fkGnr1aLha3/CZa0B5T5gD6oyyiy
X-Received: by 2002:a05:6300:8044:b0:3de:5302:e92a with SMTP id adf61e73a8af0-3e928953719mr74781637.17.1793297803762;
        Thu, 29 Oct 2026 11:16:43 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a98a0bd09fsm192069b3a.51.2026.10.29.11.16.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 11:16:43 -0700 (PDT)
Message-ID: <654c7978-3771-4c09-89f8-c5d23bba42de@gmail.com>
Date: Thu, 29 Oct 2026 11:16:41 -0700
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
Subject: Re: [PATCH 6.1 0000/1879] 6.1.191-rc2 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20261029073135.159947193@linuxfoundation.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261029073135.159947193@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/29/26 00:33, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.1.191 release.
> There are 1879 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Sat, 31 Oct 2026 07:28:30 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.1.191-rc2.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.1.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

There is a problem with the SCMI fixes that have been back ported: 
scmi_device_request_notifier()'s REQUEST/UNREQUEST cases are empty and 
scmi_probe() never calls scmi_device_create() for DT protocol nodes, so 
no SCMI protocol devices get created and clock consumers defer forever.

We are missing ee5dcedaf72d ("firmware: arm_scmi: Introduce a new 
lifecycle for protocol devices"), with that one cherry picking cleanly, 
the boards work as expected.

Thanks!
-- 
Florian
