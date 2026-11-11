Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794419773;
	b=vCvo9ZpA3A559zAdrsmizvZZn4Lr5L3CB8QUibga1L7k8VktOxy14x2V5D5Awy5vE2am
	 mY1fozb81/objFZltphgSReVQoo1K3J3QCQZeozRUaRNp83kXheY7ySDJkIpYFWxlgY14
	 jAO+/Vof7LjbAcy54ReJCIVBLqcl2PHJOPYvDvpNXqBAmbQpaIu/tAv/ApxB9XPqsz3/5
	 lVdaxwEPaO8ONSzK9d2hXhUzIs1U4kV4mcCxEHddhfTxPGKmh5/yQxcE+9N6dZRHgo/P9
	 3lYh6C7YQSYmNvLSIhuBMr81wYYeTFzWNpsz6VJGb9KlAjjADkBUNUgCk+JugIn0A7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794419773;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WBv+J2+tviBYV2q/dbnc2XjYzZXGIYwmkmp3zIEQAQE=;
	b=F7QWd6cl2EFTV2T1lG88wJqea+iSR/XHPaush9PMOqPj+9NGTzGOeaASDbaYSSzFD7xm
	 vQwXGNtt3QZ8HQu/Y1TNgklOBLUO/UNQByAG0I+zW0K9VYZ3dsbuoViMiFqiz7CJbLb2m
	 sg7UNNwIzGkwe5ALYW9D8MMnxXl1S50CUyNkGmW2ODBcq3nsRZzUtVD4efatFl9kbo0vl
	 z28lnYpwOPtglhUmjUtK60HceZ/kku/nCyX8kipjn2XsdmRTBG+vI5kD4/4fl0tmZ7/9+
	 4dBXZs2t0utZm+HqPIPBEtV+JXA+sg5tm1ZEkP90L9aPCbHcD988gNnsZElVEDewwhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b="skMHD/yh";
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=LrM6xseG;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED11860A6F72
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:56:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED11860A6F72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=skMHD/yh;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=LrM6xseG
Received: from pps.filterd (m0167077.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABHYdqg257759
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:56:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=WBv+
	J2+tviBYV2q/dbnc2XjYzZXGIYwmkmp3zIEQAQE=; b=skMHD/yhL0b+juEJ8bBK
	90FcKnwvgP8LdEjYM2BRa1GRJTrlcBRieIWB4kzjmnCpkBVxTbhCNDYIYB4klSJJ
	YedlfPhnksj9gcQti+pbHdP8cgojvWXOB3E2cR96cKFyGgLqI3EhqgMKRbzF92yX
	T3S4vpxqYLDUmEngcjdZ5+3ZhE15dd9QBwqsrJP3y5ipFjacGhFz+Vm0c3jZ8hLq
	8tpgl6/Ne85jUccPfzKgKPRfhCCiqsNNRrFzxRiYxIsOHzTg2qvM8J8aNwiKDdJX
	XJoT0wH6bXFE8EpnwMEbMmqag6mh6aF7ICAjuWFR+zTuuCDkv7Z4djkZ+a6yVdig
	qw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hvdfs560n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:56:11 -0500 (EST)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5337ed1ba44so71533371cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794419771; x=1795024571; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WBv+J2+tviBYV2q/dbnc2XjYzZXGIYwmkmp3zIEQAQE=;
        b=LrM6xseGEZtWNc5EwZTL3iEfmTStxKpFtKIgWzJdAkCX6OguBWlvNGh4WCzXP9K869
         iE/Fo6+XxnBjXzrh9HZFN3/Zkr8t4IYJ70RY5OLBKO6JS5ATvIqVM0kHDE/j1mQn9qcI
         mpxEq2E8aFvYBBrLhT61rKmS303NAd8yrozc+CsY+ikOjT/cvi2Ug8XnZKtcQvtKTFWC
         BWyAhWvVYXWx4PPd6PK57eeyoMPjeO7/hsOT/y9hOhNEXlyTBp2wS+EmdbXvbORkWW9u
         Zv2GuJStcbPniFn4AG8U9qODR5YhxA/OL4xaBC0wqaf8+Kfx/Oz7qWfG5ykbz8WXU6eB
         fnVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794419771; x=1795024571;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WBv+J2+tviBYV2q/dbnc2XjYzZXGIYwmkmp3zIEQAQE=;
        b=YHIZ5mjmJea/L9yNd9X2qPEvr+8qb8PDSRe6LeGLkCpsr47jjFBiVqTQhUrxUbVT/v
         NaJHB+pBHEuTGMSWL90tSSMMhsz8G7jpZCtGSFMk98sETr01OSVSZiTjDuFzNKt9RSaP
         gbAaALaF7LChJNnCtr/BHhi8fdTGsGYnguHpJMkaRYKqYGi1CcfuoscueydGrGdU/1Xc
         QPdecHkoGfOB1IuIT8M47E9J6vYpZOeI+YEN4MiXAHiVUxCOpgnTAnlH6vGfhwDCRF6Z
         +WYrMBbQaH9u3o4rkfMY7NNo6LdzjtvBySZbKCi5lC2rqfKhT6lj68r8o9PuplAcgPgC
         4iVQ==
X-Forwarded-Encrypted: i=1; AL+hErGSBSYwLyz5/JZTgiPS+u3Y/hWD1CixYGipHzAvz2uJpMxP27OJh6/jD4DDxy/6mRJFH1jmHYm5M/srhUg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Scu/y+6Zoeh63njtUZPXpG+iyYk4aR7iRyxYywW05THjvqGbR
	rAJMR/w8JnhUoJDLMz4Ycf/yyXqdhbhbPlGh07MzqtyS23cQjQtSHy3M5n3VmrakACKxMzLKlL4
	pmnRV/Ab9uCpcnMx5aybwQPHxTEpt2E3y+TtxZxOkhFDuuCAXhd+5CcbqC/+HLA==
X-Gm-Gg: AYBFou1jawnbrsznCa4bzBfvj1+hVoyupvUTaUNBl99BDdBWpV8IAWPqaaNpbNuQh9Y
	1mSVT08fv7NIw4c4AqGky9SRydKaYGPa8vE+e9kef9ulUbglLmwn7HqKQwNkfvGChNXUJBS8GTv
	LuGbLrBbexz0N8bAs6SrgLzO1l8hN28/kP0R7x9Ra/CoGk0pqaKxMLAdhl4K6Cn1HS+RjyT4PXf
	sI9Y1uXsw1SVhZwoow0JwcoNWcVHMWbnyRPi75USOx8kyeZcgL6nVNgD5m/Q7N3CaO4cf9bpBGz
	G3hGVqQSl3COCsuBSPRCAhtzzjcFZWkLbc3aTqYSJI8gw+S08BGly7qgVN5dMCFWvyVSQtZIbw1
	KRJQFU5C/TohBmmUITfQHeTGdtXrqvBRnb+GyHImLPhf3uq8h6cbX6g6tNF0lX8tsgXc2De8iLe
	0oO9WiWuvbU5pm66i3Pw==
X-Received: by 2002:a05:622a:1e12:b0:535:e5f1:393b with SMTP id d75a77b69052e-556bd706e96mr49217111cf.4.1794419771172;
        Wed, 11 Nov 2026 09:56:11 -0800 (PST)
X-Received: by 2002:a05:622a:1e12:b0:535:e5f1:393b with SMTP id d75a77b69052e-556bd706e96mr49216611cf.4.1794419770601;
        Wed, 11 Nov 2026 09:56:10 -0800 (PST)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550b93ee00sm54974231cf.16.2026.11.11.09.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:56:10 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 11 Nov 2026 12:55:20 -0500
Subject: [PATCH 12/12] mm/userfaultfd: check hugetlb end alignment in
 UFFDIO_UNREGISTER pre-scan
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
Message-Id: <20261111-uffd-state-fixes-v1-12-00713d368976@columbia.edu>
References: <20261111-uffd-state-fixes-v1-0-00713d368976@columbia.edu>
In-Reply-To: <20261111-uffd-state-fixes-v1-0-00713d368976@columbia.edu>
To: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
        Peter Xu <peterx@redhat.com>, James Houghton <jthoughton@google.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Balbir Singh <balbirs@nvidia.com>,
        "Liam R. Howlett" <liam@infradead.org>,
        Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>,
        Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
        =?utf-8?q?Micha=C5=82_Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andrei Vagin <avagin@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>,
        Muhammad Usama Anjum <usama.anjum@arm.com>,
        David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
        Matthew Brost <matthew.brost@intel.com>,
        Joshua Hahn <joshua.hahnjy@gmail.com>,
        Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
        Ying Huang <ying.huang@linux.alibaba.com>,
        Alistair Popple <apopple@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
        Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
        Kiryl Shutsemau <kas@kernel.org>, Chris Down <chris@chrisdown.name>,
        Muchun Song <muchun.song@linux.dev>,
        Oscar Salvador <osalvador@suse.de>,
        =?utf-8?q?Miko=C5=82aj_Lenczewski?= <miko.lenczewski@arm.com>,
        Michal Hocko <mhocko@suse.com>, Mike Kravetz <mike.kravetz@oracle.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794419750; l=1887;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=QGRuzGiLMk3zkcIfTBxvpb0tKHGNzURyYH72Y9LpGSs=;
 b=zVrcDEAYCH1s+r2j/3K7D7hrzgJ9Hgjn07fWepfXvMyGJykQMyQ0cut1ptQLRa/2G6lrMYLxp
 U4bYjKscjxOBW72PsQrrASnKTsMaN+w3XHxLnxfIErs+DEg3ZfUkktl
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: -vWrulmmNaaLYSPaj737sCsFL2UIPVif
X-Authority-Analysis: v=2.4 cv=AaokjHXG c=1 sm=1 tr=0 ts=6af4ac3b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=QOCMdifcju39GKoXhKua:22
 a=w5LpOudGytjZGezDRloA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MSBTYWx0ZWRfX0H6qo2IEwrh3
 LS/33oIalfn+/A9PGx3acO7zuJjfA5j5bK3WbLHJs7Tv8luhoWU4cYUTkPAXXptG4eCxvLFGoum
 ziYK59b/FARfkfkUHUltXiUnLhA9AzhuOKdxCu+c1SR4rXf2zyzo
X-Proofpoint-ORIG-GUID: -vWrulmmNaaLYSPaj737sCsFL2UIPVif
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MSBTYWx0ZWRfX5Sb/GMpIvi7k
 OX4tIP7TM9peW91L4hVKZBReXsnSD4iWNBSuvdsRJiOZeDPbLMBQ6TQVrmjP7QjFULzMj+Hv/73
 HcpTrPXMtLdMzawAEsnpiBJhwSmbCiZcIFo1gVm8v/oAYOp4G8lyCBQN8NZ26kmzgBQfPHifieU
 8vi1SRyoHx1xKiZbwzO5hqNSjaMqSwH8RJJKs5n8uHq1yAUpf2sr0vQHPoH15crsrnk/habMemj
 fRBzrT7tEe+sTxaQcxdarPYAOMoqMLwS0N3enLKBOOCZDJcdzeTy/1a6c7I/bOXEJYbmXPL7U9J
 9tX6zqdSrYJs0m+GsosHhVDE2OxHqgC1EI0JzccQZWKpp9AIbMTY2JtG5QNiy72auHjGhjh47Ej
 ItJWiiIe7qD8MhDegc8ldvQwLrmc4RH9CXDVE+nYoZ0npqWC2wejlDtsvfE6RChuHVLPLxl3Lhx
 6xLwBTlaABAMRhhOaVg==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11963
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 lowpriorityscore=10 spamscore=0
 impostorscore=10 bulkscore=10 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110071

UFFDIO_REGISTER and UFFDIO_UNREGISTER both scan the VMAs of the range
before changing anything. For a hugetlb VMA, userfaultfd_register()
rejects a range whose start or end is not huge page aligned there.
However, userfaultfd_unregister() only checks the start.

An unaligned end only fails later, when vma_modify_flags_uffd() cannot
split the VMA there. At that point, userfaultfd_clear_vma() already
cleared the WP or RWP protection. The ioctl returns -EINVAL and the VMA
stays registered, but accesses to its pages are no longer reported. This
requires a caller passing a misaligned range.

To fix it, check the end of a registered VMA in the pre-scan as well.
The ioctl still returns -EINVAL, but no longer unregisters the VMAs
before the misaligned one first.

Fixes: cab350afcbc9 ("userfaultfd: hugetlbfs: allow registration of ranges containing huge pages")
Fixes: f369b07c8614 ("mm/uffd: reset write protection when unregister with wp-mode")
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 mm/userfaultfd.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index bf42fabb5afd..c0076c8b4e9d 100644
--- a/mm/userfaultfd.c
+++ b/mm/userfaultfd.c
@@ -3983,6 +3983,18 @@ static int userfaultfd_unregister(struct userfaultfd_ctx *ctx,
 		if (!vma_can_userfault(cur, cur->vm_flags, wp_async))
 			goto out_unlock;
 
+		/*
+		 * A range ending inside a registered hugetlb vma must end
+		 * huge page aligned, as in userfaultfd_register().
+		 */
+		if (cur->vm_userfaultfd_ctx.ctx && vma_is_hugetlb(cur) &&
+		    end <= cur->vm_end && end > cur->vm_start) {
+			unsigned long vma_hpagesize = vma_kernel_pagesize(cur);
+
+			if (end & (vma_hpagesize - 1))
+				goto out_unlock;
+		}
+
 		found = true;
 	} for_each_vma_range(vmi, cur, end);
 	VM_WARN_ON_ONCE(!found);

-- 
2.39.5

