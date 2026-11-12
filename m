Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501147;
	b=3lmBUX/ngsjsWelTl6rw2JT2yWMXEpvbQ+twoXi4vtBuQkF0xBEIeO9nF10PzQTRt3d7
	 JnFYldkQfAEZ0YVRkuPzSz+MWZAjpSqjGKMZUdlUVUqQLNPREBEjhncSAU4aj168TOOVM
	 KTbxlXHRSXik1lSuXjCzv6JFfVHMb7lE4X1diXmuDCeyfkpHSPzLbLNEHsH55JHu2lWxA
	 3cAYjbaeAWQ4VbH5tRk0dzmoaKIMoLVoQB7HmMaw7PCeCfkjej5Cj66klm5ThmlXu/ZYb
	 oktd2Sx34ut+zIb/LqqY1ZuWlHIpw4Jxwuc4tsgI2XZG0sz1KUxQy716IzxJuGvE7yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501147;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=F5WeHKuUbIpb3zQWV623Iw//lqpONc5bWF2O0azcoug=;
	b=KwJ1feXnpDQaEnpPxC/zxKywcEGDhBL++Hr0tWwZqaCdQ2YwnBgCXiYEL/jLsFVVwxL/
	 8D/sLJH0IIECV0xYgkq9QPWGMpMOoMoJFCGQa+z/5qj7nskvQO3diMCZMgguXWwomZVuc
	 ZIi+/ORWqL3+BDF0pK97UQMFzbp+7sOXOg/KvsShB1Gws17ECSIloQ7R6NDiV1cN33fTV
	 OQd6h1Cr2FkVazfebCnehfk4kLbJk+lE8BNJxn0aHL8+wAlooG6b0QUg7r5g1C0oNb5FM
	 zDxzt2g12K1PakqD6Yz2F+NkySEd8vd5tPmIjocYcuMgKyTCkmfOX+D23QwK1vZRHjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MRjlpBpo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A50606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MRjlpBpo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B9C71F000C7;
	Thu, 12 Nov 2026 16:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794501146;
	bh=F5WeHKuUbIpb3zQWV623Iw//lqpONc5bWF2O0azcoug=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=MRjlpBpoS8cGJmuFOIAaPMRP6X7WLFbVtsYtftNHlYSRfhIaSlkDWu8SS86Y6oaTX
	 RW7ew47WuLVnojU86l4MerJvQEDf9tYANJnMReNN/REHpix1GuFMH9EmLMNxQlhY1U
	 UqcY2LRk/NXLYVAUZbp0Y0z1qmWBMkWNSLWWHmRJsSXmEatVjAbYkL7cC63nXO2CZB
	 3YTslKCDro/h2/96DsLXkWIr0ge3MHjgncyW0FL/J0ACjc8XUck5ivZ0uFUtU+maKn
	 s2qLrkB/cHB5gdkXJXFa5wNWNZHwH6AVx8U/eCRv+zu5ELebEoUlHgERtsgwfAs/Zu
	 qpk9Eo+5VG67Q==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 12 Nov 2026 17:31:56 +0100
Subject: [PATCH v10 7/9] drm/msm/dpu1: Carry the mixers over to created
 CRTC states
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
Message-Id: <20261112-drm-reset-state-flag-v10-7-cefaa1ed056d@kernel.org>
References: <20261112-drm-reset-state-flag-v10-0-cefaa1ed056d@kernel.org>
In-Reply-To: <20261112-drm-reset-state-flag-v10-0-cefaa1ed056d@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>
Cc: Daniel Stone <daniels@collabora.com>, 
 Harry Wentland <harry.wentland@amd.com>, 
 Jocelyn Falempe <jfalempe@redhat.com>, 
 =?utf-8?q?Jonas_=C3=85dahl?= <jadahl@redhat.com>, 
 =?utf-8?q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>, 
 Sebastian Wick <sebastian.wick@redhat.com>, Simon Ser <contact@emersion.fr>, 
 Victoria Brekenfeld <victoria@system76.com>, 
 Xaver Hugl <xaver.hugl@kde.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3092; i=mripard@kernel.org;
 h=from:subject:message-id; bh=7b7DOcMgfopOOXyPTnCwTK1jUW6Wf426///67oMtXGY=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlfXzF+lb18e9bEfqFJWyUvLWJdJ9DDUMh+M8hcTeNY8
 hmmsvNlHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAi00sYGz6rX3m4x3z9wrN/
 tj63C+U4IbRp8/LPO19OL2OWWvOlSvHpxAUBV7gKTvAXZd5886niJwNjw98J4ovW9oSZeJxcnXV
 gzrsm+4KFOr8f/9Q20N7LdlvyYYJwmNT8s8aTVfP+Lf//78XLtQA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

drm_atomic_commit_fill_with_defaults() builds its commits out of
states created through atomic_create_state() instead of duplicating
the current state. A created CRTC state comes with no mixers, while a
duplicated state carries the ones currently assigned, since the
duplication copies the whole state.

dpu_crtc_atomic_check() only goes through dpu_crtc_assign_resources()
when the mode, the connectors or the color management properties
changed, so a CRTC that keeps its configuration with a created state
runs with no mixers at all.

Copy the mixers of the current state over when the new state has
none, like a duplicated state would have carried them. This is a
no-op for duplicated states, which already have them.

Only do so for a CRTC that stays enabled. dpu_crtc_assign_resources()
returns right after dpu_rm_release() for a disabled one, leaving the
mixers it just released behind in the state it was given, and those
must not be handed over to a new state where the consumers that don't
check the CRTC enablement could reach hardware reassigned since.

Signed-off-by: Maxime Ripard <mripard@kernel.org>

---

To: Rob Clark <robin.clark@oss.qualcomm.com>
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: Jessica Zhang <jesszhan0024@gmail.com>
Cc: freedreno@lists.freedesktop.org
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 77a2d1f6700d..a99f6761035f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1538,10 +1538,33 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	if (crtc_state->mode_changed || crtc_state->connectors_changed ||
 	    crtc_state->color_mgmt_changed) {
 		rc = dpu_crtc_assign_resources(crtc, crtc_state);
 		if (rc < 0)
 			return rc;
+	} else if (crtc_state->enable && !cstate->num_mixers) {
+		struct dpu_crtc_state *old_cstate =
+			to_dpu_crtc_state(drm_atomic_get_old_crtc_state(state,
+									crtc));
+
+		/*
+		 * A CRTC that keeps its configuration keeps its mixers.
+		 * A duplicated state carries them over, but a state
+		 * created through atomic_create_state() comes with
+		 * none, so copy them from the current state like a
+		 * duplicated state would, to make sure the checks and
+		 * the commit see the mixers in use.
+		 *
+		 * Only do so for a CRTC that stays enabled:
+		 * dpu_crtc_assign_resources() returns right after
+		 * dpu_rm_release() for a disabled one, leaving the mixers
+		 * it just released behind in the state it was given.
+		 */
+		if (old_cstate->num_mixers) {
+			cstate->num_mixers = old_cstate->num_mixers;
+			memcpy(cstate->mixers, old_cstate->mixers,
+			       sizeof(cstate->mixers));
+		}
 	}
 
 	if (crtc_state->planes_changed || crtc_state->zpos_changed) {
 		if (dpu_use_virtual_planes)
 			rc = dpu_crtc_reassign_planes(crtc, crtc_state);

-- 
2.56.0

