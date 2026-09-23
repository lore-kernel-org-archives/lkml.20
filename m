Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CD13FB077
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 17:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790184710; cv=none; b=owqrTS5pbXjK5miz5/KuraDcV4qliAgpR8UsJh71bln/8mf5b76FVPfz/cw+hWfvkjDRF8Cgor2SNUmqTtaL5Gl76m2p5RUrl/eZmpKqac/AEal4BuYe2zoqdvffxOsDo3riMAi13SNjRKpJrPrk1uandBUNaelnY2kt7NfTXGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790184710; c=relaxed/simple;
	bh=pkNbgr2LUmHMl+CKmjuAT6b3smEiL2sJ/WOqbTV9Hy8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MBiB2PwBIk72GyuE57z5laN9eOgups3BHJU7zi6Jysl8hzcLLvA87pKMawu4wB8DPGJnGYnrgi2ePghyD1jfIYY1jTYuSzjGlYm68BRZwqVhjy8GzEdz3FsFK6uuHsejtYl9zpr5fblzcMmZv6lkDtrAYl2XfrFqewwEKo809tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ScbxxvBR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ScbxxvBR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 508541F000FF;
	Wed, 23 Sep 2026 17:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790184708;
	bh=9ztFypob8+v7bqoaovVuZeu+/7Jm2lEmBO7VJHep2Dg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ScbxxvBRpAdFZuiSETOeJ7ZucBRejGxBfnvJ827xcpmX0MZbEIRrVr6zKFYE/Gksy
	 zYyb7ZVSMbcveapHESmbc9MOeDm4/FC7oFmP83/YUCVXgmu6TCafRSmRIT6UMj66us
	 lH3sVLOmmAI+8gwni6OpYl/RFprUXg7t8FkqecTMZsScQZgWABPGSWNBxUaMPpCq7z
	 WRgd/ZuHH9CcXbJEtapBhjdUzWP6Ck63AwD3/K6LOVAK2c4RUUQbnnAqA3GAWATb5v
	 S9BF72zPzLQaiWadA3fx3rdVHXis89SA2N8l37zj/vCvJi7/a6YLjE+czxTbuwJjCU
	 msPlDB1bkSgHw==
Date: Wed, 23 Sep 2026 18:31:41 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Bence =?UTF-8?B?Q3PDs2vDoXM=?= <bence.csokas@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Conor Dooley
 <conor@kernel.org>, Yicong Yang <yangyicong@hisilicon.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] cache: Make cpu_cache_invalidate_memregion() error
 out if there are no handlers
Message-ID: <20260923183141.5a9b9c44@jic23-hlaptop>
In-Reply-To: <a5456d59-aad5-40cc-ac89-5c0c113b560a@arm.com>
References: <20260922-cci_enxio-v1-0-00bade212729@arm.com>
	<20260922-cci_enxio-v1-1-00bade212729@arm.com>
	<20260922191808.b82fa138c8bc80a1285e8ba4@linux-foundation.org>
	<a5456d59-aad5-40cc-ac89-5c0c113b560a@arm.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 23 Sep 2026 10:21:15 +0200
Bence Cs=C3=B3k=C3=A1s <bence.csokas@arm.com> wrote:

> Hi,
>=20
> On 2026. 09. 23. 4:18, Andrew Morton wrote:
> > On Tue, 22 Sep 2026 09:29:31 +0200 Bence Csokas <bence.csokas@arm.com> =
wrote:
> >  =20
> >> Currently, if there are no registered handlers,
> >> cpu_cache_invalidate_memregion() returns 0. Callers are expected to ch=
eck
> >> cpu_cache_has_invalidate_memregion() and return -ENXIO themselves, ins=
tead
> >> of calling this function. If a caller forgets to do this, they may
> >> erroneously think the operation succeeded. This is in contrast to x86,
> >> where cpu_cache_invalidate_memregion() itself checks if the operation =
is
> >> supported, and returns -ENXIO if it is not. =20
> >=20
> > Do you expect any callers to be altered as a result of this change?
> >=20
> > If so, full details would be helpful. =20
>=20
> Current callers, not necessarily. Future callers, maybe.

There is a race condition if someone unbinds the handlers that might
expose an error after this (correctly) when it didn't before.

In general that race exists in the setup path as well because we don't have
any way to know 'how many' devices to expect with assumption being
they have all turned up if any have.  Not great, but short of adding
something to the firmware specification there wasn't a solution and
that process would be slow.  We can revisit that if it becomes a problem
in practice.


>=20
> Presently, as far as I see, there are 2 consumers: CXL and NVDIMM, with=20
> 3 call sites in total.
>=20
> 2 of these call sites [1] [2] are in the form of:
>=20
> 	if (!has_invalidate()) {
> 		if (TEST)
> 			return 0;
> 		return -ENXIO;
> 	}
> 	invalidate();
>=20
> These types of call sites can stay as-is.
>=20
> The remaining one [3] is in a void function, and in the form:
>=20
> 	if (has_invalidate())
> 		invalidate();
>=20
> Lastly, while not a consumer, here's what x86 [4] does. It's possible a=20
> future caller will want to replicate this:
>=20
> 	if (!has_invalidate())
> 		return -ENXIO;
> 	invalidate();
>=20
> These types of call sites can do away with calling has_invalidate()=20
> going forward.

I'd be against any callers doing that as would rely on future implementatio=
ns
of the interface.  No support vs got an error tend to need different handli=
ng
and relying on particular error codes is likely to bite us eventually.


Jonathan

>=20
> [1]=20
> https://elixir.bootlin.com/linux/v7.3-rc3/source/drivers/cxl/core/region.=
c#L242
> [2]=20
> https://elixir.bootlin.com/linux/v7.3-rc3/source/drivers/nvdimm/region_de=
vs.c#L93
> [3]=20
> https://elixir.bootlin.com/linux/v7.3-rc3/source/drivers/nvdimm/region.c#=
L113
> [4]=20
> https://elixir.bootlin.com/linux/v7.3-rc3/source/arch/x86/mm/pat/set_memo=
ry.c#L372
>=20
> Bence

