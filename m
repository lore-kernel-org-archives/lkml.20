Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638177;
	b=MVVit2wLpo8TXuUnwLah/XjHGGdJfbwYFmv7T8sbQAYyTStNLSWGemsF8Uw0DuZ+JDnh
	 4QrXJn4dOAsCXtZXgFFtxQELE8QK8tNvSE7U0q43fsYbFVqB4G/1TfptUr8Fj73MI7Kep
	 ZG7kJvpegaoQ1/fig07rbNhQQrHinpFuV7muRw0/WLVg7iySmnc8eCZUTVWmTGY85P7DD
	 iMyQxDkPc4sjabYYVosVxiY7w15CAuGyvr2AA7ss4fs3KwepzTDaqO9Ts9Am1UQ5gD5yr
	 dgy9ph7L+Haor3Lf+aka6xVya7QlaQBiHJeTPSSkypuWo4HKzaFPRsXU19aHPoraRrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638177;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=zVpHwEi1acfZUiGgbeCPyTxHSVjEFQmQseYO2YcJPk0=;
	b=4XsgllY1GZQ67VBaikQXYrmToNxQS4vGPZnR23Q3+rwhncGDcSHBDtBysHhxi38F6C+3
	 /4k4MHTaTwHimvB6svOZ3oC8m7WdMrBqx7ogPkiQXjkCQ8FyuSw3b5vKZbfheEJcXn8hl
	 HCXniCJhGrVfHcXu29g+CsL7hxUtHAKrFw8Tc9WdOJnQ+ldaIcnljacClQKyBmjOeooZz
	 63UuQD4yivQxuCkX2lHUe9Z1okGNpmQdPI+4pKfh97k/KKMnlcKjPL8syBLgpHe6jLMjf
	 3Av2bBOa/Gz08GxmJMurU096Lb+aJGXGH8HcUi4Ow0LYBM+x2NFimup7gw5LmzzZc0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SGSFp4cg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B081606DE97
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SGSFp4cg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D6701F00A17;
	Mon,  2 Nov 2026 16:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793638176;
	bh=zVpHwEi1acfZUiGgbeCPyTxHSVjEFQmQseYO2YcJPk0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=SGSFp4cgHWsyT1Zwmaoh2VWhsvYgwsCbG4SdEhQTzPWWYfE/MpDzcaEabYmidhImC
	 YuNMnzT7zBzsTDKJdwC3wLMp6D1v2uGPmPcS00fNymqTPInndUf9JZ1POxg+FHon/H
	 zfc0/1OWRILSY7zBBMbgtO2PtDt4Qk3b73tj/l+8NFzDzQR1HE712xDnSp/zL/92oX
	 23bt69U7Y847IwJZv2MJA316+/YVNEjSl1alG4FlbaqO2CbHIZ/87V5oMJSq31qdUk
	 v8JUayenlZY+t3zWXddlL1DrucZw9rL60wEb2tBePGWMc3ooSWF/Qh2sdJLyoCuRxz
	 0kl++LKj1UqIA==
From: "Mario Limonciello (AMD)" <superm1@kernel.org>
Date: Mon, 02 Nov 2026 10:49:20 -0600
Subject: [PATCH v10 04/15] drm/amdgpu: Check bios_scratch_reg_offset in
 backlight level helper
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-superm1-backlight-property-v10-4-b2a6f24131f5@kernel.org>
References: <20261102-superm1-backlight-property-v10-0-b2a6f24131f5@kernel.org>
In-Reply-To: <20261102-superm1-backlight-property-v10-0-b2a6f24131f5@kernel.org>
To: Maxime Ripard <mripard@kernel.org>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Harry Wentland <harry.wentland@amd.com>, 
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>
Cc: Mario Limonciello <superm1@kernel.org>, 
 Xaver Hugl <xaver.hugl@gmail.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org
X-Mailer: b4 0.16.0

Ensure adev->bios_scratch_reg_offset is non-zero before accessing
scratch registers in amdgpu_atombios_scratch_regs_set_backlight_level()
to avoid dereferencing unmapped MMIO offsets.

Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
index 27c0dc8f6137a..2d8c2ba04e670 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
@@ -1622,7 +1622,12 @@ void amdgpu_atombios_scratch_regs_engine_hung(struct amdgpu_device *adev,
 void amdgpu_atombios_scratch_regs_set_backlight_level(struct amdgpu_device *adev,
 						      u32 backlight_level)
 {
-	u32 tmp = RREG32(adev->bios_scratch_reg_offset + 2);
+	u32 tmp;
+
+	if (!adev->bios_scratch_reg_offset)
+		return;
+
+	tmp = RREG32(adev->bios_scratch_reg_offset + 2);
 
 	tmp &= ~ATOM_S2_CURRENT_BL_LEVEL_MASK;
 	tmp |= (backlight_level << ATOM_S2_CURRENT_BL_LEVEL_SHIFT) &

-- 
2.53.0

