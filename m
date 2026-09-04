Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D794EBACC
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788534800; cv=none; b=a765sCjEVZdDvLR7MrShF6YJmTLcAYnsMNkSeFqrz3lEt9A+4GZr4ikblCCsuz9CAfEQQveCuXpTFLTvPNiz9FyBPQCH6Fh33Z9aiw8UlzsogpGeTi/dEHvtzeHDCm4J2vz/Bly9di6PZDj8AGJGjjrWqbMEaM/PmjoaDNUav5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788534800; c=relaxed/simple;
	bh=JKMK2CnzL8ftNzdqEBL6ZbY15a40r3hgTJf4pBsjvSE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z1M8JTq3vRrs58u4Ay7Doe5jsKbmpsc6qEXQdzGf3S1QZrdWN1UlIQf5BweXiS3QeXo5smPpq/BjYhS6wX/+c7hGcp/cPXaZcOa69ZyUHGqn4sg7xCPgnJ7qOQc3XjdEmRmHS7iu+RU9btoVZPxEMrsaSJnGOUuXfLASrk9boNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5c7afda4515so695226e0c.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:13:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788534798; x=1789139598;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EH26aGan0gGqVYE0IjLU+OD6hNNld1CIjczwNKp7Quo=;
        b=nULej/CIX/UxT3sZP2rPs8hL9exwTL9161g15Qwlisd5MsPCu1g1mQCuZxfNQwwVgC
         ws+utw8OyyRlPXQtlXD4l3a2mggm3dE+CctBYiH4QSFXHmgtyg69ioicRjo7R3Gvf3n2
         LAXJtzXI8umk5sOAVbXW5I5FzQbHFpRy5Qg+ZkLNm0sqda/GL/bwDC4ac9CzdDw11rbo
         M/wFYMb0VrApEQmX8VzBJt5vwvcsdnKJiHS5aS7DRm3cFAeUVm8ZVVS5BKtV4OWF7TU3
         qDWmCVVWiR1tocNKCr5+RtqUW9eocWhsXWLn6FiVAGBg0z2lTAAUVBUda0zxSj2ljfhw
         O4lQ==
X-Forwarded-Encrypted: i=1; AKwUvBxRAzBMSj8Yv91K6rh+IThMi0w/VcM5sCDbMsIUGPrful3GBGaS0ea9KLezwBSzxsI6Gq2R2JgpErhXONg=@vger.kernel.org
X-Gm-Message-State: AFuF++mtEHUCT5z8LiIu6o9ClQB3qsSrUKcn9kY+VCbu67CxSGObhh6O
	CVvovkFbzSO0AFbsL8K/mCW+1yU7xL6xOXpZzRX3zWGFn7TTlVUIw+zIE38kkTiI
X-Gm-Gg: AYBFou22meBLlEmsYUbktw8KWcrGRk4ECEjkY36lki/zMg5ZfBxPGXE0V8R9zp5frj+
	BQUph4t5VnzkXMQAwr3akobGrIx/lV7a2QFHNHGs4xGvmPvlvXxqDyqMYxSyIMpdJ6ubcGSIDLy
	oCsy0OspYYz62PJF1hcxzqXKfTU1EK5GE6CJAe1qqnbYfi66EReIq+TCA+QT0H4O70R1qos2zRX
	TkqMCt3BJ2axRW6EKygzkVcNrKRw1stTm5YeT0Ohk0u7wRPITu27EL0JXh2ZiP33S+GLG1/A+Zm
	l6SQF3aqhhx7nxK7bAajXGtmI1phW/0CzARW5AjvzmmTQKoy2Lgjjfk0I3yD7EkfrQLz8KbsJr/
	dvyQIYivjBaC5kr2fUFHYmDKNMcb4SdFwf079SH6NWgNbDvoS26kDUsc8JbuS8uMWLz4Y6QEwJS
	QL/pYqAsGytYxtlgN3UoWLLJFb0QG3QsdPNYV9zRDkNnxmWq7lDTBpQtWcU5t8iphHc9b3Yxcah
	Njaw/A2WDr8PJyT4M6dTeIMg4OB5w==
X-Received: by 2002:a05:6122:4f82:b0:5c2:ac92:eb18 with SMTP id 71dfb90a1353d-5c7ed3f6d2amr2950130e0c.7.1788534797828;
        Fri, 04 Sep 2026 08:13:17 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec1097f4sm2424552e0c.1.2026.09.04.08.13.16
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 08:13:17 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5c7991578c2so472626e0c.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:13:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBya9UgJSNLzOWmQbv7cTpfVbt6WL6ItXQHNKtuOPMkLJwTGSbaNnpQUIjZlHYWQ5CYd+Qwcn7lGWMWed5s=@vger.kernel.org
X-Received: by 2002:a05:6102:2b9c:b0:784:b9ec:913f with SMTP id
 ada2fe7eead31-78a4a6c8e9cmr2072720137.5.1788534796061; Fri, 04 Sep 2026
 08:13:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821150408.73829-1-ayman.chaudhry.kc@renesas.com> <20260821150408.73829-7-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260821150408.73829-7-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 17:13:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWOLRH5CWwUBkb6odaX=4t6eDnd4onrkgGfvwgPc37i_w@mail.gmail.com>
X-Gm-Features: AcwNN1VLaUGS5m2MWtdAilN8Kk2snIGRLTUTYNqUMsLJBTkMdKQbkgJo-6rNerQ
Message-ID: <CAMuHMdWOLRH5CWwUBkb6odaX=4t6eDnd4onrkgGfvwgPc37i_w@mail.gmail.com>
Subject: Re: [PATCH 06/10] dt-bindings: clock: Add r8a774a3 CPG Core Clock definitions
To: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Ayman,

On Fri, 21 Aug 2026 at 17:05, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> Add all the Renesas RZ/G2M v3.0 (a.k.a. R8A774A3) SoC Clock Pulse
> Generator Core Clock Outputs, as listed in Table 11.3 ("List of Clocks
> [RZ/G2M V1.3, RZ/G2M V3.0]") of the RZ/G2 Hardware User's Manual.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/include/dt-bindings/clock/r8a774a3-cpg-mssr.h

Missing "renesas," vendor prefix.

> @@ -0,0 +1,59 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (C) 2026 Renesas Electronics Corp.
> + */
> +#ifndef __DT_BINDINGS_CLOCK_R8A774A3_CPG_MSSR_H__
> +#define __DT_BINDINGS_CLOCK_R8A774A3_CPG_MSSR_H__

Missing "RENESAS_" vendor prefix.

For the contents:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
