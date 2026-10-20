Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792502548;
	b=1XGKELEzCAMO9cEU/4i2IYHLQhjmC8WHcMoXz9Ga9hrJT7IveOrQvf9pd6LlTq6OUfTR
	 xMxtpOFnbeXvIdVIjt3rSlfEUYp7Fws6a5UNKGMzsiwK6xs2HINGXYaRSaPqVJ5o3okxB
	 /I9GWOoAciPPs+WiyTFFd4lF91QeiIBGujsSEoCXHMQBKwRy8mwANl9LzQWXWx9bsx4nk
	 Okf5TsilGKun8Z1opng7CizNoyFFu0o1izvAKD3XAtD5eYHkjLAY7A0NS5jUH6WXJlqHy
	 D5WRPRHN8rGO+feqVKrx5zA2YBD/HplqSYF64GDscZ1JxpA0F8r2eXa4hdgHleioULA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502548;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=D+mxgjdi4ZCAmeQ/8ywDwvDse5W9MOG3smctM4dikj4=;
	b=juTl2DN1nnatrhvxIFTkz2RRXoW6m9nh2GbYYOZdXdnOzVC/ZpOjrqE1VmDAmtPQRVcl
	 qbKaoon7Cxuvj01bipnmiM6joCDAplizTwhY2VCO7HxM8d/a/sdYIvQanJ/h8iSarQble
	 19306uJG4JsHr2U4I0Ktw5wr+lIbIfNIwQZpLsTPRMtUibTv++RcwhwxQczUWE0m0TF8j
	 0+FwT53GjJkr3Pv+Zqelp25eBpVSwnZUtZz2mEWa3qjaFew20iisSBw7T+l20T4WOraXR
	 ps+i7mcwK1Q5/Xu7NMNCRWnTh2QBujx8ZL2qi+W+oceW4TdkCgUFIMXr0p4WsIxMv3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E73606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:22:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67E73606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c2a4e013a44so425766566b.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:22:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792502547; x=1793107347;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D+mxgjdi4ZCAmeQ/8ywDwvDse5W9MOG3smctM4dikj4=;
        b=sbQ8hTIGcVqsuBv/OA/rzPEIMi/SZD2DYef+92wiT+GDlccB6QM+wv1Uvuh7xed/YL
         rcUEXrkkvdLLCOG9por87yvtFv+BiLR4hVToA5FY1N6ouMIUG/3j8zNdbB78Uli20jwq
         MREQNzFylwbMv/Aul1P2ejUse3Kx3Y4cNCwG8IDYmsVxVgUvjE4SDMWs8SEhCduo8sK4
         LgpFmlzfO5reRLOoJ0fHFI6qOmFONCEyEh8DuKYVIGwl8v7p1PB84aFuaVKytp47RCqA
         qj9TjfvjRsU8LNjiB1gYSbdH4BVIpvQrWjMZKd6EebJk+3h31uu+MSvPEm7BFQEO2ev6
         /XyQ==
X-Forwarded-Encrypted: i=1; AKwUvBzgflItt/V9ueEo7ILyr81l3R2XG13p8S452ENWYuzkEWbxzwzYrUjZiv6VzMH/GRIEI6dk2gM42USxHoU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLU0pZHe3FFNG9AWP3IxK8wHaOtwalT9qPd78mBE7We2ZSoivdy
	puegy37EOdgqaJwnqHwkSaB+ElZq9qdvYO4AMbbMaDoB4r4zhTd8widwVj78UHGyRtw=
X-Gm-Gg: AYBFou0IpDv/ClesbyAoBfpgusAf91hI4erTGebJ9jEqmmFEURFRJ9VfuSkgVkKXzvP
	LCz+dKw6+dqS/RswC5s7jFwVcsiGg9/WRiR53GcI8b/wG5PE9YYzmIL6GeXQvyem6LuMWeN7A7s
	OspPK4zEWAFIgRxkMWEyoTt8tXvFlzQyRiCSVfQaoAad6z2HA5a1lAE6BaA140KXXi91xS5aBKB
	+qhC/fQHYC35bE77nic9Wq7o/dP3v2olxbiCciwYz4T3dq44UPLyvf3GHn95Rgdpa+AHtMcCa9J
	iN/h3Cf4Tu8TSfzh4ViyPxg2rwa48Jvjt1bYAPnlqHZqMfsL7eTcU/LhKAv84pCJSFGi0AS+ld1
	HekwDPJCVSNj/deIerv51o/BCzbm9n+3a2AJwuN8f6/ldvAqFamIaWsfe6V9qzqtyaMI4kxSVXp
	OyY11K/PBVf/YXhCymK+HGygOId/OX/3zBHZ5gRDfMeeM6GC+9sIoFhPrP3TnxMNW4hswJFki61
	FI22pq1Mfz8BVw7LL79nAddO+UZL+c8j2DY
X-Received: by 2002:a17:907:2da9:b0:c45:b99:f282 with SMTP id a640c23a62f3a-c450b99f2famr384666866b.7.1792502546374;
        Tue, 20 Oct 2026 06:22:26 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb1762sm495852066b.73.2026.10.20.06.22.23
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 06:22:23 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b1aa4d71e7so3235125a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:22:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzQa3KsAYVyGV1lulazGhi2sAwr2ukHSGURz6TIud0+7m+ku+Rfs8+sCRuMYyMWayI2DAgL0HjIKRfTmkY=@vger.kernel.org
X-Received: by 2002:a05:6402:270d:b0:6b1:c7d9:b631 with SMTP id
 4fb4d7f45d1cf-6b3a8191a46mr7499369a12.23.1792502542847; Tue, 20 Oct 2026
 06:22:22 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015-epaul-v7-3-rc1-x5h-vsp-fcp-v3-0-e052903a3832@ideasonboard.com>
 <20261015-epaul-v7-3-rc1-x5h-vsp-fcp-v3-15-e052903a3832@ideasonboard.com>
In-Reply-To: <20261015-epaul-v7-3-rc1-x5h-vsp-fcp-v3-15-e052903a3832@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Oct 2026 15:22:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUHcR8-9g+KZ4Ssj+mJKYBz1h6QSjWnaPL1BcQWC6v8RQ@mail.gmail.com>
X-Gm-Features: AclHuK_uZzRO_WalfaTseMvUVupoP686uPVQ89YYU5UfnQv3EiXJeP7RDzX6u2Q
Message-ID: <CAMuHMdUHcR8-9g+KZ4Ssj+mJKYBz1h6QSjWnaPL1BcQWC6v8RQ@mail.gmail.com>
Subject: Re: [PATCH DNI v3 15/15] media: rcar-fcp: Check device revision at
 probe time
To: Paul Elder <paul.elder+renesas@ideasonboard.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-media@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

On Thu, 15 Oct 2026 at 09:53, Paul Elder
<paul.elder+renesas@ideasonboard.com> wrote:
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> Verify that the device revision register reports a valid value,
> otherwise reject the device.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Paul Elder <paul.elder+renesas@ideasonboard.com>
> ---
> Changes since v2:
>
> - Add FCP type information
> - Reject devices with an unsupported version

Thanks for the update!

> --- a/drivers/media/platform/renesas/rcar-fcp.c
> +++ b/drivers/media/platform/renesas/rcar-fcp.c

> @@ -154,15 +204,67 @@ EXPORT_SYMBOL_GPL(rcar_fcp_soft_reset);
>   * Platform Driver
>   */
>
> +static int rcar_fcp_setup(struct rcar_fcp_device *fcp)
> +{
> +       static const char * const models[] = {
> +               [RCAR_FCPF] = "FCPF",
> +               [RCAR_FCPV] = "FCPV",
> +       };
> +       static struct {
> +               u32 version;
> +               const char *name;
> +       } versions[] = {
> +               { RCAR_FCP_REG_VCR_CATEGORY | RCAR_FCP_REG_VCR_REVISION_H3_ES1, "H3 ES1.x" },
> +               { RCAR_FCP_REG_VCR_CATEGORY | RCAR_FCP_REG_VCR_REVISION_M3W, "M3W" },
> +               { RCAR_FCP_REG_VCR_CATEGORY | RCAR_FCP_REG_VCR_REVISION_V3M, "V3M" },
> +               { RCAR_FCP_REG_VCR_CATEGORY | RCAR_FCP_REG_VCR_REVISION_H3, "H3" },
> +               { RCAR_FCP_REG_VCR_CATEGORY | RCAR_FCP_REG_VCR_REVISION_D3, "D3" },
> +               { RCAR_FCP_REG_VCR_CATEGORY | RCAR_FCP_REG_VCR_REVISION_M3N, "M3N" },
> +               { RCAR_FCP_REG_VCR_CATEGORY | RCAR_FCP_REG_VCR_REVISION_V3H, "V3H" },
> +               { RCAR_FCP_REG_VCR_CATEGORY | RCAR_FCP_REG_VCR_REVISION_E3, "E3" },
> +               { RCAR_FCP_REG_VCR_CATEGORY | RCAR_FCP_REG_VCR_REVISION_X5H_V1, "X5H v1.0" },
> +       };
> +
> +       unsigned int i;
> +       u32 version;
> +
> +       /* Check the device version register. */
> +       version = rcar_fcp_read(fcp, RCAR_FCP_REG_VCR);
> +
> +       for (i = 0; i < ARRAY_SIZE(versions); ++i) {
> +               if (versions[i].version == version)
> +                       break;
> +       }
> +
> +       if (i >= ARRAY_SIZE(versions)) {
> +               dev_err(fcp->dev, "Invalid FCP version 0x%08x\n", version);

You're missing a few variants:

    R-Car V4H: rcar-fcp fea10000.fcp: Invalid FCP version 0x0000010a
    R-Car V4M: rcar-fcp fea10000.fcp: Invalid FCP version 0x0000010b

> +               return -ENODEV;
> +       }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
