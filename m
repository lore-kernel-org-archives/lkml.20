Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E2C568FB8
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792002494; cv=none; b=cHGSrwU1PZ7Rlbq+YjbFnCU1e1LyydKjiR7l6uXOI99zJofXSTlqYegkpS3ZBOMLR9w4+t2+5FNCODhZeXZ+STxm1bDOFbIwv4whlPHhVF+J1PzwgGk3zgaO+5HrBKeLmolf9RVdkGdt/91ek4hiFziv6uGFBWe+dtRloWJ5OKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792002494; c=relaxed/simple;
	bh=9lv5lEBi8BQA1RI8DM77rZ8370a1/ZEY0HJy1ux5YbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a5YQ73RB4tSZso5k5F9s4csnuCR1kj0FTbCQWHn+Q3jEPx2e+oEQJ9VBna4I3nttCdwuXfT6orSO/aanlP9pgaTKJ9tOZB63Oq5gEUnBhOeuAKm/eZ+qXiN5EyZinjeH/JxfhePnEoxLjtS4ZsT1Xo6ACqRRzE0YLbPLoCuvfL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gN06LqC2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gN06LqC2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A47741F000C4;
	Wed, 14 Oct 2026 18:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792002491;
	bh=1FG/dI3SNgpPU4Bu7DcRd1rffp3ub89wihELCwlProk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gN06LqC2tjJ6VYjpIGDT1q+UakkgtM3aj6RkW8WoRsBC08dmHPleVLmpKzf4pWP8K
	 ERnwJt+Z6KBK1RLxT/Z4ZjRDbg0CFe5f0iM47ZXMWFu9wAZtgb3UdxQkqsWqQ2gUT/
	 jvuJi8LQs6XO0yHMnQc3+BVT/Kh/Bm++oyhgv/xa5t55P4jXHlVJJw/tKXDv8Axmh5
	 kNZqxw2k/h29fblvDhBFBv61Io2sAU/OaVsQE4padaFw4WEJ+oxUKQtZaI/x84W530
	 JPikfsOfanabG8XAN+s59QzN08AfBplVqgn8jQQyP1nIdtwxnaqeX4uP4HcMUvrn1U
	 oW21Jgix2xZ0w==
Date: Wed, 14 Oct 2026 19:28:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: gcs: Store GCSCRE0_EL1 values instead of
 userspace mode
Message-ID: <c39b2cc4-832f-49cb-8a59-e5b7a8bd9317@sirena.org.uk>
References: <20260917-arm64-gcs-store-gcscre0-v1-0-3c9fa9213bac@kernel.org>
 <20260917-arm64-gcs-store-gcscre0-v1-2-3c9fa9213bac@kernel.org>
 <as-8IqsbMbOBo5Oq@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z4+DNe/36eU2EIEe"
Content-Disposition: inline
In-Reply-To: <as-8IqsbMbOBo5Oq@arm.com>
X-Cookie: Live free or die.


--z4+DNe/36eU2EIEe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 06:30:10PM +0100, Catalin Marinas wrote:
> On Thu, Sep 17, 2026 at 11:14:17PM +0100, Mark Brown wrote:

> >  	u64			por_el0;
> >  #ifdef CONFIG_ARM64_GCS
> > -	unsigned int		gcs_el0_mode;
> > +	unsigned int		gcscre0_el1;

> u64?

Sure, I always find the decision about which to use in a given situation
confusing.

> > -	current->thread.gcs_el0_mode =3D enabled;
> > +	gcs_set_el0_mode(current, enabled);
>=20
> I think we have an existing bug here and it's more serious without this
> patch. restore_gcs_context() does not update the actual register and,
> with current mainline, we may even skip the hardware write in
> gcs_thread_switch(). Basically one task can disable GCS for another

Right, that's an existing bug.

> task. Can we get gcs_set_el0_mode() to actually update the register as
> well?

We also set the mode from ptrace at which point it's being set for a
different thread.

> On the sigreturn bug, do you recall why we thought we needed to update
> the gcs_el0_mode in the signal handler (or even expose it)? Wouldn't it
> be better if the signal handler did a prctl() directly if it needed to
> change the mode for the current thread?

In theory you could have tasks with a mix of GCS and non-GCS threads
doing green thread stuff, especially if the clone3() stuff had gone in
so that the GCS wasn't so tied to the thread.  You could also have mixed
push or write permissions in that case.  I am not sure that any of this
is a realistic use case though, I'm certainly not aware of any current
users.=20

The case where a signal handler tries to handle a GCS fault by disabling
GCS could be handled using prctl() if someone wants it.  I'm not aware
of anyone doing that yet, there was some talk about implementing it in
glibc at LPC but it's not been implemented.

> I don't think we have any precedent for allowing sigreturn to update an
> EL1 sysreg. In hindsight, we shouldn't have exposed it at all but that's
> ABI now. The next best thing we can do now is check the field hasn't
> been modified and fault otherwise (assuming no-one does anything with
> this field).

I don't think userspace is doing anything with it at present.

--z4+DNe/36eU2EIEe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrPybcACgkQJNaLcl1U
h9A+twf/SvrdXCf5iFoUVIJnYy0vstIxnbvlnm8Ng/nkRT0U38Wg0Sawsj4f8kQ+
e38vZSWOU4zXOjqyGBjtjT3QUd6JkdfxBBRFZsT8mMv+Dcn92i41yKCTk+a096E+
LSnUj/qVOP3iGE/4qbRqJbLkhTrbM/UeMmFFel0Tp29nLMakKnV3Df9/L+iwG1d+
iTF0yZCDMEyJ+wqAdnVfj/hhj0XFop4O81BxcSnKEpznhET2RF9yZWtYN6BWs8kK
AthpKsF2dogqkK8Et1ijxF525s31M51GeiDWL+S4doH75/61GRPed54+dUzS0JVG
MUtKCK/VA2vmvM4K4WhSJAgi44vPQQ==
=pqzz
-----END PGP SIGNATURE-----

--z4+DNe/36eU2EIEe--
