Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C323B9943
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 09:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788946849; cv=none; b=WDkEdSINIDlgGcNkjo+bR0hept8QPcrYChgzZhEWq3LSr88692aRsezmyNp/tBrxLKmR2pMWd5eVZ7e4hif68U0JIV05P5DO84hBq8bPxf5zbKtaA1yXBtuS8Ks4nJ4vBt0bUYgNDBZJOOG0bV0AkNJ54NkmzkTlHAtehUarsDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788946849; c=relaxed/simple;
	bh=7O8HKKkWXv/xiGCHUUAhuaZdMciYyiq6MGh8dtPhar4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=T18SClTZgEIvAgEwSUf7VnxJVygbhcLZm/Ath66ITOz/fyrJJPQo9FtmnjmjlV/lFkmvYjNTlHL2snRFVivJJxrtFBDEbSPP2MJi2eB6M0EnPDRUj5yM31tRC3EatjSLTIUzKGqEYHbnH1GJKO/rrH7w7DDPZSZr0pnuLZ+lLhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FY+BhH3o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MQAnkXnD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FY+BhH3o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MQAnkXnD"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6899SQB13771184
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 09:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1jN7EsM2gXyGxPGIDDE0qI
	BeNpdvA1JJX0hFWcn39BI=; b=FY+BhH3ohT6cOm+hMaJkoxaxv4Kq9ENYlexG3t
	p0Gk2/Kf0jiydxmZKiyJ7gGtBJOV5cYdUihb5YHhQ6+Ml+mc666eI6zPTeIV3jVv
	e18C7+7x3MUvL2hykpUnYVf8XCQzRdHYHdJ4U+8NQZVnFv+OriPYMk4xH0ze5j2h
	OIlCBOBCmYNebShPrJU9ieAiU4+9isH3FZnQMURXw1xHa+jV7NHhIY3k1P/K/zXT
	yF+4VE5MwBKGCNoF1ElSoC8uOUVtxnws6FBGNL0CAjXUNv34tH1wc17zIiwuMiaF
	486EgjXmHK07xGA+50L2Pud0t+aUpcAbSNBT12JXaG2jth2g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjywr1anr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 09:40:46 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc42a07d04aso6162610a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 02:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788946846; x=1789551646; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1jN7EsM2gXyGxPGIDDE0qIBeNpdvA1JJX0hFWcn39BI=;
        b=MQAnkXnD6OkYCh/nTG6P2h5ttWattJZGDQa8Z/27SP0Z4SzigWBhh4zSZ904J+CbBm
         Mig9XDpQsB2V1zDtOHXwQi6aQwd7ifrp8VVJlLKaNsmt69QcAXbkllblsaEdqRZYj+Id
         0vyta4/mhOdjHy6mNxELzdNinIIbWgs5+jVW5RRSo+8mPGTI0dBc+sBrRxj2GF6nmUXj
         ew553GbgvlJcbpFiFSJ8SxqrA4HGL6RcxrH7AeaZdNdJRRYjdY+/IjFsgmtUG0yACZFJ
         FKdYTZtI8H3dZiA5UE3G9egMSwJ8RlLMLNZ/gFTFhjSUJLH6a3+IWMYQg2lkn95A/Cu6
         41bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788946846; x=1789551646;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1jN7EsM2gXyGxPGIDDE0qIBeNpdvA1JJX0hFWcn39BI=;
        b=gSR78hVrY8FAHQgJjL8zWppjFbGjbAf/YwKGRuN80UKxLLB3kkwnjDXoU3cqxIqpZz
         lAsPmG7TiFIisCZ+fre7mLbdNNcUwDiogSQinLSxI2f1SmMEC2RFYw7S9eoHX9+wYEp1
         sgiKAQ+7WuNy+u2bGR0lp826vfnSY7Hjqh6axAMoHjXye65mMq6cqe+ga7hDCG3n5QRg
         C1rubsUH9lYinRHTK7463zgFFVHpHBmTx2f2511oIl8heWbBwmBpEh/ZXkl8e5trcyn3
         cNyfek9o1vaB+syzZtmccIeo+NWHm1JfavRB3tO5bZIIDI/16upGOgcLjwspmK6iv4tI
         X3MQ==
X-Forwarded-Encrypted: i=1; AKwUvBxPYAcgKaor++FZjqOw8p8vxZhAckPdvf6Zskbt6sOgicDvk5dpM+uBt5wO0+17cxPxaWzMW1t44rIBvzk=@vger.kernel.org
X-Gm-Message-State: AFuF++kTsRCNZFoF1lkgCI3BY/tjY11VgrOwVhzoN64UpTZx25zQcUdV
	MoRNgIoeuB1p94GCXu/sc8vbDO/6vKSqhs38ZC65kRWnf8NOOnlBfW0/ZLDNrY6odHRg+po1TWL
	VWcms+ZeY1XArPzf1faHMd4bfIMnpWZH+3HtEnn43p4WVdELUarHu/fgOX7MeKbCMRh4ARIui8y
	E=
X-Gm-Gg: AYBFou2KVYIGKVtmDFnLC12bhIFXHu7MnBXbCrYFqPop1KzU3FeGyLWn6UUlVTgGXeM
	GDqIjFdJACM+RAvQuZyuQGriQWBbWc/uGeJc8XqhJdt31bSjq1D9w1G+6VcQoWQX+y3+PWBgmhW
	CZe+ZRF2TQLrvOBCQk0tH5Tq8q5FOEX88A7mubYgRaqPIebU5hxAFKxfbdznl7jF7ouF1Fc7LkA
	2zz0Ak4pNfKm98xOn4sNzX4AiVddegBU+aUP3kAx+x0IIkmWWHWz0jyVxiebtHLmbIv1LiDJkWU
	faSvVr29zXxx2X5X4eQT7Ifojk4mMh/nayDfqjDqXcllmP1pZ6fC7dNgDG+8nyMMO2x+zJm4vUP
	/CZYsfPD7YTk72gu4/Y+1D6Vtcw==
X-Received: by 2002:a05:6a20:6a1d:b0:3c3:a31b:3949 with SMTP id adf61e73a8af0-3da39d2e51amr54194199637.11.1788946845956;
        Wed, 09 Sep 2026 02:40:45 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a1d:b0:3c3:a31b:3949 with SMTP id adf61e73a8af0-3da39d2e51amr54194104637.11.1788946845240;
        Wed, 09 Sep 2026 02:40:45 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3342af0bc08sm42929198eec.17.2026.09.09.02.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 02:40:43 -0700 (PDT)
From: mohit.dsor@oss.qualcomm.com
Subject: [PATCH v13 0/2] Subject: Add Lontium LT9611C(EX/UXD) MIPI DSI to
 HDMI driver
Date: Wed, 09 Sep 2026 15:10:31 +0530
Message-Id: <20260909-lt9611c-v7-v13-0-aec234483725@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAI8poWoC/3XQS2rDMBAG4KsEreugGb2z6j1KF3o2KkncWo5oC
 b575bQQG2oQAyNGn37mRkoccizksLuRIdZccn9pDbCnHfFHe3mLXQ7tgiBFSRXV3Wk0EsB3VXU
 pKekwgEsikfbgY4gpf921l9ffvlzde/TjLMwTx1zGfvi+f1fVPPcHg1zC7dBOCcEscMVE8s99K
 fvPqz35/nzet0Jmv+qFgKtoVTfBBYsgXbKJqQ3BPARN+UowTWAcmVVSCxnYhgB0SaxDAG1GjIZ
 aYDJotFsGLAxcxwCYDcetMt4Jo7Z2AfgwDGVrA5thOPCAjrkgwz/GNE0/Gqetlw4CAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788946835; l=10793;
 i=mohit.dsor@oss.qualcomm.com; s=20260808; h=from:subject:message-id;
 bh=7O8HKKkWXv/xiGCHUUAhuaZdMciYyiq6MGh8dtPhar4=;
 b=P+q9Q9x+d2KdyrAjGcwfT3S35CMz+kXwZjdzpdzxzymyyARW6GCNLIpPvDUlakhMoWz2BAzzy
 0GgJ9J4jgdiB6GZBIP/CMxw2TwNqHqwdq/M052ZzJNcNkREpWiegohf
X-Developer-Key: i=mohit.dsor@oss.qualcomm.com; a=ed25519;
 pk=outHVBN53JhozDw1xkj3G1qrqqE5scMBP7M4WL3aHQQ=
X-Authority-Analysis: v=2.4 cv=a4YAM0SF c=1 sm=1 tr=0 ts=6aa1299e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Kz8-B0t5AAAA:8 a=QyXUC8HyAAAA:8
 a=KKAkSRfTAAAA:8 a=P1BnusSwAAAA:8 a=pGLkceISAAAA:8 a=P-IC7800AAAA:8
 a=e5mUnYsNAAAA:8 a=AALwXPcTADLwKW-B6QkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=RuZk68QooNbwfxovefhk:22 a=cvBusfyB2V15izCimMoJ:22
 a=D0XLA9XvdZm18NrgonBM:22 a=d3PnA9EDa4IxuAV0gXij:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEwNyBTYWx0ZWRfX9WRhL9dXxYsc
 LPdyKvCRvV8FQla3RMhWdzBkS3JAPGze4w/dMo4qdkgcjJ3DOIptNj0PNYAOlOGvRCVPPksTDUf
 2BJUuJOKsnr7hLVpKQ7bQ8bNh32zH5qiusj3WsZTWvxhaBZl7c08kapslfTnXnDBb2sxD04Qjwh
 N4HkEx1QSZuzbuqqgRoghC3sNFGj7esCdHl6rpQcVzizL2yvrfUIyAf9F50AHGsWB0TUfIgg3Vc
 udtC8pcKa6n374Ga5d4Vbm2ESZxDjQj2rhm4aswRdLA6FUjNEa5zFzHXR5JwoP7eDvLlRpGLiNZ
 SmdRkR7Ua2mcQKLbcbFaBwnuHw2/OlL1r4mdNrzEy6uWNBBaX0wrJNIWdWrQKCkvWY2bWVR80r3
 Pc7OEF0OD1/jZIFOkxxuR70q/KhhC9LhP5SjRHvoyoO+KtDplKwysLyxh2fG3LPSds2b897upf2
 oVZqJarmENNRtK8eIaA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEwNyBTYWx0ZWRfX4mDEevPGIE/L
 6XdQpSk2/vQy6SAVsZeACAQJ4+SY47+suMLdxYi95sxt0B8DF4xZRQeEI8LJHN0W5QykKZgPoWW
 iM4gB1ujnPuUVaJozygE3Klp7TpitPk=
X-Proofpoint-ORIG-GUID: eTdzqyqKQEse7TUt_Edqo2dw_1EAV0Af
X-Proofpoint-GUID: eTdzqyqKQEse7TUt_Edqo2dw_1EAV0Af
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090107

This series introduces:
  - A device tree binding YAML file describing the hardware
  - A new DRM bridge driver implementing the basic functionality

  LT9611C(EX/UXD) is an I2C-controlled chip that Receiver signal/dual port
  mipi dsi and output hdmi, differences in hardware features:
  - LT9611C: supports 1-port mipi dsi to hdmi 1.4
  - LT9611EX: supports 2-port mipi dsi to hdmi 1.4
  - LT9611UXD: supports 2-port mipi dsi to hdmi 1.4/2.0

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
 drivers/gpu/drm/bridge/lontium-lt9611c.c           | 1295 ++++++++++++++++++++
 5 files changed, 1339 insertions(+), 2 deletions(-)
---
base-commit: 34e27b90552acf21bd73aac395667c8aae6da480
change-id: 20260708-lt9611c-v7-ff76b2d1bf5f

Best regards,
--  
Mohit Dsor <mohit.dsor@oss.qualcomm.com>

