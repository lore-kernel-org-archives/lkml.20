Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793356054;
	b=c/LEBIpG3owipPHNOol2yebqqnWkMad5MHYX5t7pFNMTHjhvA71cFLjkwI8s9yqjN2Yr
	 VlZAL1IPjRQ1eTZ5f7swDeuup5TBcSIE23ZdlOhKFzEmc7XpIjvEHbc4Jv8l87bZ0ZRZ2
	 PAHcZPo/zYJhB9HhxHGmeMvPOcRCaczQA0K+GxMs7ocNJYecUAg4moBf3Cxbhofnr/SYt
	 +t8SUBiuuqGLjMclE4QOz+ucdbHcwEjBul1AFbgKpHZEjwV4XVX6bHHdCKIe3jzFKEKIT
	 DaFrB4EzpGYuk+Wxa3F+oHm3l7WWUBCJhEIx8MtS1iyjEvwtQUZa3brNU0Chmzp0KLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356054;
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
	bh=TLCucmL89h6Y343vyk/BSzJ/L9xsssqYgiwpO26BJsY=;
	b=KO6Ya1Hu2+aVmTX6fOgzNtRnm/Mc/w4LPXgDIpyJ6+LkHNpMnwRZFQ+xM6TACDX15Cl/
	 1jS53GqEFVDnCGTZvFnYDFerZpDjHj2DgHjwAtBGFQIzSDb7mo7RTol6pA7acI1MvvbmF
	 d2zYcMqSv2AJJ1Ewj3F8myOXBWGQ8tZ+FKlQvQK9iIPkoAqyqB5KiN2VhnpM7kluzfFP7
	 XCW/odSL2zx9FVRXD2zM5zjXm+YBbxOa6YqPBU+H211jaspo7duORWKp0088jPbx85dhO
	 V3vb+1EQdfQSIRnUeUxxIGNdl/VC8CGWa+rc3a2owBB7e435DOmLL9DMCNAqg9d/GXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b="ZFQ2i/vq";
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=1WWcpU2A;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8985606A325
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:27:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8985606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=ZFQ2i/vq;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=1WWcpU2A
Received: from pps.filterd (m0167069.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U7O4x23810991
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:27:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=TLCu
	cmL89h6Y343vyk/BSzJ/L9xsssqYgiwpO26BJsY=; b=ZFQ2i/vqJB5DBB8UdZ0O
	TIQnwG1HIe3Cu45vAMoOwTusx5tGNrBGCv7gkjRvS4ifCrHsaza15ruVjRrOYURT
	fDf4oZSZREugswbTsVu9xFXpZtm/rP0ssUcJd3LqdhuNpbENjBsPbm1QR4LoqYcP
	Yr7Uy46ouex5SrLLoy/hr2Dkcc0Ju49tRWwZJSq4wGsZLLuQHJeBAi/HeMT18uB7
	15bnQ76fAF2PPxMP5E/MX65ORkPKaD0N3qAFOBdoXVUq8eAJkUEqscMTg/wngADZ
	iqD+hbF44wtpawd0TL8eDgpdWFXSXKH6eD7cAAgH9t5Eg9q2hCbiNaLTVGQdE7ew
	cg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hm7tt0a16-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:51:59 -0400 (EDT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5337f26ee19so34706091cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793285518; x=1793890318; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TLCucmL89h6Y343vyk/BSzJ/L9xsssqYgiwpO26BJsY=;
        b=1WWcpU2ArLEIn7Nu02R0pPDD12/wvqmgK8w9+91+nA4auq664YC8JQaGy0fDor1CMS
         G+ULhLGouHiBI7FcSXsNp07dbdGsYAiUyX8SRg3OVf5vTs+/zUPc+0Y1mhr+GMWKHh+m
         JgNljajHdGS6SXhEpXLtRJfNgj8Bsxghe81ZDEXPyXpbnkEnu8ss6oeOrBEKDZuAimGG
         pPE10sQEhwl6xqdPT1ENFv42D/8yWBRa2Ec9OA5XlBVVh8dJWdQHqdUNCVfsE5gKfUGU
         CqZRQEMKZP86rbJOK0ejI8u6pyyQ1C/19ZCCnWex/Nne+cNdmrrlamFHHulAkfCjRvVM
         KDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793285518; x=1793890318;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TLCucmL89h6Y343vyk/BSzJ/L9xsssqYgiwpO26BJsY=;
        b=VDvHvR5+bDKVVrTJteptPYxYIjWcUG+mWYMQb3q9s/iAaD+CKBAg6xjJW+8ABCtJ8d
         waX914B/XCOzxgEr7Hfll37Cx5MQYm14A6b2Afu2qKjpkswLmmUErbFHOOipouY0gGsd
         n+FNODi3AXAyeuiNa3bCS0dy5dvY7hWGvBXi6SKm4v7RGZ+fl5hKvPJX0ajM0lcKuyFf
         Fz47lHvdNTRZxy6PafX4ekSJTme1BoJL57S3M2/Cxw68fZME3e8xxvSlz56Ou+Xw0Wr2
         7erpUSsA/V1rXXfIptZJbVVPq4JHWqgo6mCwL4F5Emc1XOeCNy9IJQGCwKM7mIVhlcZ8
         ItSw==
X-Forwarded-Encrypted: i=1; AKwUvBzDejoIuzx9PgMnqDs8AGxOS1ReJU9wKoW2xOeR8Jg9hlxXXxjhU5BouXfZycenHaMoJrD6ZhWSGv8gIh8=@vger.kernel.org
X-Gm-Message-State: AFq9FYInlopettdQfHKoT1H2G5G+laHypuAJeEs09+tskuumVH+8Qvta
	BHKWGVRvH1lDRjSIGw2kSEoJ9Lcd4/Qs1FsFx2mQ7kdaITKp7PDjhZozC3qhtzV/ayEWtSZI9Z/
	/qeNYBY4gX7HuZbdiFBMDrOw0zxvumk9kv8sO/l5cEO7RB15wswhLITK4xKF/Fw==
X-Gm-Gg: AYBFou3OJPQoL3LWk9aK5DrHVEw/2JRvGlvg8rq/egeoLEaXuYWdau2EDTW6XOK+GLB
	23K29nDrlRMgaMPsx24w7JYYwmrxs4k8w/WflwsO+rZDj4S8ICuwJsl8Xq572A9MZPJA7uolghC
	pD0MkAGKP3+B4oil3G8FhLeyVW2vO35rA/E6U8aum0EfP6iRBwPDdjk2h/VmMCzIuMCMOksSv3o
	hWn+GKy7G+gpwHoBeAbPJbwezt4fFSTWMqSbfDymY6gAioygHKgbS6YNm/WgcxZXKosmAh8Juoo
	6lIAHJKffNF+qPKkoRN6uDp8aM0i/EcPQyKQgllg6XPTYVm6z+MLsyH4RO1tE2FCxg1+LRrAQfO
	TEVmo9d+LJu60olmovjMdNiYIe0N9hXmeR9GdveJ2F5BK0YvYIMR6meWGwpfD/qx+egtU528TAV
	j2l9dJdPtN2un8cTY=
X-Received: by 2002:a05:620a:3193:b0:93f:2463:f784 with SMTP id af79cd13be357-94408de768fmr877074385a.66.1793285518327;
        Thu, 29 Oct 2026 07:51:58 -0700 (PDT)
X-Received: by 2002:a05:620a:3193:b0:93f:2463:f784 with SMTP id af79cd13be357-94408de768fmr877071085a.66.1793285517762;
        Thu, 29 Oct 2026 07:51:57 -0700 (PDT)
Received: from [127.0.1.1] (bzq-79-179-7-133.red.bezeqint.net. [79.179.7.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f04723sm78153515e9.5.2026.10.29.07.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:51:56 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Thu, 29 Oct 2026 10:51:27 -0400
Subject: [PATCH v2 6/9] ecryptfs: use sg_init_one() instead of
 virt_to_scatterlist()
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
Message-Id: <20261029-ecryptfs-folio-v2-6-dc53f1d47d9c@columbia.edu>
References: <20261029-ecryptfs-folio-v2-0-dc53f1d47d9c@columbia.edu>
In-Reply-To: <20261029-ecryptfs-folio-v2-0-dc53f1d47d9c@columbia.edu>
To: Tyler Hicks <code@tyhicks.com>
Cc: ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793285500; l=11895;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=VlDnCX3i7mGZvNYBW4J8FKMLFtRDtsIQljRKRABgp+k=;
 b=Y+yVHxA8DO1e5hZPA0G9YqUs9z29AEcax9swsaDeqTKeQY7V9FMssiYNT5hxljZR1ELS6pHMQ
 KjCkdAEDLkZBysn/8rKW2Zl2FdTZ9LC3I24JF0ZDwavo1YQKmvmAcsO
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11949
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 lowpriorityscore=10 malwarescore=0
 priorityscore=1501 bulkscore=10 impostorscore=10 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290058
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 3GKGkJC7X6oSS5X-7YzXspcWdcaFobUf
X-Proofpoint-ORIG-GUID: -hqneVNuzMg-Tf_jjLx5gXPFNJeBSrAV
X-Authority-Analysis: v=2.4 cv=GfuCDgXL c=1 sm=1 tr=0 ts=6ae47114 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=LRATYcvZeiQrLRB5MfbBvg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=JR4YdQiviy7OQf72WyZ1:22
 a=rhbNDiOmHe9WM6CdvIYA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA0MSBTYWx0ZWRfXwlhVtVc9aAz2
 yPad7xgY3kIlIOMjxNPYMHqOhwzSRuHCESSC4jBKQzl1dJZJZ4dqOirrVbU+lXCvy+S6iuX9LIM
 e4O3t2pn54fXJ/DC/7zl4RYOzXnoxplXceT/Vnd8jentD6inYNea
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA0MSBTYWx0ZWRfX1u3KnAjz4PLh
 ybtm1xCbqDDjagKFRtqGmJgMO3b97atyFnoZyX8d9YeVsXJ8+zePIGbM0BYO3QxjESIsYcfY/o4
 /8QC+I8uds3z66+tqKl/5nG+e4TDMj+SMs7EkekNfhtWzVjVRzwJKg8lp2sNPFwToYbqiCRYukn
 oL9Jp9PssL15bzjNJUHCGGGLLbZayOA9vDKL+ql4DOWVHh5eRkrP/HfOekJs7UkJaZG+9eaOJ1F
 4wml7W7nSP7exmcTaxr1YCHCmjjh69FvIHR/4Rh7aODpe0Cvs3B6laqsIm1rjoAM7SEP74daCnn
 VUINji8ElsEihBsMo3HYWcRlkfWM3jwhjUTlmeRD+3okEdOy1bsXECKAHDBsN0+V/1abwA9fc4v
 5JmFoJRpOW6ope1n1p3LTBMoowU5+yTgTD7R5FFe6HTqGwukgHAJQi+A7PptMOVH9yW5TMLHJkl
 hNpssvi0/8B45FPXOwQ==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11950
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=10 lowpriorityscore=10 priorityscore=1501
 malwarescore=0 bulkscore=10 spamscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=2 engine=8.22.0-2610190000
 definitions=main-2610300041

Every caller passes a kmalloc()-ed buffer or an array inside a kmalloc()-ed
structure, which is physically contiguous and so fits in one
scatterlist entry. Use sg_init_one(), which can't fail, drop the
two-entry arrays and their length checks, and remove
virt_to_scatterlist() and the unused ECRYPTFS_MAX_SCATTERLIST_LEN.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/ecryptfs/crypto.c          |  46 -----------------
 fs/ecryptfs/ecryptfs_kernel.h |   2 -
 fs/ecryptfs/keystore.c        | 114 +++++++++---------------------------------
 3 files changed, 25 insertions(+), 137 deletions(-)

diff --git a/fs/ecryptfs/crypto.c b/fs/ecryptfs/crypto.c
index 6a014872e919..f0e67b48917f 100644
--- a/fs/ecryptfs/crypto.c
+++ b/fs/ecryptfs/crypto.c
@@ -149,50 +149,6 @@ void ecryptfs_destroy_mount_crypt_stat(
 	memset(mount_crypt_stat, 0, sizeof(struct ecryptfs_mount_crypt_stat));
 }
 
-/**
- * virt_to_scatterlist
- * @addr: Virtual address
- * @size: Size of data; should be an even multiple of the block size
- * @sg: Pointer to scatterlist array; set to NULL to obtain only
- *      the number of scatterlist structs required in array
- * @sg_size: Max array size
- *
- * Fills in a scatterlist array with page references for a passed
- * virtual address.
- *
- * Returns the number of scatterlist structs in array used
- */
-int virt_to_scatterlist(const void *addr, int size, struct scatterlist *sg,
-			int sg_size)
-{
-	int i = 0;
-	struct page *pg;
-	int offset;
-	int remainder_of_page;
-
-	sg_init_table(sg, sg_size);
-
-	while (size > 0 && i < sg_size) {
-		pg = virt_to_page(addr);
-		offset = offset_in_page(addr);
-		sg_set_page(&sg[i], pg, 0, offset);
-		remainder_of_page = PAGE_SIZE - offset;
-		if (size >= remainder_of_page) {
-			sg[i].length = remainder_of_page;
-			addr += remainder_of_page;
-			size -= remainder_of_page;
-		} else {
-			sg[i].length = size;
-			addr += size;
-			size = 0;
-		}
-		i++;
-	}
-	if (size > 0)
-		return -ENOMEM;
-	return i;
-}
-
 /**
  * crypt_scatterlist
  * @crypt_stat: Pointer to the crypt_stat struct to initialize.
@@ -438,8 +394,6 @@ int ecryptfs_decrypt_page(struct folio *folio)
 	return rc;
 }
 
-#define ECRYPTFS_MAX_SCATTERLIST_LEN 4
-
 /**
  * ecryptfs_init_crypt_ctx
  * @crypt_stat: Uninitialized crypt stats structure
diff --git a/fs/ecryptfs/ecryptfs_kernel.h b/fs/ecryptfs/ecryptfs_kernel.h
index d828040ade89..301744f0f819 100644
--- a/fs/ecryptfs/ecryptfs_kernel.h
+++ b/fs/ecryptfs/ecryptfs_kernel.h
@@ -544,8 +544,6 @@ int ecryptfs_encrypt_and_encode_filename(
 	struct ecryptfs_mount_crypt_stat *mount_crypt_stat,
 	const char *name, size_t name_size);
 void ecryptfs_dump_hex(char *data, int bytes);
-int virt_to_scatterlist(const void *addr, int size, struct scatterlist *sg,
-			int sg_size);
 int ecryptfs_compute_root_iv(struct ecryptfs_crypt_stat *crypt_stat);
 void ecryptfs_rotate_iv(unsigned char *iv);
 void ecryptfs_init_crypt_stat(struct ecryptfs_crypt_stat *crypt_stat);
diff --git a/fs/ecryptfs/keystore.c b/fs/ecryptfs/keystore.c
index a0989e3c8aef..b147ddb0055d 100644
--- a/fs/ecryptfs/keystore.c
+++ b/fs/ecryptfs/keystore.c
@@ -602,8 +602,8 @@ struct ecryptfs_write_tag_70_packet_silly_stack {
 	struct mutex *tfm_mutex;
 	char *block_aligned_filename;
 	struct ecryptfs_auth_tok *auth_tok;
-	struct scatterlist src_sg[2];
-	struct scatterlist dst_sg[2];
+	struct scatterlist src_sg;
+	struct scatterlist dst_sg;
 	struct crypto_skcipher *skcipher_tfm;
 	struct skcipher_request *skcipher_req;
 	char iv[ECRYPTFS_MAX_IV_BYTES];
@@ -758,24 +758,9 @@ ecryptfs_write_tag_70_packet(char *dest, size_t *remaining_bytes,
 	}
 	memcpy(&s->block_aligned_filename[s->num_rand_bytes], filename,
 	       filename_size);
-	rc = virt_to_scatterlist(s->block_aligned_filename,
-				 s->block_aligned_filename_size, s->src_sg, 2);
-	if (rc < 1) {
-		printk(KERN_ERR "%s: Internal error whilst attempting to "
-		       "convert filename memory to scatterlist; rc = [%d]. "
-		       "block_aligned_filename_size = [%zd]\n", __func__, rc,
-		       s->block_aligned_filename_size);
-		goto out_free_unlock;
-	}
-	rc = virt_to_scatterlist(&dest[s->i], s->block_aligned_filename_size,
-				 s->dst_sg, 2);
-	if (rc < 1) {
-		printk(KERN_ERR "%s: Internal error whilst attempting to "
-		       "convert encrypted filename memory to scatterlist; "
-		       "rc = [%d]. block_aligned_filename_size = [%zd]\n",
-		       __func__, rc, s->block_aligned_filename_size);
-		goto out_free_unlock;
-	}
+	sg_init_one(&s->src_sg, s->block_aligned_filename,
+		    s->block_aligned_filename_size);
+	sg_init_one(&s->dst_sg, &dest[s->i], s->block_aligned_filename_size);
 	/* The characters in the first block effectively do the job
 	 * of the IV here, so we just use 0's for the IV. Note the
 	 * constraint that ECRYPTFS_FILENAME_MIN_RANDOM_PREPEND_BYTES
@@ -794,7 +779,7 @@ ecryptfs_write_tag_70_packet(char *dest, size_t *remaining_bytes,
 		       mount_crypt_stat->global_default_fn_cipher_key_bytes);
 		goto out_free_unlock;
 	}
-	skcipher_request_set_crypt(s->skcipher_req, s->src_sg, s->dst_sg,
+	skcipher_request_set_crypt(s->skcipher_req, &s->src_sg, &s->dst_sg,
 				   s->block_aligned_filename_size, s->iv);
 	rc = crypto_skcipher_encrypt(s->skcipher_req);
 	if (rc) {
@@ -830,8 +815,8 @@ struct ecryptfs_parse_tag_70_packet_silly_stack {
 	struct mutex *tfm_mutex;
 	char *decrypted_filename;
 	struct ecryptfs_auth_tok *auth_tok;
-	struct scatterlist src_sg[2];
-	struct scatterlist dst_sg[2];
+	struct scatterlist src_sg;
+	struct scatterlist dst_sg;
 	struct crypto_skcipher *skcipher_tfm;
 	struct skcipher_request *skcipher_req;
 	char fnek_sig_hex[ECRYPTFS_SIG_SIZE_HEX + 1];
@@ -950,15 +935,8 @@ ecryptfs_parse_tag_70_packet(char **filename, size_t *filename_size,
 		goto out;
 	}
 	mutex_lock(s->tfm_mutex);
-	rc = virt_to_scatterlist(&data[(*packet_size)],
-				 s->block_aligned_filename_size, s->src_sg, 2);
-	if (rc < 1) {
-		printk(KERN_ERR "%s: Internal error whilst attempting to "
-		       "convert encrypted filename memory to scatterlist; "
-		       "rc = [%d]. block_aligned_filename_size = [%zd]\n",
-		       __func__, rc, s->block_aligned_filename_size);
-		goto out_unlock;
-	}
+	sg_init_one(&s->src_sg, &data[(*packet_size)],
+		    s->block_aligned_filename_size);
 	(*packet_size) += s->block_aligned_filename_size;
 	s->decrypted_filename = kmalloc(s->block_aligned_filename_size,
 					GFP_KERNEL);
@@ -966,15 +944,8 @@ ecryptfs_parse_tag_70_packet(char **filename, size_t *filename_size,
 		rc = -ENOMEM;
 		goto out_unlock;
 	}
-	rc = virt_to_scatterlist(s->decrypted_filename,
-				 s->block_aligned_filename_size, s->dst_sg, 2);
-	if (rc < 1) {
-		printk(KERN_ERR "%s: Internal error whilst attempting to "
-		       "convert decrypted filename memory to scatterlist; "
-		       "rc = [%d]. block_aligned_filename_size = [%zd]\n",
-		       __func__, rc, s->block_aligned_filename_size);
-		goto out_free_unlock;
-	}
+	sg_init_one(&s->dst_sg, s->decrypted_filename,
+		    s->block_aligned_filename_size);
 
 	s->skcipher_req = skcipher_request_alloc(s->skcipher_tfm, GFP_KERNEL);
 	if (!s->skcipher_req) {
@@ -1014,7 +985,7 @@ ecryptfs_parse_tag_70_packet(char **filename, size_t *filename_size,
 		       mount_crypt_stat->global_default_fn_cipher_key_bytes);
 		goto out_free_unlock;
 	}
-	skcipher_request_set_crypt(s->skcipher_req, s->src_sg, s->dst_sg,
+	skcipher_request_set_crypt(s->skcipher_req, &s->src_sg, &s->dst_sg,
 				   s->block_aligned_filename_size, s->iv);
 	rc = crypto_skcipher_decrypt(s->skcipher_req);
 	if (rc) {
@@ -1632,8 +1603,8 @@ static int
 decrypt_passphrase_encrypted_session_key(struct ecryptfs_auth_tok *auth_tok,
 					 struct ecryptfs_crypt_stat *crypt_stat)
 {
-	struct scatterlist dst_sg[2];
-	struct scatterlist src_sg[2];
+	struct scatterlist dst_sg;
+	struct scatterlist src_sg;
 	struct mutex *tfm_mutex;
 	struct crypto_skcipher *tfm;
 	struct skcipher_request *req = NULL;
@@ -1655,28 +1626,12 @@ decrypt_passphrase_encrypted_session_key(struct ecryptfs_auth_tok *auth_tok,
 		       crypt_stat->cipher, rc);
 		goto out;
 	}
-	rc = virt_to_scatterlist(auth_tok->session_key.encrypted_key,
-				 auth_tok->session_key.encrypted_key_size,
-				 src_sg, 2);
-	if (rc < 1 || rc > 2) {
-		printk(KERN_ERR "Internal error whilst attempting to convert "
-			"auth_tok->session_key.encrypted_key to scatterlist; "
-			"expected rc = 1; got rc = [%d]. "
-		       "auth_tok->session_key.encrypted_key_size = [%d]\n", rc,
-			auth_tok->session_key.encrypted_key_size);
-		goto out;
-	}
+	sg_init_one(&src_sg, auth_tok->session_key.encrypted_key,
+		    auth_tok->session_key.encrypted_key_size);
 	auth_tok->session_key.decrypted_key_size =
 		auth_tok->session_key.encrypted_key_size;
-	rc = virt_to_scatterlist(auth_tok->session_key.decrypted_key,
-				 auth_tok->session_key.decrypted_key_size,
-				 dst_sg, 2);
-	if (rc < 1 || rc > 2) {
-		printk(KERN_ERR "Internal error whilst attempting to convert "
-			"auth_tok->session_key.decrypted_key to scatterlist; "
-			"expected rc = 1; got rc = [%d]\n", rc);
-		goto out;
-	}
+	sg_init_one(&dst_sg, auth_tok->session_key.decrypted_key,
+		    auth_tok->session_key.decrypted_key_size);
 	mutex_lock(tfm_mutex);
 	req = skcipher_request_alloc(tfm, GFP_KERNEL);
 	if (!req) {
@@ -1699,7 +1654,7 @@ decrypt_passphrase_encrypted_session_key(struct ecryptfs_auth_tok *auth_tok,
 		rc = -EINVAL;
 		goto out;
 	}
-	skcipher_request_set_crypt(req, src_sg, dst_sg,
+	skcipher_request_set_crypt(req, &src_sg, &dst_sg,
 				   auth_tok->session_key.encrypted_key_size,
 				   NULL);
 	rc = crypto_skcipher_decrypt(req);
@@ -2173,8 +2128,8 @@ write_tag_3_packet(char *dest, size_t *remaining_bytes,
 	size_t i;
 	size_t encrypted_session_key_valid = 0;
 	char session_key_encryption_key[ECRYPTFS_MAX_KEY_BYTES];
-	struct scatterlist dst_sg[2];
-	struct scatterlist src_sg[2];
+	struct scatterlist dst_sg;
+	struct scatterlist src_sg;
 	struct mutex *tfm_mutex = NULL;
 	u8 cipher_code;
 	size_t packet_size_length;
@@ -2249,27 +2204,8 @@ write_tag_3_packet(char *dest, size_t *remaining_bytes,
 		ecryptfs_printk(KERN_DEBUG, "Session key encryption key:\n");
 		ecryptfs_dump_hex(session_key_encryption_key, 16);
 	}
-	rc = virt_to_scatterlist(crypt_stat->key, key_rec->enc_key_size,
-				 src_sg, 2);
-	if (rc < 1 || rc > 2) {
-		ecryptfs_printk(KERN_ERR, "Error generating scatterlist "
-				"for crypt_stat session key; expected rc = 1; "
-				"got rc = [%d]. key_rec->enc_key_size = [%zd]\n",
-				rc, key_rec->enc_key_size);
-		rc = -ENOMEM;
-		goto out;
-	}
-	rc = virt_to_scatterlist(key_rec->enc_key, key_rec->enc_key_size,
-				 dst_sg, 2);
-	if (rc < 1 || rc > 2) {
-		ecryptfs_printk(KERN_ERR, "Error generating scatterlist "
-				"for crypt_stat encrypted session key; "
-				"expected rc = 1; got rc = [%d]. "
-				"key_rec->enc_key_size = [%zd]\n", rc,
-				key_rec->enc_key_size);
-		rc = -ENOMEM;
-		goto out;
-	}
+	sg_init_one(&src_sg, crypt_stat->key, key_rec->enc_key_size);
+	sg_init_one(&dst_sg, key_rec->enc_key, key_rec->enc_key_size);
 	mutex_lock(tfm_mutex);
 	rc = crypto_skcipher_setkey(tfm, session_key_encryption_key,
 				    crypt_stat->key_size);
@@ -2296,7 +2232,7 @@ write_tag_3_packet(char *dest, size_t *remaining_bytes,
 	rc = 0;
 	ecryptfs_printk(KERN_DEBUG, "Encrypting [%zd] bytes of the key\n",
 			crypt_stat->key_size);
-	skcipher_request_set_crypt(req, src_sg, dst_sg,
+	skcipher_request_set_crypt(req, &src_sg, &dst_sg,
 				   (*key_rec).enc_key_size, NULL);
 	rc = crypto_skcipher_encrypt(req);
 	mutex_unlock(tfm_mutex);

-- 
2.39.5

