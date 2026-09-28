Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E043B4508E9;
	Mon, 28 Sep 2026 08:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790582917; cv=none; b=dbuU0zW9T8w8f/mOqbwkNSt9EaZxBE4YUIuPxYrI8UPAQQhQXALw3/urTdxZUv1AUQeBT0iV54fDNLBFeiUynyHdyqsR0QieD5UhxEA7Kojvr6tNFCKkm0hIFGVnxRC/BZQc9N4pDtk7zyH0RRIm6Ru5gDMOeNpUlnsZ6JvlDa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790582917; c=relaxed/simple;
	bh=mHblMN6ynrQHmtBIMtxtxnvLNaGyrMnqeA07Xe8HOBw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rO2PrVIdaZdMzlMOy/n6Ekfz4VtinYTGREAPmlHwEhwFu8Z82YUUnOE1gXk/6nF/vbMniMvKF2Plr/nKQhhyUiRQs14P3KjZ3pOTSowC3FH87h/CpY0zVQapo04VC59amU6DKKI3OXDVJCgFoj3EwLo1KshRVqH4YlxuM0GCOc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gWNPn2xd; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gWNPn2xd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790582908;
	bh=mHblMN6ynrQHmtBIMtxtxnvLNaGyrMnqeA07Xe8HOBw=;
	h=From:To:Cc:Subject:Date:From;
	b=gWNPn2xdZ2Yvfz1tBN6iiFKQMTUBPWGhPE3dR6SZMLGB5yggsIhg/p8OJSH+YO++c
	 iXWQn1ez7kgW+vJq3ThyzB2G0L4wGd8t9LQTA5tH8+IsWgFU6Gs9LZd9PHIfOAx4BX
	 9+FCdU+inzctZOrbKuQrA5oXrSxEZmq0RCt03muC/grfTi37Iuqk2QUIRZG2LD8w3I
	 pYRElvOHc0dlMCPZwkxsAs6HnfUgqYu5GQSsrVFp5sJ5DSBjURwRjcEh+zcini6P6Y
	 XcoeUJ5Po4PlyqfJi2j89mvubU+5bkMizQwP3xlA2T+e7psXm8pHfT4qnjBCZNk9Ht
	 0HxzfKyooXPOQ==
Received: from benjamin-XPS-13-9310.home (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 814E217E0056;
	Mon, 28 Sep 2026 10:08:27 +0200 (CEST)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	benjamin.gaignard@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	conor@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v5 0/3] media: verisilicon: remove unused variant and code clean up
Date: Mon, 28 Sep 2026 10:08:19 +0200
Message-ID: <20260928080822.19553-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"nxp,imx8mq-vpu" variant has been tagged as deprecated since 4 years
now. This series remove it and make some context's fields useless so
remove them too.

changes in v5:
- add more details in commit message
- add Conor Dooley accked-by tag

changes in v4:
- rework commits messages
- add r-b tag

changes in v3:
- remove more dead code

changes in v2:
- have a separate patch for documentation
- fix dt-bindings
- rebased on v7.3-rc1

Benjamin Gaignard (3):
  media: verisilicon: Remove deprecated nxp,imx8mp-vpu variant
  media: dt-bindings: media: nxp, imx8mq-vpu: Remove nxp,imx8mq-vpu
  media: verisilicon: Remove useless internal fields

 .../bindings/media/nxp,imx8mq-vpu.yaml        |  10 +-
 drivers/media/platform/verisilicon/hantro.h   |  10 +-
 .../media/platform/verisilicon/hantro_drv.c   |  30 +----
 .../media/platform/verisilicon/hantro_hw.h    |   1 -
 .../media/platform/verisilicon/imx8m_vpu_hw.c | 117 ------------------
 5 files changed, 11 insertions(+), 157 deletions(-)

-- 
2.53.0

