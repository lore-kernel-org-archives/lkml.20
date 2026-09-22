Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BF65172DA;
	Tue, 22 Sep 2026 13:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790083789; cv=none; b=VyfqGCRyqE6lVcnLyenMsKc7Xh3RAPiwNcz6/7hZRf7wEvS7tj2k7nocDqA8B2WGUZu5g1GYqipz8S2iC7zi/RSzqw2BTmyx0pYhdCI+EKvAfaFnH34DjTsOvli8OtgJIhacMEPgiHu5ys8cAQ4Zk2QOYoD8u2scE9S47FtjG+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790083789; c=relaxed/simple;
	bh=xtcNsLl5jTOZXJyrT7tx34yxMh7qbBAnY20/Q9krXqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Obq+xQOXHgWCzUSaTpjrcYgvphFN2xZW9vHg8b5aAJpaWWDTVfMltaVkkVxHpmZcjh1JDZ+afFjYv1qMGMmvbI3rlYBBgiu/UzRxBbCJ376YZd5YrIfRt/nHR7qidMnXpUMyqeURNsKsV02FZT2LN9YhZY8ZrJWhH8P90AFegsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CybFtnFG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CybFtnFG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40A4B1F000FF;
	Tue, 22 Sep 2026 13:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790083787;
	bh=xtcNsLl5jTOZXJyrT7tx34yxMh7qbBAnY20/Q9krXqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CybFtnFGf6HBhhWrePPT0mGJ4VgsXz4HEu7VBlfYvJsa0NhJwIP7LpOJFUQBouljY
	 jkSPW0MWjoHuAgc2LQUTuccyFa2h8nRtPrJNaO9lAtL9RWAv8fU69B9hxx747+duio
	 S1mNJlYeX8ynJ1XnNsuhGaQgsDZT0K8t+T+MSqJGiZhRzjmS4RLrne4E4wvuiJqEVU
	 AmpumND+w31suhe5tenQuAdVZJcnjLEDGdtqgusmOYn/vceuNn0rxCIlLHSJ/Fr+mC
	 KUOoc+N1g0Uc4T610ubRrdOSw14XwO9KzbFHW60eC0u5oc5rhGFUnFR83eF3gPuIp3
	 je/YLZzcTrYfg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id C20601AC56C0; Tue, 22 Sep 2026 14:29:44 +0100 (BST)
Date: Tue, 22 Sep 2026 15:29:44 +0200
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Maciej Strozek <mstrozek@opensource.cirrus.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 7/8] dt-bindings: sound: qcom: add Tambora WCD9378
 SDCA codec
Message-ID: <arKCyGhrncxnO1ss@sirena.co.uk>
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260722234221.884765-8-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Spp2tVMuXoBfp6rb"
Content-Disposition: inline
In-Reply-To: <20260722234221.884765-8-srinivas.kandagatla@oss.qualcomm.com>
X-Cookie: Too clever is dumb.


--Spp2tVMuXoBfp6rb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 23, 2026 at 12:42:17AM +0100, Srinivas Kandagatla wrote:
> Describe the WCD9378 SDCA peripheral node (compatible sdw20217011000)
> driven by the wcd9378-sdca codec driver for headphone playback, headset
> mic capture and jack detection via the SimpleJack SDCA function type.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--Spp2tVMuXoBfp6rb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqygscACgkQJNaLcl1U
h9AUtAf+NOLkuo+uf0k1OWo2RX+JhZeRNKGYRJyAh3O8YVKUgZNCgcF7JKiFy66t
Z2okenl4ypJLf7YWXmilQSn2Tvso5VlkeKBKg4xSrKNHt5vZ7YONGsOWeG51MPvv
Py5wNpHE47qa5UUR2EC6XBzJc+6ntvTjIRwpBEtLzcd/e+vqIuyV8sKyJhNwmdXP
eVspx6mMOS4I8IytyhzdE+5ELDddV+WyIY9e4e1KJFZ696AB/8oVAxyG3VfSfRUQ
UL+O2p6On0ty6PDHPWFO1KjaAOeat/o3BStUJR7c4Km0QQxm4J3tt8NyymwRJqlj
Fl2YyLtGZ+c592IdOS81t5TvUW0rPw==
=j7Iu
-----END PGP SIGNATURE-----

--Spp2tVMuXoBfp6rb--
