Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E90B493D4F
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792397349; cv=none; b=LLSL5pyM1pddJlo9MIpYu4R+lLODy/btuCa4Zp2nm7HkDd3nE23IHd7i8oLcYk5X/1CkjtQFcS9S+2KJWKWdvRNj1QrkSGUhHbLN90ipnGlLIDZKh8AzET1++3WIZZ4++Hb+g+5a8CbRQ/Xs+X9+jxxglGepEKkaf14L89zgUgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792397349; c=relaxed/simple;
	bh=dtESdVNm5Uyq+WsB5q7A+flDEcFfp0XndOYr6KOo+Nw=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=gNAN+XeKZyfEUWns0dhp0u1lLsexmHPrqxpQlKtQwzikmXDWPlcMfqsyxEyAl2onPjaCtLxSnRFc2hQSs+aitxn+NzkvL1qrl5lokQQicCJF5cFPGnXiJ4z8K0H3NccU2JRJYC5iHb+XrMpggItSKsduE01+ZEjxfvEoGTMP6/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IOgMhH3E; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IOgMhH3E"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e946155442so14523075ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 01:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792397348; x=1793002148; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VGbRH8whTW1xe91pmC1KbquILe+PEXcyh5kpYwROQW0=;
        b=IOgMhH3EfLXdWxcQQJIFZ8NM90N3VshgbCyEgrwaEhGWyRD9TQjljb0tDqVdq+YccC
         p63fvhb9ypUkmot45JO0QjatKdEoUfEa7ddZPIL3q+klSRG39Hz082zIcmxPmOypSzyd
         gHisylMloMXHa7XAT4a1y93Pqw+lbghZ6C3jflzurHFaSA5Jt7Alv2JYPc/xEt0DFW/b
         IJTxf71FsQ4kh228sJ4JB/ivh/fbZrayzSOBpyauNiZWvOEaVfXBTDJA2eDYF0wYeuVU
         FDNXeuPqMQVQHrecREF2GJckOi5Zvl0VlEjGnSPRXA0xX0JLNdqT9pA9K74WUc8PjvfR
         tdUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792397348; x=1793002148;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VGbRH8whTW1xe91pmC1KbquILe+PEXcyh5kpYwROQW0=;
        b=K13jWAmJlFsEyRVgimgNGgrwB1GUsS/8c0H+joZ5WBNAv8b8zmuiKXnKjrzlZXfT/x
         upyLOB4eDHxLJEpGJ9yizeFxKKJlHWtLQHiphuIiI93OVw7f7NX3mQMH43SJqcSGfYo/
         nm5kHK2xaRhMKRg4znE4OQL1ODnhPAeUVDl8dY/SRjNfB6uRPOgsAudhtRVuNx/5hk69
         B3RvWxY0rUtuInaR1nFP7yCOs8okOur1d5mAQVFK7BKKoPntiOJN6ezxl9+jMKZmN48X
         oyMPIE5IUKWJR0DZ7lTW0Qrj0FVK4dl5C1jn6zgfCnoaCLDGqjr5EYaLwmlaAOkbcwQo
         jnsw==
X-Forwarded-Encrypted: i=1; AKwUvBzQWxWmOGF7MNZJOF4L+r0yXLVMscudKVkvjxVkYMxRE/rMxoAzm63MDrVFfeT/VnA4MxodeojnR0fTaAA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIEZ+sU6dZKC2FHqTRTZ6GQpGYmN878CyB3EWGVbKj0NtJEdcmN
	iITPKfEza+IurKaJzb+b9UNlQtCXAL9D5NEE2IVFb6cbxNXGr44CAw+xU62rJvkG
X-Gm-Gg: AYBFou2SPF7OydsaelI4i0gmdwMlD9RqPlErdvyAY1Pis/gG3NTKGHRC2aETO+XY/C6
	cq1a/Jqgq6ioZW4C3CKpa02vgcMfbVSzn2DGIyGpCfsM/bAH2DWbG5zrSrTZbdfaJtUHdKf6PSK
	k0IhPBvOFKvHNXSI0JvVGXtgFA2g+rhlGT3pZbFYvAuZbuv9sq6npyP0p0tFMlihzhJRsjzU+bD
	ovb4REMNsl6HGRTIEwv0OGh8FKhDMGOAAxm+F1yvnqnG9+IKqpDHGzuYiJDRfa1zwHFnBzw6nrs
	+e7MEd6tanLO5UNSwpXg98U9B4CXAGkVwBNGj8x4J4w76Z1d6mkaug1CPoiFDscvTWnVafbV40p
	QRzQsF+CgnpOGaDEkHa2qkXdga8ccG3LvNmzwT97MhSLagReqiuwi3XPm+bbzV9hxbq/661NQGh
	imYt9KQFRg6rbhuc3Oo2KRl0GDaMR9huN0Y6oq2yUkwdKFLimGQ/ueGATe/wIrkWD1JSVV+ZMTg
	BJ8QIZTtYO1rWkHDeouUAi7lTTMPcyd8MY8PdCdizvAXsQ5tbq3nEUo8TE3lguWTwUtVyDOGQ0W
	mxATwt1MX+jcL5NXVTmPBptRBfyA9P75+wQzMTKbrpuSJqXV
X-Received: by 2002:a17:902:d4c9:b0:2e9:66c4:1717 with SMTP id d9443c01a7336-2e9a735f740mr54440775ad.61.1792397347649;
        Mon, 19 Oct 2026 01:09:07 -0700 (PDT)
Received: from localhost ([2601:644:8000:7a86::d63])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e833f1asm35236695ad.43.2026.10.19.01.09.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 01:09:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Oct 2026 01:09:05 -0700
Message-Id: <DM8NTXCWM1GK.AA1YGD7D8E60@gmail.com>
To: "Bartosz Golaszewski" <brgl@kernel.org>, "Rosen Penev"
 <rosenp@gmail.com>
Cc: "Linus Walleij" <linusw@kernel.org>, "Thomas Petazzoni"
 <thomas.petazzoni@free-electrons.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "open list" <linux-kernel@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v4] gpio: mvebu: fix Armada XP per-CPU mask register
 save/restore
From: "Rosen Penev" <rosenp@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261018230117.23497-1-rosenp@gmail.com>
 <CAMRc=MeUt=dwZUybCx=JUvDs9ZWa8Zyg6DzJy_bxwzn_k=RgFA@mail.gmail.com>
In-Reply-To: <CAMRc=MeUt=dwZUybCx=JUvDs9ZWa8Zyg6DzJy_bxwzn_k=RgFA@mail.gmail.com>

On Mon Oct 19, 2026 at 12:59 AM PDT, Bartosz Golaszewski wrote:
> On Mon, 19 Oct 2026 01:01:17 +0200, Rosen Penev <rosenp@gmail.com> said:
>> The Armada XP variant keeps the per-CPU edge/level mask registers in a
>> second I/O window (percpu_regs) rather than in the main GPIO window.
>> The suspend and resume paths however read and wrote them through
>> mvchip->regs with the per-CPU offsets, which hits the global
>> GPIO_EDGE_MASK / GPIO_LEVEL_MASK registers instead. Per-CPU mask state
>> was therefore lost across suspend/resume, so a level line could end up
>> unmasked behind genirq's back and trigger an interrupt storm once
>> interrupts are re-enabled.
>>
>> Use mvchip->percpu_regs for the Armada XP per-CPU mask registers in
>> both the suspend save and the resume restore paths, matching the
>> mask/unmask handlers and the probe-time masking.
>>
>> Fixes: b5b7b487431b ("gpio: mvebu: add suspend/resume support")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
>> ---
>>  v4: rebase again
>>  v3: rebase again
>>  v2: rebase
>
> Are you rebasing it on top of the gpio/for-next branch of the GPIO git tr=
ee
> as indicated in MAINTAINERS? Because this still fails to apply. :(
I cloned it, yes.
>
> Bart


