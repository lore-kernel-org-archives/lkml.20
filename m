Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776064;
	b=FXsM6C+UOreBDBAOkzBIJhgtRW67YwncldLVdq7NkHESd75o+Gs3GmK758VS/iDxFhMx
	 WqSDn3Nwpaix+DYoTwYseCpfLqqfB0xh7Y+1LWuS34OefnU/pHhWn1OS6myIfiCQi47mZ
	 o6sm5QSypyLrkrGUR/q1FI3+5jUW+slG1+WuDvagzyOSmjfCAU2hOqnKPPdRYm4eXk2Eh
	 MYvzvCiwvdn8dnZ1CKUE24m6kEc+k8WRkhqAxbvZMc+yqgdbhSrEqFnYpGEEZWQgk0+lR
	 h3uCU6mz8GjLTC4hO8vNsYzDgu5HILXZDe8tPu4MlG+NVFNVqQQePyvyDo/M4ndyKDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776064;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=mQITPQGWRMPapYV4KJxOKGOcD1pJ1nJ8SAJpVhFH3iw=;
	b=TeEhleuXWMDeeOvW2vzE2IZ4znEI3ng2bHGuF+lmL/9UkpEWaGCGzIpqAO/aLIXLW/8r
	 +7SQaNJXkVXNQ+daC/FVt2Juslt+ESd5smlXRxFBP9tjwk1jv7QisTaqs2b5azD5uyC6m
	 JffEXqcgQmx1NLAIe7AttpwGh5x9Pehzjsm3H+eUzL1YE3zCibV/3UA6RaH9aZyCQoAiy
	 1Rk38rF+/M40HQNp+1h2FIOE9sxGE1+MmZpXW48zS6lfiwlvgnzuUl8M1L/xW+Md1dZ8B
	 kqSV7OOazzDFQy9dEW02jTDGEEo+XYEYh77ykGYLhUvSq5Rthti3Teyhnda0lfzv2eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=lUJj666O;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3D5606A329
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 20:54:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA3D5606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=lUJj666O
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=mQITPQGWRMPapYV4KJxOKGOcD1pJ1nJ8SAJpVhFH3iw=; b=lUJj666O6C1QpnJsRkOFuouIKx
	rOO0gPDjJOU9aPVvU/cWwm9mgrFljEDlbTLBxFnak3S6mb16fxKZvwOLynBpW9hlXt+9BsfxSk3Hn
	idOrHpjJnNLv0sIePB+p11P0IBDA785Ettc6LjFTuZOmQz5pVmbPVuUo/SZsO6YL9IY6ZJv7SObaE
	mkc15mGsca2SS9aN4MhSrMX8bHb+PDl5xJMlNyLKl2+mjmFxnvEm0DSQLbpB8p2/ouXVBi+awL552
	e0VXUlCbyfhyrpfIV/vLbLSaIwwCgqaRPbUlrtyLQ1allaPYbO0GUmxOvOaGkZuvuadLjjeWZZCRd
	yby4Usyw==;
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
Date: Sun, 15 Nov 2026 21:54:18 +0100
Message-ID: <noBimnyXRY-OqqHLl_N-BA@sntech.de>
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

Reviewed-by: Heiko Stuebner <heiko@sntech.de>


