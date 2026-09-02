Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993574AA1C0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788365511; cv=none; b=mE2pZA0pesKCYA+IhYhlW4jpVDmmwdMsjv3CTBTqowTmrWNwfPYyBqxbnLyxPU7bjKeh5yZfWHZ3RJgjFlvuq851/iM7RHq8HPojjj8TxtgRLzaywv64/mbHhz5xkbtVUZYUPZQiK2o7a51Iy+DATppTI1iBNvRmgdEgkVQBnok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788365511; c=relaxed/simple;
	bh=rZI4wY7ubss2UkuIjYXh7kkv7IuPpkYYSXBGDgUAZ0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g5EmQzNAFdIUYfrUEeoSI4d+1eYWlDrF1yvI3WzBhh96cDDo1QHqKi31n2jfVyuHHCvPZBKTss7/pnTB6GHrZro3pcY3OFmE9CnRWRclMBXk7BAbuEcwzy6EbKym38Ku8K2Bd2mRYF14ZdjZ8xLn3vASD38YnQVkmThEGa1D62E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=qH9P93jh; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=m6h8ODCr; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="qH9P93jh";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="m6h8ODCr"
Received: from pps.filterd (m0167075.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682FPagn303615
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 12:11:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=c+n4
	YzUiwE3r+eN4U/3I84mF1+YQlObNero0rB9Azq8=; b=qH9P93jhTXOiKLiyjfpQ
	oMYsc6l6yq2NIl1f+jAdjtzsnWTrStnFpMVPJAebFDCznEpDnCxY6Iaw3JLF9NxC
	ITjiPUbZGKQFOuf4CKdfPrLZDh10+Q9ciCtq7GMyRe91bAVKgbZER0HSl10rBLkZ
	+rvN6JsV9z/09vJDu6s3uhFK3iytxjpdystRy/bxsJ4DdpSe9JKysS1nD50iEfr8
	oRwevYCDNJss+wOwnISO2LZcOT2af3ubjc0M+VMrlLRStzRDFeqf8RoJC61MLnTF
	FU0Knfjeh0XykINd9EIZFerJG55+RmckaYakAu2NgV6hocQ3v+l19MrkApDfxp6V
	mA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4ge8gcms78-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:11:46 -0400 (EDT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90ce9ff466fso26302876d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 09:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788365505; x=1788970305; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c+n4YzUiwE3r+eN4U/3I84mF1+YQlObNero0rB9Azq8=;
        b=m6h8ODCrXCT9AKCflVOjZP+CUXv9FLcZvowX5AbDZoe2UrfKC/8BiCdg70Mxu0NUuz
         vANEoJnLJe85RWJC04QBsPM7w8rFP+odOVCAWFQyZOX9HmUMmHW1ZUM+E+2FueN+1vZO
         7Yes8a4lbK1aAgT2F9thIqARSJ/ndk9gwsSySmVXiSwKIplxhkUjZTToMrRuK/sR9RGR
         Wyc5AdhJggCi2gIcGTOGvVeac1GKah2ZaPNFW/SORR8deMXWQikg/WrPOGMLuhlvn0Rx
         J/fT9G+frB81pFnOqJhIxTdPy2HW/s+zRHN2I4vYPevWt+1RambTzd1wRW6VbphoQ3RD
         q14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788365505; x=1788970305;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c+n4YzUiwE3r+eN4U/3I84mF1+YQlObNero0rB9Azq8=;
        b=Mfp28+c+LZgjOkbtHM5nM9PHSP2WNK0hvN07Gg/oh7iqYd2uxHdCo/He3hjALpV0+N
         ngJD8focZrEg3dBLbgrEKH5BkMcvH/xI0ksmSjJieu6EYzCJOAq4QXF3tPAEOIn8Ku67
         Sh9wo+sLJPpPBOuZkLKQIp1pyOfyPBO2JKiyYjTzVIbiFEsnnIy1h9BN2YzzV1hkMijV
         yP3QnirQlhMJ22l4nuMFVC/6rZF0TIlAiUsq/3lWSOUFutcGIfquuLWcQqRcL7WkFmKz
         LldcN8h8XpiWXN/qtxq8STbSt3IBRJOgbitYif9NETu0oW+m4v61MBi8M+4zTVMVuIY1
         mR4Q==
X-Forwarded-Encrypted: i=1; AHgh+RoDUkHadBviU2fzRfyQWw9x9gJKwoTKGPd3uj6KSxHoqH8NOAEnV0jBf4sFG2RVe3OGjahJoQozEShqVG8=@vger.kernel.org
X-Gm-Message-State: AFuF++m8qtCXu14dxhHGPo5RjKv8MDj6WHOViJ/iZEJrSzFcRPw5rT+x
	dvro3mhVfHKMhIo/kcXHfpBGI+rdgC7IsVOenULMYsU/AELDciN8flxj7Kq6XvLzN0a4yet3WyG
	OFpZ7cYC9GD7sYMD1c1H7Cj3uT2ovQ+joZAlAfXqKZRcb8uVFNnXEr3GPa5JXHA==
X-Gm-Gg: AR+sD11hPPCcX+tgIb/yJGQBCMXk43Wuhgi/u4jvtV03JKFTVXH51ubZc8AyOWrJjwo
	biDbcPYcCnY3Ky6fjJQqDRd58aSHPXliUmfNcgpbUq17exaEu4QnNRo1Pv4dT1EFKAmy7K/ynkH
	7DLNaTawbn5R5V0uBho1bDvWZ+B4+XxaKPLWuTez2VvKpjQ3Y/LMIHwcaUbyOAZUQmv+5JXS2+w
	Pj1pika2BABPStMNuvfTOruSwdZ7ITvcd1syfaa3MXcN7kDV2FM2fI1xoX6BfnMQW/u2bV0neYB
	oqdlHIjoaerPg9xKzUVln6lwVUC6mZ/TrGvsIpRSZyFN1xQde9tOadwKtkYR8XVYjtuTqMMeIg/
	pORCs3SnRXC5ZObBXfOUdoOsB8bhf8GqBX2oYDN/So6XGArb5xodV8A==
X-Received: by 2002:a05:620a:22c6:b0:939:6dfc:a95 with SMTP id af79cd13be357-9396dfc1dc3mr25301285a.52.1788365505439;
        Wed, 02 Sep 2026 09:11:45 -0700 (PDT)
X-Received: by 2002:a05:620a:22c6:b0:939:6dfc:a95 with SMTP id af79cd13be357-9396dfc1dc3mr25293885a.52.1788365504773;
        Wed, 02 Sep 2026 09:11:44 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-193.net.columbia.edu. [128.59.178.193])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9eec7608sm21172636d6.26.2026.09.02.09.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 09:11:44 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 02 Sep 2026 12:11:31 -0400
Subject: [PATCH v5 07/10] ceph: remove page remnants from
 write_folio_nounlock()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-remove-wait-on-page-writeback-v5-7-0b512e77e75b@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788365497; l=2482;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=rZI4wY7ubss2UkuIjYXh7kkv7IuPpkYYSXBGDgUAZ0U=;
 b=dXln4uVWRrEYHWoQ8PQuT8JNc9K2DQvK2z4cdLVYxjOM7rwnX9exKiApm3gO5UszntMYf6aAB
 go6AoGDiTjqD7mdfX+V9ZyXHXwoQZf9XYkxECSGpQg7/ggG9GhaQzij
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE0MyBTYWx0ZWRfXyfKcGbrUoUoK
 AQqNBuZGiNlDkUKviDsvux/sv9cq+VswXvqS6Vk5ex5FGr/yd2OtdtHkZn2CUe7k96Y9lriI9oq
 mPo3+q+EVT5RF1qwh3aQZ9J9YF89RZD2dtyNRcxFiuM0GKm7BZTvWP5/op5Yoxzo5OMsXd4O5Xf
 EqcdpZ5pwjUbs7tXYgVY+sJsvKnl0CwCEVgBoMIlgkgTsVx4rwF0gsO1RYBEGG+rqDItfRfzFfq
 Qx4lFO8YAxIfAveGasL/T7i1Ji993zN/JgyKQlZY05xHeHNHf+D4qqkaRtbR1JZ8UC9LeGErXUg
 /BaqT3NNsswhCPgWbZ5soyH3q2/iV8YWFjmbSoJH+49fiz31fxcURPORGWhPngNmzXHFz3tntTj
 A1A7FxQwbsrjcumfi9AcDe1CJX37+fPZR7EROx4UPJoT+o+Jt7PUJ+vm8LXt4SWrEqfPNCgQtEz
 evpgvOTEaxOnXmQLZ5Q==
X-Proofpoint-ORIG-GUID: JmqUNtidTXQuX9z7c-iHF3dHq--eVART
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE0MyBTYWx0ZWRfX9JaS8Vm79okd
 61txblVyzJpCqb0jX3TOMTpyeO0t1T+CNFEIxBL3zrlhr2refPonzmWBX6A7QACb2qrmway2wlV
 o+gHjo5EAIxq+R1zCNLugYdHeFjKkuKN+iH0RVRcus+lVMs7juut
X-Authority-Analysis: v=2.4 cv=HNbz0Itv c=1 sm=1 tr=0 ts=6a984ac2 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=XwBYxoxBwSosfWEfMcqm5A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=HpS3TJQ9O3Ob1ozEcmik:22
 a=nej-XM8oC_bN5SNaFc0A:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: JmqUNtidTXQuX9z7c-iHF3dHq--eVART
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11894
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=10 suspectscore=0 bulkscore=10 priorityscore=1501
 clxscore=1015 adultscore=0 impostorscore=10 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020143

Use ceph_folio_start_fscache() and only use a struct page pointer at the
osd_req_op_extent_osd_data_pages() boundary, which requires a page
array. This removes a call to compound_head() in
ceph_set_page_fscache().

This was the last user of ceph_set_page_fscache(), so remove it.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/ceph/addr.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index b0deff481d95..8e761144e8fb 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -563,11 +563,6 @@ static void ceph_folio_start_fscache(struct folio *folio)
 	folio_start_private_2(folio); /* [DEPRECATED] */
 }
 
-static void ceph_set_page_fscache(struct page *page)
-{
-	folio_start_private_2(page_folio(page)); /* [DEPRECATED] */
-}
-
 static void ceph_folio_wait_fscache(struct folio *folio)
 {
 	folio_wait_private_2(folio); /* [DEPRECATED] */
@@ -594,10 +589,6 @@ static inline void ceph_folio_start_fscache(struct folio *folio)
 {
 }
 
-static inline void ceph_set_page_fscache(struct page *page)
-{
-}
-
 static inline void ceph_folio_wait_fscache(struct folio *folio)
 {
 }
@@ -748,7 +739,7 @@ static u64 get_writepages_data_length(struct inode *inode,
 static int write_folio_nounlock(struct folio *folio,
 		struct writeback_control *wbc)
 {
-	struct page *page = &folio->page;
+	struct page *page;
 	struct inode *inode = folio->mapping->host;
 	struct ceph_inode_info *ci = ceph_inode(inode);
 	struct ceph_fs_client *fsc = ceph_inode_to_fs_client(inode);
@@ -830,7 +821,7 @@ static int write_folio_nounlock(struct folio *folio,
 
 	folio_start_writeback(folio);
 	if (caching)
-		ceph_set_page_fscache(&folio->page);
+		ceph_folio_start_fscache(folio);
 	ceph_fscache_write_to_cache(inode, page_off, len, caching);
 
 	if (IS_ENCRYPTED(inode)) {
@@ -850,9 +841,8 @@ static int write_folio_nounlock(struct folio *folio,
 
 	/* it may be a short write due to an object boundary */
 	WARN_ON_ONCE(len > folio_size(folio));
-	osd_req_op_extent_osd_data_pages(req, 0,
-			bounce_page ? &bounce_page : &page, wlen, 0,
-			false, false);
+	page = bounce_page ? bounce_page : &folio->page;
+	osd_req_op_extent_osd_data_pages(req, 0, &page, wlen, 0, false, false);
 	doutc(cl, "%llx.%llx %llu~%llu (%llu bytes, %sencrypted)\n",
 	      ceph_vinop(inode), page_off, len, wlen,
 	      IS_ENCRYPTED(inode) ? "" : "not ");

-- 
2.39.5

