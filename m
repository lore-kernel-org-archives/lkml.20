Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F4E3EFFBA
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789373475; cv=none; b=uUvPjlAVTdap1lGX+lzCY3LBtFzPSjXlB5QfSQWaCD94YvUX+3B3qXM9HOfJlh+JSVfR0yAA2ZozsH6zIw1znhQm9bfdPxGIzEsVggc6sBwqMD7KpzarFFKzr5RGweRlsAjafIRmR2Aa/r+a5DKNeSC/FYDJputcWboEduKP95E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789373475; c=relaxed/simple;
	bh=qOxCYMeZioIGCmh0MxrsIyGPyaOCPaAbU6O6uizTRQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mGKPZf9oI7SgFC3wVhMuNPcWSexG7az7nIkC26flMBzezTgHEwHobjdtuaKIFIRt+R+ZNMYiafmz/oqTBNjM1oSgt5pB/vsZIHRhY+kR73dTVryWBVvyzFYjhkZAVoAeV9RiwCigeIbBJpkCUsvkQrY1xdxyuOqeGto3zzF+dZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-4b28d7c729fso2087863b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:11:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789373473; x=1789978273;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=G2JcK4+UnTdYFj4YxjDgOg657J6kp6BHITWmwnB32W8=;
        b=e7Taq6/hTulMvK7LHEMoorM1SVN7/xX0prubM6OMGT2CUHxhraaxRxx5uwW7OwIyFG
         L+bpTMOz7Hx4W5TmCTXQ499CacpKY9DjDN01uYiJAY8ccD5+6pvns3JqseF4is1mofus
         H1tDjA1D3D872VepjZt4z/qV/1O+zkiQ1MkIoXb9RdL7lEWlWECGQ1jYMlsF0VtRoQPU
         x9qmO/OVrlM8dTTmRqk9ZhOrJWPgHfrgh4C37hNpj3KVvRC51q7o4/Lb3TWhrbrCdYlM
         mShu+1inmiQgpU8k9NW12WHNy8d4ugkraNO3xfCTSxSIx+LZdSNs1Y88M4E0RCSrjxk7
         EN9Q==
X-Forwarded-Encrypted: i=1; AKwUvBwTm6c3PYKDcLhqZlbAowfHF9XDFTeY1aBr7tDA3h7B0iYz/gUEa/LkRclY1DpeTko6I9UKN3/jX+3ISng=@vger.kernel.org
X-Gm-Message-State: AFuF++nh9Ai21yikbxv05STJK0xxIbfV0MO7HOpkY5CP8FEGsinB64i1
	U7TrMMbVDs3+VSqw3aHNe9Vz4RdTLi+vKPr0XVqXbL77jEiY4eBxlBs8ggGiVMbk
X-Gm-Gg: AYBFou3zGTK4V4B0p0NxYWdR/WU8tJNCWhmWMeKSGrPv0QQDV/ZQTdY/UvX7JHpxUVf
	ziCuXHvadPW1yGqqcTJXNfW1kLFqErEH9nLlT2bClxhGX1Vx+JeMA+PPmEvV17m3ANMNHY2anhT
	X6EI7nqw80wMDojB8iVdrPFQb5bzW5NqBC7Ldijy6jT5x+QKZC4B2nWGEpY8n4PQw46QqFOuzZ7
	n0dD5N9WXVmTpfJ7+l372X4fMB58qPs32hCmzrwvqTC2Vs5Kye6JBZPcZYCUOPrgxNGyhrzoUkf
	DSqxEGgd+0CO2WhMxbi+kE8SB9ws9dhrBmfg7I5mbtUPNF2bdp4zJeJQgtHyrMLKjwcKEfi8s69
	SaPb8YLEXzG2ZVotL662fdcxFdbAXsoPcGenMl5OKK/akng12HdqT6AzPTcA+/6oTH/VlHxScF4
	kpRwl+zG4JFUUI0ZrhjSl54JCnOIkD7uH2qsNZ8ASL4nINCSi+9ifDgoHHgKsui8joC4GWpIrlO
	pbIKP3r+u40JbYWuc1AULBkg5q4z0Q+tKel
X-Received: by 2002:a05:6808:3305:b0:4b9:e65b:8c39 with SMTP id 5614622812f47-4c7b519de5emr801488b6e.39.1789373473065;
        Mon, 14 Sep 2026 01:11:13 -0700 (PDT)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com. [209.85.161.43])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4c662219952sm3200162b6e.6.2026.09.14.01.11.12
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 01:11:12 -0700 (PDT)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6b1afdf98dfso1919136eaf.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:11:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzi/MXwIyR1YRPnvjgD+W220aztCW12VwSVerNrkBZ1cHrvNpPHP4cCp/qVA/hom0yR+az2ixSrqx9m7jo=@vger.kernel.org
X-Received: by 2002:a05:6122:4905:b0:5bd:cb34:1b70 with SMTP id
 71dfb90a1353d-5c981a7ddc0mr603320e0c.1.1789373084860; Mon, 14 Sep 2026
 01:04:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-rcar-du-dsc-v6-0-f8ef711a7494@ideasonboard.com> <2489cf57-65f1-4502-86ae-1e3673899b87@ideasonboard.com>
In-Reply-To: <2489cf57-65f1-4502-86ae-1e3673899b87@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Sep 2026 10:04:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWfmVHsJBtnn0sB1f6YwnVpQOY5coP0pu6qOsknc-XfaA@mail.gmail.com>
X-Gm-Features: AcwNN1UjvEXLwhrFNF_ZKWONSXtVIhmEHRxBRtfYrWrrOz2Bml4dSuA03jjsOBQ
Message-ID: <CAMuHMdWfmVHsJBtnn0sB1f6YwnVpQOY5coP0pu6qOsknc-XfaA@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] drm/rcar-du: Add support for DSI pipelines with DSC
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

Hi Tomi,

On Fri, 11 Sept 2026 at 09:07, Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
> On 07/09/2026 12:29, Tomi Valkeinen wrote:
> > Some DSI pipelines have DSC (Display Stream Compression) IP block
> > between the DU and the DSI. Even if DSC is not needed, the IP must be
> > enabled for the DSI output to work.
> >
> > This series adds a basic DSC driver, so that the DSC IP gets enabled in
> > bypass mode. This enables DisplayPort output on Sparrow Hawk board, as
> > the DP output comes from DSI and sn65dsi86 bridge, and also White Hawk
> > board's second mini-DP output.
> >
> > Original series from Marek.
> >
> > Note: I see that not every run of kms++'s kmstest gives me a picture on
> > my monitor. Sometimes the monitor seems to be trying to repeatedly sync,
> > but fails, and the screen stays black. However, I see this same issue on
> > WhiteHawk, which uses DSI0 pipeline, without DSC, so I think that is a
> > separate issue.
>
> Pushed the first three patches to drm-misc-next. I'll leave the dts ones
> to Geert.

Thanks, will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
