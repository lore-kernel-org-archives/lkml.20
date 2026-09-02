Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A837B4A99D8
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788365509; cv=none; b=uIld/zZsKbTR0MMEzuWc2v6q26R+xbbPLnG2Z1mro6PhLnkXwiBdNb4TkvVKvW6INZHOJ8IFsA4VBNs22CexoxLWv97cfqCgy+ptynP0SBcE/1MB2uWqmr3Pu+4D7AQujo7SLuB6Z3JkI9wMnw9cn8L1FJheE/tpdW/dNx4Uutg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788365509; c=relaxed/simple;
	bh=vXDWSuDQTPW0LOvkYx1OZyCe//zjMEtG+2XJpjkTqZc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IHUdoLtruqPUmmIJiypvw3xlVZtyfv6IWt3wb0W2u7yh0Uw0D7AA9VZb4AIs7NzAFWKJTpdsCYRtbwF9Vx/5dJaZVE08WrZ/1tH4RFwC8yIYaJmBmzUhchJU017sSlSKt9G0IqOKpTXuwkCa2dUCZ2mVTghbUzTKSM1S7Lnl6Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=pVLNu8bI; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=DCnpYdb9; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="pVLNu8bI";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="DCnpYdb9"
Received: from pps.filterd (m0167073.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682FPnmx463277
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 12:11:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=R4v8
	n5N2hSAXM4UTei/X90YnX/8+tfva0eCUgcdDuBQ=; b=pVLNu8bIgkQ+KmC1gu1w
	BZi6DxSRL3sJywPZQ8c9IOLqzrE/mgMOXPt2oMvRIAv6EoTgaU8ZZlV/HhNQd5Ua
	3ObBlH1kp+Pkd/KS+DmBKyoC5oD3tla0W2bLzGEwdj3GX2R8xUA6n6pXMEo1BOPF
	x1GLaMV0LRpWGRywG4tPSPcyY2TGPcPMyG86/imG4VCuJMjxtVHEfBGNybdGwno/
	LzwPkBD7cQnjJ2hcFFMRDUnQak/5rMBwU+bRGeOgjiJfDoR3HfiM/PAL718/H/TS
	gUwBNO8GYan7eu+6dFTesqfkOwK/H+h8YhnUWlnA2Nu5pInwbDgDrnINkhpopEa1
	uw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4ge833vy7u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:11:43 -0400 (EDT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51a8b0a08d2so18320231cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 09:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788365503; x=1788970303; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R4v8n5N2hSAXM4UTei/X90YnX/8+tfva0eCUgcdDuBQ=;
        b=DCnpYdb9E/m2z4+54yUbWZjE+qHxwxMf0e3Q66IjsXmp6XCuLpuD4jRvajvmn8hscI
         S0diPmhUbR5fjZq8QKK8W5H4lC0ZNjDVFoBP+RiETVi3tVJq8of9yV5x0e/uUTedfmmG
         08S33EBaADEfzmzOHa+a7/IfphmJxngZpzEdoDp8nmtgFlqXIDShUKV+n7lCl2jfQ78R
         vekEdVK8e0hufks12hcevK3CAROb8VSca0NF14kJlbej4Mj0TPD0UotACDXeoVu+TiaE
         ZLmouOOawxhLEnzF4JpwIe7caKUXuAuW+wAW9ZMBvu/kczGF7gnCHziQDIi2uPt08oLq
         8ojg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788365503; x=1788970303;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R4v8n5N2hSAXM4UTei/X90YnX/8+tfva0eCUgcdDuBQ=;
        b=acpCyXSuspVWcnjCrMVwMpf/jr9P2srwWrSd3sguc8Z4xyf5Da+2RRdKm0cOkAt2Az
         AX4RjBuWcN/Y7bRB6hXesob+6NUL2frbWreGVbN8TwyKln+uv4x8DgCKuCsgNla0u+hu
         2asfJw7k/1mbqfwH3ty2rq4bsoO7vvKdDSKFQQPpYtroHi8FbC/Zx58z4OkdqOd1Be3B
         k4wcRWu0tRjL0tTitL0h8NWGyBARtMoVYo0kag1Q0fiviBJFTP//x32CnFrRvyiZOgcX
         FYExWQMa0LpiDwFoqHdFBYyL8UGd4ZIuGtoer+W0aHTxAc3PJ4lvA/l5AP8ENIjUFEJn
         rUAA==
X-Forwarded-Encrypted: i=1; AHgh+Rouo0Vn64hZ5wWeH9qmkg5spTbUlUIPw5jfZihhk0Snh2MmYDVjMk1rivlL3Dc0l+nKLwQ4pUz+AZ5bswA=@vger.kernel.org
X-Gm-Message-State: AFuF++mn4VBFPua+ff/ORzTP2S7lt6HCKTDrhd/K8ScloEYLMjTzCrfX
	ALqB5h+iyIpQ6EDAnlwdil1LCTp8kdrhVnTjQUKutpx8kotB4QwU9kmdGyJ9+Y6JkoDOBtNG43E
	Wj1OHdOorQdjwy2PXuIs3Cha3oQZ1XqBECCj40VI658AxbROIqG7v3rlqvhUlSQ==
X-Gm-Gg: AR+sD11+K8imxNT9nHSWKSvTFzZCZYv7e8Gt+vm/SaqJsnF+9gw3+ygRslab99IxFua
	75rXuhKcfmYq8v1BXHFgrnfgKQn6gHx8/HHYMmBgiOuu32KSIzLxidMlSZ2lCvx2UuNs/Qa+hAA
	dHA9TSUiMnSTw6TkhiLWaqxrjAoFgrRnWhqRfO/RIqIcdC4C257xirlxCSqcVidPqobnRlwWAs6
	g1BAkGxNzCZp+qkECeYBtbL1HzzBQcv1yHWp6M98tXxqbNYebz+eD/LgKAUfc59qC00rQ4plyqh
	ajsMluAgD+54LP7lRen/keTr0XgOwOFcmn2O3cXRr8fBhjUtcLy4l2x6PpQR/E3uSvO5HQnbqv9
	tYFyTKc7meXwh4nsgCNr0+VYVgjsPP8JHJW7+ucr71gzVjhF62uBTcA==
X-Received: by 2002:a05:622a:2292:b0:52f:c0f3:fff8 with SMTP id d75a77b69052e-53036c85c1dmr75336431cf.24.1788365502719;
        Wed, 02 Sep 2026 09:11:42 -0700 (PDT)
X-Received: by 2002:a05:622a:2292:b0:52f:c0f3:fff8 with SMTP id d75a77b69052e-53036c85c1dmr75335451cf.24.1788365502092;
        Wed, 02 Sep 2026 09:11:42 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-193.net.columbia.edu. [128.59.178.193])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9eec7608sm21172636d6.26.2026.09.02.09.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 09:11:41 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 02 Sep 2026 12:11:28 -0400
Subject: [PATCH v5 04/10] ceph: convert
 ceph_wait_until_current_writes_complete() to folios
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-remove-wait-on-page-writeback-v5-4-0b512e77e75b@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788365497; l=1518;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=vXDWSuDQTPW0LOvkYx1OZyCe//zjMEtG+2XJpjkTqZc=;
 b=NG3QtEbbjKEIQ3qsAPvXfUpqHY/T1XZ+awxl0PX6gmy9m1aBj7joXos1cKghD4PnfMxl4Nm/w
 4MNeYkL0U9bCns9ZaN62ZcTCmH+7OQxNfp9OGNJHUJtVi4b+hWbEeEF
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: LKjsv283In2gxVf4xXq5rFa4zFRSQDh7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE0MyBTYWx0ZWRfX5oRJK+z8mmuc
 C1suOr6dkGyiMsnFSy1SQ5bjtZq4expy8s9wDyC1bLlXayc7KiAzKcYWrG6YtfhNd7gKmoFE1h3
 Nforf8qNz2tf0QikkZTlx2Z8h+xvNfxV0TlxazJVbFkb5RaH9Jym
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE0MyBTYWx0ZWRfX4EcATCRB1trb
 5HaLptUa5Xv8o8pjoOZLkUixYHxVWnZsE0l/NuUaAaXeR5mY1ZBQpdXhK4Wpbur432gzUWCuEVO
 SVSN8/CS2ayXYdEO8BB4kpuk3hpIyYp42W/dIuyKAFUrNUdw4aZR7qMK997mEp+nLi0q/WhEPDK
 gfzwj+ksTILAOwx8Daa7lcrNpQ56W/K/LZS99L3cN9Rx3m70DPrKyIXJ67+OJjrvZfUw8XMJH5I
 0+7HTWpsBENPbJm2oe024tWzjI7GWpfYCbdFEx1P9F2aP8CBwGnhvKPBqowuDVUqtdCUqy3GiQ7
 Z1HxkOixW32YIVjkPy3aFXvchBNEDqTjnMAREo1G+SVEIoFySH6GQx58CD36k+gv0staTCkxxwu
 i1kEKtc5JFRfY5HVkToDPvZKVpqqhscJ+6yydwlQv1Yej4kunXErvhNF9b9ljWJnqbf//F4T+Hy
 losbdOjCVqlM/OJM/6Q==
X-Authority-Analysis: v=2.4 cv=ZpPd7d7G c=1 sm=1 tr=0 ts=6a984abf cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=XwBYxoxBwSosfWEfMcqm5A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=jHxIr1HyPKZ_Q5_91PL3:22
 a=JfrnYn6hAAAA:8 a=oBeIbaJldBQvbLH65vwA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: LKjsv283In2gxVf4xXq5rFa4zFRSQDh7
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11894
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=10 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0
 phishscore=0 impostorscore=10 priorityscore=1501 bulkscore=10 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020143

Iterate the writeback batch as folios rather than using
&folios[i]->page. Use ceph_folio_snap_context() for the snap context
check and folio_wait_writeback() instead of wait_on_page_writeback().

This removes one call to compound_head() and the last caller of
wait_on_page_writeback(). No functional change.

Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/ceph/addr.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index 2fd3d6d0ffa8..5e4b9da5970b 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -1660,7 +1660,7 @@ void ceph_wait_until_current_writes_complete(struct address_space *mapping,
 					     struct writeback_control *wbc,
 					     struct ceph_writeback_ctl *ceph_wbc)
 {
-	struct page *page;
+	struct folio *folio;
 	unsigned i, nr;
 
 	if (wbc->sync_mode != WB_SYNC_NONE &&
@@ -1675,10 +1675,10 @@ void ceph_wait_until_current_writes_complete(struct address_space *mapping,
 						     PAGECACHE_TAG_WRITEBACK,
 						     &ceph_wbc->fbatch))) {
 			for (i = 0; i < nr; i++) {
-				page = &ceph_wbc->fbatch.folios[i]->page;
-				if (page_snap_context(page) != ceph_wbc->snapc)
+				folio = ceph_wbc->fbatch.folios[i];
+				if (ceph_folio_snap_context(folio) != ceph_wbc->snapc)
 					continue;
-				wait_on_page_writeback(page);
+				folio_wait_writeback(folio);
 			}
 
 			folio_batch_release(&ceph_wbc->fbatch);

-- 
2.39.5

