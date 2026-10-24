Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792812082;
	b=H/CdeKFcoYTiE7WMCPdHx1bs7Oy9FpL30c9lOAnMXwa4H8b2DbN9jr43ucmpWH4tlJPm
	 +WQounTLyuDBJH6tGeTaF4/k0YvnrbOGfw/OKZxhFh5QgMxRPPZ4RSCqi1G7RbTr7Jzy4
	 7DcHOZB3xwPrjNDgcgoYia4CpZqH5FakBlSvtfZ0B8oN6MyVf3Z9rkrt7mJgNAcSneq//
	 iVFdzsQhQ1aZQENBX5A6Y6VVjfUuDAiO+rnUF1+AzOwVmYsIcOjB6eZfkHl0uFy9VOYei
	 nidnrzzBAJeBZxYkOc7w8qImfi5rYmupEdzH0XAKHhydaMS8X/ls0CdXnBGHHiL4K3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792812082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=jS7Czz+wiu7WFrzrtvYg+PFvQraU5/rTwcpARPMwsP4=;
	b=PFRaE9j/TjQ9boVOh0ZZR22or8Qcmyan86+l5lnLyGKL7D8YA1tuK51HnU/22iVKJDk8
	 5xMkD3uIN6F4px/mt1y9v6CmAJmC0S6DiyFBDPWNTW1tKI0fMQoyCElQ7WvBGU1vp9mpA
	 +liAy+7z1Clk3FoDOcReoyMwBCK+EydC3wLtyAW/dK3qqFjAi7WULMtr1kCycoyBV851o
	 IQNYxSTli1aoeAFotMW0xm4kSV0H8sZyML76bP1aELGCY6RqTvSA5sBWDpUFAvNPi/mUQ
	 wVxNf+QM3uMEew1zXMQknVv/Zpnnf81qdBUF9CzdKNCuBM9myFKCniz/+WbQ56u9Hrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QFYU8gQh;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DBF606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 03:21:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23DBF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QFYU8gQh
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-188406bb948so1152802c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 20:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792812081; x=1793416881; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jS7Czz+wiu7WFrzrtvYg+PFvQraU5/rTwcpARPMwsP4=;
        b=QFYU8gQh0JIU/1g52xf3dEHUMnFoatncMZt//oVQLvOUORQ3+YpGk6I+NlObMEnGtG
         0wUOG9usTSJR4MqdM4LoI6Qyit2Ydh6/vnmXXKXp6TMfZlQC48aNe2TyGiEgFho1Q6dm
         lhd8pjeM9yZ0lxMZQzazMovsYJDTmyJTatJ9/g2sy/E45676EIAnohGaMbXW3ypR1qkL
         8ucgiCaXni/7EuO7B/iNmMvwElKPWr17+bCCiCYNVPeFou1cs3+oC2u4G7r2HcMXuk5p
         8l0cqwM50t+/tUVPbSa+fBP84Baa84M2VB0ehYRcarH6ZtFaTPT4DMWAwA3d39r56OqJ
         ATkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792812081; x=1793416881;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jS7Czz+wiu7WFrzrtvYg+PFvQraU5/rTwcpARPMwsP4=;
        b=BVlYBRx0QhEEXMXuvlOkb9Cjjj+r6pJi9dTdljk8Hoep+IEz5a5OzgDONzW95iwdiz
         jdex1c7Xs13okK5EGJiz4x8RfXPu0mVOHAsTJeUu4TfA0rYRZRpVvs1011m6jUqAe7rh
         /FCKSYAGIiQS5F/8Srf37jtQVu/GkYWsv6fredeMd8jGyUlY+ZwhTPORekTixw3Rbf/9
         V0gj5FGo4M0HIrEp/1yJMWi0j4JPusD/v2euyL3sEhFDNCQZRqDu8+VrwTbGeRIsWEmM
         tQL2tG2D5fxtH9vcAPSpLz4kmkKh5h/pIv270jyflZrIi6D18qx+zwGEKQczeTW3ICor
         oztw==
X-Forwarded-Encrypted: i=1; AKwUvBySYIpjJZFeyPAxtLwNgxHW4iEMiX0QIFMMggmxhScDiWL8MvjEsiwqksrYQcKDovooAmN2P+zPGckGof4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJDy3mCignTu38MX7ZeVt7mJWE7SOI3RLclYS0UjcVVjy2ObMbk
	Bb/Gc7UrpHxN7jserPubfWw/rMJ7eZmbvY5YiYrtEKE9YnNL4N8ki8iT
X-Gm-Gg: AYBFou0ucV5FgPqHWbuhuhUFnCWIukFURoVaVv4+KatxsDUtJsVTZymE2hMc4znkOOa
	LjYBdQ203GzGRFePHOOTwIaRMWjEaymDxh0C9k00qIC0kkSY0h2Qx4zqee78xNw7kOE6OBy6HW1
	4J6wn72Fc+pAFPTkhNiiEry0X58i4X28pOBusum9sDgmsR5UVruasm87Bg3OecAAThRQiHqDAll
	2jYa5Z++dj6fYwWA6iONldzs5I1MoqVJZms6kRgXAaW56Tm34a4/sC3EuKLAqjsPoC0BedLYRA2
	zAeB0osEMoJVFYcGnJU90Cxdp187KlrTL+3430hGpw/E5GwrGScJACVmSsFlh/MFqqU46sZIb2Q
	M1O3PNC4/thwpuVA+syOyYjMqdkfy7z7+LdoNP5hzxyCbVWNXx4uhhQzOgZUwbOLka95L2ZJVvA
	WwHO/QgUGhSqwAirh4LF0noftAAGiqORUm4HpZCf6Gp2obv6xhSkbsArlHEmg7e+hMVqXSivRhz
	y8yzddptX8lBuNE26xdWkKMQDEYQ/x29R8R0j41uXYey0QJ7UKCaiaca0wEvdDehNxEFMRxdOm/
	DHd194eOIzE6B93ZoV9ENWqSnJmSwEZq
X-Received: by 2002:a05:701b:42cc:10b0:14d:3c0c:79e9 with SMTP id a92af1059eb24-1993505dfd6mr1266066c88.11.1792812081124;
        Fri, 23 Oct 2026 20:21:21 -0700 (PDT)
Received: from ?IPV6:2600:8802:b00:1f81:ed84:76da:ac36:f699? ([2600:8802:b00:1f81:ed84:76da:ac36:f699])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0f81ea9sm3107744c88.11.2026.10.23.20.21.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 20:21:20 -0700 (PDT)
Message-ID: <fc0dd1a5-70ed-4c4d-84e0-94080dd5cc38@gmail.com>
Date: Fri, 23 Oct 2026 20:21:19 -0700
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
Subject: Re: [PATCH 0/5] MTX-1 watchdog driver removal
To: Guenter Roeck <linux@roeck-us.net>, linux-mips@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Ethan Nelson-Moore <enelsonmoore@gmail.com>,
 Eric Biggers <ebiggers@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mingyu Wang <25181214217@stu.xidian.edu.cn>,
 Robert Marko <robert.marko@sartura.hr>,
 "open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 manuel.lauss@gmail.com
References: <20261016221617.2223004-1-f.fainelli@gmail.com>
 <85d47f47-1432-48fe-b83b-4d53381c5461@roeck-us.net>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <85d47f47-1432-48fe-b83b-4d53381c5461@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/19/2026 6:00 PM, Guenter Roeck wrote:
> On 10/16/26 15:16, Florian Fainelli wrote:
>> This patch series removes the bespoke mtx-1_wdt driver and migrates it
>> to the generic gpio_wdt driver which it should have done ever since
>> gpio_wdt existed.
>>
>> Assuming the patches are satisfactory, I suppose it would be easier to
>> merge those via the watchdog tree than the MIPS tree?
>>
>  From my perspective, patches are ok, and I'd be happy to apply
> them through the watchdog tree. However, I would need an Ack
> from a MIPS maintainer to do that.

Thanks! Thomas gave you his Acked-by on patch 4.
-- 
Florian

