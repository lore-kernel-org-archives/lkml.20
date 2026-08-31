Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3636637E5E8
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 20:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788208954; cv=pass; b=ImcZLD/wNtKwtH2qKdhP07w6/AMXVfP3LEAr7RwWT0rfgOj1YLfGBSr8IVgPVVBh/NKPi1Rn4manh0YjxGYRco7mEb4iEhAdp3lMQqgkOUtLIpQHnzDsAC8EYoS3fGllB7r534E4e6TT91BoQ/5RrY/uPn7y5Dn5Mk/wn5OU78s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788208954; c=relaxed/simple;
	bh=+2DRX6ohVfpMYN+TbDH2bvn8pp0/0YyztZkOYdll8xw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BvsPOSjMywwAqoV8wmYNZI3E4Cg0fkEgByIyreYMs3i/SgopaN+j1JDkTO0uHZYcJ4Jd/qJm8whGv8H0doqJZJ6EEzQa/cog1oHOUWFPMTQOjW/k76D2T6I2XBB+crZHqJTBWReoDLYjYp9kpSliwiPH0bdzbaGB6zyv0ob7JJ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tt5EA0Fr; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tt5EA0Fr"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-51c01c79467so88811cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:42:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788208951; cv=none;
        d=google.com; s=arc-20260327;
        b=Dv+vXWKgLpdsX7YB0stV6FEjFlaSNkGAoN2b5e95dWpgTy17BiKaB8D7a/i9Ylb+3b
         4SoTEK7kOyx1WhBykSmbs4qZP++Z2VyZOvId3PwB0wTOn7vjTHY3JbS3hJu8o54+z5WM
         kM5lqO1gYm+4/aGrMjmM8V2Q4DocZx0KEsjwWEkc1wyNkbhE+OPnWS95loUE+niixD2F
         x89gN/ITY6UwMYfOGmRjbrPS34dUp7ninhxXXMSpFlzQpCEB1dQ6XNoX8hessBtDE7FF
         CcGrdcxazPVEjTdhXfanLI6gofNHJdL90VpUHnumT8Dismv23lXexIrOHPijzAq8bI6h
         G81g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3jezNBELpt51SbHBtmRmjdqZRoyOEfGekJU8Ocm74OA=;
        fh=i+bhWif0XXpcv7wdsPvJuTzIeQIlCZnxmnYvFW/KFxo=;
        b=Lz93yF98frKrx9iDI+MoeI7x50JIy1Z981FYCE3NM0ZkRQjj9hzBnZ81e6DjpKECig
         9hLUQwNSwq1/hxjPoa2kFWgf6MRcP5Z4eBNMBdnl078g4iI3YbQMEjUDT5aWVbYl5nDw
         9pxoi4ozVnLEBWmJwQcfnVDEicReVrurnjFGCtbzzdoM3yrnoqHQY7MbSPvIWdk48Qm6
         j8uK+314LF7yBP6A8EMnTjrDUyfpyInVX7e+JtrGZs5oMoBsnecL5bIL5gTExpT5Bws0
         cRn3JdLH7bv/jfmyre4HmG22fWWrCIqjiJdo2bhKiS/IU+KfP+Kyq49bYKGJd56PekV7
         KAFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788208951; x=1788813751; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3jezNBELpt51SbHBtmRmjdqZRoyOEfGekJU8Ocm74OA=;
        b=tt5EA0FrN7ShiKi1GBTTpImsdTxbTcdQpNwBVV46uHIWDXiuTYaSw1bFcN0CNy0/K7
         c4Ld6uoPLa6pqaSShWXJ3KWwM/2gThMInvDzP0nl0DVCjY7eiAsTw4Nw4FNdCvouAans
         oEVvBW2ookiW3TxzSKe1+NVCCuzTriaYc1OZA07Zxf078DKwpSnpVi1KPDu8qC1Pu3qE
         HDHfzY1US4HgTG1GhwWN1Jt2j3GMM5Vk7o1iHLZ3fs7x+vNJWAWQ2bpv4rDeU8fhh7K+
         8bV9AKvOVR9FswIjaXQsXtTq4jgCuTykUrr3w7Eoo4nCC9g8X8ttbDXKCKA+LXio25fN
         JEow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788208951; x=1788813751;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3jezNBELpt51SbHBtmRmjdqZRoyOEfGekJU8Ocm74OA=;
        b=q+sNXheVg22xZgK2txug6nR7Q8zhDoAU7dY9zrIC6xRbF/eiJIAvQKTl8ZcG/vQcND
         vbiNT/cBOwk/0Jc7i2tUHIoj0Oq0M9TeGJfUcvBjpS3Owc+LmCUC9nKYzfA1zoSz7y7V
         GMKHIUPm/jn8GLP18eXnejz6ac8s1TcRn8Fty0YXO7jeS4EhQ9e/gy+ZCbeFt45HmPre
         6C+XqQoXZPevcdpFRYvJgqiVS6qZzdBq+uiIppzjT3Su6cG23OGstIB2eNJSD7pcAWgL
         w/fOyvy94qCeAQ23JNd37H17QcczdGl4j3dcDgS3yGmfbk4s4OM6Zi5swLkW74pLMbv7
         Y6xQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro9Sg12mnaY3F8EdxP1V7nk33iAkmAL2+8b7hLk9+IBg2zDjiMb+tlKFIFvazZZQmEKPLs19zCi5wiw0hQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mMl5hERYGvw7/uaDiYPWmT2z72HeYYVO4xttCRtLtMPc79NEk0
	xMxWfm94r9Jx4QSNq6qs4JPYHLzyP3u8esqpq4qcqd6jVLi1+DhnUHlfTBXvuKUdqqoWZ1XJGul
	PA6OFmKBNhQ8ujXK0MQby46yOVoMXZu5UqUuKSEvo
X-Gm-Gg: AR+sD13tf3JSB01RTKdlSscpVXo+hISIEXl+x10hqG1fJtKlqe+9G9yXEbfoWRsvwWf
	h6A0k9TQmkHuTMhJbR4lPsMewq2+qm2ZvzqfDsku+vUfZ6c92qfI56MmLIgFRjWg7bZNiNKqS6/
	W0UcdfT6MIjvQjxHeaaAgErZBmu05KfsJxV+0xr7cNkRs5AuO0b1XRGKAMk3/S2fbp5sZ4PNviX
	Av6SCpomT/qWKRnPGH67AiBl+7bvD83WZUtiDnPVIV3dA0UpMWJDgIK5IPqYJmE4p1IQu4Dz3P/
	MbmkDSM5hFRMmdvS1kp3v1YPqy0i5+kzgmWpy4GAWHk=
X-Received: by 2002:a05:622a:229c:b0:517:64f6:3365 with SMTP id
 d75a77b69052e-53024d4656cmr4002881cf.4.1788208950057; Mon, 31 Aug 2026
 13:42:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260813193433.3318288-1-surenb@google.com> <20260829185625.f5ee1b2931818843a78af88d@linux-foundation.org>
 <apVhzM2501wSiGGg@google.com>
In-Reply-To: <apVhzM2501wSiGGg@google.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 31 Aug 2026 13:42:19 -0700
X-Gm-Features: AcwNN1Va5-U2p_HBt_SoCk7IUhZqXMl0RB6eAwv2hmO5Zse_aoEhwTkiwxqTQpI
Message-ID: <CAJuCfpFLwkYWAsK8GrHwmHT06egrMmNaKYU+WY=5Qc+HnacWxA@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] mm: Unconditional per-VMA locks and cleanups
To: Alice Ryhl <aliceryhl@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, dave.hansen@linux.intel.com, 
	Liam.Howlett@oracle.com, ljs@kernel.org, david@redhat.com, 
	willy@infradead.org, shakeel.butt@linux.dev, vbabka@kernel.org, 
	jannh@google.com, arve@android.com, cmllamas@google.com, christian@brauner.io, 
	tkjos@android.com, dsahern@kernel.org, davem@davemloft.net, 
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 4:13=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> On Sat, Aug 29, 2026 at 06:56:25PM -0700, Andrew Morton wrote:
> > On Thu, 13 Aug 2026 12:34:28 -0700 Suren Baghdasaryan <surenb@google.co=
m> wrote:
> >
> > > v2 version of this patchset [1] was written by Dave Hansen and per hi=
s
> > > request, I'm taking over this series.
> > >
> > > tl;dr: Make per-VMA locks available in all configs. Simplify some
> > > of the per-VMA lock users now that they can rely on them being
> > > always available.
> >
> > It's been 2+ weeks so perhaps a refresh-and-remind would be helpful.
> >
> > But it applies well enough and is adequately reviewed so I put it in
> > there for testing, thanks.
> >
> > AI review might have found a couple of pre-existing binder bugs:
> >
> >       https://sashiko.dev/#/patchset/20260813193433.3318288-1-surenb@go=
ogle.com
> >
> > and a small rusty thing which you might wish to attend to.
>
> The binder bug is not actually a bug. When using VM_MIXEDMAP and
> vm_insert_page(), the vma takes a refcount on the page, so there is no
> use-after-free even if free_page() is invoked without removing it from
> the vma.
>
> Adding an INVARIANT: comment to the Rust code SGTM.

Posted v7 with these fixups at:
https://lore.kernel.org/all/20260831203056.838265-1-surenb@google.com/
Thanks!
>
> Alice
