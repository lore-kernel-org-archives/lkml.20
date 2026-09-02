Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C0D4AC16A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788366941; cv=none; b=kX5OFlOUJrLnzE4ZeUS0vxK0XirUcy48GajyIgbvTuKIui3uAvzxPDkEBeOTpu02jQUcFEhPO3+M+IDOcMv5SV0iJptx5tViV2wKEq/K/Q3fYK351u9AFeUIRNBW0zPJ/aTUTeCK7lNqLi0bCYC9lxlRLCnOSR/1KrHu552PkG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788366941; c=relaxed/simple;
	bh=hmGBWo2Ja+1DmxMvk/ECCTpEyX+z1ZO+8x9wdCH+pIA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b8YOqp0MyqSw3NmRkRhLX0/wmiWCaYix4fS/sMIDpL8tNLa0CYVV+r+rQfbywXTLl8MV2DgUPSxq0MUtIE5b/s7z2xBWJXS6qRApxeoLYlLNp9Zerwt9x13MH7fABRXSxWM3drkKlYMANSozc9cEI+f2HxfgBAryViUqx2dzV2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=NYkDS3BN; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=PJ0kT9QX; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="NYkDS3BN";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="PJ0kT9QX"
Received: from pps.filterd (m0167076.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682GWYSs673668
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 12:35:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=hlDz
	w90ku8YTgCq315wh1d+QvwDRl1pfx6TsW0Gdp+c=; b=NYkDS3BND4COhPp7LeDx
	+wVebx2RPxEBF0tdMLSSGhymNAZ9g1gX7q8ScoJ25ynUFHhWs+P/pHTkJ2ttaWJN
	ttRL9hveEPjjdTAkbpmPLKGEp4zXDml5A88c4ZSFh3zh1Kj6Ml1j0SaQTiiBdM44
	TQiIKUrf6imZMs6NccjtdJOvAJImZrGIH7k2YUwcacuwWDSDi/N88VisucEhOG6z
	n4PzwpGcIqchaYzPLEs9xQZ+RJAWASRIrj0F1shZQ18PT6PXxsT1uEAlFEp7Cykd
	H5vxTUIwbr/ECvmfYfgqDm/DhP5d5erQJpg9mBfn02on9QYatStnt8VS1yb5n02i
	Ew==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4ge835n729-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:35:37 -0400 (EDT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90ce9ff466fso26780876d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 09:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788366937; x=1788971737; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hlDzw90ku8YTgCq315wh1d+QvwDRl1pfx6TsW0Gdp+c=;
        b=PJ0kT9QXD2Yxs5o/icqBWSZ/D8Bazk+rYmPdk0nZIfHlSOIzNO/c17F50iB1eNQ1Uw
         u2AaKvTnQtIG5SJm4zHUces1M0MXk8w6ZuoXWNAQYDHBM0SESIcqdtfD7Frva075P9mF
         7UuKdNMXiBcYrVEinJtBN50l2QaAZTuwG8IJZW08mjzbxGy0NNFfnT7UqweE2dvpSf8w
         pcXZB6RWlzgrxDRlGt1wynmk6CqdS9YQpfNdpMdoW9ezKaRfKPr9xcDaSr3XruFHCYdW
         wnJB0WoeQrhqBSaL+4kluDkPvD1ylGAGKAqz7lJULVulV+487kHNq57MYJR5ypH1x3m9
         pJxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788366937; x=1788971737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hlDzw90ku8YTgCq315wh1d+QvwDRl1pfx6TsW0Gdp+c=;
        b=Z5mCX0uch/47y7mdxwtapPqZfryDoN5DersxXJXkfuCuKfMgh82Re/wOif8I5k8Xs2
         oICyUPJ1H3tT3HjCPqFvCOgZX4rHeT9/o64jFMTgt9F+w0Qe/dLOMMjX+I8p+mhLv+93
         2h6GOOziryiDcrcXpZ2n67yxRfWQrQWFI7vU9PwT1u+iOcPEaw2v0dpfVrrjxFfjWM4G
         oGk2XNuwZ0SrhjG0ud8pPTr+R7fafmk2wDRl6Ssp35CuRiTNy4z5JoX13yhYL4jDWo9R
         ff3x4sDN712AwnyqbO22xQJFgu1B1T7XeqNDaNAugEYa7VtQQ9qNZaK75a9rzOzvXcAw
         kwKg==
X-Forwarded-Encrypted: i=1; AKwUvByaawefJamLOeERxJd7l+chYxslgXHh5hIozeOcNckD8rRuZT4oSAPChOLEghLxwAimxRjXelsaAUruznU=@vger.kernel.org
X-Gm-Message-State: AFuF++mehcpxHf7wR8uMVZy3wxfA52gEOzO5Rky938FwgYWsWDnRKcdG
	YDo+YRF23agpmrzDdyhax7HiOgVWNu8hZ5QtZUmldMrjaHBkueToR07W2E6NO+nXgPwlhLWTKJt
	6Bwc/QdbVslb5l64ta9WXTfh6lFA3Bp7TZwtnsxQz5uRFd4Yt/4s5TTJyvOA0Bw==
X-Gm-Gg: AYBFou1EX2YQz0vsJnHdl6E8jEyQVyDWt4XQ6bJcQZM/3FcXxhMie3HkfFNMYXflAP5
	l/kdcQicrAGQITT/hNYy6RvN/qyOBK4lrREqP4AHK0XYCTRaIzjCNsn3hDPX32lWL7gM1Wj/Y+Q
	ha6wzqLZ5KKjCU0Q+sGmbbiHfGiRRoZYMJVMqF5It/ehiKvjQZIkA+4dolSCQltnuqm7VpmzQjT
	DRlFkUFl2slCOufTut1VhlcrkbkhWDtwZTrisF5gM29WM6N3O/nsCjIKupMRSQ4B23DSYr17Cok
	iIFes89NgZMMcNq2DMaDnOnPIi6IDcb6ZYipa2pPmadm76ePoVWk5MMelKuFif1CDQhiO9UOYOu
	vWXQRa2JJtMAxuBCyNiizdb2ODQd6QDsNuj38Qqb8RaOmRdM9pguUXg==
X-Received: by 2002:a05:6214:622:b0:90c:e89f:14b7 with SMTP id 6a1803df08f44-90eca405209mr77459566d6.20.1788366932303;
        Wed, 02 Sep 2026 09:35:32 -0700 (PDT)
X-Received: by 2002:a05:6214:622:b0:90c:e89f:14b7 with SMTP id 6a1803df08f44-90eca405209mr77458956d6.20.1788366931709;
        Wed, 02 Sep 2026 09:35:31 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-193.net.columbia.edu. [128.59.178.193])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9eef5067sm21805726d6.34.2026.09.02.09.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 09:35:31 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 02 Sep 2026 12:35:08 -0400
Subject: [PATCH v2 2/5] ceph: use a folio in the inline read branch of
 ceph_filemap_fault()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-ceph-inline-folio-v2-2-6c9098112352@columbia.edu>
References: <20260902-ceph-inline-folio-v2-0-6c9098112352@columbia.edu>
In-Reply-To: <20260902-ceph-inline-folio-v2-0-6c9098112352@columbia.edu>
To: Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>,
        Viacheslav Dubeyko <slava@dubeyko.com>, Xiubo Li <xiubli@kernel.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788366929; l=1873;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=hmGBWo2Ja+1DmxMvk/ECCTpEyX+z1ZO+8x9wdCH+pIA=;
 b=5NOyPbPoxQuFMeFnDAhslokb5nNj3iLIswNGDamjAWF4PPEuAudhp1mlVAuLENAKMOSj4KUQy
 qHWWVgO48RbCIP8iii0LAVmhrmo+44w1vfT6Hl7FufNVZ/mMqgR0wM6
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE0NSBTYWx0ZWRfX6gSRkoSiNn7H
 zsDyzfrehDtW3idKnQHFRi/1IIlny/93mZyBdaautwEPSH1droEEmA0vWg4Tf9BeblENwV7/xX7
 5LHxAzUG35kpc43jmcqE8aHQN9msIZ9lrN5VC1DAnz/MOkGe0VKP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE0NSBTYWx0ZWRfXx4lSyrI15A4P
 E/2G3SY5y9QqVl/t1rWkxXh0rDSzB/jtaT9HH0R2sO3WUK5L9t736c34XIn/uu2NoDk9SA2LmQq
 WgatHg/Xh3QQa6pNqZhYkbfPFrKs/FABbC/lrdPNfCFHqEU5Ku+cpsKay6tRZIWpuzblRLpjgzU
 2zKBpF/+fJvPa4uiOgx2z/rVf2HOoSzJPI+WhjRMnrs5ejdtw2z3NPZSU+8ZdiIQavIBv+wMOU1
 c+VcA1J5Y+JUkuGwCHUW2zmupvIhGujYL0blToBYidR2OXds0+6xZCB1/lO99pJXerxxzQ3ZrCJ
 bqfXwo9g71Gd++sU4CecHlWvJENFQ/AAVq+I7dgzjOUDvP1Xb5LKtls+Z1q32V8mGrQnwIb3B5x
 g1W4MLeuo0Cm8SqZpldgwiDerNoW3TC1O4SIMDi/1VazfNrGV0hlIi4R5G7H5Sj5HWZ3rGF+MQ/
 LJXpJeEaw/ik5WhcLwg==
X-Authority-Analysis: v=2.4 cv=H+LrBeYi c=1 sm=1 tr=0 ts=6a985059 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=XwBYxoxBwSosfWEfMcqm5A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=Qm0qsxP7aFY2tkT6R2MF:22
 a=Z6_CKfthfhLzab0EPLcA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: grLmzc5iF_rX552ZGg-8ehyDNWKVlRbC
X-Proofpoint-GUID: grLmzc5iF_rX552ZGg-8ehyDNWKVlRbC
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11894
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=10 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=10 bulkscore=10 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020145

Convert find_or_create_page() to __filemap_get_folio(), keeping the
existing GFP constraint. Saves three calls to compound_head().

The __ceph_do_getattr() locked page plumbing is converted separately,
so pass &folio->page for now.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/ceph/addr.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index f8844390f88d..16681133cf17 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -2047,29 +2047,30 @@ static vm_fault_t ceph_filemap_fault(struct vm_fault *vmf)
 		ret = VM_FAULT_SIGBUS;
 	} else {
 		struct address_space *mapping = inode->i_mapping;
-		struct page *page;
+		struct folio *folio;
 
 		filemap_invalidate_lock_shared(mapping);
-		page = find_or_create_page(mapping, 0,
+		folio = __filemap_get_folio(mapping, 0,
+				FGP_LOCK | FGP_ACCESSED | FGP_CREAT,
 				mapping_gfp_constraint(mapping, ~__GFP_FS));
-		if (!page) {
+		if (IS_ERR(folio)) {
 			ret = VM_FAULT_OOM;
 			goto out_inline;
 		}
-		err = __ceph_do_getattr(inode, page,
+		err = __ceph_do_getattr(inode, &folio->page,
 					 CEPH_STAT_CAP_INLINE_DATA, true);
 		if (err < 0 || off >= i_size_read(inode)) {
-			unlock_page(page);
-			put_page(page);
+			folio_unlock(folio);
+			folio_put(folio);
 			ret = vmf_error(err);
 			goto out_inline;
 		}
-		if (err < PAGE_SIZE)
-			zero_user_segment(page, err, PAGE_SIZE);
+		if (err < folio_size(folio))
+			folio_zero_segment(folio, err, folio_size(folio));
 		else
-			flush_dcache_page(page);
-		SetPageUptodate(page);
-		vmf->page = page;
+			flush_dcache_folio(folio);
+		folio_mark_uptodate(folio);
+		vmf->page = folio_page(folio, 0);
 		ret = VM_FAULT_MAJOR | VM_FAULT_LOCKED;
 out_inline:
 		filemap_invalidate_unlock_shared(mapping);

-- 
2.39.5

