Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793799588;
	b=eqNs7zhKm7aIJ1PHsEQIGwAvWeFRUP2Nl9fCIIJ7PSywFH+qB4l6c4k4mCTw3tiamA4y
	 OlHyCxeka6b53mF0MB2qQOQALw1UNj3yCfqYsM/hsINgiMP24GTnQjHyEOE7A8BRuMvNA
	 Up9qZIjNacH6XxNu/RRn0esRNRw/+8h7ZD2qju20MMp/Ewp8bO4Rq1OTN4rsFCDEQiqYz
	 2HnhdnVZt0CTj48AP6kCUfS6PpeqyNDj6o1KD0YFSzCteFG5yFwHJTClB5cRhn2dhR7Pt
	 nyNHlSJE5NlsAGcG4zqrrgFS2aEEdogJ8PKfhHEhT4p3EDGo0NrY+z7lW6Ssr2SBRtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799588;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=eeJ30yvyUGPx8o9yVvLLpuFmoM+u+oWyns4sgAqLWcU=;
	b=fWWK5i0iEreBrpdPu2rx+/SHGRfjfLdIRktav8JehIl1vS+xxonvkeNtFRzS+LRMlFEM
	 OoSWrPiCh2PvWNyDNo+UxSxJWMXo28Wn1Diqy4WiKzi8v733hJ72+wPp9XQhKmcowTrdC
	 2583A3yxa7LMZwZoONd+DTL/xjELvTRIjSb6NgRWaO4GOER3cB+lT2f4wHX+vYh3jz3WO
	 EN4z54C1kQFgUipiII9SrrmxWj8TtxSfjfh6A0612S46mbPKuyZvVG96u+JBZX+/8j1N0
	 t0uR5k/XkHegqHPgJJq6by0qmV6h2lYc7XuCrNo2jhrszd/DroMMJKsn76ggurj0B1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HtZQSCWu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E10E606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HtZQSCWu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BBE31F00A1C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793799588;
	bh=eeJ30yvyUGPx8o9yVvLLpuFmoM+u+oWyns4sgAqLWcU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=HtZQSCWugbnjVYU9Hxobj8ni1O6FcsMn9LlBUqOth6s3HC+675twSV9bEGZZNMqpm
	 2CtTXQez+nuezQR2privxJu7WcCNJgDDiop99S/qLIbBBAJTz1Z4uevH0HYoaDCao6
	 g/vZP/kKl/L8aLux1AirZ07aQJMio+U76x5rkK+0/s0fbITxY2BKtbx5CSEkdx93Sd
	 REsFIXRaZH920hMJpq0AnkDVNOFes3I4xScG7eD4KOT+mFSAyVLpa6extfwfUzSFYR
	 RIs0HkkVG8Petfs3c9zzDM4uqpmXDl7FyebJIFET9bBNkbm52nYtHXD+Go5rSjUOK1
	 vrnLXEH2lMRRw==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3ab27e45e7cso6046931fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:39:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzUmiisxPslxLXmRUFz4RoCdbIQi3NUOYPRSOVlq24nyKlgvyx91BEm08BF+RhImYw4P5oz+WkN3sgQRxE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Iligyvvu2R4EmkyUJGhETpSJCmudgiFt2BsRspZ44MFlK8aN0
	7sm4sP+6G+kg9F6uv0YxlLKT48UQ+lOEGDSfKmEe+khCOeLDmobUzGFBwRNe8/uj6lZWOGytkgG
	Up8eJFRYuk4mdwKIy6D+ZLm1JLntQf8g=
X-Received: by 2002:a05:6512:3a8f:b0:5bf:ce46:2e2 with SMTP id
 2adb3069b0e04-5bfd9562ccbmr5929968e87.17.1793799587091; Wed, 04 Nov 2026
 05:39:47 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023094220.2989225-1-guohao01.zhang@horizon.auto> <20261023094220.2989225-2-guohao01.zhang@horizon.auto>
In-Reply-To: <20261023094220.2989225-2-guohao01.zhang@horizon.auto>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 14:39:34 +0100
X-Gmail-Original-Message-ID: <CAD++jLndt0h88jTstAbXVjX6gE9pgJh6-cMz3QqJE9gL13HNuw@mail.gmail.com>
X-Gm-Features: AclHuK-0aqMFI56OyvVpDlVDPOgJowr42P12MXMmPJSOyPnYrNLmd8BzuuXcCVw
Message-ID: <CAD++jLndt0h88jTstAbXVjX6gE9pgJh6-cMz3QqJE9gL13HNuw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpio: dwapb: add snps,native-both-edge
To: Guohao Zhang <guohao01.zhang@horizon.auto>
Cc: Hoan Tran <hoan@os.amperecomputing.com>, Serge Semin <fancer.lancer@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 11:43=E2=80=AFAM Guohao Zhang
<guohao01.zhang@horizon.auto> wrote:

> Some DW APB GPIO IP instances are synthesized with the GPIO_INT_BOTH_EDGE
> feature, which adds the GPIO_INT_BOTHEDGE register to latch both signal
> edges in hardware. The capability belongs to the IP instance rather than
> to the SoC, so describe it with a per-controller boolean property instead
> of a build-time option, which could not express a per-controller
> difference in a multiplatform kernel.
>
> The property only describes the presence of the register. Controllers
> that do not set it must not probe 0x68.
>
> Signed-off-by: Guohao Zhang <guohao01.zhang@horizon.auto>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
