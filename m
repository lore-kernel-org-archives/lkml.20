Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B8E1DF98F
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 03:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790826255; cv=pass; b=Q4IH0GdqZJvEsjifhC4dbdwaQJn4ePxqP4v3qmBFbzk7DNEOe7npWq0iZH7BFrprj3j8IYTcwHcFCdvcF9LgstG+e7yU6FloODBxQm2TkOlL6p3OH9UECsteBXqIsUqfORM9kx/PevUg9mPIXNsGtsRCKtb+30m95K/bNkRC00Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790826255; c=relaxed/simple;
	bh=LrQWUWcyoDeObLLAUc8VHSE0FIeAJ25asgQVsl+itso=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eMhRhA9gBRbgE5D3fQoSEGSPZSB4nMo4lhzmYrn+DpUl4I7HScMbs3FTKKXldK/7aveM1PA/nGAjnJFtnjfoICPykUjolLL7cP5uVSwBYZ9lcXEIHiqbnWTlW3SUmTMk0k5xzPYqmnz0QG1Tm18mduheXTByrlUa3fO9+4ADCE0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o9Jc1zxA; arc=pass smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o9Jc1zxA"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7fccba9c675so2044619a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 20:44:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790826252; cv=none;
        d=google.com; s=arc-20260327;
        b=hNuUTgTHvuj/pZdg+DN1lcMk2689+pJ5R1VQO3y56QDL7OG2pAGWL9Qv4/N2K025Cs
         YGYro1DiiVApe9YLHVgb9s6v4nVjnrprRZMzoG0a/fpUHo8AwAzHQuZvIHFtMhceVM8v
         9k29HygXXiOg7nMubEeqCCs8fPI4xCBXznHUVuFltO2/r4/vSOFwMrxiESElKgFoYx7f
         zcbiOjctyO7CkXYc57pD1oHmDZh8y0qrXbnbP4ezs33o8qKDhj4nvbRZp83xu86UzQoC
         kGzQ9JZsOWGtLbE2rCy4N4u7EQwR5Trgmip0oUYLj/mz0p5mElKmCwnugEf0BM7S//JM
         iIhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w4ijuTp5svOtTgrjejnJF22Eh5tEOHO/CkeB5GXCR3I=;
        fh=42r8KtOtun/FnTPIy6An9pSFKGBQeS08IiZZmBiwj4E=;
        b=EiS7/X/nBfNA9phMLkS5827bOb3ZfSUpvMyQFc8lmIaW+q+By2KIP9LH84nYPH0+sJ
         6reMPM4IOu+iXLGnd1fWLVmXgn87WUwmbPtftZEZsEpt+crqj4U2zbQ901sUxH3K07RM
         mRjbNwxD2RE/GWuMgwJNGmMvgjG90saq/x4pOYbvIvwcgwOcrU+aX7QPW1vmTJBVo3Bs
         MJNsuiFEPztG6JY5KokwC5NHPrS++Wdj/StRtVq/jj8X0GXW0BwnKLHGTHrlfxW+4Ps4
         jaouibDcQPSDvYRnldUPqOnAjafBRZfb8Q6Ew9yzP8zLWKH1BnAOWo+gwCOli7PLd7NH
         bqHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790826252; x=1791431052; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w4ijuTp5svOtTgrjejnJF22Eh5tEOHO/CkeB5GXCR3I=;
        b=o9Jc1zxAb92HTvsoBZV+o+DGs/vsigXorO3UyF0yWl6ETaIFoCdaWFcnYsKbkQIsiT
         PqjlFb8c4gpi3qxABs1PJhN5O9fqNgVbB3FEeHladfxFP7uxut/9RI5eLgq80z/gDTXz
         YzO1N1j3t3RhEiWsgzsfC1+QfVMhzwA9TdWarQxiLRJh/jrWizyXnzS1xNsP4JzdPoOV
         Lz5yHWpPEKG6w/4Z+QGl6OMhEOkTsQO45UvDo4HNYWdlEWThIPQJU4x1TY7o/bJtnG8r
         +F9nVVlDJqNwhNDhXvMvye6drzN4OVYWFwneF5FsTjsDTHh6kfh3hGxIBjLdI28s3Xq6
         EiAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790826252; x=1791431052;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w4ijuTp5svOtTgrjejnJF22Eh5tEOHO/CkeB5GXCR3I=;
        b=TQGreRMAwi0pRm02v8X+kD1hN7uRdyEDhtN7Q6KJGZUo+u361KDA/PXJSrvmZcn0IT
         OV7/MNPVhliPxP7dmCAtOoRVQ2q+jsAx5a7XSrl1U9hd9ufa3O8QakJiFbQYvn5IFz5I
         sfbaSfHidPl3T0g2Ph7bJ02+aee1WD8NYuAmEAR5iPgs8mq7OMpVkU+9YtvjU5aeFPsD
         qdiKIX8fpuKDARCsErk7LoqylWOaDrrXiSX0JT9/RucjKVx/eiTuUByiiMUZdlrTbA0G
         2bgvMXALmWvgRQS+Y1M1468J5mTqGgYRpjcbitrlTdf1SvuDOWcwJflWZJY2Pt0+eISK
         VguA==
X-Forwarded-Encrypted: i=1; AKwUvBzyyTLueug4nCZZGD0aXyFTcemLv2rclTDIbYktBlTqHTuvMklNprPcfRE/dFXUNWb9QQckeuAqhwjt3dI=@vger.kernel.org
X-Gm-Message-State: AFuF++nMOvIOfOTgqfMgdEvI2+7/eV/1uxEqoSsRdfeQXp1VDoBdbFcv
	KyJYjj3OJ2b/1LrsOOgRj3dUwgcAiJvZ4VbWkG5l/Q+vpsyLV04N/3ZI3mF8gyvDlwY8TRxIAUe
	gz2Gz44RZMSw+9+W5FmhQviPFm8mjtoI=
X-Gm-Gg: AYBFou1BWNial6DrCHKtp+zOimQP42HdSEyCMwFvRpnRoIHpqHqowhNZIVmuRG0k7mq
	qsOSuxYGi4FnZO4BBkkEwDDkcM4DFrnDpVWufZNy+LBpYRnm6gXgT7ASjj6ZuQMG3NlqR+L9Z7U
	M6jvHjbehJv87CrzZzB+f9aI6+cGPSQqc32fvgyKR/v5g7feH3tuCDkUxQtIEU7I83q/IERDBqY
	iuN0vvoj1jIAIKC9r36wl9kvjxG3tgv5NDoLf2a9it3ILC1Nvlb59I5khFBUXHkd51ai3/5KkuA
	LDu7/SfLmgzaivuDjU5Lct/2lPjIxl0U7rlm7SjR96j82iYODKqiQoHeFVWIKp5n8fA=
X-Received: by 2002:a05:6820:4cc7:b0:6d9:58a1:824 with SMTP id
 006d021491bc7-6ddba7942ffmr1480642eaf.22.1790826251774; Wed, 30 Sep 2026
 20:44:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926-b4-mt7629-toprgu-v1-0-c124bf9ac273@gmail.com>
 <20260926-b4-mt7629-toprgu-v1-1-c124bf9ac273@gmail.com> <20260929-spiffy-harrier-of-snow-b78e7b@quoll>
In-Reply-To: <20260929-spiffy-harrier-of-snow-b78e7b@quoll>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Thu, 1 Oct 2026 11:44:00 +0800
X-Gm-Features: AclHuK9LNVBWetA4umqzLuoUjfCXVTn1WDE30aATZ75mv1-R3SpbZ9mzZOo88bg
Message-ID: <CAJsYDVLimYZXk6mFrnsObCYFnK3HxqVJpuee+msnCi-GAUTXbQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: reset: mediatek: add MT7629 TOPRGU reset indices
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi!

On Tue, Sep 29, 2026 at 4:44=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Sat, Sep 26, 2026 at 07:13:59PM +0800, Chuanhong Guo wrote:
> > Define all seven reset IDs documented in the MT7629 TOPRGU SWSYSRST
> > register: INFRA, ETHDMA, DDRPHY, INFRA_AO, CONN, APMIXED and CONN_MCU.
> > Use their register bit positions as reset IDs.
>
> If so, I say you don't need bindings then... but fine except:
>
> >
> > Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> > ---
> >  include/dt-bindings/reset/mt7629-resets.h | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/include/dt-bindings/reset/mt7629-resets.h b/include/dt-bin=
dings/reset/mt7629-resets.h
> > index 6bb85734f68d..828919eee298 100644
> > --- a/include/dt-bindings/reset/mt7629-resets.h
> > +++ b/include/dt-bindings/reset/mt7629-resets.h
> > @@ -53,6 +53,15 @@
> >  #define MT7629_PCIE0_USER_RST                        30
> >  #define MT7629_PCIE0_PIPE_RST                        31
> >
> > +/* TOPRGU resets */
>
> Didn't new bindings switch to continues indexes?
>

This is written for the existing reset driver in mtk_wdt.c. I don't
want to add a reset id remap when all the other SoCs in that
driver use binding ids matching their hardware bits.

Is this OK for existing drivers?
I can also live with plain numbers in the device tree if that's preferred.

Another option would be to include mt7622-resets.h for mt7629 dt
as their TOPRGU definitions match exactly. But that would bring other
unused mt7622 definitions into mt7629 dt, probably not ideal.

> > +#define MT7629_TOPRGU_INFRA_SW_RST           0
> > +#define MT7629_TOPRGU_ETHDMA_SW_RST          1
> > +#define MT7629_TOPRGU_DDRPHY_SW_RST          6
> > +#define MT7629_TOPRGU_INFRA_AO_SW_RST                8
>
> Best regards,
> Krzysztof
>

--
Regards,
Chuanhong Guo
