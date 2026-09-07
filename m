Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC0347CC8F;
	Mon,  7 Sep 2026 11:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788781432; cv=none; b=DpCJNp96QtnSBtHs33kYhAY/rgsJn4hVMjpIW3wqpCkZjnJYuKmsyCrHWrxX1Nlr8MlKzEcKjdokshMW+NT1/9yZwEBKdIC58vOzAFVVKpMjiZnLXlUohzonb08pqyXa9WxYXb6dStfN9T8ktcKxvJmqiBsAOZobPwuLSVZGUG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788781432; c=relaxed/simple;
	bh=n/dT9uVSEzsQT6bua/x3pmqORG2+HA600we7UenJ8JI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DeGLJ1sZNZyyl25WlM3obxXTitgA+MMKtZYQ7ZWf2ywCPcNa1o5K4oCzVoiXWeRGvNrII7RUp/dkHp6BTtBG3O9ycv/a76vRkUPZeeJOyeuI1JZUgYqeTnaxSqwkTDOIUl9OLFMxL0qLOgnq9mGEtNG6YlS6v1Ca+wajAUxOrVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Br1wiFFK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Br1wiFFK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 613611F00A3A;
	Mon,  7 Sep 2026 11:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788781430;
	bh=8G8kMUtb7xhTALdjrDj16wG0Dlmvzs8Q3IGvtEfDbkM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Br1wiFFKfiTOhhBdGLScqVwQvrR1oqcgBBHuE/fqoUywsm/H9lzxiCFvNnMLOaqa0
	 xWBToJ93V1bt4QY5BBkOs26F0a2vrxbPcG1j8Tq3q+3H0tgY2BYIWXxk5l1FFfVbou
	 hqQpm3saIBgUkWl8uu+v7040I0j+WzonLTuot+gGD3kNwZ+9+MCpVJdz9zm0OWtE2c
	 IOAYdrllaM2KS0RhYZTK+y1bLvyiRaTys0MBhysDGiyOmCepEL3maKCLGNol3s5NWG
	 3zL0HSoou4zuYPP0mGq6JpaM0U1IHIKoHCfPzjV/M5abDZmLEA1gp+HKA1I7NcFNhM
	 KFApLY9vnOn3A==
Date: Mon, 7 Sep 2026 13:43:45 +0200
From: Joel Granados <joel.granados@kernel.org>
To: Karl Mehltretter <kmehltretter@googlemail.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Gregory Price <gourry@gourry.net>, 
	Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, Kees Cook <kees@kernel.org>, 
	Oleg Nesterov <oleg@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Mark Brown <broonie@kernel.org>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-next@vger.kernel.org
Subject: Re: [PATCH] syscall_user_dispatch: Use CONFIG_SYSCTL for sysctl guard
Message-ID: <3c2w33rfeuvxeqovfjl5bardu26whjl75r5fy6uamrwn5ntzsk@6yar3ledwnnu>
References: <20260813062039.14567-1-kmehltretter@gmail.com>
 <rvsksbxeput4impcquq3kjxg6pv3ixovpk5or2mgtuifsu65fh@wuoukaeelovg>
 <CACzUYvRVi+XW2piwsBE1Lhe1Pg7Z_mNvFq2HX+da8RDpzTXxQw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xxtegaxnvux65pig"
Content-Disposition: inline
In-Reply-To: <CACzUYvRVi+XW2piwsBE1Lhe1Pg7Z_mNvFq2HX+da8RDpzTXxQw@mail.gmail.com>


--xxtegaxnvux65pig
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 07, 2026 at 01:17:02PM +0200, Karl Mehltretter wrote:
> Am Mo., 7. Sept. 2026 um 12:37 Uhr schrieb Joel Granados
> <joel.granados@kernel.org>:
> > I don't see this in 7.3-rc2. Did we miss pushing this in? At the moment
> > I see that syscall_user_dispatch.c is still using CONFIG_PROC_SYSCTL
> > which is never defined anywhere.
> >
> > Two questions:
> >
> > 1. Did I miss anything. Is this not supposed to be upstreamed at the
> >    end?
>=20
> I already sent an updated v2 rebased on mainline with an adjusted
> commit message:
>=20
> https://lore.kernel.org/r/20260822072325.51994-1-kmehltretter@gmail.com/

I still have the same question. I don't see it upstream. Why is it not
there? Is it going to be pushed as a fix by someone? or is it still
looking for a way upstream?

Best


--xxtegaxnvux65pig
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmqeo3AACgkQupfNUreW
QU/2+Qv9F640H39s7NBMfifN6V6ERkHKEpIXf/pRYPO+gtTytkRgdetImmyTM2dp
EUn1uTEN3GeSq65hsZMDbwxwbapDSNfriHCYedd6RYT+wQrF0Or7g1r020oUJD+0
Hf5eS8HHweO+GM8um9OVRqvWOJ75204JIGP9bKDoqeLg/S6fsAyRhsAIy1dvcgku
poEBg5GA0MyoKQ9wePl4u4lOWaYOzHzB4tD5bsu/UolLH+esTFtWOvezOdyQPkL+
K3cioBl4nOUXW0ICmI3l+zvCU7DRbt8r3x+7QyaAK24lLMamNC3tTWNHG04kSGP/
IjQVWHuqnOWKZ0j9X+MeGB0yF1GS5jUCd9FVQ42kVM5et6mnYxMaHf/q87SvCmg2
cGLQquQZFq2Go7QlMRfPegRFvhNlsx61a0AKa0NoafCMwVb7OoBWqAJeUtcU9dqN
O/ymAArh52dgv8jcF5q7iODdTgNpnhxM4EPcF/HCdOkt2bnPKPf8+VtOrohJQeAy
EbBcH/Q8
=UrPv
-----END PGP SIGNATURE-----

--xxtegaxnvux65pig--
