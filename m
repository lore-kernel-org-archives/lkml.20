Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793788283;
	b=Me/+HagzTa/cqHl7HzyMKj10mS48FVaHqgM8v24M+ft11cmxbXTOTp742qzg/y2g2TsT
	 pt+5bCxda9iPlTn8a1nDSISIPuj3OgmYTGQZoAtbqLRZJhq1hkGe8YV9NjvlTYXCAdHD6
	 2t+WFK8oUeg5eP6HeXmH3OdkWJKNzYBCXT+pvs26a8BbFFi5hJ3eL6wyZBHCixRNKR+nW
	 M6x+oNQztO6qY07c+fxyNmBDLiBgXE2mWO98EoI7EMHFReKrE0z386Ud/nDoJdL3RgYSk
	 njN+1cgAIi64MyyGk6Tu8QhMF94Iwhu34K0oQU4o4CR9NY4+BOjVbIZs+MvfzI07c/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793788283;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=kt4A2moSSMHBdVYG/DfUXk+E7oSRQu7Jl+4l68B7FGs=;
	b=jnzULdeFO8dUsCkvWKES27PdX3s6ovgzWvJimUfENFKfQXYXRe3p/r5PGwYs2TqNYVum
	 t/99tB+4SL+hBBySlMThEjBxHJkHQNi+BO/uWaKWpaQZDA4B6/zuYgUGGG/F0PPIsWbxy
	 3F2HHlTKAp58gyZWXaZvbbdzz3a2nGJVmis3msn/zMbNUpkG0MbQqgVx3jgBVKy+I4ydC
	 CE7BKG0TZdQR57UNbqr+9HtoYs4MoJNeiPidpHSdTk+9bmBzgDutWDAeM4QcrlSTGxjdP
	 +b5bcGDzNncYHUbvOQsnwiRd2wAWLyac760bkqlypTpyaZZylwIS1oV5c7QjIoyky0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hsal.es;
	spf=pass smtp.mailfrom=hsal.es;
	dkim=pass header.d=hsal.es header.i=@hsal.es header.a=rsa-sha256 header.s=MBO0001 header.b=VxKD2Pgz;
	arc=none smtp.remote-ip=80.241.56.151
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F403E606D805
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:31:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F403E606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hsal.es
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hsal.es
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hsal.es header.i=@hsal.es header.a=rsa-sha256 header.s=MBO0001 header.b=VxKD2Pgz
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4jKMDS6dQjz8vml;
	Wed, 04 Nov 2026 11:31:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hsal.es; s=MBO0001;
	t=1793788281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kt4A2moSSMHBdVYG/DfUXk+E7oSRQu7Jl+4l68B7FGs=;
	b=VxKD2PgzivlYhIvazn2lqcbaV/nSI4lvCBbJrruMLAyiW9pDN34UFUKMZRFGgQybED7Uyz
	DL3GUw4ktO3boWJuoO8XdAHU4UaZxNi3vdd/2bqxxlvbzfGRPt62ZO+0si2CHcmvRiNMhx
	T4VZI3sA1mCU3/2UC6FQazVh6qm10wLPu6Jq+NNhuv+Gli3Th7l4vxNpEXBCJHLK5Fm+1t
	c/ZARmegzkxA34SJav8verEJzUgUJ8Z64X4PePsPEldXOI+rBAlte5MbxlZbjtzpYfA09A
	V65gochFBJFIXGF8oFOkJF6sHEitrtDz+YJY6HvlBHcOx75SxX54fjwioJvNpg==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of hugo@hsal.es designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=hugo@hsal.es
From: Hugo Sales <hugo@hsal.es>
To: harry.wentland@amd.com,
	siqueira@igalia.com,
	amd-gfx@lists.freedesktop.org,
	sunpeng.li@amd.com,
	alexander.deucher@amd.com
Cc: Hugo Sales <hugo@hsal.es>,
	mario.limonciello@amd.com,
	christian.koenig@amd.com,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	simona@ffwll.ch,
	alex.hung@amd.com,
	airlied@gmail.com
Subject: [PATCH RFC 3/3] drm/amd/display: Warn about an invalid ATIF backlight signal range
Date: Wed,  4 Nov 2026 10:31:12 +0000
Message-ID: <20261104-backlight-curve-validate-v1-3-10c688880e85@hsal.es>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104-backlight-curve-validate-v1-0-10c688880e85@hsal.es>
References: <20261104-backlight-curve-validate-v1-0-10c688880e85@hsal.es>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1536; i=hugo@hsal.es; h=from:subject:message-id; bh=qvMO4nsj48351hz80XkDZ1i6fw6G7SXA7BRR+oQTCIE=; b=owJ4nJvAy8zAJVbLU7f+5A3TBYyn1ZIYsl5zFrRei54Q/JfPNamlNPa6o5r3hn1SZ6XctKWXK GkYHtzMqNJRysIgxsUgK6bIonvDk4Fl4uSZOUXPl8DMYWUCGcLAxSkAE3m+h+GfcvKb7faWL0/4 rugpzTHt5+qcsPr0265Ce8HdwXdKUlTUGBnuC0V2NbgLCd3fnCHzSv/voo4tj+M+KXgs/9I4MbV O5QEzAPh2SB8=
X-Developer-Key: i=hugo@hsal.es; a=openpgp; fpr=193D095149CF7E8737B39064D912B0DB205A91C1
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4jKMDS6dQjz8vml

When the ATIF signal range is out of bounds or narrower than
AMDGPU_DM_MIN_SPREAD, amdgpu_dm_validate_backlight_caps() drops the
firmware caps and the driver falls back to a range of 12-255. It only
says so with drm_dbg_kms(), so a user whose brightness range changed
finds nothing in dmesg to report

Make it a drm_warn() with FW_BUG, like the custom curve warnings

Signed-off-by: Hugo Sales <hugo@hsal.es>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.c
index 3a27fb956627a..68b34654fca02 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.c
@@ -104,8 +104,10 @@ void amdgpu_dm_validate_backlight_caps(struct amdgpu_display_manager *dm, int bl
 	    caps->min_input_signal < 0 ||
 	    spread > AMDGPU_DM_DEFAULT_MAX_BACKLIGHT ||
 	    spread < AMDGPU_DM_MIN_SPREAD) {
-		drm_dbg_kms(adev_to_drm(dm->adev), "DM: Invalid backlight caps: min=%d, max=%d\n",
-			    caps->min_input_signal, caps->max_input_signal);
+		drm_warn(adev_to_drm(dm->adev), FW_BUG
+			 "ATIF: backlight signal range %d to %d is invalid, using %d to %d\n",
+			 caps->min_input_signal, caps->max_input_signal,
+			 AMDGPU_DM_DEFAULT_MIN_BACKLIGHT, AMDGPU_DM_DEFAULT_MAX_BACKLIGHT);
 		caps->caps_valid = false;
 	}
 

-- 
2.56.0

