Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8DA37F002;
	Wed, 16 Sep 2026 12:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789563293; cv=none; b=qT0cafRsdDAZNFmoNyObmqKmR5uU18pHy0flRR/Tg8Jf73BKbYuoiYr8nxLhm2PdigKbA7qYowI/Jdc0PQ/7ew5ed9biB+SvPwrHUts45noi+WkBHAzcL3Z94Cq6Zd/61cCgTYfOQxtsrZ0flO6U2K3w+De9FV2wKZ/N/zbkuUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789563293; c=relaxed/simple;
	bh=3OqxyAVOw07bW65jX9ZlMxzkFNrQL8bfb5NlzTYd0wI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OU1CCcug3tfWWAteHW3ONZlPZ6oVgx/gNpO0w2OTEQaAiwQqKsLPRjtSF8IfbTVgqNYWXC9jMVIRrX59i4V+yS+nmQzxBCfHapckcgii8QNMM6vVsP68gS8WZ3V4KP+wKpLtdDLevCGIWyCtG6aa8MBDWYIXnA/22/GvJZtTaHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=CeMdfTOO; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="CeMdfTOO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789563289;
	bh=3OqxyAVOw07bW65jX9ZlMxzkFNrQL8bfb5NlzTYd0wI=;
	h=From:To:Cc:Subject:Date:From;
	b=CeMdfTOOux/ah0Bd2DaODSB3u+uhmkItkUvnj4ZLmSKb00siFx6OrIvjP05Tx33lQ
	 qLgCII3bEVT4ICRatdt2BHFI8L2anB/vvqi7isJWwEKTdkDEiFPcaXiYn7P1O3zaVg
	 kSDppWt+ewbGMo0oQnw3il3Yc09mgCegu2ccseIONMVx3VNjn5ZSRTkclzgh6BTj6a
	 KRuMA58uIPDVhq+akGpjG0S8kQCg0gjb3cwVDN69CkPEZI2nupr+qdF//2edPe3NAL
	 HceJFNOtWsMpIUYJDhrwXOb9sDVIAw/MhqDEES86/Z0MvtJeuZbde+/3K39TysaLY+
	 Jll3bTodsGRHw==
Received: from benjamin-XPS-13-9310 (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0672917E07A9;
	Wed, 16 Sep 2026 14:54:48 +0200 (CEST)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	benjamin.gaignard@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v1 0/7] media: verisilicon: simplify auxiliary buffers allocation
Date: Wed, 16 Sep 2026 14:54:36 +0200
Message-ID: <20260916125443.78602-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Verisilicon stateless video decoder driver allocates lot of auxiliary
buffers to decode bitstreams. These allocations duplicate a lot of code.
This series add helpers functions to allocate and free auxiliary
buffers. This simplify the driver code and will allow to implement more
easly incoming feature like disentanglement data buffers from mv and rfc 
buffers or adding reference frame support for more codecs.

This series has been tested with fluster on IMX8MP for h264, hevc, vp8 
and vp9 codecs, and on rk3588 for av1.

This series depends of this one:
https://patchwork.linuxtv.org/project/linux-media/patch/20260910092021.139970-1-benjamin.gaignard@collabora.com/
which itself is based on media_tree/fixes branch.

Regards,
Benjamin

Benjamin Gaignard (7):
  media: verisilicon: Add helpers to allocate and free auxiliary buffers
  media: verisilicon: AV1: Use alloc/free helpers for auxiliary buffers
  media: verisilicon: h264: Use alloc/free helpers for auxiliary buffers
  media: verisilicon: hevc: Use alloc/free helpers for auxiliary buffers
  media: verisilicon: vp8: Use alloc/free helpers for auxiliary buffers
  media: verisilicon: vp9: Use alloc/free helpers for auxiliary buffers
  media: verisilicon: mpeg4: Use alloc/free helpers for auxiliary
    buffers

 drivers/media/platform/verisilicon/hantro.h   |   4 +
 .../media/platform/verisilicon/hantro_av1.c   | 177 ++++--------------
 .../media/platform/verisilicon/hantro_h264.c  |   9 +-
 .../media/platform/verisilicon/hantro_hevc.c  | 130 ++++---------
 .../media/platform/verisilicon/hantro_mpeg2.c |  17 +-
 .../platform/verisilicon/hantro_postproc.c    |  21 +--
 .../media/platform/verisilicon/hantro_v4l2.c  |  35 ++++
 .../media/platform/verisilicon/hantro_vp8.c   |  37 +---
 .../media/platform/verisilicon/hantro_vp9.c   |  37 ++--
 9 files changed, 139 insertions(+), 328 deletions(-)

-- 
2.53.0

