Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.218.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792450907;
	b=pHFzGF8KosUyaj94lbGSbDQkrvSOw8tkDNil0DhuQg3GhTQNK4I5FQeKEYgcz/c2MOuB
	 ZPdJXFxfzkIfWjo9xUCP+PsCwIwPH5QPngu1X7UNY9s6VsesvsqbbdA1yaESFKm0z006X
	 75hnK8GtAndFo5cAFvVItdXkSh5T9FkNRLj4jGO/qEcR1b3YxWDBrE5dflhHVqZAmCUjS
	 gnwR52UuM5qpdmgdTNczAi0m8gRW/TikSskvj2380Z5SmzE7TNb82Kz9FHBHMd6+2oBvK
	 G3/lZzDWLWe6qKIYjmAmem8eudYkCBpkEbT7df+0t2K05JwVWkazvgs5eTa0q+I5SlQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792450907;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=r0vEaLu+DC0I1E6m16+4V7ipgHwAyo1JO101zy/TgUk=;
	b=esFFoSAWhv+ksiah5FH945ldNOFWuJqcLohRuHLqSyScpEm6xsVW64UgsrLupciI+qCy
	 GABIpmpPdnP34WeHXoVHvXPg7U5SYkiSG5KF/a2uKUYC2VOANXXCa1xm49CbaSYMPO24G
	 H/ddIzMPsayThYO9m6h377VkFLmfYRGtlBsv88IVvG/OnM0qvRwDKallSOyqPQEAbDvVA
	 336sKXaLnLjsdZQY7KwNhReHKbXdtfF/nTfp5Tq53AhH/AEpCsnUGYCVZXJN0U8CRj9+J
	 DmDxQ6MYwe5G59jJ1/fqUzMaouSuShsmCgBosuYJdVuPE/+X96X1A1EOX/SEQpccEYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lSWMQ+mA;
	arc=fail smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF344606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:01:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF344606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lSWMQ+mA
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c34bff61551so371652066b.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:01:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792450905; cv=none;
        d=google.com; s=arc-20260327;
        b=r1qGn5dkpJmb9M1I1plP1AugYKNx3Vkcru3pbB2dCj4wB4An7IqCpB83/tQARZ7By9
         xyCNYGfVfzHaIRbAZq8dWlboiFDVD0hjMNedwbht2M89QsyIbZ4f7n3+HIvLzYsrncZj
         voJUoWRAc3x93hmwjuj7ok6A+D3fNq4LanQwNE5wt5HGRxuzu5udhayMNklxIZZY+fBZ
         iwl8uuJD4u6qwraEEsYRQCSr580oASzSd4GqrmF4U9k4UBmL2ck07wzwv4LSWI0smBTm
         TNdvO0fmgM80fxUXaNeq6ZbVyrUG6+UrQRBCIy/EwUWPV0A7BkmTYPsbHIIPWdmsMi2x
         07hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r0vEaLu+DC0I1E6m16+4V7ipgHwAyo1JO101zy/TgUk=;
        fh=IIkXRilgRoMeBYYGNe1t2QJ3As/N8LIO5ZhKlUv36RM=;
        b=g78wGjUmcHY+XKlrS3RoQgvx6d5thg3UX5sAfHQSRx/1YyYAo+J/gGCXTLY+N4IWNJ
         eYqooGfX9FeO/sfbqwaesXY65pByZ3t1ojDnwvH/hQj1tDNg1qhUA7IeTq1IGyWRn1g6
         suAu7vaiyv6Jp9+gG2ZMpxDaa35ji4/FouLil6oVkwclaJcXfoRu6Dtqqlm37zD7rKeX
         c+O/Gsq2RBzCvtoMJzzhZjQ6Zet6vBX+R4860QdOBG3PtgjEdwKsBi6LwyHs3f26M7a2
         XWvV877VxmTYnN/kwciaRakQi0EuoT4rcd38kgq6uuxRx00BuMnPpYJtdbsjEPmkEHw0
         dXvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792450905; x=1793055705; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r0vEaLu+DC0I1E6m16+4V7ipgHwAyo1JO101zy/TgUk=;
        b=lSWMQ+mARUpGBrwe6Y3hefSsBmuR4/334vChRM6PJWGzi6Cnj7mG0Nqh93HjiDkK93
         V829decEkWb3A79Y6/oVT3aWoGQj14dQZIKnJsFMD7AYZM0x0ajcyoycKwDKPULrf5jL
         ztWiRFvDywJh7rhrplIiOLkJucdhPmxK45AbrB6jv04TsiMCutIWTaxyl+Srgn70Wybe
         9SpgW+KJbY32gVdBrahn9ZvRcpef18bnAxpJZgPFqf1pajoNZo35GHDQclqKeXePnMP8
         vG7UK0TZunBJnV/rrD81aK+Lk9bcs+KgG6tZ/qowAQZK8Zv/14lbOC8WNJdptiCOL1Eg
         p3Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792450905; x=1793055705;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r0vEaLu+DC0I1E6m16+4V7ipgHwAyo1JO101zy/TgUk=;
        b=L0K1R7yeKF5V3MhZu/MdWS2nqjwRCjwPgiTs77WhW2WbKAgcQG/S4Gv0w1Ly2kZ880
         c9XMslUZPC2GksDP1Q/HegcbiH3EzX/66iFxJtY1ueMb08u9rpKAvc2FIj4YlIfjNWQU
         1WBRCGp7yzxyYAot4t7oZb6hO/kHbRQagtbIDAmG37XVKBz0btDtN2N4Bk496K/t0o7n
         ZeElsNq54mph3mocP0p8xhkBbPwB1cvphsypnY7/QKguZunv4KYSySR5aKVd7J+Jkx+l
         M8XXaDP1Sta3k/WpAAOP6K/6YJsZ8FfX3/uoA4UZMy8mEWSWtFMqa0a5KUxPb6ItFxxx
         Aw1Q==
X-Forwarded-Encrypted: i=1; AKwUvBx/ELPrDHSBAY+4fL1Sm6iTIHVv3QerHMLN+mUd+5ugfoX24a/YfDgh/kdVntlW6/xSZTxZQTDQfs2Y538=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPPAer3HjwZEXzI7zw7FUgYD/LGWQdyA6rGyVLEfyYkUB4aedQ
	LVRtMi6uaRUmPfrjgf2Jp63zllz5tPhaL7Vr1jHnMUT0KyFLobgGQhAxdnJE73XQn7jrLMFgLoz
	YpYD1ystri7hcx8iaAHIUxH+Nhlzruw==
X-Gm-Gg: AYBFou3JKqVfq3W33MZreEJHMbpeSC2L8y9+fQszvL3ahzFyHkWBPXNMPAUzMknFjAn
	PysKVDsZ9015KJX3N26m+T6n44jeSWK83wqbmvC/RVKDSHrvJj75La2kSdBiTTChRSApxohd5PF
	ppVoeYb6NHjiIG4jhYPdjW+fhV6NFQcY30LGU3IZa2Mvtf8KGx7peTK6YWUqx7lMb1QXQBuLVGw
	96m3iSpB6kWxQsPtz99VQqm23Eyz9l8UVSdKrVuCk0cSEd9AREcEj3YJbhxIg2dVpp2dxqPEefa
	qmmnSiKI8fw8/mker68IGaCd/w6wNG5WKGI6y0WZonlmChNpEPL4vw/5BBPjdS2jBQy5op8nu/a
	bOAHYY+2Xy2qTeVynOydXiBu0Dr4tIUHPd01CdtVtmWOiz24sHAIx/D0pBIqxG3/mAMBQZg==
X-Received: by 2002:a17:907:7282:b0:c31:866c:9696 with SMTP id
 a640c23a62f3a-c419ef274e4mr640187066b.31.1792450904944; Mon, 19 Oct 2026
 16:01:44 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018024654.3913088-1-mhun512@gmail.com> <20261018024654.3913088-2-mhun512@gmail.com>
 <20261018065442.GC3577260@ragnatech.se>
In-Reply-To: <20261018065442.GC3577260@ragnatech.se>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Mon, 19 Oct 2026 19:01:33 -0400
X-Gm-Features: AclHuK81kf5sGjsveLlYf_EvL3ALaDVS59y4IbiqZrlq6hPfPGs6TazFFH6ntZQ
Message-ID: <CAGEsz8Fa3Hhve3hmKEcWdGENtToKxztHPqaOxkoU-rai-NPV4g@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] media: rcar-isp: distinguish absent cores from
 registration failures
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-media@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ijae Kim <ae878000@gmail.com>, Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

You're right. I missed the resource-probe error handling.
Sorry for the incomplete revision.

I'll review the code and error paths carefully, then fix and
validate the series before resending.

Best regards,
Myeonghun

2026=EB=85=84 10=EC=9B=94 18=EC=9D=BC (=EC=9D=BC) =EC=98=A4=EC=A0=84 2:54, =
Niklas S=C3=B6derlund
<niklas.soderlund@ragnatech.se>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On 2026-10-17 22:46:53 -0400, Myeonghun Pak wrote:
> > risp_probe() interprets -ENODEV from risp_core_probe() as an absent
> > optional core and continues with the channel selector. Keep that result
> > for the existing resource-setup fallback, but distinguish it from a
> > failure after core resources have been initialized.
> >
> > The following patch moves the core IRQ request after RPPX1 and the
> > registration state have been initialized.
>
> No it doesn't.
>
> > If that request returns
> > -ENODEV, its error path releases RPPX1 and the VSPX device reference.
> > Passing -ENODEV back unchanged would make the parent continue probing,
> > although core->base still indicates a core whose resources have already
> > been released.
> >
> > Translate -ENODEV to -ENXIO at the registration error exit, after the
> > existing cleanup. The parent can then handle the failure using only the
> > return value, without inspecting core->base. Leave all resource-setup
> > results unchanged, including the existing fallback when VSPX informatio=
n
> > is absent.
> >
> > This prepares the error handling for the IRQ lifetime fix in the next
> > patch; it does not depend on an existing -ENODEV return from the V4L2
> > registration helpers.
> >
> > This issue was identified during our ongoing research while reviewing
> > kernel code.
> >
> > Suggested-by: Niklas S=C3=B6derlund <niklas.soderlund@ragnatech.se>
> > Assisted-by: LLM
> > Co-developed-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> > ---
> > Changes in v3:
> > - Express the distinction in the return value, as suggested by Niklas,
> >   instead of checking core->base in the caller.
> > - Translate -ENODEV only after resource setup has succeeded, keeping
> >   existing resource-setup and channel-selector fallback behavior.
> > - Describe this patch as a prerequisite for the IRQ registration move.
> >
> > Changes in v2:
> > - Split the error-handling change out of the IRQ lifetime fix.
> >
> > v2: https://lore.kernel.org/r/20261015004159.2202899-1-mhun512@gmail.co=
m
> > v1: https://lore.kernel.org/r/20261011214448.2043581-1-mhun512@gmail.co=
m
> >
> > Compile-tested with Clang 22.1.2, W=3D1 (arm64). No runtime testing.
> >
> >  drivers/media/platform/renesas/rcar-isp/core.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/renesas/rcar-isp/core.c b/drivers/m=
edia/platform/renesas/rcar-isp/core.c
> > index 586a5adbedfa8..373d9ca9374fe 100644
> > --- a/drivers/media/platform/renesas/rcar-isp/core.c
> > +++ b/drivers/media/platform/renesas/rcar-isp/core.c
> > @@ -894,7 +894,8 @@ int risp_core_probe(struct rcar_isp_core *core, str=
uct platform_device *pdev,
> >  err_destroy_rpp:
> >       rppx1_destroy(core->rpp);
> >       put_device(core->vspx.dev);
> > -     return ret;
> > +     /* Do not report a registration failure as an absent core. */
> > +     return ret =3D=3D -ENODEV ? -ENXIO : ret;
>
> This completely misses the error code from risp_core_probe_resources()
> which, as I understand it, is the one you initially wanted to
> differentiate on? This change still propagates the return code from it
> and just chnages -ENODEV to -ENXIO if it happens to be returned from
> v4l2_device_register() or risp_core_create_subdev().
>
> Please stop using an LLM to throw spaghetti at the wall and if you want
> to have this change read, understand and change the code by hand.
>
> Nacked-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>
>
> >  }
> >
> >  void risp_core_remove(struct rcar_isp_core *core)
>
> --
> Kind Regards,
> Niklas S=C3=B6derlund
