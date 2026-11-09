Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794203752;
	b=VCACRho569Gf/g1rTUrU89QUr6GSgj64u8J0hDHSKVsulaUoAYrgU7vpDBrT3DnKUjnE
	 9SvqTokUo8Zv+0fwJYseiWOfTFwQpXm9GB3zpkA2Nr/7Ly/R2ZhLaZFx7GZi+zkfNwg/0
	 /MPDPJN2D8/4uAZYdWnJ9wXUanRypYVV3rFOGKC6jfWTbdS472c/I1I21pIg1KOtAHUhk
	 +527ZeZUZGV7hYPMH0YKaN0IwQ0NrGDe800BZhvG5TziBjELo7QbTzEJ+gAK3Lhz3aEGM
	 1nIWwoiwPbo7kYXnYMgUO4kJn/9d13RE+z07AP6lDVZFu18c5sSftxWUW3vu/hx3zlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794203752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=+JKPXzOXiWeUhRjPCoGmPsKCkrFKLMgj6krvEZ3KGKE=;
	b=VTamAK9LYzEQxd3pstdGJ/BVeAjMmzeFJy6lTvIV2nrwZrgZyqEFaMSzXa6B715uytps
	 /9oEqkVWUo9XJkBdl5xUakYnCM0tj8nAunXRWtTmJySljyqPljLiO3Oqty17lqlcuHS/E
	 +jjbpD5Gzw1jsv6LysMshhww5MhPGoCqL9t57PWtxJsyEy/Rh75Ql1HOn2Aok6T0ltnAU
	 AKHDkGQV8Lyk8YQwuUbWrHQXYZ1XA9qrgnHMJd5+3PVTH8cPCVRvZQpLbsl83YUCmq4R4
	 H6mLaZqHurh+tQd0A0gAxUnTjYJGLPgfvt21Q6OXQKyMCy9t2Ns4zajs1VJuQQJukGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T6Z7eMcK;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5944606D80D
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:55:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5944606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T6Z7eMcK
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48dee593f18so214037f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 21:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794203750; x=1794808550; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+JKPXzOXiWeUhRjPCoGmPsKCkrFKLMgj6krvEZ3KGKE=;
        b=T6Z7eMcKXogH7+9itoQfxyaZTybuP058S9GB0loQUaNg6lWfeXsTzQCQrnVnI5TDUL
         pKXHh/QnmAhyfhWdC+vAmPwk5bpfxoX3AukAuI75fYOTHE4yNCHuPVPUHRm6+N2UUSEE
         SlIEZPlxk6RSHOa7VUMouYbEjq8Rig3agn9PHt5UKBre90XKpDGIwt3AFPmkk35GFC25
         GcFEJzNXKqJ2Pu63EMX4+kVfWj/CM6//2DaXaau+yV+XW2ZX5p0KBU8B2hUx5785YAfK
         qXdpYEHjJ+89JQYCPrErt5aMYuJkuJRUpUTAs2I+KbZKe0fjdpG2wJqld2AGstfMUOLv
         xe8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794203750; x=1794808550;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+JKPXzOXiWeUhRjPCoGmPsKCkrFKLMgj6krvEZ3KGKE=;
        b=DQQ7j8IvquUBzPzq6o4fSvTn3KSyqiJkkrFPey6+gHGlO+a+PKfnU29lWvWeg2HMpg
         RH3x2Q6VHWNJKQ+S5dDkDuJz+aA0R/5jq2IG4F/ZGDCF+qEo7oBLH2eMiifwfQZ+IvEt
         WccOyuYJJizXW52sY193d/PLAZQ51Cg5NNKesnl8rETZOdsW00L2Y4ob0wiEYOcUMCDw
         vXMlxISz3hcH+L45PToefbcCd0OXe8/13mic9As9s346gDk1n5yIxR00gwvkfTzlw21r
         7LQj/MPiHsNEg9BriJ4tGbPmt5+a01F8aOzNScTsryiZ5G24cZhNPb1IQrSgEjeKvbhp
         BdFQ==
X-Forwarded-Encrypted: i=1; AL+hErFOYsO3pIVc+0ul+OfjkaP1Ri21nmopriPy2VZ0X7dvWpDrc4IodHsBHGWl1TSdJ/T7jqYdtI0llurZbSc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3AlAfmgz7dR0sbSlim+xwuI8UJxjaK/Ijp0WlZLhMlvgAwmIY
	J0AXuTur6hGwM3Hyj9s9lM4clHmKdE715AJhNh4Zjt/mUCN223z87r0U
X-Gm-Gg: AYBFou0YQjALMuryc03A0AcAjw4RR8NTnSGeaTD/UAUiDO02a4Gi1ehrN25RKIRU+s5
	AmaiuJ/Sim8QcPpS7MkXAObjNO8Uem57z+aDv51c2VqbayJJBM+sp0C+DQAI92aESxhA6La4i3L
	oRXUzy50MrAyhpYTvtQHP5i4sLQ5Lkr+2oBae6RJ+xII4BuFnKAsZZrZ0oZygScBJ3lYzbt/zzu
	C9Ja46v/+6MqA8d7gjZYytKTqxwvv+qw7Sb6mHejzuDVwpV3+6YvthXbB1o6JCXFjsr7TF6/cIm
	pYPTjT89eai/IuiuRKpAsaol1eko90MgVXHf5xzh1GYcdGhG7XcUYcnFpvb5PtJERICV19i9McQ
	Ows9Y2VGbNN+DT5EsdZmm822AOiJH17qPqMXHAAoy/8068c+cjnLrf93xM7vbvl1tHtTIA+dKv+
	zx2maz+mRxwNVwE/94m+pClpF0DJs7ZxI+0ZLfTRdbteC9PR7fRqOxiisQJNXt0VUZZZYvsqX9X
	lsvG8UkHqNjnlR/ovGjH/qH+zL4u84Imb5ybIgxTsqbT+BS1KwmM/REl8F4Op87n28qd4SGTG7c
	+BcBKtSZQo5hV+S8orH/du4pi8u7Fx26TMuKT2SAKEOefC5zWKQa1u54PYXie4t2juNB7imf
X-Received: by 2002:a5d:584c:0:b0:488:7df9:3898 with SMTP id ffacd0b85a97d-4958cb50b2amr5677097f8f.56.1794203750094;
        Sun, 08 Nov 2026 21:55:50 -0800 (PST)
Received: from [192.168.0.40] (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4959783fd04sm7983953f8f.47.2026.11.08.21.55.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 21:55:49 -0800 (PST)
Message-ID: <17b8daee-c5df-4b03-a839-38b5ef3edf3e@gmail.com>
Date: Mon, 9 Nov 2026 06:55:48 +0100
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
Subject: Re: [PATCH v2 6/6] firmware: raspberrypi: Store child devices in
 struct rpi_firmware
To: Stefan Wahren <wahrenst@gmx.net>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>,
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261107-fix-raspberrypi-firmware-v2-0-5bfe605a5cc5@gmail.com>
 <20261107-fix-raspberrypi-firmware-v2-6-5bfe605a5cc5@gmail.com>
 <63ecdac3-f8b3-4d44-9b0a-37346568d326@gmx.net>
Content-Language: en-US
From: Sander Speetjens <sander.speetjens@gmail.com>
In-Reply-To: <63ecdac3-f8b3-4d44-9b0a-37346568d326@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Stefan,

On 11/8/26 22:06, Stefan Wahren wrote:
> Hi Sander,
>
> Am 07.11.26 um 19:21 schrieb Sander Speetjens:
>> The hwmon and clock platform devices were kept in global variables.
>> Move them into struct rpi_firmware so each instance owns its own
>> children and their lifetimes are correctly paired with the parent.
>>
>> Also check the return value of platform_device_register_data() so that
>> an error pointer is never stored.  The child devices are optional; do
>> not propagate registration failures so the main firmware interface
>> remains available.
>>
>> Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
>
> the first version of this patch contained fixes tags, but they were 
> dropped without mention it in the cover letter. 

I was not 100% sure if the commit needed them. If you say that it is 
needed, I will add it again.

Kind regards
Sander Speetjens

