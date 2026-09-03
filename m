Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6524CCDC8;
	Thu,  3 Sep 2026 08:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788423780; cv=none; b=SJ/QutIXmPliE/F8BvPEziyWCc7CrcDUCSHv+/xH9GqgLnLFEeSQLjg2Q9SnYGlme5tYv2uREvmnXXIpLSf63qCkHOZrdZLo8DC+kMW22FMsv2x6L+MsvvYN1nKRM6+TCibxNR2tVcQujSYWH2JUAV8LglwtZL5bpoD5TcIL5UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788423780; c=relaxed/simple;
	bh=9P8B/RN6zn0i8bcvOLF7tj5JKQE6TfZq9cp89lUEZew=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GGfJm6M0M4O60lJ0HHJs8zpeFO9B6/l/RGG5EF6AorE+By5bBxnqKyNUA/ArLsNAvTLhHmkjDAJyUD6Z4p6lEbgzuGFFmuopwBZspaWKa9LUbpcy+Y/chuay0W+/gKRXGTAjJzYk0oIs5e76Eih9VMdiGfuJWTkO6nLGpvNBpUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=NYAc69wF; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="NYAc69wF"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4hbCJs2vzzzKvv2;
	Thu, 03 Sep 2026 10:22:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788423773;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9P8B/RN6zn0i8bcvOLF7tj5JKQE6TfZq9cp89lUEZew=;
	b=NYAc69wF9Ot6/siRQbABrzSL8rS69JajnQhNsxyIlpbjoyMXRopUE85z5bOkOhjECZwkLx
	tbvzm38KobNK63zs7rknMOx5xfLNfcpkXya4DLzCtmDqCkZ7QVkVMnbEI6FI4mS5TGKpDH
	i26OTQrTzdA0/msKEW4BU1LQSAiwVlInOO3hQerk3XdxXnHOjmkRNWXJbCfDFMzs8I6G4s
	x5X0bObEIxc8TotjOtZGnrDbxDAEozG6Hndy8PTKyiR8neFjhzzAb3gfDbQBdNCDYdwc2F
	+d2O2q6fpW59MR3XREIZ91O0M17Gi7tkxDK2iUf8PwHvyBBvuhyO/PQhrXot4Q==
Message-ID: <101613e024851e419e2e19c433a50044ed75b466.camel@mailbox.org>
Subject: Re: [PATCH v2] docs: verify/bisect: fix typos
From: Manuel Ebner <manuelebnerli@mailbox.org>
To: Thorsten Leemhuis <linux@leemhuis.info>, Jonathan Corbet
 <corbet@lwn.net>,  Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 03 Sep 2026 10:22:49 +0200
In-Reply-To: <c6487243-0cf6-425a-8992-399aa802ed1a@leemhuis.info>
References: <20260902115121.687986-2-manuelebnerli@mailbox.org>
	 <c6487243-0cf6-425a-8992-399aa802ed1a@leemhuis.info>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 85aae325e7554f861cf
X-MBO-RS-META: giqfbrmihpb1qei4ye97g5egtbkfcih6

On Wed, 2026-09-02 at 18:30 +0200, Thorsten Leemhuis wrote:
> Thx for doing this, much appreciated.
>=20
> On 9/2/26 13:51, Manuel Ebner wrote:
> > 'your' -> 'you have'
> > 'kernel kernel' -> 'kernel'
> > 'your' -> 'you' twice
> > 'if is not listed' -> 'if it is not listed'
> > 'hay attention' -> 'pay attention'
> > remove needless "'" in sphinx link
> > 'as disabling then will reduce the consumed disk space'
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 vvvv
> > 'as disabling them will reduce the consumed disk space'
> > 'You for example might' -> 'For example you might'
> > 'and not from a one that' -> 'and not from one that'
>=20
> Pretty sure the above won't fly as a patch description, as it should
> describe the changes, not list each of them, as that is visible from the
> diff already (even if that's slightly hard for text-only files).

That's true, I got this a couple times as feedback.

> For typos and grammar fixes there is not much to say, so maybe just
> state that; but you might want to look at a few recent changes in
> Documentation/ to see how other developers approach a situation like this=
.

That's a good idea. I did only find slightly more verbose than mine, eg:
> Fix 'hay attention' -> 'pay attention' in file.rst
or
> Replace "an a few" with "and a few" in
> Documentation/driver-api/media/drivers/zoran.rst.

> > Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> > Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> > ---
> > [v2]
> > =C2=A0+ one more 'your' -> 'you'
> > =C2=A0- 'it'
> > =C2=A0+ incorporate Randy's suggestions
> > =C2=A0=C2=A0=C2=A0 https://lore.kernel.org/all/0475c09c-e165-41a5-b654-=
5c6aefeaab0b@infradead.org/
> > =C2=A0+ Reviewed-by: Randy Dunlap
> >=20
> > [v1]
> > =C2=A0https://lore.kernel.org/all/20260829055501.581856-2-manuelebnerli=
@mailbox.org/
> >=20
> > Wouldn't it make sense to add how to skip pure documentation and format=
ing
> > commits?
>=20
> YMMV, but I don't think that's worth it. It is easy to get wrong,
> doesn't matter much at the early steps of a bisection, and means one
> more instruction to describe for people that do that for the first time.

Ok.

> > Commits like this one. Or is it better to keep the document short
> > and simple - which it already isn't anymore.
>=20
> Feel free to suggest something to remove or rewrite parts with less
> words=C2=A0

I'll add it to my list, but it's pretty difficult.

> -- in separate patches of course. I know my writing is pretty
> verbose, sorry; partly that's my style, partly it might be because I'm
> not a native speaker, and partly it's like that because I know about too
> many corner cases that I try to prevent users running into.

That=C2=B4s a feature.

> > ---
> > =C2=A0.../verify-bugs-and-bisect-regressions.rst=C2=A0=C2=A0=C2=A0 | 24=
 +++++++++----------
> > =C2=A01 file changed, 12 insertions(+), 12 deletions(-)
> >=20
> > diff --git a/Documentation/admin-guide/verify-bugs-and-bisect-regressio=
ns.rst
> > b/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
> > index 7d38393f31f..9296e3f5410 100644
> > --- a/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
> > +++ b/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
> > @@ -163,7 +163,7 @@ will be considered the 'good' release and used to p=
repare the .config file.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 section 'Complementary tasks: cleanup du=
ring and after the process'
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 below.
> > =C2=A0
> > -=C2=A0 d) Once your finished the bisection, put a few things away::
> > +=C2=A0 d) Once you have finished the bisection, put a few things away:=
:
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cd ~/linux/
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git bisect log > ~/bisect-lo=
g
> > @@ -178,8 +178,8 @@ will be considered the 'good' release and used to p=
repare the .config file.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ./scripts/config --set-str C=
ONFIG_LOCALVERSION '-local-cafec0cacaca0-reverted'
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0 This is optional, as some commits are impossib=
le to revert. But if the
> > -=C2=A0=C2=A0=C2=A0 second command worked flawlessly, build, install, a=
nd boot one more kernel
> > -=C2=A0=C2=A0=C2=A0 kernel; just this time skip the first command copyi=
ng the base .config file
> > +=C2=A0=C2=A0=C2=A0 second command worked flawlessly, build, install, a=
nd boot one more kernel;
> > +=C2=A0=C2=A0=C2=A0 just this time skip the first command copying the b=
ase .config file
> > =C2=A0=C2=A0=C2=A0=C2=A0 over, as that already has been taken care off.
>=20
> I'd move the "over, " to the previous line, as the formatting otherwise
> looks odd. Not strictly required and makes the patch slightly more
> complex (so might not be the best idea, but I think it's worth when it's
> just one line).

I'd do the same, prior feedback taught me otherwise. I'll do it.

The remaining suggestions are good, will incorporate them.

Thanks
 Manuel=20

> > =C2=A0...
> ...
> Ciao, Thorsten

