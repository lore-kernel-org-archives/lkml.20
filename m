Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1F74973A1
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790590010; cv=none; b=BrEqfhBf+ynmtjlFmQD5qyuDPNBmBXOBxOw+mR4MOEToLlF59MknUVuZ+Z8Rmtc9T2V/eYal7nBhLlyS3JmNNJNWOsqyGx/qUYpJsxJh6tFb5F4CNP2auvJOiu0gbPN8bwx0ZKxbKiRodRIaFNOuNuVd1GTUdw2sZBafFjPQMD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790590010; c=relaxed/simple;
	bh=tQdhyHhdjcnCVnKDY1h0MRwU03Naq4sT34omFj3a3gA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=it0ItyVvvyuBJr1W7O6OzXgJGFPfFj/J4ZsWn6r42muU02ZZ3ZZBR/WFEVNZg2s7xfHiXI8UZZcDgbPf7XpydV7wS3UmqKYX1qvGUBN3KPaQuNVvh3DVSdq12mYmH7SqMmsdpXWWtcMUyAH4G3/QnO0IYvJaeI/XBMwakpHCz1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=nu6FDMhC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=roxpvpzt; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="nu6FDMhC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="roxpvpzt"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id A8C11EC0102;
	Mon, 28 Sep 2026 06:06:47 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Mon, 28 Sep 2026 06:06:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1790590007; x=
	1790676407; bh=We1a1RJd3pTHnUgskesObo3/UU8pV3neGnph03OqD/s=; b=n
	u6FDMhC/Aev61iKDN2U7lEu1GUIWntJnP0TcYHrJE3AsHKStiZYzN1HYuZcXs706
	9fpNB0wZQY+q+vuegm6DbaaBSzAGCjSVi8+smtlczB0lRZ1QuSEGI2i6TIufVIs2
	gLJRKsFatVEk4OXVWGSZkeLJPYqK2gG3YCzsIdE82dLV52SMyAlokJ6263CKeOUr
	j3XBBAucpGv6FOenk/9Ud0eKM4Ye4IjHAPA011wNdRTZPe+FAabv03XxuO2B9Teq
	VxvqEsdavaAxeZEFifKwvujlbPnUbns2etyFWIWiFw/WdNLfw8ZyzwIRfD8GtRHs
	46VV5eIwb7jcrP853n/gw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1790590007; x=1790676407; bh=W
	e1a1RJd3pTHnUgskesObo3/UU8pV3neGnph03OqD/s=; b=roxpvpztemd5mmLNM
	SBKU1Zp+oWU4wASZe8Bwmf/ie5YqiuLm7ul6MdWZkw8sE6C4R+3yQ5AS1U7OjskT
	ZmLAoDmjN7Ax6TOtDlsWMrIzwD1oba7m/emcZKu0sbX7EDgHI8xM+1C+MEiiv/0r
	W4Vsdh0jiuMfeSJroxjrlZqYq8UbdGTOPtmA4zJe1TNfErsgBBz1vkn/XtNVZ/Dt
	mOK5rD1D5o6l38Giibn+t6qBAjZvdROwFNmYgOpECkcMQ1wIW573zfnVSTKbaQ+P
	YjwMIUAKhd0RPqCBsLqlZQcpjOUw2HACWKK3S2EAB4s/H+PHEMEv4UDiAdsinO+D
	z4yrQ==
X-ME-Sender: <xms:Nzy6aqS3_3SldPu8yDPo0k5Q7-TslZfm9AvaFN46nkGEaBunZhcUrg>
    <xme:Nzy6artHU1z11h3OdcZ2OWq-9kusbymkTbhNDpBri9MDi8EeWvcT8TRM8GHz3Zx_7
    2DPL09l8s6XMyDwrk-p1SJ2JUClFWsH2dmZk5J7OWRDL5YrGQ9djmY>
X-ME-Received: <xmr:Nzy6at8oLS-OLoVWQe6f352ERwceme013KBHWK9Ki1_-6sNEvgUlLX5vzz8>
X-ME-Proxy-Cause: dmFkZTG4PJbO3UAUv73kvgZEv1qLl5z3Oxsi3Ojn/Cc1gjyQPAY4pttCRQI27MH3dZhDE1
    QOPy+mv452PPCSDsPFoXsadZBBemUC7OEPjfBcMnl1HRY+YTKUqrnPjkqBcWGUry80H8PC
    /K6WQA/dTtmOEop/aiwEwk7y/N5mXgzmzQwcpgiHqOtfdhP6k3WxKdxsMyJsyB6Hvye7b7
    y8KqhRd53u+yghVVISP0UmiTClCERv2XAI4oMribMzYWNytre02a5omAhHuTKchvkb64ds
    QZyxNlGi6Daf2p9KIHOOPKsvpCSjo6Or9ZEQkSNGQE8W6NOQ2qvEeUYlVLLdnIfc4NbbUP
    LcyZg+bNXnd9ILSeB6ijdfAszkrS8JFhV/ZxQZo5Bmtgg9U6DZB+dTeyvO3QZ6ouAZ+HCQ
    mYegzh0uWP3vtndDrCiL9oMhfgFnaCvcT/VFpol6Ml5nm5qqBNX8LV5mxQMfXEwY1Rhhge
    eZnz1VCUU+1CRYA5u3Hwnex4P8sBnbJJVfxPKtPwFH1auKd1Qb3p02JIJmUnO6oNwb9cfN
    okIu0ntVaKynVI8q2Ye7X3bliX2WapryX1XOBiXPHkSi8CD7p6APFNmr6CpfKJ63uSdeb7
    DOhQOY8W78NSLDIqh2bKc+6Y7z3ZjgsIiQe47qex4iQzwidVcpfCTZ7nNvlA
X-ME-Proxy: <xmx:Nzy6asaZLNu6lc0umJ7McNP24OQxMmD59VQVU5s29c6O5yjWaAGyMA>
    <xmx:Nzy6ahoQbedE28IaCAy7-kGEwI8LwilBb5vkMMkmPuXL4e2fVSFkMQ>
    <xmx:Nzy6asbSB4difzEM8WS2A5_fefd0nEV-dqRw6Svb9NiI77kQhFzpQQ>
    <xmx:Nzy6as7B2dIiI4lSSHFtjwtWLZXu1qUaEbUoUc7BPMeuiEL_0Vh6mg>
    <xmx:Nzy6anROsqO3zo14CdOAJeuWZ9LFzkrR_hlwKH9-ieYI7lbKMyPK9XSV>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Sep 2026 06:06:46 -0400 (EDT)
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
	"Liam R. Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>
Subject: [PATCH v4 07/13] mm/collapse: name the per-table scan reset for what it resets
Date: Mon, 28 Sep 2026 11:06:21 +0100
Message-ID: <20260928100630.21870-8-kirill@shutemov.name>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260928100630.21870-1-kirill@shutemov.name>
References: <20260928100630.21870-1-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

collapse_control_init_scan() resets what one scan accumulates: the node
load, the allocation nodemask and the eligible-PTE bitmap.  It runs before
every PTE table a scan is given, not once per control, so its name points
at the wrong thing.

Call it collapse_scan_reset().

Preparation for giving a control a real init and release, run once each
for a whole series of scans.  Two names a word apart would then stand for
two different jobs.

No functional change.

Assisted-by: LLM
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 mm/khugepaged.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index cc69281c542f..60ec7e80d554 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -532,7 +532,7 @@ void __khugepaged_exit(struct mm_struct *mm)
 	}
 }
 
-static void collapse_control_init_scan(struct collapse_control *cc)
+static void collapse_scan_reset(struct collapse_control *cc)
 {
 	memset(cc->node_load, 0, sizeof(cc->node_load));
 	nodes_clear(cc->alloc_nmask);
@@ -1577,7 +1577,7 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
 		goto out;
 	}
 
-	collapse_control_init_scan(cc);
+	collapse_scan_reset(cc);
 
 	enabled_orders = collapse_possible_orders(vma, vma->vm_flags, tva_flags);
 
@@ -2655,7 +2655,7 @@ static enum scan_result collapse_scan_file(struct mm_struct *mm,
 
 	present = 0;
 	swap = 0;
-	collapse_control_init_scan(cc);
+	collapse_scan_reset(cc);
 	rcu_read_lock();
 	xas_for_each(&xas, folio, start + HPAGE_PMD_NR - 1) {
 		if (xas_retry(&xas, folio))
-- 
2.54.0

