Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792657980;
	b=szcw4N6yu617RH0inUyYzMIxXNuisuM1ZcXp3wJfHomBChq+wgGHbv696kXJB0fE16qq
	 oAbDuHeb55/F/1B+w+MW79YnXUlJEN2+oHHpqmda2OVf+22Ck4sTb3Hp395Yxcg+GUJOk
	 pHBcYISXizpf6IU+r60kzlwn8XOLTK+XuQsUmNI/Bz8qXOakfsGRZWD9+36ZRaA+9DcyH
	 QIncEHMIuakxktPCnTjzyqSv4na0zFl6LwsmjCFeHlT/4Cxck+o4xJXeVvbr7TnHXJMwP
	 9Z3a5XvUgcGqmHWWJJZi5Dy8uvfcx+8l7otc8bQGGyhLqfK2+eoKj+2YGH9c1ksjtDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792657980;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=JzuUCJEZ07cKJ0g5MRkVm/x+PBn5nOwGygGzn+vt7z8=;
	b=uyQVmkQBdTb9a1SfpuNbd2ev3Gdw3eKwZXn4UXfVo2utBAedx7/ND0seitQRyHg3qDd+
	 m+2jqWuQ/lbLP6ab8wAivewq/fBmQszsRA5ZKhkFIuEfyVDRdb1fhtGDhU5vxs6Uo4Ww7
	 2YfpL88xAPf1N7bxHPARL6f+KUM5XDO1UwbP49jXLtzl3ard00OMkTfnF8bABEj/IlZjw
	 EFwa84IfdXAcHvIsAI4cT8LUxtFkgzymV9OQM6l15ruClPZRauFlIGy6FsCheLVoQynjW
	 FPFRyjqss8H40HWUFo3MrdWPsGCgCUFETedyMAw+lg2C75ud2eNfUsK/MNMk08KpvGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mtkvA5ki;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A19C606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mtkvA5ki
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CECA91F000CB
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792657978;
	bh=JzuUCJEZ07cKJ0g5MRkVm/x+PBn5nOwGygGzn+vt7z8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=mtkvA5kia4TZLAcwzqEP0BMuwW8A2Y55jnGJclt078O354OLEL0lbh6mCx4znavko
	 84qk6/mZwkqHrCV+armLy+kxhO9E1iLXiUJ30DQMaU0y+vFjsliZoy1uVSGsvNeqHS
	 DaomkmpOSWapsIhAT3iS0i/X5ympd20y7zKITihGw6BaCcquxeDzNEsQetbClSQT6E
	 vu85H9TyySoJhScu3H9xhF2e2Az6kRf/HLQ90rbsObi4kOYrnRIUxfPf21LzE0uMns
	 deHe7JD2wLwdTpAH//C/GQyhI9L0uIP24ZrEhwcI2/HjSW7pQqkaRrDwlcWdz3kKIh
	 vpAmtmPnSQXcw==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3a60cb94b80so16339101fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:32:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz3gD+x+A+iCTBJfOiAOvMoVMWrgqzpb9KS//attx7rYu6XjNP1HjUiLQXQw8ACLqV1+xCktKTBPJLxP64=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPzQdUTT4RyWA0UQMFXI1MQfenWwuBoL0KYQErHoDiDDYSaFYB
	7pHlMkJCgPWScUaDm5hp3Vzff3XpMYfFxDaENuPepPYmH13wqTWPO+jT6bnTUbwoz43UxfqYWUf
	34+f1f4CmtnGXlvgRtHw3+GIQ9Rxmv49TN8cnCPlBpQ==
X-Received: by 2002:a2e:b8c7:0:b0:3a9:d9db:61b0 with SMTP id
 38308e7fff4ca-3ac441b9da4mr11909201fa.24.1792657977498; Thu, 22 Oct 2026
 01:32:57 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Oct 2026 01:32:56 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Oct 2026 01:32:56 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261020-fw-devlink-nexus-ready-v3-0-fd6f1c17e16d@toradex.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020-fw-devlink-nexus-ready-v3-0-fd6f1c17e16d@toradex.com>
Date: Thu, 22 Oct 2026 01:32:56 -0700
X-Gmail-Original-Message-ID: <CAMRc=MeBqQZ4eDTz0fNDADt4MyOaZ=a2C9kep=NODdLzX_k8jg@mail.gmail.com>
X-Gm-Features: AclHuK9cCXPq3RuWqctjqZAMOOYPR-7SmQD-Nd8Sfol_hYf30-8yyMIOuci572g
Message-ID: <CAMRc=MeBqQZ4eDTz0fNDADt4MyOaZ=a2C9kep=NODdLzX_k8jg@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] of: property: Make fw_devlink follow GPIO, PWM and
 clock nexus maps
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	"Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>, Frank Li <Frank.li@oss.nxp.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Herve Codina <herve.codina@bootlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Leonardo Costa <leonardo.costa@toradex.com>, 
	Frieder Schrempf <frieder.schrempf@kontron.de>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	stable@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 Oct 2026 15:00:11 +0200, Ernest Van Hoecke
<ernestvanhoecke@gmail.com> said:
> This series fixes an fw_devlink supplier-resolution problem reported by
> Leonardo Costa while using a Devicetree nexus to describe GPIO and PWM
> resources routed through an LVDS connector. Consumers referencing the
> nexus could remain deferred because fw_devlink linked them to the nexus
> rather than to the providers selected by gpio-map and pwm-map. [1]
>
> GPIO, PWM and clock consumer APIs use of_parse_phandle_with_args_map()
> to resolve specifiers through gpio-map, pwm-map and clock-map
> properties. The corresponding fw_devlink parsers use direct phandle
> parsing instead. Given a consumer which references a nexus, the consumer
> API and fw_devlink therefore resolve the reference to different nodes:
>
>   consumer API:  consumer -> nexus -> mapped provider
>   fw_devlink:    consumer -> nexus
>
> A nexus is a translation node rather than the resource provider and need
> not have a driver. The link to it can consequently remain unresolved and
> defer the consumer even though the mapped provider is available.
>
> Make the fw_devlink GPIO, PWM and clock parsers use the same map-aware
> resolver as their consumer APIs. The resolver also handles valid direct
> references by returning the original provider when no map is present.
> Use dedicated exact-name and suffix declaration macros to opt these
> bindings into map-aware parsing without changing unrelated property
> parsers. Retain GPIO's existing exclusions and compatibility handling.
>
> Since fw_devlink runs the resolver for every consumer when its device is
> created, patch 1 first fixes a stack buffer overflow in the resolver
> when the provider referenced by the consumer has more than
> MAX_PHANDLE_ARGS cells.
>
> The regression tests call the OF add_links operation and verify that a
> mapped reference creates exactly one link to the provider selected by
> the referenced map entry, not to the nexus. They also cover valid direct
> references. The GPIO tests exercise all property spellings recognized by
> fw_devlink, including the deprecated singular and unprefixed forms.
>
> The clock patch fixes aacc54c67869 ("clk: Add support for clock nexus dt
> bindings"), which has been in clk-next and linux-next with the same hash
> since next-20260907. There is no build-time dependency on it, but the
> clock patch should not reach mainline before it. The series applies to
> next-20261014.
>
> Tested with:
>   - The CONFIG_OF_UNITTEST cases under QEMU/x86_64: all passed. With the
>     fw_devlink parser changes reverted, exactly the six mapped consumer
>     cases fail.
>   - W=1 builds of each patch on arm64, including the OF unittest data
>   - Toradex Verdin iMX8M Plus hardware using a connector nexus for the
>     display GPIO and PWM resources (v2, same fw_devlink changes): the
>     display probes successfully
>
> [1] https://lore.kernel.org/all/juuc4af7ndbajcl7gzf4tg5qz2q2j5tt3rvql4jbauradujrre@gc5nbdhhixaf/
>
> Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
>
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
