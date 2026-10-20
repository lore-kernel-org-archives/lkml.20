Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485947;
	b=Bv9NoQWomzG9hB4awk1X8vQeHE0mLVTbEp2G7PyooTQPwNn3aZ6TFRWu14tv4IX9OKGa
	 liOazHDtbrhkFNaUGrJfcnuNj9FLRx3Z4aTrkjQSyqqvD+W5T4IokC5qyzOa+H4bEIGUx
	 OzrITMo2zy5EOBm6OYP3JrNSa6ZBOSjJUJh+xagM/4QXKgPcqOrBbFOxj7NvMAlk/HKgG
	 nM6bnWLg8wUCOkeuNqizBLQ/QNeQJT9xROpIE/lElsFltntuEx2iGaytmCR3zneelAsom
	 G/aRvJJwSqWJeucT1ugTxGEHM6vNuXwFVLPH4Jg5AF3ZRHIE0k2q+Ir0R+So/6utPkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485947;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=EX4WVX7H/XrzTsPtwby4poMAUKcNur2ypMRsn5jIfo0=;
	b=zzKYOFpcIjugCU/8f9jssbzlVs/Fs7OpWtofeSZ0gAEoQDUAkPSYhZan3vv547SBPVpS
	 CSDmz4t8y5724f3+Y93wjkFwZ+pYOHzD3y02cN3slBD4TL70iNg2u/dhCh6QvH3IQu1WY
	 2Cv47MdYd5j1cmNUjB9eNVDd23oOPa2QqgkBqULBxqS9J6FR0Df36g/ug7DUGO8vjI2kx
	 BC+DpoXIB82ccXHH6cHqhjzzF0zisF2MihM0/t+vS0Xw/KMmDtxVp2w5YjsJmDA2ZEOa5
	 UKuMwd83Yi6hcmNjoD63fwzad+7go46PT6uONzH3D07A8SNDG2wR/+EKOPyG6/c8tmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=T0m17jSc;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A038060A2628
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:45:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A038060A2628
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=T0m17jSc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=EX
	4WVX7H/XrzTsPtwby4poMAUKcNur2ypMRsn5jIfo0=; b=T0m17jScuJZ0o6hfXi
	EzAdixgcr2DJi/ylRtbdHBBjX8dDfYiN+orJDUcrxaRRBYqnhlaUGFuVI/Uj75ao
	BegYLwiVlfr0wvbKOXpb0Czq2fgrPwJPrWHNINioygUdTb88pm0DTr2Hnmu1YXsG
	hXvRk41aehJ+g8H8ykGAmNVlY=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3n0ksKtdq7UkHBg--.56105S4;
	Tue, 20 Oct 2026 16:45:35 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	wangxuewen@kylinos.cn,
	wudandan@kylinos.cn
Subject: [PATCH v4 10/31] ntfs: report LZNT1 and WOF compressed stream errors
Date: Tue, 20 Oct 2026 16:44:00 +0800
Message-ID: <20261020084421.2196486-11-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261020084421.2196486-1-liubaolin12138@163.com>
References: <20261020084421.2196486-1-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wD3n0ksKtdq7UkHBg--.56105S4
X-Coremail-Antispam: 1Uf129KBjvJXoW3JFy7XF1fXr1Uuw1Dur45KFg_yoW7uw1UpF
	ZxCr93Kr1kXr9rWrnxtrZ09w4ak348G3yUGrWxW3W7X3Z8tw1vgF4DtFnYgrWkKr95J39r
	JayDGrWUGF47XF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jrZ23UUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6g8m8GrXKi987wAA3Y

From: Dandan Wu <wudandan@kylinos.cn>

Compressed I/O can detect malformed LZNT1 data or WOF metadata and
compressed data without reporting it. Report corruption as EFSCORRUPTED
and retain underlying read, mapping and allocation errors.

Save compression-buffer allocation errors before cleanup so ENOMEM does
not become EIO. Report failed mapping updates after compressed writes
and failed cluster release separately from the initiating error.

Signed-off-by: Dandan Wu <wudandan@kylinos.cn>
---
Testing:
Fault injection of compression-buffer allocation failure confirms that
it emits no error event and a subsequent read can succeed.

 fs/ntfs/compress.c | 30 +++++++++++++++++++++++-------
 fs/ntfs/wof.c      | 31 ++++++++++++++++++++++++++-----
 2 files changed, 49 insertions(+), 12 deletions(-)

diff --git a/fs/ntfs/compress.c b/fs/ntfs/compress.c
index 82c7c7d29073..a82c05bd7625 100644
--- a/fs/ntfs/compress.c
+++ b/fs/ntfs/compress.c
@@ -585,11 +585,13 @@ int ntfs_read_compressed_block(struct folio *folio)
 	nr_cbs--;
 
 	mutex_lock(&ntfs_cb_lock);
-	if (!ntfs_compression_buffer)
-		if (allocate_compression_buffers()) {
+	if (!ntfs_compression_buffer) {
+		err = allocate_compression_buffers();
+		if (err) {
 			mutex_unlock(&ntfs_cb_lock);
 			goto err_out;
 		}
+	}
 
 
 	cb = ntfs_compression_buffer;
@@ -633,7 +635,8 @@ int ntfs_read_compressed_block(struct folio *folio)
 			 * duration.
 			 */
 			up_read(&ni->runlist.lock);
-			if (!ntfs_map_runlist(ni, vcn))
+			err = ntfs_map_runlist(ni, vcn);
+			if (!err)
 				goto lock_retry_remap;
 			mutex_unlock(&ntfs_cb_lock);
 			goto map_rl_err;
@@ -787,6 +790,8 @@ int ntfs_read_compressed_block(struct folio *folio)
 			ntfs_error(vol->sb,
 				"ntfs_decompress() failed in inode 0x%llx with error code %i. Skipping this compression block.",
 				ni->mft_no, -err);
+			err = -EFSCORRUPTED;
+			ntfs_report_file_metadata_error(VFS_I(ni), err);
 			/* Release the unfinished pages. */
 			for (; prev_cur_page < cur_page; prev_cur_page++) {
 				page = pages[prev_cur_page];
@@ -839,7 +844,9 @@ int ntfs_read_compressed_block(struct folio *folio)
 	goto err_out;
 
 rl_err:
+	err = -EFSCORRUPTED;
 	up_read(&ni->runlist.lock);
+	ntfs_report_file_metadata_error(VFS_I(ni), -EFSCORRUPTED);
 	ntfs_error(vol->sb, "ntfs_rl_vcn_to_lcn() failed. Cannot read compression block.");
 	goto err_out;
 
@@ -859,7 +866,7 @@ int ntfs_read_compressed_block(struct folio *folio)
 	}
 	kfree(pages);
 	kfree(completed_pages);
-	return -EIO;
+	return err;
 }
 
 /*
@@ -1443,6 +1450,9 @@ static int ntfs_write_cb(struct ntfs_inode *ni, loff_t pos, struct page **pages,
 		up_write(&ni->runlist.lock);
 		ntfs_error(vol->sb, "Failed to merge runlists");
 		err = PTR_ERR(rl);
+		if (err != -ENOMEM)
+			err = -EFSCORRUPTED;
+		ntfs_report_file_metadata_error(VFS_I(ni), err);
 		goto free_rlc;
 	}
 
@@ -1453,12 +1463,18 @@ static int ntfs_write_cb(struct ntfs_inode *ni, loff_t pos, struct page **pages,
 	err = ntfs_attr_update_mapping_pairs_locked(ni, 0, ni);
 	up_write(&ni->runlist.lock);
 	if (err)
-		err = -EIO;
+		ntfs_report_file_metadata_error(VFS_I(ni), err);
 	goto out;
 
 free_rlc:
-	if (ntfs_cluster_free_from_rl(vol, rlc))
-		ntfs_error(vol->sb, "Failed to free hot clusters.");
+	{
+		int free_err = ntfs_cluster_free_from_rl(vol, rlc);
+
+		if (free_err) {
+			ntfs_report_file_metadata_error(VFS_I(ni), free_err);
+			ntfs_error(vol->sb, "Failed to free hot clusters.");
+		}
+	}
 	kvfree(rlc);
 out:
 	NInoSetFileNameDirty(ni);
diff --git a/fs/ntfs/wof.c b/fs/ntfs/wof.c
index e64f40835957..30b048bcac83 100644
--- a/fs/ntfs/wof.c
+++ b/fs/ntfs/wof.c
@@ -294,7 +294,7 @@ static int parse_wof_chunk_table(struct ntfs_inode *base_ni,
 		ret = ntfs_bdev_read_from_rl(ni->vol, &ni->runlist,
 					     start_sector, sectors, buf);
 		if (ret)
-			return -EIO;
+			return ret;
 		buf += sector_off;
 	} else {
 		struct ntfs_attr_search_ctx *ctx;
@@ -685,15 +685,21 @@ int ntfs_read_wof_compressed_block(struct folio *folio)
 				   WOF_NAME_LEN);
 	if (IS_ERR(wof_inode)) {
 		err = PTR_ERR(wof_inode);
+		if (err == -ENOENT) {
+			err = -EFSCORRUPTED;
+			ntfs_report_file_metadata_error(VFS_I(ni),
+							-EFSCORRUPTED);
+		}
 		goto out;
 	}
 
 	wof_ni = NTFS_I(wof_inode);
 	if (wof_ni->initialized_size != wof_ni->data_size) {
+		ntfs_report_file_metadata_error(VFS_I(ni), -EFSCORRUPTED);
 		ntfs_error(vol->sb,
 			   "WOF compressed stream is not fully initialized (init %lld, data %lld).",
 			   wof_ni->initialized_size, wof_ni->data_size);
-		err = -EIO;
+		err = -EFSCORRUPTED;
 		goto out_iput;
 	}
 	if (NInoNonResident(wof_ni) && !NInoFullyMapped(wof_ni)) {
@@ -725,21 +731,36 @@ int ntfs_read_wof_compressed_block(struct folio *folio)
 		err = parse_wof_chunk_table(ni, wof_ni, chunk_idx, chunk_count,
 					    decomp_size, &chunk_offset,
 					    &chunk_size, input, input_size);
-		if (err)
+		if (err) {
+			if (err == -EINVAL || err == -EOVERFLOW || err == -ENOENT)
+				err = -EFSCORRUPTED;
+			if (err == -EIO || err == -EFSCORRUPTED)
+				ntfs_report_file_metadata_error(VFS_I(ni), err);
 			goto out_free_input;
+		}
 
 		err = ntfs_read_wof_chunk(vol, wof_ni, chunk_offset, chunk_size,
 					  input, input_size, &chunk_mem);
-		if (err)
+		if (err) {
+			if (err == -EINVAL || err == -EOVERFLOW || err == -ENOENT) {
+				err = -EFSCORRUPTED;
+				ntfs_report_file_metadata_error(VFS_I(ni), err);
+			}
 			goto out_free_input;
+		}
 
 		err = ntfs_wof_decompress_chunk(ws, vol, mapping, folio,
 						folio_start, folio_end,
 						chunk_idx * ws->comp_unit,
 						chunk_mem, chunk_size,
 						decomp_size);
-		if (err)
+		if (err) {
+			if (err != -ENOMEM) {
+				err = -EFSCORRUPTED;
+				ntfs_report_file_metadata_error(VFS_I(ni), err);
+			}
 			goto out_free_input;
+		}
 	}
 
 	if (folio_end > i_size)
-- 
2.51.0

