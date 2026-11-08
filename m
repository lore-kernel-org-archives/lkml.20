Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=77.81.229.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794152640;
	b=tsG3BhZO64TbJg8CeVK4IR3EKzoB7CRY6iTpC/nscxn/quCZGIjh45mNUIwdlWzWRNBQ
	 gxPx02GWmC0nbAK96OnNcfLDoDh6sYUBzu0lwEJlaGoVJeSd8jNjLBk5rKFMufeyygdNl
	 /5uYed6yxRn0aYuVC8ZYfA/bZW+N0DHdLpVWNUeqQwk9F2u3KiHCQMSaKE/z+icr8eL39
	 iPmXmhG84RBs+z9W9dmjq2l9UwX/bBx8jqIqat3dOubrUT4+YflFW+HFL/z20kel3W48r
	 T5LzIB3zmSAgMr+j7/SHzPNPMdkFsuo5/j7vfm9eJxP7I33aegS3Bha3OIMKJB9/LwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794152640;
	h=DMARC-Filter:Received:DKIM-Signature:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Developer-Signature:X-Developer-Key;
	bh=Eo1ZaLZZrfd/YOlbBrEYtHL95TbpUNio/UU04zuP9t4=;
	b=41kGgWqo9otWp6jWpIWZsWj4RllIpNRUCgo8jpoqy6l0wHiGkIYLJ4KZEUmiFUqV71YT
	 kmYq4OWXHV5gzmgHb7Ytr3228tcT9rv5jPPqe0hY3EaNJFSHzGs6xoGJKM2BNCcBCQ2d/
	 tdIF5vUDE/3r7SCcnQMpAPnEf3lSrJFee3F+uGpIuTvBTKqPdUSUkPW4CwPX5f1nwAu7f
	 aIZxGBBc14hd8NYfgENUarv7z6CR3s1lNZQIkDWFDG6yjxfrpNm+ScW6AwfV8GeQZj4ig
	 PItyXTa0NW5xjY4UnJmVR5844HpZu2IfWn2+3G5fbaYB4sHSlfDKKnWenfP6odg2/9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chaosmail.tech;
	spf=pass smtp.mailfrom=chaosmail.tech;
	dkim=pass header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=nl6dS3AY;
	arc=none smtp.remote-ip=77.81.229.115
Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDA9606A31C;
	Sun,  8 Nov 2026 15:43:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBDA9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=nl6dS3AY
Received: by chaosmail.tech (Postfix) id 0C32A1C8E49;
	Sun, 08 Nov 2026 15:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1794152634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Eo1ZaLZZrfd/YOlbBrEYtHL95TbpUNio/UU04zuP9t4=;
	b=nl6dS3AYWV/kVOO5HGd7Dj5S0JlGe481c0Lj7hBqwgRj8RGTMR0ByIaCbWv2fNCtbpkgHW
	+So4qaocJFPMB3Gtr3UJBJxtPd7+tjmz6KJo7Paw+IpDnHVfAqJRnRya5AYj5BdoyKhsMI
	iXV2Vq+ibylYrU4s8Rt7HxMNZYkD5M8=
From: Sasha Finkelstein <k@chaosmail.tech>
Subject: [PATCH 0/4] phy: apple: atc: Add M3 support
Date: Sun, 08 Nov 2026 16:43:39 +0100
Message-Id: <20261108-t8122-phy-v1-0-c2783b2a53a8@chaosmail.tech>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/yXMQQ5AMBBA0avIrDXplAiuIhY6BmOBtAgRd1csX
 /LzL/DshD2U0QWOd/EyTwEYR0BDM/WspA0Go02GqHO15miMWoZTWUqw0GSpoxRCvzju5PheVf3
 bb3ZkWt8B3PcDTMf27m0AAAA=
X-Change-ID: 20261108-t8122-phy-bc3190cbcfc4
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <k@chaosmail.tech>, 
 Ramzi Abdiche <abdicheramzi@gmail.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794152633; l=1027;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=hj5BkU6UvfYLxZj+OaIPtriXpAtA2vo4TSElMSijvvY=;
 b=nQm+YUCRhVUPUAOxMfU4UtWOOrV/vO1wbquxn7QSjkoYHDo+taxeGoi8dy1tOQ5fH/1XSC1+I
 ECVeJaXMMOiDZzzOFYpPVO+GXHAKDfgY8eaooj2qmgy/8B1Mt18ttb1
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

The M3 series introduced a new Type-C phy. Add support for initializing
and configuring it. This is one of the puzzle pieces needed for
USB3/TB/DP support on those devices.

To simplify the merge strategy, the device tree entries will be sent
in a future patch series.

Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
Ramzi Abdiche (1):
      phy: apple: atc: Add T8122 DisplayPort support

Sasha Finkelstein (3):
      dt-bindings: phy: atcphy: Add M3 series
      soc: apple: tunable: Allow passing NULL to tunable_apply
      phy: apple: atc: Add initial M3 series support

 .../devicetree/bindings/phy/apple,atcphy.yaml      |    6 +
 drivers/phy/apple/atc.c                            | 1021 ++++++++++++++++++--
 drivers/soc/apple/tunable.c                        |    2 +
 3 files changed, 924 insertions(+), 105 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-t8122-phy-bc3190cbcfc4

Best regards,
--  
Sasha Finkelstein <k@chaosmail.tech>

