Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253F342E433;
	Tue, 22 Sep 2026 09:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790070012; cv=none; b=pXiJzpeC8G6X81TEAK8H52XxwTeW6q4nKZT8r7HrprAZcz/608D0ziuHTbCQFR6/F7X+Vm3hOUchjYxCp5vecny4Wp7Tpqev3Yrzj87eupNZ9jlBFesCD1DJLCmcNFeNZX7gZLdID5BL6mClaRG4Gzm5FCHej0afmiiQ5R0SfO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790070012; c=relaxed/simple;
	bh=8jA1JPX27gWHpKU4wbsjPK+E4YDQ+ZhtOnHivw//Qms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dM7pwiAjndikLLwR11kfQj+GLYvykBKhyHdRozL/bcMv6BWnimn5Puv9oQp5C6viQP2M+AQMsO3tH1AEHVsr75nb2kBYOVKEzApr5eOeqApF913M9hVPR/ev7Pov+lVDZw+QMqQowCKcX2ydL7mWWYju8kslp7FUrWwjNLs7FQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gttJZJIB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gttJZJIB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6039F1F000FF;
	Tue, 22 Sep 2026 09:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790070010;
	bh=nRVbSKooV5q3Z4t54uJjI032LrLl8u3rgOm1tgXb0/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gttJZJIBPU6yu49JQW497DsdD8cozyJ6vUM3kJULoUGE2U6C5TBBOiLDcgTXzoW5s
	 r54ouAgn/p1PiAu/M8BLBtn9v22T2gk60BUpP9H1UT8Jnw+HCTCcslu0Vsjx3kh2PQ
	 I/ajRu55o/ja688x5llRyteWYPbzAVxKyDBSZahp5KNUjh69KPPyW5w8DKt11R9wAL
	 fxoijxvB1W+e9DBJOvD+jN2CD9C2Jrl4O57ze6rk/egwUn4r6ptQUhNX4CyXReELrp
	 ZGuf1MZPx6CA8o45CANtck5zr5LC60m1XA7/y1Wooil53FhqFztVkyOYbcZyF2Ve73
	 lfR05hyPldLAA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id E0A4C1AC56BF; Tue, 22 Sep 2026 10:40:06 +0100 (BST)
Date: Tue, 22 Sep 2026 11:40:06 +0200
From: Mark Brown <broonie@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Amit Kucheria <amit.kucheria@linaro.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
	James Schulman <james.schulman@cirrus.com>, asahi@lists.linux.dev,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.de>,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 15/28] ASoC: tas2764: Set up V/ISENSE on codec probe
Message-ID: <arJM9sXdWfwG8pTH@sirena.co.uk>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <20260920-macaudio-v1-15-741cc20a74e5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Rq4GwTtm5EILK4PO"
Content-Disposition: inline
In-Reply-To: <20260920-macaudio-v1-15-741cc20a74e5@gmail.com>
X-Cookie: Too clever is dumb.


--Rq4GwTtm5EILK4PO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Sep 20, 2026 at 02:53:54PM +1000, James Calligeros wrote:
> Setup V/ISENSE on codec probe rather than doing so on every hw_params
> or TDM slot call so that it is configured at the same time as the
> rest of the codec.

> +	if (tas2764->v_sense_slot != -1 || tas2764->i_sense_slot != -1) {
> +		ret = tas2764_set_visense(tas2764, tas2764->v_sense_slot, tas2764->i_sense_slot);
> +		if (ret < 0)
> +			return ret;
> +	}

What might set the slots to -1?

--Rq4GwTtm5EILK4PO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqyTPYACgkQJNaLcl1U
h9A8Dgf/YVxxeDNgI8TYSdUtT7k8WyvNOdz9s9sSy/9K9LFtGc457BfdNkxhMOwk
BwRLKLqWCYtxLE6kA/pJ8BUUD0a4xZxtY8UwzDlBPYMiYoNhD6eKizxRlGxC8VJ0
6QG0qKj9EYAspe2MJkeuT9CjkGiYwPHmTNd11L+bgNbEJRJQvVDKq0Ge16dGwQsf
/uZr/G9wABPzJ04wvZD25hNy+IFHM7bcZkjkw7camfmIZBCcldUpPJ0IT4aGqDTs
zNB1cxG6WBB/qdz9bCt2xMyBBXw66bzVsZZ2un4XXtm4xV2LSzZq13G4IMiahJ/j
aGqvygWw91+YFiO2Oo8tiyNTWKqltA==
=5PVF
-----END PGP SIGNATURE-----

--Rq4GwTtm5EILK4PO--
