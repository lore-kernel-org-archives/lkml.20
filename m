Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793875254;
	b=AMwUe5Mr8bg1ReNJYZOeQPRC8ccPoEmtSMT/EOPvuwSqaZAFRLXgY7w1NA7kW2oDoMKB
	 uKSKVbnFN4fD5WmL92o1Sm/yE32sIrznJtfmltjp5VWyHgokOCBqe7ngaA9U3hGhDvm8u
	 CBIjm66emvIhXZS2QdqTXFOxHS4oZUgZWH/ngCyNCctBVdVvrVIAxTlLzjeKfk1D7snsf
	 TaBem+jeOK9XzMmgjgmmetjJ/A9xXI5GdIWljLayQdFzxxFp2nEoBG/uBtVXxZNZCD0cb
	 NkYhLLmOQSuty2+yGy6NyE7PvnooeDrC71E0qOPQSTkN/qmvJ/eu9lYOyYXApLwv3Jw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793875254;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=g6eyY98qNh4jG6A7wQCkjm6t762hh/aar5NQBQzO22M=;
	b=FgvAiLMoQN2EG2Mkf9DQyatdmzjRBWhJ7zowAtZJqXTJfa4lB5/lYiN25HEif18896uQ
	 ZeUb4Q16vZuy0xmIY5wXLF+1nVdELTwvcbTn5UksmoyDpjTNIfu5Ts51OmF/Jeemo17qU
	 z2l27tSlADrQnuhKfpaHZi3nSlBhzwC3yp0b5yJrZlDa/X/r5kPxgoOCRb7QeI5HBCGtg
	 ZYg0KXQTEjamecwGqrZb4TxjUsHwDwB7UJnOos0UVp/+NcDT2bVEC2JkqqpYf6+wt4LZY
	 +PniYJMmzZ6zxqFKtpTcBq+PlDy5Y/1SD0f/S0JI5b1c4x84/L6ht3aaBaJioKtXSKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=fur6M3NF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAF4606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:40:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAAF4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=fur6M3NF
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id EE4D92006C0;
	Thu, 05 Nov 2026 11:40:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793875250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g6eyY98qNh4jG6A7wQCkjm6t762hh/aar5NQBQzO22M=;
	b=fur6M3NFB5civvt+TwiLxYoMfCdDeNwv4YOX105LHm009y++LwfRGapeJCyfd3XJGpGJRl
	p5wO9YDb83O6ffP8V/8cYcBDL7+X/CvBJY9nZh7LwS+N5XB/5bmkM3rSUo744fh9RhMInB
	U79lZz+T3WVYYUqZzo7+/OPzwXSNhk6pP2cyBjBbZYF6fv0dKlLa9praIXSDdtra1aNKQZ
	3ogKq4mnsab2xkPnr9DaltWXRU6ZS18QmA2FKCRmti12wYNygVrQVv+1xmzCkbkSFN7n5J
	K4p6sgvpD2awy1JTX9XZcq6yMQjBaNJ9KviGKOPNfshGAOyeRI85kzKj7+AIAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793875250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g6eyY98qNh4jG6A7wQCkjm6t762hh/aar5NQBQzO22M=;
	b=N136686bEyKPmCmcMR5kAlo27b1ndWXpdRTgRyICSXoUZmI7Yr7YylgtVEuodLlthQXJhr
	qmKA7a6kfARv3k7ZnvJpCJALkbZvTFYAsePuUW4PIRCC4ktjmsN+rl6GN23kfAX9hAe7cZ
	779AI5VJyCcEF1H6t4m5CXORC+Eomoo55H3SsIDrXbW3TcqWmsGxbcbO6tT5X5NTWkyxqP
	D3WHfEith74m9s+WJ2iu918bqZYJZ8jtXGbGcOorjDZX2LI45C7WZ8uqX0CJ0W59upAsYD
	FFta6D/QDkxKESy+k/PNTbU7oT7AW2VC81HXg3nIsOXYEfEMpQ5MODNapmdgPA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793875250; a=rsa-sha256;
	cv=none;
	b=O+4buIupM7BTIjjSz2gB/yIy0JAZCLomW0eVNcD2MYH95G1qghwccriaDNinXQOqsGNeCz
	SUA5Z/84cERbS9cjJ1UQZqgwG2VFwYn6p9hmtl/ziSvmgrjvOhvojh+fN4QVGMnXUwQW2A
	k0kvR7kiwg9mGDOLZs8Dh9cEV4TYIOZrP3A1aL2HaxzC3q1mlOgqVJCPlIvngA7lTuhPiM
	ICs2mLU9MRH9h8zuOEbeEbgSMLGjYcqstNjUDvFxFELM4FGQeBVI2jdIeRW4xmfqh7PX47
	+k872iUD6LBWZMHNip4nXyFap2UvOFiostOWry4Nc7thPBlWqFetGR+mgtz//A==
Message-ID: <0c103dec7f28167eab0fc12f56f9920b5d4ead6e.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/2] reset: Fix circular locking dependency in
 reset_controller_unregister()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	linux-kernel@vger.kernel.org
Date: Thu, 05 Nov 2026 11:40:50 +0100
In-Reply-To: <20261104162038.48622-3-tzungbi@kernel.org>
References: <20261104162038.48622-1-tzungbi@kernel.org>
	 <20261104162038.48622-3-tzungbi@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Do, 2026-11-05 at 00:20 +0800, Tzung-Bi Shih wrote:
> reset_control_acquire() and reset_control_put_internal() acquire
> `rcdev->lock` inside the `rstc->srcu` read-side critical section
> (`rstc->srcu` -> `rcdev->lock`).
>=20
> However, reset_controller_unregister() holds `rcdev->lock` while calling
> synchronize_srcu(&rstc->srcu) (`rcdev->lock` -> `rstc->srcu`), causing a
> lockdep circular locking dependency warning and a potential ABBA
> deadlock.
>=20
> Run synchronize_srcu() outside `rcdev->lock`.
>=20
> Fixes: 44a0acb2caca ("reset: protect struct reset_controller_dev with its=
 own mutex")
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
