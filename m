Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792432814;
	b=T/79kGhUUp5dgGvPkLheecIvi91/zLeOzIB1z1ZuKIKzvN46YPfuK/sdtquJJrtmLTwI
	 lGE49uEHE0I4nXbnLf5Dz595282N+bEADNKC1Y5bka473a1M/NE5T5mlmSuhlWBZMioGI
	 xuyKJow4VPCxluLqo+dFC0M98gx2sNWzTD19CwVaILjGVhfm98qI0xdftjL/ypEIetKUu
	 MCRUgPj2U+igtbDfI91igNSgytp5WAjRrp++LWayS/0tcIaYEokjQofDzcV5HG8AQUAgF
	 qv/7UieHG+9yM3k3idE+jZOYfVnNueCqZNBWAff3aPSRfOKy2M0uwBFSNa95tFmzjxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792432814;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4bJEDi3AXLshK4RTkURtSxS9+G3AZ/xwr8RL41kF5zE=;
	b=AjD48F/9RIPWnhsB38YXspp2opoYHfmBcX7PqbLhdLYyhFgcg1bjwitrMJoUJY76NleR
	 PqYkBMh9DN7Aig0J43FePjeCfIPhauWrCSMJQBI7tw9N9RR9hgJ95qhjjuQWuIkKMuoHS
	 jbg0SodLUQDd8BPcC7WfDvMXDQObByzmNOGdHE0GzyWVbimN+vsJ3LRmUeujMliEWNTC8
	 pgqdqVd2jYD1sFkU313cx2iPi7GlW6X880OnDJaKTS0q01P2Wcpu6jspEYHQV3UIM+P6O
	 dDFJNQgBwXTk0UeJ72L4joT6RkrO2Tlrpnn8bbODyCmy4/gvl4QZCqFAWmCeEGVVLUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LI6AvmA2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6297606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LI6AvmA2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C1D31F000CF
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792432813;
	bh=4bJEDi3AXLshK4RTkURtSxS9+G3AZ/xwr8RL41kF5zE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=LI6AvmA2ClqE/va9oUVk3ADxFMiq9Q3iZF0bmDLF4k9dZEfrNRKHNOfsj7epqdZiW
	 2hxjLa6X+ehUAd32EoCm1+4x1jYjJKCI64bcyC38t47bANuS4MZ7CDhxE2aXd18zVl
	 eRdLvE6+Gs91p6E3S3TXCkcDf1BUpRYMgl22ldSuUrkV+WkW6JkoPfWLKbkQ4sobBS
	 ayCpYUOCbNdfx5z7uVJeSL/XGjNgsims3nlx+FSxpOVejTvfWOFc7JoKBrqzzYSrrH
	 kMqd1mWtIgEhJ6DVfop54r1cGIm/2aQwVK7CYxhKhR5HO3msKXR4BvLsdUHOf519qG
	 x0vkOMw/JEvtw==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c40e02b2ebaso343265366b.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:00:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxds+r2WOWB4RLd16/V8vjOcIiLSxubV2ts/gZB2dCOlhr9W/xmr6CSVg2oFeJ4z2TPXlivbjlz/PVxRH8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfAq/BPnBBq9lyNTMSBwhUxLhWvPNbUlgRrGY3tYl10hNUw9ug
	kNNpBvD2aOeocgwYuwsXtUQy8jgRiLCSZjN6xQHe91z0xyclH20os7CQNIGWsBvnCuPAbM5wMyr
	0wh/lGptitav+RwWWLdrT7XqJ1JGPQ6w=
X-Received: by 2002:a17:906:1012:20b0:c41:b4e4:7958 with SMTP id
 a640c23a62f3a-c41b4e47ad3mr368689266b.0.1792432812277; Mon, 19 Oct 2026
 11:00:12 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <aszH4vpXFAOQP1WG@pcnci.linuxbox.cz> <20261014235736.GCatAW8GD0GlYumL4l@fat_crate.local>
 <20261015172820.7961d2c0def74d41cc6c4b0c@linux-foundation.org>
 <20261016031242.GDatGWKo98YSOhEOOn@fat_crate.local> <20261015211832.45d87fab15bb3e0bbc2f47cb@linux-foundation.org>
 <20261016054954.GEatG7AgMNFRkiTo1H@fat_crate.local> <atI_yuCc4BiweBQP@google.com>
 <atT5TYyLapHO5ZoX@pcnci.linuxbox.cz> <20261018201538.d0957878f378a9821852836f@linux-foundation.org>
 <atXXma5NXxoSWJO0@pcnci.linuxbox.cz> <atY1vWRBRUwpISKb@pcnci.linuxbox.cz>
 <20261019083529.a81910ac0976c1a5687d4c6a@linux-foundation.org>
 <CAO9r8zO41EromgLGhKv8H0aKXjrffH+t4CFGU6cLo59JJ3CEuA@mail.gmail.com> <20261019105844.02d4623b7063fec25ebd34ad@linux-foundation.org>
In-Reply-To: <20261019105844.02d4623b7063fec25ebd34ad@linux-foundation.org>
From: Yosry Ahmed <yosry@kernel.org>
Date: Mon, 19 Oct 2026 11:00:00 -0700
X-Gmail-Original-Message-ID: <CAO9r8zN1dTJmULsKCwNrNr_vKyrV+vMfD7wifQ05uAti7E-yDw@mail.gmail.com>
X-Gm-Features: AclHuK8kQ02N6lgb1bN98-Mh0znyAWQVD9WRag9FmdXyATJ4w1AyP1Rrsu2EOIQ
Message-ID: <CAO9r8zN1dTJmULsKCwNrNr_vKyrV+vMfD7wifQ05uAti7E-yDw@mail.gmail.com>
Subject: Re: hunting memory corruption bug in 6.18.x
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Nikola Ciprich <nikola.ciprich@linuxbox.cz>, Sean Christopherson <seanjc@google.com>, 
	Borislav Petkov <bp@alien8.de>, David Laight <david.laight.linux@gmail.com>, 
	Rik van Riel <riel@surriel.com>, ljs@kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, david@kernel.org, 
	Mike Rapoport <rppt@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Pedro Falcato <pfalcato@suse.de>, Kiryl Shutsemau <kas@kernel.org>, luizcap@redhat.com, 
	pbonzini@redhat.com, Tal Zussman <tz2294@columbia.edu>, 
	Matt Fleming <matt@readmodwrite.com>, gregkh@linuxfoundation.org, sashal@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 10:58=E2=80=AFAM Andrew Morton
<akpm@linux-foundation.org> wrote:
>
> On Mon, 19 Oct 2026 10:39:30 -0700 Yosry Ahmed <yosry@kernel.org> wrote:
>
> > I am glad the commit fixed your problem!
> >
> > >
> > > Great, thanks.
> > >
> > > oops, we haven't been cc'ing Yosry.
> > >
> > > > Definitely a -stable candidate. Andrew, will you send it to Greg, o=
r shall I?
> > >
> > > I volunteer Yosry or Sean ;)
> > >
> > > I think 55780d8a1dcc should be repackaged before sending over to the
> > > -stable people.  Its changelog is very wrong: "The bug is benign
> > > though".  Update the changelog to explain that the bug is in fact evi=
l.
> > > Otherwise -stable and further downstream won't understand why we sent
> > > it to them and won't understand the impact.
> >
> > It was found through code inspection, there weren't any symptoms, and
> > I think I know why my analysis was incomplete. It assumes that
> > svm_recalc_instruction_intercepts() already ran at least once for L1
> > (vmcb01) to configure its intercepts, which generally must be the case
> > (L1 must start L2), except during migration :')
> >
> > About repackaging, yeah we can add a note about the new finding and
> > the necessity of the backport. One question tho, is there a way to
> > send a patch to "all" stable branch (the same effect as adding Cc:
> > stable retroactively), or do I need to send separate backports to all
> > open stable branches?
>
> As far as I understand, a cc:stable and a Fixes: will result in it
> being backported into every tree which has the Fixes: target commit.

Right, but this is for new patches that get merged into Linus's tree,
what about existing patches? Any way to retrigger that workflow?

>
> > >
> > > And that repackaging would be an opportunity to add
> > > Reported-by:/Closes:/Tested-by: you, which is the least we can do to
> > > thank you for all this diligent work!
> >
> > Will do.
>
> Thanks.
