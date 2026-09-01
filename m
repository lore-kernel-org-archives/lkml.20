Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97AD4A386A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 20:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788294991; cv=pass; b=BjsUqeYWAesiHXhhXoQxtTMDoPWA67YH5lj/9Vqv/2UGSagdY6QsTOnDrnloapwLz/rjvK8+xJWTszS8GyAInkvfoYQfqMoTrhWQtpaNcZq2AWfLIBpStMkB5ASIAjfwLBsfXdx67FKhXqU1Bo4x6GqkoboP02YxyF+1X8ovCww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788294991; c=relaxed/simple;
	bh=HdDGW1g39cCl6eGOp/7kmX7YZgzSXGwniWQDRTw+uXI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jyXsc9JV5v1nFTA08Sgv6JATxaDypSmbWtL2SSXP3I4qJJ/ExPd5XdKNTs04ra13OoeO2ZZIe6+EHdQbeYkAv1grXLuW5z193Z8G8gV2HRdKzfbOP6oEHZt4XsbEr4at1oDSmHgzU1PaSZwDVpgop7GyJx+IBVDa0LHEEpLL9Lo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LcgLPumx; arc=pass smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LcgLPumx"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-484362f5c4aso307807f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 13:36:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788294988; cv=none;
        d=google.com; s=arc-20260327;
        b=sQkmvOWimqM09XdKUA0AAHMQIV1KGo/GuOpbIa29b3zXqb2iZnUam8Xo7Q3t8D0nxw
         jyTgQZfwhkeEB/m6lFley9eGLSG4e4tzTOgOpwaxX3o/XIF9BE0CRwPae+QOHQkcgyFF
         qNqUofuz27lROQeTxDnWrkHtfU1zG6FFhiFon9zRMlYyOzi/FdSDFw3tGI6q5mEqJqgT
         05OSsjGhGQ8mi9LJMWKRMWuyQO85f5FtvebrxeED1zYOwmVkSGfzHv2SawmYCQXnGFM5
         mzTcij0R8GVPxBh1lAyd6Pm/A+RL9QbUmDNvMdnF9+ShB6bd1UW/h5xuPvSnKXj7FQri
         nH8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HdDGW1g39cCl6eGOp/7kmX7YZgzSXGwniWQDRTw+uXI=;
        fh=4eC0dL5kp77aB0CJReAJHvEXkT8Ea70RY3cln90/t5I=;
        b=dji8c2anat0lFOs02corj6epQtAiw0SPO8zH73GrduRQ47Eevma+esLmulMjSH5EPx
         XpYWtr7FcF1Co852FXx2hbBUF26bL2T3MCJgt05/q72idOFNLva5DZC4ypoQPfqfHpp8
         JlAZnyMJPpFRX2wcpnM6YPwz2lFadXFoj9xMAtS61Www9upyENkoz+uHvDh9//7DRgKU
         xIIFHGNZB3FtDuhPgdF7Hs2hy40cBVAtfhIopHQM3LAbbizftdgOBEDSZzVPEjcPObhf
         QKwgigRCM/ozNAgps+hnUiG27Tfxhoi7cVHz0NSb4DlLrDcZTGGYOuv0PSZdsd23t+g9
         DdIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788294988; x=1788899788; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HdDGW1g39cCl6eGOp/7kmX7YZgzSXGwniWQDRTw+uXI=;
        b=LcgLPumxXUCU3LWs4oRI2gkX95yDO9pKpGigrUnGgcxWrh/9hnc496ZzNZZmPdt+WA
         BMwQgMBuN97GIWU1WAnp44Hl5Tcg9WrwBh5cSUcozA8/kko8FnJJ9e7EKlz9MWW0UAMB
         CItw7E2GKzqhi3DE9MFfmxAOeHFR4yKI/6VX54hVg4dXwlCnW5TEMyS1z0w7uhgzyKye
         RcbCG8oh0qhqiuBUXd7nO1+q9EKI5+qO8IhBeYIO0beidmNlpEUBnZ4ynrVBm8q3TYTe
         WNILaGmBLjRxINRQ3cU5yZgVOJkx6d1To/TX0iz59cXw/oddxeU4oZhNtWRBVM/bLNKT
         l71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788294988; x=1788899788;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HdDGW1g39cCl6eGOp/7kmX7YZgzSXGwniWQDRTw+uXI=;
        b=hlCSMc9zgs02iElalecPXla/Hm5aa7FlX6cwWki8K3NHAWiWDtcQCZDJJxWsUiNGLB
         rHDvipbDJyAJMDuv2ti0ann795s05kzkpXlLrJtszKUHQnhkUj5gZmPHX2dNhkcnfrBd
         Hckcq8RzTJtMPVWzHb/2bxH2v/LGOnIyQWlqR7Juh6jZYIsxfeDUEYCg8otvcbLm+OvB
         59lJeeMLuHleN3HR0ka8ZRzrOiftBFF2NiUDljypvMSP0Qd4vUywSxUNJqQWx8uSXFTy
         F/KMCaAcR2pFusmbywFE0edCihhwU97awGcjd9+IWoB6vhmx1Zr4DokPrAhOUi02r+Wu
         Ev7g==
X-Forwarded-Encrypted: i=1; AKwUvBxmG+pbkJizi3I9F8Lde1+pWQc1e5dB7WGWa39ZlR2SAZ4kqhHvv3YQcez5X/ewZguU5aukJ358xbGrZy8=@vger.kernel.org
X-Gm-Message-State: AFuF++mwqHKz5U2kt9OXmL6qxNVhDDafgXH2YNpYojCBRu/XrGn3y1lZ
	U0fivBRnqlAqr2BX4YTgHFJjTNWn8eEBH7R1PeXtCrC1Wa7JT1OtbBUeqEtA4MlllwOOKymIyPq
	VYMjhQoHvpcKJlZbMZEO3nWcN0UxLAZ/xP52mbQk/
X-Gm-Gg: AYBFou3zTqm7PxQlxg2kZEfmcayvAvOQsRZp9hqUSOeNMrwHRtsJSrY6uXP3jpxBVrW
	CqCm9oMThXof0Hnx6CYS16b7sMTAS5Ng+PhFjeVjdjQJlw7+s1dGkGnHSNmbpuUn92fBMRKxt9v
	nV10V7jbi+DYiPrjwyuROTq4QMH0Kq0gGQESjdJd76KZyWIIj29PYB3g6+ZZxYJZRRLXTfl8GYO
	wHL+RwsRO0rMdQNOzqnOEZ1zTxdkhDe3MVA1pAQN81x9Nkqy5H+J5c5hKrfuFKFCOmte4pPOe/h
	xdOHAGqkOHACJqPb9raOeaqClHyBHfYl4Ctf4HyLnrnV+Bwqvx8T/zg6XXNKrSKtsdGyCgDJs/o
	bKwSo3FAo71kcQfQFVyBS6K3gFCkSjQtIucLNvm8AfN+E1taTORnjWyQ=
X-Received: by 2002:a05:6000:4910:b0:482:f61c:7cdd with SMTP id
 ffacd0b85a97d-48488df9e0dmr42483f8f.4.1788294987371; Tue, 01 Sep 2026
 13:36:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260718111340.159896-1-linux@yoavmoshe.com> <20260827194508.446733-1-linux@yoavmoshe.com>
 <CAKwvOdkSZBbq=e916=efx8G-CTzZ5b31AhyUytO6eJjjkEdMow@mail.gmail.com>
 <CABCJKuc0cWWdkA7zrCcuze4AE-qTSETuUi-eRewPnn_ivHEADQ@mail.gmail.com>
 <CAKwvOdnA7Ej_uppSL7U2xwxyUQoDMvO+RArj4HCUSOziH0rCqA@mail.gmail.com>
 <CABCJKuezb0HtOcMBsObczS=HBaRvMszagkOZGHyOVbXBqtJi5g@mail.gmail.com>
 <2bd0c842-d0cb-4ad7-b3a3-fed2000dea83@yoavmoshe.com> <CABCJKudb5RegHcNPkXG5p1TcCFAe5_8+hqBP-2GyHVK19oB94g@mail.gmail.com>
In-Reply-To: <CABCJKudb5RegHcNPkXG5p1TcCFAe5_8+hqBP-2GyHVK19oB94g@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 1 Sep 2026 13:36:15 -0700
X-Gm-Features: AcwNN1XLVY2qNNwpmvPqR9vii35HawK0FLdCW7a8C92cPutToPYaUpHoOUGoDJI
Message-ID: <CAKwvOd=OLLO5AXiR54o0nU16e_pTDt_yiEPQ0GgnX8DRGJXYmw@mail.gmail.com>
Subject: Re: [PATCH v4] ARM: imx: Fix suspend/resume crash with Clang CFI
To: Sami Tolvanen <samitolvanen@google.com>, "Yo'av Moshe" <linux@yoavmoshe.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Russell King <linux@armlinux.org.uk>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 12:46=E2=80=AFPM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> On Sun, Aug 30, 2026 at 9:24=E2=80=AFAM Yo'av Moshe <linux@yoavmoshe.com>=
 wrote:
> >
> > The sashiko-bot's comment on v5 indeed pointed out that imx5, at91 and
> > omap1 might suffer from the same bug: their suspend routines are also
> > fncpy()'d into SRAM without a type hash and called indirectly. They're
> > all ARM, so asm/linkage.h still seems like the right place for the
> > macro.
> >
> > Do you think these need to be fixed as part of this patch, or as
> > follow-ups? I only have my one imx6 device (a Kobo Clara HD), so I'm no=
t
> > sure how to test the fixes for the others.
>
> I think separate patches for the others should be fine.

Without devices in hand to test on, I'd be hesitant to claim 100%
confidence. Maybe reach out to the MAINTAINERS of those, and see if
they have cycles to help test potential patches, before
writing/sending patches that potentially don't get tested?

--=20
Thanks,
~Nick Desaulniers
