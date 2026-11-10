Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794333548;
	b=zn5bnZbIJCXGtchEfIO/CD0C7wwIsSnmmrOlO4hxfYcTsFeWQLMrN8EB1mMt8f5k3Vwg
	 p3lkFe0jXCyOWAL6+WVgW7JAAlIIJWM0gwM0RgHJpPcKqALDhyyZXXGmiyavxpr1evZL8
	 M/PbU+9+2gt0x63wSAXhQRiX6e28lrl70p7FaSeOMSUDkHsftiZnO5AWBiFfSGzUlbBbY
	 ExKEnRfQ77k+9O32UakeTPdEhP6NBTqvkt1I69Wvv4b103y9R/KmltvXLDKKBn0ttbPtE
	 +ujXW+f3JlkQRUOFFuVNwUftKnu36V+K6QwF/U4sE5k+Xuv9x0EmeCbSAUMCOUJkr+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333548;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=xzj+m2zx9cLSChoVXv7HfacxXNo3CyS+OFptqcCaQh4=;
	b=0ne62sSne3EUoj2YpkRAX50Gc+9xJjnBzyhylMwhjj/tJZPqnDFNcg7nM8VllNxPRmRl
	 aLRzCuBroVz7WTeneK8Ixhj5DGuCEMoaNYUJjJM0LHbwsh9YzdcHS7ADk5A4YL2jVoJ/3
	 OcJA/ORPwKUrNrvtlwAnw+hlwIGrFLuaiS27EWF7zTtFLTsolt4IRzwJQtJ0K2ir44gVM
	 pHKh7zBEWM0Q0fMGLtqeZSnar/x01Nws4+FUPBwzQWT0BRDEJ0YOTRvD8yfxkn5oXlfG1
	 t7aed8plANeXawwKRWjzAdULAe7vrN7QI9v8xzpTzZSdHfoR5pmZTtbRyEeHTnpAgnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Lbgs/yar";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8D2606A33E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lbgs/yar
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9F801F008A1;
	Tue, 10 Nov 2026 17:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794333548;
	bh=xzj+m2zx9cLSChoVXv7HfacxXNo3CyS+OFptqcCaQh4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Lbgs/yare/CCf7+Zqw6RNxf3VwmYHd1Jo3R2x7UcNonyOoUMTK9cT+XCjUpNLCFzY
	 HTUVoLANeBAew9qEtYlst28H/vY2rim7qBbujGKxlAG6pMG+L3u2RHryhuLTalN/W3
	 CgsxXiQfh7NKQQ9lXqvtlTQW7MraRjsZewAtxPxzQA6ZuOQ5hqxTELKR1oG/AKHA00
	 xuNeeIpHU3IozEZwVIcMuWeprY2W9dF02AGZBJmnu7rjgC2nzQcS99GAUaKo+Kn2K2
	 uvswAgUeOa1kgfz+B4IRMXnTtMdPsXVpu8tEcXvDpaoSS/+pmESkmiwRegVBo/uVvU
	 nAc/xnr7OXBug==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Samiullah Khawaja <skhawaja@google.com>
Cc: kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v2 2/2] mm/memfd_luo: keep memfd frozen until finish
Date: Tue, 10 Nov 2026 18:58:53 +0100
Message-ID: <20261110175855.2437084-3-pratyush@kernel.org>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
In-Reply-To: <20261110175855.2437084-1-pratyush@kernel.org>
References: <20261110175855.2437084-1-pratyush@kernel.org>
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

From: "Pratyush Yadav (Google)" <pratyush@kernel.org>

After a memfd is retrieved, it immediately goes back into "normal"
operation. The file comes back unfrozen, and its pages can migrate, it
can be truncated, and so on. If the memfd is depended on by something,
like iommufd, that can open a window for folios to move around before
the consumer can re-establish its references.

Finish is the conceptual point when a retrieved file can start to behave
as "normal". So take an extra reference on the folios and freeze the
memfd on retrieve until finish.

Suggested-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Signed-off-by: Pratyush Yadav (Google) <pratyush@kernel.org>
---
 mm/memfd_luo.c | 87 +++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 68 insertions(+), 19 deletions(-)

diff --git a/mm/memfd_luo.c b/mm/memfd_luo.c
index 9fd9abf9fedf6..50dbbda47ad3c 100644
--- a/mm/memfd_luo.c
+++ b/mm/memfd_luo.c
@@ -55,6 +55,14 @@
  *   Only seals known to this LUO version (see ``MEMFD_LUO_ALL_SEALS``) may
  *   be present; preservation fails with ``-EOPNOTSUPP`` otherwise.
  *
+ * Restrictions
+ * ============
+ *
+ * While a memfd is preserved, and after it is retrieved until the session is
+ * finished, its size can't be changed and holes can't be punched in it.
+ * Operations that would do so (``ftruncate()``, ``fallocate()``, writes past
+ * the end of the file) fail.
+ *
  * Non-Preserved Properties
  * ========================
  *
@@ -456,33 +464,56 @@ static void memfd_luo_discard_folios(const struct memfd_luo_folio_ser *folios_se
 	}
 }
 
+/* Drop the references retrieve() holds on the folios added to the file. */
+static void
+memfd_luo_put_retrieved_folios(const struct memfd_luo_folio_ser *folios_ser,
+			       u64 nr_folios)
+{
+	for (u64 i = 0; i < nr_folios; i++) {
+		const struct memfd_luo_folio_ser *pfolio = &folios_ser[i];
+
+		if (pfolio->pfn)
+			folio_put(pfn_folio(pfolio->pfn));
+	}
+}
+
 static void memfd_luo_finish(struct liveupdate_file_op_args *args)
 {
 	struct memfd_luo_folio_ser *folios_ser;
 	struct memfd_luo_ser *ser;
 
-	/*
-	 * If retrieve was successful, nothing to do. If it failed, retrieve()
-	 * already cleaned up everything it could. So nothing to do there
-	 * either. Only need to clean up when retrieve was not called.
-	 */
-	if (args->retrieve_status)
+	/* If retrieve failed, it already cleaned up everything it could. */
+	if (args->retrieve_status < 0)
 		return;
 
 	ser = phys_to_virt(args->serialized_data);
 	if (!ser)
 		return;
 
-	if (ser->nr_folios) {
-		folios_ser = kho_restore_vmalloc(&ser->folios);
-		if (!folios_ser)
-			goto out;
+	if (args->retrieve_status > 0) {
+		/*
+		 * Retrieve was successful, release the folios and unfreeze the
+		 * file so it can be used normally.
+		 */
+		struct inode *inode = file_inode(args->file);
+
+		folios_ser = args->private_data;
+
+		inode_lock(inode);
+		memfd_luo_put_retrieved_folios(folios_ser, ser->nr_folios);
+		shmem_freeze(inode, false);
+		inode_unlock(inode);
 
-		memfd_luo_discard_folios(folios_ser, ser->nr_folios);
 		vfree(folios_ser);
+	} else if (args->retrieve_status == 0 && ser->nr_folios) {
+		/* Retrieve was not called, discard the preserved folios. */
+		folios_ser = kho_restore_vmalloc(&ser->folios);
+		if (folios_ser) {
+			memfd_luo_discard_folios(folios_ser, ser->nr_folios);
+			vfree(folios_ser);
+		}
 	}
 
-out:
 	kho_restore_free(ser);
 }
 
@@ -552,7 +583,10 @@ static int memfd_luo_retrieve_folios(struct file *file,
 		nr_added_pages += npages;
 		folio_add_lru(folio);
 		folio_unlock(folio);
-		folio_put(folio);
+		/*
+		 * Keep the reference from kho_restore_folio(). It is dropped
+		 * in finish().
+		 */
 	}
 
 	shmem_recalc_inode(inode, nr_added_pages, 0);
@@ -566,9 +600,12 @@ static int memfd_luo_retrieve_folios(struct file *file,
 	folio_put(folio);
 put_folios:
 	/*
-	 * Note: don't free the folios already added to the file. They will be
-	 * freed when the file is freed. Free the ones not added yet here.
+	 * Drop the references held on the folios already added to the file.
+	 * The folios themselves will be freed when the file is freed.
 	 */
+	memfd_luo_put_retrieved_folios(folios_ser, i);
+
+	/* Free the ones not added yet here. */
 	for (long j = i + 1; j < nr_folios; j++) {
 		const struct memfd_luo_folio_ser *pfolio = &folios_ser[j];
 		phys_addr_t phys;
@@ -589,7 +626,7 @@ static int memfd_luo_retrieve_folios(struct file *file,
 
 static int memfd_luo_retrieve(struct liveupdate_file_op_args *args)
 {
-	struct memfd_luo_folio_ser *folios_ser;
+	struct memfd_luo_folio_ser *folios_ser = NULL;
 	struct memfd_luo_ser *ser;
 	struct file *file;
 	int err;
@@ -624,6 +661,17 @@ static int memfd_luo_retrieve(struct liveupdate_file_op_args *args)
 	vfs_setpos(file, ser->pos, MAX_LFS_FILESIZE);
 	i_size_write(file_inode(file), ser->size);
 
+	/*
+	 * Keep the file frozen until finish(). Other preserved objects might
+	 * depend on it.
+	 *
+	 * The file isn't visible to anyone yet, but take the lock anyway since
+	 * shmem_freeze() requires it.
+	 */
+	inode_lock(file_inode(file));
+	shmem_freeze(file_inode(file), true);
+	inode_unlock(file_inode(file));
+
 	if (ser->nr_folios) {
 		folios_ser = kho_restore_vmalloc(&ser->folios);
 		if (!folios_ser) {
@@ -632,16 +680,17 @@ static int memfd_luo_retrieve(struct liveupdate_file_op_args *args)
 		}
 
 		err = memfd_luo_retrieve_folios(file, folios_ser, ser->nr_folios);
-		vfree(folios_ser);
 		if (err)
-			goto put_file;
+			goto free_folios_ser;
 	}
 
 	args->file = file;
-	kho_restore_free(ser);
+	args->private_data = folios_ser;
 
 	return 0;
 
+free_folios_ser:
+	vfree(folios_ser);
 put_file:
 	fput(file);
 free_ser:
-- 
2.56.0.542.g3ef89b7020-goog

