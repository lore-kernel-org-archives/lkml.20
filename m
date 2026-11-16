Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794824269;
	b=iU1ZOBcWQDTkugq66wov3SaqbvrwWXhZy16dYaiu8rrFIVjlfiYCCF7jgjU+grm7fXpL
	 Rn5h5L84eHmDgYOlbVOyaamupnWvrcps7q8M+vTAAMSiUXnaZU8JN00b6cpfdDMFwVdoL
	 eSrWjZxpEq7v7BN7UBmWYP4rCPCl/oPZ5o6DK6ZieQtDvjaGxSqxva+jDprWePzj3DTYi
	 +XX2dt1F5RSg314zEcABwZIcWDtjr9zIVV7HUPXFcu3C1OM2REW64vp9laaqVJpEj2m6o
	 II7tAzprTbIErmSm1pqUhj9KTckhifxo9OjpCzVoyYaV2ijxTolRmaHaU+2Vg0HvqeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794824269;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=gFHhcoRcrlpUlIvqzrujK7nmKP3HUH6Btuv56xfOdxk=;
	b=4wIAohW/LwXobNkhoRUs8/5Fkwu1y/RPUTxIPEasUdaqkz0NcO56XS77naNs5KnaEH1r
	 7tqmYE8IPVE3ucQqawfUECjslyrif8lsdK21ZFArfY5mH5w+mh+eJw+LXcJxM4eSHQkBC
	 xIvtjdPTIaMt0hgha1c6pyZwqsh/+PzzZfyBnaI69OiCWlMVHts3Ya2IV7n6iSIlpf4j5
	 /sKjhq7nC8+gBMVyMC5mqoXZT1P0Y8URsjeXh7sNyl1ykJ5uubdiOBl0+iF+eZejzkSwD
	 0YGEtki07oFBIAN0Jgu60yrGD4BBEuvKPJQ4SX7pBh07dPEqy/cj8AhRhy4i8m8vrqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Iwc6584a;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD848606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Iwc6584a
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 066591F000C4;
	Mon, 16 Nov 2026 10:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794824269;
	bh=gFHhcoRcrlpUlIvqzrujK7nmKP3HUH6Btuv56xfOdxk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Iwc6584amCmoKt+xj+y+R2zR7GpOuOeEKbWSnOyPJpk1Io7YrXBaJkXG8tx/uiS1W
	 MkCNlR/qiTzYx27XoNfzYgS2J76SuLv6QBuIWHWd88/XBOEdxxhVYRUkI2oqPg+nyw
	 PRb79A6yTkvIPKVPTLvtnpBfxn+g9SW26dlj+i897ELnNa96Jby2S/gSmXMyfo10yD
	 J3uR1FcMfn6dATRCp58CE/K4jYms5cqQeZgxE7J62ACP1FIYfFx39FK6hk0FdqIgM7
	 asLl3SvBJZBBRrVDjUm3yVkXXzsOTg4W13QxNWFyOzxGTvNrDTVbp0iaO0+utOyRAq
	 rb8ndsyhFOaxg==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 16 Nov 2026 11:17:23 +0100
Subject: [PATCH v11 7/9] drm/msm/dpu1: Carry the mixers over to created
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
Message-Id: <20261116-drm-reset-state-flag-v11-7-378b3f7bef32@kernel.org>
References: <20261116-drm-reset-state-flag-v11-0-378b3f7bef32@kernel.org>
In-Reply-To: <20261116-drm-reset-state-flag-v11-0-378b3f7bef32@kernel.org>
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
 h=from:subject:message-id; bh=Amod7q3/yzhVDd+aurIkHRbytmd4kmYl13gv6TAkp5k=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFm/bhgbGymoOOwrXXDvB7+v+fqgueectAJmyFzX7Juzg
 Pf1R7arHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAin24z1int+za/QP3+e2bD
 7tT8AyFdN7z/2LAk1p24nfHkY84hNQauFr5cT223xRKu3F77/+/kZawVPvB597y74WfNcj7JJzy
 4fHdRkbu3ZFDO8S+ifNprvH6vktXge8yU8sy9JGPZpPsdfbMA
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
2.56.1

