Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205EF4B2055;
	Mon,  7 Sep 2026 12:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788784898; cv=none; b=KSG7EBXUcYLE5qRe0NeKb+WGY+Xd/u/IXfkCk+918ApUS5j6GmZLWQokmMX4SAkrs031HY2USUXqhsVZa6RLDovgn2xYFuNi3v8LNJw+1+JNUdA78eD/0Ve+Mift6XG6WrOzPiqeZTfjPkFPcWqsZ1e93oBQaD4qNHHhQOOZ4QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788784898; c=relaxed/simple;
	bh=nNoPkc9f5O3mIgdkb8O5A3/CdnPez7t7H1K9/aRvCok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TtBFOIY4s01zceeft0OXHkObyWuEMu31a3IYbuBtBYKeYiMEGA50vw4ieAHZljMPhtRTdn/80YtaZ0DeghU7tINwB0kP4UxXjMY0RoBVtzJkl8REk2eydRMN4e34xju3faLIoyrZdM+JQygTUS8NDys34+mcvWFdbhxo2mi5Nh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lOAtdZ9/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lOAtdZ9/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05B801F00A3D;
	Mon,  7 Sep 2026 12:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788784896;
	bh=R+iOXhikbtD7Hlx2TtBI13r7V57waJ+xZV8XYnDia6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lOAtdZ9/rux5RHsaLQ3YTn+XxyVJ2epNDmq67tcnhLpWRZ6FZWVvxnI07aaFK8rZO
	 dIMc1HiqdXkuTfjoh9zo9K7VMuXBjK1LOLeeByCu/uzbJKSvorNrkK+0ezm1MmS5dY
	 mGKpBi3LycCGNAkpvN4erbVs0U4ta6l/ct9UNbEi4bt3kHwZGPMzVck0EZKa1j74LM
	 evSin3W0nK/E7hcgiaAaQUoAHlfJxIjcazL/BsWJnOD2zEvDwnCGm9DC6q1QwZGaVZ
	 ZzAiE+Ks15BS+MHyRVo1gMPSjFJzlJhTOZWmuPjityWOmfh1jIXwY2VpVEeu+HtZCf
	 pVPQ/Dnnrsn+A==
Date: Mon, 7 Sep 2026 14:41:30 +0200
From: Joel Granados <joel.granados@kernel.org>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Gregory Price <gourry@gourry.net>, 
	Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, Kees Cook <kees@kernel.org>, 
	Oleg Nesterov <oleg@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Mark Brown <broonie@kernel.org>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-next@vger.kernel.org
Subject: Re: [PATCH v2] syscall_user_dispatch: Use CONFIG_SYSCTL for sysctl
 guard
Message-ID: <zyz4yugeby6vs6y6pkr7yuc47djr7m7ong5lv5e56yfe7cjfhv@rpqeyifwublj>
References: <20260813062039.14567-1-kmehltretter@gmail.com>
 <20260822072325.51994-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qlbwlyxfaaldjv5l"
Content-Disposition: inline
In-Reply-To: <20260822072325.51994-1-kmehltretter@gmail.com>


--qlbwlyxfaaldjv5l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 22, 2026 at 09:23:25AM +0200, Karl Mehltretter wrote:
> Commit 8d75c338f0bc ("sysctl: remove CONFIG_PROC_SYSCTL, it just mirrors
> CONFIG_SYSCTL") removed CONFIG_PROC_SYSCTL, but the sysctl added by
> commit 5b6e32ba7b59 ("syscall_user_dispatch: Add
> kernel.syscall_user_dispatch sysctl") is still guarded by it. Now that
> both commits are merged, kernel.syscall_user_dispatch is no longer
> registered.
>=20
> syscall_user_dispatch_allowed defaults to true. SUD therefore remains
> available, but administrators cannot disable new activations.
>=20
> Use CONFIG_SYSCTL for the guard and documentation.
>=20
> Fixes: 5b6e32ba7b59 ("syscall_user_dispatch: Add kernel.syscall_user_disp=
atch sysctl")
> Assisted-by: Codex:gpt-5.6-sol
> Acked-by: Oleg Nesterov <oleg@redhat.com>
> Reviewed-by: Joel Granados <joel.granados@kernel.org>
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
> Changes in v2:
>   - Reword changelog and rebase onto mainline now that both commits
>     are merged there (v7.2 is unaffected, it has neither commit).
>   - Collected Acked-by/Reviewed-by tags from v1. No code change.
>=20
> v1: https://lore.kernel.org/all/20260813062039.14567-1-kmehltretter@gmail=
=2Ecom/
>=20
>  Documentation/admin-guide/sysctl/kernel.rst | 2 +-
>  kernel/entry/syscall_user_dispatch.c        | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/=
admin-guide/sysctl/kernel.rst
> index b6328cd0f43e..ffea61d448eb 100644
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
> index 2002c7aae435..59c861866941 100644
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
> base-commit: 26260251022fbc2f248a3d747a9b2b961b18d2d8
> --=20
> 2.39.5 (Apple Git-154)
>=20

I don't see this anywhere upstream; I'll send this as a fix for 7.3-rc3
in the middle of the week unless someone tells me that it is taking some
other path.

Best

--qlbwlyxfaaldjv5l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmqesPkACgkQupfNUreW
QU+YGQv9EzYNA9rNevyuWYw1Xj6C+dfFKDXbLe0cqOVrEYuVkru65rdS1E1NmrQr
z1YrvKQf4hCKfFK8NwOLPwT4lSklqE08jgfx2kxCpxlIqI7JO5m/Xfn1nK1ncDaC
3EwG5dGR5jij53kNJH/Y8Vzd+BjGojZy93SwTkjJJVdWV168yYtqenEPpluokXsH
YH8vRfFjsyf8T9oPAY5D3U4+TE+fOD9Kc/sZji9RNQJ2Ni3pHDZkj+RyvRPWALKD
Xi+05Em5JCGThlnWhbxlhmAciSdpqoHI6N5zTfJQhUz9Uh5PEUO2N8kUgvqdJ9Dp
m9pUet+8ZeCuSnlEZA47PYz7k1v/4LxyuKrNPBqKRusvUMXMGFeODuv4CqMVIqx2
/Li+uO70/rE6dfUjqjIBVgDaDLxxGltLEewcp3B3jlp00G0mrInwWgO6ZP/0hLTT
Z8FmT01BJY+eKXf2BUia6TbiPJCoSzsScESJ/XdnOBGOyRl1azEtEz+pg8oyHDJQ
3lZRCwqE
=LRuk
-----END PGP SIGNATURE-----

--qlbwlyxfaaldjv5l--
