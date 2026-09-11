Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493243F8251
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789116656; cv=pass; b=WlCn7m2N/AKJ/GA0AvS5/9k8KA6a39bB1KGt6SPsBbXLFYAhI4QjBOJkFquUutmuxUIi8zPCqC7korCrDjgwuyrysYoNZmir+D3nk/e7JUqa+JdLWLRISdaEn/qRBzwLDeoFdVn71bskGp9TgwxQeRNs/lP/Tq5DTCnPOy9sKFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789116656; c=relaxed/simple;
	bh=5Co0mc8pqJAcw7pBhUadOF2tFVCeKbvaCt6CgmDXcj4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kdoneoKVCwJPTi0zGJ3cn8ZayO/k1nqj8oCMpgfbQGXpr5prChi53R7bVfzpLdnhuSiwv+BJy9B/WpOy/8lcKgTna2mczI+js0mtnVb40kW8mthYScM2QlHgRqI0oUthHUdTQFrMSpw+An7TtahxyYM72MwVb2UEZgxh50PxUCs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oR0GoeBI; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oR0GoeBI"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b74e58ba8cso94472e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 01:50:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789116652; cv=none;
        d=google.com; s=arc-20260327;
        b=NLpvVwKY993PCkEEq79QXONqhfwrjpN/EEu6Ue7rvFHulgZIRXgxCfNLRyIG/fN4Nw
         ewCtKRm0OFebsd0kdtCDcIGzwLhZAqEYikOdviMkc69deMed+XkUfOPJPUDJTw/6NFd6
         OeZV75Ove66cPFv2pSNk5rx4WXGtHMSEU1OnR5F2Rs4lQE8X6YOzwMgTRjJGO2a939Xc
         p9g3ifcVyTup8U0WVbS0M38bAcGij907z6ujwtlmgomAJFu31QWFppTwRKK/sJdq+3Iv
         ng9yOsunChmJ2g6bH1l78Y6T1j3bfJu2wLcioF4or6H+drOsqHipSBKpD9+SwCKGp2WY
         /lDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YEKCzgm8D5thJIL5vXau62YnV8Oh/fBHGK8+Drqv/OY=;
        fh=GA/Z+TUy+gDmWSTvIWyEH0vB+2w9cNYXzA7nffx/imE=;
        b=dXYeqtF5d09AmNWOX7+sEKBRCFpIIDORgTrIi6ylqvk7J+SW/8AT8ChsSMUpW2nreg
         09xz2jb9fVSzWXVZKgGt/THtnc1KSBl0aCpjSlWGkehEon6QUsmf6GrkugSNF9Yzb2q0
         5lyXOO7HLpDNtpbQfU1daobjIiqdiuVBCQgm0666qDSWEb7tLpMN8gEh/zNX06YXDbbn
         6Cu4hoE9AeBUqpYNaXjXd03C/Xu+fCLgDwUrctnxH4oFT7dK+v41EivZBh0E1sWxS8ZN
         P38hFx9rLM0yd17dN/AZ8MbotRs2cBX6XOiNk/doJtGOy9CGAebEUBy5jUgs+0eNW0nB
         tASA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789116652; x=1789721452; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YEKCzgm8D5thJIL5vXau62YnV8Oh/fBHGK8+Drqv/OY=;
        b=oR0GoeBILBiusB9vNTYiihi8YSp6hlheuaai2T5x1HV4VjrHkLvvHvuUD9M9dw//Zf
         JGzAtWvGQXDjqmFrDmQ5vbgNueYjqApC62nGQOhydOEfm8/gJYxp+FsvJp4fhV09mkT4
         oljgkm27WVJbqccJs/GThoQ38i/QJcVgp6Z7b9BVVrqnMtZHp7gFRZ7NTn2aLsPliqkT
         hUnwCoEas+RWt5Q9SMLjKCSEfzeONWXjQ5CJeP6kefk2IKzo6DregWpP5lnUqbZYxX5D
         AGiyokQiNIcfJ06C/JJ9AFAKYr7WK1EE9WScFFEiqVTm4rXtRW4upaKBuh0dm0g0y1c1
         6uFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789116652; x=1789721452;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YEKCzgm8D5thJIL5vXau62YnV8Oh/fBHGK8+Drqv/OY=;
        b=F4+jLGkfkfDOUaMbNokhQ/nD22Nkwh04hznMxAU6K4k89veLOIm9ZBRrp1ty8nC5hw
         4xvfUCsNbo29PYRvqbc1WjnBVEKadN98cIJ6VEd6zZdO2yQHILuV7T0EX/Qp1c4+rqRV
         X8iJhMiuIHxcXEUnMosQ6D3cRDn204fEPlJ1dVUIcSW2NyMiOuDyOSfXt7Qaj86S2Rpz
         F9hLcBublZzqyAZGhxHJ4T2PV7Z0KLni9bnS9KteJ2Q+1weweFcmuoO/WlI8sqCLeoJK
         CNU4r8cXOmwcLC4WpKQsrsgO07Z9lyt4b7Q/WbzZW+LFGTA2qD9uxww1pMSBWG8nX2Go
         Lixg==
X-Forwarded-Encrypted: i=1; AKwUvByIpmkhA+M2jCoXAv9qaoigqX8XxZtBCSMWaF61/9VETbKQJPfwNwvX8GSuvSZI9SHrVb71IzTl7NUYENg=@vger.kernel.org
X-Gm-Message-State: AFuF++kYqBEpHG9ugkkENCvI1idxA8pGjdHP7SExEAQA00XEXOr+00P5
	2UsSpkhF8ArbqHQYivz62aY889fPHFJ4XqjMmaANEbeETg094I6W3Dv8qLdRXlMjtYsoX4o7cLW
	dvnBpotZgym1aL39EckEWMLCeIq9HQns=
X-Gm-Gg: AYBFou0zbdg/DdLAiTuSbCzOv4+IO4C6aXv91RDsB+U4iUh8OpQkCm2OnaYW1b6xu5a
	1KaVtiV2HJH87tIjv+QOV+xs5Toyb3jEpLiUebR1QpSwjC2Q1nVwe/qfGlEGflmr0rN84ywHZJe
	xgYnVmypU1oFUyvrAz0Tu1oVaoMpHCC4lGlWnKCtbaF+mPV/Bzu/yMXp7gHG7E8S6/x/V0gr7CM
	5+3+hHekuVP1HgfHKQrCPXrCuE/hCEAckcjxlOnG4j5I03GhnVjqrfdwbnaGdu+m0mtusLsVosg
	ta4Rua9Ow1wwYlAoeq/rABHmW7/+y11Czx7a6/LS/M4nRqEiE2coCaZ0FjwKWW0v6fZIuMLpg3q
	x76ukJ/kgR7VM1fegxSRYJLVwO99B6mwHPRFJsA==
X-Received: by 2002:a05:651c:552:b0:3a1:89cb:22ee with SMTP id
 38308e7fff4ca-3a5a4c36f4amr3528721fa.0.1789116651880; Fri, 11 Sep 2026
 01:50:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817-apply-patches-tw-v1-0-c182c1c425ba@wyuan.org>
 <20260817-apply-patches-tw-v1-1-c182c1c425ba@wyuan.org> <CAKspUh+bMqOYuV=uTRr35wt-xWd97YR=dfDQGoAvF5MjujOZEg@mail.gmail.com>
 <aqKgJh6MfOTS0KtQ@wyuan.org>
In-Reply-To: <aqKgJh6MfOTS0KtQ@wyuan.org>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Fri, 11 Sep 2026 16:50:39 +0800
X-Gm-Features: AcwNN1Vkxcbq7lUgv-VJzlAv8KCmsqo3_Sq2rhSFwAIXadU0HmlcpXd3LRQ2dNE
Message-ID: <CAKspUhK+60mzSnh+_u_+8_P99LG7LkDp1xp1_feSgd0_ax5s1w@mail.gmail.com>
Subject: Re: [PATCH 1/2] docs/zh_TW: add process/applying-patches Traditional
 Chinese translation
To: Weijie Yuan <wy@wyuan.org>
Cc: Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 08:18:46PM +0800, Weijie Yuan wrote:
> > 5. Missing .. _tw_applying_patches: label
>
> This kind of top-level label is not recommended/allowed right now ;-)

You are right, and I checked: doc-guide/sphinx.rst says cross-references
between documents need no special syntax, just the path. Withdrawn --
sorry for sending you the wrong way.

Reading that section also makes my point 6 land differently. The same
text says:

  For most use cases, the former is preferred, as it is cleaner and more
  suited for people reading the source files.  If you come across a
  :doc: usage that isn't adding any value, please feel free to convert
  it to just the document path.

So the two files in 2/2 should converge on README.rst's bare-path form
rather than howto.rst's :doc:, which is the opposite of what I suggested.

> It's kind of weird that this series cannot be applied cleanly with
> Linus' current master tip commit 50d05c7c76c9
>
> Did I did something stupid? Confused..

Nothing stupid -- I hit the same thing trying to apply your series for
review. Your base includes my process/ series, which Alex picked up on
18 August but which has not reached Linus yet, so process/index.rst
differs between the two trees. It applies on Alex's docs-next.

> However, since adding new translations is not our current main goal, I
> will put this series on the to-do list for now.

Makes sense -- it will apply cleanly once Alex's pull request lands, so
there is little to do until then.

> > Would you send that glossary change yourself once v3 lands?
>
> I'd like to do that. If you have time, you can do it in person as well.
> ;-)

If possible, please make the changes while you're at it; I need to
prepare the subsequent patch series.

Thanks,
Chen-Yu

Weijie Yuan <wy@wyuan.org> =E6=96=BC 2026=E5=B9=B49=E6=9C=8810=E6=97=A5=E9=
=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=888:18=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Fri, Aug 21, 2026 at 11:54:02PM +0800, =E8=91=89=E5=AE=B8=E4=BD=91 wro=
te:
> > Thanks for taking this on -- and for picking a document that actually
> > matters rather than an easy one. A few things below; the first three
> > produce real breakage, the rest are suggestions.
> >
> > ## Must fix
> >
> > 1. Section levels are flattened (applying-patches.rst:12)
> >
> > The English original uses ++++ for the document title (level 1) and
> > =3D=3D=3D=3D for each section (level 2). The translation uses =3D=3D=3D=
=3D for both, so
> > the file ends up with eleven parallel h1 headings and no document title=
.
> > zh_TW/process/code-of-conduct.rst:12 keeps the ++++ form; the same here
> > would fix it.
> >
> > 2. The bold marker at :233 will not render
> >
> >     **=E4=B8=8D=E8=83=BD**=E5=A5=97=E7=94=A8
> >
> > docutils requires the closing strong marker to be followed by
> > whitespace or punctuation; a CJK character does not count. As written
> > this emits "Inline strong start-string without end-string" and prints
> > the asterisks literally. The existing practice in the tree is to escape
> > with a backslash -- see zh_CN/doc-guide/parse-headers.rst.
> >
> > I checked the other **...**, ``...`` and *...* in the file; this is the
> > only instance that trips the rule (=EF=BC=88**fuzz**=EF=BC=89 and [**y*=
*]es are both
> > fine).
> >
> > 3. index.rst: wrong section, and the TODO entry is still there
> >
> > The entry was added to =E3=80=8C=E5=85=B6=E4=BB=96=E6=9D=90=E6=96=99=E3=
=80=8D at :123, but the English original
> > lists applying-patches under tools and technical guides
> > (Documentation/process/index.rst:46, after email-clients). More
> > importantly, the =E3=80=8C* applying-patches=E3=80=8D TODOList item at =
:55 is still
> > present, so the document is listed as both translated and not
> > translated.
> >
> > Moving it into the toctree at :46-49 after email-clients and dropping
> > :55 fixes both.
> >
> > 4. Please drop the :=E8=AD=AF=E8=80=85: block
> >
> >     +:=E8=AD=AF=E8=80=85:
> >     +
> >     + Weijie Yuan <wy@wyuan.org>
> >
> > We are in the middle of removing exactly these blocks from the zh_TW
> > tree [1] -- adding a new one now would just mean removing it again.
> >
> > [1] https://lore.kernel.org/linux-doc/20260819145808.291567-1-chenyou91=
0331@gmail.com/
>
> Sure!
>
> Points above copied. My negligence. Will check again.
>
> > ## Suggestions
> >
> > 5. Missing .. _tw_applying_patches: label
> >
> > Every other .rst under zh_TW/process/ carries a .. _tw_*: label, and
> > the English original has .. _applying_patches:. Adding it would let
> > 2/2 use :ref: in howto.rst, matching the eight neighbouring entries in
> > that list instead of standing out as a :doc:.
>
> This kind of top-level label is not recommended/allowed right now ;-)
>
> >
> > 6. Comment alignment at :340
> >
> > One tab puts the comment at column 40; the surrounding lines are at 48,
> > and the English original uses two tabs.
>
> Got it.
>
> > ## Terminology
> >
> > The significant decision here is patch -> =E4=BF=AE=E8=A3=9C=E7=A8=8B=
=E5=BC=8F, used 98 times. I
> > think the direction is right -- =E4=BF=AE=E8=A3=9C=E7=A8=8B=E5=BC=8F is=
 the standard Taiwanese
> > rendering -- but it needs to be handled explicitly, because the
> > existing zh_TW tree has 630 instances of =E8=A3=9C=E4=B8=81, including =
in the two
> > files 2/2 touches. Right now the two terms would sit on either side of
> > the same cross-reference.
> >
> > Could you:
> >
> >   - add patch -> =E4=BF=AE=E8=A3=9C=E7=A8=8B=E5=BC=8F / =E8=A1=A5=E4=B8=
=81 to glossary.rst, and
> >   - say in the commit message that this is a deliberate localisation
>
> Yes, makes sense. I'll do both.
>
> > Migrating the existing 630 instances is a separate question and I do
> > not think it should ride along with this series; I would rather discuss
> > it on its own once this lands.
> >
> > A few smaller ones, measured against what the tree already uses:
> >
> >   :192  =E6=8C=87=E4=BB=A4=E7=A8=BF      -> =E8=85=B3=E6=9C=AC      (17=
 files use =E8=85=B3=E6=9C=AC; =E6=8C=87=E4=BB=A4=E7=A8=BF is not
> >                                   used in Taiwan)
>
> Hem, I don't know and use =E6=8C=87=E4=BB=A4=E7=A8=BF either. So will che=
ck later.
>
> >   :165  =E9=83=B5=E4=BB=B6=E7=94=A8=E6=88=B6=E7=AB=AF  -> =E9=83=B5=E4=
=BB=B6=E5=AE=A2=E6=88=B6=E7=AB=AF (8 files, including email-clients.rst)
> >   :228  =E5=9B=9E=E6=AD=B8        -> =E8=BF=B4=E6=AD=B8      (regressio=
n; 10 files use =E8=BF=B4=E6=AD=B8, 4 use
> >   :259                            =E5=9B=9E=E6=AD=B8 -- =E8=BF=B4=E6=AD=
=B8=E6=B8=AC=E8=A9=A6 is the usual form)
>
> Copied.
>
> >   :365
> >
> > On the other side: =E4=B8=AD=E7=B9=BC=E8=B3=87=E6=96=99, =E6=97=97=E6=
=A8=99, =E6=A8=A1=E7=B3=8A=E6=AF=94=E5=B0=8D, =E7=99=BC=E8=A1=8C=E5=80=99=
=E9=81=B8=E7=89=88, =E7=95=B6=E6=A9=9F,
> > =E6=AD=A3=E8=A6=8F=E8=A1=A8=E7=A4=BA=E5=BC=8F are all good Taiwanese re=
nderings. Would you mind adding
> > those to the glossary too while you are there? It would save the next
> > translation from having to guess.
>
> Yes!
>
> > ## On the CJK/ASCII spacing
> >
> > This file puts a space between CJK and Latin throughout, which is the
> > opposite of what the v3 glossary currently says. That is on me: I wrote
> > that entry before you raised the question, and we never actually
> > settled it.
> >
> > Since we both prefer spaces, changing the glossary is the right fix
> > rather than asking you to strip 218 of them. Please leave this file as
> > it is.
> >
> > Would you send that glossary change yourself once v3 lands? You are the
>
>
> > one who spotted the problem, and you are a maintainer here, so it seems
> > more natural coming from you than from me correcting my own entry. What
> > I had in mind:
> >
> >   - new translations: a space between CJK and Latin/digits
> >   - existing files: left alone, no tree-wide normalisation
>
> I'd like to do that. If you have time, you can do it in person as well.
> ;-)
>
> > The second half matters -- normalising the 2581 existing instances
> > would be exactly the kind of churn Jon objected to in the MAINTAINERS
> > thread.
>
> Yes.
>
>
> It's kind of weird that this series cannot be applied cleanly with
> Linus' current master tip commit 50d05c7c76c9 (Merge tag
> 'landlock-7.3-rc3' of
> git://git.kernel.org/pub/scm/linux/kernel/git/mic/linux)
>
> Did I did something stupid? Confused.. But I'll figure it out.
>
> However, since adding new translations is not our current main goal, I
> will put this series on the to-do list for now.
>
> Thanks for your careful review!
