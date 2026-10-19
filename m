Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792448160;
	b=vh7NIsl1XIcaOOhGe9mGG9X3G7rcy3XgSaApeYKXG+mrC5qy6TkchX8rt/249WHQB6FP
	 8lDdPSLPwHwgqJMemrf7noje94+7BLJFlSOYdiPqFqzau2nQ+d/WEpFrZx1gvdW8MMAo0
	 No9dbPv1bbVJwL2Fuu7VmlWY86r0rqNj4qNbUS5zXxVpL3l35HnaUpGdypEbmJfxxT51/
	 zTMIhRiOI/C8lOn01WTrbRLgWO0ed+6DiSBh/bKJMm8njCw0PjwUpM4W78mxMoqvsP6I+
	 dg8RpUQ2O5jcThTQNysPPD7GGXRfj6AMQyhCLegn8vo9bD5c0oBwKIdqwhuwNF9qytg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792448160;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=rdyNMiM+XBlxdbJkKkHd/PYJIa4td4GcgNTCZeLOXak=;
	b=bhjpw/HZzTuaNwKUHBEbHrwRjQy68SKE7mkGRa+aKBnbVZWQA2r64UG9I5T+LiFYxWV0
	 hFX451HwvyhLvke5UnF/Ei/OUJUQ1t/HJoMfTC2CGeOPao5IxMLsZNLchLRcmvGMlXRrL
	 3cYVj0vT7EZXKB2IaBsbJ258rhuPMAXw4sCUcdGKGi2Ib/ua1WlTBajO7YjX91SJd3WX+
	 1MumKPUJjCrOJrsyqbLOj1pffRTnPNRxftSwaLyUL3JypLWWxwBBuOhtgCDapnycqeD8c
	 QMP+pf64S75CRjXeJqDQRB/9ASyF8PKdOTOY1rWg5a/o5T1dOnZUl9QDXY7uWOWngHw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Z+jFQGuM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C9560A3815
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 22:15:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4C9560A3815
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Z+jFQGuM
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-18cdcfc05ffso1193801c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:15:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792448159; cv=none;
        d=google.com; s=arc-20260327;
        b=rIctuR9VPcw3yd86j51nd7RssJP+wvpBAIANVonjpt8OHmT92xEhrI4APdlUgO3SKa
         s6soleTsoeSFCA+W1TLSzG8epmRhrRLbOTPaS7iaJLURypmehEzEEOF3szIfPAbvwre4
         yS7hGUf0GLnumxeXAaHpTFehK2PiMgSFLWfGhfUbi0ELMSWn3iZC8HiicnWs2UNvx30T
         YrWw891HoEN5bUkmL0tJZgiXjnIzAdcT6FpG0oiN1uuuYjmkpz+j6B0szbqD9oefgFg3
         09EvQDghBpkl6W+2KLE8V7WBmDr7sk547O8sBQEe+s6vG5OoYyRQATPnjbqjkeYAwh71
         mVvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rdyNMiM+XBlxdbJkKkHd/PYJIa4td4GcgNTCZeLOXak=;
        fh=ByWzewDRK1dyZL777P51Unue/RMy5MY65oJh++in2Gs=;
        b=LKhNE3hyQSWp5v/BpZb5ByokDMuDxGTLLlpJ3weZv0z6SG+Fl6Qy1m8UuAU2tE+5CC
         3OT7fu5kxTY5yIGoP9bD0LxC3dGAlzv0m9oEuo+p2n8FL9M9PvoxmoAMPsEcVOD/U1tV
         OoCDlWk+M95SmmQhkYHBu8Z8OLBeiQERENtycSQIr6Ceq0kJ6MW5ZZ6PCl8uzqYwzFnt
         xT55ULKwlFoB2e7JPVpgr9qVq6gfh12qeFgG2G0uyIjat0wEx2PRGb1X6lF2T3YHri4y
         7beNv64niwEJkMz4IFQiQ6+mHjMnwO0/PVPtG+4JP/g5y4YcUNFuRzwC567RnYc/gqlt
         Ep2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792448159; x=1793052959; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rdyNMiM+XBlxdbJkKkHd/PYJIa4td4GcgNTCZeLOXak=;
        b=Z+jFQGuM+R8S6JsKAZwv6LyJH/Y9IcZLAIfMG9qO65yJSvvkJip1WU0/fePsvMvrdM
         yYvyExnOZ/UDbo7f5/ZNZaPmFvXELK/csgabOGxEJuKLv3eMRHi0j8pbMorAeDeWXPy6
         if+FoWjEM68ZMFBEzCawUsBFbTdl1flplJBqveirwOvMyeYZfPexKkwMexScRX+ZMfIr
         Ox3ItrAbZ0kYTh5IhPqoMCvUaY/xYlw4WvIn+vC4GqdKa9wnrVccc6+xEDQgnJXnzfr7
         XOxauoWlOliEqhaFDaUzCO1Lwi3uB1phcKCIy2wQzogQzIQowzJ6dIzbRPaDUO00JOoX
         JcKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792448159; x=1793052959;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rdyNMiM+XBlxdbJkKkHd/PYJIa4td4GcgNTCZeLOXak=;
        b=WcBSkeGRPSeGhYnPrsIzBT1OJV3ioOr59kpxwTukUMy4ukaUTXnuVu6/jFY2X4TtCd
         yO59kjpv31UVr2o9vZdCY4oyyaekFy0yAWd+CKEmwNP2UY9hreCrgcAEhMEd+LdS2NoO
         QPFXm3BNUgBTIzzJHVh5jhT6eys1zH8GQlL0pIL6eQjA8w/Hcmx1ynZakqvCBk3x0qFe
         LnPjHNZ1s3upfmKqoBwUjQ6kttO8n0cL8bfdM2YvAc+3Sf2YWtdKF0YkxGk4yITX0Wcv
         ZvJftl/rs4aK9EmaYjlG0Nm/Vzt2AGtPtn5WbCjsusz9iOKuXxeCqbUS+q09xWRnWmBU
         9k7Q==
X-Forwarded-Encrypted: i=1; AKwUvBygWgFiFwpTZ+V0ch/vOBLb2A0hdrQ13Q2zlkMK5+gXIhvyiGXJXkqiaJNM+ag98D9GFuleBWAKT21wvcg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7keF17ngWIrpHUxFdZXGZ4kWvNBnjYBmHcoiP2/+W/rbW/f7w
	2INKIVgU8uOTK8ZRkz9KQea6D6EtRmMJh0nuBOQlbW2f+SeYKnshBNs21IIOntF+3RKKwKgIvbc
	b8V1OhmmbwNGKgLRwwVDxAL4Ug7S6nP/RZwkjwQxy
X-Gm-Gg: AYBFou3vCA8K1Q8J7soxUv5WB/aSAkng3JXZB1Ech1K+8Jpi/raQZLmbUD8dplDF07O
	9uofJHj0kV7vj6kQH/akkRRQct1OnFxoS0j7WgpzIe1u0t0W/NVTIa8Unp/0h0AbOAu7QGRGgyV
	VSycHBET9guLQy3f2A2/K1JJdtRxS4vhdkJyedAklOf09jqcpGj1jUc8g3BGYOhJAoJP+dCBhLb
	Gitf/YkAeRpaPmEYT/xyQYiSgAGrbMbsU5G3+6Bi9u5sNVAuhMpv8Oal/wLHifFRNOpMj7l8JpC
	TriEbMuPNmT8FRlLT9U4lfXKXY0NG3uDDiRcht6g3zDFbhesADoe5pFZLFYunO23YEvOHQgK2NQ
	F3q1eMvQZOqI=
X-Received: by 2002:a05:7022:7e8d:b0:151:2e62:fe8a with SMTP id
 a92af1059eb24-18514256ee0mr13912895c88.40.1792448157775; Mon, 19 Oct 2026
 15:15:57 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261003214516.128573-1-zoone.rupert@gmail.com>
 <asIRkK-uUz4FKQBN@ashevche-desk.local> <20261019004509.68409863@jic23-hlaptop>
In-Reply-To: <20261019004509.68409863@jic23-hlaptop>
From: Marco Elver <elver@google.com>
Date: Tue, 20 Oct 2026 00:15:20 +0200
X-Gm-Features: AclHuK_a0n-l-qngv8FVuS94ECxKd9nndQfPACOvwyf1hlN0WIx1_aiPJEfhYO8
Message-ID: <CANpmjNOY2=M_G4uaRe+QENQRaet342UZDfXVkh3=gLaVBwW+Wg@mail.gmail.com>
Subject: Re: [PATCH] iio: adc: qcom-spmi-adc5-gen3: fix lock annotations on
 mutex helpers
To: Jonathan Cameron <jic23@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Rupesh Majhi <zoone.rupert@gmail.com>, 
	Andy Shevchenko <andy@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Oct 2026 at 01:45, Jonathan Cameron <jic23@kernel.org> wrote:
>
> On Sun, 4 Oct 2026 11:42:56 +0300
> Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
>
> > On Sun, Oct 04, 2026 at 12:45:16AM +0300, Rupesh Majhi wrote:
> > > The __acquires() and __releases() on adc5_gen3_mutex_lock() and
> > > adc5_gen3_mutex_unlock() name adc, a local declared in the body. With
> > > context analysis enabled for this file, the build fails:
> > >
> > >   error: use of undeclared identifier 'adc'
> > >
> > > The lock and unlock are split across these two helpers for the ADC_TM
> > > driver, so mark them __context_unsafe() instead.
> >
> > Doesn't sound right to me. The __acquires() and __releases() IIRC are sparse
> > annotations. If clang has something special, it needs to be addressed in
> > the compiler-clang.h, no?
> >
> It's in compiler-context-analysis.h and for now I believe is clang
> only.  Reuses the older sparse definitions. I think the intent is to avoid
> churn.
>
> I currently have no idea if this is the right fix. The only users
> today are places where a lock is intentionally skipped.
>
> +CC Marco and Bart and putting back the patch content for context.
>
> > diff --git a/drivers/iio/adc/qcom-spmi-adc5-gen3.c b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
> > index c68c6c5f6aca..6a3cabedf4e8 100644
> > --- a/drivers/iio/adc/qcom-spmi-adc5-gen3.c
> > +++ b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
> > @@ -663,7 +663,7 @@ static int adc5_gen3_add_aux_tm_device(struct adc5_chip *adc)
> >  }
> >
> >  void adc5_gen3_mutex_lock(struct device *dev)
> > -     __acquires(&adc->lock)
> > +     __context_unsafe(/* returns with adc->lock held */)
> >  {
> >       struct iio_dev *indio_dev = dev_get_drvdata(dev->parent);
> >       struct adc5_chip *adc = iio_priv(indio_dev);
> > @@ -673,7 +673,7 @@ void adc5_gen3_mutex_lock(struct device *dev)
> >  EXPORT_SYMBOL_NS_GPL(adc5_gen3_mutex_lock, "QCOM_SPMI_ADC5_GEN3");
> >
> >  void adc5_gen3_mutex_unlock(struct device *dev)
> > -     __releases(&adc->lock)
> > +     __context_unsafe(/* releases adc->lock */)
> >  {
> >       struct iio_dev *indio_dev = dev_get_drvdata(dev->parent);
> >       struct adc5_chip *adc = iio_priv(indio_dev);

You could probably stick the whole
iio_priv(dev_get_drvdata(dev->parent)) expression into a helper
get_adc5_chip(...), and then
__acquires/__releases(&get_adc5_chip(dev)->lock) should work. But
that's only worth it if the declarations get the annotations, because
if only the definitions have the annotation, any calls outside this
particular TU ignore the annotations anyway, so __context_unsafe is
reasonable if you don't want to do a larger change.
