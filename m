Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793045536;
	b=WNMQKcGppelYNUOvwLQJpZ+FWrSri17IlzbYl76ujLSr++eVy7DzPhWZ5+9b7g3CqRVF
	 yKf2epbeCvh7v1WF2yoQVnzqYeEXOwgMHNS31qJmuPH0tJl3CHXURLWmacfDWiKhvGkwI
	 y+NIJZzDtFQqSoVHVOgonuWtx6Z51mZw3HphW+nqugpTy46Lxs1r5z2F3koZt8mBc+tb9
	 +x6b13vIhLgOE/NxXNtfpE/PLQwJUAOTU4qjB1azQDtE0eOT0lQHAbsA+hh6izXBMKc82
	 o1rJHIckrgaWIX5Z36afEbaHnyBsJ1sgeNeMtiPZqwD41kqZ8+EtXjfRuH85UU5JAGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793045536;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=WY8zdkd7rZ5cmhFyEZEoT+5FWqoeefwdy0riPJROyps=;
	b=maYR3bGvMprYK5Oe4XwRyuq5hqtX0YKVGD9DXKgslGuuVirzgD27GMcFS43R8H3VblSw
	 inNWmd5MUQ0OrpjsuIWo0t6774OFGuZf6qfV4f20ipS6xW5p3F3NzDlySIN3jTTpJ3lRu
	 P3hA2zN4N726XN+FsK17GDOMKEdL/lJXtezhh3s8djfebzXb4Om/tlf7YmtqyvCiVm/08
	 hasUnA/vxRPFXqaEPK5P3MFE7buAzizN30MQkw6uStF/IwIRgM88bbMieT/NtU9+pvnNh
	 EbChqypTnadNEmHsddfQWB6Dh/AgFJA2xCcse239vNpR2i1VCEFOPAJNUTMqMe/7s7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Cc/n71xi";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86B4606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cc/n71xi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55C0B1F01825
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793045535;
	bh=WY8zdkd7rZ5cmhFyEZEoT+5FWqoeefwdy0riPJROyps=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Cc/n71xiAX6mMSvHcjXHQI7LVOk1Jcy/mOH5WQxw2aXn6FT2gsn79YTQnoKgY/ahJ
	 5EhdoPJRaXrOfkvRTPsiSxHLo6LWK4HcF3ZttA1gZqZM0h+gZGmF98bTerrZFGHaly
	 uHpNsngx148BP6U0wSLmuIlc+AMUzb6bZ/GgZv9DrgcfiqspEHa053BxPwwmcisBBT
	 y6yg58iGihWnW5siJkHTbH6XczSSRLQBfGi85h9KasMaK9O83hrj3e5lnZEAbBbWUt
	 zJlERr/+Yoj5H0Y4TzWbaCaY7Lb2F6vfqN0Drz811ZKLDRmICyh7Fvx8RtDmnS/UDa
	 SDPkjRz6ug0Ww==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c414e5d282eso396275966b.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:12:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx0LYRTYZiUaZrcezPm84aVA9CgNPhS/JjvfrhK0zSfBB47MCpC3WMYHra5KbggVUX/kFHCVQRgshZ07LI=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3MoUx/AzkxT26nSpmfhWJ1LE6nwC/kLrBS4cKc/lubt+bmygh
	Z5pmip5gJd32JngX0k4rE54SU26uN2Xb/hOwsmHCVPjbtpnIxPTx+4yFm+XA18yK6dWb+vwBsx1
	k70QAfgGwdxwaWvh8iV1m4Lb8VcqSAg==
X-Received: by 2002:a17:906:c14f:b0:c2e:8eb7:53e8 with SMTP id
 a640c23a62f3a-c46bde6b23cmr858650066b.30.1793045534038; Mon, 26 Oct 2026
 13:12:14 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020212235.1143086-1-ebiggers@kernel.org> <363b228a-7e96-481a-b70f-195ba55d025e@kernel.org>
 <20261021063927.GA31908@sol> <d5d0801e-371c-4836-8b4a-26bff33df46f@kernel.org>
 <20261021064940.GC31908@sol> <aea2328d-4ea8-45bc-922e-9c1fed94083f@kernel.org>
In-Reply-To: <aea2328d-4ea8-45bc-922e-9c1fed94083f@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 26 Oct 2026 15:12:01 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLA2F0oB=7LsoxZe-=AboOJu7FotpMACNsuV==jGWB8nw@mail.gmail.com>
X-Gm-Features: AclHuK8ctbLSJubqCXzYfxrKgeiEezgD3UGSo0bp_Ip9hFZUOPrInPCSAfIjGnM
Message-ID: <CAL_JsqLA2F0oB=7LsoxZe-=AboOJu7FotpMACNsuV==jGWB8nw@mail.gmail.com>
Subject: Re: [PATCH] docs: submitting-patches: Require base tree information
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-doc@vger.kernel.org, 
	workflows@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-kernel@vger.kernel.org, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 6:55=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 21/10/2026 08:49, Eric Biggers wrote:
> > On Wed, Oct 21, 2026 at 08:41:47AM +0200, Krzysztof Kozlowski wrote:
> >> On 21/10/2026 08:39, Eric Biggers wrote:
> >>> On Wed, Oct 21, 2026 at 08:26:28AM +0200, Krzysztof Kozlowski wrote:
> >>>> On 20/10/2026 23:22, Eric Biggers wrote:
> >>>>> -Make sure that base commit is in an official maintainer/mainline t=
ree
> >>>>> -and not in some internal, accessible only to you tree - otherwise =
it
> >>>>> -would be worthless.
> >>>>> +    If ``git format-patch`` with ``--base=3Dauto`` (or
> >>>>> +    ``format.useAutoBase=3Dtrue``) can't detect a base commit, e.g=
. due to
> >>>>> +    the current branch having no upstream tracking branch, it exit=
s with
> >>>>> +    an error. In such cases, pass an explicit base commit to ``--b=
ase``
> >>>>> +    instead. This is also needed if git detects the wrong base com=
mit,
> >>>>> +    such as when the upstream branch has local, unpublished commit=
s.
> >>>>> +
> >>>>> +The base commit must be in a well-known public tree, such as the
> >>>>> +subsystem development branch the patch is targeting. See
> >>>>> +:ref:`obtain_a_current_source_tree`. Mainline or the latest linux-=
next
> >>>>> +can also be acceptable bases, depending on the subsystem.
> >>>>
> >>>> I disagree, that's pointlessly too hard requirement.
> >>>>
> >>>> For many of my contributions base is obvious and not needed to be
> >>>> explicitly defined. For all the patches I accept, answer is the same=
 -
> >>>> base is either obvious or if not and patch does not apply, then the =
base
> >>>> does not matter.
> >>>>
> >>>> Requiring it is just bureaucracy without actual benefit.
> >>>>
> >>>> The only benefit would be if maintainer COULD change its base to app=
ly
> >>>> some patch with odd base... but this cannot happen. Maintainer base =
is
> >>>> fixed - it's the HEAD of his development branch for given category o=
f
> >>>> commits (e.g. DTS branch for SoC maintainers).
> >>>
> >>> There are many use cases for applying patches besides the final patch
> >>> acceptance, such as review (by anyone, not just a maintainer), testin=
g,
> >>> CI systems, etc.
> >>>
> >>> HEAD of a branch is of course not fixed, and changes every time a pat=
ch
> >>> gets applied.  That's especially relevant when wanting to check out a=
n
> >>> old patch for any reason.  Trying to guess a base commit based on the
> >>> date and patch subject is a waste of time.
> >>
> >> All these tools should just work on top of linux-next. Requiring peopl=
e
> >> to add base like "next-20261021" or "tip-of-obvious-maintainer-tree" i=
s
> >> pointless. I understand that base is helping, but helping and requirin=
g
> >> an obvious information just do not go together.
> >>
> >> So again: base has ZERO meaning to the maintainer process. It has
> >> meaning to tools, so fix the tools to work on known and obvious trees.
> >
> > So what is your proposed algorithm to apply an arbitrary patch when
>
> Already provided that, so to recap:
>
> > there's no base-commit?  Including any historical patch (from
> > months/years ago), patches with dependencies, etc.
>
> Dependency is something else, but for every other patch:
> 1. For testing/CI: you apply on top of next
> 2. Every other case the maintainer knows where to apply it, because it
> is his HEAD of next-branch.
>
> I am repeating myself, but I really had no single problem of lack of
> knowledge where to apply a patch as a maintainer or reviewer of some
> subsystem, thus maybe I do not understand the actual problem you are
> experiencing.

Look at our DT PW. There are numerous patches that don't apply and
then we silently don't test them at all. Here's one example[1] (3
actually as the whole series doesn't apply). The more base-commit
tags, the better. If b4 can't apply it, then I do try just linux-next,
but is that today's, yesterday's or 2 weeks ago? That still doesn't
work sometimes.

Rob

[1] https://patchwork.kernel.org/project/devicetree/patch/8b2c7719c301a4458=
91fc6c5309456327ec8a94c.1793026273.git.geert+renesas@glider.be/
