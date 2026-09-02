Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4012C4ACC7D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788366945; cv=none; b=OhP4mOpVaJqyPvPCZjzGzd7rNXS8xU9bGze9uExSRPh/yE86ZVEifyvtkLSZ0W8QZ2lNc4EDkthxZk/TFcGCKnFiqLj72b2DFkHUmqeTifz9GlrwUrZcu6jaeyrExBVeMevtG5v5dEBcPanm6fu8gLk5u3kDsgh8jrX6GRbXX4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788366945; c=relaxed/simple;
	bh=YdiGCRpQjCWzo2cMclgu7t5u4t6xpOWcqmE9OMihhuY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MCO3JJllsNH/UiN4oQ+oG9972W+9O3OVjZY5oGTkjhoMcnHtxOihISsBB4B6yXg5jU9Tr5ctqnH3bGKn1L4SI1FURW8FEwfhm+dUMfvBf1ntUnOIMuwltKJbWDLBIQBzRtQu5RgAbKqi6NFxixID527+MAZwUwBQc6BitHYCwxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=uKLdfK+f; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=btFjwIiP; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="uKLdfK+f";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="btFjwIiP"
Received: from pps.filterd (m0499198.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682GYuTn1055209
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 12:35:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=YHN1
	7pp/W44dKH+wY/7x1N+HJAhV2v9M+ycLDIQQfM0=; b=uKLdfK+fFvzpz4czc7Df
	QFm7FRvb2ZQs3OZdLbOC70gHvYfzFv4M3r5Q4OQjAB4+2wb3Gia5E8udYRN5wcuP
	MZ0icg1/LerjhALhi4xhyGq8Pi4uLnPxo/txtxykqVkGh1QFQn3zBCU02gsvehbM
	8eHjE1uGWSEgK3lM4t6jFmfATShPmwE8hyiLEfv5IXMVidVeiSRxfm4SlIToKU5U
	OmWmN+2O6Sj5uHugyS7c9x2TOMoTbDuvWNrMBmltOTXcfayGLaJwTXlI2FEk+iqz
	sivpUFkfKSXw4FkmEHtlk175v8xHp3Egnc6MtloX5nly1PYtQ8UpQcRPS8ZEzQIN
	fQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gegv7u705-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:35:41 -0400 (EDT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90cd16a0bc1so36003466d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 09:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788366941; x=1788971741; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YHN17pp/W44dKH+wY/7x1N+HJAhV2v9M+ycLDIQQfM0=;
        b=btFjwIiPibZ851UPm4geoCVRxDJXyXeYAYarirsxarXgWkvTOH/wlqlDRtGPQO2Yv3
         eb4XbA9IV9nuZhahVbncNhd6sgiAGTTGeYH0M683XwUIgOqwqLsz7fugkgoP/bDg/C/g
         xDNnGaB9riKXDLHo7J0VoI9z214gkmAa33h0gyxf0ZaaaZaqj4dDJb9PFBHTLPIKENkt
         4N1DzAH5f9qLIssCNfkUikSzb4r1Tqm6YvpVf5bfJe22BXb2i4JrvNPIrVD8lk+yiyF2
         7QvdYjn32aUm52POb2Kx4Ru1XiR0hqx29YAPkSicOXwrX4jSWTzE0LrkDH3iEGxVUiS1
         VoMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788366941; x=1788971741;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YHN17pp/W44dKH+wY/7x1N+HJAhV2v9M+ycLDIQQfM0=;
        b=It/xnNTRq4xsD9b5MoeyBUqfnE+4Ztz2nfCKJ2Da/1G1iNqiEaVywjbOk3EZDVdH5B
         m0z92JrMyXltw8OHJskQ+yhuQsSpbMd+WmXXR6wfuJ++jWN+0s0lze3kO2Wv9kINltfe
         CcLDEuHn4SREt9+00qZ15/ENPNnHaKAeUuN1PU09DilRz7G6GOXgyI0m+3rtJRMrcoFL
         4rjp0aYdLW5uWzSAU6DToDx0dHwFECyXZn8+X5Yi0pqy7yrb/qrFPYDNoc9rdCp+BTX3
         daS8Tf8VDnECaQ14Y+spZrvy8BFM9B2FebfQVKvXaAel9H6+oYQZnP8/v6tnWm70oBp3
         n9ww==
X-Forwarded-Encrypted: i=1; AKwUvByKOiLVsVKJxqL6C280PRGdBY2i+yMEDMZJn9zQLeQcV5JDqZNiSy+Nw3DxzJqYyHm+wuzuyyIwGO4yXA4=@vger.kernel.org
X-Gm-Message-State: AFuF++limm7KzQhCZg9WNgwuS19y49fnYyc4q/HK76F4t6rqu6BcMfmw
	lzBoh07zxdIg4zrVEZyHerc/Mzf15XGZ0PiKe465DbSvP/XCI7hsHjfWZ4yBSNz3QKvLIT5BZoy
	VWAwcwGeH+FUPjyPzrA2/+al7NStWRaOr33EcuSHTP4fiquIAqQYGyxGK1YCxsA==
X-Gm-Gg: AYBFou396QkmhnMg56cahDmDziD7LLMv2mZch1kXIjN/nQUJdWaXnpcOL5CgUyIhDwr
	C7oIX0mDHR4f5icJUC4PQI0I81H7qmGTNPzk4dcUpYug5d96rPbftTsfe63jhNrGcj5kStjUvf7
	LwvFvVarke/jPP7YCGFUDZ0EtYrlMPUUd2IAhFU1rkgSF2BkNzvMIWpXfhEmrPHJ922V5yGmVkl
	Z5cukz64kLkEtwephOzggL8WYlWXyjW8hQkCgh5pY4S5PtEB2Ntmd7C4THDDhefvq05TadLLT3O
	WeAH9NJhFVbhDgq3C1EuTwV/fnXz7HZHXSKZ2LqtdZA/EALuHVOyD1O0URPdtEvSXqS9L1UAACh
	kyabd0DxY6XGlS/+tvn4kY4BLH67tMJtcxIvujKiBU6vYks4u3oRPKw==
X-Received: by 2002:a05:6214:e42:b0:8e5:d7d1:7bf with SMTP id 6a1803df08f44-90ebafc405fmr87716126d6.4.1788366936207;
        Wed, 02 Sep 2026 09:35:36 -0700 (PDT)
X-Received: by 2002:a05:6214:e42:b0:8e5:d7d1:7bf with SMTP id 6a1803df08f44-90ebafc405fmr87709226d6.4.1788366931111;
        Wed, 02 Sep 2026 09:35:31 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-193.net.columbia.edu. [128.59.178.193])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9eef5067sm21805726d6.34.2026.09.02.09.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 09:35:30 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 02 Sep 2026 12:35:07 -0400
Subject: [PATCH v2 1/5] ceph: use a folio in ceph_get_caps()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-ceph-inline-folio-v2-1-6c9098112352@columbia.edu>
References: <20260902-ceph-inline-folio-v2-0-6c9098112352@columbia.edu>
In-Reply-To: <20260902-ceph-inline-folio-v2-0-6c9098112352@columbia.edu>
To: Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>,
        Viacheslav Dubeyko <slava@dubeyko.com>, Xiubo Li <xiubli@kernel.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788366929; l=1061;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=YdiGCRpQjCWzo2cMclgu7t5u4t6xpOWcqmE9OMihhuY=;
 b=xXUo6K6vjQmwvcVP9oNSV3jgm9ylsc5ppGYvIc1vfHdt/9uPtM90FKGEyH3bGm8KAyHqdGab/
 7M2KHVwUmmUBybzEVuskqnFCzYRH03yNoV7n3MItgTahshJHbmiA1S3
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-ORIG-GUID: yQFsL4krGIrEpl9tmqbsmquyZJBj4Dt5
X-Proofpoint-GUID: yQFsL4krGIrEpl9tmqbsmquyZJBj4Dt5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE0NSBTYWx0ZWRfX9b0NAHTvyqUy
 AsE8wFMo3aXbpKfNWF3r+bRKqt90sZgPuOXtjyNTUP2H3zsooYmCk/vRwodvlurqP8erOr2+2ie
 i51ZvHP0OnZHAolwWAlbd9KE0Vc7BqnRoEnqQ1p0EdW83XuF837m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE0NSBTYWx0ZWRfX0Z7nDl17sMCy
 kx2Yb1N4mrJWNfEwXOQ7ndNfGFY1IopkY4XhWxkkZvUMKi68xdvJAPCHb9ovlC6liG8CrdU9vQY
 /+LI+ykol3ZyM3KudZ0rWvtyPvtem5NjVKBHNd1ZXua7/xIVXBmYJVPv5sOY6WG5GHPdfz0EjD8
 3qBK+ZIV35Pm8FVLwUpisJmr3v8ZyUIktiucxBA6z3ANW19zwEoushIKEXuO83QVZiKhoOYTJCO
 JL6moJXWyWlRxzpKYDT937tlztq2ZIYCRxQ139mPh/rPPINZKsKlDaPPEPRGRzygPu8Mbh9Yr0Y
 +WSg8ieWWBkwt9s4CgYmFrRMyyKnMF6n1kch/CgqIqaGTiB/ppWgmHmhspgK3/v8a4Z3uUHbQAC
 uIZ743gOJx46YOmHAYB/2E9LZsqzTif7M7zYHrU+rM6L2m4Km3xJz6v4iGIXR45NpLauosrp3GN
 sf0n1SCDK0eG9KbM6AA==
X-Authority-Analysis: v=2.4 cv=JcCMa0KV c=1 sm=1 tr=0 ts=6a98505d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=XwBYxoxBwSosfWEfMcqm5A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=BpGzv1V74M3SfeTrGa8v:22
 a=nQxxII3xdzKgKN-BukEA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11894
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=10 spamscore=0 suspectscore=0 adultscore=0 bulkscore=10
 malwarescore=0 clxscore=1015 phishscore=0 lowpriorityscore=10
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020145

Convert the inline data page cache check to filemap_get_folio(), which
returns an ERR_PTR instead of NULL when no folio is present. Saves two
calls to compound_head().

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/ceph/caps.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/ceph/caps.c b/fs/ceph/caps.c
index 1847badddd87..5be858df0a4d 100644
--- a/fs/ceph/caps.c
+++ b/fs/ceph/caps.c
@@ -3202,12 +3202,12 @@ int __ceph_get_caps(struct inode *inode, struct ceph_file_info *fi, int need,
 		    ceph_has_inline_data(ci) &&
 		    (_got & (CEPH_CAP_FILE_CACHE|CEPH_CAP_FILE_LAZYIO)) &&
 		    i_size_read(inode) > 0) {
-			struct page *page =
-				find_get_page(inode->i_mapping, 0);
-			if (page) {
-				bool uptodate = PageUptodate(page);
+			struct folio *folio =
+				filemap_get_folio(inode->i_mapping, 0);
+			if (!IS_ERR(folio)) {
+				bool uptodate = folio_test_uptodate(folio);
 
-				put_page(page);
+				folio_put(folio);
 				if (uptodate)
 					break;
 			}

-- 
2.39.5

