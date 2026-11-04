Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793787405;
	b=wGTkPg+4ve1FwxSQrlIL23vK77MGcCr8KQpK4Zo4tk3EPcMXt2xn8cpxkUAkfXtxO0N7
	 BKnt1mD1y8WxdbhY9IQq5zihkQWF6rVM2QvrsrYcvSTpH/sPSSLwFXhhcuRKm2IUpqc6D
	 IjYuNLbNqJm1GmGO9gEXFFK3nx2qzNMxWq1r/1KOm5L/yfRCytV6s34iEeXsCJF7sEBjJ
	 CLN3AJaLhRgKlMMFbL4djIUQrMe35NtH/Qb04r6gDilcckwkA2eotpVbtrCfp3/bDnx3Z
	 2Jim69+u2wOnuXYkQN5vrbBXxM85Uhfm0CqYPaWJzx9Ofr2s1nhsK1DFm84Xg/dSzpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793787405;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=hGoF+Ux3/C2DVxPoGimJzT2bsRivtHVvoj8jLzbT9PE=;
	b=X/Q3QfjYyGp62a4JBVdOxY7DkzX+d8LcrxHcMCddidDZtC1tufZPMRa5YcZbv7xHgN0I
	 PjlKNpWh9+oqfHi62oGuplkYsD+CU50x/7v5GAsfbX0RR9u6AGOS+xIMbTGTURMbk4XA7
	 Pqo/+mAobiihvrSIUeJQE7lIMrGHILnQAHdcnOT2w9cQw8Hvp+TmPrXGQq7V/2P3asmC3
	 2kdW1f0R2E5mQ9u+tERy+ItvRJImdcJYHfteW0qtRWUxYsFHpPXBgaV7XZ+A494jUUbTC
	 cYSuiZYYT1SSEiVMG48LJUrikxaxY1ICwqnLr1r9oOd0yUcP+SvFWZCFtWDtq8aocUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=g+E50zIf;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B45606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:16:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45B45606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=g+E50zIf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=hGoF+Ux3/C2DVxPoGimJzT2bsRivtHVvoj8jLzbT9PE=; b=g+E50zIfhYHSxqKnfX7DkcQzlX
	cEto4q6vRSnDqE7UsTJBYOCSE4IGm7pYvK1w3Oh//NGAbdEsWVShoQlwkXeczeTwJ+FHOmmd/4iF9
	WpgVsoKeh/pgyX9e2XWsNThyMaX/m6mt97NxivncogOAig4W8fp1rGBDGAu4GaOjlDBpdsFLMq1WN
	BLBP2MPgocj7g8uCHxPd9eXkhtIRqfcuIfbSze/ncsp0jT866953UAjdD0yviaOYyDjLiliO7phYg
	97poZRA2DpS5RD9sfFz6D9LsetmTfSt4UnS6nZTIm5D8Jwj2sgUwGDvh9QeyII0AzULZyKIiD01p1
	gLLJH2Ww==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Igor Paunovic <royalnet026@gmail.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Guangshuo Li <lgs201920130244@gmail.com>, Jiaxing Hu <gahing@gahingwoo.com>,
 Igor Paunovic <royalnet026@gmail.com>
Subject:
 Re: [PATCH v2 1/2] accel/rocket: release the shared device's devres on
 teardown
Date: Wed, 04 Nov 2026 11:16:37 +0100
Message-ID: <1888503.5KxKD5qtyk@diego>
In-Reply-To: <20260731064933.12548-2-royalnet026@gmail.com>
References:
 <20260731064933.12548-1-royalnet026@gmail.com>
 <20260731064933.12548-2-royalnet026@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Freitag, 31. Juli 2026, 08:49:32 Mitteleurop=C3=A4ische Normalzeit schri=
eb Igor Paunovic:
> rocket_device_init() attaches its allocations to the shared "rknn"
> platform device via devres: devm_drm_dev_alloc(), devm_kcalloc() for
> the cores array and devm_mutex_init(). That device is registered at
> module init, never binds to a driver, and is only unregistered at
> module exit - so its devres list is not released for as long as the
> module is loaded.
>=20
> rocket_device_fini() only calls drm_dev_unregister(): it does not run
> the drm_dev_put() devres action or free any of the other entries.
> Every fini/re-init cycle therefore leaks the previous rocket_device
> (with its embedded drm_device and all drmm state, including the accel
> minor number), the cores array and the mutex devres node. The cycle is
> easy to trigger: unbind the last bound core and bind one again, or
> fail the first core's probe (-EPROBE_DEFER retries included).
>=20
> Observable symptom, RK3588 (Orange Pi 5 Plus): each unbind/rebind
> cycle of all three cores moves the accel node forward -
> /dev/accel/accel0 comes back as accel1, then accel2 - because every
> leaked drm_device keeps its minor pinned.
>=20
> Wrap the initialization in a devres group and release exactly that
> group wherever the device is torn down: on the rocket_device_init()
> error path, when the first core's rocket_core_init() fails, and when
> the last core is removed. Each fini now frees what the matching init
> allocated, and the accel minor is reusable again.
>=20
> Fixes: ed98261b4168 ("accel/rocket: Add a new driver for Rockchip's NPU")
> Signed-off-by: Igor Paunovic <royalnet026@gmail.com>

not to self: patch 2 became part of the dvfs series
this one (patch1) still seems relevant


