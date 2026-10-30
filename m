Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793400094;
	b=YubwEdFHXJmG+pDOWk3lW03eJoEJBOa79Dszx7On4R+uQcLwbmb1MW6WI0epeT9yakMS
	 jZnfMUYaTm/HXRcKF2BT5xnpZpykgsNHmXrAtPe8xdHmE7bAY7ZBHT7AqVAGFziHMP2tI
	 qBh9LgJcLQc7eWm0TeQhyniT23huVp6nKJ76zo04I7JjGmOIplJLs/1bACaSng6drK4dU
	 JRoDTO2e8T5FdyBDeagqVyHAWWjrSpT3CiKAmv2G9bsEkzD1poWbAKPSf+0AfSiW6nhQl
	 kRd7d2EqRZtx2q/dssfgv+mn9QvbF4O+PUV/bz1gL0FhWfY6wHhwggFLcJNM/XyjlAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793400094;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=5E6sgeg0LYrcTFywVWbADXySmsuGpioelAibcxQDN8Y=;
	b=q22LmdZPQvPknhUtJs/Fzg+qDION+YtjJbkmrO032PaQ/jv8DC3hFzorIumh5lTiVQ5x
	 /+DMAokKrwQF+kLM6Az1fYjkHyg3VK4+CoPrJ8IPwIoH/xYCpuNb+jFLODGYJHSmtg0Ss
	 nTKhNnlheLPTOmM6zTPgybDmP51lp8jQ6kOnuoVflRfRLTl3ZcTRAR/j6fVq2p6uqIO7x
	 G+4Ep49KhOAv3htp/sSqwdQKCeE23SpS37cfAApj1j/NAoDPMkYofOGApJL5P5VWbLwmq
	 hZ/vP7wqVcqnKAP2XF+FYoLarC7TEDQv0/3FaAO3VEGUzY1kghbb131p+oh8xo7IVnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=Wm8PwYtY;
	arc=none smtp.remote-ip=185.70.43.22
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E77B606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:41:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E77B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=Wm8PwYtY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793400092; x=1793659292;
	bh=5E6sgeg0LYrcTFywVWbADXySmsuGpioelAibcxQDN8Y=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Wm8PwYtYmdbDLzNGjZaFF+D//OoSbNBCIIN4UzudkyBATyQGSVq+gJNuc0KlJ/vrl
	 OK02SdsEG8iWe8VM4/LGnZRb2gReVeQ1tRb8gLP8uInqBtk8vVM2deGRBYzCh19Y9N
	 za2KzCswpCavEV8OC6401sTVJlVcaeMrMeMweYIUH1H8uBiOG8bQD9i/exmSCFNGsn
	 msB4MmheFbQBrCAzooGKKzjZPKct2Pb5hWqOwRMsSlKuyBZ/r7HO8G0c2hEo3IUDuO
	 iQGAFXmdXPk+vpjJdluoESoGkGUGAiu0GgEWrgJrG59+5DR6IPC6cGqNTpE+cIpVgl
	 5mOS3NMahoDXg==
Date: Fri, 30 Oct 2026 22:41:25 +0000
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 0/6] Enable some more hardware on the Nothing Phone (3a)
Message-ID: <20261030-asteroids-dts-updates-v2-0-66a56c537749@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 8d038dbd0fb169e041546a6cde86b32c54ffbf52
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

This series enables UFS, Bluetooth, Wi-Fi, IPA, and the display panel
for the Nothing Phone (3a).

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
Changes in v2:
- Drop output-low from pinctrl states
- Allign the '<'s in uart11 pinctrl-1
- Move gsi-loader & memory-region to SoC IPA node
- Link to v1: https://patch.msgid.link/20261029-asteroids-dts-updates-v1-0-=
79351337d681@pm.me

---
Alexander Koskovich (6):
      arm64: dts: qcom: milos: consolidate IPA properties
      arm64: dts: qcom: milos-nothing-asteroids: Enable UFS
      arm64: dts: qcom: milos-nothing-asteroids: Enable Bluetooth
      arm64: dts: qcom: milos-nothing-asteroids: Enable WiFi
      arm64: dts: qcom: milos-nothing-asteroids: Enable IPA
      arm64: dts: qcom: milos-nothing-asteroids: Enable panel

 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts   |   3 -
 .../boot/dts/qcom/milos-nothing-asteroids.dts      | 309 +++++++++++++++++=
++++
 arch/arm64/boot/dts/qcom/milos.dtsi                |   3 +
 3 files changed, 312 insertions(+), 3 deletions(-)
---
base-commit: a39c950806213f6861d00f90729acaaa21f2d95a
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.gi=
t master
change-id: 20261029-asteroids-dts-updates-ce3d00b4f844

Best regards,
-- =20
Alexander Koskovich <akoskovich@pm.me>


