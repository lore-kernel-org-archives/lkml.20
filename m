Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564475;
	b=k7A07I/ZQRS4QpjhiiRpfHx2xjjVyeYsCVFoSjh/f7kHz4swhoNbZ/EGLoO2ZnaUZazo
	 uXocNwCXNbUmDHGoW7ziDV4ywGjOWrl8KF578epkIoRG3j01wlB3pniEKUIUx6qaKbWEj
	 KYnUlvxzzOYyBHGz/0xUiSSSEvUXZqa0XiDPoE6Yu7RB7SS2t4rRLbEB2ePL1cO3Q9YXL
	 /zTna1MRnMwk93vPh2slkc2X2cyEnvRknMyZBSyIZJ48vJRke2nFc+PrkraGzOZpvpheF
	 HhMiwLT5ZFHnB2oezg22w6cd43z2wQTI1nqcl7h8ncQwacA+I2oRjhRPLUMqFAOPqBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564475;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=S0XA8lNxZ3R3GHk2klTObywwFs3Z7RSzUthP5GZiX6o=;
	b=uE+JzhQnghnAI5MoO/D6/tDuPpuAumFK6sfG8449B8hxdHqnSXpEqcFjE9THNiozHXc4
	 A2RZG0g6sHY1XCB+I8prkL3JFvE1BmK/TU/STPu98JM0tTKGDzT45P4lFbyYGAre+hDmF
	 yRvQpuSGFjroP8yqtlhb/jxNKHebX2z/vA2EthHitWFC2aPjoAQ7nkcCp6YU/Yu23Evg8
	 PSs4dFB2HadFp1kRFVwMpm2DgPWP/vCZbmnrMD024rDd2WU1mzGqHMBkSdsBlMEi9vZal
	 nTUvI5ASgHx+G6k1iW11XVyLhmmiDv8sk3I1sIgOHdKwLroerNeRQ5+ZXOn11PcQYNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QB5z+R34;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F8F606A8B3
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QB5z+R34
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 242FF1F000CD
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794564475;
	bh=S0XA8lNxZ3R3GHk2klTObywwFs3Z7RSzUthP5GZiX6o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QB5z+R34JgjSKXfdTuQQ4z5Vl3JWBLQzBFWeEA6acYvWfibhM2Rffli/kvKZux4vr
	 MYh8+DiEPhITQf8jKKKz9vDQQ85fvRos4R7RZkzlBjyxhUlkHAgy0OSfr2SFn5c+Ww
	 S4z7xJqcTzwnh86Gm7zTVOFPrh+KSN/vdKlOa+T9t/TWDrPQ4h2xQr1FmXNwUqUyOl
	 2X9yIEHKT9wjquLxU2vag5N0nS+K0iVjdAkr/IaACUbpFSr0dnZRZtnO2x+NkM98v5
	 d4zfoXbk/7ZWF1eF3UTKkTvs1uzp6Z74ISEzKGLl/Ct8OVqU2MHngWy07ePd3k6Tsf
	 yf927Q1beTwRQ==
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-70b875f6f1fso1280784eaf.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:07:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEM9YF/7JgFzc3md9fpTxSuFR99CSh31BfrnJySklkvv5iqr+6jJVR0WXaZEPfofq1n3PA+WU7dzkd0yKo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zs2Ul7d6lIwYQGXIil485xOCHKXirFHkFvfHx4iLd1BxNxVwn
	g+FnOXzROcf1gwZw6Edgq4usehDII7VRsESHFwKnKSh53AlnAkR1IoJZejgwbNA+dQO58/7XWXL
	guvWJudFNKiv3cfGFzVOMHVrXjwYSQgU=
X-Received: by 2002:a05:6820:7084:10b0:716:c53c:3f4b with SMTP id
 006d021491bc7-71ab52797f9mr747028eaf.88.1794564474160; Fri, 13 Nov 2026
 02:07:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-1-52d92843ad97@baylibre.com>
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-1-52d92843ad97@baylibre.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 13 Nov 2026 11:07:38 +0100
X-Gmail-Original-Message-ID: <CAD++jLkjbHxbJ2-p4oe3ecdpdC4Gh9fTiufkrvKBzF+bfz1HNw@mail.gmail.com>
X-Gm-Features: AclHuK-a3uoEAZFrK5h2rEztceybIFl9qYaKDq9CCMUyZ6HAOHlDJiKihMms9VA
Message-ID: <CAD++jLkjbHxbJ2-p4oe3ecdpdC4Gh9fTiufkrvKBzF+bfz1HNw@mail.gmail.com>
Subject: Re: [PATCH 01/11] pinctrl: scmi: send the drive strength in microamperes
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Peng Fan <peng.fan@nxp.com>, Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
	Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 4:58=E2=80=AFPM Cl=C3=A9ment Le Goffic
<clegoffic@baylibre.com> wrote:

> SCMI gives the drive strength in microamperes, but
> PIN_CONFIG_DRIVE_STRENGTH is in milliamperes and was sent unchanged.
> Convert it on set and on get. It is the only unit that differs: the
> debounce is in microseconds and the pull resistances in ohms on both
> sides, and every other value is a flag or implementation defined.
>
> Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl=
 driver")
> Signed-off-by: Cl=C3=A9ment Le Goffic <clegoffic@baylibre.com>

Patch applied for fixes.

Yours,
Linus Walleij
