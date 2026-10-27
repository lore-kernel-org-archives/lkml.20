Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.128.243.59
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793129771;
	b=sgQefYGZqOJ5xqRCe7MNBsmhE0qO5QutEeq4LwNHicrOp7cdtPHLuWGFUGFZpyFZYNvT
	 yJmj+sccRsi5MKSkZpnKBuYYnTcTZYwys4BPGqzwxZ3n7oRc9p5J6u2Iyh9pBVZbQhn2L
	 ND5xkme3LFYGWw56E/JQnf2UmD2RQF4K00Hxb03OCLTfzOzqiUmK1DD05V4C0mNy9UGIh
	 0Gey33aXDG+GkE6EumKPcwPKmjQHTfZJ8WPVU8NdyD+4uMLwHDko7YdOwbA0fXD4NC0nK
	 byXEvyCSbbECS/iRvaa2MMEkHGmSARKJcn1kxfrZxHOuZZ6NuDP1teCj4cBHS09DuCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793129771;
	h=DMARC-Filter:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=tgk7IXdbOqih8eAQDsDnourZpaXhEG2VbmFfylvu2B8=;
	b=x/tUUHbCKwV0drrDsITDFaholUwMh9C9dtLsk5RfiVPURim34/1dEP5PZ4b8/pk5V2Sw
	 FYjOXPF7tZcV/G6VlRIFX0bFrwrv/NRqWM6K6nv6reaenh+Xc2S5dRjAVsh1PJMBgIz3x
	 6Kng7V4mJOvV/ETis+n/NiDl8Zo9a2Lh/U8h3xj5zslBrptfXY4pq1IvHQKkczj+bLK4M
	 BMb5kauW7gG6bk+82WX9vQ2vi9H+aunTFVAwrouvsztp8XkQ1LFLMta13ESCjcKlf3dzF
	 AYTO8xtlroTCLd2cthXGc0krDgJCiQ04aYzBscPOeTd/7l9BAUVLhT5pBiV2PTcy0FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asmblr.net;
	spf=pass smtp.mailfrom=asmblr.net;
	dkim=pass header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=a44NZQeG;
	arc=none smtp.remote-ip=85.128.243.59
Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB20606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:36:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BB20606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=a44NZQeG
X-Virus-Scanned: by amavisd-new using ClamAV (26)
X-Spam-Flag: NO
X-Spam-Score: -0.625
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1793129767;
	bh=tgk7IXdbOqih8eAQDsDnourZpaXhEG2VbmFfylvu2B8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=a44NZQeGVXvMQtnl8CD6MPZv77+sz8JBGqOZ6fuYI6c3AocMLoTo9SBz3WP74xl3Z
	 hw0a6B1H6MhRwR2FrwfTVFzaIACNONm+ivocSx+7fo2q5i4EsRZ3ISzAcgnLvCUOc2
	 zem+u3rgdTYkB7rAjzXw88E5KXYQ2OxAlgtRmbjoL62wdnRJ+WzOs7Pv9R8LpqNhtA
	 E94v+OUEIo+BoUbbH9sAF0m7NEpSB9UAiQXtd+B1s6gzDShavI0/1Ssrz2Q4e/gNhB
	 VS4JE1WX5zAeGbY3Yrf5BMCu3xCv4/SpxGaNdAtLO3aoybAb5YRf7gyiry2aBADm+9
	 bgwcD409JOHjw==
Received: from milkyway (91-150-220-230.dynamic.play.pl [91.150.220.230])
	by server753313.nazwa.pl (Postfix) with ESMTP id 607B31BD830;
	Tue, 27 Oct 2026 20:36:07 +0100 (CET)
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
Subject: [PATCH 2/2] drm/amd/display: Prevent debugfs nullptr dereference
Date: Tue, 27 Oct 2026 20:35:59 +0100
Message-ID: <20261027193559.28474-2-amade@asmblr.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027193559.28474-1-amade@asmblr.net>
References: <20261027193559.28474-1-amade@asmblr.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Running
cat /sys/kernel/debug/dri/0/amdgpu_dm_dmub_trace_mask
with amdgpu card that doesn't support it leads to nullptr dereference.
Add checks to prevent that.

Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 20 +++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
index 36f32ed4b87c..3621da877efa 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
@@ -3558,14 +3558,20 @@ static int disallow_edp_enter_replay_set(void *data, u64 val)
 static int dmub_trace_mask_set(void *data, u64 val)
 {
 	struct amdgpu_device *adev = data;
-	struct dmub_srv *srv = adev->dm.dc->ctx->dmub_srv->dmub;
+	struct dc_dmub_srv *dc_dmub_srv;
+	struct dmub_srv *srv;
 	enum dmub_gpint_command cmd;
 	u64 mask = 0xffff;
 	u8 shift = 0;
 	u32 res;
 	int i;
 
-	if (!srv->fw_version)
+	if (!adev->dm.dc || !adev->dm.dc->ctx || !adev->dm.dc->ctx->dmub_srv)
+		return -EINVAL;
+
+	dc_dmub_srv = adev->dm.dc->ctx->dmub_srv;
+	srv = dc_dmub_srv->dmub;
+	if (!srv || !srv->fw_version)
 		return -EINVAL;
 
 	for (i = 0;  i < 4; i++) {
@@ -3602,13 +3608,19 @@ static int dmub_trace_mask_show(void *data, u64 *val)
 {
 	enum dmub_gpint_command cmd = DMUB_GPINT__GET_TRACE_BUFFER_MASK_WORD0;
 	struct amdgpu_device *adev = data;
-	struct dmub_srv *srv = adev->dm.dc->ctx->dmub_srv->dmub;
+	struct dc_dmub_srv *dc_dmub_srv;
+	struct dmub_srv *srv;
 	u8 shift = 0;
 	u64 raw = 0;
 	u64 res = 0;
 	int i = 0;
 
-	if (!srv->fw_version)
+	if (!adev->dm.dc || !adev->dm.dc->ctx || !adev->dm.dc->ctx->dmub_srv)
+		return -EINVAL;
+
+	dc_dmub_srv = adev->dm.dc->ctx->dmub_srv;
+	srv = dc_dmub_srv->dmub;
+	if (!srv || !srv->fw_version)
 		return -EINVAL;
 
 	while (i < 4) {
-- 
2.56.0

