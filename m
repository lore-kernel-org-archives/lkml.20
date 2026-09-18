Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52C34EE87C
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789741095; cv=none; b=NPY+a21xtoX6alMX4ni8ugSG3eG+KXHmBN0+cn/9yEFoIzp91hA0tpQ+CIKuiYSRaoS9BgOqu8Tp6xCEYEVfcIC8MflM3kJnPN4BfseOw24ygiqy3bK/OYytG4jZ6IHzn+WPf1v8oxLMPXzXYDaRUb3Sr6b/BWQPJnPhAvgPx/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789741095; c=relaxed/simple;
	bh=QGxTju+P6OmxblkkOc/G7V6i744GeSNDFj3K6kdMM7Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jgc6QL0anb23AtW9sE52xgWJfCgR6CzRUp5AUoWg3HV+s8lbWReXEH/nEM9YfgKTpX9qghdv+Qoe0LEAffu6XcurUK/Vq3rEB3n9XbT1dZqitmsKa88kU0ycWHx/tr2q8R5FZ8RRAxi3YgTbNU9/7dvu+RBvpJvXXoY5WE6vDtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KI0+AvZy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KI0+AvZy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C28A11F000FF;
	Fri, 18 Sep 2026 14:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789741093;
	bh=yX6VtmC9ZWWYErdutyz3INiDSj6zlwe+CO7hZeNh2ls=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KI0+AvZyz+DFyf2wVg+qBgJWkhbvlKrWqFih5S0krV4loP1hX2khX0lxuF1oDm2y1
	 CwWd9lYlN/DPz6uEkKJMbUaD6zqW7Y5hcjEWA9Z9h1PDROtjEaRczayROIQSgpy8Uy
	 Mk8H6/1DDycDB8AUKI8NAhOsxEw2UaafkCWhbHsXF6DvmP6y/J6QgLskvJPqcy4muJ
	 S0UAqznHSNm0h6Q/64uRjpEHcpFbwnrVt6B7qS6mub8Ds4QL9LQrHMicgRhu9a5TBi
	 7iz35ZTWvWUGZ2M2eE3LVg2ouXMibkYRX8W1JPfEbYfFhWcQQcGDU0yCEPf4Qq57Cc
	 35d8Oe1VFAx+w==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 18 Sep 2026 16:17:52 +0200
Subject: [PATCH v4 03/13] drm/atomic: Use __GFP_ZERO instead of explicit
 memset in drm_atomic_get_connector_state()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-drm-reset-state-flag-v4-3-5ad106370f05@kernel.org>
References: <20260918-drm-reset-state-flag-v4-0-5ad106370f05@kernel.org>
In-Reply-To: <20260918-drm-reset-state-flag-v4-0-5ad106370f05@kernel.org>
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
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1560; i=mripard@kernel.org;
 h=from:subject:message-id; bh=QGxTju+P6OmxblkkOc/G7V6i744GeSNDFj3K6kdMM7Y=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlrPQS2P1i4NHT6sV1pZ+fs8JwT03Lp/q6VkZM26r/Kj
 z2UVvC8p2MqC4MwJ4OsmCLLE5mw08vbF1c52K/8ATOHlQlkCAMXpwBM5NtUxjpNoyDDnHeK8zfZ
 6n3eHeHUvLaw+9JUacW9yRVXt0o9mxp2PsdqblD/fCevajG/6mlTHjHWWWzQ4LUw+5I60f7n385
 U52De/8INboLX4pjVZ2kHct2eFqO12s9tT6QzV8DnEp1Tms0A
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The drm_atomic_get_connector_state() function grows the connectors array
with krealloc_array() when the requested connector index exceeds the
current allocation, then zeroes the new entries with a separate memset()
call.

Since krealloc_array() supports the __GFP_ZERO flag to zero newly
allocated memory, the explicit memset() is unnecessary.

Pass __GFP_ZERO to krealloc_array() and drop the manual memset().

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 43b58e9b25e4..80436adcfb7f 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1388,18 +1388,15 @@ drm_atomic_get_connector_state(struct drm_atomic_commit *state,
 	if (index >= state->num_connector) {
 		struct __drm_connnectors_state *c;
 		int alloc = max(index + 1, config->num_connector);
 
 		c = krealloc_array(state->connectors, alloc,
-				   sizeof(*state->connectors), GFP_KERNEL);
+				   sizeof(*state->connectors), GFP_KERNEL | __GFP_ZERO);
 		if (!c)
 			return ERR_PTR(-ENOMEM);
 
 		state->connectors = c;
-		memset(&state->connectors[state->num_connector], 0,
-		       sizeof(*state->connectors) * (alloc - state->num_connector));
-
 		state->num_connector = alloc;
 	}
 
 	connector_state = drm_atomic_get_new_connector_state(state, connector);
 	if (connector_state)

-- 
2.55.0

