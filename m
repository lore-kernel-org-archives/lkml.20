Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793356044;
	b=a1JuqiCcccPWckv9Rz8ss20qK79FYpy924KZ/ngZc2pKFUV0szVxchyA5MjGsPCgsElC
	 bJcnZrZD02I+YKzmQ3gRMqkYf+0IaZfCcm5KGhBLsL+mzxaNpZTU2Vxx4LTgBdlozYH40
	 lRUMhnJvtCNcM9AIreKapBD+ULeoKGZjcEgkVdiVs823TDa0MEPLn24SK7yKBWEcmWuXL
	 EqxBJ8qFWpSd4fk1BBzwx1CbnHTx1dKfJfXzpIM+5L5mA7JJ6d7Nps/FBWK5AOZDop+I7
	 45uYlt+ajuPXC11ty8WdcYfi5ClXWiHocVojxDndFxxdqW/IG5dnYbGRBeXva1G9SoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356044;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details:X-Proofpoint-Reinject:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=gOtxaIOIBBHA0Gu5jNl8LLZC0dFnqClkRqFDvoZtBjw=;
	b=lirJVjnSxWiZDb/436wcPcIUbD/9W+xhFq1/y8K4Sgr0IXvxSnuRxHFBflEdeGeQ20lr
	 FOQMPVOGg7EfgqDOElE+NXKp33QcIuFQQxnJeisb6rbZ/CdAfeBg3mn2URw/aTiPD4qHs
	 UWfRlooNlZdN8I48vUEiF+umxw4tMoIGRo/dQFG2xONoYKFVWTlAfXibfisf6yKSJeP3c
	 t3Ku0xVFjIK5ZHQjyoSuaLEEOa6yAephqJd1XXY1YM2lJh31LCaNtd6KTWrZkr0cw0zqX
	 Hgwt6QJRbsM6OXgWQ1P8UtUgIxk1okkumf6LkAusHHcX1ixFIt/5c36HLQIth6A5EHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=TwBckoVW;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=DbO9bbbr;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3005B606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:27:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3005B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=TwBckoVW;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=DbO9bbbr
Received: from pps.filterd (m0167067.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UALLLP916826
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:27:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=gOtx
	aIOIBBHA0Gu5jNl8LLZC0dFnqClkRqFDvoZtBjw=; b=TwBckoVW6ACmiw1dst5I
	hBxX2Cf30TQpTeOv3MPjDyUAUup7EUwx1L1Tk7llHEwYbD5M6nuYW1zbyTiv9qTv
	uVdBzIr71lXMpu+92W4VmwXuGrp6nk+K3J3R1t2grqQj29NSClGwxB6ov55Ow+Uc
	XPE+7sLfP9ZW6Ea7LAyBTPCCMGyEezaSq7qYZ5rE/JXWu9DOxWNywsgRRenWUb2R
	va76GoZWh+mlxPKSH5UcyNDIqfGeuywnMeS2tk8wPxXVZxJjWKiJPPjSDUjDDPVV
	OODE3XoZovnqV13+DqLs0WEPrgVIoNhlL2SHLW5oLfz1JsEMC9AXk40sUvT2aDv5
	nQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hks0ecr33-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:52:05 -0400 (EDT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f26dd2165so499467285a.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793285524; x=1793890324; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gOtxaIOIBBHA0Gu5jNl8LLZC0dFnqClkRqFDvoZtBjw=;
        b=DbO9bbbr6cT5Fv8ZTZ8oZFn9Anb+2bnrlaVGOD4LaOc/99XirPR0z8dpan9G77dXkb
         dpqDpierrS2OEnVwp+Z2mrrCX2hWW/YtrAQWRA2Mj2fV9zjxx+Jrfdofy7TDnpDnN0C8
         UuIzgDSfsJq/kFUnlHLtvg9xR9qD+G5WUu2F0Q6ugQbechOwn1eLMGMYkp1cdW7j6q7r
         o13W1gMQtMCKeYaGexXtYgC244m//mrrITAZLG+38VFIma4HQt/svxCFm71FOLry3+/h
         IMtL4SRNuWCKuz0lQaWDBfx1shErWGNxV2xV1xdoYlcIEzXTIMZqDirCb5qJDjGfZEYW
         w5LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793285524; x=1793890324;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gOtxaIOIBBHA0Gu5jNl8LLZC0dFnqClkRqFDvoZtBjw=;
        b=GhbmJmpMQtv9Y4NuqadS1/gSV6NRwgR6qre2g4UYZPsoxfv+THeYOJR/WRDdOJuAuk
         LLyLyu+S+OVl2vT1ZaN4sfyW4x9wb4/WdjafmiYT71NSQwqv3hOjKTyuBuJrEPyahCd9
         3nUi282FwGu4oXbIo8TgbPJ7DunVWIBjDOu7+sscqMlU3spy6cCvcO3C7sj6TECzl+Cx
         kKwV+fUqQuGuA3fbnt3GLEOB9Bop6aYppkWuhSxTieKLTUSXO2W+2DQSuH7fr5peySfw
         apkiKzTs4lrdiPT9U2TjgLeR69T+yBzRNZxz0SdLqXwI9PiLDE4IIk4I8hx4CrUnoBJi
         HgyQ==
X-Forwarded-Encrypted: i=1; AKwUvBx1yFdq4FeD6AzYmBHuBtu5eEfkgG7EQ3MowB4jdUQrsBs+oXy2i8bahw0si6m3rtt3GOf+ZGNUBPq4yYQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsEomgBze0paXbo0saVWockDmOVr49N0EfabLSkmTIFQVA3nEb
	RAb9DZLVnZkQSovfEFNHp/LvXRp4uIhbkFmlpFDxPvBo7gZdNebtJMAwbDshzBUeoiUu4STFWVM
	Mvv/90QoRtvVOM1dZU9D/o2QG1fK5nyLO4BUhbX25Vu0L0JLf+i47ZnXawYSQoA==
X-Gm-Gg: AYBFou0j9E9KhLwnhWwUOcnKsnfpzH7t+atRnrtvpfynvcoBe83Mwg7WaLIIm7TOswW
	9z4bg13TR5cFgd9exxraEC7eoarKi+fY5RqLp0oHlL/jUh4UKCQl1fCxqsRpyFRSgrRqGhGtWty
	KEdx/QZ4dhpTTwuZa3bi144Dz2JpUDsO/84oalvekDVxPabX7YoyKhQgbTxK50C8EyNzxopHgFW
	rkU74qdpf2pTVV4d2B5P79FxOhnVY0jIkrfztNjEuTiKLA6ZgTVt3h+Y8P4PrVaTFrQKKohZvBW
	pmaiQhExkoMcUFW++PtFjQmrauxnxM8d9DlcEI7niF3HYMa+z+km+tOU8wScHRF1y3A0YraK86Z
	Fj4bECVs8VPx2AlCNfQjsM/2xynphxH2WL8LkUMwPzIzRjYewYkiqwXkQa19LRhr6H9pcl3fbzY
	5fKBRuhuEBMZmVtJM=
X-Received: by 2002:a05:620a:172a:b0:93f:571b:c72c with SMTP id af79cd13be357-94408cda942mr886938185a.46.1793285524210;
        Thu, 29 Oct 2026 07:52:04 -0700 (PDT)
X-Received: by 2002:a05:620a:172a:b0:93f:571b:c72c with SMTP id af79cd13be357-94408cda942mr886932685a.46.1793285523511;
        Thu, 29 Oct 2026 07:52:03 -0700 (PDT)
Received: from [127.0.1.1] (bzq-79-179-7-133.red.bezeqint.net. [79.179.7.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f04723sm78153515e9.5.2026.10.29.07.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:52:02 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Thu, 29 Oct 2026 10:51:30 -0400
Subject: [PATCH v2 9/9] ecryptfs: refer to folios in comments and printk
 strings
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
Message-Id: <20261029-ecryptfs-folio-v2-9-dc53f1d47d9c@columbia.edu>
References: <20261029-ecryptfs-folio-v2-0-dc53f1d47d9c@columbia.edu>
In-Reply-To: <20261029-ecryptfs-folio-v2-0-dc53f1d47d9c@columbia.edu>
To: Tyler Hicks <code@tyhicks.com>
Cc: ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793285500; l=11260;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=sZh+2L3ZsMe8pvmFLT/UHCxsPK5Bjdh+krgQw6X8Mw0=;
 b=97DS8UZmUu/uG4KDI8xWPbyz/fyvUD5ybj6gODRgJHn4dkbTQfOQdK6MeIkUdxbiKQoNKfWYA
 uWRWr98BoHqDxN+enwawtNhIAgkoc4O2HVKrImiMPRaCdU+w/wWQcom
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
X-Proofpoint-GUID: 8HQEx7OUI2zamj7nQM_NZFsj6cf4DYpB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA0MSBTYWx0ZWRfX3XhCMyKsYGzm
 /Brb1j1DkOwjw8opAtX1Ctjat8lQ7sTuncKKqZmMw+aWXSAxKrrKNr5jWxhSJeaebUeGCB/b0iI
 PvADCCFd+S3W+AWHxKNo8lkkncOf98hKq+gEVUFWLOA91PWS/dtMQio0jPWbhXOwjdaTxbFEAYB
 clNWYvKbtZv80zNdFP4gXiiPcDGcGSMGy9GU2gnnVZqoWpbqfIsTAKXY4JFZzzhoiyc6X0lXBew
 94YLpcxLP8wlvksiASwG0NVsMaB5mHFZJ9GCpvugvIq+pRZI5bbdkiHYsrV/eayRmGAudxx7vei
 FjEBSDsSPrm6jhSKkZmtn5T0vQ670NqX1dE4fOa3odcjfnEeW1eC1WfPt25At4XCUrIqPUBUlDW
 Se/bgtcdnvAmEa77MXaOUQCBEMqnR2Fp+Q6RRS6B08T7k5Hl37vbvbZCYHET9QBIx29KYp/SgCI
 4BoYPtxSPxaITA0TfhA==
X-Proofpoint-ORIG-GUID: 54oz2_v5iVh8-jT1JzTVbVhgAANSj-cH
X-Authority-Analysis: v=2.4 cv=BKEmP1QG c=1 sm=1 tr=0 ts=6ae4710b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=LRATYcvZeiQrLRB5MfbBvg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=5seVXgKEpYMQFUWKuG8B:22
 a=UaDNW_uvnF1uU8MiXK0A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA0MSBTYWx0ZWRfX354+ELcnkUpS
 QWsiryB4RFjkMJ7QSayLCxdUeTjAijEL8oQ22XyTIam9kSCrnLUiAltuqhumFiDmnzXcmpS3OcO
 KhCnexQkqQI1Glh/dfPZ15XePZdMagLXSrdGJ33MinlOQQSRIJbl
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11950
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=10 suspectscore=0
 bulkscore=10 adultscore=0 phishscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=2 engine=8.22.0-2610190000
 definitions=main-2610300041

Update the comments and printk strings to refer to folios instead of
pages. While at it, join the strings that were split across lines, use
pr_err() for the printk(KERN_ERR) calls among them, and fix the block
comment style.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/ecryptfs/crypto.c     | 17 ++++++++---------
 fs/ecryptfs/mmap.c       | 36 +++++++++++++++++-------------------
 fs/ecryptfs/read_write.c | 36 ++++++++++++++++++------------------
 3 files changed, 43 insertions(+), 46 deletions(-)

diff --git a/fs/ecryptfs/crypto.c b/fs/ecryptfs/crypto.c
index bbaeb9a38db0..d426dc95517c 100644
--- a/fs/ecryptfs/crypto.c
+++ b/fs/ecryptfs/crypto.c
@@ -214,7 +214,7 @@ static int crypt_scatterlist(struct ecryptfs_crypt_stat *crypt_stat,
 /*
  * lower_offset_for_folio
  *
- * Convert an eCryptfs page index into a lower byte offset
+ * Convert an eCryptfs folio index into a lower byte offset
  */
 static loff_t lower_offset_for_folio(struct ecryptfs_crypt_stat *crypt_stat,
 				    struct folio *folio)
@@ -263,9 +263,8 @@ static int crypt_extent(struct ecryptfs_crypt_stat *crypt_stat,
 	rc = crypt_scatterlist(crypt_stat, dst_sgp, &src_sg, extent_size,
 			       extent_iv, op);
 	if (rc < 0) {
-		printk(KERN_ERR "%s: Error attempting to crypt page with "
-		       "page_index = [%ld], extent_offset = [%ld]; "
-		       "rc = [%d]\n", __func__, page_index, extent_offset, rc);
+		pr_err("%s: Error attempting to crypt folio with page_index = [%ld], extent_offset = [%ld]; rc = [%d]\n",
+		       __func__, page_index, extent_offset, rc);
 		goto out;
 	}
 	rc = 0;
@@ -279,8 +278,8 @@ static int crypt_extent(struct ecryptfs_crypt_stat *crypt_stat,
  *        decrypted content that needs to be encrypted (to a temporary
  *        buffer; not in place) and written out to the lower file
  *
- * Encrypt an eCryptfs page. This is done on a per-extent basis. Note
- * that eCryptfs pages may straddle the lower pages -- for instance,
+ * Encrypt an eCryptfs folio. This is done on a per-extent basis. Note
+ * that eCryptfs folios may straddle the lower pages -- for instance,
  * if the file was created on a machine with an 8K page size
  * (resulting in an 8K header), and then the file is copied onto a
  * host with a 32K page size, then when reading page 0 of the eCryptfs
@@ -341,10 +340,10 @@ int ecryptfs_encrypt_folio(struct folio *folio)
  * ecryptfs_decrypt_folio
  * @folio: Folio mapped from the eCryptfs inode for the file; data read
  *        and decrypted from the lower file will be written into this
- *        page
+ *        folio
  *
- * Decrypt an eCryptfs page. This is done on a per-extent basis. Note
- * that eCryptfs pages may straddle the lower pages -- for instance,
+ * Decrypt an eCryptfs folio. This is done on a per-extent basis. Note
+ * that eCryptfs folios may straddle the lower pages -- for instance,
  * if the file was created on a machine with an 8K page size
  * (resulting in an 8K header), and then the file is copied onto a
  * host with a 32K page size, then when reading page 0 of the eCryptfs
diff --git a/fs/ecryptfs/mmap.c b/fs/ecryptfs/mmap.c
index d841610644ed..305231cd5336 100644
--- a/fs/ecryptfs/mmap.c
+++ b/fs/ecryptfs/mmap.c
@@ -188,16 +188,16 @@ static int ecryptfs_read_folio(struct file *file, struct folio *folio)
 					folio->index, 0, folio_size(folio),
 					inode);
 			if (err) {
-				printk(KERN_ERR "Error reading page; err = "
-				       "[%d]\n", err);
+				pr_err("Error reading folio; err = [%d]\n",
+				       err);
 				goto out;
 			}
 		}
 	} else {
 		err = ecryptfs_decrypt_folio(folio);
 		if (err) {
-			ecryptfs_printk(KERN_ERR, "Error decrypting page; "
-					"err = [%d]\n", err);
+			ecryptfs_printk(KERN_ERR, "Error decrypting folio; err = [%d]\n",
+					err);
 			goto out;
 		}
 	}
@@ -264,8 +264,7 @@ static int ecryptfs_write_begin(const struct kiocb *iocb,
 			rc = ecryptfs_read_lower_folio_segment(
 				folio, index, 0, PAGE_SIZE, mapping->host);
 			if (rc) {
-				printk(KERN_ERR "%s: Error attempting to read "
-				       "lower page segment; rc = [%d]\n",
+				pr_err("%s: Error attempting to read lower folio segment; rc = [%d]\n",
 				       __func__, rc);
 				folio_clear_uptodate(folio);
 				goto out;
@@ -291,8 +290,7 @@ static int ecryptfs_write_begin(const struct kiocb *iocb,
 					folio, index, 0, PAGE_SIZE,
 					mapping->host);
 				if (rc) {
-					printk(KERN_ERR "%s: Error reading "
-					       "page; rc = [%d]\n",
+					pr_err("%s: Error reading folio; rc = [%d]\n",
 					       __func__, rc);
 					folio_clear_uptodate(folio);
 					goto out;
@@ -307,9 +305,7 @@ static int ecryptfs_write_begin(const struct kiocb *iocb,
 			} else if (len < PAGE_SIZE) {
 				rc = ecryptfs_decrypt_folio(folio);
 				if (rc) {
-					printk(KERN_ERR "%s: Error decrypting "
-					       "page at index [%ld]; "
-					       "rc = [%d]\n",
+					pr_err("%s: Error decrypting folio at index [%ld]; rc = [%d]\n",
 					       __func__, folio->index, rc);
 					folio_clear_uptodate(folio);
 					goto out;
@@ -333,8 +329,10 @@ static int ecryptfs_write_begin(const struct kiocb *iocb,
 			}
 		}
 	}
-	/* Writing to a new page, and creating a small hole from start
-	 * of page?  Zero it out. */
+	/*
+	 * Writing to a new folio, and creating a small hole from start
+	 * of folio? Zero it out.
+	 */
 	if ((i_size_read(mapping->host) == prev_page_end_size)
 	    && (pos != 0))
 		folio_zero_range(folio, 0, PAGE_SIZE);
@@ -443,8 +441,8 @@ static int ecryptfs_write_end(const struct kiocb *iocb,
 		&ecryptfs_inode_to_private(ecryptfs_inode)->crypt_stat;
 	int rc;
 
-	ecryptfs_printk(KERN_DEBUG, "Calling fill_zeros_to_end_of_folio"
-			"(page w/ index = [0x%.16lx], to = [%d])\n", index, to);
+	ecryptfs_printk(KERN_DEBUG, "Calling fill_zeros_to_end_of_folio(folio w/ index = [0x%.16lx], to = [%d])\n",
+			index, to);
 	if (!(crypt_stat->flags & ECRYPTFS_ENCRYPTED)) {
 		rc = ecryptfs_write_lower_folio_segment(ecryptfs_inode,
 				folio, 0, to);
@@ -465,14 +463,14 @@ static int ecryptfs_write_end(const struct kiocb *iocb,
 	/* Fills in zeros if 'to' goes beyond inode size */
 	rc = fill_zeros_to_end_of_folio(folio, to);
 	if (rc) {
-		ecryptfs_printk(KERN_WARNING, "Error attempting to fill "
-			"zeros in page with index = [0x%.16lx]\n", index);
+		ecryptfs_printk(KERN_WARNING, "Error attempting to fill zeros in folio with index = [0x%.16lx]\n",
+				index);
 		goto out;
 	}
 	rc = ecryptfs_encrypt_folio(folio);
 	if (rc) {
-		ecryptfs_printk(KERN_WARNING, "Error encrypting page (upper "
-				"index [0x%.16lx])\n", index);
+		ecryptfs_printk(KERN_WARNING, "Error encrypting folio (upper index [0x%.16lx])\n",
+				index);
 		goto out;
 	}
 	if (pos + copied > i_size_read(ecryptfs_inode)) {
diff --git a/fs/ecryptfs/read_write.c b/fs/ecryptfs/read_write.c
index 01a66a932c1e..1a18844618c5 100644
--- a/fs/ecryptfs/read_write.c
+++ b/fs/ecryptfs/read_write.c
@@ -48,8 +48,8 @@ int ecryptfs_write_lower(struct inode *ecryptfs_inode, char *data,
  * @size: The amount of data from @folio_for_lower to write to the
  *        lower file
  *
- * Determines the byte offset in the file for the given page and
- * offset within the page, maps the page, and makes the call to write
+ * Determines the byte offset in the file for the given folio and
+ * offset within the folio, maps the folio, and makes the call to write
  * the contents of @folio_for_lower to the lower inode.
  *
  * Returns zero on success; non-zero otherwise
@@ -80,7 +80,7 @@ int ecryptfs_write_lower_folio_segment(struct inode *ecryptfs_inode,
  * @size: The number of bytes to write from @data
  *
  * Write an arbitrary amount of data to an arbitrary location in the
- * eCryptfs inode page cache. This is done on a page-by-page, and then
+ * eCryptfs inode page cache. This is done on a folio-by-folio, and then
  * by an extent-by-extent, basis; individual extents are encrypted and
  * written to the lower page cache (via VFS writes). This function
  * takes care of all the address translation to locations in the lower
@@ -133,10 +133,8 @@ int ecryptfs_write(struct inode *ecryptfs_inode, char *data, loff_t offset,
 				ecryptfs_page_idx, NULL);
 		if (IS_ERR(ecryptfs_folio)) {
 			rc = PTR_ERR(ecryptfs_folio);
-			printk(KERN_ERR "%s: Error getting page at "
-			       "index [%ld] from eCryptfs inode "
-			       "mapping; rc = [%d]\n", __func__,
-			       ecryptfs_page_idx, rc);
+			pr_err("%s: Error getting folio at index [%ld] from eCryptfs inode mapping; rc = [%d]\n",
+			       __func__, ecryptfs_page_idx, rc);
 			goto out;
 		}
 		folio_lock(ecryptfs_folio);
@@ -146,11 +144,13 @@ int ecryptfs_write(struct inode *ecryptfs_inode, char *data, loff_t offset,
 		 * pos: where we're now writing, offset: where the request was
 		 * If current pos is before request, we are filling zeros
 		 * If we are at or beyond request, we are writing the *data*
-		 * If we're in a fresh page beyond eof, zero it in either case
+		 * If we're in a fresh folio beyond eof, zero it in either case
 		 */
 		if (pos < offset || !start_offset_in_page) {
-			/* We are extending past the previous end of the file.
-			 * Fill in zero values to the end of the page */
+			/*
+			 * We are extending past the previous end of the file.
+			 * Fill in zero values to the end of the folio.
+			 */
 			memset(((char *)ecryptfs_page_virt
 				+ start_offset_in_page), 0,
 				PAGE_SIZE - start_offset_in_page);
@@ -178,8 +178,8 @@ int ecryptfs_write(struct inode *ecryptfs_inode, char *data, loff_t offset,
 		folio_unlock(ecryptfs_folio);
 		folio_put(ecryptfs_folio);
 		if (rc) {
-			printk(KERN_ERR "%s: Error encrypting "
-			       "page; rc = [%d]\n", __func__, rc);
+			pr_err("%s: Error encrypting folio; rc = [%d]\n",
+			       __func__, rc);
 			goto out;
 		}
 		pos += num_bytes;
@@ -232,16 +232,16 @@ int ecryptfs_read_lower(char *data, loff_t offset, size_t size,
  * ecryptfs_read_lower_folio_segment
  * @folio_for_ecryptfs: The folio into which data for eCryptfs will be
  *                     written
- * @page_index: Page index in @page_for_ecryptfs from which to start
+ * @page_index: Page index in @folio_for_ecryptfs from which to start
  *		writing
- * @offset_in_page: Offset in @page_for_ecryptfs from which to start
+ * @offset_in_page: Offset in @folio_for_ecryptfs from which to start
  *                  writing
- * @size: The number of bytes to write into @page_for_ecryptfs
+ * @size: The number of bytes to write into @folio_for_ecryptfs
  * @ecryptfs_inode: The eCryptfs inode
  *
- * Determines the byte offset in the file for the given page and
- * offset within the page, maps the page, and makes the call to read
- * the contents of @page_for_ecryptfs from the lower inode.
+ * Determines the byte offset in the file for the given folio and
+ * offset within the folio, maps the folio, and makes the call to read
+ * the contents of @folio_for_ecryptfs from the lower inode.
  *
  * Returns zero on success; non-zero otherwise
  */

-- 
2.39.5

