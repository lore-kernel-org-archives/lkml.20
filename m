Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794622801;
	b=Wqgxb5xUkECcMnRq14QhmTViR/66boV2F9UUrvdJdDgii9b55MEoUeC3N70e0ILUVxiU
	 yfnMrt853tel9IOzXkpMDUamV+3unS3pKxi/7n4SiVeJjzgHByITEjc5D/ghDRaqWEFq2
	 vY3CVpxG8pYyE5ZSVbgWqUY/c0GU+Q1XcikcX8nY6X/sJZRydFgkVR2y/04H33NuTKhIs
	 zSHlkKYJyccIxhHo+TJzjy6mfry+mYV4IShMFRgOj+7QqKQQaI6pOY43+9wtMrJLLIpLG
	 1y1XhAWlxYl5Q1Tv7XjaQEkm/fHlRU74ly8EbEu6SjiZ5PRUrEE4XvasHNSAt6STtXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794622801;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=D5fZZPHoNA80HLJCIs04HdBTYoqvhRKLX7/FlR/nB3s=;
	b=BFuRtA3Z6qjDMYfsCQHcTeGPxnJ2Y187r+5EKHh1MFCK8YYy3LgIOGEnoQTIpOfxVx2P
	 +55fKwj2RA6bhKlr7O7TZOJqQ8kA43eDrseYWXrCq7f3wI0CLvhkSChP6r7KZp+0vpFc8
	 ++yMcMSpH3BpiYuWNMrHPw8x0glCrg3s2ts+zy/FKrNScyyqb80AJ9oTQIz2wZ40q41Wy
	 GHYR7MT5RLOHffW5G7VBnXDvReky/d5WtKn8s3xas67iDnQiMKXVFERTvegfoVyAEMDuP
	 dVmBULiYtYpQJ9zAJ+tLMCCXRUuAiD8uSNTW8EgpM1lU+HVSJLPQfkjTLBAvM/BFm5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=io+OeirL;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78711606A332
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 02:20:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78711606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=io+OeirL
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48dee593f18so2086032f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794622800; x=1795227600; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D5fZZPHoNA80HLJCIs04HdBTYoqvhRKLX7/FlR/nB3s=;
        b=io+OeirLD+kAFIPg9SukhVhErUBizrGQeAN0IkHjn1oJi4Q/U7ldUwIwtbLvvpyXU5
         zIQR4+RC/dlR/jpjdgZGOabt0uQrNzf1kLzcZNEqyZwvFvxt3cpfGPI07pg/k1n9am8/
         g7Sr3bhP5P8rkYt5IC3Xj2X7FXJNODw/SAiJXQgX0FraFLQpEvTsRSLGGJRiIg7pySpm
         UfJppR7d9p/+Nlo8GMJDIJfWO5tpp4FfZcm8haf17ixmGyPCayCFBUzomFLvjGHi6S2f
         xFvpiYuVxfQj39KQgsTi72on50g03JTk8Z+pxFj2Q5IvBMn4IsqeCT7bDiw43fJBDD8s
         q+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794622800; x=1795227600;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D5fZZPHoNA80HLJCIs04HdBTYoqvhRKLX7/FlR/nB3s=;
        b=bhEXNmOmE+V2mAGdYCbl93ipJdB3fX3DPzYLMOjCXMMBQ0rGsCcsYQi8ekBJXu0WqX
         hZCeOVHzFHrvx7C8ncMAdO6M79yDLTmavz1smLPQF9PmGROjVawgdWAxnrnwdQ3a6CMY
         HnZSEjCuG6/PHbHv4JFxprnuN8Bp7vvWBr3JCnMgB0hGgAHBFSO4QVWBj4UKPoKLiIti
         O5cb2WtUkb3sbDgwiJ98Rleyp8yY7pim4liODRzhn2OwDwXIgs3RXFw/3TP8wpD9PwRl
         Pm+0ni+MStYt0w1gY7oWOtykYlDT4E+2Io6XDDaV0+sVio+lfxFuckvPrjawQWw+8szf
         Dqrg==
X-Forwarded-Encrypted: i=1; AL+hErGrMiDyL6pefNK1bjpNoEHxlyjrp8ePCG2t6d3PY9j9SRa/VpxQOIKICpBNTVrYQLmfhr6BCjUvShNbJTA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qC7lk7d1dAen/aejK3xNxSaMJi2BoBLb2HUhmem2/KfSz17rk
	xPMAL2y8DmGxwSjZn+ORfC571pvGRwF9+9VIwjhHPazVxcrsa6KmvuYILzkjYLwsBCI=
X-Gm-Gg: AYBFou1OEiKd/WPG4gzzqI/sawdNH9Y+5sPOBb8fs8A5Uj0h96agNLZlRi2Y7D104V6
	9SZGlMFL0jaYuL6Hw4uU52eA0qaOlxd7QDlDrf//oFU3wexATvm8Bx0iHhFeBoPE58VlU/QfZCp
	pKx1FE7HdLAprf3wMI2s/FGYWho3sLPNHLmyKIqyzGQYvfls+fW79r5qmDE+R7TsinLLse7o1Aw
	2f5+IQx7vSz3yKISQ6k6KKMCqRHOYSjfY2mRrN2w9oljuGf2+6KkZOiHZDq52tFri4nPEas08Ax
	/K4RsvONH5ADgscgy9pfMcBNplOOZq7pDLpWZt5SsTHRVpmpQxv7q3VTwg1P86fXeUruyvCa0x0
	8t7iSX5+GZZVvPgwRUob8sbWbhqda9OkxrXCgkP6oWwkk3SM/6wwY7HSRZWxOmPN9z9PcZPq+m/
	ubj3doNHdIFdY9THMUSXnGyze6NnuoD5Vrt8gr8ov3DXEeQge09uuDYDGO/4fVYTmusUah+XXlN
	1BUU/K/gFxlsNaqStWCNxELNtP0vp3DxaNG7vqFCsSvkFf0vxp0U1vAklmCMN20r+V4lOcfl92A
	zzIRkJn/TI3PHRaZcw2UzPOJqTZWW1hvNIvp8XczqGtb046Wm6IR+qU1h2gMyubKDLBx6W46EpA
	KrQ==
X-Received: by 2002:a05:6000:402c:b0:48f:cb37:3ec3 with SMTP id ffacd0b85a97d-49c714a442emr9810855f8f.41.1794622799727;
        Fri, 13 Nov 2026 18:19:59 -0800 (PST)
Received: from ?IPV6:2a02:908:e843:f280:6cae:291b:a1:8362? ([2a02:908:e843:f280:6cae:291b:a1:8362])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c8d286480sm13284412f8f.7.2026.11.13.18.19.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 18:19:59 -0800 (PST)
Message-ID: <3c34d3e8-9dd2-4af3-abfe-16907f7c1287@gmail.com>
Date: Sat, 14 Nov 2026 03:20:01 +0100
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
Subject: Re: [PATCH] drm/panel-edp: add BOE NE160QDM-NX4 (0x0d25)
To: Doug Anderson <dianders@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261113214526.231324-1-ingo.kubbilun@gmail.com>
 <CAD=FV=V7uw9s3BttHn8uLjxD8mt5=3iYXA8cRzLU=OYFtS65Xw@mail.gmail.com>
Content-Language: en-US
From: "Ingo A. Kubbilun" <ingo.kubbilun@gmail.com>
In-Reply-To: <CAD=FV=V7uw9s3BttHn8uLjxD8mt5=3iYXA8cRzLU=OYFtS65Xw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Doug,

On Fri, Nov 13, 2026 at 1:45 PM Doug Anderson wrote:
 > Please follow conventions from recent changes to this file and include
 > the EDID in the commit message.

Will do in v2. For your information, the raw EDID is:

00 ff ff ff ff ff ff 00 09 e5 25 0d 00 00 00 00
17 22 01 04 a5 22 16 78 07 ed 85 a3 54 4c 9d 26
0b 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 a7 6d 00 a0 a0 40 78 60 30 20
36 00 58 d7 10 00 00 1a 00 00 00 fd 00 30 90 f8
f8 43 01 0a 20 20 20 20 20 20 00 00 00 fe 00 3d
4c 33 30 20 20 20 20 20 20 20 20 ff 00 00 00 fc
00 4e 45 31 36 30 51 44 4d 2d 4e 58 34 0a 01 0c

70 20 79 02 00 21 00 1d 7a 0d 66 08 00 0a 40 06
80 3d 7a 54 cc 24 9d 66 02 0b 02 35 54 40 5e 40
5e 00 44 12 78 22 00 14 99 47 0a 85 ff 09 9f 00
2f 00 1f 00 3f 06 77 00 02 00 05 00 2b 00 0c 27
00 30 8f 00 00 27 00 30 3b 00 00 2e 00 06 00 44
40 5e 40 5e 81 00 1e 72 1a 00 00 03 01 30 90 00
00 60 ff 60 ff 90 00 00 00 00 e3 05 04 00 e6 06
01 01 60 60 ff 00 00 00 00 00 00 00 00 00 2c 90

 > Please also provide more details about how your AI agent analyzed the
 > ACPI tables. Did it use the ACPI tables to determine the delays to use
 > here? […] or did the AI agent just look at the delays of similar panels?

The delays were not derived from the ACPI tables. I wrote this entry
myself and picked delay_200_500_e80 because other BOE NE1xx panels in
panel-edp use it; it has worked reliably across many cold boots.
I'm working with this machine on a daily basis for two weeks now without
any problems.
Only afterwards did the AI check the ACPI tables: their panel 
configuration is a generic one ("Panel_Generic_Amoled", backlight PWM 
settings only) with no power-sequencing data. There is no datasheet 
available to me.

The AI disclosure in the commit message was a generic text applied to
the whole series and overstated its role for this patch. Sorry for
that; v2 will describe it accurately.

Cheers,
Ingo
