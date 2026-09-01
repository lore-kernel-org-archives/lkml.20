Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B88377EA2
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 05:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788239641; cv=pass; b=TlIJRIEZczJO3tP5c4NeAdL7wUkoyG/HEvjop8nuy0q71EzW8vCOkn6BG3kXKlyCk6jmcxLSQxchADgpPxLIrgxSys/AZAh5k1qVVzrBsXZt1snr/5RgNUw/amDGLkvkcdpv+EejpnrSChSqFEV1mbjj9Y912xkkWh5BeNlYmsw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788239641; c=relaxed/simple;
	bh=MGXKjt72OLD/ras8fqx5jaTT4+zOPbm9SCSoy5yVl+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ff8LxDUFPRXttbq2f9JzTPbJHxMlDgwdc6wwy+JWdJnbMYiCxNsoVDmQrtyLbQC7cBHfV9eqNopz8U2Bd12ykJKzTg/8CLbS+aIYJopEZUiK9a6VePtlZt38Hzh8Qp24OGcSssnQ80qLhFh8cPpUUQGVUxDfaeFeQgNzXHvDT0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pktDAnUK; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pktDAnUK"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-51c10e86e52so119061cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 22:13:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788239639; cv=none;
        d=google.com; s=arc-20260327;
        b=YqU0884CAIvJHylpCxFE+rT9ymW1WHVIz3X+0++FKKYuMKCeTjiBZNsqmwaLzQZjzB
         8okeUORyo3HgO2Zqhe9bRbCFWTfT5Eyk8qT0Nq/OP6Tf5IrNjYhGB3eQvxDavzzcgtYx
         sCf/y3PvgR/SBA/nJGr/62QeltutRltOWbxT621xq6uJyu6qjVWcT2TYHK8PYHeA4oss
         Mgg/etTDwoK+n3xJLnF//DJKHcz86HFg5G9c8/xmVFcIyQBmUXKH9uhtfrgovTA8qi/U
         KN5LI72CCL2MZGMSFCPszaXXGSaolUVt6wcmaMhXkQKAjMEfkDmhfSpeQbBwrWwnUBNk
         ODXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UUD1uKVBIV0lE2LKCNu8RAcV892bBW+atBki9y53O4I=;
        fh=UP3nHshPp1oalti4soQwLi4GaDTtoRoj4dKmIXVAd8A=;
        b=dHluePD8vbWeaEqimuHUk469ggXsm8c6PeArpNoxkwELbW6mHZx7zxQJ88WLt1ptFi
         R9On4CIeppPG4m2bWWZNqDyp+9u937TXRNhSx6j7TWM3VWejYQOiPvxso1lxhDVaU+BN
         D5zlJherhL1+s2snGVzs1ryu4YKBY/QWgjGb9XNk7LasBq2Islv52mryXuPV1+IyJ+0X
         1W31ZDhMQf8qi+9qOEF1x9gPrWH4Ac5dGrQo9oJIXlWF5Jew3zRz45P01oM7uzPw1GNZ
         0/lq1BajcWShgJjzeMO5XUM2Z9jZhwjPUz3gj2x0I7fvhZeIkTCE0KDFA0SQ0GIZCrvN
         Qz0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788239639; x=1788844439; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UUD1uKVBIV0lE2LKCNu8RAcV892bBW+atBki9y53O4I=;
        b=pktDAnUKH3TAolfpX3GfFgcO9Xs6nnEooduDqnz245GkWBZ0wGgB5wbhMTLpilo6qc
         HALfbGKzzC5sbpj0vnEBAipI1srvl/hmdCSBF+vHt3Nt3LAo6i4bM0vzXjtz2J1/wmDy
         j6E0nPy427oqzkR7llHk4EOCgJVCoDHyWg17UHAZU1VA/qQphKvmfUTmsZJSOn1EDXZb
         bvqY6BUETR1Z2DO6aAfzL3NB5CMxVo3ctRh7k5CKmrVx9FLRduq+kiNBQgpPAk8FfQB8
         GbuluHPxqY5H4zISs64PZYhVQ3qvDl+Wt+WXYd6OfnnwZpJ9XW7awrEz69qhzlwj4+9P
         zfTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788239639; x=1788844439;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UUD1uKVBIV0lE2LKCNu8RAcV892bBW+atBki9y53O4I=;
        b=dfHi2//Q+kf86Qc4jYkx214aCJmAp0bFVEgcYFJAl1WqQJmTQNVB1iZ0XyZ5Ykh+7V
         ERXFv0p0Zkqrzw9Wnb5XZQ6NFqexbzZqJZa2IILrX6YdqnOQel1NH0xIQV+R9NZYBxee
         2jl/8ZhDlVZQUcYYa+yrf2ySV9Q8SkawG3azNvDks4ko1+t19E204yCQSKh6+6hLlOH+
         Pna7QLegCbg5khp7mjcNhAgIyOnW3tanK88dy7SMQL/5woqjeoYaDmFjn7BHBmNLlxrX
         1XMtTCw9gT88NVPZnO18ousJPRZPPVrM1VSPoD2Lb4iG359suR42RRP88Z3uCVwf7QA/
         Ov2A==
X-Forwarded-Encrypted: i=1; AHgh+RpqYxUJwEIG2lde8lDYReOG56/3TX6Zt8yXmW8xNpZrahEoCvw8jwUYBZPZkMsoYR28BNQNevcSodLChfI=@vger.kernel.org
X-Gm-Message-State: AFuF++nOl8y6OBDL//tbvkDCEsPJDux4HvcxSCYL/xzp2lMiJnDLcC5/
	jgFA2tGs1azo9Yn3DX1esH6GQA/jET3YabXl22IQNcJcjDDC4evmIX+qrrA5B7pchhe8KO7dLHV
	7kmf4sx71YUZ7uZXb6pMnXwSRXL4RULFDJG6K3Tdc
X-Gm-Gg: AR+sD125XTGfHuQSPjzP2rwgYc05L/LImybniD8l76VPy5bISGuCs9uRI1JJAPlynkW
	Ai0XAKIY6VNdjB+B2lBOrBvZ7atKnNODODEZUF1n525IOdEEBO8j1UDwsaYO7Z/KU+gWxmLpT6D
	hNhxqG+xD85yNFVUNnQgU7IflfymuVm+dygCwnZdWRu4lJRXpG5zH1dOnCk2Qqgzb3yVlqyXrGW
	Be1+DgRlSCc1H/H/gHyXZ6ZNF3Cz8jN+PiAbKzbn5SbsBsvp3EqGXo7i0YG+chg2RA1JwZO2/ZF
	LtgcTqrojxsnjYe8jmvXwDSPdDA6Rbq1G4VugLi2Q1A=
X-Received: by 2002:a05:622a:428b:b0:52f:8389:29e0 with SMTP id
 d75a77b69052e-53024be8e1cmr8537361cf.0.1788239638146; Mon, 31 Aug 2026
 22:13:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260813193433.3318288-1-surenb@google.com> <20260829185625.f5ee1b2931818843a78af88d@linux-foundation.org>
 <apVhzM2501wSiGGg@google.com> <apX_r59k4e-XiI-C@google.com>
 <CAJuCfpEDgdC=N8__Ye1xP8rZtUwWrGhKhJ9Qnn0hdV+u5r+hJA@mail.gmail.com> <apYOTPIBTsuQKUXE@google.com>
In-Reply-To: <apYOTPIBTsuQKUXE@google.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 31 Aug 2026 22:13:45 -0700
X-Gm-Features: AcwNN1VAaOHg69O9ZoXyWul1qNpWHuewW8j4AbDLbUQZo9pKosyw0CLlNI76Si4
Message-ID: <CAJuCfpHFsjmGwfmhmOaGdnwJkyzMNdUqRne4W0GN0DDkpMkExg@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] mm: Unconditional per-VMA locks and cleanups
To: Carlos Llamas <cmllamas@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	dave.hansen@linux.intel.com, Liam.Howlett@oracle.com, ljs@kernel.org, 
	david@redhat.com, willy@infradead.org, shakeel.butt@linux.dev, 
	vbabka@kernel.org, jannh@google.com, arve@android.com, christian@brauner.io, 
	tkjos@android.com, dsahern@kernel.org, davem@davemloft.net, 
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 4:29=E2=80=AFPM Carlos Llamas <cmllamas@google.com>=
 wrote:
>
> On Mon, Aug 31, 2026 at 04:19:39PM -0700, Suren Baghdasaryan wrote:
> > On Mon, Aug 31, 2026 at 3:27=E2=80=AFPM Carlos Llamas <cmllamas@google.=
com> wrote:
> > >
> > > On Mon, Aug 31, 2026 at 11:13:16AM +0000, Alice Ryhl wrote:
> > > > On Sat, Aug 29, 2026 at 06:56:25PM -0700, Andrew Morton wrote:
> > > > > On Thu, 13 Aug 2026 12:34:28 -0700 Suren Baghdasaryan <surenb@goo=
gle.com> wrote:
> > > > >
> > > > > > v2 version of this patchset [1] was written by Dave Hansen and =
per his
> > > > > > request, I'm taking over this series.
> > > > > >
> > > > > > tl;dr: Make per-VMA locks available in all configs. Simplify so=
me
> > > > > > of the per-VMA lock users now that they can rely on them being
> > > > > > always available.
> > > > >
> > > > > It's been 2+ weeks so perhaps a refresh-and-remind would be helpf=
ul.
> > > > >
> > > > > But it applies well enough and is adequately reviewed so I put it=
 in
> > > > > there for testing, thanks.
> > > > >
> > > > > AI review might have found a couple of pre-existing binder bugs:
> > > > >
> > > > >     https://sashiko.dev/#/patchset/20260813193433.3318288-1-suren=
b@google.com
> > > > >
> > > > > and a small rusty thing which you might wish to attend to.
> > > >
> > > > The binder bug is not actually a bug. When using VM_MIXEDMAP and
> > > > vm_insert_page(), the vma takes a refcount on the page, so there is=
 no
> > > > use-after-free even if free_page() is invoked without removing it f=
rom
> > > > the vma.
> > >
> > > Exactly! I agree the refcount on the page would prevent the UAF.
> > >
> > > However, we should still reject mremap() because this leaves the page=
 in
> > > limbo since it is not given back to the shrinker and also binder can'=
t
> > > make use of it anymore. I'll send out a patch to fix this.
> >
> > Ok. Should that block this series or it will apply over it?
>
> The issue is pre-exiting and unrelated to this series. So I'll take care
> of this separately. Thanks!

Perfect. Thanks!

>
