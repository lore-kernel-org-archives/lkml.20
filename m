Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793784997;
	b=VgSsQ/MmStIi+gEKS1mIcQiFbeiRpVkCozDXd+2rI8sA8xInCop06rgVzR9w6Wf7tAQJ
	 h2iEAbvIGT9QfZRjSEzvnQUGyP3SIWsnJjqhnipGj+SwGV82k5PySSST6XJYQAitl+Wpj
	 vGBLancum3shdTCLjbhOG6GI2Vo4TebyxqgtZXbcT/Re4de4B3OtM2/Zp2IGX96IdSuiy
	 JGwVcn56SFoWHYW/nw0auvxn4YU7vU95l3/QXr0u8CogkzEFhUuyoiy/z7aCiNiQSvqam
	 fuHsO/dvd1x9x6SNKAvWOqIjef9BZI9TjG70JUUR1tXt9K4BP31eLz9Qxu9k7UfRFlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793784997;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JsLxVuR1g1JSvibC9g9YzUf7PO6/MZgJEB3OXBOD4y4=;
	b=JFhCqahkdWrLIXphhYyviOCY+uBlXOTGFbtswZcrS+zeLytvyrDHgAjcR8r7CoLwAz72
	 3e20GTrSS8QxYlcxlmRJNhpALcHdJu2Np5hHttZqnv8R768Be8bHZN16Z1eWWvMXtfGh2
	 5Z+0EQlZ00NSSTjvi8HF7+PaO2PDYeFR138rO9R0Z5R5eJ7L+eAV1XnLCLvBdrNjTY8gY
	 HiXbRZUCQL9Ecm9HC+6qbdxYhneXGOFZkiwOJXeMUY3Ge8VjMTJfKxX7kHNW3YB3zvmSv
	 NwRtWNgpcH07XL341aVEWf6S/f0Lv1zLEx6s9B+HCfPBpf/8XT3G1vFY9GuS8BUID4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=stuoRtoR;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C81606A334
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:36:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31C81606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=stuoRtoR
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cdb2e0062bbso198386a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793784996; x=1794389796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JsLxVuR1g1JSvibC9g9YzUf7PO6/MZgJEB3OXBOD4y4=;
        b=stuoRtoRidGUEY/NHOH/VkhsNHY7nu3HMo3pbT7UcNI9Ohmpgu9UEEOR5dYfwWVoIK
         asJQn+ju/y/hp6GKiUnWsd4jDFlyNfyJJ1xhQrXMEkut1r+G0VUJjCdKHQrXBQVdUQTm
         RCGuOjVlPXySS3wYhL/aIud3d6oOivlTqYlQ20AgFej+g4nfpOilVKbCNk10LdCeb268
         hp4AZ2QhkH2UAlddVkjD2T+bHQcFASyZkIHqvfRLEqgurtzx/o8GYhmfEA3DCcDPxzxS
         /cjPToH18Y3bg5j0QILen2C3d8KRDl9Y2nkRRwKcDKrN+LrBd4W3h6fIHa1Qj1bdeF03
         MyDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793784996; x=1794389796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JsLxVuR1g1JSvibC9g9YzUf7PO6/MZgJEB3OXBOD4y4=;
        b=H5NNVNmIQ+5d7G6Dfdq5jZiS1oAOx1A4qi59Qe2scr3HI1EM5lPDAYqRodYpMtnShd
         IoU82qnsAaU4GRPFxPeCJmhCkSbtapO15+QFBB2RdR8C30oKNBJ7RlPvlFRuHfj8JMs3
         tZPRruiV6tFcJLPWvQ0PHxP0ABkKjorvExLJe7htOFa3yhK8Q/5oTX8AIAZCmogaWfFY
         uJOUCnvUHeJp7dIzk9zHQbIo/5z746WE6QmYPja0ejHqbdVRbOmJLqL1xG47Jm5UvKxD
         +5N5j64fMdgrkXwHhTNiE0YMhGWdNxFVpsovkVKcelenateJchc4ia5brUeXsOED7ysU
         LyIQ==
X-Forwarded-Encrypted: i=1; AKwUvBwIHxKxezHKUVVD/LzND7q+LweaGaM/ruW25qi8RLrZqJDQ0v6LKGlqhX9CDZZBawtkp9OfFbozI/MPVi8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jlTvmBO8ikpHGJxH56mx0HsgJ0DcyCPiNpbJVvaRIGeMC3RS+
	ukGr7mZux6DchFOiq4tzxhK3gyRwIyUaTRz+KJcXZVYwa48rViKtTiT2
X-Gm-Gg: AYBFou2l620oEMa53aa/rqxrQ56DYBGjNvEA6qg6FuS+vZLXJr4+ozXuBIgzzae2PoH
	aqC5RA6XVYOcDKx7PumEG0dmh2v4J35b8cVriZ+gy7EMwhIwz/XL763c58RWkUT0sJm+8f5sfqB
	yyumW5HDMy7sC3G1RHOILiKbzlRAJp9UxMCo3MT/ZnDxvK/kUyUSfNsck1wz22MR+aaPwDjQtp5
	PYlUPGk/LV5wevqJdjHFK07tVTr2+OmBs0g61VfMIf6t3i4L4e76aJy849YeVfbS7Zlta16+Tko
	73jfNQRtv3MnkaAJnyedCRK3gG1NDQuVEuPku3k8vaQ9bRfqQ9on+gWwU4RnRALzrKJsxSNvIu0
	9OCLoVAyfDPAfIwYKQsyXGRlgtrW3FqDsk9GKOqVxgIoxWqbGJKm11h7UMEHvTlCwJxFHHqeapi
	2uHymXem9CfPrR4OhBQws6+N0SpvoHeeeD05s+1/R6QMONwrKsAkA2WJhzp7UkMqDKewrFoNRVe
	s9gHvoQyD/+F81l66tnXgVLgW4jl2KZtjPUeEt6zh4ogo6tZ+k1e4htlvHlKjvivd7fEUqrEaLs
	Qaih5eazDtUHA4l7p3PSkPmQfOsLCpdLuuqXnVcFI7DIMubnPx71UGpw4LKf4bTwzi07Pk21OA=
	=
X-Received: by 2002:a17:90b:4f8a:b0:3a4:ca46:840f with SMTP id 98e67ed59e1d1-3ae896f8655mr12708132a91.8.1793784996534;
        Wed, 04 Nov 2026 01:36:36 -0800 (PST)
Received: from umang-Inspiron-3501 ([2401:4900:1c60:e7b2:951d:848a:7f25:3900])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c7e087csm8569454a91.4.2026.11.04.01.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:36:36 -0800 (PST)
From: Umang Pokhriyal <umangpokhriyall@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>,
	Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Umang Pokhriyal <umangpokhriyall@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] userfaultfd: validate the whole range before changing write protection
Date: Wed,  4 Nov 2026 15:04:57 +0530
Message-ID: <20261104093457.152245-1-umangpokhriyall@gmail.com>
X-Mailer: git-send-email 2.53.0
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

mwriteprotect_range() checks each VMA as it walks the range.  When a later
VMA is not registered for write protection, or is a hugetlb VMA the range
is not aligned to, the call fails after the earlier VMAs were already
changed.  When unprotecting, userfaultfd_writeprotect() then skips
wake_userfault(), so threads blocked on those pages are not woken although
the pages are writable again.

An unprivileged process can trigger this with a range that spans an
unregistered VMA.  It hasn't been seen in practice; it was found while
reviewing the userfaultfd range ioctls with an LLM.

Validate the whole range first, as mrwprotect_range() already does.

Fixes: a1b92a3f1498 ("mm/userfaultfd: support WP on multiple VMAs")
Cc: stable@vger.kernel.org
Signed-off-by: Umang Pokhriyal <umangpokhriyall@gmail.com>
---
v2:
- drop the redundant error assignments in the validation loop (Mike)
- drop the selftest (Mike)

v1: https://lore.kernel.org/all/20261102103621.156928-1-umangpokhriyall@gmail.com/

 mm/userfaultfd.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index 87da92526..1b7320d0a 100644
--- a/mm/userfaultfd.c
+++ b/mm/userfaultfd.c
@@ -1105,21 +1105,26 @@ static int mwriteprotect_range(struct userfaultfd_ctx *ctx, unsigned long start,
 	if (atomic_read(&ctx->mmap_changing))
 		goto out_unlock;
 
+	/*
+	 * Validate every spanned VMA before changing any of them, so an
+	 * invalid range is rejected without changing part of it.
+	 */
 	err = -ENOENT;
 	for_each_vma_range(vmi, dst_vma, end) {
-
-		if (!userfaultfd_wp(dst_vma)) {
-			err = -ENOENT;
-			break;
-		}
+		if (!userfaultfd_wp(dst_vma))
+			goto out_unlock;
 
 		if (vma_is_hugetlb(dst_vma)) {
-			err = -EINVAL;
 			page_mask = vma_kernel_pagesize(dst_vma) - 1;
-			if ((start & page_mask) || (len & page_mask))
-				break;
+			if ((start & page_mask) || (len & page_mask)) {
+				err = -EINVAL;
+				goto out_unlock;
+			}
 		}
+	}
 
+	vma_iter_set(&vmi, start);
+	for_each_vma_range(vmi, dst_vma, end) {
 		_start = max(dst_vma->vm_start, start);
 		_end = min(dst_vma->vm_end, end);
 

base-commit: 74d73ffcffe03804f97e9fb82301dadf75671282
-- 
2.53.0

