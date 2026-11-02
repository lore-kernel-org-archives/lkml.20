Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793660081;
	b=N59K8mMZzBau9YrZNfF9Ofzcm+ovMvChzzTI5LXKMUZ2Z0p5skGIsZW1J2S9GD2GY5Cu
	 hU6AwnAta8NdeFwOeUVHXiNXLOaQO3X4Xzh/qKrKidMpfVe9u73LjqvcZCDgvYm1/sgm9
	 aYJFa92uHdzCwLoLaYsFFedve7nPmtU1/sLJ1qvD/OX+37+iLH5QRKCpfihf6Vc857rG4
	 0kti03K/dN43IQWo1JjsMZtSMAJftH8T7xHayR3KnQA+4VAa+v7K7ViWFdU2gpa6fhqc8
	 7dYKm3JSCneph19VEPiJPQtxVEDL0fTRSeHDW4XIjUBZbTCMcjwsFbjiPn+ecFp50Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660081;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4WodIHx+o0x8mOdMhlt22k4lCyVvacVF3CF8lj/COxI=;
	b=w0BrVORZfdJ4+zhiwSSQxpiGGavZTvR5pg5MLglxQ784radASFYoJinJk9uAfe9Z6HLr
	 MbyYNIt+VPzHrhTiPNxu8WhoF4KCWnNRHWzCk6f1WbBW2j7wMHFsCAGSi2RGT7RetJ4XB
	 x3uEQa1/JtkCACyOPZXf8PAry8XIR7hAAi0rt2zonV9+hQmY2fLONjV2pNd+IWM1iHESa
	 8xlBB7jrN0d0QqNTCELXbGwWZtLMvxLIScFrZN6gmHi1Qgbn7w8+O/kJPskK/oNmiJx8r
	 X/EbsK3GusQtxcD53PVKRElMKJp8eWAZ05BswREgIvHsFZBVbitH48x+pO0xV+9COdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=P2o0hyyw;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=kDsr9upH;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E319606D801
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:54:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E319606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=P2o0hyyw;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=kDsr9upH
Received: from pps.filterd (m0167073.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2LYJ8a3358834
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 17:54:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=4Wod
	IHx+o0x8mOdMhlt22k4lCyVvacVF3CF8lj/COxI=; b=P2o0hyyw8W2kWy+48HDx
	MmkDx4r55EcETld/+U38+TsvF/8ZuYQxAVMYMQKHrgxHBhicoGUiqM3gkkNG2pNx
	nIkW7AjPZR0vYmT1moFXQatNztBl3G4x15DBxbJBEdvlu2MBv/XJRngIpzckrjZL
	1zrOuMlH5MkE0iW4bqhmlLzQnKeMMBXBzXP2dEhuedkoqrfiZXDDRczMCjCA7hpA
	xbvSZKuZJ1Sb6d/JewBK6U8PIKmKkJNoOnPXCSz8JAU0ouGSdPdXiJYuwgvmkAiF
	Mp9HdBMiwW0bt6zjGKl2XGFP0mceNq2eCbYZ1TtdwIrlxS0hROPdc06QXw9Zumkt
	UQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hpwfcv61x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 17:54:39 -0500 (EST)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93909014c85so705844985a.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793660079; x=1794264879; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4WodIHx+o0x8mOdMhlt22k4lCyVvacVF3CF8lj/COxI=;
        b=kDsr9upHJc2Pl37vp5mByiicqgoU+GUkEbRyxay9+AEFJ+/O2NPuTc2Tu+ob4t41mx
         rTpYl1KDjXvUEvmnQt6JNrG6GFrwrf2ShNKYTdIRdHPLfvhbpuHVmKMuZeUm9pnDtYhy
         tI/XoR1XhiMsZiJmiMLl7qiGEvnKSBrcSTaNu42fQrff1PS8OAeUCH6c71TXCCD9wqGt
         M4rlHo867qqYlO6XM0x6ZaLqKaE8xUxHKab+eJC0V7zZV+P4AUtSEIbYtJ/F90Jx7Dwi
         14GGy9BTi/bxeCmj7eY48Y228nkALjwEa3U7ZPRB6GJPtpiCPOfz28JUy0/C9/1uKC89
         HOXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793660079; x=1794264879;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4WodIHx+o0x8mOdMhlt22k4lCyVvacVF3CF8lj/COxI=;
        b=MPDm+jHirA+G63kefpwahiJgr+11GDQjfVipUsPdp1L6xDbHWy2rPd88WXFDjBKTLt
         i5zqPLESUWE1uMgyVRWnlYZDOLhV0Ocv7P7Ud1BphCAL3QgMCVqfAHVWlkd56+s4brhI
         6VCB+xZQh/dH+5p9Tu0tKDHRo5L0UJnAcE7wyVXasWQKE9bOXNSfpFj5je7IrE1z0r1A
         V3wD84ZPFDqWeZnoHn0OlVRRv1bWfhaHvxNPu31OFOV1gdBhLZYl5zjDtJO/F6nhE0qF
         kks46xl7vipY+67I8JFksK5XLZzBO8j9UNvVFHVS6B69Gi+WlzpkOndaM8lWgPs26qRP
         MltA==
X-Forwarded-Encrypted: i=1; AKwUvBwNMAMKNknUEPqTNCjefeVINpjYD8vKVF3xWHuEjY/ifNZjGN//gVLzK5OAe81G+HXy4g77N70FyJNOzHo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJh5b38mWEhATHtAxQ+Amb5/2f9fIdum6xH/WEckLRAmeubPBui
	1vvAtSewaUILkCJFLinBzO1HE25rXePyk/dgsALoUhk5bv6X4cxdPinkBQo/BuwpkhFIRQ1fFR5
	bjOAGb9t+VkyEQEn4+fWsP3v55qfXXCpijaVoHXDRMvVN1zasApu88zrdwyrOQg==
X-Gm-Gg: AYBFou11pwUxyqYdJeoTT6NEwxJYzl3Ap14guwdXZAVVEgkm1Yh0Hw/MRlUz6FpCvFH
	1Tw8enkfbUJdO8ujrxD2NccSQEZLzFGxduyEn6/cZhzDq+i6kkFvl+RkfH96Szq4aru9AXugTIO
	/PiVRHGnfgxpAwbYfz/0b1ViJ0EFRej+1lE5SmEY8UB84K/hCcu/z4MFDB+jdSYBNb+4c1bgMyX
	hCs1S4vrRWt44YVLpQrmSS+BpYiwMVZpZwryOwc0Upl7JzFhkBPFt0uyu66pzVqpNJHOCacX8cd
	nnybnUzsR4t1TDgA/eK32ux3RctpTL+I/46CfryMUz925xdM9Mh19ZlOmaC2U1vlFEI57llRnjg
	n5z3XP1XlJof7uELKnC6xo3cOYkns26z6+h0xbkGx1PmwGPnOam0HWB805KY=
X-Received: by 2002:a05:620a:2609:b0:944:dbd:8253 with SMTP id af79cd13be357-944217f72c8mr1693643585a.59.1793660079326;
        Mon, 02 Nov 2026 14:54:39 -0800 (PST)
X-Received: by 2002:a05:620a:2609:b0:944:dbd:8253 with SMTP id af79cd13be357-944217f72c8mr1693639585a.59.1793660078879;
        Mon, 02 Nov 2026 14:54:38 -0800 (PST)
Received: from [127.0.1.1] ([37.142.157.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8011csm24710529f8f.31.2026.11.02.14.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 14:54:37 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 02 Nov 2026 17:54:10 -0500
Subject: [PATCH 5/8] mm: remove find_get_page_flags()
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
Message-Id: <20261102-page-wrappers-v1-5-e7280bdb31f6@columbia.edu>
References: <20261102-page-wrappers-v1-0-e7280bdb31f6@columbia.edu>
In-Reply-To: <20261102-page-wrappers-v1-0-e7280bdb31f6@columbia.edu>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
        "Liam R. Howlett" <liam@infradead.org>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
        Joshua Hahn <joshua.hahnjy@gmail.com>,
        Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
        Ying Huang <ying.huang@linux.alibaba.com>,
        Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>,
        John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>,
        Hugh Dickins <hughd@google.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793660051; l=805;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=n+LSToSjOm7X2+ats/vE55AtTanVeZ9G8sfdj5eY+qI=;
 b=SLUwpgSXGUPwLxafx3YfP9ua2lMfAyIM7MGJHk4+fQuEir/y/Mm7DSEa79ds9kqwGshw7+/nv
 eDd9qzMfmilCmG1z+7o+2ocLmkVs8daBhezdzyb2sTGJqXn6Gm4KKDe
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA5MCBTYWx0ZWRfX0T1PFUTvLYfH
 Y9SRX43T3/OAPDBAh8DUbcdiH2VFOLy84hJxmbkYi9f2dYPgyjXt+V0gUeR1aNy27NQEqkO2AUM
 XbE1RppUgoprMe45OkiGe2oDW8XbrPcc0ZqzCZF4SDJbo8y5r8g3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA5MCBTYWx0ZWRfX673BVwnZ4Rd6
 t0yalj9XF7P7Jh0Da5tVSYr3AcPwwZMNg64NsJzyusy/C8X/8C72nLsBdo8ZBFsgHvycU0pPEHg
 CPYVg0rEvDRBjASlAJnKrkvi7T2Kx7dIjs60yrOFBFtWyazaAkjxIv/WYldevRPY66pJXgMUc/i
 YuBRriLoitLG8wdBQNotiP+DJR+57OWnfOdTsKNWE+pU9G6nt7v2N2noS9dLrjYutavdI6CiShq
 HqLad0s30e+xlKLbK2sXpriKPJ07WqtKAtRgjpnmTfxXEnmbZ6zvx5amJfb0KHUEBeLQELkT5pK
 uKxxWhrQFZk8RwM/ulutNLmM2fqFGCaVAH5lOJAlnpPe6ZcbcY1BIhSVu0VouKWHZ+VBihZd3p7
 rPkyDayUfPtNA1N1GdTh0V0Q+cY6s9Wtw7g1DwoJF7/FXuc/MtOm5eGLiFDxJ4fTdTpRQMNHEgR
 LkGdq4kPggPQOHwX3GA==
X-Authority-Analysis: v=2.4 cv=dNszC+Zb c=1 sm=1 tr=0 ts=6ae914af cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Qz3frfIdACK70Hl/8c7MJg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=jHxIr1HyPKZ_Q5_91PL3:22
 a=odCjmUfI5hfCSXoyQxQA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: U74AlDORojL367v3HKOG4Lc4TX_tBFq0
X-Proofpoint-ORIG-GUID: U74AlDORojL367v3HKOG4Lc4TX_tBFq0
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11954
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=10 phishscore=0 spamscore=0 bulkscore=10 lowpriorityscore=10
 malwarescore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020090

There are no callers left. Remove it.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 include/linux/pagemap.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 37b7786350c5..00e32f96b459 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -846,12 +846,6 @@ static inline struct page *find_get_page(struct address_space *mapping,
 	return pagecache_get_page(mapping, offset, 0, 0);
 }
 
-static inline struct page *find_get_page_flags(struct address_space *mapping,
-					pgoff_t offset, fgf_t fgp_flags)
-{
-	return pagecache_get_page(mapping, offset, fgp_flags, 0);
-}
-
 /**
  * find_lock_page - locate, pin and lock a pagecache page
  * @mapping: the address_space to search

-- 
2.39.5

