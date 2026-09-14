Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4C2476CC6
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789391702; cv=none; b=En6rCETgZOhQEEExFEr8dFc9yFIIrIRaPo0B/rdTqDswPF+mSPDzb+UGqKGBn1puHBBNrqQZNu5x6pAOhvx4tR0ON+04AEhIs5ybS/PTrwbWT0OzXBdoopasmgVSo6HWeEZodlm8Ln6fLfRUa1hUq/8hQPDsqVp0jHnOM2MqLA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789391702; c=relaxed/simple;
	bh=Wf/056cUaOPw6b0LYkM3dWwSABdjYGQgD8VYruvaN28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jaU4f8Lz6DE7y/0hp0BL+f6KjuG6Mt3D29bO5Y9knU74xlmP6dDebUEpaWfJFvbZiPdAc2H1BIUN4xMhha7DncHR/CUGgIXT8LCgvT7X74SfoP7KqxmvAfpYOUZj9PTlqo4X68nYpMG4XjNmEyH81AeiEzqu1n3E3qMwqVi/5Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=obL/gzEx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="obL/gzEx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21D191F000FF;
	Mon, 14 Sep 2026 13:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789391700;
	bh=yNX+pg6s++jHe739ZWXokI+Hzo3W+6ygLDhjO8GThd0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=obL/gzExmpLbw5n6yscg+VlDAmU7zCcu8aUd080HeJG+AmPI+fkWEFKNFaCwOVtYm
	 XTy3iTGI/iuhEy4rdNoTwCPluZ5m6LeL3yH/qAg+KaKbShE4YKq+cpA37NLtaFpfMB
	 19wz6V4mSSuRowK3kKIwWV6hhE1xZBlGs+vCXQ+VYnXtPYpME62QwXsQPtgENAXkEP
	 yAj/2h6vQ8JzAehE+5nymcLBAs/nZLQTBimn+57OplEQr0xfacUVK0QlZ51wrnbE/c
	 I6U1JeaCvXrNj4Wi3hoqT4C5WXnUKfGkyRj035JJ96ep6JYJytZBPxyVgoYQaH25rR
	 wxQ3PYvCswoEw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 7AF331AC52F1; Mon, 14 Sep 2026 14:14:57 +0100 (BST)
Date: Mon, 14 Sep 2026 14:14:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Stephan Gerhold <stephan@gerhold.net>,
	Liam Girdwood <lgirdwood@gmail.com>, Axel Lin <axel.lin@ingics.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 09/10] regulator: ab8500: Preserve OTP-enabled buck
 regulators
Message-ID: <aqfzURhgpX55Obfs@sirena.co.uk>
References: <20260914-ux500-dts-snowball-regulator-v3-0-7f92a365628e@kernel.org>
 <20260914-ux500-dts-snowball-regulator-v3-9-7f92a365628e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3Xns4qoZTjgVkA89"
Content-Disposition: inline
In-Reply-To: <20260914-ux500-dts-snowball-regulator-v3-9-7f92a365628e@kernel.org>
X-Cookie: My vaseline is RUNNING...


--3Xns4qoZTjgVkA89
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 14, 2026 at 09:46:08AM +0200, Linus Walleij wrote:
> The SMPS enable fields are initialized from OTP and may leave a rail
> enabled for discrete consumers which cannot be described in the device
> tree. Such a rail currently looks unused to the regulator core and is
> disabled when constraints are completed.

> +static int ab8500_buck_init(struct regulator_dev *rdev,
> +			    struct regulator_config *config)
> +{

> +	/*
> +	 * The SMPS enable state is selected by OTP.  An enabled rail may
> +	 * supply discrete board components which are not represented as
> +	 * regulator consumers, so keep it out of the unused-regulator sweep.
> +	 */
> +	rdev->constraints->boot_on = true;
> +	rdev->constraints->always_on = true;
> +	rdev->constraints->valid_ops_mask &= ~REGULATOR_CHANGE_STATUS;

This unconditionally overrides machine constraints, the general idea is
that we should always trust machine constraints.  For this particular
driver it probably doesn't matter so much but it's a bad example and we
really should update the DT too, and if we're going to enforce in kernel
then warn about doing so.

--3Xns4qoZTjgVkA89
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqn81AACgkQJNaLcl1U
h9CGHwf/R9wNzZDpf2IG6lb7twqj6FCOWqPzUYdRy7gGyrvsD/RnEAkrmqNWnuFj
CCq9nVGZrNE4dYnI1I1g5fs4Q0+JMDI+rRjh/jYklRemDdDJfjheS53CiWH83u+Y
pqiYKZPna0rgbLztXn9z+8FwI+7dV3QhSqo/IMTG/OeBkMYduWzyiCpVnFIyJIkK
t1pqcI2ZiOvn4ggBAyFO7uTttAjRVk9+1rYx4HJR07RsC+17iSOxXNhcPWketPjR
t1LOEjwDSlFQlhYwZWfRNvbXOWHBbbcl0PgJvKzJvCsqEdvK6/s2uY9YJ9vO4buR
yi/1I5OiAFlCfG/W+c3VlHvf8DrwWg==
=5uWK
-----END PGP SIGNATURE-----

--3Xns4qoZTjgVkA89--
