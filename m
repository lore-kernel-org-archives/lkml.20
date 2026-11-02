Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793608255;
	b=JpZaT14blKbDKI5JsBsBkO46bqTxk1yswgux+CS4/24D0w4BclGZDHa4Mrn6MSruWZKF
	 SWxk58t04THHby1PUhhJd9Q0UjAn39aY/N+z9MP05aZdYYxGD7f/mGsOHjnMdM3De0wv5
	 yF0hjTZDMdJG6We/DEWXxDZfIOh+93wFTt68YrOASQi/JfppCp/mHlRUnwldzJAo3e+RF
	 44YScMRo+1G5d3xNGWSSdVwDYAXZSifOk3eqhROIqZD33ZBkCiPxbdv7tKGZcKEZ/uIJi
	 Bqof5Td/EACVj3wBOPEKeGRjPomL2ZF8MrTkI1hzofFu6P2lokTQDzGcqKLWsOaQiLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793608255;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8KAS6t6RcH5YSPgaYyaJ/vTgjaBHTXeGZTqVGqeK6VE=;
	b=DZW9b7Zz63YyT0/d8A2zTlDO1gGvrgUBHW4eY4gp2tMizFrQpo1OYPCeFHmzqakEGod4
	 39bTsPWOKPaxisdofbikVWlZRO07xucx2STrmH5z80ebZQL6urqdkZmDGDjUgqqGxTGdV
	 unlfnwP/IjAUq50hP3v2LOlhES+r6WaAhU1wk2b/UaW+PnXXi3ZaVUKpZB/sIpkooI/vs
	 OdZoa4yaebiUXM+ZdMdyf1igiK0VT7KcyJB6zNeNuGGaAWjbZuxGTh6NXbcfiOmDkVQpy
	 vxVJJSDPGl9piaKL0h20snfFx2sAs7o+RskSL7oItF6U8cQTAzXih9Y58XE77cGJ/bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="v/R71VbI";
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94894606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 08:30:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94894606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v/R71VbI
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ae702d28c4so1193803a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 00:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793608254; x=1794213054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8KAS6t6RcH5YSPgaYyaJ/vTgjaBHTXeGZTqVGqeK6VE=;
        b=v/R71VbI6cnNvY44QZUfxxS3nvAjayQwTCB31roEvhq6e3LYeihNBjWtclxJj9UyqT
         PtnLvi6dWiAM6yXpM9qh6CaPpjOTp148k0o9bCPplMm+h5o3Kmt2uis6Op4ROaAiEYgw
         w4L93Hdioyphn9IWpltmexJ3N3ISOR2owKEHI8qZeQ+IDu1ZiUIM9aa5bqguqCbtoWp3
         iGu4/mLvTY6LklooKZSEqT+2aqW5IDjKT3NvssZ0lEbftcf5VFLJOmQexDjwcdrsTtgS
         HvJLH4RFu9Kbxv52uAKrnWDFH63SWBmtjX38pv/3/2Mf1/YiGCucJchx3q3A4Ma4SWjl
         bu+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793608254; x=1794213054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8KAS6t6RcH5YSPgaYyaJ/vTgjaBHTXeGZTqVGqeK6VE=;
        b=WLk0Nl1kFk0DMc9n4ZW/i8uawi6TPCBeG5ZOByGvNo/Lpew+cxy3kamgEGFqqh4zI4
         cFPG2z3wLVOtZkDSw7vPvk0cc/08imKlxt0jRqZZfzmLIKSfmU9/YGaOH7aochfBNR5r
         wcUI5PaBdEqru8SXITyuImoyZWdQ8bVhro4Hn/SBLwukT9VPC8O31zYrzAnOVdK/fSuj
         2j8yKwh02m8v0K7SbaUNqI2rSKdaxgoeybKTRTrSN11jwTPIDUleDnyH0LtQe8IkL0X4
         UGPLUvSg2piBt2LUbLEYJfL3Yi3S989gjlJxK8jYUqhFqP1g0lTNARXieclCL+2dfBKu
         eBsA==
X-Forwarded-Encrypted: i=1; AKwUvBzNT0Edq9/xWUETcrwJ7MZWCNjw8Rk9MBp7zn7q+eKPzAo4PQFHJzUutfQYM6fA/o/0fzOBOaWZ+gqqA4E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CFxtYdZNegAzECLzz2fEubGmukktbnFG97vO0W7QqH81vU984
	mKZpdqr1JKFB59j0pHSuzMSrlmJSwhiWzfDmHHN3UzyfSeegVLpetbgDdekef+9pJ1ptbA==
X-Gm-Gg: AYBFou3yTFkm4DyWdJwEF7edW1tgGHLzYVzbOt8ChrSVNrr+uqkUeh09rU3I/Vr2cij
	UJ/VVCLKLLM4QXjiimfAhAAYI8Q4R2GaLdkRSxK6caqQEUV37y8hfF2SAbDXIrzS/nSdySOCBsu
	LCl/JN2sE3SVGsEQ8i3o/bajkoLGyiMJJ4PheWa3arWEmKtls8zSj5E50is021wCdM7pkLqxA+L
	e4h3qyHLX4Mu14StIhxGo344FlsnnCGE+jnzXLAK4/lEnbX0mkhVYZBvhuCZinRQN9A1D4Y6Srd
	2MKoez0+TZDbY1kDnoBHS779Bb+1vvzl1txvPztyO8V0OZqapjxQnmvj9GQvnuRuDZyB08RNQNi
	hpDy0kTjn3dmCU4wZD3V14Hkd26FpjAB/tUxjUh+0Jrw3Hn7maCCz3g2PXsuMeHiinK0ZELOT9V
	Uwouzmn5P+JMzTwoDIFiLgulNRxWcd35FkmMXoay0EjJ8ePdgvKVwREjMpVOYcL3LaPvJI+z/jL
	XMY/ScqJOmKpeMme89LXDQJ16lSDMF+QMv3j7wyxWrQ534idT60/ds/BarrmEQ5X6QD387vQDfu
	1AYxpfO3OLGZXClOF+sXMrmQm39tDmZ8svldfnfTbWzUUq+0lRkBycauTeO/aVC0SqOnjDcoGbb
	4
X-Received: by 2002:a17:90b:57c5:b0:3ac:b44c:2d84 with SMTP id 98e67ed59e1d1-3ae897cc815mr8182409a91.13.1793608253825;
        Mon, 02 Nov 2026 00:30:53 -0800 (PST)
Received: from localhost.localdomain ([155.69.168.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845ae5b9sm13365251a91.12.2026.11.02.00.30.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 00:30:53 -0800 (PST)
From: Yuqiang Sun <izaiahsun@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: amit.kumar-mahapatra@amd.com,
	luca.ceresoli@bootlin.com,
	harshit.m.mogalapalli@oracle.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] mtd: virt-concat: Tear the concat down when its master goes away
Date: Mon,  2 Nov 2026 16:30:45 +0800
Message-ID: <20261102083045.8512-1-izaiahsun@gmail.com>
X-Mailer: git-send-email 2.54.0
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

Partitions that are part of a virtual concatenation are never registered
on their own: add_mtd_partitions() hands them to mtd_virt_concat_add() and
skips them, so they are not on the parent's partition list either. The
concatenated device is registered with a copy of the first partition's
struct device, whose parent is the master's device.

When the master is unregistered, mtd_virt_concat_destroy() looks for a
concat item whose DT nodes include the master's of_node. The items hold
the partition nodes, so nothing ever matches: the concat stays registered
and keeps the master's device alive (it stays in the idr and in
/proc/mtd), while the driver frees the master. Reading /proc/mtd then
uses freed memory, and so does device_shutdown(). The concat's partitions
are leaked, and since the item's subdev count is never reset, binding the
driver again writes past the end of concat->subdev[].

The matching branch is reached only from the MTD core's module exit,
which cannot run while the concat is registered (it holds a reference on
the module). There, a failed add_mtd_device() frees the caller's mtd
instead of the child. The concat also puts references on its parts that
it never took.

Find the concats to tear down by the master of their parts instead.
Unregister each one that includes a partition of the master that goes
away, free those partitions and drop them from the item, which keeps its
DT nodes and the other parts, so the concat is joined again when the
master comes back. Do not put references that were never taken, and only
unregister a concat at module exit if it is registered.

Tested on QEMU (arm64 virt, TCG) with KASAN, with two partitions of the
CFI flash joined by part-concat-next, physmap and the MTD core as
modules: unbind physmap, bind it again, unbind it again, unload the
modules. Without this patch the first unbind leaves both devices behind
and each read of /proc/mtd gives KASAN slab-use-after-free reports in
mtd_proc_show(), binding again gives slab-out-of-bounds writes in
mtd_virt_concat_add(), the MTD core cannot be unloaded, and
device_shutdown() at power-off reports use-after-free and refcount_t
underflow. With it the concat is removed on unbind, created again and
readable after binding, and the MTD core unloads, with no reports. The
same steps without part-concat-next are clean with and without this
patch.

Fixes: 43db6366fc2d ("mtd: Add driver for concatenating devices")
Cc: stable@vger.kernel.org
Signed-off-by: Yuqiang Sun <izaiahsun@gmail.com>
---

Notes:
    The bug was found with kbound, a research static analysis prototype
    (its report was the add_mtd_device() failure path in
    mtd_virt_concat_destroy(); running it showed the teardown problem).
    The patch, the changelog and the test setup were written with the help
    of an AI coding assistant (Claude); I have reviewed and tested them as
    described above.
    
    Not tested: a concat whose parts are on two different masters (QEMU virt
    has one flash), and a concat device held open while its master goes
    away, which this patch handles like a master that goes away while open.

 drivers/mtd/mtd_virt_concat.c | 106 ++++++++++++++--------------------
 include/linux/mtd/concat.h    |  13 ++---
 2 files changed, 49 insertions(+), 70 deletions(-)

diff --git a/drivers/mtd/mtd_virt_concat.c b/drivers/mtd/mtd_virt_concat.c
index 40b300021dda..ecd5b07d32ce 100644
--- a/drivers/mtd/mtd_virt_concat.c
+++ b/drivers/mtd/mtd_virt_concat.c
@@ -57,94 +57,76 @@ static bool mtd_is_part_concat(struct device_node *dev)
 	return false;
 }
 
-static void mtd_virt_concat_put_mtd_devices(struct mtd_concat *concat)
+/* Unregister the concatenated device, if it is registered */
+static void mtd_virt_concat_unregister(struct mtd_concat *concat)
 {
-	int i;
-
-	for (i = 0; i < concat->num_subdev; i++)
-		put_mtd_device(concat->subdev[i]);
+	if (!concat->mtd.name)
+		return;
+
+	del_mtd_device(&concat->mtd);
+	kfree(concat->mtd.name);
+	concat->mtd.name = NULL;
+	if (concat->mtd.numeraseregions)
+		kfree(concat->mtd.eraseregions);
+	concat->mtd.numeraseregions = 0;
 }
 
 void mtd_virt_concat_destroy_joins(void)
 {
-	struct mtd_virt_concat_node *item, *tmp;
-	struct mtd_info *mtd;
+	struct mtd_virt_concat_node *item;
 
-	list_for_each_entry_safe(item, tmp, &concat_node_list, head) {
-		mtd = &item->concat->mtd;
-		if (item->concat) {
-			mtd_device_unregister(mtd);
-			kfree(mtd->name);
-			mtd_virt_concat_put_mtd_devices(item->concat);
-			mtd_concat_destroy(mtd);
-		}
+	list_for_each_entry(item, &concat_node_list, head) {
+		mtd_virt_concat_unregister(item->concat);
+		mtd_concat_destroy(&item->concat->mtd);
+		item->concat = NULL;
 	}
 }
 
 /**
- * mtd_virt_concat_destroy - Destroy the concat that includes the mtd object
+ * mtd_virt_concat_destroy - Destroy the concats that include partitions of
+ *                           an MTD device
  * @mtd:        pointer to 'mtd_info'
  *
- * Return: 0 on success, -error otherwise.
+ * Called when the master of @mtd is unregistered. Partitions of that master
+ * that are part of a concatenation were never registered on their own, so
+ * unregister every concat that includes one of them and free them. The other
+ * parts stay with the concat item, which is joined again once all its parts
+ * are back.
+ *
+ * Return: 0.
  */
 int mtd_virt_concat_destroy(struct mtd_info *mtd)
 {
 	struct mtd_info *child, *master = mtd_get_master(mtd);
-	struct mtd_virt_concat_node *item, *tmp;
+	struct mtd_virt_concat_node *item;
 	struct mtd_concat *concat;
-	int idx, ret = 0;
-	bool is_mtd_found;
+	int idx, n;
 
-	list_for_each_entry_safe(item, tmp, &concat_node_list, head) {
-		is_mtd_found = false;
+	list_for_each_entry(item, &concat_node_list, head) {
+		concat = item->concat;
 
-		/* Find the concat item that hold the mtd device */
-		for (idx = 0; idx < item->count; idx++) {
-			if (item->nodes[idx] == mtd->dev.of_node) {
-				is_mtd_found = true;
+		for (idx = 0; idx < concat->num_subdev; idx++) {
+			if (mtd_get_master(concat->subdev[idx]) == master)
 				break;
-			}
 		}
-		if (!is_mtd_found)
+		if (idx == concat->num_subdev)
 			continue;
-		concat = item->concat;
 
-		/*
-		 * Since this concatenated device is being removed, retrieve
-		 * all MTD devices that are part of it and register them
-		 * individually.
-		 */
-		for (idx = 0; idx < concat->num_subdev; idx++) {
+		mtd_virt_concat_unregister(concat);
+
+		for (idx = 0, n = 0; idx < concat->num_subdev; idx++) {
 			child = concat->subdev[idx];
-			if (child->dev.of_node != mtd->dev.of_node) {
-				ret = add_mtd_device(child);
-				if (ret)
-					goto out;
+			if (mtd_get_master(child) == master) {
+				kfree(child->name);
+				kfree(child);
+			} else {
+				concat->subdev[n++] = child;
 			}
 		}
-		/* Destroy the concat */
-		if (concat->mtd.name) {
-			del_mtd_device(&concat->mtd);
-			kfree(concat->mtd.name);
-			mtd_virt_concat_put_mtd_devices(item->concat);
-			mtd_concat_destroy(&concat->mtd);
-		}
-
-		list_del(&item->head);
-		for (idx = 0; idx < item->count; idx++)
-			of_node_put(item->nodes[idx]);
-
-		kfree(item);
+		concat->num_subdev = n;
 	}
-	return 0;
-out:
-	mutex_lock(&master->master.partitions_lock);
-	list_del(&child->part.node);
-	mutex_unlock(&master->master.partitions_lock);
-	kfree(mtd->name);
-	kfree(mtd);
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -309,10 +291,8 @@ int mtd_virt_concat_create_join(void)
 				name_sz += (strlen(concat->subdev[idx]->name) + 1);
 			name_sz += strlen(CONCAT_POSTFIX);
 			name = kmalloc(name_sz + 1, GFP_KERNEL);
-			if (!name) {
-				mtd_virt_concat_put_mtd_devices(concat);
+			if (!name)
 				return -ENOMEM;
-			}
 
 			ret = 0;
 			for (idx = 0; idx < concat->num_subdev; idx++) {
diff --git a/include/linux/mtd/concat.h b/include/linux/mtd/concat.h
index f8d4d6ac1fc1..ce9824567f98 100644
--- a/include/linux/mtd/concat.h
+++ b/include/linux/mtd/concat.h
@@ -62,16 +62,15 @@ bool mtd_virt_concat_add(struct mtd_info *mtd);
 int mtd_virt_concat_create_join(void);
 
 /**
- * mtd_virt_concat_destroy - Remove the concat that includes a specific mtd device
- *                           as one of its components.
+ * mtd_virt_concat_destroy - Remove the concats that include partitions of a
+ *                           specific mtd device as components.
  * @mtd: pointer to MTD device info structure.
  *
- * Returns 0 on succes, or a negative error code.
- *
- * If the mtd_info object is part of a concatenated device, all other MTD devices
- * within that concat are registered individually. The concatenated device is then
- * removed, along with its concatenation component.
+ * Returns 0.
  *
+ * Called when the master of @mtd is unregistered: every concatenated device
+ * with a partition of that master is unregistered, and those partitions are
+ * freed. The concatenation is created again when all its parts are back.
  */
 int mtd_virt_concat_destroy(struct mtd_info *mtd);
 

base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
-- 
2.53.0

