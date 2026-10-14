Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A4D3451CC
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791947623; cv=none; b=msfEhXSgxoTWKWQRjbVrpUu7qiQcvVOY4C9M1zucOETsTtHJXCXakwt4V1EvbBxd/PXfTKDghNlAQI+AJuBVEPDhzM27kaxvhG7OTzuwozm+LK40OqR4Tzdl9ifVl9aA7mwOKSnMNWckWQpqW4cHITPqdWd+CV86/qE0lIzbvTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791947623; c=relaxed/simple;
	bh=qGxdekQbWHXU7pZPIMDPDXEpVcmYB1n5327x/VsWxO4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XltORhdkMgrFArC0BbHO0EW52pPNxVGiVP2ZdG9O5a8v/xBn+SCoYCo1x4YmC0IqqEAvjbZJObkjCls6luZUyrWZ7AhPI/TtEio5WXYqtB5wzB5yq0HQI4y6Hg6pKf+KWQIJbewjzioa2jXGuS6w4kjMCTsHPCI2hqGByRXvyhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ceTdZkww; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ceTdZkww"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=NN
	AZxCmxIUrBQNH+jBMXGiGkCNOioyZYJCxs8qQKSc0=; b=ceTdZkwwPKbATCBAoC
	T8Bp2td55y4BpKEJkbjXRJT9PZRvhgHwquIrQ+TMg1KiMZ1qGncndpXrDQ1M1BEz
	grQHsIC+JFDUf/Z2ACkK+IR1y7AGfjs52zlChFOdxRcctHMp4cs2M6HvtYvmrqkm
	CVN04JDIJKmCKZXn9ouNtz57o=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD330I_885q6IC7Eg--.21712S4;
	Wed, 14 Oct 2026 11:13:07 +0800 (CST)
From: Haolong Wang <18766350203@163.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] mm/memfd_luo: release preserved folios when retrieve fails
Date: Wed, 14 Oct 2026 11:12:54 +0800
Message-ID: <20261014031254.432582-3-18766350203@163.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261014031254.432582-1-18766350203@163.com>
References: <20261014031254.432582-1-18766350203@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD330I_885q6IC7Eg--.21712S4
X-Coremail-Antispam: 1Uf129KBjvJXoW3XF1xuFWxCF4kJF1fAr43Wrg_yoW7uFWUpF
	W5Gwn8Kr48KF4fA397ZF4jv34F93yfAFy5WFWxW3s7A3W5Xr17W3Z0v34DuFW5GrWDGFyx
	Xw4YkryUZFy5Z37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jysjUUUUUU=
X-CM-SenderInfo: jpryllawtvijiqt6il2tof0z/xtbC9QNbI2rO80NDAgAA3b

retrieve() only frees the serialization structure on its error paths, but
the folios it describes are still preserved at that point:
memfd_luo_finish() deliberately skips its own cleanup for records whose
retrieve() failed, since it relies on retrieve() to have released them.
The folios and the folio array are therefore never handed back and stay
reserved in the next kernel.

Release them from retrieve() as well, by sharing the cleanup with
memfd_luo_finish().  After the record has been validated, the folio array
is restored before the file is allocated, so a failure from
memfd_alloc_file() or memfd_add_seals() can release the folios directly
instead of allocating memory while already handling a failure; a record
this version does not support is rejected before that and uses the shared
cleanup too.  The folios may only be released while they are still fully
preserved: once memfd_luo_retrieve_folios() has run it has consumed every
folio it touched -- the ones added to the file go away with it, the ones
that could not be added are released in place -- and releasing them a
second time would warn and free memory that is in use.

Two error paths still cannot release the folios: if
kho_restore_vmalloc() fails, the array cannot be walked at all, and that
API is not failure-atomic, so a partial failure cannot be retried either.
Closing those needs a KHO-side fix or an allocation-free discard/iterator
API and is left alone here.

Found by code inspection while extending the preserved record (reported
by Sashiko AI review).

Fixes: f85b1c6af5bc ("liveupdate: luo_file: remember retrieve() status")
Assisted-by: Pi:glm-5.3-flash
Signed-off-by: Haolong Wang <18766350203@163.com>
---
 mm/memfd_luo.c | 78 ++++++++++++++++++++++++++++++++++----------------
 1 file changed, 53 insertions(+), 25 deletions(-)

diff --git a/mm/memfd_luo.c b/mm/memfd_luo.c
index 6fa086fe809b..e7dbb81e75a3 100644
--- a/mm/memfd_luo.c
+++ b/mm/memfd_luo.c
@@ -467,9 +467,31 @@ static void memfd_luo_discard_folios(const struct memfd_luo_folio_ser *folios_se
 	}
 }
 
-static void memfd_luo_finish(struct liveupdate_file_op_args *args)
+/*
+ * Release a preserved record: return its folios to the page allocator and free
+ * the record itself.  Only valid for records whose folios were never handed to
+ * a file -- handing a folio to a file consumes its last reference, and
+ * memfd_luo_discard_folios() would release it a second time.
+ */
+static void memfd_luo_release_ser(struct memfd_luo_ser *ser)
 {
 	struct memfd_luo_folio_ser *folios_ser;
+
+	if (ser->nr_folios) {
+		folios_ser = kho_restore_vmalloc(&ser->folios);
+		if (!folios_ser)
+			goto out;
+
+		memfd_luo_discard_folios(folios_ser, ser->nr_folios);
+		vfree(folios_ser);
+	}
+
+out:
+	kho_restore_free(ser);
+}
+
+static void memfd_luo_finish(struct liveupdate_file_op_args *args)
+{
 	struct memfd_luo_ser *ser;
 
 	/*
@@ -484,17 +506,7 @@ static void memfd_luo_finish(struct liveupdate_file_op_args *args)
 	if (!ser)
 		return;
 
-	if (ser->nr_folios) {
-		folios_ser = kho_restore_vmalloc(&ser->folios);
-		if (!folios_ser)
-			goto out;
-
-		memfd_luo_discard_folios(folios_ser, ser->nr_folios);
-		vfree(folios_ser);
-	}
-
-out:
-	kho_restore_free(ser);
+	memfd_luo_release_ser(ser);
 }
 
 static int memfd_luo_retrieve_folios(struct file *file,
@@ -600,7 +612,7 @@ static int memfd_luo_retrieve_folios(struct file *file,
 
 static int memfd_luo_retrieve(struct liveupdate_file_op_args *args)
 {
-	struct memfd_luo_folio_ser *folios_ser;
+	struct memfd_luo_folio_ser *folios_ser = NULL;
 	struct memfd_luo_ser *ser;
 	struct file *file;
 	umode_t exec_mode;
@@ -614,18 +626,28 @@ static int memfd_luo_retrieve(struct liveupdate_file_op_args *args)
 	if ((ser->seals & ~MEMFD_LUO_ALL_SEALS) ||
 	    (ser->flags & ~MEMFD_LUO_ALL_FLAGS)) {
 		err = -EOPNOTSUPP;
-		goto free_ser;
+		goto release_ser;
 	}
 
 	/*
-	 * The seals are preserved. Allow sealing here so they can be added
-	 * later.
+	 * Restore the folio array before allocating the file.  Once this succeeds,
+	 * every later error path can release the preserved folios directly instead
+	 * of allocating memory again while already handling a failure.
 	 */
+	if (ser->nr_folios) {
+		folios_ser = kho_restore_vmalloc(&ser->folios);
+		if (!folios_ser) {
+			/* kho_restore_vmalloc() is not safe to retry after failure. */
+			err = -EINVAL;
+			goto free_ser;
+		}
+	}
+
 	file = memfd_alloc_file("", MFD_ALLOW_SEALING);
 	if (IS_ERR(file)) {
 		pr_err("failed to setup file: %pe\n", file);
 		err = PTR_ERR(file);
-		goto free_ser;
+		goto discard_folios;
 	}
 
 	/*
@@ -648,15 +670,12 @@ static int memfd_luo_retrieve(struct liveupdate_file_op_args *args)
 	vfs_setpos(file, ser->pos, MAX_LFS_FILESIZE);
 	i_size_write(file_inode(file), ser->size);
 
-	if (ser->nr_folios) {
-		folios_ser = kho_restore_vmalloc(&ser->folios);
-		if (!folios_ser) {
-			err = -EINVAL;
-			goto put_file;
-		}
-
-		err = memfd_luo_retrieve_folios(file, folios_ser, ser->nr_folios);
+	if (folios_ser) {
+		/* retrieve_folios() consumes every preserved data folio. */
+		err = memfd_luo_retrieve_folios(file, folios_ser,
+						ser->nr_folios);
 		vfree(folios_ser);
+		folios_ser = NULL;
 		if (err)
 			goto put_file;
 	}
@@ -668,9 +687,18 @@ static int memfd_luo_retrieve(struct liveupdate_file_op_args *args)
 
 put_file:
 	fput(file);
+discard_folios:
+	if (folios_ser) {
+		memfd_luo_discard_folios(folios_ser, ser->nr_folios);
+		vfree(folios_ser);
+	}
 free_ser:
 	kho_restore_free(ser);
 	return err;
+
+release_ser:
+	memfd_luo_release_ser(ser);
+	return err;
 }
 
 static bool memfd_luo_can_preserve(struct liveupdate_file_handler *handler,
-- 
2.56.0

