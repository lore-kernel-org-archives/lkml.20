Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66FA49CF40;
	Mon, 14 Sep 2026 18:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789409632; cv=none; b=qnucUX598bkmtJZz8P/v2rQ1YhjTGy9kapowawb5FRlfODDPNHAzC7uUTkN/M5xfiIjCN7tBBYZg5xTVNEJq+sjCZZFpHoQF6fSybTqQLuN4iAHf/7euQLfKKrFqIn3GQR+pJFmgrdKdd/xFpJqQqE7oFZ4cJSOQWBBs6et/xQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789409632; c=relaxed/simple;
	bh=7rRaIlb5/NILuLBTb73lVXxBaNkHm34RtM8W6nwjL5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RcLBxhHFM2dK6c+Sk7OO7flzvuuIhHaT45gvbqKuagSMsSFEY9l8A2QG0Pb0ywUiQH50J+GEffC7Q993uEjMGbKwLhxX88qATbR8TQulO1gnpD2muCb69IHLqQ2NgjtaKMFOqBKQqdFB7rLl+/cdxNG1BHM5k2IA5JbrBQW9S3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fb5gt7UX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fb5gt7UX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF1D61F000FF;
	Mon, 14 Sep 2026 18:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789409626;
	bh=7rRaIlb5/NILuLBTb73lVXxBaNkHm34RtM8W6nwjL5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Fb5gt7UXrnN84vay26iTzNwBQflYZzP37Lw9ekgimEYM2sxxzMlLzUSxvB0WlFzx3
	 twaLpTb2P+Zxu9f4zKc0o1CaGob4X5EeRpQ1wAuj4AJ/9FAuEhaCpE1Y0eW8l42xON
	 8ojjNKUPjxQ0H2QLeUHZwrLv4G9g89ly8s8Y6LGKj4IUkJa0iXU8NfpdLTf4Uvk2RK
	 aybTZno2dWmFo5BNz9JNmKcqGHcof1g11yyVs2RRc5fcICxdBWxKGpul3A9bZh3r2c
	 yfRlK8nvZssnOxhOOMnmG3pdb/7BGV47c561JDqRdM1Zjv/DXydP56gwoaHn8Z41ZI
	 9chQHeLE711cA==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 3BD32FDAB4D; Mon, 14 Sep 2026 19:13:13 +0100 (BST)
Date: Mon, 14 Sep 2026 19:13:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengyu Qu <wiagn233@outlook.com>
Cc: Jack Yu <jack.yu@realtek.com>,
	Cristian Timohi <cristiantimohi@gmail.com>,
	Syed Saba Kareem <syed.sabakareem@amd.com>,
	"Mukunda,Vijendar" <vijendar.mukunda@amd.com>,
	"Flove(HsinFu)" <flove@realtek.com>,
	"venkataprasad.potturu@amd.com" <venkataprasad.potturu@amd.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	Oder Chiou <oder_chiou@realtek.com>,
	"vkoul@kernel.org" <vkoul@kernel.org>,
	"yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
	"pierre-louis.bossart@linux.dev" <pierre-louis.bossart@linux.dev>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
	Fish690103 <fish690103@realtek.com>,
	Mike Lin =?utf-8?B?KOael+abieiDvSk=?= <mikelin@realtek.com>
Subject: Re: [BUG] ASoC/AMD ACP70/RT721: ASUS TUF Gaming A14 FA401EA speakers
 silent and headphone jack buzzes on playback
Message-ID: <aqg5OYBZ5eYqd-QX@sirena.org.uk>
References: <CAAAbPi4w+YO=W8vFr63wy6++1WQ2mHUDVfUDKyWR8xcTWKXCKw@mail.gmail.com>
 <1fdd17c6-a0ab-42de-8362-8e1374d42fac@amd.com>
 <bc542e80-e572-452b-81ba-53e57ed3126e@amd.com>
 <30fed968a6f54a6c81eca4ee23ea4166@realtek.com>
 <CAAAbPi4MekJAyNsCAi2Ww9QHVVrrGkW2cdDTrrpttZYmh7yZHw@mail.gmail.com>
 <3fa3de8f2bf24041ba9c029e0984abfb@realtek.com>
 <TY4PR01MB144329FF6B2B48FED9486F12E98BD2@TY4PR01MB14432.jpnprd01.prod.outlook.com>
 <99e1afd842c4466ea562c83bb736fa74@realtek.com>
 <TY4PR01MB14432C55B885DB8231CA07C6298BB2@TY4PR01MB14432.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DKc/gNg892rRrUgM"
Content-Disposition: inline
In-Reply-To: <TY4PR01MB14432C55B885DB8231CA07C6298BB2@TY4PR01MB14432.jpnprd01.prod.outlook.com>
X-Cookie: Orders subject to approval.


--DKc/gNg892rRrUgM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 14, 2026 at 08:16:22PM +0800, Shengyu Qu wrote:

> On my FA401EA this issue doesn't exist so I can't test. Maybe you can ask at
> bugzilla so other users with this issue could test?

> PS: maybe this is the issue for some old batches of RT721 chip? My device is
> very new and this might be why I don't have this issue?

Could some firmware update have done something that helps somehow?

--DKc/gNg892rRrUgM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqoOTgACgkQJNaLcl1U
h9DdvQf9GfRjnoEOkD6Y4dVEQW4KTWTO64JFN9QPuIP5nH7JvvCegLA1Oe6ihlt+
zrfJCqlo3ebWprnGZ20OhqhvJtKjj0LqFxVEbMAnVJbStMRMCcwE2wCTuJaKyglP
pzrzrGmhKCxRPIy3UdE+r7a5+ZkCGTnsvwwPRmYuVP4FNcRAcSYLiNJ4TJVtJ/os
9AmhIkmXsCzb6/idRxHRto7KSuMcp4IDZeNyF0SwhyRks9uJaug4Kts94Fn9/BiJ
Wuo3zc94BZLSWtEGND+5VwHl5c7DZmEU6t9XwiTkjqykatUr7t56meqHI0HngW4G
jk6GHypEqtATJaRU39CWHK2Vuio8og==
=Prl7
-----END PGP SIGNATURE-----

--DKc/gNg892rRrUgM--
