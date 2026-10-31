Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793478957;
	b=IdgvLh2n68mdLHyuxstwR7TZ6gsgtnC5/m0HmMuyapyqp8AfJi7N7WB/Dwy1XUxSVNo3
	 egV1d7Yp9alOX8NjSBdSpGah5mZEEy8zcYlDtOE+m4AhWkuihpQsbnIZSI3LL2E4hQNfI
	 Eu7JjP12fte5RXqGxUPDU+ub/CoujUI6bTINdkuANolTihjDoHi7MJhSm56+ofchfesZz
	 Q8VVRX4Ch67ul92p9M09tc3n7Dc0Vtiy2REcSkdNlcPHmS6w58RETdDxA/Yzv1/Wli+B5
	 AgPTHfZ5TklZ/SF/P4txyYpJPLMwBVdbXBya86pztm675ygK7uVAF1V78d2kVjw1Mug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793478957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=mWqOErFXDyqrG4+5c5D2/KSgqZrNhszC76dEZeElAkE=;
	b=NP32AcbbZhUcP8bfW5cboGyi44+Ybok5M1c2TPJHGnTl9YUsoKDtalnQKkG/r+w7TGzT
	 Y3FT7SRnRnjgeFK/GmbqMTopmJdCTJCHNFZBMSWfaJ+fZzrWbxl9aF+79x29qH6XIe1j1
	 jcN2n8CW2CfWykJL62sdETH53OZNsiZVgofXe6ggUemyooYMvoXDm20AOhNACMwWjiX/y
	 lvnflqoHyfJBqhNXgi4WjUrNY7KkFzk+M03k1uUHiqNL37cXvMlQRF2JvrINNduOZCayn
	 zXReAZ1cbeIWzG3G1aiv5a1WDacTA0Mtnf/XQcs8cYsLG4vEBrkN4cJl+Txorlo8/aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="ki/9YKoY";
	arc=none smtp.remote-ip=209.85.215.197
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD16606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 20:35:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AD16606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ki/9YKoY
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1ca15334cso2064594a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793478956; x=1794083756; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mWqOErFXDyqrG4+5c5D2/KSgqZrNhszC76dEZeElAkE=;
        b=ki/9YKoYUw81LJ6sDOtptLyi9sWhn2YmEATyMT8ZLmxR+u+Yz4InCrDUXGJrFOxAFe
         PjrvfiPQxG7i/ISfbE6nw+unf7r4gRhaqVLLX/0GTKgYM2tNsCBRINJjUMu4tIwGDb1+
         DPJ+32ilu8lm4gDCzUbyIFDp9dYU0myYNDL+ABhpfKXRRV/W8Sma8fYZwkZeBwK3rbDP
         AEAWAJqoLoM0oIMcXZ2kfb8c49P6ZyUG9yEWwfImy763ScEI0zJKxjDXUixD/C1q6/Rd
         YMoZNJTLLuYI/jKFBEwXXYIhfD4UtXfIqgNYFa/8cYLnfYOUbuWqN1PO5YccoikgeZCV
         o7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793478956; x=1794083756;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mWqOErFXDyqrG4+5c5D2/KSgqZrNhszC76dEZeElAkE=;
        b=kutEE2DQK3T4UNglHn7nh7rqV75ZOkbM3Cug0EWK1hhcLfxVdiy1C2RXZZBb1dTsrL
         5u8NWhmwpuKp+f+RJEUkTXqmo5Po+P23rJgzxMo1ZY4gj6ZU1jSkV8n0GHo+BcOOnMXP
         psXdetyUbfijNTiF7dvbynPluWgVmmJVxbBSoiUIBqMTRW0vNBbQ08SibAukDByQywMd
         U1+qhwZ1tzB/LD57/7kyuf/V7YrIcm87Gc4gAHknv8hTHQWui8mlWXLlj6tvlf/qwWoX
         4+Ge+xrqN4oRVqWa6egLP6RDA3Q57dNO5FG/woo7b1smToq3QBGzDo0j7R2HDnCdkXPx
         17EQ==
X-Forwarded-Encrypted: i=1; AKwUvBx2dw8IUZJkr0Qwi1rT3/1uUhuyZN5imG3jOXEUJE3q5Z4qcNs4VbX8L+6Af7DLe8DhXQWbL24wP08vf0g=@vger.kernel.org
X-Gm-Message-State: AFq9FYLrMQFY5Tng74tyYuFT204KJaD3xLnbvejgOkXR3IJ/bluPXoVh
	q+Wz2dW+BYO1WI+f+tESk7WlD7M93g+QlVpDEhrBx0gDzAqwF+VN6l4xgqiTSAMN01QOFaZaaSd
	9K6/YIPMfnTF+Vg==
X-Received: from pfle16.prod.google.com ([2002:aa7:9210:0:b0:8a0:e479:9889])
 (user=skhawaja job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:3945:b0:3e1:aa91:7134 with SMTP id adf61e73a8af0-3e928ace8d8mr5315059637.72.1793478955460;
 Sat, 31 Oct 2026 13:35:55 -0700 (PDT)
Date: Sat, 31 Oct 2026 20:35:40 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261031203540.2282507-1-skhawaja@google.com>
Subject: [PATCH] mm/gup: check folio->mapping under folio lock in memfd_pin_folios()
From: Samiullah Khawaja <skhawaja@google.com>
To: David Hildenbrand <david@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, 
	Andy Lutomirski <luto@amacapital.net>, Chris Mason <mason@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Samiullah Khawaja <skhawaja@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

memfd_pin_folios() pins folios from the page cache without taking the
folio lock. So khugepaged or MADV_COLLAPSE can replace the folio after
its refcount check while memfd_pin_folios() still pins the old folio,
and the caller ends up with a folio that is no longer part of the memfd.

Lock the folio and recheck folio->mapping before pinning it, like other
page cache users do. If the folio was removed, retry the folio lookup
from the index that was removed.

Fixes: 89c1905d9c14 ("mm/gup: introduce memfd_pin_folios() for pinning memfd folios")
Reported-by: Andy Lutomirski <luto@amacapital.net>
Closes: https://lore.kernel.org/all/CALCETrV5eqg6d9=+BQhCpRwBNe3aCQiut8vxPBs8b7PToqjaHg@mail.gmail.com/
Cc: stable@vger.kernel.org
Signed-off-by: Samiullah Khawaja <skhawaja@google.com>
---
 mm/gup.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index ba4907b35232..2b405cce2ca5 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -3471,7 +3471,7 @@ long memfd_pin_folios(struct file *memfd, loff_t start, loff_t end,
 {
 	unsigned int flags, nr_folios, nr_found;
 	unsigned int i, pgshift = PAGE_SHIFT;
-	pgoff_t start_idx, end_idx;
+	pgoff_t start_idx, end_idx, retry_idx;
 	struct folio *folio = NULL;
 	struct folio_batch fbatch;
 	struct hstate *h;
@@ -3512,6 +3512,7 @@ long memfd_pin_folios(struct file *memfd, loff_t start, loff_t end,
 			 * reason, we try to allocate them and add them to the
 			 * page cache.
 			 */
+			retry_idx = start_idx;
 			nr_found = filemap_get_folios_contig(memfd->f_mapping,
 							     &start_idx,
 							     end_idx,
@@ -3524,7 +3525,21 @@ long memfd_pin_folios(struct file *memfd, loff_t start, loff_t end,
 			for (i = 0; i < nr_found; i++) {
 				folio = fbatch.folios[i];
 
+				/*
+				 * The folio might have been removed from the
+				 * page cache (e.g., truncated or collapsed)
+				 * after the lookup. Recheck under the folio
+				 * lock.
+				 */
+				folio_lock(folio);
+				if (unlikely(folio->mapping != memfd->f_mapping)) {
+					folio_unlock(folio);
+					start_idx = retry_idx;
+					break;
+				}
+
 				if (try_grab_folio(folio, 1, FOLL_PIN)) {
+					folio_unlock(folio);
 					folio_batch_release(&fbatch);
 					ret = -EINVAL;
 					goto err;
@@ -3535,14 +3550,12 @@ long memfd_pin_folios(struct file *memfd, loff_t start, loff_t end,
 				 * page cache that were never cleared.
 				 */
 				if (!folio_test_uptodate(folio)) {
-					folio_lock(folio);
-					if (!folio_test_uptodate(folio)) {
-						folio_zero_range(folio, 0, folio_size(folio));
-						flush_dcache_folio(folio);
-						folio_mark_uptodate(folio);
-					}
-					folio_unlock(folio);
+					folio_zero_range(folio, 0, folio_size(folio));
+					flush_dcache_folio(folio);
+					folio_mark_uptodate(folio);
 				}
+				retry_idx = folio_next_index(folio);
+				folio_unlock(folio);
 
 				if (nr_folios == 0)
 					*offset = offset_in_folio(folio, start);

base-commit: 96995467b456942f5bf1c7f2c5c004467f9dd14e
-- 
2.56.0.317.g454f8302e1-goog

