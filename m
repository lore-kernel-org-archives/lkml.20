Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.30.148.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794674826;
	b=gY4s3Wnd4hhVmaZvlEk2dOweAp6twKHNpw4CrjiHRa3aS6gx3WBBRrFqAG7uiCXgSdcR
	 QMn5PgZaPlmChxZqm61E5xdcMEoFEsNY8YT6qOlnO0wh1ayl9ntogBWRWsHovJRCZclMG
	 6scMNVgDFjVY3JyUUUpZW3CHnN36HHJ6SKEgBfm4TsoXwZMEBYdctD9bsOFlzMGfyBxJc
	 W00KvQYXsLKYkB3YxjLETR/2Y5zrkuTWFHXj1Oy5zjX68xUYiVUXh7qiiTOGcpbraol+f
	 0rPBNfS32FYhqJLC9v92TyaQdgT1i83s33ggmrk3w2q55XwyAkZjlCs0dRLpAQF83eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794674826;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Zmail-TransId:X-Mailer:Message-ID:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type:X-MAIL:X-TLS:X-ENVELOPE-SENDER:X-SOURCE-IP:
	 X-CLEAN:X-Fangmail-Anti-Spam-Filtered:X-Fangmail-MID-QID;
	bh=3LuBfwrsNMEmaxatdcww0jyj29nzn1W/PMAS+hcYzQQ=;
	b=VyOcVlB70C7P8dL/K6wCCSmf9YRDgrNAWIqO744CzKuW2EcJ/DGTMe8QoDX3LVFZNrHJ
	 uvdJANayVSCYcWxjrAZcv96UfTjD25URilOjvLWFHgMJXNcdazT/4lwD4vjvhjsxbME6R
	 5TrVCz/pspqR9CRjHh/nTQGviREb4wKw0qfxSCAzeiUalsWn9AOK+/GKhDP0LlcILy+YS
	 AFxKso/yJXtmjNlFmYpX3TIU/F3S2egMWyY9exM3QkM0aEZ9/Yp/3EY5uhwyh1GC7dlUD
	 oDt3JZmcxrav1ovjFlxsVMl9F3oxdI1Rk5q3YwRbGDZVCID7a/vxnpUNOdkZkmzXQNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	dkim=pass header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=Ib3WR+2g;
	arc=none smtp.remote-ip=160.30.148.35
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE780606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:47:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE780606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=Ib3WR+2g
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jRg5M70DSz8XrrJ;
	Sun, 15 Nov 2026 00:47:03 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zte.com.cn;
	s=z202610; t=1794674824;
	bh=V7A2yyFE7wnSjeZEJxHslp4jPPbaHPv0vPxXAMZMgLs=;
	h=Date:From:To:Cc:Subject;
	b=Ib3WR+2gr/7rSbP9L7eduEl1nvz2FLrNgu5CqNXBEQRords0YIIRQAZAd8t1c6pgl
	 L14voEHkFAvIkctcG+5Ai/+txc8ZyxViXYFuZaJUa5OgXT8yK0mfKLGMkcZoRD3fe7
	 ui/ftW7BJDvvksVW+8LUJkm1qqVu1M6D1Rz22siVQNvYFZZWN11oPe3p7kluBFxOrh
	 /bJBnqjO6PYgj8L5QBs2sVH5Mp3OXeaXN7Kffq61nr9FUxyP1Z8vsYE41IVVyBni2l
	 OWHwwf7r4AjzyqqG8yq4hkPa2L4WDBH2uw8Vmp/vnzbRb9Q5lTiK6A5ZF7kyfaUJIQ
	 NMXPDpzccWfNw==
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
	by mse-fl1.zte.com.cn with SMTP id 6AEGkr7a089513;
	Sun, 15 Nov 2026 00:46:53 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp05[null])
	by mapi (Zmail) with MAPI id mid32;
	Sun, 15 Nov 2026 00:46:55 +0800 (CST)
X-Zmail-TransId: 2afc6af8907f77b-3074b
X-Mailer: Zmail v1.0
Message-ID: <20261115004655564ix3vefI54RZ3HhYOmxuKX@zte.com.cn>
Date: Sun, 15 Nov 2026 00:46:55 +0800 (CST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <akpm@linux-foundation.org>, <liam@infradead.org>, <ljs@kernel.org>
Cc: <linux-mm@kvack.org>, <vbabka@kernel.org>, <jannh@google.com>,
        <pfalcato@suse.de>, <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIXSBtbS92bWE6IHJlc3RvcmUgVk1BIGl0ZXJhdG9yIG9uIGZ1bGwtcmFuZ2UgbWVyZ2UgZmFpbHVyZQ==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 6AEGkr7a089513
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Sun, 15 Nov 2026 00:47:04 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AF89087.000/4jRg5M70DSz8XrrJ

From: Shao Mingyin <shao.mingyin@zte.com.cn>

mm/vma: restore VMA iterator on full-range merge failure

vma_merge_existing_range() moves the iterator to the previous VMA when
merging to the left. If the range spans the whole middle VMA and a
vm_ops->close() hook prevents removing it, the function returns without
restoring the iterator.

An mprotect() walk can then visit the middle VMA again. Restore the
iterator to the range start, as the abort path already does. Extend the
existing close-hook merge test to check the iterator after this failure.
No crash or data corruption has been observed in this case.

Fixes: 01c373e9a5ce2 ("mm: rework vm_ops->close() handling on VMA merge")
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
Tested with tools/testing/vma using its default ASan/UBSan options.
The added iterator assertion fails before the fix; all 29 tests pass
with the fix. Also build-tested mm/vma.o with W=1 on x86_64.
This verifies iterator position, not a crash or a production workload.


 mm/vma.c                        | 5 ++++-
 tools/testing/vma/tests/merge.c | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/mm/vma.c b/mm/vma.c
index c82e9306b11ac14f684f44b8d71a0026b7fc145c..c87b29f1beec4ceb02c23f6b37af0e5dff272436 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -983,8 +983,11 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
 	 * If we need to remove middle in its entirety but are unable to do so,
 	 * we have no sensible recourse but to abort the merge.
 	 */
-	if (vmg->__remove_middle && !can_merge_remove_vma(middle))
+	if (vmg->__remove_middle && !can_merge_remove_vma(middle)) {
+		vma_iter_set(vmg->vmi, start);
+		vma_iter_load(vmg->vmi);
 		return NULL;
+	}
 
 	/* If middle isn't removed then it's resized, i.e. splits. */
 	if (!vmg->__remove_middle && check_split(middle, left_side ? end : start))
diff --git a/tools/testing/vma/tests/merge.c b/tools/testing/vma/tests/merge.c
index b26f1a66a17074775d751a907eb627445cc1dda3..91accb5dc9944724cd11d1bfa47484a3cf9df54c 100644
--- a/tools/testing/vma/tests/merge.c
+++ b/tools/testing/vma/tests/merge.c
@@ -680,6 +680,7 @@ static bool test_vma_merge_with_close(void)
 	 */
 	ASSERT_EQ(merge_existing(&vmg), NULL);
 	ASSERT_EQ(vmg.state, VMA_MERGE_NOMERGE);
+	ASSERT_EQ(vma_iter_addr(&vmi), 0x3000);
 
 	ASSERT_EQ(cleanup_mm(&mm, &vmi), 2);
 

base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
-- 
2.43.0
