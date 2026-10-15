Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12623750BC
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028177; cv=none; b=BpKAqx+ES7Jo+QOz/+vYubSSpUP9c9SoIp6PSTH9tkXLsQ+wzWRYgI6WiGzJFnY0RVI7Hd4s4nS3BtrsJMlt8XxQxkYs0GHw+5qHgx/b+47yr5pwdt5066t583iyrFqqeJBXbder7iKuW4xdhvL/MVbFzgW2p7FLYsHn0VSf00c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028177; c=relaxed/simple;
	bh=oeOfkxsdwLVtqeqoM5EBw20TXMOHkq6CVcPWVMC4DH0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NJy/scjJXXAFKq6jZy2GElqabQy85djIps+zsA591kgF4rYxYbBvgmRW+PAcWYppKjNNRNOWJt4K0EHMpyDchZ+QbXcwaE/Jno7T/ium1902vGcD6+1YRy3vYDXAlimPkNPxxZyIXUPP3SJhbBv428CrA6LL/Q4TwYiqEcd2PWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=CwAYqYmT; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=BNhDRxto; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="CwAYqYmT";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="BNhDRxto"
Received: from pps.filterd (m0167074.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F0XR79151219
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 21:36:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=vdJl
	nwBnWrbQnHWEWQ42InhVfNcMWjygdXmOiBnvkrM=; b=CwAYqYmTe/hmGwnlSCqE
	a8KkYGERg9S0l/YwIrqCCv7x8QyXfvWzozZgp+VqjnIY0kYnLIK0w8mLq4VCj6Yh
	q2s8j0fUMmBwh3xZYW/hXWnnkFjMMLJSi0p9BVZEe0lKzTNnTTF5AmxDF4798xBT
	FpyXe+ogB9EHs7bhOlBqAROJSMwjONr/cB3Gxj5spn/LM04TiZAvoLfFoB8fRtgs
	SeF5M4+MvpARcwdHyK9IE82fuA0Cv8rNosC4pua9vwO42w/QIe5PJ+7t/i9qf809
	a1pkGN0jVKY5UY110F4Aad7rX4/zK77Z4G1yNoskNJVWpCRZKhxXt6kKsyQlFU+L
	fw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hafacana7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 21:36:13 -0400 (EDT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-532dc3793easo30817131cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1792028173; x=1792632973; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vdJlnwBnWrbQnHWEWQ42InhVfNcMWjygdXmOiBnvkrM=;
        b=BNhDRxtoIqZC8PA5WDHqSdPDAyCkZYB3ndGWe4DcOzAcqcaKYh02enQJdHNrE7gGqH
         uUIcEzKVrqAN/LcXlgWK/BvGw/cciWKby0KC1k6aZmxTpR7BP6YZqOkXAe+G8JZw3H3W
         G0cg9rtrWwUHjmnL2sX4eD5eqP9V/AFgON99XA7og2yF35XRqFGM4NeLn7pwkxx3RSJR
         UxWRTWbaIUzDXiPdO5tHDucmoFB2GXwTZ9qNJ+EuH13laJwdXaT2wj4CWboS/pStSN2A
         B2s/RZ1OQ8j/RxirBbJvS1cbvDdqLIRTJG4JEhCmIisGuGjwCHEPClOeL3Mhw7Thm3j9
         WYXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028173; x=1792632973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vdJlnwBnWrbQnHWEWQ42InhVfNcMWjygdXmOiBnvkrM=;
        b=ubXuz+J0sNbJF8mIxM9A6dcOgNmR1yRCmnU1us7c17G+1HVGRivGHkr/Yzat3+r2Z8
         OweGSCo03vEiylQGo6G/L0yV2v15lm91MeTpR8KqBX6EpcHVUYN8O2lLUafpbvmloaPH
         FNJSQaJDnn7JD1A59o89WFaowKCxC+up3FcgxDTs2l+mspW0oYWer7I7zKRSYnX4wgQY
         j3vn42Xtq2BYh7XZSZ7+3YQfayPkyUibyEds3QmRcBYB6e5Bh68fAIkJGP2gkfdC2+UO
         5FRV81f2YgxFMN7brlDPcouYfHJFv5vw0w9PxFZQ3Yr49IYtidxX5bBvMOcUTbQ4J4oG
         f7Jw==
X-Forwarded-Encrypted: i=1; AKwUvBw9a0nuz/dMW/Nv4A+KQ3f8MHLYxPgAnV4in5JSJYONhb4Y8wzSIeFeLbzGMUApIKKJ8xRF/ZCsycuejoQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJz/Dv/9RFcykzAK63s7JB7hOcSwEI8NARXUjR1JlW8goqciouc
	s22ZaZFtjxcdj57NIKwZiDB/1A5FznRxSKtV0uYOPeHw9SNWZCJzp6sIGmlnAwwC7q2HYRcUii1
	2K7qF6cuJr5Q9vl1yZtHe/ShdZZ+30NyyvcT9E0ZNM4Vc95mNTeU5qhXkGsNANg==
X-Gm-Gg: AYBFou3NPDxgmxBER/6HteM8+PG0TLw5UZK+Dk3clpPTGKtlmYmdYvORtaNwedpCkpt
	FVZHWv8GOleNFyJD+Pygp7eUBJtGKB+e8t/D/EC/andzUasP5OFl256UZ2ctL5/z6fVY34EX/SA
	06YFTdewGchhCGRgf+s9gIYkkL9QUqumZrc/Hsd4yiaQ4LTeOkyu1QL5Mp4zEF0XX72ZxYygGs2
	X8JZtogQ1fJm16ksBpTQhhflWAf7sFP2QbIrtS+s9sU0w6ImtBD2uwbOQLpicujMzrWnfqtUQtN
	WgTWWHul/vfC2wxIlnOtv3huSM2OlTPMeAiB5m2Eeau/5hpL/Ej82AhcMbiB9Li9uQJT9F9mQPz
	nOEBD0wip1R7UFN05frRbFdNFSynxk3Z/lQ+mtEojFw56
X-Received: by 2002:a05:622a:148c:b0:535:8d35:6355 with SMTP id d75a77b69052e-535a6073d08mr268443111cf.5.1792028173148;
        Wed, 14 Oct 2026 18:36:13 -0700 (PDT)
X-Received: by 2002:a05:622a:148c:b0:535:8d35:6355 with SMTP id d75a77b69052e-535a6073d08mr268442841cf.5.1792028172525;
        Wed, 14 Oct 2026 18:36:12 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5361279a933sm12657661cf.6.2026.10.14.18.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:36:12 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 14 Oct 2026 21:35:50 -0400
Subject: [PATCH 6/7] ecryptfs: rename functions to refer to folios
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-ecryptfs-folio-v1-6-f4412187b1d3@columbia.edu>
References: <20261014-ecryptfs-folio-v1-0-f4412187b1d3@columbia.edu>
In-Reply-To: <20261014-ecryptfs-folio-v1-0-f4412187b1d3@columbia.edu>
To: Tyler Hicks <code@tyhicks.com>
Cc: ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792028164; l=12226;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=oeOfkxsdwLVtqeqoM5EBw20TXMOHkq6CVcPWVMC4DH0=;
 b=E9xPE40HWgQ/tRVO18TxopQ/yFkzlW2zkGWKKea3MgN5f0i4YpOgU1JWQFrXO3ZXh2vSPKUOj
 3YtYL8f9DHbCLMOu/FHnrP/vudFzIupmHUCfhqHIFFW95UjCzpekIIh
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=ANXknWx0 c=1 sm=1 tr=0 ts=6ad02e0d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=azVShVRs0zEubeQ0wG0L:22
 a=UvMYEBrEvhs-qqGVCq8A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAwNiBTYWx0ZWRfX3Nj3ND0+RNSW
 LtHoJ/BhhtyK0uytPx5APplbo9DfM9UXTfONNuQQHeCqIm6446TPvTZyz2eOxwV6GdSBA8jGGmy
 UpvlkOlYggI7eJ+kXrCtSA0N0Ry34X+F78Z8O2J9+NMNbEkuo5LjS+ZzVf/N9UQymHFluAV5xuH
 ejNskd5f4VdS2ptLbT6a1TyfbkDUEiNR+gF2gYhFqdXAmRYXcciWqWMj5iHJ8J+DZ3x7guH8uTb
 wl4mSgPp+gATU6Xwa/uMpGKzJJ5rAp4dBerW2Ls/b9WxiIs0FucZccIO1ubf9wiCyVxOWqSwpJz
 LfOLo5YDbIG1e6dEFWnjR3mD68cmMhaZYebEg/XC/qdzVJwog+Lj2QnrG3EB/3OexBHFrJm26zi
 awg5dqsJrfLdgKx5Q4XpgE4vCFYeN8eof7LOQ62ioxDN8pLqpun8qbb/3AczlIbwlKdDl7ujqpD
 +ELJbMD1ggzZPMuJyMQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAwNiBTYWx0ZWRfX8uwjxIA6Y9v4
 pe1iSAlbx0lEN/dqWPNBFj3ZF72i0r2VgDDVkQxgbQ3FJpzm7xEHPQ2CBtj3QmkKOKebKbUJ2ZY
 KDdQgV5zh7GOGk4tCZOv2LBIQkSz5q9CoOybv9x1tYAUM4kF5nIQ
X-Proofpoint-GUID: eIgDARFgUk-hXkohvhpEKa7n40uxq6zc
X-Proofpoint-ORIG-GUID: eIgDARFgUk-hXkohvhpEKa7n40uxq6zc
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11935
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=10 suspectscore=0 malwarescore=0
 lowpriorityscore=10 phishscore=0 impostorscore=10 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150006

ecryptfs_encrypt_page(), ecryptfs_decrypt_page(),
ecryptfs_read_lower_page_segment(), ecryptfs_write_lower_page_segment(),
lower_offset_for_page() and fill_zeros_to_end_of_page() all take a folio
now. Rename them accordingly.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/ecryptfs/crypto.c          | 16 ++++++++--------
 fs/ecryptfs/ecryptfs_kernel.h |  8 ++++----
 fs/ecryptfs/inode.c           |  2 +-
 fs/ecryptfs/mmap.c            | 26 +++++++++++++-------------
 fs/ecryptfs/read_write.c      | 12 ++++++------
 5 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/fs/ecryptfs/crypto.c b/fs/ecryptfs/crypto.c
index f0e67b48917f..bbaeb9a38db0 100644
--- a/fs/ecryptfs/crypto.c
+++ b/fs/ecryptfs/crypto.c
@@ -212,11 +212,11 @@ static int crypt_scatterlist(struct ecryptfs_crypt_stat *crypt_stat,
 }
 
 /*
- * lower_offset_for_page
+ * lower_offset_for_folio
  *
  * Convert an eCryptfs page index into a lower byte offset
  */
-static loff_t lower_offset_for_page(struct ecryptfs_crypt_stat *crypt_stat,
+static loff_t lower_offset_for_folio(struct ecryptfs_crypt_stat *crypt_stat,
 				    struct folio *folio)
 {
 	return ecryptfs_lower_header_size(crypt_stat) +
@@ -274,7 +274,7 @@ static int crypt_extent(struct ecryptfs_crypt_stat *crypt_stat,
 }
 
 /**
- * ecryptfs_encrypt_page
+ * ecryptfs_encrypt_folio
  * @folio: Folio mapped from the eCryptfs inode for the file; contains
  *        decrypted content that needs to be encrypted (to a temporary
  *        buffer; not in place) and written out to the lower file
@@ -289,7 +289,7 @@ static int crypt_extent(struct ecryptfs_crypt_stat *crypt_stat,
  *
  * Returns zero on success; negative on error
  */
-int ecryptfs_encrypt_page(struct folio *folio)
+int ecryptfs_encrypt_folio(struct folio *folio)
 {
 	struct inode *ecryptfs_inode;
 	struct ecryptfs_crypt_stat *crypt_stat;
@@ -322,7 +322,7 @@ int ecryptfs_encrypt_page(struct folio *folio)
 		}
 	}
 
-	lower_offset = lower_offset_for_page(crypt_stat, folio);
+	lower_offset = lower_offset_for_folio(crypt_stat, folio);
 	rc = ecryptfs_write_lower(ecryptfs_inode, enc_extent_virt, lower_offset,
 				  PAGE_SIZE);
 	if (rc < 0) {
@@ -338,7 +338,7 @@ int ecryptfs_encrypt_page(struct folio *folio)
 }
 
 /**
- * ecryptfs_decrypt_page
+ * ecryptfs_decrypt_folio
  * @folio: Folio mapped from the eCryptfs inode for the file; data read
  *        and decrypted from the lower file will be written into this
  *        page
@@ -353,7 +353,7 @@ int ecryptfs_encrypt_page(struct folio *folio)
  *
  * Returns zero on success; negative on error
  */
-int ecryptfs_decrypt_page(struct folio *folio)
+int ecryptfs_decrypt_folio(struct folio *folio)
 {
 	struct inode *ecryptfs_inode;
 	struct ecryptfs_crypt_stat *crypt_stat;
@@ -367,7 +367,7 @@ int ecryptfs_decrypt_page(struct folio *folio)
 		&(ecryptfs_inode_to_private(ecryptfs_inode)->crypt_stat);
 	BUG_ON(!(crypt_stat->flags & ECRYPTFS_ENCRYPTED));
 
-	lower_offset = lower_offset_for_page(crypt_stat, folio);
+	lower_offset = lower_offset_for_folio(crypt_stat, folio);
 	page_virt = kmap_local_folio(folio, 0);
 	rc = ecryptfs_read_lower(page_virt, lower_offset, PAGE_SIZE,
 				 ecryptfs_inode);
diff --git a/fs/ecryptfs/ecryptfs_kernel.h b/fs/ecryptfs/ecryptfs_kernel.h
index 6a74a2bfc833..5c7cfb956455 100644
--- a/fs/ecryptfs/ecryptfs_kernel.h
+++ b/fs/ecryptfs/ecryptfs_kernel.h
@@ -549,8 +549,8 @@ void ecryptfs_destroy_mount_crypt_stat(
 	struct ecryptfs_mount_crypt_stat *mount_crypt_stat);
 int ecryptfs_init_crypt_ctx(struct ecryptfs_crypt_stat *crypt_stat);
 int ecryptfs_write_inode_size_to_metadata(struct inode *ecryptfs_inode);
-int ecryptfs_encrypt_page(struct folio *folio);
-int ecryptfs_decrypt_page(struct folio *folio);
+int ecryptfs_encrypt_folio(struct folio *folio);
+int ecryptfs_decrypt_folio(struct folio *folio);
 int ecryptfs_write_metadata(struct dentry *ecryptfs_dentry,
 			    struct inode *ecryptfs_inode);
 int ecryptfs_read_metadata(struct dentry *ecryptfs_dentry);
@@ -633,13 +633,13 @@ int ecryptfs_keyring_auth_tok_for_sig(struct key **auth_tok_key,
 				      char *sig);
 int ecryptfs_write_lower(struct inode *ecryptfs_inode, char *data,
 			 loff_t offset, size_t size);
-int ecryptfs_write_lower_page_segment(struct inode *ecryptfs_inode,
+int ecryptfs_write_lower_folio_segment(struct inode *ecryptfs_inode,
 				      struct folio *folio_for_lower,
 				      size_t offset_in_page, size_t size);
 int ecryptfs_write(struct inode *inode, char *data, loff_t offset, size_t size);
 int ecryptfs_read_lower(char *data, loff_t offset, size_t size,
 			struct inode *ecryptfs_inode);
-int ecryptfs_read_lower_page_segment(struct folio *folio_for_ecryptfs,
+int ecryptfs_read_lower_folio_segment(struct folio *folio_for_ecryptfs,
 				     pgoff_t page_index,
 				     size_t offset_in_page, size_t size,
 				     struct inode *ecryptfs_inode);
diff --git a/fs/ecryptfs/inode.c b/fs/ecryptfs/inode.c
index c743b0f2ab4b..ffd6da87c8ca 100644
--- a/fs/ecryptfs/inode.c
+++ b/fs/ecryptfs/inode.c
@@ -741,7 +741,7 @@ static int ecryptfs_zero_tail(struct inode *inode, loff_t pos)
 	folio_lock(folio);
 	folio_zero_range(folio, from, folio_size(folio) - from);
 	folio_unlock(folio);
-	rc = ecryptfs_encrypt_page(folio);
+	rc = ecryptfs_encrypt_folio(folio);
 	folio_put(folio);
 	return rc;
 }
diff --git a/fs/ecryptfs/mmap.c b/fs/ecryptfs/mmap.c
index 07a6c8448100..d841610644ed 100644
--- a/fs/ecryptfs/mmap.c
+++ b/fs/ecryptfs/mmap.c
@@ -34,7 +34,7 @@ static int ecryptfs_writepages(struct address_space *mapping,
 	int error;
 
 	while ((folio = writeback_iter(mapping, wbc, folio, &error))) {
-		error = ecryptfs_encrypt_page(folio);
+		error = ecryptfs_encrypt_folio(folio);
 		if (error) {
 			ecryptfs_printk(KERN_WARNING,
 				"Error encrypting folio (index [0x%.16lx])\n",
@@ -133,7 +133,7 @@ ecryptfs_copy_up_encrypted_with_header(struct folio *folio,
 				((view_extent_num * crypt_stat->extent_size)
 				 - crypt_stat->metadata_size);
 
-			rc = ecryptfs_read_lower_page_segment(
+			rc = ecryptfs_read_lower_folio_segment(
 				folio, (lower_offset >> PAGE_SHIFT),
 				(lower_offset & ~PAGE_MASK),
 				crypt_stat->extent_size, folio->mapping->host);
@@ -168,7 +168,7 @@ static int ecryptfs_read_folio(struct file *file, struct folio *folio)
 	int err = 0;
 
 	if (!crypt_stat || !(crypt_stat->flags & ECRYPTFS_ENCRYPTED)) {
-		err = ecryptfs_read_lower_page_segment(folio, folio->index, 0,
+		err = ecryptfs_read_lower_folio_segment(folio, folio->index, 0,
 				folio_size(folio), inode);
 	} else if (crypt_stat->flags & ECRYPTFS_VIEW_AS_ENCRYPTED) {
 		if (crypt_stat->flags & ECRYPTFS_METADATA_IN_XATTR) {
@@ -184,7 +184,7 @@ static int ecryptfs_read_folio(struct file *file, struct folio *folio)
 			}
 
 		} else {
-			err = ecryptfs_read_lower_page_segment(folio,
+			err = ecryptfs_read_lower_folio_segment(folio,
 					folio->index, 0, folio_size(folio),
 					inode);
 			if (err) {
@@ -194,7 +194,7 @@ static int ecryptfs_read_folio(struct file *file, struct folio *folio)
 			}
 		}
 	} else {
-		err = ecryptfs_decrypt_page(folio);
+		err = ecryptfs_decrypt_folio(folio);
 		if (err) {
 			ecryptfs_printk(KERN_ERR, "Error decrypting page; "
 					"err = [%d]\n", err);
@@ -211,7 +211,7 @@ static int ecryptfs_read_folio(struct file *file, struct folio *folio)
 /*
  * Called with lower inode mutex held.
  */
-static int fill_zeros_to_end_of_page(struct folio *folio, unsigned int to)
+static int fill_zeros_to_end_of_folio(struct folio *folio, unsigned int to)
 {
 	struct inode *inode = folio->mapping->host;
 	int end_byte_in_page;
@@ -261,7 +261,7 @@ static int ecryptfs_write_begin(const struct kiocb *iocb,
 			&ecryptfs_inode_to_private(mapping->host)->crypt_stat;
 
 		if (!(crypt_stat->flags & ECRYPTFS_ENCRYPTED)) {
-			rc = ecryptfs_read_lower_page_segment(
+			rc = ecryptfs_read_lower_folio_segment(
 				folio, index, 0, PAGE_SIZE, mapping->host);
 			if (rc) {
 				printk(KERN_ERR "%s: Error attempting to read "
@@ -287,7 +287,7 @@ static int ecryptfs_write_begin(const struct kiocb *iocb,
 				}
 				folio_mark_uptodate(folio);
 			} else {
-				rc = ecryptfs_read_lower_page_segment(
+				rc = ecryptfs_read_lower_folio_segment(
 					folio, index, 0, PAGE_SIZE,
 					mapping->host);
 				if (rc) {
@@ -305,7 +305,7 @@ static int ecryptfs_write_begin(const struct kiocb *iocb,
 				folio_zero_range(folio, 0, PAGE_SIZE);
 				folio_mark_uptodate(folio);
 			} else if (len < PAGE_SIZE) {
-				rc = ecryptfs_decrypt_page(folio);
+				rc = ecryptfs_decrypt_folio(folio);
 				if (rc) {
 					printk(KERN_ERR "%s: Error decrypting "
 					       "page at index [%ld]; "
@@ -443,10 +443,10 @@ static int ecryptfs_write_end(const struct kiocb *iocb,
 		&ecryptfs_inode_to_private(ecryptfs_inode)->crypt_stat;
 	int rc;
 
-	ecryptfs_printk(KERN_DEBUG, "Calling fill_zeros_to_end_of_page"
+	ecryptfs_printk(KERN_DEBUG, "Calling fill_zeros_to_end_of_folio"
 			"(page w/ index = [0x%.16lx], to = [%d])\n", index, to);
 	if (!(crypt_stat->flags & ECRYPTFS_ENCRYPTED)) {
-		rc = ecryptfs_write_lower_page_segment(ecryptfs_inode,
+		rc = ecryptfs_write_lower_folio_segment(ecryptfs_inode,
 				folio, 0, to);
 		if (!rc) {
 			rc = copied;
@@ -463,13 +463,13 @@ static int ecryptfs_write_end(const struct kiocb *iocb,
 		folio_mark_uptodate(folio);
 	}
 	/* Fills in zeros if 'to' goes beyond inode size */
-	rc = fill_zeros_to_end_of_page(folio, to);
+	rc = fill_zeros_to_end_of_folio(folio, to);
 	if (rc) {
 		ecryptfs_printk(KERN_WARNING, "Error attempting to fill "
 			"zeros in page with index = [0x%.16lx]\n", index);
 		goto out;
 	}
-	rc = ecryptfs_encrypt_page(folio);
+	rc = ecryptfs_encrypt_folio(folio);
 	if (rc) {
 		ecryptfs_printk(KERN_WARNING, "Error encrypting page (upper "
 				"index [0x%.16lx])\n", index);
diff --git a/fs/ecryptfs/read_write.c b/fs/ecryptfs/read_write.c
index b3b451c2b941..611f74061441 100644
--- a/fs/ecryptfs/read_write.c
+++ b/fs/ecryptfs/read_write.c
@@ -39,7 +39,7 @@ int ecryptfs_write_lower(struct inode *ecryptfs_inode, char *data,
 }
 
 /**
- * ecryptfs_write_lower_page_segment
+ * ecryptfs_write_lower_folio_segment
  * @ecryptfs_inode: The eCryptfs inode
  * @folio_for_lower: The folio containing the data to be written to the
  *                  lower file
@@ -54,7 +54,7 @@ int ecryptfs_write_lower(struct inode *ecryptfs_inode, char *data,
  *
  * Returns zero on success; non-zero otherwise
  */
-int ecryptfs_write_lower_page_segment(struct inode *ecryptfs_inode,
+int ecryptfs_write_lower_folio_segment(struct inode *ecryptfs_inode,
 				      struct folio *folio_for_lower,
 				      size_t offset_in_page, size_t size)
 {
@@ -168,9 +168,9 @@ int ecryptfs_write(struct inode *ecryptfs_inode, char *data, loff_t offset,
 		folio_mark_uptodate(ecryptfs_folio);
 		folio_unlock(ecryptfs_folio);
 		if (crypt_stat->flags & ECRYPTFS_ENCRYPTED)
-			rc = ecryptfs_encrypt_page(ecryptfs_folio);
+			rc = ecryptfs_encrypt_folio(ecryptfs_folio);
 		else
-			rc = ecryptfs_write_lower_page_segment(ecryptfs_inode,
+			rc = ecryptfs_write_lower_folio_segment(ecryptfs_inode,
 						ecryptfs_folio,
 						start_offset_in_page,
 						data_offset);
@@ -227,7 +227,7 @@ int ecryptfs_read_lower(char *data, loff_t offset, size_t size,
 }
 
 /**
- * ecryptfs_read_lower_page_segment
+ * ecryptfs_read_lower_folio_segment
  * @folio_for_ecryptfs: The folio into which data for eCryptfs will be
  *                     written
  * @page_index: Page index in @page_for_ecryptfs from which to start
@@ -243,7 +243,7 @@ int ecryptfs_read_lower(char *data, loff_t offset, size_t size,
  *
  * Returns zero on success; non-zero otherwise
  */
-int ecryptfs_read_lower_page_segment(struct folio *folio_for_ecryptfs,
+int ecryptfs_read_lower_folio_segment(struct folio *folio_for_ecryptfs,
 				     pgoff_t page_index,
 				     size_t offset_in_page, size_t size,
 				     struct inode *ecryptfs_inode)

-- 
2.39.5

