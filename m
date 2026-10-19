Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792446459;
	b=ASFmKIxhWV89p6iwASGYLF9v4qk6v/jTQzfBRlX8k+YwgqM0cwkLc19gVFKR3duG0G08
	 DNKJdaMFrNEgo4s7WcEKbS8x67gx/0Q/t8AVp9FUlXGdWqOAvq1edD+76yrx1XMDlVnEI
	 Pws+6vRcZJVxOCGfpyyFXxOhxjLDKWith2N2cP+Ot4RqqetvADuZnoTK0ibzwZk3nlzm4
	 tsoqscciwAka8JHW1NLkQTM9z2W4NS+1MtEciazG4x3Y1FY4zoN8N6WmcIKW9HXyiPtl8
	 DZDS1oLK7GwaqUviftry5d1TovkD/tzo4xIgwUGOBrR7tQG+tmaBg3dNNYxpjCJznfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792446459;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Y01ZFxKnej6mlURbS/x8BLwV+C7jNkm78zIZtDfVDp0=;
	b=fe5AaL0U6j3dQjplEPakbNrLIWUVH5v7W4w6MYbSltjEtbjwT6EJPFk+/iFXpqevNcfm
	 WFKR7mCaZBXLlc8+uTUMgt+XvUL+swcxV5wQZ74cW1s50R+3hzMi16/PsdoqSUjFIMp2C
	 HG29v7W61jg1PF+PB68Xrs47W0ic7bKMdI0JyCvMy3Pz/SFfQteDr1XgUg3lt/KsE8syz
	 Zdvw+uqBHPl3RyJDCEmSzJ79NJZGCKQxvWD+ALZQxfWLaixbbhbCTLWGcgPUyAnYdJ3Pu
	 FFWwLd0AJeodubGrKWuxTwfUmbf08QfzRLGEx2Sm6WD3SWor6NGHTKEunJfMpn/Rm1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lQZgqdUp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C02606A319
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lQZgqdUp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0EC91F000CD
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792446458;
	bh=Y01ZFxKnej6mlURbS/x8BLwV+C7jNkm78zIZtDfVDp0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lQZgqdUp0zhIV+HXrQx5g7nOPWsoMxtLqnTsHtXZlQCwNWMUSIOC7WxV680SQyNMX
	 sTdeatBIAD4itaMEkXk7aWS7vdcUtIKLVTIiA4qBID8nKENcCHY6qNgM5jI9vR2Czq
	 HFTVWnGcBeWQxlzclhq3lp67FAWDRV8FhAJxsU/kECVxxVnIFLMEi6WIyoQI4QGnE1
	 cIimnS27lGSjRknOtwBK9V1MFJxiauAA6JE8G8YwLzTl89jtgJczRe7bza/Q1fKAMa
	 xvMiSWUK3NiuwFH8k3m1jMV6LKMNACiaQg5MZp5RhQOCb7divTCTqibkDlFSnl5Mvr
	 II97sRUECqtDw==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c40e02b2ebaso370510266b.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:47:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByXBB6Dmxrg4z1oyKhiWHvdXOuuGgt4DYQYXPfLhi84C99N3SbtFumzrrYAW+otwK+wr6JL8zkmmqUR/vc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYCalfK4dnulz1+OB6FDVDnFj6Iuo4bEXHQWV95YrypsatzrXq
	aU6ZevuUlUrd4MNggyqZly7tOHiyVuX29s5ypqv01jYCRcjw7AcSJIK36Ro788uqTzt6p9UtrWr
	2ONI1x8sWczN5gUGmw1qkWNNU55RwSnU=
X-Received: by 2002:a17:907:d385:b0:c41:5a0e:3356 with SMTP id
 a640c23a62f3a-c419ff0269amr587261666b.41.1792446457458; Mon, 19 Oct 2026
 14:47:37 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016054954.GEatG7AgMNFRkiTo1H@fat_crate.local>
 <atI_yuCc4BiweBQP@google.com> <atT5TYyLapHO5ZoX@pcnci.linuxbox.cz>
 <20261018201538.d0957878f378a9821852836f@linux-foundation.org>
 <atXXma5NXxoSWJO0@pcnci.linuxbox.cz> <atY1vWRBRUwpISKb@pcnci.linuxbox.cz>
 <20261019083529.a81910ac0976c1a5687d4c6a@linux-foundation.org>
 <CAO9r8zO41EromgLGhKv8H0aKXjrffH+t4CFGU6cLo59JJ3CEuA@mail.gmail.com>
 <20261019105844.02d4623b7063fec25ebd34ad@linux-foundation.org>
 <CAO9r8zN1dTJmULsKCwNrNr_vKyrV+vMfD7wifQ05uAti7E-yDw@mail.gmail.com>
 <20261019181510.GAatZeLtUmU3Zy9VZt@fat_crate.local> <CAO9r8zMdLN+wms164bs_c5BfnrYZoNAPz6b6hcODt1JnUMniVQ@mail.gmail.com>
In-Reply-To: <CAO9r8zMdLN+wms164bs_c5BfnrYZoNAPz6b6hcODt1JnUMniVQ@mail.gmail.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Mon, 19 Oct 2026 14:47:25 -0700
X-Gmail-Original-Message-ID: <CAO9r8zOq16mMpRsg_83wfYX8HQQziJLFtjVGuUu_j0doCBVgZQ@mail.gmail.com>
X-Gm-Features: AclHuK_Usd8FmnB_Y9RQuzU--fW4ljIz5k0wB473gNs2RDhEXbyVkZbgYbBQPGY
Message-ID: <CAO9r8zOq16mMpRsg_83wfYX8HQQziJLFtjVGuUu_j0doCBVgZQ@mail.gmail.com>
Subject: Re: hunting memory corruption bug in 6.18.x
To: Borislav Petkov <bp@alien8.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, Nikola Ciprich <nikola.ciprich@linuxbox.cz>, 
	Sean Christopherson <seanjc@google.com>, David Laight <david.laight.linux@gmail.com>, 
	Rik van Riel <riel@surriel.com>, ljs@kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, david@kernel.org, 
	Mike Rapoport <rppt@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Pedro Falcato <pfalcato@suse.de>, Kiryl Shutsemau <kas@kernel.org>, luizcap@redhat.com, 
	pbonzini@redhat.com, Tal Zussman <tz2294@columbia.edu>, 
	Matt Fleming <matt@readmodwrite.com>, gregkh@linuxfoundation.org, sashal@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 12:53=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wro=
te:
>
> On Mon, Oct 19, 2026 at 11:15=E2=80=AFAM Borislav Petkov <bp@alien8.de> w=
rote:
> >
> > On Mon, Oct 19, 2026 at 11:00:00AM -0700, Yosry Ahmed wrote:
> > > Right, but this is for new patches that get merged into Linus's tree,
> > > what about existing patches? Any way to retrigger that workflow?
> >
> > You take your patch, apply it to the stable trees here:
> >
> > https://www.kernel.org/category/releases.html
> >
> > and send the applied and tested version it to <stable@kernel.org>.
> >
> > I.e., you backport it yourself. :)
>
> Will do, I have done manual backports before but only for conflicts. I
> was more asking if I need to send the patch to all branches or if it
> will be automatically backported to the others if there are no
> conflicts.

Actually, it doesn't matter. I think only v6.18 is affected. I think
the problem was introduced in 5a1a726e68ff ("KVM: x86: Use
KVM_REQ_RECALC_INTERCEPTS to react to CPUID updates"). This commit
deferred the initial intercepts calculation to the first KVM_RUN,
making it possible to calculate the intercepts while L2/vmcb02 is
active without calculating the intercepts in L1. Before that, I
believe the bug was indeed benign in practice (I think a VMM can still
trigger it by going from an Intel CPUID to an AMD CPUID after
restoring into L2 but before KVM_RUN).
