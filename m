Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794732463;
	b=XCsLhvHXTG5LhfCuRoFWxoy2Az4vxxFtR7omM6Ffbfeztumgw/7nRTL3bg9JDusTeiuk
	 qH/RPe8Y3ikrq4GwVmvM9K06/JtVO36ipdtzkfOgrzqjtjFfH/Vy/IcF91te8dJIkfIDu
	 0B/5YuoT1zJ3Wiv0/5U0d2zmFEDLZYe1/HErZ4TM2eAgBB28AvtfYr1ZH7eCt3IpIpIdf
	 y7p/ldLnRjzNZBYGh76bMNpNRpwBd6P37QEMvWO3l3RAArbUqX4C1Fu5IBT5qgQ0h3jpX
	 4Y+ZhTEHZl5O+hrWj3fv1mo7bSBrJO95XTJYEzgUE9la4L61uP5rokM4Bolf3DnMrSw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794732463;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=zzSWL3U/rJkmtjjtTVAZ4gJRqa4e3+vmo9l/Ka63PYk=;
	b=yob0W8i2e8vI0C2TE2YVE2b98ddzvPTdmQ131kwP8ICAE3umMsEN/lpIQV+hNWD+0DtF
	 FmjldtIHIPk0MI1WRQYXotyRxOEC73cLggzSu7ZiHdGGJW9zg4q0DTd6IZkj2l0nY2/wo
	 oWv9Td7KUYpBwps3XoreQtBzCj3Iud5lEROBNArBslYved29GGwpPC68VXG7mqiW7I4XD
	 oxYF8ApDioXjoQK9EgO3/VSZNnEMR0GY0biBvq4ADZLbQWx2RpbX6LvQyZr63tdpgnNLu
	 WJpwoTSxtxhwRNG9wNYpe6DDbby7OlAgmWbRW1kf3MGz0nFO4w0YjxC2RK36c5aTXVw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HrTmJviy;
	arc=fail smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971A7606A31F;
	Sun, 15 Nov 2026 08:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HrTmJviy
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794732463;
	b=WUHIXlrEMwsYHTEeZ+vSqX3uqW73c+G5bk5vVQOmGfgAUFLV76KXojUeGqwkqsCoWv4E
	 nqZhz2uDOxXoYIQSOdWsjarjoDpIZmrZGepcA+sAWvzNpqd0HZXLiUaCSqAcOWtsKJwEX
	 KzEvGnlRT4U4lIr8GlAChCao2tVsxhQM8mn9OtPKPWCTTB/PWUHu+XbwOPgrqcWFGjKj0
	 ASQBT6mIMubiXLN9kTn4g4h6WPhO5jEd0URK9d0eDm+S9uKAVNC60gwgNWMV4dmmRDe+K
	 SgqnjDGn4Z30VXuee+tCy6ExfC6vwKl+wskpASRXXKZpi977hFzsiX3tuPBePhaJiaw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794732463;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=zzSWL3U/rJkmtjjtTVAZ4gJRqa4e3+vmo9l/Ka63PYk=;
	b=zcHexsNfa7x4tzwqWAWq4TVFftEFyTgBqj7bUzxjKZ6v0ZWu+6rJMMLB1RZI+1rxZ+Xe
	 Gt55m5nR1bzC2mjTJfHwzuVnnsjVsbXoHoRYzstnymFz/6LRO15Mx9+yjAFP+PnqOj4wi
	 o99k7d7lihcX89IzwnkFRLYSKJMy10swreiWjbxsExUDVNbCTksN77pD9lS13c012IVb/
	 QWz+NfHLds85ZXNyZXxBDVVDog/BmkGp3th402Yn4/FvfO3PCoBHVsPJnoxrELm2C9l4C
	 WZAIYfgrzaVGOBSQpKrrDOgpjK88zpRNuHPszFcIHo5U5bWTwI/V3HULLQqauKZKXlg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 94C961F000C5;
	Sun, 15 Nov 2026 08:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794732463;
	bh=zzSWL3U/rJkmtjjtTVAZ4gJRqa4e3+vmo9l/Ka63PYk=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=HrTmJviyxfTuaSHd/f2J04aZrTGb0TDi1+b5CNzWL471iZ665GieuhwUefr1z+H30
	 XQzMVI80PYD8J/CJoMxWtm2DMrCj3fGOnDuRnNmxJwsgvdgmcCKb+c0D8MBmVn9sEo
	 ad7M5jcAn/3xcmKn96dCeraSmRfIeySSMKhD9P0VFBVWhbEjrIzd+MQOlCFvvvaf46
	 tWHE8zp8zc4+UdUycmnB3tVJrkg3/BG7Seko53r85NPXdkvSQomPFGkI8kDEwfU8vm
	 8TG8IbsUzQ6/eZLix++QXNYV608Eixy1LoUUbXlUKK7FAin/DxutTycKlA6j1WiHqT
	 p5Lqt3y1d5OBg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id EA14E49FF6;
	Sun, 15 Nov 2026 08:47:41 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Subject: [PATCH v2 0/3] media: rockchip: Add the IEP2 deinterlacer of
 RK3568/RK3588
Date: Sun, 15 Nov 2026 08:47:41 +0000
Message-Id: <20261115-iep2-v2-0-3d8798cd9a55@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/zWNQQ6CMBBFr0JmbQ3TVBBX3MOwKO0IY4SSFomG9
 O4WiMuXvP/+CoE8U4BbtoKnhQO7MYE8ZWB6PXYk2CYGmcsCEXPBNEnRVroyBZWlUQqSOnl68Gf
 P3JuDw7t9kpm37Wb0HGbnv/vPgpv3T6ojuaDIhb6StXTREgnrbtD8Ohs3QBNj/AHMdJxwqgAAA
 A==
X-Change-ID: 20261110-iep2-b9a9c6e77c44
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Alex Bee <knaerzche@gmail.com>, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794732461; l=2184;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=CP/GfEF6q6iAXiPRajx03x8XxJzaza0j12kU0I34ReM=;
 b=/nL2ov0291Jhw5UthMWgnc2poPEBaUsCuTKzVtpKz58fI7340e/KpJ6qb6YBiIy99TQA5Hl+p
 jUZxhdkzTpaDizpV5GUYw8t0eNPHHHVyv0nDWfUfG5b/rfTkHCGFwGF
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com

Add a V4L2 mem2mem driver for the IEP2 deinterlacer of the RK3568 and
RK3588, with its binding and the RK3588 DT node. It is based on the
Rockchip vendor driver; the V4L2 side follows Alex Bee's IEP driver.

Tested on an Orange Pi 5 (RK3588S) with a 7.3-based kernel; build-tested
on media next. v4l2-compliance 59/59, all four modes at 576i/1080i without
IOMMU faults. Not tested: RK3568. DMABUF imports of exactly the image
size are refused, because of the 4 KiB OUTPUT padding (see 2/3).

Developed with Claude (Anthropic), which wrote the code and the commit
messages; I reviewed every change.

---
Changes in v2:
- 2/3: return the held OUTPUT and second CAPTURE buffers when a job cannot start (Sashiko)
- 2/3: clear only the interrupt bits that were read (Sashiko)
- 2/3: in remove(), unregister the video device before suspending the m2m core (Sashiko)
- Shorter cover, driver commit message, doc and comments
- Link to v1: https://patch.msgid.link/20261114-iep2-v1-0-a8edde5a21e1@gmail.com

---
Arun Iyengar (3):
      media: dt-bindings: Add Rockchip IEP2 deinterlacer
      media: rockchip: Add IEP2 deinterlacer driver
      arm64: dts: rockchip: Add IEP2 deinterlacer to RK3588

 Documentation/admin-guide/media/rockchip-iep2.rst  |   32 +
 Documentation/admin-guide/media/v4l-drivers.rst    |    1 +
 .../bindings/media/rockchip,rk3568-iep2.yaml       |   95 ++
 MAINTAINERS                                        |    9 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |   22 +
 drivers/media/platform/rockchip/Kconfig            |    1 +
 drivers/media/platform/rockchip/Makefile           |    1 +
 drivers/media/platform/rockchip/iep2/Kconfig       |   16 +
 drivers/media/platform/rockchip/iep2/Makefile      |    3 +
 drivers/media/platform/rockchip/iep2/iep2-regs.h   |  191 +++
 drivers/media/platform/rockchip/iep2/iep2.c        | 1280 ++++++++++++++++++++
 drivers/media/platform/rockchip/iep2/iep2.h        |  106 ++
 12 files changed, 1757 insertions(+)
---
base-commit: ad6549a46748d00818483b535e5cd2a704685c98
change-id: 20261110-iep2-b9a9c6e77c44

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>


