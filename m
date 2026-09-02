Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3204A64F3
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788366937; cv=none; b=KZ67ZUQblEovaW2onZSLzgXUlAjmVxUXuXDotXasINLuRn8BLYn108H8yeM/d1wY2lGvoCmjz4eborSw+I26li/cwUq0Ohnh08mjppT9pZAxGhgB4jMe717dNJYG0OhlOxByCtzeynuG5KdAuULFYwLlyQfdcNv2ocJg6klJboM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788366937; c=relaxed/simple;
	bh=b+4cr//KTHdtH9y3belFVKy6m9NQe1/PbGrSu+2Fbo4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mvocEroc1lRbWe7P1iJym1h/aQXaE6bvpVQHDXbjaUqYUd8QfU16WLcT3+Isz5wjzuC4MSbQKDN0/PhQfOYIsrmU1qOVZsErEqw0S2O6XsjzUhXUJqNoK8CvL7GhVBUFxtX8hqROpFYsgouRlzTY6cVw+kwIeVLIPWdx+OXQSuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=WHiV+VVb; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=o3mrWc5Q; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="WHiV+VVb";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="o3mrWc5Q"
Received: from pps.filterd (m0499198.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682GZIJR1056961
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 12:35:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=rGQy
	tyu+hfKlnP9ENWv2ki4cFbW5IycOKsm9AkBuG18=; b=WHiV+VVbMsaN1sFM3prF
	2Lfipm/ZvQgVmA26ooifoRsLAKxxBYY64gqpilEERsPGsFx3Q1jEsaTcuUCPaVOp
	PLXz+dp0RqaVw2xFkam2QXYVJKZn+hmP5ZYiybJqlvBvPC/O/SCePvdiz0zQZvDo
	FK3Mix6m2C2zgJPt+p2ZrXAb2jKf1g2SPvOCXrS1zeuGdJwO1VUVf3Nr1eIn6bZK
	x+h0dRBWuW7hobOQz73pTJLtykCtxf/AQbb2w7jQEOKsdlvhfe2ZVDSiCH+hzF2e
	S9Vm8hZp+3fFBCUMIx0sSPgoMsGogf1WjgSuY79SaL95XW7B9ByX5WY4A6ypqTvy
	hw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gegv7u6xs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:35:33 -0400 (EDT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90c8da50f4fso17941356d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 09:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788366933; x=1788971733; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rGQytyu+hfKlnP9ENWv2ki4cFbW5IycOKsm9AkBuG18=;
        b=o3mrWc5QS8uCQHneWoN3KQDU/PWOSp3HuD7Nk+l9A6cOFAyAeiHZ+4px4LtIPavMsE
         i05009V+7ysuMZdy3lmeVvySMU7NGhkLTO4m45lSU01qlUxnJ7MoHhcKkFPeqggrhoRn
         SPkNCCz/CByQxdYNwAE/l8CHNu7Ugro8nkv3sVph+NDh4sSVbcAvB3z3rEqjcqeVbIT8
         6A7dK0So23f3aXVlRwKBXKMrfyMkG0nIJFjIU4nDp0sQqzYjrvlyyoazoUNLIorn6x0i
         y0+cqxW+T8RGyU67CTMtkAqhBJQv6j6mG+oHrp4aHvuqT4f2FHyOQIbnYSQsw78FMEMS
         GCNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788366933; x=1788971733;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rGQytyu+hfKlnP9ENWv2ki4cFbW5IycOKsm9AkBuG18=;
        b=fdq9RsvzwI6zYmUJCs14gEUA0yVLpFDlsJeftCTZK3YvwGAnOZ8Q4gICn1ZE4WPlOk
         hS+6CVgQ4RnULkv93vJghYByZWSWPJFUWfrXWfI2RsEM9Nps1Jfd0jldZcjVKRf3Vh3F
         BxjONisQX4KfwneDXbugaTdjkO7jOONbxc2tTYLe7mWMIXuIE5sEkwXFTLAetfwwGoOx
         M/37fkzNkRb11ESKprG9GIFo0Be8Y3gEEM/nCffntVxHduxix7DbA+zwWX8Hy/O9Cfa7
         w1bGK9vpEtQf44+OduAHzxx0e+TE8cp1EcH8aLd1PICPRawZorXA84VkfuNtmaCjWVtG
         v+UQ==
X-Forwarded-Encrypted: i=1; AHgh+RpbmYvJLIrrij5RoxoadmuMQ30W1eXZnY2hShpbinQ3t+BpZqqXphbwqhiR006/jgLM2jI/IU2DsNcF/k8=@vger.kernel.org
X-Gm-Message-State: AFuF++kgrKxS2kJtVBIs/u1vUz4CKt1qeJwVZMLpAwnV9K5z3yWLLqHD
	RvoGE/3KbPsNX5xXLr41dQXEYAXixqAXx2wIJV4KQEy374CwLIBy4wQdjTmJee/g0bfydeYcRC+
	YrmgfJpzF95qFCx9OQwEBQkaWzIKh9SVLTbXpQaQ9UrZmsy1sNYWRRf2iBlvodA==
X-Gm-Gg: AR+sD13ktJ1HGT3efNj42J+se5CaG9Zjf5hS6hCJSFEgopy2FAeL6+cIJglZkqY/Y2L
	lIME5QB5hFqfuamQQLR4JZG448riKxuWdDbd/WOLII+fItPHEABEnKCpmzeBWLjFVvyTAbqPnBM
	aCJsAlzeMJVtySZlcxcQ7Svoz8ZJHA9DGYeB0GJD/OIejx+JF5Cbap/5WDAjhrJIlHcMqJzAVwU
	bItmYVlOlk0XF8QVxuf83rrnuaXGcYj9QgfRuWiISWgQY4XrmA9VGgMDLnbNCO1+HQ05PqOC+ef
	G1OfIrScPRk6LAGw+LLR5r/VABvhwPA8pk2k6PIjqwXUckJDFuAoF0EdF8n1fFtfg3+tpZRItmS
	Yfcp6vH0k1wjDoGY0ne2+dGgE8sGbyXV7ghF48ybyyfpj3e3iTcEbmA==
X-Received: by 2002:a05:620a:450f:b0:939:13a7:70f0 with SMTP id af79cd13be357-93960ccf33dmr685801785a.5.1788366933269;
        Wed, 02 Sep 2026 09:35:33 -0700 (PDT)
X-Received: by 2002:a05:620a:450f:b0:939:13a7:70f0 with SMTP id af79cd13be357-93960ccf33dmr685796985a.5.1788366932798;
        Wed, 02 Sep 2026 09:35:32 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-193.net.columbia.edu. [128.59.178.193])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9eef5067sm21805726d6.34.2026.09.02.09.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 09:35:32 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 02 Sep 2026 12:35:09 -0400
Subject: [PATCH v2 3/5] ceph: use a folio in the READ_INLINE path of
 ceph_read_iter()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-ceph-inline-folio-v2-3-6c9098112352@columbia.edu>
References: <20260902-ceph-inline-folio-v2-0-6c9098112352@columbia.edu>
In-Reply-To: <20260902-ceph-inline-folio-v2-0-6c9098112352@columbia.edu>
To: Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>,
        Viacheslav Dubeyko <slava@dubeyko.com>, Xiubo Li <xiubli@kernel.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788366929; l=2358;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=b+4cr//KTHdtH9y3belFVKy6m9NQe1/PbGrSu+2Fbo4=;
 b=Da4oX/LTHkK/aaEoVeFCIuUv6xwKj0ErZkO66RR5jrhwVLBo76PSFr8Nt+lRCyVKoSunh5Zbc
 flwmJOJQx1nCHwdg1mH7hy6hbdsSxTFXhNTaACXoSFU6CufxJYJTZAc
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-ORIG-GUID: FYUeoXPryjLsdgC-PL7P-C9-qgXfIS8r
X-Proofpoint-GUID: FYUeoXPryjLsdgC-PL7P-C9-qgXfIS8r
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE0NSBTYWx0ZWRfX190HoImZ+//R
 0+kAHRfyGYdNu2On584daCxG6TIwPptRR0Bd4cVzO75LOeDD5nmatg6L2JGEpW3dlv9BELD7sfD
 u4yAcwJ2zNPbBjpMzi5Nv5AJlhpKsYOKsU9wPJwMrcT83ec4PiDm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE0NSBTYWx0ZWRfXwpMsbaIWnsbw
 xdADwW8jWpDFqtGUt4+t/wAbM4nk7ylD5AiGFrrtVjphf0pE0K45lusdYKfbLAV/usTHJVyvXue
 26myuNoaMW40DJujPV16s8TmpC7toJBJR1p/udz307STT0SSLy128GfFrJtcCvcYZx3dIGL9KAy
 fB+weRQvpLFVEiWtnyEik3L4UFA1W/PuNG/zm33tlcqjpF8AsK7NXzIOjFOch2wMgHLbcFqtxrt
 9hIzf5hHt+Fei5dkFat+QtBYQhp7syEBQMor+PjoqV2g1lDWBde1EkFLNMmNT68g2FXRHeZzt8N
 JGjhvxsufR9pfyKVYhSP3G5PJGdxL5SJku7MTXUhGtrrfYSq/8Uz8LGPzWcrkQS88jxRxkhM+fl
 mwHeEluo+gjKck30wrJojrCBlNqkNRxE/zIOc5ODql7eih0Umhx/R6fh3wg4KmgymBFsjSvOxIb
 2jjodZW8ym+w1j+ymzA==
X-Authority-Analysis: v=2.4 cv=JcCMa0KV c=1 sm=1 tr=0 ts=6a985055 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=XwBYxoxBwSosfWEfMcqm5A==:17
 a=lYjiPEibtFqA77pR:21 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10
 a=A0y_DWxS2BwA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22
 a=BpGzv1V74M3SfeTrGa8v:22 a=lJkK8zq6xVIZ8jstRnwA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11894
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=10 spamscore=0 suspectscore=0 adultscore=0 bulkscore=10
 malwarescore=0 clxscore=1015 phishscore=0 lowpriorityscore=10
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020145

The inline data is read into a scratch buffer that never enters the page
cache, so allocate it with folio_alloc() instead of
__page_cache_alloc(). This drops the cpuset page spreading that
__page_cache_alloc() applies on NUMA systems, which only makes sense for
page cache pages. The temporary buffer here is better off node local.

The mismatched __free_page()/__free_pages() pair both become
folio_put(). The __ceph_do_getattr() locked page plumbing will be
converted in a later patch, so pass &folio->page for now.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/ceph/file.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/fs/ceph/file.c b/fs/ceph/file.c
index d5606456dbd5..f0e77a1ab4d1 100644
--- a/fs/ceph/file.c
+++ b/fs/ceph/file.c
@@ -2247,21 +2247,22 @@ static ssize_t ceph_read_iter(struct kiocb *iocb, struct iov_iter *to)
 
 	if (retry_op > HAVE_RETRIED && ret >= 0) {
 		int statret;
-		struct page *page = NULL;
+		struct folio *folio = NULL;
 		loff_t i_size;
 		int mask = CEPH_STAT_CAP_SIZE;
 		if (retry_op == READ_INLINE) {
-			page = __page_cache_alloc(GFP_KERNEL);
-			if (!page)
+			folio = folio_alloc(GFP_KERNEL, 0);
+			if (!folio)
 				return -ENOMEM;
 
 			mask = CEPH_STAT_CAP_INLINE_DATA;
 		}
 
-		statret = __ceph_do_getattr(inode, page, mask, !!page);
+		statret = __ceph_do_getattr(inode, folio ? &folio->page : NULL,
+					    mask, !!folio);
 		if (statret < 0) {
-			if (page)
-				__free_page(page);
+			if (folio)
+				folio_put(folio);
 			if (statret == -ENODATA) {
 				BUG_ON(retry_op != READ_INLINE);
 				goto again;
@@ -2278,8 +2279,8 @@ static ssize_t ceph_read_iter(struct kiocb *iocb, struct iov_iter *to)
 						   iocb->ki_pos + len);
 				end = min_t(loff_t, end, PAGE_SIZE);
 				if (statret < end)
-					zero_user_segment(page, statret, end);
-				ret = copy_page_to_iter(page,
+					folio_zero_segment(folio, statret, end);
+				ret = copy_folio_to_iter(folio,
 						iocb->ki_pos & ~PAGE_MASK,
 						end - iocb->ki_pos, to);
 				iocb->ki_pos += ret;
@@ -2292,7 +2293,7 @@ static ssize_t ceph_read_iter(struct kiocb *iocb, struct iov_iter *to)
 				iocb->ki_pos += ret;
 				read += ret;
 			}
-			__free_pages(page, 0);
+			folio_put(folio);
 			return read;
 		}
 

-- 
2.39.5

