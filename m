Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870618;
	b=sR30ODG2Ozwmj6c8SbLCSzmfwG2NrW0VtFluYVNwy9Vrtx5ye6ha4QEbXgv+lgiq3beT
	 AKLOz1PTQSKdgbJPRoQt4XMBAtWMcOpD6ahnpxybkGEGXFJL/EE9pSw92PXfoV0hGmHJt
	 Oul+bpHlDhtw8JEmqUtehH8W1Y+O7zAPzQg5EkgmpNPJIoAzNCXRFuE0Lpu5etkdGItlQ
	 Z4B1k9gJrag+gipJzQ263X90QuheO4j0DAYAbF8UwXxdpttjXrkqISXs66nedW1BAJG7e
	 T3KMwxm7zTD0eW9/Ju7boHyPoGDg45rDuD00mxNGfjaT21AawdcvkGB4ZtEUOFzhR5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870618;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CaE2mbFJFf4TOWhow4uSx7nxUZ40EeB+lDQEpmH/lWU=;
	b=Vzqa+oWGx3SnrvQhtFr1xfOwkU4MHGvfADBBF54VbGr07JBMrY9A0gQWkTeSnKCuwVhF
	 pXDWIIw16PZfyGEt7e7odx2un/5U+RKINsSGRI2WHsEmLsgi+wXIxBNPLvCmLsz7u/hQO
	 63ZFw9r+dYcKlfpFDhPx2uux35Cvs+wDbitjaygz2I1ow3oRE0Um09muQCo1heaIJtImy
	 blYKvEuh5MKN1XRlBNKCK0ZkEUjElOOTn7QdP7SKBxGIhvAOfx33jWLDhC0zv7rB3aTsT
	 w96ZfdeLA+aL7dtcBTx6dlXoz1vLvE9uY/ZnROp2V6Xxa6uRkLvie1xZYFkNJgIj5nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QoPNTswb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D40D606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QoPNTswb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A4BF1F00A15
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793870616;
	bh=CaE2mbFJFf4TOWhow4uSx7nxUZ40EeB+lDQEpmH/lWU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QoPNTswbHPNPpf4zeVgFUvtTHoQEKatEp/uqswizvYnP0CXc3ernxUdwm5dzS9oh7
	 UKKn3CE3YDjRjNcXffvCfJMD/8p86nUrbO+Wrk5QdJrWT4u7t213s0pv5Iad7QedZY
	 lGsPfOcLS7d3H5Dn8C9wD6/2yx45/sND3bAtOxbFWfREXtdx6UNxKQxUNvfkpEO0AX
	 1tzw8fHsl3br38ekbwPhQnHVYuskaccJcKVHZGDcowXd1rscGSlwg4DI6EJ2noOq7C
	 3f7v5jn7xkSA3p1avYdYOb/UY4/nJp38MZ2q9wYWyUqM1EE0AU1YP0HP25DHobaaXS
	 RdkMlklfVZXqQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5ba3ec92031so1950825e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 01:23:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwptRnsv2BJtVx6Iwt/7CPvdX1hMAdh1vj8ZHfi/jq9ljJiYlF56MpL7Zq6b46ZlUaXyRtvbaqNugrWD/w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JxTVqMmOtGmNQkij4IPipASO1eUyw3iNmddoWhaSGRQBsCdtj
	PUYAmhmxSYuwm8giGAbaqZCRAi/jdckVJQbSWOrLv92mO6qXPwSO2epusVTykjC296S7dHAqWds
	k4wjiSL4VHHDPxELZpBYr2VNYpCteRag=
X-Received: by 2002:a05:6512:1318:b0:5be:516e:5728 with SMTP id
 2adb3069b0e04-5bfd958027fmr6146113e87.32.1793870615446; Thu, 05 Nov 2026
 01:23:35 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103213002.1673560-1-lee@kernel.org> <20261103213002.1673560-6-lee@kernel.org>
In-Reply-To: <20261103213002.1673560-6-lee@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 10:23:23 +0100
X-Gmail-Original-Message-ID: <CAD++jLmC9k6hpkZtcRUgJRj6rk_knjAQ9cOHitRDBn1FbAgZPQ@mail.gmail.com>
X-Gm-Features: AclHuK89aMeIOVygFGusGSM_QZnZVjoeLN0D3bDiQpEYrRyvGRiPkF-dM-Czu94
Message-ID: <CAD++jLmC9k6hpkZtcRUgJRj6rk_knjAQ9cOHitRDBn1FbAgZPQ@mail.gmail.com>
Subject: Re: [PATCH 05/10] pinctrl: realtek: Prevent out-of-bounds access in rtd_pinctrl_find_config()
To: Lee Jones <lee@kernel.org>
Cc: James Tai <james.tai@realtek.com>, Yu-Chun Lin <eleanor.lin@realtek.com>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.com>, 
	Tzuyi Chang <tychang@realtek.com>, linux-arm-kernel@lists.infradead.org, 
	linux-realtek-soc@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 10:30=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:

> Several Realtek SoC pin configuration tables (such as rtd1319d_iso_config=
s,
> rtd1619b_iso_configs, and the rtd1625 config tables) omit trailing pins
> that do not support pin configuration, making data->info->num_configs
> smaller than data->info->num_pins.  Because rtd_pinctrl_find_config()
> indexes data->info->configs[pin] without checking data->info->num_configs=
,
> requesting pin configuration on a trailing pin reads out-of-bounds memory=
.
>
> Check that pin is less than data->info->num_configs before indexing
> data->info->configs[].
>
> Fixes: e99ce78030db ("pinctrl: realtek: Add common pinctrl driver for Rea=
ltek DHC RTD SoCs")
> Closes: https://sashiko.dev/#/bug/linux-60e13761-fd9e-4fd3-826a-47344f36d=
4fa
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

This patch 5/10 applied for fixes.

Yours,
Linus Walleij
