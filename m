Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794824251;
	b=c+/8ZPaXM28LYsKy95EqG+OwCENT4qUPeHpZEuKNws87gQ1VfaTWRUhqxYbSsFK//+sz
	 x9yF/+m4sR85shSqIXPOhFfsHIxPGOEUXiMgtnjAcYggAP8bNgO4kMaivbQcvBXyc7fbI
	 1odTIM79mPp0ozJnaw/LitneDLFkanQBQZ/xNCRAgE84qpwgGdsa5taz8CwQGEOvqHfvA
	 Zae5YAZmmN6UhkM8yvtf1FaKrPbXBEJdCUtgAZCr6LWU5A64+0garhpbu8LI5HdIWXieF
	 3DOwOWSbf2hCJN/7BhP7PmyczQbeSza+2O6VkAzFNfAiyUt8mQXoA/RD7ML0xLIGGnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794824251;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=CydDoFkYyD8BCIYY/XYEEVWbbaCSQ3X0p2dkKQ+0CqM=;
	b=Q5fEHslIaY42iyx9V1NhK7c31M84XOyvpa60RpoC4EJeiTmesaxe+k+0pZ2RyvZJrg6t
	 0wmESkcXoi3XycRNfxOVg6GOwD+HICESQPahrf5mIf1NyR0WorUalDd+a+wVezBYRFqYB
	 DYHewDKRZAFwwjokjb0qwbgINcrWdW27WfQr14ndt3az3eflSD2CNjPFdEQD9HFH166cX
	 h0LEy2fW/fLIJcJj3VpMzsQFKLHknAx61NrCk08hxcFCTufkn5+XkvfzQRPhQO1fEHQnV
	 jH3V43szCbWew5wiFA2RgtnCmygY8mExI0/Jye82url9wgJwKM+7dWJ7Cl0lwfeJrpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K9gcqKNb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A097606A887
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K9gcqKNb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56ED41F000C8;
	Mon, 16 Nov 2026 10:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794824250;
	bh=CydDoFkYyD8BCIYY/XYEEVWbbaCSQ3X0p2dkKQ+0CqM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=K9gcqKNbolPg0cHCnE8870LJo8UNXLK0eEmFvyzlcu8ZRFftfImJh1w7RoQQuH68t
	 zG7UPS9GZg8S9sVW+zS5egMMqZRaoXYtjpXkeLD1tbeZ44tLTSQ7mkzV3F4EzL6pm8
	 Dwg6tKKaa5hsrx7Y30ruYTgY9Yqo1BEU5cAMHLfXuKXLNAOUc4oOwLlS2Sz8poIoL2
	 yYJYSx6M73LtUnh7CxChqa5wHUh0j843M90kOgVm4Pz50xlZDPnzNy2VSt1p0SsF4p
	 FkDElZjdlj5vwnkuL2xNJHOJ7kT0OYpt52wSfBCxsALDfXL3Th0Tdas/mwNz/ea+Bt
	 jc1CSY0fNfgiw==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 16 Nov 2026 11:17:17 +0100
Subject: [PATCH v11 1/9] drm/lease: Add a helper to tell whether a lease
 was revoked
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
Message-Id: <20261116-drm-reset-state-flag-v11-1-378b3f7bef32@kernel.org>
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
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2424; i=mripard@kernel.org;
 h=from:subject:message-id; bh=wdg6MLcZvw37pYUZtSue8aIDbedYpYC6Bp3fhqAm8jc=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFm/bhhsyTf/s3a53rRJTR9PLpojHs14qZHt85wzoTIXV
 AzW+qxk6JjKwiDMySArpsjyRCbs9PL2xVUO9it/wMxhZQIZwsDFKQATue/K2LDwMFvY7zUpF1XN
 u5xqnkwu49ZbF+0rfuv5jqarov15oj2pvvd2qUUq2NrvmtSskmKmwljFtJjxzqOMvf8+M9bsil9
 lNlNKlNtaboOpKCMjv+F0y59vzDZcnRsw8fHxkuNm16ckP2UHAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

drm_lease_held() only answers whether a given object is part of a lease,
and the answer can change from one call to the next. Code that needs to
look at several objects in a row has no way to tell whether the lease it
has been checking against is still around by the time it is done.

Add a helper reporting whether a lease has been revoked, so that such
code can bail out instead of acting on a lease that went away.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_lease.c | 26 ++++++++++++++++++++++++++
 include/drm/drm_lease.h     |  2 ++
 2 files changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
index 5d2cf724cbd7..dd59df14dcc0 100644
--- a/drivers/gpu/drm/drm_lease.c
+++ b/drivers/gpu/drm/drm_lease.c
@@ -145,10 +145,36 @@ bool drm_lease_held(struct drm_file *file_priv, int id)
 out:
 	drm_master_put(&master);
 	return ret;
 }
 
+/*
+ * Checks whether the file is a lessee whose lease has been revoked. A
+ * lease is always revoked as a whole, so an empty one has been revoked.
+ */
+bool drm_lease_revoked(struct drm_file *file_priv)
+{
+	struct drm_master *master;
+	bool ret = false;
+
+	if (!file_priv)
+		return false;
+
+	master = drm_file_get_master(file_priv);
+	if (!master)
+		return false;
+
+	if (master->lessor) {
+		mutex_lock(&master->dev->mode_config.idr_mutex);
+		ret = idr_is_empty(&master->leases);
+		mutex_unlock(&master->dev->mode_config.idr_mutex);
+	}
+
+	drm_master_put(&master);
+	return ret;
+}
+
 /*
  * Given a bitmask of crtcs to check, reconstructs a crtc mask based on the
  * crtcs which are visible through the specified file.
  */
 uint32_t drm_lease_filter_crtcs(struct drm_file *file_priv, uint32_t crtcs_in)
diff --git a/include/drm/drm_lease.h b/include/drm/drm_lease.h
index 53545b4ca9ef..03f7ea36c37c 100644
--- a/include/drm/drm_lease.h
+++ b/include/drm/drm_lease.h
@@ -18,10 +18,12 @@ void drm_lease_destroy(struct drm_master *lessee);
 
 bool drm_lease_held(struct drm_file *file_priv, int id);
 
 bool _drm_lease_held(struct drm_file *file_priv, int id);
 
+bool drm_lease_revoked(struct drm_file *file_priv);
+
 void drm_lease_revoke(struct drm_master *master);
 
 uint32_t drm_lease_filter_crtcs(struct drm_file *file_priv, uint32_t crtcs);
 
 int drm_mode_create_lease_ioctl(struct drm_device *dev,

-- 
2.56.1

