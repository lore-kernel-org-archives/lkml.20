Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3934739EB5B
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791801741; cv=pass; b=NKRHqtn6Yiox3Um7oPh5UrT10gdeR4XFYJpGFqNtxgzQJQT7lu69qCIWdImWX/BuRZ2qonV6lTGsUvqLLgyLYWdqMRAID2RY1mdxzeSsJxu8UZITtd3vxyyO8rNRbfcxzEGVKpujlNs63KW4wrmWEsd9XhS2PJuZXg7HQB0TWjY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791801741; c=relaxed/simple;
	bh=yD/LRzCXLzuKvkdgwfHxZGIonOOMzZ6oGk+zvJrPiw0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FQRuBceELwUyBG6QD/iccAFbXPfC8e82LLP3wb4yDrvLTQruMrFQvdESv7UI2D3JKZAat53it1C9ZMvqUMjIt5BLL8GHWJrkxtbX53HUoZe5H4JtxC227HDWHfrENHZaYqXwkKGaBXdp0v5Ienkp8VuVeCFuWaNXwdScFA8lIAg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sWkMfz7v; arc=pass smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sWkMfz7v"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3a629a806d9so14610141fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:42:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791801738; cv=none;
        d=google.com; s=arc-20260327;
        b=YPcg9GqYaezn8wPNgBpYXi1nahuLFdZcAcif/L+LuErZk4751JBEnBuahG74a/xTGY
         Jix0GXg3mInX25zZYI9eitjZI8RgbZWgoSpytzpNp9toyuK6c/+n4VAHEdtoHxzugU/R
         KRoZGloAyb+Av8qq7j0NbW1RNwvSCUgu8GhKksS4fGiCWcR6uxqEFLx4dpA8TfIV6RIR
         UDIJZKEap3zMe82ZYRFj0hv2GfjTkOVxvi+pJIQMTk7mN4LMGv++DR84E9lPQpnUPzRA
         aQGdLDjGJHVRDVkHTXNOUKUsd1RQfqF172K+DhY5tNoINHlUfrFj+hGio1Sbi8s/URq7
         ZhtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yD/LRzCXLzuKvkdgwfHxZGIonOOMzZ6oGk+zvJrPiw0=;
        fh=1SoacYXj88LbXL7W7JUatx79hPqd1yJjTGOBozIjq44=;
        b=lgtZA1u/8e22c3rHsHtwoWWPA+rlbbLtIs4dCgX6A6NzB1bRH0DgxaW2zJhsPd+QBI
         JjO++GuHkK4vhX00R9vgM6lOpk73RTo9MqbWYON/66hwbYrZw+t7Bw6YE3uVANZdjDXv
         XiCqCYMKMeVWMYy4afZ3Uk1rNdz2dbbsRAzRA44pIjXjFr12JpOWZrj8YfjsG3u4dBC/
         RwaQcbedvbK/4eXGyyJ7xbSTjXYCQncfnjcP/QWAtEeDyv6UjdLs4qYMWMMLT08/o38X
         qFN8U4OOp+DFZjg2WeYYFDNDqXHLVEcToa7DAGxKg/HUQSONW8Xai8molHhoQ806wztE
         Km1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791801738; x=1792406538; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yD/LRzCXLzuKvkdgwfHxZGIonOOMzZ6oGk+zvJrPiw0=;
        b=sWkMfz7v7Wmk6ePfO+89U8YECUtKBAx85SrCB3cfOPVGIHWpxqjB9R+ygotYoJ8zYD
         wJg3hPO9qM+A8vdqRaNdtYevsErTBNUCy/uAdNoJvewbtSgKFBMrZM7Mw+gAX7RjwKcW
         rXpRHGt3tMmp1iJ9X9jDWv0uua/o7sscntmrLh7/6HQFUUemooXCqnpbjB8h8QroiyKF
         SFhI/XrE6f3uZyTfk6tBiaPFrhoRbftCn8WNtqfV7OB+QD8rboti9BanAXVwsKvLVdqX
         22aqFLDprwuOSHylBeClZdFO36Z25fAC1qqPnFPTm0IN5EU5O7jMWoLdPBfP4gycep/+
         rKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791801738; x=1792406538;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yD/LRzCXLzuKvkdgwfHxZGIonOOMzZ6oGk+zvJrPiw0=;
        b=RT0f4MzhXO/B2Xz77wPBWqwDmkxCncm9rj4ap718dayhGGAJjTbS8vPmEQbzKz32Xt
         JNwq0wj2Fxz5hl/OXkftsn30M6j/lpMax4QXcSJBt7ElPaPoguS+TrbI1gFo2FyCaMof
         QhPJSV2KREkDbitnhzEUypjEVU88o/iSQGlXTfXdAOSOMbafNz5f1s4uwk5tbCnv9zOc
         z85F8gRhE022RhUHqrieW+UuqL4fnurTrLWTXa5kS8f1K240unNnzv+/wD55eU0hAv6p
         LkonAGtkJfQdZFs2KdBexIk/7s4Wo2koVobA1K5EngvQQ0Sjdw2dfLKu9PuZVGSIv3fa
         cQ8A==
X-Forwarded-Encrypted: i=1; AKwUvByWA+yfZ8ao1ikLSrXYTmNj7OCw4ip8fda8llqj+UzQ/3cfx02RiYRMOHaxUB6Ydqx7+RiVeMUn0QRf1nI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHzUoKeluvr11Fhq/2/BucU46G3aZWaUCnbXzvn6ZnyNsdJ2f6
	cfd9Nq6VhwIAsk8UeZsC4vmTVRnjzn2MF9LN3jTAVWLtRt6LI6pIcAm2GBp8OWn/b1ahUJHnzNf
	1BbbxZ8ec3PKW4EZ1DUy4yyDs1oYWxzI=
X-Gm-Gg: AYBFou3f+RkNThhlRkCT0tvp6iuGQs8XO0C/LruGEqkHHglKsuc3Z+KzVBISZTAes9v
	027NQXpDJsdVciSJNpwU9rPAl89DU6SLLXND2xlhmJWushCeDVwxDLOKFgFfMBs2PzV7yWcM6MV
	Yd0fDAEEn+ePsWtJfpk72Fw+AWV8uyRalVE+21i+NlMVT/gvc1yDdwIcsSwxAjQlu3vuPmNW7BH
	XFHiCoBXE55mjHe1VWuJ7INqYhgMJmosPevEuXfERMOU/H/y8B08Qz/PmasfoCVQKQrNo8/hsDD
	9dCeJZdRAdflcbZ/ntGOuzo20ZHxUUBt5SecZy16Ftp20kmOcHZ8yrBR0Bgo/9UiMd3qDLBPSwk
	zTHuHGhLNmjCJoUQnD9rb6jCcTpQzf3fkgmO/WbyQq/o3ZWsZ95sN8jA4s7dFmHJ1YBshruNbx8
	bO2xtLuuFbPwb2kegC1VoxufhtiJCyorrGZJMiHC5mCA==
X-Received: by 2002:a05:651c:b27:b0:3a9:9b67:25f7 with SMTP id
 38308e7fff4ca-3a9c53b0b19mr23170161fa.4.1791801738046; Mon, 12 Oct 2026
 03:42:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com>
 <20261011-gpio-mxc-cleanup-v6-9-cb47ce2ad758@nxp.com> <CAHp75VcktnQVpqLADs5AccUj6U7KLjAatPaSzMX8SXDrbbs6Ng@mail.gmail.com>
 <asyyLJ3nOUxJ8TKq@shlinux89>
In-Reply-To: <asyyLJ3nOUxJ8TKq@shlinux89>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 13:41:40 +0300
X-Gm-Features: AclHuK-RRzScLhztBzLfy8Jh6NTaM_vTOn9ggo9DZdIceERnpI8cnWgRhuFuAK0
Message-ID: <CAHp75VeRG01p06vT-8-a=VsFj5PKRFH-jUNi6jeerJrHfshHjQ@mail.gmail.com>
Subject: Re: [PATCH v6 09/13] gpio: mxc: use cleanup guard for
 pm_runtime_get_noresume() balance
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 1:06=E2=80=AFPM Peng Fan <peng.fan@oss.nxp.com> wro=
te:
> On Mon, Oct 12, 2026 at 12:38:37PM +0300, Andy Shevchenko wrote:
> >On Sun, Oct 11, 2026 at 2:54=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp=
.com> wrote:


...

> >> +DEFINE_FREE(pm_runtime_put_noidle, struct device *, if (_T) pm_runtim=
e_put_noidle(_T))
> >
> >Please, split this to a separate patch and move it directly to pm_runtim=
e.h.
>
> Frank raised same suggestion in V5.
>
> I tend to avoid introducing cross-subsystem dependency and use a follow-u=
p
> patch to move it to pm_runtime.h

Alternatively you may not use it, just carefully put a goto:s and error lab=
els.

> But since you both vote for pm_runtime.h, let me separate it in V7.

Also think about splitting the series to three. Do not rush! It anyway
missed v7.4 (except, perhaps, the first fixes part).

--=20
With Best Regards,
Andy Shevchenko
