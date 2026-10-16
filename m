Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114AA3D7D9B
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 21:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792187298; cv=pass; b=hey0LxH2oTG1g2X6WELLGj/4nhAbkRJTHzCtZntWX5GnOgjii4qmAv9ygbveiiMIoNpaEsvrGm3+UgRfYjKzLMbXkXaIfvCy2fBJ5IRQGYZdhMLRJHR0jU447u/ovjH7DkNeCcYqNvtqfJgYIi2Ex4EJjZyzCa4voLgYXlNq/GQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792187298; c=relaxed/simple;
	bh=m8W9Vq+2XXzLDer/FOrnl9DTY1QMXtRVvjhDwafLL1M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YhSkpNtN38YcV/3dGc8huqiVTNKGIqcYHqPN1uGXc/XUddGRaq48BbXvIDLkXnn2TX74FSryYUd8fUwoKzGSSve4fjX7SXf9gF2lkR+IV9fEl8UgSWvregl9PVMuh89Fgzb0rTtcgadllhX4KJLlNjHl7b8QS9tlz3yomo1W0uk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fCVeh42Y; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fCVeh42Y"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5be3cff0f6cso264300e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:48:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792187295; cv=none;
        d=google.com; s=arc-20260327;
        b=Q7Qv22RQKnb7GKdYq8+68FaoRQZvSKYsjBzgOheXC6E6XcYQUNTNykGQoJAHM3ZyxJ
         clVLqe2eEiOcoUQ59tw8MyqwqZ88f0yQS+L1XWbb0bScRDZUj1eVrw38TvgWtKEhNCTu
         wAcbY8lkXoELn/N+PF54fgOMmme837lfFcqu+3sComKdvBC68mJjkQbZa68FsJlkdCSJ
         EQPBNnbNBcSHG0WYPM66Wfg5LVUmdaxUcRFihKwWaR4BcXOmWFf2nUENwlrt/cuFEjme
         3WpxWfDBdnxtvLA2Db8zLC8mNb2Bv3Cm/dmRnH05J1AQ9mexEK8zNSz9GAWwLPAi58hU
         7phg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5rmc8vyGearlssxuKgScT3WPF1plUO0VVqnNUjZCh0k=;
        fh=9YDbDwcBNYTcLQAw3xYMzNmP8LL5jvJteZ5Yy/QvA/E=;
        b=nDpIkK2+SplMgb0aYgxdSDAQZeKUMS98AlfADF5kenGfo/w4ToM3DG8kC+itSY4Ve6
         W5PSfzP9hNP7XaLjkSxU+Fl+Ys+nHp/4nvF8dbO5dK0Wx7Zv4ZtOoG328IrVAcH1Qj+q
         laukBhjNI/XLzSx0KYZYo96BUvLxPicKnktblEE5VQ7vztMcaV7F3skwmvUy48tESWxE
         e2DnF7bD9hjBzje8m0VdXzRrFe9bP/W4z6f8zchMPBBLNJ0oZSBmom5pSFBilDm5wHvr
         FlKQ1rdLsnXozHRND2yeO1uH6n6N6uqoQNKrn3XCynabJwB3hxwmmoZ6hLcUi5hHizLu
         ieJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792187295; x=1792792095; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5rmc8vyGearlssxuKgScT3WPF1plUO0VVqnNUjZCh0k=;
        b=fCVeh42YlS8atdvjtXLrSSk+pRSrswWr4C7u7oVOEjEy5rdUpBkmm9+yDmRPI9gu2X
         WXR3lJ7W2ECJpaJxBYSOdHCK4aFY2mUz8ulozqSgdULVG2wpc7gq+FCZu+0abfxw+leV
         a3x+7b0AfIiaL8Eg4UqvLedKMdEMCTmfBSnKCfIV9mAg8Kto8qUDwao5TCxG3lqdg0vg
         KijDEb8Thi1VKh39TfvvkhaPk0Aq+oya34lqkiZDAFa2vyE5EmcedpqLW4eWPEUjg48Y
         E0biMr8X2E5rVEPv2wuwgv3Q7igKDsoCr8c6oUx+UJioX3xshOom4MOMOJgZO1rCbWYk
         0HQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792187295; x=1792792095;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5rmc8vyGearlssxuKgScT3WPF1plUO0VVqnNUjZCh0k=;
        b=gLFcwrooAONqOgD5/ZrPwWE871GucZAJUTEt6AJmOkvWULi0Gf3vTW4BShJHOx1RDT
         UEJV2kHOMErvfRJO0HIL8z5v254pHUV30bytAOlNG01FHjHpJWmM3SURS7e0hKyzkqGC
         wCFmSsNAICiTeHsD5i8C4Ncnhs/RzGoakHKsfaNIlah5ZBHb7Y/OTO0Ohy4RhARm8c2W
         4eDQrqSVAOH/ipTmrDi9uwPXaNTI0GoVkhu8sLBQznJsaQiLycVXMnrXy5lqwt0b/6sG
         Mkuz+UdeT9yKPGgAPPniDvWi5O0j/5rns6UG8FaZZXMxY0PFwrmt5gR5r82LiyWT4CKV
         YmMA==
X-Forwarded-Encrypted: i=1; AKwUvBzy0Bq8BnZghCltvWGRMVDboj5R1Z633YH7EXIgn30SafqMZpwcqYpITzf5Dcv9vYDHVXRl2x8MlBXImtk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIt7AmCZQuEg0J/+wmM8IMoPGNB2LvpzD52zCURvtQ4ohN/8R3p
	5rAG9u38M1h235tHEMgdIqhGR4kkvYqufb3b8FmXaX7amh1IwGmuDgOrK54PxMfxHbQyU1vzAG4
	I9m0V8BmEsbgp81x5bX3a3jusa7X2OgWGGQ==
X-Gm-Gg: AYBFou2xyr5jkLIVbOuLhp4Hx7eQgWXu2CHp2XhDOu0lRDQc7smubLebVD6lHFhuy6v
	mX5jo9dlw3Eg0sWMHX5WTQenq3ImZeyW5RxQx8vyvX728/S1ruitjaEK5cPmQGtnW+hNyzBYlua
	M9N6QXrtZwf9WXMzyGSzXDeZ8y2gSwdw/NcSA3wZKhmkzy3DSlxP63LlHx+qHaux3tUiq0izh0H
	0azhmxdvRxn68X00x0te92r77XPE8pAOr5ZGGi6COr9S8Ai/ikaVcBkiHyeKIuNIBEYoGZZ6zND
	edzIrQdIAfnWPswjV2JoXVcfXk6Hvb6dQKa87ut0hfpE/KzL4QsZr3V2zFTzPO9wSMk8wsfU4KK
	7NNSzqvcF7zSe67LEMl7wRddRzNsLl8eXjoLYXA==
X-Received: by 2002:a05:6512:39c6:b0:5b6:95e:87ee with SMTP id
 2adb3069b0e04-5be50a49fddmr245236e87.13.1792187294734; Fri, 16 Oct 2026
 14:48:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001165018.415526-1-mattst88@gmail.com> <alpine.DEB.2.21.2610162207360.22065@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2610162207360.22065@angie.orcam.me.uk>
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 16 Oct 2026 17:48:00 -0400
X-Gm-Features: AclHuK__B6Optnw2u7kpVvl6BA1iRZmam2t5bbDLLXcyYiv-5bd6n1WYFrY7dds
Message-ID: <CAEdQ38FOXiV+Sz8fdPswRN=m2dKkYzgF2-9OWx3WskdsmWUGtQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] alpha: replace dead links in Kconfig help text
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-alpha@vger.kernel.org, Magnus Lindholm <linmag7@gmail.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 5:13=E2=80=AFPM Maciej W. Rozycki <macro@orcam.me.u=
k> wrote:
>
> On Thu, 1 Oct 2026, Matt Turner wrote:
>
> > The Linux/Alpha FAQ, the unix-ag LX164 overview, the Rawhide install
> > HOWTO and the Ruffian FAQ are all gone. Point the "Alpha system type"
> > help at the system and motherboard lists on the alphalinux.org wiki
> > instead, give LX164 a one-line description in place of its link, and
> > drop the others.
>
>  Would it make sense to keep links to archive.org copies around?
>
> > @@ -184,8 +185,8 @@ config ALPHA_EIGER
> >  config ALPHA_LX164
> >       bool "LX164"
> >       help
> > -       A technical overview of this board is available at
> > -       <http://www.unix-ag.org/Linux-Alpha/Architectures/LX164.html>.
> > +       AlphaPC164-LX, a 21164A-based single-board computer using the
> > +       Pyxis chipset.
>
>  For example:
> <https://web.archive.org/web/19990913123756/http://www.unix-ag.org/Linux-=
Alpha/Architectures/LX164.html>
> seems fully usable.
>
> > @@ -224,14 +225,11 @@ config ALPHA_RAWHIDE
> >       select HAVE_EISA
> >       help
> >         AlphaServer 1200, AlphaServer 4000 and AlphaServer 4100 machine=
s.
> > -       See HOWTO at
> > -       <http://www.alphalinux.org/docs/rawhide/4100_install.shtml>.
>
>  Likewise:
> <https://web.archive.org/web/20000817221358/http://www.alphalinux.org/doc=
s/rawhide/4100_install.shtml>.
>
> >  config ALPHA_RUFFIAN
> >       bool "Ruffian"
> >       help
> > -       Samsung APC164UX.  There is a page on known problems and workar=
ounds
> > -       at <http://www.alphalinux.org/faq/FAQ-11.html>.
> > +       Samsung APC164UX.
>
>  Likewise:
> <https://web.archive.org/web/20000130062931/http://www.alphalinux.org/faq=
/FAQ-11.html>.
>
>  Of course nested links may or may not work, but at least references to
> some information are retained.  Or has it all been already extracted and
> written down in the wiki?

Did you compare any of the wiki pages and the old links?

I looked at all of these links via archive.org before sending the
patches and didn't see any useful information. The LX164 link just
contained the board specs and a link to the Technical Reference
Manual. The Rawhide link is an install guide for Red Hat 6.0. Similar
situation with the Ruffian page.

If you see any information that's missing from the wiki that I spent a
huge amount of time creating, point it out and I'll add it. At this
point, I see no reason to keep links to 1999-era articles.
