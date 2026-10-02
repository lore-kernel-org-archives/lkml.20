Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0764E06EA
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 16:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790957158; cv=none; b=DcXvcm4e38R8ppDcUXSyqA5O37EPCuGdwpw736y48pwZB5CaZUJZN0rCnJKVxqBD6043EioaIfqFgnMp0LGuZv7YyZFuKlvSeBFFpF86OMhtRsMKmFz53kENLuxZwggjD0UOgfH62eg+eVTuDE9ywYTUZ0SWznnqU79Iq6quy/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790957158; c=relaxed/simple;
	bh=xRy4QMdKcaUkwgi10KXVGxpJeJ04QF9L+vemT6Tk320=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PpnaDUyYcKbtR785keeWLjlY1xMO3kvdB6/IcbacYJk//fSaFfXa1cocyPaJdItq1C9GCVEH0milI4hfzXbIs6uD1oTLoLfkpYX83zrpZRAfQAn69PjfgMmyA1iPu/U46lZU2u2+o5WDFU2uwQ/PMe+JT1G1mJ28nKJF3D7tgqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MvfcQLk2; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MvfcQLk2"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cebcb8d7so1949667a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 09:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790957156; x=1791561956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZjygjUBz0XR9SPSaKsPy+thYHjK1vehyXXIXm5XjrW0=;
        b=MvfcQLk2CVrSDqXye6dyiKBOx+p1iFOP1iv1uekFhjaZ6qiswKzJLbnoiwBDBj7vd8
         ga3BTdnaRqVp5pSQ55eh4Ns06KzK5ZsW32xxlMm9EuAaGHf/MQ3MJdxG8QpDoDmHTwVX
         3gnLTv3M5/C5zjT64wdbT3P8euY20KRbs/D/3Wqp2ge2zMxVxM8CgTS4aT4bDBUBojmX
         kOarJKIar9KWq4GnOlJ/Xzv2TW14JdfflyPYf4Z5jiVytfJUvmN69lhb0wbBhSsgltm9
         us39AK2uDp/LZ/HD5bFIa3m0SG6ElvJnkDtd7hYfzUaikBkrda3qAsiMHazV+y/NcVuE
         Myaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790957156; x=1791561956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZjygjUBz0XR9SPSaKsPy+thYHjK1vehyXXIXm5XjrW0=;
        b=TQiZNRTxYwZlVnVpIcyAeGdX1QBNdBE3qOOCz+74ySNeQWvS61yT5Qt5PJnZfZOWq8
         xJBsAa9Foh4y+oB5ZcPnOzJG9xMGfLVO4Sofq/9/fJUib80HJopFi8lyPkIzO4vOdvtK
         0P+z3+1itkBJopWATmXFCztJNR7x5SNBclqtJiA1tfml3WEqS+3coIycgDOZmh9Yl/1t
         7MT6YlC+GQQZonClPMc/jqGdJhjUIUr7MMv6nC9TyF/ALLci0AY6vY0mM4eyN6Umn+lZ
         yDfwgCDXaG5fx4kajh58zXYet9oE7pBQPZrxytJ/sDYFpahtqT6uYoj3FqEfxpenT8uy
         fqnA==
X-Forwarded-Encrypted: i=1; AKwUvByXIObWGF1KgVcvdJ122PLEow8WXoTJRS0m6WjLOOFV9iWJ1XcGKVhtHXs+v4eapBEmsaMmLRGRNYJW0fs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKoGslLwD1Ni2qG3BjonnfVCRlUikfcsL5Mzu9zwoQL05xGTZqP
	shcibs3q9rMB3ZZ82LH//a929wypOd545Lsk2ACpMqZYr6dv3EAdhn6Y6MXG1g==
X-Gm-Gg: AYBFou3fFhQSCp5yR5N1jg7tz9kNNCxpS4sg9OsmBVTgxJstQlHbADz9jafTxrBDeMh
	+T482e45rxUiLETlu8Dymszf7WQwO+XdQBUf1UYoSI1ww7GJBW9CuiEXcEwBQuZYAjWrCMNxM0H
	qnmOpn3Pw+O2oWsAtyn1mt0EPMB3upAQdnbJQKgMak5hrlGsPg/7OgYJoAIHE6Xd5H4Ei1GLGZh
	Xs6R7kbmCWl2aMhnNq1U6Adq/q8mLpJyApICjTxJ08BanG3WnaGAJppl1pRj06yKsmtnTI8EXbb
	/K0uNRwzqOp8qD4+AwizD4Z0VLF1NR+G+DD5WYJXvV9MY4vVcPaJVgGm7mvY+9634GdJ3iQnrLC
	fmfo2mfHXk5tMEsgEVYBX23uD5Ul4sQqgBDp09/G+SUaD46UL5YoM9Z0k2yIFy6CtGmvGzn6pNI
	gWdel3lTkX+EizfX6cG0WWWoqK9C3pNi4fs/VmFmcZ99SQHkVt3BhoyY+m4pNiaF6JWxPqvTqq0
	cHRU2zd6pAgsBD19IlY3hCF
X-Received: by 2002:a17:90a:c2d0:b0:3a4:7195:ecba with SMTP id 98e67ed59e1d1-3a6ceae19b7mr1744874a91.20.1790957154464;
        Fri, 02 Oct 2026 09:05:54 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f47cb357sm9375672a91.17.2026.10.02.09.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 09:05:54 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	"Jose A . Perez de Azpillaga" <azpijr@gmail.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Lorenzo Stoakes <ljs@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>
Subject: [PATCH v2 1/3] mm/memory: remove unused vmf_insert_mixed_mkwrite()
Date: Sat,  3 Oct 2026 01:05:32 +0900
Message-ID: <20261002160535.661399-2-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002160535.661399-1-ekffu200098@gmail.com>
References: <20261002160535.661399-1-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 38607c62b34b ("fs/dax: properly refcount fs dax pages"),
vmf_insert_mixed_mkwrite() has no callers.

So remove the function and its declaration.

The comment above the function describes the -EBUSY handling in
__vm_insert_mixed(). Move it above that check.

No functional change.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 include/linux/mm.h |  2 --
 mm/memory.c        | 16 +++++-----------
 2 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index c038d06825c3..2ac734efd4ec 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -5008,8 +5008,6 @@ vm_fault_t vmf_insert_pfn_prot(struct vm_area_struct *vma, unsigned long addr,
 			unsigned long pfn, pgprot_t pgprot);
 vm_fault_t vmf_insert_mixed(struct vm_area_struct *vma, unsigned long addr,
 			unsigned long pfn);
-vm_fault_t vmf_insert_mixed_mkwrite(struct vm_area_struct *vma,
-		unsigned long addr, unsigned long pfn);
 int vm_iomap_memory(struct vm_area_struct *vma, phys_addr_t start, unsigned long len);
 
 static inline vm_fault_t vmf_insert_page(struct vm_area_struct *vma,
diff --git a/mm/memory.c b/mm/memory.c
index 330cde31bf8b..4b2e4be28031 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3052,6 +3052,11 @@ static vm_fault_t __vm_insert_mixed(struct vm_area_struct *vma,
 
 	if (err == -ENOMEM)
 		return VM_FAULT_OOM;
+	/*
+	 *  If the insertion of PTE failed because someone else already added a
+	 *  different entry in the mean time, we treat that as success as we assume
+	 *  the same entry was actually inserted.
+	 */
 	if (err < 0 && err != -EBUSY)
 		return VM_FAULT_SIGBUS;
 
@@ -3085,17 +3090,6 @@ vm_fault_t vmf_insert_mixed(struct vm_area_struct *vma, unsigned long addr,
 }
 EXPORT_SYMBOL(vmf_insert_mixed);
 
-/*
- *  If the insertion of PTE failed because someone else already added a
- *  different entry in the mean time, we treat that as success as we assume
- *  the same entry was actually inserted.
- */
-vm_fault_t vmf_insert_mixed_mkwrite(struct vm_area_struct *vma,
-		unsigned long addr, unsigned long pfn)
-{
-	return __vm_insert_mixed(vma, addr, pfn, true);
-}
-
 /*
  * maps a range of physical memory into the requested pages. the old
  * mappings are removed. any references to nonexistent pages results
-- 
2.43.0

