Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794922585;
	b=PXpk883+DHEHPPl41b2D2hItzKDvdPWau/DDjRnhYa8xAG7laYmXr0rVk1Li69wbshgr
	 VhG47EFgHa8dIHkeV7iaJuE7DZL9dleH7LUMMd225cbxcvyhP3YgEE8c2LmqWiN0qX4/6
	 q4+2aco5HrJ5WUKaxZ3/CMTteBSoPgaZ06dm3ztvB3aUBLGVPCmqmShuAPu5SHApXuteI
	 /u+kA+luB9kgT4xE3jydGpswHbCOftElDX+KsmTR9DtDVR+5BuHZlVEZEyGxTiKK995Hx
	 f/d9fhE6Ei+VmLDEf/wT9iNveeRjr5tnbZd/8L8wWHEnRf/7jrbMi0j9WO103+DzRnQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922585;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=vcswZfsjy4uAG27LOrjPw1hdKg/eYZ0oFZmxGKaHuOI=;
	b=JPvTJ6JZUt/Em+A5o+Adz7EAiTqxWIhXff0KvCIgJ5RONDw3h8cMUK7/n3Iiv6eBSrln
	 8i9pcOpRpjGwFyW16UHnTB+HomeXwxQmAEntZXqvg9urhVAfw6qZnU4TgSuIzheNoFSDt
	 CC7wsE/QqtanEuYhf0N0G4QfVfFL/Zimv6kskG0f1o5ztgzlZkTeMGLHEXpLJBYghABSF
	 OJFllYqfuw5oHFhrHKQ+zwwlHU4oIGhLqqqv9Y+BMfnXjbgSK3gjjQDitnwcCmTmuCq4z
	 lHxWvNslXIu380E3iCAk27YIHh7q0Ra0fKTtWRpu3cAlpnPLAF6Lm0nC9hkrPR2Fqow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=LNfg+0Vp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E35606A31C;
	Tue, 17 Nov 2026 13:36:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37E35606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=LNfg+0Vp
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 35757205A36;
	Tue, 17 Nov 2026 14:36:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794922582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vcswZfsjy4uAG27LOrjPw1hdKg/eYZ0oFZmxGKaHuOI=;
	b=LNfg+0Vptf8BfsfU3pQQwgD1L0fSyxZBUOzjH/bTrw3e6SubWOLzBRoIHZe2SYimwJBKgk
	WuD2QLxt/wymHXBC4Ww6PLSEaolbx1/oDmX2EmRpUQSbYJHsXS/BWYLKRNxnkOe7kTW6D0
	gbM7SZFUNxwlsU++rdBtg0/6qrqsm3UTkuhF6BoOkd+h7UU/iD/paMPTPxOKElH8yRgXbX
	QFcKJckajIUz1jmtZ526ozDMLlBgG/fE2bIeZ6WXiv8e0uiwYVybQNRZyr4/9VNUYgqr8d
	WEqqqlKOLEcOLZTwe1GAJJGnZq6VnfUGwQ1Ej7b8nAUpfWOXVgqLGcql/a8NuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794922582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vcswZfsjy4uAG27LOrjPw1hdKg/eYZ0oFZmxGKaHuOI=;
	b=g5O3SU3l0F98nywb/8Frd53Exj7WAUuR7O6PgP4iK8zl5vevKt2a0G1AY2tUhvj+/xp7qH
	e+ZUXXLNyxDVd+orRMhrH5JsmD6ZtKBeiCYnd43VsGG1mZOLKUfhjJK4F20TDS3FM2XXMJ
	j1TvZ2O8tlpe8SvRk7+/IJ6EDeKMKKYbDIXWchz/zL3hSN7kU+067qz3YMpwCVQCEJea5v
	SbRMmq7L5YnuGC27FrWb/i4DMQMR3JffU3ic5VqZJzx0YU7iTY6Uohsv1eibA7zlvS+hgD
	bWN1BfR9dOtuS1rfW6AEuEZnJujDGxXihZycf5bddKOc/AS4zCv42TcAtVwWrw==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794922582; a=rsa-sha256;
	cv=none;
	b=HXQXF+YpLcoUWMJwQA02ea04qfsxtWuiAF6fpMzcrhtWZ5+ViO7/ShM71+gtkyAuM6DLKv
	iIHvMmPvByqmiqtNiUZWB//7c79Yk1t44pCdJ1WMtim3vvZBy2ziOSHu+FRRYycRtiZ8mx
	RtBC1VPxsh4nUosHffcnkecJ3T6lvEaqDmxTjsWBKOQ+nsD/54DRMLubjQAot/gbQ92uOy
	yJg8sT1w8fWMdglvgimsCoeTJ8wDX96g4VikXAFxlowZPTq6V2pDxgVUeGeyYlifQrnlm8
	N+lYZyf3B726aZHga8jW7SuJG+51riDdjcdehn2txY5LFZc50aJPu/InPhwm3w==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Message-ID: <10995e603bfb1108b239403b4e18b56a16edf6cc.camel@pengutronix.de>
Subject: Re: [PATCH] reset: rzg2l-usbphy-ctrl: Permit disabling
 POWER_SEQUENCING again
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann
 <arnd@arndb.de>,  Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 17 Nov 2026 14:36:22 +0100
In-Reply-To: <0b1c87b3173a789f6227f13658e4befdac8e47e0.1794913893.git.geert+renesas@glider.be>
References: 
	<0b1c87b3173a789f6227f13658e4befdac8e47e0.1794913893.git.geert+renesas@glider.be>
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

On Di, 2026-11-17 at 12:13 +0100, Geert Uytterhoeven wrote:
> The power sequencing part is optional, and only needed on RZ/G3L
> (SYSC_R9A08G046 selects POWER_SEQUENCING).  Users of other members in
> the RZ/G2L family may want to enable this driver built-in, while keeping
> POWER_SEQUENCING disabled.
>=20
> [...]

Applied to reset/next, thanks!

[1/1] reset: rzg2l-usbphy-ctrl: Permit disabling POWER_SEQUENCING again
      https://git.kernel.org/pub/scm/linux/kernel/git/pza/linux.git/commit/=
?id=3D76918eb855d0

regards
Philipp
