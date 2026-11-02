Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612997;
	b=QqAMZPHa3PmnMZHqExLixXeuMORtsWkXbejye8AMiC/wIhXBQQRFQZL8mvILdqPWTD6W
	 i0+xBXHK5jj6QTgWH5lYH9Cq3g6srZj4T4P+qxpq1+2NxhKh0Q31G6Rbwac/G6u8TMgHD
	 2c1UUdlHBsTw+0z26eNL6JctOYYzJ5FBMYva0KQ+mUjjMoGi0Oo84MtqZsYs/izgshVEj
	 wS2XcCAVB/2GNjiDSPw3hJ2MJ/kvYotwz5fixcjeIYwpQGb6A7arBnUO4QWfJHbazZhHM
	 FF5oQoWOaZ016Mf7oIbZv/7fv/jpha/mnKbhpoSOiRoRGaSKrmtzVjKJrg9C/OQafaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612997;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=9FKIHAQ/E8h7h4R1mCpmlzoDTcPyVcRB9nxtDEjvxD0=;
	b=f8ic4Z7ZUhZLi+DQPgeCpw19ml83dvOz75X+qOZfBROP/lc6TdzyEZAFF/Af4mDG4KFH
	 LZoIQsh+1c4UsX6AvbymHsY83TEopgHl28QtzJe2+n4BRetDpHyQjQrAUg5VgB3ZA1JDU
	 gUuu8kkzfhGtOKkfccKijq2KpzHbs9lyPb4eEOI3a8+YW87bBtatiSuV5AiVDz1C2JHwM
	 W66qdJY6szHbEbc7OyB0A0ViseLjUQb32opxgU1HdC7pW9Qt8y9D/wVuTeC/TDz5SbUD3
	 8PuuwYFe0Sbliq70FhHGGhAo3TaVuoAQ1K1iohEXrXGSl7cqCoMCSOBKJKjHuZgU6JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Pm27GTy7;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CFD606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:49:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4CFD606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Pm27GTy7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=9F
	KIHAQ/E8h7h4R1mCpmlzoDTcPyVcRB9nxtDEjvxD0=; b=Pm27GTy7Hu7oJXMqZa
	yEWUBG05uYjMgKBxOAljN2ZJVQEDW/RhFYSBAOooN7FQ3VjYxwisvJlX3YnUKDQ7
	zvzZGD8TI5TWd57Bx7Rh9FV5kMFn1jjMrNMPqvrE+x3BeAT5exhcPHg92IrHtOhQ
	Dc6XezuBlHKX0FLRPTLlqfHIU=
Received: from pan-u.. (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgDXnzGrXOhqyJRBDQ--.20170S2;
	Mon, 02 Nov 2026 17:49:32 +0800 (CST)
From: rppxj178543@163.com
To: alexander.deucher@amd.com,
	christian.koenig@amd.com,
	simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	tzimmermann@suse.de,
	timur.kristof@gmail.com,
	lijo.lazar@amd.com,
	renpanpan <renpanpan@kylinos.cn>
Subject: [PATCH] drm/amdgpu: Only enable HDMI audio if display supports it
Date: Mon,  2 Nov 2026 17:49:29 +0800
Message-ID: <20261102094929.251563-1-rppxj178543@163.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgDXnzGrXOhqyJRBDQ--.20170S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAF43tF4rWF1rAr4xurWruFg_yoW5uFW8pr
	48Xr9YkrWkJay7K347CFykXrW5Aa4qgFyxG3yDW34fuw1qyryvg34rJFZYga4DGa95uF42
	vr1DXrW7WrnIkaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jF7KxUUUUU=
X-CM-SenderInfo: huss5yirxykkqt6rljoofrz/xtbC6QwXFmroXKwIkQAA3P

From: renpanpan <renpanpan@kylinos.cn>

The amdgpu legacy DCE audio path (dce_v6/v8/v10) unconditionally calls
audio_enable(pin, true) at the end of afmt_setmode(), regardless of
whether the connected display advertises audio support in its EDID.

This causes a phantom HDMI audio output to appear for displays that
have no audio capability (no basic audio bit, no Audio Data Block in
EDID), because the GPU sets the AUDIO_ENABLED register bit, which
drives the HDA codec's ELDV pin sense, making the codec report the
jack as audio-available.

The radeon, nouveau, and dw-hdmi drivers all gate audio enablement on
display_info.has_audio. Apply the same check to amdgpu's DCE
afmt_setmode functions.

Signed-off-by: renpanpan <renpanpan@kylinos.cn>
---
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c | 5 +++--
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c  | 5 +++--
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c  | 5 +++--
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
index f2977fe6d824..04b18056a906 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
@@ -1705,8 +1705,9 @@ static void dce_v10_0_afmt_setmode(struct drm_encoder *encoder,
 	WREG32(mmAFMT_RAMP_CONTROL2 + dig->afmt->offset, 0x00000001);
 	WREG32(mmAFMT_RAMP_CONTROL3 + dig->afmt->offset, 0x00000001);
 
-	/* enable audio after to setting up hw */
-	dce_v10_0_audio_enable(adev, dig->afmt->pin, true);
+	/* Only enable audio if the display supports it */
+	if (connector->display_info.has_audio)
+		dce_v10_0_audio_enable(adev, dig->afmt->pin, true);
 }
 
 static void dce_v10_0_afmt_enable(struct drm_encoder *encoder, bool enable)
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
index c68de0fe1d7d..585b0a50279f 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
@@ -1748,8 +1748,9 @@ static void dce_v6_0_afmt_setmode(struct drm_encoder *encoder,
 		dce_v6_0_audio_dp_enable(encoder, 1);
 	}
 
-	/* enable audio after setting up hw */
-	dce_v6_0_audio_enable(adev, dig->afmt->pin, true);
+	/* Only enable audio if the display supports it */
+	if (connector->display_info.has_audio)
+		dce_v6_0_audio_enable(adev, dig->afmt->pin, true);
 }
 
 static void dce_v6_0_afmt_enable(struct drm_encoder *encoder, bool enable)
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
index c3906270f25e..1390efa4ea51 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
@@ -1653,8 +1653,9 @@ static void dce_v8_0_afmt_setmode(struct drm_encoder *encoder,
 	WREG32(mmAFMT_RAMP_CONTROL2 + offset, 0x00000001);
 	WREG32(mmAFMT_RAMP_CONTROL3 + offset, 0x00000001);
 
-	/* enable audio after setting up hw */
-	dce_v8_0_audio_enable(adev, dig->afmt->pin, true);
+	/* Only enable audio if the display supports it */
+	if (connector->display_info.has_audio)
+		dce_v8_0_audio_enable(adev, dig->afmt->pin, true);
 }
 
 static void dce_v8_0_afmt_enable(struct drm_encoder *encoder, bool enable)
-- 
2.43.0

