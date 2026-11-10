Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794298197;
	b=jQ3MEiVkfhsWYkexbbL2YmBwCLi0NRxmg85HmW3Vq/hslviqiMntjJwmeqtSL9+y0FO2
	 pIZ6/FKvLfx2FXoOJ34bcxTEAhPCD9EPRL5j5S/atkihO8brkA/BURgdWDkZOCjM9O6bT
	 +hzZa5bsEzTZ6cL7GJ34nVOnHlsgsvYIVbsHMhVJZyyOC3ELXwoX+3Znutkg8U7Onm5EY
	 JHIcGI5toiBGh7nsOywQ+XBJS4AuArkFoWfPPZ72yEZP02rgSlVT4QHDujC3SGMFkMrTN
	 LcG5sx9rbkY64n+yBE4bIqs1dbrSdgWJG3f4NI1HINEEV/f1BlUIc5UxS7DHPH+Hf8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794298197;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=eu67nKrl8thChRWWxwnPMWk5WRVt8b81znEUdh6QWzI=;
	b=BEyCXuFnVP9k3PHc16tu3ADK3kYWGZ/ibQM0Y/HKyIgo8eCI9vB2KzrO61zP/3c97a3j
	 3g7L0D7w19fVXZu77nzOSFYjMpLrnI7suwzWESyQ//XDIdGfsAnrKvbD2o1fHKXLYU/15
	 ao+vgtbhUAgZA+UkqbyA0vWnaHZ/MhydxmdcN2Fs+uQWnuZl4FIO0VPk33Au2zh8fokId
	 s+amGx5OfEUUkk1uVXOi3mgXh4RCe+HfsOSH6kPaxPQ1u9lAYLIzJMhVM5rp3Y6LFAptY
	 1th/UMg2Nrkhuh0TS8ZlToOSpaXSegajt/NIWdj8i1WOhlEj/S7IthAGEOc77V/ZVAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ragnatech.se;
	spf=pass smtp.mailfrom=ragnatech.se;
	dkim=pass header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b="y/syhfkP";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=XdjsUDVE;
	arc=none smtp.remote-ip=103.168.172.156
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE591606A332
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:09:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE591606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=y/syhfkP;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=XdjsUDVE
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 14B1C14001F3
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:09:55 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Tue, 10 Nov 2026 03:09:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1794298195; x=1794384595; bh=eu
	67nKrl8thChRWWxwnPMWk5WRVt8b81znEUdh6QWzI=; b=y/syhfkP403rxRY5aW
	4UpgzANsj8E0MAbkBBPA07ISUS4KydP15mLBcHzK0ZmlkxJwcAG2Ji5lo3TBE7lp
	j8EaHEeHEDHBOxpzF5oizS5LkQbeut0djMESJ9gGCv/OHjjucmUFJ38gsOMWbGAy
	kXwnn0o1pNEXKIENmebdYfFAmdIMgdYPfzlRCx5iAPVjTbSprZp0i9Idt2dAjhbq
	9jru00HSL3rDyCW/y6vI+zRPuhsqJQtqvcqsdLhkpD0F8kGveOSxVCtE4BEo3+dA
	C0QsbRukKIPEWl7VfpPusI7LtmIV+Pc1Wvf21F1I/4ZyOYTiW0oCCP4ZHs2BMJ7Y
	pr7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1794298195; x=1794384595; bh=eu67nKrl8thChRWWxwnPMWk5WRVt
	8b81znEUdh6QWzI=; b=XdjsUDVEf94E3xANi69dMR1naQqB8VwLV/BO+9thFopH
	pXW0opbhG56tua/opc2AOjR9YqqSPkWs9s/F0GHNQv47/MWsxJl92SM+FboY8/ug
	4RtWB/To5MIb6coAb5pbR5mSHYExjIoXOPI548UgCvE8zLIMlOVAy0zsI93FLCyM
	71l9HaHjBzXSQfk2UxNAiCN3EisPRmhMKnoYMR/aVnJEkBkXfR3Y+DI72HTRIWTP
	k/cAcC+7+/5FUpVBhk+6+OsCMqHF9pl3DEC3TlViPPolD+Tlm6tvDYVx1zyM1vFL
	AxGlsRwdC+Z8lpgKAUFkg3noEql7iRoyTg4hoy7yOA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=ragnatech.se a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794298195; d=ragnatech.se;
	mf=PG5pa2xhcy5zb2Rlcmx1bmRAcmFnbmF0ZWNoLnNlPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:x6q8CXylMp2isXTcXaY00OrbAjsxGJNwAAuIvZi/D9coZnB
	VjgoFZhKKccXGLoAxNW1bO0ieNRNy3Ql8LGc8OfeWiI57aFw1KmdFMxwQNtM7LaK
	EzdgCFxc+Xbd5sfZpSPdDpNtz0oF95nzRWt4LV7XaW/pKVGvp36T2wZJ/Gr9+ART
	MyMZ44PgvAs+4vTG+TEYZpblgQSqWG2z9Ckr1S9kxiI+DOH7FmJb7aPTATAF6wyl
	PRaaTOiA+yHW0qeBggzpNouyrelKyCW7xqFr9jQc9qpkiyOCn7b6jtaVRGIS3EK6
	FEb0WBmbQw5BjK1zM4mSnLtrwuzmtOEC7oFV8pg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=10;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:vFlTB+7NMWqbCiHv5a8jcx5fz7fA1PmDFOeLrmACpRQ=:tSe0HwHwGaHBzXco/aL/zhpyFQADcXLLOcWq3KMpRAQ=;
X-ME-Sender: <xms:UtHyal8qHkLquz6HXdJ661IwLGe00OeyJSZWXCAX2FxclTE420yvCA>
    <xme:UtHyaicApk8cepSRVOPCaVwuUZHwn4s_QN3Y2kLz5_PgD7Xz-9E0HWlawALlNAruM
    1XQRN8FqPW36ddfyIYrUb63P1AcPY4xKkiKIpJU1ZERrVyQ1H_gGKDZ>
X-ME-Received: <xmr:UtHyahs6ZE5Y2D4-ssKkED4gyV6MGZfpdD6EdpswQYO_Ee8Rus2C7v9jE_0WPPmT4LAX0Ib0T2wrCDOueKETryQOiejuH2I>
X-ME-Proxy-Cause: dmFkZTFr2ruVCGVVVj8QksznlxJg6gwOFgezUDl1jMUM3ma1FT5YDj99x6ZnMvG8hkIPZr
    MzAirAuCzS9Ycyz/RQ0an3sTy0qEt0qVCAx+Kk7aGwRWpaW7N+a6jUK8KQUJzrhvjodvvA
    3Hw6iAkJYfzz52z/GKaukH7PTr90ixclE5/MdoGz80uUf6h0SOrxvedEsL1NAljjo2FviW
    FiQahowzpwh6HHwd8BClJ+PkcRsFz8WYSODvQ8Wxwaos7SD47T9IzDNZgelT8fe+Gu7mKr
    ga4Wlw4tMifT0zxFLfgq1KLT9oMETOKhy6HJSRk+spfsNjKTyTN0cYucCRRho087J0mFCk
    pOfNh8uxMUvJNDbrcFA7FKabwpcSBsissSjN6XdnhicJsT3J5FnWhR4NCKzAMcLdyl6R7k
    CLfQDupqUoQFPl+mejQ/oSDt6pKYIaBvzrN1QNLRwpvaq7Zj0WrR+TF/eUNUbNwS3Lxr0F
    z4sjkB1Nvs2lJ6rIGlwNphOwvDnS3r2REkelkcgYfBcgTzG4jZqTb4S7vJJ+BvMTuF4O9v
    1trBb3ftSHGTQ7jrE/b1fYbEk7PPDnrikGaf8WyOxOHQD41WO9YRRELih3+xEC+ti+VuL+
    Uzar+/SKbWnoARMKcVaYbtcHk30ZQG74K8WM4jc7WDxBlt43/rdshk82gDZg
X-ME-Proxy: <xmx:UtHyar2W38kQlI24Y1u5Oxa0rVI0bgGZnFNC9g2bdDDSH__jssTPaA>
    <xmx:UtHyauC7k02q_c6sPNjX-CA_9l9_YgOeeBGPNO1xdWra11kP8cr-hw>
    <xmx:UtHyagf1KDkGDMV3qvYuUkNY3UleTR9VSmozN8gWO2SrD0vElt5BHw>
    <xmx:UtHyaoynriwIB6gK7FuEwkonN1EGrXCvIvdKlc03Z86L-29eV6kH-Q>
    <xmx:U9HyakVCsHC1EEqW-XWidwzMYf1YA-7Kuxu6ni33wQgweAutp0XFE7iT>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Nov 2026 03:09:53 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"DavidS. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Sergey Shtylyov <sergei.shtylyov@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH net-next v8 0/3] ptp: Add driver for R-Car Gen4
Date: Tue, 10 Nov 2026 09:07:24 +0100
Message-ID: <20261110080727.2377040-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

This series is the first part cleaning up how PTP timer support is
implemented on R-Car Gen4. Currently there is partial support for it in
some of the Ethernet devices that can use it, but not all.

The partial support have been implemented by hacking the gPTP module
directly into the first Ethernet device driver that used it, RTSN for
V4H and RSWITCH for S4. This is understandable as earlier R-Car
generations had a dedicated gPTP timer for each Ethernet device, but on
Gen4 there is a single system-wide PTP timer shared by all.

The current implementation makes it impossible for other Ethernet
devices on the platform to use the PTP timer without messing around with
other Ethernet device drivers.

The effort to clean this up starts with this series which adds the
system-wide gPTP timer as its own driver and device tree node.

This series will be followed by work to the RTSN and RSWITCH drivers
will be be switched from its current partial support by mapping the gPTP
address space directly to instead use this driver.

Having both this and RTSN/RSWITCH described and enabled (!) in device
tree will not work as they will try to use the same memory region. For
this reason this new solution will only be enabled on platforms
after all user's of the gPTP clock have moved to only use the new
centralized timer. But in the interim both devices will be described
(but not enabled) in the platforms base dtsi file.

For some platforms this is straight forward, such as V4H Sparrow Hawk,
which only have the RAVB Ethernet interface. This platform currently
have no users of the PTP timer, but still advertise it supports it. This
and the soon to be posted RAVB patches solves that.

The gPTP driver itself is heavily influence by the existing partial
support for gPTP in the RTSN and RSWITCH drivers and the Renesas BSP.

Niklas Söderlund (3):
  dt-bindings: ptp: renesas,rcar-gen4-gptp: Add R-Car Gen4
  ptp: Add driver for R-Car Gen4
  arm64: dts: renesas: r8a779g0: Add gPTP node

 .../bindings/ptp/renesas,rcar-gen4-gptp.yaml  |  64 +++++
 MAINTAINERS                                   |   7 +
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi     |   9 +
 drivers/ptp/Kconfig                           |  12 +
 drivers/ptp/Makefile                          |   1 +
 drivers/ptp/ptp_rcar_gen4.c                   | 225 ++++++++++++++++++
 6 files changed, 318 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/ptp/renesas,rcar-gen4-gptp.yaml
 create mode 100644 drivers/ptp/ptp_rcar_gen4.c

-- 
2.55.0

