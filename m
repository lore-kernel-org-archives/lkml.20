Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05F621254B;
	Mon,  7 Sep 2026 12:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788783392; cv=none; b=QgNhZq69u8aIF1ayFkCLVze+lgZZvb2sXX1u4Vjebgwzptbl1l2WfvcsYglfeDiOht7jQ/QEJvoLu624WnHcWkX7ksOhidMr4bA+XX8OJIa4TRuq9/2aIMWYYj7XiW2mVOnltEJYRKN+WfmvMyxiS1Q4VovtBntQNdbazpPaU5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788783392; c=relaxed/simple;
	bh=Ol5joPhV5t0sUqWABA8R4lINTJxPplGa32CwRPrg3G0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VbIK4JlMOvmd6T8BwLgErxWi3xJhk8d2EeeBIdJbpV/74HECVxpbeEhUYM2IVC4ExlQHnXV916ux4wcY+eWro38+MQTMh3td9s2q+i2ZLh1U+IoJ0/i1b5oTvr0oZX0+y7aqhAhOXY4WB9/54iMvsbg2gFqCVC2hxe3JY70wtV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k+RVAP90; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k+RVAP90"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 799911F00A3A;
	Mon,  7 Sep 2026 12:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788783391;
	bh=u19xstXPTruD6D89wrkvMFVSAXRrUNsDkBJko6FhzaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=k+RVAP909v68f97bjGggfKFgBe4mZF1aKCAsoxgGxDLTIT0Er2a2aYhPlumnymRey
	 BpHp4mrgFD7LaUi4aPQo3ECybxKI+i5wXtIUygdDtBusCfkHH8niXiJBp4b/B8Brvi
	 3PAusTzZ2aRjNodyGiLjsoX5AOt01Lfg1QKYdbM80rLxfIvLA02kFymdR28M4lL5j5
	 9U3gPpQZ4qBM5o5qy99vrX9kgxI6qA7e3e6fxcVWy8xA4LiEHJ4nmBz+5uJ9uSwT5+
	 o9hoCGni28psdn1pr+DR56bLmB90tqzpecrxPUW81SPu1w/OgkeQqwRFP5OUtUTijJ
	 NVXa1Rm1tKFMA==
Date: Mon, 7 Sep 2026 13:16:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
	Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: Re: [PATCH v4 01/10] ASoC: dt-bindings: qcom,shikra-qaif-cpu: Add
 binding
Message-ID: <cf99b19a-7293-45b2-8425-17ae7b252f08@sirena.org.uk>
References: <20260903072902.3870009-1-harendra.gautam@oss.qualcomm.com>
 <20260903072902.3870009-2-harendra.gautam@oss.qualcomm.com>
 <20260907-arcane-sassy-fennec-afc02a@quoll>
 <CAC-tS8BVw6hbgA82V1mYL_3CG4Jdodr-DQbGfM4FzMMdCLbc0g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2NerzLZu6RuYkGeO"
Content-Disposition: inline
In-Reply-To: <CAC-tS8BVw6hbgA82V1mYL_3CG4Jdodr-DQbGfM4FzMMdCLbc0g@mail.gmail.com>
X-Cookie: Who's on first?


--2NerzLZu6RuYkGeO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 07, 2026 at 05:13:13PM +0530, Harendra Gautam wrote:
> On Mon, Sep 7, 2026 at 2:00=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
> >
> > On Thu, Sep 03, 2026 at 12:58:52PM +0530, Harendra Gautam wrote:
> > >
> > > Add the Devicetree binding for the Qualcomm Audio Interface (QAIF) CP=
U DAI

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--2NerzLZu6RuYkGeO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqeqxgACgkQJNaLcl1U
h9CsYwf9EqVnum8Us6ECwQgyy1wRJu6t4pKzOp7Q+q8uCA8pg2vMLCfoVpM3jqg+
ntvjWJcL3VbRxt6sadd1KHz1/R/Axnv8TKcLeKOPaIYZwxantx7fmcEBvfupPwmw
uEz7nP/hOUZDL56+0LGMJdpMX2ij0uJOmqLkcm4nU0dQ7h5p/q/IMJTYRNSpjU23
wpHV9UGOb3ultsp75k5vp/xDaEPSAFcUcTHT+5QorqRaDATI27Lg3LKjiXH4OW42
1mz5fkw6WQ1mgqYE6KfBu40ATbOo1VUmDID3qJPxTpCzJ6z9NK6XA3zSuvxbgYC6
mZ4NegBJFy83F+iHa5DumXOZI3mqFQ==
=yk8W
-----END PGP SIGNATURE-----

--2NerzLZu6RuYkGeO--
