Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793693023;
	b=ui+o90Gvw0BORui6SvF27XP2Qo9J6zmlh5o+1389YfuRWEN9uzq0OVszEFJ4k1gE1SU1
	 GHEZ3lGeyFSEWd4H2WBORWQpPMclCB8HvqoG7N/a+3H4rD6uhofgl9tUs4YIPzLtV3jfK
	 n/NGvqI8ZYxxPvuzuK+3I+t7LozFWn2C3gJzBo1VQEYYxMn/LttnQ9mHWvvw6fGhNuQ3G
	 O92+Blsk1Pw/5pYNX0zQgC5FLxqhO6BU4QsdJGmn7UNnob9XeJllE5V2lbDnbsg2U6Ij/
	 +Rad+5YlC2/rkr+BGTSAY5t3IC687JLND67FXfwKi3Q4rcjAyF+xzLafJ7MZ0t4CZEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793693023;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=k8dB3+qhC6Yj5VtlqN6Ai/FheADqdjphvH+ied6xs8Y=;
	b=if8vCQkGw1cFKo7R9Co+1ykspxbOSqwYbc2kkfUQgari3YNrwi2b9WHffIwx7fzd/K1i
	 rjwzf1Jx3K0xmHdWhieMb3yicD1KmSTn710VsknsfQEG3DkfJPdx5pEq5Ox2qh9sMSov2
	 EBZ34qdrY/VzfBjmAXvR4FD2qwQPby5FtXcja0fpDP03+hsZjVzkNrBBpLrXVHHXbR6gf
	 zeZKetQ8G9p9dFuOxQJgcSju4AKLoFxYNlNwPLyyhBmVYk1rHZylPEg4i6hbJ3LDXSvc2
	 uqthiDrItliDTxdNCfFQBQR70vP5tWIb8LNDco2Pq3ACLgIl4WtCpnwMRhIqYcBCm9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="w/567uIM";
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A53606A338
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:03:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3A53606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w/567uIM
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cdb2e0062bbso640726a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 00:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793693022; x=1794297822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k8dB3+qhC6Yj5VtlqN6Ai/FheADqdjphvH+ied6xs8Y=;
        b=w/567uIMBo+IY48ZiAJHoJ3pRy+bfyqouK78Me0yNKQ12YsjxYvUXnghr4squ3R/Bn
         NvzDsimtJY2OYOF5/MIkohuYsPQVWZtN9JTVvP+f3a8RmIGqGMdsA4sTbGIudc7M12qc
         EFtQlxFIjkVrlzYwbW2rZLLljr2tfgx1oU15h956YMGxW+AbBLzRGgXSAAtXPMy2ruLz
         nIKzEM1NrTrIlBXlQXtFrnR/JU4Iq/ypKNPcENen3vfip9EI8mBz0keeKLjDVE364+Ks
         OrWcA/NoG/F6Xp4tkyj77DqTyzE74LpH45kUsxutiPAS46rP8OxsG/rxuet0cRIQKef4
         1PNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793693022; x=1794297822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k8dB3+qhC6Yj5VtlqN6Ai/FheADqdjphvH+ied6xs8Y=;
        b=YJX8NyfaA3aT13O4Mq2EG9CWfbd37YUitXIFib0AyX7bwctjmeuCi3H524f4hxQcbf
         zVqVkigHMDPT1oAGuwQ/d4uFo1Fkdo2uWdwW0gdP6TK46xgIYv05rx6OBDMXnSoIGWZJ
         qAQn7BXfFz9DrsxlwZaHQhm4//exSH2VOyIj5KoKWvTpIhtlCVf9R6KBQP9Hd/8fqIRV
         SOUCuEd5yK+chy7A7tH37sIxvpA7WSzAaP+nS0aJ1clG7iGPn4QG1lMvNSMJ3DkzBIR2
         Echt0a5c7SgnTNWFS0jRA1okShXoEQbD0dTDI7xme9cDPZx3axryH8UcYR/GHPSRHez+
         ClpQ==
X-Forwarded-Encrypted: i=1; AKwUvBwtzPL+h+Cv50qAD5iGhpwXLmDvFlSGC6kVgWuo3q3aqcoCQfJp41MDXFwhXA/wnF9gLmYc/Ip37gE40Hw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XWe99vXECDC1b8NPnlu1AKxJX9Zbi0+jdBAabYtMgai4se1AZ
	Z7vn3vHH3lWn5pE7ietLLu/FoQnWMj6hPI/r0Hgu4KM9GgzWgOdI4qFr
X-Gm-Gg: AYBFou3JzCse8hD0fjMITR7v6QTCBn85ztKlpCkpJZvjccLTfRPC+Ip9JDsgQnjjOMz
	vqPYZVgMsLnNyg+pRuCIqQF+6BGAGw7TdeAOb7u62LdfiXvtXxWKIoeVnfVQ/OoRrCyNAziFXwj
	j3p6jraVcBp5EJnS5dtbAORrIyhoe3Q23HS8MVzyi2vWB7ucntdRh6yR7ltDqzDLzpQJxCwuMuV
	hI4fQE1a0+zShYbP6R9E4feNQE6N8JMI/KXe+Eq7VnIQP8XjLnIWvNX3B2lCIg8UoQSZuIV9wr3
	S851jUBkEfsKcTmt3f6Qm1ap/Gh+1VGg1F+yfT1mbXTE+pgLB85VvfnnCiDXEyzc1xljCVZhVar
	XaDbZsUkZ4pNgKVr+axQA1jxQFAPo+VjGjO9Poa9HH6/QpW0nIfFTM+EL627hffFDBKdT20tShJ
	fIqYMlVyiOBI9t/nxrtfuku3PAzMhwJXMx9N1AD74xk76525DolceK5IR5+8YU1D7EuhfTaTTvy
	uPdMLIRP0jKcSe4GpvRzRMflqtKebONISq4XSYr4+xXGErxHQbegbanriesk0/jooF/NxBIz3vE
	kVSqRWyeo2GL9vafL3EvgSME/TlJ3hXky6UWTJ4V1F0GpAA60hACSiE=
X-Received: by 2002:a05:6a20:430a:b0:3e1:78c5:dfde with SMTP id adf61e73a8af0-3e92903d6a4mr11608227637.87.1793693021940;
        Tue, 03 Nov 2026 00:03:41 -0800 (PST)
Received: from localhost.localdomain ([155.69.168.11])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb364af8desm842130a12.26.2026.11.03.00.03.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 00:03:40 -0800 (PST)
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
Subject: [PATCH v2] mtd: virt-concat: Tear the concat down when its master goes away
Date: Tue,  3 Nov 2026 16:03:27 +0800
Message-ID: <20261103080327.90193-1-izaiahsun@gmail.com>
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

For this to work when the parts are on different masters, and when the
concat is in use as its master goes away:
- Keep each part in the slot of its DT node, rather than in the order the
  parts are registered, so that a part whose master comes back does not
  end up last.
- Register the device that mtd_concat_create() returns, instead of a
  copy of it in the item: an item can then be joined again while the old
  device is still open, and the error path of add_mtd_device() no longer
  frees the erase regions the copy still points to.
- Keep the device, its name and the freed master's partitions until the
  last user puts it, through the _get_device() and _put_device() hooks.

Tested on QEMU (arm64 virt, TCG) with KASAN, physmap and the MTD core as
modules, with two partitions of the CFI flash joined by
part-concat-next, and with one partition on each of the two flash banks
described as two flash devices: unbind the first flash, bind it again,
unbind it again, unload the modules. Without this patch the first unbind
leaves the devices behind and each read of /proc/mtd gives KASAN
slab-use-after-free reports in mtd_proc_show(), binding again gives
slab-out-of-bounds writes in mtd_virt_concat_add(), the MTD core cannot
be unloaded, and device_shutdown() at power-off reports use-after-free
and refcount_t underflow. With it the concat is removed on unbind,
created again with its parts in order and readable after binding, and
the MTD core unloads, with no reports. Failing each of the first eight
allocations under mtd_virt_concat_create_join() when binding again fails
the bind, with no reports. The same steps without part-concat-next are
clean with and without this patch.

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
    
    Changes in v2, after the Sashiko review of v1:
    - Keep each part in the slot of its DT node. With a concat across two
      flash devices, v1 joined it again as kbb-kba-concat after the first
      flash was bound again.
    - Register the device returned by mtd_concat_create() instead of a copy
      in the item. This also removes the double free of the erase regions
      after a failed add_mtd_device(). That path is not reachable on QEMU,
      whose CFI flash has a single erase region, so it is not tested.
    - Keep the concat, its name and the parts of the master that went away
      until the last user puts the concat.
    
    An MTD device held open while its flash driver is unbound gives KASAN
    use-after-free reports in the MTD core and the CFI driver, with or
    without this patch, for a plain partition too: the driver frees the
    master while the open device, whose struct device has the master's as
    its parent, is still around. With this patch a concat held open across
    the unbind gets reports of the same kind, none of them in
    mtd_virt_concat.c. Closing it then frees its parts.
    
    v1: https://lore.kernel.org/all/20261102083045.8512-1-izaiahsun@gmail.com/

 drivers/mtd/mtd_virt_concat.c | 223 ++++++++++++++++++++--------------
 include/linux/mtd/concat.h    |  14 +--
 2 files changed, 142 insertions(+), 95 deletions(-)

diff --git a/drivers/mtd/mtd_virt_concat.c b/drivers/mtd/mtd_virt_concat.c
index 40b300021dda..64b0dd434ee2 100644
--- a/drivers/mtd/mtd_virt_concat.c
+++ b/drivers/mtd/mtd_virt_concat.c
@@ -26,15 +26,32 @@ static LIST_HEAD(concat_node_list);
  * @head: List handle
  * @count: Number of nodes
  * @nodes: Pointer to the nodes (partitions) to concatenate
- * @concat: Concatenation container
+ * @concat: Parts found so far: subdev[i] is the partition of nodes[i], or NULL
+ * @vdev: The concatenated device, if it is registered
  */
 struct mtd_virt_concat_node {
 	struct list_head head;
 	unsigned int count;
 	struct mtd_concat *concat;
+	struct mtd_virt_concat_dev *vdev;
 	struct device_node *nodes[] __counted_by(count);
 };
 
+/**
+ * struct mtd_virt_concat_dev - A registered concatenated device
+ * @mtd: The device, from mtd_concat_create()
+ * @refs: One for the registration and one for each user of the device
+ * @num_gone: Number of entries in @gone
+ * @gone: Parts whose master went away while the device was in use, freed
+ *        with the device
+ */
+struct mtd_virt_concat_dev {
+	struct mtd_info *mtd;
+	struct kref refs;
+	unsigned int num_gone;
+	struct mtd_info *gone[];
+};
+
 /**
  * mtd_is_part_concat - Check if the device is already part
  *                       of a concatenated device
@@ -57,94 +74,119 @@ static bool mtd_is_part_concat(struct device_node *dev)
 	return false;
 }
 
-static void mtd_virt_concat_put_mtd_devices(struct mtd_concat *concat)
+static void mtd_virt_concat_free_part(struct mtd_info *part)
 {
-	int i;
+	kfree(part->name);
+	kfree(part);
+}
+
+static void mtd_virt_concat_release(struct kref *refs)
+{
+	struct mtd_virt_concat_dev *vdev =
+		container_of(refs, struct mtd_virt_concat_dev, refs);
+	unsigned int i;
+
+	for (i = 0; i < vdev->num_gone; i++)
+		mtd_virt_concat_free_part(vdev->gone[i]);
+	kfree(vdev->mtd->name);
+	mtd_concat_destroy(vdev->mtd);
+	kfree(vdev);
+}
+
+/*
+ * A concatenated device has no parent, so it is its own master: the MTD core
+ * calls these for each of its users, the last _put_device() after it is done
+ * with the device.
+ */
+static int mtd_virt_concat_get_device(struct mtd_info *mtd)
+{
+	struct mtd_virt_concat_dev *vdev = mtd->priv;
 
-	for (i = 0; i < concat->num_subdev; i++)
-		put_mtd_device(concat->subdev[i]);
+	kref_get(&vdev->refs);
+	return 0;
+}
+
+static void mtd_virt_concat_put_device(struct mtd_info *mtd)
+{
+	struct mtd_virt_concat_dev *vdev = mtd->priv;
+
+	kref_put(&vdev->refs, mtd_virt_concat_release);
+}
+
+/*
+ * Unregister the concatenated device of @item, if it is registered. The
+ * caller drops the registration's reference once it is done with the parts.
+ */
+static struct mtd_virt_concat_dev *
+mtd_virt_concat_unregister(struct mtd_virt_concat_node *item)
+{
+	struct mtd_virt_concat_dev *vdev = item->vdev;
+
+	if (vdev) {
+		item->vdev = NULL;
+		del_mtd_device(vdev->mtd);
+	}
+	return vdev;
 }
 
 void mtd_virt_concat_destroy_joins(void)
 {
-	struct mtd_virt_concat_node *item, *tmp;
-	struct mtd_info *mtd;
+	struct mtd_virt_concat_node *item;
+	struct mtd_virt_concat_dev *vdev;
 
-	list_for_each_entry_safe(item, tmp, &concat_node_list, head) {
-		mtd = &item->concat->mtd;
-		if (item->concat) {
-			mtd_device_unregister(mtd);
-			kfree(mtd->name);
-			mtd_virt_concat_put_mtd_devices(item->concat);
-			mtd_concat_destroy(mtd);
-		}
+	list_for_each_entry(item, &concat_node_list, head) {
+		vdev = mtd_virt_concat_unregister(item);
+		if (vdev)
+			kref_put(&vdev->refs, mtd_virt_concat_release);
+		kfree(item->concat);
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
+ * unregister every concat that includes one of them, and free them once that
+ * concat is no longer in use. The other parts stay with the concat item,
+ * which is joined again once all its parts are back.
+ *
+ * Return: 0.
  */
 int mtd_virt_concat_destroy(struct mtd_info *mtd)
 {
-	struct mtd_info *child, *master = mtd_get_master(mtd);
-	struct mtd_virt_concat_node *item, *tmp;
+	struct mtd_info *part, *master = mtd_get_master(mtd);
+	struct mtd_virt_concat_node *item;
+	struct mtd_virt_concat_dev *vdev;
 	struct mtd_concat *concat;
-	int idx, ret = 0;
-	bool is_mtd_found;
-
-	list_for_each_entry_safe(item, tmp, &concat_node_list, head) {
-		is_mtd_found = false;
+	int idx;
 
-		/* Find the concat item that hold the mtd device */
-		for (idx = 0; idx < item->count; idx++) {
-			if (item->nodes[idx] == mtd->dev.of_node) {
-				is_mtd_found = true;
-				break;
-			}
-		}
-		if (!is_mtd_found)
-			continue;
+	list_for_each_entry(item, &concat_node_list, head) {
 		concat = item->concat;
+		vdev = NULL;
 
-		/*
-		 * Since this concatenated device is being removed, retrieve
-		 * all MTD devices that are part of it and register them
-		 * individually.
-		 */
-		for (idx = 0; idx < concat->num_subdev; idx++) {
-			child = concat->subdev[idx];
-			if (child->dev.of_node != mtd->dev.of_node) {
-				ret = add_mtd_device(child);
-				if (ret)
-					goto out;
-			}
-		}
-		/* Destroy the concat */
-		if (concat->mtd.name) {
-			del_mtd_device(&concat->mtd);
-			kfree(concat->mtd.name);
-			mtd_virt_concat_put_mtd_devices(item->concat);
-			mtd_concat_destroy(&concat->mtd);
+		for (idx = 0; idx < item->count; idx++) {
+			part = concat->subdev[idx];
+			if (!part || mtd_get_master(part) != master)
+				continue;
+
+			if (!vdev)
+				vdev = mtd_virt_concat_unregister(item);
+			concat->subdev[idx] = NULL;
+			concat->num_subdev--;
+			if (vdev)
+				vdev->gone[vdev->num_gone++] = part;
+			else
+				mtd_virt_concat_free_part(part);
 		}
-
-		list_del(&item->head);
-		for (idx = 0; idx < item->count; idx++)
-			of_node_put(item->nodes[idx]);
-
-		kfree(item);
+		if (vdev)
+			kref_put(&vdev->refs, mtd_virt_concat_release);
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
@@ -226,7 +268,10 @@ bool mtd_virt_concat_add(struct mtd_info *mtd)
 		concat = item->concat;
 		for (idx = 0; idx < item->count; idx++) {
 			if (item->nodes[idx] == mtd->dev.of_node) {
-				concat->subdev[concat->num_subdev++] = mtd;
+				if (concat->subdev[idx])
+					return false;
+				concat->subdev[idx] = mtd;
+				concat->num_subdev++;
 				return true;
 			}
 		}
@@ -287,6 +332,7 @@ int mtd_virt_concat_node_create(void)
 int mtd_virt_concat_create_join(void)
 {
 	struct mtd_virt_concat_node *item;
+	struct mtd_virt_concat_dev *vdev;
 	struct mtd_concat *concat;
 	struct mtd_info *mtd;
 	ssize_t name_sz;
@@ -301,7 +347,7 @@ int mtd_virt_concat_create_join(void)
 		 * concatenation are not handy, concat MTD device can't be
 		 * created hence switch to next concat device.
 		 */
-		if (item->count != concat->num_subdev) {
+		if (item->count != concat->num_subdev || item->vdev) {
 			continue;
 		} else {
 			/* Calculate the legth of the name of the virtual device */
@@ -309,10 +355,8 @@ int mtd_virt_concat_create_join(void)
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
@@ -321,34 +365,37 @@ int mtd_virt_concat_create_join(void)
 			}
 			sprintf((name + ret), CONCAT_POSTFIX);
 
-			if (concat->mtd.name) {
-				ret = memcmp(concat->mtd.name, name, name_sz);
-				if (ret == 0) {
-					kfree(name);
-					continue;
-				}
+			vdev = kzalloc_flex(*vdev, gone, item->count);
+			if (!vdev) {
+				kfree(name);
+				return -ENOMEM;
 			}
+
 			mtd = mtd_concat_create(concat->subdev, concat->num_subdev, name);
 			if (!mtd) {
+				kfree(vdev);
 				kfree(name);
 				return -ENXIO;
 			}
-			concat->mtd = *mtd;
 			/* Arbitrary set the first device as parent */
-			concat->mtd.dev.parent = concat->subdev[0]->dev.parent;
-			concat->mtd.dev = concat->subdev[0]->dev;
+			mtd->dev = concat->subdev[0]->dev;
+			mtd->priv = vdev;
+			mtd->_get_device = mtd_virt_concat_get_device;
+			mtd->_put_device = mtd_virt_concat_put_device;
+			vdev->mtd = mtd;
+			kref_init(&vdev->refs);
 
 			/* Add the mtd device */
-			ret = add_mtd_device(&concat->mtd);
-			if (ret)
-				goto destroy_concat;
+			ret = add_mtd_device(mtd);
+			if (ret) {
+				mtd_concat_destroy(mtd);
+				kfree(vdev);
+				kfree(name);
+				return ret;
+			}
+			item->vdev = vdev;
 		}
 	}
 
 	return 0;
-
-destroy_concat:
-	mtd_concat_destroy(mtd);
-
-	return ret;
 }
diff --git a/include/linux/mtd/concat.h b/include/linux/mtd/concat.h
index f8d4d6ac1fc1..4c09b4f5b6e9 100644
--- a/include/linux/mtd/concat.h
+++ b/include/linux/mtd/concat.h
@@ -62,16 +62,16 @@ bool mtd_virt_concat_add(struct mtd_info *mtd);
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
+ * freed once it is no longer in use. The concatenation is created again when
+ * all its parts are back.
  */
 int mtd_virt_concat_destroy(struct mtd_info *mtd);
 

base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
-- 
2.53.0

