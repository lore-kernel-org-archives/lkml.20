Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F990367F3A
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 19:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789327665; cv=none; b=dNs4vpbPj9CUa+a2bzxv13VBAIBzteiGOVjNM/fWk3VCY7BR9zcHdZpXxi79UWMTEW8ah63tPBZm0dzRRCxrECrgiXwEprQzCScH4jVvaANIqC5U2zTo8lWo/5PbIE7JLWNis7RexkBuA+/AiEip5Yu4JkArF69vKReLm3L6h00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789327665; c=relaxed/simple;
	bh=okO7J18w1eikmbz5Y9dLJaxGfgc7gaxydAYfM/rl3Gg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PRlfYb9qhD1mc7vBZSLpu6ztBp4nZ2RndWnHthBYRgY1kQFw79bKw6ehRcLY83sPQBTIGX8CpZnIYq+per36ig9MTx8h/jM/6iaJbyVlb3Iy8qmR9zbJmJI8+Nvg+9BtJROkCXeb4CRZBb1JzMJwFOuUrfzgAz7p+e6u3d0awUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ok/YjkSB; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ok/YjkSB"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b31b4281eso1491858a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 12:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789327663; x=1789932463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zFIuFlYyGwgxhlN4dUa6fA3JL/Nyeb33Qy5mdvlrTGw=;
        b=ok/YjkSBUR92STr/9mWHyhfMhSIK4syL8qJrw11Gz9NHaj3NOklM7ZqKOY4Qewvkxg
         Qq+RrOVGcJzazFolXzghSP7xH1ibLRUMGl1srbWkfoHja/99YLVFBnkJwpocXLReOVhR
         EG0S0Ta+GKxODBiJBjB5Pxnz7KLJEpgnXQe/EcP5uFmxHkbhnLt2qUkIafLiwflO6yCT
         i/oojCDuAYqMC7TpWJMevG8ijHBG/izWNJNm/tiMYk/DUz7ABOs1cmpegI2YKA2DmHFD
         rFN8KvQqY8Ipv5mv0XmWL8taYVh0Di19F5+aVrNhYURmwI+GiWcu3PY8XiF56lVEUHAr
         yj0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789327663; x=1789932463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zFIuFlYyGwgxhlN4dUa6fA3JL/Nyeb33Qy5mdvlrTGw=;
        b=h5p7BUKdVYnx1WhjIQ6Wo8fWSOqQhrKFr6St/RkUkvjugRbb02aF6M5wAT4p9BYuJc
         BgQZarhzyTODanIP4fNW72GxZh+o49WBm8EUj0eY1MqzZcKTsXmd+0OaRaNYH7AA47B8
         4mxkXQYhXSEbGZym+DvY5g11I1uYVNiDVU5AqhoUWinU9qrJ/DAFQQSV9zipkGDf/NE1
         veySvAhjR0JPy8GHbfxsE+CsIdnqZ/THWN9vrRnBK/03JzAF6Akd0NIj97sbEVIGfbio
         Iv4cbV2RcDbDOCpmTWDdGmY9s8lkK+zkfAwWnKb5UgYD90sCFXDX0trPvGD67zGDMNhP
         MdcA==
X-Forwarded-Encrypted: i=1; AKwUvBx8anoHK/igwtauTsj1Mz84Ze66h+Pn1ngLy61SPIoquAWnxiEMKHVh591F9xidjV8OXlcjI1Q74EcR4p0=@vger.kernel.org
X-Gm-Message-State: AFuF++l+ik1SkDlOAYH/iTu5kxUlQcR16FffIkLclehCMfhaS6VrHnXK
	Iq+ajqjQ0bMYWMaut/ostzbHFC2NdjJjTwPx5TVxQE8pHC/nFMdgh4iAfiKhYQ==
X-Gm-Gg: AYBFou2lxUgqGuuhCch83gd4GLfuKNYoE2siFmTVRIrpon+iAIOLzDSqVEZ2+BzOgQQ
	/UwDlzmLHh99rWPfydUMvOoQSTMHGeMqj6PBco3gahyOo9nkz8gLtqW5NtYNTKeY/Fhk+xY4evm
	ZB8VmKni0SeZ99gZ0Zr8gdK2tKN4hHG32pTLWXG9qYtv757EHQl9o+HxQ+zDXMxehl6DTJyWjZL
	HvY2KQqx0jIMdEoF0HvcUpiw4lc/cBkWvVZw+L68JvKRUeibqRV5Tea+BO64JMRsPH9weaynS6+
	GEBIAVaFSL/22uG0tzjLvTC7pdP3LxpqmAB0GZnVHDyU7Um3ahwIp5pE+yz4h1ajoICe8hv097i
	rP3sGK1if/sOBg3RWzt3cH84/sQtcszyDl93eIq3L0/jPd7aH26okQa6e5l9TVhSeJgos7lY+KH
	gfYABU+wTfVCHNt/t/6/ivK2wSNa0pr3Zb+QB0GtLRz9ggweXbgkrfdzmb+IRh43ttHmnFaYHaM
	PMma8N9yVNMv5n6PtZ2o3CN8+d+QVYvnCV1V96KyQ8ldmId/ctKypqsS+A65/YwnCSTLrU61X35
	b8Eg+QzfSf93tGAc/InhfexVucRYDRq7iW12SxN9EgJJyCFd
X-Received: by 2002:a17:90b:588d:b0:398:bacb:1137 with SMTP id 98e67ed59e1d1-39d9c3771a8mr25400733a91.19.1789327662690;
        Sun, 13 Sep 2026 12:27:42 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d95864b4fsm17425657a91.15.2026.09.13.12.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 12:27:42 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: v9fs@lists.linux.dev
Cc: Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Christian Schoenebeck <linux_oss@crudebyte.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] 9p/xen: Use array for data rings
Date: Sun, 13 Sep 2026 12:27:40 -0700
Message-ID: <20260913192740.29668-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Store the fixed set of Xen 9p data rings in the frontend private
allocation instead of allocating a separate rings array.

This keeps the data ring storage tied to the frontend lifetime and
simplifies the allocation and cleanup paths.

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: switch to normal array.
 net/9p/trans_xen.c | 66 ++++++++++++++++++++--------------------------
 1 file changed, 29 insertions(+), 37 deletions(-)

diff --git a/net/9p/trans_xen.c b/net/9p/trans_xen.c
index f9fb2db7a066..1e87a55e6042 100644
--- a/net/9p/trans_xen.c
+++ b/net/9p/trans_xen.c
@@ -55,7 +55,7 @@ struct xen_9pfs_front_priv {
 	char *tag;
 	struct p9_client *client;
 
-	struct xen_9pfs_dataring *rings;
+	struct xen_9pfs_dataring rings[XEN_9PFS_NUM_RINGS];
 };
 
 static LIST_HEAD(xen_9pfs_devs);
@@ -277,41 +277,38 @@ static void xen_9pfs_front_free(struct xen_9pfs_front_priv *priv)
 {
 	int i, j;
 
-	if (priv->rings) {
-		for (i = 0; i < XEN_9PFS_NUM_RINGS; i++) {
-			struct xen_9pfs_dataring *ring = &priv->rings[i];
+	for (i = 0; i < XEN_9PFS_NUM_RINGS; i++) {
+		struct xen_9pfs_dataring *ring = &priv->rings[i];
 
-			cancel_work_sync(&ring->work);
+		cancel_work_sync(&ring->work);
 
-			if (!ring->intf)
-				break;
-			if (ring->irq >= 0) {
-				unbind_from_irqhandler(ring->irq, ring);
-				ring->irq = -1;
-			}
-			if (ring->data.in) {
-				for (j = 0; j < (1 << ring->intf->ring_order);
-				     j++) {
-					grant_ref_t ref;
-
-					ref = ring->intf->ref[j];
-					gnttab_end_foreign_access(ref, NULL);
-					ring->intf->ref[j] = INVALID_GRANT_REF;
-				}
-				free_pages_exact(ring->data.in,
-						 1UL << (ring->intf->ring_order +
-							 XEN_PAGE_SHIFT));
-				ring->data.in = NULL;
-				ring->data.out = NULL;
-			}
-			if (ring->ref != INVALID_GRANT_REF) {
-				gnttab_end_foreign_access(ring->ref, NULL);
-				ring->ref = INVALID_GRANT_REF;
+		if (!ring->intf)
+			break;
+		if (ring->irq >= 0) {
+			unbind_from_irqhandler(ring->irq, ring);
+			ring->irq = -1;
+		}
+		if (ring->data.in) {
+			for (j = 0; j < (1 << ring->intf->ring_order);
+			     j++) {
+				grant_ref_t ref;
+
+				ref = ring->intf->ref[j];
+				gnttab_end_foreign_access(ref, NULL);
+				ring->intf->ref[j] = INVALID_GRANT_REF;
 			}
-			free_page((unsigned long)ring->intf);
-			ring->intf = NULL;
+			free_pages_exact(ring->data.in,
+					 1UL << (ring->intf->ring_order +
+						 XEN_PAGE_SHIFT));
+			ring->data.in = NULL;
+			ring->data.out = NULL;
 		}
-		kfree(priv->rings);
+		if (ring->ref != INVALID_GRANT_REF) {
+			gnttab_end_foreign_access(ring->ref, NULL);
+			ring->ref = INVALID_GRANT_REF;
+		}
+		free_page((unsigned long)ring->intf);
+		ring->intf = NULL;
 	}
 	kfree(priv->tag);
 	kfree(priv);
@@ -450,11 +447,6 @@ static int xen_9pfs_front_init(struct xenbus_device *dev)
 	if (!priv)
 		return -ENOMEM;
 	priv->dev = dev;
-	priv->rings = kzalloc_objs(*priv->rings, XEN_9PFS_NUM_RINGS);
-	if (!priv->rings) {
-		kfree(priv);
-		return -ENOMEM;
-	}
 
 	for (i = 0; i < XEN_9PFS_NUM_RINGS; i++) {
 		priv->rings[i].priv = priv;
-- 
2.55.0

