Received: from sg-2-4.ptr.blmpb.com (sg-2-4.ptr.blmpb.com [71.18.227.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2F03911C6
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 20:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=71.18.227.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787777115; cv=none; b=AExVoW+qOBWxcAnP6b8rgvLxdA2kBeffg1PtMlgJy3J/HHQwh2HOD9N1ndBM2sT9IbkTD+dll5MXkWUsQOislqUFyZ0mWV2HvduSzUTkV/gJDP1pRszh9dDK9S1LyvJWWsuOabevxL9tgdew44dg6xqa6tf2staOYDdAo9ju55U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787777115; c=relaxed/simple;
	bh=tlj0SUV/f09JEfBSsUYSMEtpmy0E48ZwT1oP5fHC82Q=;
	h=In-Reply-To:Cc:From:Mime-Version:To:Message-Id:References:Subject:
	 Date:Content-Type; b=GNbgpogoxjD3oh52sXZw3SZtRkmizJUCums2Yry481F+UEJJYe2ppJV36lBNGN/IeEvmNK5Ftnjw/odd6VCZ/32EG8J2rB6p57LwD8LLCmyb1grHYREMCJ+08i5oY+vECiiUxcDiX2cQyFf6BSMmXo//6Z7pnhZD/10xTpWUyzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=imm0nv1nhtv.is-a.dev; spf=pass smtp.mailfrom=imm0nv1nhtv.is-a.dev; dkim=pass (2048-bit key) header.d=imm0nv1nhtv.is-a.dev header.i=@imm0nv1nhtv.is-a.dev header.b=Gmhr/96e; arc=none smtp.client-ip=71.18.227.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=imm0nv1nhtv.is-a.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imm0nv1nhtv.is-a.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imm0nv1nhtv.is-a.dev header.i=@imm0nv1nhtv.is-a.dev header.b="Gmhr/96e"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=lark2602131731; d=imm0nv1nhtv.is-a.dev; t=1787777104;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=g06uOZVXmJELdMYnWTo6U5rOWHksszgpcnk9cEV3ZX0=;
 b=Gmhr/96eKSU180TupDguNw15Nr6oeONU3wOkfthjKFtO1/4AaBAv8HdC1hyEGP6yyXtwxH
 yf+4hhV4w8XM9LgZ2CZs1U3rKQz3E6ougNC53s5mKEwUMHa05l8Bdw9JE5OShlUcPltRfc
 XnKF/Zmzh8QW2UBpGKLETwSkcMm0L3dgUtaqHH8wrSHa8VnKFuha8P3+sEbBfC3oFfwyHx
 Qrq0VrmUmqZW2M8ctako4fH3t0pshisbKFhAHV9k3t4P71+VZWZzZnOHAi03asMDy6ubur
 Vb6hkW7Uoqo0ypaJO3FGjR+DWFeJkW//a7GZdjWW4aMf88f4yfa48Rz7e5efiQ==
In-Reply-To: <20260826170549.21985-1-neptune@imm0nv1nhtv.is-a.dev>
Content-Transfer-Encoding: 7bit
X-Lms-Return-Path: <lba+26a8f504f+f9cc6b+vger.kernel.org+neptune@imm0nv1nhtv.is-a.dev>
Cc: "Rodrigo Siqueira" <siqueira@igalia.com>, 
	"David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, 
	<amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, 
	<linux-kernel@vger.kernel.org>, 
	"NepNep7601" <neptune@imm0nv1nhtv.is-a.dev>
From: "NepNep7601" <neptune@imm0nv1nhtv.is-a.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Original-From: NepNep7601 <neptune@imm0nv1nhtv.is-a.dev>
To: "Harry Wentland" <harry.wentland@amd.com>, "Leo Li" <sunpeng.li@amd.com>, 
	"Alex Deucher" <alexander.deucher@amd.com>, 
	=?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Message-Id: <20260826204457.4666-1-neptune@imm0nv1nhtv.is-a.dev>
X-Mailer: git-send-email 2.47.3
References: <20260826170549.21985-1-neptune@imm0nv1nhtv.is-a.dev>
Received: from Neptune-PC.kiko-royal.ts.net ([58.186.164.158]) by smtp.larksuite.com with ESMTPS; Wed, 26 Aug 2026 20:45:02 +0000
Subject: [PATCH v2 1/2] drm/amd/display: skip receiver power control without AUX
Date: Thu, 27 Aug 2026 03:44:56 +0700
Content-Type: text/plain; charset=UTF-8

Passive DP to TMDS dongles do not provide a DP receiver and use native
GPIO I2C rather than AUX. The normal link PHY and stream blanking paths
nevertheless try to write DP_SET_POWER, causing the DP helpers to retry
a transaction that cannot succeed 32 times before giving up.

Gate the receiver-power calls in dp_enable_link_phy(),
dp_disable_link_phy() and link_blank_dp_stream() on the post-detection
aux_mode state. Keep dpcd_write_rx_power_ctrl() unchanged because early
DP detection calls it before aux_mode is initialized, and active dongles
may require the receiver power-up before DPCD reads.

On an Oland GPU with a passive DP to HDMI to DVI chain, this reduced
boot-time "DP AUX transfer fail" messages from 32 to 0. The EDID
remained 256 bytes and the display continued to use its native
1600x900 mode.

Assisted-by: Claude:claude-opus-5
Assisted-by: Codex:gpt-5
Signed-off-by: NepNep7601 <neptune@imm0nv1nhtv.is-a.dev>
---

Notes (amdgpu-followups-v2):
    v2:
    - Move the aux_mode check out of dpcd_write_rx_power_ctrl() so early
      detection can still power active dongles before reading DPCD.
    - Gate receiver-power writes at the normal PHY and stream-blanking call
      sites.
    - Retest the revised placement on the affected Oland system.
    
    v1: https://lore.kernel.org/r/20260826193602.6441-1-neptune@imm0nv1nhtv.is-a.dev

 drivers/gpu/drm/amd/display/dc/link/link_dpms.c        |  6 ++++--
 .../drm/amd/display/dc/link/protocols/link_dp_phy.c    | 10 ++++++----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/link/link_dpms.c b/drivers/gpu/drm/amd/display/dc/link/link_dpms.c
index 48b086d15ab0..81d63e1aab53 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_dpms.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_dpms.c
@@ -146,8 +146,10 @@ void link_blank_dp_stream(struct dc_link *link, bool hw_init)
 				}
 		}
 
-		if (((!dc->is_switch_in_progress_dest) && ((!link->wa_flags.dp_keep_receiver_powered) || hw_init)) &&
-			(link->type != dc_connection_none))
+		if (link->aux_mode &&
+		    !dc->is_switch_in_progress_dest &&
+		    (!link->wa_flags.dp_keep_receiver_powered || hw_init) &&
+		    link->type != dc_connection_none)
 			dpcd_write_rx_power_ctrl(link, false);
 	}
 }
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_phy.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_phy.c
index 49521ac4b0e8..24f09bdcab51 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_phy.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_phy.c
@@ -65,7 +65,8 @@ void dp_enable_link_phy(
 	link->cur_link_settings = *link_settings;
 	link->dc->hwss.enable_dp_link_output(link, link_res, signal,
 			clock_source, link_settings);
-	dpcd_write_rx_power_ctrl(link, true);
+	if (link->aux_mode)
+		dpcd_write_rx_power_ctrl(link, true);
 }
 
 void dp_disable_link_phy(struct dc_link *link,
@@ -74,9 +75,10 @@ void dp_disable_link_phy(struct dc_link *link,
 {
 	struct dc  *dc = link->ctx->dc;
 
-	if (!link->wa_flags.dp_keep_receiver_powered &&
-			!link->skip_implict_edp_power_control &&
-			link->type != dc_connection_none)
+	if (link->aux_mode &&
+	    !link->wa_flags.dp_keep_receiver_powered &&
+	    !link->skip_implict_edp_power_control &&
+	    link->type != dc_connection_none)
 		dpcd_write_rx_power_ctrl(link, false);
 
 	dc->hwss.disable_link_output(link, link_res, signal);
-- 
2.47.3
