Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793282668;
	b=vHve/Q95atSvOrRaCTXkMZYDuItDw2bOd7OKt+zgpqe4fSTOrIgtjDKI0URWAV1J57zh
	 QFK+rRQNNVm6CZf3pwpOGx1YJaq4ktJxA4avXNgJyM/AaE+3LUMxoNC0cLGEbyC0HW8Nc
	 ndw+P685Kl3ZaM1+3+A0Oyb/7xTii/2oQuRU8ClIkY1ghtBd3aq7l5ufLJhfiO4VyK8iO
	 jfpBrz3+G7sdW/u0E58OqFoD0xyl/0Zd5NsJVjvaPiTtK6N0JdiI5kGgM61KdsT7wFCs/
	 SFcYOqOYGoZIsc4ULbbJbDDd/cSkVFJCrZvk0b4E7glveExuASGcJnkR5c3muRNaw4w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793282668;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jOIJiz3JqGs+BXIFdn+z8p3AdQ++3MvGNgnUSp9BRR0=;
	b=GQ7yPX/J6ZSMbOfM5OmbnU71LlVM9k+Ny7ONq4PaWPMjuiLHvF/JKprH6h5vk0E08NbG
	 wot2fWSm113adY32G37hGKWMwaNwutwDobiAdw4DCbswvMnavElKiX3el5WmAwUR4NRTC
	 z/kC/mmJyhPobtF7b4jACimX1Mcjlks1jYSb10ROzs8479eLn4bfMFv4gVqzvFLaOgC4t
	 e83epRZB935JSYvFiDme3u22pBxDy+daxx06gYTDKaru6VT4dpKLDlgO1MadGr6V3ywh9
	 Jl+nGjK0XilqyPbtkPBa9to/VqxWviwrZIPabY/bAjz6Qi9dE1BXdZfik/8cKWiopHg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y5dc86bd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9692D606A326
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:04:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9692D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y5dc86bd
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8ab3d3c5761so20471957b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:04:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793282666; cv=none;
        d=google.com; s=arc-20260327;
        b=KlnPOmZnwd0n7q9NIS91vwZ9hAFnU4aLKD9zL/VqqZrLLjRmcP8iU+mlZrtcakjP0X
         nS6l2sgDrKZL5k9ofhNUgaBdd+1Tr86dszm7Gjt1HFsHRvVA9Hz9LXljxFYUzKANEA5o
         k051OVOxW2fzcN3EtfcgFR7Mr/QlWx5TSAQZMoPU/b2OmaXwB1NsPMS9OmjdPwQvK27J
         dBGFCKtGer3oqVuEGmVuEChYr1h1fVqSebAc2Oj2IXvAkbcYjlvhm+tSQPg7TPVy8mtq
         gqlcJnSWLvFVYEo5qsA8nUNMimuk12TYYPx6fFkguErs4CtHn8NaelSPttyUbhqo6xql
         mGcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jOIJiz3JqGs+BXIFdn+z8p3AdQ++3MvGNgnUSp9BRR0=;
        fh=GpifI9UTKi/Vx3X4sbtgGLcVH6mRFLTW+p6YBLx7adE=;
        b=VG061oeQ4NG1aUQDz5Vlx5t/zeoVjIxokkRmEgJckYrLfZ6l+VPFfdZ695U3Y14fRs
         kl6PX6SjwBLPP5ev9ZRmRNnfKUVOCJbv0uMImM9HJaqLyArxUAJeZaLb8m3HGJDsRwaa
         KWjLxHPJ9MC9D8HCFCcr6WiyoQT6zDunH2lWgqYZc5u02vtFdfv+6MiHdTjIsxo6TqPU
         Of9rQTSpvzofMh1FGmNdgzZpJso+eKV4EcFW7d7d3p4MHihSc73m4Epnc9Wu7Bt8EPaZ
         PIRRfqQs5Fj0BsBgAUtctReE+YxNN7Z4cgNDEVfgXUgWcV0ny43apsg2O2J73QFGf8fL
         KsAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793282666; x=1793887466; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jOIJiz3JqGs+BXIFdn+z8p3AdQ++3MvGNgnUSp9BRR0=;
        b=Y5dc86bdmRKt0Fdg7JrcFIXb7pnxA/3b62rmNTk9808VnsIAhs6WArPEI0iUxgHrL2
         kNy2Fnr55h/+B/Kr3EyDMectt3PxMyAT3K6NK9vl3HIPrlieIYtTQWO/60Kg6q5Is/Ej
         3UbiDcVYy90YvayGElyL2fIMeR14BjKWxH41LL1ZIyPZIl9L4o6HstRg2XOMXaSe52te
         E6y7yXkvvfIVtBkGQAPaSjKdchUn+jH7oFvbepT6fRIx8X1COgHBXe38/kZyxR/XfzpX
         l6Rs9SFQBXi4HJcuM/cIkFAETr806GIfsvfTVdKQoOqmVYt2r6c7j0NYzQAFjH9AdAIs
         0KZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793282666; x=1793887466;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jOIJiz3JqGs+BXIFdn+z8p3AdQ++3MvGNgnUSp9BRR0=;
        b=XZvZBMMieTHbQphReYwtAlKL88DvPS7ZNKqHEu/A/Qmv/Ukepckh7E7exERKStKYnb
         O33bZbXRJr9F6LBJ1/n3uuGJs2eH8FhC1xut06FP/PPZVUl/C5MHNEJXmUOm7RVGHh9h
         arJjnlDrHyw2wo5u5iSS0vSE2yFmsGHyI0jth+MphTyXSGU84aWc/b4SSzsRorHFDVB2
         4BirNpVe8HPhjAjFXEEhBRRHwyp6ZAUJQ9wxi+Yf4KVJhHptF9z02EoVHzg80GV6UFZa
         y0lg8m0atEMCUQTjXRt6nxgxjfdagaq+LXgKFTMp0UuC5ex67kTzEvOuEJp1nlyCsmLz
         OePA==
X-Forwarded-Encrypted: i=1; AKwUvByIXQThZ0hbV7s5L/l0VoM+gAqTXSE6W0P17z1pko7DmTOj1B93g3B/5V01Ru3Cv3Z+BUKc9wMqBTciWhI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcWFkKYQ3mY0hPY+mGWDBBKc/P0vmyWbOU6zfIM5jU27Spqi3d
	afyNL8IfXwOir4YfR2ZURZTCuABMODdap4IM6FIwqDV+056j1TLezOhrPKjFObUAkZOFS3v5LuA
	djL78VhdNDRYyFue0LrKkxBVjkd1PaSk=
X-Gm-Gg: AYBFou2Ik3u5ZFxWwHsvyCmXTuZcoylAAkLSfWc5H6MSBGtvtmPVv36xaDxH9/RdLRR
	xBIz+NxADkzW2YX8Xl0mzs0PC3+R7AI+3n05h5AIOL+4yf34SgsW46x0UZX66RSwXzn8CHuZyoE
	1FQ1wq5Wdedc+8kldk05iHAqkoJKTx9yGcsLEWP47IQrHMam5Eb8ALYmhSX3Euxk8pq5RFx1zev
	rdYLjgEWgorp+6tvHyGTIVZ72yplLivyQFOeLWHkTu0PxRbCGiqxGd0uPRYaFg5RTnnINoANM26
	pR+0dBwm2/fGa1Qoj3TO3cZm+6IiITXU2z9oKoXDKVbfVxw1GchTkByaUL0jIIw47oU2HLIXgn7
	dwyec7P2rrREYtV17QkjRw17H+vmuTHIb2SE8rik=
X-Received: by 2002:a05:690c:94e:b0:8b1:2aff:1740 with SMTP id
 00721157ae682-8b1b5bbc547mr36572347b3.14.1793282666501; Thu, 29 Oct 2026
 07:04:26 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <pm-keys-update-type-removal-20261029-v6-3d92b2f9693854230a02@gmail.com>
 <auNGzJIWFt64IMWY@kernel.org>
In-Reply-To: <auNGzJIWFt64IMWY@kernel.org>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Thu, 29 Oct 2026 22:04:13 +0800
X-Gm-Features: AclHuK-fL_kIzHPwfOpnScrTRCdAOv9QyH89rdm7dSYyaUfxKyQ-LUn7ts43gAw
Message-ID: <CAFRLqsXdUfqvNyzNpnz=dvgtHrVyRhYoZqt-CQUo98HW7BtNJA@mail.gmail.com>
Subject: Re: [PATCH] keys: Protect the update method check against type removal
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: dhowells@redhat.com, paul@paul-moore.com, jmorris@namei.org, 
	serge@hallyn.com, keyrings@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jarkko,

Jarkko Sakkinen <jarkko@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=8829=E6=
=97=A5=E5=91=A8=E5=9B=9B 21:14=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, Oct 29, 2026 at 07:58:06PM +0800, Cen Zhang wrote:
> > key_update() reads key->type->update, ->def_datalen and ->preparse
> > before it takes key->sem. A reference on the key does not pin the
> > module that provides its type, so KEYCTL_UPDATE can race with the
> > unloading of that module, for example dns_resolver:
> >
> >   KEYCTL_UPDATE task                  Module unload and key GC
> >   ------------------                  ------------------------
> >   keyctl_update_key()
> >     key_update()
> >       key_permission()
> >       load key->type
> >                                       exit_dns_resolver()
> >                                         unregister_key_type()
> >                                           GC: down_write(&key->sem)
> >                                           GC: retype to key_type_dead
> >                                           GC: up_write(&key->sem)
> >                                         unregister_key_type() returns
> >                                       free_module()
> >       read saved type's update member
> >
> > The final access reads freed module memory. With the updating task
> > held after the key->type load, it faults:
> >
> >   BUG: unable to handle page fault for address: fffffbfff804107f
> >   #PF: supervisor read access in kernel mode
> >   RIP: 0010:key_update+0x12d/0x550
> >   Call Trace:
> >    keyctl_update_key+0x6b/0x110
> >    __do_sys_keyctl+0x21d/0x4f0
> >
> > This is the same problem that commit 925c84e3cc21 ("keys: Protect the
> > read method check against type removal") fixed for KEYCTL_READ.
>
> This is useful bit, thanks.

Thanks for the review.

>
> >
> > The encrypted and trusted types can be built as modules and have an
> > update method. For them there is a second window: the GC can move the
>
> How is the second window related to the fact that encrypted and trusted
> can be built as LKMs and where is "there"?
>
> > key to key_type_dead after the method check and before key_update()
> > takes key->sem. key_update() then calls the NULL update method of
> > key_type_dead.
>
> I don't understand this paragrap overall. Needs a rewrite.

Sorry for that. Perhaps this wording would be better:

For dns_resolver, which has no update method, key_update() returns at
the check, so doing the check with key->sem held would be enough. A
key type that is built as a module and has an update method, like
encrypted or trusted, gets past the check. If its module is unloaded
after the check and before key_update() takes key->sem, the GC has
already moved the key to key_type_dead, and key_update() calls the
update method of key_type_dead, which is NULL. So key->sem has to stay
held from the check until the update is done.

> >
> > Assisted-by: LLM
>
> Please run checkpatch.pl --strict for the next version.

Thanks, I see that the Assisted-by tag has been removed from the
documentation and checkpatch. I will drop it in v2.

>
> > Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> > Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
> > ---
> >  security/keys/key.c | 12 +++++++-----
> >  1 file changed, 7 insertions(+), 5 deletions(-)
> >
> > diff --git a/security/keys/key.c b/security/keys/key.c
> > index e88548f1a704..bac2333089fc 100644
> > --- a/security/keys/key.c
> > +++ b/security/keys/key.c
> > @@ -1101,9 +1101,13 @@ int key_update(key_ref_t key_ref, const void *pa=
yload, size_t plen)
> >       if (ret < 0)
> >               return ret;
> >
> > +     /* the GC cannot change the key's type while we hold the semaphor=
e */
>
> I don't understand this.

I will remove it in v2.

Best regards,
Cen Zhang
