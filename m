Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793607110;
	b=YQ9a1N5IUnbvm3aSJcuA9Gr9K1acSdEDA6eZprQlTeZpHVLSFIhoJ2Vlq8Qp+aePJOV2
	 +Qkh05yTiTLyNqJjG/PwzWb0x6TlyJPc+0EQtUQ+UyUaqOet+m/3zKuyKw4Q9SRNFpw6t
	 17Ytgu9qu8no0qiHFiBZVfPiamcDuML0asMtqjEm6dMMmQkVadVVQVU22sjiZrIznaRlB
	 Elh5N+bXfKNYxZQO0X6+XknM22cdQWpD8DVglytpg/+LhMEf9yVvwUWDNsImSbnN8xoKH
	 u3pZEm8gI9tXDo1xZdCn/KwXhOr8ppbrfeCPVaRFXYi36nQOrvv2CEKDuihzc+Cj4Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793607110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FAyyYwHdR5Ch5uO/F1MiXirGDsn56GrI3GAO8iDRceA=;
	b=2xfnJxnP+vo4w5ij2ttd3xx78r3oA5Sun5bdMJ+iywvIUyZLOJWUGYd2+OMzOCcLhlc0
	 BhJxKPgx+8amZRJnmP63XpLsYKm+3dBhxzZSxWIR2M7pG7KgyHoXDEZT2opRlr4Ze99LE
	 jom1c1RTPFj++n7kNjcjIxEPRoEO3Fx1Q5fXgo+uWooD/kirWFNEuDAI3IynqSPipo/kp
	 Q2K5OQj1W5nTTl1lTWIn8n5L9znkwyTjn/dP3TM7ZMWD3prAs7bYQrhl7aPS6mLKXying
	 HftZuouDvXlUoMNAkXDk2tWrfQCuDCWalbTHEEgudm+o4Ek6/VIsob7Zj0ob6geOnsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YStxYhS2;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A29606A32D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 08:11:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14A29606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YStxYhS2
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so24399525e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 00:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793607108; x=1794211908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FAyyYwHdR5Ch5uO/F1MiXirGDsn56GrI3GAO8iDRceA=;
        b=YStxYhS2u0SmwT7c0BAO3eh23j05Vsv0xbEu/kN1OVblWYq9Lj6EC9f+W+RuyafvaW
         jDYRmFK2XFgD850Vh2O9J+HJ1uWuVgITD3z0D7S8Xb74iG8k+jScmYN5ap8X/oV4xYkP
         XK++OAjpueHON5AlXSh70ofRtiil9xZF8dligA3Z0P9KitQ0n76P61ugapBc7RCOoMew
         3j6+fLkm4kqdrmrKGWOZKw6+KAsTP+FQW+hzLea/S0/2GhUKWYxfkCWdDL0TzNzQqme6
         7epabvsLqV01UUxAJeQ3ZRCXuPUiXynx11JzazCmGNOOlTL0ZSxpQ8mC64M9YF/BjEyc
         pfdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793607108; x=1794211908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FAyyYwHdR5Ch5uO/F1MiXirGDsn56GrI3GAO8iDRceA=;
        b=aBgbjqGOea4sTph+Pih/fV6NHuT0NgiasG+ipxm15H6LdtxRzWdflC4cRUGnv4GJpw
         snKBUWDtQWxq8z7xxnkU6XOtB0Ex0PKGTxc9te/DrE7mTQKK5cnPtMXIwhR3eW/cuP8O
         yQx7/pc9ItITGtuhODnYC3C1bVsnXL4MmNXgeXM1di6fDMT2S5jhyG/te+4VpSUHefNO
         5l5zSGRy7rDhIUeldKfpTzTRZFqPXeF5E/chv+7dQ86yWSLXbLNdWDU7HEBkZ3UxdkL2
         ifIl95mLCkkKdeTTApzgg+41l+y2ToVw1DK0++HVNumaKcDYLQcWr2a91nxbMNvp46T5
         4Wfg==
X-Forwarded-Encrypted: i=1; AKwUvBzun/N5dflgqeVNDikCobDYHxgfPPSUc6RwAekC0MsbNCYhaE9j3RwOeUsXVioQ2ODh4Z/NQrwBfXwoXpY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLzbkzjmThtzJtR/YR7zB7QxXtlYeF+QukgFxW7SEhwkuv8240
	j9ww38v45WzKmS2968ERlRpjSPAGqjT8UNeLOkVwAIAP2jhnHjF+iw2T
X-Gm-Gg: AYBFou0SzRpMh3XnV2aiTsvnZ+NwfIT0BxnwLsl9ID3d6fNKnvuTPwo/x4YcCTVu9Z1
	nFbacVccOU/x/fa3rECAg3LuyJq0AFNHWgKsrHqOe0RO07sjLDzJNEQGd4MwYxYCUJ8WB33grW/
	5+fhv7msoxvZX1Gz/7219Ws/NUbiB78d9BiJKuaktHuzuIHn2u1PIQoPFI4BPOxLLe+ZmUMaf4S
	DfhtCarI74m1A98L/yXOIe3PjuRTQaq/gkaD8446dP2ZEHghr4LhiJy5iafkXvi3L0rgy0l8RUm
	U9gigii9jEhaDCNL5rh/jxqHLsITgnUpZ86EZgAMH9szh+I4mVb6d0aMU3IgO6lqVHUM8FBCZIX
	NGRRsN0yp/WMvFIagGIUDES4WoFeSfI9M4x+yl/1hNFXhNLANx3Kz3/ZchqoorYtCPSY2+PEmET
	MDihtr3Zwzb+j3jMEtyB2DnpKu9h2PLymsU2SeT5UmMmAsTxl7xqlML78uWkizFBZdTtbt4fKTe
	rR/7TPGst1wnXKgh8+1dMrfO5i2XaoZNXqP5lUFwlhgfzgvNK9MKE6C7AmGhXO47ZVcW3nOiAiR
	qLmDn/WmHlxWcA==
X-Received: by 2002:a05:600c:a00b:b0:4a2:180b:3153 with SMTP id 5b1f17b1804b1-4ac185bcc7dmr226206975e9.14.1793607108359;
        Mon, 02 Nov 2026 00:11:48 -0800 (PST)
Received: from nobara ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa8213ead6sm333331005e9.14.2026.11.02.00.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 00:11:47 -0800 (PST)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Peter Xu <peterx@redhat.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] mm/userfaultfd: recheck WP registration in the hugetlb UFFDIO_COPY retry
Date: Mon,  2 Nov 2026 09:11:30 +0100
Message-ID: <20261102081140.201987-2-azpijr@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102081140.201987-1-azpijr@gmail.com>
References: <20261102081140.201987-1-azpijr@gmail.com>
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

mfill_atomic_hugetlb() drops its locks to copy the source page with page
faults enabled and then looks the VMA up again. The retry doesn't check
that the VMA is still registered for WP, so if the range is re-registered
without WP in that window, a UFFDIO_COPY_MODE_WP copy installs a uffd-wp
PTE in a VMA without VM_UFFD_WP.

Recheck VM_UFFD_WP for UFFDIO_COPY_MODE_WP copies after looking the VMA
up again, and fail with -EINVAL if it is gone.

Fixes: 6041c6917903 ("mm/hugetlb: take care of UFFDIO_COPY_MODE_WP")
Cc: stable@vger.kernel.org
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
Changes in v2:
- drop the leftover sentence and the non-hugetlb reference from the
  commit message
- add Mike's Reviewed-by

v1: https://lore.kernel.org/20261029221129.89068-2-azpijr@gmail.com

 mm/userfaultfd.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index f33ccedfecd2..6321bb82c1ef 100644
--- a/mm/userfaultfd.c
+++ b/mm/userfaultfd.c
@@ -810,6 +810,10 @@ static __always_inline ssize_t mfill_atomic_hugetlb(
 		if (vma_hpagesize != vma_kernel_pagesize(dst_vma))
 			goto out_unlock_vma;
 
+		/* The range may have been re-registered without WP meanwhile. */
+		if ((flags & MFILL_ATOMIC_WP) && !(dst_vma->vm_flags & VM_UFFD_WP))
+			goto out_unlock_vma;
+
 		/*
 		 * If memory mappings are changing because of non-cooperative
 		 * operation (e.g. mremap) running in parallel, bail out and
-- 
2.56.0

