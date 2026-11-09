Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794227564;
	b=NdPzbqwWAHjz2FacVl6hbNxK6iod1N+7+kgVFvpWDoQHO+oMY8L06UJ8jrZUOBGT5dZl
	 wLJWx466hF0oFm6CmJiqDaXpSdoDrgV+uSb4V0SzPbQeBMcNDWiHKVmjV4ge/eI2sEgsA
	 74MZgoahmNVgLO3r0PkjChxRg0yB9zS2VKS5vXdcknmm5y0saru61pxytmv6+WFXfKQeZ
	 ZU7gdvUPCSmLqCivjkwlWaINQVNufq6G7FerFN35wWPoW9fkZUu/hP9P3fDyiwVw2tIR/
	 SJV0jzIliyCeb33r5Z+DW+f3wjT28wEooo4ovwKZeY7vVYGuDV50g2uptwokNZsZJWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227564;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=eYR4omfoaDYRoyPO00ZjD9zOhe+EFLjS6UyKBeubBuo=;
	b=rDb+pjUnbYgldLCTHUNiaNJOxsZf3BSWeDLhZa2DfCb7RP4deV+6av7q+DO1XE6OYfXl
	 s/kZSncB2sUprqCqfQ+S0ULzoDv3lt3V4lBBx6i3WNB7VB74MxF+VBPSYTToGJXroNz4W
	 JB51RTaEw3f8+VQyi1MGutSvHRU15wFGQomfcng2B+44l1A++zkSEeeFd+YieTEh10R0p
	 nO0ujQ5Z+zBu37u0V5iBA1jE12qEA/tY37crMnmKW0hR9/6lUm+AMp/7AC7x9FZMHIByr
	 8LmRZ0qytnW2K2PkejsZzhgRvxwKla8Mm7IBJw6l+2wgx13djXFYDrCW/4leDa/9hYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Xzvi+fwj;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EA29608362B
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:32:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EA29608362B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Xzvi+fwj
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE6E8176B;
	Mon,  9 Nov 2026 04:32:39 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D40953F632;
	Mon,  9 Nov 2026 04:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794227562; bh=rpIgaFxGIS2OpZ/04dxOWCg4oswFTkrUNhImFASv33Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Xzvi+fwj6Ql49JH8ZAMSY54p6KtYX+j2cPFBile8oHOKD4sCIH9V/E3uBcGrr+dTk
	 l209JS0K3ERTgIEiYqeSBxDm2jr/EPqODT4xfCLQhIZsAFNYNJv1Gbf1J2iEzyktal
	 zPGgU8vJ8QCod1tPHSIl5OhM3hAMhkllxZQx4Lxs=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Mon, 09 Nov 2026 12:32:28 +0000
Subject: [PATCH v3 4/6] mm: internal: introduce FPB_LOCKLESS for
 folio_pte_batch_flags()
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
Message-Id: <20261109-refactor_gup_fast-v3-4-2aaef02df0e1@arm.com>
References: <20261109-refactor_gup_fast-v3-0-2aaef02df0e1@arm.com>
In-Reply-To: <20261109-refactor_gup_fast-v3-0-2aaef02df0e1@arm.com>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, 
 Peter Xu <peterx@redhat.com>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Rik van Riel <riel@surriel.com>, 
 Yuan-Hao Hsu <aa9736195201@gmail.com>, Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1473; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=zUmOfeEtgCPPDBn9D5DQwJr7Mb3p5wBZZ/qksfsLDvg=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBq8b1e0Vdbvp6DE910kKDUB/xYIbOq8i0PvfXSC
 EdlGbTA7vyJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCavG9XgAKCRBt1cPRWsUx
 M8KMC/0V4hpszVTAKsMwHN5yZ2t8icMnLuux/itj5pY5wypcIDiWCYEScPNz6F/SftTDZVnQiCJ
 cvB9FKKKREPcPPA2op+iOEIhbg4aq58Sq3NsUdYmXlWlmq1YkmwQQuSn53uxaHAp4qwv5fLbbj9
 2Orno381MLcYrim1wBhFqPAL5OpGMOJbc1xexYtBh9A3sPoyxpA7eXA98uuL8qznqOc8OK7AcCQ
 zX96mMHRlKQ+u3GqC8fBcdmocishYmnjbQakeiOvihTqKHUrNmNusr/B/JOuyUUNb8X6hsjTjrk
 E62mTcpRIoAZdH+UxoW0h4g+S2rJRkIeXDKtNsV3GZdQGi2P2qFRBIh03RfnA0uia8GV8PDCFW/
 ENKZf9bU0ZOs/cB0unfLtd86EhRMNczcTIcAV0HtKRH/5gM07R7zXDyB8VVhxoS/PQ+qwQaOSj3
 PeqTa6ZrBp0Mx/DxmlJmT2n7K27gj3nVYm2NZp9bJFvv4BRhRtoCZRHAOiKeD0KELB+70=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133

From: Yuan-Hao Hsu <aa9736195201@gmail.com>

Add support for calling folio_pte_batch_flags() in GUP-fast context when we are
not holding the PT lock. Instead of reading PTEs through ptep_get(), we have to
use ptep_get_lockless().

Specify the new behavior through a new flag FPB_LOCKLESS. We'll make use of this
functionality for batching PTEs in gup_fast_pte_range() next.

Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Yuan-Hao Hsu <aa9736195201@gmail.com>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 mm/internal.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/mm/internal.h b/mm/internal.h
index 7a315c0a93f49..e4992ca0dbd6a 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -373,6 +373,12 @@ typedef int __bitwise fpb_t;
  */
 #define FPB_MERGE_YOUNG_DIRTY		((__force fpb_t)BIT(4))
 
+/*
+ * Read the page table entries with ptep_get_lockless(): the caller does not
+ * hold the page table lock (e.g, GUP-fast).
+ */
+#define FPB_LOCKLESS			((__force fpb_t)BIT(5))
+
 static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
 {
 	if (!(flags & FPB_RESPECT_DIRTY))
@@ -441,7 +447,7 @@ static inline unsigned int folio_pte_batch_flags(struct folio *folio,
 	ptep = ptep + nr;
 
 	while (nr < max_nr) {
-		pte = ptep_get(ptep);
+		pte = (flags & FPB_LOCKLESS) ? ptep_get_lockless(ptep) : ptep_get(ptep);
 
 		if (!pte_same(__pte_batch_clear_ignored(pte, flags), expected_pte))
 			break;

-- 
2.43.0

