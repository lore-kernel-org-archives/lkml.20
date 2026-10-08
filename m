Received: from out162-62-58-216.mail.qq.com (out162-62-58-216.mail.qq.com [162.62.58.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C463D3D10
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 07:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791443911; cv=none; b=e9G4uF0+qbIfRFzNvdVdlUHTXo2S5kC9YHf0EbK0d9ELxhWqRYtuQLTeBIjXc92B1+6rOLFY0ZlNh6Q08syaDKTD1EP0dERv15ciNZD9jFoJhu3rEtKxmhYKim30BsFzLON+gcpo8va1chl2F0Wv9zxRjyW/qtlQ+dCsTBaKyYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791443911; c=relaxed/simple;
	bh=Tm4jORhI7IEyUkw46/SegmjkclkxI+Mk6fNzU7aW0z0=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=tBaH6zWkLAalQXbJodor67DD9rWBnL7y2r8cQrL11yKIFKsahhZzVnBgC0K2PD9bm3rA9eJ4JfJYelLrLBmyzNPJot/jo77rlqXsJiMLySaCwJ6R+UNxutwCGWLJylaXCC7bvkfBhksxib7gm21U+G0wFbOzGgoLg+1nzC8357k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=ZvmPe0Ps; arc=none smtp.client-ip=162.62.58.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="ZvmPe0Ps"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1791443902; bh=sreDjZGN4iJ6Q8M30dPEfcFFqZ5X8EpBZSulDGx0qKc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZvmPe0PskZdH9m6nk17nI+AaorQ0PZmrkh/HRc1pfqITZTmOR0Vg+Izg7WnNxUvjT
	 Eov08kqiGsSiNHpjq05d0ARAkb2TlQRpfUQJRQf1prScCC6CDi804+Vwnb2p+0V1jd
	 pYFteA9cTMFn1SC+sXg1VFHDUUnLKp4E8rZvBI1g=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 4428A614; Thu, 08 Oct 2026 15:17:02 +0800
X-QQ-mid: xmsmtpt1791443825tnemekuqj
Message-ID: <tencent_34284E790157CA20C27C9260A7A32C08C10A@qq.com>
X-QQ-XMAILINFO: NwpXcT7OGK/ncCyqW3LGxaQA3fmWcmGR1Sc0eoivEINM2CL43lszcAzCg+rGrP
	 x9b9rFxDDJ+qpKKP0OjY166WQnf1ovFhPQ07Wsmk23fTybVlK5gKq6Z4YpC851KZ2YRX2spr2xvE
	 srwZHia3/Y1qTmavPRxDYUiM6oFU3YP7gWDbQnX6oiM/+Af1oKrhmmDrx/rTWF7fWmqN2BXjVcmF
	 frFpd6v1BuC62W7V9ov1HUw8y4zx8NgJHthEGNzX1uCt8uSZHgVCBtNH3+3WJLE4zL7Y6+mZktej
	 cJqHgFnoW52oBVvbVlkutultR9gx9hN9/6/xDSUF4GrPiTgOOBCl0ifPYtgEBk+aSyElmRNqRNos
	 YSdgrjj49vnoDGvLdsDA4gkYzpnWvLfmzYGyuEQbQsAXet8I9EP5utuCPZQWTwDwtOhIVtpJgH3x
	 Re2jELf7z8jxR9fsSJhTOY+MMLewkSTNYP1pB9muzrV8SHOYfiHZYum4X/WIHDOSzRiKfWfDViwX
	 6KSrj5gm5iE8T/55zI3N7md7TP1+BvGAM681WJSl+IcdoKCvwAkvJ70MuUZmXSI/r29BKSf9opln
	 IgpMQgFnn5ttKjQySl6jRcVfCKsyM+nWz/qez3C6wvAZeV3ghVTa82zwFKuF93zPRr1KElsgE2QM
	 NTOAMd+x7JQN/RiuWAcLPSe+1Q7/Fp1ywNZHn5jCAt9Z/Ruhe5O12CaulhAtbHhZZRg4LkWRyO9b
	 aW+Q5YGg9JinfAmTTePf+ZAKy9DSlGw/mN9XGh3q1zsWMkYLRQTgQ9FQPLQQYj1+mf+YoYftv+qw
	 NlXz/z1hDBKWQkyc3jPaob4nrWR76Z984nwuSqDrha7qiwgMwfMhyfasZuN47mIa9b0eFshB6ZKg
	 NgQpXbpG/X+ifqHXojB7iNBlOlkUjewd8CpSTlKOq7ofouK64bDj6IvEI7fw2s3FJ77gzr0b/NOk
	 3dKtlX657bZzddBx4QQQCnyB4o5wcTclymQQ8ixLCUHj/voWyMUxpuxtpIbFtI/jDH5WwiL90s1S
	 /fHP41g4I20L1Bi9xfYOCW1RDw7M0hefUjTizhkjBkBUOV6St7
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: 2564278112@qq.com
To: Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org
Cc: Alex Hung <alex.hung@amd.com>,
	Mario Limonciello <superm1@kernel.org>,
	=?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>,
	Ray Wu <ray.wu@amd.com>,
	Ivan Lipski <ivan.lipski@amd.com>,
	Lu Yao <yaolu@kylinos.cn>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Wang Jiang <jiangwang@kylinos.cn>
Subject: [PATCH] drm/amd/display: Don't ignore dc_commit_streams() failures
Date: Thu,  8 Oct 2026 15:17:00 +0800
X-OQ-MSGID: <20261008071700.552056-2-2564278112@qq.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261008071700.552056-1-2564278112@qq.com>
References: <20261008071700.552056-1-2564278112@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wang Jiang <jiangwang@kylinos.cn>

dc_commit_streams() can fail and leave the streams half committed, but
amdgpu_dm_commit_streams() and the reset recovery path in dm_resume()
only emitted a WARN_ON() and continued.  The planes are then programmed
against a stream list that the hardware never took, which turns a
recoverable commit failure into a crash.

Log the failure and stop programming further stream/plane state in
amdgpu_dm_commit_streams().  In dm_resume(), keep the WARN_ON_ONCE() for
the stack trace, but continue the reset recovery as before.

Signed-off-by: Wang Jiang <jiangwang@kylinos.cn>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 20 +++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index c4c8904fea42..d88bd89da840 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1916,7 +1916,12 @@ static int dm_resume(struct amdgpu_ip_block *ip_block)
 		commit_params.streams = dc_state->streams;
 		commit_params.stream_count = dc_state->stream_count;
 		dc_exit_ips_for_hw_access(dm->dc);
-		WARN_ON(!dc_commit_streams(dm->dc, &commit_params));
+		if (dc_commit_streams(dm->dc, &commit_params) != DC_OK) {
+			drm_err(adev_to_drm(adev),
+				"DC failed to commit %u stream(s) during reset recovery\n",
+				(unsigned int)commit_params.stream_count);
+			WARN_ON_ONCE(1);
+		}
 
 		dm_gpureset_commit_state(dm->cached_dc_state, dm);
 
@@ -4619,7 +4624,18 @@ static void amdgpu_dm_commit_streams(struct drm_atomic_commit *state,
 	dm_enable_per_frame_crtc_master_sync(dc_state);
 	mutex_lock(&dm->dc_lock);
 	dc_exit_ips_for_hw_access(dm->dc);
-	WARN_ON(!dc_commit_streams(dm->dc, &params));
+	if (dc_commit_streams(dm->dc, &params) != DC_OK) {
+		mutex_unlock(&dm->dc_lock);
+		/*
+		 * DC refused the stream list, so the hardware and the DC state
+		 * no longer agree. Bail out instead of programming more
+		 * stream/plane state for a half committed stream list (this
+		 * used to be a silently ignored WARN_ON()).
+		 */
+		drm_err(dev, "DC failed to commit %u stream(s)\n",
+			(unsigned int)params.stream_count);
+		return;
+	}
 
 	bool frl_stream_found = false;
 
-- 
2.25.1

