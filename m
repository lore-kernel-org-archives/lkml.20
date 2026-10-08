Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA214C67F6
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 15:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791474647; cv=none; b=ZTFF/KAbabs3b4jYAy6h1wG3GNY+bMD7jzKWgzteCke7JwamSqKJZU38BRoXlANfNg3JlTb8k56FpErUg+2Q2YO5bVnE44z9dzgIsU2GIqJYQnI+gLvfHLlOQETNeHW6xv5sLKbgngJpEjTa3IeCORP3xMMCHTrj/ncAZuLMfFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791474647; c=relaxed/simple;
	bh=+cqdQ9gmgKOhr55i/OTv9gp5iM1UodxiR77kiuHe4g4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=hJTSk/dRTT6DK1yYd4du9x6HOlAKRmRUG7Vxitdw4M2X1NuY5lHP48Zi5XzMSN8as+ZkcUnxY5praxlMEykyzT6zbwAm8bebYOVUchwRE/sqPmVRN5vb3LBERcfhLgo1NbXNnuxzSKuIfd896wVVlq7h40vjejgixliATdJ6TAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=adk85DSC; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="adk85DSC"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5e507e778e4so1105018e0c.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 08:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791474645; x=1792079445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z605x3oSurFK9+1Jj7NngNX+hXuD5vIj60PGN3GhQpM=;
        b=adk85DSCAKiYFoJanwcNUla1SL9ypUsEBLkyowKxAatW/5pTLagQXuZOMv3/PGK0Rj
         MK2YBYChWKthmRiZ7j2T+x+wrNgWHcGxC4gV4MpBMYEhOW7VvPQS9BkDvyXi8SpUNpCn
         fJCZXHkIuFaCnenwa1kABdkFQ0lmTBi5JHtwB8vntaVhOO3yQonAIiBP1I9e00q1NkJM
         tprrQMf6lHrkPeTx6Fie1CNjvPC9VHIm0QHhpeupiIhzGuGyEcXFWYyScKHoc1hPq0zl
         5mNW/wzFufBcKqeIYIMjtWSEwzYX4Gla/R6mfUBHDjl98FCIranilXQwSdvfTVFyKOiP
         CakQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791474645; x=1792079445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Z605x3oSurFK9+1Jj7NngNX+hXuD5vIj60PGN3GhQpM=;
        b=Wf7e0HhrFsneWtBfTVWvSuqDb3w+uKR5dpVzQltk1zpaH1Jh/+C77QCeWMhOzSmI3u
         +WoL9qXYk4z+t93AzffVZspBu/E+LJSUOPUr8eo5tJ4V5xNw9FIfTx1edF45JWf58iYl
         iUNMtqn/hMvqd0DRgOfzwHeDUbvSZNIxF55//+A8yDAmMs8vixmP8nl1aTKAbsjeCSaJ
         laiz5GaL+4yXq7rJr9GWnTrJ4iWXHBL3OR1Hnfos9ob76RCb8gKJZkJ30jtoTz4dYOGZ
         xKqi1tO0zKmKRf+FtX0i6oqOag5NFX0boRb35xSmbabfZZI7sM/uwUhvtmy47Cz/GNji
         AdwA==
X-Forwarded-Encrypted: i=1; AKwUvBxSXS6TUVna9dn8dfSkN35nJgUdW6+aJfM+zw5fvF/8H6fk1wOCOHE4C9aul/pzS/zCRU92BbgeYTSFW4Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9Y+lu3xvbg0ITxt4PDnlvKGj82Gix73IqHJoJSvbRhfH6xtjp
	2ivrp8Y5Bm4DLovvRmEKvWMgHXFMYtqXqvMo+6WKQ/RmlDmkqC2SvkvJ
X-Gm-Gg: AYBFou1DhnBvQ1/jwLgHxvJLW+lMz2gVcRHAwukPitSQJiLpWRlhrDPfjCmJVOzEFDG
	aKQpdyf+TlnUXsuKT7uePbYmS+q+JiW0VUaDqPEFACMJS5h/Bvlnr7WatxyxTKsJwdjMoNgxzzP
	3+Lb1jVdy0IFI9F6v8MbLxnVxi3mCiZXUQ8UIUkGZdBhT+AH6GCG6U3c2nSd9dIqF27/LHntK1H
	pm/4k4BPpUMjSzSowo1Vka1l0q84S7fPDYC1PGdO93Xo7AirylEfPyeOkBu1j8xb0ux/PHvN5Yt
	STC4z7fpse2aEBVXKK+fPSYxY0SjQmcJKwCx3cewW7uXboThCRqgN6mQ+6KFZgsVVWW8iFRIKq3
	e1kF6VQvPIno7+zsrkNs9FpPcJzf7kI4BzSFoe80BQaFo0dVbiWD+zyb2cVpHIlbDUrVabd+Vdq
	QySEz6wdALPTM6PIbOGTL+4YX3uF7g6mY1oA82OQeKSGBwrdQ=
X-Received: by 2002:a05:6102:4426:b0:7b2:508e:3d57 with SMTP id ada2fe7eead31-7ca36e40c71mr1688635137.4.1791474645346;
        Thu, 08 Oct 2026 08:50:45 -0700 (PDT)
Received: from fedora ([2804:14c:3b83:954b::e289])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-98e39adb533sm4293125241.2.2026.10.08.08.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 08:50:43 -0700 (PDT)
From: Julio Faracco <jcfaracco@gmail.com>
To: Dave Airlie <airlied@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	virtualization@lists.linux.dev,
	spice-devel@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2] drm/qxl: Fix out-of-bounds read in client monitors head access
Date: Thu,  8 Oct 2026 12:50:34 -0300
Message-ID: <20261008155034.55688-1-jcfaracco@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qxl_update_offset_props() dereferences
qdev->client_monitors_config->heads[output->index] for every connector.
The connector list holds qxl_num_crtc entries (default 4), but heads[] is
only allocated for client_monitors_config->count entries. When the client
reports fewer monitors than qxl_num_crtc (e.g. a guest started with
heads=1), output->index exceeds count and the read runs off the end:

    BUG: KASAN: slab-out-of-bounds in
         qxl_display_read_client_monitors_config+0x61e/0x6f0 [qxl]
    Read of size 4 ... located 16 bytes to the right of
    allocated 32-byte region

Factor the index-vs-count check already open-coded in
qxl_add_monitors_config_modes() and qxl_conn_detect() into a
qxl_output_get_client_head() helper that returns the head or NULL when the
config is absent or does not cover the output's index, and use it in all
four places, including qxl_conn_get_modes() which had the same unchecked
heads[output->index] access reachable from the mode probe path.

Signed-off-by: Julio Faracco <jcfaracco@gmail.com>
---
v2:
- Also convert qxl_conn_get_modes(), same unchecked access
  (from Sashiko AI review).

 drivers/gpu/drm/qxl/qxl_display.c | 40 ++++++++++++++++++++++---------
 1 file changed, 29 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
index 0719fc6a52d5..35440ee71b83 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -148,6 +148,21 @@ static int qxl_display_copy_rom_client_monitors_config(struct qxl_device *qdev)
 	return status;
 }
 
+/*
+ * Return the client monitors config head for @output, or NULL when the
+ * client monitors config is absent or does not cover this output's index.
+ */
+static struct qxl_head *qxl_output_get_client_head(struct qxl_output *output)
+{
+	struct qxl_device *qdev = to_qxl(output->base.dev);
+	struct qxl_monitors_config *cfg = qdev->client_monitors_config;
+
+	if (!cfg || output->index >= cfg->count)
+		return NULL;
+
+	return &cfg->heads[output->index];
+}
+
 static void qxl_update_offset_props(struct qxl_device *qdev)
 {
 	struct drm_device *dev = &qdev->ddev;
@@ -158,7 +173,9 @@ static void qxl_update_offset_props(struct qxl_device *qdev)
 	list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
 		output = drm_connector_to_qxl_output(connector);
 
-		head = &qdev->client_monitors_config->heads[output->index];
+		head = qxl_output_get_client_head(output);
+		if (!head)
+			continue;
 
 		drm_object_property_set_value(&connector->base,
 			dev->mode_config.suggested_x_property, head->x);
@@ -263,12 +280,11 @@ static int qxl_add_monitors_config_modes(struct drm_connector *connector)
 		return 0;
 	if (h >= qxl_num_crtc)
 		return 0;
-	if (!qdev->client_monitors_config)
-		return 0;
-	if (h >= qdev->client_monitors_config->count)
+
+	head = qxl_output_get_client_head(output);
+	if (!head)
 		return 0;
 
-	head = &qdev->client_monitors_config->heads[h];
 	DRM_DEBUG_KMS("head %d is %dx%d\n", h, head->width, head->height);
 
 	return qxl_add_mode(connector, head->width, head->height, true);
@@ -1054,11 +1070,11 @@ static int qxl_conn_get_modes(struct drm_connector *connector)
 	struct qxl_output *output = drm_connector_to_qxl_output(connector);
 	unsigned int pwidth = 1024;
 	unsigned int pheight = 768;
+	struct qxl_head *head;
 	int ret = 0;
 
-	if (qdev->client_monitors_config) {
-		struct qxl_head *head;
-		head = &qdev->client_monitors_config->heads[output->index];
+	head = qxl_output_get_client_head(output);
+	if (head) {
 		if (head->width)
 			pwidth = head->width;
 		if (head->height)
@@ -1111,15 +1127,17 @@ static enum drm_connector_status qxl_conn_detect(
 		drm_connector_to_qxl_output(connector);
 	struct drm_device *ddev = connector->dev;
 	struct qxl_device *qdev = to_qxl(ddev);
+	struct qxl_head *head;
 	bool connected = false;
 
 	/* The first monitor is always connected */
 	if (!qdev->client_monitors_config) {
 		if (output->index == 0)
 			connected = true;
-	} else
-		connected = qdev->client_monitors_config->count > output->index &&
-		     qxl_head_enabled(&qdev->client_monitors_config->heads[output->index]);
+	} else {
+		head = qxl_output_get_client_head(output);
+		connected = head && qxl_head_enabled(head);
+	}
 
 	DRM_DEBUG("#%d connected: %d\n", output->index, connected);
 
-- 
2.55.0

