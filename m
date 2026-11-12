Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794493507;
	b=Nj1oARHBpCcXpHX5Lt6E6UO0OVhQ2fvVJ4wDbC2gq0Vzrh1tjZ5x5BmqoJXKedyM7iF0
	 Dbma4p5ncsiS/wjQjZ2qL157mRH+ueq/mKsp5p8S0R6+XpTdFfxcB/N+AeVJR8DBmgHYU
	 c6zM7L/b68S5UbTNatQLOuTGyF43E3h1Efe9yXs1pVtQl1G3XDGtSvvWrvXZ59E8+mZlW
	 fi7Vwalg2KNcBlc5nR8n+/aGLJ2WdJMCqYimVLgq396ZoPoxfxoBcJtcl3RJ3hcRCBZPl
	 j4hFeq+3s7zFyvrSCwE9iDBMrdgCVoohDkBfebGGQ7hjDgK2vwCM3Hphsr7ZzOxpxRg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794493507;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=J6Uult9ktF6AsfA8uCRRkcCNPFzi3MjgP0Q65rwyUGk=;
	b=UQoZoADm8/BfRwS03QQ4XexJhimG6aSfl8d8ppCci3vnFxx968vAUR6i3v5McM3O7Ll3
	 lck3nWIt2os4opKdoqH1gyhTJ/RWleXJaDu7dodYPlge+tfwX//NMRwvXJr3mTFjMgS5U
	 WF9JiOkgijwP+axwhBvzaIjQybU1WC8tQfppapGHNlaMhfjN79yo0Xh4/cZK2ch7/DZR3
	 V5FE6p5XAhZVfVmU6ROpiHGXBXHa5mtvbyOJgDc2C1xKBiJw6FqxxsWeylSo59E/hkAOf
	 wKkmWMswZBDZ0smH0dfuCLTE3UtgR79kZGqdcKBarle4uYQyDNP61QaxlNdajOrg4cQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=ZbpZnXbU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C04D606A336
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:25:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C04D606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=ZbpZnXbU
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 34580201F43;
	Thu, 12 Nov 2026 15:25:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794493500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J6Uult9ktF6AsfA8uCRRkcCNPFzi3MjgP0Q65rwyUGk=;
	b=ZbpZnXbUIYaLl3/O0XsJUiCzexbVyik8596We2FbE77U/nzwpUcq0mcXkanqOMBEjKCj2H
	/edNr5WkeTnHxr4VAbAp4jv0CJ+H4cPlcx9Nqyh2NTTbNNZ07DmYvdOFtVU5Spkel0PkGu
	k7DRfXmMNkptkU6DLgDXw+Ngem9PeXfJwPUH9+tsj0efGakAr1tDvxH7gEVXUlMmzLsF9H
	t9vOBl80oc6RvFmlzcHChAZBJbUT0guWQOOrHmhQ6T0JTVRbwAcNqSE7XavKXccZAOQzrw
	/73NG6jE0cPcj2o5zS30nDQgxxflFyZePluO/EG7VkZRm+iWmdiyr8xCGa2LaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794493500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J6Uult9ktF6AsfA8uCRRkcCNPFzi3MjgP0Q65rwyUGk=;
	b=gD0PEpOmX9GpTYsFVeD+OS+Fp5l4Nx/D/ah02/njmAXgabXL0GpWvmWXgXgSfV9uPQVpvu
	A5D+gf20zMiRbchUGKDImrZENCtKkJYAP3PCVb3ZZzJypsYAc0IXRBU5alARN54mp46Adc
	dcX4UW/4RVQMkxrzn6LK/2P+iXVDSmOFqoWjRN5WqVqzafwT78yLcXZdCJYdUvcODH/Z6C
	mnkmWCvR2SZ1lZPepY0zUOYTdnGueSgBO837t89LM4Y4cjC0xKyEgIHtHpQrGoi9Alr/zE
	Ks4ny6Y2gGumuTkgulNbkwKKTIYz+hK/X1/dLSXH+AizJZ5aBvXC276kdTuIrg==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794493500; a=rsa-sha256;
	cv=none;
	b=Tlbqcw9uHB+z9zVkeryMAyKyY7RiycC9WG2vipjnCHPbLjArYeBY0HPBqOHtD5bUFzIF1y
	9pZT+857oRuk3uQk92P6sykpJm8BTnPPmvk7xK4SJQKNcgh7QFv3SCgvb78ejTBSxsu4rE
	q5c7KUA15PcM9ZbGAyIgC4FWFMscEMe4aRdNX4Jg7RZds3oJRXyoUO81yg9VaEtP7q2y5F
	mJ4FW13FkQ3JYkzEdP/XBiDmkhsndLKVZQ1j2lra1AlY+1io21Hwy1ZcNBcyVjzOIQrqQM
	Y8VVZd9sldpnW4j25n48twqkVvZlkO2pWEAKckZamQcXLRlSUfhNLhHuLXO6tA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Message-ID: <f5dd09632c536060d3ec1ad263c54acb3a8793b6.camel@pengutronix.de>
Subject: Re: [PATCH] reset: rzg2l-usbphy-ctrl: add power sequencing
 dependency
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Arnd Bergmann <arnd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney@redhat.com>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Xuyang Dong
 <dongxuyang@eswincomputing.com>, Drew Fustini	 <fustini@kernel.org>, Junhui
 Liu <junhui.liu@pigmoral.tech>, Guodong Xu	 <guodong.xu@linux.dev>, Joakim
 Zhang <joakim.zhang@cixtech.com>, Anirudh Srinivasan
 <asrinivasan@oss.tenstorrent.com>, Sven Peter <sven@kernel.org>, 
 =?ISO-8859-1?Q?Beno=EEt?= Monin	 <benoit.monin@bootlin.com>, Robert Marko
 <robert.marko@sartura.hr>, 	linux-kernel@vger.kernel.org
Date: Thu, 12 Nov 2026 15:25:00 +0100
In-Reply-To: <20261112133210.3004176-1-arnd@kernel.org>
References: <20261112133210.3004176-1-arnd@kernel.org>
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

On Do, 2026-11-12 at 14:32 +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The dependency on CONFIG_POWER_SEQUENCING is ignored when
> ARCH_RZG2L is enabled, and this can lead to a build failure
> when power sequencing is in a loadable module but the
> reset driver is built-in:
>=20
> [...]

Applied to reset/next, thanks!

[1/1] reset: rzg2l-usbphy-ctrl: add power sequencing dependency
      https://git.kernel.org/pub/scm/linux/kernel/git/pza/linux.git/commit/=
?id=3Deac3b292a26e

regards
Philipp
