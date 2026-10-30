Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793349293;
	b=HZqJe2s+zLWTFA4LDAB3Sx3uwVI8Y1BtBlolCuzm3KSGJ/zdkQkU9kEqELGn2Gz3mk2e
	 tSYhVmCwJeGn5YCa3VG4kFEEw2LR88JfD1nk345NvA+Om+h0eOs1nTxqopU5TVevG9mkr
	 4vIQHM7XKJePW+r/wTNiBtL5i4G0AXSgfHGH4r8rzovzA8rONlPrfCLKv+ZOnp+VgG8X9
	 gLlarMLU7tzbcDyf4oAyJdlqCK8zLdvZkJvQ6rfxT36mJu5Zf3N2hpRXVy8nqQgmj+Zqi
	 cWPxsv6JoRPMP2Pbca7DrqOu7cli75YmGTwS4SQIdZ5Kdv8dmKjRiuNOxqYFiVIKj7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793349293;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VQsxK0ypjps04yXtP7D9Vl+v3TvG2zuYW8obCp7EWXY=;
	b=g76Bi3tCOkofwrZQrBF80vjCdYgcGAl2/oaiqul0Z0wvrqH2uHkGWoU/yWq9pboQjoEZ
	 dcZ/RWDsPMHMY6czJyy+jJtdmjMhVuG4Wy5rpYs5TvXOkQhfn9titWXErw64lfRoW18Qo
	 uM9Z3p2JXKV5o0c0JS8uaIISbPnGqj7MK2t6sV7LBmRwe93CIfOxt15qjFZN49oac41MA
	 dS85wUzc1iXN7VPZw4W3vM0TXkHEwRqsDBgEqpWHMIHP1+1xvN5m2KH/mn/DVNBx7HYeJ
	 fZN0uWdtRZijB59+FVE+IlfGq2kO2Sw1rNrgyKf5omKgz8PZDKvFBBXR4urARuOwQdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZINXWUPL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7EF606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZINXWUPL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E5F01F000C1
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793349292;
	bh=VQsxK0ypjps04yXtP7D9Vl+v3TvG2zuYW8obCp7EWXY=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=ZINXWUPL8f7LzBGYW2E2EFIN5YqikTTIb6zwoXh3U6y5TI8TyVghqJOnoO2wsfn36
	 moX34gngLXCKOjeWefU2mX1XvRbWDQtwavmxT0cPBm/KX1wuvozwQlohjO4uD03q1T
	 uI2V+vypbS7nGXA4PT4H+cAxO3NZUAaMdTxdvkxOjKlmHIjFI2TnPW/0/wdwbQZW5j
	 d7KGRB6+Vjvd/v0UuejTd3Lu3zI+3BJqDMtUXig8OO6VM/BJ2YLRVUjIc0IreFrqw5
	 zzbeJ+8dS3RPR4aushFL2zDJmRGC1cKBllkHlI7TGpc5S9FoZ2bv+7oL9sZ6Wf/XCC
	 93y/wQ0ypmeww==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3a98fc80925so6543931fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:34:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBydASdnQbiNcJTAD7YKuPrtjQ92CGfWxZebHFWbTL82xSd2T6Sw5YxkKdT8Q26yv4ryFYFXOdOI8OD13N4=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+yDgBYolAWoNoXI+WON4V7wKXqLJ3JFgeKne2gGJLb6dhYji7
	rQ13Eyvij/NgdBCWOioa/PALybZOGwuSjhb2Uauxaxe2D7qLDE2tqKUn3PdsnFBrLQXZS71qQI9
	gCxvh9wh2tbE+o5fH2+J3skqk9bf79DM=
X-Received: by 2002:a2e:be89:0:b0:3a9:a1ed:6341 with SMTP id
 38308e7fff4ca-3acb7ac0796mr3395761fa.11.1793349290657; Fri, 30 Oct 2026
 01:34:50 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030071137.100954-3-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20261030071137.100954-3-krzysztof.kozlowski@oss.qualcomm.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 30 Oct 2026 16:34:37 +0800
X-Gmail-Original-Message-ID: <CAGb2v66Ya50=++STiOLihh6VKtb00QYcv4ARAWqFQ=1FML0Ccw@mail.gmail.com>
X-Gm-Features: AclHuK8f9aQow26btBoDKktg4w5d9q6uuVMy592vvuptaUTTeNrSAFWXrHhABVQ
Message-ID: <CAGb2v66Ya50=++STiOLihh6VKtb00QYcv4ARAWqFQ=1FML0Ccw@mail.gmail.com>
Subject: Re: [PATCH 1/2] mfd: Constify mfd_cell arrays
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Thomas Richard <thomas.richard@bootlin.com>, 
	Andy Shevchenko <andy@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Andreas Werner <andreas.werner@men.de>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 3:12=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> mfd_add_devices() takes pointer to const, so 'struct mfd_cell' arrays
> can be constified whenever driver does not modify it in the probe.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/mfd/ac100.c                   | 2 +-
>  drivers/mfd/axp20x.c                  | 4 ++--

Acked-by: Chen-Yu Tsai <wens@kernel.org> # ac100 & axp20x
