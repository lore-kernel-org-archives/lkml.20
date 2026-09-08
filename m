Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CCE531AEB
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 12:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788869829; cv=none; b=AruPtJVEt0YzE9F46R7nJy4I3T9N/gyfbtyvWVCisv/5jMH2mj8fVbnBvbb/jCJYm1rjo067quGdDWoAYXZMYiZjP/z9ReGkVgw16NBp8pO1Wfsl10l+jWdcd0yS+H9c7ai0G4iONoy4+ZO0ZvVZMdV77xCOiXGXmUYfgsfl6kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788869829; c=relaxed/simple;
	bh=4qfVZ/5nw4amR7KDjxEudFePppzurkPQMXOHgtElbeY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cnU30+UrvmbHjpeFw2b+TPaGTGxDCpOaETUs1Dv1D7LZ6XjRBdftOvYrSxcSYFjncXAQDgAtoa9JrlGRwdGnFmcmDxzi7ViXkiTZwg8qaSuRxsJG33xeNQzaw/MFbim/z+smo59lipoFkbTV+c8VUu4hLUp/jjbwwOqg1xwuqzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5c681c2a6a7so1723679e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 05:17:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788869824; x=1789474624;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1ITJx792r+ituep1jxzGor7V94Ftkp9w2SLxSuD0zdE=;
        b=gpojoN0IDeyyxX/cfleOV/zm+sh3HopRP/K/sGRkOY2S5w+D3hXyQ+LEio2tmqMPgP
         1zbGYEgKYoQlKzPsBXdEDRaSkbLZU9JbnLpisGO3ce8HuomIXlRZ78JsrPSxz8Jei1Ki
         kxewEMWpLZRO5YRH9DZYCwZIhPU2ccmbLBekuz6V+THxzLcu+wv8yJN5VlJ8uEr9Pvku
         Uba8l8TRoL03OE6I23y2JfTvbdqw9iuSLCqgZs5ZayAr+sAOQwTkcbF+nkIXw4BTAFjL
         B6sOkNakIxEB+WTk6fdnBmvZxFDN4uc4ZcI04zW/QdB1d9UrGNaoBUCQoqj1BNsDLVOG
         pY5A==
X-Forwarded-Encrypted: i=1; AKwUvBzq8BPiQL0Dz86EtdzjhUmi1CW+/16Y5zwZS71kRrnrRnHu5LiZWaxvICzgPdCRjRsrThH3rLJYnsfOAWY=@vger.kernel.org
X-Gm-Message-State: AFuF++kk27f9sl2JFGY5g0fbPeT3UguvLFC5ig7AKkhxBPVwYsLdKQqb
	RMeAI2v7yDZL2gHWNWzoau9ifYoHASI4ERHdtPFyf0OmIDKWjg9Yln3F4cuy6ClS
X-Gm-Gg: AYBFou2vvRGIVwqEKIX/2apTafgmlrkGz3EFO0YY3NBsl7Ecd7v0MIWj3Yt8RPQA9UC
	oY6ljzEIijDwJh6abapvs2MVE/vDZQ6mGsVgPTw+MOeJLpFRD0nDxWLRnxPOsgab2eIOBvzVoNI
	ps+XAGAVv+83UMMZBnaWQyV3ekt2q8TTFHuOa9M1h9mZE9F74gEEy50/QSTH4YXoHHTlvFIEK/M
	DesHqpBGgxri/TkspXX4UQyyaRdNhiSrMoR3EBleuP3ykaqSgrTxAsw896MtnvMtbbjDf15Bqqk
	uyydwejtOLTF7DMd0Z7yOL6aUjJN5QKVHOoXI1Ylja9Dh/IWqnHriLQFA2BbAEzYarpnD5UxN2+
	qSs+b+duzC6k98EjKanjxUSelFhU2DX62FAZxQAFh1llcUfr46V7Na7hZSvDLebcRC9qmkXYrMi
	hQGfdtc/Cdoi32/OmBfKVfc8oDx44iBviso/VF3osCr+AtOFp38WSekIjtlfnEQdS1Sx8ywBJcN
	R4I9aDTF5EHTa/6xDir3+61tteESQ==
X-Received: by 2002:a05:6122:4698:b0:5bf:4522:fca7 with SMTP id 71dfb90a1353d-5c7ed3b2275mr10642843e0c.4.1788869824109;
        Tue, 08 Sep 2026 05:17:04 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c81c506f31sm2021646e0c.11.2026.09.08.05.17.02
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 05:17:02 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5bf83925ddaso2591604e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 05:17:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy7eTCiRU0kGmNd5ErYMcDFedChTawdp4DvE7D1Xzs1KCI7g0+Grp6RJFXab+zXrVLwKvIylk/zp1zrE7c=@vger.kernel.org
X-Received: by 2002:a05:6122:4698:b0:5bf:4522:fca7 with SMTP id
 71dfb90a1353d-5c7ed3b2275mr10642726e0c.4.1788869822558; Tue, 08 Sep 2026
 05:17:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-rcar-du-dsc-v6-0-f8ef711a7494@ideasonboard.com> <20260907-rcar-du-dsc-v6-5-f8ef711a7494@ideasonboard.com>
In-Reply-To: <20260907-rcar-du-dsc-v6-5-f8ef711a7494@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 14:16:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUpLrjtUh5pGP9ys_PSFt10vKdQCyo3UGaedcwaf8UEww@mail.gmail.com>
X-Gm-Features: AcwNN1XnePIl5mdE7u2itKH3ZKW58ZQZ46L6E5RD6lZgFL-MnDqW0nO0uTjSR8c
Message-ID: <CAMuHMdUpLrjtUh5pGP9ys_PSFt10vKdQCyo3UGaedcwaf8UEww@mail.gmail.com>
Subject: Re: [PATCH v6 5/6] arm64: dts: renesas: sparrow-hawk: Enable
 DisplayPort by adding DSC
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
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Sept 2026 at 11:30, Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
> From: Marek Vasut <marek.vasut+renesas@mailbox.org>
>
> DisplayPort on the Sparrow Hawk board uses sn65dsi86 bridge, which in
> turn gets the video stream from the SoC's DSI1 port. DSI1 pipeline has a
> DSC block in between the DU and the DSI1. However, there was no DSC
> driver in Linux and also the DSC was not defined in the dts files, and
> thus the DisplayPort output did not work.
>
> Now that we have DSC defined in the SoC dts file (r8a779g0.dtsi), we can
> enable DSC for sparrowhawk.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> [tomi.valkeinen: separated the sparrow hawk changes from the soc changes]
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4, pending acceptance of the
DSC DT bindings.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
