Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BE91E7660
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 17:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790442993; cv=none; b=uPXQ8AI5Dh77YrrnhTWtz6ndUvFTuM3g+v2s8+2H5LH73+Mz8WYvZEBvWFMH+NfDp7U8NoANvo2uwVDR7R3xQZASvbY3Jad1cm6i0NrEp9HxSC01mEoQsXLdMQwSjo5/pbEQmLqNbPWFrSKNxh3a6e2C7dzUSceabeRIG5+gI7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790442993; c=relaxed/simple;
	bh=1bWetRlarqrCY0Hl8VxvvsL8nLQwFNZczfVatNABXnE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ccAZUTlE/YaPUFknBucTjVuL6HDI6tZ3SSjsnrJxVZQ9GjmhNXdp0OdcDqY8GVsF62y+sK7NQPdhpc1ppQd4+TtKg38/qPhruoPvzI9cfIPpVnkWMqouzhtJAlpqjGsOFgAkhQrJ5ueXUcgIsVIiMH8PcKMeuCfQL24EZ/3DFco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tpd+NrVZ; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tpd+NrVZ"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ff23af865so13200685e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 10:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790442990; x=1791047790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q2t4bvCUDvNXEUFZCKABDmLjetOn2pq0VIPxJ8jyYis=;
        b=Tpd+NrVZbMgx+iEtHQQCkxEinHXH+y9k52f+bovCke83Du3PLMJZvjDqIOpij0uCKr
         xGQ18pbi3KkJdM37uAp55XhPQ2dZfwQXvXMNt8kDppDbB6yKvX27wLefZPhCXCNSqCp2
         kPNQdogKpdQjFlNdEYAapo9ftxQcnuXa29sQUjkcU7x3LHXU7g1c7A0xu1HJ7TFqPwur
         WW+689bBuqZTO/D/+91tHY+KCOSCrZqazhSH5B4mJkOpXDrbdvWiFnf1HNw8ybPGqrO7
         ta1Rw23a+jHLyy6fEZz0SnvCHRvp6M6TpYz2FGrI2r3VzMZmGw7WiRy4SQLsF3SymIPM
         kjhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790442990; x=1791047790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q2t4bvCUDvNXEUFZCKABDmLjetOn2pq0VIPxJ8jyYis=;
        b=J7W2XiOK5VtnkwqMC7WjtUsc9J+DOS0JFE1hwTEYlHBnbeTCqnYPWELLFQCis1thQx
         UGKRjIoo0sA8H+lGkq9OwNJcigKPa9x7f8bKnwtDoqrwEIcfUHjZ1kkfww8jZo92Cj9U
         HeWQ+NMfdFtM8IRoVYj1i4iq+8qR/z/3dNZH2c03b3EoKkUiWD0+M12aQEEM0i7hZOHp
         6FKbBq2lZuZFM8dikkXk2f+gVCthX1JRcxwNOsbShMR/Q8CERfxUrWCN/Cn0u3kDogct
         +1iAmWLRfPNM3vyTT8ZN6FbJOvSsZWmlPF5vR95o3QndZQs9ayP7GxdJpIoGL3wDGdpZ
         URag==
X-Forwarded-Encrypted: i=1; AKwUvBz2o9XY9N96CImM4n7K7Fx3KAg5dffkE6MH1qkjvx+picj+CfVfxknaSuX4T1FeU/BvoSC03J2VUa1zL+8=@vger.kernel.org
X-Gm-Message-State: AFuF++mAyZY4hE1O7mXbWXb0kD8r0FvF/LaxbuE+ThVWiYAd51I24Rui
	jxGOysLmswuF/O2Sj3VIl3IOBZl41P95z4yt/Kn3JMeauhFlADFlzt9V
X-Gm-Gg: AYBFou2wuodXtMllJ+e7bXrDLEnAdNZd7O7shrgvT3Cp61r3MPyZ1893f2m+WVDyctA
	q0cRCZdA8+xrjNrDuOSe+mSsNOPNOi9ghdcl9CdGW5pgIxiuUtEIdPZ4N02YZtDEBP4AbuuBVyn
	tPzC5IgOCoLsSPzg1Pwu/InuAeykQhge6S5H+qIdnlDQ6DZudrIStJJcMDBF5aB4jQMQMmTw96i
	AWeYJN9v1uOp4qRxojRjud5URT4/Sv3nysb0CuGRX7Z/MrL4ZJLUBiyb6Kl7Zyx3V5D3VwpqiDz
	j0SzFXdCDDfQyj7Yxt77e2iU/61Gp6LEzYBmtf/qcAapxp3GUgyjzCKtwDRZE6Wb+mFiDcNjOvG
	dgzRMCkFK8bTDOYrINtsBMCWVc0ZFrnk8bq5QqAOsbitQgEu1YSTLzpKbEFO6rrxnS3Wb8sZhHf
	1agJSxxNuyVf4tilqztT+LLcKScy/1PYMAl7k46eYmRc2kVr3NjRGEwom5RdEl+7c/izTAcX4n9
	uc7LrSup6rpIHdioeVD+IhEPKe7oCOvKv4aSNL45PKSOEWptIAWzxwAgsA=
X-Received: by 2002:a05:600c:4e49:b0:49d:29ab:540b with SMTP id 5b1f17b1804b1-49fe66cec31mr154272065e9.15.1790442990051;
        Sat, 26 Sep 2026 10:16:30 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff141948dsm57753635e9.1.2026.09.26.10.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 10:16:29 -0700 (PDT)
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
Subject: [PATCH] drm/amdgpu: Fix NPA-REVOKE racing an in-flight UALink import
Date: Sat, 26 Sep 2026 18:16:00 +0100
Message-ID: <20260926171625.288519-1-devnexen@gmail.com>
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

When the revoke hits a node that is still NOT_READY or PENDING, only
mark it for teardown and send NPA-RELEASE, as nothing has been handed to
user-space yet. The importer checks for teardown under the xarray lock
before linking the node and marking it READY, and unwinds otherwise.

Fixes: 7cc82cd90d35 ("drm/amdgpu: Implement mechanism to revoke exported memory")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: David Carlier <devnexen@gmail.com>
---
Found by code analysis; not tested on hardware (needs two UALink-connected
accelerators in a vPod). Compile-tested with W=1. Applies on next-20260925
and does not overlap with Mukul's "UALink fixes" v2 series.
 drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c | 30 +++++++++++++++++++---
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c
index 8411ea17172f..90d2a525ff5f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c
@@ -3265,6 +3265,7 @@ static void amdgpu_ualink_process_npa_revoke_msg(struct amdgpu_device *adev,
 {
 	struct amdgpu_ualink_imp_xa_node *imp_xa_node;
 	struct amdgpu_bo *bo;
+	u32 node_state;
 	int r = 0;
 
 	/* Remove the entry from the Xarray. */
@@ -3288,7 +3289,19 @@ static void amdgpu_ualink_process_npa_revoke_msg(struct amdgpu_device *adev,
 		return;
 	}
 
+	node_state = READ_ONCE(imp_xa_node->node_state);
 	WRITE_ONCE(imp_xa_node->node_state, AMDGPU_UALINK_NODE_TEARDOWN);
+
+	/* The import is still in flight: the dmabuf may not exist yet and
+	 * nothing has been handed to user-space. Leave the node to the
+	 * importing thread, which sees the teardown state and unwinds.
+	 */
+	if (node_state == AMDGPU_UALINK_NODE_NOT_READY ||
+	    node_state == AMDGPU_UALINK_NODE_PENDING) {
+		xa_unlock(&adev->ualink.imp_xa);
+		goto send_release;
+	}
+
 	list_del_init(&imp_xa_node->list);
 	xa_unlock(&adev->ualink.imp_xa);
 
@@ -3299,6 +3312,7 @@ static void amdgpu_ualink_process_npa_revoke_msg(struct amdgpu_device *adev,
 	/* Drop the refcount for the node */
 	amdgpu_ualink_imp_xa_entry_put(imp_xa_node);
 
+send_release:
 	r = amdgpu_ualink_send_npa_release_msg(adev, remote_acc_id, handle);
 	if (r)
 		dev_err(adev->dev,
@@ -3760,9 +3774,20 @@ static int amdgpu_ualink_do_import_handle(struct amdgpu_device *adev,
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
+		dev_warn(adev->dev,
+			 "IMPORT: handle:%llx:%llx revoked during import\n",
+			 handle.handle_hi, handle.handle_lo);
+		return -EINVAL;
+	}
 	list_add(&imp_xa_node->list, &adev->ualink.imp_handles_list[remote_acc_id]);
+	WRITE_ONCE(imp_xa_node->node_state, AMDGPU_UALINK_NODE_READY);
 	xa_unlock(&adev->ualink.imp_xa);
 
 	return 0;
@@ -3938,9 +3963,6 @@ int amdgpu_ualink_import_handle(struct drm_device *dev,
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

