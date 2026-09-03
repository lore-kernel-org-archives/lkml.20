Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941C217A2FC;
	Thu,  3 Sep 2026 21:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788472132; cv=none; b=ZlSnt1V5MVoXEx0cGFwi3GORK2nGD4WZE5dew6Tx0f5WXDAFLW9Or3RXC0CBcwPGILWW8yoBs+ycL4e8sOZTp6z9WWuJuVZZ6zADeEMhZ6+EyEMB6Lwnv83P3x6W98lkzF/U/CBR0+gvQSC+G+aJ1O5oFP48EEQf9Pe9/tgXl8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788472132; c=relaxed/simple;
	bh=RoTh620FQ2N44q1Xvh+EaErHOArRDRxsxQTARbpw/48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X2qAs9vqU2gCTUO4AZzJTqBmJbAxqtG7UVozYIFhunpBjYCVXQdQYQy4zYO8Me+6Q+EtegrVgobP7EYVHZ+wpUhCkfHzwLI+37ZHg/i0hTdIa8I0KHxK/fzbOBqAbRUvftdBT3mnpNwiqIUSiLy9cfZUpCes6ZHB5BP4DNUrHSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BFMFDVM3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BFMFDVM3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37ECA1F00A3D;
	Thu,  3 Sep 2026 21:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788472131;
	bh=quKv1rg6pN+umTyA545IWVQ1rBGqQJEp9oxgK3g6RGw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BFMFDVM3yEgciUwtoLDAAByrSVF03uuc1pkH7HG9T2Bv3gCgYOTe4+8EVX4cWXLpD
	 Kcp+2mYzPrBN/Dik3bzhdZ8gNIb0i3xgTKWFtTVBmWE9FkJmmmNZ9bR77YQ4Bsd1Pz
	 8xQwunwMljim2cv1I3uFXvl/YUwBHGWqKhue9vLuTySNdQ/sXZOpojMvbQ34GBFi6/
	 /wXaP/5oY0tHpsq+GcwOZB8svsTmyrlqdbl4ZHKzJfPIYrNBW/zGOvvamQRr5KFm6T
	 fJdR2nZR+ZUKYRc9+Cpg8LdD09oGA7Tkh//tdXMOxZKNVnBuNG7/dZu6GKatFy/NqF
	 CrWB7zhwVDtuQ==
Date: Thu, 3 Sep 2026 22:48:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Gary Yang <gary.yang@cixtech.com>,
	Fugang Duan <fugang.duan@cixtech.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	sound-open-firmware@alsa-project.org
Subject: Re: [PATCH v2 10/12] ASoC: SOF: mediatek: mt8186: Use
 devm_of_reserved_mem_device_init()
Message-ID: <df541310-cc36-497e-b3c9-5ad4f15ebfce@sirena.org.uk>
References: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
 <20260902194712.2003414-11-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="adSxNV/7OHX/0sHK"
Content-Disposition: inline
In-Reply-To: <20260902194712.2003414-11-mukesh.ojha@oss.qualcomm.com>
X-Cookie: One picture is worth 128K words.


--adSxNV/7OHX/0sHK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 03, 2026 at 01:17:10AM +0530, Mukesh Ojha wrote:

> -	ret = of_reserved_mem_device_init(dev);
> +	ret = devm_of_reserved_mem_device_init(dev);
>  	if (ret) {
>  		dev_err(dev, "of_reserved_mem_device_init failed\n");
>  		return ret;

This should update the error message as well.

--adSxNV/7OHX/0sHK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqZ6zsACgkQJNaLcl1U
h9DZrQf/YSIAHnk7hN7pE7Wn/BXo7i2+AbAx760M7Jjj4JLAx4B8xR3G/roBycBa
YlMdDcPSgyZezWgNZIQqCLEB74saROdDr+LhPEEdvS/NHEtGrmizgYrrsfckCNL8
o06imN4sCBPtRuYEz3VHAFwyvfh0tjjfCCX5XMA8O6TvzuI34ZPFlj68TBH37s21
3kNBWJ1q/I5WXVDLATLAYazVhaWyqpVk9ZkM/s6N68wux/FHfefKGXgE8ybX5x1W
1eRkWUr0NBRfYxGPskc0rE76rM2v/zEocyTJGvEpLSdLnM/X69iT+AZ8bu5LRvo3
P5ZJaZqkXfXR2WTTRJ3Hc9HCCgT6QA==
=bK8O
-----END PGP SIGNATURE-----

--adSxNV/7OHX/0sHK--
