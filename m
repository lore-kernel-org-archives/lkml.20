Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793745741;
	b=VFTSLn7SqWYBzQzvSXhTro7nvzkYNuYZpW5iOpI8d59ATzRylhOSoBBEljRMSONWceAd
	 e98iouqEoOoAI0FehK1Rlq7pajlDRs1P+xs19LHWkKHb8Dft9UgRzI3ck5fGr5oCoIaHC
	 5Xu0EluVUvPyjVi8Gv1FCsrkQGU7FKU02VBnzltslQkhh6d+iTSvH3lej7EPog5CmPDV9
	 lQZxrxL4E2YHPZjQc8oDS5sxJQ2n8MYX13TofgNjpa4Qyt6wgFv8yVjEJJXtmWXtA81Az
	 kZUuZEDfOd0c1I11Ae3X4IukLt9OLCZjnEMl2kD2quYU7+ARCXIe5O6KiivE/mj2hGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793745741;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=0sdOH+ree5IgSPVQKTOIGghF0UA7yYGr+BoCWpeeYkw=;
	b=OxS7HWF09u/Sn7fHZFHgTJZiO2YlKEYekl0qMwNZxPd/PSTKaowjrGkBljmK6djPAnCG
	 cAdIaz0sqi2nSxcx4lfYxZVyyKB8xzU0UDmwpzer9OqsPgKS/EZiQA0EWVrQKszFT+W7N
	 GBZLbj7Wq1gp9FHr5gSZHUgH3DjymBMZ3+MVfHcNcO0AncsyE7cw9CBY3Px/jsnAEfIn7
	 jUXNwsW7cN59uy2ESVKHfRmHmqyM7048wTHLYFYgtJ+4QazLibAZwwd0UiPg0UDijtXSN
	 ll9ppzOj9a3A4Mb/huKFfrsmcWmsUJc2RFXOD1jGh+IQfCP8OeggReNkMw+xdYaAfmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j3OODWw5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6036B606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j3OODWw5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5523B1F00A16;
	Tue,  3 Nov 2026 22:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793745741;
	bh=0sdOH+ree5IgSPVQKTOIGghF0UA7yYGr+BoCWpeeYkw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=j3OODWw5Srwk+0gbX4fyeLkLjZvFoO6R0yB4+xMzR8P/p///RRFdepCpbPXSBgM3l
	 +yNqBT9AaqMvua1u+Mi/APYqqzvs+QC5lEMqPR2VJu9jUsuGlRaK2mmH5+Z/jrQS5I
	 S2IvZmvzmEuWMHa8M5I8Yot7Mc/NF+DQP1sItWdZgS3GeQuF4pyy0XWKKo6OcJlirU
	 HXZBrslBY8ifd31JeUokHTeUfyRgHNvpfgg8mMqT4h+nIsTHwxdiRAvwVibOHwurAY
	 8VHKoF+iwJ6VVxZ/cgyd42tihAf3cQaIb/ihdiYteZrSH8HKjopnyJLihisQOReD87
	 dlHd5wuE8ChNw==
From: "Mario Limonciello (AMD)" <superm1@kernel.org>
Date: Tue, 03 Nov 2026 16:42:04 -0600
Subject: [PATCH v11 03/12] drm/amdgpu: Check bios_scratch_reg_offset in
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
Message-Id: <20261103-superm1-backlight-property-v11-3-00cce7b2ba22@kernel.org>
References: <20261103-superm1-backlight-property-v11-0-00cce7b2ba22@kernel.org>
In-Reply-To: <20261103-superm1-backlight-property-v11-0-00cce7b2ba22@kernel.org>
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
scratch registers in amdgpu_atombios_scratch_regs_set_backlight_level(),
so they are not accessed when they were never set up, such as in KUnit
tests.

Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
---
v11:
 * Clarify the commit message
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

