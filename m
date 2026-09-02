Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6FB3DDDD9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788365508; cv=none; b=tNw6SMy0X0Fh5AduPZrvXV0IIh6rzhyZYNqx6H+a7auaDOe3aAU/efkpEnp7OSqIOIog0uOx0PcP6stFtOsZLLv5dygYvPHXN2IKuyaE/EFtbeaHaL0IPeK4n+qT+vYAKkHJdNCcPUwB9/eWKSxsygao3mwe0VfHUA0a9MYXnwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788365508; c=relaxed/simple;
	bh=DvGJjxDjvkeBc3Pgy04HlKwc6JzK4G0xkf22NnVZUUs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iG/c94i+Aak9gjkg0GJt50dRPXNjSpq9Bi+YtsFhI3W7jVyQNeZmjkgyG0E3kM0ix3FXqGWVWGC+u6SEwrTXcWF79wuS9oqTnddSp/zZumuRlx6kuu0uVavVp9UN06h0GVQ8rG1khER+8pQUQJnor9L10H2sgqq/cYbFXYoU6bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=osIVpJdY; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=d0er/jc6; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="osIVpJdY";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="d0er/jc6"
Received: from pps.filterd (m0167072.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682FPere104437
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 12:11:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=/p5I
	yxMhiyN+xECiFbmQYjs/BfmH8yfl9vXNENMvPmI=; b=osIVpJdY7TSOJgL5uTid
	qDapcPx3LmfPlnsnaeuMuhpPefBVkpoYDShjN49kB8e6RPRKA90XQYbXnz9BoEwP
	Aj7s+nar/tU2FG5kQTAH05k8EFKHO41t66JcTbelpJkFZ9tKOABZ/mwGEy+IYFqy
	XY3CC0CshYfBB8n+aP4yGjZLTTcrhZiPfXqXOrCe7xxdvqIFX+R3fXqjrKN6gJWF
	LKUwaYF9zVGNCa5mFyCoRHMqSYveBVp5dVjqOpXLC4XJ9hmVrB+vFWU+Uxk5HIk2
	MExlaR9iBeGbVTSn1yy4OS39YriYoS7YAb7LSzzoqriJEL+eZ6+Zkahh1VpTj/yB
	Lg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gefkbk67s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:11:42 -0400 (EDT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-53018848232so4722851cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 09:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788365501; x=1788970301; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/p5IyxMhiyN+xECiFbmQYjs/BfmH8yfl9vXNENMvPmI=;
        b=d0er/jc6pkv8KVAbSYPhWymiw0sEcXzykrHGuSmOHB0I4a5xNsZKajFwX+7nIXu8Xn
         4B8yQviUjm2NOxt1lYHfP3vjulJQSayrtpVAswW4h6YubnJRlmiH/7zBs4id5S2sgnWk
         /9MlfJip6omgV5nVudnCSsZBjRmRLgulX6oudJ9wDWBoun7SHk0bpQvwT0xGHoJo4SY4
         aLdWFTy+JFw8wARrd9Qbyn/uX7X4xlW7be/8rWSJdw2ADj/5T+mDPYFicaIMjhudL4UF
         Ti/jHWX35bBB3yO7yqoOZE82DCPeq3s/Ycw6rPluE6L24VsAA8PvIJ0Z74sNkbujCWUO
         R9FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788365501; x=1788970301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/p5IyxMhiyN+xECiFbmQYjs/BfmH8yfl9vXNENMvPmI=;
        b=MwdtHiAqxiZRBnKPi3LZdb3kF7rcRbM2TosJgh/9offd+XzyD3tHhLmNaDEdNQCzpz
         jlCkj2j76sFzD07LSOUMixQo0+aVSiybF7i4RPx/dwODxbPWZRhzjZM3yUbv6yFZs9EN
         7nE/nQpmOz82U4vHFYdpXeBzEknEpTP+6j8PzP4LKNrz1EuXrYJpN43HlHpxB66kaFZa
         sElsDDFcuZiVxB0/jJmb3ASL8ctA+kdzvmm8HnfHD6vG5JBzQ2z8M3PhRIswsoy2jg93
         QdMi+O4rSrJJeTpT3HKk3lyHx2aOQs6zSfVwGJPj6Qg9GAFVuo0Rd6rcDKAm6TExXPui
         EVxA==
X-Forwarded-Encrypted: i=1; AHgh+Rp3ZmVB9Ib1E9X6m1z1apGwJdW1t2ABa4u9iHBWg+0Xxzvzd5l2/3u3oqlWyB344keyi4LJnVSX0UuP330=@vger.kernel.org
X-Gm-Message-State: AFuF++nrJqf/zS1Cu3bOZnFc9bHc+AciHfK96sKBQCVIxvgvlZSqJHjr
	WTunlM/5wltGUIRh8wb56z0UCGGJQ5GZy8Ms76pVWH3X7awPGd6qOWA7xtngaQBeJL2oyqbNAJK
	+UANEXZ7APAbLGLlYKwxXji3JoaFer541C5LLlKkG1aMNa6gtGx7fJLpL59SGcw==
X-Gm-Gg: AR+sD128/u7BB1WLvxDV3dG14msdr3SqdhOcmFnGH3JOMRGrTtK+/VuwJ2MddEkSs73
	TcJUrcDo6NFEjoQ8fYJRDr9ADOC0W0cWdk0bH91fN7f3NcMifzbD5xRwxC7zf/2qdyB1wTQoZs3
	oCAe3vu0W+A/2JL9DMZoIGFJ4Hyzmg3UKCUR/PZqi9hZ8IcDmw17GhJ/tuk9bvw9L2TZc2MjBUz
	HYwla3UG+RhSWrSAHIJWKvUp1UbZwByNU/Q7tr6/ZzWzhbcmcXL64eMxmSj5wkSv8eO6dIUHxHe
	CPetFFFAWhcCvKhMucKRLB0iBBP+3nvX2o1l2bkYKJBHzA5QXvaO1cLr1PSCb/BAp8BH7AOb1em
	KDgkRfEZ2sz2CIbnvFXQASKMWvz49qqt5Wn3vv7zhqrryqwBkE3O3RQ==
X-Received: by 2002:a05:622a:2d2:b0:52f:bd64:c147 with SMTP id d75a77b69052e-53036b90e86mr59636331cf.8.1788365501320;
        Wed, 02 Sep 2026 09:11:41 -0700 (PDT)
X-Received: by 2002:a05:622a:2d2:b0:52f:bd64:c147 with SMTP id d75a77b69052e-53036b90e86mr59635491cf.8.1788365500817;
        Wed, 02 Sep 2026 09:11:40 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-193.net.columbia.edu. [128.59.178.193])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9eec7608sm21172636d6.26.2026.09.02.09.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 09:11:40 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 02 Sep 2026 12:11:27 -0400
Subject: [PATCH v5 03/10] ceph: add ceph_folio_snap_context()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-remove-wait-on-page-writeback-v5-3-0b512e77e75b@columbia.edu>
References: <20260902-remove-wait-on-page-writeback-v5-0-0b512e77e75b@columbia.edu>
In-Reply-To: <20260902-remove-wait-on-page-writeback-v5-0-0b512e77e75b@columbia.edu>
To: Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>,
        Viacheslav Dubeyko <slava@dubeyko.com>,
        Christian Brauner <brauner@kernel.org>,
        Jeff Layton <jlayton@kernel.org>, David Howells <dhowells@redhat.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Zi Yan <ziy@nvidia.com>
Cc: ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788365497; l=2021;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=DvGJjxDjvkeBc3Pgy04HlKwc6JzK4G0xkf22NnVZUUs=;
 b=YHFkn3aeu/zB2unSDs4R+gKwkgS/GLUjgJlDh8UQiLxktU0qaRlg4TlbyZIriHKTjERxntSWs
 6j3gwCcidlZCq72wPNJ0ZKsXx3LWhN0DbW0DHbXWLcgbtEffoYM1QTC
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: _P8BhofFbDzwO07LKgeaEgh3_X7YYBB6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE0MyBTYWx0ZWRfX8Lsag3oKC5CC
 CWR2L56UwU/E26rkXjzC6RUe0GfJjpoQqDxXPEAqNlLQDoEvWJc43ljPF4T1bZGCelbYBk1IAPl
 Tf7VkOGCoQLI3pZfzvW2G7prCYxupUxLVohfoSz5vVi2hYUAelme
X-Authority-Analysis: v=2.4 cv=aIzAb79m c=1 sm=1 tr=0 ts=6a984abe cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=XwBYxoxBwSosfWEfMcqm5A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=SsB-OO3BMngHh3ZO9fOt:22
 a=JfrnYn6hAAAA:8 a=Ikd4Dj_1AAAA:8 a=bg0B0yAPDd754FioS-UA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE0MyBTYWx0ZWRfXwSGPtlG5sq4c
 zuRgiL/KkK58mKYr3gAfpoQ4HWIlGUITlvi8auBVQPc3MXDFhovpUfwxUXDZP0ZPAcJTbK3tOCe
 ZPIyNvatlhwURxqgb8S+GTk5YOfK+SVbMeg8rxojnCWuA0ox82DRER9GwBNNNiwhuTy/KC/6ZB6
 XT8+Q415iDZwVVm4mVQ50iQJ9QfWnqlqeLCgrxrUYaf8JMA495VqN9v9Cl0gnWqXlb9DTU7h+22
 HWShZEe5Gf6ExP/XvzE6INuy5alvGaGVlgu5PsslpKHxccl1+YmBiXJBkPHYG+L0EjAv4FgdpUJ
 r/kbmlfX9/jB1DOI23w+ZQCsZyZXG8I4+4GWkKUJRbxgiTOLrlOyeyWM+RM0bfrpLsaefqqAf2G
 nfuT/ftx6d7IR3ne0UNromvJq1+0PgUMSluWQYY5rEWgw6UveBbXt3ZXJMSDOLbQhzOGSoEglDT
 p3w/gjy+hn2vd57lQ4w==
X-Proofpoint-ORIG-GUID: _P8BhofFbDzwO07LKgeaEgh3_X7YYBB6
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11894
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=10 adultscore=0 malwarescore=0
 bulkscore=10 clxscore=1015 impostorscore=10 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020143

Add a folio-based counterpart to page_snap_context() that reads the
snap context from folio->private directly.

Convert the three writeback paths that passed &folio->page to
page_snap_context() to ceph_folio_snap_context(), removing three
open-coded folio-to-page conversions. No functional change.

Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Acked-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/ceph/addr.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index 5452e73ae11b..2fd3d6d0ffa8 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -75,6 +75,12 @@ static inline struct ceph_snap_context *page_snap_context(struct page *page)
 	return NULL;
 }
 
+static inline
+struct ceph_snap_context *ceph_folio_snap_context(const struct folio *folio)
+{
+	return folio->private;
+}
+
 /*
  * Dirty a page.  Optimistically adjust accounting, on the assumption
  * that we won't race with invalidate.  If we do, readjust.
@@ -763,7 +769,7 @@ static int write_folio_nounlock(struct folio *folio,
 		return -EIO;
 
 	/* verify this is a writeable snap context */
-	snapc = page_snap_context(&folio->page);
+	snapc = ceph_folio_snap_context(folio);
 	if (!snapc) {
 		doutc(cl, "%llx.%llx folio %p not dirty?\n", ceph_vinop(inode),
 		      folio);
@@ -1192,7 +1198,7 @@ int ceph_check_page_before_write(struct address_space *mapping,
 	}
 
 	/* only if matching snap context */
-	pgsnapc = page_snap_context(&folio->page);
+	pgsnapc = ceph_folio_snap_context(folio);
 	if (pgsnapc != ceph_wbc->snapc) {
 		doutc(cl, "folio snapc %p %lld != oldest %p %lld\n",
 		      pgsnapc, pgsnapc->seq,
@@ -1863,7 +1869,7 @@ ceph_find_incompatible(struct folio *folio)
 
 		folio_wait_writeback(folio);
 
-		snapc = page_snap_context(&folio->page);
+		snapc = ceph_folio_snap_context(folio);
 		if (!snapc || snapc == ci->i_head_snapc)
 			break;
 

-- 
2.39.5

