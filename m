Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794818785;
	b=JKxmvLVPLwL/KkH5c73cfmoEA6+a1K4QJqFgS8oDXeELzouR3H0v1kAfhbMgxoaDIIWh
	 68s4IKcM/PTUw7pQiynUSabuasvYDsR55ZT6h/6Y1V9AKaH8crA0YvGpLjqBCjhX4uLTr
	 lp7hW0NJ75atdYjVLB5w66Bxd6WASt/ieCqhjoh4wSe5Eb5q2h2Ldx0pYz1UEdztt0Sao
	 E6zsBHXPfgv1w8oyzL4wZ719/gvw9w9HMrHUvsEasSBeUlT8NS/0X9dBVLAYAcjO17XGB
	 0EOeja7Kznad5gqEz+O8PRF4Jlp0hjRwvPZTA4S2TEduXMZToo5kneFBFq6McKVMvkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794818785;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=lSsI9v4x2V3cJuZFCaNIrvFewmsEWmwhG13HbDEgbVM=;
	b=dLluzikYXeeF8Bgmeb0X+pEbm1TNmgUz77BA+3uVmAPRrOioLxpicf9QA2cXmCdFOqb0
	 MY4ne+xuMwanBQjZDpmJsbUJABBVSGY6C1iiOIVXdWAw74UgQmLGiwzBvwkbN/KEQ15e2
	 z6bfB629qMMczT+4LCTU9qLYrX3Im9Ab1mrtblStpVo05aLGtMn+3IqwHnhDD4gnqY+9/
	 QzAqhMSt0NWoa+Esq8vjd+hi8jFllJkEsT4ES5MGUlDwobtbE4YAV+uCodMs2D/Z0HrR0
	 0lPfjw0crY+7Yj3pdgGBQoCcNWgDthxoRsSkPbTOkG5LVTtpRIfDZ422uxORmmsdzqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=airkyi.com;
	spf=pass smtp.mailfrom=airkyi.com;
	dkim=pass header.d=airkyi.com header.i=@airkyi.com header.a=rsa-sha256 header.s=altu2504 header.b=A27T2Jz0;
	arc=none smtp.remote-ip=54.204.34.130
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C177C606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:46:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C177C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=airkyi.com header.i=@airkyi.com header.a=rsa-sha256 header.s=altu2504 header.b=A27T2Jz0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1794818768;
	bh=lSsI9v4x2V3cJuZFCaNIrvFewmsEWmwhG13HbDEgbVM=;
	h=From:To:Subject:Date:Message-Id;
	b=A27T2Jz0H8KpWKCJ0F8T+pNLNnCHGgQFh3i9+NJjIJuM9yEFrdTXKtegTPeDCP4Zu
	 tmAOTlBJ504ViFZkQFo/1D72DCOlDd58w8Qecj+huyDFk3udyPoEBeBl24eFutua85
	 mWLTtFrChWnJxPBCFcY1lSyrSh8/zeqSkUYD7WGc=
X-QQ-mid: esmtpgz13t1794818763t8e5c2cf0
X-QQ-Originating-IP: 71HDNamfL4ZLghdjCeoOieO1N3vPn7U1SZ+jZDPEX30=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 16 Nov 2026 16:46:00 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13307274964963775721
From: Chaoyi Chen <kernel@airkyi.com>
To: Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andyshrk@163.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v3 0/3] drm/rockchip: vop2: Add 8K support for RK3588 vop2
Date: Mon, 16 Nov 2026 16:45:52 +0800
Message-Id: <20261116084555.1061-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: N+/GyfuFbcLiaWFZu1r0Sogdx+j+vg83gpYdFy/IUUYmbEuLYw0RWNGO
	KxUyGLkdPaGAO8MxfWJznvXAcvFKE9zXkmgQUAq5iKteRsysZvENQdkiDeCAJlRWZTPl0E/
	ufCuxLn70SIhiQ05DaHJWWV6s2xEl4SDEfh/iJEEzkINqfdJguvhZZtZGR1fYeF0YDNXpLH
	N+zJ7cB5DFCTJhfnEALqxf5IpButuwNn17eyaoDValvpdrJ5RushuWOn6oKGOuzExwQWRVa
	qAqNuPFTszEU/gotG2AWlhoQtxYrUgynh3F3rv9RqoKI3njjE76f5+ZZuDrNSJnUp1AK+Ug
	I4kI5iMZWDRg/OvBTs9SAixuZfCVwaG9kb6uvsHBwoZAFyQaPSwkfWKbSNtG8SLztUFCCQ1
	izcQtVvWTiwsTBpG4nOJUI3PCx9Gtz0ZuVrDkD8kTWyWMrtcysP8Wc5CYOlo2jDkmrbvxiL
	5jzWNW9+K8N2/h0FvGedSv+DKqHn0YcUeyRpHzjTgwmAyv231TbqVJdIm8nNjqwAuF9zg/g
	MUyAbbJ5dEBA+BVcT6gLYglPBr9CQyk1r0ej2TPKV5kmIX5oi+yqGMvWCGPBCBjcn7RmY0n
	xktJHyxlKyL7ftKbdRGWwd2YfyLfGRt6Fgt4jqmInXMsWmtW4hfHOQjx/VcQRGXR1gxAXfx
	2t9Wd4MKt5PXm+ighfigYl2ZY3q1/35FsZjzZseh92OIkFHwycQX2IAq+HWA2B+htaXKUqZ
	wTlpVAYK1RiKRgFhFprCnmKtEc93DPehD2f4shtW8Dt52NYSyCiGZWFOk6NpX1tvhaRAxcG
	i8C694e0MNbvlB6/lkFhPcjHiFsKYDmsd4Td2/gUNGn12G9EO2wdX8pR7vKi/ZdfoFm5ISD
	7wfCd+UHEPdYJCdJJI0vnz/80mp77e34u//KHFfFaPFmhjdWrkwyMK4mNjs4clvNMXAaB26
	u9HtyUzOh1GvvXNJ4KinWu3/JQg0Os/JZ/Zqq3nZKAVTUyD5SbJm678XvVtmP/6Z0q7tN8u
	xqS/SYzNVIuWhRH4cmgs13EbTzcgk=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Hi,

This series adds support for 8K output on the RK3588 VOP2. HDMI is not
ready yet, but I believe many people might be interested in this.

8K output on the RK3588 is done by splicing two VPs together, with VP0
outputting the left half of the screen and VP1 the right half. In
addition, 8K planes have to be split in half as well to stay within the
width limit of a single plane. Similarly, there are a few post-processing
details that need to be handled.

Note that splice mode is not only usable for 8K output. This means the
mode can be tested at 4K and even lower resolutions, by simply changing
this one line:

-#define VOP2_MAX_VP_OUTPUT_WIDTH    4096
+#define VOP2_MAX_VP_OUTPUT_WIDTH    (3840 / 2) /* for 4K test */

And yes, this has been tested at 4K over HDMI on the RK3588 EVB1 :)

Changes in v3:
- Link to v2: https://lore.kernel.org/all/20261029081429.862-1-kernel@airkyi.com/
- Cast the result of drm_format_info_min_pitc() to u32 to avoid 64bit division.
- Rework the left-window splice check to avoid pulling an unrelated CRTC
  into non-modeset commits, and use the new CRTC mode instead of the
  stale splice_mode flag(Sashiko).
- Reserve the splice partner window when the partner VP has no CRTC, so
  it cannot be assigned as another VP's primary plane(Sashiko).
- Only set the partner VP's CFG_DONE while the new state is in splice
  mode; do not force it when leaving splice mode(Sashiko).
- Program the main and splice video ports in a single layer-mixer pass,
  and apply the YUV overlay mode to both VPs(Sashiko).

Changes in v2:
- Link to v1: https://lore.kernel.org/all/20261022071737.508-1-kernel@airkyi.com/
- Missing removal of the replaced line(Heiko).
- vop2_win_get_pstate(): use the left window's state only in splice mode(Sashiko).
- Reject splice windows already in use by another CRTC(Sashiko).
- Check the splice partner via drm_atomic_get_crtc_state() instead of the runtime flag and unlocked read(Sashiko).
- Set splice_mode_right/left_vp before the error paths of vop2_crtc_atomic_enable()(Sashiko).
- Validate each split half against the min width 4 and max input width; align NV20/NV30 like NV15(Sashiko).
- Latch overlay registers at the left VP's vsync; don't wait for the partner's own cfg-done(Sashiko).
- Program the color key on the window actually being updated(Sashiko).

Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>

Chaoyi Chen (3):
  drm/rockchip: vop2: Use drm_format_info_min_pitch() for plane offsets
  drm/rockchip: vop2: Skip UV plane setup for packed YUV formats
  drm/rockchip: vop2: Support 8K output by splicing two video ports

 drivers/gpu/drm/rockchip/rockchip_drm_drv.h  |   5 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 579 +++++++++++++++++--
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  66 ++-
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 370 ++++++++----
 4 files changed, 857 insertions(+), 163 deletions(-)

-- 
2.53.0

