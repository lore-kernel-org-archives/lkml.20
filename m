Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F043254AE;
	Thu,  3 Sep 2026 15:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449439; cv=none; b=FySF8gxDbRWORA9GQdYNPCBC5EGDf57QK+opOkB1Ang8g3eXjWsKsAFTPtpS3pS53+dkctiE59izAVoMNv11F+wcFQ/x2IPTKGlSmzLj4lcBnYmiroXVH+YH10aO4+G7C5+tx9wrs0tTMxl5aa3fhyLmQ0teYvG5dDt+pfjweBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449439; c=relaxed/simple;
	bh=BA4H61lpz6nFag17hxqCNMJXbpLrSo/paYU7SFaVE1I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CyduPtTkUOBhaNCxHTfdBwCPhQhvDEq7T+QfLaeYhFR0DwvmPjpqexWISMGAi4hU0/t1DgAQiWnXVb5c3OUtxp+SPXMXC8IzfVwbKs80efz+J4S6HQfIpGfmMw+nbRG/2j35+W4oQqKRbCn/5rnRbNgBpzUi8a1a9SkLCPN68GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gQOIpJ/c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gQOIpJ/c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1401C1F00A3A;
	Thu,  3 Sep 2026 15:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788449438;
	bh=R648ZI74sZFQouKv2MQWcoWwcBh7a9P4pnvTLHKWOto=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=gQOIpJ/cMg0VZuRR54cY7vSJdBz3iqV0LRWr3BI4dE/X03BCOGaCSpIyrIwreShlm
	 EBJBcHdoNux1xPak7tG/k8lqwVEaZvddwpIuq9yl8uc9ghAhhYysziILev8w/9OVnS
	 quECwaOw8sg091j6j2QCG3enJKolCNb4nDW0tr+OaB9wOQNbr/v53XdKZfdVXQkCL3
	 VbV38/3q6O6Cf7tNcEgLESi4Q+m8n4zI1mK91YEICFOX4mdJS0OzVQY4C9UFF1uIPv
	 O9EW44325i9D3F2sFsbG2xrCHxv/KfnYaj9a4kPftP+wGURiKttbr8tiGOp4H8SCJM
	 VG3HIzgJe+dBw==
Received: from localhost ([::1])
	by mail.kernel.org with esmtp (Exim 4.99.5)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1x29Od-00000002Fzl-2PQ6;
	Thu, 03 Sep 2026 17:30:35 +0200
Date: Thu, 3 Sep 2026 17:30:34 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Manuel Ebner <manuelebnerli@mailbox.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Weijie Yuan <wy@wyuan.org>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Shuah Khan 
 <skhan@linuxfoundation.org>, "open list:DOCUMENTATION PROCESS" 
 <workflows@vger.kernel.org>, "open list:DOCUMENTATION" 
 <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [Issue] sphinx: incorrect high-lighting
Message-ID: <20260903173034.46b50b59@localhost>
In-Reply-To: <f0ccda934d2747f7d39d5c263116ec046c7450e2.camel@mailbox.org>
References: <bba57d51c72d9387ccef2b5979fa618e980c3ebf.camel@mailbox.org>
	<aosYfdfH6Z7ai5M2@wyuan.org>
	<c7a3db22f56c598ef35676288d10303af21098bf.camel@mailbox.org>
	<87mrub1wfv.fsf@trenco.lwn.net>
	<f0ccda934d2747f7d39d5c263116ec046c7450e2.camel@mailbox.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, 30 Aug 2026 09:13:31 +0200
Manuel Ebner <manuelebnerli@mailbox.org> wrote:

> On Mon, 2026-08-24 at 07:26 -0600, Jonathan Corbet wrote:
> > Manuel Ebner <manuelebnerli@mailbox.org> writes:
> >  =20
> > > It would be this list:
> > > Skipidentifiers =3D [ 'and', 'are', 'as', 'containing', 'element', 'i=
n',
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'including', 'is', 'name', 'n=
eeds', 'of', 'or',=C2=A0 'page',
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'pages', 'passed', 'randomiza=
tion', 'request', 'that',
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'to', 'where', 'which', 'whos=
e', 'will' ] =20
> >=20
> > So this is an error-prone game of whac-a-mole...as Randy pointed out,
> > "struct page" is a rather important one in the kernel.
> >=20
> > I can apply your updated version of this as a short-term fix, I guess,
> > but a better solution is probably to only apply markup to "struct foo"
> > if we have documentation for that type.=C2=A0 I can look into that late=
r. =20

There is actually a way to do that. See
Documentation/sphinx/kernel_include.py the code related to this:

    app.connect("missing-reference", check_missing_refs)

One option would be to re-convert such missing references back into
a normal "struct foo" if the reference was not found.

Not sure, however, how much this would affect Sphinx build time.

--=20
Thanks,
Mauro
