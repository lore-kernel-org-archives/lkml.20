Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2503630A5;
	Sat, 12 Sep 2026 22:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789253344; cv=none; b=LLMvvSXfhWI3ErC2coWwEronfEHUeH1/jR6xDTlCfsd2O4hg4yvjz/yxIpjDV1FBv9BapByWboQcPABRb+TjxMoPgw2JzUvebQmy043WaRiwygiNcoTZdu8zDpFlwuyx1AuC+DDsObAq034bAn4oLJit7B9S956okTbI/fGL9Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789253344; c=relaxed/simple;
	bh=inWXTJaZqfaLTDFfjfCtHuRxzqwCXHz5Kjvucf8V5eA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g5o0sOE6lA5tBRacr5LGAlbuPfSOEtRssmv1TqJHR9BvXRbR4ToLI4LXuf+sCSABOin5frlTib/A0NXqSq5k9y1hhmXhdPXRyQv9iL2pVyqYh2wY5swtjd40ESdg+doukBP2rjAxXBaZU7lA2uphWH4/1hyDSaZ+kbMdCfMaNzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I3u0NC19; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I3u0NC19"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A93AA1F000FF;
	Sat, 12 Sep 2026 22:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789253342;
	bh=iens78yZLtnL+fl57beRiJJ6hBIEP2ui7EKhm8tgYOs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=I3u0NC19M8ZJn+OZabFQ320nZ5FD/RljkUzPgRa1Xxtt3mka6eH7hAcThMbJur4PE
	 ONRHxJAKZGyhg3OZt+fp19IQAeNcEh0tLqbF7bsoYi5fX/SVQv0TGyxTb6Mp6tIBZk
	 JoqIGq2kg8ttK8NGcJ1USLE+aI7Q9R4bkbRsAcX39Lc8Ue+6led9TaxxAkOOWO/jy+
	 vGUPoiskwjC8IcDv3P+D+VwhuW6Dx9dXYiXa+7KpnfHJ0M77ZEiUaq7OgiQVj1IP50
	 YA1yGfRHFxyaEd9+tIct0zwHbY7rToEUFObfjti5AhhXYRkrjwVREk/CkH0omrba3Z
	 FA+vLerGKlJbQ==
Date: Sun, 13 Sep 2026 00:48:57 +0200
From: Alejandro Colomar <alx@kernel.org>
To: astian <astian@memeware.net>
Cc: linux-man <linux-man@vger.kernel.org>, libc-alpha@sourceware.org, 
	Thomas Gleixner <tglx@kernel.org>, Andy Lutomirski <luto@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: ioperm(2): confusing terminology
Message-ID: <aqXWu0bKoK_XMuLT@devuan>
References: <DLDOCNQUCW9N.3GGL01BMV0HNG@memeware.net>
 <aqXOgqne-v4GtglY@devuan>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4s7u3irbxnqwwa2q"
Content-Disposition: inline
In-Reply-To: <aqXOgqne-v4GtglY@devuan>


--4s7u3irbxnqwwa2q
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: astian <astian@memeware.net>
Cc: linux-man <linux-man@vger.kernel.org>, libc-alpha@sourceware.org, 
	Thomas Gleixner <tglx@kernel.org>, Andy Lutomirski <luto@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: ioperm(2): confusing terminology
Message-ID: <aqXWu0bKoK_XMuLT@devuan>
References: <DLDOCNQUCW9N.3GGL01BMV0HNG@memeware.net>
 <aqXOgqne-v4GtglY@devuan>
MIME-Version: 1.0
In-Reply-To: <aqXOgqne-v4GtglY@devuan>

Oops; I've fixed the mailing list address now.


Cheers,
Alex

> Date: 2026-09-13 00:24:17+0200
> From: Alejandro Colomar <alx@kernel.org>
>
> Hi astian,
>=20
> > Date: 2026-09-12 22:00:57+0000
> > From: astian <astian@memeware.net>
> >
> > ioperm(2) says:
> >=20
> >   int ioperm(unsigned long from, unsigned long num, int turn_on);
> >=20
> >   ioperm() sets the port access permission bits for the calling thread
> >   for num bits starting from port address from.  If turn_on is nonzero,
> >   then permission for the specified bits is enabled; otherwise it is
> >   disabled. [...]
> >=20
> > The use of "bits" here is confusing/sloppy.
> >=20
> > ioperm is supposed to enable or disable permission to access IO ports
> > for the calling thread.  In this API, the "permission bit" (singular) is
> > really "turn_on": 0 to disable access, non-zero to enable.  However this
> > description refers also "num bits starting from port address from" and
> > "the specified bits".  That seems to suggest that IO ports somehow refer
> > to "bits" and this API controls access permission to them, which is
> > bewildering.
> >=20
> > Searching around I have seen that other versions of this manpage used to
> > say "bytes" instead of "bits", which is only slightly less bewildering.
> > Ports/addresses in the IO space refer neither to bits nor to bytes per
> > se, they are an abstract interface, like a syscall number/index.
> > (Architecturally, in some cases, these indices may in fact map to
> > processor registers which may in fact be portions of a contiguous
> > internal memory, so in some cases one could correctly say that the ports
> > refer to "bytes" in such memory, but this is obviously all very
> > low-level and microarchitecture-specific.  I think being aware of such
> > details actually makes this description more confusing.)
> >=20
> > Apparently the reason for this confusing description is that for Linux
> > ioperm is a syscall and the kernel implements this syscall using a
> > bitmap with 1 bit (permitted/denied) for each port, in a contiguous
> > sequence.  See ksys_ioperm in "arch/x86/kernel/ioport.c".
> >=20
> > Thus "num bits starting from port address from" actually refers to the
> > bits of that bitmap: the bits [from, from+num) are set according to
> > turn_on.
> >=20
> > This kind of implicit reference to implementation details is wicked.
> >=20
> > Suggested change:
> >=20
> >   ioperm() sets the calling thread's access permission for num ports
> >   starting from port address from.  If turn_on is nonzero, then
> >   permission for the specified ports is enabled; otherwise it is
> >   disabled. [...]
>=20
> Hmmm, sounds reasonable.  Do you want to send a patch?  Or should
> I write it?  (I don't mind; just asking in case you want to do it.)
>=20
> > PS: Oh, also, maybe the title should say "set input/output port
> > permissions" instead of "set port input/output permissions".
>=20
> Same here.
>=20
> BTW, the manual page also says:
>=20
>      This  call  is  mostly for the i386 architecture.  On many
>      other architectures it does not exist or will  always  re=E2=80=90
>      turn an error.
>=20
> Is this still true?
>=20
> Another issue:
>=20
>      EIO    (on PowerPC) This call is not supported.
>=20
> Is this really true?  Where this is not supported, I expect ENOSYS.
>=20
> And yet another thing: should we document the parameters as being
> uintptr_t instead of unsigned long?  They are the same exact type
> always, AFAIK.  Or is there any system where they aren't?  If they are
> the same, uintptr_t will better document that they are addresses.
>=20
>=20
> Have a lovely night!
> Alex
>=20
> --=20
> <https://www.alejandro-colomar.es>



--=20
<https://www.alejandro-colomar.es>

--4s7u3irbxnqwwa2q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmql1tMACgkQ64mZXMKQ
wqkhCBAAmozT/vRNeKjPJbVgj7wYz61Uswez1MZe19cCoJB1DUQr5hCBDa0q9uF6
RL0JlVGvGTrl+eXroesSOQyrt2tLe6h/ozd+0my/oJGGZvOXjw++p1lQGd3MwKx2
cMhDjyaCJCRI0K8hWuq54Pkt21q9+NCx2DQlfCIZo3brNG3Udzp7iTBFUe57wFPK
QSN4OGNlzM1/YIbPXTvxUHzxNQMu8D0Ni162EXq3IMeKt4owgiyCo4lEfsFL/gy2
49Mncm6hSp7R9EKPr6yO5C9NtfCxzR9fEflbZfVDQpIrZRbPQy852qv9wzwwTWkt
yFzlht84rOSYmlcdasUkHiWAGX3DnVJ8z4T2aD9yXTq+HA2SB9VSEw0WSqRue9qf
S9nkmSvU75154L58UQwoQwxqXsxo5rRPkAsP65IOudnoZijkH2Myt/BCjPT/5lrh
RIl78E0HNPItgAnxN/9227r15ynAt1I302hrJQQRpVlf+s+Mgo1kkhRexBo3DGmt
Up/2dV9WfyXqOpxkCAc6S2qw3ip0rgJBPG5mdom6ZOY72Xc0DSIokVoymJaXzf21
9Gtf7Z9TFjgXzgRMQrOzv9dIYp15r5R5L3sZbmgky0Skq2+AcsDjAu4PxfA5o7sn
rQPoPS324ynLz68xpv2fg7E3GvFW48bzrMKRtMQC63Y0Jd6lcc4=
=DZhe
-----END PGP SIGNATURE-----

--4s7u3irbxnqwwa2q--
