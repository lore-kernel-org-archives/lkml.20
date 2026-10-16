Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702BD372B3C;
	Fri, 16 Oct 2026 10:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792146465; cv=none; b=nA5WUYmkMR4X6BH8mBu2krGK1UUWEtMN7gbXJFv+KVlwjcoDXlsZLOl8M6IzwBQs4sfJIALEIBO7zFXRwqTDHGim/EvAndrTZZIiPu5aNLFpcsEf/zGvqwSDzS1im2rw1AQ/JiXSOLBLyZ0lnZg1hZhYbxsDuhHfS0UfSJ1zUMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792146465; c=relaxed/simple;
	bh=limMFJbcwwduTpzFLcDiK/5fNhxrgEYq52T7UWtvs0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H+JY18hiQLw2lSKJYiJJskbqzA4AyHFicCpPd0QQ3UxPVYtwby21aovg2g7wXKljszWc+S9+0jg/yU9ATf/DgD64mtnmDZ9x+aVEYtV7qrtlQ8rl2ado3s0SbSALJ4Y+5ewlSRfzJ78rB4kPlmLstIKhHpPTZUD+mSxXO5SpOvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fHEL6kP6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fHEL6kP6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2AE71F000C4;
	Fri, 16 Oct 2026 10:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792146462;
	bh=U0J00jo5OiHeBPxzEIa6F1DcCXv2U6x9A+gpdOvbR5U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fHEL6kP6IS5s8belsewK7AeFU5zIrffBszsKo3//zeOY4pQ+UIumG35dxnULGf/3d
	 EGt29felUqNf9Ch2QvIQZsnCqtVy/W+u/st4lU4MN3C/Dcl/dTc7W/ZbbvESn7cHBc
	 eqi6D1ok1vbZ5mqfq+W0prdxLrbNmI58Lp7Jtrx5vsHRjUFxpjvTNcwCLCMNZlw8vx
	 dAmhzmT4L+uzQJ81JqVTU1ciXGN2fNgY0dXoFx6rvI5v5OP64DuDhSesR7W4ptJl6o
	 pR2pL8DNGR8LlR9297+A5XzUqMTod1ALxmn/eUISmu/nTdZ7t3YKh25BYzSomJDpfx
	 LCuJ//VjMWTGA==
Date: Fri, 16 Oct 2026 11:27:29 +0100
From: Mark Brown <broonie@kernel.org>
To: phucduc.bui@gmail.com
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	povik+lin@cutebit.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Heiko Stuebner <heiko@sntech.de>, Kees Cook <kees@kernel.org>,
	Syed Saba Kareem <syed.sabakareem@amd.com>,
	wangdicheng <wangdicheng@kylinos.cn>,
	Chris Bainbridge <chris.bainbridge@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Neo Chang <YLCHANG2@nuvoton.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	u.kleine-koenig@baylibre.com, Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Md Shofiqul Islam <shofiqtest@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Zain Aboobacker <zainaboobacker33@gmail.com>,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Bo Shen <voice.shen@atmel.com>, Vinod Koul <vkoul@kernel.org>,
	linux-sound@vger.kernel.org, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com,
	linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 25/25] ASoC: rockchip: rockchip_max98090: Mark the
 link as started on success
Message-ID: <46a96bc8-2ee7-4c6f-ad8e-94321f8b9630@sirena.org.uk>
References: <20261015014324.5569-1-phucduc.bui@gmail.com>
 <20261016040048.506531-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tqlzx0giHWNwlE1k"
Content-Disposition: inline
In-Reply-To: <20261016040048.506531-1-phucduc.bui@gmail.com>
X-Cookie: <<<<< EVACUATION ROUTE <<<<<


--tqlzx0giHWNwlE1k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 11:00:48AM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
>=20
> snd_pcm_hw_constraint_minmax() may return 1, which is then returned
> from rk_aif1_startup(). ASoC only marks the DAI link as started
> when .startup() returns 0.

Can you please resubmit this as a separate patch as a new thread without
the series numbering?  This is really going to mess with the tooling :(

Please don't send new patches in reply to old patches or serieses, this
makes it harder for both people and tools to understand what is going
on - it can bury things in mailboxes and make it difficult to keep track
of what current patches are, both for the new patches and the old ones.

Series numbering only makes sense within a series for ordering, if
you're sending something separately to a series or a new series then
preserving the ordering of the series just causes confusion.

--tqlzx0giHWNwlE1k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrR/BAACgkQJNaLcl1U
h9AosQf/VknJyrGXrKz1JvZbJBxS2f4nWntI49PwwvAzQ6a4SD3xfvD3bg/M7LAZ
J5+AHHz3VAcAYPq1gkxEy4pCm8MVao9XTc3Ujwu5jluXqeXIubKVaZnzHh+J84Ux
cjBkHDIed/T5gVNU5Q+CpctZcDl1jrOFs3dUiUzMw9T3JTDLH3NN8u10CbKzFsaO
n7SWoLoUuganF2oSbR0LpA9qfDv+AVTwzA0kxeNZA0Uu75kwlJ7nmFxDmpw857/8
BHCXxOUkS3ASKZ05NU5uuVGM2XAfSRzRAS/AY1SCT45ujPw9O9lhufB70UDqLW7a
SnN5ueA4U9Y+tWt2D0rrEe/M9oXKtw==
=No3u
-----END PGP SIGNATURE-----

--tqlzx0giHWNwlE1k--
