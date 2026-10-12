Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80EB84457B8
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791790223; cv=pass; b=Rw6+9HVNiJz2lhpUj8yGIrVFK2U63Mjkx3z5FvJEkGIkjZygwy7KJVKFV54/TpmsQ3S8obOgmcE/hpTZG9RgAjnPEH7rILhJuD6lyZZ1sLkvOmFDmYPqc8CXJ+atpvdftk5IyVX+URRCiVa2DvRmcBc42vkX+hkHPf1jzoFoqEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791790223; c=relaxed/simple;
	bh=AeoQi/VJKWbDfjAszOxV0QRBoUb1zQUquwA/IUZ2Dn4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=etPHKAYH85owHhKHo8UpNozEo9HmDsEO/DachCg5egbTJFlLQZG4jWXkr3bqaGCqtUXBfuCyq1yKr7zV4mrpfFklzbeFu7FzBhIoY1xQ/UmUGZhPkzUS6MW/VECorGfIN0dmc6cPamn4gpc8sz4XUqATX2slKqtNxDoBVRbugK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=crle81vu; arc=pass smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="crle81vu"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-15354aa70e8so511344c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 00:30:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791790220; cv=none;
        d=google.com; s=arc-20260327;
        b=aoKKfM8J/DUc1KUYDn6nlsMstFc+fOMTe2rOQalZiZtbqX3oMz+NyAjBNVaGanjkzP
         1IWhQUNbAKB3MgUpaPnz12wdzPFs0jibeHntCqPLPvb0zrF3lnomHWisALOhglMwBJe3
         yuauzFAht9ZyEMjSmmGVWtHhBVlWv6Qz3cJT3ezQup1Xr0y1G9VEuyztIgjvIOEgdqal
         FkAnruPVpdpHWe5KoJ0hsa9BBvV7AkTgYQKcklsogMH26CvnpTGDEtoJDR5/M2o7x5s8
         rm78STB9qDGme5PDLWEAniniaafgIbI2KG+r8/7z8zQhmYJxnVL5csosOMWPtpgKoKmI
         DfyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tGfBGdTElsMxk6fnfDbUqUIO1hwlx9KJX2Zt+2Y7WX4=;
        fh=rXNM01kEBOgfmMs8nVsrwl7qyL1CRaNfke7kCmOD0cI=;
        b=MakhDmMIghzizgiCEZghAaXGAls9uF4dDmgPOwy5eYVJEr1Tog3CwrZXHMrrw5reuc
         QOJk2BCHfx4atkFCmKVITAW5Q3wii+nWS75PhJsQV6WmSeot85t/3RkIEV7DyRTt3wS9
         mOJFOqm9Ze77qbkF7OPfyq210KP+jGd6Az+rECOHebPupyc3lT953SVogglEAweN/VTU
         MB1KiS4yiqOlbFHO/RxXDYYOigvr0ffLEs2OkjeAqPeT+8Q3vCE4NHNWpAj0VumkkYbK
         aqpFhMOox0dcpg91FejcFKlxn9ok7YwCPnqXcUdw70s0jb47bTCXtZUF94rTQ/n9vlF7
         7uYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791790220; x=1792395020; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tGfBGdTElsMxk6fnfDbUqUIO1hwlx9KJX2Zt+2Y7WX4=;
        b=crle81vuel8mA6KcCkBArrXEoHExVRUPk26Z42sKUOuqFPRUhxuUeWykGuWj+jvhe0
         2t33rtYeGLSe/Z7Q6TwnTFOmlxhcS8YZnNuv/1Cow+uri7Rd14y+HGOMXDAryyVA3o/t
         SyEUhpiGpL5sN7pjTEwyE0TiTVAqent0Qo8Vp/70TSYIGDKL6v5qMzWZjaB8656UYua8
         H1m1ha1ChNnMxbN2QP/D1YaYlR3Dyxqg89xsOc4X1x485xgRaVMDdYwPq1eQ+SPScP3b
         ZZQYdwI3MJbPXGlaZXONLuj21gSTj/29jpz+Y+oLlZo27ciFdAC5ea8JGFR1UURhKtP2
         rXuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791790220; x=1792395020;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tGfBGdTElsMxk6fnfDbUqUIO1hwlx9KJX2Zt+2Y7WX4=;
        b=BigHni62EhIFz4lUCisPLl+CcCtQ2jNRDbdFicGXmEaPMGf5Sy6LVECCxmpgwznwtR
         3E35iuqp0jj+kCLwpdYoXMfDfU1VaajFww8LgrvP9LFQ5t0QBLcuN2tjZz8oPjVXibOa
         DIa9UTxabnO1B9pPLH6zWiy2A8/bPtauIe5cViIAl1OacfLZV1ykmhHBWqCSvtcR8gm5
         LiE9voJQTUow5C0PWcXE2X91Km3IKZcz366ybJ8LQ7dQ+TpNs0OFD0Ih4iLkfDrmuLNI
         P9FVq25ewXwXNrpT1zNZ0F3WFiZI39gypmM37bPbl8sM4npu0fGQvS63ebcPRjGbbaAz
         F0oA==
X-Gm-Message-State: AFq9FYLxdJFZdmG32oWWJZnMj7wIfVoWKLG3DeeyELILjt82IAjQnH1x
	kRsXzv0OkUZSjIVq70UDlILgpEJxKRlIgpe77EsDT+PWpW6D/9GKrz/TIzaYI6rlpxaPoYoUdg0
	H00l2ixOsIihkh8PEJTeyJ9k8W0txEsWmZ/32VRI=
X-Gm-Gg: AYBFou3SKMprLsPdrCukz9JmnIPsqrED4iKYNAvpW1Yl9NPlnoqiTVB2w1Maane6/TJ
	beOSJ9jqS255/uIzzSpxZzWM/HYxlMNXHxXOpHybsfqENldQGECs/FHsGpgqsjrxUZFQTieGIen
	hblpfkJhq2j7BRVezvbTRO41QLypcQyHnRe93iZMvJR4MPSo1LZXbagbC65QsJQr4VUKZVXegae
	scySCydMIHlzQ/sWvdv39ZOMVVHyhQq1VEVUR2QYMDqXKiP7RNw5sUXE/wPeXM2jVZUgBC0Ansa
	idlRTKfFcjNmWYEp0ZgZvKSAbJZScialulAcS9iZim5wz0fG4XBcVNb+1g==
X-Received: by 2002:a05:7022:b054:20b0:144:f47b:58b0 with SMTP id
 a92af1059eb24-16a62228bc3mr14123690c88.47.1791790220102; Mon, 12 Oct 2026
 00:30:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009073040.2995938-1-islituo@gmail.com> <20261010160858.453c904ce17dfa8868ba3f9b@linux-foundation.org>
In-Reply-To: <20261010160858.453c904ce17dfa8868ba3f9b@linux-foundation.org>
From: Tuo Li <islituo@gmail.com>
Date: Mon, 12 Oct 2026 15:30:07 +0800
X-Gm-Features: AclHuK-zItUDbgI8YNUKltZ31jxpnkkCC1-7uJynyV6r1K1N2PFm4EZsp-CLX60
Message-ID: <CADm8TemsPu8uScXTi17V1o2FC5eGriDQFaieRh_rEMPuSc_Mxw@mail.gmail.com>
Subject: Re: [PATCH] lib/test_meminit: handle kmem_cache_alloc() failure
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 7:09=E2=80=AFAM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Fri,  9 Oct 2026 15:30:40 +0800 Tuo Li <islituo@gmail.com> wrote:
>
> > In do_kmem_cache_size(), kmem_cache_alloc() may fail and return NULL.
> > The returned pointer is subsequently passed to check_buf() and
> > fill_with_garbage_skip() without being checked, which may result in a
> > NULL pointer dereference.
> >
> > Handle the allocation failure by marking the test as failed and
> > continuing with the next iteration.
> >
> > ...
> >
> > --- a/lib/test_meminit.c
> > +++ b/lib/test_meminit.c
> > @@ -241,6 +241,10 @@ static int __init do_kmem_cache_size(size_t size, =
bool want_ctor,
> >               }
> >
> >               buf =3D kmem_cache_alloc(c, alloc_mask);
> > +             if (!buf) {
> > +                     fail =3D true;
> > +                     continue;
> > +             }
> >               /* Check that buf is zeroed, if it must be. */
> >               fail |=3D check_buf(buf, size, want_ctor, want_rcu, want_=
zero);
> >               fill_with_garbage_skip(buf, size, want_ctor ? CTOR_BYTES =
: 0);
>
> Thanks, but we have an assumption that __init-time allocations cannot
> fail and so they don't need to be checked.  Because if they do fail,
> something has gone horribly wrong and this kernel cannot work and a
> later null-deref of "buf" is a suitable way of reporting this.
>
>

Thanks for your explanation!
