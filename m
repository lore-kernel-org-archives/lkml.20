Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793356058;
	b=HB9/SIHrBlJvzt+qZAZxA4bOzf1AhpbmoivNY02z41TmM6XP1/8d3sLkCP8PDz0w3yAo
	 WEMNgUDMSf9E6+dw7tsRfl3h9DBcTzMof3folN4ZT1iiBa0UktHRgZX47SNHHlfN5WyRP
	 DqNtL2CtbRj5U4abxYbHzJkypc9zMl+AwiMTEtzPgCgY21QpGhJRD82jGWvIenrqCp8fU
	 HRKEPPuXPnrUfqSlK8bpbbe88L9UfW08zu4yKSgyn2HkhCpwGzZxsw6BYahUSnduo5Jfn
	 c0qoqMscMMQrzYeNN5yb0JAZLCEBsu3LBoGtRVQiC49Vg0KJbBnh46mw1qLvickZBOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356058;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details:X-Proofpoint-Reinject:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Wx3j+YxM83y2SZzzxJqWkhg2AJzADfZr/UVku2sjsKM=;
	b=riEfxqZZZRI5FXmNjcsrcoKCHNngXZVSDqIRVvhRIqk2K45cUzmMaS3LHja13eJ0FvD3
	 f6LUCuyYpWDRlA79uxq5Re43EvIW4BO9N4m0Zhi8ESIdlqk59U4fh/vXc+Hn4wf0IuE5m
	 DHj/NiFH14T4Wd1yNw5pOjfIWt2p437OOA4oRnpLl6CzPpA3HQ42e7XOQ5exO+VYWnEaq
	 ZVJXcWvMuvHMSsEkxwSUrVi0EjjwCcZqq9SdnAySXR0TEEb6/faDPf3cinmGdHo3kvcpH
	 Xgpza5EewLP3at6eo9sKJdxf03PUUlYfDcVK6PWMHCkY+9J7rCqilQSxJlKxdKDlFKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=SYNF3C+7;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=Krl7Eyxt;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA564606A325
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:27:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA564606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=SYNF3C+7;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=Krl7Eyxt
Received: from pps.filterd (m0167069.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TMYFCr2987002
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:27:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=Wx3j
	+YxM83y2SZzzxJqWkhg2AJzADfZr/UVku2sjsKM=; b=SYNF3C+7yhS/C4ZHwI/K
	drBgPNSzqsigRM8xjSXi3Fidg3ucaBkwop37ygnT335T5wBpkDVkj4j1kqXEYO6Z
	xsDR1M1mW8vyLrbpUNPfEf575BPkz/D/jjwH7B7I+jJwmziydRf9eW6WRMqEm13q
	xrlFhiybMFo6M3PRKVkcVTlFQaoHUuDQ11UEZ1unFhUQPsX5Mqk05Xe6XTQJqnik
	acQASSzrBdJ9W40elmVRP4LWgUOxWDXOqt6nTTbZ+e8iDwuBVHaKmT19xB37bVtP
	VaSJAIn7dqo97SgkdlNB4qb4J0r3VztGs1aGAgw8kVLoFZblAhFdWJOKivw2UYEk
	IQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hks0ecr2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:52:03 -0400 (EDT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb71b1443so463962385a.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793285522; x=1793890322; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wx3j+YxM83y2SZzzxJqWkhg2AJzADfZr/UVku2sjsKM=;
        b=Krl7EyxtH8KPaes9OBMmTsRymQmRoTLA7v11jlcJF7qS+GUM8WFwhUy6lkJH7RKTlR
         OJ/908HxNjIgDWy8HAZ5FbQlQdTL/LaK/POXoR30JhdJfDrRDq+8fak6/gt1IUhoP/I8
         D0A4nKDt0TTVhGGm1lKg08E0Oz7sKHiuxH+GNKU1plj5P1Cx4Tw3Zl9LMU13Xs+3/Sai
         B377qkiXoQTrYxJw5+7qy4HoiLu9mqEw+XHtuPHpR8qTV3H4Rkya2ztg9Gch1MkdouCz
         wbLjtEOUrG7dyyAoPZfiHA7rX2KTiD7FDK4rdj1SNgyPlpUp1bWdGw89NvMAOb5al39E
         jRMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793285522; x=1793890322;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wx3j+YxM83y2SZzzxJqWkhg2AJzADfZr/UVku2sjsKM=;
        b=fRmAyhmViFcd0zQJcbZWeaorj6Kgi1aeIEZWE4+6ohsaBmwnIqQqMcoacFVqFu2Kkb
         841vK8y0GWCNhrg3qbzojOr4NPkd2/gF+JsXIRB+u7qbzYgtKmIjz+7K7fEMhe8GNwjI
         nuGwZEnYdfkYg69Kb2/5sewdIiBUxNn6klNt8sVty5OJtlfVQtcDGA326PhSQfe4fXVn
         duK3YrAyjoVYUuXzJBG5qJGiy85KuW6xfe+fqlV7dUv+RdWCE6sMNTIZWM1WyIGEnk7a
         idp4DReLjnG/RuxOSJOJ3SJ6z8Dup1JhYI0loaysQCcnRe7AY2bk+rjuwojLdSdml7L+
         cjkQ==
X-Forwarded-Encrypted: i=1; AKwUvBz5d9R7Pg1jgNTz+r2lscViX7lwvLpaPLwWbsj6BqF2hbQ+Ix5H+GKSuPKl495+8M6/6UHWXX+RxvgcT/0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvTZ8Fz2dkx53TWrsIxlvIJ7Iv1YmWAyepv8IavE/LiKij3wVs
	SLra4FywI+nM1XZYjAdiJ4bQo4s/DldgNcAZpWmT3CGWMGzCRxBQD/wtz9TPMSjVyp4lvmn9Qvf
	ZXF7GzPIfgIG02//2EpQsVFTH3TrNpRZa+VBWASsphc7En155TDmwdqtJYN/L9w==
X-Gm-Gg: AYBFou0OyPlyo6MW6KrYsnqdNNZHpXSKo1MR3V/CRSKgdJVr0OxqnIRn2LDCSM2b4aJ
	35FR8i3NcLiPlti3Jrww8TeKX7qYG9Vqt2Ya0FpXPX/za0AvFU1lIVqiypApT6wl8Do7P4ya+DK
	g438iUomOrwxK9J18+RmJIg96BZuWbQGJSgNyMt8FtFoGcFXRZXtK+gJ0fnFLDe6jaIcZEIiiqo
	WUeet5oXV5KuPVoEZgPn3kL25/tDEUVxN3BUwYSCTQdlW3KT9g7SPKe1EGQKHXg/OUxMlP3Bacc
	c8dVzOsniiR+BhWOdOZgNFCaxqEepALIqoc9ILgctGR+MXmizGuBQO5cNEdlOETkTibb4vPE68w
	BENedfNk1qBcDRq6/guESutmIPVCwLm8XAVA61xMrJBViUkmLxiZH/+1EX0p4hdAZXnpSGGTkdU
	JNKxKyps/iaKNVwaQ=
X-Received: by 2002:a05:620a:1a15:b0:93a:2d15:f84 with SMTP id af79cd13be357-94408a8c6b7mr932045885a.33.1793285522331;
        Thu, 29 Oct 2026 07:52:02 -0700 (PDT)
X-Received: by 2002:a05:620a:1a15:b0:93a:2d15:f84 with SMTP id af79cd13be357-94408a8c6b7mr932038985a.33.1793285521606;
        Thu, 29 Oct 2026 07:52:01 -0700 (PDT)
Received: from [127.0.1.1] (bzq-79-179-7-133.red.bezeqint.net. [79.179.7.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f04723sm78153515e9.5.2026.10.29.07.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:52:00 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Thu, 29 Oct 2026 10:51:29 -0400
Subject: [PATCH v2 8/9] ecryptfs: rename functions to refer to folios
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
Message-Id: <20261029-ecryptfs-folio-v2-8-dc53f1d47d9c@columbia.edu>
References: <20261029-ecryptfs-folio-v2-0-dc53f1d47d9c@columbia.edu>
In-Reply-To: <20261029-ecryptfs-folio-v2-0-dc53f1d47d9c@columbia.edu>
To: Tyler Hicks <code@tyhicks.com>
Cc: ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793285500; l=12276;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=xXFbodR5V6E8u4zQwEa/2uLr0P4OrhMHcw5h6QDa8Yo=;
 b=udFQr+Vd9ObRVKXGgk6iwDeTMP5CnN+olIaou/d2X2zVNfUxYnyQaaIZ9SckVn3zoszIimmg1
 ftTtfN+L8XrCnt7KKg+if6WjxS7yHY9aa4dS0J9cOE2mbp1q1KSJ8va
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11949
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=10 suspectscore=0 spamscore=0 lowpriorityscore=10
 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0 impostorscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290058
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 1w6XLdcX8HIqaJ2C70ofokyDA9qOO6-1
X-Proofpoint-ORIG-GUID: 6Xe6trrMxVmvryNY91vsCjh0ndi3XXdf
X-Authority-Analysis: v=2.4 cv=GfuCDgXL c=1 sm=1 tr=0 ts=6ae47118 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=LRATYcvZeiQrLRB5MfbBvg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=JR4YdQiviy7OQf72WyZ1:22
 a=UvMYEBrEvhs-qqGVCq8A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA0MSBTYWx0ZWRfX5eZEbCxLHZh4
 XcD6ugibSinmN8DW1y5lNwOW5eyXwIhO085UITY2cV5nBitap21ih9aSjM/opFRwWwUY4wMkRd8
 uCgPh3rx2ltoTAESVxC5Zjc+nd23gt3F1BT+HZ9yMnIZ8iyvzOgo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA0MSBTYWx0ZWRfX2U4cZMY5Bomp
 L7C1ypiiCA8WnJo+2EGyGAbUq2eOgKfMpbxw6Spl4j8+TY6qjQwBjdiFCJ3CjNfjQE+H067GA0c
 l4LPcwYIMV7TU8FUML8TbI0S3ZsQVVzS5hw13E/VEGuRWJDYfPvjvY8FSRhPuPX6kaNiXhtLY9x
 frc5GazwWcJ1m9bc7F5CmSjtkqi9LQfRUJwvy5uORpUPIwRrM7RWV42ZlZ7JfqjIbGgcKCFZYqO
 HH+DL9jBXGWpa65Fpwpstmf0E3hgIA8Q+T1WVObJgnauYOC5qyHm8Cdv7RBa45Kj+c1AXswMZjC
 dfHzoc9rjIe13lFmKQQOU9ph5zq52eWhTIjOqreDQrD6jwycs9MCxtqkeDx/u7ZOyyp8O9gkUCd
 iFVNK6/mB0FKzLU1KaPll5o3YPJ1aH4caaKSki4tLjbm2xpwuvx396S6Q+pjQIZb4djE4yUYOpJ
 ilpaDnPhbmV5E80vysA==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11950
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=10 lowpriorityscore=10 priorityscore=1501
 malwarescore=0 bulkscore=10 spamscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=2 engine=8.22.0-2610190000
 definitions=main-2610300041

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
index 301744f0f819..2abead07a84c 100644
--- a/fs/ecryptfs/ecryptfs_kernel.h
+++ b/fs/ecryptfs/ecryptfs_kernel.h
@@ -552,8 +552,8 @@ void ecryptfs_destroy_mount_crypt_stat(
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
@@ -636,13 +636,13 @@ int ecryptfs_keyring_auth_tok_for_sig(struct key **auth_tok_key,
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
index 2d6f4f440f65..726241e4d79c 100644
--- a/fs/ecryptfs/inode.c
+++ b/fs/ecryptfs/inode.c
@@ -740,7 +740,7 @@ static int ecryptfs_zero_tail(struct inode *inode, loff_t pos)
 	from = offset_in_folio(folio, pos);
 	folio_lock(folio);
 	folio_zero_range(folio, from, folio_size(folio) - from);
-	rc = ecryptfs_encrypt_page(folio);
+	rc = ecryptfs_encrypt_folio(folio);
 	if (rc)
 		folio_clear_uptodate(folio);
 	folio_unlock(folio);
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
index a31f1e90c40e..01a66a932c1e 100644
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
@@ -167,9 +167,9 @@ int ecryptfs_write(struct inode *ecryptfs_inode, char *data, loff_t offset,
 		flush_dcache_folio(ecryptfs_folio);
 		folio_mark_uptodate(ecryptfs_folio);
 		if (crypt_stat->flags & ECRYPTFS_ENCRYPTED)
-			rc = ecryptfs_encrypt_page(ecryptfs_folio);
+			rc = ecryptfs_encrypt_folio(ecryptfs_folio);
 		else
-			rc = ecryptfs_write_lower_page_segment(ecryptfs_inode,
+			rc = ecryptfs_write_lower_folio_segment(ecryptfs_inode,
 						ecryptfs_folio,
 						start_offset_in_page,
 						data_offset);
@@ -229,7 +229,7 @@ int ecryptfs_read_lower(char *data, loff_t offset, size_t size,
 }
 
 /**
- * ecryptfs_read_lower_page_segment
+ * ecryptfs_read_lower_folio_segment
  * @folio_for_ecryptfs: The folio into which data for eCryptfs will be
  *                     written
  * @page_index: Page index in @page_for_ecryptfs from which to start
@@ -245,7 +245,7 @@ int ecryptfs_read_lower(char *data, loff_t offset, size_t size,
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

