Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794621653;
	b=eLXyGl7Mr6USTH685pOYpkG1LJBkQV2lQMX9I0L6R8A/vB2JtAoHOmcdzaPlQQB55b9I
	 0mt2mxir7i6GUh/VLDW+e9tSSkqkn9itvlLOtCnlXdAn/um1utk1LdtribjwjfLCNsZXm
	 O/AaY+I8ZXULZSXAOsEpCVaVxH2fXsYB8Gwja0GnQdpRa1wn4oaoOv1iDmsJSDWHfhWAm
	 GHmf4G2SwTFQk5kyNB13Tgu50ZCbsFY70uUld6SMl2Y3sRqdlthE+kMh6tUJBY0mZ8O5V
	 PbLsJ6HKHaicww3v3TGi9xjKVC6L6qBHV0sORxV+1TF0qjGj5joNf9krxXn7BueIs8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794621653;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=vvMUY+tfY4bLEo7J+cO96vvL91qJtRAZypMSTLnvhLA=;
	b=3qmIvV8ftMZFVA7dbghi9eJMLVnJNFGv4zE/A4w8EAikgJfyx/xeUuldmkt+B0N9A9ej
	 xiL49BxLlKdhCgcwmHnWI18nqPnwvapoLR0gdSMMfyep2lbwTE2ANrswe6VufbLz2SbP4
	 07tZwJt/2NO+Zs1N1z3gYRCXAEhHoB49Iz6gdd5cQBfX0JXJ1v43wFv8UCWyN5awPD5bY
	 vnmvDfpwzav28mV9P5XJcvu9Nmm05bsAcmVQ20FHnNyN2d5+pRhdXhkCe4lDkdbrSRGBE
	 ofcKTDm30EYOP3NAFRweQmikd8O9thwZ8j3t4DtzU3en1d/2mA8qcC+A/kp5O+5QZdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=qq7hAiva;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A17606A331
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 02:00:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98A17606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=qq7hAiva
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794621650;
	bh=moXEvhJNmmtfZmy42YrxK6QLzYWtdJ2Y+rk4roi7QMU=;
	h=From:Subject:Date:To:Cc:From;
	b=qq7hAivaO2E+FGy/90m9xGOscVpxU1UkJcUhqs4tAHx/nZ+KhUQ7Yf0+1ehLlf5+u
	 vb0yqIi+qzjWTCkIfaS1dY0RDa9TsYBPQJ5U0eLhjYiyKmYETEoBuO/oeixXUQj6hZ
	 Uuf75vBHSb3zC6Ia3HaSm12W8lDEaoBRaabx1AQD9rlUd8bNDeZITDK4/QuLw9vv0Z
	 BDRKppWmZbq4tpAr0i/o25AnUnUONjJGYrBLHHtsYLu/SpAgoQ1NG1pQ5GDIMRbZsp
	 aFf1Vox/JM0FisIsQYcuVPQuUWRZoRuU9QaPRlr0lUdHvhfF9DgQzl2DIZ2wuHncM+
	 e3jNW0nm+KaXg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B2C6F17E00AF;
	Sat, 14 Nov 2026 03:00:50 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 71A8A48002C; Sat, 14 Nov 2026 03:00:50 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v17 0/7] phy: rockchip: usbdp: Fix runtime muxing between
 USB3 and DP
Date: Sat, 14 Nov 2026 03:00:27 +0100
Message-Id: <20261114-b4-rockchip-usbdp-cleanup-part3-v17-0-1af5f566408e@collabora.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42QwW6EIBRFf8WwLhMQ1MHV/EfTBTyfI62KBbVtJ
 v57wZmkjZt2xyWPc97lRgJ6i4HU2Y14XG2wboyBV08ZgU6PV6S2iRckZ3nJFJfUSOodvEFnJ7o
 E00wUetTjMtFJ+1lQAF0xcRZoUJBImTy29nNXPL/cc1jMK8KcsI8Jj+9LdM/3MTJgCHpX11kSc
 34QNx8gftK1X5CuXFFGTaVaU7TSyFxfwPW9Ns7rE7ghmYwOSON5sHOdrdUpEoGTtFVnw+z81/4
 PKy/2LR6Viz8rxwdRrXSjmJZFqQpxUCfDystfVMH+QS1TIeBStmemW5BH6rZt3wxJAJ7BAQAA
X-Change-ID: 20260914-b4-rockchip-usbdp-cleanup-part3-cca70383ebe3
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Zhang Yubing <yubing.zhang@rock-chips.com>, 
 Frank Wang <frank.wang@rock-chips.com>
Cc: Igor Paunovic <royalnet026@gmail.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Alexey Charkov <alchark@flipper.net>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Yury Smirnov <yurymonzon@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2526;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=moXEvhJNmmtfZmy42YrxK6QLzYWtdJ2Y+rk4roi7QMU=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr3wNIoOFAiuTOFyBprjldwD4Wvn5o4wSVI2
 Ovnf0XuJ+sMt4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq98DSAAoJENju1/PI
 O/qaKfoQAJAGQtPnxa/fWHXSgTfFKjSWb+XaEFkXj8cYdxR7mfroVPs0o5nEkPTvEcXApgJOrBl
 A1Vy3EmtyLhWHC2g8P2TVlqvzmUQyI3qA5eTeeC9zQMLizfZyYJgX02Zhnu1uZ4/Bfm+knm49Cm
 Gg+SZ3ulJZKMWpMDsYUcCpG3zb9DWEFMpSCkfBLT4Z11SEuf1drcLMH7LNAp0W7Qvaxc1trysQm
 sVzHmizdM7gNfAzGVpTZ3uV3jwWbY7Lkd/SAZku2nX5/uNP8o7q2uZq28Qk8Yod53X5MJrHNHFa
 x4yGTisD6jNLJMw5QRmic3g0XbJONPweUps3kAHKRObKC0eP0+uIHUY+y0+F5SYldLbHAMUlzQm
 Z31EMSGiNdwS5WTxbi3I3wRI46xaYkGkKz75VzK6tePHRAAgwNiXoNyST1MIQaKwQM4UEFuxS7n
 L1iY1rprdjpGHJg4ayPf26IAXiv2TneO4YVoU7S8dXHGHO8UEQkv2Qae/LfHGDFWDF2bVinu/a0
 4O8j5oCpTopnlD9w1Ej+g7ISt0tQB0N6QEI2rqqovPqgptwYyC1u+hCJ+TjqYQG0NlLUqSKsMXv
 L3xEZtscwjbKrmirGMan3kJUuEQngtv+sLDD8V2PEzy2qONf527+lPCQd6MF71Hrkg/6rCVAeYG
 gp+VAWeH9R5bLUpCizm00zw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

This (final) cleanup part depends on new DWC3 glue driver series:

https://lore.kernel.org/linux-phy/20261114-b4-rockchip-dwc3-rockchip-glue-v19-0-b79fb5f4b42a@collabora.com/

Changes in v17:
- Link to v16: https://patch.msgid.link/20260930-b4-rockchip-usbdp-cleanup-part3-v16-0-bc144f80afc4@collabora.com
- Rebase to v7.4-rc1 and v19 of the glue driver series. This drops
  the first patch, as the PHY reset notifier has been replaced by
  direct calls added in the glue series, which now also introduces
  sw_mode.
- Add one more patch to gracefully handle DP lane remuxing after cable
  orientation change when the DP controller kept the display output (and
  thus PHY) enabled even with HPD=0. This can apparently happen with
  some DRM compositors.

Changes in v16:
- Link to v15: https://patch.msgid.link/20260915-b4-rockchip-usbdp-cleanup-part3-v15-0-9ad90a456953@collabora.com
- Split out "Disable USB3 port during normal power-on" from first patch
- Collect R-b tags from Mani

Changes in v15:
 - Link to v14: https://patch.msgid.link/20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com
 - Split the series, no patch changes in this part

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Sebastian Reichel (7):
      phy: rockchip: usbdp: Disable USB3 port during normal power-on
      phy: rockchip: usbdp: Drop -EPROBE_DEFER hack
      phy: rockchip: usbdp: Rename mode to hw_mode
      phy: rockchip: usbdp: Fix power state handling
      phy: rockchip: usbdp: Re-init PHY on mux change
      phy: rockchip: usbdp: Add USB-C state without DP enabled
      phy: rockchip: usbdp: Add DP lane setup to power state update

 drivers/phy/rockchip/phy-rockchip-usbdp.c | 223 +++++++++++++++++-------------
 1 file changed, 125 insertions(+), 98 deletions(-)
---
base-commit: bc71431221f5ba8bb33918399552636e059c2c45
change-id: 20260914-b4-rockchip-usbdp-cleanup-part3-cca70383ebe3
prerequisite-message-id: 20261114-b4-rockchip-dwc3-rockchip-glue-v19-0-b79fb5f4b42a@collabora.com
prerequisite-patch-id: 4fa3aae8ccfa5383522070179c8777302411082c
prerequisite-patch-id: 0cfab94fd67b6304cd303a9810981aaca328c651
prerequisite-patch-id: c2e1c453454a7589a691fe391dc79e86f09ca7b7
prerequisite-patch-id: dadeaf9e369e04d8b3329493a1a0756ddd6140f0
prerequisite-patch-id: 2c727b8400980c760ca8f1e5fd989a3bf9404020
prerequisite-patch-id: cf4e7d51c77a5eccda6c687730eddd3135d94d91

Best regards,
--  
Sebastian Reichel <sebastian.reichel@collabora.com>

