Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1870D41379F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 09:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788512650; cv=pass; b=DYRv9Z0GqZdlqq2z97e9N/thZ2T8B+WAqi1bx74lpiPAz/hm2MmOYKO10oBLMg/DCYi+c3mkGIPJRN3YUajiasNfOpl3NxzrZ34P9jpSuVPGflRSWMM0AOJKsngibDm8p7UKaQPQIE8X6M5idPotPrP4awSyv3EL5D2G8j6qB9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788512650; c=relaxed/simple;
	bh=k9qAPKtYvovu8qXJCKcDvO86yRXk72wYQsBLiBbmLP4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tfL2jVMhc0Cl/tFvZILOnsX16PdU50Cnfua6Jijg6Tw+WrPONxi26Hos8JbrQmi1udStGNEWc0FPmEI1RKxG2X34ONiRl8vbFaU9hmQFVbdafzBd5kG9icliAQICO4WeOHLHB92LEm4w2KbcWMUlp8qSnUTomcBxmBKJYGMNEbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xq+WyLCb; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=PLHyuwTN; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xq+WyLCb";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="PLHyuwTN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788512648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q31ZBmdW8hNNfLkDMMwoS1IW8VBGns0g1GPgqGkxWn8=;
	b=Xq+WyLCbe8w3RksPIz8JzF/OVf4CYKuevX6z+iYxbKU8+xHa5eiGvcZEw2nEAP3Fve1S3R
	b3/8ePbWqcoYFLuWrECA0rEUuXJ5joc7exC5iSlAjlJocSLzgFLzlduwpEd5qZVqQVROKU
	SNCjp4ibvi6T8pgHPjTZ9mZxpZRp2Wo=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-530-IAD9ALmOML6dTIOSjhckfw-1; Fri, 04 Sep 2026 05:04:04 -0400
X-MC-Unique: IAD9ALmOML6dTIOSjhckfw-1
X-Mimecast-MFC-AGG-ID: IAD9ALmOML6dTIOSjhckfw_1788512643
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c252a2ae8e1so81623766b.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 02:04:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788512643; cv=none;
        d=google.com; s=arc-20260327;
        b=Rdb+V3H+jZwbVtAGBUGpTF4G+owXxxAQkU2kDAbmsW/y1IGMwgg8+Uhf5PmdzePika
         PcSnuBgoe2/NbW44z3MxBJVSTxXT40A1os6YScDZAUuX0wtxEjNXfFXpKHxYvAAchOD4
         VYAFB0Nkb9coo6n7XATcHFPoKskN0PeMyE2XwL4lceLRPRKUbvrpDummWvkDlHPkW8It
         MF1w8fuXjhjq02zeRBp8pMofQ2ZxIg4A60t6Ke+V+qNTKpn2xawChlbIy62IsnkWnzEE
         16ZkegC5GrxB1cDjmMxTDVvFy4zyfx65OsWLxf0bYmeEXVTAetUL49r2k3jYk+rUJnCC
         jBaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q31ZBmdW8hNNfLkDMMwoS1IW8VBGns0g1GPgqGkxWn8=;
        fh=Ud2T6o1EmwKjMycXk4PKaE2nva8sEv1jKp/7WT2OTZg=;
        b=rozcniMP4TYf6So14nX8HGsGpkFat2U4zcTiRNbDbnbsTvs7MAPOTMD9K6L1piPMZk
         FoXcFJ6MfMF2IFzdq+ZoAZnZOzKGy6QBNMrS9/W400GS+Mn7Wm+gvIGJGq/+RFb+vgaY
         ZIWeYvJ/sdWgsrzBzwkz9FPnFujxao00jTM1rwF3Ss28PUB9aQqO8lCo+Mk81rFb96GG
         mBvG9WaR45Q8Ehjrejcf/IbuvhuisrvOqpIHCWym5J0JxG+ZisHX5D32xlZEbIikyrP4
         lVtNx5abJ9P+coFAtYr3kzAr3fI1QYKpdKZJBNLee+6NkMLNmJInXNIIVvSinihV0R50
         UnaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788512643; x=1789117443; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q31ZBmdW8hNNfLkDMMwoS1IW8VBGns0g1GPgqGkxWn8=;
        b=PLHyuwTN3rPAIzrIZlkpObUGq1QLxYaJz2vWGUrpeZWyjDOdSQU2qloGl47krxOx2g
         L+D/jVOzzNiNTE1APE0gmFtw9yZ6BPijNfqWSpxkZiKMrBNnoUSdb9hLXAZc1DZe4FYd
         2m2Wyw8F31w42uMxVBbP0+qoSKaiIvMRmbJXVXGIf5wwKsnFkYIh80PAor93qI2CcrIn
         F99O3iD/2l2Qu22xEfhxc9ugDy08ImkVlXYNYx9RbuSt1ADQOtge6d1pr/f0u62odJ7+
         2LoCEtaVx8WDrETKcFo7sJu92U03DCoGBvLxjvYmaOANANuXm3PLE7GCWzHLg58yweFH
         jQjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788512643; x=1789117443;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q31ZBmdW8hNNfLkDMMwoS1IW8VBGns0g1GPgqGkxWn8=;
        b=VIXUlzUBekJB8+hbT87pupOcM0enHJhalmXNkcWc4U4amWfK3H61LyF9kMhT0S34SJ
         JwrnfOKsF1+GWZtBFIkyEv9QqROrk+IYQFXpmpXxholZtQBbwupcoQoI+5A/hJFQ4u3G
         H0srTwc/0d4dlfbDzdZZRMYGySHJeii3t+gsnj/G0U0aYgkEatsZYrmlXIk8O67GpvXg
         ZbHKUW+FHcM4NZufjSJdTsUs+DYS09jhRTkZnoofVVpwQyoP2dxPd/7SZRIwVmHjR2UB
         O327W5hufQP2JWQjvVHwMTpP4MjpnmyPnELDGHZf1W7hFxjT6oFhzUm3FX84z8NlG9sd
         8yBg==
X-Forwarded-Encrypted: i=1; AKwUvBxmB8drDiTkNn0zwcdBU9dZJJ4UAp9pFPtZkpsa3S8YAc+bZ7q83VIg327Aomgdtrncqq7xXcge7of1IH8=@vger.kernel.org
X-Gm-Message-State: AFuF++mTIVtk2ZDuQin4k5BNFS0bGXwoss9L5gkFa1OQ38ro5By5TfmQ
	teDHRQbTRf+twr5rvMimpRPrRnomdpRSQusuFZtqgbyu7ev+ZfxYkhxqmP55MLxdfx+TeCWxvHi
	0p6MBClRBhcaCwev9RXCcyloT3mdrXJawjJIg4gp/fQPaAO2y/1r+8pcPUkbghOD5xKWMM6t60X
	HQzXJSg6CyIU+8yJ2hrQt/7Era/VMPRr4xJsdRjRkw
X-Gm-Gg: AYBFou1EktARq7L5GOUdFUjcTkRES+wwSDyjsrm1saUDVAnWay3jF0hwCqqEf3jA43w
	vrtC3QID7GfBMQnp2kFgqDxzMx/UjQRkdlOx+roe6ewqBNW//8o0xHC235vT6y9F8WhH1Y6hS0I
	7bIu0EDmB294ZZ/b/1G7SeH6f/WAgg7l9Eu1TD6VHSAl6KB2hF1aPP8x1d1U04d3sTEYWTbTYAs
	2bycSw4Y1srhyE=
X-Received: by 2002:a17:907:7252:b0:c25:437:3dcf with SMTP id a640c23a62f3a-c260ca1e82cmr197402766b.21.1788512643419;
        Fri, 04 Sep 2026 02:04:03 -0700 (PDT)
X-Received: by 2002:a17:907:7252:b0:c25:437:3dcf with SMTP id
 a640c23a62f3a-c260ca1e82cmr197399966b.21.1788512642934; Fri, 04 Sep 2026
 02:04:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260612115121.54862-1-tglozar@redhat.com> <725da8a4ca6a46ea8ba41778971602b49d650e60.camel@redhat.com>
 <CAP4=nvRMAZ6AJ_WQPVM2sm9jH++4RwN8DhodU7oL6-AcXNg8OA@mail.gmail.com> <67895578a730d56a50568a7403ba4ef8f7b3e24a.camel@redhat.com>
In-Reply-To: <67895578a730d56a50568a7403ba4ef8f7b3e24a.camel@redhat.com>
From: Tomas Glozar <tglozar@redhat.com>
Date: Fri, 4 Sep 2026 11:03:51 +0200
X-Gm-Features: AcwNN1WkH9BSXuBJ4lQTj1zRaXaKoqL7KYm5xcyjbCTbrCjNWz5Iy4eGvq5Ul9Q
Message-ID: <CAP4=nvTciQ-jsdoL=udYzSb037KMGY1QTerVGZ5M3nTyu17imA@mail.gmail.com>
Subject: Re: [PATCH] rtla: Simplify osnoise tracer option setting code
To: Crystal Wood <crwood@redhat.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, John Kacur <jkacur@redhat.com>, 
	Luis Goncalves <lgoncalv@redhat.com>, Costa Shulyupin <costa.shul@redhat.com>, 
	Wander Lairson Costa <wander@redhat.com>, LKML <linux-kernel@vger.kernel.org>, 
	linux-trace-kernel <linux-trace-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2026 at 12:31=E2=80=AFAM Crystal Wood <crwood@redhat.com> w=
rote:
> >
> > They are called "osnoise options" in the interface (although they are
> > shared with the timerlat tracer), which cannot be changed. I don't
> > like using an esoteric prefix like "osn".
>
> I'm not suggesting changing the kernel interface, just having some
> convention within rtla (and within trace_osnoise.c) to make it clearer
> which things apply to osnoise-the-subsystem versus osnoise-the-specific-
> tracer.  It might be "esoteric" which one gets the abbreviation, but as
> long as it's consistent I think it'd be an improvement over the current
> jumble.
>

After giving it some thought, I believe the best approach is to use
the proper tracer name (osnoise/timerlat), with "common" for shared
options, regardless of the tracefs file names.

For example, "osnoise_set_timerlat_period()" should be just
"timerlat_set_period()", and "osnoise_get_cpus()" should be
"common_get_cpus()". Implementing this with the macro lists is a bit
tricky, though, so I'm leaving that for a future patch.

> >
> > > > + * Long long option get/set/restore/put functions, generated from =
OSNOISE_LL_OPTIONS.
> > > > + */
> > > > +#define OSNOISE_LL_OPTION(name, path, init_val)                   =
                           \
> > > > +static long long                                                  =
                   \
> > > > +osnoise_get_##name(struct osnoise_context *context)               =
                   \
> > > > +{                                                                 =
                   \
> > > > +     long long name;                                              =
                   \
> > > > +                                                                  =
                   \
> > > > +     if (context->name !=3D (init_val))                           =
                     \
> > > > +             return context->name;                                =
                   \
> > > > +                                                                  =
                   \
> > > > +     if (context->orig_##name !=3D (init_val))                    =
                     \
> > > > +             return context->orig_##name;                         =
                   \
> > > > +                                                                  =
                   \
> > > > +     name =3D osnoise_read_ll_config(path);                       =
                     \
> > > > +     if (name < 0)                                                =
                   \
> > > > +             return (init_val);                                   =
                   \
> > > > +                                                                  =
                   \
> > > > +     context->orig_##name =3D name;                               =
                     \
> > > > +     return name;                                                 =
                   \
> > > > +}                                                                 =
                   \
> > > > +                                                                  =
                   \
> > > > +int osnoise_set_##name(struct osnoise_context *context, long long =
name)                      \
> > > > +{                                                                 =
                   \
> > > > +     long long curr =3D osnoise_get_##name(context);              =
                     \
> > > > +     int retval;                                                  =
                   \
> > > > +                                                                  =
                   \
> > > > +     if (curr =3D=3D (init_val))                                  =
                       \
> > > > +             return -1;                                           =
                   \
> > > > +                                                                  =
                   \
> > > > +     retval =3D osnoise_write_ll_config(path, name);              =
                     \
> > > > +     if (retval < 0)                                              =
                   \
> > > > +             return -2;                                           =
                   \
> > > > +                                                                  =
                   \
> > > > +     context->name =3D name;                                      =
                     \
> > > > +     return 0;                                                    =
                   \
> > > > +}                                                                 =
                   \
> > >
> > > Using "name" for the value is confusing... "val" would be better.
> > >
> >
> > But it's the *name* of the option/field/argument here, not the value.
> > If you use "value" you'll get:
> >
> > #define OSNOISE_LL_OPTION(value, path, init_val)
> >
> > which is incorrect. Would making the macro options in capital letters
> > (i.e. NAME) make it more clear?
>
> That's not what I meant.  I was suggesting this:
>
> int osnoise_set_##name(struct osnoise_context *context, long long val)
>
> -Crystal

Ah, now I get it. I fixed this in the v3 of the patch [1].

[1] https://lore.kernel.org/linux-trace-kernel/20260904085500.488905-1-tglo=
zar@redhat.com/

Tomas

