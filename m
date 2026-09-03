Received: from mail-24425.protonmail.ch (mail-24425.protonmail.ch [109.224.244.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FCA332EC1
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 06:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788418697; cv=none; b=axB/vNUs9uQxCXVza5CcltYWivDUvoa2crI1XDhUxZr/FM7FVgV+g/oEfYug6CKqYvD8rh9yKcREjLrPKQzHDDgxrKyub79BmiY6cjqRP3p545ZDXciCjoEdsLOmbmj4/WX5kE0lEhO5nV/g9SKEeHbIEXHmA5ybIx4HL0i+VKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788418697; c=relaxed/simple;
	bh=Nqcf39p16wOhcPNfwTObS3nJ5vWSPjXa2hIkzFkQ1eI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FGKgw9Nc7ibbCA3CBhqKYjDRHuHF62PjSNRhEbFvWi2m/ZI2lRIMz1IlxJL0yEXCeqtkQlyfa7BsFvhcUmo/nLIOip2wZANWjmhSfdBnkGBelInGdiVxoJgbqOGc1eV+gGGrbdCZn0/ajOxzsOjxKzRjo9tKcDo0eDxf4XDBtoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=Ez1tnr+Z; arc=none smtp.client-ip=109.224.244.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="Ez1tnr+Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=ofgevln3gndg5pw64ndm4aaegm.protonmail; t=1788418681; x=1788677881;
	bh=xlNfBWyxLeaZeOhAjIUuyj9Pnb/osqZGOp4mRSgnE48=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Ez1tnr+ZuDBnfVMQlsJ2SXrwbhrj6eYTjKFzw31xtzxGputQs8WXaZ5e9UYxs2+ee
	 bPxX691wSOzwo9ps8ocuhUCZWw/nLECppdP8NKn8k0VfI4ZPbMNoZjbsP0bHoJTsc7
	 O/gwyWBPlSOGllcpfpGJCVc7Qxxt2gpQOfhQYJO/daO3M2Ef0SJDBU0LD20TTnYSbi
	 FtdsAxtHIPDrYdE1NLoeLz8bKtFiQ77JyAitXHmQVt4PuwjyyqsV8Ym90Ek1P3Nlqj
	 m8OGeVubEd1Akt25BlGXWSGfjTjPsM8UVwITfeGccB4RuxYRc/y8IL2JsOQ6/QzVPL
	 RQ1btGDEDnsJA==
Date: Thu, 03 Sep 2026 06:57:54 +0000
To: Thomas Zimmermann <tzimmermann@suse.de>
From: Aditya Garg <gargaditya08@proton.me>
Cc: Aditya Garg <aditya.garg@linux.dev>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>, David Airlie <airlied@gmail.com>, Aditya Garg <gargaditya08@live.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] MAINTAINERS, mailmap: use Aditya Garg's linux.dev account
Message-ID: <txsiv43u7qv-Pc_dRDdbgiUHVP54rhl5g-xLzQU457o0E29MYkL9FX-zdozYxVySvTed10VduLizWQw3zNDJTGxTIfFLX71G3U_Kj3qnJao=@proton.me>
In-Reply-To: <27a31a37-688d-427b-a0ba-c3133db19c97@suse.de>
References: <20260723100136.14467-1-aditya.garg@linux.dev> <27a31a37-688d-427b-a0ba-c3133db19c97@suse.de>
Feedback-ID: 145777226:user:proton
X-Pm-Message-ID: bdf5f16474591009c906f0f2402f43902894299f
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi

>=20
> Am 23.07.26 um 12:01 schrieb Aditya Garg:
> > From: Aditya Garg <gargaditya08@live.com>
> >
> > Due to non standard IMAP and SMTP protocols by Proton Mail, the account
> > was giving trouble. Since my linux.dev account has been approved, all
> > communication related to Linux development shall now be done there.
> >
> > Signed-off-by: Aditya Garg <aditya.garg@linux.dev>
>=20
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Can someone please merge this. I am still receiving mails on my old email w=
hich I do not use for dev work anymore.

>=20
> > ---
> >   .mailmap    | 3 ++-
> >   MAINTAINERS | 2 +-
> >   2 files changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/.mailmap b/.mailmap
> > index 501d858cb..baea6ba4d 100644
> > --- a/.mailmap
> > +++ b/.mailmap
> > @@ -19,7 +19,8 @@ Abhinav Kumar <quic_abhinavk@quicinc.com> <abhinavk@c=
odeaurora.org>
> >   Ahmad Masri <quic_amasri@quicinc.com> <amasri@codeaurora.org>
> >   Adam Oldham <oldhamca@gmail.com>
> >   Adam Radford <aradford@gmail.com>
> > -Aditya Garg <gargaditya08@proton.me> <gargaditya08@live.com>
> > +Aditya Garg <aditya.garg@linux.dev> <gargaditya08@live.com>
> > +Aditya Garg <aditya.garg@linux.dev> <gargaditya08@proton.me>
> >   Adriana Reus <adi.reus@gmail.com> <adriana.reus@intel.com>
> >   Adrian Bunk <bunk@stusta.de>
> >   Ajay Kaher <ajay.kaher@broadcom.com> <akaher@vmware.com>
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 1ab873685..f32e63428 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -7970,7 +7970,7 @@ F:=09drivers/gpu/drm/sun4i/sun8i*
> >
> >   DRM DRIVER FOR APPLE TOUCH BARS
> >   M:=09Aun-Ali Zaidi <admin@kodeit.net>
> > -M:=09Aditya Garg <gargaditya08@proton.me>
> > +M:=09Aditya Garg <aditya.garg@linux.dev>
> >   L:=09dri-devel@lists.freedesktop.org
> >   S:=09Maintained
> >   T:=09git https://gitlab.freedesktop.org/drm/misc/kernel.git
>=20
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstr. 146, 90461 N=C3=BCrnberg, Germany, www.suse.com
> GF: Jochen Jaser, Andrew McDonald, (HRB 36809, AG N=C3=BCrnberg)

