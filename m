Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794866910;
	b=tcqw+tyKSP6eBaqKyQOTL6sajjiYCerRHWN7THHQkxtzJNYsLS00kAnU3/sgtmfc/PAc
	 GWIcsAZrD+DUvMoMygT5GU2U42mzGGdIOLsjY9GxGij4rtaPWXlRpMjhxVyEXJKhZhrju
	 1VyKSpB5USMv+5omIl7QbXNNb4qWrceQDuzR0HP5ZroiaXpLPN0h6jl3dV7l+AE/EzoiU
	 lYbTKOR1bEIYS8BKPT5FtSD4oPZLP4yqqKt2Sl/lE9T0rX51Vl61tcKU5ruk5qEVG10Wq
	 qr56N8Fsz1jPU2J0sz6HT4N/Li1wx4GmoPzMODV8s7RtSmtntzilKCHvsQaUGZG7VPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794866910;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fvdZ2wXoPKfuFGzoqROpXRZBlZnCnmXihJIuOJE2Ti0=;
	b=glA3nZGRRYlfs6yBMsIo08w93D8TDxk0I1ZYAnO6R6MWtKE09bMDsd6+hy07rcgiyEfH
	 zM524ADiL+BDIeHj8YXqo/6IYpbPWW6LJPkmLRPUBAujmyKCASldGnlBgQ/Dn7Ia/FGYB
	 lYYayb72xLuFSeWuu+DzTvom1M+v9eoU0MTkr7mJ4Z3WJB0bz5N6r/oVRqponOrCuAusS
	 cVvS8yrbZnmvfeIikSSveico6YAVwNb2VeGFER8e5PHcCYE2P7Uol5HGaa1W0C9xlr6y0
	 RZQ8RIxvMw7BUuprbbt+6WBZV8hwC47xsoumJcMSpeUzqtWkQpXZBqr+gpX0jY204iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=g1uYpVHL;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=rnaBQ8c4;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7119460A260A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:08:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7119460A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=g1uYpVHL;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=rnaBQ8c4
Received: from pps.filterd (m0499198.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGLYmKc237881
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:08:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=fvdZ
	2wXoPKfuFGzoqROpXRZBlZnCnmXihJIuOJE2Ti0=; b=g1uYpVHLXkmPtJxsznmb
	m3sbjsW3kye1M0hAQx6FurwADTFhnoci25vpWmip+qK0CIAW9LEsGjmS4a5U/rGt
	9Ja/PLFTxqhlk/y/bVOF00YEJhjLJ3w1cH5xywFrdX/NgCmVRS5bjD9MXKsiRoTa
	Ul0ZoqShg+7s+OzZL+Mzw7bECYPAwsgJSQWv15LbiTA8hd+0xWKlTRdmvVYNC2CT
	rpNF5MCYOih13SQCWD7BxGb3vHUQ7q7Kny0tw+Mf1V5i5cfq5SusuMUcTr7DjsIr
	Ph1iCGvLeXITbk6PXhB2+Cw7bSjN1xqhBTWbDlh4Ba5S9Sn7O5QYWa76biBW+7uL
	uA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4j059dkbb0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:08:27 -0500 (EST)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f32050e72so1111683585a.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794866907; x=1795471707; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fvdZ2wXoPKfuFGzoqROpXRZBlZnCnmXihJIuOJE2Ti0=;
        b=rnaBQ8c4ipUU/Wbs6bJTGtNp7k7PEU3nUDgSZ7xVhPwTsWIz7RmYMYrZbNqTJFu7tJ
         dsRxvcpBc1Yd6YAwcO6MInM104oto/N0ZJ82JUrb0+De+795aIvUxcETQJW9u2mwJIsD
         sox/pRl3fFfYdo4pUvrqeUT9n31b2q004AESMR3KB9qpFzcRMLK/XP67LPcibbCnBwSi
         t43ufdkJJccJfJEBCbtw/fIw7rtYCgSfCujTp9U54ss8wgGQlmImwC0No6eFd6ppDVeB
         Lv05WRsQ40HJgKtgyDODn+xXZZbMrUyg5rPimGbYc6vEqS3GwL3pXlvGmB7GR9bpqGZv
         nyIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794866907; x=1795471707;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fvdZ2wXoPKfuFGzoqROpXRZBlZnCnmXihJIuOJE2Ti0=;
        b=OIPOnP387oy/ykCZc/16MjM0atPv0Hi5tyx7AGc9vsdI9/GCE9eetQKohMhKbT0JD+
         G0SS+lehGygkf90Kn4U+lP2RiEisoEH3OCCVRJoFs/a1dOOcKTbcnxIzHjqx3CqMg7/K
         gUMjDcXRxCDhlSfl35aHH5IuS5kyGQ5susMMGJqGYLOsN1RupYcW0uI2W34wEapCZNiA
         mnSLXnzvFALBv9Qh5d+AD9M4QP1Y+sdXxwIgs7QKIlcZjHhR6oaFBS1rgcgsBSRyBI7P
         0/Dv+XbZECOtCEPD7gVMSovXQJ0351AQguNVQYa5ps4Cbpb86BRmJLgdhdbQfKl5oxSE
         G+8w==
X-Forwarded-Encrypted: i=1; AL+hErFhHbA/cHhDXcKx/7JsT3clhejlDMY7jJv7IqEKnuJEDA2wZbH1ypqoFcMNiu+iariYOm0jkOLe7bcpGhg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zciAzltU/ASqjV4j65IDEZxZjx2ShgJsogfVA9Y4D85M26+uu
	UC3sAtLoEhGKj5Rtvp8th3EgJOR9iUjz+KAj7vw7Kz3pzr+84LpuxcC87e4mY95YT27mKLPDeIg
	t5VfeVLTPoNmPaBEhPzmHKV7LfppuSP/0EUek19XOlXkb62Stz/NiwGWtBbg9Hw==
X-Gm-Gg: AYBFou114tvwEZdZD2ZwXed0aHe40rNqvXvQp3AvQ7pnS5KSUOKvWgJ7EBChzIgeY8d
	X3oLq2lrAeUlu2uqxm2giCeZELAzwXsTKGxHIwOi64AaTpzBRGwJm5oeP3KZ8aYqvuzUjM/N8e3
	DfaNiMIIWlCsfuCbMieVWcCb9L5NozkuyL6qcXIAWVAqlS7eUVK5qTHYlloS2/wKOF70nQCVi7n
	Nrxhm6/Hs8FG8rDpbDO4X78o+2RWYL/JC/s+ap88jF4EnuUML0r9eIfu+Gn4ZW2bXqahjlqXAoj
	85a3ErDNgp6GAK+yWAkNaydHHqEsIhwfYPQBQVkev9GjsTmZMcjZwpFznRoAkT0VnBmWi8H8cj/
	LGnPcvuIzF55gs2rAIMG962JPITPl1TDB8facHnqfDoP3KD1R0bAJ1NdF2g8n8nANSpd6kb7hTs
	ceiB9urlaSop4qtZcL2s7I
X-Received: by 2002:a05:620a:2a14:b0:93e:d364:c9fe with SMTP id af79cd13be357-9494bbcc105mr1932854985a.40.1794866906538;
        Mon, 16 Nov 2026 14:08:26 -0800 (PST)
X-Received: by 2002:a05:620a:2a14:b0:93e:d364:c9fe with SMTP id af79cd13be357-9494bbcc105mr1932850485a.40.1794866906155;
        Mon, 16 Nov 2026 14:08:26 -0800 (PST)
Received: from [127.0.1.1] (nat-128-59-176-174.net.columbia.edu. [128.59.176.174])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c86c946sm951838885a.25.2026.11.16.14.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:08:25 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 16 Nov 2026 17:08:11 -0500
Subject: [PATCH v3 05/10] ecryptfs: use a folio and a buffer in
 crypt_extent()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-ecryptfs-folio-v3-5-1aba8e620eda@columbia.edu>
References: <20261116-ecryptfs-folio-v3-0-1aba8e620eda@columbia.edu>
In-Reply-To: <20261116-ecryptfs-folio-v3-0-1aba8e620eda@columbia.edu>
To: Tyler Hicks <code@tyhicks.com>, Erez Zadok <ezk@cs.sunysb.edu>,
        Phillip Hellewell <phillip@hellewell.homeip.net>,
        Badari Pulavarty <pbadari@us.ibm.com>, Theodore Ts'o <tytso@mit.edu>,
        Andrew Morton <akpm@linux-foundation.org>
Cc: ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Stephan Mueller <smueller@chronox.de>, Adrian Bunk <bunk@stusta.de>,
        Michael Halcrow <mhalcrow@us.ibm.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794866899; l=6214;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=An8YAI40XTeu7sFYJ7stWLk4oSytgbyqmqAEZJZ4u6A=;
 b=7Ah1h4r4BRmc9DuQpyrYdBIEaGwlai3KMDIgA6XdL/gE5E31HW5pauE11NiiFROalnsKusdyK
 aHwj7d1bBjVAljCO2iWCItcKJaRbvQwDhK7nGXHyQgFvztND/x1ZXrH
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: khfLETA9zyFD8UQGtO_8IoFL0UQCwyRZ
X-Authority-Analysis: v=2.4 cv=Utf2pOwB c=1 sm=1 tr=0 ts=6afb7edb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=KPY1cyGZ6h6m4ASiENTC8Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=BpGzv1V74M3SfeTrGa8v:22
 a=YUWrOzf3Fweq1H2EzuoA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA4NyBTYWx0ZWRfX0b0bl6WGphW1
 Q7EUTsQPVbd++Y5vXxfH1ZsVBXsYSFvk3qpczKSuUgC/MCMntd9x7Y1uugsMVzCIU2qgKsWTTA6
 amkhdz+3F+/teUXWdp+ZniJDax+RCxgqHRyDW2zbsMnRDBPaPuncm93nFhkwXkwtjSioA8DXPGV
 Pklt50pQhqzCAE/J2XcCYV1MsmWtQHzhlLS2jNs+t4KuYmwl5mqh/x00OOKc3nPAIu/F0JmpK3H
 FrO39gRZU+JOW0byzRlT+TXExmSyhLPcshA90n6E5hOFNf79K7Dyo4pblq2yc2AApqF9POqliNM
 MnXVKNLt5s7Cu3c74wYikAcX082ytm4NknqPLNtN/iAYOMwZdM964UiTSLn2b3C3Ej8sDpK846r
 DenZLkax03PGP4/jsrr/aMgtdEpGnUbr0FUKAWVSqiB+VwxdRZBJ9tT0jLcyJtPwCCXQAY2x1tj
 GlHLXPTFVwBGkvRAxUQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA4NyBTYWx0ZWRfX5puzS6l5M8SU
 sW9Z+dMxsihLu/aOHz0AHA0A3Lb0N8ER8HAqoR421j+S/d1Aw/nV7TZwGNOQ1VtqSeGffYBPPwr
 Yaf8lDmroggEVMpNge6xxSgxx49LK85gX4pEuzqlgg7XffMZCLeH
X-Proofpoint-ORIG-GUID: khfLETA9zyFD8UQGtO_8IoFL0UQCwyRZ
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11968
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=10 spamscore=0 adultscore=0
 clxscore=1015 impostorscore=10 suspectscore=0 lowpriorityscore=10
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160087

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

