Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792848528;
	b=hD7ugXBo3UOe+Hl8xBXsJ1WwTL90jTJyGHTBpJ5TWXB1jVTwYdU7m0ZVhobXYXEgUPGI
	 wo277lKF7V4xUoq5cNLSAsnq6PqptfTm1d4D77RzZhWUX5t0x2U8k7eSbCrHnN2Tyku5E
	 HSGngxv/U4PRXm5lIrMBdvRaK8ki2yxoqI8bkW177QlI1aEGqH93xXk+JTvxKVwNpa89R
	 /Un0qYRD9z/PKPZfV/IfGe5EaAcpKVmvv7ATM+90pDIsoXl3kFw0OrbW6h0KKTZd0WzE3
	 4IlwMcW4yRuKGhd7L+mz5T66rr4XOkTqhl7HqfXk4qF5bFMSiEyLweZrJJepbOK7tug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792848528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ybbtRIHu/c+sSVNquqzT7I2v6zHjZz8a80OYmiK3aRw=;
	b=y/C8SaOLTc8exvo4nn+JJymW4oxARWeb5Ox+57DZdvtVOrQ7uL02IbpfIuy2W2ZPpW9B
	 cRUygau3ggTOusYZlIwSIZn+1TJqyhMui7H88mfmCwVnIcmNV0Sj9D+rot5E5bUO11lZr
	 vy1kL1kDea9XqpYK1jv5/X205t1mWdc4/f2IksG/9ThdD5Mwz9o9PtZ5WSkfrmRsUweiE
	 hZNkHgUigl9vzyacaDFZUEOdZuxLjtyfknkOonhkGq2qBtqMHPJzIpEzMeHD610ny9H3m
	 j99+JE/SoLKiVpGQxvj4QGiOEDKz8U8XqggnwlS2GAec51CEfBre52ASzYaI/1peWpw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lIrm88Wy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D55606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 13:28:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7D55606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lIrm88Wy
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5351d76e1baso20183801cf.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 06:28:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792848526; cv=none;
        d=google.com; s=arc-20260327;
        b=KS2vlePGQ0q4xv773V1pK65iDmkZtwmnmc0cysGbGen0ICqYlDXmUBWSBTeKZWLusG
         j38rKEi6wJ/+51qwlmSU4KzgXM9k6hu6PhTf6/Iv0XGO9INMCJ5koVXO6H/Xy7GdRYLw
         i2zzi3T4tilBNtaHS80/8Gs1aXVK+8YhUQSm3Ybalv7E3nzecMR6iOm8UwsS7DeE1nLB
         zAd5D3QVNwF9OkWlJDsCfvVlqPgw9oOP2eEjkq5ZYpu0c9Jif+2Rh17CpcWTC77rzu2D
         751DoYSW6ZT2u5lgyeliq2/Y6TZhkfrtFjd56hBZRPBV0qUozjUu3erCMlYhqR+dB/OL
         EQVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ybbtRIHu/c+sSVNquqzT7I2v6zHjZz8a80OYmiK3aRw=;
        fh=hzrpB9CTaZE5Zf53LIINH6Ld5+dvUhgklE5/b17Dkfo=;
        b=NP7myms8XiHkSKMtLQaCI21eIWJVxuDAO59Y9CNoEBDnUJLav72kylRYkFUsC3ZaFw
         rUbVucmD8+PE5+m5VMHzjQjS4w5UJ7DfCPR+Duloelx5hVDKXdA4hpd+/32X8g1Imdux
         2WqyXhR0jnhtqzN9/J10IjLafEptSePWUM6vX+TbpIRO9AebHR31uehUHiGXDFotfjlH
         Lr/rt2m+Z7L6ArCj8MCFCeLkiHMegl6BlLFHVjr+1En84UVawHNb8Zzf4msEMbQx/g2A
         ciMkoXUaWlXeCy0G5SQgttI8XlHfjb2YI54/MmooVr+u6pKkfIYAPSVM+aGcSrRDXf4K
         ruqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792848526; x=1793453326; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ybbtRIHu/c+sSVNquqzT7I2v6zHjZz8a80OYmiK3aRw=;
        b=lIrm88Wy0/IvPRvmC8A3eX/vwQ76/v2e9nPTL3tg5nNl2Gj7u4sEQfHjBb7OEz1KU9
         Gex7b24oExL4/VT5TZ8RE8eNT2YQh7iNjRIbnYImV5EDGbx2T/P6waWVrMFk845q9hhX
         f0X7RUqksgoxtLnjMzKKjz7JlthSkznBEMFnwVtGT/V+mHIIdYxz725vpClSFBnL/M23
         O9x0mGHi1p8P1iqRx9blLpdYOHh7BTX8BPYK2Uvu5nWapyAmC/I84rG4jGkAjczjCLPi
         /sRRnj99J8RYjcGO8FOSd6xfxNsElK5dld+LJ6xS5h62vBj/uqjH6AWMEq+zfmp+EVDB
         m6/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792848526; x=1793453326;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ybbtRIHu/c+sSVNquqzT7I2v6zHjZz8a80OYmiK3aRw=;
        b=AsnjJ7egav8fDZ/RUZy7OIjtdYYGffum3zlGZDeS3BDJJIze4kO5i75ufucL1DwmjK
         qMKtWTfoFROTUtf0plGyoY1ycF7fpVzcEuWgyofGn9zAX4V5DYEsbBD4ifseMf4scRrl
         V8ebvbVRzbHm8BzScDp8MCuJMc5DC3hbdd0zf98Ljiui8OaBzGVrzrhY1IOf6KoF7GA0
         GPuEnHk52DUFmWpvfGeOFlHzBY4wFMdf0fDYIFrsl/NV1PthkNyohYmSY2JWhkzFnowq
         sFKfRCmlJDxmnw6Hy9EdSzxLNxaLTQOD3Nf86lhFxpEq/Vikn054X9KN6SrlCLRCp/cm
         HdfQ==
X-Forwarded-Encrypted: i=1; AKwUvBw1t5W8osm8iWDi+2RpRF1/KJV1K7A1M2XrQ+8XqGDpas4V8+GkSRu4v8ZRY/nVuzOytGZkvNte5omyXw0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIBbuEhjGu6EBr0ZZ0/fGHCEX5zUCYd2z8L7klvNevl85dinz1
	TkObsJ0kzFEQWSGBaUVdMkuwJgNIcXm7xwHipyvBvwIdrsbznI04176x469gTKT/qmAW0NDH+bI
	9Kf9xjQspTA0AYVOdoTCnTE2WhVaSuoA=
X-Gm-Gg: AYBFou27UIeTqvzED0AaZT0k+jC40Nl3NyIjLIhXbVGFjaU1NjwuCve/oK0MPGjlDy2
	Z1yGwQ2S+o/RWn+6CCcOZlhSEC5JwIY4JHdZz0EEPy0NuZbnhXdTie5AivYynHywgSct4+0V+t2
	qnAqyOg6wWTLILFkX4SaJ4TIMcJLJBHd+qtwrwHdsq6XRs5GlOejEisJt8jI3714JGXk8HESpIo
	Wi9k+NqqdWr6pWtqhLiRO02WMPINs3Q3IEjTKzm1iz60UIryvwXt+MqwDBKWsbru9eoYIRF8y6m
	MiNL/SsHymsDDvtkolGkLp1tTxAxz6DQjaKYj7khV5llzUrnIfBJZdV/Qizj5BCNTF3vQCeso7V
	Ov4oMSvfQnbv8ApNUnXzi9LccYqMJwPJfSA2D4WsV2mqzyx5KohwtIHDWIA6b5GTWYHpmHrTqj+
	+XScbaZezNUu2FRHVUFuwpNH2KwFxqqrGJvmXPLBbvEC+xaIi3
X-Received: by 2002:a05:622a:5cc:b0:536:6ace:48b5 with SMTP id
 d75a77b69052e-5383b6b554fmr22755981cf.38.1792848526159; Sat, 24 Oct 2026
 06:28:46 -0700 (PDT)
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
 <20261015125644.12908-2-danielmaraboo@gmail.com> <atQ_mXYNqs4tnDpW@wyuan.org>
 <79dd90f0.11f3f.1a15272eff3.Coremail.dzm91@hust.edu.cn> <CAMAsx6eb3X7GLheOaVoumORnvKftFYkU0VHynZYyx9m74+CTTw@mail.gmail.com>
 <40aeaf0a-6e04-461c-a507-52f791b45541@hust.edu.cn>
In-Reply-To: <40aeaf0a-6e04-461c-a507-52f791b45541@hust.edu.cn>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Sat, 24 Oct 2026 10:28:34 -0300
X-Gm-Features: AclHuK_FbrRcQX6pYg9TAcib0tO4xZaxCHiQ2SVOh3EVtAjN95lCaTAeQDJubBk
Message-ID: <CAMAsx6fk=k1aXT3gvyZ4k8hG9KN+YCmvEc42LGdmm3Y+p2J1_g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] docs: doc-guide: add a guide for translators
To: dzm91@hust.edu.cn
Cc: wy@wyuan.org, jani.nikula@linux.intel.com, alexs@kernel.org, 
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	si.yanteng@linux.dev, chenyou910331@gmail.com, federico.vaga@vaga.pv.it, 
	akiyks@gmail.com, carlos.bilbao@kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 10:10 +0800, Dongliang Mu wrote:
> Daniel, can you list all 14 files in sp_SP, zh_CN and zh_TW?

Hi Dongliang,

Sure. First a correction: when I counted, I only looked at .rst files.
With the .txt files included, ja_JP and ko_KR do not fully mirror the
original paths either, so my earlier statement about them was wrong.
The full list follows, translation first and current original below.

The 14 .rst files. Original moved, translation not moved with it:

sp_SP/process/magic-number.rst
-> staging/magic-number.rst
sp_SP/wrappers/memory-barriers.rst
-> core-api/wrappers/memory-barriers.rst
zh_CN/dev-tools/gdb-kernel-debugging.rst
-> process/debugging/gdb-kernel-debugging.rst
zh_CN/filesystems/gfs2.rst
-> filesystems/gfs2/index.rst
zh_CN/filesystems/gfs2-glocks.rst
-> filesystems/gfs2/glocks.rst
zh_CN/filesystems/gfs2-uevents.rst
-> filesystems/gfs2/uevents.rst
zh_CN/networking/xfrm_proc.rst
-> networking/xfrm/xfrm_proc.rst
zh_CN/process/magic-number.rst
-> staging/magic-number.rst
zh_TW/admin-guide/security-bugs.rst
-> process/security-bugs.rst
zh_TW/dev-tools/gdb-kernel-debugging.rst
-> process/debugging/gdb-kernel-debugging.rst
zh_TW/process/magic-number.rst
-> staging/magic-number.rst

Document exists only in the translation:

zh_CN/glossary.rst
zh_CN/how-to.rst
zh_TW/glossary.rst

As Chen-Yu pointed out, the three zh_TW moves are already in the zh_TW
tree and will go away once that series lands upstream.

The .txt files whose original is now an .rst file elsewhere:

zh_CN/arch/arm/kernel_user_helpers.txt
zh_TW/arch/arm/kernel_user_helpers.txt
-> arch/arm/kernel_user_helpers.rst
zh_CN/arch/arm64/{booting,legacy_instructions,memory,
silicon-errata,tagged-pointers}.txt
zh_TW/arch/arm64/{booting,legacy_instructions,memory,
silicon-errata,tagged-pointers}.txt
-> arch/arm64/*.rst
zh_CN/filesystems/sysfs.txt
zh_TW/filesystems/sysfs.txt
-> filesystems/sysfs.rst
zh_CN/video4linux/omap3isp.txt
-> admin-guide/media/omap3isp.rst
zh_CN/video4linux/v4l2-framework.txt
-> split into driver-api/media/v4l2-*.rst
zh_TW/IRQ.txt
-> core-api/irq/index.rst (according to its own header)
zh_TW/io_ordering.txt
-> driver-api/io_ordering.rst
ja_JP/stable_api_nonsense.txt
ko_KR/stable_api_nonsense.txt
-> process/stable-api-nonsense.rst
ja_JP/stable_kernel_rules.txt
-> process/stable-kernel-rules.rst

These .txt files are not part of the Sphinx build, so the language
switcher never sees them, but they still break the path mapping that
checktransupdate.py relies on. Whether each one should be converted and
moved, or dropped as outdated, is up to the maintainers of each
translation.

Thanks,
Daniel


Em qui., 22 de out. de 2026 =C3=A0s 23:10, Dongliang Mu <dzm91@hust.edu.cn>=
 escreveu:
>
>
> On 10/23/26 1:09 AM, Daniel Pereira wrote:
> > On Mon, Oct 19, 2026 at 12:37 +0800, Dongliang Mu wrote:
> >> So my suggestion is that, after confirming all the translated
> >> docuementation follows this style, we can delete this field and write
> >> this relocation style in the translation guidance.
> > Hi Weijie, Dongliang, Alex, Jani,
> >
> > I checked docs-next. it_IT, pt_BR, ja_JP and ko_KR already mirror the
> > original path for every file. There are 14 files in sp_SP, zh_CN and
> > zh_TW that do not, for two reasons:
> >
> > - the original has moved and the translation was not moved with it:
> > magic-number (now in staging/), gdb-kernel-debugging (now in
> > process/debugging/), security-bugs (now in process/), xfrm_proc
> > (now in networking/xfrm/), memory-barriers (now in
> > core-api/wrappers/), and the three gfs2 documents in zh_CN;
> > - the document exists only in the translation: glossary.rst in zh_CN
> > and zh_TW, and how-to.rst in zh_CN.
> >
> > So I agree with Dongliang's order. For v3 of the guide I propose:
> >
> > - state the path mirroring as a rule, since the language switcher and
> > checktransupdate.py both depend on it;
> > - describe ":Original:" as optional and not needed when the path
> > mirrors the original, instead of showing it in the header example.
> >
> > Moving the files above and removing the existing ":Original:" fields
> > can then be done per language, as separate series, by people who know
> > each translation. I can send the moves for the files whose originals
> > were relocated, if the maintainers of those translations agree.
>
>
> I agree with this proposal. Ask maintainers of each translation to
> solves these issues first.
>
> Daniel, can you list all 14 files in sp_SP, zh_CN and zh_TW?
>
> Dongliang Mu
>
>
> >
> > Thanks,
> > Daniel
> >
> >
> > Em seg., 19 de out. de 2026 =C3=A0s 01:37, =E6=85=95=E5=86=AC=E4=BA=AE =
<dzm91@hust.edu.cn> escreveu:
> >>
> >>> =E5=8F=91=E4=BB=B6=E4=BA=BA: "Weijie Yuan" <wy@wyuan.org>
> >>> =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4:2026-10-18 11:40:09 (=E6=98=9F=
=E6=9C=9F=E6=97=A5)
> >>> =E6=94=B6=E4=BB=B6=E4=BA=BA: "Daniel Pereira" <danielmaraboo@gmail.co=
m>
> >>> =E6=8A=84=E9=80=81: "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan" =
<skhan@linuxfoundation.org>, "Randy Dunlap" <rdunlap@infradead.org>, "Alex =
Shi" <alexs@kernel.org>, "Yanteng Si" <si.yanteng@linux.dev>, "Dongliang Mu=
" <dzm91@hust.edu.cn>, "Chen-Yu Yeh" <chenyou910331@gmail.com>, "Federico V=
aga" <federico.vaga@vaga.pv.it>, "Akira Yokosawa" <akiyks@gmail.com>, "Carl=
os Bilbao" <carlos.bilbao@kernel.org>, "Avadhut Naik" <avadhut.naik@amd.com=
>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, "Jani Nikula" <=
jani.nikula@linux.intel.com>
> >>> =E4=B8=BB=E9=A2=98: Re: [PATCH v2 1/2] docs: doc-guide: add a guide f=
or translators
> >>>
> >>> +cc Jani Nikula
> >>>
> >>> On 2026-10-15 09:56:42 -0300, Daniel Pereira <danielmaraboo@gmail.com=
> wrote:
> >>>
> >>>> The documentation has seven translations, but nothing in the English
> >>>> documentation explains how to contribute to them.  The only guide th=
at
> >>>> exists, Documentation/translations/zh_CN/how-to.rst, is written in
> >>>> Chinese and covers the zh_CN translation only.
> >>>>
> >>>> As a result, the same problems come up over and over in the review o=
f
> >>>> translation patches: labels and citations copied from the original,
> >>>> which are global in Sphinx and collide with the English ones; partia=
l
> >>>> builds with SPHINXDIRS that hide those collisions; lines over 80
> >>>> columns; translations not added to any toctree; missing commit
> >>>> descriptions, tags separated by blank lines, HTML email rejected by =
the
> >>>> lists, and the documentation maintainer left out of the recipients.
> >>>>
> >>>> Add Documentation/doc-guide/translations.rst, a guide that covers th=
e
> >>>> whole workflow of a translation: choosing what to translate, the lay=
out
> >>>> of a translated document (path, header, labels, citations,
> >>>> cross-references, what must not be translated), translation quality =
and
> >>>> terminology, adding the document to the build, checking it with a fu=
ll
> >>>> htmldocs build, checkpatch and checktransupdate.py, preparing and
> >>>> sending the patch, the review process, keeping translations up to da=
te
> >>>> and starting a new translation.  The commit message format it sugges=
ts
> >>>> is the one already recognized by tools/docs/checktransupdate.py.
> >>>>
> >>>> Link the guide from the doc-guide index and from the translations
> >>>> index.
> >>>>
> >>>> Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
> >>>> ---
> >>>> Changes in v2:
> >>>> - Drop the Assisted-by references from the AI tools section, the tag=
s
> >>>>    example and the checklist (Weijie Yuan).
> >>>> - Use a plain path in the ":Original:" example and drop ":Translator=
:"
> >>>>    from it (Weijie Yuan).
> >>>>
> >>>> v1: https://lore.kernel.org/linux-doc/20261013003702.5824-2-danielma=
raboo@gmail.com/
> >>>>
> >>>>   Documentation/doc-guide/index.rst        |   1 +
> >>>>   Documentation/doc-guide/translations.rst | 694 +++++++++++++++++++=
++++
> >>>>   Documentation/translations/index.rst     |   3 +
> >>>>   3 files changed, 698 insertions(+)
> >>>>   create mode 100644 Documentation/doc-guide/translations.rst
> >>> [...]
> >>>
> >>>> +Anatomy of a translated document
> >>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>> +
> >>>> +Location and file name
> >>>> +----------------------
> >>>> +
> >>>> +A translation mirrors the path of its original under the language
> >>>> +directory, and keeps the same file name::
> >>>> +
> >>>> +  Documentation/process/howto.rst
> >>>> +  Documentation/translations/<lang>/process/howto.rst
> >>>> +
> >>>> +Do not translate file or directory names.  The documentation build =
uses
> >>>> +this mapping to add, at the top of every page, links to the same pa=
ge in
> >>>> +the other languages; it only works if the paths match.
> >>>> +
> >>>> +The file header
> >>>> +---------------
> >>>> +
> >>>> +Start the file with the same SPDX license identifier as the origina=
l.
> >>>> +Most translations then indicate, in some form, which document was
> >>>> +translated and include the language's disclaimer.  For example, the
> >>>> +Italian translation uses::
> >>>> +
> >>>> +  .. include:: ../disclaimer-ita.rst
> >>>> +
> >>>> +  :Original: Documentation/core-api/symbol-namespaces.rst
> >>>> +
> >>>> +A plain path is enough in the ``:Original:`` field: the documentati=
on
> >>>> +build turns ``Documentation/...`` paths into links automatically.
> >>> Oh, btw. There's a comment about ":Original:" from Jani [1]:
> >>>
> >>> | I'm wondering, are these :Original: fields useful anymore since the
> >>> | translations extension adds the button to switch between languages?
> >>> |
> >>> | The pretty much hard-coded expectation is that the English version =
at
> >>> | path/to/foo.rst is the original, and its translations are at
> >>> | translations/xx_YY/path/to/foo.rst.
> >>> |
> >>> | I.e. neither the HTML nor the RST benefit from it, and it's just
> >>> | repetition.
> >>>
> >>> Perhaps we could have a bit of discussion here?
> >> Hi Jani and Weijie,
> >>
> >> if all the translation documentation follows the relocation style -
> >>
> >> Documentation/XXX/XXX.rst to Documentation/translations/XXX/XXX.rst,
> >>
> >> the ":Original:" has no meaning, but actually this convention does not=
 work sometimes.
> >>
> >> BTW, tools/docs/checktransupdate.py uses this relocation style in the =
zh_CN translation. When I try to test this script in other translations, th=
is issue occurs.
> >>
> >> So my suggestion is that, after confirming all the translated docuemen=
tation follows this style, we can delete this field and write this relocati=
on style in the translation guidance.
> >>
> >> Dongliang Mu
> >>
> >>> Thanks.
> >>>
> >>> [1] https://lore.kernel.org/linux-doc/c719c6756f345c6c39db483654578ef=
09de1948f@intel.com/
> >>
> >> ------------------------------
> >> Best regards,
> >> Dongliang Mu
>
