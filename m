Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793356096;
	b=gQFJnURlT62xMPqycGmB0Y1JOpAhMkQ8nXdSQcRUNDDUbaEGW5wsVOu+tVglcq0rFgw7
	 6HWm/kKc5WQRPXpVTr+v/vLrGlHV6kSe6V62gSGpCDhgxUUUXZQA+FAVkYRI8mNgfC80i
	 Jzd9qlM7XZhQi8oVhh0Bk91TRIByjXVeLgtvtjOQ/JiKZvOokxLxrzskhIN7y4vpXJvBn
	 C1cDajvP40X7+K8pfjY8/Mpc03FXNwps3Qy0U5fyYOX4Ks+Ci6S37hADnjLz3zWHloGSQ
	 XrM9cM6caf1M0TX6N0nP2bVCRWitZGQNuSW3oowtF/dstl2LHa3rF1IRiL4XYOwBmwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356096;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Ht4+C9dMEY772FpQRO+VRVQi2AMnCm63uPW871AMEho=;
	b=jmzzHIPtwu/ZD6wva0D72y0hyTYR1qCkdDVE2AALzqC1pMxt1IE07DBGICt9Iwav3VKf
	 V7rexF9SpYROTlldfgQ8nTYpj5vZ/P01Tc7th51+M71rFlWbbS7BAMCu9cj6PWq1Q9JZn
	 YtBUr9uDCxWmLzitPiMoMLOqJw51t6JqOaU3QBnkLcDbxtOUA/RgQgSALfUCdRfWpZgtL
	 xKj4EJeiniZu6bEO0PYOrMpHo6rbc08hDCZqeqAnZpxL0usZPJdLlu+r0okAkplAFzMOo
	 ex4m/3xoBXgjk5IvBUE30/a2uDVD2lAwh84MZ7/ZkxiniwOWbCk+5xtGQdW5Z5UvcCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KzWxOd9p;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5843A60A3821
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KzWxOd9p
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABC6D1F000C1;
	Fri, 30 Oct 2026 10:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793356096;
	bh=Ht4+C9dMEY772FpQRO+VRVQi2AMnCm63uPW871AMEho=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KzWxOd9pWJicRkZKCaP9M7Z22qg/TYawoFdlcwYEkYwCdH6eBER5JZ1nITrKiU+7X
	 /4fzAzrABrmDBk4RHer28A0s0vVbaMImgghlZY4OAwzb0Zaqk3OXczohEY3j2GofKI
	 PJB3O/jliiyhRR8nPWWopGbrRkAfnG6+Z5WM95YgPfW9XFkw+hv8jlItWCqUJcmwVB
	 p2ZSryrkM6QXhYF1sPpSETuQ5Dor5OIqkxL3pbbeC1NTleTBzdSvfRi8hh2NzvSSPG
	 eyI2RgTIJNdObfG2MBFGn56N7zbCGxwrZp87Udk3Z2GOn8NcGcT3+GXuwUNzItkbM6
	 W7my78hP8vSgw==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 30 Oct 2026 11:27:40 +0100
Subject: [PATCH v7 08/16] drm/atomic: Create function to insert colorop
 state into a commit
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
Message-Id: <20261030-drm-reset-state-flag-v7-8-4e55eaeae683@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2428; i=mripard@kernel.org;
 h=from:subject:message-id; bh=P0k8mj+gDqmFXtZ5SqhgfD1SldUjK4nLwH6NhSPh4sE=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlPCqWexcRUFeY3X69+l3Do8qp5Hn464eeSi87U7+Wcc
 3TBbUXhjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCRWXyMDbtvSpVOmMkRrv4w
 7+CBr+zx77Tn5p6dsMP3y9KYp5w2AlwWzuZTq7f9uhieYbH8cJuwKmO9q9SfTVMO1au8XbVV8cF
 rBnW+hftmXX7UaMW1rvVZo2v3gx1nq7cozlMJL1gXzZ/hePsyAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

drm_atomic_get_colorop_state() allocates a new colorop state by
duplicating the current one and inserts it into the atomic commit as
a single operation.

However, a later change will need to insert a colorop state into a
commit without going through the full allocation and duplication path
in drm_atomic_get_colorop_state().

Extract the state insertion logic into a new static
drm_atomic_commit_set_colorop_state() helper, and convert
drm_atomic_get_colorop_state() to use it.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index b26458ee98d8..807b575ecc54 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -705,4 +705,19 @@ drm_atomic_get_plane_state(struct drm_atomic_commit *state,
 EXPORT_SYMBOL(drm_atomic_get_plane_state);
 
+static void drm_atomic_commit_set_colorop_state(struct drm_atomic_commit *commit,
+						struct drm_colorop *colorop,
+						struct drm_colorop_state *colorop_state)
+{
+	int index = drm_colorop_index(colorop);
+
+	drm_modeset_lock_assert_held(&colorop->plane->mutex);
+
+	commit->colorops[index].state_to_destroy = colorop_state;
+	commit->colorops[index].old_state = colorop->state;
+	commit->colorops[index].new_state = colorop_state;
+	commit->colorops[index].ptr = colorop;
+	colorop_state->state = commit;
+}
+
 /**
  * drm_atomic_get_colorop_state - get colorop state
@@ -724,5 +739,5 @@ drm_atomic_get_colorop_state(struct drm_atomic_commit *state,
 			     struct drm_colorop *colorop)
 {
-	int ret, index = drm_colorop_index(colorop);
+	int ret;
 	struct drm_colorop_state *colorop_state;
 
@@ -741,9 +756,5 @@ drm_atomic_get_colorop_state(struct drm_atomic_commit *state,
 		return ERR_PTR(-ENOMEM);
 
-	state->colorops[index].state_to_destroy = colorop_state;
-	state->colorops[index].ptr = colorop;
-	state->colorops[index].old_state = colorop->state;
-	state->colorops[index].new_state = colorop_state;
-	colorop_state->state = state;
+	drm_atomic_commit_set_colorop_state(state, colorop, colorop_state);
 
 	drm_dbg_atomic(colorop->dev, "Added [COLOROP:%d:%d] %p state to %p\n",

-- 
2.55.0

