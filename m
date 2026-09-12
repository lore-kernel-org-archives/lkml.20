Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A879757EA
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 21:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789249066; cv=none; b=YYzemaAAqBxaeaTRxRxdEoucJjj3j12Qpa1aznxajnCFbTI4p9zd9qi78JsHfZ6iFjJWsCK6y7UVQaj2sTXL0AuokIa4A658Nl6nqmE42kMAN4WeaUa3DvHHlIQWnCbjZo3BefTs80Vr/3emTCuo0QAPIVbtT7PdPWsO3bsH01Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789249066; c=relaxed/simple;
	bh=H67Oe4yzu+bRWXT2nb2qW6o8UkFYMC7J7f5+K1yRykk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jZ5ENVZMzWONtGzSYBT+cO5nSxZ3Xu1829urzxCw0C0LZ60IlG8UWIOIy++hLgwA3EmLbSY9az9nw2f9n5liNQtpqF+YwOIU3uzvP26StzgFbguqjjFyzAgLfHzWRjYfQWrKUQHhgxat7ff45prvlFLnCSd8vL8ykC/PzPKY6OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HDSau2xY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N3k+S3vv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HDSau2xY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N3k+S3vv"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CI5OaP2997307
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 21:37:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Y2zL2xCpCmpVff3ZktBtML
	6/Qx39E7nf0ye76nX5b7w=; b=HDSau2xYw1drey1/Eo7jMIdsK3YZbFcYJAI6zQ
	TKcywJuzjbrqWPF3gXuDpTNyhqu3qhyphxuPpG3b/LgYuOuQqxyLWMIJJyiUBUif
	0yjoE5fCxlPiWgN3vuyKyFr2GU0bbOC+cPlS0Z308TetFyOn94hAqyiRPalWKzL7
	f4BNgvcL98v3ZU6OOpwBVS1SP8SOoLLC/urmGOGnIZv1fpAGNgTj6C0Ig41diQXT
	oSwmu+Z7jaqnzLiL/m5cRDa2/6KqJ9Wxs8Jgst/Cx2/7ZosfBnmgupfK71m+huKC
	xDJfhWRprSBTvYGU7bohBACXNCoKzhnyJsPW1/6IRVuTQwSQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gn018hv20-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 21:37:43 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39af92138f9so3658337a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 14:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789249063; x=1789853863; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Y2zL2xCpCmpVff3ZktBtML6/Qx39E7nf0ye76nX5b7w=;
        b=N3k+S3vvIv/leKlzk41mvqHSuJOYkzJdTAZ0EOXuN/PQXhn68evqNoWUdNX0mzqAnQ
         aBMu+pT8NHf2d+mUvjeJCP2uuHQXinFtIKnkx070fJ+xUmHwDf3SuKTKh9dMBGEUjuWJ
         v+df9jNRDC5Rl17iVKco3CTjOKNCr7G26kCpOVKE4VVxZ5NG4ae7hRaskimQJwLf8KlP
         nsqHZkVOFgnd+yqv3pvWjtDmWtLRQVM6pll9X25x1D4OaQTuUUOF9bpijnyTimtyMc2u
         zEi48soHEPOKEMkOnfYo34klJWZooECjV8LUGP8kXgp8g7132DE4iS7Jf5bhcNttbn2k
         13nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789249063; x=1789853863;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Y2zL2xCpCmpVff3ZktBtML6/Qx39E7nf0ye76nX5b7w=;
        b=UXFRp40QrSuDO/uoi6lXfkDNyETxV7wd/+FOGiiqQA/eRBrE4cj2tB2n/AHwKTWX7H
         aCJvbcaLYbSdcorhdmoTZ+Cdn2crrOu+E+2VvqyiV5enTicbmfQjolQK1TvzpFv6bM6e
         gqkPx1nRQS4b+ptT1eof6+agSlDRWEzQP7d7A6LHE2wzLsWaSjoyjUIfYoNmufOJtH3Q
         Jx4MnsyZKEuWnF66+L6mKy6/Jrddx5bC8y3xQDKd+1Y1ZjP3ExC66R3anpj1qEY7+yNo
         cZ1f6889aXeU5e7qLRLZZRXfhjELgm8Pys6Wx5/LP1wyTDE6P7kDFDpm/oXxZ/uWBI1Q
         vRcw==
X-Forwarded-Encrypted: i=1; AKwUvBxEJodfCX+K0YusRhQ8ZYUJmftiK5CACM5u6i7hKCwIkgVCDI3DJ0Wdo+pDuzUY21QMVTsqdPTdFLceBVs=@vger.kernel.org
X-Gm-Message-State: AFuF++lK8ElJOtcDWkDOsMyghRBmlDHXExiv6zexgdIsorokh50ASXRv
	ImtkOGfwzOxTGQdfNOP9aNkysv9LulR8RP4z6sn/IXQ+BBSaq6a3Rw6p3w0wC4mpMw/DWNoh9hs
	tybS95ZsFWp7GJ780N6UqioVLw1zHnE/aGNQwj1mTgcILV79Ld6aOiQe7+I+WMeNONeo=
X-Gm-Gg: AYBFou2e3yZ0dFAaNn87xCEmvRDCdXTNzHej3e7E6CcZCS4cpTcjqPz/Mu8DrMjD/Ct
	ny8uy5hAiNND9VrxMX55QwsaNkQgLswfbSdiPQOwmX13ZgIugpDz+JpCJerJQXtBV0vIJGdeMwG
	xEhZXVAM+TSYpVTBuJ1BgQ+zlhah4ejWiUWa1vlZ8WSaAG+yERC8qrIyV1OU5TSf5l9/vtuZrK9
	Zaw3TbnNVBsfVz1zS+ho8frEVexTzDjXiZN8i3O1v6oRCC1tSr2yBeOfBS9LqX8ddcSuaUIHNtw
	faZC1lhmGdwJK79Hp9hLV0IwZV2mQ7HA5ies/pGNjJLbMsx3Cbc+zFXqEze8BQop3BCGs8F+h6n
	JIjj3XuioJmEP3HLrdzounF97xw==
X-Received: by 2002:a17:90b:380d:b0:396:4ce0:6400 with SMTP id 98e67ed59e1d1-39d7790f8b8mr19121374a91.2.1789249062944;
        Sat, 12 Sep 2026 14:37:42 -0700 (PDT)
X-Received: by 2002:a17:90b:380d:b0:396:4ce0:6400 with SMTP id 98e67ed59e1d1-39d7790f8b8mr19121349a91.2.1789249062348;
        Sat, 12 Sep 2026 14:37:42 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f0feaasm14987841eec.21.2026.09.12.14.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 14:37:41 -0700 (PDT)
From: mohit.dsor@oss.qualcomm.com
Subject: [PATCH v14 0/2] Subject: Add Lontium LT9611C(EX/UXD) MIPI DSI to
 HDMI driver
Date: Sun, 13 Sep 2026 03:07:28 +0530
Message-Id: <20260913-lt9611c-v7-v14-0-534b43a07662@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABjGpWoC/3XQ22rDMAwG4Fcpvl6KJfnYq73H2IWPa0bbbHEaN
 krefU43aAILGIGM/PlHN1ZS36bCDrsb69PYlra71AbE046Fo7u8paaN9YIhR8U1N81psAogNKN
 uctbKYwSfZWb1wUefcvt1115ef/ty9e8pDLMwTxzbMnT99/27Uc9zfzCoJVwPb7SU5EBokjk8d
 6XsP6/uFLrzeV8Lm/3RLARcRRtNFXx0CMpnl0lvCPYhGC5Wgq0CCSSnlZEq0oYAfEmsQwCvRkq
 WOyAVDbotAxYGrmMAzIYXTtvgpdVbuwB8GJbT2sBqWAEioicfVdwyaGnYtUHVcCkgCWFIo/zHm
 KbpB/rn/MZSAgAA
X-Change-ID: 20260708-lt9611c-v7-ff76b2d1bf5f
To: Sunyun Yang <syyang@lontium.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789249055; l=11122;
 i=mohit.dsor@oss.qualcomm.com; s=20260808; h=from:subject:message-id;
 bh=H67Oe4yzu+bRWXT2nb2qW6o8UkFYMC7J7f5+K1yRykk=;
 b=a8Bcg57w8aPo4ex9NdkUeOoKDzT5Wu2Qedb9DShbyyOZUfVkMKhCTPKCv1cOHuAoob7Ri9jnv
 e/hXKFeL/0hCXioM4pBAzg1oXYcKkVo2qpruvnSm5yxyrDqUKdpiE4C
X-Developer-Key: i=mohit.dsor@oss.qualcomm.com; a=ed25519;
 pk=outHVBN53JhozDw1xkj3G1qrqqE5scMBP7M4WL3aHQQ=
X-Authority-Analysis: v=2.4 cv=c4g+0h9l c=1 sm=1 tr=0 ts=6aa5c627 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Kz8-B0t5AAAA:8 a=QyXUC8HyAAAA:8
 a=KKAkSRfTAAAA:8 a=P1BnusSwAAAA:8 a=pGLkceISAAAA:8 a=P-IC7800AAAA:8
 a=e5mUnYsNAAAA:8 a=AALwXPcTADLwKW-B6QkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=RuZk68QooNbwfxovefhk:22 a=cvBusfyB2V15izCimMoJ:22
 a=D0XLA9XvdZm18NrgonBM:22 a=d3PnA9EDa4IxuAV0gXij:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDMxNSBTYWx0ZWRfX70GuW9WZtb7s
 o09f3J2NlDZn5WVJYhw9Pn0SAJ1JunOT3atZBr7/tlQd7oSPiOjzDVfuc5Qw4fHkiBKFdPLadO/
 TZeh5YX5xt/iCK2xh1Rnk57jzbXOp/M=
X-Proofpoint-GUID: SCxqwr8Jlh2YMJRu2ItW_otQeGvPf-7F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDMxNSBTYWx0ZWRfX8bjmjtEtGTiY
 UP6m72tR2O9Ods9z6O6pdObPv9gaKOPR2YcmmYVqbk0zZJxb635kH4KfojuDwOKZMkUUkD4igDT
 2cqFFFOmIV9xxO6iEHLF/xSKzFiNaFTtHJncnbppnzvs1FeZ902KcKaemSh46bL9W5uyU+jTmao
 AEP26hMUiGRYuYZkIpPMVbCBxIWr2UOynasQflLnRZDl+hK/RRny2SellT6mVjQ0ltCCpoG+jvy
 4YCy/lN1d4eNegPHF3a3XjYUKBx3ZmhEUIEhfLs4Q7JQachym9wEZ/dEf+iYz2Sr2upijVUh3hW
 Vx+2DCe9TE0/wRN7t7eot9TvKr6FxMu7/uWnUTZu55meV6dZmUp2yx3YNGR0t5zPT0HTcqrwLak
 ZmAhDvPFaxGDocy8dwLc+GOVji7R1FIOoaQaEjM2RqLjuidvc0i3ayfAWEtqUz+uv+ygAQ/T8Ie
 dxdd/wYYJBRMe9mSS3w==
X-Proofpoint-ORIG-GUID: SCxqwr8Jlh2YMJRu2ItW_otQeGvPf-7F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609120315

This series introduces:
  - A device tree binding YAML file describing the hardware
  - A new DRM bridge driver implementing the basic functionality

  LT9611C(EX/UXD) is an I2C-controlled chip that Receiver signal/dual port
  mipi dsi and output hdmi, differences in hardware features:
  - LT9611C: supports 1-port mipi dsi to hdmi 1.4
  - LT9611EX: supports 2-port mipi dsi to hdmi 1.4
  - LT9611UXD: supports 2-port mipi dsi to hdmi 1.4/2.0

Changes in v14:
- Fix device node leak: redirect GPIO and regulator init failure paths
  to err_put_nodes label instead of returning directly, ensuring
  dsi0_node and dsi1_node are always released via of_node_put()
- Link to v13: https://lore.kernel.org/dri-devel/20260909-lt9611c-v7-v13-0-aec234483725@oss.qualcomm.com/

Changes in v13:
- Fix double-free of dsi0_node/dsi1_node: remove __free(device_node) which
  is prohibited when mixed with goto; use explicit of_node_put in all exit
  paths
- Fix const and named initializers for i2c_device_id table
- Link to v12: https://lore.kernel.org/lkml/20260903-lt9611c-v7-v12-0-9414d2b3bd6d@oss.qualcomm.com/

Changes in v12:
- Fix audio deadlock in lt9611c_hdmi_audio_prepare: release mcu_lock before
  calling drm_atomic_helper_connector_hdmi_update_audio_infoframe which
  re-enters the driver via lt9611c_hdmi_write_audio_infoframe
- Move lock acquisition from lt9611c_write_infoframe/lt9611c_clear_infoframe
  helpers to individual bridge callbacks; add lockdep_assert_held in helpers
- Remove unused includes: platform_device.h, drm_drv.h, drm_print.h, drm_of.h,
  unaligned.h
- Remove DRM_PANEL_BRIDGE from Kconfig (unused)
- Fix copyright: (c) -> (C) for Qualcomm line
- Remove dsi0_node, dsi1_node, dsi0, dsi1 from struct lt9611c; make them
  local to probe using __free(device_node) and local dsi pointer
- Replace chip_type/max_tmds_rate fields with single cdata pointer in struct
- Fix sysfs NULL dereference race: move i2c_set_clientdata to top of probe
- Fix concurrent crc8_populate_msb: move to module_init
- Fix i2c_device_id: remove vendor prefix (was a workaround for NULL driver_data)
- Replace timing_data byte array with named struct using __be16 fields
- Rename page to npages in lt9611c_write_data
- Move loop-local variables inside loop in lt9611c_write_data
- Add DRM_BRIDGE_ATTACH_NO_CONNECTOR check in bridge_attach
- Use sizeof(timing_data) instead of ARRAY_SIZE
- Move regulator_bulk_enable inside lt9611c_regulator_init
- Various nits: comment spacing, blank lines, variable initialization
- Link to v11: https://lore.kernel.org/dri-devel/20260824-lt9611c-v7-v11-0-eb4a79cb597c@oss.qualcomm.com/

Changes in v11:
- Fix firmware path: use "Lontium/lt9611c_fw.bin" to match linux-firmware layout
- Link to v10: https://lore.kernel.org/dri-devel/20260808-lt9611c-v7-v10-0-ee90a136d82a@oss.qualcomm.com/

Changes in v10:
- Fix lt9611c_block_erase: check return value of read_poll_timeout to avoid writing to un-erased flash
- Fix NULL dereference: check i2c_get_match_data() return value before dereferencing
- Fix irq handler: return IRQ_NONE when BIT(0) is not set
- Fix devm_drm_bridge_add: check and propagate error return
- Fix use-after-free in remove: call disable_irq() before cancel_work_sync()
- Fix bridge/regulator ordering in remove: use drm_bridge_add/drm_bridge_remove explicitly so bridge is unregistered before regulators are disabled
- Promote firmware upgrade success log from dev_dbg to dev_info
- Link to v9: https://lore.kernel.org/lkml/20260804-lt9611c-v7-v9-0-3423a76856d3@oss.qualcomm.com/

Changes in v9:
- Use regmap_bulk_write for 4-byte header write in read_write_flow
- Replace while(1) loop with read_poll_timeout in lt9611c_block_erase; read_flash_reg_status now returns unsigned int
- Fix unchecked regmap_read in lt9611c_upgrade_result; return -EIO on CRC mismatch
- Add struct lt9611c_chip_data with chip_type and max_tmds_rate; fix i2c_device_id table driver_data to use chip data pointers
- Use put_unaligned_be16() to replace manual high/low byte splits in lt9611c_video_setup
- Extract lt9611c_write_infoframe() and lt9611c_clear_infoframe() helpers; consolidate 6 infoframe functions into 2 helpers
- Remove lt9611c_hdmi_audio_startup and its bridge_funcs entry
- Remove hpd_enable callback from bridge_funcs
- Fix scoped_guard(mutex) deadlock in audio_prepare: release lock before calling drm_atomic_helper_connector_hdmi_update_audio_infoframe()
- Fix probe order: lt9611c_reset() before enable_irq()
- Fix remove(): remove disable_irq() (IRQ is devm_request_threaded_irq-managed)
- Fix bridge_suspend() unwind: on regulator_bulk_disable failure, de-assert reset and re-enable IRQ
- Move devm_drm_bridge_add to after both DSI attaches; remove cancel_work_sync from err_remove_bridge label
- Move request_firmware outside mcu_lock in lt9611c_firmware_upgrade; lock only wraps hardware access
- Re-read lt9611c->fw_version after successful firmware_store upgrade
- Rename ocm_lock to mcu_lock throughout
- Use goto err_put_dsi1 to eliminate duplicate DSI cleanup in probe error path
- Fix mcu_lock comment to correctly describe what it protects
- dt-binding: add if:then: block to disallow port@1 when compatible is lontium,lt9611c
- Rename sysfs ABI doc to sysfs-driver-lontium; rename sysfs attribute from lt9611c_firmware to firmware
- Kconfig: add I2C to depends on to satisfy REGMAP_I2C dependency
- Link to v8: https://lore.kernel.org/lkml/20260728-lt9611c-v7-v8-0-bda216bfaf37@oss.qualcomm.com/

  Changes in v8:
  - Refactor lt9611c_read_write_flow() to take a struct lt9611c_cmd parameter with an embedded struct lt9611c_cmd_hdr (func,
  type, seq, sep) and optional data payload, eliminating raw byte arrays at call sites
  - Add LT9611C_CMD_HDR_SIZE, LT9611C_EDID_BUF_SIZE constants to replace magic numbers
  - Use container_of_const() in bridge_to_lt9611c_const()
  - Remove obvious /*read only*/ comment
  - Use unsigned long cast instead of uintptr_t for chip type initialization
  - Replace memset + memcpy with memcpy + memset for CRC buffer preparation
  - Add ABI documentation for lt9611c_firmware sysfs attribute
  - Fix Kconfig help text to proper prose within line limits
  - Add disable_irq() before cancel_work_sync() in lt9611c_remove()
  - Add cancel_work_sync() in lt9611c_bridge_suspend()
  - Inline lt9611c_gpio_init() into probe
  - Use of_drm_get_bridge_by_endpoint() instead of drm_of_find_panel_or_bridge() + drm_bridge_get()
  - Return error if LT9611C (single DSI only) is configured with dual DSI in device tree
  - Move HPD status read_write_flow call from IRQ handler to lt9611c_hpd_work workqueue
  - Removed second lt9611_reset call from probe as not needed
  - Add struct lt9611c_rsp symmetric to struct lt9611c_cmd — both embed struct lt9611c_cmd_hdr
  - Link to v7: https://lore.kernel.org/lkml/20260716-lt9611c-v7-v7-0-7553a14735fc@oss.qualcomm.com/

  Changes in v7:
  - Use i2c_get_match_data() for chip type initialization
  - Implement hdmi_write_hdmi_infoframe/hdmi_clear_hdmi_infoframe
  - Use drm_atomic_commit in bridge callbacks
  - Removing redundant lt9611c_reset() call and cleanup in probe error
    path
  - Populate bridge.vendor and bridge.product
  - implement hpd_enable callback
  - fix DT parsing and bridge refcount
  - Removed pre_enable and post_disable callbacks, it was affecting hpd
    as regulator was disabled
  - Changed reset gpio enablement and lt9611c_reset api.
  - Link to v6: https://lore.kernel.org/all/20260508134009.4582-1-syyang@lontium.com/

  Changes in v6:
  - dt-binding:
   1. sorted the compatible list alphabetically.                     [Dmitry]
  - Link to v5: https://lore.kernel.org/lkml/20260507024214.97708-1-syyang@lontium.com/

  Changes in v5:
  - drm/bridge:
   1. use #define FW_FILE "Lontium/lt9611c_fw.bin" to match linux-firmware    [Dmitry]
   2. add atomic state management
  - Link to v4: https://lore.kernel.org/lkml/20260506095100.78998-1-syyang@lontium.com/

  Changes in v4:
  - dt-binding:
   1. fix commit message                                                    [Krzysztof]
  - drm/bridge:
   1. use lt9611c_fw.bin                                                     [Dmitry]
   3. use enum lt9611_chip_type
   4. remove *fw from the lt9611c struct
   5. use read_poll_timeout and -ETIMEDOUT
   6. replace mutex_lock with guard(mutex) in some places
   7. switch to ARRAY_SIZE instead of specifying lengths directly
   8. use dev_err_probe
   9. add clear functions for AVI and audio infoframes
   10. add DRM_BRIDGE_OP_HDMI and remove .hpd_notify
   11. replace "GPL v2" with "GPL"
  - Link to v3: https://lore.kernel.org/lkml/20260420061644.1251070-1-syyang@lontium.com/

  Changes in v3:
  - dt-binding:
   1. lt9611c(ex/uxd) content merged into lontium,lt9611.yaml
  - drm/bridge:
   1. Drop the licence text, only use SPDX header
   2. Sort the headers
   3. Use library functions for crc8
   4. Use paged writes as implemented for LT9611C(EX/UXD)
   5. Use HDMI audio helpers
   6. Replace devm_kzalloc with devm_drm_bridge_alloc
   7. Remove extra kthread
  - Link to v1: https://lore.kernel.org/lkml/20250903123825.1721443-1-syyang@lontium.com/

  Changes in v2:
   1. Forget modify code, operation error, Please disregard this submit.

  Changes in v1:
  - dt-binding:
   1. Submit the first version of the code.
  - drm/bridge:
   1. Submit the first version of the code.

Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
---
To: Andrzej Hajda <andrzej.hajda@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Robert Foss <rfoss@kernel.org>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
To: Jonas Karlman <jonas@kwiboo.se>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Sunyun Yang (2):
      dt-bindings: bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI to HDMI driver
      drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI to HDMI driver

 Documentation/ABI/testing/sysfs-lontium-firmware   |   10 +
 .../bindings/display/bridge/lontium,lt9611.yaml    |   18 +-
 drivers/gpu/drm/bridge/Kconfig                     |   17 +
 drivers/gpu/drm/bridge/Makefile                    |    1 +
 drivers/gpu/drm/bridge/lontium-lt9611c.c           | 1297 ++++++++++++++++++++
 5 files changed, 1341 insertions(+), 2 deletions(-)
---
base-commit: 4c8afdaa990f1a4d49e1dd5a640348ce5451a86a
change-id: 20260708-lt9611c-v7-ff76b2d1bf5f

Best regards,
--  
Mohit Dsor <mohit.dsor@oss.qualcomm.com>

