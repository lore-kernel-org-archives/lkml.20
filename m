Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF4C3AA4ED;
	Tue, 15 Sep 2026 08:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461185; cv=none; b=AcAuxelSrL4h8GkjLjfZXcPDG2opp1FcXXac/e6DdvTpIyIdPPvmXws98gQhsErqaX3qyVFj9n6guZCdSnKwsDM1EobIaYPhuU3HAm/Mq1PSy5NYoOIRbV9ahoAqUm0uBEzSBrp57pzboVWTWkpoktWWUC0ss0Zv/v+W/JVM0c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461185; c=relaxed/simple;
	bh=36DMiOqS5yE6Nt08eJ6RRW+5p7kY+C4sD50h5kWrnI0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gv1z9oy5Fuem6Z5pkXzoGWF6m9xw5ejse7mUdU8vIZFu22b2NkLyYqhAXeaOckeaxppqgmuF2rzHLt/vRFZa+kPm8S1mP+aagKhiEpP5q225FXilrb7C5HgVSoE4fJs7KOB9A0OnBbAopNh+jNmRuGzhCOGEdG2Xx/wlxZVzJ+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=NI+VXzuj; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=OwQVSiLn; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="NI+VXzuj";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="OwQVSiLn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1789461181; bh=36DMiOqS5yE6Nt08eJ6RRW+5p7kY+C4sD50h5kWrnI0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NI+VXzuj52fwHBcvYb43jJHYVIoNhNddVI/sjigwSwihU+uk+GlGkpJevmQfNeShK
	 0FvRX8TbUNCWak0pvfk9a67x/+AFcGNd5IyUi83tL9PdEYq9Iz+XBbAEuKfMIjfqt4
	 vwRfeTAHhkWYBkZqCMyQRLHNk6nSZqEn0J3RM00+jfdngUZJYpNo7v4lR3HTDwF3Fd
	 AhPfXU1QKxn2xNsOm27WaM2E3yjWqA1DwZFe1rHKsJagQUaXZTZMTM7H0t/fUPx5OV
	 cHRahR5oTBSNEobdXnAgC3xtKIGNFxbwl7f4GhWRInd325j+qR7SXfZ1wypjz3Ymw1
	 GJp9unjidWknw==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 8187A40B71; Tue, 15 Sep 2026 09:33:01 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1789461180; bh=36DMiOqS5yE6Nt08eJ6RRW+5p7kY+C4sD50h5kWrnI0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OwQVSiLnWRJW+2KNd9/k1vVo+28PMYECZlW1861lqEocRAyq0pKoMRxv6O1pIjfxN
	 ApoyyLvf9SbfHA23ALO6cbSf6MjdgesFOeKk8erpHr+sPZXo0ILoUzZYtDYJjM2RYB
	 0nNQ7L0fLNozxx5L9V+IWI/YxT1DM5WMwz8Zfo5BKGFkRWzHM2V/TbVgUHotlwTFEN
	 OXxShsmwlmR5x37Zef6PwSBfhZQkA+L+rpgANZZe53G3Nog3Vxd+P2+lBTmJ7jn7RQ
	 lqLMnb2NdmV+g+tP/4PqdVF8Cd7pOebznGQF4q8oAwLnL73FW9TC9izHC7CwgRJUWx
	 FXxVBfZ05sb2w==
Received: from maru.home (host81-158-254-226.range81-158.btcentralplus.com [81.158.254.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 0402D40155;
	Tue, 15 Sep 2026 09:33:00 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rik van Riel <riel@surriel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 04/20] media: rc: Replace open coded krealloc() for keymap
Date: Tue, 15 Sep 2026 09:32:14 +0100
Message-ID: <3b7094b8f0035d970fd61caca05abcdd3374146b.1789460680.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1789460680.git.sean@mess.org>
References: <cover.1789460680.git.sean@mess.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace some ugly code with open coded krealloc() and remove
superfluous member of struct rc_map.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/rc-main.c | 45 +++++++++++++++++++-------------------
 include/media/rc-map.h     |  2 --
 2 files changed, 22 insertions(+), 25 deletions(-)

diff --git a/drivers/media/rc/rc-main.c b/drivers/media/rc/rc-main.c
index d4baaae3a834..53e39b7a489a 100644
--- a/drivers/media/rc/rc-main.c
+++ b/drivers/media/rc/rc-main.c
@@ -17,9 +17,8 @@
 #include <linux/module.h>
 #include "rc-core-priv.h"
 
-/* Sizes are in bytes, 256 bytes allows for 32 entries on x64 */
-#define IR_TAB_MIN_SIZE	256
-#define IR_TAB_MAX_SIZE	8192
+#define IR_TAB_MIN_ENTRIES	32
+#define IR_TAB_MAX_ENTRIES	1024
 
 static const struct {
 	const char *name;
@@ -214,21 +213,23 @@ static int scancode_to_u64(const struct input_keymap_entry *ke, u64 *scancode)
 static int ir_create_table(struct rc_dev *dev, struct rc_map *rc_map,
 			   const char *name, u64 rc_proto, size_t size)
 {
+	unsigned int alloc;
 	rc_map->name = kstrdup(name, GFP_KERNEL);
 	if (!rc_map->name)
 		return -ENOMEM;
+	alloc = roundup_pow_of_two(size);
 	rc_map->rc_proto = rc_proto;
-	rc_map->alloc = roundup_pow_of_two(size * sizeof(struct rc_map_table));
-	rc_map->size = rc_map->alloc / sizeof(struct rc_map_table);
-	rc_map->scan = kmalloc(rc_map->alloc, GFP_KERNEL);
+	rc_map->len = 0;
+	rc_map->size = alloc;
+	rc_map->scan = kmalloc_objs(struct rc_map_table, alloc, GFP_KERNEL);
 	if (!rc_map->scan) {
 		kfree(rc_map->name);
 		rc_map->name = NULL;
 		return -ENOMEM;
 	}
 
-	dev_dbg(&dev->dev, "Allocated space for %u keycode entries (%u bytes)\n",
-		rc_map->size, rc_map->alloc);
+	dev_dbg(&dev->dev, "Allocated space for %u keycode entries (%zu bytes)\n",
+		alloc, alloc * sizeof(struct rc_map_table));
 	return 0;
 }
 
@@ -262,38 +263,36 @@ static void ir_free_table(struct rc_map *rc_map)
 static int ir_resize_table(struct rc_dev *dev, struct rc_map *rc_map,
 			   gfp_t gfp_flags)
 {
-	unsigned int oldalloc = rc_map->alloc;
-	unsigned int newalloc = oldalloc;
-	struct rc_map_table *oldscan = rc_map->scan;
+	unsigned int newsize = rc_map->size;
 	struct rc_map_table *newscan;
 
 	if (rc_map->size == rc_map->len) {
 		/* All entries in use -> grow keytable */
-		if (rc_map->alloc >= IR_TAB_MAX_SIZE)
+		if (newsize >= IR_TAB_MAX_ENTRIES)
 			return -ENOMEM;
 
-		newalloc *= 2;
-		dev_dbg(&dev->dev, "Growing table to %u bytes\n", newalloc);
+		newsize *= 2;
+
+		dev_dbg(&dev->dev, "Growing table to %u entries\n", newsize);
 	}
 
-	if ((rc_map->len * 3 < rc_map->size) && (oldalloc > IR_TAB_MIN_SIZE)) {
+	if (rc_map->len * 3 < rc_map->size && rc_map->size > IR_TAB_MIN_ENTRIES) {
 		/* Less than 1/3 of entries in use -> shrink keytable */
-		newalloc /= 2;
-		dev_dbg(&dev->dev, "Shrinking table to %u bytes\n", newalloc);
+		newsize /= 2;
+		dev_dbg(&dev->dev, "Shrinking table to %u entries\n", newsize);
 	}
 
-	if (newalloc == oldalloc)
+	if (newsize == rc_map->size)
 		return 0;
 
-	newscan = kmalloc(newalloc, gfp_flags);
+	newscan = krealloc_array(rc_map->scan, newsize,
+				 sizeof(struct rc_map_table), gfp_flags);
 	if (!newscan)
 		return -ENOMEM;
 
-	memcpy(newscan, rc_map->scan, rc_map->len * sizeof(struct rc_map_table));
 	rc_map->scan = newscan;
-	rc_map->alloc = newalloc;
-	rc_map->size = rc_map->alloc / sizeof(struct rc_map_table);
-	kfree(oldscan);
+	rc_map->size = newsize;
+
 	return 0;
 }
 
diff --git a/include/media/rc-map.h b/include/media/rc-map.h
index d95ed3e96de2..f167c37179c8 100644
--- a/include/media/rc-map.h
+++ b/include/media/rc-map.h
@@ -148,7 +148,6 @@ struct rc_map_table {
  * @scan: pointer to struct &rc_map_table
  * @size: Max number of entries
  * @len: Number of entries that are in use
- * @alloc: size of \*scan, in bytes
  * @rc_proto: type of the remote controller protocol, as defined at
  *	     enum &rc_proto
  * @name: name of the key map table
@@ -158,7 +157,6 @@ struct rc_map {
 	struct rc_map_table	*scan;
 	unsigned int		size;
 	unsigned int		len;
-	unsigned int		alloc;
 	enum rc_proto		rc_proto;
 	const char		*name;
 	spinlock_t		lock;
-- 
2.55.0

