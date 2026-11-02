Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616095;
	b=ZU9Q/Vj/KJCs0AnXVpxjoB+Pdd7f+yWCuYrKCK1vtZvdO6mP7u0nm4Ja6BWQih246rTW
	 XM7D4s/1EAzxqyy8gk2vr3Fad1Vg2LrCvLdorBrPZdJMN/8+p0HUIOnYQAnujxlM9qUrw
	 TJuov3e3XY82h+ns0ckHw6SulQWipHF/7pr7pUtgeHLBqzIVoD/cqlwMtXsrv6V8H4XYr
	 TTJrm005TdbbWQOhRAuT/FqUGTEWKtN7Tw2Q2xsFOPTuyanehXuRC9dMl1sOMvsvis94U
	 YRdk+ZAyhwJOuQRywXDYQL6xRzh2za4JEVbPksZBfkexAOzypjj+olHC5xnQVzH3ong==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616095;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=w4LlOPP020au30EZIDHlk1alCgqnzjFeQiEleoj/jqY=;
	b=0221/TR+1+ZmcpgyAZyiuMo39N6I1g2dOvCHDkvlsbg6aZ0gCth7faBxZ7IOgOVGMNRy
	 aomxgPcySK4/w2wJMC+wKD589jYQ28Izh5uYK8Ul52YNcr8J86M5MJBKIX7/6E/Al/aX8
	 YyNwW5Nxse2Gkh2ai68UpLmXQyt2UYdTRKNZkFHbG6IKZwdR5fbSZSl6DxULeoMygdZdG
	 vjw8/OnZwq3W27VgFDA8mxGXJKBUT/6HluSTqZJ5xw75AuyRqKouf9D5p4MnGFzKpHPWT
	 E1JA4bPyXNSL2OMYFlp+ARaXLW5jtFY/mLqqDUKi75vrUSkEb1TGR3iK1ai0UfGapCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HDmiOFg9;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB4B60A3807
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:41:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AB4B60A3807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HDmiOFg9
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e9eb579c0eso14324835ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793616095; x=1794220895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w4LlOPP020au30EZIDHlk1alCgqnzjFeQiEleoj/jqY=;
        b=HDmiOFg9LmWC1qeIeOmdtC0BdN5SaLCKolsBcI4ZZdNKTGn0LHthir7vWVd1xjBdol
         o7pODJQWwOqFNCJKbr5oTsGtSkAhzdjOhsiKKq8KZsiudWLjYot3nJ1iGFMuVOti6Vm+
         AolaRGT33An/VO1zqH7BFHx2RleU5szmO3vL1BFJ2dSpmOzf7QrQ4pLH2Gu/BgmKyzGJ
         XHrykPkhekEYSgCv5VVgO2W9u2fhCbD/rslgsXGoyVOiNxw2QHj6cYCezWEy2KEwdZCX
         Rkg5iHHTT8Xfhmbps7DNrcTeAZd/Ap4dhBcGCrS3R0pMmg0c4Y+ZJqt7E48lLOv3dsbA
         pqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616095; x=1794220895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w4LlOPP020au30EZIDHlk1alCgqnzjFeQiEleoj/jqY=;
        b=GkrCua/LQkTblcLF3kpsAlRlUfHdPn2/bTnkiGctQLqCgWrRcnTxCwW7AECpcq1TXl
         EJ//64B16xkfp/Ft/oRfTOpJ1vfynxtRyrfp51JA9239sLL0bNzdn55bTopwRnq1hDgH
         q/2GoQN+Tt5OjJLf7YfKXTgM/KX3PdmTGRJYKQn2fqX6/zv1u7BE9fiBTjxuvkuihiBt
         bWFaAMzDPmVZdeIh7ttuxGkB8V+FCqOh+HDkEjRK1Y4YlsLUsTdlSKAHaWh73pcKp90/
         GWAxu3cDaSvBFWaLig5dIAXyEHbkHSU4b7aXYa8WrMYQ8CaKhT43q3BIshx0vL/8yTDd
         qJ+A==
X-Forwarded-Encrypted: i=1; AKwUvByvaSCpCvDKuPtI6jhXfodai/ikRvu6MMiCNv2yvRMmaZEYsjdvnPW8TNPFAMf3qD2USNKdLGw2D2ER4wU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gUwxKDZJ0xq/REIF+NummUUY4KPlUKfntQY7eVyptikXS1Sa7
	mZ/4C+b6S0dHJ1J4jAta6ASMF5ahInccpMNmG6OT72xjQcMmELVtE4ZYjwMJImGw
X-Gm-Gg: AYBFou2x7P5E4IXdBzg3d8ScDXapZUlh8oZXQrEM0I4spoJVlOYEIc7iF3ejaVHGjom
	XtDrq4UCGeLfEH91VHT1ef2cUwEG0j+nVy/TrEerxrs8QF61mjvN4SQX03SaILraIvq7WOrpCK3
	jBiYqhtAYFZEy8LJnDrY/2+ZMt/uUaY8XorPB01GqxDmiKSPzrs4BP2Ev7Z4dbqLSHcxE8QdGxC
	GqHA/bAjNwNLPGvusnqpqgk8S+oKEGEnisTn45n+ZS1BUMMAqjxDhjztUKw/YT2WDTe36mCCI3z
	d4QKPS+5oVT0mhvMCvrZr3xHv5/QRNv8GLu0AfRzQkroBY29jnVp3hTieH3doVo0Nk7hkbcoa8y
	aE2RKd4Sc/N8+a2/IMftYREHwAxghtOALBPtZMAvCfJnvWByV5SroPHolmg+F74un8NkZKjTR3f
	N9y8KSmAcXSEBfIuQYlfZ/eg5fXH5z+u76yF0zy/YKZnnRvZebMWMtgR7pVt0eHR7iFJADRzv8C
	TJxH8mlVY5kHw0/B19tSjRiRkIDAxuhzAb8cOlc+AeVipAXnErVAI5Pb5RRHx+WBIyz0KqGJisQ
	/hCaj+Qua/C6jcVbv/OjRtK9i5rNZjZyTxgJfdliCeJ2jv82KI1H
X-Received: by 2002:a17:903:3bd0:b0:2e9:f354:e97f with SMTP id d9443c01a7336-2eb36482f5cmr79668765ad.60.1793616094571;
        Mon, 02 Nov 2026 02:41:34 -0800 (PST)
Received: from umang-Inspiron-3501 ([2401:4900:1f3a:7c59:eeec:de7d:b077:9b9f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3925ff38sm25195465ad.36.2026.11.02.02.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:41:34 -0800 (PST)
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
	Shuah Khan <shuah@kernel.org>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Umang Pokhriyal <umangpokhriyall@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] userfaultfd: validate the whole range before changing write protection
Date: Mon,  2 Nov 2026 16:06:20 +0530
Message-ID: <20261102103621.156928-2-umangpokhriyall@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102103621.156928-1-umangpokhriyall@gmail.com>
References: <20261102103621.156928-1-umangpokhriyall@gmail.com>
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
 mm/userfaultfd.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index 87da92526..b8a9d9574 100644
--- a/mm/userfaultfd.c
+++ b/mm/userfaultfd.c
@@ -1105,21 +1105,31 @@ static int mwriteprotect_range(struct userfaultfd_ctx *ctx, unsigned long start,
 	if (atomic_read(&ctx->mmap_changing))
 		goto out_unlock;
 
+	/*
+	 * Validate every spanned VMA before changing any of them, so an
+	 * invalid range is rejected without changing part of it.
+	 */
 	err = -ENOENT;
 	for_each_vma_range(vmi, dst_vma, end) {
-
 		if (!userfaultfd_wp(dst_vma)) {
 			err = -ENOENT;
-			break;
+			goto out_unlock;
 		}
 
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
+		err = 0;
+	}
+	if (err)
+		goto out_unlock;
 
+	vma_iter_set(&vmi, start);
+	for_each_vma_range(vmi, dst_vma, end) {
 		_start = max(dst_vma->vm_start, start);
 		_end = min(dst_vma->vm_end, end);
 
-- 
2.53.0

