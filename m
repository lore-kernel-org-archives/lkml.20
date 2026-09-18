Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2E242123A
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 23:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789774956; cv=none; b=U6HumRkiceX/ys0JV5/txQVqdPVO1C4r9oAWWKlNuITWHr7UyXMDEDj3rCbAqRZ57cWxYHMI93ard4EkSQNswMfaPKi2nCBH9rJfEHK1Z9YEOk1a/IntheGgzn0xyBxeDngrLF5KkrZ4xsPNe9Hcbv6zIXUF/FGl29Zl8ep6iCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789774956; c=relaxed/simple;
	bh=lC+cCVH/Vq3HnTneYs+xNzFi6z6mlCn+/pJJg29y/QY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HQpmofoRiri8wAVRNTaVIo/1u+veSpAqgVHK0UikvFRdKHQxDc2qT85oti2upI1Yy26nC3ZXLK108uS1lAN2/rs7UkTn6/CVJ5lIwd4hnzGjVufIgxQzAF5CcbRJKGvv59b6zCqzsh2HKhM2+ZvKSeSw0vQPhqbaXIoa9Wcx+08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=3eQJ/ASa; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="3eQJ/ASa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=GkAK7Rok340HmOMZVxsU9ayK4Ahf0SiRK3fbh6XWXdI=; b=3eQJ/ASamNbxSm5H4MJ0mkVWTS
	faJB5QRG5ilo2/L3ZLytDCI5vMSJ46A9CHjDtGAdprYV2hBBzLwxd/A1sTh5kS51hVhAwEv6Rm8xq
	0NBu+1+Rwa9qAGqlcLlh7QHkIhpHdVB1PDESSdgm4Xfj9KpNmzD5oCIsFDgLag7QMgwSamzkHjTYX
	FgaLaJmzfMQhqnkbkHDDBARWBZr3XtNdCST7S+DcUkNEevFi8hAdzuSi6w8WCQwMcjHkHYq1TzLuH
	QAmyrBf75prsCT1hQ+POj4hAFKJg4PFJ0cF46Li5kN204asAukXLo+1kgme9XT8z8wtYGmJ4m8lN5
	31gHdqhw==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7iDu-0000000FiDz-3uAR;
	Fri, 18 Sep 2026 23:42:30 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/connector: repair kernel-doc descriptions
Date: Fri, 18 Sep 2026 16:42:29 -0700
Message-ID: <20260918234229.3168183-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix all kernel-doc warnings:

WARNING: ../include/drm/drm_connector.h:292 struct member 'cnmvrr' not described in 'drm_hdmi_vrr_cap'
WARNING: ../include/drm/drm_connector.h:292 struct member 'cinema_vrr' not described in 'drm_hdmi_vrr_cap'
WARNING: ../include/drm/drm_connector.h:292 Excess struct member 'mcnmvrr' description in 'drm_hdmi_vrr_cap' (did you mean one of: 'cnmvrr', 'cinema_vrr')
WARNING: ../include/drm/drm_connector.h:292 Excess struct member 'mcinema_vrr' description in 'drm_hdmi_vrr_cap' (did you mean one of: 'cinema_vrr', 'cnmvrr')
Warning: include/drm/drm_connector.h:2658 No description found for return value of 'drm_connector_lookup'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org

 include/drm/drm_connector.h |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

--- linux-next-20260918.orig/include/drm/drm_connector.h
+++ linux-next-20260918/include/drm/drm_connector.h
@@ -264,10 +264,10 @@ struct drm_hdmi_vrr_cap {
 	/** @fva: flag for Fast VActive (Quick Frame Transport) support */
 	bool fva;
 
-	/** @mcnmvrr: flag for Negative M VRR support */
+	/** @cnmvrr: flag for Negative M VRR support */
 	bool cnmvrr;
 
-	/** @mcinema_vrr: flag for Cinema VRR support */
+	/** @cinema_vrr: flag for Cinema VRR support */
 	bool cinema_vrr;
 
 	/** @mdelta: flag for limited frame-to-frame compensation support */
@@ -2652,6 +2652,8 @@ static inline u32 drm_connector_mask(con
  *
  * This function looks up the connector object specified by id
  * add takes a reference to it.
+ *
+ * Returns: drm connector object if found or %NULL if not found
  */
 static inline struct drm_connector *drm_connector_lookup(struct drm_device *dev,
 		struct drm_file *file_priv,
