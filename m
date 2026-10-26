Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793029062;
	b=vK1iYDtpmJmJUWFM+M6Y3bDuTgA8Z3QA2sFMXPjvrFPGPxYD4JoNpj1sj9Vir7CWV2An
	 IYWLz+87mS1Nh/y9ztE/mfFivNazv8NHtaa4RXs9kEDPXI7mUtRIuCnSuAjIfZPAFHuWs
	 QM+mLVrQwyiwg3bbl10qmgbRVFv8y/g/msZ1XE3prPD3K1/xFK7PETBndnZSS7FbRMwOG
	 8a2MiUFhlHgouj2FTZZMg31Zlm26DwmV7lrubWPz+eds9Tstip3B6Y2talTkeQh/513/U
	 7lcZ8hh/uRU1oDUmbqnuByYbnJhF43YLPAvRQg63+nJwkHngotsmNx6qaa78x3Eeapw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793029062;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=/PEvxgbJJKZEuYVwcskTn7V7+CdtxzeB5F8EsgIEQd8=;
	b=BtqGrtKwJ1G3k3gAm4ite7uJWxyppiEsDR2EhCsjAagBgMzwizaMFP882ToEy8lxnIkZ
	 UUV7lE0bYvEMC2BFYso+Zh7V88K6vPHFoaLj7EkUejzzL5GIbVcde3DPA6zrw93JbS+RE
	 dLcRS3QhPRzsQfzU4TiQHA0FX+qYg2y1i/OnPYDr+k8Rm0iFS+L34skh4ZZ3B/tMxTzbY
	 suS6yub4C0PfB5+4M0Fp+1lzhzn1M6ymNCSD7NxUmS1Ayb/V3rMRTErReQDkQyk6tv3RO
	 0pJKT+fuvT+EDgIfDj0C2W0D1QhsZSOOtPl5OKA1N+gQPcP4XFWdAa74WvrF1JprvNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.177
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FD5606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:37:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9FD5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5eafaeb8684so1092479e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:37:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793029061; x=1793633861;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/PEvxgbJJKZEuYVwcskTn7V7+CdtxzeB5F8EsgIEQd8=;
        b=dvv1sj1pavIF3VCpRj9N8ewPi+TlOEQUiM5rNB2ENW8raptWmdmOQP0JSObptcR4oL
         PtfHti9zGwS9w+8GHWqSRLZrKH5/uyfXcGPgvqpNMNUo1Fv38/Y1uBqrnxR66sVkqqqt
         47sGdILkEbsVaq91iNxAj+fcE0Qqvl5erYxjKID7mK+hE/3hCOvJU5QRLMSH9qFxM/Tj
         V2oKDlWJTJEubE0nVRzaQXzW+BfnnWdwqn1k008LKNywuNKC1DksqROqwG+mYIBrtf9J
         QpYnnS5HJL23mGEQO2RmHX61ejLVYUPGV9X7Ylig2HICto7bWf/XgmjwCUrhea+GXv9b
         clGg==
X-Forwarded-Encrypted: i=1; AKwUvBzWlJ2dP8RGOx3sFneHPD3wlLmQXZy04jbwyGXcR4N8XE7JMsoVsnp7AoYQ1OhDyv6wSrUAhrduqb/7Dp4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJC72P8cisC7jmTwR9KRONMiGgAnofKtT2x7FI7Wfo5p+03WWD+
	TvXA8J4wvt9+F1vnOuXTJYBPMxlLv8cKUT75ARUBfiyLB8BVqmamHQpDnoS4yiF19+I=
X-Gm-Gg: AYBFou0mfCLOKjk5JewbuNIkny8G07jKlPIcuG7WPw0bQa1WHvJowzmfJG1ek5g/XZz
	FaAaFsBRdMxhQxujlUeRy06FE6eAU9o4FiGR3EdWv8nBX/jXgoc8mAui0wcd4V7eMvtr+eyOpFG
	uqylbYmCldRGXLASm1xxcyYkx9p928K6uwYLspFBhbdbWlsxOIf1xBMlvxh75b3WPPctWPoVOoT
	cNpNjXIXMCoQiy+c6bRkWkuElY9RxrkoGxtNr5ibo2+wImb+I9pEZWPgUxgXlc12EkBAah0v2BY
	TZO5GTP/XIAhz8/xm/+j7Zi9qCo40xIuEkaIHOXc4L0AzIQHd6jSm0AaIr0CcZxhuuxiQXUfoDV
	SQLVbv8RlS+GAxCVw0o8LHA6iX3hGKnjtukmXw2WUijOf6RB+LJKFKdKATJuro26li+oEpW7yBV
	0GddeNQ6q77yCPYscxugfDAUXbsIhI1dnlTaBfRMGsKbYyXCQ6OICboMqWo+uikncFRM1TiOKFK
	GBQ1MHD/0epVuaMhu2FMq8Zp9LDpykZl4b/gFDgvJDBv05QU3IbZG+CB+O04tjmDhBz5mXNYCUy
	L+CSKvXwwafs/j88vg==
X-Received: by 2002:a05:6122:1d86:b0:5c9:a60b:e5d8 with SMTP id 71dfb90a1353d-5ec233214a6mr2901798e0c.18.1793029060766;
        Mon, 26 Oct 2026 08:37:40 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec23427e92sm8711293e0c.9.2026.10.26.08.37.40
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 08:37:40 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-77bf892b496so997895137.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:37:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBygYQEAaucykHWfEqD6fJ1JBVq1nDAJ8xuXpohbmW4pyycLwNRBMlh4v0/lazE0LAuKSrdNnDniPRaUxjI=@vger.kernel.org
X-Received: by 2002:a05:6102:f86:b0:7b4:bdf5:9307 with SMTP id
 ada2fe7eead31-7ce5ce24986mr1893457137.30.1793029060367; Mon, 26 Oct 2026
 08:37:40 -0700 (PDT)
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
 <20261026104056.GH15441@killaraus.ideasonboard.com> <CAMuHMdV7Mz0WgaNP_B8FG6OxLBqqnWwMqWJKNFBDkF2i=55fVQ@mail.gmail.com>
 <20261026145343.GC1001933@killaraus.ideasonboard.com>
In-Reply-To: <20261026145343.GC1001933@killaraus.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Oct 2026 16:37:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXdOAYifLgmeguqMwE4kkyJ8NDbA4niZkuEUMYBPxBBSw@mail.gmail.com>
X-Gm-Features: AclHuK9NkUp6rJz4jccHSR8LbKSfbJD7mhN8jXTqeuqbOAgqsCvTqyecvNO-blg
Message-ID: <CAMuHMdXdOAYifLgmeguqMwE4kkyJ8NDbA4niZkuEUMYBPxBBSw@mail.gmail.com>
Subject: Re: [PATCH] docs: submitting-patches: Require base tree information
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Eric Biggers <ebiggers@kernel.org>, linux-doc@vger.kernel.org, 
	workflows@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-kernel@vger.kernel.org, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

Hi Laurent,

On Mon, 26 Oct 2026 at 15:53, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Oct 26, 2026 at 03:02:27PM +0100, Geert Uytterhoeven wrote:
> > On Mon, 26 Oct 2026 at 11:48, Laurent Pinchart wrote:
> > > On Thu, Oct 22, 2026 at 08:57:55AM +0200, Krzysztof Kozlowski wrote:
> > > > On 21/10/2026 18:32, Laurent Pinchart wrote:
> > > > > On Wed, Oct 21, 2026 at 01:55:37PM +0200, Krzysztof Kozlowski wrote:
> > > > >>> there's no base-commit?  Including any historical patch (from
> > > > >>> months/years ago), patches with dependencies, etc.
> > > > >>
> > > > >> Dependency is something else, but for every other patch:
> > > > >> 1. For testing/CI: you apply on top of next
> > > > >> 2. Every other case the maintainer knows where to apply it, because it
> > > > >> is his HEAD of next-branch.
> > > > >>
> > > > >> I am repeating myself, but I really had no single problem of lack of
> > > > >> knowledge where to apply a patch as a maintainer or reviewer of some
> > > > >> subsystem, thus maybe I do not understand the actual problem you are
> > > > >> experiencing.
> > > > >
> > > > > When I review patches, I often need to apply them to a tree, mainly to
> > > > > see the context, but sometimes also to test them. I have encountered
> > > > > many cases where the patch wouldn't apply on the current for-next branch
> > > > > of the relevant subsystem. That's often because the patch had
> > > > > dependencies. When I'm lucky they are listed manually in the cover
> > > > > letter with a link to a branch, but that's far from being the common
> > > > > case. I then have to ask the submitter to provide a branch, or enough
> > > > > information to recreate a branch. Having base information (base-commit,
> > > > > prerequisite-patch-id, and possibly base-tree) would save me quite some
> > > > > time.
> > > > >
> > > > > I understand your concern about maintainers cherry-picking and sometimes
> > > > > introducing issues as a result. In that case I also prefer asking the
> > > > > submitter to rebase, retest, and resubmit. That's not what I want to use
> > > > > base information for, in my case it helps with the review process.
> > > >
> > > > That's valid and for 95% (guessing the number...) of cases will be
> > > > solved by having linux-next as a base, thus requiring the base
> > > > information is redundant. It's just linux-next.
> > > >
> > > > When patchset does NOT apply on linux-next or maintainer tree is
> > > > non-obvious, the base should be provided, but that is only "if ->
> > > > should". I think the proposal here is a bit different.
> > >
> > > What's the downside though ? As git can easily provide the base
> > > information once configured to do so, what's the downside of asking
> > > contributors to include it ?
> >
> > My base is usually not in your or anyone else's tree...
>
> Hence the prerequisite-patch-id and base tree information. Or do you
> mean your base is not public at all, neither in the form of a branch
> pushed to a public tree, nor as prerequisite patches sent to a public
> list ?

Correct.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
