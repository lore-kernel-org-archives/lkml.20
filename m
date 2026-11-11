Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413670;
	b=3ipKfLezdW4w5dyplK4KukEMTrtWpzbyafUIMks4yUhmmDUPuz9+1Lo4+fc1anQyDrGH
	 +Kai+afz0hYpiSOvclGiCGIRTvV7UAV+vCWQKMJTgT/BCZeO2w6zDnpiVYOyCYPryvSx7
	 O2ea1kN9uWlO3yEtKT6joq//wDwz8NoSjSK5kBPg7r90vIwwotspuTryXDFgRIufEckdr
	 AWQvgL5DKtO/882aTqJ5/JoRptkRBVSc5NBR8eOK1nsy798bkuoiWQ2Ta4ZQSzxQ/Q5fh
	 Ufl6m4Xc2KICLC5XVd1XA8zuxyoM5Bi30F3r8uy/iUSQKI0SnkdnDcFKT43UAjvj7Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413670;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=waVa0swUhVILDQ3Fdt9NwC388Zn+UttTKWbxLoq2k0s=;
	b=ehtlpvbhtYOI6/21ByST0fQLgf3T0Ij/Vv7xDOa8Cm2SauBqK6H21KxwXze6Qs/sp/Fu
	 wPz5xnO2+bVLw1X4ENrOFYqxXnO92lZbCxO/yDqGVptjLtjLqi9Vtb57nj3gp9vVaosap
	 dfvcER43IIXnuH9WKB3QDad2hnOWGXg6uMO+qbiny3hPe7OIefnDMr0Wa696FwE2mLxWs
	 TK228EomX6b0qlnoaMEtCIHbOL7JMkfEbhsZ+31W7tg7xRZsnOkqmg8HW/f7ou4jr3VNE
	 BtTJIp9eNxQNG7KLeYUl4pUsvknGZVSuNnGLou07wl6AbgS6rSlym2Zh4da4PWbBF8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=To8g6BJ6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC6A606A324;
	Wed, 11 Nov 2026 16:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=To8g6BJ6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D25B1F00A07;
	Wed, 11 Nov 2026 16:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794413670;
	bh=waVa0swUhVILDQ3Fdt9NwC388Zn+UttTKWbxLoq2k0s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=To8g6BJ6/R18EgHt+BPeAHAVBQbuXk+t6aIFx2fn332bSqauYGxIX/MhTCqN4+MGd
	 ONerEaPLhIWKa6BYiQzy9Dt9em18MCRu5Z+LROMLZse3SPa18WvY1YByGKq/Q80ZVA
	 IybU0qgALTugrvS/EnJa/0gmU4kIQqopiAZHZJnggWryksTuMTqRkL+IZXxgi6S/+C
	 hDWhJWIRxfSbtd6BScuCTFZMH4NIBoOB0hE/y26arVXZ6a1H5DlUP82BcxDL1ayokQ
	 BrNA5M+ZSvTYC+LbA2xAFIBtmSz4zlZoGkfaxvlkVO5KhPcaqZhiiLy9/vmka5XMvo
	 g8MGR+fGcvhIQ==
From: Sasha Levin <sashal@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Alex Deucher <alexdeucher@gmail.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Alex Hung <alex.hung@amd.com>,
	Maxime Ripard <mripard@kernel.org>,
	amd-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org
Subject: [PATCH linux-next] drm/amd/display: give the dprx CRC test its connector state back
Date: Wed, 11 Nov 2026 11:14:27 -0500
Message-ID: <20261111161427.3274232-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <avNxxfHK_Zh2GN2o@sirena.org.uk>
References: <avNxxfHK_Zh2GN2o@sirena.org.uk>
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

The merge fixup in commit c62c2736d82f ("amdgpu: Merge merge merge
cherry-pick cherry-pick cherry-pick") dropped the call to
drm_atomic_helper_connector_reset(), which drm-misc removed. But that
call is what gave the test's connector a state, so the assert right
after it always fails now.

Create the state with drm_atomic_helper_connector_create_state()
instead, and check it before storing it: cleanup would choke on an
error pointer in connector->state.

Fixes: af8e519642bd ("Merge branch 'drm-next' of https://gitlab.freedesktop.org/agd5f/linux.git")
Link: https://lore.kernel.org/all/avNxxfHK_Zh2GN2o@sirena.org.uk/
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
The amdgpu_dm_crc KUnit suite goes from 34/35 to 35/35 with this.

 .../gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_crc_test.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_crc_test.c b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_crc_test.c
index 2b94d1bcaf62c..32b33d72dd0f3 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_crc_test.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_crc_test.c
@@ -694,6 +694,7 @@ static void dm_test_crtc_set_crc_source_dprx_connector(struct kunit *test)
 	struct amdgpu_device *adev = dm_kunit_alloc_adev(test);
 	struct amdgpu_crtc *acrtc = dm_test_alloc_crc_crtc(test, adev);
 	struct amdgpu_dm_connector *aconn;
+	struct drm_connector_state *state;
 	int ret;
 
 	aconn = kunit_kzalloc(test, sizeof(*aconn), GFP_KERNEL);
@@ -704,7 +705,9 @@ static void dm_test_crtc_set_crc_source_dprx_connector(struct kunit *test)
 	KUNIT_ASSERT_EQ(test, ret, 0);
 	ret = kunit_add_action_or_reset(test, dm_test_crc_connector_cleanup, &aconn->base);
 	KUNIT_ASSERT_EQ(test, ret, 0);
-	KUNIT_ASSERT_NOT_NULL(test, aconn->base.state);
+	state = drm_atomic_helper_connector_create_state(&aconn->base);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+	aconn->base.state = state;
 	aconn->base.state->crtc = &acrtc->base;
 	/* Balance the reference the state destroy drops for a set CRTC. */
 	drm_connector_get(&aconn->base);

base-commit: 793807ca13bf3072fc6d16ce6d90e9ab9beff2a5
-- 
2.53.0

