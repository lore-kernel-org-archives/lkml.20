Received: from mail-ed2-f32.google.com (mail-ed2-f32.google.com [74.125.228.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980611E5B88
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 21:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791149799; cv=none; b=N0wJVu1Mv7F8G5RDTg1ajMQzetuK/Rn/PaXwwg5214UvotkIuE+OyvsLV5RJnAMG9treE8a0h3q6HrkvDw5V8sl6gdzYbID4RW6tduN9oKzQAAgZhRq9T64qPkRS4XqNt5BTjwCgoY/ncq/Gth4tFDlV60qb6Qsfaz0FsltZDY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791149799; c=relaxed/simple;
	bh=isfTBrqY9p5m/ED+4flN0cts6u/U4CK8ScTtSCqlZ1E=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=XkxORd8ePTMsILRxMKgeENKx+0Z+cHZyBsoUzuyRQdLY0kjy1JQj6yr/hbmbJ0uH7SYNaPqnSsH+cWfYyqxUTFVulXGgCL/887ovD2PDIfFsplus+L4Mq0nynf8kb9S8KmEDscPvXlSFSJt0jUvurS/WLljLfBZ0+O4HcgTF72M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ATbYxx61; arc=none smtp.client-ip=74.125.228.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ATbYxx61"
Received: by mail-ed2-f32.google.com with SMTP id 4fb4d7f45d1cf-6acb8b78d6cso1556495a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 14:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791149796; x=1791754596; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Qs/HNAMN3+qC8yepsmEsO4vU7YCCa/bUjxjtXFFHYg=;
        b=ATbYxx61nHcJSRT5Glr+PNxHZZREoLXxOlIICME0sYSyPjmh280SWtvvqsd73BKNe6
         UV2IT/l1zJj8/B1V6lBF18bRpo/BuHVmN1lZfRxmGupgbsXwZIOBV9wEHHZeQfyVJ1T7
         NtvDO1M84zAAUQ7d6RP5pmuJGzZh9aNCi0r4EmOqu5ZA02xwzC5twpejgK+KPx0OXqM3
         jgNGkG4bsT+sx7khkHkamiF08GRF8PUS0NPhEA9NUZkYWUiNKkfeOuPENeHKSNyusniX
         VY7f+nggs7AxuSQt0egaKfDjI2nsDJp4PeXPuP2F7m6S0f+BbfHozXHMmN6c3LuzjDYh
         Qseg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791149796; x=1791754596;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1Qs/HNAMN3+qC8yepsmEsO4vU7YCCa/bUjxjtXFFHYg=;
        b=ummSHdgDUyw6n9aL0Jj0vhyo9il25RD+emm3JUhxERTwhL37JOrkvfFeXqkw3T+TTk
         bu8CJ8Wzwr7zVdWLeMpf+KriKo5GUanq9BslQVMZAAsIVDIdBRngtW2em3AN6HyVSe3h
         wMcvPrE+EYL1iGJpT3A+oKbAlA34WqfQgVlhhpuxfwz8Wy1CSZ7DkENs5m+SLQ6spBRs
         xd+HkVWXawKt6FxgtFmx9P1ZEaaTgvOWezfyyWraJLPfsgkQpm2lZtPZOTkSpAWAEJz+
         F2d5+0fslmz6Khc8d+7ziIVN4Z9a6ipITr3GZETU3a1MSf8m9scgmEGWdjBoqHXkDoVN
         DsNg==
X-Forwarded-Encrypted: i=1; AKwUvByJchIF/gYr+n+vrDvsIKz6XyUjpFhWeVis0GQQqvkAe+CjE8NWaSKf22SEHjs6vl/kDkiUxUsSFZCL9VE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKv7zeeUzqIOUAADrigssLxNKJLUXjNXPgqnHYnW3ttXpu9xgWT
	BnygdVbkuEzx0lbX+xaI1Q1Q+HWZEXf+aHTNmhpgFhD1yqb2l3udd8XR
X-Gm-Gg: AYBFou1gDOCyseVZLqABEl1LFyjOsCNj04iUIueVSH+ZP70qx0v7CSy1VQJcT1rs1tt
	4ujUe3m42AeMueXffiQlLQOUkvhGuqBOS3DEfZ7VwdpilJTBOG2oRxxENgQI7ATrvfi0ubNYU0L
	NV76xS717rjzCrq34F3ELjYXIQhLJTJ3dHYnuRlPrQFMLEzPFhgS0Bnjl636zuUkPQ/UNmizhwO
	bTeacXwTBKWb7ChaTrunz7W/+k92It2LbddRntBYvlJqlcK+dFYGxpnVsOpjsOgXp9uKxMyrhOz
	P6qzNdtSHFa6YOrctFwXCXu8ioS/91ar+SuquhI9FoP1mSYeLZaUyrV3awO1z8ShxZRVpvEObQl
	pXRuNYpvCTVYom5VeUnXgMqbxP6zLG5v8wUVsRrjLyaSEUFFKI1e5SLTtjXX7Z5Kj4BP0Uptswb
	I0uo+qjbafhRE4qbYn0sU0ylwBu7FHWeWXLTG2LIl35mnDrrcTGayVheC4K5u80s4a8gsjTN28y
	rUC5G0=
X-Received: by 2002:a05:6402:5486:b0:6aa:915a:f51e with SMTP id 4fb4d7f45d1cf-6af9e2e11a3mr6565114a12.17.1791149795652;
        Sun, 04 Oct 2026 14:36:35 -0700 (PDT)
Received: from localhost ([46.205.201.71])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb01e59cesm2457040a12.12.2026.10.04.14.36.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Oct 2026 14:36:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 04 Oct 2026 23:36:33 +0200
Message-Id: <DLWDLZK1ZVOJ.G23QIUQTEMEC@gmail.com>
Subject: Re: [PATCH v2 3/5] Input: hynitron-cst816x: release gesture keys
From: "Oleh Kuzhylnyi" <kuzhylol@gmail.com>
To: "Daniel Golle" <daniel@makrotopia.org>, "Dmitry Torokhov"
 <dmitry.torokhov@gmail.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Hendrik Noack" <hendrik-noack@gmx.de>, "Arnd Bergmann" <arnd@arndb.de>,
 "Ferass El Hafidi" <funderscore@postmarketos.org>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.17.0
References: <cover.1790944534.git.daniel@makrotopia.org>
 <7199967eb45b1c3adcb7efc859380f6f3dbf7bdd.1790944534.git.daniel@makrotopia.org>
In-Reply-To: <7199967eb45b1c3adcb7efc859380f6f3dbf7bdd.1790944534.git.daniel@makrotopia.org>

On Fri Oct 2, 2026 at 2:47 PM CEST, Daniel Golle wrote:
> The gesture key is reported with the value of the touch flag, so it
> stays pressed once the controller stops reporting the gesture code
> while the finger is still down. Report the press on its own and
> release the keys the input core still holds down on the first report
> that carries no gesture code. Keycodes above KEY_MAX are rejected,
> as that release looks the key state up in the input core's key bitmap.
>
> Fixes: c87a819bec86 ("Input: add driver for Hynitron CST816x series")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
> v2:
> - reject keycodes above KEY_MAX and publish keycodemax only once the
>   whole array validates (Sashiko AI review)
>
>  static irqreturn_t cst816x_irq_cb(int irq, void *cookie)
>  {
>  	struct cst816x_priv *priv =3D cookie;
> @@ -181,8 +205,9 @@ static irqreturn_t cst816x_irq_cb(int irq, void *cook=
ie)
> =20
>  	if (tch.gest)
>  		input_report_key(priv->input,
> -				 priv->keycode[cst816x_gest_idx(tch.gest)],
> -				 tch.active);
> +				 priv->keycode[cst816x_gest_idx(tch.gest)], 1);

Tested on CST816S setup, found out a subtle issue: cst816x_gest_idx() maps =
unhandled
single-click (0x05) and long-press (0x0C) gestures to index 4.

Input subsystem ignores SINGLE_TOUCH (code 0x5) events with tch.active =3D=
=3D 0 (t: 0).
Instead, reporting index 4 (single-click 0x05 minus 1) with tch.active =3D=
=3D 1 falls into BTN_TOOL_TRIPLETAP linux,keycodes element.

As a result every single touch accompanied by BTN_TOOL_TRIPLETAP:
Event: time 1791148663.331439, type 3 (EV_ABS), code 0 (ABS_X), value 117
Event: time 1791148663.331439, type 3 (EV_ABS), code 1 (ABS_Y), value 124
Event: time 1791148663.331439, type 1 (EV_KEY), code 334 (BTN_TOOL_TRIPLETA=
P), value 0
Event: time 1791148663.331439, type 1 (EV_KEY), code 330 (BTN_TOUCH), value=
 1
Event: time 1791148663.331439, -------------- SYN_REPORT ------------
Event: time 1791148663.397477, type 1 (EV_KEY), code 330 (BTN_TOUCH), value=
 0
Event: time 1791148663.397477, -------------- SYN_REPORT ------------
Event: time 1791148663.409413, type 1 (EV_KEY), code 334 (BTN_TOOL_TRIPLETA=
P), value 1
Event: time 1791148663.409413, -------------- SYN_REPORT ------------

Interrupts:
cst816x 1-0015: x: 127, y: 124, t: 0, g: 0x5 // Finger down (index 4, tch.a=
ctive =3D=3D 1)
cst816x 1-0015: x: 117, y: 124, t: 1, g: 0x0
cst816x 1-0015: x: 117, y: 124, t: 1, g: 0x0
cst816x 1-0015: x: 117, y: 124, t: 0, g: 0x0
cst816x 1-0015: x: 117, y: 124, t: 0, g: 0x5 // Finged up (index 4, tch.act=
ive =3D=3D 1)

I suggest either gate the gesture branch on tch.active so a finger-up
single-click never fires a key, or fix cst816x_gest_idx() to map 0x5/0xC
to their own valid slots so they stop aliasing the TRIPLETAP keycode.

Best regards,
Oleh Kuzhylnyi

> +	else
> +		cst816x_release_keys(priv);
> =20
>  	input_report_key(priv->input, BTN_TOUCH, tch.active);
> =20

