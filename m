Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827023;
	b=4oXUToWiyJAf7VHJwtmTLyS7P9CdDdiZ8LaHpFlbJfwf0DmapnBt0Hv3tRnG89JXNaTg
	 QsaDaZ0PLFFzaeXc6IMZjdQECQi7ji7wT0se0f3DcXMSBdp6WKqyjkmLK3S9JbHE3zg5b
	 0nAJlANZsgeWUzPjCRA3TsnYMMvAfFdZzYUhtEy+WbxPiN9z+foU3BGTr7R6MozkFfVws
	 upJQ/rTLUf03vH/ARLoriVxEmLnYuwa/mQBSzXG1SYtPWlCo1blWMeEDQcLtuRuvJeN78
	 Ofe2dWuGhxlWkkKOBMtSBT9Jnw4A++0NWEvFPDvt26//9PaBzc0bwUZaE2sqJ28zoFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827023;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PH/J5T/Zisv/IuxWjVJ1q31kRUwi5lZVkNYG9k7l4V4=;
	b=MOaxbYlMYS4aa6uqE3o3frZswpQovy4Jts9SYK3JMjkO/Ssn+DHYl4Nc8GXNbZVLNuxY
	 kbfkxw5CKWvEbeCfKNmVwxPLe5ivlT6yBA2Rm47ZtMWVV/dFsuxY3MkFx5UqI10jnYWgh
	 JPgJlbU3jg3FT7CO5wQQEWw8CwAYl7hCfMSvUje0GzHhbJxc07dEY1+/OSC9AKu0S9t42
	 uwlO9udKIE+rcGQVJiVy40dwBlr/0vROCeLbDDuxmvH1x5mJcWk7Hj1eA2eS98uQLceJ7
	 OOw0XN1FvHnhwoMHoxAGTjxVaDkQeismpWLNAmsrW0ylhAmI1E+dMXKoWPwgTyZCaqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WzLlwiXw;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178A7606A32F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:03:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 178A7606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WzLlwiXw
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1b3acec6677so4476208c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794827022; x=1795431822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PH/J5T/Zisv/IuxWjVJ1q31kRUwi5lZVkNYG9k7l4V4=;
        b=WzLlwiXwSJesxpDgNP8GiSABYjAz/kkKupDW+ww5fs0Tfftvggo1yPlFTj+IeF2j78
         +zSSw0/n7Q5vECREW4KYJL4gELfTzjBghQneUHjgIV4JuDxJMfjhVaSqaKYLveyGsFH1
         GPnokFormyFyrcw2I5u8+VuST9CnJOyy0QQzMc3etrac6jpwzxzl4/h5AMKjSbZWT9Yj
         UytOijH5RgUSwkIsBrQR0MtGx4gCNgSZkWDPcHKns+NLbY7SShm4z4jmHxb5j2kvGP1a
         5eAOaQHB/nI4k9XkEGpoJlDTysxK7AFrIRgziDFW2NEMuZYwJWp+h3BQKHvr8vA2ZfXi
         hQ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794827022; x=1795431822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PH/J5T/Zisv/IuxWjVJ1q31kRUwi5lZVkNYG9k7l4V4=;
        b=uxRG2PqJvUvZf9a/vH+vDJd+Mp6T3RwDRM4qFClmtYtXnv1SKym4UBtIo8Ox7lD0vM
         sZybDAHZFpJNY9FgCnwWgemmrA4RXuM/Iw33V2IRf8ImGwrYFEm8BhRnyxspq4eq7rum
         BXlQ6NLKvFz1h3ffV0p2vGVxb6vLYo7z9anRIsCVBVeYWfk8lFSrD/yY1obDu+aNpuWx
         U1yfhqMDHBHFzbEcIYDIT9/Tplq0TR6ksmtqpm4yktqMwg0S3NbiGUw3qJfAvdaj45LP
         zgjMEW8mU3Cy9785XT9WKKml9cXXid1PAYPiVFTwHXeEW3HuqLfbrv3P0ed+kZjorcVQ
         MwDQ==
X-Gm-Message-State: APuU4Z+7u4B7vH7XeW7D6dGV6p6ax5wYKt1484CrDG4kucuQufyKqKdY
	+fgx9TzqogtutOxGPjOtcNgNREMlUp0y597AgriLzmBavda2lFrCF1Je
X-Gm-Gg: AYBFou2zV0qOGmCb2UwWi4muUMKXVl36tShsY55Ec6RZswPLKsCKKyzbqw/grhAXQkr
	IBvImjtEba1i7hTO9wIl62hs9/GDe7BCiBB9XcQKtkQO35rPP5RJorDICdrcoBveHicsZxxqZpK
	sZiSbjJPe8+bar832O370n9SCmVjhSHfiV1VYolRqarxQGOSq0KGQPZHxvDHd+Lmss/l9ArgwdZ
	R7KmbMokEczWclQ/fsQ3bATOEIXahM7LidnlVsCO5TycE5l4+z+4at8FyW201E+5FRYMT3++dDS
	4UPrIjACZCaLtcPh/nK0ZQpEvnaGOIJNZdjsVIN6bfnSqSp3nsrZ47Ih+hOAvEv50DuJlqNfozX
	qr339lEcGb5CpOcEWixCj2TC8xrDdV6rwfs+I+cbDtV5Lp3XIlfry+8MedHXw7bjgQgwnKZw97X
	vK/g2cmFzzGuIel8wuIWNUSfyqPqEOMTul/FCejsYMDIC9VF+qR9rtnAyWfz/TufmrcR0FyU/Ue
	ZRXDlzk7y60AVrzoVig5bgYAqyhYZ8/y9PmF6rfNM1tCYom0jEfad+3q8u8lMV8vxwzud1I5CDS
	UsJMbKpT92uyharOtsN/Jtk1tXPXNvCuXUaPREn7ipEjNKhn7Ed8efd5iLAlr7rHzAeR
X-Received: by 2002:a05:701b:271c:b0:1b2:43b0:4794 with SMTP id a92af1059eb24-1b5030d4941mr7826513c88.9.1794827021837;
        Mon, 16 Nov 2026 03:03:41 -0800 (PST)
Received: from naki-PC.localdomain ([203.175.14.54])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031918c7sm42999260c88.9.2026.11.16.03.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:03:41 -0800 (PST)
From: nakixii <nakixii@gmail.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Nhat Pham <nphamcs@gmail.com>,
	Yosry Ahmed <yosry@kernel.org>,
	Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Barry Song <baohua@kernel.org>,
	Hugh Dickins <hughd@google.com>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Mike Rapoport <rppt@kernel.org>,
	Peter Xu <peterx@redhat.com>,
	Suren Baghdasaryan <surenb@google.com>
Subject: [RFC PATCH 01/16] mm: userfaultfd: check the exclusivity of the page being moved
Date: Mon, 16 Nov 2026 19:01:07 +0800
Message-ID: <20261116110122.309748-2-nakixii@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116110122.309748-1-nakixii@gmail.com>
References: <20261116110122.309748-1-nakixii@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

UFFDIO_MOVE checks PageAnonExclusive on the first page of the source
folio even when the source PTE maps another page of that folio. This can
reject a move whose mapped page is still exclusive.

try_to_unmap_one() can replace earlier pages with swap entries before
folio_try_share_anon_rmap_pte() refuses a later page, for example
because of a concurrent GUP-fast pin. The first page can then lose its
exclusive flag while a later mapped page remains exclusive. Checking the
first page incorrectly returns -EBUSY for a move of that later page.

Look up the page mapped by the source PTE, check that page's exclusive
flag and derive the folio from it. Preserve the existing folio locking,
reference counting and split handling. This applies to ordinary swap
unmapping without requiring an additional page-storage backend.

Fixes: adef440691ba ("userfaultfd: UFFDIO_MOVE uABI")

Signed-off-by: nakixii <nakixii@gmail.com>
---
 mm/userfaultfd.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index 080a00d916f6b696ef326b6e76e205970a94fa8b..d8a699981d097ae393a981a33cede5f5ce6e2725 100644
--- a/mm/userfaultfd.c
+++ b/mm/userfaultfd.c
@@ -1225,6 +1225,7 @@ static int move_pages_pte(struct mm_struct *mm, pmd_t *dst_pmd, pmd_t *src_pmd,
 		 */
 		if (!src_folio) {
 			struct folio *folio;
+			struct page *page;
 			bool locked;
 
 			/*
@@ -1238,8 +1239,20 @@ static int move_pages_pte(struct mm_struct *mm, pmd_t *dst_pmd, pmd_t *src_pmd,
 				goto out;
 			}
 
-			folio = vm_normal_folio(src_vma, src_addr, orig_src_pte);
-			if (!folio || !PageAnonExclusive(&folio->page)) {
+			/*
+			 * Check the page to be moved, not the first of its
+			 * folio.  try_to_unmap() unshares a large folio page
+			 * by page into swap entries, so while
+			 * reclaim holds it, or after reclaim gave up partway,
+			 * the first page can have lost its exclusive flag
+			 * when this one has not.  While reclaim still holds
+			 * the folio, the trylock below sends a large one back
+			 * with -EAGAIN; once the folio is split they are the
+			 * same.
+			 */
+			page = vm_normal_page(src_vma, src_addr, orig_src_pte);
+			folio = page ? page_folio(page) : NULL;
+			if (!folio || !PageAnonExclusive(page)) {
 				spin_unlock(src_ptl);
 				err = -EBUSY;
 				goto out;
