Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792696476;
	b=aRf8tKO0Ue2zP5KkbL20AfKHDZdrDWy9t4S7rS0j1Xo80ZAXVkSFaEvxE34Nw1iWuoLn
	 wAKwwsy9q7nskUXhQzQdIda/Rh0U1etQ9s3whSdqBpO/PuPl05yQkWvHcVoa/tNMfCltm
	 LEQkWEIngwPIV6ur3/mUuPmLpz49ph/zh5uWngZ9D3yraghuLZIBt5rHSDhIapONxWzCw
	 OzNH2sxc63vqu2AeHBpcqXZZBrcFgwMEktEXc/lVSr4DPXnYMtpINdMmligc/LWwnz6uo
	 F7b8zV+UOQn5fIwRi8rFhNew0VlajZBsEEH3F9Seyk9fUqn2aZFAzrdBfxGPtJ8CPYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792696476;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=T/yfsex+iXT2y+mnUpnV6G/RlAESLattCq2u7FMOcqo=;
	b=b3k0qd7kEx3ynmGQmtUBMaqENmw6+2VWbK154yUFxF49uRCuASEi2K69t4UDv1a66sE8
	 R2uK7qXGq6gVfej6R3pNr3eRg7OZ5QOR6zrkWWCMEHRxrFfLlje6olo2WGO3vbUIR1T5x
	 A9V/xFhZsHQC9wMYD5r1gs32nOXNdKvi/UDRXdO/svGzHszWQiNA4w3as8iIfA/z+pgWt
	 4q1ksEnc/5hcna0LWwJGBr0XdXWazMGkOi2HGdpr1aTmIoJ/bp7KXEMRK7GESzyAHVMrV
	 pIIJ/H+EvrB9LUxDrI1bDgR0/G+Te/rZjJ2Yu2pmarCxxmDj0efnPs31y0PtDXH3+TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WbNcKzrs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43F4606A324
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 19:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WbNcKzrs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C9CA1F031E6
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 19:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792696475;
	bh=T/yfsex+iXT2y+mnUpnV6G/RlAESLattCq2u7FMOcqo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=WbNcKzrs4jlat3qo19SV3vGqrVC/sjs6k92qlo/tyDrRcRGtDqEOQGCL+//UiNdya
	 fU23l2YaBkwLby/GaQN8NAuFcyavTO6Mmnjq+nRuuyzcgzInnrzUNjhGusvuvcdgSC
	 bUKleioMEsiPqL35LVrsRomt4pzoKnST9J7S2LYLVDfAvTnhj1Dadb67ZH+W772GoQ
	 IVc6pu6+a+4eVj6DhdjQXrtgBqWkSClSAytPRIAaSXfTsEO/K7FhcOzo81+wNZTqVW
	 JbZju2RUTdQEPn3wnKLitSw4oWbY2wlFZf+BoGqn6VWu5PwTS22alZwI8iKtZsvJ88
	 QVeZSV53c6n6g==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5be3cff0f6cso31594e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:14:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxxIQp/MV80m+UOVkMVv07lLlsCoVCdzL665fN6IJLrEwJ7VfEv1sKr9OZuvPUw+eFtJ4xA+QTNhGg9oyU=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2V7LYEV9riEqLg2YAVeW8vQh5ZJ0EkAHOuDCG7so2hBj3PZPV
	BgKNeyXxgZdtup2qDdv4kaTL2uDN4wIU4LLjkeOmHQ1dLbGq+W64/TBnKG4S7iG+GRq0Bw/oh50
	LCuR9E9/hu0a2IiE6U4J0e+TO90f2Mdk=
X-Received: by 2002:a05:6512:1108:b0:5b6:95e:87ee with SMTP id
 2adb3069b0e04-5bfa1be5a8cmr2554398e87.13.1792696473945; Thu, 22 Oct 2026
 12:14:33 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260910205234.5392-1-kmehltretter@gmail.com> <117bc415-6bbb-4739-81b9-d2bf718056ba@arm.com>
In-Reply-To: <117bc415-6bbb-4739-81b9-d2bf718056ba@arm.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Thu, 22 Oct 2026 21:12:11 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0gg1uEy4pagxkPFMqvy__KWJU-_k3S6Ovx6BRzCnuD87A@mail.gmail.com>
X-Gm-Features: AclHuK8EhEVVmKJNgxR3ezPnbggzziCRHv9w2do46n90Ob62xaTp3ojSpOD12RE
Message-ID: <CAJZ5v0gg1uEy4pagxkPFMqvy__KWJU-_k3S6Ovx6BRzCnuD87A@mail.gmail.com>
Subject: Re: [PATCH] PM: EM: allocate the cpumask for every perf domain
To: Lukasz Luba <lukasz.luba@arm.com>, Karl Mehltretter <kmehltretter@gmail.com>
Cc: Changwoo Min <changwoo@igalia.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 9:57=E2=80=AFAM Lukasz Luba <lukasz.luba@arm.com> w=
rote:
>
> Hi Karl,
>
> On 9/10/26 21:52, Karl Mehltretter wrote:
> > em_create_pd() allocates space for the trailing cpus[] flexible array
> > only for CPU devices.  A performance domain registered for another
> > device therefore has no storage for its cpumask.
> >
> > All performance domains are added to em_pd_list.  The netlink interface
> > does not distinguish CPU and non-CPU domains when it calls
> > cpumask_weight() or iterates over pd->cpus.  A request for a non-CPU
> > domain reads cpumask_size() bytes beyond the allocation and can report
> > bits from the following memory as CPU attributes.
> >
> > KASAN reports slab-out-of-bounds reads for both dump and by-ID requests
> > against a synthetic non-CPU performance domain.
> >
> > GET_PERF_DOMAINS does not require GENL_ADMIN_PERM, so an unprivileged
> > request can reach this path when a GPU or another devfreq device has
> > registered an energy model.
> >
> > Allocate the cpumask for non-CPU domains too.  The zeroed mask remains
> > empty, as required for the documented unused field.
> >
> > Fixes: d8eef0453132 ("PM: EM: Implement em_nl_get_pds_doit()")
> > Cc: stable@vger.kernel.org
> > Assisted-by: LLM
> > Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> > ---
> >   kernel/power/energy_model.c | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/kernel/power/energy_model.c b/kernel/power/energy_model.c
> > index e610cf8e9a06..fd07c564c201 100644
> > --- a/kernel/power/energy_model.c
> > +++ b/kernel/power/energy_model.c
> > @@ -439,7 +439,9 @@ static int em_create_pd(struct device *dev, int nr_=
states,
> >
> >               cpumask_copy(em_span_cpus(pd), cpus);
> >       } else {
> > -             pd =3D kzalloc_obj(*pd);
> > +             /* Readers expect pd->cpus to exist and remain empty. */
> > +             pd =3D kzalloc_flex(*pd, cpus,
> > +                               BITS_TO_LONGS(large_cpumask_bits));
> >               if (!pd)
> >                       return -ENOMEM;
> >       }
>
> my apologies for the delay.
> The patch looks good, thanks for catching this!
>
> Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>

Applied as 7.4-rc material, thanks!
