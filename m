Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD69D457E61;
	Mon, 21 Sep 2026 08:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789980641; cv=none; b=lsJQ5j7aexNRbW5LQnNjV8uag4Pxajq4Fi5ZtpvlQaA0tKeHIr/LsBorb31VWQrpuTnvyQMs1OUginOa56PeX7vQ2hp2Lab7jwGnyMlFOFTcg5YyzeaDUlMOtW2KpR7wMenJ3yc7JRueB+ocGVhknY3M8sGQqUrnTYm4ci0ZCn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789980641; c=relaxed/simple;
	bh=ilb028/wR7+f25KSIEwjrXCPqkqI0HDaNDb1MVmOa8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KDXi7tpmpwoi3p+u1LUzV4xSAeWrpNeTIEUutm4H6tN+KhzsuRMIJJiyhrbBNx5xJ93WYiGHWbX/05V8zyTIPscFGjshmKje1tspeTVEl4luB6Zd2Zt2eBIgmkUYLe/nlIeQLZDUbIpjOHscnzqsVa6jqV978TZ8lcvbxKs9U8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vb7r3dSm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vb7r3dSm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CD121F000FF;
	Mon, 21 Sep 2026 08:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789980639;
	bh=VCp79KAbSmxaf27gbJFm4iaLxy5DlAPy76Yxc7wmNI8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Vb7r3dSmYx/J71RGTd7Z39DFSFqcok3RfC54B/nf6vzY/zU0k9cVQX9plARcfbRHj
	 wlJ2NvdGOjkJ5FVweLcVu3Ae+v00xfOTyxS65+ccDHj9IqbW9reM0aHL38+FwYRq+I
	 QqO4dWwjyF+SmJhEbceV7OJHAMAjzN62mtXBzw8AROV+8koQo5zy8LYef7H6f8KHEr
	 BHgOKmIGKiPnuVg7El34N/uLHp7lG3aBn8hBw3dBADa7mUfxQAbsieGwb1Lo97TpZL
	 PSVIPIwA3bN8AMbNddFbhgDVtm0WOzxs4c+EjgXgSlHebaPiKiJuqL0nvFjzgf9UYb
	 lolxG7iSBaqZw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id E51F31AC52F3; Mon, 21 Sep 2026 09:50:35 +0100 (BST)
Date: Mon, 21 Sep 2026 10:50:35 +0200
From: Mark Brown <broonie@kernel.org>
To: Yibo Tan <lhfff@tju.edu.cn>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] ASoC: amd: acp3x-es83xx: Keep an owned codec
 device reference
Message-ID: <arDv2zGaqEgw6p_v@sirena.co.uk>
References: <20260919121318.1618315-1-lhfff@tju.edu.cn>
 <20260919121318.1618315-3-lhfff@tju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VpmVwxQJwkAwN1AH"
Content-Disposition: inline
In-Reply-To: <20260919121318.1618315-3-lhfff@tju.edu.cn>
X-Cookie: Too clever is dumb.


--VpmVwxQJwkAwN1AH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 19, 2026 at 08:13:18PM +0800, Yibo Tan wrote:

> @@ -428,7 +433,7 @@ static int acp3x_es83xx_probe(struct snd_soc_card *ca=
rd)
>  			return -ENXIO;
>  		}
> =20
> -		codec_dev =3D acpi_get_first_physical_node(adev);
> +		codec_dev =3D acpi_bus_get_primary_device(adev);
>  		acpi_dev_put(adev);
>  		if (!codec_dev) {
>  			dev_warn(dev, "Error cannot find codec device, will defer probe\n");

This function is declared in acpi/acpi_bus.h which is only included by
linux/acpi.h if CONFIG_ACPI is enabled, this will break the build
otherwise.

--VpmVwxQJwkAwN1AH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqw79sACgkQJNaLcl1U
h9Cnwwf/XSwc+SmNEy9fMgiWqAzwcJLQ2uB1wiHlbbfIQz2RifRTe0+cDJpYcFMl
ev3LsUKohtZNV+1z4VNGdo5t0naGEycWZOvFUVCimeMO+XsmLK/tfjCF+JKLAKPk
Ai54keaGvE70TwHdfoBDs9ILu9Q3gHcBaqhxZshUwSBeZDm629idL52IB965MIgS
rqer2GHKKVTeoKpc5DJGtmLElE9YKL4mZnNCf7CW9ENftRDcTRErxdYPp0XJM8T1
/zwf2swcczfLHBgB4yS08CC4nN/Xbuyevyb9H7Evfgmj4uCYC5sWRLFcpgwOBrNJ
6dpdfcyHrvLcwioNHnY4MJqIRAIbww==
=U6hh
-----END PGP SIGNATURE-----

--VpmVwxQJwkAwN1AH--
