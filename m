Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792614494;
	b=xzsqVmNN2j1GSjQCbawGpJ93p2IbMIT2ZkNz0vQIgSlrAPoMLVc7YY5IvBnClASyienC
	 fJirATHMYjpiI5/qtBIgp6FnKE8BZ83g8yQs6AzonP/oS2FtvlcQhm3htYAPpF972Vdwe
	 ue2qrkf7Dklf7sU/ghHlDHWoOQ9UUMs5lBma7KgbH0sRJ+XDXAV/3pMOC3Q+Y6VbumCXF
	 Iit3yOXO83W9ub+nYPcM0Il+LoGNYRYfiAA6cJEYySXAAz1Ay8a6MfaeouxiIFcJEybzF
	 VHgMkxF65pRddrGMRBiPdWLvcVgq7SjhknDE2aRCziYHdKOYEJF1yYKmgkpywv2xigA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792614494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0puJpnNmDvGtBriXSLRhq4RtO307HXFeqwawArp0hCM=;
	b=yIGeYmOc/N9Hj9RQjHj3EFJ9oNccA64XwI8ec1yWFkd3pWfEIlDtP/dmg1QBYppQXwhq
	 CGBqL8N1liS3ZtInQ7sqI/ZlAARJyh/GEjSex5jf3UHh4I3xfxBpenq5kqH9L0+niycqb
	 IdFJP93tdZQoHtX+QfwDStsxcTugvPUprWTxe+RGOO50//n6sQcexh3cotJsYyg/lxJ5+
	 MV7UIPMePwr4LzQz7AVNZjBRNReP3d8jARDw9XIcko5iefkQ7haWkNljOM8jngEIhjnXE
	 qXjz8DuBsI9H04g7B2kuMiWNCgCQPnAmLFZ5oWioXZhm1oOb/WcihR/8ucmpygww+gg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=URXmPl2z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6664606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:28:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6664606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=URXmPl2z
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b1d8944cb0so1765667a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:28:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792614492; cv=none;
        d=google.com; s=arc-20260327;
        b=i8Nzor/N9hN6WyeVGa2K4W8PNFYuynZKBOTlvP6Gk17c7kpFJpAmP38680KUOieQQl
         ENMCRZBzW7EQUoUq/0xtbIj/jVNB2sLzUsKBMNJoqMLC77PgKpCl4/ekVnco+BxCh4h7
         OQ5pde9OG8rNAzSlt/dI52RzSare2uA1g+BDtDYwPYvyV2C3FrXfaMpXyryCRklaMUi6
         OKgslmvP9LYIIR3P0Maes/wFFWsnT6BKRqZ/yMvqTnfoOQklkxJ8d8j6+cEIexxL3BlB
         F2UAIL7Z729ZoLPK7J7sHztDbty5oGjvXLKBV/ig3vMb7FSL1aCgkd71x3sWWeSlBMrk
         dnoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0puJpnNmDvGtBriXSLRhq4RtO307HXFeqwawArp0hCM=;
        fh=yTmROFx6o06w+1NinBcIOUSq+mz99tQUROSH4K/CYRo=;
        b=eJXXVbVprHYCDlGNVlAEypY2SSOkKe5OJQ6OuykvpE29sM9IX09Ah2UyJ50VSMAHpu
         UYPIw44P8trUP+WUKSuOxgrobD1uY5pIc7wbWfe2MgFDr0C6+sHFB1pkiLS2zTcFXPq1
         7jkubomv0ze45vERFPaKwDYLWPVuqdc2pDBMBoJi7DFDZwapwhzkplRW2dUekdwH4fVF
         qY2zLaRo3BkNl5iTQ4DZBAa8weGvZuXQe+MZZ+hIaDBerzHwnCmlradNEX/qQqiWDuQX
         C5jwo5sdmb53X75MW3rRVGDDqcjGjnjMaojDrFhPC14egOI+pt3dPIYtQrbeq+oxQIpX
         aYfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792614492; x=1793219292; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0puJpnNmDvGtBriXSLRhq4RtO307HXFeqwawArp0hCM=;
        b=URXmPl2zu5AaaNBg5ooC/iK7NTyySYtNXsaKySb9/H4Qw9911yJ2jwmHAn7350jJg/
         a2eSFgcfyZdyJRR5KOa/C7d9K5YOCA1vn4EMJYxfrubzWly4MIamaeyZZqOsJhQ5na1n
         ifR7aLm1Mq89DwJhJHOa6AjfRjuV2xrDd2m3O7Q5tIYD2xWa3PnAw3rIMmro6/CZC/sb
         cgeTRHoT8dsscKPO69TKUfMAo+skotHEBliFKK+PfOpdLRT6I6Yz/qPr9lRHyQrnsplp
         75gkO34utiegY/F2CYlPwaXxPgSki0RAvGQUTb1aS+ql1Fo0q0HYeRoSqdnVnAEZ1yD0
         PFpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792614492; x=1793219292;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0puJpnNmDvGtBriXSLRhq4RtO307HXFeqwawArp0hCM=;
        b=Tc20+vp51KO1ruaI2mkx3twgtezi7leE6oZWKZWil40G48bjYYlqbag273oUVWY3av
         tXOkscnZXM1xlL6lvYTK8M0QGn58bnsS7URGpswaWMa8do725n7VtDbh3NCvYhATiP/A
         z0cRvZYOJJkEoiLLE2+D9zFOqpwpYfNPlAA8kxK6EkNFNZTqVLdMeseq5zGMNL4y33ce
         p4S+U4gd8hafSDyYS0VeRlwfI92dWUpXRlzm8FLyvlYeg0s8cBVL1Hvg20u8hDS35ByK
         ZZSjZa6mntXpAZJm2wLwBDvb9PvOJs9oH3jG2Rmh/lbqlMTGq6Bs6VJbTFzoTT9m/1no
         zEdw==
X-Forwarded-Encrypted: i=1; AKwUvBzmherPt0sjYpIrWfGlyY5y2S648wh7B4kIlkrMkcm0qOw5TbJDyuUvu0XaXolFBdVimy5mD7PxlpxzGOc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKb8Q2jZmz5Zghf7TQj857YvQgY0H3m4bubCkOeY7cYekNp/VnL
	K88izB6H05DilykS1NlR728i3dRdf7aJBIHn4WV+3JFB0HNQNqWdetJvK6Lkz/T1BYZI8BMqjko
	AAdwysRMLJwDTX1ej+eF4Fzsu8krudMo=
X-Gm-Gg: AYBFou3NFb0i3VdOqbGWUIjB2E9aWOmkqccQCZxy1cADG0zniD1oOOZTy/C68Eu8et/
	eoPSbN+yBjoPjdQ3kvAWvSWw905Tl9bQs5ivVVmVHzQzpAX6e/ltuW1VHIIbN0L6CWDbol5KKGS
	uYGYToXOXNNgwAVTAYy0yiM+kPxCzbiHSOjHQERXuBPCV/+0U+ksveO6vogrEvBs3KQKqK7K5lz
	rhzbmPMUOe7WJ9mQisleLWTpEJhHQYSmRWxUpnqDJrqYLjozBSqHySoyumthgloJL4l1xh0WzK/
	3TmTfWbvT5zCpu69HgZjUrE+1Sou4UK1rDZp/7mbT/7JYK2IlJG4hmFUP5zuE9XQSjhmENCBvFI
	eGyaagBQ76vx2AXjRjXhisQH460RsEoPYezmIUCMir4aRenxWBbkTyw4wgjl7650WMw==
X-Received: by 2002:a05:6402:46c3:b0:6a5:fbc6:cad1 with SMTP id
 4fb4d7f45d1cf-6b408e89e41mr2170258a12.7.1792614492072; Wed, 21 Oct 2026
 13:28:12 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <atibhAMcgKle37-g@sirena.co.uk> <CA+=Fv5SUHkGtBPgzg9C1qGf6aiiFTVpStPd6Os3mTrz_+_5dKA@mail.gmail.com>
 <20261021185857.GB2608581@ax162>
In-Reply-To: <20261021185857.GB2608581@ax162>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 21 Oct 2026 22:27:59 +0200
X-Gm-Features: AclHuK80SVzQM3IT8hIbzJ05B2q7Hnxxi9JMQfhtwyRQawT4F4MwO5pP48izAmM
Message-ID: <CA+=Fv5Rf0puguC_G8L+CL6G5gjQZ2m3LpEsicN_jTcBpEK7XeQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the kbuild-current tree with the
 origin tree
To: Nathan Chancellor <nathan@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	KBuild Mailing List <linux-kbuild@vger.kernel.org>, Kees Cook <kees@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Matt Turner <mattst88@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nathan,

On Wed, Oct 21, 2026 at 8:59=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Wed, Oct 21, 2026 at 04:40:22PM +0200, Magnus Lindholm wrote:
> > On Wed, Oct 21, 2026 at 1:01=E2=80=AFPM Mark Brown <broonie@kernel.org>=
 wrote:
> > >
> > > Hi all,
> > >
> > > Today's linux-next merge of the kbuild-current tree got a conflict in=
:
> > >
> > >   arch/alpha/boot/Makefile
> > >
> > > between commit:
> > >
> > >   c437950dceb88 ("alpha: add self-extracting compressed kernel boot s=
tub")
> > >
> > > from the origin tree and commit:
> > >
> > >   0d4d70da348b0 ("kbuild: Mark the gzip recipes as recursive")
> > >
> > > from the kbuild-current tree.
>
> Thank you for the heads up, I have let Linus know about this one since
> it is a little tricky.
>
>   https://lore.kernel.org/20261021184723.GA2608581@ax162/
>
> > Thanks for resolving this.
> >
> > This recipe now only copies the completed image, so I think it
> > should stay without '+'. Matt's series moved compression into
> > arch/alpha/boot/compressed/Makefile, where the change should be:
> >
> >  $(obj)/vmlinux.bin.gz: $(obj)/vmlinux.bin FORCE
> > - $(call if_changed,gzip)
> > + +$(call if_changed,gzip)
> >
> > The existing vmlinux.nh.gz gzip recipe in arch/alpha/boot/Makefile
> > still needs the '+' from the kbuild patch.
>
> Correct, thank you for catching this.
>
> > Maybe adjust the resolution accordingly?
>
> Since the conflict came from Linus's tree, I have resolved this in
> kbuild-fixes-for-next so that Mark does not have to worry about this:
>
>   https://git.kernel.org/kbuild/c/83deedcf85af511dc120b3cd8ee597d211cdf2f=
b
>

Thanks so much for handling this.

> On a related note, is your tree flowing into -next? The recent
> pull requests for alpha have come from your lindholm/alpha tree but
> Next/Trees shows Matt's mattst88/alpha. Should that be changed? It would
> not have saved much here since I send my pull request to Linus before
> c437950dceb88 was applied in your tree as far as I can tell but it is
> always good to catch these things early.
>

You are absolutely right, I'll wire up my lindholm/alpha tree into -next be=
fore
the next merge window.

Thanks again,

Magnus
