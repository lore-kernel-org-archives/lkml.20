Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EDD2B9BA
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 15:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789830128; cv=none; b=umsALybNShTQRQuHH51WZ+r6dflNs6ykEBqr7gukwn6nJQzUhdPx/a+LcPN/F+P7fDv2Jt2RBJvUyFg/karFRsBwdfYYQKY20oUOHAtJ7ox7Aitt+xQl1aAkeeMPewjCiGrFmsUhWC74/SM3ZBJ7/FElFcNWuXLOwG5M5SC4ZlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789830128; c=relaxed/simple;
	bh=FwgAkT7vXYpMEUDhLztQnsJ8fy9xLWh5iCZsQn17vBk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=By6MZb5/VMfEiKwsvrTvTs1C0/EmU/enygafxzlJq8wKU7CnMNOQhGGlcNg17iYcI5l5rLr/Y7FfUXjE4LFpvVDEjUigFlia5zrvjbhpWI97GpRPrQDZduh+jVjFHbVWtrMyEr73iS2K2GLRkGO6d3ZMbazzWqdQnDTMJhsZEwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J0aFroRq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FPvsL5V1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J0aFroRq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FPvsL5V1"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68JDJVUJ2462115
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 15:02:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/JPecf7NdB7Oi+h+e8Dqtg
	FkYD6pxOWeXw7A/ixHGwY=; b=J0aFroRqEzc2UShDfGRB0yl9dUn6bPGokZ3Wq8
	J4mHn/OcfHlnmeTUKYYzJsbI0mX2ewbe8xAu4tLe0DAEy49VCTjKFaHxeyt/saVk
	zrEwd1xn0vjTvp1mowyjjH3SeVKLs+ZN6seYsYyyGUbaySTNexu6HRTxQrxGTL2h
	Z0DUMZeFbnyo62nByFulKrG/mwLTYe80gR5zH/0N8A0SdK+REXWPGj9tfbTwSgQh
	QZy6J1eQcZPoPjQjtGiJJjDGsCoVHC4Tn8gyCLfMPL6lDTW2rTTvyVqN9iyhURIa
	FI8wzHMHJWsBCBM4f5CQsxOBbuPYJLPqasSHz/c7tadJw2sg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gskjk0yuv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 15:02:04 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39af92138f9so2501408a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 08:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789830124; x=1790434924; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/JPecf7NdB7Oi+h+e8DqtgFkYD6pxOWeXw7A/ixHGwY=;
        b=FPvsL5V1s4JjBL5AsW+fAqqJyTpz8QVqgqueZIx1hcZcghRVtFGUMSCFJGeaVns5Em
         Zraw4xmUphPnFTSX+NV4B44GIb6xVbiXzcfX/HP8hs7/N0XIIdHQEsXoOXZwP3Sq77N4
         0h5KcBQy7RVdSpI9bPPCUA1ujvEzA8vuzBZjgPte10gXFyCm6ULyrV2A89lw78Z+sVfG
         RGhiOrG/u55KSMthg3VqiJDdKsXRAHjz7COI1Gdj0orFid2sabwVQSz+h9v29FgyOfAz
         QJPGQ9BlLLrH/gJNJ+V74QgNV4fq3snpFicPoYgKdptVrsupgE+bBMy1rkwG31rNOb7A
         eJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789830124; x=1790434924;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/JPecf7NdB7Oi+h+e8DqtgFkYD6pxOWeXw7A/ixHGwY=;
        b=vxVOo2IC5YGgzOMjMieEUozWHArgRpHTt05xYXtkD1f2pvVLAY2I5pG9eK7Y1nCvI2
         HTsFCGjcS9vWwOKV/RfN9gYU3a+POKv9k/+icXQKZssh6D1a22IOpVq5OkdIFhk3wQIj
         A+CkZFv2jGZLsBKFkc24INiW8PQcjLfiiopreMF5KHxdrmzTGaUGx6YW49j0AifI4MP/
         FBmWCRmBk/CwAG6mERENyLDsSXKH5F0FUrUx6OmWQSb9MKweThMSeyzu+AypcRy+t3yg
         jzXyW1TliCIN90Jo43m3URIvTu80cteZ2xscg24ZKgj6BARNDQ0qG5Pq/iIlJsZDVUSx
         Z5vA==
X-Forwarded-Encrypted: i=1; AKwUvBwoyHs30w/Gkuhm1CS7fPY51+nImerJlGMQOTSkMMcoyakABPwA7YWXIsDavmwUj+nQ6XRE2G5kPFuyCr0=@vger.kernel.org
X-Gm-Message-State: AFuF++nS7hm/kcxFjgHeNJnp3glBTUZbQAocNrc5ZoIW6FCDyepjqezU
	UKpKrgQIJ+Sm3fDOv/J9r/RG0u8/vBgtiPTld6ik8aMQ9Z9oC3wwvvW4H3ZoGsp0Hxk6269EADK
	QOz1XevaeChiGcqvicZnIBpppK6JqcBDa/vEo7rroLmK9UxVd0rJIEQcWQTJ25IKR4hk=
X-Gm-Gg: AYBFou0+66XAR7H/bAXtXJEpoCIOHADpLcJ1nwtCBTp0X77r1kezhu5GiuxsttC9JAE
	hIbKnVjw2VjEXa8F/PWVpc6cCho/FbDrA5b1MUEHX3hoBPAgzzZ3VDVO9npYMX0tF8pwbW0ZMwS
	oNRGVrSbKZgqiSYmRDQdQYijsag1fuLc0ghc6hCtUws1xg9Fl6U6g7hXbIZxnT6Ukw2IaQhKFGs
	vWw82BobUQVkrWFNdrhfSuWC7p1Dr0V6PtyqQauDD+W/C5lx/loWXDvstZMaqToUd7A18Gqp+zK
	oRh0jgCFyTcFR6y9z1Ql/ZsECk0ryElFibOccBlP0EnktkYn/ve37kvtkC+DGsLVA2LRLMJF4/L
	XDTa7xlMAnGro
X-Received: by 2002:a17:90a:a82:b0:39e:6c66:cbdd with SMTP id 98e67ed59e1d1-39e6c66d00bmr2140339a91.21.1789830123691;
        Sat, 19 Sep 2026 08:02:03 -0700 (PDT)
X-Received: by 2002:a17:90a:a82:b0:39e:6c66:cbdd with SMTP id 98e67ed59e1d1-39e6c66d00bmr2140317a91.21.1789830123079;
        Sat, 19 Sep 2026 08:02:03 -0700 (PDT)
Received: from [192.168.19.100] ([155.117.96.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cb400c3sm5045206a91.17.2026.09.19.08.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 08:02:02 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Subject: [PATCH v4 0/2] drm/imx: replace simple display pipe with atomic
 helpers
Date: Sat, 19 Sep 2026 22:59:34 +0800
Message-Id: <20260919-b4-imx-simple-kms-v4-v4-0-53b1fdf4589e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NQQ6CMBBFr9LM2jFQqghXMSxoGXTUAnaAkBDub
 hWXL3n//RWEApNAqVYINLNw30UwBwXuXnc3Qm4ig070OSnSAq1B9gsK++FF+PSCs8GszZtMU5q
 fzAXidAjU8vLLXqudZbIPcuO39TcCvaf4N+4a2FoIXe89j6Wa82OGwWmotu0DuCn45KQAAAA=
X-Change-ID: 20260919-b4-imx-simple-kms-v4-3f7d32e17548
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Marian Cichy <m.cichy@pengutronix.de>
Cc: Ze Huang <ze.huang@oss.qualcomm.com>, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789830097; l=3680;
 i=ze.huang@oss.qualcomm.com; s=20260704; h=from:subject:message-id;
 bh=FwgAkT7vXYpMEUDhLztQnsJ8fy9xLWh5iCZsQn17vBk=;
 b=ez3NB94NNPCCw9UcFT/TzMXQw7u69SqVzKn52XcrA93gdpD8t7O/9tyNAg+8L/AzlGwMYCKov
 Vh64qoEZhKIAEzD6EmmOWhjd6MlCzLdXEaeEgPumzGP8e9PFho612je
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=pSsISLZF2ubEjJRmslsa6Ps4W3yAuPY7yaircQTlQQU=
X-Authority-Analysis: v=2.4 cv=H6JOUOYi c=1 sm=1 tr=0 ts=6aaea3ec cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ilsi1XWDFcrB9FjxRIUvHg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=QyXUC8HyAAAA:8
 a=pGLkceISAAAA:8 a=8AirrxEcAAAA:8 a=e5mUnYsNAAAA:8 a=JfrnYn6hAAAA:8
 a=xr7AMzENiZYFrh3GPJEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=FO4_E8m0qiDe52t0p3_H:22 a=ST-jHhOKWsTCqRlWije3:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE5MDIxOCBTYWx0ZWRfXzUyGGq0vh41C
 xoNrT1XMTPzAVrWlx5c4DkJX+0FHWgc6h2/m8+6Q3DlZwCEaYc9DYOgwHvoJ5n0HzFWNrkv2WSj
 MQWBjYR6GLEuPZLz2LfY2YOrNMsWBAbCpEif7lcRphljd67Qgfv+1rSr9FAAntQyOzLDfAIgypS
 DsUo8SkXz47S04gM7szkmHx6zA/enZrISNx1R0Zasac5QBxi4iu8B1WOxkS7L2cVM16zJJ0aFef
 dbDFZYo5bbGkKi3mNWq5uinh61+etrz884Yiw246MaEB57wxNlyAKQnAJVPpZm9PjvbCvIbVTKZ
 xud8Hnad70Ka7LdIGK3nLJ8FJhSxrHGctwuRiZSiK6FC+At5fMtPJWRsLzVq2A86O9Foyva3NpY
 XEpvJFH3h1SGLVpvgbzvxM6jcZ1tC/2jFp/7fmrID6IWTtIWMv6srPAnwvnxkHsq+wLsAUQuSiW
 0s0rnL6SFLRkUA6sCmQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE5MDIxOCBTYWx0ZWRfXzVVx70aJabiv
 69TKPmuFvbU7rk49IsHLK1KaYRfslLVOGak9tH2Q32HGB58d1t6GMUVxuLwSqA41sNOFIe8Qaa0
 8yG4EepIvw1gakOjdsN61RrM9hObvwg=
X-Proofpoint-ORIG-GUID: 2bK80hqgwqCoSQzrzs6oCvW6XXQjLqee
X-Proofpoint-GUID: 2bK80hqgwqCoSQzrzs6oCvW6XXQjLqee
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-19_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609190218

struct drm_simple_display_pipe was meant to simplify simple DRM
drivers, but instead adds an extra wrapper around normal DRM atomic
helper setup. As noted in Documentation/gpu/todo.rst, remaining users
should be converted to regular atomic helpers and stop depending on the
simple-KMS interfaces.

The series replaces drm_simple_display_pipe_init() with explicit
primary plane, CRTC and encoder setup, and moves the old simple-pipe
callbacks into regular plane and CRTC helper callbacks named according
to local driver conventions.

The conversion preserves helper behavior that used to be implicit in
drm_simple_kms_helper.c, including plane-state validation, CRTC
primary-plane checks, affected-plane propagation, framebuffer prepare
handling, and existing event/vblank flow where applicable.

Result is less helper indirection and more explicit driver-side atomic
wiring, with no remaining simple-KMS dependency in this driver.

Changes are build-tested only. No hardware testing has been performed.

The patches are based on v7.3-rc2.

AI usage disclosure:
- AI tools were also used to review the code and suggest code changes for
  the DRM atomic conversion.

Thanks,
Ze Huang

Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
---
Changes in v4:
- Use drm_crtc_vblank_atomic_flush() instead of the driver's own flush
  callback.
- Replace the reset callbacks with the atomic_create_state helpers and use
  drm_mode_config_create_initial_state() in probe.
- Link to v3: https://lore.kernel.org/all/20260727-drm-simple-kms-removal-v3-0-de36e534f7a1@oss.qualcomm.com/

Changes in v3:
- Add a new preparatory patch to avoid duplicate clk_per enables in
  imx-lcdc pipe update after CRTC enable.
- Use commit-local atomic state in enable/update/check paths.
- Link to v2: https://patch.msgid.link/20260716-drm-simple-kms-removal-v2-1-7e4a6b8528e6@oss.qualcomm.com/

Changes in v2:
- use 'commit' as name of struct drm_atomic_commit in atomic helpers
- improve control flow in *_crtc_helper_atomic_check() and
  *_plane_helper_atomic_check()
- Moved page-flip/vblank event handling out of plane update paths and into
  CRTC atomic_flush(), using atomic_flush and disable paths
- decide clock disable by old crtc state
- add calls to drm_crtc_vblank_on() and drm_crtc_vblank_off() in crtc
  atomic_enable() and atomic_disbale()
- test crtc_state->enable before mode size check
- Link to v1: https://patch.msgid.link/20260705-drm-simple-kms-removal-v1-0-b4e1ca053623@oss.qualcomm.com

To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
To: Marian Cichy <m.cichy@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

---
Ze Huang (2):
      drm/imx/lcdc: avoid duplicate clk_per enable
      drm/imx: replace struct drm_simple_display_pipe with regular atomic helpers

 drivers/gpu/drm/imx/lcdc/imx-lcdc.c | 249 +++++++++++++++++++++++++-----------
 1 file changed, 175 insertions(+), 74 deletions(-)
---
base-commit: 5e036ce12de91c6fd674dad33b169c6150be2a7a
change-id: 20260919-b4-imx-simple-kms-v4-3f7d32e17548

Best regards,
--  
Ze Huang <ze.huang@oss.qualcomm.com>

