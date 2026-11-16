Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.207.22.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794818791;
	b=YK6rdpB8nHm+fA3qZRBL4BERuejD5FlTx3Ewsd3/UBpn4IGKQIDRJoCiJIUhd3+j4lGO
	 cfs3pZXhNkb3EzQLLo7fdMpkx4KWHzdIkrukDo0Z5VPyKFpSV+JCEU8x8PqMybjxf+7vs
	 RpwBQ3rJB6aBGZ2nFltKGV+owxIEgXed1NWg+lp5oB35CCKNLvQu8kPuO9KfYRhXfCzva
	 B+BW8tUeMV1Y8WQnZC0p5gIpEmtEt1zLPKYP8Sk15pduhahJtkgi6bOgVwE7IKxNVdRl9
	 GYeuVPZPgwq4n/u4qsmQAMj2Xf2zqPpearn4JOQzuvDBUdyyYFQZtaB/tOef4BmD3Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794818791;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=Fnv52JTQmf9YujWAiTNm18lN9+0DQKawzTC+eI3Q/4o=;
	b=hixh2GCe0Or+YbBWUapzcLZFE+zqYsSc5vwHxtqICuEDkENabCrHh9DyhebNDYXG7zqm
	 CEgaziNY5VT2uKeoUFJIy/Cti9sPxNq+YBys2WRVy/AUG9xOTsZ90R/FF2P/jO5OVHMxl
	 eCGXkAKXjj8zVznukf+sj/5YIjlmhvFw+2F5iemDORPs/aImcChvSzOGkAEdUL6xF4/5v
	 bui78OBqjv6fp0mnxHp/iqsLxumcn4PimRx2yIMCIqTwG/6eq7QpO9w4+gfPhiWguoMQ9
	 +BerjB7VPG2LUUsxIZd6oNI9MOkq97jOZtjTaIpoUjaDLn4L+TCI+pdR0r8ngkEa1+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=airkyi.com;
	spf=pass smtp.mailfrom=airkyi.com;
	dkim=pass header.d=airkyi.com header.i=@airkyi.com header.a=rsa-sha256 header.s=altu2504 header.b=Znmw8ZKl;
	arc=none smtp.remote-ip=54.207.22.56
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FF6606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:46:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7FF6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.a=rsa-sha256 header.s=altu2504 header.b=Znmw8ZKl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1794818773;
	bh=Fnv52JTQmf9YujWAiTNm18lN9+0DQKawzTC+eI3Q/4o=;
	h=From:To:Subject:Date:Message-Id;
	b=Znmw8ZKlb3C3i/nYy0hmTlyIZzXaLPwcETI7QkCwQbn4gkYgGmzOIb1vOf5inI4fp
	 eBUFEHuSg5VQNGckB3JOiMoUyrZahiOtpvS66XHM9fLYJ/quKWhUsVscvl+P7I6i6h
	 lj4mH0tm06dEwu2f4Z1HYMhaNrUYTwPqG0XrJI3U=
X-QQ-mid: esmtpgz13t1794818769t20b5f6a6
X-QQ-Originating-IP: nPMpwEBGRZvbgBYDS4Y8JbKuG923vpTWJFg0kyddi/w=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 16 Nov 2026 16:46:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7044055788115629129
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
Subject: [PATCH v3 1/3] drm/rockchip: vop2: Use drm_format_info_min_pitch() for plane offsets
Date: Mon, 16 Nov 2026 16:45:53 +0800
Message-Id: <20261116084555.1061-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261116084555.1061-1-kernel@airkyi.com>
References: <20261116084555.1061-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: N5QhsOwzP0INQ8SICHFQnyYBKCSLIcJBcbHlXRRDKDrMl9gOI8Timt9h
	1vthvVRFDhjdZSmvZAbntM26bmRClOSbBXYuSjR82650R5FdFD8y6nFeR2RjH4zABtegFf4
	3xCf6ykdTb8QF+eugwWcYClQu1qbLkGK7xwlCpje0YTIuMpdc+3szqKXvASUahg5qP33vZ7
	Xz+8dlNqpzSy+nX7TkjPQAkNFtypALekSe+c31jm0L7Ouw6wh954MB67hQG4G+jYc1TCbKZ
	BT+VFfUPnwYJ0CwbYyyyRoBPqg8kKYY/Sj3lSmo/idgEdC0W6xrLQ4aB2DTdLhhX4IHAEnp
	DkuV9VqV2jdleZ/gYTXH3C1EgbjWBC6OabW8VTczL+aMSHPsCP9UfGkZZDL3f92NP9UYOUh
	96SOF6GQaoW3tN/PRZh8aqgShwWj/87+yhks3bSXKo7ZrEhAHkyPzyqZRdaxu6wQVie4mFB
	T+BZVYVV0EMa97bQd73W3LFkRd0lWd27I5ChN07l4mwZ8pqnKErdFHQHGYeTicKO6zBgKme
	HF+kSuoZfGn9RvKRIchYY4679bB+nsSmY/fBk4HzK0Jn+IamKuZGxJzB8XR0YYOS3t6wBqc
	MDJKz3zfYQ+pBClQqfEaGJM2m3ZCmGZIHS/9tIj3Jcp3Vajh/5uaL026nCLwYoVjgOV3F4V
	3SeXMHLnLM8ArOEyO+D+hLuuj4u70S58Y2xEVN/UilAZagSuNEuwSeQfnV+ACxXWvkQlG60
	G/5FiqsUrJfH+IqaIGlL1/vUUpOjXQGmXWZahxuaj2Of2I1p47bfGTrFPz8xn7Fk9xmdY3R
	jRDYcO5s1Zg5PaZcmfmAl9q++YsbRNubas6a2BZz/XZ3SOqAr3RUBqb3Yy14XuNmLebjIC7
	WNwt8p/V1D9E/2Uc3ria28n5z6/Mso+k5QHzi7mzM6VT5foUBHpDsVvTm8wa9QaE9s0M4uz
	K4sJecnGimZY6+ISPVZ0LNurWTi3w8HJuBO9AG4+D5SJruvx4hoNCSUhhzfcKdqd4p4nDQ+
	xhoCXUHdR3gwj7qiYe
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
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
Changes in v3:
- Cast the result of drm_format_info_min_pitc() to u32 to avoid 64bit division.

Changes in v2:
- Missing removal of the replaced line(Heiko).
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index bfb384142568..0de038acb56f 100644
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
+		offset = (u32)drm_format_info_min_pitch(fb->format, 1, src->x1 >> 16) / hsub;
 		offset += (src->y1 >> 16) * fb->pitches[1] / vsub;
 
 		if ((pstate->rotation & DRM_MODE_REFLECT_Y) && !afbc_en)
-- 
2.53.0

