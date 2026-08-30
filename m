Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D6031E834;
	Sun, 30 Aug 2026 07:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788074023; cv=none; b=FMlTbEZolLWBS43CEr68Vw18VBrSJwipUiBeVfngoLAUnnNsBIE7Gg5DCyGmCRuzcs7UKH5WSSZORjjMNag0xcO8Tofwm9AkCSnZOWIlcFO2EtUmMNuHZ14vPcdGOzwbupZPYlfV13iOcs5S/RAsJLgqPhEVnwRNjs+11cfnwuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788074023; c=relaxed/simple;
	bh=3coKOgO4YZeimnJtVQnOaBMlYLRlcyIHiGqgTd+TUkA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nBMex9nXCI0bwfZoRd/GGlEih0FZyvTrDYeaCXoy0UyT6no9Xrrz4hqW/fF9R/kV4utyya3r9i/dC3YG9RHXV7INbgGHynk/JcV4GG5iMG8oeIViZ0h8dbTZG56GKcSIYszRieNarw3/3oqyc1Q1TDBo54KifyFkaiMYHWyA9UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Ulede2FE; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Ulede2FE"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4hXjyn5Nk0zKv3W;
	Sun, 30 Aug 2026 09:13:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788074017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3coKOgO4YZeimnJtVQnOaBMlYLRlcyIHiGqgTd+TUkA=;
	b=Ulede2FEl0CfXIUqE7UnaYIkqjPGvzIah7+aaSOR6PJH9T/U2Z9WSIJxNRTeeDTG/zjHRT
	wM4nX+Oxkg56N3oKFNl3W7qQwXN5GBLWE5a+00QPxjhiupaD+9OPzPB13pdlRdyxE2gY/c
	37052SGFaruG2R+H8DMQbAdTtRZNlvgiB3dcq/2VKJSM2j6vMpHOMKQ2mB7hRt9N9xoHce
	RdlbSltZ73DWUIvp8P4GrFudMn/tRdRi7Fq8ScWAZ9XEkg4Y7efmRND6Etb7KzbsTRFNwN
	kKmiwwGVFMSWcvjiPLTz9NtXWQtjRNJBvxVXjtEITLv8fNEka84oUtjMo9Wbmw==
Message-ID: <f0ccda934d2747f7d39d5c263116ec046c7450e2.camel@mailbox.org>
Subject: Re: [Issue] sphinx: incorrect high-lighting
From: Manuel Ebner <manuelebnerli@mailbox.org>
To: Jonathan Corbet <corbet@lwn.net>, Weijie Yuan <wy@wyuan.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Shuah Khan
	 <skhan@linuxfoundation.org>, "open list:DOCUMENTATION PROCESS"
	 <workflows@vger.kernel.org>, "open list:DOCUMENTATION"
	 <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Date: Sun, 30 Aug 2026 09:13:31 +0200
In-Reply-To: <87mrub1wfv.fsf@trenco.lwn.net>
References: <bba57d51c72d9387ccef2b5979fa618e980c3ebf.camel@mailbox.org>
	 <aosYfdfH6Z7ai5M2@wyuan.org>
	 <c7a3db22f56c598ef35676288d10303af21098bf.camel@mailbox.org>
	 <87mrub1wfv.fsf@trenco.lwn.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: 7ycnuq3q6wpdzx5t9yfy85ade9skqdip
X-MBO-RS-ID: fc5110c4f1b32b16279

On Mon, 2026-08-24 at 07:26 -0600, Jonathan Corbet wrote:
> Manuel Ebner <manuelebnerli@mailbox.org> writes:
>=20
> > It would be this list:
> > Skipidentifiers =3D [ 'and', 'are', 'as', 'containing', 'element', 'in'=
,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'including', 'is', 'name', 'n=
eeds', 'of', 'or',=C2=A0 'page',
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'pages', 'passed', 'randomiza=
tion', 'request', 'that',
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'to', 'where', 'which', 'whos=
e', 'will' ]
>=20
> So this is an error-prone game of whac-a-mole...as Randy pointed out,
> "struct page" is a rather important one in the kernel.
>=20
> I can apply your updated version of this as a short-term fix, I guess,
> but a better solution is probably to only apply markup to "struct foo"
> if we have documentation for that type.=C2=A0 I can look into that later.

That's better, skip my patch.

Thanks
 Manuel=20


> jon
