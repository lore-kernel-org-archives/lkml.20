Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794367414;
	b=3Lzj8cl1/cEA/hHwB6Le0ljjtEudUqnZ9aKZHKE9Jugazn/krZ9BOfvY7s5bw0TgeJ31
	 3bhsab8kwbShkTZ9aQR0aBaqYw5dILBWWjSbTaspzdiMX544JaMLPGSJ0HRxOfXv3F6LT
	 FCxhNxH6OWu78liYjdzE9IZKzMOhB1K87FMZQhbOugn/IKbgLrqHg9gkvLhejPirs7VzA
	 oaxYhgouHyUZbdnDbypVd2lAQj5XlNWp6Nrq6/P9Tbl5/w1GA4nAPiEvKigCOQVczxcwD
	 NaPyxnQxPh/fsppgxtD26F5wgLHSQlXfRgAVzATFXv3C8Y9tsKAfCRhd/nxoIIlUTQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794367414;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=AnQTJxJsyON1/Fwj08spRDuNd9Ce/tmtwhBo1vhY0J0=;
	b=FisTd3iFzZYbPkJYf1lTiOBcKXwcUw9FS3M9tiy1xz+jIb6KCX0CGW6f1GBHe0GVR8aC
	 2s/bXjbggCGGyiJHE+R2O1RwblTlGPRNCsYulQcVy5ZIjOy4jIrxaK9JPsZl8fW0h1Vvi
	 6KpjvDTjn4kkaYVUM8KMaHp+o+Mr5+Fyp+sZG3eMr2mz4EZubs+Wg0UUugDgIigWTqgCF
	 e1NuahoKf7iwrpbETkJpvN25eNMPKwaX4d7nc8ENuyYGftGYynJBPiRrxIj0A5ZH1Vxwx
	 OwTA9d2nYNhGuq/5bEnaAAbkgbscQLAIlkHaidwWSo9Ugp3R1mWBU0cdfvE2SA2R97Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b="y/Xa7m2B";
	arc=none smtp.remote-ip=185.70.43.101
Received: from mail-43101.protonmail.ch (mail-43101.protonmail.ch [185.70.43.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0626606A320
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:23:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0626606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=y/Xa7m2B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1794367409; x=1794626609;
	bh=AnQTJxJsyON1/Fwj08spRDuNd9Ce/tmtwhBo1vhY0J0=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=y/Xa7m2B+wNXpITqszqicbXrEPA5zE2ELQgvS8N6LNpxSTWasihv1+9eMSsb5yQ3r
	 btvZmg0VTo4g3SxWNraEfa09zrPRB+r2jMpblL5xArYcy2Q0sjio+vfwqxHmJGTxJ4
	 JD2t2uxlY7Cp0x1jvHFD0hseXNphKSkpFtuT6uGeNE57HB3eSGcZ90EouUDKaXzK0u
	 XxAhsPGYNuhjN5xgPq2CEfjEfX9ltpRxFGID1IBsBn/BtVwO+e0eq62qNkBiKBiHZ4
	 78rLNkf7hmXJrGVODy3n9jpJBh4Q4EN0lVNPDsZU4wA1//joug7In3fJ7NXaJRu8lk
	 1QNtcTfhGoRXA==
Date: Wed, 11 Nov 2026 03:23:25 +0000
To: Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
From: Soheyb <soheyb_boulaa@proton.me>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Soheyb <soheyb_boulaa@proton.me>
Subject: [PATCH v2 0/3] phy: exynos5-usbdrd: fix HS phy init count on Exynos2200
Message-ID: <20261111032309.3365794-1-soheyb_boulaa@proton.me>
Feedback-ID: 140697376:user:proton
X-Pm-Message-ID: db6bc34dc5b1448ca86b8d1420ff9673299626ec
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The UTMI phy of Exynos2200 initializes the high-speed (eUSB2) phy but
never exits it, so the high-speed phy is not set up again after it lost
power in system sleep (patch 3, v1 [1]).

Sashiko's review of v1 [2] found two error paths that v1 leaves wrong: a
failed init of the high-speed phy is ignored, so the exit that follows
takes its init count below zero; and the high-speed phy exits before
the steps of the UTMI exit that can fail, so a failed exit leaves the
UTMI phy initialized and the high-speed phy not. Patch 2 returns the
init error, and patch 3 exits the high-speed phy last. Patch 1 undoes
the UTMI init when it fails, which its clocks path already lacks and
which patch 2 makes reachable from the high-speed phy.

Changes in v2:
- patch 1, new: undo the init on failure
- patch 2, new: return the init error of the high-speed phy
- patch 3: exit the high-speed phy last, once the rest of the exit has
  succeeded; drop the comment (Ivaylo); his Acked-by of v1 is left
  out, since the exit has moved

Tested on a Google Pixel 9 (Tensor G4), an out-of-tree port on 7.3-rc7
that uses the Exynos2200 phy ops and powers USB off in system sleep:
USB comes back after each sleep, and with each error path forced by a
test-only switch, both init counts stay balanced. Not tested on
Exynos2200 hardware, nor built in linux-phy next as a whole.

[1] https://lore.kernel.org/all/20261109221522.2796426-1-soheyb_boulaa@prot=
on.me/
[2] https://lore.kernel.org/linux-phy/sashiko-outbox-205724@kernel.org/

Soheyb (3):
  phy: exynos5-usbdrd: power the Exynos2200 phy down when its init fails
  phy: exynos5-usbdrd: return the Exynos2200 high-speed phy init error
  phy: exynos5-usbdrd: fix HS phy init count imbalance on Exynos2200

 drivers/phy/samsung/phy-exynos5-usbdrd.c | 28 +++++++++++++++++++-----
 1 file changed, 22 insertions(+), 6 deletions(-)

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4

--=20
2.56.0

