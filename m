Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.207.22.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793262083;
	b=yOGY90NLbiiJ++L2neQZj7/JG0RtCJoN1J0TGV7eziucMXVV3dBZLJekzCciN6dznnT9
	 w5pL5cbVJHaWB6ixd8ZJ1x0HcNOStMM+iaFSIEV1XT+hmf9vOpJr78zB8B6BRsC8voM1E
	 CDH9/qXWKZV33s19pNF3SNP3MifZ+rdvlx7TQWrvEjsnplFieHBywwfPnVlY3bibzxpfV
	 v6CHN776nWaPQt4hUms2laafhY5uOR4uiJ+dRaX2e3g10aW42mz+oW13+2kl0fw540WQK
	 56P21NFoMagNeTpFEPsPDMExaslfz2bAONK1efj7PRMoqoj8DWtJoHfI/FVTyMgqfLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793262083;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=MaiGehwDWMGje7GwBD46BC7L0JM33MNhQCknypc1LC8=;
	b=IXlznx0GGgtM0rSBzNZ9BCQgZnbendFSHbQs8c/Jhgp5KCtJh5ehcp2lv18pLjyqeN+u
	 S5iSzOC16ttnwu89j4DHJMpZHN+DRRrcathcxoacNK2Vh0pn+efA62bCRjTBQ8aJbaXS+
	 MmFSg2f+oNGWiWqKoRE7UYvUG88MFo2q+1yPSZE7IEthbxDkWA5U+urfT3YT0X8DKcBdm
	 h4C0LC98iPxFIIoEBfVTdxporazAokSamg8rr/ERWtW9sc/s8u/tHGkpXzETgxEUXXvoH
	 RPiUATMALg5/pol2BQdG7qh/wqR8lQYifLzY4BKrbAY/l7B0JCjjtub77rutKp2J44A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=airkyi.com;
	spf=pass smtp.mailfrom=airkyi.com;
	dkim=pass header.d=airkyi.com header.i=@airkyi.com header.a=rsa-sha256 header.s=altu2504 header.b=VQ4iADg3;
	arc=none smtp.remote-ip=54.207.22.56
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869AD606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:21:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 869AD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=airkyi.com header.i=@airkyi.com header.a=rsa-sha256 header.s=altu2504 header.b=VQ4iADg3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1793262071;
	bh=MaiGehwDWMGje7GwBD46BC7L0JM33MNhQCknypc1LC8=;
	h=From:To:Subject:Date:Message-Id;
	b=VQ4iADg3Q0Ly+Rx7riOGsaq8JeEpTn9Pgzq3v7MIEc3/JIZgHhVxneUQDThchz89h
	 iLRWzQm6LLFU0WAWbwQyDJ3jfe6u0UxOqr+9claTuCG0MyLfSgTzN895jyrEmT6ljJ
	 +CwUJ7ldBsK2NfGJaDaBGKh6/jlSj987uVRVkRvU=
X-QQ-mid: esmtpsz17t1793262066t0346ef20
X-QQ-Originating-IP: RWwCt8iHxYDYBOfvEVyX3eJc7UNRrPOzEF6rxt0WmXk=
Received: from DESKTOP-8BT1A2O.localdomain ( [61.154.14.86])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 29 Oct 2026 16:21:00 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 771743844341427657
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
Subject: [PATCH v2 1/3] drm/rockchip: vop2: Use drm_format_info_min_pitch() for plane offsets
Date: Thu, 29 Oct 2026 16:14:27 +0800
Message-Id: <20261029081429.862-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261029081429.862-1-kernel@airkyi.com>
References: <20261029081429.862-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NG63YEgwc4yzfugC3WsiuOAJWCPjs1BJ74Th5dTvCCDKUdenYSMm8+Tp
	CxMmZ2vVRLpu1ID4i6/7hkV16az15T7NqH3X1YwEIasxvyxqke1QI8LYEf+BAByyORg+JM/
	nysJUS1pHy2wx6aT1Blgspx7cNAa1VtlrEJZr/rPtyDW2GhVjUftgIW7Ag0AhlFHVXnvBuo
	849MVtfOp/kXMhZe18DLcntFf88WGQMLv7Qcbwq3MJdPbH6mYjN4f6IjPo7BvPTbd0NxiV+
	s6g++PDHa7wm9X3vfyLaFRGe21uePQbdTKjUyeQrYL+3ZmR7mmEg0SYdQg9pcaH0ECTS2Xk
	TKscT/HhKdl0YeWkEuOCNdqvQsd1NMvr6T+gE98DFZjW2XyigtHIzfFLQzE4lenscLQvbBL
	iu4amGqYuuKPyre01Aj/7doJqm6YMj3O9r52uOQDNHPWVpOGxI16tMEtShrOmiaC6YRxvFl
	vW4Mj0YdALAv7XlS+8le1LJs8QkJnqjjOfUaPczU4iObSxESS6Nr8IWFU9TWXo/pLAe8ZuY
	H/npaVB0y5cvOVp2Rtl3iqRzCpQDtrJ7a/fVS/Ymk6jtKJCIF700obZsfVNcAxggRVyIgl3
	A4nc6W2CS7D3dHP+A4Xc6uTqRd3SNGl51cl02JuQFx1Ix+E+Aet1Le5WP4zdan3+XbJc3N3
	Edyz4DQswALlyI9hOx0q7z//kVcofo98l8nMsBrE5A03avzpHXyOLskvq+c7e7iIHShDKJ4
	6AR7nMHldNtLcR6GHuI+Fqa1mb+xl1x9jhg/Gl+zBR0SQV0E4FA7iQpgY9uZcZGL15VZG8s
	kqdwE8KxSVzdP5hRDr6glvXf6Yk0vT84X2cYYg6cm+eEN+rVTBLnUw2/+8Rz8H/1o4SZjvf
	sjCjjgp0aEXH4pfJApzs4uxcLsChf8Tmme2vn4hlVDai4jCofLyAmjQe0oEN8DoiSqkIMgD
	QBsCAoROh15ZhVyk0OcZ/QGm/Dk24S+POzDc5D9ZbvHjJLiPjfVcsXBUURzFZ9ryQTZj226
	i+sYXo8k9cChf2SSUoDut9lLGdohHtNRCqtiF34g==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
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

Use the block aware helper instead of cpp[], the latter aliases
char_per_block and is wrong for packed 10-bit formats like NV15,
NV20 and NV30.

Tested with modetest[0]:

```
	modetest -s 86:3840x2160 -P \
	59@83:3940x2160~96,0,3840,2160+0+0@NV20 -a
```

fb size (3940x2160), src at (96, 0) with size (3840x2160),
dst at (0, 0) with size (3840x2160)

[0]: https://github.com/windowsair/libdrm/tree/src-pos-support

Assisted-by: LLM
Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
Changes in v2:
- Missing removal of the replaced line(Heiko).
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 4cce3e336f5b..b38a32d623b5 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1290,7 +1290,7 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 
 	afbc_en = drm_is_afbc(fb->modifier);
 
-	offset = (src->x1 >> 16) * fb->format->cpp[0];
+	offset = drm_format_info_min_pitch(fb->format, 0, src->x1 >> 16);
 
 	/*
 	 * AFBC HDR_PTR must set to the zero offset of the framebuffer.
@@ -1309,7 +1309,7 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 		int hsub = fb->format->hsub;
 		int vsub = fb->format->vsub;
 
-		offset = (src->x1 >> 16) * fb->format->cpp[1] / hsub;
+		offset = drm_format_info_min_pitch(fb->format, 1, src->x1 >> 16) / hsub;
 		offset += (src->y1 >> 16) * fb->pitches[1] / vsub;
 
 		if ((pstate->rotation & DRM_MODE_REFLECT_Y) && !afbc_en)
-- 
2.53.0

