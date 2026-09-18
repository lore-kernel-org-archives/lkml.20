Received: from mail-oi2-f26.google.com (mail-oi2-f26.google.com [74.125.231.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254974A68BD
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789717343; cv=none; b=HTHFSFg6b20ENkr9ZPnALY0hTZcvDhA/6u5AJzmG36/eEe1ONz+uOQq4V3wef3wEzEYFqyAUCzzJaGYTlLiCM/XX44rWow9spgnEo/TB++D/f4afZ2IcnOfXrtLAtyNAtko5KJEycVe4+XCiKtX3IJi3zbub43Xd48zkhzSKBek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789717343; c=relaxed/simple;
	bh=cHVPOWKKfhZVIB7cWuXyuW2OrGOIzBYJeXQE3IvAcLo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pvW2k8OLqU7yRGtvb22kaF4czybRcQ/RYvgSB3IuEF6y25ZmJOrxnfRZ+CuA2DDgaIMCwb/o5MSBZ1HbA0ncDTdCR8AyfmeG5KJU+DZeeQjL+5j0LUA6Dnk8ZRhTmtc9KQjHh3Nt0HvZ7FzXuiA2eRtgrccO2qWj8TgYM7bZXYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.231.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi2-f26.google.com with SMTP id 46e09a7af769-80a18990c76so310324a34.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 00:42:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789717328; x=1790322128;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0WtucTJYH5u+SsiRL/3DRg9hQeKGo+JDwDdtR43iO30=;
        b=vyVIv9gmtZUD3/giwJnmhRz61LzT9bUoyJKwzl9w38+YshYmaANLDMKt/a3YU5L9hw
         zFB4LTOgxxP2b6eeMN/o7zlQJAl/B3KyoBtJuNREP0i5a7H4hKQ0qiiF0cmP1Y4ieLQf
         AXXsCl8WENnZ7qhOknz/dpbMVl1RrHPFtLSmENYujJqjCX2isdugrmyKi0YP/BIOco6b
         ET4FwnHWByd3mnNOXgP0XM5zNNZcbQylZM0zcfKeZWr87praX312HvPEfyy/4VBtnMXw
         1zO+18z5lQza3llX1VFtbGLrm19KuQwz6k4tYWhO47Xo1IEWlLTQG+viWMh8XgIRFKJp
         uSXQ==
X-Forwarded-Encrypted: i=1; AKwUvByUOpwE/gC3Lbn58pwa2onpB0KrAZN4VzyLqyjyWbZJjnwieuxyfl5HiQvaWv49yqPszoPs7gPTkym21MA=@vger.kernel.org
X-Gm-Message-State: AFuF++mEBr1y8DHDnTYrlmeNTn3urqNduNzZ2DITJ5naFv0yRhbAvYsY
	m4PvifeqM0xM3V4eoTjqqdzjkjrqKNo/ZHjlUdfWifOzhzzgxU0MNvGSAgfaIJD+
X-Gm-Gg: AYBFou1sltkPY9yDC/nwUw88T8zypXjtISFayGd2j64axIxdqpZYjN00RkkAbSSmGVC
	4t8jh4C6l/cTu2VJiE7GMVSsLqRuE+TT7awlNdEgebpiCzw2oAiqA0oQYjX+fGgWCauvS3/0qaJ
	tH9mbVWJV9gvfAv5EwffzUZuluMgAHgloTI49XsVn13Zwie1UopZ1qdNzR5bJqr+dG5nBU1Cm4L
	VmyLyepEQ/TpjjpZpv5uzMgRiVw3kNat0BltP8GVdOIjjF/pptLXOtlvRsz9KrkXGevktWmDriy
	0TdGGmWINHwQWFrqFPd3lUXx2ZURydcTCN4v2SZz/Ek26subE3yGu7E00R0Eoes5SQMqOZJ3nuL
	IAmfUahcB5EXXiPk0F7vl4+k4b1plhR4bBy+p1RX0ZtpDp9Cx5+DTYaJH0YzE4CXEhcHzP9S+65
	bNqkfR62LHE1mATOyousmUVLWKEhQXYztghW/LFBjDx5sbrMY1qevy6rcW6r7CuQCQ/KfuuZi8I
	B4Isp6iJ/5Toe1bOgSzE+x6PzgiXEfEe06k
X-Received: by 2002:a05:6808:c162:b0:4a4:2424:eb1a with SMTP id 5614622812f47-4ccf664fc78mr2056990b6e.9.1789717327842;
        Fri, 18 Sep 2026 00:42:07 -0700 (PDT)
Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com. [74.125.231.76])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4cd691976b9sm472731b6e.3.2026.09.18.00.42.07
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 00:42:07 -0700 (PDT)
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466ccde2ad8so379355fac.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 00:42:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxfwdLj730BMiIbCm3SDru+dk1ESqKwn0ypO9bb6+a5/mBzpykmz49wGLoVBPmUw15NLMxQS5qFSCokPCI=@vger.kernel.org
X-Received: by 2002:a05:6102:91c:b0:7a3:2e52:1163 with SMTP id
 ada2fe7eead31-7a55da9b0damr516237137.26.1789716931735; Fri, 18 Sep 2026
 00:35:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917-epaul-v7-3-rc1-x5h-vsp-fcp-v1-0-4c72d4e086dd@ideasonboard.com>
 <20260917-epaul-v7-3-rc1-x5h-vsp-fcp-v1-2-4c72d4e086dd@ideasonboard.com> <20260918011156.GB145152@killaraus.ideasonboard.com>
In-Reply-To: <20260918011156.GB145152@killaraus.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 18 Sep 2026 09:35:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUWwCLiQASDhr3yY6XFY1704W3tAWEPgYw77evrK9ECRg@mail.gmail.com>
X-Gm-Features: AcwNN1Uhv0ZzlOO0pTf4pD3p_OGSBmogWfpHa_8PkhuJrVnrMv3c15ALo4pMZkM
Message-ID: <CAMuHMdUWwCLiQASDhr3yY6XFY1704W3tAWEPgYw77evrK9ECRg@mail.gmail.com>
Subject: Re: [PATCH 02/10] clk: renesas: r8a78000: Add clock for FCPV and VSP
 for SCP FW SDKv4.36
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Paul Elder <paul.elder+renesas@ideasonboard.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent,

On Fri, 18 Sept 2026 at 03:12, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Thu, Sep 17, 2026 at 09:04:41PM +0900, Paul Elder wrote:
> > Add clocks for the FCPV{B,I,D} and VSP{B,I}. They each have one clock
> > from an option of two: a 1066MHz and a quarter-divided 266MHz. As we
> > already have support for the 266MHz one, add just those for now.
> >
> > Signed-off-by: Paul Elder <paul.elder+renesas@ideasonboard.com>
> > ---
> >  drivers/clk/renesas/r8a78000-cpg.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/clk/renesas/r8a78000-cpg.c b/drivers/clk/renesas/r8a78000-cpg.c
> > index b820d09e1a195068debe8a6eea7a01c534a97b23..17792ff6ab8ae2f7eb5c8f7e3d581b43177e195d 100644
> > --- a/drivers/clk/renesas/r8a78000-cpg.c
> > +++ b/drivers/clk/renesas/r8a78000-cpg.c
> > @@ -326,6 +326,8 @@ static const struct clk_map_in r8a78000_cpg_fw_4_31_0[] = {
> >       { R8A78000_CPG_SGASYNCD16_PERW_BUS,     FIXED_CLK(66M) },
> >       { R8A78000_CPG_S0D4_PERE_MAIN,          FIXED_CLK(200M) },
> >       { R8A78000_CPG_MSOCK_PERW_BUS,          1667 },
> > +     { R8A78000_CPG_SGD4_VIO_DP_TX,          FIXED_CLK(266M)},
> > +     { R8A78000_CPG_SGD4_VIO_DP_OTHER,       FIXED_CLK(266M)},
>
> Same comment as for 01/10. I think the two patches can be squashed
> together actually (unless Geert disagrees).

DT binding definitions are shared by driver and DT sources.
Please keep them separate, so I can apply them to the shared
renesas-r8a78000-dt-binding-defs branch.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
