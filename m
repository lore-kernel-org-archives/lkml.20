Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318063BED0C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 12:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788267574; cv=none; b=DPR2oCCmtt9+JNv13AjfTDc42TC9H2+xpsuvgUgyA2J2ahOMidNHCZC3Fu+Bjl1TTZnIwMq9AIc4yEywq34gctihp7HRghhz75bGpkvxfDYSlWjb9T6lK6wkWmY4l6odpbHwrDuxIl+EEkSve+ct2BPD/Pyk3MzHZijANQVjLoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788267574; c=relaxed/simple;
	bh=sL+jb7+lqh12+chLIhZYYQGjMOmxWpBF3iD107xUVHU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UX/jcMZNU7BCkhZXclXXs/CYbtQKNJZnIx1jvdyHmt1TaytZjRzgFsXwywdK7G2ylhODSgXuqUoRI/WKCBSyfvS8ery7CxtX8Gdgqi7fKKAixjLo++6TOdRDyIMLG4RWPH6eHtWlM0UO29hbPU/VsvtooVkUY9edBW198w02m6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=JaMguPbw; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=kzc9J196; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="JaMguPbw";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="kzc9J196"
Received: from pps.filterd (m0167076.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681CkiCu1200968
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 08:59:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=7WZm
	HAi6QqDEwX5KYkSzxenVKPjdYPs1k6x2NVtDC4o=; b=JaMguPbwMV1th5bp6TMT
	vuhB0KqmvDZ9dm5bVcT+26M7s1Pg/rcbUNJJhBsF5DcmdSGONwZ6dFJzEL41RS/e
	NWTngHjphi5Qg4LXe+ZoNfRjoeTNVnFESz7WnMNUNHp5zMovxAHWfcv6SuYaP9tK
	AKV/2L1Btpw3eNer9DagkVWgKOD048GI5SUJ5Pyl7V9i6G7QfPegjlLTIgZdCqjc
	tb/FS0YhnA/+mAcC15tp7wCF2L+Kt5judT2Y6aoi0bNI5oaUXdz3ABBNL4NGwV3c
	WK1qNpriJlF2AUUSJM5vA8R4TMZFHvHyeXPOyMnfaHv2U/TUk6XIB/ueos+vgxOx
	fw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gdy0u01uk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:59:30 -0400 (EDT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51a8b0a08d2so62547411cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 05:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788267570; x=1788872370; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7WZmHAi6QqDEwX5KYkSzxenVKPjdYPs1k6x2NVtDC4o=;
        b=kzc9J196+sFtYwbE2pyS0Nj63GCy4D18gkC4RAe7rgyGSQhvaPJu+/rd0pAc8xBktR
         YWLaW4kv+DJ51ejUx3jtRsYK7pQql4DIVY+ODcEDSJAVLynp3GGcZDYv1SM/f419wbOh
         WA9NBH8s5UIXq0s8jmubrvpfvWDY+jm/DQkoUc5f8xCGBeSRyaNThuaZ4CRd7LLTtg3h
         X7sOb6gsAl7gBK7i7uLekhg+9GeLNhDKfUdhDf41JMuABUbPRdPU48t02wTJsKcoCudI
         SCfXJtWPZrOQAT6m9T6r6nhxvLO9e/XCVkDhM+vOveZkVV6/GFw3G1eHNzT8DcVNU9/x
         HrkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788267570; x=1788872370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7WZmHAi6QqDEwX5KYkSzxenVKPjdYPs1k6x2NVtDC4o=;
        b=RfpCIv/n7mFW+Lc2KFCiVNlF4tAB0looyGzKY4LaGhwI6+2I5cmZLPUEJiAuJWne6j
         fv+RIjYZtx+FIrErOUNL6kGN7viXYUH6T7TVDaohvaFlgnyhKWYIQk91rGuXOBgO2O0W
         /v3kGnSgIYtn+6VfkV7jezRCVPiE82imoc5UGcidYOyrzjJ00eIIsmNBTKS07p9aijDv
         bfZVuOREpAdJQJWaOQeob30IAgoRVYSWWH1ugNfqnuoBSQ8cN2LYKxP60tdk5+YxTw5t
         xzNC1koxCycF2J7IKF83bGc6nJ1HmG2CMiBVImJMcsb/4YvcbgOjzaAAsMVQ3R4ZIiK/
         gmuA==
X-Forwarded-Encrypted: i=1; AHgh+RoCHjNtp19Qlz4bt4zs3S0qT7nP0qd9SOOK/Pqwqlw97ZfpjVsNDRZHeVFOmcPQwpu+DvKX+9+K7QMnk2Y=@vger.kernel.org
X-Gm-Message-State: AFuF++nuVUxSeJaY0t9oZNpWsNWnIHM2oXhESuQPXgytjdStfwXoJBK2
	BWw+kiAkcTM3iJw8Edr8thoU3idAb/XevXwaPhBOVNBkYpUxSgAJer1eP0qwdrdBQ59PT1+ri0i
	3mjRSOx1BRQ7cPhrADBoccFuS4ByNa8rXxacKSy6zl/yoE4f6N5sTNnzYXdHANx4KTKD4oKKD4e
	4=
X-Gm-Gg: AR+sD1354wBWLPcrSEJHWQaIRP/jPaMURwALU866B66o4rvVKjXuoquyOb7yceFlgSt
	dQseqxvj5jVeqw4sASmzjIOKUOAfJGo/J7o/xulADBu+qqk4NGktOXmQsISuonDTxaSGdZf1GIL
	YKzSo1GDSVuCOSixgaM9NARNI4Ed4lolNR0yh3gjrroYOEh3kocXlgyaacH1mEtdSplFh01+K8s
	a/Gm7/PXMHhmHLyX4QiZX3MMh5s1d07xkTlcdS4sux95XMAyxRXzvXFdHXgchTOJ+Ad7ua0F/XY
	q0q41d1eAbIQYvf/M8wZz/JD59wloaPSD/NwenTC7XR4NeC0WEFjgP0UFCxVYETGnZ2DqK4LyI0
	Li/Z4bHTMbr39gjHdBiJ8DzVF1dP8Joz5+xcL1eUWX8iAy5llmCQ=
X-Received: by 2002:a05:622a:260f:b0:52d:f12c:59ba with SMTP id d75a77b69052e-53021d43dfbmr104265911cf.33.1788267570276;
        Tue, 01 Sep 2026 05:59:30 -0700 (PDT)
X-Received: by 2002:a05:622a:260f:b0:52d:f12c:59ba with SMTP id d75a77b69052e-53021d43dfbmr104264311cf.33.1788267568677;
        Tue, 01 Sep 2026 05:59:28 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52fbe830222sm96194331cf.20.2026.09.01.05.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 05:59:28 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 01 Sep 2026 08:59:20 -0400
Subject: [PATCH 2/2] mm: remove unused totalram_pages_inc() and
 totalram_pages_dec()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-mm-remove-unused-helpers-v1-2-f092d086f7dc@columbia.edu>
References: <20260901-mm-remove-unused-helpers-v1-0-f092d086f7dc@columbia.edu>
In-Reply-To: <20260901-mm-remove-unused-helpers-v1-0-f092d086f7dc@columbia.edu>
To: Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
        "Liam R. Howlett" <liam@infradead.org>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788267565; l=1028;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=sL+jb7+lqh12+chLIhZYYQGjMOmxWpBF3iD107xUVHU=;
 b=xsOLRMv+pMGfbkOAUjgN8bpn4nfoA0liC93toFzefiHg1Tkzckd38swBwwetPdujEEXSOsQf5
 TROxiPprUILBzVu1edVu3JpWx2kw6hcVN3DU+Ikgig9jewCJJMe/ypD
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDExNSBTYWx0ZWRfX6XzMefjAwPkz
 27EhExHG3Mx1i3CU+VVeNMmU35WCjEchNQULhduSnjzK+9iaDpP1EF5Kpeyz/SSxXZbFGdqtYdh
 hfkzNN2anaFNs2lwIB0YyZ28nbYMv2stMEw5WHll3fdFnwRF96l6
X-Proofpoint-GUID: 6fR9-i4LI6rIKFYQjkEJTWaSfg3P32Ng
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDExNSBTYWx0ZWRfX4gMGa8+Gmd7F
 7V4as2dkNtYtopoBo0McHfJXvXJT7ivFtgfchYMU2bNZUwMmH8HpSS0pk15QVoVQNYoMgT56yQb
 S4j/hZvXIF+MjaFojhwUWcrTWhtw3rJsY7YFZUpcbPE9lsot4YMXf/E5hIfLHQIuVMqXas29iuW
 RQuOY7AlYYLEFOTN5V2tsvDaAuP1EbKqtkGSEUeOuy+1PKZeS8b+CXcYcmQM83sW5AshaW9VSDv
 4U6NZ+GgV5k/rpGb61gpe71+2pCgqdV+VOnT0m1HfYrTlU53VRUeMmkXOeW5FfNGMYRR1HxwbKj
 Jan5l/HEtGfToFZWzRf0Js0seplNMvojeSWRIOb3HD60tIim2ftVrD70qYZcY9o+JPetee3XVlq
 Vv75F6caagU+7ODmTSjXMDBGS7b2Nm4/zmrE/D5A26YKl3Rh392AEMaPnZ9RZxMbwnCfcwIuZhA
 ZyrxFqVi93XdxDylSTg==
X-Authority-Analysis: v=2.4 cv=HohG3UTS c=1 sm=1 tr=0 ts=6a96cc32 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=Qm0qsxP7aFY2tkT6R2MF:22
 a=89-YPgm_5HLP6wdRpfQA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 6fR9-i4LI6rIKFYQjkEJTWaSfg3P32Ng
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11892
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=10
 priorityscore=1501 clxscore=1015 impostorscore=10 phishscore=0
 lowpriorityscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010115

totalram_pages_inc() and totalram_pages_dec() have had no callers since
commit 7fbc5e26123e ("memblock: extract page freeing from
free_reserved_area() into a helper") and commit 287b89773d81
("powerpc/pseries/cmm: Use adjust_managed_page_count() insted of
totalram_pages_*"), respectively. Remove them.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 include/linux/mm.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index e3736c42c4db..c105a3758915 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -57,16 +57,6 @@ static inline unsigned long totalram_pages(void)
 	return (unsigned long)atomic_long_read(&_totalram_pages);
 }
 
-static inline void totalram_pages_inc(void)
-{
-	atomic_long_inc(&_totalram_pages);
-}
-
-static inline void totalram_pages_dec(void)
-{
-	atomic_long_dec(&_totalram_pages);
-}
-
 static inline void totalram_pages_add(long count)
 {
 	atomic_long_add(count, &_totalram_pages);

-- 
2.39.5

