Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A6B2472AF
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790986906; cv=none; b=Iu9yLYXvddsQQLNlw85kvAcnpVID81TpnzweAP3CGZ1LpSHn/d08oQHmKK6VzKrmawEIqrpE6hnfudYGLaaGaw+8ocHU6iFuBDyYJM7t5Nz5xH43RqyQio7pJP7vOmkqXV2JhbuYWJeMZRgGB2ERHd07NKaL6127jGdiVPXGV8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790986906; c=relaxed/simple;
	bh=xX3zwQ4HtzHbqeKDGvy1XqZ6Q2KT3VFq0dA6obfwP1o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CmYayucHs3cGeldP15IlL6WNODghAbbJFoN9aHb+zoBzumOl2AHyW73460thmh8ZuMJyug5TbkPq1w9AdmtoSEURxghREmAOyfSq56B295qOpFoVd2vxqM6XhxW6uzSNnnGmQkpzSlu21A+w42LqTkS2yaB4tjBYPKKvvYxBVlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=anN9nofx; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="anN9nofx"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1cdfb337eso92639a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790986903; x=1791591703; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RTGwDHpLhUzAsXa7WFBlG6P/g0gt4zDPf57eK2yB0Jg=;
        b=anN9nofxguTJkWeltlexDBAhdWCIH/4IZEm4hIN8cGmX4WklVq89KeZE55aICMaZY+
         HNrJtJoAyjrpmH9p1nHvtXZnD0DaIYZGAHZA+qqsUVcxOoxVc/DxbRGB6akjn0AFyFtM
         gpFhoopt5wkstx2TqIRfT/RfXKc20+kOWwaBEOZsxmi9sCs7pV0LZZWD/JCOaYQIkf5D
         J61eFepFpgF1pkHPQCsaAofNEnuqG/LWBsHz2U/iqLZzGZPF+NRj4wwztnZR9UItmeVJ
         0Z4Y8izuhFT/oikQwqMKPehvau9UQckDlVhQSwngZ8fhM79YlH0vCdvWLU+8GykpazWV
         5ZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790986903; x=1791591703;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RTGwDHpLhUzAsXa7WFBlG6P/g0gt4zDPf57eK2yB0Jg=;
        b=1XngyHm1kES9aVBACkSgPnWZJjkMUTCAlZFQlC2e5WaFofZZ1cQd4NBCKHcaU5DDI3
         P9vIATyDs7pSkn7QY0RtjqN90gjRHVk+vGIEG+9OJ8MOshdioe3VC8JXkbgt7J7cwgSI
         /95HgsW6fYzokpXYiGXkjvvw9gvdH6goesOZwOB925QDYWGhXQ7np3Jeodeqr+XcwlQH
         TVpSyEs3KnqZ2z90oQCSVxtJqs5CGVECn0VFDOQBbME8fw5WwhVeeVtbfifJqtye8NcY
         fOaHO+72nRmdsq6zRaxVNAwVAfiiW5sCT8O3x0Tng5W7JoJV3EB3YOUqaAIuC9wyuKRr
         s3UQ==
X-Forwarded-Encrypted: i=1; AKwUvBxUYHi0cNIxDLUDq/KXT5ddaenOIdmjqXupgtU0rMhNl015qS3gkVgiDEAIOVsY81mtIJ4/RmHseenPVmI=@vger.kernel.org
X-Gm-Message-State: AFuF++kU+DDRyLHQr87Cul62dnHegaiKenLiSGdBZW5KHJX7HFCtI2tq
	m1kGgsXxitcS9zVYU8kQiti0Pb5jnjGz++InFGYHwJrBYUk+AYQhOsqOQvawZvoxalla5QiTsXv
	Re5I4o+VSEcR17eDsPs4w9g==
X-Received: from pgaa6-n2.prod.google.com ([2002:a05:6a02:6486:20b0:cca:bb35:aa9c])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:7103:b0:3dd:a006:7b3b with SMTP id adf61e73a8af0-3e0bd4133a8mr4176550637.58.1790986903290;
 Fri, 02 Oct 2026 17:21:43 -0700 (PDT)
Date: Sat,  3 Oct 2026 00:21:13 +0000
In-Reply-To: <20261003002123.505555-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261003002123.505555-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261003002123.505555-11-jthoughton@google.com>
Subject: [PATCH v2 10/20] hugetlb_vmemmap: Expose whether HVO is enabled to
 architecture code
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Nikos Nikoleris <nikos.nikoleris@arm.com>, Linu Cherian <linu.cherian@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Nanyong Sun <sunnanyong@huawei.com>, 
	Yu Zhao <yuzhao@google.com>, Frank van der Linden <fvdl@google.com>, 
	David Rientjes <rientjes@google.com>, James Houghton <jthoughton@google.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

Architectures that select CONFIG_ARCH_WANT_HUGETLB_VMEMMAP_RO_AFTER_INIT
may configure the system at boot depending on whether HVO is enabled,
e.g. arm64 requires all CPUs to support hardware access flag updates
only if HVO is enabled.

Add hugetlb_vmemmap_optimize_enabled() so that they can check. It is
declared before <asm/hugetlb.h> is included, so that it can also be used
from inline helpers there.

It only reflects the hugetlb_free_vmemmap= kernel command line parameter
(and the sysctl, when writable), not whether the architecture supports
HVO.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 include/linux/hugetlb.h |  9 +++++++++
 mm/hugetlb_vmemmap.c    | 18 ++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 5029c7241863..1ef73b5da664 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -22,6 +22,15 @@ struct node;
 
 void free_huge_folio(struct folio *folio);
 
+#ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
+bool hugetlb_vmemmap_optimize_enabled(void);
+#else
+static inline bool hugetlb_vmemmap_optimize_enabled(void)
+{
+	return false;
+}
+#endif
+
 #ifdef CONFIG_HUGETLB_PAGE
 
 #include <linux/pagemap.h>
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index de4148a8aabf..c1c736dd08b9 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -448,6 +448,24 @@ static int __init hugetlb_vmemmap_optimize_param(char *buf)
 }
 early_param("hugetlb_free_vmemmap", hugetlb_vmemmap_optimize_param);
 
+/**
+ * hugetlb_vmemmap_optimize_enabled - whether HVO is enabled
+ *
+ * This only reflects the hugetlb_free_vmemmap= kernel command line parameter
+ * and the vm.hugetlb_optimize_vmemmap sysctl, not whether the architecture
+ * supports HVO (see arch_hugetlb_vmemmap_optimization_supported()).
+ *
+ * The value is final once early parameters have been parsed only if the
+ * architecture selects CONFIG_ARCH_WANT_HUGETLB_VMEMMAP_RO_AFTER_INIT;
+ * otherwise it may change at any time through the sysctl.
+ *
+ * Return: true if HVO is enabled.
+ */
+bool hugetlb_vmemmap_optimize_enabled(void)
+{
+	return READ_ONCE(vmemmap_optimize_enabled);
+}
+
 static int __hugetlb_vmemmap_restore_folio(const struct hstate *h,
 					   struct folio *folio, unsigned long flags)
 {
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

