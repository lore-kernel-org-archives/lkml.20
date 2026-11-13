Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794605789;
	b=Vcc21I75Dw0edvW2SqBU3byPoiQo4okXalYHo+55vOy94tcQo5yxSYRsZFQZyb9LptzG
	 7jfvEMjs0y+9smzLR2oLFf2qNvsWgboy7ihR8jVVkhiW2db+ys3B3JdSMyJmGuqK4sYtB
	 +emUR2vz/CxvdKqwe7ULAgFDxmXh5DvdVzK9Fe/aqXdHouOBkzOvA5A3RMN3BHTNSd5WC
	 Op+gmBF8rKUBZ86WJ9gdx3Dj5J/e1vZQAFhqXIfk+hxQ6iuzwYsEuQv5VzSkwbrIwmJK9
	 A2z/L5y091Uagja1u0nbDs4pEet4mzuRv54MJVrZlgnajuDIZKtkTJY4DkJt54+FeDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794605789;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=WN+yjAtvVrc0ctpoDlmv+PaGA9TaExp57jSuyDwcPHI=;
	b=hLbBe6bxlPrO+W45X6QuoArdRr77x9InPPjSrTahzsWD66XbFyG/0tilHoto/BU+zMLp
	 umsjiEO2chEhz67q8f23SqWVNxqkSu6+RZytBKxH255J5jopLT6z7AaNQEPYJQTGwwrGq
	 8RHOgeoVRB7KxSxbVyIqPKbezSnWQnVcgRx5QJidTWH1RNAdbBJqp5UIfTuNANfueZKQo
	 1C6a5hWkHNABUYDFMd6pdkuCONQG2K4Z4uz8nMgOmrybwpbd/ARmDjpiTs3B3nO4Kx4O6
	 4w1w0UCiul2wxkNCvgtQmAtXt7Z5PJvgqrvKCc7kA6c+oAWKwUx18jTKe3mi8aTVqXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g+AsvhoT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC8D606A89F;
	Fri, 13 Nov 2026 21:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g+AsvhoT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FC921F000C4;
	Fri, 13 Nov 2026 21:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794605789;
	bh=WN+yjAtvVrc0ctpoDlmv+PaGA9TaExp57jSuyDwcPHI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=g+AsvhoT+tYFQT4Lxddn/4RA9GH8lcuOlnZs3RnuvsOKi9maLL2SF+vqlXTfWAlAF
	 UVQiRLRLxm0R7x+2g36yOfjDmlBfGIkcYDkB2wjXVLkqvY20tcsKzrXlmAsUgbSkAE
	 xywdKaGnCcvlkSGKkdHxgvsvHkZewsTrAs981tYACeW11Z1OTTyqnDjpBczb4KcWnt
	 nagwzqgg1A9fxRtIm7WHnalVtvFkijfMuFMU/BkVzJZ87AjbwIQAh4zHqvhiqm2m6f
	 zbe2SCeG32LPzPc9+zpzJ/dgFehpQsj7BgTt2U+rD/yLKNyKIM4KXf3xRS5ZgMpBr8
	 s8FoRl33Hh2bg==
From: "David Hildenbrand (Arm)" <david@kernel.org>
Date: Fri, 13 Nov 2026 22:36:12 +0100
Subject: [PATCH 1/2] mm/mempolicy: merge adjacent shared policy ranges
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
Message-Id: <20261113-mempolicy_limit-v1-1-16688b2644dc@kernel.org>
References: <20261113-mempolicy_limit-v1-0-16688b2644dc@kernel.org>
In-Reply-To: <20261113-mempolicy_limit-v1-0-16688b2644dc@kernel.org>
To: Hugh Dickins <hughd@google.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Gregory Price <gourry@gourry.net>, Zi Yan <ziy@nvidia.com>, 
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, 
 Ying Huang <ying.huang@linux.alibaba.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1770; i=david@kernel.org;
 h=from:subject:message-id; bh=Sd3VuioKyfuNxkrcYED0n1NfIILXQri+cCwle5kG/5k=;
 b=owGbwMvMwCF2/OVpCdfQ3ZWMp9WSGLK+N50XFGKt+Xjjo+E188Uz9/zie3Cd6/Avc70m7pyFW
 2bmFSRkdpSyMIhxMMiKKbIEBd83ePlyXW21Gx8zzBxWJpAhDFycAjARLj2G/yGSTy5M+55a6RVU
 58dX3phh9bBLIvOkko99hZ3BVMUZrxkZXuyqyhXOYuCt9FAXlyrQa3Hj95tpE3zW6A1r5ZRS7T9
 8AA==
X-Developer-Key: i=david@kernel.org; a=openpgp;
 fpr=1BD9CAAD735C4C3A460DFCCA4DDE10F700FF835A

Shared policies can retain separate tree nodes for adjacent ranges with
identical policies. This can create unnecessary policy ranges especially
when individual VMAs cover individual file ranges, and user space sets
the policy on these VMAs independently.

Extend the existing replacement handling to merge ranges with equal policy
at either boundary. The existing replacement loop will then remove the old
nodes and installs a single node for the combined range. This also avoids
splitting an existing node when setting the same policy on a subrange.

Extending either boundary rules out splitting an existing node, so the
allocation retry can only occur with the originally requested range.

This change will make it easier to cap the number of shared policy
ranges per inode.

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 mm/mempolicy.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index 06b90903e8794..183bc3bd077cd 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -3208,6 +3208,23 @@ static int shared_policy_replace(struct shared_policy *sp, pgoff_t start,
 
 restart:
 	write_lock(&sp->lock);
+	if (new) {
+		/* Try to merge ranges with same policies. */
+		if (start) {
+			n = sp_lookup(sp, start - 1, start);
+			if (n && mpol_equal(n->policy, new->policy)) {
+				new->start = n->start;
+				start = new->start;
+			}
+		}
+		if (end != ULONG_MAX) {
+			n = sp_lookup(sp, end, end + 1);
+			if (n && mpol_equal(n->policy, new->policy)) {
+				new->end = n->end;
+				end = new->end;
+			}
+		}
+	}
 	n = sp_lookup(sp, start, end);
 	/* Take care of old policies in the same range. */
 	while (n && n->start < end) {

-- 
2.43.0

