Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E897399CEC
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 23:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789515762; cv=none; b=rR1Fxha8T1apCzPcgHVLgSej4+iYEIt5EFGy2OfhYEnO9oVQYD5xlmMdyWmbTLfaVj3C55iRquG5FBFHuUAQD9fgSyNN81Ho71L4HZ2uZ2xo29nZZbOs96B7xNoqmxLvygZFnexMZ80lANJ7gUHcaELiQiZ22CDilKFEVdeAwjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789515762; c=relaxed/simple;
	bh=dxg52INW+Mj6Q6Lb2jquqMFPjl6/Rh2+AATGon4TcZU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RGY6j0Mmyz3DyY5C8Au2XVOd+x9fmqwuVn5NTxGTgm0gRMX6OMINLRE+B6xIl8yIzHT1kBXKVmqlTol3e9yI/PmUYSDwDjUgZsf2Ynq+7wMQqf89K4h7od2t2qyiwW0Ei07ZZXGMIkvqka8faGiwYYM3kccFtkJy7JX8KnTS1UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=Oe2VLdiG; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=erM29vpc; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="Oe2VLdiG";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="erM29vpc"
Received: from pps.filterd (m0167069.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FMbrWB1478234
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:42:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=uZE/najFT9R5zTEBz7Fhsb26kJ
	qZDk8owuOeuq8Y1m4=; b=Oe2VLdiGVsKZ19PvlL2qhCRXsxSeze/p+R148PoKqk
	JQU/6vxvqL+/5CyvNmq2sQGAWD8vVOmyvHNISYnC9p3ROhXQnEreUKiaMH5vYHrx
	kDhMOv8vW/a+eatdK895SrrI4ycPRWs5yTEjZ+BZil5/f+Nnk91NTJQhfRcyR9ji
	CNOZ+aL8PXpF6epP7fFhIzf6sBllao8JxnOoACzvuMLEG1MlsW9KUArXfFrVMdaV
	PA0luBiyaa6kC7X+G/Vvc7YO0fsSf1t1qeDAZ2qhGMXPYJV3xqsa/cPyVn8q1nuF
	EUK6AdtpUGXuLk6siHS6BHAraJD1j9x34g3Z/hUl5ELg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gqab3u64g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:42:40 -0400 (EDT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-530f49fc5ffso99506341cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1789515759; x=1790120559; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uZE/najFT9R5zTEBz7Fhsb26kJqZDk8owuOeuq8Y1m4=;
        b=erM29vpcbDGBHpifWzdJ1M/7wDKmO8O32bCFuDaPmH+gOX+VZMg/0PRn2UluG4t9us
         QS73N9RcBpp/h7QbF/SZkpbaI8mgSzAok9nc2AfaDKM1rkicB9YOqaxYed9bUDEFDZcY
         AidtMuMxofLNbKf5ynz2iKLgJoqv+W6rVMGfW0TQGzWm+RO3fgvMdIRyBjqGQ0ERkoge
         pdJXQZvoY3zAXbu4Kc7PUyZjOcytimnv3pHwyU2bMoIay+RMsM46gGOY/1mJASCwdBKP
         S4N+BWfxPA21aEi6VukWWVIFbsCEDe3y8WivLsqM2yWchxPLI/itvpbOjF3fRmIKDk6E
         +txw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789515759; x=1790120559;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uZE/najFT9R5zTEBz7Fhsb26kJqZDk8owuOeuq8Y1m4=;
        b=gZOkGDtlsnKvUq81FJY/R0YYjwFRDGz7dJmc306AZSxmWGASrZ7Hg00WuDqVSC8/yz
         NhmQ8LBHEtOtlpb/S7shnM/Ki+tnppJZTgn8Dn7V+gzFqMPEYAPAUAp5/o6oGpSbRzlx
         kWo+IBxOYLA/thAynZSmILQINimILI74mmElLC90rDrVX+1OtakpGUfhNwSEUg9LNdgN
         oko5EkHNdKCTWEKGi61g/RFn098IiXYqMEzTuAhWfC05MRRWWcCqwzQdPZi0rrDCtPxR
         BVIeY6ZJwKy4yP3eu6UmzWptGxI9Du4gFBxkmrz/L1YGW0Em8uuUWhlXIb49uMurL2IL
         2ymA==
X-Forwarded-Encrypted: i=1; AKwUvBytp4NaOW4p52pOpeuuFbBGNOYaU98nZGm7VOse9xpZUfydSCX/64QLAOK5QgkQyuoBZf3pMtt4eghJh4k=@vger.kernel.org
X-Gm-Message-State: AFuF++nfHXBoOesaaHMeR4VkI9KUlwDDRld8z84tJokmb/AEqNnuVSf/
	RP7PONwm8YK3cNUSR8zYH1bdB3WjaHTgmrkbaRVJaoNSHGx2j89EDhiXut9h/UhZ6S68uLJpneM
	tx9zSJWz2D3prBdJjSoTYJjQLC85UPYpODg4qcFUSLghzAes8RgYHLdeUBWslig==
X-Gm-Gg: AYBFou0GmLenDPU5Lx12Jr7c0PwvDyLY7IimkwbbAKArUyzy2IuWeAh1klhKDl5ZxHy
	4DtQEyRz0/UWS2HDQF8gN9i9kPnxKjHkvLK0lro1enm5pHeKeThyPLHjfR+MVtwnuEAJwN1K/oc
	VwH94Oj2XemSaoaMgpWphXABMfZ+JDSFX/3XU2tN5lIEn+7Uc20fiA/xSdYgw01MIWFMIRprOzk
	tKCGmRvy+umvPJZS46kkZAUQY3EMP49bRzL3Il0Lg1kd2QdlidAqY9AyZ6kBAne1X4mk+PQPQU8
	pE4gQiX43Bajh35rMgIAhbcUJb1E1HDHMfOvzgdRt/Q433HKlI1AZU58q+TfG0Z7WSNHrQX4AKt
	NxHp+LzpcopPIhLSxGPt80B0hGdmlKUkZjn9dkImpmf3eWn8C
X-Received: by 2002:a05:622a:14d1:b0:516:e10f:7140 with SMTP id d75a77b69052e-5327f1aaad1mr8805221cf.35.1789515759166;
        Tue, 15 Sep 2026 16:42:39 -0700 (PDT)
X-Received: by 2002:a05:622a:14d1:b0:516:e10f:7140 with SMTP id d75a77b69052e-5327f1aaad1mr8804961cf.35.1789515758797;
        Tue, 15 Sep 2026 16:42:38 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-179-204.net.columbia.edu. [128.59.179.204])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9123be7f316sm11399396d6.25.2026.09.15.16.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 16:42:38 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 15 Sep 2026 19:42:15 -0400
Subject: [PATCH] vmcore: convert mmap_vmcore_fault() to use folios
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-vmcore-fault-folio-v1-1-a0cb6278670f@columbia.edu>
X-B4-Tracking: v=1; b=H4sIANbXqWoC/yXMQQ6CMBBG4auQWTtJHQ2oVzEsoP4DY5CaFogJ4
 e5WWX6L91ZKiIZEt2KliMWShTHjeCjI983Yge2RTeKkdFdX8fLyIYK1mYeJNQwW+NyeLgKoSim
 Uw3eE2uc/vde709w+4affibbtC9g6lTh2AAAA
X-Change-ID: 20260907-vmcore-fault-folio-4b382eeff262
To: Andrew Morton <akpm@linux-foundation.org>,
        Baoquan He <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>,
        Pasha Tatashin <pasha.tatashin@soleen.com>,
        Pratyush Yadav <pratyush@kernel.org>,
        Dave Young <ruirui.yang@linux.dev>
Cc: linux-mm@kvack.org, linux-s390@vger.kernel.org, kexec@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789515757; l=2125;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=dxg52INW+Mj6Q6Lb2jquqMFPjl6/Rh2+AATGon4TcZU=;
 b=vdxoyuEon/H05Tmo1Fpa9qQA+JGXLiAWR1tlAA1+IiA+X8bmd6jRJvtBx0LctZl43TGXziRTe
 +GTwRByLmR/A0o+4UaXDSlvV8ydx7axk3vRrDxpQ8p2sw2e06k6g4vx
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDM0NyBTYWx0ZWRfX9Th9vvvxJHy9
 /dgOAOwlU9cEBuTZuYC05IP5GMu3YarZSCAJlrMSrOc81PPkxyHejHNnAsiiHEYeoa3Ate+xOIF
 rBYDMZSSmKr/0oBuI6Cb4DZ5fyT4KeJ3Wl3qdxbuZT7L8CboVMB06gzdCPGhhdijj1Je9jqLB1x
 71SLK9QmBkJs5e6D3/B2RYjgVNT56ejJWm0y0rqJUP9tFUdIId+tfDPOorkhm/jHSXRFo8t94HK
 hhb5TwXHw1I8+lgZFaGDQfg+ab0JyI6qfX9jc/8PJ6gYeBW8IawhqGvwwPYP3Rw+813RM6o4vjx
 rgQ0dm3YyiB0iHTQF4ucC9O7YsGzhveBeHkTfoy/XJ1ada+ctCPo7TNBN8ejpxSD8QVEVRBa4Ja
 U1yxeUZqtSZ/eQtnVXLbJasutH4F+OfMYVVZHowpqLu/UyqKGy9UYS0v6kZXVXA1M4fK7iZ7FvZ
 KSC3c+iAlQ8y/M6XnRA==
X-Proofpoint-ORIG-GUID: A1vd-C-KyMi7Orvb-Kg4y8ypxn1B5z9j
X-Proofpoint-GUID: A1vd-C-KyMi7Orvb-Kg4y8ypxn1B5z9j
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDM0NyBTYWx0ZWRfXxskGO21Fizwj
 JO/j3yK15WGu4y/1Vdwt8QEc44jhMS+sLARsHQ3GpyN3Nda2yW/UcNSIakkFAoAYTH0jD/P9okE
 hQltE4kZgp75vjHKvrSINecDE6Glb3zxwqFreyB5chfHaLHE/TqP
X-Authority-Analysis: v=2.4 cv=Pc1qFShd c=1 sm=1 tr=0 ts=6aa9d7f0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=hXAsoc/zAxyCEdIRhrpmVw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=JR4YdQiviy7OQf72WyZ1:22
 a=LFCUUKIxLatyyoosy-EA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11906
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 impostorscore=10
 priorityscore=1501 adultscore=0 lowpriorityscore=10 spamscore=0 bulkscore=10
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150347

Use a folio for the page cache page the s390 fault handler reads the
old kernel's memory into. This removes four compound_head() calls and
one of the last callers of find_or_create_page().

The vmcore mapping only has order-0 folios, so the logic is unchanged.

Compile tested for s390.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
This is based on the kexec-next branch of the liveupdate tree.
---
 fs/proc/vmcore.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/fs/proc/vmcore.c b/fs/proc/vmcore.c
index 44d15436439f..2dc3803aa11d 100644
--- a/fs/proc/vmcore.c
+++ b/fs/proc/vmcore.c
@@ -474,29 +474,30 @@ static vm_fault_t mmap_vmcore_fault(struct vm_fault *vmf)
 	pgoff_t index = vmf->pgoff;
 	struct iov_iter iter;
 	struct kvec kvec;
-	struct page *page;
+	struct folio *folio;
 	loff_t offset;
 	int rc;
 
-	page = find_or_create_page(mapping, index, GFP_KERNEL);
-	if (!page)
+	folio = __filemap_get_folio(mapping, index,
+			FGP_LOCK | FGP_ACCESSED | FGP_CREAT, GFP_KERNEL);
+	if (IS_ERR(folio))
 		return VM_FAULT_OOM;
-	if (!PageUptodate(page)) {
-		offset = (loff_t) index << PAGE_SHIFT;
-		kvec.iov_base = page_address(page);
-		kvec.iov_len = PAGE_SIZE;
-		iov_iter_kvec(&iter, ITER_DEST, &kvec, 1, PAGE_SIZE);
+	if (!folio_test_uptodate(folio)) {
+		offset = folio_pos(folio);
+		kvec.iov_base = folio_address(folio);
+		kvec.iov_len = folio_size(folio);
+		iov_iter_kvec(&iter, ITER_DEST, &kvec, 1, folio_size(folio));
 
 		rc = __read_vmcore(&iter, &offset);
 		if (rc < 0) {
-			unlock_page(page);
-			put_page(page);
+			folio_unlock(folio);
+			folio_put(folio);
 			return vmf_error(rc);
 		}
-		SetPageUptodate(page);
+		folio_mark_uptodate(folio);
 	}
-	unlock_page(page);
-	vmf->page = page;
+	folio_unlock(folio);
+	vmf->page = folio_file_page(folio, index);
 	return 0;
 #else
 	return VM_FAULT_SIGBUS;

---
base-commit: 4d17a004cfd5489f88ad0a7a151dea11a533338b
change-id: 20260907-vmcore-fault-folio-4b382eeff262

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>

