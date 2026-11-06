Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793977921;
	b=YCkwuCeNeyWM4n4c09xGUEyAX/34JNNT3jlqaLBbExMXZJCOShg6uah5KGxt5xOTG3Gn
	 ykpbTnknLkdJ43CDGxbL85U/W2X7YKFzXPn4UERMvsv+d/obZVKITPRyxN1RG1ygyogqv
	 DNuOeA/q3AYZ05vf17FZ5NJ0ABYNkTlh0L2Qft00+iubTNeq1lLkl2HyCNH8PGAenMnPR
	 DPyJZHYV+fXwkEYGFVufQwI9HEpQv/QO/TelZgJMNbaJ7MbS+5FX9ta4IJj+6V2Dylm0P
	 LilnWxl19saktJAJdO7E032xYNo9OkXxUlpj7inrwL04QltjB53jOWiqN2A+ns6CNNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977921;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=TLDbmk1ZXcxHrpcMpC7HafFvi1Pw8dGElTyKgkks43w=;
	b=Py15YNby0UsvfznkELDh/h7aHdbCjBgOnmqmWw1C7QhdePTax0YfHrevZo/4jHmdhhfx
	 I+LtOLu+/D/ru2WNRMFpRHwlToQpy+/O6t6dIniQkNvn1MaUXzzKQUO+sXHYo9zPjjdhV
	 0YgNmNikKVdevfo6Pt4EhtxE9hCGIqMWYCixRT7DI1rXWV9uOp2fW9Y1uXkaRuvSSRpYc
	 a/U6DCIp1c/58Mr2bC8mTqMcXxHaCCvsFZOhT0zsTrlsiwWc5AskOnl9CZ0dI6U+GRXXd
	 7JYYOBLhrS8VVGq8P2lU3M0fIRS/9De2KLTiBFcQkV11lQZRFkPxddCoIlzoc/bOHTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tixt9pNe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74026606A334
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tixt9pNe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A41F1F008A2;
	Fri,  6 Nov 2026 15:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793977921;
	bh=TLDbmk1ZXcxHrpcMpC7HafFvi1Pw8dGElTyKgkks43w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Tixt9pNezgojkPjKPPpC984lO7ihMcXPmi6oh9eyPLi3/w/ktJErKzPWkRc8eqolj
	 D6nqBByoqbOxA7y2kopVk3n/xK6yJWpebtM4zr49JRGq3nHT0tSN7lV0Cd8FNGR55/
	 99UGYkla7/BCoi+lzGqOewAnjNrYHF9k+UIK/UyTCmyEe/6w5oEDmPGgYHonXxlhd/
	 6S8S/goCsccZ//Wt6zf8dfYMsY8bdnzglHbxm2fVN4l2Mf6B8pCP6cEeQ5ffHqLouB
	 nuSDQd5UojQ1quY1+vfRrnp4J4SNYXR+j/LlW+uBeLhV+CYcRDt5QWf8l/HyS99tIJ
	 4VtBr3ZWFU6sA==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 06 Nov 2026 16:11:41 +0100
Subject: [PATCH v8 3/7] drm/lease: Add a helper to tell whether a lease was
 revoked
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
Message-Id: <20261106-drm-reset-state-flag-v8-3-50fd046b705f@kernel.org>
References: <20261106-drm-reset-state-flag-v8-0-50fd046b705f@kernel.org>
In-Reply-To: <20261106-drm-reset-state-flag-v8-0-50fd046b705f@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2028; i=mripard@kernel.org;
 h=from:subject:message-id; bh=yJ3G96wvMCcjTj2LVCQz3AR51PPKuK+Q3wkQvYzXiSY=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlv3xk8cvSb9TZnunb+GSGnz6Xu71UXuk2LbCrRn3N7/
 4rF5U7pHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAi3Y2MteK+7tPK9y/ItdKM
 FFJXYcxZHrH1tk/70uDNac8W/Zv/cmK5ujCfht9ToR3XHLNmd9rNYGy4feN9aHjwxIb9/w68bF3
 izjtf/t1ss628bNMkV8ziPnbd9OyF7tqpjPaPWkqL7Zb13/sOAA==
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
@@ -148,4 +148,30 @@ bool drm_lease_held(struct drm_file *file_priv, int id)
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
diff --git a/include/drm/drm_lease.h b/include/drm/drm_lease.h
index 53545b4ca9ef..03f7ea36c37c 100644
--- a/include/drm/drm_lease.h
+++ b/include/drm/drm_lease.h
@@ -21,4 +21,6 @@ bool drm_lease_held(struct drm_file *file_priv, int id);
 bool _drm_lease_held(struct drm_file *file_priv, int id);
 
+bool drm_lease_revoked(struct drm_file *file_priv);
+
 void drm_lease_revoke(struct drm_master *master);
 

-- 
2.55.0

