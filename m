Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793575490;
	b=V7wyAxF5M5E1ynR6jj5ONbDQ43CEq8ZEiTzWLZxA0tcSmB15VCCtbuUdWp9vppKJyBeO
	 wEgCqoqHWdaB/JNbdnUMfYEElvB+leb11yd70DJZVLQFZ5jlDuME+B9YyNfomAwcrtuc4
	 6ueoohLvcRAnehivpbdvceI0dnI2UDNnB5KFoXmUhSBvmkAMT5tLeG01mqIrOhG/svh93
	 2CkfNm6IXeGZ0LUDa8S/btOxbln0QfGt4AJDstj/cIDUb+5E0N0aROexCgyBuh3i0JGPn
	 CA67k0OTZlssDCCfVcsL0DGxY2BlqOo0kR4BBG5ZSHviKe9GUpmBjGVWpBJdFumunIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793575490;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Content-Language:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding;
	bh=QOc/+pAAVAzpsjbhDTB2SpKcdDFIk9fN2ZS/vqFolwg=;
	b=qUqrI9JEoNeSnffHyLnIBX8o4lVTZq4KQXp4/CXi1zklYBxZJdeB48TZzi0T9v4o1QEW
	 vVfhSIP5VHtE991FmSsTVP2Nyz37rESXw359gIEloCZT40eCZtS8EtEiU4iVPpnWRLR1G
	 H00doJ6GvesSpDyIbkPy4/kVPeiqsfWVVqbnmP/0mK0LXQ3CJ8A5OYM3XrRYtNNowTCbq
	 WpMCu0CV+ej5IMlF66GUFrYzBeDvvhTFnAXg/AJVdVyPmGFtdkznzROu5bG/4rpfcllQr
	 icAyMGKGYBvheXNH+QEuW18EXwqwjSQOWQB5RDlPLGls6dTVY02bQQs9V1lnXd3O1Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mdDJuZiS;
	arc=none smtp.remote-ip=74.125.225.134
Received: from mail-wm2-f6.google.com (mail-wm2-f6.google.com [74.125.225.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213E2606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 23:24:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 213E2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mdDJuZiS
Received: by mail-wm2-f6.google.com with SMTP id 5b1f17b1804b1-4a1d25d7d5dso11304945e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 15:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793575488; x=1794180288; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QOc/+pAAVAzpsjbhDTB2SpKcdDFIk9fN2ZS/vqFolwg=;
        b=mdDJuZiS6iwQtnpwpdXjujY16TNgisL8PGBzWAWHh4ev+bi98IBvA6G9DsxQZtRflU
         BdQMdexXD+8xFmHry9FvVweuzriJPei75kOohfkmqpz5etd2VD4rLVvz9xGDt9+TFwAK
         RgLghQC3nEPPYvJONanV4FD1zDOLeDXm4DZ91sA2z2L5KzoXCp3bXXa1hlm2iA5V/+nB
         WXrQL6sTqOVTbxmd4taewgzGZfa0jWCfFxll2SVuxfLgitVmK7IhNWYFcYEifB0sYh/K
         GWk8L3LNu+p7pYiU+Ny5PjfO2L2MvMfxSpqU37fqTvqm+qyq5LDFGMI7stF7Nce4YFC8
         dT+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793575488; x=1794180288;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QOc/+pAAVAzpsjbhDTB2SpKcdDFIk9fN2ZS/vqFolwg=;
        b=zaEy+PRSPr9ZCrs4kQ6BK4bA9jo3r/3mxqwt9v9EA5SRtODzWjtbJePTk6KqMCnJB3
         a7El/wQmJ5r6wOYdsde1FQEZYmoyYQJe+Ssw4ZqSyu72LeYxxAEcOdKbrFrICvH0Ckzd
         lX8AFlsEMS78Y12hF/D/hV7VKVBhepC1QvsV3UqHHo6HpDZAhBw8DwJgXgMaqeRPLKii
         yV0zxVKNrrjOaWSH4T6nm5BMIKh6/TMzByq0CH4vs0IcZ+MwnlriFG1vNGpxJbWylAmq
         6X+bZMxhdyGk5mitGf/a7rV9nF1HJLYGkKtqOyq0Ic+Sqjqq2OnpqXI+eOH2AenV43X/
         iAHQ==
X-Forwarded-Encrypted: i=1; AKwUvBzLVLwe1/ucigC20WRVtqYlgSxxKtE7AfJ58wHHNG10vacOwefTcKwUc/oiDDXNEBC1gfh+JOjetDPNK4A=@vger.kernel.org
X-Gm-Message-State: AFq9FYIj+4qjJQ0tDdRuOrZpsO11Zz73YxGoj9rcIPh32ErD5/rnOwuz
	eGn7aHnLPdQswODMjiVXnrlhSb8DspHz35naiS7AZOxUSoK9P2hIlrhh
X-Gm-Gg: AYBFou0YV8b1wtc3yRl5BrS8eteBRVqpHSn57ZtKmlPyA39M0vuM8IJt2ZObETT9zp+
	9H//UQZZiEtXkY3OKwQG0hFgwnxflIReyC9vcz7gv2rAXhXXo2YY68ykhXtVdPerBk01tHpKpPr
	Bx20ayuCs6ZHGcIp5vkqeJ7ipubpgl3eETvJAAUmb7mftmI7AYvnqXkxCwIPz8Ox0VKg40pWEt+
	EU4wxsxoklqY67tnKhCpMnTYyVhyGJGkHaTWdcjsY+2nj2ag7lzG2UOY9TrFkCXCjl/c83M6aZH
	XTP5grl2dTUg4iE3HyQlq31yfi4qikgpRN6dsAlePQZSr+SanHKuBoxBNqP40vjExJRGi/Wy6Wx
	/2+BWmonN8VpXAFIiwNOAHn1IVPaoPwT26YTZiET+EafNfpDZzinNEkUq74QFWvVwnYisC1JGo5
	LTPiUo5OPP7cneNZD/3nFfVHDu2zG4VE4Oiq+hKIJRwv70KNapkBq6kF893K6DUibo5CM6OYaqM
	vO0jULKad+4zpCLejpCtJu3y/ogXWUXBlRiVKirh3+Eia2EfYgZI7gy49rPAT3UOGNntbyvGWjV
	XAT3KJl1gNKgiy+prc+AIx6ADZj4NjTUq/C0UZxO2tmZTEPNKgQfq59x
X-Received: by 2002:a05:600c:811a:b0:4a2:1e1:d55 with SMTP id 5b1f17b1804b1-4ac187a6b30mr181861095e9.28.1793575488290;
        Sun, 01 Nov 2026 15:24:48 -0800 (PST)
Received: from [192.168.1.7] ([31.94.68.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81b7fe80sm341309865e9.11.2026.11.01.15.24.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 15:24:46 -0800 (PST)
Message-ID: <94672259-c526-4ec7-a69c-7dda8d934593@gmail.com>
Date: Sun, 1 Nov 2026 23:24:45 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Richard Lane <richardlanedev@gmail.com>
From: Richard Lane <richardlanedev@gmail.com>
Subject: [PATCH v2 2/3] drm/amd/display: unlock secondary tile on Apple 5K,
 iMac panels
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Apple 27" 5K iMacs (2014-2019, iMac15,1 through Polaris-based iMac19,1)
expose their internal 5120x2880 panel as a 2x1 tiled display over an eDP
root link and a secondary DP link. At boot, the panel TCON operates in
single-pipe mode and holds the secondary DP link's HPD line low until
unlocked via DPCD registers.

Enable native tiled detection and link training for DCE < 12 Apple 5K
panels:
- Point the secondary DP dc_link to the root eDP dc_link (apple_5k_peer)
  during EDID quirk matching on DCE < 12 iMac15,1, iMac17,1, iMac18,3,
  and Polaris-based iMac19,1 (checking connector_signal since panel IDs
  can flip across the two links after S3 wake). DCE >= 12 support for
  Vega-based iMac19,1, iMacPro1,1, and iMac20,x is documented as TODO.
- Avoid falling back to DVI and latch the secondary tile via DPCD 0x4F1
  on the root eDP link when probing the secondary link, allowing the
  secondary link to read its EDID and populate DRM's DisplayID tile
  properties (has_tile, tile_group, and tile_is_single_monitor).
- Write the 3-byte Boot Camp source table (0x04, 0x1d, 0x03) to DPCD
  0x310 in dpcd_set_source_specific_data() to unlock the secondary tile.
- Prevent the secondary tile from entering DP_SET_POWER D3, which causes
  the TCON to drop HPD and stop responding to AUX transactions.
- Unlatch both tiles (0x4F1) and clear DP_SOURCE_TABLE_REVISION (0x310)
  and DP_EDP_CONFIGURATION_SET (0x10A) in dm_suspend() so the TCON
  returns to single-pipe mode for the EFI boot screen across reboots.

Signed-off-by: Richard Lane <richardlanedev@gmail.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 19 ++++++++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 22 +++++++++++++++++++
 drivers/gpu/drm/amd/display/dc/dc.h           |  1 +
 .../drm/amd/display/dc/link/link_detection.c  |  7 +++++-
 .../dc/link/protocols/link_dp_capability.c    |  4 ++++
 .../display/dc/link/protocols/link_dp_phy.c   |  3 +++
 6 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index bdabb4bf14da..74cd88d8d580 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1607,6 +1607,23 @@ STATIC_IFN_KUNIT void dm_destroy_cached_state(struct amdgpu_device *adev)
 }
 EXPORT_IF_KUNIT(dm_destroy_cached_state);
 
+static void amdgpu_dm_apple5k_unlatch(struct dc *dc)
+{
+	const u8 zeros[3] = { 0 };
+
+	for (int i = 0; i < dc->link_count; i++) {
+		struct dc_link *link = dc->links[i];
+
+		if (link->apple_5k_peer) {
+			core_link_write_dpcd(link, DP_SOURCE_TABLE_REVISION, zeros, 3);
+			core_link_write_dpcd(link, DP_EDP_CONFIGURATION_SET, zeros, 1);
+			core_link_write_dpcd(link, 0x4F1, zeros, 1);
+			core_link_write_dpcd(link->apple_5k_peer, 0x4F1, zeros, 1);
+			break;
+		}
+	}
+}
+
 static int dm_suspend(struct amdgpu_ip_block *ip_block)
 {
 	struct amdgpu_device *adev = ip_block->adev;
@@ -1674,6 +1691,8 @@ static int dm_suspend(struct amdgpu_ip_block *ip_block)
 
 	amdgpu_dm_hpd_rx_irq_work_suspend(dm);
 
+	amdgpu_dm_apple5k_unlatch(dm->dc);
+
 	dc_set_power_state(dm->dc, DC_ACPI_CM_POWER_STATE_D3);
 
 	if (dm->dc->caps.ips_support && adev->in_s0ix)
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index 9774ea33272d..532748127f72 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -173,6 +173,28 @@ STATIC_IFN_KUNIT void apply_edid_quirks(struct dc_link *link, struct edid *edid,
 		drm_dbg_driver(dev, "Force FreeSync min to 60 Hz on panel id %X\n", panel_id);
 		edid_caps->panel_patch.force_freesync_min_hz = 60;
 		break;
+	/*
+	 * Workaround for Apple 27" 5K iMacs which expose a 2x1 tiled internal
+	 * panel over an eDP root link and a secondary DP link. Point the
+	 * secondary link to the root link to latch/unlatch the TCON via DPCD,
+	 * checking connector_signal as panel IDs can flip after wake.
+	 * IDs (Root/Tile): iMac15,1 (AE01/02), iMac17,1 (AE05/06),
+	 * iMac18,3 (AE11/12), iMac19,1 (AE25/26); TODO (DCE >= 12): iMac19,1
+	 * Vega, iMacPro1,1 (AE1D/1E), iMac20,x (AE31/32).
+	 */
+	case drm_edid_encode_panel_id('A', 'P', 'P', 0xAE01):
+	case drm_edid_encode_panel_id('A', 'P', 'P', 0xAE02):
+	case drm_edid_encode_panel_id('A', 'P', 'P', 0xAE05):
+	case drm_edid_encode_panel_id('A', 'P', 'P', 0xAE06):
+	case drm_edid_encode_panel_id('A', 'P', 'P', 0xAE11):
+	case drm_edid_encode_panel_id('A', 'P', 'P', 0xAE12):
+	case drm_edid_encode_panel_id('A', 'P', 'P', 0xAE25):
+	case drm_edid_encode_panel_id('A', 'P', 'P', 0xAE26):
+		if (link->connector_signal == SIGNAL_TYPE_EDP &&
+		    link->ctx->dce_version < DCE_VERSION_12_0 &&
+		    (link->link_index ^ 1) < link->dc->link_count)
+			link->dc->links[link->link_index ^ 1]->apple_5k_peer = link;
+		break;
 	default:
 		return;
 	}
diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index f4fefa7c9ab8..aa1a9eea99d1 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -2003,6 +2003,7 @@ struct dc_scratch_space {
 	bool skip_implict_edp_power_control;
 	bool forced_psr_active;
 	enum backlight_control_type backlight_control_type;
+	struct dc_link *apple_5k_peer;
 };
 
 struct dc {
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_detection.c b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
index b4546f93af0c..47755f8b9c3e 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_detection.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
@@ -218,7 +218,7 @@ static enum signal_type link_detect_sink_signal_type(struct dc_link *link,
 			 * we assume signal is DVI; it could be corrected
 			 * to HDMI after dongle detection
 			 */
-			if (!dm_helpers_is_dp_sink_present(link))
+			if (!link->apple_5k_peer && !dm_helpers_is_dp_sink_present(link))
 				result = SIGNAL_TYPE_DVI_SINGLE_LINK;
 		}
 		break;
@@ -1625,6 +1625,11 @@ bool link_detect_connection_type(struct dc_link *link, enum dc_connection_type *
 		}
 	}
 
+	if (*type == dc_connection_none && link->apple_5k_peer) {
+		core_link_write_dpcd(link->apple_5k_peer, 0x4F1, &(const uint8_t){1}, 1);
+		*type = dc_connection_single;
+	}
+
 	return true;
 }
 
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
index ad1a499b0d9d..d646b156c90b 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
@@ -1496,6 +1496,10 @@ void dpcd_set_source_specific_data(struct dc_link *link)
 				link->dc->vendor_signature.data.raw,
 				sizeof(link->dc->vendor_signature.data.raw));
 	}
+
+	if (link->apple_5k_peer)
+		core_link_write_dpcd(link, DP_SOURCE_TABLE_REVISION,
+				     (const uint8_t[]){0x04, 0x1d, 0x03}, 3);
 }
 
 void dpcd_write_cable_id_to_dprx(struct dc_link *link)
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_phy.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_phy.c
index 49521ac4b0e8..56fe2710ee2c 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_phy.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_phy.c
@@ -50,6 +50,9 @@ void dpcd_write_rx_power_ctrl(struct dc_link *link, bool on)
 	if (link->sync_lt_in_progress)
 		return;
 
+	if (!on && link->apple_5k_peer)
+		return;
+
 	core_link_write_dpcd(link, DP_SET_POWER, &state,
 						 sizeof(state));
 
-- 
2.55.0
