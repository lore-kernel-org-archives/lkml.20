Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792865169;
	b=k9XbvgvEmOOlkB8BksILI/asR1QLdJhEzhESIfbZmP0hHVEnKXSse1VnThdubnbroeeC
	 Q32InJJuCi66jzYnsYPb9bL0E6epJxWxnJX34q/DQ7WqQtpvtKbbSw45NT3dAqgxvsLse
	 v04n1esnDi3Eamy9YxZ9Bh/uXIgpk+fBgVg9r/MdEZEh97UA7YB2mVWZcWKjTFOX1wR6n
	 y1jnfgh7+OJMWVwL0eKd0t+eryrSK6qA84DMwzLvOLoaBnqyEIKcw4a3gGWzlozSwMVxR
	 ow9GsbKrKKhg4CtV8JKZak4yB5aBYdlMF+VWi8WYTF2+pEBpL4huDfoCxLPYTyYVxKg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792865169;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lPG44ydHfbZv48mg+W6n0PmTi2ySUzCmeSRTbHzbT3k=;
	b=colDb/2LrNIOq3XtmClVvmo1/EfmLtkT+J8bp5kmCKPdnb/7Fs8lQbbBvgBbVWBRN9L0
	 ZIBhUGSGJXjgCEbhZ0YPnQpGMrfVZMOxSaJGqSL4BSWYSV9pCW1xnpYZjgIrHwg8PPPtP
	 WLDq4H2OybTgdWL1PMVpq24tF/n2qvABtHT/6E68ikga6AQx4hM6wEekBzkicWv6RbwPc
	 WeG8Jg6rj0vmeOOcMklNkA2C5KIPRIlJOZn9E69rEhZTBVLij+UAR/IWYKoSk/ETuRuxE
	 BFPmQHsow1lrynsDKQsnDMl5/RfGdUrXqT0RohCxkFkiCGvyl35rwNbOBI578hF24Cg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hJyH0Pvu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4788606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 18:06:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4788606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hJyH0Pvu
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c2afa22e1dcso244816866b.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 11:06:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792865167; cv=none;
        d=google.com; s=arc-20260327;
        b=CVPtIjl3/EYp9XLtDO1p/1Zt0KOgB40pGgMrtcRdWRoIW/cZLE8FSFN6Lg9f3a0QRW
         p/nqgu9K/i1mDycM1qj6+cjIic8UTUH72AG7e57I4KHzGBEnVqgdouiZTA7ynn1SAC0s
         L4iPJnhYj5WcmMcIoO0wQCV6YRYdnu00k6X2fVvH6Xw2ZrLpuPNqwKWw/oFVm8cepai2
         ZfO+xU3JygmtS81ySHGrNEp8BTWJkVZhrF3ULhVichVlHKtvg3R4p+49LNqQFM0ZFy8o
         yQeGahAhih011tupG+5pddAJsxjmBv5mLZvCKBo3+gwLeXuJqbnFD77bObvogoxsnlcH
         poww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lPG44ydHfbZv48mg+W6n0PmTi2ySUzCmeSRTbHzbT3k=;
        fh=D9TQYc/UeLhnpyNdD2mOXadRXPnKkJr5lymOvi6jsas=;
        b=SbLKQJxON4BiHUC8ZzcO+lKKwif/Llw4tNVFaSmmqXtYGYEdu1DXCKIoja/GhOyL7Y
         P2tR0AiNADHI7bBSUtAg4btoCaffXxxSv8Xl4wquBGFhcRa9Z2YK3k4Diagm8tDvhC5X
         nINSq942qGZq8pKyRzLTPZKZraXyrIF7Qmtb/Zlv4/kbcuw9x7+WNGTOIz1RmlHr15p6
         kqxtT5donzdmmmaLpFD1qXYR/L9/9dzVXHaiBqi10ZmXsqtBdjh5N9CEZuNnX76tzSP8
         VsC3rZFJ3YMaQRm8BVAnAA+QoBojGpKZioEWpxlN6yV2nkp9mUIRgLd816LpwnrHstM4
         BrpQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792865167; x=1793469967; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lPG44ydHfbZv48mg+W6n0PmTi2ySUzCmeSRTbHzbT3k=;
        b=hJyH0PvugVb7vJNbOSoFSxa6zVPMprVBIUroubynC1lIsGBcHVYPmYXpKw9GJoaTJb
         g847IYIRZ/pK0cA7eYB69sD5X45yHth7cFTNFYMF2JM2zOQ019bLsbhwuL4gl5TJcPMY
         x4FSpwugGRe6ubcc+x6Toe45ev5Lc7N4n7QdbJWt1RrKyC5Fvf2EP3MDDoyDI57xCFwA
         UV5joMBqyHXnnlBrUyBoAMF97kQv+iYCK94YJnm+4LlAofRAUesdapcWJ7NAX5qB7L3E
         0n9o22HF72igY+teSD7fAxBSGcL1UM0XwTEFbev0a7xV2QAcPIbzL2Uo50V4FicGysab
         6qDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792865167; x=1793469967;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lPG44ydHfbZv48mg+W6n0PmTi2ySUzCmeSRTbHzbT3k=;
        b=M/4ihSy6zEzGgmeKafpRR3P3FBv2raV6cdzLPNtcwHn/HWjYfLiawEL4R/ZjD/804R
         CiNObEnLDrfUJZwr+NR3nGistlCf+rKyfY5HEh8Hkf18CuGH2L4+lOnvOg1y+yo928TZ
         fLvyzGmx6s17cq3kCbcb1Tdm/K8df5J7cyHINDHvQf2AhILH7adctYVSChCuq2h/wphQ
         mkkqw/dPpscQUcuAUkWlsxI3fnTd0Y3PQ/2aSx2UgaXjp69rlFNo/ryQxEaFAy/L5Ven
         uOoJWcdOaOy6/09roVwcG9zcdA0kSEBftUnNsWfp8w569gkyqwxXxtxJLOMatUUSMHSJ
         FOBw==
X-Forwarded-Encrypted: i=1; AKwUvBzx38NTzan78340WxMMEraY5ATJt/2SE1KZg9ActU7C1jVunx1xFuuZ28jQisj2dy9QoNe7Eosoakbfwrg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPuwAy2a4J5k2EDThEDNzm3PntITtdY5i2yKl1VU8ZCMXGF2b/
	my6o9A7PiwbJrPKgpI9ZXQGUgzx+dVntMgs+YOTsCpLYSMa8bncuHIr1Qg5+FIKTPsBoh6nlmGb
	AcRXzcjA/PrsT4q89JtydqBVdDrKN+8zKbhywB+7u+xs9
X-Gm-Gg: AYBFou2ESolp9wa8huSraS7VweA3Z8LVQ/ItmMW1YBMCA3V2ssHNv696uBKxbFp2w5J
	Y91jh2stLv8QXmvnWjvBitD6Cj+HRY3YACKdG09SgJzR++V3QJ39ZIyJby/VAjA4w9jR4bsetxA
	pORacrBGYSi23Ha9WBjikFkwDeFwpsa+lGrLmQi9AILt9BhvsGiSbIvvwq/8DQAdXiXRXPr9Kkd
	VK4ED/l4dbvC4P4k7SI8d9JT5cGWJ+JmtJbDsDWmAr440Okc4LON0ArQ3+Z6BXw9KGceSCQecVB
	y5jc8WUjycI6TbKE9VDWx25DtAEYXp0aViOjXHh9H43X7SDIZRvdHcARbSGWSXGdLqBKXODSOgE
	avdE8yB0GYm91pQCtRN0Iz0/uID59gto9EbFG7tDG1koB13yPyR3Ljc+MUv4oYpVOOsjt17bOyq
	Rc4BlWBONPD0CZfVDCFzvm
X-Received: by 2002:a17:907:3da0:b0:c3f:98d4:dfe2 with SMTP id
 a640c23a62f3a-c46bde25765mr313652666b.18.1792865166843; Sat, 24 Oct 2026
 11:06:06 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016025352.230535-1-meatuni001@gmail.com> <29c3e4a2-9d6a-60cf-d06d-85152a40a703@linux.intel.com>
 <CADqcGBkV4iE_0j6usv6TvV3K9XGUa0L9J-ebUkTLsB0NBYzTHA@mail.gmail.com>
 <a905f45d-aec8-569f-d5bc-718896f7c9c9@linux.intel.com> <273be4cc-ad7d-cdcd-de25-8d1439bed3e3@linux.intel.com>
In-Reply-To: <273be4cc-ad7d-cdcd-de25-8d1439bed3e3@linux.intel.com>
From: Muhammad Bilal <meatuni001@gmail.com>
Date: Sat, 24 Oct 2026 23:05:54 +0500
X-Gm-Features: AclHuK8PFwnTEGocukzPDuOlDq-fzoGEr02g0x88KN8IXdmfzdiI_JHU5c7rfq4
Message-ID: <CADqcGB=z3_mQ77Wk3E9tWMYyCaQ2hCno99kgPKH8ZrP9EFKY5Q@mail.gmail.com>
Subject: Re: [PATCH v6] platform/x86: hp-bioscfg: fix heap OOB in hp_enforce_single_line_input()
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Jorge Lopez <jorge.lopez2@hp.com>, Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy, Ilpo,

Thanks for the review. I switched to strnchrnul() as Andy suggested and
posted v7:
https://lore.kernel.org/all/20261024172641.19424-1-meatuni001@gmail.com/

Thanks
Muhammad

On Wed, Oct 21, 2026 at 2:41=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Wed, 21 Oct 2026, Ilpo J=C3=A4rvinen wrote:
>
> > On Wed, 21 Oct 2026, Muhammad Bilal wrote:
> >
> > > Hi Ilpo,
> > >
> > > > Why use n variant?
> > > strnlen() keeps the read within count, which is the size of buf as fa=
r
> > > as this helper knows, so it does not depend on the caller NUL
> > > terminating the buffer. Both current callers pass a kstrdup() copy, s=
o
> > > strlen() works too. I can switch to it in v7 if you prefer.
> >
> > As the contract here is the input must be a string, I don't see any nee=
d
> > to limit the length with n variant so I do prefer strlen(). Also, we kn=
ow
> > that it should not be longer than count anyway.
>
> I only now notice Andy's comments which seem better suggestion in general=
.
>
> --
>  i.
