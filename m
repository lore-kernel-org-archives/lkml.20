Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794284546;
	b=TX4npeEiun/PvSO8IFVqDAMXnRUyvvWr270Idj/wdBremWJy1doioQYLfEpbvG2m8YtV
	 K3C1y7gURRPEpl39/ONtFQ16X6uEuUCfkIiyO94CTaAVf2uJ2pfzw7cgRPMDM+7l70mwI
	 pF/ftSmgMjxZxbMYgC50KT/beNliYlp7pVxvyC7BuGKjjOAqkjVz5hncjp+81ZfjCqH7/
	 w75xChm9+8ThmCcj7BAltSgdMByklsn+SHoSsI2alRHhKuPd1fhrmWciiEtZQvXqHWkYQ
	 iW0hBF+Mne2SgCQ1u/56oqiuBdBuFxxipKghCBDPjeqyJptchva5bHsxt7jYThxLjEA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284546;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=LCXfBXoBkq6t3mYKm+JlVW6wBSa3TsXNv/yoRQ2fvIA=;
	b=2FefX0FLdHPEES/jU1Og/Lrs7i6/MVWAzv4bxppplrV7PfDevkpC4DRmIaiejjZlJcI7
	 3V+jNTYtL4xZPOBez+uu9I4FDbnswxN2dF9e4Lr5LnuHG/Hp0XLiGlDzkE6GEqJNxN6Zj
	 qLkEU5QVqwmP0r0Jv+04eULCJSJrsxwdUrjYcHKxSqBr+AGbTdwP4I/sfyu6ZXDVVHhK/
	 nmVlbwFqDYwo2MoBLOgGbRz+eZrWcDKt1QGU9djer7Q/Hw5j3U4ZFzaKgjuBzHL9zQ06A
	 qbvg+jnsgJK3QOhAGiMTadM8Gq4XZbDO22XS6C3NAil3qSSBDL5ETxJSLqKx7ehXKCw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QQeZ9yQl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D18606A9D1
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QQeZ9yQl
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794284545;
	b=Dbj6a/XwegkIekw+/IQnbhp4wnaeBuc6oCPwHs7bMz39YD5T5m368tduXOtnS+1IoaPC
	 VwI0FWvTrH60uN6aGcyNv3xxvBois5muPhFNpNKSZnZmkHr5CEsM0AdybbjMhNDmBauDB
	 i984zzRtKRripOG6BWd8hua+ikijt4Galy8zUxeUcY/ibHh60f2J04xn91iwgMEQmmoOP
	 HPEqVypjVPI+4xIeHykXhwn21/9UOwuGTmgsu+TfclzGiWJWFWxfRN/sp5urNLnTz2CvM
	 wAsdwy6T5GkgkdgWS8vF55mJHwO9xktsmwU/pWf7hv9YBDrSL9T6k03Fgy59D3FTkow==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794284545;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=LCXfBXoBkq6t3mYKm+JlVW6wBSa3TsXNv/yoRQ2fvIA=;
	b=vEvrHcqrBkpGUg7qlmD2Tk7MmtzZsUJc7a0/TF4vEn3rT8XqV9clhQV4Cc04w4IrEz6+
	 dC3BiJZGFfikOUOMdFjFF4bKwgJ58gGdYm2XyVUZHXjMVe2dtulvp51odMjjJlzkL/l11
	 zVxTybqvi/cMcp9l99/DUBASto2TsT73qo9WD6nX85f5FnO5fOv/9YU9pcrnt/YT0PHPH
	 0kGCrywQqkWWamMTwgAiekAIvd9eUCYoV9u1R9LVZcq41/9Q4YNfNhVdmxSkGx1rYHjPm
	 nmT7olbvECNloGOgHMfpb1DPQk2nUMTV0gqAodyQtNGPvCGFHqXnNXJ5BOZKhjjgKGg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 11FB31F008A4;
	Tue, 10 Nov 2026 04:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794284545;
	bh=LCXfBXoBkq6t3mYKm+JlVW6wBSa3TsXNv/yoRQ2fvIA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=QQeZ9yQlqMzSu2921l4AOrOE2maNL0FY9G5Z4gDJ1r1WuldJUcwFZl7fTsyzL6/KI
	 pPLaJYxzFHZR7/XZmUSf6ivIPl0i1IU3Iw0H6SVK+/38An5wJ2/OdEJBMu8zVVWrLk
	 LaiRCbyqJt1Wz8MnrVlJ+S4NyrRDG3Lykw6j74D90Svq0876RBXDBfNPy/Tk3VQdU5
	 Xct+pfZh5o7RhOtIYYNJeP3UK69dr+8ITU7AQdRqif581olhTkUak1qvHQMOhMJP+n
	 E4sKc+cRvnEA1hIT3tYpsmvMYffYJxmS/3wK1AFT39ryCqtYdWY3yyzuPtDO727I8T
	 2tGXmCXyUYFjw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8F80448847;
	Tue, 10 Nov 2026 04:22:23 +0000 (UTC)
From: =?utf-8?q?Eren_=C3=96zen_via_B4_Relay?= <devnull+erenozen.protonmail.com@kernel.org>
Date: Tue, 10 Nov 2026 07:21:58 +0300
Subject: [PATCH 3/3] drm/amd/display: Don't queue FRL status polling on a
 NULL workqueue
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
Message-Id: <20261110-frl-polling-wq-teardown-v1-3-0ff028d5c35b@protonmail.com>
References: <20261110-frl-polling-wq-teardown-v1-0-0ff028d5c35b@protonmail.com>
In-Reply-To: <20261110-frl-polling-wq-teardown-v1-0-0ff028d5c35b@protonmail.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Fangzhi Zuo <Jerry.Zuo@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Eren_=C3=96zen?= <erenozen@protonmail.com>, 
 timur.kristof@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794284542; l=1442;
 i=erenozen@protonmail.com; s=20261110; h=from:subject:message-id;
 bh=wLsy0qXzGivFIS3RenLXXCnUX13c+lf2i/HaM9PsxK8=;
 b=mR+ljlJwk2WHYubtbTwRbaDnmBRskhXtjq5q620BGufNFrws1x9+Eh96bJeVCjWQqvlfWV7ME
 7k6oDP58V+lAirwDZ3KlPRpCE5oku0XdIw3J8IiZEdO+cDrVPMbRbFD
X-Developer-Key: i=erenozen@protonmail.com; a=ed25519;
 pk=tPAwfVmIbYF3QziJ3LcoTIZDU12BsjVK+EkAB9nN1gA=
X-Endpoint-Received: by B4 Relay for erenozen@protonmail.com/20261110 with
 auth_id=1479
X-Original-From: =?utf-8?q?Eren_=C3=96zen?= <erenozen@protonmail.com>
Reply-To: erenozen@protonmail.com
Content-Transfer-Encoding: 8bit

From: Eren Özen <erenozen@protonmail.com>

If create_singlethread_workqueue() fails in amdgpu_dm_init(), the
driver only logs an error and continues with
hdmi_frl_status_polling_wq set to NULL. The next atomic commit that
enables an HDMI FRL stream then passes that NULL pointer to
queue_delayed_work() and crashes.

Skip the polling when the workqueue is missing, the same way
amdgpu_dm_atomic_commit_tail() already checks vblank_control_workqueue
before using it. FRL link status is then not polled, but the display
keeps working.

Fixes: 5c9b8b27a883 ("drm/amd/display: Tie FRL support into amdgpu_dm")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Eren Özen <erenozen@protonmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index fed1893d2f..798e4401fe 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -4769,7 +4769,7 @@ static void amdgpu_dm_commit_streams(struct drm_atomic_commit *state,
 			break;
 		}
 	}
-	if (frl_stream_found) {
+	if (frl_stream_found && dm->hdmi_frl_status_polling_wq) {
 		if (queue_delayed_work(dm->hdmi_frl_status_polling_wq,
 				       &dm->hdmi_frl_status_polling_work,
 				       msecs_to_jiffies(dm->hdmi_frl_status_polling_delay_ms)))

-- 
2.56.0


