Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4A3380FC4
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 06:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788848858; cv=none; b=f5e9UevzlaD/uXaH8ubPF9mAxER3sKh6iGYBvyY2bJRL77JYh6pgtEXbW4nt7FFx15PVztuVVr5Q0PRtsjxrpV0MqrJlVJQPMgzrmb9VnYngJxEMWXhGGKeQOMc5YxjVDhZNptAkcmkTwNWV1LboWMAolydMUpcYwOOzQt7TEbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788848858; c=relaxed/simple;
	bh=XcWBN3GeP00Ku0Mc2HBPgjLZacSijIptpn85T5vzpjk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q2nck4UVFFQ9JCHmzZSsincMV3OLprrby+QTX5gUpeUBwgcunWVMS+kmCIH/IJqIKwnxUaE/17z0ojwDTAB7i5W/5Uq8Lc4wd3UQodpU03Jnr7kLcV4MQ9+TLLyK8/EQSwr00YHwd6U2qxMQgOcnJNyBBZ6x3ifU2OP73nW77j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WRBPqj7w; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WRBPqj7w"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d6ff2f2c4eso4355835ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 23:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788848856; x=1789453656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Do+tyJs/In1J8gFUGP4c/jQC48P3JQhaviUTpiPjDi0=;
        b=WRBPqj7wx65qeOC0zPwlYUMyEp9LdWvSxR62583muzrIanrvTbe5PEEXmxAuBS+PRz
         MRodjMXr1EwpVaoRit1CmYtTlG8Lw7iNFnZTW2G9afkHb/qiZZuAsfIB8TsTJQntPvUG
         L414Ql5FN9bAk8l5+UMGCX8x+5MocWVe4QPbJFx2KApr58KqCYZWloJtyswHOgVZkMtW
         wAURTDkLCWFGlTuXRdZZT1kcZK1kH+LII4RqIVvxHK7teFe4GDGTUuXN/0glgs1USTA5
         TYk5hytR05Tu9BtMxOqWRKPC8p81PGYWGaC9ic8hq5259Xg1wJSb3o8cTRLZfip/W4Us
         unpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788848856; x=1789453656;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Do+tyJs/In1J8gFUGP4c/jQC48P3JQhaviUTpiPjDi0=;
        b=Of11QRYgM7k8lf8jenheaAuAk0IMUfo5w8BsVIhJ6IfwfoM6QmArz1FaVf7zyjvdjj
         NEXXbb1HUuOctG9KMuDwo9wUkPkRztImddAZn+S8JDRCW0qa6fNewfXLXijmRcmlTLfe
         y9+mJWXvfH535V6P70mjiLs4vUwMHTcF/7S1g6/IhTSDXoienKtQwthQoTFs/m1nzV1t
         aNseDNTyFcxYIV1hWutLT+7cctUX/eiUiU47BroBTadIj4KqmgEmosemfbsGeG7Tnpo1
         uiABgiBSqZL+NUNzisEiNGY5Ei1eml94NeeXx/S/I6vZTwViTqVETAPkxSfp8Qr6MW10
         Zqvg==
X-Forwarded-Encrypted: i=1; AKwUvBxw9Fj1iuzEy1rK5jOa4NwfT55O8I5sWlPhk2ob/9YsZT8OGPUFUggdHKgHBMFQ2d9FK6wUt5fydQf4+yQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kizp+jCgvezd7BHUP7vbkjP+4yc1QQpV646KGyJZ5LPNDmA5te
	e1Fiqo+V5cl2NUpdDd3m7Al+7adubJoA9tB7lv5gnUoxaBxXxjRDB3zW
X-Gm-Gg: AYBFou3uUvmNw2xp92vQltn0ZHNwwrVBOi9NJ8jwUXEtIIADcT6KukAXIFqbWwid8qV
	KddnoC42mSdmF3P8qw/voIe17ADQyVZ6NTsA7gdSL8CT11rz/SF+oHUw24RBHAPo6E9lSnrnoNn
	3qoVBK0vICkCgksHkziVYL79Wcy/Dlnz0YpH7/PEEgXRDA6ZWbihlOct+A+anb6qXXMOCpa6MkR
	5oGD+6jvpjqXu3aBequbX9tOxcx2BWom4/YFjiYzvQEFyrRufq2G3PKQff24vV3WMTItapCX+ca
	gqQWwj7e3RE7f5qBMaRXSPreQBOISPX9OcBuQf06+3QK/nYR4O/KVlNv1aQ2lPaQ3dLSboFdkuG
	+Ih90gwxRHpKstshDM5Lea9BI0M7EuHtcrSkq8rh52XFzM9iiyptFGsQukOZpGQ2Ctz+ELCWG7H
	03YV7u3KCQpYQXFRt49myE78VxM86QFr+wt8JnhWjdP3y5vrnsBQp6cbfuHhYXQV9hgBYQ3T1Gz
	fM=
X-Received: by 2002:a17:902:ced2:b0:2cb:2b50:d9da with SMTP id d9443c01a7336-2db2779b54fmr189996155ad.3.1788848853049;
        Mon, 07 Sep 2026 23:27:33 -0700 (PDT)
Received: from fedora (45.62.127.193.16clouds.com. [45.62.127.193])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1497fbf8sm54701565ad.43.2026.09.07.23.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 23:27:32 -0700 (PDT)
From: Frank Zhang <rmxpzlb@gmail.com>
To: royalnet026@gmail.com,
	Laurent.pinchart@ideasonboard.com,
	airlied@gmail.com,
	andrzej.hajda@intel.com,
	luca.ceresoli@bootlin.com,
	cristian.ciocaltea@collabora.com,
	daniels@collabora.com,
	detlev.casanova@collabora.com,
	dmitry.baryshkov@oss.qualcomm.com,
	heiko@sntech.de,
	jernej.skrabec@gmail.com,
	jonas@kwiboo.se,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de,
	sebastian.reichel@collabora.com,
	macromorgan@hotmail.com
Cc: dri-devel@lists.freedesktop.org,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: dw-hdmi-qp: Guard clear_audio_infoframe when PHY is down
Date: Tue,  8 Sep 2026 14:27:08 +0800
Message-ID: <20260908062708.39437-1-rmxpzlb@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following panic was observed during system reboot:

Kernel panic - not syncing: Asynchronous SError Interrupt
CPU: 6 UID: 1000 PID: 2348 Comm: pipewire ... 7.0.5+ #4 PREEMPT(full)
Call trace:
 ...
 regmap_update_bits_base+0x70/0xa8
 dw_hdmi_qp_bridge_clear_audio_infoframe+0x3c/0x58 [dw_hdmi_qp]
 drm_bridge_connector_clear_audio_infoframe+0x2c/0x48 [drm_display_helper]
 ...
 dw_hdmi_qp_audio_disable+0x28/0xa8 [dw_hdmi_qp]
 drm_bridge_connector_audio_shutdown+0x38/0x68 [drm_display_helper]
 drm_connector_hdmi_audio_shutdown+0x28/0x40 [drm_display_helper]
 hdmi_codec_shutdown+0x60/0x90 [snd_soc_hdmi_codec]
 ...
 snd_pcm_release_substream+0xcc/0x120 [snd_pcm]
 snd_pcm_release+0x4c/0xc0 [snd_pcm]
 ...

The root cause is pipewire tries to close the HDMI audio device after
atomic_disable(), which sets tmds_char_rate to 0 and disables the PHY.

In this case, dw_hdmi_qp_audio_disable() will call
dw_hdmi_qp_bridge_clear_audio_infoframe(), accessing register without
checking tmds_char_rate.

Guard the register access in drm_display_helper callback function with
tmds_char_rate check.

Fixes: fd0141d1a8a2 ("drm/bridge: synopsys: Add audio support for dw-hdmi-qp")
Cc: stable@vger.kernel.org
Signed-off-by: Frank Zhang <rmxpzlb@gmail.com>

---
Changes in v2:
- Move drm_atomic_helper_connector_hdmi_clear_audio_infoframe() inside
  the if (hdmi->tmds_char_rate) of dw_hdmi_qp_audio_disable().
- Link to v1: https://lore.kernel.org/all/20260416093150.13853-1-rmxpzlb@gmail.com/

Changes in v3:
- Add a tmds_char_rate guard in clear_audio_infoframe path.
- Decouple write_audio_infoframe from clear_audio_infoframe.
- Balance the PKTSCHED_AMD_TX_EN bit enable/disable.
- Link to v2: https://lore.kernel.org/all/20260418101936.7731-1-rmxpzlb@gmail.com/

Changes in v4:
- Update panic stack on 7.0.5
- Link to v3: https://lore.kernel.org/all/20260423081514.15444-1-rmxpzlb@gmail.com/

Changes in v5:
- Reuse the origin dw_hdmi_qp_bridge_clear_audio_infoframe and add
  tmds_char_rate guard in new callback function.
- Link to v4: https://lore.kernel.org/all/20260512103153.8861-1-rmxpzlb@gmail.com/

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 1c214a8e6dc2..8729783d4eb6 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -880,7 +880,7 @@ static int dw_hdmi_qp_bridge_clear_spd_infoframe(struct drm_bridge *bridge)
 	return 0;
 }
 
-static int dw_hdmi_qp_bridge_clear_audio_infoframe(struct drm_bridge *bridge)
+static int __dw_hdmi_qp_bridge_clear_audio_infoframe(struct drm_bridge *bridge)
 {
 	struct dw_hdmi_qp *hdmi = bridge->driver_private;
 
@@ -893,6 +893,16 @@ static int dw_hdmi_qp_bridge_clear_audio_infoframe(struct drm_bridge *bridge)
 	return 0;
 }
 
+static int dw_hdmi_qp_bridge_clear_audio_infoframe(struct drm_bridge *bridge)
+{
+	struct dw_hdmi_qp *hdmi = bridge->driver_private;
+
+	if (hdmi->tmds_char_rate > 0)
+		return __dw_hdmi_qp_bridge_clear_audio_infoframe(bridge);
+
+	return 0;
+}
+
 static void dw_hdmi_qp_write_pkt(struct dw_hdmi_qp *hdmi, const u8 *buffer,
 				 size_t start, size_t len, unsigned int reg)
 {
@@ -987,7 +997,7 @@ static int dw_hdmi_qp_bridge_write_audio_infoframe(struct drm_bridge *bridge,
 {
 	struct dw_hdmi_qp *hdmi = bridge->driver_private;
 
-	dw_hdmi_qp_bridge_clear_audio_infoframe(bridge);
+	__dw_hdmi_qp_bridge_clear_audio_infoframe(bridge);
 
 	/*
 	 * AUDI_CONTENTS0: { RSV, HB2, HB1, RSV }
-- 
2.55.0

