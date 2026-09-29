Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8C63DD52B
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 19:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790710479; cv=none; b=e06RbzzNCW9YxtiLOcOBm1x4L8GlnRJARt9MD1F5VH2bh2KfZhQsELTFDf9eoEXnggTlgfKvYQ/8H6ychAVvm09Dypo3/zLLV+VOWkBnemrRDz4U+ZfWOYvxQ0G+7DbDzaexAPkoUMn9JjV5tHkYOPDXcIEKq+2D9JyEzraC1Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790710479; c=relaxed/simple;
	bh=uNs/atS5wKIff2bcajl7+NRMkfiVXSqCtjIMj5ELq5s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fEtDiorq2YzvLquTCXprGpOQQsdRW/fbLF1tjeBJvlJelxK+emIhQwVcUb6xmTNrzFuyRUJQjDeWoCx09c5DN/jZ3haKJRsdiMlWIuGp+DOJa3TW5eI2EkCNWPWRkgoylrCfSF9BOkJ0Y3LlBVyJ9l6Qqa8Cd5FdEqlr/77PLCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FISsJ2pq; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FISsJ2pq"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so26545045e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790710476; x=1791315276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=acnZdYKptnO57K0FUhrjejxYfH3e0lZEcXBnvErIjnY=;
        b=FISsJ2pqq+q6z1HHoUIbc9lwDmGeiTWUrqyQPEdUn3CjN9RAXH0cjHcX2cdYjttZDJ
         aeXomliiMVJSUCL9bdjYS45otIxTZFuj8eXKM/eRRTTprZSYPmuKxZVTDFoN3UA4ueUp
         cHCteiDTcb3dzGvCrHKzv/LUhCCUSo/Rye9ehv4LUaOKE/jLjjLEUsJdb7WfCC1VqEmR
         Mnx8FcVh2vZrNmcmiStmgjN3Dy0JnqqJoWVsI1pyJTKwclHO0N4M8eZwkZGcxsV/zuL+
         cLMzeGl3lHDAxKXaBUBsXyXHarRv4s0wdZKdKB7PgmewLVHd2jRB5H+/u/MvGfJsAaFB
         ga2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790710476; x=1791315276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=acnZdYKptnO57K0FUhrjejxYfH3e0lZEcXBnvErIjnY=;
        b=TJfvoHJSpD/EcaXxJpjpRlqtwtZXepbt9w0RVrdH3i2UgSNaJKOxGJHR8WdtXvZq3u
         ELC3DQKliJYXumaxtooUN9n3h3N8N/0OoU5S7zrsXn4Pala2UWJeAYNMzCZAGZ/b39wa
         k+GEcnIN2hDrKLJbMP8fKfVSuh9JaKtmv/xDwamZTICXSY/jRoK12Um6KdFciiTux/yR
         fmYRM91UGN6ut6NuGVFbhurskUJnENqG2ghvFDhfaZTV6iOjVtQb0cLxOM2TkZ68rJLT
         DF/NZJWR30vcwtLtATy4tnawKdqP+dpmitWD2HqtG+gpTFMKFp+QbP+wkCR/F6m8T7MU
         a7pQ==
X-Forwarded-Encrypted: i=1; AKwUvBw9a+aMj3P66WLWxXnjAkDrQoOztWD+SVZ+A0Q4FMn/vLvpCm38G3I9CaY3YtE8StjTYG7B/6+UVJX0t2A=@vger.kernel.org
X-Gm-Message-State: AFuF++nDtvEKR8GBYAKnWsqVhZnthGsTODhRdh8DOVCNyJ2yWoyfhpGL
	irKQF9JQ4NE1Ld1+k6mK1xICLH2WGVm3TOXwI+GRMtVh8ftceTDUgsCo
X-Gm-Gg: AYBFou3jv7IVHSOJVc+wvItrJLfuXdhUf02bKfjGUJLez7YKN5+nDY5iaSa+wzmoJTN
	OeXyvKjhztCNGILQMYzfvyQH5tCGk36LgS85glMghT+/sHp4gW/oKBE3U9tmIjTBs0/42LslYrI
	DXZ1XgBBmqhYiVzlROBJ+tuzXltc9OQpYZpCzsDTISM3+icvlW3h+3m4vpKhmFtehZ1jw641+vR
	2cHIqRBASTgsALGhzf2tvS79YUvrq+lRPiXnbxnC78oNgteysti9sElXMeJ4FrSSMx49xDpeolW
	PIVYGsnIzwVHpOyLoiW6NV+7+I02Kg+drCSKeQbEa9qZ9QYWUvYU8Z9zdIIOgiIbhq51632YQPe
	yw7OE70CDePNiR+iBrXtGVYXW85ct/atwXDSVQM8kkA3YwRN03o4nrbWQZY9j0T3APeK9TJfgiw
	pfSgJCMgDWvvlGMqWOiKDLJAyWkV1s5rMn0LCrK4zEWmj80JxKq9yG+yOxV5gCk7aKaox3rXDMe
	cZzr1gYyRmnTgGs5ScC/3Aji/xpkRiWeVPYhsp4SfkMVjnxR0Ko6Ghhm0o=
X-Received: by 2002:a05:600c:19d4:b0:49c:fa21:e73c with SMTP id 5b1f17b1804b1-4a015032c77mr1786905e9.18.1790710475411;
        Tue, 29 Sep 2026 12:34:35 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a014f29530sm4477685e9.1.2026.09.29.12.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 12:34:34 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Mukul Joshi <mukul.joshi@amd.com>,
	Felix Kuehling <felix.kuehling@amd.com>,
	Philip Yang <Philip.Yang@amd.com>,
	Lijo Lazar <lijo.lazar@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH v3] drm/amdgpu: Fix NPA-REVOKE racing an in-flight UALink import
Date: Tue, 29 Sep 2026 20:34:32 +0100
Message-ID: <20260929193432.100694-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The exporter records an importer when it answers NPA-REQ, so it can send
NPA-REVOKE as soon as the BO is freed, before the importer has finished
building the dma-buf for that handle. The revoke handler assumes a fully
imported node: it dereferences imp_xa_node->dmabuf, which is still NULL
until the import completes, and drops the xarray reference the importing
thread still relies on. The importer then links the node and marks it
READY regardless, so the node can be freed while still on the per-remote
list.

Only tear down a node that is READY. A PENDING node is still being
imported and nothing has been handed to user-space yet, so only mark it
for teardown and send NPA-RELEASE. The importer checks for teardown under
the xarray lock before linking the node and marking it READY, and unwinds
otherwise. As NPA-REVOKE always follows NPA-RSP, a revoke that finds the
node NOT_READY is stale, and one that finds it in teardown hits a node
that is already being released, so both are ignored.

Fixes: 7cc82cd90d35 ("drm/amdgpu: Implement mechanism to revoke exported memory")
Assisted-by: LLM
Signed-off-by: David Carlier <devnexen@gmail.com>
---
Changes in v3:
- Handle the node state with a switch: tear down READY nodes, mark
  PENDING ones for teardown, ignore the rest (Mukul).
- Drop the npa_done completion on a NOT_READY node: the exporter only
  records the importer after sending NPA-RSP, so such a revoke is stale
  (Mukul).
- No longer send NPA-RELEASE for a node already in teardown (Mukul).
- Use dev_dbg() for the revoked-during-import message (Mukul).

Changes in v2:
- Tear down only READY nodes, so a duplicate NPA-REVOKE for a node already
  in teardown neither dereferences a NULL dmabuf nor drops the node
  reference twice (Sashiko).
- Complete npa_done when a revoke arrives before NPA-RSP, so the importer
  fails right away instead of timing out into a connection reset (Sashiko).
- Use the current Assisted-by format.

Found by code analysis and compile-tested with W=1. Not tested on hardware,
as it needs two UALink-connected accelerators in a vPod.

v2: https://lore.kernel.org/all/20260926174406.346253-1-devnexen@gmail.com/
v1: https://lore.kernel.org/all/20260926171625.288519-1-devnexen@gmail.com/

 drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c | 51 +++++++++++++++++-----
 1 file changed, 39 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c
index 8411ea17172f..ea18e7f2e0a3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c
@@ -3288,16 +3288,35 @@ static void amdgpu_ualink_process_npa_revoke_msg(struct amdgpu_device *adev,
 		return;
 	}
 
-	WRITE_ONCE(imp_xa_node->node_state, AMDGPU_UALINK_NODE_TEARDOWN);
-	list_del_init(&imp_xa_node->list);
-	xa_unlock(&adev->ualink.imp_xa);
+	switch (READ_ONCE(imp_xa_node->node_state)) {
+	case AMDGPU_UALINK_NODE_READY:
+		WRITE_ONCE(imp_xa_node->node_state, AMDGPU_UALINK_NODE_TEARDOWN);
+		list_del_init(&imp_xa_node->list);
+		xa_unlock(&adev->ualink.imp_xa);
 
-	/* Invalidate the GPUVM mappings */
-	bo = gem_to_amdgpu_bo(imp_xa_node->dmabuf->priv);
-	amdgpu_ualink_invalidate_import_mappings(bo);
+		/* Invalidate the GPUVM mappings */
+		bo = gem_to_amdgpu_bo(imp_xa_node->dmabuf->priv);
+		amdgpu_ualink_invalidate_import_mappings(bo);
 
-	/* Drop the refcount for the node */
-	amdgpu_ualink_imp_xa_entry_put(imp_xa_node);
+		/* Drop the refcount for the node */
+		amdgpu_ualink_imp_xa_entry_put(imp_xa_node);
+		break;
+	case AMDGPU_UALINK_NODE_PENDING:
+		/* The import is still building the dma-buf and nothing has
+		 * been handed to user-space yet. The importing thread sees
+		 * the teardown state and unwinds.
+		 */
+		WRITE_ONCE(imp_xa_node->node_state, AMDGPU_UALINK_NODE_TEARDOWN);
+		xa_unlock(&adev->ualink.imp_xa);
+		break;
+	default:
+		/* NPA-REVOKE always follows NPA-RSP, so a NOT_READY node means
+		 * a stale revoke, and a node in teardown is already being
+		 * released by whoever moved it there.
+		 */
+		xa_unlock(&adev->ualink.imp_xa);
+		return;
+	}
 
 	r = amdgpu_ualink_send_npa_release_msg(adev, remote_acc_id, handle);
 	if (r)
@@ -3760,9 +3779,20 @@ static int amdgpu_ualink_do_import_handle(struct amdgpu_device *adev,
 		return r;
 	}
 
-	/* Add this node to the imported handles list for the remote GPU */
+	/* Add this node to the imported handles list for the remote GPU,
+	 * unless the exporter revoked the handle while the import was in
+	 * flight. The dmabuf is released with the last node reference.
+	 */
 	xa_lock(&adev->ualink.imp_xa);
+	if (READ_ONCE(imp_xa_node->node_state) == AMDGPU_UALINK_NODE_TEARDOWN) {
+		xa_unlock(&adev->ualink.imp_xa);
+		dev_dbg(adev->dev,
+			"IMPORT: handle:%llx:%llx revoked during import\n",
+			handle.handle_hi, handle.handle_lo);
+		return -EINVAL;
+	}
 	list_add(&imp_xa_node->list, &adev->ualink.imp_handles_list[remote_acc_id]);
+	WRITE_ONCE(imp_xa_node->node_state, AMDGPU_UALINK_NODE_READY);
 	xa_unlock(&adev->ualink.imp_xa);
 
 	return 0;
@@ -3938,9 +3968,6 @@ int amdgpu_ualink_import_handle(struct drm_device *dev,
 					"IMPORT: XA import failed for handle:%llx:%llx\n",
 					handle.handle_hi, handle.handle_lo);
 			goto cleanup;
-		} else {
-			WRITE_ONCE(imp_xa_node->node_state,
-				   AMDGPU_UALINK_NODE_READY);
 		}
 	}
 
-- 
2.55.0

