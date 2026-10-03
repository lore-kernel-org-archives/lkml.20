Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125DF23E33D
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790986906; cv=none; b=pwbc+3YuvvRRK7LafyuswSkox2BKlbH+Eeoc74C4yMAwI+RRhGzvG9qui+8y7mC7kCNricVXHOfnF+4NzodMNk/HsCZOpqB23iY54RrMsKSYU931H8Rj+Kkh8KpBNFkE7pi9S817mbMPOxhufG6up1chTKwpsJbMzB8TVG8hNSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790986906; c=relaxed/simple;
	bh=8PJAcZeaOITXW1VjTKUESUTNU3qYUSdn38yinWJvZJc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=F51hIAcU2RZpvRb3De0s/mHNc8nYZ89nFiIMgD1WXhqflfoWaUwaIyi3SBaOeGtl163KYRYKCz68qu5KeluWpJ+pMkzB9To7azS5etssKP2Jf0x4G7yyEKJDEqDcKD5+6xrixWrlw3q5ERlWW3QXllJAF9OoGYhevV8gF6DcLLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dkWBD3j2; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dkWBD3j2"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbe77d6864dso142809a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790986903; x=1791591703; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=htfKz68Uuz6N9IF9mggRs6yYLkAuL8ZW2J7LXlHwfEI=;
        b=dkWBD3j28RjiyO2uyFaNiXyoGOYh4stB5c3GKZn1A4v4a5R4cRrB9oYtlemt5Fsq2+
         NZ2Qq6Atbmse1e7kWgsb0JHQlEJhYbjuxt4HOerDfvZI4Maqq2OXhNnwKa1o2C4LzdP9
         Hv4X2DiGijHOwoGjZpPfZsuxHJNS/r6FL3nZXdme15qNYEP22SzzJANhCKd5WFL+X6Lu
         bpYy/UmJhOXeKWiJzdkMJCzKlzpiKusIS9bG9YMGJVNWctlLl4FtWLLqt+xE+9g/abY+
         GRRXclXgrE5HZrUVWcRYTzBZouGg/riVi8NSN24IDut9nb4N7CTHG1B9JCM0bPk9ZgrC
         2kkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790986903; x=1791591703;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=htfKz68Uuz6N9IF9mggRs6yYLkAuL8ZW2J7LXlHwfEI=;
        b=z6Nv2Stbef2J4moVATtowz2q4+MsIbHtLSpq5kFKSNeX75rRpiOVp6FCLqJd9ZMrGT
         Dvz47G8sV4S6rjHW0tniEJuWKAdoifVjJXCRBrY1uOcbbD23tSfROdJRuREWAlIApTm1
         RZyjaNIFVPrNaY8lVsud1/DLOv269N1lFdogguhUME8syYehqcFDsxkOUtTEmgSkoXPu
         G3PkkgJSp9XVHToMGxy7/hwV6p+Ry42UCesJvuYl30FVC0nZTOe2HfkzDZBlwl+dS3A4
         6BKVpUhZCU0nNmNryweX8p4J8Sgf+of+VdhHa41zo2e9U5cVuyYHD5Fc8M7oZhUbYWf6
         DjEw==
X-Forwarded-Encrypted: i=1; AKwUvBw9P/1XK4501kXMGdAIpGYkw1Nh43LH21CWbFDhPQ7pHUg92IMeVvWgj66wXBjTn2mM6RIICSN3brHM1CA=@vger.kernel.org
X-Gm-Message-State: AFuF++n4X9ptOEuCoLB5Vri6nRyxZsRwgEATFbDgjeyhDGrWBaId812u
	UgZAnqIKKx3Ny70pAt7wKuLsHzzhsO54x3G2s76oKcF+leSYU813lgZdh5a8wnPw9VcP3rwvKKF
	6ioTvGUeqDHKagQkUsK9Y+w==
X-Received: from pgip23.prod.google.com ([2002:a63:c157:0:b0:cc7:6138:fe1b])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:1bc6:b0:3cc:ebeb:3efe with SMTP id adf61e73a8af0-3e0d68c7030mr953918637.9.1790986902363;
 Fri, 02 Oct 2026 17:21:42 -0700 (PDT)
Date: Sat,  3 Oct 2026 00:21:12 +0000
In-Reply-To: <20261003002123.505555-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261003002123.505555-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261003002123.505555-10-jthoughton@google.com>
Subject: [PATCH v2 09/20] hugetlb_vmemmap: Allow architectures to make HVO
 enablement boot-time only
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

arm64 needs all CPUs to support hardware updates of the access flag to
safely update the vmemmap in place, and it will need to refuse to online
CPUs that lack it, but only if HVO may be used. This only works if HVO
cannot be dynamically enabled, otherwise incompatible CPUs may have
already been onlined at enable time.

Add CONFIG_ARCH_WANT_HUGETLB_VMEMMAP_RO_AFTER_INIT for architectures to
select. When selected, vmemmap_optimize_enabled is __ro_after_init, so
it can only be set with the hugetlb_free_vmemmap= kernel command line
parameter, and the sysctl is made read-only.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 Documentation/admin-guide/sysctl/vm.rst |  3 +++
 fs/Kconfig                              |  3 ++-
 mm/Kconfig                              |  9 +++++++++
 mm/hugetlb_vmemmap.c                    | 17 +++++++++++++++--
 4 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
index 5b318d17aa4b..d962d563cfd4 100644
--- a/Documentation/admin-guide/sysctl/vm.rst
+++ b/Documentation/admin-guide/sysctl/vm.rst
@@ -692,6 +692,9 @@ pages.  So, those surplus pages are still optimized until they are no longer
 in use.  You would need to wait for those surplus pages to be released before
 there are no optimized pages in the system.
 
+On some architectures, this knob is read-only, and HVO can only be enabled or
+disabled with the hugetlb_free_vmemmap= kernel command line parameter.
+
 
 nr_hugepages_mempolicy
 ======================
diff --git a/fs/Kconfig b/fs/Kconfig
index 1454b7fe9641..4222db17ba02 100644
--- a/fs/Kconfig
+++ b/fs/Kconfig
@@ -267,7 +267,8 @@ config HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON
 	help
 	  The HugeTLB Vmemmap Optimization (HVO) defaults to off. Say Y here to
 	  enable HVO by default. It can be disabled via hugetlb_free_vmemmap=off
-	  (boot command line) or hugetlb_optimize_vmemmap (sysctl).
+	  (boot command line) or hugetlb_optimize_vmemmap (sysctl, if the
+	  architecture allows changing it at runtime).
 endif # HUGETLBFS
 
 config HUGETLB_PAGE
diff --git a/mm/Kconfig b/mm/Kconfig
index acefc994d9a8..ad313fddc9da 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -475,6 +475,15 @@ config ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
 config ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP
 	bool
 
+#
+# Select this config option from the architecture Kconfig if HugeTLB vmemmap
+# optimization may only be enabled or disabled on the kernel command line, e.g.
+# because the architecture configures the system at boot based on whether it
+# is enabled. This makes the hugetlb_optimize_vmemmap sysctl read-only.
+#
+config ARCH_WANT_HUGETLB_VMEMMAP_RO_AFTER_INIT
+	bool
+
 config HAVE_MEMBLOCK_PHYS_MAP
 	bool
 
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 817ce39d4cf3..de4148a8aabf 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -428,7 +428,20 @@ static int vmemmap_remap_alloc(const struct hstate *h, struct folio *folio,
 	return ret;
 }
 
-static bool vmemmap_optimize_enabled = IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON);
+/*
+ * Architectures selecting CONFIG_ARCH_WANT_HUGETLB_VMEMMAP_RO_AFTER_INIT rely on
+ * HVO only being enabled or disabled on the kernel command line.
+ */
+#ifdef CONFIG_ARCH_WANT_HUGETLB_VMEMMAP_RO_AFTER_INIT
+#define __vmemmap_optimize_enabled_attr	__ro_after_init
+#define HUGETLB_VMEMMAP_SYSCTL_MODE	0444
+#else
+#define __vmemmap_optimize_enabled_attr
+#define HUGETLB_VMEMMAP_SYSCTL_MODE	0644
+#endif
+
+static bool vmemmap_optimize_enabled __vmemmap_optimize_enabled_attr =
+	IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON);
 static int __init hugetlb_vmemmap_optimize_param(char *buf)
 {
 	return kstrtobool(buf, &vmemmap_optimize_enabled);
@@ -751,7 +764,7 @@ static const struct ctl_table hugetlb_vmemmap_sysctls[] = {
 		.procname	= "hugetlb_optimize_vmemmap",
 		.data		= &vmemmap_optimize_enabled,
 		.maxlen		= sizeof(vmemmap_optimize_enabled),
-		.mode		= 0644,
+		.mode		= HUGETLB_VMEMMAP_SYSCTL_MODE,
 		.proc_handler	= proc_dobool,
 	},
 };
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

