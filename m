Received: from mail-dl2-f41.google.com (mail-dl2-f41.google.com [74.125.229.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB253D9DAA
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651665; cv=none; b=hO90uneDQSyfRVPKCEcXhxK3Ih0hCvIMUncDLGHehcZmN5/K5W6PSZjootTxM3MIihHrZLve8aGcKmUuxmTqVw+AaIRiViftbxR/vwTgV10HxcfSOE01qys4ydoONrGioNh30H0xgIU38w4XlOT8H6e0pHZiSJQAM8leCOs4uJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651665; c=relaxed/simple;
	bh=hdFpiNOF8xN757dPJ+Yfq6HUQHHWO1N2bbqB6MalM1U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K0DkVaPpaIVXWPOknTFYX4DtgYBc5rnritg2lbVlXE2prZ51CXwjcfGCByk6srgLCQgYeTcXlLCHyqyWRiqm/k65JLhK/n8LZTwTJV36CrKoYhCPWU5oQFU2etHz6MtaAi4iVthVmqrvA1K4M3Il1jiI0Wcbl4Rh8ZCw4SAGW6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=jiPpwOIB; arc=none smtp.client-ip=74.125.229.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="jiPpwOIB"
Received: by mail-dl2-f41.google.com with SMTP id a92af1059eb24-1474c6b7742so2140171c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 20:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1790651659; x=1791256459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XEoH4g84gk9XFCZN7uYIcwGzkc00ec8qVmnXddCOcQw=;
        b=jiPpwOIBlg1FPxW/1lUwd/gp5nJSqgYRg6d44xMYGLIdvA+LPHHkRKPkwACvGwGeAN
         u74eWwFUzRrTbDN7pbFoxO/BRmsXouBnpAuDKy9MvyMZsZjIlSn3XVrIKIV8q8cbJGsE
         S9qWkMXJW9y/KEy+LM+IV4LSoYJ919voRd6Liqdql9pyl4FAYXGdATujS2WNGmtz6w8i
         Ns9llpjNmgmYe0GYFSxJBE3aQ2mvutwqRVmzeoaGajuhyz1zKlaYMqv9AAEF8sqE5inA
         w7n/eZKCISAawaWUbubarUu9xgcUD9kKMgr2ekUCA97ZPzKhOmZRPH9IK1i20Gel6oKl
         hDeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790651659; x=1791256459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XEoH4g84gk9XFCZN7uYIcwGzkc00ec8qVmnXddCOcQw=;
        b=1ld7IDtMY00grb0Wt7+KH0ulaAH61WzFmBCsxJbnNrQVi2eXEhb+DnzojexUGekDl/
         vf7wTkzAw9sZdAlWiB1sem/BguprkP64ixuokYq8NWDZ2/sxxV4+uyVm7S3vEDQPANNl
         Hz/ewASy+uchcrpRjJ9dgPS7d1uI9qwW2CvEouYISNe2saUNDgtc5K/+SrsV5u5Dfgiu
         U1ypTDA6JD8iwUol0JTlvklvJIC6weOwEKL/4dIBEDPgop1JNQM6ZlCiZbsAjH28l3om
         weSzPdmMDPH/+nU3TIXrKzgU6W2L/wubOjshkFgX+dkz85BjfDhr4RzG40ANzhDoaxw5
         LFAQ==
X-Forwarded-Encrypted: i=1; AKwUvBxGQtb17X+5gKaqTjfwzKKHNRAIBe2lJ9+iDLi5iX5ygeZM+JuYz82HYKAOcDKOpFsPXYOP2YJPh1jKSNk=@vger.kernel.org
X-Gm-Message-State: AFuF++kA3gV8o0yNwiZFJuiVzdWguY4nw4y1C231RYZ3kUwI0os01e6i
	FDHcdKlhCl8D+mNvSlKpEfvBt1xcEpiPKtK5ljWyvsdCkMtSKueqgbzVhvewFg+R5ew=
X-Gm-Gg: AYBFou0A1xbjJdhJYhtcndKFkMgHQY1b6sx4SUNgadXtjX2OgxaVvioupNLgIg+jFXG
	wJ60O85cQfxZA5YRjRP65ksiklqITDmFs0mV8Pd7VWs0keJp69VKwMU5wb/JngyNXf5i3wjLJTO
	K3z2Dc+OM+csRULmzZTR29hYgviAxnJWctHz3zdiUt4brpM3UpNWYHb9IKKPIofeezrBcvQ3Hkc
	eyDQlknwd2Aw2juKIENyRM+PVvAlO5a22Ci3A5vFvPvc7dFNp+G0C151+vywBp243AVTd+tTu4j
	Qs13fKFD5+LRe47lZarjOJbW3NPdvHjz9sHihCnyKIxFQAl5Um2IwmtJ8ATq9a9yPzZg+aHkY8V
	KgKV1GngwM2gP9TYU2kFkM+AD9kdXiIJxeVCgK0oAjuUn4aFOvFshKgWtCLzQ2tl3y7J4Mp+K0O
	zrC77EukjKa93QVgE8mqBX1pj+zYrHCmsfCpzYzrMRwiRFo5WnATFez/kXnMCLAl5RYNMstT7vX
	4qGFGwKV5I+nlD9KGsAhRf0e17YSCzOoNjTO6eWEm/IwdyinXY+gIm1pdPerpGv5kQPGT0=
X-Received: by 2002:a05:701b:42d1:10b0:143:4710:a84e with SMTP id a92af1059eb24-146cec4be1fmr12051694c88.15.1790651659361;
        Mon, 28 Sep 2026 20:14:19 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:3481:cbb6:f339:9e4e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14a719057e1sm7529563c88.2.2026.09.28.20.14.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 28 Sep 2026 20:14:18 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Alex Hung <alex.hung@amd.com>,
	Rodrigo Siqueira <rodrigo.siqueira@amd.com>,
	Jerry Zuo <jerry.zuo@amd.com>,
	Daniel Wheeler <daniel.wheeler@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	=?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
	"Pan, Xinhui" <xinhui.pan@amd.com>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Simona Vetter <simona@ffwll.ch>,
	Rodrigo Siqueira <siqueira@igalia.com>
Subject: [PATCH 6.6.y] drm/amd/display: Check null pointers before using them
Date: Mon, 28 Sep 2026 23:14:14 -0400
Message-ID: <20260929031415.87382-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alex Hung <alex.hung@amd.com>

[ Upstream commit 1ff12bcd7deaeed25efb5120433c6a45dd5504a8 ]

[WHAT & HOW]
These pointers are null checked previously in the same function,
indicating they might be null as reported by Coverity. As a result,
they need to be checked when used again.

This fixes 3 FORWARD_NULL issue reported by Coverity.

[ Backport to 6.6.y: kept the applicable dm_state and dc_link guards; the
  vulnerable acrtc loop shape is absent. ]

Reviewed-by: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Signed-off-by: Jerry Zuo <jerry.zuo@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi Greg, Sasha, and drm amd maintainers,

I am working through the small CVE backports still missing from 6.6.y.
This one addresses CVE-2024-49922. It prevents the applicable HDCP path
from dereferencing a NULL dc_link.

The fix is already present in 6.12.y, 6.18.y, and 7.2.y, but not in 6.6.y.
This fix also affects 6.1.y, which will need a separate backport; this
submission contains only the 6.6.y patch.
The target-specific adjustment is recorded in the bracketed note above.

Could you please queue it for 6.6.y?

CVE: CVE-2024-49922
Upstream: 1ff12bcd7deaeed25efb5120433c6a45dd5504a8

AI assistance: An LLM helped identify, adapt, and validate this backport; I
reviewed the resulting code and validation evidence.

Thanks,
Artem Dinaburg

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 7c72caac7b4d71..702c9f5c3d006e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6630,6 +6630,9 @@ create_validate_stream_for_sink(struct amdgpu_dm_connector *aconnector,
 	int requested_bpc = drm_state ? drm_state->max_requested_bpc : 8;
 	enum dc_status dc_result = DC_OK;
 
+	if (!dm_state)
+		return NULL;
+
 	do {
 		stream = create_stream_for_sink(aconnector, drm_mode,
 						dm_state, old_stream,
@@ -8859,9 +8862,13 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 
 			DRM_INFO("[HDCP_DM] hdcp_update_display enable_encryption = %x\n", enable_encryption);
 
-			hdcp_update_display(
-				adev->dm.hdcp_workqueue, aconnector->dc_link->link_index, aconnector,
-				new_con_state->hdcp_content_type, enable_encryption);
+			if (aconnector->dc_link)
+				hdcp_update_display(
+					adev->dm.hdcp_workqueue,
+					aconnector->dc_link->link_index,
+					aconnector,
+					new_con_state->hdcp_content_type,
+					enable_encryption);
 		}
 	}
 
-- 
2.39.5

