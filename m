Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8816B401494
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 18:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791917829; cv=pass; b=VgSPStB7K3L5or0CsxVVr10OKDmXrS7Vf9n0hAjUHGutICrnmts6P2CK/cOo4H6hyFdLl2I1Qvwo+MVh1rgoqSpl2an1QXOAgXiHs09X+Ll7ni8z8VLvejO+ccpgtTSYoduJnRWEM2vg33MYl3Wo3MeSg6pnDpRNNL0xV8pAz/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791917829; c=relaxed/simple;
	bh=UdFnEN23ZFL6cWSBzWu9juvqVYubuE8e4CCZuSkb0f4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GRoOyso64pARIjSEStdsSCd2pIgnXtI4z4sVWkIMq78U8x1qKhGs0tJxHTa/koZneimRmnpIyy9kJrLejmYDaQJtd14WvBbYLqEa6wb362m1WuXvoSbao4h2csg4mFVXugqPxwtqulS4AUs6UTrRkUGqICreLmcgY4pG5t42n6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bBL5Szn7; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bBL5Szn7"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35834f72d94so5958403eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:57:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791917826; cv=none;
        d=google.com; s=arc-20260327;
        b=FCrHJj+NQM65LK5LRpSHJhK0mD3t2Mf4xnx9bcIRCauvWMRV5EaN2qySmJcLdjL/lZ
         PsaLzpH+kpFYrdtyyjy+VcUiGBoiTbRiKOHFVcyY80wa7pYAvSCB/YdeqTGutpn+G8Yt
         RWpoC9RDmD5sZtZezAgXcmKKYLpXthgdpmjgLC4Zyw3B5KUa0/8mPE0zYWAHn0FSgE06
         MfV7hRYoms4mVQfpj2XBHEoVlPerNDwNSF40L8m0YWQ7Z1tOEqPDd9PjN3f2vMw7Ji9v
         j9TANnFQxwQNvABdeJePuQp5iaGYKZtLr9LX108vfThOnM5x13+F8s61z2O7Mb2T6wom
         U3oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UdFnEN23ZFL6cWSBzWu9juvqVYubuE8e4CCZuSkb0f4=;
        fh=GIbse4fnUIoMNvHJ/a93r1Ol3EKcojTPnxPmQ+v9CCM=;
        b=dIaa9EyoiLY/VDP9fNfPit7xnYZPrWkKdTeb09Gh41sdjXl0D4CiFkfP2B12fn71Ji
         0ZITaawGY0TWYaAVKMfPpOhO+y2CtqM1c/34ltuRgkATOGWCa8tRY1H+AkJ01zE5DnDa
         4KwLlgYX6REqsybJjGJCmQrjgUMUxCV3uPYqiTnYsMAKS1FGHBzt3GjTkdPXPF/YOZdu
         1bEDK7yuc4B/mRerQLw7vCmJtPfyD6hQHwjj8wLcDICkhHXRdD2c+8hyRJWK6rX7Qsuq
         wMijwoWXaEj/oAEKKzqmtskUQUwW6uRAtnONtc0oNThPxkl4oS9n3TGER173mTocizzI
         3vVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791917826; x=1792522626; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UdFnEN23ZFL6cWSBzWu9juvqVYubuE8e4CCZuSkb0f4=;
        b=bBL5Szn7TWVoKFg1ZYDGMX2S/a0MgumDzIFdDyQpxAs25psBPG0ZpCZWBgkBvBQr4Y
         CXHmK0Mh5onjNJcbIcWiHOX3XmMne77LVtqpWVRgPxN9447+o3CQWnfAYoeD3mV6zxSA
         R3l55ZMKDANO+UxoNZhuGox4tim/UAH/crJU1lyRm4nZYq7LnJC2UA4PZ77zM4nde2m1
         Vbg9ur2OeUs+WdPVOeBdnKq0UNq0U3suZqDgKtJy0l7COIwgAVjMxcLU/2Vd0VbJ7EEF
         FeKXBEgpTNGbVGJXW81G5XI1sZt51FVZNhw/A+cRXKX7w8W2fbY4w+jt9axpnYxumRLC
         hRIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791917826; x=1792522626;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UdFnEN23ZFL6cWSBzWu9juvqVYubuE8e4CCZuSkb0f4=;
        b=IdF8l+GICXzaeBHGktmJAjFDnz1i04S/Vuim04zSECZErADoI9BwtPls//NYcWiVB5
         uspbu2rJF3aaIMf/3q3bmSSlANVMcXBLHnqkitt3shjvc4PCz8mqum1IJ3l9sLM+YBer
         JtcjNGUfXOMswNneHegx8XTmd50TPsfafiNsnjJbcmA88d1BMiLT5qj6ZNZ6/Tj8MKEX
         qWkAY34GNwpf00PZ7o+pif4txVaHm1OiGTGWlGRU1GwueuE/AfYcJrtXTpaB6ol3soqR
         uyQwU4p3S/LMIaxPIbNMi8wA4auxpy8TVNCh4ot7N5cOb+z70AoEsNcnkBlqdpcA3Tza
         PdLw==
X-Forwarded-Encrypted: i=1; AKwUvBy5VuqThPOn4ELWsChfL7SEBr17woAdQxMvUdePTBE2ItupoKIYGSeIKvkOzcZmWkeJtXTo7eLV7Ch9yLA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJsSRBBoqg5qSDWQwsmioFz6gHAbQWLrFSVqafpw0PiKJ+45jxZ
	t8ti9pZuCDoA86L34iGecJpq33ftnfB+7dz19zpx8bIpM2lkg17mzEB0WI6e9nZwQeVgJgPOAHM
	vxW/MWysCTmiHnt1n1HDrl4JjP4EOJcI=
X-Gm-Gg: AYBFou1WqppKRCsgQ1vDwxIcCYCr4O8ALexGoV/AuVyVBnYMGAE4PKw/O9BchoWMws5
	Ro8tbab5Vb2X++fx/uiSPZaNbPjBvYvkJAnQ2esqline/cKaX3G9GbpIwB4Kz4H01ibax3K9n/4
	t70AWbVn57u1Suxmy1k9h9ps62WZLSEnv86nxwxb8IfxgmAYG+QBtnJOrUtGL5RKMn5Ha80Ji73
	4zCBcMmvA7gD0GlZLV3N2Uy080tvf55vE71kzPZGoc2+TNjtXjT03oVkUym4Gwi0Uwzr7pvMjmP
	cr7xCVlDBXF3IV+2CcoHoTCR1TlfzPQ3+oT4dOaPdQ4tLAceb+Z0LD1RAbQsVvKp9VT4uKv7WuI
	ZO/H9ivXmOtNJ
X-Received: by 2002:a05:7300:de49:b0:35b:b3fa:40f7 with SMTP id
 5a478bee46e88-35bb3fa4218mr5269925eec.38.1791917826305; Tue, 13 Oct 2026
 11:57:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013184755.530392-1-clamor95@gmail.com> <ebfcdeef-d0dd-4c4a-87bf-4ef3fd505b5f@sirena.org.uk>
 <CAPVz0n2ZY1L=kwSkjLeTYNvDA2Gf0Oenetj8hK13g6+qf_xnaA@mail.gmail.com> <964527c4-0105-4bee-8fd2-a9020981b02f@sirena.org.uk>
In-Reply-To: <964527c4-0105-4bee-8fd2-a9020981b02f@sirena.org.uk>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 13 Oct 2026 21:56:54 +0300
X-Gm-Features: AclHuK_S0QaqCFW5w4Kb_wTSLK_O9WStPmy1OozO53A1PmbZln0ct4QN1H7jeQg
Message-ID: <CAPVz0n1YdOHG70_ynqL0V1Q3=38USHCbCQc9EBzHAmrNb4eQnQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/2 RESEND] ASoC: codecs: Add support for Fortemedia
 FM34NE DSP
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 13 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 21:5=
5 Mark Brown <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Oct 13, 2026 at 09:51:56PM +0300, Svyatoslav Ryhel wrote:
> > =D0=B2=D1=82, 13 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
21:49 Mark Brown <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > > On Tue, Oct 13, 2026 at 09:47:51PM +0300, Svyatoslav Ryhel wrote:
>
> > > > The Fortemedia FM34NE is digital sound processing chip used for
> > > > active noise suppression mainly on ASUS Transformers.
>
> > > > Resending since previous attempt seems to be malformed.
>
> > > Please send a new version if you have rebased, tooling gets very
> > > confused about which v1 it's talking about.
>
> > I have not rebased, it seems that format-patch malformed first
> > iteration. Both patchsets are made from the same commits with same
> > hash.
>
> That sounds like a rebase to me, and in any case the same issue is going
> to apply - if you are not sending *identical* patches the tooling will
> get confused about what version it's looking at.

Noted, thanks.
