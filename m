Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3A04FC330;
	Fri, 18 Sep 2026 13:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789739498; cv=none; b=m3/JKnCuG2a0ebbj9GyD77IqoGA/ZcAzw3Hcdbq1T+Gnxm+2rNa4+7EndUytU7jM21eTQKsnP8w8oxsPVOqQzzzrwG8fWOOdNpjvY+dH5aHyayGsSjiTixXRrsh1uJdwi/Q8Uu+r1tiCxxTS1f36zK8vpgev60NEsFxAWCZPRhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789739498; c=relaxed/simple;
	bh=rTR4ztzBCDPW1Y88Mk9Z/bKbiBusF16gcM92q9ANAXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pifAsDzD75uwUI6IIylntwktCM7F5Bvmkn3kLPFEN+mSNP7LxGtZlp4iRTuLjYkzsdGlgRuNYVzLkZ0edClokCKqCsQHcLC5Xn6gmznMNoZiFCOeFNJfbcbrC/X1fb/tEjljpy/n8QFIQrfqgion+h01CIHtWj7yyMwSjXYY6hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VyGyyrBJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VyGyyrBJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 351531F000FF;
	Fri, 18 Sep 2026 13:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789739497;
	bh=rTR4ztzBCDPW1Y88Mk9Z/bKbiBusF16gcM92q9ANAXg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VyGyyrBJjzSSECzBbM1vrq1YCA51bD495zOeqSz80spAiow1j6hAV2QC+crIB6+xv
	 7H68kTO1QIHPEL4pB9+ng1ixcs6tGSh4ycKuqVLJgwi5ZOLiLLMoa1/AIHQcRunjMT
	 UYnqFwi1XcRemQWxBkyzcA/WfNhjUi3DKXwC6ZG6HPhSnZ47AxICFgi8HvflfYqUF0
	 2WI9YmF4jDICOABnjhs6zIW7tr9meVvBunC2Kyh9OEeQmNS2+/wk8yYmoxohwJAry8
	 rnyyUY8PWn3m7eKxxyvQEH0uw/Xf5Ps++hxxRLVOFVHVWsevaE9STRnX9pf/JGSjlm
	 YWniGk+Qbghvg==
Date: Fri, 18 Sep 2026 14:51:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Maciej Strozek <mstrozek@opensource.cirrus.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH v4 7/8] dt-bindings: sound: qcom: add Tambora WCD9378
 SDCA codec
Message-ID: <a1f5f249-622a-4f94-90d8-bd7cc33154df@sirena.org.uk>
References: <20260918131914.681588-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260918131914.681588-8-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ijPVOSlUlCKy8oKR"
Content-Disposition: inline
In-Reply-To: <20260918131914.681588-8-srinivas.kandagatla@oss.qualcomm.com>
X-Cookie: Dental health is next to mental health.


--ijPVOSlUlCKy8oKR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 18, 2026 at 02:19:12PM +0100, Srinivas Kandagatla wrote:
> Describe the WCD9378 SoundWire peripheral which is SDCA compatible
> soundwire device. It provides SDCA SimpleJack for headphone playback
> headset mic capture and MBHC jack detection.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--ijPVOSlUlCKy8oKR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqtQeIACgkQJNaLcl1U
h9C04wf/V/Z3a7aSNbkdHmkqi8s3WSbc5CQ9fkIH3nbz58f4Ok4a0Vh4tH7EhYvc
uRP8MAd56CA33lGB9Ln5Vm4LeDMVU6pSiI1Q8JBmpmE3fxJdNqfN5G+7/+6LU9L3
g5LsFx4b/iA/v2ag1cR0Agd4Lu1L32Adl4hrYfmBwxIXn3FW/1yZMOhchdxQ7hSq
xhjzIaLdL9QpiP8jT3w6sXC6g5ij+jpN0c4kon8n/E5bbqCf7iO4MzVDmnSScmZU
doC547geczigGtAgNlAuBnRTffiAJnrnRAvAqP6i3Zk08G/OokIKIIPvw0c+WhwV
BC26vV8MC4hJmlhHoBEU3jN2k0i5pA==
=A/Jx
-----END PGP SIGNATURE-----

--ijPVOSlUlCKy8oKR--
