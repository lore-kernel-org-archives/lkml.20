Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5920B2BEC5F
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 02:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792290883; cv=none; b=Ua/JXd6lzLwcVKukaYNrH6GFD4dC3XgCT6Pi2VlWzJwRLwoZn6InAOmpGxL67QsAwWXq1C0j0C1YAe2QHfzGhK7Vr1mKcdfepPt+leg1rvjtfe6cJu7/ARKp2nlWkcIKqDTvMM9jD3oJ2A1jfEeoXrBpl3NleL2NDp/AEsh3WYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792290883; c=relaxed/simple;
	bh=amXIGpnA1xRsk4c4805nJ28it3Nl1OxrGpO61NTy6tI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uz7rZlRTFotCXfM4R9PpBWPdPKWwVCD05TbYbUh8iuR+nPBktvbomEMpX53QL+eIi7A5tv60T6TnmudI3JTtvRP1HawC8Yh4VngU5p8AQefdMO5xO61pD5BVeqQq/Vrvu7/XcPhymNUPTSP9U8VuJ05OzoQ9lXQg4pfTr68Wxdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D6vGZ1P1; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D6vGZ1P1"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5363316fa0cso12894941cf.3
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 19:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792290881; x=1792895681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=enBfETJLRoNIRyzwwRZuG5sQrbPTYtIwGM7+j3cSJxc=;
        b=D6vGZ1P1E/lBZxnk8F6R3O2hkuffTcsmtTpHrWcz8l7buzhnMOrQn4VkROeohz5rHQ
         kBe3aiUWN1a6eTcX8mYIkfQu9Uhsnv/HOmWSDrVkwGVy7mYD6ieUxCD/rToTf6qxKkEg
         RzaVrtJ5m0i09ZSAwRiutGf9G3Un+X4ZidrSByScZIqnC5u7Kt0QydAz8jvBOe2W8nsr
         osezExuVqqVIfgc7g5cvteXmt+46rdO3hXYJJoi8YW4O5MCsgMS0epqB+c29IlNJ60uU
         C4/xmWsAxTlF0a0pilgkKYRQOmo0K9aSq+0nd/6pozC2Q9y3zOHzZLMk0ZPwLX8lSUG6
         cGqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792290881; x=1792895681;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=enBfETJLRoNIRyzwwRZuG5sQrbPTYtIwGM7+j3cSJxc=;
        b=SX0605TMzSkAJLkTaMNfQ+0P/HpT6Pa7LqZedrBsHqR0jeoRAt3lwqcLWoQIwFvakW
         bgGuoBSOcdcyRgwPmd5fbkES8XW63shdox4oIYmea0jtRXvhwHiZG/7nO1kPFIRDIDZQ
         FlJwFRZz4byHxkPIZmQmH+HS3QpEpghN5Mf6LPBciLUGPM7SD5y5q/wzlaZAxe/jfBB0
         1HGPOFe8glnU9bzOgQVKJIufl3Zgq/52w6aNyGxBjQbkhQWwNgQGl1Bptd/wWL8ZfJhq
         sphnnfkgIyMkvBsp8cMmJwzq4RGfP1ASZ07YckhIyAiNNtdm8HpRMs9QMb81vZOpiLgu
         uFwg==
X-Forwarded-Encrypted: i=1; AKwUvBxnfygZKJSz2lUrmE2WE5pi4VoE07ANvV5BXbqVSnvN+KTR3k5+nInXCsZcuOG/SwRGDunH3COfubTmWTo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLwUVpttF603Kby4PMqTSXR5MAbsrHPSQD1lJhuJQmyl86vY9mN
	SgEjU45z/9h9IsqcvZt3JlSm9+EjSUZeTsUN4lGMVc4oi8b4VE7U03Y=
X-Gm-Gg: AYBFou0fO3DvNL9Ih/7yOJJARMi0AXDIfN7X0cK9hnbj8Iyn9F1vm/BtTGdEk9S7u1i
	hPXqH9eSXB6xMYZ2FjSSdrRRH8b4hbtEcHXEQ+FDwCLVqtZrZaLdkT7QZeh1osR8Geffi8BpDAP
	sJWIsn2Ug0GC0/RBjk5p3KJ4ArdEKf8hCXbTstH11Dc5aFMCZcy0Bm3ZKV9Bov99L/sUG/BsAER
	q3Ywx1M9OXbgXl4NxvQP565m5Km/CAg/F4mOCjpO8uDr5dvRW/W68NzL/s+C+llPO3teNR2/ERU
	W1JqefzOSALXJ/KbIR2HRLEC/XqXxi463Q+sDR7r31wm+d+5I56VNKdGVi6gP+wMO4fDv5rBsfj
	xTki1qhfIL682eQQnD5pA4KPFSVfBMbrR4oBXOLYmkpenopuXAlUwgtHeFNvWMbAc9kXGXLLfFq
	DQgCOIWmoOgrNMRlZ6qG8cPdtrNIPg310PpcJFLUSFhrzXKRbqH7VAgsUka4v9fnvzbKDAzDlkV
	yuTTMGsXNa6rLqC01LN0vwQ4hmqWRUuaIsbrY79RWqpUW4sWJ6fg2rwDv/UkgxK9vS3yhi43yD6
	Xfh65ObDwU1zu6dbUfg0qBZe3aPN
X-Received: by 2002:ac8:5745:0:b0:532:abc9:8f4f with SMTP id d75a77b69052e-53645ff0043mr60804511cf.37.1792290881142;
        Sat, 17 Oct 2026 19:34:41 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcb8c4adasm61046666d6.1.2026.10.17.19.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 19:34:40 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Benson Leung <bleung@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	mhun512@gmail.com,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v3] platform/chrome: cros_ec_typec: Stop altmode work during partner removal
Date: Sat, 17 Oct 2026 22:34:38 -0400
Message-ID: <20261018023438.3902617-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DisplayPort and Thunderbolt port altmodes queue work to deliver VDM
responses to partner drivers. Partner altmode unregistration does not
drain this work, so it can run while the partner driver is being removed
and access released driver data.

Look up the corresponding port altmode with typec_altmode_get_partner()
and disable its work before unregistering the partner altmode. Keep the
work disabled while the partner driver is removed, then clear pending
response and DP status state before re-enabling it for a new connection.
Use the same cleanup when list-node allocation fails after registering
an altmode.

This issue was identified as part of our ongoing research while
reviewing kernel code.

Fixes: dbb3fc0ffa95 ("platform/chrome: cros_ec_typec: Displayport support")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v3:
- Use typec_altmode_get_partner() while walking the existing altmode list
  instead of separately iterating over all port altmodes.
- Replace the port-wide helper with cros_typec_enable_altmode() and drop
  the redundant cancellation during port altmode unregistration.
- Drop the allocation-order change. Reuse a single-altmode cleanup helper
  for list-node allocation failures instead.

Previous version:
https://lore.kernel.org/all/20261002200108.399258-1-mhun512@gmail.com/

Validation: GCC 15 x86_64 W=1 composite-object builds passed with DP/TBT
both enabled, DP only, TBT only, and both disabled. Patch application and
checkpatch checks also passed.
No hardware or runtime testing.

 drivers/platform/chrome/cros_ec_typec.c      |   20 +++++++++++++++++--
 drivers/platform/chrome/cros_typec_altmode.c |   28 ++++++++++++++++++++++++++
 drivers/platform/chrome/cros_typec_altmode.h |    7 +++++++
 3 files changed, 53 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 50a68819ceb7bbfbd888ca919d678d4c75237c26..09a5c58e1edbb1599e3903c15cab2766a849a891 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -274,6 +274,22 @@ static int cros_typec_add_partner(struct cros_typec_data *typec, int port_num,
 	return ret;
 }
 
+static void cros_typec_unregister_altmode(struct typec_altmode *amode, bool is_partner)
+{
+	const struct typec_altmode *port_altmode =
+		is_partner ? typec_altmode_get_partner(amode) : NULL;
+
+	/* Partner drivers can queue port work until their removal completes. */
+	if (port_altmode)
+		cros_typec_enable_altmode(port_altmode, false);
+
+	typec_unregister_altmode(amode);
+
+	/* Port altmodes are reused when a partner reconnects. */
+	if (port_altmode)
+		cros_typec_enable_altmode(port_altmode, true);
+}
+
 static void cros_typec_unregister_altmodes(struct cros_typec_data *typec, int port_num,
 					   bool is_partner)
 {
@@ -284,7 +300,7 @@ static void cros_typec_unregister_altmodes(struct cros_typec_data *typec, int po
 	head = is_partner ? &port->partner_mode_list : &port->plug_mode_list;
 	list_for_each_entry_safe(node, tmp, head, list) {
 		list_del(&node->list);
-		typec_unregister_altmode(node->amode);
+		cros_typec_unregister_altmode(node->amode, is_partner);
 		devm_kfree(typec->dev, node);
 	}
 }
@@ -915,7 +931,7 @@ static int cros_typec_register_altmodes(struct cros_typec_data *typec, int port_
 			node = devm_kzalloc(typec->dev, sizeof(*node), GFP_KERNEL);
 			if (!node) {
 				ret = -ENOMEM;
-				typec_unregister_altmode(amode);
+				cros_typec_unregister_altmode(amode, is_partner);
 				goto err_cleanup;
 			}
 
diff --git a/drivers/platform/chrome/cros_typec_altmode.c b/drivers/platform/chrome/cros_typec_altmode.c
index 66c546bf89b532d3bae1de322a1cfb1205e0190f..c06ad9238ad740d21d38015b7ece831660a475da 100644
--- a/drivers/platform/chrome/cros_typec_altmode.c
+++ b/drivers/platform/chrome/cros_typec_altmode.c
@@ -37,6 +37,34 @@ struct cros_typec_dp_data {
 	bool pending_status_update;
 };
 
+void cros_typec_enable_altmode(const struct typec_altmode *alt, bool enable)
+{
+	struct cros_typec_altmode_data *adata = dev_get_drvdata(&alt->dev);
+	struct cros_typec_dp_data *dp_data;
+
+	/* An altmode without its optional implementation has no work. */
+	if (!adata)
+		return;
+
+	if (!enable) {
+		disable_work_sync(&adata->work);
+		return;
+	}
+
+	mutex_lock(&adata->lock);
+	adata->header = 0;
+	adata->vdo_data = NULL;
+	adata->vdo_size = 0;
+	if (adata->sid == USB_TYPEC_DP_SID) {
+		dp_data = container_of(adata, struct cros_typec_dp_data, adata);
+		dp_data->configured = false;
+		dp_data->pending_status_update = false;
+	}
+	mutex_unlock(&adata->lock);
+
+	enable_work(&adata->work);
+}
+
 static void cros_typec_altmode_work(struct work_struct *work)
 {
 	struct cros_typec_altmode_data *data =
diff --git a/drivers/platform/chrome/cros_typec_altmode.h b/drivers/platform/chrome/cros_typec_altmode.h
index 3f2aa95d065af709643ad653df487a9987780da4..7f47eae66b0c23d14f158296075d1092df704676 100644
--- a/drivers/platform/chrome/cros_typec_altmode.h
+++ b/drivers/platform/chrome/cros_typec_altmode.h
@@ -11,6 +11,13 @@ struct typec_altmode;
 struct typec_altmode_desc;
 struct typec_displayport_data;
 
+#if IS_ENABLED(CONFIG_CROS_EC_TYPEC_ALTMODES)
+void cros_typec_enable_altmode(const struct typec_altmode *alt, bool enable);
+#else
+static inline void cros_typec_enable_altmode(const struct typec_altmode *alt,
+					    bool enable) {}
+#endif
+
 #if IS_ENABLED(CONFIG_TYPEC_DP_ALTMODE)
 struct typec_altmode *
 cros_typec_register_displayport(struct cros_typec_port *port,
-- 
2.53.0
