Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4454441619;
	Mon,  7 Sep 2026 10:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788777432; cv=none; b=kR2SNzzKI/FgmmoKw9QREoZ6KSi80wTUU+A3k+mASwW111NdgJt52b8nfK2in7HccIxAt/OhMcdagHrgVCXHix8TS+UO2hzisrjuK4q7IElbR3ncOa59y1tdKzKBlWjisVTTwFIbBcMV8HEZBQ2W3RV5+MP0BPVSwRa2Uv0jeg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788777432; c=relaxed/simple;
	bh=46nYrYnJykDFPs7U5HfbzgYezgCMlDwK7ZpRjXxnBCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KxXmzvyfhKI1EwlbHzQfkq92l/DA7sTaptC75EG6MinRiie9F3PC8kXTM9KcIPAph67e1m0c6bUMIgWs9TbP3tNA6xX7djqh9B83d5Fw26NVrXIYP12E7OGnPKFmk2zG4mo/FSh94rJBTl2gpjsOXuTTBlBCAN/GBQDwhF2qe7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A3u8x6ke; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A3u8x6ke"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDBCC1F00A3A;
	Mon,  7 Sep 2026 10:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788777430;
	bh=1ay/TaukY/LyaVP7DBcuF1uWpTQzsI+J3Bq6x+EimT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A3u8x6keI4v25E4vtBZVtD0H3+5k550B50BsTtvbaR5/p7rBZ0KVpCtJNKEzJZIuk
	 spNhOqRc4GDWIEIKAMi47ne8APPtDSID83h5Sd/bLHCvgDeJecP4+wrj9f+fOcHP5f
	 7lBTnSC2HvQvQsQQFbSG5vDVslDlWYkgNWR8Zkj/H4NLs+Bz8G0Q/mL5sY1GGLn3CO
	 yKE1NmiD6pMCb33uBRJYi/cZgBSHZjcJDZOQ4H73mdObUj9gnX4y8AHDtybm5Pd6gw
	 EXOhcLWuWH2ZAp/QLPZ5o1Piib2ZTl+K7nxpN7IB8016b3uSpHUkwV4QYa3QNgzcAQ
	 eTTsho6kKUoKw==
Date: Mon, 7 Sep 2026 12:37:05 +0200
From: Joel Granados <joel.granados@kernel.org>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Gregory Price <gourry@gourry.net>, 
	Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, Kees Cook <kees@kernel.org>, 
	Oleg Nesterov <oleg@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Mark Brown <broonie@kernel.org>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-next@vger.kernel.org
Subject: Re: [PATCH] syscall_user_dispatch: Use CONFIG_SYSCTL for sysctl guard
Message-ID: <rvsksbxeput4impcquq3kjxg6pv3ixovpk5or2mgtuifsu65fh@wuoukaeelovg>
References: <20260813062039.14567-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m5nzjk7zgbmhn6w6"
Content-Disposition: inline
In-Reply-To: <20260813062039.14567-1-kmehltretter@gmail.com>


--m5nzjk7zgbmhn6w6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 08:20:39AM +0200, Karl Mehltretter wrote:
> sysctl-next removes CONFIG_PROC_SYSCTL because it mirrors CONFIG_SYSCTL.
> When combined with the syscall user dispatch sysctl in linux-next, the
> stale guard prevents registration of kernel.syscall_user_dispatch.
>=20
> syscall_user_dispatch_allowed defaults to true. SUD therefore remains
> available, but administrators cannot disable new activations.
>=20
> Use CONFIG_SYSCTL for the guard and documentation.
>=20
> Fixes: 5b6e32ba7b59 ("syscall_user_dispatch: Add kernel.syscall_user_disp=
atch sysctl")
> Assisted-by: Codex:gpt-5.6-sol
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
> The conflicting sysctl-next commit is currently:
>=20
>   8d75c338f0bc ("sysctl: remove CONFIG_PROC_SYSCTL, it just mirrors CONFI=
G_SYSCTL")
>=20
> This is a cross-tree integration fix intended for the tip tree. It has
> no functional effect in tip/master, but restores the sysctl when
> combined with sysctl-next.
>=20
> Verified in linux-next with an x86_64 object build using
> CONFIG_SYSCALL_USER_DISPATCH=3Dy and CONFIG_SYSCTL=3Dy.
>=20
>  Documentation/admin-guide/sysctl/kernel.rst | 2 +-
>  kernel/entry/syscall_user_dispatch.c        | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/=
admin-guide/sysctl/kernel.rst
> index b6328cd0f43e9..ffea61d448ebb 100644
> --- a/Documentation/admin-guide/sysctl/kernel.rst
> +++ b/Documentation/admin-guide/sysctl/kernel.rst
> @@ -1416,7 +1416,7 @@ Controls whether userspace may arm Syscall User Dis=
patch via
>    =3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
>  Only present when the kernel is built with ``CONFIG_SYSCALL_USER_DISPATC=
H``
> -and ``CONFIG_PROC_SYSCTL``.
> +and ``CONFIG_SYSCTL``.
> =20
> =20
>  sysctl_writes_strict
> diff --git a/kernel/entry/syscall_user_dispatch.c b/kernel/entry/syscall_=
user_dispatch.c
> index 2002c7aae4358..59c861866941d 100644
> --- a/kernel/entry/syscall_user_dispatch.c
> +++ b/kernel/entry/syscall_user_dispatch.c
> @@ -178,7 +178,7 @@ int syscall_user_dispatch_set_config(struct task_stru=
ct *task, unsigned long siz
>  					      (char __user *)(uintptr_t)cfg.selector);
>  }
> =20
> -#ifdef CONFIG_PROC_SYSCTL
> +#ifdef CONFIG_SYSCTL
>  static const struct ctl_table syscall_user_dispatch_sysctls[] =3D {
>  	{
>  		.procname	=3D "syscall_user_dispatch",
> @@ -195,4 +195,4 @@ static int __init syscall_user_dispatch_sysctl_init(v=
oid)
>  	return 0;
>  }
>  late_initcall(syscall_user_dispatch_sysctl_init);
> -#endif /* CONFIG_PROC_SYSCTL */
> +#endif /* CONFIG_SYSCTL */
>=20
> base-commit: 98292902c7108717c4f4bea7226520b336f9a8bc
> --=20
> 2.53.0

I don't see this in 7.3-rc2. Did we miss pushing this in? At the moment
I see that syscall_user_dispatch.c is still using CONFIG_PROC_SYSCTL
which is never defined anywhere.

Two questions:=20

1. Did I miss anything. Is this not supposed to be upstreamed at the
   end?

2. Anyone opposed to me sending this upstream?

Best













--m5nzjk7zgbmhn6w6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmqek8kACgkQupfNUreW
QU8zHQv/SZEAqeTo8WbywGd+WkiXgkg+bI5hSmGkUyoxe+Y6ZXufW7CtExJOFYhA
ds4z9bdT3XbsAq4P5NAALy35uUWxtEwxOJu5O0kmz7stxVOiopFHt6+50lFkYVZF
1gI3yfI/BbMyFMLBD2oCQOJHDuHkKCPx5Ev+VIZbInxRwOH9/gZTr8jDtW3aI4tB
Gwq5LmP2NvaGuj1LEdemKxAl74kQEQEGKb7jV8iF9RK2WFvhN7b9/Qw3O147M/7J
Id3xqVuozeI5sy3IRMCD9XzSrYMEgi39JMzB0xefslOJpbWMCcTWeMk0he9GKnbi
1T0fTF7gEj6XcicAHWRf3uN1e2LN0wY2QnBtOfKVN1HKfIimtN5kQkCRbJ0OgDSA
NUyoKXph+rxO/DNIZAsyUdyJNrrnQIenyTVs/L2C9Yptyf0e6HoHyn9nSGNRoBPK
JjbjG6RFn9CO7mGGYwOl08T8BeISglPn6QGPQwrQUAt2mS/oEJH+qLKhwr2/tHRp
6F66U/vq
=6/h7
-----END PGP SIGNATURE-----

--m5nzjk7zgbmhn6w6--
