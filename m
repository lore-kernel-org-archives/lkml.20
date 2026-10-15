Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92AFB3CFF6F
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792069361; cv=none; b=Q9eNPymucsrPsSul4bR0pXjm32u3O2cikES/ioH2l6DZd0mUerFhk+3gFEJBWuf4jRPIWLg0j1FfCaVNdanf/MAHGcmLrxioGLUp4py3zforzJZLZ9Cuk4BQLDwdDyMdK/hx2q7J4WwDc0GzDYNjoKGDmh0MKBiGCbI1u64u0w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792069361; c=relaxed/simple;
	bh=AmWwc1pdAMoghlnL3CmIhSD9UxIN1xu6Ls03Q08vplE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GdCYhES8tZMNiqNuJKH1IThcwWd/560PF3SImShbGDTxhSPprQgKhVPgTBZPH1OXrIxeFQHFrph00/7+GhfYP6mCJjBgXAd3FF6sGahelLYKwc+QLNYir2xBFjuq6ktdm2O2Br4nLs07Bma17FiFGjYNYHDjAJe33CN7WZ994eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oTMOKU1t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oTMOKU1t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBC891F000C4;
	Thu, 15 Oct 2026 13:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792069360;
	bh=yBPzx+uGVOr4Q6fKVMed3XqaUTMvbACo0SmUrYnsNCw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oTMOKU1toKNsK0qFQNdH803k0H0HblVaIt86xYfDuFOLqgAYkPlxMxhTfjiuUGo8E
	 OtWHN+aYURAmiBOB8CzFkADc85ffzOMWuL+toafLHPnu1GEKw1OHQQRtlvP/l9yqrL
	 DVOsD5CN1WZC3b/jmF6uoyGXwc/9m+QK3Sk2NCtmSzMFKrwJgFBH+61DsXoB5Z3oGD
	 2B7gKhOlsnjbmsGumN/yK/fujj0r2qe5RSZDFMpjffBAewJ2+HFM45yJYpIvJfX0gW
	 QXACNtmhi1zp2z1o8cuYNIfIRRhIPeW86aIUEdB1/BDAva5O64cdewQN45GYYsVdW/
	 mJWmE7whjQLqg==
Date: Thu, 15 Oct 2026 14:02:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: gcs: Store GCSCRE0_EL1 values instead of
 userspace mode
Message-ID: <bea663db-52fa-487d-9134-606094004f7e@sirena.org.uk>
References: <20260917-arm64-gcs-store-gcscre0-v1-0-3c9fa9213bac@kernel.org>
 <20260917-arm64-gcs-store-gcscre0-v1-2-3c9fa9213bac@kernel.org>
 <as-8IqsbMbOBo5Oq@arm.com>
 <c39b2cc4-832f-49cb-8a59-e5b7a8bd9317@sirena.org.uk>
 <atDBVHvDQ3Pwr2Uq@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZxYMydLMYgrvLhA5"
Content-Disposition: inline
In-Reply-To: <atDBVHvDQ3Pwr2Uq@arm.com>
X-Cookie: Tax and title extra.


--ZxYMydLMYgrvLhA5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 15, 2026 at 01:04:36PM +0100, Catalin Marinas wrote:
> On Wed, Oct 14, 2026 at 07:28:08PM +0100, Mark Brown wrote:

> > We also set the mode from ptrace at which point it's being set for a
> > different thread.

> Could we do like in arch_set_shadow_stack_status() for gcspr_el0 and
> only set it if task == current?

Yeah, that does work too.

> > The case where a signal handler tries to handle a GCS fault by disabling
> > GCS could be handled using prctl() if someone wants it.  I'm not aware
> > of anyone doing that yet, there was some talk about implementing it in
> > glibc at LPC but it's not been implemented.

> Just thinking, if we fault on a modified field, a handler using prctl()
> would also have to update features_enabled in the sigcontext, otherwise
> sigreturn fails. I think that is already the case today for disabling
> (the frame still has ENABLE, so sigreturn returns -EINVAL). prctl()
> changes to WRITE/PUSH are silently reverted.

Yes.

> Another option is to ignore the field on sigreturn and keep it for
> information only. I favour the latter, but it needs to be a separate
> patch for discussion and a change to the sigreturn text in
> Documentation/arch/arm64/gcs.rst.

OK, I can do that.  I'd already prepared something with this as a
separate commit before the other two, I'll revise it to ignore.

--ZxYMydLMYgrvLhA5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrQzusACgkQJNaLcl1U
h9Cwnwf9Gx4ar59q2MShlfkqmo9vs8osi96N1I+JJmBry5qav8fHpEOlhyMduFpi
dZ/HF0zKMadR3kpTnp6qF+slePI/s0J8tsCLM8cksD3uKA/vTBvElOFyFsZe9iZz
ekTAoUASVzKwK3ckTgF7WBzjGdOlhHnDGTAG7+H4rY7EHIkJWBFlKDuc443F3VLQ
TFV/42CmPyfhutPgy/t5mfzqaFj47Tm1EqfvULuoyka5m2Y9VMHMSVs8k0GqYjPE
aiIAENRd+FKI5+cu22XJwCsTlBrLN79UCf6jttfwkm0HyQF10UX/m0NQly/4jCcl
CrewZT+dhw4wp63+75gAgrT/Z26K3g==
=CbSG
-----END PGP SIGNATURE-----

--ZxYMydLMYgrvLhA5--
