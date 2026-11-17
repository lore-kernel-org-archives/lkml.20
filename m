Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.222
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794907953;
	b=hR/P2q80bWgo7449wcnbRFMDRo3+8mdcVBoauH69CBZxT1W6Gi0k6gOJRRktXv4/kQ3H
	 wdYmlIfJUUJ4atyVVzgu5osCTCewZ3x1AYTRTrbfC3gf2BG86x0Xx4u7m4u4ghyx2KpS8
	 UhgcAhCaJSbjOxRxYtGDi1yob7kH/WYr7U06B0KMkA5SPx+WcSZGxcMAPMaYFtV/pCKu1
	 RtL8rVFmuQ8C+0PkNT8x2+kYEOnktrZPT+30rM0MTd8QJyY2xEXzhBi9eUuUhj1T33j2b
	 69dhlrPjmhbwVp1c9POjAE7O4QyibO8B43H9nGSYBfvllrHK+Na/oHOwS6f7DTsIiCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794907953;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=zHwBqsQb9hP55ypvUI19hlmY7GweiNLDeIgyOcU9CWw=;
	b=qfZSRxpSEyh2IrJrB/Xm+RFXuup3I7bFZaEsgIglkGUTmTkGUp1X4aSnXUMv22a4AWUM
	 osEKG1PazkJ8gYPj1+U58VbNAlrsi/Xxv43vpnj6FNZL7io0SR38qoRX2rhbijUIw9hDE
	 pjg1istyce5YC5BoBZRy+7R54pLyrmJNDI2xk2y8F/M6wPgO3j6YQd/YlTx6VM5exyXtK
	 1c4t1SBH6LGfm9YyjcikD6RnFo70krw1hAj4LRJ17ohjNF3qfs2ac4PKXiGadsiZmGvLL
	 szrztONv0ChQrahmsmC0MHidU65lfWEZqFOCSVJ/wGWp70l5CCQMJFqCU9ivgGmAOfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=f3ZdQ60x;
	arc=none smtp.remote-ip=113.46.200.222
Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F24606A33D;
	Tue, 17 Nov 2026 09:32:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81F24606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=f3ZdQ60x
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=zHwBqsQb9hP55ypvUI19hlmY7GweiNLDeIgyOcU9CWw=;
	b=f3ZdQ60x7H6wkqChDThls46W0Cj8FBQAHmiIa2fPUjDGijQ4dOv7D+oAtVagCiJ6Y96aOrW8F
	5Nc5Wc/8DtGot3qg+pz3zAiXQQhbTHWiVF/Pwl+NCdzsQSvh8YdiDFDzlzGqx7vrBzCorEkL3Vn
	xMCAL4zk+rj9c2qSoUi9jkg=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4jTKJC17c9zLlTR;
	Tue, 17 Nov 2026 17:32:11 +0800 (CST)
Received: from kwepemo200009.china.huawei.com (unknown [7.202.195.26])
	by mail.maildlp.com (Postfix) with ESMTPS id 1C1CB4055B;
	Tue, 17 Nov 2026 17:32:30 +0800 (CST)
Received: from localhost.localdomain (10.50.159.234) by
 kwepemo200009.china.huawei.com (7.202.195.26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 17 Nov 2026 17:32:29 +0800
From: Long Wei <longwei27@huawei.com>
To: <rppt@kernel.org>, <pasha.tatashin@soleen.com>, <pratyush@kernel.org>,
	<akpm@linux-foundation.org>
CC: <graf@amazon.com>, <leitao@debian.org>, <corbet@lwn.net>,
	<rdunlap@infradead.org>, <linux-mm@kvack.org>, <kexec@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<hewenliang4@huawei.com>, Long Wei <longwei27@huawei.com>
Subject: [PATCH 1/2] kho: expose incoming sub-blob metadata instead of contents
Date: Tue, 17 Nov 2026 17:29:50 +0800
Message-ID: <20261117092951.4017931-2-longwei27@huawei.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117092951.4017931-1-longwei27@huawei.com>
References: <20261117092951.4017931-1-longwei27@huawei.com>
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
Content-Type: text/plain
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemo200009.china.huawei.com (7.202.195.26)

Incoming sub-blob pages are owned by their consumers and have independent
lifetimes.  Some consumers, such as LUO, restore and free their state in
early_initcall, i.e. before kho_init() (fs_initcall) builds the debugfs
view:

  early_initcall: luo_early_startup()
                    -> kho_retrieve_subtree("LUO")
                    -> kho_restore_free(luo_ser)   /* page is freed */

  fs_initcall:    kho_init()
                    -> kho_in_debugfs_init()
                         -> phys_to_virt(luo_ser_phys)
                         -> debugfs_create_blob("LUO", ...)

debugfs therefore ends up pointing at a page that was already handed back
to the page allocator, and reading the file triggers a use-after-free:

  # cat /sys/kernel/debug/kho/in/sub_fdts/LUO
  ==================================================================
  BUG: KASAN: use-after-free in _copy_to_user+0x37/0x60
  Read of size 32 at addr ffff88810309c000 by task cat/27436

  Call Trace:
   <TASK>
   kasan_report+0xb9/0xf0
   kasan_check_range+0x100/0x1b0
   _copy_to_user+0x37/0x60
   simple_read_from_buffer+0x77/0xd0
   read_file_blob+0x75/0xa0
   vfs_read+0x12d/0x520
   ksys_read+0xc3/0x160
   do_syscall_64+0x97/0x4b0
   entry_SYSCALL_64_after_hwframe+0x76/0x7e
   </TASK>

  The buggy address belongs to the physical page:
  page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x1fd
  pfn:0x10309c
  flags: 0x17ffffc0000000(node=0|zone=2|lastcpupid=0x1fffff)
  page_type: f0(buddy)
  ==================================================================

The page is already in the buddy allocator (page_type: f0(buddy),
refcount 0), which confirms it was freed before the debugfs view was
created.

KHO does not own these pages, so it cannot safely expose their contents at
all.  Drop the in/sub_fdts raw blob nodes and replace them with a
read-only in/blobs metadata file that lists the name, physical address and
size of every incoming sub-blob.  The FDT itself is reserved by KHO and is
still exposed as in/fdt.

Fixes: 062dd306d99c ("kho: fix kho_in_debugfs_init() to handle non-FDT blobs")
Signed-off-by: Long Wei <longwei27@huawei.com>
---
 kernel/liveupdate/kexec_handover_debugfs.c | 83 +++++++++++-----------
 1 file changed, 42 insertions(+), 41 deletions(-)

diff --git a/kernel/liveupdate/kexec_handover_debugfs.c b/kernel/liveupdate/kexec_handover_debugfs.c
index 7d74477da0b7..3624d4bf44b2 100644
--- a/kernel/liveupdate/kexec_handover_debugfs.c
+++ b/kernel/liveupdate/kexec_handover_debugfs.c
@@ -95,67 +95,68 @@ static int bootmem_len_show(struct seq_file *m, void *v)
 }
 DEFINE_SHOW_ATTRIBUTE(bootmem_len);
 
-__init void kho_in_debugfs_init(struct kho_debugfs *dbg, const void *fdt)
+static int kho_in_blobs_show(struct seq_file *m, void *v)
 {
-	struct dentry *dir, *sub_fdt_dir;
-	int err, child;
-
-	INIT_LIST_HEAD(&dbg->fdt_list);
-
-	dir = debugfs_create_dir("in", debugfs_root);
-	if (IS_ERR(dir)) {
-		err = PTR_ERR(dir);
-		goto err_out;
-	}
+	const void *fdt = m->private;
+	int child, len;
 
-	sub_fdt_dir = debugfs_create_dir("sub_fdts", dir);
-	if (IS_ERR(sub_fdt_dir)) {
-		err = PTR_ERR(sub_fdt_dir);
-		goto err_rmdir;
+	if (fdt_check_header(fdt)) {
+		seq_puts(m, "invalid incoming FDT\n");
+		return 0;
 	}
 
-	err = __kho_debugfs_blob_add(&dbg->fdt_list, dir, "fdt", fdt,
-				     fdt_totalsize(fdt));
-	if (err)
-		goto err_rmdir;
-
+	seq_puts(m, "# name pa size\n");
 	fdt_for_each_subnode(child, fdt, 0) {
-		int len = 0;
 		const char *name = fdt_get_name(fdt, child, NULL);
 		const u64 *blob_phys;
 		const u64 *blob_size;
-		void *blob;
 
 		blob_phys = fdt_getprop(fdt, child,
 					KHO_SUB_TREE_PROP_NAME, &len);
-		if (!blob_phys)
-			continue;
-		if (len != sizeof(*blob_phys)) {
-			pr_warn("node %s prop %s has invalid length: %d\n",
-				name, KHO_SUB_TREE_PROP_NAME, len);
+		if (!blob_phys || len != sizeof(*blob_phys))
 			continue;
-		}
 
 		blob_size = fdt_getprop(fdt, child,
 					KHO_SUB_TREE_SIZE_PROP_NAME, &len);
-		if (!blob_size || len != sizeof(*blob_size)) {
-			pr_warn("node %s missing or invalid %s property\n",
-				name, KHO_SUB_TREE_SIZE_PROP_NAME);
+		if (!blob_size || len != sizeof(*blob_size))
 			continue;
-		}
 
-		blob = phys_to_virt(*blob_phys);
-		err = __kho_debugfs_blob_add(&dbg->fdt_list, sub_fdt_dir, name,
-					     blob, *blob_size);
-		if (err) {
-			pr_warn("failed to add blob %s to debugfs: %pe\n",
-				name, ERR_PTR(err));
-			continue;
-		}
+		seq_printf(m, "%s 0x%016llx %llu\n", name,
+			   (u64)*blob_phys, (u64)*blob_size);
 	}
 
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(kho_in_blobs);
+
+/*
+ * Show the metadata of the sub-blobs referenced by the incoming FDT.  Each
+ * line contains the name, physical address and size of a sub-blob.  The raw
+ * contents of the sub-blobs are not exposed.
+ */
+__init void kho_in_debugfs_init(struct kho_debugfs *dbg, const void *fdt)
+{
+	struct dentry *dir;
+	int err;
+
+	INIT_LIST_HEAD(&dbg->fdt_list);
+
+	dir = debugfs_create_dir("in", debugfs_root);
+	if (IS_ERR(dir)) {
+		err = PTR_ERR(dir);
+		goto err_out;
+	}
+
+	err = __kho_debugfs_blob_add(&dbg->fdt_list, dir, "fdt", fdt,
+				     fdt_totalsize(fdt));
+	if (err)
+		goto err_rmdir;
+
+	debugfs_create_file("blobs", 0400, dir, (void *)fdt,
+			    &kho_in_blobs_fops);
+
 	dbg->dir = dir;
-	dbg->sub_fdt_dir = sub_fdt_dir;
+	dbg->sub_fdt_dir = NULL;
 
 	return;
 err_rmdir:
-- 
2.43.0

