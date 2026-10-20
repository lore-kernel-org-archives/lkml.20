Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501978;
	b=XZPrFJf0SZgfv4s9E1nFFVuFDFqxJ/WmWm3WfIXjQ6AM0SAGmWdDyip8awrkBNFa6YkG
	 7fh/K7QJHwzbCjcI8cctSzj3jwqxyI7Vl3ecICw+XpEsSppKceTid0FAIdzUveV5hMaU8
	 qKHmnNifGpWDOOBaPAaJ8AoqvwVMHLRqbreuWefcQW/29gx2qrPvTpQ7HHXyDVuW5GfRw
	 aIRr2F/cJQP4TPOz/+9tqERFPv2MAbJ8+V9oCaCxMpDbWHKiIEiLMSvR260dTRSJhV9a+
	 VITQA9NmTUlbHjidSUhr+qZ/2KOFeF7cs+jW672uNirzWPehk3mHA2/vBMuuIf6gs7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GXRYtUbRh38fe0NTnBbIezCa9WUPMrbWF4pq21pcnKs=;
	b=iC9ZLJHwVjaYbTwkt3H4V/fQ5JOBUwBOZhCCwc1/QGuGEl5r3kEpvpvMg7tYMkQD91Rc
	 rv21beU1/xOk82jraCeZS1cBccxD8EV16WvAQ+7TqF+SQjljLdMmTdApPvdKlQpFDi/7K
	 Gfar4ASfpBlKzDeMN9hdM/XnBur6rELsLzvW1RGc0z5mMWKGVtPlyB1TLuM3AGm2XPNmw
	 4n/VTIdJU+MBhi+8k3/2uYaUdj7F1pJ26j1z3GJgNwuN77r2sViyVGOAzzQckk+whzMGy
	 tL+ayifewaHo/GCW20bDzZgxsbFlyVa6Hvwe90ZyfbPbianQaTKk1k0nD0YkPiFvv1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oUq+JnEs;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2A5606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:12:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C2A5606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oUq+JnEs
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e608cd460eso17665725ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792501978; x=1793106778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GXRYtUbRh38fe0NTnBbIezCa9WUPMrbWF4pq21pcnKs=;
        b=oUq+JnEsT9zLvoGgGln+QAzgtsRurE/AWDahFSqRFQC2Zo8TVxN/bRKe7p8Zzaqpt5
         kpNsDbMLaUgUS9weHnC812QG0gCnjnEQ12yEpmv3Z+H+cGG4IS82mvxApayxFVjR6sHd
         Lzi/UgyGTjZ6mBHpwcC6LhYb/bwc2xhWLRBYI53m13qPqxO1q1CpHAxnbAFlh+OQSzSB
         ChJ3uTp3OGgsYBWrIjdfBvxiGtwslcXLc3HKrvLJ8eRUEufdhvBA5SlIXkWrLwP2LRgf
         ezcaXdsU/QC77FatEfL3thKrQCZKn5lcpEwBoUo+6Q3WogNBw0wHZ1aSPiP8a7Y79Vgh
         vxDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501978; x=1793106778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GXRYtUbRh38fe0NTnBbIezCa9WUPMrbWF4pq21pcnKs=;
        b=DsSJ/vuWpRwTX161Vvvsanrafxjpnh/xHG0DtOfnV2SgwoPmxjnEqMBHAZq1V87OMz
         nzkoKBvygtnvcvtxg7/XVDHSavPWxZKQzPTWhoElFuIekkyxYgA2A3csGHD4GSU+fgJW
         NlUMP6gXfLl/R2kb59skFxFbdxRgM56YgTDyVx7AI2rlKVgOyBqcbg2LDRpRjhKI7GHC
         6/xO59G0Q0zqNk/9MWKdT/uIUJrRknQM/OYiLrla9kydWS69me0rWXJdwS7ZoeM869XQ
         uxOLISVKX0ONzMjCuml/9oLIAP/Wl60hff5rTv4mnT+0J/tkmBuzVqtLhdRdpJO83SJ1
         b7Cw==
X-Forwarded-Encrypted: i=1; AKwUvBzWK6o8wUgX4lTFDbNkld7VGzi7k6Ws44vKVuCTjGb03UVCNMfQ1AvLlObWkvbzMd0sJ1I0dYWSlijSKGQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJEMD5nA8CIOJOM7zjysTF+58fRMHM089+uC4HDjpk/mREMtR4d
	P1c2hrPMv4hsM6Dn4rCNXcOwSVgonHArZ9RUVMMNPj3MB3JperCLtyLN
X-Gm-Gg: AYBFou3b7L8+AJQFAQ5ItVWkcWxyMu9OhuqatE/GYzgFSMPVvSJ67fb2eIaqxL8yHc5
	AcaygJV6mwoq4gAFqLFSI/Y1jiRHN5NAYkMDny+eI1bcVURrhQSryjEEA3QtFWyklTX8pNqFwV8
	uI47Qsm1JtlHgmLYDgzvODGwwaLa6ccUSsqj+OJzWT3FmneZpRbpbrB6Qj+yiM2r3Xc8gDdqJqL
	WUD5ihl1yDtaE/cHzWOVIFynjC/LJsb1Y0SDkxrf0wHXjOtSU7/xIn8lEBmBS/8/LZkC85pxklx
	mLQC30iEyPS3xfg9xtszDxXFFzrdioRWyOgqTVTny1xwiB6l6HzvD1AtCtcLB64nRIKBSgiSEvt
	Q03gVrxmXQafu5BIB0PIGZ9rWBSCnggcq9ZjwMcHTTeQg7uXS7hpjr1taE1YjAeNKVpur/KE6IS
	H92GGS/1oHQuiWOTgODsaj+NBajt61UGRHvCrgnYoUph2L8jgdRYPn1sx4t9JT0fRjyqJkX1YW7
	/GwEA==
X-Received: by 2002:a17:903:1a2b:b0:2e6:13b1:e196 with SMTP id d9443c01a7336-2e9a73571b7mr84573785ad.74.1792501977648;
        Tue, 20 Oct 2026 06:12:57 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea1502d425sm11910725ad.49.2026.10.20.06.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:12:57 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: mark@fasheh.com,
	jlbec@evilplan.org,
	joseph.qi@linux.alibaba.com
Cc: heming.zhao@suse.com,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH] ocfs2/cluster: remove zero-address nodes from IP tree on teardown
Date: Tue, 20 Oct 2026 21:12:50 +0800
Message-Id: <pm-ocfs2-node-ip-rbtree-zero-address-uaf-v5-e7f64be16b7c3b0988d1@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

o2nm_node_ipv4_address_store() accepts 0.0.0.0. It sets
O2NM_NODE_ATTR_ADDRESS and links nd_ip_node into cl_node_ip_tree under
cl_nodes_lock, but o2nm_node_group_drop_item() uses nd_ipv4_address as a
membership test. A zero address therefore leaves the rbtree node linked
when config_item_put() releases and frees struct o2nm_node. A later
address store or IP lookup can then walk the stale node and dereference
freed memory.

During teardown, drop_item takes cl_nodes_lock, skips rb_erase()
for the zero key, and then calls config_item_put(). A later
o2nm_node_ipv4_address_store() duplicate check or o2nm_get_node_by_ip()
lookup takes the same lock and walks the stale cl_node_ip_tree entry. Use
O2NM_NODE_ATTR_ADDRESS for teardown so every published nd_ip_node is
erased before configfs can release the node, without rejecting 0.0.0.0
or changing lookup semantics.

Fixes: 0c83ed8eeb28 ("[PATCH] OCFS2: The Second Oracle Cluster Filesystem")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 fs/ocfs2/cluster/nodemanager.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/ocfs2/cluster/nodemanager.c b/fs/ocfs2/cluster/nodemanager.c
index e08850a5d736..be184c5ad54d 100644
--- a/fs/ocfs2/cluster/nodemanager.c
+++ b/fs/ocfs2/cluster/nodemanager.c
@@ -626,8 +626,11 @@ static void o2nm_node_group_drop_item(struct config_group *group,
 
 	write_lock(&cluster->cl_nodes_lock);
 
-	/* XXX sloppy */
-	if (node->nd_ipv4_address)
+	/*
+	 * 0.0.0.0 is a valid configured address, so nd_ipv4_address does
+	 * not tell us whether nd_ip_node was published in the IP tree.
+	 */
+	if (test_bit(O2NM_NODE_ATTR_ADDRESS, &node->nd_set_attributes))
 		rb_erase(&node->nd_ip_node, &cluster->cl_node_ip_tree);
 
 	/* nd_num might be 0 if the node number hasn't been set.. */
