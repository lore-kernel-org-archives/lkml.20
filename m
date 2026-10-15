Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB9733F8AD
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028173; cv=none; b=OXIHVCrWzXF26jwsR62FxPbammFNmBTKSyW5TpVAxrPmIv5JqvlRs4OO3egyxT2T2XDPUGeM3nxTGhyzO3i6WCi6xMcglBwANcsK5Fd3gYFACnD+5g6pi0SKNkXWX7o8SQvdQ7vadQGr6fUYClHE7z+lHL6g/kQ7yDShn58Ep7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028173; c=relaxed/simple;
	bh=An8YAI40XTeu7sFYJ7stWLk4oSytgbyqmqAEZJZ4u6A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VGt7VhI78wDPl5W2zw/uyfQqipN2EH6sgiyqiIhBeQWs2kV7TXc0kcdaDVtdEQlCgkZahqV9lo3sMgiIvGc3bJYsAsBiaSI3hhmWZewm6zW6UXF5eov0JHTTvnVgLTFQF1mrnkbzfG96FSzFMhSIa4bbLNEn6xs0UTK3YUtKSi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=tooQikKC; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=4rg0LvGe; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="tooQikKC";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="4rg0LvGe"
Received: from pps.filterd (m0167071.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F0XnDs579576
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 21:36:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=fvdZ
	2wXoPKfuFGzoqROpXRZBlZnCnmXihJIuOJE2Ti0=; b=tooQikKC5d+k3ypVtZlv
	7Ao9xbvTFDAxExLaVkGPYmL4V8RdxhP2P8/irM/fNAmKZKSNuFYzIpeE73Ma8DH8
	rjyCn4rE16dvX3yxWzSsN/qC0IRNzsTYdyvVl/+XmNfJHkuOy2Xattwj0tM7iNnw
	AyisDNBEuZDdeDdJ4hK+wRd1cCqZ7ndutt1DjJT2LsTAThdGYKLw4UCj9Qo1u8Im
	TOL707krS5Emn10qaarGmfAWzjSXvEcyFBfnS0JcxRU6K1KT1JmVRBwgWD1OKiyI
	ybRFMuE0J7OME7W0cWcSKCZpOLHxuct/fhWZwnnSCLhijj7XKsWW1FxUE/iosxQB
	kg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hahdr9dn7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 21:36:09 -0400 (EDT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-535066512b0so131104941cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1792028168; x=1792632968; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fvdZ2wXoPKfuFGzoqROpXRZBlZnCnmXihJIuOJE2Ti0=;
        b=4rg0LvGeQwGVNS2RVzHLmQgrbiD47VIyh5HI0+crR+Efxmi6e3lZx5aKCUGVk4HASy
         6BuHNssFN+H9oP2Z3W/IVxMXJsQh1v5GJivBW7GJlsmVJaTNiQHR54g978ANt52X5bM8
         RgjSeTtzW84fq6PrCTXz+Cw63HY7LGizokAo/q7Wp4Pj8maDTBgoVbjYeFnYr1yN5YDj
         dwhs1/IH0LvP5nvWLWKl5VKB4Cs6CbHrWpywGCNtx/bRX5Dx2/2hsbvwP2I0DdNPV3km
         lUjc9+QlldnCHEdBRtIqSJQhsr1tFC7rivX1LjW6OhIgxLN8oyDT4RoX/W0q5fbmXAFh
         LtaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028168; x=1792632968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fvdZ2wXoPKfuFGzoqROpXRZBlZnCnmXihJIuOJE2Ti0=;
        b=mRgtk9bo2rM7iZ7g9gOSrZS6De0KbhwOiUnrxHrG+GH8l+9gELEDuU9+Y7YamERZln
         8k7CSnxqIhyOhp7xgWT1GsZki22vKw+bRWZr53tNAN8Yu4o9bikZEv2fbWjGd9h8wP2X
         S0tThaVxNO0TAoldWrN1JSmUDTagyYK36zya+7P+wcuioDrgXqyOlupn34d/0Mp23YPV
         v24Lf8RryJ/VvRGP1lHSBd5zjC95mltiJ2aBWMyWD3iAIDeB0M9ZvkzBmQdsaj/PM/D1
         6gG6lyangZBcR0xZ2PXFqD9GtXOxQ5T+ModnHcQjU5STbRN1QpPjhyOmk3sTTrv9YzN3
         zJWQ==
X-Forwarded-Encrypted: i=1; AKwUvByDliIhqxCBL4uNwJZYEtMCIMPehOsX+gZn8hkx/5NriDBl/l+4zohRngKoWf6JbYGiWBqS3STduTe3n98=@vger.kernel.org
X-Gm-Message-State: AFq9FYLsyuwyFd2PFD2G1phX00y4Ah2HMBj3s+0tVw1qruSo/wZdON32
	J2LUm3uSPsIPwxifmhFE3YDzTVdLhFoG60rwVIILPsrnKgn5NJvs+7sBbMn+JRnPqdwP1UXSXQL
	fT39Ld6ewStMayXNoMV1uRzWGxmD0w2rnLdM+WKQtwtFjr7Sp7VqtaqTMCb+r7omCh5Q+ZQ==
X-Gm-Gg: AYBFou0ZtzbMrio0IpHlMGwDOGoLt0Bos2EFws8cARnJmZg2yIr1eIgq0Od9R3C7g07
	xxRvsOpr2i88GAbvFfhFyDJ8PDZZ6ePnMrklArj0X1rFpy+FerE7m2O7h0TtNP6wsho72aGvh9l
	Cz7QSD+1RUEAEop89TvVoqODa8ik59rLgabQGa1qPAvc26yxYjQn+5mqerg2fcZnJPA2v+qIp/g
	IrRxeHB+VdOvzw4gxso4EvQOuwA42RvGuWimk2CxWPeZLLUTHnMwd+IIkuZWf7JP4R+o8H7RoUm
	M4/jYr+zIYzEGJhWqB0psBLwn+QOzaPKTR8uIsKCdUIS+FMQyWPBFaQB+gnPrupNLTSB6GO2Sbt
	XqyNrGxcJKra6WGYAmTtcLRRUi09qe0ZC1XxbqTlSubPX
X-Received: by 2002:a05:622a:6f15:10b0:536:141d:d427 with SMTP id d75a77b69052e-536141ddf79mr11219311cf.73.1792028168573;
        Wed, 14 Oct 2026 18:36:08 -0700 (PDT)
X-Received: by 2002:a05:622a:6f15:10b0:536:141d:d427 with SMTP id d75a77b69052e-536141ddf79mr11219151cf.73.1792028168085;
        Wed, 14 Oct 2026 18:36:08 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5361279a933sm12657661cf.6.2026.10.14.18.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:36:07 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 14 Oct 2026 21:35:46 -0400
Subject: [PATCH 2/7] ecryptfs: use a folio and a buffer in crypt_extent()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-ecryptfs-folio-v1-2-f4412187b1d3@columbia.edu>
References: <20261014-ecryptfs-folio-v1-0-f4412187b1d3@columbia.edu>
In-Reply-To: <20261014-ecryptfs-folio-v1-0-f4412187b1d3@columbia.edu>
To: Tyler Hicks <code@tyhicks.com>
Cc: ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792028164; l=6214;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=An8YAI40XTeu7sFYJ7stWLk4oSytgbyqmqAEZJZ4u6A=;
 b=LYKjOjwmbIz3ivsTr7kWnMva16Dx39m8Xc//LzUCDhWwSP4cgk7ihhqyUXCRIvaJxoP3cny1k
 J/ImKSK/UZ5BGJzZHVfTNhI4y3xihDluTBMkMGCxGyiQPRHu8msu3p8
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAwNiBTYWx0ZWRfX5VwclIH1+VvE
 10lSAn1wCon5c0wfdRnjQvU2KDHkt63Y57DRCzPGIBL+spVisC4VthMjVvNWGAGwwAhs2YgM4Xz
 69ZlKk5PMxFXSKfI3CBgH3YcrOH0uuYgL5KYb5i8JvNviqg4qH/W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAwNiBTYWx0ZWRfX9R71dLDHS2yI
 kiWR8eTBFXXcGhoXmJy/rpPZQ8wRrLCbbLx2zAqviY6k/11VDODHQ7VFJyPH2wPJ4v3ZKIRv1g+
 6RugsY4ssKqgKs6ahzk1G+CH3N939EIlV4drzwxLIy3r/AnJ4lHKwKnDpMxfYmbzmjJ67AkLszB
 BrbaCdvuAt0tS8YCTx+4WHWWyyjyyPHDPtxeq0r8Q/AVR6v0Y7TwOpnRrLuExaztw7W5bjTw+bO
 FsMQ/pyyGgULmgub34x056/9znJelWOGh9Qh4fCiSX/ZndXjtNHlAbB3ChXo7uKw7TFGuq6y3jE
 maYOM5K4+veSzFeYVFfN4AlxfVnvWrnDmILl8OROsoyCzSmShMt9PVX5sCnpJG4NbyJh1F5Q7Af
 d4l7z/EFlK031c+n5/bJfQ0JOMBVv01eoVGOON4ETwCuMrltmhKm6mDRWsV7cZsIWf7S3LMUsz8
 qx7i0E0W09wqgU7tNrw==
X-Proofpoint-ORIG-GUID: AHKtj-WN67PgwkgH9cDcewuLV3DmkCtM
X-Proofpoint-GUID: AHKtj-WN67PgwkgH9cDcewuLV3DmkCtM
X-Authority-Analysis: v=2.4 cv=a7KlZkSF c=1 sm=1 tr=0 ts=6ad02e09 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=79PYxaXUQd1wl-QFWJnA:22
 a=YUWrOzf3Fweq1H2EzuoA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11935
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=10 spamscore=0
 priorityscore=1501 lowpriorityscore=10 adultscore=0 phishscore=0
 impostorscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150006

crypt_extent() currently takes its source and destination as pages, so
ecryptfs_encrypt_page() and ecryptfs_decrypt_page() have to pass
folio_page() of the folio they are given, and the ciphertext buffer in
ecryptfs_encrypt_page() is allocated as a page to match.

The source is a page cache folio, so pass it as one and set up its
scatterlist with sg_set_folio(). The destination is not: it is a
temporary buffer that is only needed to be able to write to the lower
file. There is no reason for it to be a page or folio. Convert it to a
buffer instead, with NULL meaning the operation is done in place on
the folio, which is what ecryptfs_decrypt_page() does.
ecryptfs_encrypt_page() can then kmalloc() it and write it out without
mapping it. Allocate the buffer with GFP_KERNEL. There was no reason to
use GFP_USER as it had previously been doing.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/ecryptfs/crypto.c | 47 ++++++++++++++++++++---------------------------
 1 file changed, 20 insertions(+), 27 deletions(-)

diff --git a/fs/ecryptfs/crypto.c b/fs/ecryptfs/crypto.c
index e67119b6029c..9b8b0c5a81cd 100644
--- a/fs/ecryptfs/crypto.c
+++ b/fs/ecryptfs/crypto.c
@@ -271,8 +271,9 @@ static loff_t lower_offset_for_page(struct ecryptfs_crypt_stat *crypt_stat,
  * crypt_extent
  * @crypt_stat: crypt_stat containing cryptographic context for the
  *              encryption operation
- * @dst_page: The page to write the result into
- * @src_page: The page to read from
+ * @folio: The folio to read from
+ * @dst: The buffer to write the result into, or NULL to crypt the
+ *       folio in place
  * @page_index: The offset in the file (in units of PAGE_SIZE)
  * @extent_offset: Page extent offset for use in generating IV
  * @op: ENCRYPT or DECRYPT to indicate the desired operation
@@ -282,14 +283,12 @@ static loff_t lower_offset_for_page(struct ecryptfs_crypt_stat *crypt_stat,
  * Return zero on success; non-zero otherwise
  */
 static int crypt_extent(struct ecryptfs_crypt_stat *crypt_stat,
-			struct page *dst_page,
-			struct page *src_page,
-			pgoff_t page_index,
+			struct folio *folio, void *dst, pgoff_t page_index,
 			unsigned long extent_offset, int op)
 {
 	loff_t extent_base;
 	char extent_iv[ECRYPTFS_MAX_IV_BYTES];
-	struct scatterlist src_sg, dst_sg;
+	struct scatterlist src_sg, dst_sg, *dst_sgp = &src_sg;
 	size_t extent_size = crypt_stat->extent_size;
 	int rc;
 
@@ -297,14 +296,15 @@ static int crypt_extent(struct ecryptfs_crypt_stat *crypt_stat,
 	ecryptfs_derive_iv(extent_iv, crypt_stat, extent_base + extent_offset);
 
 	sg_init_table(&src_sg, 1);
-	sg_init_table(&dst_sg, 1);
-
-	sg_set_page(&src_sg, src_page, extent_size,
-		    extent_offset * extent_size);
-	sg_set_page(&dst_sg, dst_page, extent_size,
-		    extent_offset * extent_size);
+	sg_set_folio(&src_sg, folio, extent_size,
+		     extent_offset * extent_size);
+	if (dst) {
+		sg_init_one(&dst_sg, dst + extent_offset * extent_size,
+			    extent_size);
+		dst_sgp = &dst_sg;
+	}
 
-	rc = crypt_scatterlist(crypt_stat, &dst_sg, &src_sg, extent_size,
+	rc = crypt_scatterlist(crypt_stat, dst_sgp, &src_sg, extent_size,
 			       extent_iv, op);
 	if (rc < 0) {
 		printk(KERN_ERR "%s: Error attempting to crypt page with "
@@ -321,7 +321,7 @@ static int crypt_extent(struct ecryptfs_crypt_stat *crypt_stat,
  * ecryptfs_encrypt_page
  * @folio: Folio mapped from the eCryptfs inode for the file; contains
  *        decrypted content that needs to be encrypted (to a temporary
- *        page; not in place) and written out to the lower file
+ *        buffer; not in place) and written out to the lower file
  *
  * Encrypt an eCryptfs page. This is done on a per-extent basis. Note
  * that eCryptfs pages may straddle the lower pages -- for instance,
@@ -338,7 +338,6 @@ int ecryptfs_encrypt_page(struct folio *folio)
 	struct inode *ecryptfs_inode;
 	struct ecryptfs_crypt_stat *crypt_stat;
 	char *enc_extent_virt;
-	struct page *enc_extent_page = NULL;
 	loff_t extent_offset;
 	loff_t lower_offset;
 	int rc = 0;
@@ -347,8 +346,8 @@ int ecryptfs_encrypt_page(struct folio *folio)
 	crypt_stat =
 		&(ecryptfs_inode_to_private(ecryptfs_inode)->crypt_stat);
 	BUG_ON(!(crypt_stat->flags & ECRYPTFS_ENCRYPTED));
-	enc_extent_page = alloc_page(GFP_USER);
-	if (!enc_extent_page) {
+	enc_extent_virt = kmalloc(PAGE_SIZE, GFP_KERNEL);
+	if (!enc_extent_virt) {
 		rc = -ENOMEM;
 		ecryptfs_printk(KERN_ERR, "Error allocating memory for "
 				"encrypted extent\n");
@@ -358,9 +357,8 @@ int ecryptfs_encrypt_page(struct folio *folio)
 	for (extent_offset = 0;
 	     extent_offset < (PAGE_SIZE / crypt_stat->extent_size);
 	     extent_offset++) {
-		rc = crypt_extent(crypt_stat, enc_extent_page,
-				folio_page(folio, 0), folio->index,
-				extent_offset, ENCRYPT);
+		rc = crypt_extent(crypt_stat, folio, enc_extent_virt,
+				folio->index, extent_offset, ENCRYPT);
 		if (rc) {
 			printk(KERN_ERR "%s: Error encrypting extent; "
 			       "rc = [%d]\n", __func__, rc);
@@ -369,10 +367,8 @@ int ecryptfs_encrypt_page(struct folio *folio)
 	}
 
 	lower_offset = lower_offset_for_page(crypt_stat, folio);
-	enc_extent_virt = kmap_local_page(enc_extent_page);
 	rc = ecryptfs_write_lower(ecryptfs_inode, enc_extent_virt, lower_offset,
 				  PAGE_SIZE);
-	kunmap_local(enc_extent_virt);
 	if (rc < 0) {
 		ecryptfs_printk(KERN_ERR,
 			"Error attempting to write lower page; rc = [%d]\n",
@@ -381,9 +377,7 @@ int ecryptfs_encrypt_page(struct folio *folio)
 	}
 	rc = 0;
 out:
-	if (enc_extent_page) {
-		__free_page(enc_extent_page);
-	}
+	kfree(enc_extent_virt);
 	return rc;
 }
 
@@ -432,8 +426,7 @@ int ecryptfs_decrypt_page(struct folio *folio)
 	for (extent_offset = 0;
 	     extent_offset < (PAGE_SIZE / crypt_stat->extent_size);
 	     extent_offset++) {
-		struct page *page = folio_page(folio, 0);
-		rc = crypt_extent(crypt_stat, page, page, folio->index,
+		rc = crypt_extent(crypt_stat, folio, NULL, folio->index,
 				extent_offset, DECRYPT);
 		if (rc) {
 			printk(KERN_ERR "%s: Error decrypting extent; "

-- 
2.39.5

