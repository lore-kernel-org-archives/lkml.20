Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329185632B4
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791997918; cv=none; b=tVySGccmCD0CYBoy0ls8W3Q/2tNj5Mkyik7ZCQ4BmtpGadePcDK4ojyapUh2in8EiXObdsGovd5sx3MmRjS8WSjEnCuilOVP+p9JFNbDlE5Wj78FccwZyGLyrRhYufn5qGPgd5OJ4QR5qqThSH3ktNDZ6vP85MQ1wcvKHZbwISg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791997918; c=relaxed/simple;
	bh=d7MAIQzRdg4FbIiiDFVJ++Y/PIlgGf3uGHWhKOHwSM4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nRRt/h+qOrHX92NZJPPEZ/5AyM3FewHTPMgACyl9dXvRPDyFN6gTGgMe368es7k8OdwD7MjQP/ass62fx2UOcvUApnfjH3RvR8cStTv3PoKB8IHh11zrzq8RpcXNjYNLHtx13oNTxxxkMW/EMX6J44DblDOID4z5EUBVVV9YZo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B52EDJpw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B52EDJpw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54E7A1F000C6;
	Wed, 14 Oct 2026 17:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791997916;
	bh=z72p5BWjexN9LWvGlQWUign7ZbWPllv7B7iJ/RtJe8Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=B52EDJpwUQlIverE2mDwtvzbVCyO9Er0uohM31HsB7Gqk99ZhYLH0+qKEuRU60S93
	 t0QE/EWqGNBh6mOEroq3S0FX301arOCcsi3moCuCypL0g8zRqdArHS4TvZFM7IhbUN
	 vgU4xalfs+tIbSITSnkU/tMqf4xxnnpqHaWY4QcezNNADkcbbr1msOWRo//1POvxzS
	 mMJYJeciuJlwSlZboZerZMcN1ySUs1KEQGBTRFrPOFH6FQWZYWk4CLetV1eiY1Jaw1
	 TaKgwAUY406FpoFwvaMWE5Oo1JJfeCqMRQlhLkK7eEs70TgIobW/uw3mEoOrUwYTVD
	 PVP5moQCBHOJQ==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.ams.internal (Postfix) with ESMTP id 712B91980047;
	Wed, 14 Oct 2026 13:11:52 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Wed, 14 Oct 2026 13:11:53 -0400
X-ME-Sender: <xms:17fPahIPYFdyIrN7LiLk-eKQcYobcsgv5zFJNrOSv8-_GeLeWDmMWw>
    <xme:17fPapFVTUvCwfxdU1OEMLp4MOepX7eYJg17vjAp3oT8lM0Q3dXxkpd2zGOjbR0Ua
    WhUwYvq8ujxfBuUWwnKEI0YUBtPGX7zlI0TwC8OqZP0xcMRZOacOPwq>
X-ME-Received: <xmr:17fPav1QW-1YD5zSYe9gDn0ljcunV45CK0H3nF_7tbdH7FYs8JRBtzSRiBk>
X-ME-Proxy-Cause: dmFkZTFAhxxCN9RZF7RgZjl+zblwyI5MNEPViosmoopuImm91zea8n//qrkhNFSUiWcXrp
    MH3eAot5Fj3DZ6VPT64I9vPg0QCUCtDiiTqiv8NQX359J2cSSSZjsC/tyd/Imi5LGIf6hL
    s8CbCEIaBNMBcUHGn/aH82L6PPlafquguz3Z2sEDXsDmuHj2yqTheZQ+fxDOXfR22hlOrP
    qRQ5NbmvpkXKG3iXKhgkLsRulP4SRlPxiR6IgNv5RFr6apIBiGIzyDvrozd15QkLVz/8fH
    sBuTJDigvLKTgofLjjaL63tWUe5PXp+yZe8Mz9HWr0e1U2Y281/CsnjjHOQDfmMGadQRUg
    pAZG9CX41VOb+dJ7FUXXLIWv28rqw53/CzYO0t4sG9QhTxVFYR7ioojtod96QdmPsLI6S+
    /yuC6DKHFAkkVo1dm797f+79GKuHHw5iyVgTb/UmL/ZFNGwo9WYeLO9J+AcZ55ozmMlUhW
    xBN2srExtcBdm5VyGPBPjjtZsoiRcFm2GKOVMrJlY78vOa+AWJwGqo280gfIZTskIvc28W
    +ec1xjiTqckyFHLrns+4PIMArZRsorFUr9Q8+7Y7+H3JWuQSHTsBL0qICydbwE0j2s7OF8
    mjTBv+VGbKDJ43IPl6QVeufSKSjksxivx1MXKIvxZkvECUejjHXIYQVkNxhA
X-ME-Proxy: <xmx:17fPaoyihkzWq1B6K2j1BgVfJajthRRaRKei7bmP3J8-W0dCEJFZ9w>
    <xmx:17fPamiwLNlYH8VxoJ4P86oNsyJ1X6GR4xzTCD_TCttDoTaldSj0NQ>
    <xmx:17fPavwnjQs2UTPn5ZWeA3_k_F-HKhczu8Se7_2kWudNcGY1C8Xb0A>
    <xmx:17fPasyN9WvpbHg8ucSS1fvQMumZcwyXhLAHjGts3Ogbf_K1Kmc-Fg>
    <xmx:2LfPaho_HZev6AXWwURszDmLuKs_iuMDWo-RGYrigyNRyDlKvmw9F32y>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 Oct 2026 13:11:51 -0400 (EDT)
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
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
Subject: [PATCH v5 1/9] mm/khugepaged: drop redundant mm_struct pin in madvise_collapse()
Date: Wed, 14 Oct 2026 18:11:34 +0100
Message-ID: <20261014171145.3292736-2-kas@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261014171145.3292736-1-kas@kernel.org>
References: <20261014171145.3292736-1-kas@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
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

