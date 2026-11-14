Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794656771;
	b=nFOgMr4i9y12BYGtkujthg0zOBDOSQohcHjGNPXhZ7P7ztgRksXUXoVPpa3fDrS7SAdT
	 myQnHEclY7xWwTKQL7G7QUlFkSiHeJ9mga2edjJ+Ex52SN+/FxZYuPL/Fbo9RksJnk0nW
	 Drh8BaCj0W6mZ70Fa79C1K3jqw3vqAmvWVUIJBUcP3QnYaKuf0hx9DTkeiX1hjrAp8iUl
	 57zwq6RZPJinlN6snCTna3nCd30cqT0VuxTS/Ul3aEjF4OgvjuTRBK2QGCMqFBoMCYVXK
	 ovzWTt9VGmbBBvw8G42F53RYVjfhvmgm/OXRFcQ3eWlHNL/m9fBIw3HqMUkrdvD1C/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794656771;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=B4NU0BpLyAV5nllaLWBDbSDu81GYxf/Fluw3zwxoBZs=;
	b=bHMEl+70iEEiQrSM1lRJyVzMlTm2aBTK97mFhp4kMb8DxtULhQMdrSpmFHrjin0nGmwG
	 zMFwXp9ioPwfeddG6SSSC1qsS2mItuXT5YHrPk0PfE2oYkc6uRJgzdQpDpRw1nLNhBo57
	 /7Wdy0/VOqW9muMZdTIUuDRjXX56lyupeEoiDMmCkfM9na25wP/qbquhw9R7hwpv0Hp6c
	 KZWVeasmehL5lJ2LS1P3mUeG0Td+AhF38uWA25yE8MnkmcywKTw4nBkw+K7T4LK4/jkZz
	 nWd4AyBvi7G9GkSpnF7jg92c1JiwywMKKVbXwsTyv1xmF8hds5kYI71LrTSMAvHEAwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aLx5j1yZ;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81478606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:46:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81478606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aLx5j1yZ
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-15ea896ddc8so2638333c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794656770; x=1795261570; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B4NU0BpLyAV5nllaLWBDbSDu81GYxf/Fluw3zwxoBZs=;
        b=aLx5j1yZ6yuv6BLbHMhLPmI5U2QU+S/8xnWAx70i/HAqa96IXU3/jGcZ8Bn1hBYSgM
         RKRitgQd4X2NpyE/U+ZcWHqETIs3IG9mPge/ZnYdvbBIZ0wAzQvTer6RLYs/RtIJk/pQ
         I7ZpKFJW7qN3uEQ34E9YLTdG/ZDYrohw1ROwq6rZu5/PzVtfWpX8ERkyx35U7Ya6ldYP
         3iUhdVh/OairVsJAOfO2C5UnDCOQI1FmL4hwypMTnSHpLeJbjaBe9K316ASBIPT/8nFS
         a2AhQsK9M13YpHKDdHBvE7X6wHV3mAZo0zpAxZwpgcyuOwEjhZSVUDzHwpiLDoEtML88
         EAXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794656770; x=1795261570;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B4NU0BpLyAV5nllaLWBDbSDu81GYxf/Fluw3zwxoBZs=;
        b=D1IoIiF0cCWf7SXHrJyRZNZl/N2RD52XC65yQdqrXDGfueobFrFEpkah5IllC2RUNg
         LmpTFMO1Hwp6JvDabYunXrOzr9pABQgzKfI5OJOHyo+KFBKNW8o9f5nU0tXpCmlEy6uk
         mVfeAIAozGttYkNBY+UUt7Uh1SPSyaIy05dxA/HdSDuMGLFeyYLfFzbbMOzFxJe7Dc57
         WwHPEr7wQbL2nxYKlpnCDxKjCeiNGDnEtMAnRkPOk4Pqca6bRR1BwQuZH5+Pm7Yjvklj
         Y3+PSJlK1uFh7KQgNY3g4G85vgF6vRe42WE5yA2IOfP6SDyfzSz4l8Jpn1bq3SwuLsKV
         EiUg==
X-Forwarded-Encrypted: i=1; AL+hErHkdp/oUjaLmiXh0P7tKJeQrgCxk7fpPtQh6Lvv8GZx3pu5OQsHRpCpJ9gTgudh/+n4GuT/NMN6iMFYMpU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tPpQBPXj0qS74rmW9gHflgFWiTtX+AeQruGGJ1rbuhwhCwKgA
	y3PwGveCr3wXYuYSM9a3LJ+AQLiVasuNU0p//EeIQ/C6JM5QXTYreVZB
X-Gm-Gg: AYBFou373DfszPL3gPAU0akkUHVRTEG+7CNKU2KtaRyWQ+WsySoyBgetQmohxpiJ46S
	rb+eUy9H+HiLtdTgRnwmwueA1jngbAql8VhL9o9fftThSr0yypkg9FwXB25Vj7GI4VBb/7+L/KT
	yYV2JQa70EkEcVz6o8bc/FguUTdU1oA/u6oMzKh/IkLZWLeeA+qpNi8dwEUpugSIdj/wr3hmPpi
	gqXuAyFzVVnprvd8SF5JM2i8yzhMFlEyBl8ZpN4sYTLDV/X7/U/XPKbWWBzzolsNAydMvV6Mgnd
	Jor+f1/slZSHqaGu7Q197RaoVmM4NurRXCLpqS2dlXF0nyvDbu7X+FDh4F+XC36B04iSEMfUNov
	Z7yulbJGm28xMDw73tbdqXI21NaYmUgF/8KvaeTq8Nq9TlrFD0bKZkg7QukB/nfn3y33AoOW+0l
	IdPQqhht6j7OvmWCiX7l5BL0Pmlc3/kG8VHY2h31iZfiHNGgI09XsKjIB2DrMQ6nyM2bl36oaVy
	9IQDm0m2vKESCAu7BIOz5VN5QKprCgCOa3cAHmK8lkB8bARmzK7YrF53orHH4zBBW7/HXMHEIi8
	fiKq5LP0jx9E7+P1NXVLq3Mmtyav4SHglroVKg7cMtb7uCwpcFO5p7J4BGAKKccgLSnfwiV0rFT
	FAhTJiolk4VeSBQ==
X-Received: by 2002:a05:693c:66d5:20b0:368:4acb:f8a with SMTP id 5a478bee46e88-37966e3b866mr4963235eec.17.1794656770411;
        Sat, 14 Nov 2026 03:46:10 -0800 (PST)
Received: from [192.168.35.40] ([218.50.238.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332a77sm14342627eec.4.2026.11.14.03.46.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 03:46:09 -0800 (PST)
Message-ID: <d478d782-38b8-492f-9821-ee3e0f7b056e@gmail.com>
Date: Sat, 14 Nov 2026 20:46:06 +0900
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
Subject: Re: [PATCH] PM / devfreq: Do not change the frequency of a suspended
 device
Content-Language: ko
To: Arun Iyengar <aiyengar1990@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Jonas Karlman <jonas@kwiboo.se>
References: <20261112-devfreq-suspend-sync-v1-1-af64603ef43e@gmail.com>
 <179460206763.199714.13518791714665074913@gmail.com>
From: Choi Chanwoo <cwchoi00@gmail.com>
In-Reply-To: <179460206763.199714.13518791714665074913@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/14/2026 5:34 AM, Arun Iyengar wrote:
> Please don't apply this version. The Sashiko review found bugs in it:
> 
> - A limit change on a suspended passive device stores 0 in
>   pending_freq, so devfreq_resume_device() can then fail with -EINVAL.
> - After a deferred update, resume asks the governor instead of
>   restoring resume_freq, so a userspace governor without set_freq
>   stays at the suspend OPP.
> - Two error paths leave the device marked suspended or skip
>   DEVFREQ_GOV_RESUME.
> - The passive question in the cover: exynos-bus children need to
>   follow their parent to its suspend OPP, also at shutdown.
> 
> v2 will fix these.
> 
> Arun

OK. I'll wait v2.

Best Regards,
Chanwoo Choi
