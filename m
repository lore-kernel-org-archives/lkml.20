Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578B3547054
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 20:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791404157; cv=none; b=Y0SjMxXQg0NaWzj2/oAuyLzisVGQRH3LJc6RoyU2DW+fbGG7kS40gRDcvCFW5815joUa7FKnBiHdI7u3wugHNS8+ggspryn3qsrCbl6Kt6nBse3e8fRAqL6X+bZ8gcLLfEOyxDqHrGbWkRhIxUczMjrLX/tI6npnozb1SM8gY0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791404157; c=relaxed/simple;
	bh=Y4k8m9nJxhfgYsWMIcGPOMD+Bd0Jr9dzNJj86Pz5GzA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pUCLiJFrod96FUgXOXQE1D7AfX44YCsArD5B+NEGxpPcDSirQ3gARjvFSnBj+v9QhVX4Hf5J5Mmqj5ZWImHrTNQFXoTP37AgSeAfN5CPJKeQexP8oMg9ndb8y1djK+KTYf9xUPUFsj/dE7Njuy73MSj+RXYYeTXv6tV25JsQFeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VVdB5XXK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GpjnldBa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VVdB5XXK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GpjnldBa"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697JNrp91650963
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 20:15:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DVxSjpgvWCRV3cVfb6cpJb
	Llz9DEF2cmzcTWVM02PF8=; b=VVdB5XXKg7v2iMxZspJUuBdxxhHgPVJV02Ub60
	Fshk3kSecCakXdKY5WoNZaK6uXDgivTiRlD5n0cln5vTSQiSl0/xVNAXscO52GTb
	ctgGycOweZvHB15d/BDjuM0Fc190NWNWd6ux7n5yqWYnBwO7KCSS+B6Yp5GwV7fn
	/chLWbPfNQT30OSAjuufbxQO+klTaTblCaLBBmKSCRaHtywobtQsrHHVok4VDfOZ
	WWVsn2ZVaqAYeVmi8YkdYt9CY7nWYnRGVydLtMWVSnU6L+NQoQfcuomFGWTCjLCF
	MrlnSPs9knfGVDg+uw3jEhXmZnof9imnCE9tuHzJ+X2/RClA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5fc5baaj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 20:15:55 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-151ba226e1bso6515021c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 13:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791404150; x=1792008950; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DVxSjpgvWCRV3cVfb6cpJbLlz9DEF2cmzcTWVM02PF8=;
        b=GpjnldBa6qAhfYbFamdy7FGz6Eb62RQyE2ysH4L4akpN9cMc3XCtvRYuKuXroDGZOS
         U2S/9itJ/Wj1pAl6TheDQkostz8nVGyjMJp5oVidcIX+S14Donroe3zFoe0bx2D/tvDj
         jTAMseNqShXVL5xWY8nsNBxpuR33KFUaYhC/OnflMMAa9f63eTxQULs9zg5jMa3fMRrh
         kxiKbTZbN2fHbwhaGy6PrC5ONEp4VuJQqX2zb2bvOCXL6RUT2v+/bYzayRRHy1a4q9SY
         iXcEb7M6Iq9tdBoOAoxP+V2ycfgjFhrrjg2RZzWg+H4ufAafrXnBwijR/7Wl+MabQUVd
         fwqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791404150; x=1792008950;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DVxSjpgvWCRV3cVfb6cpJbLlz9DEF2cmzcTWVM02PF8=;
        b=0292CUQSUY3CItpfWoGWqoHO418F8S3TuIyYfh+Fde8psSAIg/dc1mjaC3u4i7UDBk
         cSkadPy7VcKro5c+g61GlrEuUSuoN43Hg2cQRTUH/QjT6X6GOOc1eX3wzUBeEhcgRNLW
         /WLMFW/vwkB3kJYcKI4JQhTRoG7nNk6yk6BXT0koGf8VXOJ7JzQbNPF6uW+3gPmrlvOL
         wtIl/cfDbyb+kHI501PFlgODkYyGTPMMUsChy7YkCKPXmeNskJJt3cBktQzsMQscmlX9
         6WNJLhPaecNeygkp6uqW/Eh2XwkmIf6YQXWyI0HQFSLNJ7FzfDYe/XxMwJ4AYN/ssBjv
         Wo9w==
X-Forwarded-Encrypted: i=1; AKwUvBwkcu3lznERk/bOXmTmpvPcUHEbXVWlIZqoKpQLnNnlQz2q5F8gHJ434oITNId3sEuRn2ghNLlK49xUicY=@vger.kernel.org
X-Gm-Message-State: AFuF++liiumO4kv9qLBbgGq1r2IG/q/lEVyFIUEMP31qaQrL/fas8uGX
	r1hQeVVzDWDPBRqnpFX+Twdh8C17TCfGgqF7LiJFPe0lx0PNtxXGRSe3miS1syQaZSRcbbGRVS3
	eXPYUoMHzZAF+Kn0ep49kl6bg/GbEqKTzq/hBsN+u+W34K+6905nJMXyhoYG9USdN2FA=
X-Gm-Gg: AYBFou1XSc0r4lS2e9cSQ2aoURDI1dP4pm8buUYbQ3jI+eb4xUFCoWCZjowFCG1Kpzc
	VchCiLD5Xc/CV9LGhLrESAmKiZnN8rr0aYjPcmvU4m3o6cg5yNBme/MhGpE3t26hz0cna3Pc8vo
	MrgdiqGTwdUGS7dDPFe2sbpsflDFByOtIZ6h7nEgV+5fCSB9hWdxMyVS3HdlH6moIPXE6/DNG0m
	SSnbTdppkpPJcH7z0hvs+VpSIFK82PK1GRy41hBpLD+CJSAfsNCH6IWg/B7rKUweQ+fzgZQac47
	zwtiKGUMRag1IwxM5/xG+d/bTF8nAaJzmTJJEGtm+ZGPeqo52e9ldouLW5Y2Jy8kHijma1X+TpW
	uyM8N2QvGthVECpgXGGoz3rf8TQ==
X-Received: by 2002:a05:701b:4590:10b0:159:125a:f863 with SMTP id a92af1059eb24-162041de528mr3180470c88.10.1791404149411;
        Wed, 07 Oct 2026 13:15:49 -0700 (PDT)
X-Received: by 2002:a05:701b:4590:10b0:159:125a:f863 with SMTP id a92af1059eb24-162041de528mr3180413c88.10.1791404148349;
        Wed, 07 Oct 2026 13:15:48 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16168f586f8sm10627380c88.13.2026.10.07.13.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 13:15:47 -0700 (PDT)
From: mohit.dsor@oss.qualcomm.com
Subject: [PATCH v17 0/2] Subject: Add Lontium LT9611C(EX/UXD) MIPI DSI to
 HDMI driver
Date: Thu, 08 Oct 2026 01:45:16 +0530
Message-Id: <20261008-lt9611c-v7-v17-0-1e8f5f2b2f19@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAFSoxmoC/3XQ20oDMRAG4FcpuXZLJpOjV76HeJGjXWm7umkXp
 fTdzVahiRgIAxMmX37mQnKcx5jJ4+ZC5riMeZyOpQH1sCF+Z4+vcRhDuSCMMkkV1cP+ZCSAHxY
 1pKSkYwFcEomUB+9zTOPnTXt++enz2b1Ff1qFdWI35tM0f92+W9Q69wuDrOFy6KCEQAtcoUj+a
 cp5+3G2ez8dDttSyOovuhJYE23RRXDBMpAu2YSqI5i7oClvBFME5AytklrIgB0BaE20IYAWI0Z
 DLaAMmtmeAZXB2hgAq+G4VcY7YVRvF8DuhqHYGqwYhgMPzKELMvQMrA3TGlgMGz1DzjUqJnoGr
 wz4k4MXQyB3HC1VUrKeIWpDtIYohtbJRINaRev+Ma7X6zeyvI7j2gIAAA==
X-Change-ID: 20260708-lt9611c-v7-ff76b2d1bf5f
To: Andrzej Hajda <andrzej.hajda@intel.com>,
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
Cc: Mohit Dsor <mohit.dsor@oss.qualcomm.com>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Sunyun Yang <syyang@lontium.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791404141; l=12877;
 i=mohit.dsor@oss.qualcomm.com; s=20260808; h=from:subject:message-id;
 bh=Y4k8m9nJxhfgYsWMIcGPOMD+Bd0Jr9dzNJj86Pz5GzA=;
 b=0W3XolbajnglS7tEs3imOGr7R+ooiJOhwVO3DQl8OpW3m0uq1Zq7d1l43h6gQnlgmV3J+sbyZ
 5lMKcLAKtgrDSBc13Q6kjaNB/2p2zcWT3X0QCByHSQ0krvSRAiDzk5h
X-Developer-Key: i=mohit.dsor@oss.qualcomm.com; a=ed25519;
 pk=outHVBN53JhozDw1xkj3G1qrqqE5scMBP7M4WL3aHQQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA4MCBTYWx0ZWRfX2yQtVJuAZ01u
 W8gNXT2iOIkqCPEcsNsEeSe7LiBbMaf91Zy0NAO87eFAZCos3I4n42NFyJEDdkx6OhFbuXaLyu7
 oARz3ZMGX8npOuHSK0G9Ap3GpukdlzA=
X-Proofpoint-GUID: n3NPhSKXe9S-DKeLxfg0p97gra6jvuoU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA4MCBTYWx0ZWRfX0QmSeh0TzYUs
 8Ul7JYxB3kGXhidJpv2Gpn/obTd2p8YAm/nk/roFhl2qtGuDWumL8aGJTduoj8aeUTuhZOQxnwC
 dwY9TAGyFmTSzNH7Ix4LkWkhbwb514xuEW+Zm2SNC1bNvVCr4bGDE9/Q6iD1llTrB2N4sCgLNCb
 tiJ+JkXfeYAcWRfH6Pel8XKF/YyX/Sw0qb5eaMULaXsJ/5u1UKZWLicfdY8Zxf/49+uNWXYzmrE
 xwqB8BpQj9Cvh2laO4iU63WPt1sxMFxhPiIWj8FLE4LeWc/HcO9TrYANAtsJ97dI/qAmmOvqwy2
 l8Pp1uVzE1w0vMg0SyceEPxbueYDcmFRZcjs6/1MZpRxSv52+32kb0v4ax9PBKVjpWSSA4+pVZk
 9X4fH7wJ/baj2gAIqtRCpW/X14mAFtd2Mv2RKbpGpZvxsBPFRR1jrv1gwIP+Qb0AtFcGGdyP8yG
 fEdronkdz3acYxxOE5w==
X-Proofpoint-ORIG-GUID: n3NPhSKXe9S-DKeLxfg0p97gra6jvuoU
X-Authority-Analysis: v=2.4 cv=a6+lZkSF c=1 sm=1 tr=0 ts=6ac6a87b cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Kz8-B0t5AAAA:8 a=QyXUC8HyAAAA:8
 a=KKAkSRfTAAAA:8 a=P1BnusSwAAAA:8 a=pGLkceISAAAA:8 a=P-IC7800AAAA:8
 a=e5mUnYsNAAAA:8 a=IOFIWVTARERmE0tqbhIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22 a=RuZk68QooNbwfxovefhk:22 a=cvBusfyB2V15izCimMoJ:22
 a=D0XLA9XvdZm18NrgonBM:22 a=d3PnA9EDa4IxuAV0gXij:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_06,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070080

This series introduces:
  - A device tree binding YAML file describing the hardware
  - A new DRM bridge driver implementing the basic functionality

  LT9611C(EX/UXD) is an I2C-controlled chip that Receiver signal/dual port
  mipi dsi and output hdmi, differences in hardware features:
  - LT9611C: supports 1-port mipi dsi to hdmi 1.4
  - LT9611EX: supports 2-port mipi dsi to hdmi 1.4
  - LT9611UXD: supports 2-port mipi dsi to hdmi 1.4/2.0

Changes in v17:
- Add dual DSI port enable: introduce lt9611c_dual_port_enable() which
  sends the MCU command to enable dual DSI input mode on LT9611UXD/EX
  chips. Called from lt9611c_bridge_atomic_enable() after video_setup
  when two DSI hosts are connected. Add bool dual_dsi to struct lt9611c,
  set at parse_dt when secondary DSI port is found.
- Link to v16: https://lore.kernel.org/lkml/20260916-lt9611c-v7-v16-0-c65042fcd245@oss.qualcomm.com/

Changes in v16:
- Fix interrupt clear sequence: write BIT(0) to assert clear then 0x00
  to deassert, instead of writing irq_status & ~BIT(0) which could
  inadvertently toggle other pending interrupt bits
- Fix suspend error recovery path: add msleep(400) before re-enabling
  IRQ after reset GPIO deassert, matching the delay in lt9611c_reset()
  to allow MCU to initialize before interrupts are enabled
- Link to v15: https://lore.kernel.org/all/20260915-lt9611c-v7-v15-0-88f9e9387eab@oss.qualcomm.com/

Changes in v15:
- Fix firmware flash corruption: poll for flash WIP (write-in-progress)
  bit to clear after each lt9611c_sram_to_flash() call in both
  lt9611c_write_data() and lt9611c_write_crc(), preventing SRAM from
  being overwritten while the SPI flash controller is still programming
- Fix missing infoframe flush during modeset: call
  drm_atomic_helper_connector_hdmi_update_infoframes() at the end of
  lt9611c_bridge_atomic_enable() to ensure AVI and other infoframes are
  transmitted after video setup
- Fix data race on fw_version: annotate concurrent read in
  firmware_show() with READ_ONCE and write in firmware_store() with
  WRITE_ONCE
- Link to v14: https://lore.kernel.org/dri-devel/20260913-lt9611c-v7-v14-0-534b43a07662@oss.qualcomm.com/

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
 drivers/gpu/drm/bridge/lontium-lt9611c.c           | 1360 ++++++++++++++++++++
 5 files changed, 1404 insertions(+), 2 deletions(-)
---
base-commit: 79c96000962a163ad4c3c15537bf49159132843c
change-id: 20260708-lt9611c-v7-ff76b2d1bf5f

Best regards,
--  
Mohit Dsor <mohit.dsor@oss.qualcomm.com>

