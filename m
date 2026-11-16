Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794866912;
	b=vrXhuDinJGzasJcPQNP6xqHdMp91bnGcQHfjcIlGp2yPvKU1pC428vbdIrhswiAazU0e
	 QrY55Se2Ils4vEz8jnmZ+1w1unZcE3MCr8jm/BgwaoFdxNjE6vQ2oi244YgPpiKfJ3DJx
	 S/EZwavOqecnfw7Z56DiuNyA/nuO6L+nr24OJni1mvtC63kbZXDuWrxkFzFMMlGUHzwAv
	 AJtbWpBuLdp8EDgEKBMzk05Ea6SAvcwE/9PgqtjlSguJh6RE2Z0mpbUts6GGvoqstLzij
	 xJsryZhv9+E99Tz8XP5YUR5XYUOT2WKW+mTt3uFiclfjUdnLNIe/64C5rh2dsqowkXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794866912;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=rxG4ggWN6089uD/UJK7MpQ1pVb6XaNGi4HD+1f1YoOw=;
	b=bqfP09CYhNhLviNXPGuP4Q+Z2v2az3gsiqYgKm8hs3FyZUTOil5P0XklLzWHB+HyvMtG
	 Eo/w+4j//dw/R6Q2AmzP2qsywRNLPaWrjhjB9XKwMwRWFNoK7XJ+IMoongcRLl/ZDTdbz
	 T/uWRu8QDUQT2wFXPr3fEAjJ3xVBdhqFJA9dH85b2NkNGyDa6FUyFmD0AKhRPNIerFAQy
	 hHZfVH8Cgq3/ue3pzUAHF/0jqj2xyK34Ww3FrxgWjKK+xP+fJ7KwYujxWQA5sJqv4O7Ky
	 d+YKXvJgcTbrINBTEeKrXash9nsWBnhPnn+/4lmygaswZ69TkSw629JakuzCtdnfmtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=ZZkm4rSW;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=xrzf7sh5;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9A760A263D
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:08:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A9A760A263D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=ZZkm4rSW;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=xrzf7sh5
Received: from pps.filterd (m0167075.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGLZ5733767282
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:08:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=rxG4
	ggWN6089uD/UJK7MpQ1pVb6XaNGi4HD+1f1YoOw=; b=ZZkm4rSWu1yb7mAyrIUS
	UIh2Okum67IsmXyg3gimdcDS3j4mshs+GSCuqyAju4NHPshuaPoKUUmx1cfUk6h2
	QMTI1tpFXypC+Q328fMpV/6SKam7J4SYpQ+lV0udwXvgxUEfBbzOaDKW/wWU16Ff
	YaCZeTtDPRBgpv5BOXov2ZjmSi3UAa+gESr72asUK2wbbdBadQjV5C6gVcCfsl/z
	6Q7on0WPJ6s04UKMWMS+g3MmYVPYUNnXm/K2wQ7xm5Oc+OXVw2KTKnZX/LFsvd8X
	zaVmC5es6ngZwTfCpNigv45fCXdauBLPcZJwQZ5rOnr++SAhYu+3k45eTe5NoKW8
	zA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4j0598b9ps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:08:31 -0500 (EST)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94960131befso474319085a.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794866910; x=1795471710; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rxG4ggWN6089uD/UJK7MpQ1pVb6XaNGi4HD+1f1YoOw=;
        b=xrzf7sh5lFjNp9q4cw7aBoHiXu3ZAhTaRIrhobRtLtm0ncFxUhZ1EwoYNoqwmDAq8H
         3UdJEKnvTKsh9+vomoTbrmj5e1PIfOyu0SOfiFOfGL/xlPdFDN3v/axCJ8DOPcDhaWNL
         wZcKzVnP0YTTf9KX4W7nXwOhE4Dyo65HJctFPHkwWywBGJkkD0bNmelrH0OVyE5DRrVx
         rb+IDzEN3Nbml4RTnqMgfUZu6ongx1iEOYvel9KSbEyWmUnsp3FlTYuIVn2rWn9OxGSD
         M7kSd0p8UZDD9QK/9LWyNF0zPbrinRroI83aFpDV3B1HUMy60TnCnA+1DNlO74AqRbNX
         7cCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794866910; x=1795471710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rxG4ggWN6089uD/UJK7MpQ1pVb6XaNGi4HD+1f1YoOw=;
        b=HfuOS8ERYC/V2w5JxNOWjyIMtxlc2RYtCj1OvfBd7HVykMeKLod2Pvu1ov1YwfFL3N
         RKLzxQr05VXE/j09fyUDg2fq/y1//sQNX+qBpIb5u+4B0c3Ed5n1ttymCmmQGFhgo8tv
         w3GDUSUc6ymaoAyXgv2PVLvYiDSCR1qQwavDfrA6zNbmR7BgA49Uy8Oiy2+tpfvGFhrz
         daJAHg4UdcEBL0meQgduEDJdN4pyqopOJjB4ZYLMaaXwmdLnAjLIhmn09uWOFbcd+9+p
         Mxs8XVRlCyx19UUBda/MgOX4CJ4Fl5KqwbbHJ1TvDLnpdV6iAj7wU5ur6mWNY1Wo2z/+
         zM+Q==
X-Forwarded-Encrypted: i=1; AL+hErExjZE3XdS2k+DP1qK25HK70E1b1vqo05W0sq39aVK/5H8/sEwBx/lWtgtXkSwQkg4deLJvMvvuLOBbKpg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+L/KTDLaugkMr7IcLXq9rFI7HldPV6/YNRLwekzWaj+gYM74t7
	PkXMVYU1yU/i20dkWlKUzcfrSNQis0cG5CIqOAXgIGO2qGJNci+g1Bx71MVQs3shz9G6irGFeZY
	tizVPtJU7RBFsTlP1ORqaNM4BH70qvHSIYM9aCoxGyH1UL6Y15/Og3AxGSIIZJA==
X-Gm-Gg: AYBFou0RMUapVfSj5Brem/QaZHgSnb3wgr0eyYl0t6sUxvo4/LsN9mIjE5gtj8g6cKw
	tXQPsbJLvixM0MwzggnVBxw8qm1H5OJPUdz+2RhSJxu8qi9ZiiYpe75HpHiDMpENtQCquyhJySL
	z07YeAOwtUkfgVW9Eu5vKLI698tI8Ovffq5jwwpPKZ4zXvooXv1Y08cX4uPtAaGRbYVOF9OCeej
	IKJFcUfmT/7kEIxqaa348WjdBD46K9MVIepUDabRkPwVrEFqcRntytVSA/74huzypwHw6xL2syG
	N6E3Tpe/cFuyqyohSjzDEQRawSS4kBFDgrpdtOtvG/k3RkeEwxs9co0RWu4wCgBr79c2d9uMz32
	c2VWw1Kw9eoRzHF7IQ4F6cqGS5qFtzpPnziEh7b0y87OGboQm/w0rfBcXpFjrQpZZWdb/Ocry3F
	cOzwhgrwK5J0WtSYghQol+
X-Received: by 2002:a05:620a:2788:b0:945:f28f:ce92 with SMTP id af79cd13be357-9494bbf547emr1794102685a.40.1794866910617;
        Mon, 16 Nov 2026 14:08:30 -0800 (PST)
X-Received: by 2002:a05:620a:2788:b0:945:f28f:ce92 with SMTP id af79cd13be357-9494bbf547emr1794099185a.40.1794866910166;
        Mon, 16 Nov 2026 14:08:30 -0800 (PST)
Received: from [127.0.1.1] (nat-128-59-176-174.net.columbia.edu. [128.59.176.174])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c86c946sm951838885a.25.2026.11.16.14.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:08:29 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 16 Nov 2026 17:08:15 -0500
Subject: [PATCH v3 09/10] ecryptfs: rename functions to refer to folios
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
Message-Id: <20261116-ecryptfs-folio-v3-9-1aba8e620eda@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794866899; l=12276;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=GUSPZZZpDb+WYfUnla3AaNXxM4VFpo16ifORSK9V2Gk=;
 b=cm6oFXzc01yoJaDmyVEKBHvrttJalFOfSkIx/ZgIct5rv6XWulTktQ9seyA9aGBaj1Hofmkxp
 /xX3/qPJ1dtCFRAVsB1Q3y+CsWHSTZMJ7w9BC3ZPLu3ybheMelI8A79
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-ORIG-GUID: crTfkianMKNYg2DucO6b-bFvjKnXje-R
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA4OCBTYWx0ZWRfXwpAlvEOZ/a5p
 fsMMr+WSdxZ+uvMlOiBejv2tm+iqgXdkJr0xhlw9MlAm9g1uhdaBeoyaEMpfKeBpwja9kf2Drb5
 gkhVifFsKLZHJ1EDuLODTs07LqE8k5zqasZEcRrgTrM7bIFz52S3
X-Authority-Analysis: v=2.4 cv=aYD0Dhot c=1 sm=1 tr=0 ts=6afb7edf cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=KPY1cyGZ6h6m4ASiENTC8Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=HpS3TJQ9O3Ob1ozEcmik:22
 a=UvMYEBrEvhs-qqGVCq8A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA4OCBTYWx0ZWRfX3maOExUjUGw3
 9HtHNt7dTC4puCYnqgAoE5n2d0GBzRHFFXKwIDTLqNsJL1dzlAfC/HMJO7hIIXQeWb0pPOFuw2G
 ceLTP04BfkT0JGURbyBHIyS8zdrZBu+PBmUR5uvYLcVqtsJ/m7xB3yRHDaBg1TssDKReQQ/sbQS
 jfLFJMFtSVbYdE9BhQHF/x+tiZFtITGeuOWMgR/1QNlWzif1tDsGXf3V78250TYO3mWM0tZX0R+
 MFUHP2u0X4SJ1YCmRCRCLnfyzvLNuWcGQ5qe1hgNnINFYTbCfZrKdLc5hO6irX8PG7QyCI5FYk8
 UvQnAH471ehwvCPkWoB8AP2YhCNm+omT2Er8pXAViUYUS3DlOpf9Z/6xLNRw/QDW17R+Nb1o0Ml
 au2/BbqKIRsxgCnpt0YfRwui5F3BVeMgGoyVR89ibA5IxDEPqh2ElMcHI35Sj5Jz6I3yvT3+BoP
 Xv6CvDb3qcKnMHM+WcQ==
X-Proofpoint-GUID: crTfkianMKNYg2DucO6b-bFvjKnXje-R
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11968
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=10 lowpriorityscore=10 adultscore=0 suspectscore=0
 spamscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160088

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
index ffab685688ab..fdf65b25ced0 100644
--- a/fs/ecryptfs/inode.c
+++ b/fs/ecryptfs/inode.c
@@ -744,7 +744,7 @@ static int ecryptfs_zero_tail(struct inode *inode, loff_t pos)
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
index 0881945da99d..fa876eef85ad 100644
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

