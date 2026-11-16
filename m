Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.182.77.61
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827270;
	b=LHa9r/4lkHoQXZfPbHmUl/5Q6u84ruWgTzIM7C2fQi9smnmPplBjc3mUoWzs7LaHw4Zg
	 wO8r6nFKfRwT70DuChbTBBM25q73urnRnG81uhJ//Esp/r4xYL21gAC7uXwztzWMpMPyG
	 QX5GlUacUE/3w5ruAPiQi/obkxcLttTdCzm/nrcOmJPuYfgBrN4qtsrNvTLZ0tmLQs5DM
	 jVqnKZ/Dfje/Uh5jCSd0dSX40sjf6Qke7sA5oGlEBlldgvlQn0nbpz/lTD5H6OT20FaTu
	 komVgumt9wJH9h2sO1wwRNFyAz0oVaUccwXzko1/VJYrzacyqkyTakeATSxV9w1EeMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827270;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
	bh=AuuueUIiwkc93LDarBEsBhq5sGdDfFqHHtz9HVXcZqw=;
	b=rqltWloBSmVRvKRi0mg0lB8MuALuoW0djA1I91Z0dhB95DaE5aS15Gk1zvIpRIsuJ+W6
	 2yBgAZTsSy2eqO3O0hmoMQ1gFbbub9vmhCZpXFFPCnYu/yBvxkmj4iN69hBas3qzXBrP5
	 up6fJifUKjNyn8b2fsBy3GvNDZ+Tu5cYw7FSPPyfXSnUIasXGX8XHKB8yhliwKnkQXfpw
	 QT0lv+O1FREzZSnRMusj8RITu+Kz2EcBDZgD7/bS5mHf58kjchzDh4J6gMQyfNC9iM5+z
	 +3z2GMO+zJAg6TzZ8xLaZXlRbctbrizeYpoeBXYsE1gU7ZzE4rlY+PjqQdGwZCQ6tUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baryla.org;
	spf=pass smtp.mailfrom=baryla.org;
	dkim=pass header.d=baryla.org header.i=@baryla.org header.a=rsa-sha256 header.s=dkim header.b=uwbzef0g;
	arc=none smtp.remote-ip=217.182.77.61
Received: from mail.baryla.org (mail.baryla.org [217.182.77.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA99606F1C6
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:07:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AA99606F1C6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=baryla.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baryla.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baryla.org header.i=@baryla.org header.a=rsa-sha256 header.s=dkim header.b=uwbzef0g
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BEDF7746115;
	Mon, 16 Nov 2026 11:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=baryla.org; s=dkim;
	t=1794827261; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AuuueUIiwkc93LDarBEsBhq5sGdDfFqHHtz9HVXcZqw=;
	b=uwbzef0g2QXZyA3dVr90FFkjATPM75oti5Tjmajl52uOBOvCMsc9zK00rDHMc3f2qTx//0
	nHMXvV8LWVlxQ8LOxYabolNEvQFpGLSwl3qq4foW0knZMA0EEv0LiZAQko6M3Fty/c64ZB
	+W1xHieJw+2WGs3i/eX3MzQjiXg3y8/IRwIXlSKir1IRuT2pzy7J+D99MjOmuL8mxflmjT
	P92Ob3gW5AmmBSYGN3vxq3kjmx/CVrXHLdPPXO4lsnGg3g/ChnAsn1FYguD7dAhefcJ8Ht
	PCfrIW3W41adMtfBLrgGzJ/6KYhKqwcQGImcfJaOzxh5lwKFWac73zLd5kSPBw==
From: =?utf-8?q?Karol_Bary=C5=82a?= <git@baryla.org>
Date: Mon, 16 Nov 2026 12:07:32 +0100
Subject: [PATCH 1/2] drm/amd/display: Skip the MST last link check for
 logical ports
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261116-mst-logical-port-v1-1-6b446ebe75e7@baryla.org>
References: <20261116-mst-logical-port-v1-0-6b446ebe75e7@baryla.org>
In-Reply-To: <20261116-mst-logical-port-v1-0-6b446ebe75e7@baryla.org>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Zaeem Mohamed <zaeem.mohamed@amd.com>, Wayne Lin <wayne.lin@amd.com>, 
 Jerry Zuo <jerry.zuo@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Karol_Bary=C5=82a?= <git@baryla.org>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

[Why]
For MST DSC without passthrough, dm_dp_mst_is_port_support_mode() reads
DP_LINK_BW_SET/DP_LANE_COUNT_SET of the output port and rejects modes
whose uncompressed rate exceeds that "last link". The value is read once
and cached on the connector.

A logical port (port number 8 and above) is the branch device's own
internal sink, such as the panel of a monitor with a built-in MST hub.
No DP link follows it, so its link configuration registers do not
describe one. A Dell U3225QE behind a USB4 DP tunnel reports its
internal link in DP_LINK_BW_SET/DP_LANE_COUNT_SET while that link is
still training: right after a hotplug the read returns RBR x1
(1257120 kbps), which prunes every 3840x2160@120 mode (28512000 kbps
uncompressed, DSC required). After a monitor power cycle the same read
happens before the channel coding is set, gives 0, and the modes are
offered. Which of the two happens depends on timing. Once training
completes the registers show HBR3 x4 (25142400 kbps), which is still
below the uncompressed rate, so re-reading instead of caching would not
help.

Since commit 0b0ff65d3ca1 ("drm/amd/display: Refactor stream
validation"), a mode rejected by this check is retried as YCbCr 4:2:2,
which fits without DSC. So instead of disappearing, the mode is offered
as 4:2:2. Every atomic check then tries RGB first, fails, and logs
"Mode Validation Warning: Viewport size failed validation."

[How]
Skip the last link check for logical ports. Physical ports keep it
unchanged.

Fixes: fa57924c76d9 ("drm/amd/display: Refactor function dm_dp_mst_is_port_support_mode()")
Closes: https://gitlab.freedesktop.org/drm/amd/-/work_items/6142
Signed-off-by: Karol Baryła <git@baryla.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 5697645ef7cc..b9ff0880d150 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -2066,9 +2066,16 @@ enum dc_status dm_dp_mst_is_port_support_mode(
 			struct drm_dp_mst_port *immediate_upstream_port = NULL;
 			uint32_t end_link_bw = 0;
 
-			/*Get last DP link BW capability. Mode shall be supported by Legacy peer*/
-			if (aconnector->mst_output_port->pdt != DP_PEER_DEVICE_DP_LEGACY_CONV &&
-				aconnector->mst_output_port->pdt != DP_PEER_DEVICE_NONE) {
+			/*
+			 * Get last DP link BW capability. Mode shall be supported by Legacy peer.
+			 *
+			 * Skip logical ports: they are the branch device's own internal sink,
+			 * so no DP link follows them and their link configuration registers
+			 * do not describe one.
+			 */
+			if (!drm_dp_mst_port_is_logical(aconnector->mst_output_port) &&
+			    aconnector->mst_output_port->pdt != DP_PEER_DEVICE_DP_LEGACY_CONV &&
+			    aconnector->mst_output_port->pdt != DP_PEER_DEVICE_NONE) {
 				if (aconnector->vc_full_pbn != aconnector->mst_output_port->full_pbn) {
 					dp_get_link_current_set_bw(&aconnector->mst_output_port->aux, &end_link_bw);
 					aconnector->vc_full_pbn = aconnector->mst_output_port->full_pbn;

-- 
2.56.1

