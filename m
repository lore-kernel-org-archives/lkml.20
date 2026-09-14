Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C402D3254A9
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789358870; cv=none; b=H1YGCwFJUmbtazqaVFLdMh9/kUn1LS6aRGnzgpbN5L4Qp9uLcLan/OfupL69y2pNqifRr/U96oFoyacBvCipZydq95mpOKPi0Wr4pLEmTNjbRQ79DuY4jrTQJfzNrQyGaXUGtoaTOV/IuSbC5k+MbnYYDaBO8pL9DgAwRI4aagE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789358870; c=relaxed/simple;
	bh=vsNqmwi/MgccqJf6ROxrYCEiQYYxP8rEBahorUqAVtA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fu3TmiwiMB/fRIkVgZEdOVMdrRUrTS4W28W8lIr0a64w+KOEpGF02xFRTWEuvTMAvxzycI59jE0Pe4HbfS73TQmDnOmY2xBxjTsUdMKH5K2quBwKQr+H0DsnU9f1K2DCUIkMbiPxDroARsbIfsAA0+kLb79JzHA4VWt7xAfYQFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BZf66e8z; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Lbgt2hFW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BZf66e8z";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lbgt2hFW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789358867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rCoc2R/ijUeWuWPNV3TxEtpKBXnNgpWvgPneT9lSNbM=;
	b=BZf66e8zoMb1s00LKEKUOyl1DOXPlTaAMssOeLMenzp507OwBKaZfxV8xn5W6QbgKFILkT
	N+bo0JpPDtnV7AUvLbWQPVkERROfywOBVw2UWgqZxZ2OII7J0p9mQHEj0cDVw7xq0o0HC6
	5pV9plDzhbhOnFs1dabD1v0JMK9yM4o=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-158-KPM68HqMNU6roLPIGzHVGg-1; Mon, 14 Sep 2026 00:07:45 -0400
X-MC-Unique: KPM68HqMNU6roLPIGzHVGg-1
X-Mimecast-MFC-AGG-ID: KPM68HqMNU6roLPIGzHVGg_1789358864
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-5b76707e6d9so1446037e87.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789358863; x=1789963663; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rCoc2R/ijUeWuWPNV3TxEtpKBXnNgpWvgPneT9lSNbM=;
        b=Lbgt2hFWEKwh5XyxXko2EIuz5XdoeKN7pv66zz7vAHXer0SAkiSSbwuMzlLEguy60w
         Oi4HKr7b8qZrZYg1szq9a/FfbsBUH8OcQBw6tL1eUAZiRHR0Xe87Wm5W8OVdelp1jgpL
         JgMhFnsiGyUn2rrcdJdLFBH3JxpHH+ipmMlsWamVawEyiSIbtNmki8piLRDUVz7IamRx
         KITwSKyGzxQaZSBpQNec7EMSrutRIOPclUwLj4dhi+fLpJzdQN8AmAnGO/liOj5CNwGG
         0D4W/SloDvcyaurlxLgKRaAo9wi4p66ZGQ+EbrfJM5sfv6ahBuPOSW+6usFzql7w4Y47
         4xeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789358863; x=1789963663;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rCoc2R/ijUeWuWPNV3TxEtpKBXnNgpWvgPneT9lSNbM=;
        b=LTQcny0ZcdMlJDnlmX49v15BjtTrYM0OqVLaG1VZxGzfhHDRMDLd2pEDjgonIfC7Xs
         1wuISpIakgMQy341h+dD2uwt9PvVGPnEgAYh0AQ/B4F7l2T7OCDG1jR0xlkbWBDcCEqX
         z2dw2/800yoo+i/vvXzLym8Pb2M0kiP/P3hz7MhgREyH5E1ccjVKdpafxVvJY/HoVmBn
         coEdFPTwfA+UaIQ1FFxZv8BHYLwfHGMpJrYc9NpaAOgPiXLa+aAuFOE24IQ3f2F/o9H+
         MlJ+IECqqLBxNB3+S8TvmWtTA6tzTdWUHjRQyJ8hDNf649h2Rp9lVc8SxW1gBjbRPWUa
         36GQ==
X-Gm-Message-State: AFuF++kmA9+UUKMS3PBl/NuL+tkSkho4z4Fw8AI6CkRMnhjJe3p8f2Yz
	jGOymqdVze7YTgKsx7LeejrahhJ+PPojtXUBz8gfiE3FIxB9Weksm6lIeGMgYYWNUSzaj/fFZCW
	3cdMZGGdGlqrMDUD8VDEAWHng/6U1y8QAvg0UR+/I8CwfK8J3NCy81wYrHI0ztDkfkb+4MVd1
X-Gm-Gg: AYBFou3+3LkZc2r3Oy4ldZ3qIuFN5O2xo7/gmfm+8s47+s3O9hLQLN6A2mzHtZd35S6
	Yo7aPHK3theOekswfL6ZOpA0qDk1kiIpbsb/2bijmsO8ScIE6ZHsJ1RF7nTgenDGk+RqOR1VEiJ
	+djlOQUpwO34O96GQMYHXyW3O/aVh0t7g71w7kKFaI1pmN0xOSjxcfofQf5T5ThI3mD5kL0se43
	9jFoppJYaYSHPNGAkApgkt1bC5GnwnFaMiIMiJW04W/2b14FfrhX+F+oorYZJbN1sjSuDGm9Ilo
	YjvC0v0Ie9w1rjarExUb+F/qvdfHjde9J+DJLRSdwmLBEzN7SVhOg7tc2rIGJKY20Pd5I8NLu98
	hNdTUanu4oXH1b/tORYbo
X-Received: by 2002:a05:6512:3347:b0:5b1:5ccf:5268 with SMTP id 2adb3069b0e04-5b8ae67d301mr224134e87.1.1789358863533;
        Sun, 13 Sep 2026 21:07:43 -0700 (PDT)
X-Received: by 2002:a05:6512:3347:b0:5b1:5ccf:5268 with SMTP id 2adb3069b0e04-5b8ae67d301mr224127e87.1.1789358863047;
        Sun, 13 Sep 2026 21:07:43 -0700 (PDT)
Received: from fedora (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a0456c11sm2098666e87.21.2026.09.13.21.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 21:07:42 -0700 (PDT)
From: mpenttil@redhat.com
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org,
	=?UTF-8?q?Mika=20Penttil=C3=A4?= <mpenttil@redhat.com>,
	Maxime Ripard <mripard@kernel.org>
Subject: [PATCH] drm/tests: hdmi: fix infoframes tests
Date: Mon, 14 Sep 2026 07:07:23 +0300
Message-ID: <20260914040723.2593700-1-mpenttil@redhat.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Mika Penttilä <mpenttil@redhat.com>

drm_atomic_commit() calls drm_atomic_check_only() internally. Calling
drm_atomic_check_only() explicitly before the commit leaves the state
marked as checked and triggers drm_WARN_ON(state->checked) when the
commit checks the state again.

Remove the redundant explicit checks.

Fixes: 7436a87db99d ("drm/tests: hdmi: check the infoframes behaviour")
Cc: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Mika Penttilä <mpenttil@redhat.com>
---
 .../drm/tests/drm_hdmi_state_helper_test.c    | 54 -------------------
 1 file changed, 54 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 353a261d42da..f8ae1a0bd5c0 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -2929,15 +2929,6 @@ static void drm_test_check_infoframes(struct kunit *test)
 
 	old_hdmi_update_failures = priv->hdmi_update_failures;
 
-	ret = drm_atomic_check_only(state);
-	if (ret == -EDEADLK) {
-		drm_atomic_commit_clear(state);
-		ret = drm_modeset_backoff(&ctx);
-		if (!ret)
-			goto retry_crtc_state;
-	}
-	KUNIT_ASSERT_EQ(test, ret, 0);
-
 	ret = drm_atomic_commit(state);
 	if (ret == -EDEADLK) {
 		drm_atomic_commit_clear(state);
@@ -3034,15 +3025,6 @@ static void drm_test_check_reject_avi_infoframe(struct kunit *test)
 
 	old_hdmi_update_failures = priv->hdmi_update_failures;
 
-	ret = drm_atomic_check_only(state);
-	if (ret == -EDEADLK) {
-		drm_atomic_commit_clear(state);
-		ret = drm_modeset_backoff(&ctx);
-		if (!ret)
-			goto retry_crtc_state;
-	}
-	KUNIT_ASSERT_EQ(test, ret, 0);
-
 	ret = drm_atomic_commit(state);
 	if (ret == -EDEADLK) {
 		drm_atomic_commit_clear(state);
@@ -3153,15 +3135,6 @@ static void drm_test_check_reject_hdr_infoframe_bpc_8(struct kunit *test)
 
 	old_hdmi_update_failures = priv->hdmi_update_failures;
 
-	ret = drm_atomic_check_only(state);
-	if (ret == -EDEADLK) {
-		drm_atomic_commit_clear(state);
-		ret = drm_modeset_backoff(&ctx);
-		if (!ret)
-			goto retry_conn_state;
-	}
-	KUNIT_ASSERT_EQ(test, ret, 0);
-
 	ret = drm_atomic_commit(state);
 	if (ret == -EDEADLK) {
 		drm_atomic_commit_clear(state);
@@ -3276,15 +3249,6 @@ static void drm_test_check_reject_hdr_infoframe_bpc_10(struct kunit *test)
 
 	old_hdmi_update_failures = priv->hdmi_update_failures;
 
-	ret = drm_atomic_check_only(state);
-	if (ret == -EDEADLK) {
-		drm_atomic_commit_clear(state);
-		ret = drm_modeset_backoff(&ctx);
-		if (!ret)
-			goto retry_conn_state;
-	}
-	KUNIT_ASSERT_EQ(test, ret, 0);
-
 	ret = drm_atomic_commit(state);
 	if (ret == -EDEADLK) {
 		drm_atomic_commit_clear(state);
@@ -3387,15 +3351,6 @@ static void drm_test_check_reject_audio_infoframe(struct kunit *test)
 
 	old_hdmi_update_failures = priv->hdmi_update_failures;
 
-	ret = drm_atomic_check_only(state);
-	if (ret == -EDEADLK) {
-		drm_atomic_commit_clear(state);
-		ret = drm_modeset_backoff(&ctx);
-		if (!ret)
-			goto retry_crtc_state;
-	}
-	KUNIT_ASSERT_EQ(test, ret, 0);
-
 	ret = drm_atomic_commit(state);
 	if (ret == -EDEADLK) {
 		drm_atomic_commit_clear(state);
@@ -3438,15 +3393,6 @@ static void drm_test_check_reject_audio_infoframe(struct kunit *test)
 
 	old_hdmi_update_failures = priv->hdmi_update_failures;
 
-	ret = drm_atomic_check_only(state);
-	if (ret == -EDEADLK) {
-		drm_atomic_commit_clear(state);
-		ret = drm_modeset_backoff(&ctx);
-		if (!ret)
-			goto retry_crtc_state_2;
-	}
-	KUNIT_ASSERT_EQ(test, ret, 0);
-
 	ret = drm_atomic_commit(state);
 	if (ret == -EDEADLK) {
 		drm_atomic_commit_clear(state);
-- 
2.55.0

