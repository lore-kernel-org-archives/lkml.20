Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7673C13E3
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791831514; cv=none; b=XxcMAVOMLv06yaxlxNGMoyLrSR7Ud5SmSvXA3ekMEqIUkZXVIYwmK65KX72F728Wa1lEDQILLWXsDFYB/OrNXcrF8JaiGafgieCV2YhotVCJszqwXCRxvbaRbCN58NRymblOckKnExl/ElCleVfLPOlpqoyNUJqRIw+ENJJmgEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791831514; c=relaxed/simple;
	bh=NBSMnbPM1W36hu/yHVHtW29ZlumpRPrEdi13YOl8g8g=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=IK18osM6zpnHwsW4Uoyfgv4POyKifQ8pGkfQ65918NMd4keFNKaIU+bWgiPL0x79Jv+DJf3TbHcmiI6rDOeI6ZGxg2O8faZJeA/Z3VP7asCmijLpoxy7+V8tOpORT4j/Nm4jVOBmEV/BrlGJ26fASmgmw8OVFhSqcoe6LOiUZwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TgTJFtvg; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TgTJFtvg"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c3156e7705cso355743566b.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791831511; x=1792436311; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CEpxS2BqSJXJl5+I6AvkY7ywhTC6yC4LVyF9hL1MSqo=;
        b=TgTJFtvgl3933XLabcoNzo57A2oyy0ZPYzrFZY85SskmoE8/AuClWWQr7xKRW5Hq1w
         XORCAmTl/Ftc3yr1uwv7YMLzbDcHm17aKMbSqOjs85rOby+252ZVkFEx8nBP06QXPJPA
         Kc4guISjtpB4PCEQQjZ0amZ/WjG7VeeM/SpkKTxc718mqEEJSfxo1ZZPYN8n+JyAtE9R
         ntTXrCf1DfIhjdSMFMoYCbEC8Egub3NDIifUUYE6eS0wferEGotXUotwNpya2HRA5k8G
         l9niSDbxX5dM4n1O8PmWvVBzbm0lgKFLNraeb2lLQSoc3Hb5vGQbAgMy1Jadw/yqM676
         O6/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791831511; x=1792436311;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CEpxS2BqSJXJl5+I6AvkY7ywhTC6yC4LVyF9hL1MSqo=;
        b=XM0QiysK/3Mc5ltV214hrLMFM3DAcRdFaCcLwgsaggFBHlzaY6hb87ZZjkQ/KBRYjm
         lzMaw88qdgflnhFr/SLFM4R7AwKdLsCmvXLj2ge2yblWpYJym029blmgSqeHWhZxZr6P
         UqlvAERR5gDPOJmfZz/B6jYHffFWhXdZkTpsFJ2cmwUwEJHfN/VMRggijTIwKqTkHZNC
         EDFhAw7ADyuYHuEQsZq/pJf5pFP+jewwCLZqb10wwh8qQJPiW4ZUheV9Nz+EyAc8cgBA
         yddG1nH+Ndq9LsJkevd/U/IAnbZEu/gVVUADts37mby70AbRfL6v3u8a1OwWZw+Q9x7S
         iSlw==
X-Forwarded-Encrypted: i=1; AKwUvBxqiMCnMbqqH1PWkcCeKx1e6H2jPpy44CXAWHLwnPry3/v86ajK5N08IKizYJeFohlX/x7Kfjmtn0uwYQU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIExcrQ8mOYJMIz3XwB+ljQBjvng+I0/hFanuseOxyEC7W6n/f4
	MSb+LVLhEEeqapmLeUq/esz0rBomgRYhbQAxCP6TypNtc+kGfbM8OEJw
X-Gm-Gg: AYBFou0+Np1yS4WrhPHYYlYi0X6pnN/Ahyx3G4tRN3+V+dgC20Jt6dR5r2nE55FFTrI
	pg7YGt91zPdAETDK8OaaqXoeEa2KWrBtNzHCm+WYBQMB+E9ZF72nHMN/+bbqvxV6sSKVuUB2DfM
	DU46V96VuMMa2TnWyuQSabs3nMD/BihNBS8Zo/lxQyfUoNewaqRoEdwwas8pAkUTa4Pzfs5+kp+
	H+LH3r29iS3nnXx3pV+LRoS++0MR5mUcDcf7X50iEUkE4K0EodlHRz5vW/qJPTPiGdmVwS460N5
	PISHkqeGCt6f0vS+YwJxen90ZaVpdi0YMePcmjkUkzCdXK2MLxdHEZJ76OhkOGVrX7vsXITHfn8
	M0a0WOJOTS+TkL+R1CJ6do4rgt2C7GIZba9v7ZAXe+05SZ1z0MVyvRXPmdmgY2CjhcGcpj2rK9E
	Ktx0CigcfuAmaVYbZumNDknI1jFtdGwyTGc3DDfXU1VtFQNlvXoMtJBNJpybryVxEQ
X-Received: by 2002:a17:906:4786:b0:c2e:513a:e964 with SMTP id a640c23a62f3a-c31aa0e1b8emr1079340166b.49.1791831510652;
        Mon, 12 Oct 2026 11:58:30 -0700 (PDT)
Received: from localhost ([46.205.201.71])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ae4a94sm499682466b.82.2026.10.12.11.58.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 11:58:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Oct 2026 20:58:28 +0200
Message-Id: <DM339BDR8JE2.1FJ5827JZIBWD@gmail.com>
Subject: Re: [PATCH v4 4/5] Input: hynitron-cst816x: time out gesture key
 release
From: "Oleh Kuzhylnyi" <kuzhylol@gmail.com>
To: "Daniel Golle" <daniel@makrotopia.org>, "Dmitry Torokhov"
 <dmitry.torokhov@gmail.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.17.0
References: <cover.1791233147.git.daniel@makrotopia.org>
 <d73d26d8c9d75fa230e3dd64058acb65f45da64d.1791233147.git.daniel@makrotopia.org>
In-Reply-To: <d73d26d8c9d75fa230e3dd64058acb65f45da64d.1791233147.git.daniel@makrotopia.org>

On Mon Oct 5, 2026 at 11:12 PM CEST, Daniel Golle wrote:
> The controller reports a gesture code once and can then stay quiet
> until the next touch, which leaves the gesture key pressed for as long
> as the panel is left alone. Release the gesture keys 40 ms after the
> last report that carried a gesture code, so that the release comes
> from whichever happens first, the timeout or a report without a
> gesture code. The 40 ms matches TSC200X_PENUP_TIME_MS, chosen there
> for the same want of a lift event from the controller, and has to stay
> above the interval between consecutive reports of a held gesture.
>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
> v4: follow the keycode lookup and the single read of patch 3
> v3: use timer_shutdown_sync() in the devres teardown action
>     (Sashiko AI review)
> v2: skip the release when the interrupt handler re-armed the timer
>     while the timer callback waited for the lock (Sashiko AI review)
>
>  drivers/input/touchscreen/hynitron-cst816x.c | 52 ++++++++++++++++++--
>  1 file changed, 49 insertions(+), 3 deletions(-)
>

Tested on Raspberry Pi 4B with CST816S panel.
Reported coordinates and gestures are valid.

Thank you!

Tested-by: Oleh Kuzhylnyi <kuzhylol@gmail.com>

Best regards,
Oleh Kuzhylnyi
