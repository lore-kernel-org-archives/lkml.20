Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6CF4F3919;
	Mon, 28 Sep 2026 17:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790615284; cv=none; b=pq75WaN2dVoOqaZbj0wM1flFyKN+ZqxTcINCnooKnwDMUnKbcWqyuPQ6q1u5w0nsI9lRuLni9x6h2QI6As46lBaGwoMpYC0LvQDSpWXIEy9zlwfutcUBNPAMuKaRXBd+z8W62OUXzsGISXK/4X20VgDVuXfWXy6pCbs4QlAJzS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790615284; c=relaxed/simple;
	bh=ppjtLoF2uJxfdEZESBEHv0VnKln4KUUZLnKu7NT+CGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OkxcBVcIxotorenRqwQDrBidM0QDHD/snC/d89lkSR7OfNvrHDMJV22bObhU3jNQZYCSDEO8goHHSULRLv3Y1UVH9lLOTcZh7/i5gjP8yDQdwrvoJKsItB6BY585HHZIaI6RJmV2JCmOv7bRSGc427kdTpBtIognIuRSjcMpKMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QMhrUn6q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QMhrUn6q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A15D61F000FF;
	Mon, 28 Sep 2026 17:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790615283;
	bh=xioY3pJFjTXazQw7aX3NZ8SHP/q8PQimHs7T5kdqk/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QMhrUn6qpEbTMtmOhJD6NzHOJY5KDiRMzgX7jplGbTRMN7C9pMTAxlqV212KSoDHE
	 MVsDyPcCPjFok0yw0znt5nXPDgHp9L7kGlmmMo83PeIe5md+pGZ+ucCvny2Z+wjc/k
	 +M9QCEoKxQGRm5F1L5ol+n3Phao351K5Bl0gFSVNNHwsWfPghk7uZK/QNNtVEiLfO4
	 Wx/VYl6bN7U6GpUgsRN7CHVjJQDnpXiOPFXKeSqOnLY8UtDt1Tw2MZfkuNDQSAzORS
	 mhgBGRl5xqGJ2qw4YTPwKAffoqDChjYxdkXZ7sRlXlnGX0Cpd8WKWH67CcUqorwB5r
	 14dPmZSm89JnQ==
Date: Mon, 28 Sep 2026 18:07:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the bluetooth tree
Message-ID: <bdaf001d-16f3-4ce9-ae21-02d95973cc2a@sirena.org.uk>
References: <arOMTa0L7QhM5RyA@sirena.co.uk>
 <96944c10-2a31-4e54-923f-97a608663221@sirena.org.uk>
 <CABBYNZL_vs+_MudyOBDK+pBJtOYcEEE6snUhU_btwAuW0RTjDQ@mail.gmail.com>
 <647ed0f5-360b-4d05-aaa9-9f3ade6f6b7f@sirena.org.uk>
 <CABBYNZJKahHw_GXhiPKYH3_br7WWydH_YjGDJ4LAwOECLG4c2w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IbJLyCInA4SaH0U/"
Content-Disposition: inline
In-Reply-To: <CABBYNZJKahHw_GXhiPKYH3_br7WWydH_YjGDJ4LAwOECLG4c2w@mail.gmail.com>
X-Cookie: All is fear in love and war.


--IbJLyCInA4SaH0U/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 01:03:30PM -0400, Luiz Augusto von Dentz wrote:
> On Mon, Sep 28, 2026 at 12:27=E2=80=AFPM Mark Brown <broonie@kernel.org> =
wrote:

> > I didn't spot check all the rest but there's a bunch of what look like
> > duplicated subjects.  If you did a merge then both the fixed commits and
> > the original problematic commits will still be in the history.

> Interesting, so back merges seem particularly weak regarding
> duplicates. I wonder if there is a merge option that can eliminate
> duplicates, since I don't think there is any value in keeping previous
> ids if a new merge changes them.

No, that's not something that any merge can do - it's one of those
occasions when you need to rewrite history to drop the problematic
stuff, or just decide it's OK to live with it.  I'm not sure if anyone
is actually going to *care* about an example like this where it's fairly
clearly unintentional and there's a second copy with everything in
order, but it'd be nice to fix.

--IbJLyCInA4SaH0U/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq6nu0ACgkQJNaLcl1U
h9Ag5wf/dl6eRlZwRMZwGxLgqHTj9skBKHXpUpy77L0LHmqpZhtH444kFl6ssu3k
rhS9tD2FFKAL2JDzplQ16dv/Ay5OJTPPWulJIXpSJse9yj2vmHNhUb71/4dBHzHD
b8n79wp9uV1hn17kB2uYD/vWtIwNiqIyMz2ZNyBStSMCU9nbzWK3zHFfu52TaTyP
01KllAJ4VrYee8BNidGpOzxcHEYODOAaezpfiJyftMVzfaUyPeKdFL+CT73Jvrzd
+8sDxaNb3HzrxQyuRmC3xxhjuYi7ENcXBpEsEDSv3WEDO/BO4KDSs8in2ufcF0Hw
E23fF7iyltvyFTvkkew90FCJvFIlyw==
=zP6v
-----END PGP SIGNATURE-----

--IbJLyCInA4SaH0U/--
