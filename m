Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7934CA271;
	Tue, 15 Sep 2026 18:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789498414; cv=none; b=LueUwkE64LGXf6ZE0xDF/bhikNnogu1LJ/88FqDSTIFz/4xACR/3jVTJ3eA5Uvr9NkFj+lyAu18aRRFAjjLXIjOD3tgtQNiGcsskLHAt+FxSs8nAlKRB8t7Dyk/xvtjkhLAqXHgZ7EltGo7cRTkL/Yv4irFq6V2lgmX30xqNjGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789498414; c=relaxed/simple;
	bh=sdsbEFsssWzRsphZE7H3Fpxb+1wQm7XXnSOm/1wxa2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Siw/KUjkrV46ZwB/ZrHkxd8h9Dn5jrgwDp9Bl0pT1kPSVwAVZZTeoTUA5VF46NXxXX21qGx+Un4BpgrFjcP7KaUIttdFDMrNQ1nhetKgHZhfUB1NNCo7zQc+vB2i62GaOiGtIuqpUFMryqEIi37YJxCBBZ3gg4qXCDYVaBovVv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ad3xzv5k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ad3xzv5k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6D981F00893;
	Tue, 15 Sep 2026 18:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789498413;
	bh=UFz2xTqyV2U6wfcs/i9b3YVTZ8YTwk7BzSeH8eOOjLo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ad3xzv5kIRyrCADPmet22+fj+2ISqrCrDr5m31Ba/PcUnEYlOfx32rLqdpJHhz+eO
	 Yi2Jh0x9slMUyWy+OIFBuU47emq0P+Xc2o6Q2Z6lRy24AnNQVit+QYhz4wq1d+DkWu
	 bb4p1mUlCBfPqUA8K00tTNell0dBAK0TbDoOkNZUS7BkbCQSTqfy1LXXtm8nL1z/uf
	 1eKnPvNCefHbGo1l6a6j5j+ZU2o2RJ0e+XNfMXQRLxXAzNvWs0oQNKA16Jx07sNb3U
	 ognu484HQKt6mAOuW2OoGm4sGdcVAtEW89AuaTXw1ZBe6a+W16/EnilN/cJYN7MKx8
	 MPJyaEy44lh8g==
Date: Tue, 15 Sep 2026 19:53:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Baojun Xu <baojun.xu@ti.com>
Cc: tiwai@suse.de, andriy.shevchenko@linux.intel.com, 13916275206@139.com,
	alsa-devel@alsa-project.org, shenghao-ding@ti.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	k-yi@ti.com, henry.lo@ti.com, robinchen@ti.com, niranjan.hy@ti.com,
	pin-hao.huang@hp.com, Syed.SabaKareem@amd.com
Subject: Re: [PATCH v4] ASoC: tas2783-sdw: add firmware download status check
Message-ID: <ed7fd58d-e36d-4d40-afda-fb9937ed1e5f@sirena.org.uk>
References: <20260915035223.1518-1-baojun.xu@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pCJcuhKfiYZaJZ3I"
Content-Disposition: inline
In-Reply-To: <20260915035223.1518-1-baojun.xu@ti.com>
X-Cookie: Void where prohibited by law.


--pCJcuhKfiYZaJZ3I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 15, 2026 at 11:52:23AM +0800, Baojun Xu wrote:
> Currently, the firmware download is unnecessarily triggered on every
> system resume from suspend, causing significant wake-up latency. However,
> this step is redundant if the AMP remains powered on.

> -	tas_dev->fw_dl_success = false;
> +	regmap_read(tas_dev->regmap, TASDEV_REG_SDW(0, 0, 7), &val);
> +	/* Check if the AMP is in reset status. */
> +	if (val == 0x20) {
> +		tas_dev->fw_dl_success = false;

Don't we also need to set the flag to true if we're skipping download,
what'll happen if we get here if the firmware was downloaded prior to
the driver starting (eg, you can probably trigger that with a bind/unbind)?

--pCJcuhKfiYZaJZ3I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqplCcACgkQJNaLcl1U
h9BAKAf7B64HpvTg8P8ErHFv0eDDiBJO00Ta4EUvgOzDvIImM3RRbxEu9b7oSUvL
beaFxVa25q36Nfm/+WwGfk4IzOV4NgbieJePGrDFAXNCMi+9b60/yx8uhZzrPEJm
iD22VMhvMgHCVfvZJ7WhYN385Yvt+yrqnGoFvTgdXhLF1jsjIu94yhexqcu4vYko
YUAkLzHnIz9meIYvH3xvUX8RyUozTdO2uE9FYHXpMKHFBjVjIiSyvhibYEHhhJw6
uw0Ihl/0ZhLsqEz3Z//swUR5l1wAV1F1w2nHz8ifwPZDIAEscMcUXBz/NuDTVdZV
JycYnQQREcemniKKvVaWBjIg5HcOhg==
=zuyA
-----END PGP SIGNATURE-----

--pCJcuhKfiYZaJZ3I--
