Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827028;
	b=1x28AP9Zb9MrWxZfCwOX5Vl3CDvY43LzMVhUoe7s+pj7TKp8Si1DwTZx8tR4HC0ZDV60
	 k1upRcBiCmg/EHoAn0cWazTM7pB60/ZfmkqLcTe7LsQjydCwaMUznl/G7yxosLybLNRn3
	 cEx/7j3eqTZjVmgWdMWvIaKPT5N7BzvwqKuokCp942fV+Rr980aJP9XRutRtqu1TIXV3x
	 aAb4Mdfx3gzFK4UP6X7rBk5xktqi+9xxRIKrRYAabAOypNAx7wd8eSo95/tslXU2z6wWI
	 VPoI5v0Cbwvzkk4Aib0sHTZ5EqIqojX1WRbf1sIwArOJDSZakcmt3U7YUrlAhKOVycQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827028;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FOfHSV/fi0rwB1D9NSo+2tobL9eqrpJMV7aIr3prIfc=;
	b=dI15RU3bMFokVxUSCcABlG1gAJDz9Rg6r5AE6MMAp1/UUfaoAW0pfqpqzIke/BcMY12M
	 RbiLLD3UX3wDI+YLsVSOxLFNPVE8NKmjc4LF7yjzHvhga2kzuRz4NLN2r9XZh2aj5RNfD
	 uwykwuG8AFrFDu4mDTolfMGHhmJ/fcr250YL4+YKHsDIdlmmZfb4zB2898KqczNuXUj1o
	 DLHmGIYhESv440HXfvKyyfB1C9vk0hnHknG+QKLaVnaUJFa4nze+J6FQ99y7WRrnpux2v
	 4jy2SJWo+il5VwM9ij/hnXG4QD1gcVIUX5+8kQkwTacI8rnNUvMD3PT2XLm1cSVGKzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="FbkA6W/Z";
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC44606A33B
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:03:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFC44606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FbkA6W/Z
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1a8cc11ac42so3000907c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794827027; x=1795431827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FOfHSV/fi0rwB1D9NSo+2tobL9eqrpJMV7aIr3prIfc=;
        b=FbkA6W/Zrx+3P6WdyaHwt3qAkpv8j8EpWww73ArSuFyAtrTDr6BUDGTYWb1maTqmc/
         EHyD01p2UoSZ1B9eOwprgq7gqYIihyl+JszYjPhMJTu/NOsRIKsbOooywmf/r7wXaEHC
         vh2XXl1vuh3U/tIeBisrYGTSHy4LXT67S3bynS2TcHd7RTCKsHy5YeiRmhWRQnfAfJ/E
         MQKxbOgP7s+F+WOI29InDczLFe3iajLXTqPihUH1aC+YFSYGIXbf/+CSGXPXM6BYxlFc
         b4pp6Qzsoe09LRs0anS1BJeSMPATtEyajA1SCgUZ5MM4itSyMsspE4Z6gcHbXkHhPxRH
         sM2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794827027; x=1795431827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FOfHSV/fi0rwB1D9NSo+2tobL9eqrpJMV7aIr3prIfc=;
        b=aRh504ybCAsA/xFKn39333VzMoTKAzw1lqNeiXsdmOzmyQiOm6x5va36rxTHnSx0NN
         LrEjP7EwKs1CcH4UnGWYIbEPurAgwFFX6MjWK0Xo3Z97j7p3JtNh/niYPZ2xU7/vtu2w
         XFqu0z+7/2HLcNCFp9vOjTi38MnH3avXDDj84jbcffO3cOpTQHEMXrayr+sT0NNuDjiH
         Po4UR0uMlUcmoByXaGCFHat4/+z7a1GX+qWYdai4TN18OgPaQHK+KQeHOUqVvoidIW85
         xjB6rPHSTTOsn3rsqpDKrbM7eUf4GeQIjoiNI+ZDTWfOzZ+ww9uD2NsRwUq5vhUaKMM3
         vSig==
X-Gm-Message-State: APuU4Z89Zs3RkbUeLNgis+AGROTQqec8VQYGPGn7r6hbtgpOuvV5kFgA
	fPP2v+ZBO+o3RJsnPLXGRMFo/yHnDjGrHWIzV1UX5sCiL2S2UnUmeXMm
X-Gm-Gg: AYBFou1IXhDrGbTX9R1uNTa+AcvYgJFpQ00CUFUjZsx1eXQXqx8XsNTOZQoMI/SeE8z
	bmqM/RPBNEFK2ccRz3kH3a+ghZp2VJkjMbEnpxLQPWQotgFJAnUlakpiZhiDdWcCt5cLqGqW/rI
	fAO32eXizzp7KSUBj4gse+6O6b1Gi5jnT+I8ajE/VOtQ6k91mMHJgeTntc3vxFBz6OimE7S8OOm
	BBE22gwvdDX+5SRs21Vm8CA4GhUSv+5HLIMenpjn+0HgTueG/hj+8jmPvI7ybj8G71oY458A6Mo
	pAv3q9dVdHJAkP1ZwcvvdN/SJb88LLWP2PEm+kTsN2dMgT5rOma+cl4/bqbPxculaXkHLVm1eXv
	KCDMZW2F9eeC6QV8AvC4/WQv46xV2Cyg0PAfgs4P/vUFoUjaLUpKALTW8T3i+0+HywXsALSHnNO
	QPgRM5MbAM3LbdflTZ+KfAAQz7euL7gikPQR3lbCkBjLrndlbzZapwIGY/TF1O27txNDfuWCyZG
	NG/TW3GSXF3P7a0/0Zl1gz3b+fkDQu8QkeeK5DfU+zViqfThahk7B1XOI5bkQzhqlsZbHiZdmD/
	u5oMD2eanZChRuG+uqjXb1MqDp4+xo0cAPbne7WUHCQF2EY=
X-Received: by 2002:a05:7022:3a8b:b0:182:94d7:f76a with SMTP id a92af1059eb24-1b5031562c3mr10836837c88.43.1794827026953;
        Mon, 16 Nov 2026 03:03:46 -0800 (PST)
Received: from naki-PC.localdomain ([203.175.14.54])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031918c7sm42999260c88.9.2026.11.16.03.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:03:46 -0800 (PST)
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
Subject: [RFC PATCH 02/16] mm: add a swap entry type for in-memory compressed pages
Date: Mon, 16 Nov 2026 19:01:08 +0800
Message-ID: <20261116110122.309748-3-nakixii@gmail.com>
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

An in-memory compressed page has no swap device or swap offset. Encoding
its reference as an ordinary swap entry would direct faults to the swap
cache and allow swap-device lookup to interpret an unrelated token.

Reserve a non-swap entry type for memcomp and provide helpers to
construct and recognize it. Account for the reserved type when locating
PTE markers and computing the maximum number of swap areas, keeping
these encodings disjoint. A build without MEMCOMP reserves no additional
entry type.

Provide the disabled-backend interface needed by callers without sending
these entries through the ordinary swap-device paths. The compression
backend and its reclaim hooks are introduced separately.

Signed-off-by: nakixii <nakixii@gmail.com>
---
 MAINTAINERS             |  1 +
 include/linux/memcomp.h | 13 +++++++++++++
 include/linux/swap.h    | 13 +++++++++++--
 include/linux/swapops.h | 22 ++++++++++++++++++++++
 4 files changed, 47 insertions(+), 2 deletions(-)
 create mode 100644 include/linux/memcomp.h

diff --git a/MAINTAINERS b/MAINTAINERS
index de04c7ba8571bdd79d564393847d32cc2f18a07d..dc29bbc6e53547cba9fc1763104463bb1091f7ec 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14852,6 +14852,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
 T:	quilt git://git.kernel.org/pub/scm/linux/kernel/git/akpm/25-new
 F:	include/linux/gfp.h
 F:	include/linux/gfp_types.h
+F:	include/linux/memcomp.h
 F:	include/linux/memfd.h
 F:	include/linux/memory.h
 F:	include/linux/memory_hotplug.h
diff --git a/include/linux/memcomp.h b/include/linux/memcomp.h
new file mode 100644
index 0000000000000000000000000000000000000000..d399e76bd6b62fdbe377b905cd649960d802bcec
--- /dev/null
+++ b/include/linux/memcomp.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_MEMCOMP_H
+#define _LINUX_MEMCOMP_H
+
+#include <linux/types.h>
+
+/* The encoding reservation alone does not provide a compression backend. */
+static inline bool memcomp_available(void)
+{
+	return false;
+}
+
+#endif /* _LINUX_MEMCOMP_H */
diff --git a/include/linux/swap.h b/include/linux/swap.h
index f3e0ac20c2e8c91f75d1afd62d736cce113e5fad..83d188e927e0af6dd356d39c33026f860082056e 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -62,7 +62,8 @@ static inline int current_is_kswapd(void)
  */
 #define SWP_PTE_MARKER_NUM 1
 #define SWP_PTE_MARKER     (MAX_SWAPFILES + SWP_HWPOISON_NUM + \
-			    SWP_MIGRATION_NUM + SWP_DEVICE_NUM)
+			    SWP_MIGRATION_NUM + SWP_DEVICE_NUM + \
+			    SWP_MEMCOMP_NUM)
 
 /*
  * Unaddressable device memory support. See include/linux/hmm.h and
@@ -86,6 +87,14 @@ static inline int current_is_kswapd(void)
 #define SWP_DEVICE_NUM 0
 #endif
 
+#ifdef CONFIG_MEMCOMP
+#define SWP_MEMCOMP_NUM 1
+#define SWP_MEMCOMP (MAX_SWAPFILES + SWP_HWPOISON_NUM + \
+			 SWP_MIGRATION_NUM + SWP_DEVICE_NUM)
+#else
+#define SWP_MEMCOMP_NUM 0
+#endif
+
 /*
  * Page migration support.
  *
@@ -116,7 +125,7 @@ static inline int current_is_kswapd(void)
 
 #define MAX_SWAPFILES \
 	((1 << MAX_SWAPFILES_SHIFT) - SWP_DEVICE_NUM - \
-	SWP_MIGRATION_NUM - SWP_HWPOISON_NUM - \
+	SWP_MIGRATION_NUM - SWP_HWPOISON_NUM - SWP_MEMCOMP_NUM - \
 	SWP_PTE_MARKER_NUM)
 
 /*
diff --git a/include/linux/swapops.h b/include/linux/swapops.h
index cb468e418ea11444ad0fe4be3b551787ba26947f..0327ccc7a6bc808b08780c6d3848d86dee59c213 100644
--- a/include/linux/swapops.h
+++ b/include/linux/swapops.h
@@ -109,6 +109,28 @@ static inline pgoff_t swp_offset(swp_entry_t entry)
 	return entry.val & SWP_OFFSET_MASK;
 }
 
+#ifdef CONFIG_MEMCOMP
+static inline bool is_memcomp_entry(swp_entry_t entry)
+{
+	return swp_type(entry) == SWP_MEMCOMP;
+}
+
+static inline swp_entry_t make_memcomp_entry(pgoff_t offset)
+{
+	return swp_entry(SWP_MEMCOMP, offset);
+}
+#else
+static inline bool is_memcomp_entry(swp_entry_t entry)
+{
+	return false;
+}
+
+static inline swp_entry_t make_memcomp_entry(pgoff_t offset)
+{
+	return swp_entry(0, 0);
+}
+#endif
+
 /*
  * This should only be called upon a pfn swap entry to get the PFN stored
  * in the swap entry.  Please refers to is_pfn_swap_entry() for definition
