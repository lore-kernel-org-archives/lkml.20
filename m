Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F6427B343
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 23:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788738357; cv=none; b=R9F5K8akbM0dTnpNYTQSmIKSu2wY1ZIMhX+y9H3O1eFnrDwv0GACT7bf/CRCxGRq3zGYnhC2SMTZVJqn/l3gK/4b1iXfUoJa/W4oVJboGF3l70G/MQVggk0j9cITIT4tjX2ij8w5YIiPvix4zkI3Fet+Xvn4kfdGrrGAUaj+FEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788738357; c=relaxed/simple;
	bh=YUiuq5HeQFR23XYm7BLXCGUfVjFSKte5pFD1VHdooz0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=o0tAxQgCi/SRmW9SIkG31W08XxqOSeFD5qw4xCNKZRZIdiS8KDaBB7NYaV5d6qeOlzuUPqAS+FwIczK2L/P/RsasrQ44y7VnA7McsXTgzejWQEQ/yhdNNq1uZ2QRW/cdWye27nifOeXvIKFGh644QqRGw900k/0FdnBixc68JTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=cBn30TGD; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=YePP35VO; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="cBn30TGD";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="YePP35VO"
Received: from pps.filterd (m0167073.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 686MYhdb678121
	for <linux-kernel@vger.kernel.org>; Sun, 6 Sep 2026 19:45:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=/yb4ZkUCpaFSOuZxeTi0yQTuX8
	MdzkWN0yCAF5xi2yw=; b=cBn30TGDABdCA6aqJdXTGmmni2RYUYCvuqY3haebvp
	8yW9p3sZwkhByVbuw4q4HEj7sW9iq6fNnAhFYnHzriKUZiB4kQYusDuPJgU8VPDn
	FG1B7SyiaiDmNmJgJhvT2WauCWZiFy68cCrAUXl0dcI88HAVtUC/saUcmiWhKCEt
	Ebf9NYI2v1UzpGcZ3GogitunKKiPJTk0Hf5GVam+1/VRWRjEJlHq4TDDUW0mof5c
	qER/49ZOvLXOU7n7Uh39/LCt+cmreJlcXZP1F5pfvMLSXDPfoU9Pd6JXO1Ai6taa
	a8x9fmr/JCiahaTeQ7MaNmKbiFBZDEzf6BMbxPMktWow==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4ghfawrjp9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 19:45:48 -0400 (EDT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52fbe82672eso52387921cf.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 16:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788738348; x=1789343148; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/yb4ZkUCpaFSOuZxeTi0yQTuX8MdzkWN0yCAF5xi2yw=;
        b=YePP35VOqsNCxKLYktI9XSPVuU57MVpWBU9rvJ28GH0fH8Pq8bBI/RGS5xvZJoCLq6
         ALi+G+5T+3NDAoBkRFMg7uqh8WkTNH+ipUlVZCZdNa9DXJ6h+VIAP7puH4QjWbnMhxKw
         fkv1roK9S2xiXIHfH7lDOdx7SOVCFBKczSvC2bYV4aAiY18HK3JRB1/q2NHecI+yGIVe
         nMxRqs19TZ16QcBcRZn/juVI5GzC/hpXIyNoGCu4eAUEt7cinvRLlJukcn1MlLdG40J6
         l/DjkXu3yPm3mnJ/LIPYUWb37sxk9G5cglyA43MgrN4+SCRSJpMmqUNipdmYW8k1KNzx
         Lr/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788738348; x=1789343148;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/yb4ZkUCpaFSOuZxeTi0yQTuX8MdzkWN0yCAF5xi2yw=;
        b=AP12YJa64rfrtttFCTYDPcy2OpF73wlKbrqt/9Vub9ICto8iv1crlkgG7wMiuGW12G
         C5vQ8Xdn0napgafcGuOLndrav5V+sV7kOvo4+6HJTKmLYBH5WbnZsKceFU1Qg30UIGPT
         6rArwaVTkuUQZqQK1R6L744VUbtni12mCFedG7HBKnPyktts77UXvBM2lrY/6X8M7mEg
         I3HFdXMKupSBv0dJm4oGaHm95JyMlmrVFne1aKDIwNJC48rCyISMsFLINjsTIyBvATLp
         Ko56KTueDSgRzZT+mZt4+YBQaW9Uoq+onURl+LsKbK3tyyYeOkT5Ow2uihosGzG6TGPd
         mDbg==
X-Forwarded-Encrypted: i=1; AKwUvBxFzjiqlROzJSEOfIlGrMF8OyYKntXCHn6iMcFepX3TLUz0pFtnrO+gbRE8voMJyt2EGHUsaZSb6PBcH+s=@vger.kernel.org
X-Gm-Message-State: AFuF++m6oCkO2yFenaqqg8tdy1U3edwBxcaofWFoIgFN9I8UUgXPZ6sL
	qIDGdRwIupPD1u0apZ+iXOnqiy1jMkbLIQTio4mam8JAQ71E9zZRvb7I/10CdvV+/4Ioc/9ZMEb
	UcRH2tWZE/7lj1ayO6QXdRndiLsNzoNdlo0vpRgH//SKnPvjnKQmV4yWs69s0Yg==
X-Gm-Gg: AYBFou3fwYY2AN452ZONsx/9O6lTjlGNoOdJUKVPW0oYXoG0D7g5ZubPwutpJsL39UP
	h6erFVcmbqQFAJdR/aUyu04TfE4Lrcj57m7fvx27KhPb82drKTQK2T6mpMYiIBVhLglkMexvCZx
	xDCr/XwmMdudvtr74y0xnC51GTP8YHdfNnuqdKvhnZgpUAUartnLDBCc2qZ8o2rjgJmju+DxFKU
	8UNuTmnircC5mrrF6KAzmAjX3/tRXVlmt4X9oE7EIKplyuKJ+p3VDZrIpPsAifsNGImZ9RAGj9x
	WK5i1/S5yO7ykdIIAUJLLugH4j6eVteF6HjLm1hGlXiFKel0iVsR+qa1QWrqX7llk80jkbwabX/
	2yuTWzxXLexW/xstVQZxBeHEYxe83G7vuA5Ldg8X36lHWdraK
X-Received: by 2002:a05:622a:244d:b0:52f:ae28:6aef with SMTP id d75a77b69052e-530549ef56bmr206701851cf.36.1788738347739;
        Sun, 06 Sep 2026 16:45:47 -0700 (PDT)
X-Received: by 2002:a05:622a:244d:b0:52f:ae28:6aef with SMTP id d75a77b69052e-530549ef56bmr206701691cf.36.1788738347261;
        Sun, 06 Sep 2026 16:45:47 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-176-104.net.columbia.edu. [128.59.176.104])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530541ba2d2sm75705561cf.22.2026.09.06.16.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 16:45:46 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sun, 06 Sep 2026 19:45:33 -0400
Subject: [PATCH] cramfs: convert cramfs_blkdev_read() to use folios
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-cramfs-blkdev-read-folio-v1-1-1be99a82be55@columbia.edu>
X-B4-Tracking: v=1; b=H4sIABz7nWoC/yXMQQ6CQAxA0auQrm0ysJiAVzEuhk6LVWRMq8SEc
 HdHXb7F/xs4m7LDsdnAeFXXslS0hwbokpaJUXM1dKGLYQgRydJdHMf5lnlF45RRyqwF2yhMEof
 QJ4KaP4xF37/16fy3v8Yr0/P7g33/AN0bOq18AAAA
X-Change-ID: 20260906-cramfs-blkdev-read-folio-16fecf6908ac
To: Nicolas Pitre <nico@fluxnic.net>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788738346; l=2174;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=YUiuq5HeQFR23XYm7BLXCGUfVjFSKte5pFD1VHdooz0=;
 b=7RQVLj+g4dR1Ms5MKg10azl/ZEQxqrZ+FrRbgv+OZXEbwjS/gh1ZsOCHA04qZAWcLuFRYMf2v
 uWXO2T/4bvGC0UrS30MOFyxP1o2OhYjSXUPIpZ41FdgLl8ue/IRIhgr
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: EfBT52u3jp45PsinsmKlgPa6vGirrBvC
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDI2NyBTYWx0ZWRfX6x5t2cVeBsFY
 XiefVZ7XaYoj+y+HHLJf3H0GEFUlSszqvMNrDJstyr+uQmx3km8CaKQr9wIN7Dggk35hFiHXmti
 JPyyxcZok1R6FautwvpHix50OshmQEWtSQ3IdIRDUeNoO2jxm+Ok
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDI2NyBTYWx0ZWRfX0EWYPTZYHSEF
 d6FCjEERpFIzMRbjZ5w1LtdlLBiUBpd6fDXhWLFWHKapiimifIk9xhkjy56rgv6owhWzy3VjzGp
 jWWKTzzdseITkM0kKvxiC5iwixTRKwu4uTawDRbYGp6AoL5LdF07HtN+yUyeqfiyHA0wXJgD4j5
 P2eMeSas8Pk8HGCCWckCjXPrLmtYoekEsbGncg2/aGCw/+32OXSEJ7F6kalPWTV0kJOMaV0ORJH
 p1vgtK3NTwaOct7Fr0eVrSId1asUz7Ue4l5E0xonaKXcg5iQvP6Je0d8T83kWGmcixk3PajcVIQ
 GOGlGjvaMGh/h8K57sXKSMNHd/YaMB8W3tGzZS27W2ZRtex6UicQytDDuh8PAlwQ13zP+I8hMh5
 TmZ9U81LIWHPVmZrmrxGkOA27WjQa7acrjni1/qxLyCUd89INy/+kPzxu/yyMR9HDHPIwdRmSKT
 hefAbU7G8AlaPDQrmyw==
X-Proofpoint-ORIG-GUID: EfBT52u3jp45PsinsmKlgPa6vGirrBvC
X-Authority-Analysis: v=2.4 cv=bvd8wkai c=1 sm=1 tr=0 ts=6a9dfb2c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=aNLBvxxoObQFLnBXsbaGlA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=jHxIr1HyPKZ_Q5_91PL3:22
 a=QBf-Z-tBp1IkNLPPPQEA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11898
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=10 malwarescore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 impostorscore=10 phishscore=0 spamscore=0 adultscore=0
 bulkscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609060267

Read the block device pages through read_mapping_folio() and copy with
memcpy_from_folio() instead of going through a page.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/cramfs/inode.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/fs/cramfs/inode.c b/fs/cramfs/inode.c
index d4cd03f4f60d..b55eb3bd29c1 100644
--- a/fs/cramfs/inode.c
+++ b/fs/cramfs/inode.c
@@ -194,7 +194,7 @@ static void *cramfs_blkdev_read(struct super_block *sb, unsigned int offset,
 {
 	struct address_space *mapping = sb->s_bdev->bd_mapping;
 	struct file_ra_state ra = {};
-	struct page *pages[BLKS_PER_BUF];
+	struct folio *folios[BLKS_PER_BUF];
 	unsigned i, blocknr, buffer;
 	unsigned long devsize;
 	char *data;
@@ -227,15 +227,15 @@ static void *cramfs_blkdev_read(struct super_block *sb, unsigned int offset,
 	page_cache_sync_readahead(mapping, &ra, NULL, blocknr, BLKS_PER_BUF);
 
 	for (i = 0; i < BLKS_PER_BUF; i++) {
-		struct page *page = NULL;
+		struct folio *folio = NULL;
 
 		if (blocknr + i < devsize) {
-			page = read_mapping_page(mapping, blocknr + i, NULL);
+			folio = read_mapping_folio(mapping, blocknr + i, NULL);
 			/* synchronous error? */
-			if (IS_ERR(page))
-				page = NULL;
+			if (IS_ERR(folio))
+				folio = NULL;
 		}
-		pages[i] = page;
+		folios[i] = folio;
 	}
 
 	buffer = next_buffer;
@@ -245,11 +245,14 @@ static void *cramfs_blkdev_read(struct super_block *sb, unsigned int offset,
 
 	data = read_buffers[buffer];
 	for (i = 0; i < BLKS_PER_BUF; i++) {
-		struct page *page = pages[i];
+		struct folio *folio = folios[i];
 
-		if (page) {
-			memcpy_from_page(data, page, 0, PAGE_SIZE);
-			put_page(page);
+		if (folio) {
+			size_t offset = offset_in_folio(folio,
+					(loff_t)(blocknr + i) << PAGE_SHIFT);
+
+			memcpy_from_folio(data, folio, offset, PAGE_SIZE);
+			folio_put(folio);
 		} else
 			memset(data, 0, PAGE_SIZE);
 		data += PAGE_SIZE;

---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260906-cramfs-blkdev-read-folio-16fecf6908ac

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>

