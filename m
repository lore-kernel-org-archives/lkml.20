Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9099147FAF9
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788270020; cv=pass; b=KNN9D2zPnS7b3SJYPzdBc6kHuuJosItfjoCi9Jxz1U+D2tB+dEGCyULlqd2GqI5DW7qisaRO9naVnqwZ4NGCjCj/uqGfJq9U+XD17cjKngN2I4kC1E40anHNc6dRjKNXR/QD3s0RcsuRHfNUEI2LuSIGjJ8C6jG/3PeXh9jhJSM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788270020; c=relaxed/simple;
	bh=nECeWSE7tXlAvZyStBxd9zP2MSwAj5+14hAdtWzUArs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VPWxEfVsCWlwOkiq/DyHKhRA/Z914P6YEX0V2066AG9IeIO2STGiQ9s2eVgz/vUYkiSXNpxx21qpV0gPX6zLNorYPhTlCcDP16zTPpJxwZyF8KlvSg3NTV5WpzmXXN4nv/wOnUq7DDj6OArmmLZdTepo9B1Gw+1cP3iR1d7FP/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=PXbAy1Ni; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="PXbAy1Ni"
ARC-Seal: i=1; a=rsa-sha256; t=1788269992; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nry4ugQOl/Iu/E673t76DZXpR0nhQujHqDzcSOCFgv9O6ay9n4UMKegSg/zbZlIqMUxqOCB9DwyuhfMjrUr1pCo3ZMG+O+KOTyMj4N+AyaF518TVL9/Evl/VqlGaAjFXkdmkZrzflOQ8wwphv8sgyOpg+0zeFf57tjVpGubfhJY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788269992; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=UuLBKWOVqpuqjOy5jkxqd2Ih1GKAPwy4tleGufy6v/o=; 
	b=dzIMoZCDyW2KYaYk8Ei7a8DN1wnDIMwNRyDG5DBGf5vEarZxdebrJ3qjlsHvtNc34AksVy8MF5RkwnFMtkAMTrghT4++7w4nwJ/ZIo8b+z0vDYS77dPkUbSohjLqgDfWxrsi7/QMxgsmQYEpIISVnSUegEjqWwNLRB4UNTfTHGA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788269992;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
	bh=UuLBKWOVqpuqjOy5jkxqd2Ih1GKAPwy4tleGufy6v/o=;
	b=PXbAy1NiGOaiMI/0E8brgr/lVSX77r4o2IxcjtUYCagrkqDIdUczP233hY6XJ1kW
	FnCbI9T2Q5iCMlJCv/k2Gt7zvG3NSBX/2Mgn5F/2E4OpbAQuvObfyDodMTbAk8x+KTr
	lBm9rVEZpxXAnU2W935EFqDoA9Eryg1iBeeDj+rE=
Received: by mx.zohomail.com with SMTPS id 178826998951974.78285142484401;
	Tue, 1 Sep 2026 06:39:49 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 01 Sep 2026 15:39:27 +0200
Subject: [PATCH] drm/panfrost: Rename "panthor" prefixes in debugfs
 identifiers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-panfrost-prefix-whoopsie-v1-1-138fb4c5a9f4@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/zWNyw6CMBBFf4XM2omlJiTwK4YFlEHGpA87RUkI/
 261ursn97WDUGQS6KodIj1Z2LsM9akCswzuRshTZtBKN6pVNYbBzdFLwhBp5g1fi/dBmFA3F6X
 GWU+GWsj14n+nr31hWcc7mfTZ+yUiPdb8mUoMxkEIjbeWU1dN0aJlMee/QEdbgv443shdrGq2A
 AAA
X-Change-ID: 20260901-panfrost-prefix-whoopsie-26300bf2dce9
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.15.2

When gems debugfs support was copied over from panthor to panfrost, the
function and struct names were not adjusted to carry the panfrost
prefix instead of the panthor prefix.

Rectify this by renaming them. No functional change.

Fixes: e48ade5e23ba ("drm/panfrost: show device-wide list of DRM GEM objects over DebugFS")
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 96a66d673ba6..f5f11ad5f9b3 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -794,7 +794,7 @@ static const struct file_operations panfrost_drm_driver_fops = {
 };
 
 #ifdef CONFIG_DEBUG_FS
-static int panthor_gems_show(struct seq_file *m, void *data)
+static int panfrost_gems_show(struct seq_file *m, void *data)
 {
 	struct drm_info_node *node = m->private;
 	struct panfrost_device *pfdev = to_panfrost_device(node->minor->dev);
@@ -845,15 +845,15 @@ static int show_file_jm_ctxs(struct panfrost_file_priv *pfile,
 	return 0;
 }
 
-static struct drm_info_list panthor_debugfs_list[] = {
+static struct drm_info_list panfrost_debugfs_list[] = {
 	{"gems",
-	 panthor_gems_show, 0, NULL},
+	 panfrost_gems_show, 0, NULL},
 };
 
-static int panthor_gems_debugfs_init(struct drm_minor *minor)
+static int panfrost_gems_debugfs_init(struct drm_minor *minor)
 {
-	drm_debugfs_create_files(panthor_debugfs_list,
-				 ARRAY_SIZE(panthor_debugfs_list),
+	drm_debugfs_create_files(panfrost_debugfs_list,
+				 ARRAY_SIZE(panfrost_debugfs_list),
 				 minor->debugfs_root, minor);
 
 	return 0;
@@ -915,7 +915,7 @@ static void panfrost_sched_debugfs_init(struct drm_minor *minor)
 
 static void panfrost_debugfs_init(struct drm_minor *minor)
 {
-	panthor_gems_debugfs_init(minor);
+	panfrost_gems_debugfs_init(minor);
 	panfrost_sched_debugfs_init(minor);
 }
 #endif

---
base-commit: 0116f19db5931348c937eafa1f76a9a19bf82c81
change-id: 20260901-panfrost-prefix-whoopsie-26300bf2dce9

Best regards,
--  
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

