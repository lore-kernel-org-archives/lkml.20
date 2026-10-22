Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.207.22.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792653516;
	b=I4isHxo23ap61jd9TdLrha5mVmpcAD09S2mjxlCkU3lMSkTjHdvX+JVaQ5dKXkoZmDSv
	 0hzwDZjjVwmHXTGeToKR55FsX/kVryGL9NGG83WtoPqA6A1VgKX+N6dfaBiD/aHLS30mC
	 PF74Ff1phFRlrTBnFZwC84J3oFJyy5Xf78cHTSXdKwdSuz67hvM9BPcFH63G5A98DKgXd
	 XIoDLKsveMEc/v+frhnqVOr+C+YX3WKlzjrRxs7U2ivSqKqgkqKNeO18hK9u2somxHoeL
	 Q9X9ocpVE+Ah8deFApHjXWOjWSGDsPxcNVNtxz/GM334e19TSOKt+wY7n645bk0k4yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792653516;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=B6Mr2zeUEC2vgnMxDsc0lK+gzeSHU+oHhXXsC+EDQCg=;
	b=44JgM2hW6DEKyTmM3cI//z6Og/b3Eph+ZqaX9g3GcvAeJ7cs4VPkP/V705fupVSK+FCm
	 mle6k6BtCo03RVAMn4jUJhWNY2lU7U6+e5DLJi5H6PuMOfZWHvzkiqtXlvRbfiTVelqQL
	 6EgX5XQLR2k49SAyt+4InzQlCY+sEcEiJ3sqgvm1Ev9cWepnPx2WKKG+wNzjx/rvZfaJQ
	 498UfNYYbEe7Xe/ttW26xTgAhTAXSu2Gt8eoQjKjrnz2kUuPo1NLq0yYcouLiRwlSTeGP
	 eDlGHeDOcMztOJlaWcQyZf0Ti7Ech6o45Es0uQD+CacwiTQHBiNUdI8AxSA44YEEhMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=airkyi.com;
	spf=pass smtp.mailfrom=airkyi.com;
	dkim=pass header.d=airkyi.com header.i=@airkyi.com header.a=rsa-sha256 header.s=altu2504 header.b=FdocEiO3;
	arc=none smtp.remote-ip=54.207.22.56
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0502606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:18:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0502606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=airkyi.com header.i=@airkyi.com header.a=rsa-sha256 header.s=altu2504 header.b=FdocEiO3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1792653496;
	bh=B6Mr2zeUEC2vgnMxDsc0lK+gzeSHU+oHhXXsC+EDQCg=;
	h=From:To:Subject:Date:Message-Id;
	b=FdocEiO3GFtiQWPs565F82lMo8lJt5Xe4d702pEMeGh/cjXdBAlnnsnPux21NhyYm
	 IQC1NUQNBvRVB8i7WBxGInf4WgCaY+2XG7TL6MmPqw1mNgJTlW99JqDec4EIzPrnjD
	 4T2CXIYlu+O2SOICmpa24nYhlOtO5TpaXMDG2AP4=
X-QQ-mid: esmtpgz10t1792653492ta104827c
X-QQ-Originating-IP: ZCwMVggbhxksKaYJi2SD6aPvDovFtD5NqMcNITo2/mU=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 22 Oct 2026 15:18:08 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6992850712652161128
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
Subject: [PATCH 1/3] drm/rockchip: vop2: Use drm_format_info_min_pitch() for plane offsets
Date: Thu, 22 Oct 2026 15:17:35 +0800
Message-Id: <20261022071737.508-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261022071737.508-1-kernel@airkyi.com>
References: <20261022071737.508-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MCk7GSmjSGXyJoQ8J8QJW4mNcKy6UUKftkpIU5sMqXCUiejKUB+N2CgV
	6/9upJi9+HQ5/hqwwsHgfP9gK+1AvUPJiV9SvJQarkEZs8SqM6LPFxLM0rwqaZKkUYzkFgc
	Fr4gC8hGWIawsTtym4Zl90OEWriXwL4ttDImaMm1Yrm63XeJinazvweon90xPScuU1X7MUC
	/lzr5xXVG+YOJUKMwM/zMg5vP8/WF4nGlgPQ+Aai2gB+nJdfh3kvq+LjYvEWdrrQeVay9ng
	tiubNHqcRdnwhcGYjIAT6/vHNVEUsmU2fCt2Obw6PJEZe715zi/FuC40XCpKqGY4LuMj3tD
	ltR1WUVlEOsfrjbQ1kN4ykOVfReY9PQ38TIcsR5/JAoBDI/BDUeBZ8wBOsfzRhs98AfEOpz
	qAwwkLAe7fSaDp7YPjGZFkIro9TblF41zihrcNpI35jSXBWW7qFPqjUBn1ZX5ubOoOjYiRl
	Jy8CWl2wyGwv55uFTILJ6m8KkUzws78Yvq+M/857wzCgk5qVTMFTpRF7XmbMNEdHaBJlFJl
	EwBSeM7pcHKG7LjzBbfT6TBHhINWR+4p4PjI5SNM3/FZZcKH648P2K4E8zOhQiwQUgYSW3t
	sMFvygDsNA7OemS5/SPR0kwcXed8QdqXjzk1Uls0xQxbkwHs+wKvsc6MkTEsRNmtvypwWNi
	s9IAnRTh8yD2ruTy6bFfepjocWJ8puUFdpjtcWPO5NYoIkyzD9JIzdvZqscBnc4ejmewr4S
	kQxnLBeGsuzLkCSukmy/3JTfGXiW9epNnIFlPRMUXsSfB5KwwytlI8EwwB7NRM8O2DDsE19
	/Ff/pwIT0AHf+2FjfC6GQx/uRr7aEGq7LEayqJI7mnOTKM1jWQlg8ia8sYe/IUM5X0oEUH1
	PW/ox82XHXB72DwHbvSkuHqKosUnDCgitges3xdqabWhmva8N3cekB+37xbjDDoU+Z0ErZo
	6WguNIzkuLVamy7G41Ri7Bp51m446UpA31CCtGFTBbzofKyPS2+HzIwcDui1vFcjq6EVtfL
	zJZEI1SiDdS1SZ+QjuBLIjX625AGc5NtihSOqWDMZn+inQP5J/1c+V20hV08L0J7oUHzxDJ
	Q==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
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
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 4cce3e336f5b..480aa8c8a8d2 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1290,7 +1290,7 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 
 	afbc_en = drm_is_afbc(fb->modifier);
 
-	offset = (src->x1 >> 16) * fb->format->cpp[0];
+	offset = drm_format_info_min_pitch(fb->format, 0, src->x1 >> 16);
 
 	/*
 	 * AFBC HDR_PTR must set to the zero offset of the framebuffer.
@@ -1309,6 +1309,7 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 		int hsub = fb->format->hsub;
 		int vsub = fb->format->vsub;
 
+		offset = drm_format_info_min_pitch(fb->format, 1, src->x1 >> 16) / hsub;
 		offset = (src->x1 >> 16) * fb->format->cpp[1] / hsub;
 		offset += (src->y1 >> 16) * fb->pitches[1] / vsub;
 
-- 
2.53.0

