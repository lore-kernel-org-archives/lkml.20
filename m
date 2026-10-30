Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793356085;
	b=4tbd2Z0KQ1NRB+bpQfayRQbfGrVYNhmZEwKHGXLIibda3/XOby0Id2ZiYtYtlIGbnOB2
	 n7Asqktm8C5EYmULWTPx9tACQEqPL1sBW5oBLtd9ju6XaxKqSCEeJF8mvjviVwTfYhL2h
	 GRuEQ0IfRwFgQqXWfigFzK5J84t1f4cMDDyQok+0+xOq5QAD43h6llABsAm4aQt/hE95H
	 2j42bT3q+MQdJCUvRZWQnqKSjz1E+jKWboL93m3sCNQcO9ug7jT4d30Vb+J68BQMQOujx
	 a0NWe8UUUn8pHXl9MJWoVPheDqmfPiN5Nhf3CZ2Td9z9ZdA31QCWsdyPwq1U5bSzb8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356085;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=JWUMgHIC9UGBSIolOL6GZvlgSz5q9pcFRnOxAnmCYII=;
	b=nD7RpgYmvzjMy8lxUtLWXcHZTib6Oh6XvGTJf8TNPFP9X+HDwXYXc/MOaUgJTMCWQf2o
	 MiE0kvo/j1GxF6GL9eBEs01mYyX5OHLBOjt+tyc8DWkWVHVH0Qw73JiZNxdKv1eE9celp
	 S9ThVnA1Po3FsTv9n0e/SOQsjVoioYq6ReP7/Uo9S4Gv58wW8YkXUJWyU8yudqb7XoIUB
	 grkzBvpEQ5yuMm5z8SM98DVG55651nJNRVHCHfXsPiyg5z0CTCYiQ2VUJG8LhbDtmsgyn
	 bXzfKceYXo4RTH3t6/3zkgbV5WQOikDyOWWHpZ7w0qO3HM/MxbP1IfZe5zaQXg8XGUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JPNvVh4I;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A76606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JPNvVh4I
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 605B01F00A16;
	Fri, 30 Oct 2026 10:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793356084;
	bh=JWUMgHIC9UGBSIolOL6GZvlgSz5q9pcFRnOxAnmCYII=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=JPNvVh4Ih/ELqgxdbt6v3NVNaVs1vG0gq2S0vJetMR3B99MMA6c6s+inDSo1EPlzh
	 d9GF7NtOIQI/dhET8QoPqiuvxii8vskFBPwGmdGZi7YwiAyPT2abmb/UOxLZAIpzSk
	 Umtujd6f4nA0WDEFWyiAv2OBAO2/C5Uo6Cc/VOHsLsG4w9/irbnyQSMRSJiuGyAoKH
	 qPtbqdwb8GVBGUiMYuR+5w5Fb1khlDk1hXhdyMpZUcMqyrqFTHAYzmCsHoHptPcgx3
	 e8HKXOmU+OmWPEfWtqtAst0iCQCyDDWY7QkW49xos/Dbz6rzHZn4DqNWQJDQHkm8by
	 v6+l2b2VOU3BQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 30 Oct 2026 11:27:37 +0100
Subject: [PATCH v7 05/16] drm/atomic: Use __GFP_ZERO instead of explicit
 memset in drm_atomic_get_connector_state()
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
Message-Id: <20261030-drm-reset-state-flag-v7-5-4e55eaeae683@kernel.org>
References: <20261030-drm-reset-state-flag-v7-0-4e55eaeae683@kernel.org>
In-Reply-To: <20261030-drm-reset-state-flag-v7-0-4e55eaeae683@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1374; i=mripard@kernel.org;
 h=from:subject:message-id; bh=LZbtPHVlMICiFBeZpJ8LPAkCVdWnWToVa7ZsZD+t1oo=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlPCiXt1kp9mP5uppHHV9E5GrvXuzjoiP9/axli2ZP87
 svyB+tOdExlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJOLcyNqzx+9qYmyH93/zo
 Boe7C3JSqgLnflrtZecic3P/8Zk3Lpefmfri3cESAxE1yR9L55sk/GJsWPdu7qxmuRDPIidt7Y2
 rNaSDFtx9mzdjf+7m5Bj+2E/pHaHHFu89uOS/TfyhwBXNUUWVAA==
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
Reviewed-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 43b58e9b25e4..80436adcfb7f 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1391,12 +1391,9 @@ drm_atomic_get_connector_state(struct drm_atomic_commit *state,
 
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

-- 
2.55.0

