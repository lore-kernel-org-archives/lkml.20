Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F04E38DC64
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 19:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788376851; cv=none; b=DrTxS+XbVVsI30jBhFii/QTKsfmDGhi4qh7YYXWvr0sXlGuG9Yy4mezGMN4tJUU2x7VhJ/hdrzdKhyT5Yw3afSjkFTWHKhbhyhj8FVe2cIduwIsamTCGOkfxpgosP6vFjViynZUuAsOApqK5bXXD2faNpIE+DQ+Nme5Pq52Ps9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788376851; c=relaxed/simple;
	bh=YRBcwb3rmTCMGniH5xHNIKt+pxd7rS35BHK0rO9uglg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oWT58G7n27cXln9qERYIGwcX3Dcr+uHauTf/NCLsOvJ8qYlbhc7qjFvcN1+WuqILMaTfsKrSZQ0UCOiObtNlPB05/xPBhI3e3JiO6BJKmMfa5shGawcNl/MoeYIFrl4iGEMdxOA0mVbRZJyWdvkov/p5IgUpHyJYboBC6XDy6vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UOC/GAia; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OtEBwo9+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UOC/GAia";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OtEBwo9+"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hqt3W1071885
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 19:20:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4IHF21fFv5lOMUj439vkGf
	Pif670Wz2pKcYh+3cFa1I=; b=UOC/GAia0T6K3R6xDvp0afN9kjgEU6FnLCAGZX
	Q+OmWUGupSjGEP+7QBIQloDWTgZTmgAupfOzVFMcYRK+fIA1WkT3M9AHBQjB3HqF
	oK1Lcx8fKwzh2vUM828UAab/CUjIQP5W9QjqXVU5cO3jQulLPwPdKctZHnm6HQj5
	LEzocrQ1D4JR5W73jZ2kzMxTJz/lSTSEvLHmAxMIk5nKpUvgFbBEWUGqmUwLH3zs
	3BH6a6IRrYymcjOUR61yiNuiQ5doK3R+XVUj3nT53HPyiWBaHO3MPs8gUUsbiArm
	oSk3Iz3CR7dRPUNQz5b2BXEs1DUY4Z335oJWSUzgi6ezVLqg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemja1h5h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 19:20:47 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so2519614a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788376846; x=1788981646; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4IHF21fFv5lOMUj439vkGfPif670Wz2pKcYh+3cFa1I=;
        b=OtEBwo9+UX1nDLlkqc6cfWnGY+moemG5QO4ZGFp4SJ6wP/C+tTWndmgcjKZc+2YhBi
         dINK/79c8KDNdRhdrnfkTQZSlFYhkGV0ojLqrte2xGGUsu+sAu1rU8jKscsq+xK6L2sF
         MNZG3JzHMcgMWZVIhMlxzVAF5X08wXfv1eReYRylRw0EocqHb6brTSPMCUL+2SAJoOJ/
         //AmX0JGVb2y6tJhzKfb/Sa1LhvagqvafjkGybv7gkebg9ALsUcQq4dSUfSeaAgrMo7c
         xMmzdoP5M4jiJXvhlqswcrSD+FeY/FsBaDRIQVUw2BRAiQ8hyPhmYJh+5z8TuN0zDdJJ
         lnMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788376846; x=1788981646;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4IHF21fFv5lOMUj439vkGfPif670Wz2pKcYh+3cFa1I=;
        b=Fcl6SpQ/6LfulWFLZWfcEfKsP/oYwfk3LqGvS4DAtdazWdQjAhK5N9leOSiLfgBOoA
         uXvrhyGjHSc9BMmBpnWQyFEgT+CKH1+HnAQii8W9+L9WEuPAO47MTWkwnXqRROck8zVR
         IGlHIzuKKbCQTw37cs3OKEHIdHbtIuLAz1hl9lvBNjh0FemFO6FUXj6xC0vLGIYSQeBl
         w3CqGLCqGeNn4KBRXrhSC8skkfX4eSB4fgblFKoaoVC7/BPVRKJ4f2FnwaCTPL8HQLIH
         uXh2W4PYaAH7Y79YZvBwYtHAISMwQTZFFhGt17v8GeZxDL8+UUrleMiCtfXSNXmT94wj
         MOtA==
X-Forwarded-Encrypted: i=1; AKwUvBwqSkBEeX6Fhb6aazxlXFEONncxowJSp67p8kp3+7J1+D1ESO9K3RtKe7fWEOIWUo7uZzo/T9IVDAMWOOY=@vger.kernel.org
X-Gm-Message-State: AFuF++llLF0QXxX3aBYGf9DQmbwkRXi70zNgfOC+i12Nofj/GuQp35pe
	MQ7iSkJzywiy94oXEs+UQtOPqIohp/sttLNtzgXHoyHq2NJowUtXlLY1BtJzvJXSIZZ/t0aKHUl
	rk7AjxX+KfjdNE3t+mWDU1kB/Gl4LoCM39aOWfmnDFcL4NUvHzA4+2MLilH4GQjADe2g=
X-Gm-Gg: AYBFou3s2Um8D1E4e2lanUYAIarFZiqvyf3CVeo49lQSrfThr8SPfaCQTZuh+CVbXst
	x4pR9jSJg2FfZTvZKSDWDOOBqbOhWWBf27ahpkAbPAz67cEWoFW0hJ204wfFGORl+eK6smWcndw
	RotQPxft9JcF/Q7q6UqHOxfWjYl+TMp7VCqKyrI6NVhE3BZFmxUzUHDQz1i4BCMkegEZMQdC8v2
	KwTj4ztnh09n1HLOYwjdED7vnU4TEM6PHUOhrChfasMQYAzIFCw8P39uvz35Of/mZbZFECX9D0n
	jRDqvJMuuY/4bhmwUfp7CxHA6/wXlbsH06S5Wbi++UzU1+2GmSqEAzKkSVoVQvKidxfv24p3psE
	yuWRcK3UidldZ/G1+Wlm0v1GBIQ==
X-Received: by 2002:a17:90a:c10e:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-39aedff8438mr10851350a91.10.1788376846289;
        Wed, 02 Sep 2026 12:20:46 -0700 (PDT)
X-Received: by 2002:a17:90a:c10e:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-39aedff8438mr10851264a91.10.1788376845564;
        Wed, 02 Sep 2026 12:20:45 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33255e3172asm244765eec.17.2026.09.02.12.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:20:45 -0700 (PDT)
From: mohit.dsor@oss.qualcomm.com
Subject: [PATCH v12 0/2] Subject: Add Lontium LT9611C(EX/UXD) MIPI DSI to
 HDMI driver
Date: Thu, 03 Sep 2026 00:50:32 +0530
Message-Id: <20260903-lt9611c-v7-v12-0-9414d2b3bd6d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAB3mGoC/3XQ22oDIRAG4FcJXtfg6Opor/oeIRceG0uSbdeNt
 IR997ppobvQBRkYGT9/5k5KHHIs5Hl3J0OsueT+2hrgTzviT/b6GmkO7YJwxhVDpul5NArA04o
 0JVSOB3BJJtIevA8x5c+Hdjj+9OXm3qIfZ2GeOOUy9sPX47uK89wvDGoJt8MoSiksdChk8i99K
 fuPmz37/nLZt0Jmv+qFwFfRqm6CC5aDcskmgRuC+RM061aCaYLouLCotFRBbAjAlsQ6BLBmxGi
 YBaGC5nbLgIXB1zEAZsN1Fo130uB/u5im6RszbTOmygEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788376838; l=10451;
 i=mohit.dsor@oss.qualcomm.com; s=20260808; h=from:subject:message-id;
 bh=YRBcwb3rmTCMGniH5xHNIKt+pxd7rS35BHK0rO9uglg=;
 b=pbmvWStE70a7YwIYvOn3s/SjSOY44hS6CH316v83kGkvrnsB5HXr0CKbITcskHchxUYihrhKk
 7neBoyG8eihDV4n2TEc4XDBVdD35BumpM0OAgFZQeazAFpYmgbdXK1w
X-Developer-Key: i=mohit.dsor@oss.qualcomm.com; a=ed25519;
 pk=outHVBN53JhozDw1xkj3G1qrqqE5scMBP7M4WL3aHQQ=
X-Proofpoint-GUID: mQtqZpJ3alRwRZ8x0UbpqRuQoGxO5s7U
X-Authority-Analysis: v=2.4 cv=FeAHAp+6 c=1 sm=1 tr=0 ts=6a98770f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Kz8-B0t5AAAA:8 a=QyXUC8HyAAAA:8
 a=KKAkSRfTAAAA:8 a=P1BnusSwAAAA:8 a=pGLkceISAAAA:8 a=P-IC7800AAAA:8
 a=e5mUnYsNAAAA:8 a=AALwXPcTADLwKW-B6QkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=RuZk68QooNbwfxovefhk:22 a=cvBusfyB2V15izCimMoJ:22
 a=D0XLA9XvdZm18NrgonBM:22 a=d3PnA9EDa4IxuAV0gXij:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3MSBTYWx0ZWRfX8/pjNpe8rr0V
 GisJAe3q0aF1BzTru8zDlpP3rhziT5P1jN5YHtDZdUPRO//S0zEKTWDPV9GvCsFlvcGkgVICl6o
 eBgyhVHygRARZ6hcWe1HmUImdjyzl5k=
X-Proofpoint-ORIG-GUID: mQtqZpJ3alRwRZ8x0UbpqRuQoGxO5s7U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3MSBTYWx0ZWRfX1r6lDMSxvqqX
 bC48NpVbip5eFUTIm5xGVn/XQxXgh8br2DzutxGB8MXAx6qrTu16N42LDA/jyPSuykuJjiBawvp
 npuG5/XklVVFc9Df5YS+YKmnSRlTYQ+5LlwdRJY+SFuqrW3OPQ+PbbQvmvG6jbpYWinCbDCqcIX
 Vjk35eN96N/muJGtOhL5a+i8g2eP/k8ftDk2G+XNFDbTdpuiAkFm552CHI8mj1RKZ6VfEVWnXWw
 u9bagGLQ8soty9KEHquBom1QpFdMAk15oeyhltRF142wUjDo1Zt3czLFTfWhS74OZkikCpWG2xF
 GGzGhlgsbnE5yMFUFwq374pjA1iyJs26/mLcqj0PMDGUxpYrEhF7QcnWo6f0gq6FMalVKjuPdxn
 Aow40n7P7bfgQTG9ZRXGN8A1VZ06yJnGCMOXRbyyjmFvfq/jz/dWc2D2XfVQP16eL5C8uo8WK5j
 HWV6NJiOohD8XsocjQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020171

This series introduces:
  - A device tree binding YAML file describing the hardware
  - A new DRM bridge driver implementing the basic functionality

  LT9611C(EX/UXD) is an I2C-controlled chip that Receiver signal/dual port
  mipi dsi and output hdmi, differences in hardware features:
  - LT9611C: supports 1-port mipi dsi to hdmi 1.4
  - LT9611EX: supports 2-port mipi dsi to hdmi 1.4
  - LT9611UXD: supports 2-port mipi dsi to hdmi 1.4/2.0

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
 drivers/gpu/drm/bridge/lontium-lt9611c.c           | 1290 ++++++++++++++++++++
 5 files changed, 1334 insertions(+), 2 deletions(-)
---
base-commit: 34e27b90552acf21bd73aac395667c8aae6da480
change-id: 20260708-lt9611c-v7-ff76b2d1bf5f

Best regards,
--  
Mohit Dsor <mohit.dsor@oss.qualcomm.com>

