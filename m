Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381FB40BCDF
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 20:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789503361; cv=pass; b=fN/TV7kYpC4fxqO/xTslmOrx6N3wd8V6VdB+tQjL+x10BK5SN6B+7Gvm5nAKywgLNNrvRFUmsfd0tZ/9LeNYGd6iVWzDrRBhaa3Udxoq1BZ/AWRUUzG0KIcaNVaBQSMlVPVvxssRR2vJkgjhiBvko0L0RwdJKeox+mb0RlNMgAQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789503361; c=relaxed/simple;
	bh=tIo4II1d9ForEs6449DJ6tBTc4LuD50qTRo8+K+5e2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cxvqOQqo8g3ZL8169wgUpoztLbgplBNOqmYfqVyaOLHvk69HfLsIy3P2+IhPgzthE+Iu9V2lZFhAMAlWVwUZqER3zhfjIVxTvZrWSJcpXgEE7A6ae8ZUa1CXPsKOJT5XuLs51dOlGrHzH4sBkGUTZewEsSE1Fw/bODl2n5XTR78=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kMFK/xdh; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kMFK/xdh"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c25bf832368so3624066b.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:15:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789503350; cv=none;
        d=google.com; s=arc-20260327;
        b=LoXy/3ymtw8rcR3DD+r/sNh/7UAM/Ao3MlAWTR5FvPB146KoYrffZ0amXVtB7loBsk
         JzCqLqrvnQa5b/gywgOOnqTeCXsbZwWL+H9yYhMSIm6y8gufi76UJwwWIVXGw36LZcPq
         9wS1Qh/MAGORxPX7tfTnt/Gyluf2tbrnGgXZI3wM1yhuGtFvxFDa4svE/PRmNxFjeWs9
         RZtwBzPfUm4JMlij9iEL/5pUUnVnvKUHQolDdIxFie0TdyWrVoDRvy5IPyvbjBKj7toB
         fqiWey5YCG2R4J7qaEtzpfvwX6NAUkJ6AXxrJ7GrWNu9ape9PTfScDGdUH7HMwYLt9nv
         9Uow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EMk9jyFcs1z/vsVIU7tgrrT3h1+jFXhNZlrTV/0Lq28=;
        fh=v0lHmBiwvEtlcUCi0Yf869ea8atGfx036IojAe9+/ow=;
        b=m6q6ezjOXAS/KLnlpmxEjXRQOB7j4P2q79buoV/Hw5nZMOeGQlZdG1T1W7zsEfLXar
         22XcJhQDNmHHBTOlGspP8mWXpBd08tGl/GWZYGVyMPhrzH7An3XNSEs9l7YEHN91Q4Rw
         XYaOH+smn8fPBtRkQHI+h9ZqRT+UN0YMuHhLqez55HUbIfTrqWx34Q91TFZ9F1yxPeQ3
         ciGDdSntaSzANbk3Xo9KRYDlWnp2KF3i1OJ9Adrz18SeafTsv8oyjo6oFcnkuZ6zyXhj
         6XRmJ6oUdUMRp0mC880vFXklMXpjhFhb9AZ2ddTGiqmXCrrB/u+JWFFd9pmk7peeOsrv
         S9RQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789503350; x=1790108150; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EMk9jyFcs1z/vsVIU7tgrrT3h1+jFXhNZlrTV/0Lq28=;
        b=kMFK/xdhuVPYWFau0SVnAOI0dP1+C/ya4QEGqAnK+/WVuj4My0qAoQvVI+BKoY1ZwI
         NNABdWF+rnRpE/BFKhqhZ/72374Gy9eqKQpfsepDHKgixJYqiLHKeF7uqSuwRIr+AFw7
         8JTPpKKSxCJQVvxWu8uSG9skZAQ2M3M9ggXG2ixYT19P0Ks5ehXSvpBZtpa4O59JsnUE
         AEmjUlBrtixnd++kPKKOnZG0n0ogjzJEPniFUASQttiJrfpK73sW0IsgwVTbUlIwDL83
         B8pt1JK0UJ20OQjry6Fy4j7Drm8AoJ0UIWSLyNEBfmWDCEDeQ0whVitGHVB5nO2aKI8B
         vaZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789503350; x=1790108150;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EMk9jyFcs1z/vsVIU7tgrrT3h1+jFXhNZlrTV/0Lq28=;
        b=otIYd9DdGFXUi3j96e5MMG/XGPUg+3ZJDKx02SegR1MMmAnUvu1AJz94LjeuawwPvO
         bhv5xbckm14jU5bHqJt16IsKXcqA0UFhMG3IFOkQj8qTtrnvI9ATV8R3eoDxZdjBDm2H
         yOgznAJHb1+fayMjc2O1Jg6mO7PpuJkr4WyVavAkdAoxVM28mwcsgZb1u2q7PY2Mvyl6
         yV+HRiE9H3sMacnYshMWoby8ByOZFZRLDz0MYNT20O5HDXcQtibKgE/2GZ+50opLfsTy
         uX8EKOIbK0l2udjSDElSOFY2Y2v46j9r7hyo3b78iKSVaPO7XW0wZ74Pd3NBjgHYlQlf
         WI9g==
X-Forwarded-Encrypted: i=1; AKwUvBx/Tpq/nQ+7qW5docVnD12GiJq60qQwTF648GZ7kpzQot5pW4uknjHkZ6KpzyrzeewV652fq0qQUYFKefo=@vger.kernel.org
X-Gm-Message-State: AFuF++lxt232uj46HzdV9P2Ul/WpUVivE+FY+sVYxbvqyCthMhx4YD2B
	9pxltfSlaF1lSsu9eW47TCoi1RVq3WIlhTWVjw9wXDeWLwfQJzKr5FVAw0ZgIR6vtgRB2DX3i/1
	pXPjaZO/Cw/ZzXor2u5kPX7CmGGFUFU0=
X-Gm-Gg: AYBFou2fhVJ7iNrRc0vUkdEV0/YtPBRzAdH/K2WvMIlfwgTm9MxGa768doDNi7zvmIB
	NGCMOjPMUtQxsWG3njqfZ0ARovWMDvup+jCsxbU5bHU7tZe3TGYdHJ7d0YMr4BvBQliEqyyJwVh
	m6AQ/9BqRRaHvtFSKq3Jqkjlh3Tg3NH4KI5RtW6tjjpgs1cmlyy1jM5bd6gE9LMgwT6/dMV0J+7
	Kwz8XICPt/o2l+0Acr5XlKMNZ4yyt8dfG80rognWzhT2d0D9RBHumwk9lGRVJ/VMv/xOlprBIXq
	t0gTyufGGAXWjT9MWEdHo7qF6i2PvYeJBeXz3199Rcszbdv96JYDowA=
X-Received: by 2002:a17:907:94c1:b0:c21:7bf1:2c88 with SMTP id
 a640c23a62f3a-c29b86f6a30mr608631966b.2.1789503349926; Tue, 15 Sep 2026
 13:15:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911-ti-dra7-omap-sham-fix-v1-0-c430f01b4e13@gmail.com>
 <20260911-ti-dra7-omap-sham-fix-v1-2-c430f01b4e13@gmail.com> <20260911082406.05e2a212@kemnade.info>
In-Reply-To: <20260911082406.05e2a212@kemnade.info>
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Wed, 16 Sep 2026 01:45:37 +0530
X-Gm-Features: AcwNN1WHlqVruIX69u_0BS3IFoNFccfPURE_yLQbZJm0y0g2wehRCyWKILewqPs
Message-ID: <CAOWyW_5s++Sz6EFEX+zGTca_-xZvK29B88UzoEzsaP+QavF6CA@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: crypto: ti,omap-sham: Add OMAP3
 compatible and deprecate ti,hwmods
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Animesh Agarwal <animeshagarwal28@gmail.com>, linux-omap@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 11:54=E2=80=AFAM Andreas Kemnade <andreas@kemnade.i=
nfo> wrote:
>
> On Fri, 11 Sep 2026 03:41:58 +0530
> Bhargav Joshi <j.bhargav.u@gmail.com> wrote:
>
> > The OMAP SHAM driver supports OMAP3 SoCs, and "ti,omap3-sham" is
> > actively used in existing dts. However, it was previously missing from
> > binding. Add "ti,omap3-sham" to the list of valid compatibles.
> >
> > The legacy "ti,hwmods" property is no longer needed as TI OMAP mirgrate=
d
> > to "ti-sysc". Mark it as deprecated and remove it from the required
> > properties.
> >
> > Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
>
> What about also removing ti,hwmods usage while you are deprecating it?

Omap 4, 5 and dra7 already use ti,sysc wrapper and don't actually use ti,hw=
mods.
but legacy omap 2 and 3 still use ti,hwmods but I don't have hardware
to test changes.

Since omap 4,5 etc don't use it,hwmods keeping it in required causes warnin=
gs,
Deprecating it and removing it from "required" fixes the warnings for
modern SoCs without
breaking the legacy ones.

Best Regards,
Bhargav

>
> Regards,
> Andreas
> > ---
> >  Documentation/devicetree/bindings/crypto/ti,omap-sham.yaml | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/crypto/ti,omap-sham.yaml=
 b/Documentation/devicetree/bindings/crypto/ti,omap-sham.yaml
> > index d69b50228009..3ef05890e13a 100644
> > --- a/Documentation/devicetree/bindings/crypto/ti,omap-sham.yaml
> > +++ b/Documentation/devicetree/bindings/crypto/ti,omap-sham.yaml
> > @@ -13,6 +13,7 @@ properties:
> >    compatible:
> >      enum:
> >        - ti,omap2-sham
> > +      - ti,omap3-sham
> >        - ti,omap4-sham
> >        - ti,omap5-sham
> >
> > @@ -32,6 +33,7 @@ properties:
> >      description: Name of the hwmod associated with the SHAM module
> >      $ref: /schemas/types.yaml#/definitions/string
> >      enum: [sham]
> > +    deprecated: true
> >
> >  dependencies:
> >    dmas: [dma-names]
> > @@ -40,7 +42,6 @@ additionalProperties: false
> >
> >  required:
> >    - compatible
> > -  - ti,hwmods
> >    - reg
> >    - interrupts
> >
> >
>
