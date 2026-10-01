Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914B44AA1E5
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 08:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790843134; cv=none; b=jn0JRwB9mSarecza04juiY7UNyLDzV3oUFaWoc+4nUzxQ8Tblgm+tfh+AM7EC9ouQKNxJtHbED2rwMmBrk3vyVVggWhAJ7J/BbR7vBNzFzvs8LaR7ZyGbsIoHXzyxlSniNITuRFBVuc1Hoq7MiGMpoNieWm25vKHEQwn6pIIiTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790843134; c=relaxed/simple;
	bh=xj1dH1EQpKkGXXGlMtHjKJEtOVFI6kEk+gGhOxu6rqs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OSYeTtendvCpbNK2/RTkHzvy6UO/FRsAGoEm9xL20+NAUyalfAAriRhW/b9KwrQFT5HxNLzCUvbZg/QiZKb13XwSmJiPKs3IngK6r936lnRodVu1OhOKC+IeQiMwJNtZxHoB3GkjbhMg1IEkLJh3n7oRaidZO3Wj96LxorGhxGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=D6fjaMcb; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="D6fjaMcb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790843129;
	bh=xj1dH1EQpKkGXXGlMtHjKJEtOVFI6kEk+gGhOxu6rqs=;
	h=From:Subject:Date:To:Cc:From;
	b=D6fjaMcbDPd57D/1W5bg6E9R2vYMKW8n/R6Sc1wSoQU4BBsiObGX8Fp5JHJ/iAprH
	 MIH22dKqdoGCdUT7EJS8ee3IFyxuGVyiNmuHm82OrC3/vFpZ3L+WfVEJ2BGjXaYSpN
	 qaaw5+BP3pKXnciksGnGaj7KZTvPyo2l2rmccvUpEQbg7llJLrmgg/ungrAYlFD7Or
	 o32E03ElAMGf53DsQjq582im5olF8V7ED3avprtqwekY3mG9JKNxMSc02wqwYG0xQG
	 6ICWm8ZqcsiIG02IvPr+Kkd0CRkV7FcRH3zWMyuFjxmwUZ4mC+u5wPE/GI+BTlIMD+
	 C7BJPAzkc6Fhw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B9BD517E0371;
	Thu, 01 Oct 2026 10:25:29 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH 0/2] drm: devm_drm_bridge_alloc() conversion and cleanup
Date: Thu, 01 Oct 2026 11:25:10 +0300
Message-Id: <20261001-bridge-alloc-conv-v1-0-f0a1fe040a86@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QpAMBTG8VfRubbaWSFeRS5szjjSpg0peXfD5
 e+r739BpMAUockuCHRwZO8SMM/ATL0bSfCQDEqqEqVEoQMPae2XxRthvDuELbCytVaFQgvptwa
 yfH7Ntvsddz2T2d4Q3PcDibiebnUAAAA=
X-Change-ID: 20261001-bridge-alloc-conv-f517f9b2521f
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

Bridge drivers are expected to allocate their private data via
devm_drm_bridge_alloc(), which also initializes the embedded struct
drm_bridge, including its funcs pointer.  Most drivers were converted by
commit 9c399719cfb9 ("drm: convert many bridge drivers from
devm_kzalloc() to devm_drm_bridge_alloc() API"), but a couple of
leftovers remain.

The first patch converts the rk3066_hdmi driver, which still uses
devm_kzalloc().  The second one removes a redundant manual assignment of
the bridge funcs pointer in the lontium-lt8713sx driver, which already
uses devm_drm_bridge_alloc().

Both changes are trivial and have no functional impact.  The series is
based on the latest drm-misc-next.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Cristian Ciocaltea (2):
      drm/rockchip: rk3066_hdmi: Convert to devm_drm_bridge_alloc() API
      drm/bridge: lontium-lt8713sx: Drop redundant bridge funcs assignment

 drivers/gpu/drm/bridge/lontium-lt8713sx.c | 1 -
 drivers/gpu/drm/rockchip/rk3066_hdmi.c    | 8 ++++----
 2 files changed, 4 insertions(+), 5 deletions(-)
---
base-commit: 37b346eab23aead52d17a8fa687056bfc651a416
change-id: 20261001-bridge-alloc-conv-f517f9b2521f

