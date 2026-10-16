Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0525A4FD7B2
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166952; cv=none; b=TbP8UT2lmQWysmTkpfbc3yOqKzYVcW/jDHn31XU/Yz/YOvbuv2q82/t0V5FPTRiPmlywseY5kWSL8oOmF8ORl64TlbWohAJp72AWJgefbSYpFVEoaaBYQL0zaa+tIgQErdKGYDPZkb8dBY/XSzwczCrIWbgN2DoZZAHuxdLw73A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166952; c=relaxed/simple;
	bh=tCpJKERnr0ZloXOK19BWLHYdWvp2e1dFzy3ltFf2BYE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NOocQrKDlSSDCbTsP8wUMBkGdj56qJs1U1NxykOfciXtRYUloEn4GyAqxrfao6HbhykdefjCkYMItF3j4nZhl+RUxo7GDuNP7m1h55bKFG9wNzX0CJHVukjQQpJQg8mFPtqdJ0S0iCbbFBd8NI2118156sFau1jVhuslpT56rF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aMxlHvSU; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aMxlHvSU"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc7e79c1eaaso77452a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792166948; x=1792771748; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wW5ZaLzQtiiOdwOE1f4XYPa5S1VjrcXxgM6O8zAvb8M=;
        b=aMxlHvSUPlZd5AbJ/CnLjszZG1/QyqXoiaDOdAW/S2i21skXV/KGaOci1Nqp3W4NZ4
         HYulBVNyNSCjt/hiUz/q65TT7GtpmIkKMiaVl5gpwDYawILRBpROkIPiGGLQfkjAltPq
         PYssX2dw2gSDP86zlSLp7jR5taMA25uvz8Wkz05O37FVfDpW2N/78W6YUMY3BFczj4rj
         EzzOE1NBLNI5ovIwNTTtKRIIG4E4HQUe21pUfDg2f0vrGn8VqErgn2qqxQhXgmIxUpjg
         JRLY++194uvq2ZIeG6GSVjI5il46a8xsrdRIvpYoQSDlKvWk392i+3P5Xg6lMCurwXGo
         sCaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792166948; x=1792771748;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wW5ZaLzQtiiOdwOE1f4XYPa5S1VjrcXxgM6O8zAvb8M=;
        b=VUPDXWTex2Ik1Wk5vyqKtBJpvBaUwGqNDHruQJpc2OoYXvhcfse9z2A92XmUXTNp5+
         apmLlfEyCYLmjYmEj38V2e/spq9FrDV0WUQi1+GbvXDZr41YDdXnyAEuRX3R2msbdIXo
         EHJ30wLiGkGXD5jSIFTA8cxv91bWQGkUqcMWN2wocufr7kKsx38w6nilqOld7D1K25Tp
         85/Hzq2r182JAJQ4xf8B1aO83JnjDEu8AV8IDqKZSJIgqau3enWa6VukEe6Kx/uUuv2F
         a2A3r3Pi+WczivWjw7D5Yrd2bMMaeU2AYXl8cqDkLolazFO4uCTJRyDBZgLz5ZfuFjBm
         OOpA==
X-Forwarded-Encrypted: i=1; AKwUvBwbVcNougTmX+7IWtWgvQc8tEzpPydmSZpzdOpGSe6Vq2k/onoVRTmJfi1doRAKU/ECkBZdL3d2MltEol4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDlJ1AlBT4ZQ2XUudl4x1tbAh46qlFfAhM1vAfk5dcBmwdtJRX
	kbstkC3XaOfnAJfyPeNpaBrSlzo9w1f7HMtBALCt9864OMoRFfMzlSlR
X-Gm-Gg: AYBFou2NFXsreHdrp0kPjNmw83f0lco2zGoNnNqYfSjr242B/WqpC1bOcz8j8Pk6Dco
	oW8w7ubBwujRryDL5G+NGwE+WHQmOAWLmPhnsCRFpdr+kfuOedA8TcIxOMrLRQ+3SOoxwxEur7L
	SYqrQixlAGuVaAHCiMoh7AMFZru46s7WsYdUqlNPY0FW2iOXcnqg2j+QgQvV1kZr/+7TsoxYHln
	3bsreYwM3EnE4SnukENUq892o0/91kvjAMMSkCkX2Jz1mxRkg/DbXpaR/2R7XF6PVH5yd4GHnkw
	BVTgt2cOAcz40X+ZiGgdmS5NMkBbSdTTn61ruznazqMqZ4531/6TfrSuQWFOsaskP34JJpCqnZa
	duFhZtX/jpw9k3KbvnCMhgRViKSgYaV4ctCzPiiEvrmb3gVAodtB8f1LBh2D2EG6A1u6YZsz0VH
	UdgfGsz6fopcu62R7OdgRodB66F1JpoIyl4zK4DVPkPJJqbq0CNEeLFADx5gyB0yKmrFXlNUgbi
	aY0wWVTVMFVBbv9SFjIqRd6KYlwl9br8BESy3OAKH9lwBju
X-Received: by 2002:a17:90b:5112:b0:3ab:c80:9365 with SMTP id 98e67ed59e1d1-3acef0f47a8mr284962a91.42.1792166948066;
        Fri, 16 Oct 2026 09:09:08 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac945e72c6sm9692007a91.5.2026.10.16.09.09.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 09:09:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a0fb773d-dff3-46d0-9bc6-f408049ba12d@roeck-us.net>
Date: Fri, 16 Oct 2026 09:09:05 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (asus_wmi_sensors) Drop misleading BIOS upgrade
 advice
To: Qian Xiao <heyheyco@gmail.com>
Cc: Ed Brindley <kernel@maidavale.org>, Denis Pauk <pauk.denis@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261014233318.34567-1-heyheyco@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20261014233318.34567-1-heyheyco@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/14/26 16:33, Qian Xiao wrote:
> The Known Issues section suggests that upgrading to a BIOS with WMI
> method version two or greater should rectify the problem. However, the
> driver refuses to bind when the BIOS reports a version below two, so
> every system using the driver already meets that condition and the
> advice does not help.
> 
> Remove the sentence. While at it, fix a typo in the preceding sentence.
> 
> Link: https://lore.kernel.org/linux-hwmon/CAFGXJCm6ZWK0NsFhZ1_ycgYtTTT3nhqj9mose60t+Rrry1aPvw@mail.gmail.com/
> Signed-off-by: Qian Xiao <heyheyco@gmail.com>
> ---
> For context, the fan issue has continued to be reported with the in-tree
> driver (which implies method version >= 2), e.g.:
> https://www.reddit.com/r/archlinux/comments/tunnvb/psa_if_youre_experiencing_weird_fan_behaviour_on/
> https://forums.unraid.net/topic/131340-semi-solved-611x612x-bug-system-fans-stopped-after-a-few-hours-asus-mainboard-linux-517-driver-asus-wmi-driver-issue/
> 

Then maybe the advice should be changed to "upgrading to a more recent BIOS
version might help" instead of being dropped entirely.

Guenter


>   Documentation/hwmon/asus_wmi_sensors.rst | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/Documentation/hwmon/asus_wmi_sensors.rst b/Documentation/hwmon/asus_wmi_sensors.rst
> index 8f2096c..f6fa66f 100644
> --- a/Documentation/hwmon/asus_wmi_sensors.rst
> +++ b/Documentation/hwmon/asus_wmi_sensors.rst
> @@ -72,7 +72,5 @@ Known Issues:
>      X470 Pro seems particularly bad for this. The more frequently the WMI
>      interface is polled the greater the potential for this to happen. Until you
>      have subjected your computer to an extended soak test while polling the
> -   sensors frequently, don't leave you computer unattended. Upgrading to new
> -   BIOS version with method version greater than or equal to two should
> -   rectify the issue.
> +   sensors frequently, don't leave your computer unattended.
>    * A few boards report 12v voltages to be ~10v.

