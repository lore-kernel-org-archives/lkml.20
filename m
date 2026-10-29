Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.243.244.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793262075;
	b=TOGO/Qd/iE74VFp9pl6xc4teiCK9wbUHY+lEwsTvT+5oqRpH33ThwcxAiXq6hRfJAUV6
	 qDa0ZFmraFoKh8c/mxixORSUxFMPafSJ6GmVI/TvvWMBRvlhwMTjaKVPIPGoBK6DMLq7g
	 EFHXtl5JWHUHw1TS5NVkOV3zEbUDvQ8kx8dwO0XmD/tdHtofsD1Q2+zEFdGj3QphYy8iM
	 jD53GdCw4ynJA2HE8oelOdx3e2is957tFi7pv4J2QUeU5f6VhSNdYboeOyBKeuE5cpPSc
	 +gX01ROTnvyorPiP9x6FRIcTmet8RMVqIBo/yfferN0LOpjqXucPAmgJLr5lpyqXzeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793262075;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=v8LUTXRwXjrnk8rvFZ0Edc1FBfASGtQZlVn+pZ0Os80=;
	b=z66/3upSWeSsdYYMsUe//wtOksugWP1KUxBecu9Ay892+A0k6docjQevzHGosQF9sC+N
	 YeA2A9W3Smpk3pelMl0dTJIW2YHuwS1sOxL8LhNXlwkh94Ddl+NajwT6vmeyOcuEdMXNy
	 ZTWkeOPeic7AZr6ma4Irt+YDcyC2rBKd6A+MpX7GuwGWgOqHp7CpkzuIs7GyiI7Es/mSO
	 ar8XvBC/Hy0pqNkypMP8b/097K50ix7XK2EHX+3x7aMAFQnf6jtqlfCxOu3sHN5PzTIWp
	 g79VLQsxAc15d6Jl/JFxOtvGQj/zNVlaOKklaJD+LTPQIdTmQu5lb2Z6XT2r5BG6N0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=airkyi.com;
	spf=pass smtp.mailfrom=airkyi.com;
	dkim=pass header.d=airkyi.com header.i=@airkyi.com header.a=rsa-sha256 header.s=altu2504 header.b="gLe6/uwh";
	arc=none smtp.remote-ip=54.243.244.52
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B65606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:21:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84B65606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=airkyi.com header.i=@airkyi.com header.a=rsa-sha256 header.s=altu2504 header.b=gLe6/uwh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1793262062;
	bh=v8LUTXRwXjrnk8rvFZ0Edc1FBfASGtQZlVn+pZ0Os80=;
	h=From:To:Subject:Date:Message-Id;
	b=gLe6/uwhCw8XDHck7eMXupy1+U417jwSb/6OHkuWB+8x6dhWB1ivkfuG6ZH3gBgJR
	 f1g5i9LqFeES/W2C0RORQAf1p1Vg3vURV5qIHRoFJJwvFn5fUgjhg4Mp1lYMp3nGFa
	 rOPQpyVjW1X96MnvBqkuJcjEt7NRGnyqT6T0yfJU=
X-QQ-mid: esmtpsz17t1793262058tcd08bff6
X-QQ-Originating-IP: 5nmMROT/a8dp6xGiJN0AOp1fNoNeWk2QJEtSMkElQ10=
Received: from DESKTOP-8BT1A2O.localdomain ( [61.154.14.86])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 29 Oct 2026 16:20:56 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6006500186905104022
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
Subject: [PATCH v2 0/3] drm/rockchip: vop2: Add 8K support for RK3588 vop2
Date: Thu, 29 Oct 2026 16:14:26 +0800
Message-Id: <20261029081429.862-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OWE7vHvMOJtS55tiTH5KxrP6I1/+0+ZTpdSAWH4spBsb20aQl7G+JsEC
	Eu4/PL+URSiCLMSvEeumlRli20vaW9klVlYAYC7coFrxx0O42YUdv+vxM3ijE3uOFjgZp3+
	MxYw8wrkKx6GYDC3NtQCmA/g3LQ3E5TIIHVGgHoKhl3Ui7PrmMOXrt3KXMOI2Z39Lfp58eJ
	5slsHTbpPWz98lajvXCMu7pm+JGxldqLmEWpHDNccfGrdjRvOy2Gx+74NFKm1uksPcrIK3s
	OIRhsXztoTkH5p2HaPtohHAN0nbp7yzCFLJTXGyfGnXHOpc1t6vcbg9nrYzbDnLu36nV3xB
	oMgXJsrgfdP8dwx0WW+Fn3rSf8/RVzgZOH7uOIxvQ1kzpXNUw/LMNup9ygS80cBkWBKbtLT
	a12PJLwOnfj4oyqC4jwswsLK5MVyp0/9ef9umQvHXKoHdNYVkOcVdQzghIqTuEYEVxwqSKU
	Nx7BaZolbC0bQmwCxUVfW9VJjbcupIJkc5XixMD42g87281tM3RlfgmKycQeQCVLMKSJNz8
	Zuh4VffPhuU783iz/3wUXHN5F3Y/JJ2v7MwSCyRDaJYUdShHPgSufjS5MiSDOro8iPun5qc
	G97C3hHEmryQZg68tcllUd2oAFY+EAKWlHs4XJjxCN28R1eOo7T25WQH1vlyZ4FrZn5KMjv
	f9mnjKMnjsoH5BE4QorOKWzCxLdV+7pi40p5u9VORQl7s17uguyIX81C5/JDD9rcKlqGsBP
	cChztumhQt+EXwAGPaK06SFTtFtG9+z3ZJWo4XABfWPk/Gc9z8H6xyCtZpxUE28hnRkH+Gg
	QJ0J2oEZeagnl3FiCMTaGRu1kng7iSI+zLqNlXoHKWHMdfiKLU+hRZs7BRK4CfcQz/Huuut
	BH9ZAf2O7VELOgLV9Wh0z4KyKMelhfSVc5BN7bIMtsqSIKNMlrDOeDxrL7gjpxLcjoH+Tdx
	XJgHx/3Q6/o+bSGiD6SVML7X+JGwBGU7gL65dcKYkwKmCAUhiCrcAIGgeYp+3fpvAf+3iow
	aJyeDFyJJUKfQpk+NgumLH9lujPP0=
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

---

Chaoyi Chen (3):
  drm/rockchip: vop2: Use drm_format_info_min_pitch() for plane offsets
  drm/rockchip: vop2: Skip UV plane setup for packed YUV formats
  drm/rockchip: vop2: Support 8K output by splicing two video ports

 drivers/gpu/drm/rockchip/rockchip_drm_drv.h  |   5 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 535 +++++++++++++++++--
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  66 ++-
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 204 +++++--
 4 files changed, 721 insertions(+), 89 deletions(-)

-- 
2.53.0

