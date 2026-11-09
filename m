Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213565;
	b=wKgglnivVUCHFEgLxldsRJgN+eA4gFoF5KBBvzT1rcszqtrpwD5oyMSMVjqiZkPf1qm9
	 rs2oHr5zszjJvf8Y5M57HDBl6YsWb5MuLwEehgdXIaJFuIrv9E4huvsQNn5aULoB1gfoN
	 Wjkt8YV1RZpNYezCXvCwg7Tbhn9W92XbL6nJU4v3IiDs2K/TVR5R3k456N9mtd7CIUklD
	 sunRnnuUa/LkYTjGT00++83SEDDbFfReSqgXGXGhpiTKHl0RbCSLdbc1EYsHCX/7ezG0k
	 R3iS6RJ6MbJsGA4uX/Xqq7VeTQFsH5rL9w0wxZuD8t35eFiJbuRwQ+OWmOVbPyUO0Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213565;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=j4woioPd4Id4Xef47oA/Wr7zADMsvizCLXWTEMGbhN0=;
	b=cxSFOrQpQfaapQQrEnVrqrmDlQUM3agbyAWEQ8FTo9IRnDkyg5zYx0ovezNESFEPFheC
	 b4s4pxiAbt6KH6TYWf8ULl3L3feGMkHgtdydqbImfZ7Um7Yq5JDhPHTQPTySN8CxllVvM
	 ZuNNCit1NA0tyvb2xn3puWPmCvqFU6HU51+wN7hKObAEr0gecr+t4TwS53NaAj0oFq8Kh
	 8G+kV/6RS6BMM87DpV55HNJm8CviEZF5uCp4ttnP3w5goRbfEN2xMa2mXXzBMLWvEp5o8
	 H/OD+e717eR62Bgl7M2rfAefFrM/qynVDIVeEZURzlbQGYeiq7FEj6uBuT7OL0da3qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE45606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:39:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BE45606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 0b18689adc1911f19a56ed5b684f684d-20261109
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:ccdf3466-bade-4e70-bdde-89a7f4e8e66a,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:e99da3f601251e9ecbe5f7153963cfa0,BulkI
	D:nil,BulkQuantity:0,SF:102|123|850|865|898,TC:nil,Content:0|15|50|99,EDM:
	5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,A
	V:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0b18689adc1911f19a56ed5b684f684d-20261109
X-User: jiangwang@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangwang@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 577905332; Mon, 09 Nov 2026 16:39:14 +0800
From: jiangwang@kylinos.cn
To: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	linux-kernel@vger.kernel.org,
	Wang Jiang <jiangwang@kylinos.cn>
Subject: [PATCH] drm/amdgpu: Clear HDMI audio descriptors for sinks without audio
Date: Mon,  9 Nov 2026 16:39:08 +0800
Message-Id: <20261109083908.903757-1-jiangwang@kylinos.cn>
X-Mailer: git-send-email 2.25.1
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

From: Wang Jiang <jiangwang@kylinos.cn>

EDID without SAD left stale AZ descriptors; emulated ATI ELD faked
audio capability. Clear them.

The legacy implementation refers to ce9778b7a027,
"ALSA: hda/hdmi: Consider ELD invalid when no SAD is present".

Signed-off-by: Wang Jiang <jiangwang@kylinos.cn>
---
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c | 7 ++++++-
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c  | 7 ++++++-
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c  | 6 +++++-
 3 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
index f2977fe6d824..f967ee505271 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
@@ -1341,8 +1341,13 @@ static void dce_v10_0_audio_write_sad_regs(struct drm_encoder *encoder)
 	sad_count = drm_edid_to_sad(drm_edid_raw(amdgpu_connector->edid), &sads);
 	if (sad_count < 0)
 		DRM_ERROR("Couldn't read SADs: %d\n", sad_count);
-	if (sad_count <= 0)
+	if (sad_count <= 0) {
+		/* sink has no audio capability: clear stale descriptors */
+		for (i = 0; i < ARRAY_SIZE(eld_reg_to_type); i++)
+			WREG32_AUDIO_ENDPT(dig->afmt->pin->offset,
+					   eld_reg_to_type[i][0], 0);
 		return;
+	}
 	BUG_ON(!sads);
 
 	for (i = 0; i < ARRAY_SIZE(eld_reg_to_type); i++) {
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
index c68de0fe1d7d..18c171c533de 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
@@ -1320,8 +1320,13 @@ static void dce_v6_0_audio_write_sad_regs(struct drm_encoder *encoder)
 	sad_count = drm_edid_to_sad(drm_edid_raw(amdgpu_connector->edid), &sads);
 	if (sad_count < 0)
 		DRM_ERROR("Couldn't read SADs: %d\n", sad_count);
-	if (sad_count <= 0)
+	if (sad_count <= 0) {
+		/* sink has no audio capability: clear stale descriptors */
+		for (i = 0; i < ARRAY_SIZE(eld_reg_to_type); i++)
+			WREG32_AUDIO_ENDPT(dig->afmt->pin->offset,
+					   eld_reg_to_type[i][0], 0);
 		return;
+	}
 
 	for (i = 0; i < ARRAY_SIZE(eld_reg_to_type); i++) {
 		u32 value = 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
index c3906270f25e..62922736d569 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
@@ -1313,8 +1313,12 @@ static void dce_v8_0_audio_write_sad_regs(struct drm_encoder *encoder)
 	sad_count = drm_edid_to_sad(drm_edid_raw(amdgpu_connector->edid), &sads);
 	if (sad_count < 0)
 		DRM_ERROR("Couldn't read SADs: %d\n", sad_count);
-	if (sad_count <= 0)
+	if (sad_count <= 0) {
+		/* sink has no audio capability: clear stale descriptors */
+		for (i = 0; i < ARRAY_SIZE(eld_reg_to_type); i++)
+			WREG32_AUDIO_ENDPT(offset, eld_reg_to_type[i][0], 0);
 		return;
+	}
 	BUG_ON(!sads);
 
 	for (i = 0; i < ARRAY_SIZE(eld_reg_to_type); i++) {
-- 
2.25.1

