Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794491940;
	b=y+mAYaLtWVB00ARy5FWe4ahnVUzkVN6IINdEs9RvvbRWSTrzl0ezwSG+WVH41ROhHWox
	 GomAxbJulGwCU1lsOPjE+r5JW/zq7pFGlRrLc45A1woP9FU6xKv3+Iw6ncwbfXlyJUjyH
	 wP/2IlZFJJkuBmjgv5o9HQUSm+rxXjwyEDjIXU7+kMNaZoivzSzwmfG7S7+73ug/CDpVN
	 505PX+/tuSoKkHBk9Fms6JL0xikMm5xXcmLmwdWhPyd0zQVa5behAC6BxDz5h9ure+IPk
	 y4D25fTVM9DmW/c470M2Is8s5F48n+Z7AiaMRbkJVHPaxIA7KstLXpVPnh6a8zSibdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794491940;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Mime-Version:Content-Type:Date:
	 Message-Id:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Transfer-Encoding;
	bh=zV+nK/AlTUTdbSetbUQ+U98EtEMkeemH/yNGT5K9skQ=;
	b=hnE2WSw9n0znXUTBFzhKW0nRUYtVWFM+e2WIxace+9zJ0tDJlRlktiggRFbRenLCtuYo
	 CHJefdzDRX17BqMc6TaNF9G/v9408BOH7OekkzTqlZ3yfgDem6wWofT0oFZv4KNYUbILA
	 0whSw0MMZjRcAuqgGXwH3nhyCCGqXnlZvVYHoFsIWIdJRxxG6kIGtO8msIhFTxiiGUjy7
	 8lmF1/e34DSTEtbQdnELjUi1FiCsjaQIp98mJSNW3S02DkFwR327Hn1ozsTCDZlnbWC+f
	 Gme8Rmqap+0ZnJiSCxOMOWI/4xkBDb0H5ge78XXHxtn42QqgOwJTJZo0gKtt2uXfmJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dZTpG39k;
	arc=none smtp.remote-ip=91.218.175.20
Received: from mta0.migadu.com (out-20.mta0.migadu.com [91.218.175.20])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DAC606A336
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:58:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27DAC606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dZTpG39k
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=bb3AFCzgVIDc1qwR2keW7mWoaFQLbnEJBXV9iSdukp8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794491937; v=1; x=1795096737;
 b=dZTpG39kP94h9wkkuUPQIK6ymqIkc/xyQ2lfamSOf2XGF4cDtlATlfHoJwx2V/jRSLBZTQOF
 c89ICT/gw7pnGQ8LQTFJuP4yQM0E+bE1WuXAiealD9HZpNdsWgyK4UbOnIgIj8DBoyuIJNt4hea
 +EDCH8iQqVCIfn4fmY0ZoBCs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id ede3f35cb65e7420;
	Thu, 12 Nov 2026 13:58:56 +0000
X-Mizu-Trace-ID: ede3f35cb65e7420
X-Migadu-Flow: FLOW_OUT
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=a9af0bf4469639ffd39239db22e9ea1ba44d1ee2f09a947b7c85873e16e8;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 12 Nov 2026 13:58:52 +0000
Message-Id: <DMTAAT48IDFT.21XSI5A57I5C2@linux.dev>
From: "Troy Mitchell" <troy.mitchell@linux.dev>
To: <sashiko-bot@kernel.org>
Cc: "Troy Mitchell" <troy.mitchell@linux.dev>,
 <linux-rt-devel@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] irqchip/riscv-imsic: Complete vector moves
 without a timer
In-Reply-To: <sashiko-outbox-210743@kernel.org>
References: <20261112-imsic-remote-sync-irqwork-v2-0-680f65b24ff6@linux.dev> <20261112-imsic-remote-sync-irqwork-v2-2-680f65b24ff6@linux.dev> <sashiko-outbox-210743@kernel.org>
Content-Transfer-Encoding: 8bit

--a9af0bf4469639ffd39239db22e9ea1ba44d1ee2f09a947b7c85873e16e8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu, 12 Nov 2026 08:35:16 +0000, sashiko-bot@kernel.org wrote:
> This fixes a bug in the two-step vector move synchronization and local
> retry timer.  Should it include a Fixes tag?

Yes, will add.

[...]

> Does calling imsic_remote_kick(mvec->cpu) here wake the destination CPU
> out of cpuidle right after it takes over the broadcast timer?
Yes, by design. Only the new CPU clears move_prev, so it has to run
once after the old CPU is done. The retry timer did the same a jiffy
later.

> Until CPU1 re-enables IRQs and services the IPI,
> new_vec->move_prev remains non-NULL, so if a third CPU enters
> tick_broadcast_enter() with an earlier expiry during that window,
> imsic_irq_set_affinity() still sees imsic_vector_get_move() !=3D NULL and
> returns -EBUSY.
The pending IPI ends idle at once, so the window is the idle exit
latency. The broadcast IRQ then stays on CPU1, whose handler still
wakes the third CPU in time.

> kicking new_vec->cpu twice.
irq_work_queue_on() skips a work that is still pending, so this costs
at most one extra IPI.

--=20
Troy Mitchell

--a9af0bf4469639ffd39239db22e9ea1ba44d1ee2f09a947b7c85873e16e8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iI4EABYKADYWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCavXGHBgcdHJveS5taXRj
aGVsbEBsaW51eC5kZXYACgkQmAnvgPkzNC/AbAEAjXWRzqNk9SgbDmMiW2BNh3E3
7Lt7TyjEWGsoa3ghCmMBAKHRbKnqmPoOWPk+T7lRENaY6alk0kEd+STaO8MvYw0E
=p/bY
-----END PGP SIGNATURE-----

--a9af0bf4469639ffd39239db22e9ea1ba44d1ee2f09a947b7c85873e16e8--
