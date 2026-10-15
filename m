Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686D9502548
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057299; cv=none; b=Y0XmIMSJk0QkFBcusCRzFsrjLMV0QwT86VM7dlOWmOzTYgPkmWR5X0Wk+hjzjJb6xBdzgvtUq09By3gxrW5IUsG5K3Gaq1aqnxmh3ORgpU3o2Q2SSdeH1hlaNqAGKJ1On7F6ARl5eeTffOCE/ToH+tGsvJ09iEiTtctaWidiEx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057299; c=relaxed/simple;
	bh=xfP8kjNr+e5C+HK/Pm1Fo3vFSxOo9cfc7JMFQj3tnGA=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K1sDhYRa1A0lH68HB06D17u+RLv7+/JFYG+JgOlLMP6Ihvk3rrppWBjX/91RUNgRhSoqHeYN60K+VVuaML2YIRGhfssqtzerwOaQlL8WlJLzJp18BeO3tK3dQSWRFly3BNV067lmuCOVCv59P0eqDjNnDDm3WVGUKtkxKvyba+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CG+sypt7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CG+sypt7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC22E1F000C7
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792057290;
	bh=xfP8kjNr+e5C+HK/Pm1Fo3vFSxOo9cfc7JMFQj3tnGA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=CG+sypt7JkwNOcexN51sUkBFG7tvGoXh1TwMj3+JItDxxzEp7UUKnMyuRBBETlFvf
	 R9WUKWPQAled9+9wH+tF7mfNVWtxHfSQYc18qJaOybGfrIOMMYwYo6l6HNEec1qpCE
	 QZ3kbGMyMy2xHIFGOdqwO4mveVojYv0/72itHYtLPeO0WXpWycFPsw70cc1RR7YC6w
	 9F0m8Je8VWNGjlmsSrrojABcomKO/YtjCCFZ9j/fr8ryJk9c3By643lUK0lM2lmwDV
	 GxmvjUrTiRHg4z6UrZQ3rMBaCZ36uBlaiO6SaRESSJeXYka/IEkv17l6HBmGDINPJt
	 o2OrybwLeTWlw==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3a980c01033so14559681fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:41:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxw8kSCG3paU0bgDowSffFPNcGB0DSmTjVW1pe5yhDRU1pybvAg6fFkKK0ls9/tWKpvGT2KSvl7HJ91r7A=@vger.kernel.org
X-Gm-Message-State: AFq9FYJaEoLDQOg1SVzG+zFx0LUO3JfYHFrRGDK74p8aUbiNz7GwZBTL
	yo8lQxNajhwAbXNJ8eFOtuF7WKPMQOYuLdSZG8LPclhEPpl/V7uEER83ZyC6NRsFDGYigzvTe9I
	LNH65tigZdf3xmWBLtRizCZ8k/63Dqgr/lKy/H31FMA==
X-Received: by 2002:a05:651c:211e:b0:3a1:30c4:d95 with SMTP id
 38308e7fff4ca-3a9c515d781mr46931901fa.5.1792057289552; Thu, 15 Oct 2026
 02:41:29 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Oct 2026 05:41:26 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Oct 2026 05:41:26 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261009165710.1320233-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009165710.1320233-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20261009165710.1320233-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Date: Thu, 15 Oct 2026 05:41:26 -0400
X-Gmail-Original-Message-ID: <CAMRc=MdUgRL1AVsChpb1zaULh1VbQZTXiu0sGxMe6voLBTWUqw@mail.gmail.com>
X-Gm-Features: AclHuK8htGqXecfWOj9g12Tz9oL4b6NWh61USh3iIZJmdSSUuVgRXF30eVr_jCM
Message-ID: <CAMRc=MdUgRL1AVsChpb1zaULh1VbQZTXiu0sGxMe6voLBTWUqw@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] power: sequencing: renesas-pwrrdy: Support
 SoC-specific probe configuration
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 Oct 2026 18:57:08 +0200, Prabhakar <prabhakar.csengg@gmail.com> said:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Allow the Renesas power sequencer driver to support SoCs with different
> power sequencing requirements. While the existing implementation handles
> RZ/G3L PWRRDY signals, other SoCs use the SYS block to control different
> power states, such as the ADC power-down control on RZ/V2H(P) and RZ/V2N.
>
> Introduce a SoC-specific information structure to provide the power
> sequencer targets and consumer matching callback. Pass this information
> through the auxiliary device ID table's driver_data and use it to
> configure the power sequencer during probe.
>
> This allows support for additional SoCs without duplicating the common
> probe logic.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---

Thanks, looks better now.

Bart
