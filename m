Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597BA2E5B29
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 17:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788024598; cv=none; b=bUaBfUvDaMnj8z8mlq8WxR4YKIHFcnrw36mebQh5Icoh1RM6sYV8ZsPLNTvLFZ91B/D3m+XXwGMhEkWRr2s2wYMSxj67nFo9bYOzM/F8xSbPsO9diXY3NL9yjipRZ/b0NNlur63Wrjgii8qeh6YAob6ev1pjUtDJwDJLJGWKQ/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788024598; c=relaxed/simple;
	bh=LoQYd7VKaqre8qOks87R+wMsmKcrZeNVFtJmAw4spAk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dPesMH37ELMeFJAj9p5SkjXepjpPZ5N6Y55R2UG2etSkwaJTJS8z0YbIDsmZMfsPa+OdRuRyp3Jw9C85WSqYsrmT0e0dyHQ+0/wP14JNVVcb2Grx/jNtfxxl6vD5Y30e1AbjZfJoHFzYPl8FW0F+EZ5yMqW7cvyIhU78YM83OGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Is85ltsN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Is85ltsN"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B57CCC2BCB9;
	Sat, 29 Aug 2026 17:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788024597;
	bh=LoQYd7VKaqre8qOks87R+wMsmKcrZeNVFtJmAw4spAk=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=Is85ltsNVZ3Q+ZK8xjIZS5N+QTnEgMasgb0t//dUGqNw2OAAwVFsa73dsrEDTodeC
	 QAHuz8YMQi9AK88U/SC4tON+5bnEuI+SnvPfWgeqDSDKDa/AHjN7XFZKbIUOZj5u68
	 X9y50zArQ0pN7MaSIFcfm+0fNXwYMueZLCVXPze6OETM/CZyPvJVyym04dfpbBliB8
	 V57GPhanCYODJmjlZbfWdd4w2YUfVu5zh6wEmVHN5wU1Wb9GKwjcm4stFuQohnc3+n
	 4jba+BNGhlFOVxGj9xMLae+ENiBbU5k86+z6OwVfCXhvTK1GFsn11W1BHYKPNz0QFF
	 F1jViE+EfICLw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91943C61DBE;
	Sat, 29 Aug 2026 17:29:57 +0000 (UTC)
From: Maximilian Passarello via B4 Relay <devnull+git.0xMax42.io@kernel.org>
Date: Sat, 29 Aug 2026 19:29:42 +0200
Subject: [PATCH] drm/amd/display: set remote MST sink power state on
 payload changes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260829-mst-remote-sink-power-v1-1-b9eab331e0d5@0xMax42.io>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqDMBBA0avIrB2IQWzjVcSF2kk7FBOZCSqE3
 L2hy7f4P4OSMCmMTQahk5VjqOjaBrbPEt6E/KoGa+xgntbhrgmF9pgIlcMXj3iR4LYY//B9tzr
 joLaHkOf7/53mUn63RxQXZwAAAA==
X-Change-ID: 20260829-mst-remote-sink-power-ca0f7f41b909
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Maximilian Passarello <git@0xMax42.io>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2297; i=git@0xMax42.io;
 s=20251130; h=from:subject:message-id;
 bh=z7GIZHa6GjvkEEzvyXbXQn2iCrZf54tBoOQm4lCih+c=;
 b=owGbwMvMwCWWb8ayoV75uQzjabUkhqzJ4vz/IkqunV5o2zuhMGdJrLBU3wrFuSuC5RYI2RTmM
 EQkPg7sKGVhEONikBVTZOlsXTbvoRJj8/TOAG+YOaxMIEMYuDgFYCL/sxj+l3J9OtnD9EJ5WnmC
 3JLcQ683M5xwz15ekCDGyPtm06wTGQz/LLV/L8i4fuhr4cmg8EW+yget2q8wTUrQt2hkkz7jdzu
 VHwA=
X-Developer-Key: i=git@0xMax42.io; a=openpgp;
 fpr=BB652AF8176BC2EA82C83A5B025EF9E480AC8E43
X-Endpoint-Received: by B4 Relay for git@0xMax42.io/20251130 with
 auth_id=989
X-Original-From: Maximilian Passarello <git@0xMax42.io>
Reply-To: git@0xMax42.io

From: Maximilian Passarello <git@0xMax42.io>

Some downstream MST displays keep their backlight on after DPMS off because
removing the MST payload does not update DP_SET_POWER on the remote sink.

Set the remote sink to D0 before allocating its payload and to D3 before
removing it. Log AUX errors without changing the existing payload flow.

Signed-off-by: Maximilian Passarello <git@0xMax42.io>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index ab15ceec4daa..ce27024a9593 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -372,6 +372,7 @@ bool dm_helpers_dp_mst_write_payload_allocation_table(
 	struct drm_dp_mst_topology_state *mst_state;
 	struct drm_dp_mst_atomic_payload *target_payload, *new_payload, old_payload;
 	struct drm_dp_mst_topology_mgr *mst_mgr;
+	int ret;
 
 	aconnector = (struct amdgpu_dm_connector *)stream->dm_stream_context;
 	/* Accessing the connector state is required for vcpi_slots allocation
@@ -388,11 +389,23 @@ bool dm_helpers_dp_mst_write_payload_allocation_table(
 	new_payload = drm_atomic_get_mst_payload_state(mst_state, aconnector->mst_output_port);
 
 	if (enable) {
+		ret = drm_dp_link_power_up(&aconnector->mst_output_port->aux,
+					   aconnector->mst_output_port->dpcd_rev);
+		if (ret < 0)
+			drm_dbg_dp(mst_mgr->dev,
+				   "Failed to power up remote MST sink: %d\n", ret);
+
 		target_payload = new_payload;
 
 		/* It's OK for this to fail */
 		drm_dp_add_payload_part1(mst_mgr, mst_state, new_payload);
 	} else {
+		ret = drm_dp_link_power_down(&aconnector->mst_output_port->aux,
+					     aconnector->mst_output_port->dpcd_rev);
+		if (ret < 0)
+			drm_dbg_dp(mst_mgr->dev,
+				   "Failed to power down remote MST sink: %d\n", ret);
+
 		/* construct old payload by VCPI*/
 		dm_helpers_construct_old_payload(mst_mgr, mst_state,
 						 new_payload, &old_payload);

---
base-commit: 75a5e1b6b3661c3f946885d01eebeb6b031035ef
change-id: 20260829-mst-remote-sink-power-ca0f7f41b909

Best regards,
-- 
Maximilian Passarello <git@0xMax42.io>


