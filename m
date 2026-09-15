Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0B34A64CE
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789475285; cv=none; b=SsBPJE7v7o9w+h9CumMTxHJC/X795zg/DWtbYKMQmgnDbkxZGzj3hTrKCSub5J8snI/aWMqxv0l2WydUTgGtWuar9CmeOeU5XhvKFfAkrWMZid3NaDPdnvEqi/B85DugzaP7XcmPnluIcdMncJ1OYG0m+7tHajNg6xQxRSLibgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789475285; c=relaxed/simple;
	bh=fjgaxYIkHsKMCuCxbpX52v0NBvL5DHy/++HiJ3R7ad0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CgycQr7UhQ3ykRZqkNmvH0C5wmXxxoJIuJgfLol59ZZxFOab/sYcArD+TAOTzBRw07fhLRteED5FaGrGFIojicYxLwiSijhuEVE4U75V61cVhjlvADvoYsvG+mgI+WW67mEhh0yrwEuoW/yQrrHXr1nR70psbaTutS0URnRCcYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VGnntRw+; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VGnntRw+"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e4ad9so1173535e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789475282; x=1790080082; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WazcjzkIAdsaj6kzT/3JxFcBr2wvj1ct6YfgbM8kJLQ=;
        b=VGnntRw+8tBeYzc47DUeyVR+ZR0t8p2/1BLOYxR3IOHZ8EJGgrGxmJHYa6vDdKb5CB
         /MIthYHXBUo3Nd7n1ClXAYATztN/M4GAkWnbdMSkHe+jVkzV7iLVN92jmsAWfmaLeWzk
         PBeId5Zb7d477OQi3UMPU7JuLNZX31eVhfS7c3k2RlCwn0uboxIRK8v0wfPr9R1hohvF
         C3B11MJs303r32kKngRrUhNYcB0TL7QSgeruUOSPZ8y6bYZB1zVd3zWqd9yqQzNYOE1h
         UAQb/XTHGi20czWkgQlwflc6jej3dqF8I8Se1SfiC3rzrK9aO1oLgeiknounyhIw2gq0
         tdDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789475282; x=1790080082;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WazcjzkIAdsaj6kzT/3JxFcBr2wvj1ct6YfgbM8kJLQ=;
        b=IPrxMnVFRYzIY5ggbWnX65y0uZx9xUlMqoaRq/iBC7ZAxaAuLNEKVs3d2KuDp0XT4V
         iH2unTWAxnceSZbXwX2KC+DxxnXnlJq4vp6tOYUY3cLf4v/P81usAGVVYYvXJz54/Ksr
         o1evEGH4un5RD2/8/4bTVv26u66uMbI0U7tKorwUZmDAQWuhfY2rJF5dGOWhflAnb4qW
         UVbc6MBU5SUKZCXVzLe02/6ynREVZjpBcwff0bQL3cGsroYkLvl/jdb8BClQ7e7UL/OF
         2+M07zW8gxLUWYh9C/7cWRZietPly0cp6831feXu4sllAnJJTk6koqKMWICCmu63ATVD
         LArQ==
X-Forwarded-Encrypted: i=1; AKwUvByzBSOK7U/H6LHYrcvTxHE8Aclu4FSSoMVRpaSaPSYh3Tm5tPBCNdtgNScFwvYUFLREgZ7sKJq9gFTzjbU=@vger.kernel.org
X-Gm-Message-State: AFuF++lRmeDNz2RLylgJuQQtz+XUDXDI64Sq4ypMYIVq/P/A1KQC6GBy
	AmtIiWP7VBwZ1ey+nzANhhCtZrxijx0ephCAIMIt729dbREE4JJPR73x
X-Gm-Gg: AYBFou1mQkcFagl0kFfPwGC2WICGosO/Z1FNhxhVJevuLMAjZSmXlFSRCEYfWYTjn2N
	gnxGt5UlLdaWDVvXiKEXPYHbKn9BcrZQPWNYnE/lU1/uesjGwIueMSY72VJZEg8SPN9QQFkCEB9
	nGeeIyDsbkuZILZqVFq9qNTToyfWFBdsRggn8FTQ3YVFo9s/cc+hvSZ3PUrZn7aZ3xch6BcrFk4
	eowqyaiJc8ahXSPn4y3g+/jkALsckH9IoVZMQQNx+ctBt1erkD2niJE5EcKnsgtpMBRDrAhq5NZ
	P42qbBc2KOqRltqRVk4vupHkJO/eaj/XswAj4IhgJ5xVZM4X3DcDv075wPbyYlmoDGdm2m7oYsY
	19DNT+C5luG26GLr6Mxa96HKuvgjWIFnmRv5Cvr9XQ5jY1BGir+nQTvxZ9OyMB1ESBfT+ejxM/S
	qnWg0BqP+bxKm9WAGU3dCcfCBXCQFVwLNBr2OMijhZXf3UsHRvOGe2WoYCA+70DuHifXhxUA/p9
	3C4K+OSI/qiS/o4qUX7ediemqhufa9NVciY0UIKJunNG+WFNta1WsinyzqMl2zOOPc=
X-Received: by 2002:a05:600c:4e4a:b0:49d:1df8:156d with SMTP id 5b1f17b1804b1-49e8228f824mr15102105e9.18.1789475281666;
        Tue, 15 Sep 2026 05:28:01 -0700 (PDT)
Received: from [127.0.1.1] (2a01cb0007c59900d73f8285c1e647ab.ipv6.abo.wanadoo.fr. [2a01:cb00:7c5:9900:d73f:8285:c1e6:47ab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d6bf4desm83105075e9.15.2026.09.15.05.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:28:01 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Subject: [PATCH 0/3] media: rockchip: add support for the RK3576 Video
 Capture unit
Date: Tue, 15 Sep 2026 14:27:55 +0200
Message-Id: <20260915-vicap-rk3576-v1-0-d3f5eb58a0b5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMs5qWoC/0WNywrCMBBFf6Vk7UAzzSSxvyIu8phoFLUmtQjiv
 xsf4PLAvec8ROWSuYqxe4jCS675cm4gV50Ie3feMeTYWGCPurdoYcnBTVCOAxkNmo2Ull2PSot
 2mQqnfP/oNtsv15s/cJjfjt+i8PXWOvN39s+M3S9CEGoGhBIWiHMFYyT6aAcVWY8LvjXeVYZwO
 Z3yPHY+UlKW0pDaH5G81WQGJlq71HuDpDgpaZXYPp8vODiI1vEAAAA=
X-Change-ID: 20260828-vicap-rk3576-6e7118ea0246
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789475280; l=2501;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=fjgaxYIkHsKMCuCxbpX52v0NBvL5DHy/++HiJ3R7ad0=;
 b=p9QzUFEagfxIF+66sL2fgBQy9ZfkQOV2yNuM1urHy+dkfInoi+sxwkJKWB/FT0x3gg10Ims/2
 CoWDe/9nDo8BTaMVgacfHx57PWnOhfXxp5lc8ZkaaE7HTDs8Rj8nMC7
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=

This series adds support for the Video Capture (VICAP) unit of the
Rockchip RK3576 to the rkcif driver.

The RK3576 VICAP features a digital video port (DVP) and five MIPI
CSI-2 capture interfaces. Compared to the RK3588 variant, the MIPI
register blocks are laid out differently, the ID_CTRL0 bit layout has
changed, the VC/DT filter has moved from ID_CTRL0 to ID_CTRL1, and the
capture size is configured in the new ID_SET_SIZE register. In
addition, the pixel clock of each MIPI port enters the VICAP through a
dedicated gate in the clock and reset unit, so the VICAP claims five
interface clocks and five interface resets.

The device tree node connects the VICAP to the two MIPI CSI-2
receivers that are usable with the MIPI D-PHYs in full mode, following
the approach taken for the RK3588.

Tested on a Radxa ROCK 4D with a Radxa Camera 4K, whose Sony IMX415
sensor is wired to the first MIPI D-PHY in full mode.

This series applies on top of the RK3576 MIPI CSI-2 receiver
series [1].

[1] https://lore.kernel.org/r/20260915-csi-2-rcv-dts-v2-0-bdaf8141616a@gmail.com

Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
Amin Gattout (3):
      media: dt-bindings: add rockchip rk3576 vicap
      media: rockchip: rkcif: add support for rk3576 vicap mipi capture
      arm64: dts: rockchip: add vicap node to rk3576

 .../bindings/media/rockchip,rk3568-vicap.yaml      |  46 +++++-
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           |  83 +++++++++++
 .../platform/rockchip/rkcif/rkcif-capture-mipi.c   | 155 ++++++++++++++++++++-
 .../platform/rockchip/rkcif/rkcif-capture-mipi.h   |   1 +
 .../media/platform/rockchip/rkcif/rkcif-common.h   |   4 +-
 drivers/media/platform/rockchip/rkcif/rkcif-dev.c  |  21 +++
 drivers/media/platform/rockchip/rkcif/rkcif-regs.h |   1 +
 7 files changed, 308 insertions(+), 3 deletions(-)
---
base-commit: bd5f485f3f026225b86573e559af0b7254ef4184
change-id: 20260828-vicap-rk3576-6e7118ea0246
prerequisite-change-id: 20260825-csi-2-rcv-dts-7712bd834de6:v2
prerequisite-patch-id: fbe2d84f88709b8bf846debe6b8ce62c4392ca63
prerequisite-patch-id: 9bce33933ae69e8cc7f7ef2f0d9acb969620bc85
prerequisite-patch-id: bff0c668524f94b0b7901c682d5ccdccfe18d46e
prerequisite-patch-id: 8f45701f840680a35e044f43ebd3087282847990
prerequisite-patch-id: bdbb3e9b072469900cac21031cd799265b52d734
prerequisite-patch-id: c91ceb74abc8bc79ac036990abdef4cbd7328f97

Best regards,
--  
Amin Gattout <amin.gattout@gmail.com>

