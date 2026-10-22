Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792688954;
	b=IKedcF0M87UeTY/TTmGsAvXVUzWewKpsjHY2tS2DK04Kgk13cg0sE0NuX1bTwUZU9T84
	 Tm/QrsGOhXA1oymtm+sBJp33kBXJi++rjSHrxOktTvtXIQiubZgrZy+kMOYkicAQJn13v
	 gFDvgUYZgksRhEZSM90sKogbXe8pm7MfZcV/3PLxkNKk6E9nR2bByo+oVOo/XHDsu/o9O
	 B5hSH6bwYy+1r086XR3NJW15op6RhoNABRy9ROHcKSTdg5XBDc4FE/LnWDoRBS41kv/5J
	 nUv+7aawoYLLW18lybTr7JtKM1g3/mXARxwTy2h8oI4c2cH2kU1K9+a/8gRzWxz3+Ig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792688954;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GfwVNjBinLhECyFto+p6qJ9Qf/67yX4e3W2C93lJd7A=;
	b=DOeiL00+Ni4uetiSgLMOp6aJxWAJfukCM4qwu2jdzcsXVRodDWpmNshI2n/SEkVePI7R
	 UfchluQsmkdXPlpoIt3eujee+seKIeWyKJ5waBHLpguhN0EHXmtzF0FfvYbe4MCZVaPzs
	 ez+jkZmGR66sKKqzcvdlcnIy2Hd03G4yjXS5SVA0SCd0au7HHPhrlPQGFJd7BeoKnkbtm
	 m/q549FNpxTVXvVlnHS5qxpS886cPyZ82XpYsEx9wFD7egVo5aaeqoJCe8zb1aYeK9yG3
	 zqggDIKM9eyf6br4ylsPDCvouZQGfyeCWyHcpzC/jHnf+1aFBg5Y0N69kK0fipDMEUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CWu9tbxW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35FDF606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:09:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35FDF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CWu9tbxW
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5361e313e63so21503161cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:09:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792688953; cv=none;
        d=google.com; s=arc-20260327;
        b=YF8ZfUv/bd5AOsJdaa6prBkTqNMjeBT/Bxl1WtYPiZGZyEMFLZQ+sIhtOZgEIwBjtf
         NNgPRsDYtDubtmGiCz+ZbsL511NCKxqL0HHhy+VKFookRZpIjaEcgS0Ld+9nHVthj8x+
         qhSihehMqwZzKZu808oVrv20/Tx2QXg/rQ8TcQNU+db+b3tHPBalqC/pzRt9yTp8o0WI
         8AKPFxOLuktuyNuu9yvdMf3m4ghnOEB5E1HAjsXrsKX8gmpOXWNMXcyNR/w7gBoovXzm
         4Mf9RrT1P7wrM2HDmX5R7E93gXXELv59V+uKRiUQsm5sTmb9Oz/pNSizJwFeHgqcVEmR
         DL2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GfwVNjBinLhECyFto+p6qJ9Qf/67yX4e3W2C93lJd7A=;
        fh=Y90UtOmchNhjDDTRcFblIDZNCaxxvkiVLHKoooIDes4=;
        b=TIf+xYJ2amSDyoccGmKvz+t0xm2KY+fIjKHId3OQZWWs85P8qqpmuAMLlN/nvnGLKA
         1ahuBQBKIcL41odLn+E2UdrGpHpPGYu+xP0JRsiGaiWXuboYgL3TuhxXkpnCNpojw66d
         hA99vz95t1xGI15ytn2+DeSERVpy9Y/p5Cy8SkqQ23p/c6sila8+nGx9dWKlBZh70KYK
         xrb3txVnGj6pIaDYdzG0TMMvmHL8G10GZmejhQWlAkS+bQzTB908LJvRRdKUrZfSO/mU
         rDM6rK4ag2fu5vn4zuaOZvR/stRWkwGf5nKJqUz3/1h9SgR1mDW1JFrokTp7oEPsNI6n
         6A4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792688953; x=1793293753; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GfwVNjBinLhECyFto+p6qJ9Qf/67yX4e3W2C93lJd7A=;
        b=CWu9tbxWxgTFBB5ptc29m/qvoMkf2DmuRsTTZ6ZYhcSwdT1Zi7sV8MibkjICc4cUuV
         8OM0KuXCyDL1FgPP4jP0YxFTtwKL55k61thmSwnkBhMqElm4k/pw5wGX2C9HwhOw10wd
         zx4qNdrCzd8dvHbTvscSojLpOWCO6rII2fAHEYWnhojkujlVTZ+n69BwHCdDqIlexu0i
         qXnfR2MJwf++ki8hijM7YAZE+m4Ki7K/6hTmj+kHUlSPGPyn+Dt4bFK7Prqn5ZE9uaXH
         H7h2ihbAHvk+HNhz51oA4nxYVx9OT1QMyJFX2u+bcgIHVvMYslBWpNQpdu7f2GrxVCER
         +NJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792688953; x=1793293753;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GfwVNjBinLhECyFto+p6qJ9Qf/67yX4e3W2C93lJd7A=;
        b=BfSzbreDIuz8g4hxdadHNEFFmwRqdfN8YDs0COIvmjNEx+OcAZ5WJW+vl0/M3kovqL
         /S+9woIiaKonCSY9zzLrXLFKgQfQCDWhbPfmKT4D5jKaS4ASdRY40IKIy42Fj0wE9T+1
         ELB/axBz7l3CmKH19JIdCDxRlecF89u8LyzEROHhcwaG2Yf273dZszECu7Td88WmArvl
         uEZGBEkXc2nw2O+Qb3dCqo1gnBKmusjO5mxIUAv5vtuXD/TAYAR/DJfZgsNuaHT/L1X2
         d77mclZlGqJXu/Nu3a0Apdjgy5P7wXtGOJ5+/yM/eMDwHFDFUU1YhhGxGqRdOG26LVcX
         BPnA==
X-Forwarded-Encrypted: i=1; AKwUvByj1+/rUzmJaYw3fTsoMV4GPU8/tUFxXJ2UOVKFRiNHWdveuD0lMOhZ7i9IWifvS+kJHX1tyBmIdOfdsY8=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1m45H3/fkGeqcld+38lioI1azmgvxKzXH701D+lLfw4xZ/9NS
	PFzFxVCzW8bTbXAAkymOopDK0aEg+xem94msn5tl20vpNcN/a5Xi7DIjbn6L1Al1OcmaDK4E5+x
	BssBF6QbZLZbIUGweIb5cQ58S6zfMwE8=
X-Gm-Gg: AYBFou0cw+ku5/8njsnVCn9h1oCzGjDj9LIQ+J7AJcW3TqAT6acNP3nB/8Qh5DTPjfD
	EWs1xVVVJu8dCyw91h/XSAIXlQa3q3diV9QLpfK56zXhwASBakmN48NZ7RB8HGCEL7mXRPlMK6Z
	1VWonwLc5z8S0YiT2jbRK3djQrsS/ohS50viVSObELHP8C4ua0uBc9GYJwj1NfLMbDwgVJg6+vJ
	T8T5i3NGusVIUvVUYpSCFM6YvcKvvOMnU1B3MV73LZnCfS8UH4MDIBgJ5yA9yzhEvqs/IU6LGeH
	RY8xC87HrY1mWSWDmgZaiuoApq6HAjLo3kD9aPUXi/xxaAYcKG3OOtDwf/QVYh2LzVomTVWn8sO
	eH0HH/MhJK7qP4DJ3rrgCUMqPsSlX9V2dECATewUU4EXNRLk01V09iSnNyMQKAr2HpDigfYVVAN
	8WgBxUd2YUl3xTER0chKjCklDsSxp9LgmxncwHUTjQVPXl+OiJ
X-Received: by 2002:a05:622a:13c6:b0:535:127c:da40 with SMTP id
 d75a77b69052e-5369b43ac98mr94537041cf.4.1792688952819; Thu, 22 Oct 2026
 10:09:12 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015125644.12908-1-danielmaraboo@gmail.com>
 <20261015125644.12908-2-danielmaraboo@gmail.com> <atQ_mXYNqs4tnDpW@wyuan.org> <79dd90f0.11f3f.1a15272eff3.Coremail.dzm91@hust.edu.cn>
In-Reply-To: <79dd90f0.11f3f.1a15272eff3.Coremail.dzm91@hust.edu.cn>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Thu, 22 Oct 2026 14:09:00 -0300
X-Gm-Features: AclHuK8MKhFqv1-o86xCTgtpKNiTMbzIKd3UQBTkUEoNRn9kUQJAvh3qiLz1k7Y
Message-ID: <CAMAsx6eb3X7GLheOaVoumORnvKftFYkU0VHynZYyx9m74+CTTw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] docs: doc-guide: add a guide for translators
To: dzm91@hust.edu.cn
Cc: wy@wyuan.org, jani.nikula@linux.intel.com, alexs@kernel.org, 
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	si.yanteng@linux.dev, chenyou910331@gmail.com, federico.vaga@vaga.pv.it, 
	akiyks@gmail.com, carlos.bilbao@kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 12:37 +0800, Dongliang Mu wrote:
> So my suggestion is that, after confirming all the translated
> docuementation follows this style, we can delete this field and write
> this relocation style in the translation guidance.

Hi Weijie, Dongliang, Alex, Jani,

I checked docs-next. it_IT, pt_BR, ja_JP and ko_KR already mirror the
original path for every file. There are 14 files in sp_SP, zh_CN and
zh_TW that do not, for two reasons:

- the original has moved and the translation was not moved with it:
magic-number (now in staging/), gdb-kernel-debugging (now in
process/debugging/), security-bugs (now in process/), xfrm_proc
(now in networking/xfrm/), memory-barriers (now in
core-api/wrappers/), and the three gfs2 documents in zh_CN;
- the document exists only in the translation: glossary.rst in zh_CN
and zh_TW, and how-to.rst in zh_CN.

So I agree with Dongliang's order. For v3 of the guide I propose:

- state the path mirroring as a rule, since the language switcher and
checktransupdate.py both depend on it;
- describe ":Original:" as optional and not needed when the path
mirrors the original, instead of showing it in the header example.

Moving the files above and removing the existing ":Original:" fields
can then be done per language, as separate series, by people who know
each translation. I can send the moves for the files whose originals
were relocated, if the maintainers of those translations agree.

Thanks,
Daniel


Em seg., 19 de out. de 2026 =C3=A0s 01:37, =E6=85=95=E5=86=AC=E4=BA=AE <dzm=
91@hust.edu.cn> escreveu:
>
>
> > =E5=8F=91=E4=BB=B6=E4=BA=BA: "Weijie Yuan" <wy@wyuan.org>
> > =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4:2026-10-18 11:40:09 (=E6=98=9F=E6=
=9C=9F=E6=97=A5)
> > =E6=94=B6=E4=BB=B6=E4=BA=BA: "Daniel Pereira" <danielmaraboo@gmail.com>
> > =E6=8A=84=E9=80=81: "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan" <s=
khan@linuxfoundation.org>, "Randy Dunlap" <rdunlap@infradead.org>, "Alex Sh=
i" <alexs@kernel.org>, "Yanteng Si" <si.yanteng@linux.dev>, "Dongliang Mu" =
<dzm91@hust.edu.cn>, "Chen-Yu Yeh" <chenyou910331@gmail.com>, "Federico Vag=
a" <federico.vaga@vaga.pv.it>, "Akira Yokosawa" <akiyks@gmail.com>, "Carlos=
 Bilbao" <carlos.bilbao@kernel.org>, "Avadhut Naik" <avadhut.naik@amd.com>,=
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, "Jani Nikula" <ja=
ni.nikula@linux.intel.com>
> > =E4=B8=BB=E9=A2=98: Re: [PATCH v2 1/2] docs: doc-guide: add a guide for=
 translators
> >
> > +cc Jani Nikula
> >
> > On 2026-10-15 09:56:42 -0300, Daniel Pereira <danielmaraboo@gmail.com> =
wrote:
> >
> > > The documentation has seven translations, but nothing in the English
> > > documentation explains how to contribute to them.  The only guide tha=
t
> > > exists, Documentation/translations/zh_CN/how-to.rst, is written in
> > > Chinese and covers the zh_CN translation only.
> > >
> > > As a result, the same problems come up over and over in the review of
> > > translation patches: labels and citations copied from the original,
> > > which are global in Sphinx and collide with the English ones; partial
> > > builds with SPHINXDIRS that hide those collisions; lines over 80
> > > columns; translations not added to any toctree; missing commit
> > > descriptions, tags separated by blank lines, HTML email rejected by t=
he
> > > lists, and the documentation maintainer left out of the recipients.
> > >
> > > Add Documentation/doc-guide/translations.rst, a guide that covers the
> > > whole workflow of a translation: choosing what to translate, the layo=
ut
> > > of a translated document (path, header, labels, citations,
> > > cross-references, what must not be translated), translation quality a=
nd
> > > terminology, adding the document to the build, checking it with a ful=
l
> > > htmldocs build, checkpatch and checktransupdate.py, preparing and
> > > sending the patch, the review process, keeping translations up to dat=
e
> > > and starting a new translation.  The commit message format it suggest=
s
> > > is the one already recognized by tools/docs/checktransupdate.py.
> > >
> > > Link the guide from the doc-guide index and from the translations
> > > index.
> > >
> > > Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
> > > ---
> > > Changes in v2:
> > > - Drop the Assisted-by references from the AI tools section, the tags
> > >   example and the checklist (Weijie Yuan).
> > > - Use a plain path in the ":Original:" example and drop ":Translator:=
"
> > >   from it (Weijie Yuan).
> > >
> > > v1: https://lore.kernel.org/linux-doc/20261013003702.5824-2-danielmar=
aboo@gmail.com/
> > >
> > >  Documentation/doc-guide/index.rst        |   1 +
> > >  Documentation/doc-guide/translations.rst | 694 +++++++++++++++++++++=
++
> > >  Documentation/translations/index.rst     |   3 +
> > >  3 files changed, 698 insertions(+)
> > >  create mode 100644 Documentation/doc-guide/translations.rst
> >
> > [...]
> >
> > > +Anatomy of a translated document
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +Location and file name
> > > +----------------------
> > > +
> > > +A translation mirrors the path of its original under the language
> > > +directory, and keeps the same file name::
> > > +
> > > +  Documentation/process/howto.rst
> > > +  Documentation/translations/<lang>/process/howto.rst
> > > +
> > > +Do not translate file or directory names.  The documentation build u=
ses
> > > +this mapping to add, at the top of every page, links to the same pag=
e in
> > > +the other languages; it only works if the paths match.
> > > +
> > > +The file header
> > > +---------------
> > > +
> > > +Start the file with the same SPDX license identifier as the original=
.
> > > +Most translations then indicate, in some form, which document was
> > > +translated and include the language's disclaimer.  For example, the
> > > +Italian translation uses::
> > > +
> > > +  .. include:: ../disclaimer-ita.rst
> > > +
> > > +  :Original: Documentation/core-api/symbol-namespaces.rst
> > > +
> > > +A plain path is enough in the ``:Original:`` field: the documentatio=
n
> > > +build turns ``Documentation/...`` paths into links automatically.
> >
> > Oh, btw. There's a comment about ":Original:" from Jani [1]:
> >
> > | I'm wondering, are these :Original: fields useful anymore since the
> > | translations extension adds the button to switch between languages?
> > |
> > | The pretty much hard-coded expectation is that the English version at
> > | path/to/foo.rst is the original, and its translations are at
> > | translations/xx_YY/path/to/foo.rst.
> > |
> > | I.e. neither the HTML nor the RST benefit from it, and it's just
> > | repetition.
> >
> > Perhaps we could have a bit of discussion here?
>
> Hi Jani and Weijie,
>
> if all the translation documentation follows the relocation style -
>
> Documentation/XXX/XXX.rst to Documentation/translations/XXX/XXX.rst,
>
> the ":Original:" has no meaning, but actually this convention does not wo=
rk sometimes.
>
> BTW, tools/docs/checktransupdate.py uses this relocation style in the zh_=
CN translation. When I try to test this script in other translations, this =
issue occurs.
>
> So my suggestion is that, after confirming all the translated docuementat=
ion follows this style, we can delete this field and write this relocation =
style in the translation guidance.
>
> Dongliang Mu
>
> >
> > Thanks.
> >
> > [1] https://lore.kernel.org/linux-doc/c719c6756f345c6c39db483654578ef09=
de1948f@intel.com/
>
>
> ------------------------------
> Best regards,
> Dongliang Mu
