Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793703118;
	b=sMWFXS+rWnuNl/kEpHKSPBcFNjFNmc3lQ5vV6xF+IiFqaIQVga6Bxe/wmf1VuL/J9qv6
	 uYt/Shs2nN/Y1w9aAGpg4ATv1FQucG7jbnrbZLyF0Q9AWiIX23OoExykfPnY0kGwdg9W7
	 tyyz5lc6ZIvJ7dGq6/g0fXJCz1ktJ9wkoBinrTSQ652fWN10Y/uY9Gf9EeW9dQRx7g5VC
	 ytQl7meBo9nKANR1ysuc5HoVMKr0GroO7m35nTHoRNFBaqxcwXFg+Ul2ArrzhJMlEAovh
	 EGaD7631d1EwHsZHszKiCtLtJ2TBwKGRUObmjQoik02Nu/iofQdYOH5PDZZF8v8b1UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793703118;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=PnqVtJFbpVdgN32kQBhDM0J5gyS/rozEwm1HbKCbgZ4=;
	b=R1sFaAjKreDQyi00T/PAmUcNDOpVL073LGu+m+G0I73Kk8HL0JpRB4QFA3Mp93OfNzrD
	 y6VVueMGE9JIxzm1uM1Q+8Xx2qM+65utwoaZR0b2AmL+6SAL24VgC0XBuNVQcKEbXVVpl
	 i2VzhdYhZFYo7JXsOtuXvTR5YX8OWg9hOLL1IpVHx0zOgBD/VA5tEEP3Uf3Uv0XEvtsF1
	 px/RZ3YGcmy33wR6yoQPwhTj4wvM+1uhpx84EYWVNjsYsAU2+IRtuTYazzp7TPBfSnOVq
	 ZrK/pGp4Db/XJwLlyndHHzBixKyex6RayN9Tud9ySoAgbn7hrFpy66ZiqRJTVdwFwxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=0zvSXBic;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A54606BFA6;
	Tue,  3 Nov 2026 10:51:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7A54606BFA6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=0zvSXBic
Received: from francesco-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 17A091F9E7;
	Tue,  3 Nov 2026 11:51:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1793703106;
	bh=PnqVtJFbpVdgN32kQBhDM0J5gyS/rozEwm1HbKCbgZ4=; h=From:To:Subject;
	b=0zvSXBicnV/xXIsl1GJLQh3SSvecf17cecdQ44SHpz1ff+NGnNtixCryFfCmZZnI3
	 +JCl/509PQptfrsZF57nWDc1hzx5QaaYr58nSW9SvY/o9IvCAf1nv6WVU2Gxhfqy0F
	 BcYEH0LzvBo/I9UN+tecfzAJ4Znp+bcGaTA9PHyeRDbyh83p9qaaSi3gIqfdjejqsw
	 Z61dHUtYm1hVkWFDs12qH2TnKn74O7QarqFrGmrUuClosC7zsttwq4HLShk19Mw9ne
	 8ycsXr6mJm9+tCWlq2X9+HCLA9TodPTCdp8f0EpCFyHenK8+xevf4EssEU5T8eCtoo
	 hm/l91pivF6Zg==
From: Francesco Dolcini <francesco@dolcini.it>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] arm64: dts: ti: k3-am69-aquila: Keep DP_PWR always enabled
Date: Tue,  3 Nov 2026 11:51:34 +0100
Message-ID: <20261103105137.2393416-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

DP_PWR on the DisplayPort connector powers active DP cables and
adapters, which do not work without it. Keep it always enabled, and mark
it boot-on so that the firmware, e.g. U-Boot, enables it at boot,
whether or not a display driver is available.

Francesco Dolcini (2):
  arm64: dts: ti: k3-am69-aquila-dev: Keep DP_PWR always enabled
  arm64: dts: ti: k3-am69-aquila-clover: Keep DP_PWR always enabled

 arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts | 2 ++
 arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dts    | 2 ++
 2 files changed, 4 insertions(+)

-- 
2.47.3

