Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740943C584B
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 23:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792194883; cv=pass; b=u1TrrpPlK5REIBFv68x8aeXPvFzf+WK76zp2StMJU6g38PX7Z0vZLCIv0UUwPFbARFvRQLwABKhPe6Dj/F1MlMck+IC7JUTH+KFVvFvE6FZTqtJIC2nlgxLtu3Z+jD1CqxbNMU6AhLIrSOMKybyjV87gK6rzDrsL9PfoXW73tU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792194883; c=relaxed/simple;
	bh=Xu70sCv6gBchM8XqIWDLSGQJVvPN3Uu3ZYyJG0fpoHo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vBqdpHNVTHot8kI3SAF69L1/UFasrFAvsRdasIGbFMgNR72zcIgIATPmivmLQmCp+gPB9KpvZLAcjEqOv4nw76UP8/kCECmuPAQ073JolWypi7omcaFN5Wm1ueffedU1Ux9TAyvfDRdjiosxQp3LYtIvHWUbPGYlqWdth/AYcYw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JWhiWKXw; arc=pass smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JWhiWKXw"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3a980c1153bso2464771fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:54:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792194880; cv=none;
        d=google.com; s=arc-20260327;
        b=RuKTDht9cFPCr7tNSgnmIzmp8vC00oza+iZ5mYD5lY8DEK4pEAxgbeOz0iJ8OJ+tSD
         G2FyUhZvDLGkhcxgXJn2EsgPrLeCiLGXdIA4OqTyi4Mb52tjv03cMCu6VO6iBVwClgU2
         AAGEIVA46FaDYa3SG3OnfnsHXAXX4COWnVtBo/PihR9VgRMBtUQ+89n39IZpnOxGcIYN
         xJyGYnxlATXMTFXigRpbMSSf7dpof7bbWv1MXsu3jG1mvhqDNidY3cXt09B6UR+Meyj4
         y1UDAJDfmKZpLPxnu7/ei7EcO9Y9VFxbZuJyzWwHi8BvlSes27Fmzj8DWfht2ybO3HkI
         os2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hPUuJtr2Z7cXgheskjaddEaTgz9tX41V1DHpHN9aHT0=;
        fh=PmY20a7ItN0sEBxbvanI272F92PHR+2nxtIguGcizrg=;
        b=mzt9UkhPQfThJZ4lkNJkafrMDnUHXk3KjZbAYerPGSD3pmuK/v74fOaHDmilPzzZ/2
         Ud/HkHnmKNVzzWMrP/yzMmp6IgNfABVfrKw4UshKWWe7pywGVwDJtPQkIQGT2mRqapzB
         SZKQVLjlcNQTK+FrCAbCxEYms3pJKlwx9rkXufG3+k2VHe/l2DSHa1Sii67hXFxN92Eg
         bqNvPoPvBP3QAqN8ZVslnzTdU4xZifNpB4d3ic+NI2Syzwo7pLAhM8fp8ZqiIWsMkNED
         FnT2j8LRbqrjJj7wLiV5q+kZfUmRUnN+zVQg4MPCZwgddMSz4yFnFXkq3S7m/wdkrUwL
         CGIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792194880; x=1792799680; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hPUuJtr2Z7cXgheskjaddEaTgz9tX41V1DHpHN9aHT0=;
        b=JWhiWKXwvq1E2jNbMBDl/rLpYYXleh6ovNmddqYaPDKpiGcm7RR8XC5VCMkPSiTqH4
         4Lrro/f/ArobvNZJOfiRS8sfH8dKHgmjugdph4Dtg1Z9zz0VTvxPgyRQT5wzHTEsfzdx
         5GMQORLxJw94S2ZuAj+9IXQSBvLKO3w7VuiCcL4CYFeHEGO56gr/GYRVngriTEo5EACK
         9J9iZiglBo5KflyIJcqiyC64XZc0fU7jelhfiG0SsTvV43EXXWBztos4KBfltY0GU6Ik
         tcZowYIzspmMOUcw/WXdZsTBPjFJGocX0wm8C77t0jI31Tr8oXdKpnS1aCGVxp+4lq+U
         qxsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792194880; x=1792799680;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hPUuJtr2Z7cXgheskjaddEaTgz9tX41V1DHpHN9aHT0=;
        b=afuvSmc2nZMAOY+PIJmZ2Yejev96g73wuRbV6nfL6U+muzk0gjfxchMgHWcgA+RScs
         vj+XNO+Kaxs8l87u0iXa+v3mVk8iAxMNa4k82U/s8zgeTyPVVvsqmpaV4cxVzPqpdrJQ
         jHxRrWNasa1qSNiTUufWPqJal6YqCPZ/1RacyndNX6tqLqsDZ3ss7KJ75c6+7l/RdDLL
         Cnbc7AkTXeuh93pV2WVqMob5CWaLOVQbcfsJuyfr8+Ddp8OgtR5ZpsTqkbFHi7FQjGYi
         b62uj+eFAwXvc7uELwIskXHdLZu99cM5e9S7yd2zyLDtuAV3rE1gg1GiIetQKMMup7pj
         jEaQ==
X-Forwarded-Encrypted: i=1; AKwUvBzOF1GVhludvMAYGFb1kEPZn6RnrofNFE1heWNUyRw7AGXNLwY6NXKPIimpMCLO57gfbsEP6ZxxQUsjE74=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmgZ8OiXhZRTteylFwGSNYqQbVaiV8it9DXg9fXGGHDN0MtUY0
	52wA9kcB1bRfbraeQrudGA9KkGSkZE3bEK0syHpexAGMsdgBvWVP2sAOHvKo/WBNJPaeyaSI+xU
	2GpxB9/FWCfa7o6VG2NJZp5DB8lg12Sw=
X-Gm-Gg: AYBFou3xbrAxONI2ko7BxiwJq5odtCHt83pPB8wqADs6MR0TwfXc9Kf1N6RsPGFDStl
	AH3qgOT0V/PhuIW1VDDn7h24KtEOMVv1MBJlAZdcWT2OCrBhWnAaseBMY/c4d6If4USRHGLP/Ii
	CTfg2Sc4clin/FuElPcLK1b7SQd6hhx9ZKuuuC41vvxQwqDBtcQKm+INWmtQ85JdMWlBggaloYJ
	5UKOT4cBOgNaNtZZW+JvSF4KjwXCBUy+/YeWZqznF+f3Dl9afP9s+dXQnzLc0mrviHD3IA1W/T3
	AqvyhC9BA1TFcw3U7rgladSzjYa8lFxlHGlSdjDWRQQHXK07BpvjMeglwmmTaulJTQLhc2S1V72
	0FemBZ4xFcMy0zgKpy+FGaoJm2nu9RGz2G7WtVQ==
X-Received: by 2002:a05:651c:b11:b0:3a6:622a:2cad with SMTP id
 38308e7fff4ca-3ab2928a0f6mr2581751fa.10.1792194880130; Fri, 16 Oct 2026
 16:54:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001165018.415526-1-mattst88@gmail.com> <alpine.DEB.2.21.2610162207360.22065@angie.orcam.me.uk>
 <CAEdQ38FOXiV+Sz8fdPswRN=m2dKkYzgF2-9OWx3WskdsmWUGtQ@mail.gmail.com> <alpine.DEB.2.21.2610162254380.22065@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2610162254380.22065@angie.orcam.me.uk>
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 16 Oct 2026 19:54:27 -0400
X-Gm-Features: AclHuK-x7TuHH0mEi9Pj4V7Hm4nU0EXmWkGGruSlpHEUPPLEzlbY4sMq3pYo3WA
Message-ID: <CAEdQ38FRnjHSSAWxFJqUBUL2zMRg5_GDcJJC3fx8i=K8ZWWK3Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] alpha: replace dead links in Kconfig help text
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-alpha@vger.kernel.org, Magnus Lindholm <linmag7@gmail.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 6:36=E2=80=AFPM Maciej W. Rozycki <macro@orcam.me.u=
k> wrote:
>
> On Fri, 16 Oct 2026, Matt Turner wrote:
>
> > >  Of course nested links may or may not work, but at least references =
to
> > > some information are retained.  Or has it all been already extracted =
and
> > > written down in the wiki?
> >
> > Did you compare any of the wiki pages and the old links?
>
>  I read through the old pages and found them reasonable.  No, I didn't
> reach for the wiki, perhaps I should have.
>
> > I looked at all of these links via archive.org before sending the
> > patches and didn't see any useful information. The LX164 link just
> > contained the board specs and a link to the Technical Reference
> > Manual. The Rawhide link is an install guide for Red Hat 6.0. Similar
> > situation with the Ruffian page.
> >
> > If you see any information that's missing from the wiki that I spent a
> > huge amount of time creating, point it out and I'll add it. At this
> > point, I see no reason to keep links to 1999-era articles.
>
>  Fair enough, I take your word, this was just a question.  I guess it
> wouldn't hurt having your effort mentioned in the commit description;
> indeed I think it would help saying that the wiki has made all the old
> references obsolete.

Sorry, re-reading my message, it feels unnecessarily aggressive. Not my int=
ent.

>  And I get nervous whenever pointers to old information get removed, as i=
t
> makes it gradually more and more difficult to chase.  As recently as the
> day before yesterday I have pointed someone to an archive.org copy of a
> specification they were after and could not find for an old piece of MIPS
> hardware, that no contemporary search engine would list and I could only
> locate because 20+ years ago I recorded the full URL as I downloaded it.

Yeah, I feel that. I did everything I could to preserve history and
sources for the wiki content. I spent months waiting on GitHub support
to transfer the "alphalinux" organization that the late Peter Petrakis
set up a decade ago

https://github.com/alphalinux/

It now hosts various repositories, including the wiki content:

https://github.com/alphalinux/alphalinux.org-wiki-content

and all of the Alpha-related mailing list archives I could find:

https://github.com/alphalinux/mailing-list-archives

My intention is that even if I (and alphalinux.org) disappear, the
wiki content won't.
