Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1633548545
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790083149; cv=none; b=JnlwJnJFAXtm/F2JReW1Mb/ekqQblFiDWjkl82sdb7JMxevX44HhD9slOvj2zMGAboJ2q4lyFcP0+egFhzakmzyasnnlMHWNqJYBeau+0gxmTx86nSpmgGO8NKOYAgCyRcBByzzpPuT4RpnksOSBfzaAjf22szDoBpSCUE8Kf0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790083149; c=relaxed/simple;
	bh=cL+fI7yP1z+214KskulSw5sR9ItYHUC3I/G1UL4DIWA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ke7q7XZus/Y4s4dcWXb3FPesyFEwxxk/cy6xGrZtNDQXc1rEigYZyvL7rctezoY0RYyCLZDu3PwSiVh9pTZVC9rA1LEeCchFgUNiW3nKVawbXEQC0grWOID4qPDaUIykiqE2sjA1eSByfuW8M190yeGFeF3PouNU6RzmIb8iDd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e97e2c7b3so2303115241.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:19:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790083147; x=1790687947;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1bNH0lrL2XpOj9M8wxgD6IqfQ0UbYYfZkklr2oZ0W2I=;
        b=z2KDrT8VHJp3Itu4D64ofcZT6a0AFzisHq5jKf7xkhYNDsCYgQ7Ag3RldCaB7Ls0Jx
         0lnPIJCM5CFLzv1K/jksoFjUMi4oZ1TKdvEIgwb7mHtNDENiwyb+lhQACF9rlgXYAsZ6
         UgjN6Vgbk9u7W71TEUVfvdtRdBxsequ84O0NCHF062aqHiPr670hjel2K534JrNwPB7F
         al9aS1lQ3RTLECcvI9o2IxtOI73cHBRFqL3ilPxH7+XYxH0qU/eA38zswWU0Mrg2z32H
         dsafr7QAnCZ8l9LBtkL/Gjye70tzJJ+U6cQKRolKSIps6ijgmtxkmETBoK4aWTdX43NK
         ODIQ==
X-Forwarded-Encrypted: i=1; AKwUvBwPgIousz00eXMpUpZ15z3gyBJCqqPShngiJJBDbIui7jQ7xzMFAij5HKr0kN5dIuDCgG81L8TfCzTyWq8=@vger.kernel.org
X-Gm-Message-State: AFuF++nd1vDH4TcK2pbd47cCHOGuF58F5TQ+sLibrkv8RkbDPBNrdYEq
	RYM2YthjKlqy1SY2H0LUPiW4gphoTGHhANShX4tbQYJfOF6b93v3Ydz3L/UpZF+1
X-Gm-Gg: AYBFou10aKLv6XPQKxIrxJD3J0+s7E0WKKV9GeuH8ZQ1BekuV79CoFrMRjqCrbVBaS9
	ziki+47WvfualAfByOQswcIdmzeowmTA0IFQx88nrwBbVbVh7zvNQVkzMpstjFYyFWoP30fVx21
	fDbqolQHWQZodEqIAB3qhx2qxbcF1KJeNqSrieQG5b63kVBDBf4X9IxmFBq8Hp3bAgwP9BkaFqW
	H+fz2eR2R2hcmG2Hrx0o0JYCn8wMLqnx3wUOSKcH80iP/YWTBvjTp1b6W95pQeTSAhdlswG8yWZ
	hsIMoCbf+GI9RVYiGVL5uhMiP7e9fKB4jCKAV3yAIuH/AoUrco2eQxGcKEcBWqnE7PM3MwdFSGd
	CuHFnZnI/noOsCkbpR9hJYC8/XG+KY85lDgHlqX2MY7eFN+xF4Io32/fkiF+//Hm5/g2TVvAT/j
	2Lvzmj20xxhWaVmw2B/2taz2mSRhRjMnV1hPiENjAubmUtaDFwbkRIY9KDFL1uQYGowKb6aSTWS
	WpVf0U4dya4ilxii8SISaLxXKYEBbqGoVEZso4=
X-Received: by 2002:a05:6123:16d:b0:5c6:64ac:d6f3 with SMTP id 71dfb90a1353d-5c9b58811f0mr8907934e0c.3.1790083146808;
        Tue, 22 Sep 2026 06:19:06 -0700 (PDT)
Received: from mail-ua2-f34.google.com (mail-ua2-f34.google.com. [74.125.226.226])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9850d67a68fsm1727000241.8.2026.09.22.06.19.05
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 06:19:06 -0700 (PDT)
Received: by mail-ua2-f34.google.com with SMTP id a1e0cc1a2514c-982db8d3ab8so2054827241.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:19:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz+B1L9r4AYRaI4yAawhN5WyQHcyNbUYbozH3nm5d2qFxeoD9p6cM74Pl/pltDDpsd6A7kET8FYs8PlNZE=@vger.kernel.org
X-Received: by 2002:a05:6122:468e:b0:5c7:9445:f468 with SMTP id
 71dfb90a1353d-5c9b58a57a9mr8626707e0c.6.1790083145505; Tue, 22 Sep 2026
 06:19:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921232551.3129244-1-robh@kernel.org>
In-Reply-To: <20260921232551.3129244-1-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Sep 2026 15:18:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV7D4RZ6zA_0jBqnCz8gee2=9bbNAXETbbNQxANhJ5pZg@mail.gmail.com>
X-Gm-Features: AclHuK8ei4T-jqiTZlN6RJORisuwZufxDS4cn_ittDTbFNHhpoPmq30pEuWosgI
Message-ID: <CAMuHMdV7D4RZ6zA_0jBqnCz8gee2=9bbNAXETbbNQxANhJ5pZg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: renesas: Allow power-source
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

Thanks for your patch!

On Tue, 22 Sept 2026 at 01:26, Rob Herring (Arm) <robh@kernel.org> wrote:
> RZ/V2M pin configuration nodes describe the I/O voltage with
> power-source. Add the property and allow the 1800 mV and 3300 mV
> values used by the DTS.
>
> Assisted-by: LLM

Dear LLM: please consider the actual driver source code, too.

> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

> --- a/Documentation/devicetree/bindings/pinctrl/renesas,rzv2m-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzv2m-pinctrl.yaml
> @@ -73,6 +73,9 @@ additionalProperties:
>          bias-disable: true
>          bias-pull-down: true
>          bias-pull-up: true
> +        power-source:
> +          description: I/O voltage in millivolts.
> +          enum: [ 1800, 3300 ]
>          drive-strength-microamp:
>            # Superset of supported values
>            enum: [ 1600, 1800, 2000, 3200, 3800, 4000, 6400, 7800, 8000,

drivers/pinctrl/renesas/pinctrl-rzv2m.c does not implement support
for PIN_CONFIG_POWER_SOURCE yet.  So I'd rather not advertise the
power-source property in the DT bindings until the driver is fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
