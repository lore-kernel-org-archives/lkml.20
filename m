Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216375;
	b=WTd8lKLtTHshOb6CVpZDG+2llvArInF7Cz6UC4MZFxF6Y2766rtYloPGdaA+W0QgDryA
	 Mk8nieuJQza/NQxt+cECnbf2txrc3ngsLTnYQuWSa342lIPqn4/Ns3IfTbPOOe+ztOG1A
	 jHh8WLIJm/gsd6wZz9LmA1VQBMM0AbTNETdsvb3R/2fxg1XkUzvaovXqjEmfq8CTJRkN7
	 51xUI5115Q56luFyklHQsj+2/x02FfrkZyIdUMBoKS1RWVtdtTBoR4MZZNAfm/tRusJlm
	 DbnUwuw8/R1aihgYo1b358xCsFmkY0zd3wLcxS25FsQeCwgLQbQABcyzHjze8B6XHWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216375;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xCks8UrSH+VWc/F2r/+LPe2AEvt2gZs6moebIigxeqM=;
	b=kxGEB+N4W4MxJpadcT+c0P4t2Ri6w/OfopYZtjDdMNwChvTMXlq0jrcVZ2BXgTJfTB6E
	 T6Ffqaxq6UGWciTWkQrMoioIf/jzaD/nABUqvnrVV2dgOqnEwt2CR3joUgU4qOEaDlGUp
	 7Np53FKoUdQ29Rmd3NTOX3maylhDyl9EqTGRmaEfNsx+2uTrU3CSOlThV+NOhZx181tq0
	 SA46vxQesqnEFzo62CHR+UEEpsZrqcmL7yloW4VFRrVGi3ccRdYGyAnzjHchx+iI2CywQ
	 rk9xqotFMfH2tkW8gWQ7sQQ6JCypx66eawLVhvcPxB21BdTOpR+wKoCMGLP82bIqWBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dc3ekRzl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41405606A338
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dc3ekRzl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAB1F1F008BD
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794216374;
	bh=xCks8UrSH+VWc/F2r/+LPe2AEvt2gZs6moebIigxeqM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dc3ekRzl9jhlTGykBc6MsS/EYBkAqbrpUtBfS/eZW8F7HLXGB3/n90cYR558neyKy
	 l6aZ7sJvmbZCIE252dc4Z7ccHWBxO0NnECDb+N1ptCSoXmBQB9Y+L/pgLKw5XOTpWi
	 i+/VnRz9D/1jJKiiY07bJJtOD4G7MWERUFPWrpAYmyuv+hCYfEqwsIkydTPmDnpIkU
	 PQl/Yi5d/rLb8qzjFAwMIAZigZu4rhkryZ5741g3/LtBprAT4kQLlhhtMiUY2tss8p
	 dNo/j5PQ4zqfvRMD5WkPd6h1vUKEPQFNgAuyyrNASsxApKhaAgOUcSEhS7Fz0TqYjn
	 weeVNUewkxvbA==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5c126fa1e3aso348433e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:26:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHvGqd/wlh08dOTcTXLkQyAWDrTKSmNrYm0t3o+wxUs9ieSokBg+UlyNuk71N+JMPO/kWHbg1k7vbkNEbc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IHm0P4W3zUaWjeivz82Dk5v/ouvmOaTbqpzzfdis+WhAmll4q
	G+UmkIaUKi9VRcbaaBos0J4tCStAToYyxoLRKfJhCjqHjENHqipXr1kxLSTrAyDkX35NRc82Yuk
	tyngo5m/W6NGEvcAkjiGn0zLFwoa/I5k=
X-Received: by 2002:a05:6512:3ca9:b0:5bf:a209:f81f with SMTP id
 2adb3069b0e04-5c14bffe580mr845244e87.37.1794216373494; Mon, 09 Nov 2026
 01:26:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105231626.7152-1-devnexen@gmail.com>
In-Reply-To: <20261105231626.7152-1-devnexen@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 9 Nov 2026 10:26:01 +0100
X-Gmail-Original-Message-ID: <CAD++jLksFHZRFCk9JWQz+Kec-Gjx0dEXchUfLuTewJvOx-dnUw@mail.gmail.com>
X-Gm-Features: AclHuK_9Rmp9F6cTuV3nG0AEgFGsWirUN0agYA9OdNz8NRGFTWTf4-hUbCEhoyQ
Message-ID: <CAD++jLksFHZRFCk9JWQz+Kec-Gjx0dEXchUfLuTewJvOx-dnUw@mail.gmail.com>
Subject: Re: [PATCH v2] media: mali-c55: Require an enabled link to start a
 video node
To: David Carlier <devnexen@gmail.com>
Cc: jacopo.mondi@ideasonboard.com, dan.scally@ideasonboard.com, 
	nayden.kanchev@arm.com, mchehab@kernel.org, hverkuil+cisco@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 12:16=E2=80=AFAM David Carlier <devnexen@gmail.com> =
wrote:

> mali_c55_pipeline_ready() skips queues whose link is disabled, but such
> a queue can still start streaming on its own, as the video node pads
> lack MEDIA_PAD_FL_MUST_CONNECT. Stopping it later sees a ready pipeline
> and disables the ISP under the connected queues still capturing.
>
> Mark the video node pads MUST_CONNECT so that starting a disconnected
> node fails with -ENOLINK.
>
> Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
> Signed-off-by: David Carlier <devnexen@gmail.com>

It checks out:
Reviewed-by: Linus Walleij <linusw@kernel.org>

> Changes in v2:
> - Add missing Signed-off-by.
> - Cc stable, as d5f281f3dd29 is in the stable tree.

No Cc: stable@vger.kernel.org actually added?

But Jacopo can certainly add that when applying the patch.

Yours,
Linus Walleij
