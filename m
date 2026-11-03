Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793745739;
	b=X9zUEBWcLt4cnrDYrjIp/Z3nqU0LVb9lLjWQ8MxLowKjSOacOdW6ygaJjTURu2edaeOn
	 XJApsXP/6nvJyDXZs5OhgnVR6KemlM6V0WCUAVJhuwb2pwLAUxaFRtEOtfVa+iza6Ftxz
	 EjoX4cKjtOTaHtnGjQu43LVUVO1loG7Irvo08LxBXpy1vRvk1VpjXXGaciUnn+lVxV+Ce
	 Gz09E/91DQnUQDbOTiwvaOJNjnz/Dt1wni60/gupS0ie/8EpiUnTWElUxGI37M+VoFRxL
	 JOmv0yRUK2Y5YM+mUdN6vuowLd59zk1VYd997GrS61FGdTKsmI+JM1mZ/Uw9rDTZdew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793745739;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=qVqLMAowWNNhyYo56lksEAIwVw7s3n3V0O+bkJsZopw=;
	b=FHGXeFItdP/DWrrodFfhSHa1fhe5l3+2aoygCxdRx0MBoL7FNAY53qONvH2Cc01KUfIw
	 K++B7s/+duBv03W7+CC9PVNzSM1sgQ1sTnLX5Qku1VZ3DraQ9lbAKqm4bpvxSSpdqzp72
	 QnmIAOBUZFr+ppTb20OpPcn2HqwCdDuB132Zfxat2sIKygXkFEJ/tX/oyZvYKM5fztrPu
	 rG5YfbisjXY8VZJf6e6mxk4dkTxW3ggQob+greAyiZJcfjL4L3YJhuG8LLFII5sRVbXHl
	 tDS+ja6gTtmn6fuJyrX1Nwb/1uIoEQYx/0j5i49lwp13XHugUerHIssxCFLM0JJ4kkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iftOeaxG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F6C606A337
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iftOeaxG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67A971F00A02;
	Tue,  3 Nov 2026 22:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793745739;
	bh=qVqLMAowWNNhyYo56lksEAIwVw7s3n3V0O+bkJsZopw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=iftOeaxGfx9EBOch2JcelLX5nfcthifD4mkbDaBsSwmWLBT/s7L37c3nX/QzFFe6r
	 qC4K7QbarNyv55yrvsV/8cQ7U1LyDD1ifRlTd/ETfHEF6xYGu3Qwo0DxD7LcPFwpu+
	 PKzvIkHU98UVMtON+Cy9Ut/H4mquUjLPx3x58fJrfIySPPiIkgS02A6DZ+dZ8Lzv6Y
	 lHhuyqz2Zu3LrIR+PUphpC6Sw/8rOWan5Z+K23HsfRdkMvP8iDK6I76jHda42rdmfA
	 F5oWG7NeG6eKljVQHqUNrYo4SytuyJxj7+3t211LL8Ub/+lSRPn6yOy7qgCBox7XZv
	 KZoiaUa9hj8VA==
From: "Mario Limonciello (AMD)" <superm1@kernel.org>
Date: Tue, 03 Nov 2026 16:42:03 -0600
Subject: [PATCH v11 02/12] drm/amd/display: Pass up errors reading actual
 brightness
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
Message-Id: <20261103-superm1-backlight-property-v11-2-00cce7b2ba22@kernel.org>
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
 nouveau@lists.freedesktop.org, 
 Mario Limonciello <mario.limonciello@amd.com>
X-Mailer: b4 0.16.0

From: Mario Limonciello <mario.limonciello@amd.com>

[Why]
If the DC API fails to return actual brightness when backlight control
API requests it, then the wrong value may be returned.

[How]
Change return type of amdgpu_dm_backlight_get_level() to an integer
and pass an error code up to the caller.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.c | 13 +++++++++----
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.h |  2 +-
 .../amd/display/amdgpu_dm/tests/amdgpu_dm_backlight_test.c  |  4 ++--
 3 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.c
index cb74b00723fda..0f664c658a127 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.c
@@ -438,7 +438,7 @@ int amdgpu_dm_backlight_update_status(struct backlight_device *bd)
 EXPORT_IF_KUNIT(amdgpu_dm_backlight_update_status);
 
 STATIC_IFN_KUNIT
-u32 amdgpu_dm_backlight_get_level(struct amdgpu_display_manager *dm, int bl_idx)
+int amdgpu_dm_backlight_get_level(struct amdgpu_display_manager *dm, int bl_idx)
 {
 	int ret;
 	struct amdgpu_dm_backlight_caps caps;
@@ -451,14 +451,14 @@ u32 amdgpu_dm_backlight_get_level(struct amdgpu_display_manager *dm, int bl_idx)
 		u32 avg, peak;
 
 		if (!dc_link_get_backlight_level_nits(link, &avg, &peak))
-			return dm->brightness[bl_idx];
+			return -EINVAL;
 		return convert_brightness_to_user(&caps, avg);
 	}
 
 	ret = dc_link_get_backlight_level(link);
 
 	if (ret == DC_ERROR_UNEXPECTED)
-		return dm->brightness[bl_idx];
+		return -EINVAL;
 
 	return convert_brightness_to_user(&caps, ret);
 }
@@ -469,8 +469,13 @@ int amdgpu_dm_backlight_get_brightness(struct backlight_device *bd)
 {
 	struct amdgpu_display_manager *dm = bl_get_data(bd);
 	int i = amdgpu_dm_backlight_get_device_index(dm, bd);
+	int ret;
+
+	ret = amdgpu_dm_backlight_get_level(dm, i);
+	if (ret < 0)
+		return dm->brightness[i];
 
-	return amdgpu_dm_backlight_get_level(dm, i);
+	return ret;
 }
 EXPORT_IF_KUNIT(amdgpu_dm_backlight_get_brightness);
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.h
index 9ad888d3ae7b2..891749322191c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.h
@@ -57,7 +57,7 @@ void amdgpu_dm_validate_backlight_caps(struct amdgpu_display_manager *dm, int bl
 struct dc_stream_state *dm_find_stream_with_link(struct amdgpu_display_manager *dm,
 						 struct dc_link *link);
 int amdgpu_dm_backlight_update_status(struct backlight_device *bd);
-u32 amdgpu_dm_backlight_get_level(struct amdgpu_display_manager *dm, int bl_idx);
+int amdgpu_dm_backlight_get_level(struct amdgpu_display_manager *dm, int bl_idx);
 int amdgpu_dm_backlight_get_brightness(struct backlight_device *bd);
 ssize_t panel_power_savings_show(struct device *device,
 				 struct device_attribute *attr,
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_backlight_test.c b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_backlight_test.c
index 28dda5324dfa7..8fc1c2f997688 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_backlight_test.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_backlight_test.c
@@ -382,7 +382,7 @@ static void dm_test_backlight_get_level_pwm_error(struct kunit *test)
 	dm->brightness[0] = 4321;
 	dm->backlight_link[0] = link;
 
-	KUNIT_EXPECT_EQ(test, amdgpu_dm_backlight_get_level(dm, 0), 4321U);
+	KUNIT_EXPECT_EQ(test, amdgpu_dm_backlight_get_level(dm, 0), -EINVAL);
 }
 
 /**
@@ -424,7 +424,7 @@ static void dm_test_backlight_get_level_aux_error(struct kunit *test)
 	caps->caps_valid = true;
 	caps->aux_support = true;
 
-	KUNIT_EXPECT_EQ(test, amdgpu_dm_backlight_get_level(dm, 0), 6789U);
+	KUNIT_EXPECT_EQ(test, amdgpu_dm_backlight_get_level(dm, 0), -EINVAL);
 }
 
 /**

-- 
2.53.0

