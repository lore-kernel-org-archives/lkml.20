Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3D9175A88
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 17:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790444653; cv=none; b=Qn/CQESjvFPPfJX3Zxa9/J3kRfw7hnJU3fUDRhpwaeFNWvxgu76QWFGPUWUoYPIbN/6isUhpB1ifVIn4mHRZko2zHe1fOffAcgFUfeu1rvjQGnjMwrGfqPLui69S2THJk3e9F1YyakRBcpJ9n1hMAVTzBEOOJNMn+UQc1bxAv6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790444653; c=relaxed/simple;
	bh=LieMq+KTGP06OWjKKsSfZ23OEiRRlVBQA7oBLUzYNck=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BIFbRVn17HrXX4zNZ7H2li0Y0fyBTk/lpzvZo3j5msnnDSB155mo+/tzmMw7KYgN/oAa6yVzYcFpypKAqav8KqlNs9bzV46CeDlaFRDWP9mdZM9vpC8xqYh9uSa3cVh4AoxCvA8JSiN+feB1fwDMZIjFDzVpRPvzwDNUjUrPIqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ky2zv0Yf; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ky2zv0Yf"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ff23af865so13287055e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 10:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790444649; x=1791049449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6al9428943yAcl20WwBMtLLUBgJYR9IbwENL+dao9Rg=;
        b=Ky2zv0YfdnJh1Kon991mOcbSo7kIIdLKBL3RtjiVZzPmK+yAYxmvfz6KkCYML+X4YM
         J9wJFS7dAzo1rLANFsnQULDBHExJ4r4aMciqKNeFpnKi1k+c/NrdFXeRBVZmWhcB422P
         zlEeRlT25nVvWSj4Bh3oW1cUln1hnaUK1wAPpAky4KayjK0mswgl8VQIZdJ++8wdwkiB
         NemPLSWGqLVhvGBiCjfMsOLSGldXEYI/9QoX6o4sIAwCPybFIjbJGT+ghZw8plvmq1Sq
         dMyrcB6yhT+e8sYfD/c9zLQZOKYf3mXYUflGRgPJt1A7huf3HLqVaRoe9BPxqKNth2aH
         tUNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790444649; x=1791049449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6al9428943yAcl20WwBMtLLUBgJYR9IbwENL+dao9Rg=;
        b=pxxP8s04ySRyKRsO1Z6Qe7cbqshA78BbLdzsFUBg+HPxQ9zVEpdsxCSf3F19ApaWEQ
         ug/G69T36aw5b5UF8rix7vv+xmlWKsmBGRTdxJ30VZuQF0f2i6kZW7LnZuCOG56DO/zu
         SfOE5mL6KMNnrCcJv0A4d7GsfM9NQ6ZoznvEZhlYSJmGNc0FkPWtdLz+a9ngSLUqEzac
         BxSQuFz6NtZLYXzYVEL8STj4Dg8pjdp+viXaNZ+DHh4DGLFlvsQdjBqOVCbmLleyFDWv
         9iMNiWyuqMY5YCpMuumqLRawcmyZ9lcHXf2pAr/tKNzLVCus7TE/TH18f8MZ+QZit5aI
         OjnA==
X-Forwarded-Encrypted: i=1; AKwUvBz0nhudIjqUPQky4AVXFJqhZXNR5xdfBURY1bAgbYqneCvMQebD8LSl9NcZBQKZx2A4JMSsISdDfIcpV+o=@vger.kernel.org
X-Gm-Message-State: AFuF++nfLwImdCYI2bp3FVgJM3xwGdNlh0YqtlnDr5q1fVXBuMBPAZKt
	hoXm5262VCIChKSAvmTXjTXjafk67//v7pH4h3dTE3yzSYq7S4QLiJZu
X-Gm-Gg: AYBFou0FDy7ni925ZB9albQidKsEoUyCU1FIMfnXV6Ls3S4C38ulyPmp57cxApndP7c
	tMkboAS4os2jSaF+K5vGp8RR+wzV+ERMyt0xrtV4v8gb0/ZXlyw/4rRCZJS2j08LjnCskLikjyS
	X6gEN/uBl1Koh3NEBZ5uwy/uIxejKzjXTxGhnlRJ5G8yB3ouW6Oa8cCXHy6SGcvm6tXAanOCQcW
	N3Gz/CXi5l310DK/PYWihX47u5fI3KYUVqRZuG6mBP6J4YTYUm2cfEwC6ey6vtxnDxdv67cIMux
	xjv1+zU+3TdQRrVXIbcPNEVhxdL0QJUGKczWdIIWNxl94QWY4fDkdvcqO/O6LP+zk8WZpdw4x+6
	wFTeeGhmA+JJXnYruQIzrXTOf6eGroFYV6ak+6xhWknKy88IQlAEhxclrRAkKTxDcckLKzV1l4+
	87ibtrZgqsofKAHxip6DBXpwK+D5aiNTYvAqWNKO6CGgErb26QrHpd423XPbJZRV6WhOcxSXmfk
	FInOSvdxS3XNwCqrP05I+8ao1wDwshYdpEUDS3lcI3znbiQzVbPzhN2hXU=
X-Received: by 2002:a05:600c:1d29:b0:49c:fc6e:a3d9 with SMTP id 5b1f17b1804b1-49fe66eeeaamr183527895e9.24.1790444649393;
        Sat, 26 Sep 2026 10:44:09 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a000901b07sm9455665e9.9.2026.09.26.10.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 10:44:08 -0700 (PDT)
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
Subject: [PATCH v2] drm/amdgpu: Fix NPA-REVOKE racing an in-flight UALink import
Date: Sat, 26 Sep 2026 18:44:06 +0100
Message-ID: <20260926174406.346253-1-devnexen@gmail.com>
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

Only tear down a node that is READY. Otherwise mark it for teardown and
send NPA-RELEASE, as nothing has been handed to user-space yet, and wake
the importer if it is still waiting for NPA-RSP so that it fails right
away. A node already in teardown belongs to whoever moved it there, so a
duplicate NPA-REVOKE no longer touches it either. The importer checks for
teardown under the xarray lock before linking the node and marking it
READY, and unwinds otherwise.

Fixes: 7cc82cd90d35 ("drm/amdgpu: Implement mechanism to revoke exported memory")
Assisted-by: LLM
Signed-off-by: David Carlier <devnexen@gmail.com>
---
Changes in v2:
- Tear down only READY nodes, so a duplicate NPA-REVOKE for a node already
  in teardown neither dereferences a NULL dmabuf nor drops the node
  reference twice (Sashiko).
- Complete npa_done when a revoke arrives before NPA-RSP, so the importer
  fails right away instead of timing out into a connection reset (Sashiko).
- Use the current Assisted-by format.

Found by code analysis and compile-tested with W=1. Not tested on hardware,
as it needs two UALink-connected accelerators in a vPod.

v1: https://lore.kernel.org/all/20260926171625.288519-1-devnexen@gmail.com/

 drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c | 34 +++++++++++++++++++---
 1 file changed, 30 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c
index 8411ea17172f..cb35026e6eba 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c
@@ -3265,6 +3265,7 @@ static void amdgpu_ualink_process_npa_revoke_msg(struct amdgpu_device *adev,
 {
 	struct amdgpu_ualink_imp_xa_node *imp_xa_node;
 	struct amdgpu_bo *bo;
+	u32 node_state;
 	int r = 0;
 
 	/* Remove the entry from the Xarray. */
@@ -3288,7 +3289,23 @@ static void amdgpu_ualink_process_npa_revoke_msg(struct amdgpu_device *adev,
 		return;
 	}
 
+	node_state = READ_ONCE(imp_xa_node->node_state);
 	WRITE_ONCE(imp_xa_node->node_state, AMDGPU_UALINK_NODE_TEARDOWN);
+
+	/* Only a READY node is torn down here. If the import is still in
+	 * flight, the dmabuf may not exist yet and nothing has been handed
+	 * to user-space: leave the node to the importing thread, which sees
+	 * the teardown state and unwinds, and wake it up if it is still
+	 * waiting for NPA-RSP. A node already in teardown is owned by
+	 * whoever moved it there, e.g. an earlier NPA-REVOKE.
+	 */
+	if (node_state != AMDGPU_UALINK_NODE_READY) {
+		if (node_state == AMDGPU_UALINK_NODE_NOT_READY)
+			complete(&imp_xa_node->npa_done);
+		xa_unlock(&adev->ualink.imp_xa);
+		goto send_release;
+	}
+
 	list_del_init(&imp_xa_node->list);
 	xa_unlock(&adev->ualink.imp_xa);
 
@@ -3299,6 +3316,7 @@ static void amdgpu_ualink_process_npa_revoke_msg(struct amdgpu_device *adev,
 	/* Drop the refcount for the node */
 	amdgpu_ualink_imp_xa_entry_put(imp_xa_node);
 
+send_release:
 	r = amdgpu_ualink_send_npa_release_msg(adev, remote_acc_id, handle);
 	if (r)
 		dev_err(adev->dev,
@@ -3760,9 +3778,20 @@ static int amdgpu_ualink_do_import_handle(struct amdgpu_device *adev,
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
@@ -3938,9 +3967,6 @@ int amdgpu_ualink_import_handle(struct drm_device *dev,
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

