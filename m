Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61E151123F
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 23:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790293360; cv=none; b=Gd7/OKhAgn2ooto4dsgXjGo7Z5SyNsu8Yi3a9WycaSuxkCy1Y/0tyd+YVsogISSdhQiIlkdJJa8BZ6Za64coCn0Fj8qfAUzkH27VQL7bZ5EjZI3pmPp3m1o4xN4FGW/xGMz86JD0mfwb5b/09C2LfE7HeMn1IFIR8hDocbxqqdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790293360; c=relaxed/simple;
	bh=M0z1JCY0hKQ30hf6qGaQ8ZaEutPJR8AyX0o0aOQxvKA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mM4JueqgkjDcgVcBMZ2Z88SuBscDNia4NNMWp1/mAYLGfSrAB9myPPbbIlIOCVtyHUtXYJqZzWzbS3m9ETzJDfERVUY0OZVu/BuQthfXiZte5uOdKWCTZUs5fd75A+OoU5yMsynP76SQyCBDMnOUaWCptZIymb2WFhivVSx3W+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=Z8Jql7OG; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=2v4JtuK4; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="Z8Jql7OG";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="2v4JtuK4"
Received: from pps.filterd (m0499199.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OMXn4q1045176
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 19:42:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=6TCa
	n+7XKf8kThtM9GoM7KKJ/B7qFfiyA5H9QrhRig0=; b=Z8Jql7OGw5OdFVySuXDt
	/AQ7UFOHDb71KWY5fsT9Ci6pbClozlBU+Fw9sWIN1rAqP9TuUIMzRtVbSiYYrHnn
	DtVkVW7rzFSyJMPeC7/SwmNK0QHOacQ8kkMWUUMcVGZOAYLzciLdqe7qppGkoLgu
	laERsOc4Zam4Y137bhAkDZnAL+xSoZYl/eMpouCpBADcl8dzyO2ysIqOjDcbCST9
	YmijqkHxVk1YmyNXfmAjUP4roMsWVjCKZKx7RKIxEZtPSmnun0m8UcDKxa+XXw62
	TezBa8qW+pAA82pCVmiEXTkd/YU54r6w+IPQaUpkk80YvOXXltbbnAgRlgMBMMKB
	gg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gwbbe96v8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 19:42:31 -0400 (EDT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbedbd182f5so210831a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1790293351; x=1790898151; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6TCan+7XKf8kThtM9GoM7KKJ/B7qFfiyA5H9QrhRig0=;
        b=2v4JtuK4AuYlnhyTf+7kp4CofjhnMK/Upv6wJCZmFdqwzVwB9Xu3MBsywtVPQSJ89M
         Lbxfb2rPs3Cc88qUxhPSh9uUIjVX/J99MbO9HcJgdISx026lu1ZEP3AjdBlJsgpmoYa6
         DLehO/9ZB7lWWdM9jAufsDmBJeQ8DTgOSEpjkExs0oJFJ1Mp/bJq56l0MeKR1MjiHm/P
         jFyaJQOjirCfMEfyzgMSNUDMaM+cbSBMEENudCJfDnxPR8vtiiovUIak+a0d2Rzbxs4P
         7x78W5TBaDZT1dI4bLdA8j3QDftqB+SFq06nw+YsrhQbTlRp4Q9y2PhA1CTMHunXEdM/
         tqrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790293351; x=1790898151;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6TCan+7XKf8kThtM9GoM7KKJ/B7qFfiyA5H9QrhRig0=;
        b=JzVn/lLzWWC9mO2jvwO+mZavAFp5cIiDmgYFIr+MsynpT/m6FDUwqDJ3ICX/rdKDG4
         j1wSHg6YXuVEZhqCzfHcG80C9GadK3/J/+EI7jqEKEulprhJ06b2DZvC4CbMvkbiLOWO
         nyj2N4uADLkUoFPsFNelyqFiaG6REz4swpkx+7Mzb2dxOA+m2IPO5xYfN+mf7JZFz6iq
         cluNQaTx1gUEM5gxo1vGNuL6dKUbCnBQyuM+Aq+Y39HbFcW4ugFNqgk4PXcFyFQIZXCC
         DQ/Q5H/CSfltuoeA17sXbfuD6jY0OldUA2XjaiZ+z7JhbmHGK59XOhd7LR5EmPbvQbah
         IUPQ==
X-Forwarded-Encrypted: i=1; AKwUvBxnpxqc5fvfTxw7MmEfO11VSOjIHIVURBcGMgXcwocD4lsmYbh/0Fj1E2lIKTxEAPIF6wvKzOlHT/s8G4w=@vger.kernel.org
X-Gm-Message-State: AFuF++lG32BGW+HjTo4FgpJ5bJPHxx4hBDIZkUkT/K22srgfPoU9g+so
	OKSw3FK5aSTOtgCKz+FXA2bBZfzhZ0xj8Lk3AtNGmPY5AoS29Gv2QvQn8ZyL7ilcIxJt6btvUpZ
	3sRK8b04zzEAyTlbi4YsmyhZDhtX1K0QdkTg5vBDhBJCbpaxHnzFZbU2QPQMu5A==
X-Gm-Gg: AYBFou0LZMr0t/gYZLO45kL4uVWufwKo+1HLKLPteI+ctzbjTeuNMfzWWo1aaeli7LQ
	4QBfBDV6QueOV2gxU65NabDedgev2iy6vSCub/H2UzjAQiWm6YU9JyDEg44cn7oVIObXI18ka2e
	CNbw2aN1bvEhoJpNUlXk7p0aMphYXS3zvzNO+Jv1wVWefsaGNj9P3DKikBQftiRNQSz3qliEcSU
	7kIHM9Ceof4lP5SuO6dWLny6cPI94WhywNO65kjvdBUVRD8qH9tCt4WIBPAfXVPknIfH0aUmWP0
	Z+qZtMgR0RZwmUc0aVoNGYUwjn14JxkZkbdu0uAWlLO2taoxMkJGwhMyKkKmfSkJ/1JZTe2vF5o
	lZox4w8GK
X-Received: by 2002:a17:902:6b04:b0:2df:8e7d:f8f7 with SMTP id d9443c01a7336-2df8e7dfc64mr5379855ad.30.1790293351051;
        Thu, 24 Sep 2026 16:42:31 -0700 (PDT)
X-Received: by 2002:a17:902:6b04:b0:2df:8e7d:f8f7 with SMTP id d9443c01a7336-2df8e7dfc64mr5379735ad.30.1790293350445;
        Thu, 24 Sep 2026 16:42:30 -0700 (PDT)
Received: from [127.0.1.1] ([208.115.110.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df90fc2e5fsm2239605ad.5.2026.09.24.16.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 16:42:29 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Thu, 24 Sep 2026 19:42:16 -0400
Subject: [PATCH 1/2] fuse: convert fuse_add_dirent_to_cache() to use folios
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-fuse-readdir-folio-v1-1-8dd97e71c1cc@columbia.edu>
References: <20260924-fuse-readdir-folio-v1-0-8dd97e71c1cc@columbia.edu>
In-Reply-To: <20260924-fuse-readdir-folio-v1-0-8dd97e71c1cc@columbia.edu>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790293339; l=2662;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=M0z1JCY0hKQ30hf6qGaQ8ZaEutPJR8AyX0o0aOQxvKA=;
 b=Q2uyVuqgXSmaGY/AwIsWfcmkr4r59/TP+N7CLOpgAbwLAJcTZSDnt49OaCnnPNvBzwzYwLAXa
 +NHl5pOEoNeCbkdELnpU6xPmNPwkLHVuzhOR/Qn0nPdBfHLJQcXurRm
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA5NiBTYWx0ZWRfX5I+Vnf74ht09
 jWRmPoKQPDelwGEWMJ+jYZs3oInrgjyvJaxx3Gqj8Jq9nR8pP9/4MTjy3akObYuokcWHZqd7oxa
 ylDX+p9356B4I6T1MbE8/06GecQZqDo4UO6uVkx6IIz6vLEIAPYSVH+SF2XIHUimcPzw1OW0B3N
 tQftJN+Y7Oo8rijkZHzPK1YvjU7wTUTWMeGy1r52489SeDDfLLu/7O7+X+iwg78zbDKUrF8rqDd
 2gL53ILuC2ztylH1KG6AwckXrES207COEmkhyo73A0yKCUuQPeHCBX5V+UhZsjPmFmcbVobJtJN
 FnorynwDXjKoisgxR18cUW0WLk/OERg5Hn65gcVgePFRZtYioCrz4Sd2hCoY7qm7WL+JRhGpQoV
 ChgCNov6QSnNMTy1vnE5E74VkeAHVkAkYQSjaus+NqkTaq0Jr/6J0ef/kVzX34j3Z3tC/l2OpYz
 McBJFPTZxnMKAxBMBpg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA5NiBTYWx0ZWRfX9kafHwLxrd/t
 BYz1qBcj4CdPx/wECTs3JvBbnRL1wQI1L0VVtghY8tmNfwzU4xgBi7v6s5LCLbmGImoXbCyKPxH
 lqBhmY/lkpynSKOfIlXLgUo2TLofd3AydMLnuEEOANIEJDlVfnz4
X-Authority-Analysis: v=2.4 cv=FLuOVOos c=1 sm=1 tr=0 ts=6ab5b567 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=AP5Yue2pfywxtTblp62eJQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=G--0XuH5328wxK7v7Suf:22
 a=u1sHAvkQqplEvoskXzMA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: mW3SG2igfmhTGZqhUbkP19cbboI69fX-
X-Proofpoint-GUID: mW3SG2igfmhTGZqhUbkP19cbboI69fX-
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11915
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=10 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=10 priorityscore=1501 impostorscore=10
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240096

Replace find_lock_page() and find_or_create_page() with
filemap_lock_folio() and filemap_grab_folio(), and switch the remaining
page helpers to their folio equivalents.

Each index of the readdir cache holds one page of dirents. fuse does not
enable large folios, so these folios are always a single page.

Also write the dirent with folio_fill_tail() and memcpy_to_folio()
instead of open-coding it.

This removes two hidden calls to compound_head() and one of the last
callers of find_lock_page().

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/fuse/readdir.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/fs/fuse/readdir.c b/fs/fuse/readdir.c
index 5ca87151d70d..e6b828eb41a5 100644
--- a/fs/fuse/readdir.c
+++ b/fs/fuse/readdir.c
@@ -34,11 +34,11 @@ static void fuse_add_dirent_to_cache(struct file *file,
 	struct fuse_inode *fi = get_fuse_inode(file_inode(file));
 	size_t reclen = FUSE_DIRENT_SIZE(dirent);
 	pgoff_t index;
-	struct page *page;
+	struct folio *folio;
 	loff_t size;
 	u64 version;
 	unsigned int offset;
-	void *addr;
+	size_t folio_offset;
 
 	/* Dirent doesn't fit in readdir cache page?  Skip caching. */
 	if (reclen > PAGE_SIZE)
@@ -64,13 +64,11 @@ static void fuse_add_dirent_to_cache(struct file *file,
 	}
 	spin_unlock(&fi->rdc.lock);
 
-	if (offset) {
-		page = find_lock_page(file->f_mapping, index);
-	} else {
-		page = find_or_create_page(file->f_mapping, index,
-					   mapping_gfp_mask(file->f_mapping));
-	}
-	if (!page)
+	if (offset)
+		folio = filemap_lock_folio(file->f_mapping, index);
+	else
+		folio = filemap_grab_folio(file->f_mapping, index);
+	if (IS_ERR(folio))
 		return;
 
 	spin_lock(&fi->rdc.lock);
@@ -79,19 +77,21 @@ static void fuse_add_dirent_to_cache(struct file *file,
 	    WARN_ON(fi->rdc.pos != pos))
 		goto unlock;
 
-	addr = kmap_local_page(page);
+	folio_offset = offset_in_folio(folio, (index << PAGE_SHIFT) + offset);
 	if (!offset) {
-		clear_page(addr);
-		SetPageUptodate(page);
+		folio_fill_tail(folio, folio_offset, (const char *)dirent,
+				reclen);
+		folio_mark_uptodate(folio);
+	} else {
+		memcpy_to_folio(folio, folio_offset, (const char *)dirent,
+				reclen);
 	}
-	memcpy(addr + offset, dirent, reclen);
-	kunmap_local(addr);
 	fi->rdc.size = (index << PAGE_SHIFT) + offset + reclen;
 	fi->rdc.pos = dirent->off;
 unlock:
 	spin_unlock(&fi->rdc.lock);
-	unlock_page(page);
-	put_page(page);
+	folio_unlock(folio);
+	folio_put(folio);
 }
 
 static void fuse_readdir_cache_end(struct file *file, loff_t pos)

-- 
2.39.5

