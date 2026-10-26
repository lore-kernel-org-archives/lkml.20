Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793023404;
	b=BPGeoDXt3tgAhplyCK9xdLrFV64xcwpUudGI+hbGHOO38UEyHgy2ZO85Rn87eY0uxPOm
	 r6+q/aROR3WWLjF3bfeekY4AkfOrkmJA8jCr/Thmx0aLGuFblePKZPh/LJABj9quEkb+f
	 wXCULubB2gLEZ7vyauOnjC6kWwbqINb8JlTRvMmly9Xt+78GnJ2+RQuDTCQ/xDH4VBv28
	 8UGsryUNwek7p5U0GYk9CUrSLPDEuiqeYRpLJg40fTLJ91qBmRPmYRVwbNnhnHEjCOtoe
	 +yyHm+4APhUGBZS6BCpRb8uMW+sx0cPIDLsPaoPMdrokTFEzMx0DHGPKoBxV7wYjJCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793023404;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=DMhcNiE7UFYB2cSErcXu0ACNivDw3qmsy4U7nmgAHio=;
	b=EUQg9iRqBZw/qq75U4GTDVIUIoRlwJQwcNP1G07vMApAUsO7fM0J0BmvHvUGGucvIRs5
	 LMMDLd/mHf4Gr7z7Da+7ipCH242SWr1ZddKPNOOZPJyBx9tguGVs6LQ9JKuwyFQgXz/hM
	 JBuQQ4f2+Qfs13Mj8vwB8rvbby3otKoNthN6D+TN+N90ODaYMJ47lffxajTRsRrvzWmRq
	 NDjkuGcvXpyGGhz+Htl3bF+SlQeM52eOCHnTbIk+GtLYRtqDzvfMp5NWz6Jp3hztHTtPZ
	 lasY5rWFQ8nKa9aqLAbiDpI4CUEvpLpaSh70Cn3Z+LXE2em2ZhnsyHQ4CfBcR7EFYIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1DA606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:03:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA1DA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c2e8c710847so363486466b.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:03:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793023402; x=1793628202;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DMhcNiE7UFYB2cSErcXu0ACNivDw3qmsy4U7nmgAHio=;
        b=Gfm6KNxwDKbQ5/4TljUdRh9avfw9DRQCLmREQLw/i/EzJms6VRciU2o9eEnc+xuuEq
         6pTMJOptycj8HaK0u6ek9/L25BZ+x2nq4wUJhMJutteVDHD3HFYoT8wPUqOYVqz0GHKw
         65gvfsxjecWTpXAlKPSBqBEwaT8GFYgEaG4iwhB+IOGYQXvrjP5KsOOm2Dxzxx39SdJa
         7v91GChZTJITa3LRTjaUDRc8bNWvmUknaddtSELZI+rKCUvVwcq1apZESICrCBNOw3XL
         pVXwjcgajnKq9A4a7Xq+FWaMvpKEVZCa4XjwmicDfOpY8xv25dEcmatylG+G4xtqf8gH
         G/cg==
X-Forwarded-Encrypted: i=1; AKwUvBzumo7QzIv4QzEiUDqdQvKQy81LTiih1v/bgWR7kXVDpTrx2EVgqpxhuQx06WZxopHOR6zDixpZ0sD5Gu4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9Cejxr5vhc0YufTsN0/fitJTWTScr7Soei4IqbDtkTGvxyw1q
	V5Gowe766K8K+SZMGs28q/PQZvh9gIWtL2dBQXWBXk+MUZH09NECdGgEE9TSUSfnYkw=
X-Gm-Gg: AYBFou3IhUBZLlqeojh7mlGfzvM/VRB2P8tCnXlcVC0OUI7TdEXMn9X9diosJkjldxh
	8fjzTJsCfE1W+DGFrCGRCYQnf+8Rus6k9ZN12h7Q/421qaXa2ljjZvndu2ldkTw2VpOy5OGShFR
	PpZQuH/C3GHF4XOd6dNGoXRQE4PoBpLBd/Zd8eqwPT+zhwIJVbR5u/QBScf1niGmnipzjTN72wu
	iTIBOwEHzYfCJBiYZ2yq1eNuBVdCJ7SltLKEnPN6bKCfQgoB+r5o6Ud9g4tTPnWAGJ1W4QeGD0T
	WDEDDvHEHT6W6QsxsKxZNws4n0rxR0PbDUc6YdQRotdda2BT/jv10qGb5vWULe0yu5QLS81I6/g
	Z0iugA4pOmfvFBJZvqd+xAWV4dZgtBvC+2GGGw/ZqtNlJrwlxJ7Kr9MDljIoyeJYym0uR7tevZN
	cov78PXF+V/Bd41g0KsEtldOZBHPf54jcvDtfQ/1G/dhkK6kMNnETRpkq/qxdjn0LiKUE1HvGBb
	Up13GUhf7hC4i3DJQbXE9tbSmqAVRmhySQGBO7MdUiwF23pxINsvlyrCJB4Dzqb5befOdCUhGJy
	iNsPcqPxZDPX8ya74pQ6ksBZu082QM7rTmGyFSM=
X-Received: by 2002:a17:907:9446:b0:c2d:d408:5d9c with SMTP id a640c23a62f3a-c46bdedb453mr675524266b.48.1793023367417;
        Mon, 26 Oct 2026 07:02:47 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd524266sm335398366b.38.2026.10.26.07.02.42
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 07:02:45 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4697404c2bso386578566b.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:02:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBydKE44gs63jjMECqx6gFLeOx5InldYUPDKZbQM4sQT1ZS34pT36kJxGlE4Uq6k9+jihtb6rQzHMSkQyc4=@vger.kernel.org
X-Received: by 2002:a17:907:6ea5:b0:c40:5ee3:8698 with SMTP id
 a640c23a62f3a-c46bde6b2f6mr794454566b.31.1793023362379; Mon, 26 Oct 2026
 07:02:42 -0700 (PDT)
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
 <20261021163242.GB325924@killaraus.ideasonboard.com> <73d01869-b536-4fcd-a139-6f9d0a043347@kernel.org>
 <20261026104056.GH15441@killaraus.ideasonboard.com>
In-Reply-To: <20261026104056.GH15441@killaraus.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Oct 2026 15:02:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV7Mz0WgaNP_B8FG6OxLBqqnWwMqWJKNFBDkF2i=55fVQ@mail.gmail.com>
X-Gm-Features: AclHuK_QORKnSpnPhJrLo9VkZNodz3Epw-au-jT1DhXUiuoeiO-TMI6o_74xEFM
Message-ID: <CAMuHMdV7Mz0WgaNP_B8FG6OxLBqqnWwMqWJKNFBDkF2i=55fVQ@mail.gmail.com>
Subject: Re: [PATCH] docs: submitting-patches: Require base tree information
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Eric Biggers <ebiggers@kernel.org>, linux-doc@vger.kernel.org, 
	workflows@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-kernel@vger.kernel.org, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

Hi Laurent,

On Mon, 26 Oct 2026 at 11:48, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Thu, Oct 22, 2026 at 08:57:55AM +0200, Krzysztof Kozlowski wrote:
> > On 21/10/2026 18:32, Laurent Pinchart wrote:
> > > On Wed, Oct 21, 2026 at 01:55:37PM +0200, Krzysztof Kozlowski wrote:
> > >>
> > >>> there's no base-commit?  Including any historical patch (from
> > >>> months/years ago), patches with dependencies, etc.
> > >>
> > >> Dependency is something else, but for every other patch:
> > >> 1. For testing/CI: you apply on top of next
> > >> 2. Every other case the maintainer knows where to apply it, because it
> > >> is his HEAD of next-branch.
> > >>
> > >> I am repeating myself, but I really had no single problem of lack of
> > >> knowledge where to apply a patch as a maintainer or reviewer of some
> > >> subsystem, thus maybe I do not understand the actual problem you are
> > >> experiencing.
> > >
> > > When I review patches, I often need to apply them to a tree, mainly to
> > > see the context, but sometimes also to test them. I have encountered
> > > many cases where the patch wouldn't apply on the current for-next branch
> > > of the relevant subsystem. That's often because the patch had
> > > dependencies. When I'm lucky they are listed manually in the cover
> > > letter with a link to a branch, but that's far from being the common
> > > case. I then have to ask the submitter to provide a branch, or enough
> > > information to recreate a branch. Having base information (base-commit,
> > > prerequisite-patch-id, and possibly base-tree) would save me quite some
> > > time.
> > >
> > > I understand your concern about maintainers cherry-picking and sometimes
> > > introducing issues as a result. In that case I also prefer asking the
> > > submitter to rebase, retest, and resubmit. That's not what I want to use
> > > base information for, in my case it helps with the review process.
> >
> > That's valid and for 95% (guessing the number...) of cases will be
> > solved by having linux-next as a base, thus requiring the base
> > information is redundant. It's just linux-next.
> >
> > When patchset does NOT apply on linux-next or maintainer tree is
> > non-obvious, the base should be provided, but that is only "if ->
> > should". I think the proposal here is a bit different.
>
> What's the downside though ? As git can easily provide the base
> information once configured to do so, what's the downside of asking
> contributors to include it ?

My base is usually not in your or anyone else's tree...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
