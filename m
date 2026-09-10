Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF9747DFA9
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789041773; cv=none; b=iqDUyDWsgyNHMSOmNXIkOnWTZNq3OZ499Zwd/XQtUDXQI7F1sfcEs0yKvFFup/7HsGd+sLzOv2sCbQQ67KXNk55E1Ke6p+GxjJqPpvXDtwsknyVXTfwZoyuMQ0R5r0jVYMyxIZNcFkT5dX0N+stF3vsw+aLHAGltIi/OqKe3XM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789041773; c=relaxed/simple;
	bh=RPRWO1cQwfat1Dp+ZIb02Kouxyvk7UB00r0B/YRnvf4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vwehrbp7+MZJCw9vRsib0fNK9SxWh420R4Ys1lz0r2hnx+Ggkd1NaUSasdgz5nNlH7iGmg3MNmxO68SDhrmA1PprXQLE7d1fqK7OvA/kOVTR0JrhJ+cEOan+Ed3hvpRIIrPGOQBDOB+8G2NoyQ1Cu8pzdmazbbGMW7ALXvV3e3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=RoNmw2t/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=pXjiJ4ax; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="RoNmw2t/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="pXjiJ4ax"
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfout.stl.internal (Postfix) with ESMTP id 3E4E21D00066;
	Thu, 10 Sep 2026 08:02:47 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Thu, 10 Sep 2026 08:02:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1789041767; x=
	1789128167; bh=JI5Fa516GYJ3tjpfUWQYw4F0sEV0mYVe3RtQG+xuZIc=; b=R
	oNmw2t/7fOO/tSm9mOPQlzF/zGd4IY8hpx14GxEtJ8n5ub6w+GRon1KrYeUFRBGG
	WfZBzLrd6ntIDQLjAjae1jJDFEOJW881bVcTOyhLU7DaSWUDcq3XfgdAZ8tSpT45
	yZ6euI/d31PbHULlnNTpcXwRf3z8NTwGo+Q+w9o5+A/7/3pYuQxDHHkFVRUT0e6H
	jgaFUNRvT/+joNHuExDaMfuB9De2Wh8qBGqTEw2mdV+GTPvCxgxmS2MzoAowsnHx
	o2BUapLwa7a+z39wClLamUff0u2iAuhDlXfVxr1xCSI7FIMdC4oC/4YrrO1lloUW
	We+L82oK+W0h+w92P9HlA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789041767; x=1789128167; bh=J
	I5Fa516GYJ3tjpfUWQYw4F0sEV0mYVe3RtQG+xuZIc=; b=pXjiJ4axMe0kUEfir
	yIUluhNqtjF3b5GB2g9HF7xhzeC25rvgo80hH5WCBD9MIpzb7GsvcuZsIMxLw3PW
	4KTmM64h4qV1aEJLjoSTet8G+9y/yqwD80rcz2TVW2RF7fWyYLGrGAp32p9iCmQU
	fC1dBbiMRRiKHJDiiiGOZOFInu9FCJG4ICzXBsZ9HZ4tZvgTNnWnd45nBQy27OsO
	jDnVcAmISuoutwhFViaRNr0tk9fBVJ+wcdK9vs7MoQF7VNRR4XwFidODb67jZQdR
	dj4uTOYiRJLrctXy+tei3g7Q/NMsnlq0C7kNeLF7LWucCdBw03Hc+TT5QAM9uGx9
	AHlAQ==
X-ME-Sender: <xms:ZpyiajdpNYmzQnJ9axglhrl2lZBW4Kfc05Hrr7LPzK56m7WF37jo8Q>
    <xme:ZpyialL1PWKYqpXg9CedIsrsaMh58kmlbWZSyHclDpzy5mEKoQnH_xSdZKIPFm16M
    UWshw_Qi6sxw_PJonxY_XEtJmO4qK7pDWZCtfFt4orDR5MZx_eLw286>
X-ME-Received: <xmr:Zpyiaiq8QoWXiGanOKV2DYrgO-1Mf2gAHvefmln1SUp3ZlGrNpF59FlLaiM>
X-ME-Proxy-Cause: dmFkZTEVCHaom43ud29NDpH2Ao3u7HJ/1ECQvA0KKWbvYxhttLa4TfzKR6zF5UuYx3UdSX
    No90AnuR4y57x1CX4a9AAsMV1JR4eQYCvRkfoTmW6C9Lc6lI8AZbTNwmqz4UTzT3vnk7qg
    ph+TCI1xI7srBtDO6Tg5MLzI4vqgzAzQGVqRHCjhPRmxizMOs2MvZfOp4fytB88FrNmNEM
    gORbCSjN6PT3vgIUt7WNrJZsAWFpVymtt3pMoPYb3jF9rU+m42uK7S67tVqaIc+biyrQXs
    /trDbiCnZfBDKlB4R/Y3z4EcguiWXCyuMp2o4aP4AZn5jbn1xeIsCoHcLAwPh3Pk2Cuooc
    sGdntzh/yP1mv7gIr2vSfojU8NuPx5fqlOjAGDaKaG8GehyParYQCFRQVBwE8xM1cWN8Fo
    9XYhMVUUlRGCVVIjjGKrULoOkvrbLwds8TG3IyuIKPFUAg5H9k2M7VYfpV82EMOFQws8sd
    O1RPXNeLjDaYUKiXZ07EzB7/z6Zl9pfiotitqbkXDhBkRDECc5IUIMsZGJABqfKWlaZ8Mh
    5Px1YXB0tVWvvvdm0Av5Ew0fLm+rKWSOdOPn1dkL4NEarjmDFQk9B5OKzlE9mAI4GjVueL
    yJQkDpVSg9TiBUpOsfwIKTYEQLszQXZEUTYgVFQxKXlv4ma+qGaBdn6W4/Dw
X-ME-Proxy: <xmx:ZpyiarWy1beRcONEV_yjnS6FrTcACyvHx8NdA1MQVHjdi7t0enK2dA>
    <xmx:Zpyiat1nJwbPCB4G80nZ5m8Kf93n_Y1JDXCBvh1LGZzJBxiaM2ESxg>
    <xmx:Zpyias1i_AhNOnPxEOlig1dQkdx-_Inh1k_3R6ivhytUQoT7pdxGpA>
    <xmx:Zpyiasle1bks65Uu41TJHA7cirMX-ui5W8QxQ5Nl39e0fEd6znYfDA>
    <xmx:Z5yiai1S4uWhe_ScfRv1YsH9ZnlVI3sX9tHZyfRSnqggMuPkR3a_tz2c>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Sep 2026 08:02:46 -0400 (EDT)
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	"Liam R . Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>
Subject: [PATCH v2 01/12] mm/khugepaged: drop redundant mm_struct pin in madvise_collapse()
Date: Thu, 10 Sep 2026 13:02:21 +0100
Message-ID: <20260910120238.2529819-2-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910120238.2529819-1-kirill@shutemov.name>
References: <20260910120238.2529819-1-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

madvise_collapse() holds an mmgrab() reference across its work. It is
redundant. Every caller already holds mm_users:

 - madvise(2) works on current->mm, which lives as long as the task is in
   the syscall;
 - process_madvise(2) reaches a remote mm through mm_access(), which takes
   an mm_users reference and holds it until the syscall returns;
 - io_uring passes current->mm;
 - DAMON takes one with get_task_mm() and drops it after the call.

Drop the mmgrab()/mmdrop() pair.

Assisted-by: LLM
Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 mm/khugepaged.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index e13d233b9967..75c876acf527 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -3229,7 +3229,6 @@ int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
 	cc->is_khugepaged = false;
 	cc->progress = 0;
 
-	mmgrab(mm);
 	lru_add_drain_all();
 
 	for (addr = hstart; addr < hend; addr += HPAGE_PMD_SIZE) {
@@ -3285,7 +3284,6 @@ int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
 	}
 out_nolock:
 	mmap_assert_locked(mm);
-	mmdrop(mm);
 	kfree(cc);
 
 	return thps == ((hend - hstart) >> HPAGE_PMD_SHIFT) ? 0
-- 
2.54.0

