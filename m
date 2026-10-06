Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755903D953F
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 09:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791279273; cv=none; b=U0uiVD/MshDGrAK94ieABch3fdDRZ+tTs+3bpfhEABXOGHKXVkrW+82QA/z5IDuWT0bVDfkEeJuTbLnvjCMV2hbRNdyDD5LHuxHNxg6yY36VjkNbZu5eG8ItkCiGNn+5ByukygXXdTrNF9Po2C/stsIp4X0mvjUNAXfZ/xpKru8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791279273; c=relaxed/simple;
	bh=Wztmnb+n43pJJ0UkKuH8A3Hbte7BsrS51rqKdvNwCbA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bORslCTa2kWiEdMlUJ9Dq66vUeGwqj1fIRit506N5dexjHhXCY6q7+R+T58jMqdD9J/PxG+FWLO13f3mDI6PMJ1tLR/27e3vUzjsCxCW/Y+HYcNm9WNlP1Ygyb2HjRiZHn9wT4Y2UZhFHPfLxvjC+pf5Y0/G7lZBOUmQjP6huH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RQh8tHD0; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RQh8tHD0"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so1395089a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 02:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791279264; x=1791884064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gxl12lnkjpIAZPhVHEuM71br75oaqFyLuKMKo+DSpAA=;
        b=RQh8tHD0vbJBWcYWOb7xkDqaY7lchjvStsK6S1rE4Sel0CDiMwGYD6zCAvtHjJwlsA
         G2vINRvxg9o9EUnBLp8bzuJDF83dG4qVyFcB/pzvWPMkxGqpx+HG9CUVoCzg9fNqqwYJ
         trzMRmXomkBWKiyWt95wk17pVYpv6eZJSifB2WBj5y+KeITjRoSUiVWWkc5bmB5+/uLp
         JC5EeOC4uUNW/dM1zc5UTRFsw9KpbrbKmRuStW6ayugJdmYwjN7yqgmebL2HOAZwVQHx
         wVuCwNfBoNR9MfWYvbY7ROiFvytSQ94JZq+w4tDUULVRGa/B/OoQ6xY3xtIqssyI5Nzk
         Dpmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791279264; x=1791884064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gxl12lnkjpIAZPhVHEuM71br75oaqFyLuKMKo+DSpAA=;
        b=nKgX8coyVULcVrwnCiHitVAry9z1yYw/EL5fDIwNcQ6BxkuHPKD/1jZ5M86N+OaHKY
         Ht5yShev7agAt/XrUBsUnoqQA7oIe+6zT6Bev4iIMlrOC+RQyWj3W0suZt8VqyGEex6e
         PV7LEQ+wz9Qfp2gX7Tf4N/qlxsN7m4hMac5FZuEHbvlbiSDy7f9+dv8Lm5OHc4L5EG9C
         twb67URg6VLBiJ3TD/qTR0cHZUJTsXFQtrxWL5lRWqLuLoRjCVKtImn67A21/PRaIh8u
         RZXAyA6MScwlox0+i/CAnleSaWbm4KV2hI8YDTSJ4AbmoLqnddEy/mWU5qv62mKZPdfC
         qyVw==
X-Forwarded-Encrypted: i=1; AKwUvBx0PwEYISkTLwc6VNuMiXJSOZxZc0uXYv5UUPYHLp4uqoEOtZPzt0VHuNOe5F2frCCUs5UmDvlNVCPeV9k=@vger.kernel.org
X-Gm-Message-State: AFq9FYKqjEaIguy+pYLRluVuA1tnK9QLFacjtnchRlrtnVj3z4F8Vs1l
	auSdEGEmi5EaJoOM2cCK+isyqKMuNyHrALucOlcC+zP0nfx2jP4KhEHRANzXZoqG
X-Gm-Gg: AYBFou3++DhDBz6BeXt4n1ODK6EmS3HBxvuo8ptC0PNlavykD4iucPKSV3XMjlEkgYL
	x6AAYLg+3MEI+J4nYLcmXh0WVFdGH+za7jbqwKp+8HCZ6XoKYOs5EdI2Kwkq/3zljhT4X6FISdG
	k6SU3M9ZipkNAVp3W/kO1RIM5d+3tDBh4OVmOVjRqMDXltB+Pab+2uDWcIbsAOPDYxMTwyR96md
	7e/h9BIWSqQdCUGm8/syE8bpB103v8myhScjPX7cHLgy+G3uDahy0hp2+6MrMoT7gN49Jcpsz8o
	cMeMRgUd8rOcWVxCIsr1QrQoNSMaKtbLOIH3PphZjqHlUZ8WizoCMs7P70IoMGyCf2EncwZqmwe
	9W22/jPRi9UQ+Z5anMQ0LWXMXl2Q4gU/WGIYRS4J0P1odfpybARr0Cds1mCZBLEogosfEA4XGNA
	Ncstt2F5QHhbW1T8bhlTqLcbvDmvEDydw9pN8nrpwsMNPPC6etpeqCO1z5xML2RI2mXEalSA==
X-Received: by 2002:a17:90b:2791:b0:3a6:d94d:e150 with SMTP id 98e67ed59e1d1-3a78717dee2mr8481523a91.23.1791279263758;
        Tue, 06 Oct 2026 02:34:23 -0700 (PDT)
Received: from gmail.com ([188.253.12.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8543ab76bsm3905277a91.13.2026.10.06.02.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 02:34:23 -0700 (PDT)
From: Jia Jia <physicalmtea@gmail.com>
To: "Martin K . Petersen" <mkp@kernel.org>
Cc: Jan Engelhardt <jengelh@inai.de>,
	Hannes Reinecke <hare@suse.de>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Akinobu Mita <akinobu.mita@gmail.com>,
	James Bottomley <James.Bottomley@suse.de>,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jia Jia <physicalmtea@gmail.com>
Subject: [PATCH 1/8] scsi: target: take COMPARE AND WRITE data from the write half
Date: Tue,  6 Oct 2026 17:33:31 +0800
Message-Id: <20261006093338.27342-2-physicalmtea@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261006093338.27342-1-physicalmtea@gmail.com>
References: <20261006093338.27342-1-physicalmtea@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

compare_and_write_callback() builds the write sgl as
sg->offset + block_size on the first data sg. That offset is the end
of the compare buffer, not the write buffer.

vhost-scsi keeps each descriptor inside one page. A 512-byte compare
buffer placed at the end of a page makes offset + block_size equal to
PAGE_SIZE, and the write then uses the next physical page. The kernel
subsequently reads 512 bytes from that page. If the adjacent memory
region happens to be a freed slab object, KASAN reports:

  BUG: KASAN: slab-use-after-free in copy_folio_from_iter_atomic
  Read of size 512

  compare_and_write_callback
  __target_execute_cmd
  sbc_execute_rw
  fd_execute_rw
  fd_do_rw
  vfs_iter_write
  copy_folio_from_iter_atomic

Skip the compare bytes and describe only the sg entries that hold the
write half. A write that crosses an sg boundary stays in those entries
instead of being forced into one slot.

Free that table with sg_free_table().  sg_alloc_table() chains once
the write half has more entries than fit in one page, and kfree() of
cmd->t_data_sg would drop only the first allocation.

Fixes: d94e5a61357a ("target: fix COMPARE_AND_WRITE non zero SGL offset data corruption")
Signed-off-by: Jia Jia <physicalmtea@gmail.com>
---
 drivers/target/target_core_sbc.c       | 100 +++++++++++++++++--------
 drivers/target/target_core_transport.c |  11 ++-
 2 files changed, 80 insertions(+), 31 deletions(-)

diff --git a/drivers/target/target_core_sbc.c b/drivers/target/target_core_sbc.c
index 21f5cb86d70c..adef903652ac 100644
--- a/drivers/target/target_core_sbc.c
+++ b/drivers/target/target_core_sbc.c
@@ -433,19 +433,74 @@ compare_and_write_do_cmp(struct scatterlist *read_sgl, unsigned int read_nents,
 	return ret;
 }
 
+/*
+ * Data-out is compare bytes followed by write bytes.  Take the write
+ * half from whatever sg entries hold it.  Do not add block_size onto
+ * the first sg offset: that page may end before the write half.
+ */
+static int sbc_caw_build_write_sg(struct sg_table *tbl,
+				  struct scatterlist *data_sg,
+				  unsigned int data_nents, unsigned int skip,
+				  unsigned int len)
+{
+	struct scatterlist *sg, *out;
+	unsigned int nents = 0, left = len, left_skip = skip;
+	unsigned int avail, chunk;
+	int i;
+
+	for_each_sg(data_sg, sg, data_nents, i) {
+		if (!sg->length)
+			continue;
+		if (!left)
+			break;
+		if (left_skip >= sg->length) {
+			left_skip -= sg->length;
+			continue;
+		}
+		avail = sg->length - left_skip;
+		chunk = min(left, avail);
+		nents++;
+		left -= chunk;
+		left_skip = 0;
+	}
+	if (!nents || left)
+		return -EINVAL;
+
+	if (sg_alloc_table(tbl, nents, GFP_KERNEL))
+		return -ENOMEM;
+
+	left = len;
+	left_skip = skip;
+	out = tbl->sgl;
+	for_each_sg(data_sg, sg, data_nents, i) {
+		if (!sg->length)
+			continue;
+		if (!left)
+			break;
+		if (left_skip >= sg->length) {
+			left_skip -= sg->length;
+			continue;
+		}
+		avail = sg->length - left_skip;
+		chunk = min(left, avail);
+		sg_set_page(out, sg_page(sg), chunk, sg->offset + left_skip);
+		left -= chunk;
+		left_skip = 0;
+		out = sg_next(out);
+	}
+	return 0;
+}
+
 static sense_reason_t compare_and_write_callback(struct se_cmd *cmd, bool success,
 						 int *post_ret)
 {
 	struct se_device *dev = cmd->se_dev;
 	struct sg_table write_tbl = { };
 	struct scatterlist *write_sg;
-	struct sg_mapping_iter m;
-	unsigned int len;
-	unsigned int block_size = dev->dev_attrib.block_size;
-	unsigned int compare_len = (cmd->t_task_nolb * block_size);
+	unsigned int compare_len = (cmd->t_task_nolb * dev->dev_attrib.block_size);
 	unsigned int miscmp_off = 0;
 	sense_reason_t ret = TCM_NO_SENSE;
-	int i;
+	int rc;
 
 	if (!success) {
 		/*
@@ -499,34 +554,19 @@ static sense_reason_t compare_and_write_callback(struct se_cmd *cmd, bool succes
 	} else if (ret)
 		goto out;
 
-	if (sg_alloc_table(&write_tbl, cmd->t_data_nents, GFP_KERNEL) < 0) {
-		pr_err("Unable to allocate compare_and_write sg\n");
-		ret = TCM_OUT_OF_RESOURCES;
+	rc = sbc_caw_build_write_sg(&write_tbl, cmd->t_data_sg,
+				    cmd->t_data_nents, compare_len,
+				    compare_len);
+	if (rc) {
+		pr_err("Unable to build compare_and_write sg\n");
+		if (rc == -ENOMEM)
+			ret = TCM_OUT_OF_RESOURCES;
+		else
+			ret = TCM_LOGICAL_UNIT_COMMUNICATION_FAILURE;
 		goto out;
 	}
 	write_sg = write_tbl.sgl;
 
-	i = 0;
-	len = compare_len;
-	sg_miter_start(&m, cmd->t_data_sg, cmd->t_data_nents, SG_MITER_TO_SG);
-	/*
-	 * Currently assumes NoLB=1 and SGLs are PAGE_SIZE..
-	 */
-	while (len) {
-		sg_miter_next(&m);
-
-		if (block_size < PAGE_SIZE) {
-			sg_set_page(&write_sg[i], m.page, block_size,
-				    m.piter.sg->offset + block_size);
-		} else {
-			sg_miter_next(&m);
-			sg_set_page(&write_sg[i], m.page, block_size,
-				    m.piter.sg->offset);
-		}
-		len -= block_size;
-		i++;
-	}
-	sg_miter_stop(&m);
 	/*
 	 * Save the original SGL + nents values before updating to new
 	 * assignments, to be released in transport_free_pages() ->
@@ -535,7 +575,7 @@ static sense_reason_t compare_and_write_callback(struct se_cmd *cmd, bool succes
 	cmd->t_data_sg_orig = cmd->t_data_sg;
 	cmd->t_data_sg = write_sg;
 	cmd->t_data_nents_orig = cmd->t_data_nents;
-	cmd->t_data_nents = 1;
+	cmd->t_data_nents = write_tbl.nents;
 
 	cmd->sam_task_attr = TCM_HEAD_TAG;
 	cmd->transport_complete_callback = compare_and_write_post;
diff --git a/drivers/target/target_core_transport.c b/drivers/target/target_core_transport.c
index dcfe94594916..3cae5ed67d41 100644
--- a/drivers/target/target_core_transport.c
+++ b/drivers/target/target_core_transport.c
@@ -22,6 +22,7 @@
 #include <linux/module.h>
 #include <linux/ratelimit.h>
 #include <linux/vmalloc.h>
+#include <linux/scatterlist.h>
 #include <linux/unaligned.h>
 #include <net/sock.h>
 #include <net/tcp.h>
@@ -2724,10 +2725,18 @@ static inline void transport_reset_sgl_orig(struct se_cmd *cmd)
 	 * Check for saved t_data_sg that may be used for COMPARE_AND_WRITE
 	 * emulation, and free + reset pointers if necessary..
 	 */
+	struct sg_table table = { };
+
 	if (!cmd->t_data_sg_orig)
 		return;
 
-	kfree(cmd->t_data_sg);
+	/*
+	 * compare_and_write_callback() built this with sg_alloc_table().
+	 * Above SG_MAX_SINGLE_ALLOC the tail is a separate allocation.
+	 */
+	table.sgl = cmd->t_data_sg;
+	table.orig_nents = cmd->t_data_nents;
+	sg_free_table(&table);
 	cmd->t_data_sg = cmd->t_data_sg_orig;
 	cmd->t_data_sg_orig = NULL;
 	cmd->t_data_nents = cmd->t_data_nents_orig;
-- 
2.34.1

