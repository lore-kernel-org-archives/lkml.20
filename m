Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4783A83BF
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 22:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787957546; cv=pass; b=bTNwpObeJxWg15cUfmPRskOcvqfi9hIqp7Yq8/fWuAfHwY9hRq2nT7oG9jyipzHbjYcFdjOyPz2bfZ/rMGlvFLQslt1IFzpJREreysKi8CFa4lsvafo2hsla401nBzGjSJt2IJuaWrhTAusC6JuogOSOVN+KrhzV9ouxz0daLYQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787957546; c=relaxed/simple;
	bh=WrsvomBoIOTykSZbu/ot0FOcIRpwAK7V3umLl1yq6rk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QEGLvxKSitdw/xnMS/zacnd4m4HY7SJ6hj8iKtQF+FWk9QyQ8M7zQjgbEKQEL61341k8FnuevwOtEQE4xb91WZGT9j82HdWi5KTrJ5TW8q7UFf/1jXiI2QxGVb+avst+5x+U6YDeitYuhD7OvjP/+qSwsuxI7K9oT5Znn5CTbbk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dXknUyG9; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dXknUyG9"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-52fac937235so44741cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 15:52:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787957544; cv=none;
        d=google.com; s=arc-20260327;
        b=k14vhLlXHJAQP0epPGO1JTIAH+gcfUYIwyRFUd5NIHODqgYCxTa/i8SGYa3rxO1N2b
         vD1Htja8614OBzsm9gHCPKU2xY/o50xdDAt3IBhMRN4gc9yncI0me0DSkOy/uNrrNC2r
         93+/Q/SJqu0kf235VGJwezqjLdgpTQ9jJ4ooLZhrBSagYnKKaoZG6AxaRshK18o20s02
         ah0NKvZTiYfTuxYeRukQMz9A7LTxfvtArOcsTUOjFgOGtEJg/r91U1112Ju1CR7TOJzT
         eDgDrODOLZV4kIVlZNJbWx7A9KCGqbFi2Apj5w/MthfvyLxuuz1V4ObviMVWhMqFnrkT
         p26A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Awwf+UFW2ONQrXT/1UuPyCRQCWHRON77Fg6o5pZxO10=;
        fh=3Mf8nornYAJfvxMCuQLb8b70oTdtzkNoVePG7P9fSnY=;
        b=mU74kiuXmMZEQH05ne2U6jHGSdtnK7jgskVfP2q3/OnNasZx9BCg7Kra2VQ0SXWTx5
         nNNiRwdtBMm4+OSM1s8m91uIzsz2J6pveq/MAzYMcmHowyFso3p6+VvNI5pmfUkz7WR4
         0GgmP0rv97blhM87oHBUqIBw9FU62965S0AX5+GQbwUJRo4c2ar/EEUQUVAyRROb/PBV
         EqyZKXZJM3q77PyoYmPze+9RFYXV1wUp+EQ9EDDJmo4lX9LYA06ivgObw1ZdfXp/tTIy
         Yt47dAdLQWhgMmT/LeZG8SkCoymoZIyYPj3SRY95PokhY8JryDlHpssABBhMezQkOF+h
         pM3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787957544; x=1788562344; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Awwf+UFW2ONQrXT/1UuPyCRQCWHRON77Fg6o5pZxO10=;
        b=dXknUyG91mtcfBGaWwFNQ5riozqqkSfZCg6+5WAdFl1bWRmMCszAN9PzJVDYz0326D
         dOrC0TKZQ/8C6nLA1pAMY7U6FWhP1WSa6ipJP1MaTtd2crYDLY+GoHUezzRMGyHaloZa
         5GHvkk5q1pGD7rysF78hRGA08fM7KfExoKVOjhIfqpVnEqzWGQ58iaA7GNYOwwK6CtHN
         CWwlYoY+QAn2NSOpLZba2Y3Y/zgV6EeGe32cyYzvYWcbeE8dYHQVzj5e1DNsz7lRhvG6
         F+rLm+EaCohm30vRM9+Q1g43hfVKdZ3kXOOr+j6PQ+VuLAzEX1gDYDZJz6b4sUVIVucb
         VPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787957544; x=1788562344;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Awwf+UFW2ONQrXT/1UuPyCRQCWHRON77Fg6o5pZxO10=;
        b=CUxfshlUvDhV9MxbqE7l97IDHdSWkfShUaUeIOtLmaFkmYHpnCET6LgpkDITwnTlUk
         0hLPJXr40oS53dQ2j3wmdI/ybhZF5DBuVlhcKaEY+/SROrwxtzAl8vs0nD7OTXv1n9so
         6Jud1OJZ+E2QJKTEYZad60kidaL05GzKox/jkj8oWnX0qmEibRkyWI7nEuVwtsCfvI6r
         eLyOuv3W7wyBnRcqeTBnGfBCySQdKXiXAoHYJmBK4kOq5iJciPn6OO7MsAqKJkXtNEtY
         kOG0Xw5HEAgKYOlvviGaKoW9TL61tUe08XUb7d38bteoRe5ZBXN/xIClUFMCghfDJ/Wy
         bWsQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrl+Zit/RlndFji0TzyLzv04h6N57n0Xk0vMexAl+0BMd1ShgzlVntt048wppcfb4+IgDW5U08Hrj3apyY=@vger.kernel.org
X-Gm-Message-State: AFuF++nY71FKjw1GAuEzJ1k47+PksGIb1U2G9KSVGGwrWger7pvRVZXS
	j8EdF2f6lZpzht2oiYLG/z4ufJ2tWD38Xgro8PFJ0NhPcUdJn5HfgRcdztyimZaD9VuCcY97UT3
	rvkw8oZx9x1Xb7TZftZzsbaRNJT79SSsNwmn2NNdThLTuH+97IzjqtHgN
X-Gm-Gg: AR+sD11ji4Z+pYQE8O8p92zTa7IVTWdEyZV+tniP+uaXC1anDy8OX4/hzmSsuSHZqff
	5TrZ9F0fp2swFmZqL+cfHkHyqJhAWkA7bXbdsjSc9h13hbiMEUHsonHQUgC68R7qii9h7SgpNFU
	6Oqpz0cbfh7TnSEXvoukKjBv4g5ZeCewhztUDYb1KH0oWA4eeOcOcqiFLCilEclHzsS2DgJD9FW
	lFVP6l8nif8wfQPicRLWpS/hyEXOt0mMjJ0ESouZHa4qEPrY9WQBJRbMu2BLd56oPHwLsH4+K4K
	YqzpOFKNeQ5rC/upwCuA5yqE4QXaQKDSmdCVCCS3QPbjn7zwA/UleI8/bV8+d5V2i0pljaYy/5N
	oVREG+c/vDw==
X-Received: by 2002:ac8:6109:0:b0:52f:9ed4:8d74 with SMTP id
 d75a77b69052e-52ff710cdc4mr4682421cf.14.1787957543079; Fri, 28 Aug 2026
 15:52:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806020850.1221381-1-rick.p.edgecombe@intel.com>
 <20260806020850.1221381-8-rick.p.edgecombe@intel.com> <CAGtprH8XJ+SbxQLTowch3DR6N1NSMUKyVnGf0hv5N+iKWT3q7A@mail.gmail.com>
 <74bc9f2695959f335f2f502ded1ae7c944fae13a.camel@intel.com>
In-Reply-To: <74bc9f2695959f335f2f502ded1ae7c944fae13a.camel@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Fri, 28 Aug 2026 15:52:12 -0700
X-Gm-Features: AcwNN1XH7bepxRkIbUoAM3EdldcwR19TvPyf1EHxlXjEwu1TNfCd8rn9aVcKinM
Message-ID: <CAGtprH-WL9MioyJUwJf7XK8O+UM6d1hUwWMtPj0AWC4FdBxScg@mail.gmail.com>
Subject: Re: [PATCH v9 07/11] x86/tdx: Add APIs to support Dynamic PAMT ops
 from KVM's fault path
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "Huang, Kai" <kai.huang@intel.com>, 
	"Hansen, Dave" <dave.hansen@intel.com>, "Zhao, Yan Y" <yan.y.zhao@intel.com>, 
	"tony.lindgren@linux.intel.com" <tony.lindgren@linux.intel.com>, "Wu, Binbin" <binbin.wu@intel.com>, 
	"kas@kernel.org" <kas@kernel.org>, "seanjc@google.com" <seanjc@google.com>, 
	"mingo@redhat.com" <mingo@redhat.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"nik.borisov@suse.com" <nik.borisov@suse.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"hongyu.ning@linux.intel.com" <hongyu.ning@linux.intel.com>, "hpa@zytor.com" <hpa@zytor.com>, 
	"tglx@kernel.org" <tglx@kernel.org>, "Mehta, Sohil" <sohil.mehta@intel.com>, 
	"Gao, Chao" <chao.gao@intel.com>, "bp@alien8.de" <bp@alien8.de>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 3:40=E2=80=AFPM Edgecombe, Rick P
<rick.p.edgecombe@intel.com> wrote:
>
> On Fri, 2026-08-28 at 15:18 -0700, Vishal Annapurve wrote:
> > > +
> > > +static int alloc_pamt_array(struct page **pamt_pages, struct tdx_pam=
t_cache
> > > *cache)
> > >   {
> > >          int i, j;
> > >
> > >          for (i =3D 0; i < TDX_DPAMT_ENTRY_PAGE_CNT; i++) {
> > > -               pamt_pages[i] =3D alloc_page(GFP_KERNEL_ACCOUNT);
> > > +               pamt_pages[i] =3D alloc_dpamt_page(cache);
> > >                  if (!pamt_pages[i])
> > >                          goto err;
> > >          }
> >
> > If the alloc_dpamt_page() was able to allocate a single page (not
> > two), should the partial allocation in the "err" handling return the
> > allocated page back to the cache?
>
> I think no? In the case of the cache not having sufficient pages, it is a=
 bug.
> And if things go wrong, I don't see a risk of big security issue. So opti=
mizing
> for more efficiently handling bug doesn't seem worth it.

Sounds good.

There is another allocation in tdx_pamt_get() that consumes the pages
from the dpamt page cache but returns memory back to the buddy
allocator. I think it's not particularly harmful, as the default
top-up should cover the maximum spt's in the fault path. But do you
have any additional thoughts on that?

>
> >
> > We observed similar failures internally with a slightly customized
> > setup which had retries for pamt cache allocations in the fault path
> > due to SEMCALL failures with older TDX module functionality.
>
> The best course of action is of course to fix the TDX module bug. I assum=
e this
> already happened. This is the default upstream approach for that kind of =
thing
> across both subsystems. But it sounds like this case is even more special=
,
> because handling the specific bug would involve other code that is missin=
g.
>
> That said, this code can definitely grow in the future if we seem some us=
er
> value for something. But can we please just call this basic version good =
enough,
> and build on it later?

Sounds reasonable.
