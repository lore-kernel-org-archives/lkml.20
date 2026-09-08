Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1165312814
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 03:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788836691; cv=none; b=MuDGmp3JonNseUQkyVP7L8yjDCVPsi/MafmJSL4LX5GPZXssnfsSpjhNEXRmS5jmSPLUvlZp1vCpSoZsVhnqESG7UrS2I0wfNbZULhCfH/uSwbAuaV5S8hplsE/eYK4FtskpESaa0PhVAw/jZprf6HhzXTIR+zhPSymPpKrn414=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788836691; c=relaxed/simple;
	bh=4wufTkSeOR/+Z2FWN8LbWpxz3ii+Qo8NagFu/L3vU5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fZumEkWfVaE7WrrCZXVvcM1MMJ1yLJIJXSe/dbP8olKb2lPCaJtSo1MADEGY+wD4trd/ftkY2La/0QgdD5IyVxKcxaH6TUD4xqT0zIL19mNopLl5C5laear5//CRPrayMDZqM3mNijvxytEhAojyFTHK+v8vIZPhyHwJkj1CXO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=UJjN2+ak; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="UJjN2+ak"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-85339ed040aso3212078b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 20:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1788836689; x=1789441489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IQIwuT52UGUULzXnvd9jyK7/apm1xntD2qx3gMLc028=;
        b=UJjN2+akjtAsORY2Djv1wHs4JESj+kBU/dsb6OD7u8mKRLqCvx+bLYey7dfoSo62wz
         HRPpFRAvnD5l8WkyDzY/zVXvxgsWUTonLJ0hckip8Tpsb7xwICQRt6nTIo+PaC171p25
         0yHFq8qAxCoptDH5Nx7wJpBlZGSFBxlXbaJPXm7o80UW2vUv+Nye4Y8bwQRFT7REoboJ
         lc9Yhi/o05V+CLXeO/9f1JP0yE7R0cFpZxOQ0XyujHJQnK78gCRW6/L7FVVSMczLRneF
         J/9tvepLT+Nh5qR+RPk6i7iPMjgCgPGWlt1k2C6jmDFG2a4WxNlO7pDR3AmtDkKLaKsR
         Cp9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788836689; x=1789441489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IQIwuT52UGUULzXnvd9jyK7/apm1xntD2qx3gMLc028=;
        b=KUkP5NDBcFvgGnL5oEh8MZ46wKmqj7Tnc8vSTTgTCr2ILYrOLb7DlnUaSrNtMNHq+C
         +QOoHYXyrCLP5BWD+KTrkrwwb7XGp6SgKMv63pYpb+K/TpwG/GxOwWHtkk1WJ7ZZMaVW
         B6oIBaEcce3NIoEx5dcq2eEoy0s200uTwfY0o2RqKjXUDY83BfFa3vYsYowXhTTp4C5O
         bAnRrQHY9KZHSwqbFf5sikv1XaKaHnhgS1/+ZNJgdxsZAuvQ1dV130VqSEWDchKNqxzV
         7zkg2J2egvJMHwMPlkWEkVSfWXHTWevyjmNznNhRXHGozrlsWL7bHIIx4lG6BScPy0nK
         X5hA==
X-Forwarded-Encrypted: i=1; AKwUvBwdEQWjVP3nOh9yKI9Raq0Z6T1/yFy5SlGYA1csWAF09hGsUZW3D3Jjc11wLME8FQqPo1oGuTcjbuY1LUo=@vger.kernel.org
X-Gm-Message-State: AFuF++km48w0sx6Wq8gxaMH9vh7dY2EMdAGr5yAjZS1A3NOMMzwW0bNP
	TNvfNiTypmJEtM2qN+ruDsEK6EWA6Xgd0gG982x2NzuT93lg8MzpUo/A+F4I/W0C0XU=
X-Gm-Gg: AYBFou0jPebD7iH2SFg9CKE4lPSxu8JkoYh4VCBv0BLCjoJsVh4p6mtCK4A6gzZKTp1
	EkxcPHGjlNaMOKXJEMnw7gRehmcFHtr1cpbzcU3HENSYVcM9MiHUW64dd7HQhM1QXUx0ke6q/XJ
	ZDqsWLnmeTHSi3Fq1e/2WmwjO69VUortbUlNweK6/HMg5VPCAKaUZzWImyHMYK5ezzPC8cxZ693
	yMOHT7evsdgp5ZHFh5AKaTpTt8+H5/8b3PPmKvHU9MtLQOg0695VIGeBgV7V5HJGRubRzlj1Sf1
	ba7pxAcTuoGCeTQT/aeL48MqItxAUwY3YnBvtDuMeo05psvkRqp2DXxFZ0IM/MZVWx91syCbtJn
	B0BquJarXDEqObzNeW5Vu+9EPZvVB/gzsx5bvLIDnZp3cKGQYQl85J4NqH1QDM0BvzgmPJkACmo
	DzuLuMeXW5IGUXtfRiBwPpmWZdSmv3Ls1aI/vTisl0YW6HSIXANKAm6Yxz9e/4AslkLaLehYVwC
	gcSkROaFGzUpW90AOT3wL/gYltYLUw2Bys=
X-Received: by 2002:a05:6a00:400e:b0:84e:e741:174f with SMTP id d2e1a72fcca58-861669c6df9mr39676733b3a.7.1788836688830;
        Mon, 07 Sep 2026 20:04:48 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152a358a2sm4868234b3a.29.2026.09.07.20.04.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Sep 2026 20:04:48 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-doc@vger.kernel.org,
	Muchun Song <muchun.song@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v2 11/11] Documentation/mm: update DAX vmemmap deduplication docs
Date: Tue,  8 Sep 2026 11:03:35 +0800
Message-ID: <20260908030335.96549-12-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260908030335.96549-1-songmuchun@bytedance.com>
References: <20260908030335.96549-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Device DAX now uses the common per-zone shared tail page for vmemmap
deduplication. The old documentation still described a DAX-specific
layout with a separately populated tail vmemmap page and half the HugeTLB
savings.

Update the generic and powerpc documentation to describe the shared layout.
In the powerpc document, keep the radix and 64K-specific details, drop the
duplicated 4K PUD arithmetic, and replace the repeated device-dax diagrams
with a single parameterized PMD/PUD diagram.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
v2:
- Clarify the commit message to state that the 4K PUD arithmetic is
  intentionally dropped reported by Sashiko.
---
 Documentation/arch/powerpc/vmemmap_dedup.rst | 90 ++++----------------
 Documentation/mm/vmemmap_dedup.rst           | 32 +------
 2 files changed, 21 insertions(+), 101 deletions(-)

diff --git a/Documentation/arch/powerpc/vmemmap_dedup.rst b/Documentation/arch/powerpc/vmemmap_dedup.rst
index dc4db59fdf87..8286acbca9bc 100644
--- a/Documentation/arch/powerpc/vmemmap_dedup.rst
+++ b/Documentation/arch/powerpc/vmemmap_dedup.rst
@@ -19,82 +19,28 @@ With 1G PUD level mapping, we require 16384 struct pages and a single 64K
 vmemmap page can contain 1024 struct pages (64K/sizeof(struct page)). Hence we
 require 16 64K pages in vmemmap to map the struct page for 1G PUD level mapping.
 
-Here's how things look like on device-dax after the sections are populated::
- +-----------+ ---virt_to_page---> +-----------+   mapping to   +-----------+
- |           |                     |     0     | -------------> |     0     |
- |           |                     +-----------+                +-----------+
- |           |                     |     1     | -------------> |     1     |
- |           |                     +-----------+                +-----------+
- |           |                     |     2     | ----------------^ ^ ^ ^ ^ ^
- |           |                     +-----------+                   | | | | |
- |           |                     |     3     | ------------------+ | | | |
- |           |                     +-----------+                     | | | |
- |           |                     |     4     | --------------------+ | | |
- |    PUD    |                     +-----------+                       | | |
- |   level   |                     |     .     | ----------------------+ | |
- |  mapping  |                     +-----------+                         | |
- |           |                     |     .     | ------------------------+ |
- |           |                     +-----------+                           |
- |           |                     |     15    | --------------------------+
- |           |                     +-----------+
- |           |
- |           |
- |           |
- +-----------+
-
-
 With 4K page size, 2M PMD level mapping requires 512 struct pages and a single
 4K vmemmap page contains 64 struct pages(4K/sizeof(struct page)). Hence we
 require 8 4K pages in vmemmap to map the struct page for 2M pmd level mapping.
 
-Here's how things look like on device-dax after the sections are populated::
-
- +-----------+ ---virt_to_page---> +-----------+   mapping to   +-----------+
- |           |                     |     0     | -------------> |     0     |
- |           |                     +-----------+                +-----------+
- |           |                     |     1     | -------------> |     1     |
- |           |                     +-----------+                +-----------+
- |           |                     |     2     | ----------------^ ^ ^ ^ ^ ^
- |           |                     +-----------+                   | | | | |
- |           |                     |     3     | ------------------+ | | | |
- |           |                     +-----------+                     | | | |
- |           |                     |     4     | --------------------+ | | |
- |    PMD    |                     +-----------+                       | | |
- |   level   |                     |     5     | ----------------------+ | |
- |  mapping  |                     +-----------+                         | |
- |           |                     |     6     | ------------------------+ |
- |           |                     +-----------+                           |
- |           |                     |     7     | --------------------------+
- |           |                     +-----------+
- |           |
- |           |
- |           |
- +-----------+
-
-With 1G PUD level mapping, we require 262144 struct pages and a single 4K
-vmemmap page can contain 64 struct pages (4K/sizeof(struct page)). Hence we
-require 4096 4K pages in vmemmap to map the struct pages for 1G PUD level
-mapping.
-
-Here's how things look like on device-dax after the sections are populated::
-
- +-----------+ ---virt_to_page---> +-----------+   mapping to   +-----------+
- |           |                     |     0     | -------------> |     0     |
- |           |                     +-----------+                +-----------+
- |           |                     |     1     | -------------> |     1     |
- |           |                     +-----------+                +-----------+
- |           |                     |     2     | ----------------^ ^ ^ ^ ^ ^
- |           |                     +-----------+                   | | | | |
- |           |                     |     3     | ------------------+ | | | |
- |           |                     +-----------+                     | | | |
- |           |                     |     4     | --------------------+ | | |
- |    PUD    |                     +-----------+                       | | |
- |   level   |                     |     .     | ----------------------+ | |
- |  mapping  |                     +-----------+                         | |
- |           |                     |     .     | ------------------------+ |
- |           |                     +-----------+                           |
- |           |                     |   4095    | --------------------------+
- |           |                     +-----------+
+Here's how things look on device-dax after vmemmap-optimized sections are
+populated. ``N`` is the number of vmemmap pages required by the DAX mapping
+above::
+
+  Device DAX                  vmemmap pages (N pages)         backing page frames
+ +-----------+ ---virt_to_page---> +-----------+   mapping to   +-------------+
+ |           |                     |     0     | -------------> |      0      |
+ |           |                     +-----------+                +-------------+
+ |           |                     |     1     | ------+
+ |           |                     +-----------+       |
+ |           |                     |     2     | ------+
+ |           |                     +-----------+       |
+ |           |                     |     .     | ------+        +-------------+
+ |  PMD/PUD  |                     +-----------+       |        | A single,   |
+ |   level   |                     |     .     | ------+------> | per-zone    |
+ |  mapping  |                     +-----------+       |        | shared tail |
+ |           |                     |   N - 1   | ------+        | page        |
+ |           |                     +-----------+                +-------------+
  |           |
  |           |
  |           |
diff --git a/Documentation/mm/vmemmap_dedup.rst b/Documentation/mm/vmemmap_dedup.rst
index 9fa8642ded48..8c287ae3f86c 100644
--- a/Documentation/mm/vmemmap_dedup.rst
+++ b/Documentation/mm/vmemmap_dedup.rst
@@ -1,4 +1,3 @@
-
 .. SPDX-License-Identifier: GPL-2.0
 
 =========================================
@@ -192,32 +191,7 @@ to 4 on HugeTLB pages.
 
 There's no remapping of vmemmap given that device-dax memory is not part of
 System RAM ranges initialized at boot. Thus the tail page deduplication
-happens at a later stage when we populate the sections. HugeTLB reuses the
-the head vmemmap page representing, whereas device-dax reuses the tail
-vmemmap page. This results in only half of the savings compared to HugeTLB.
-
-Deduplicated tail pages are not mapped read-only.
+happens at a later stage when we populate the sections.
 
-Here's how things look like on device-dax after the sections are populated::
-
- +-----------+ ---virt_to_page---> +-----------+   mapping to   +-----------+
- |           |                     |     0     | -------------> |     0     |
- |           |                     +-----------+                +-----------+
- |           |                     |     1     | -------------> |     1     |
- |           |                     +-----------+                +-----------+
- |           |                     |     2     | ----------------^ ^ ^ ^ ^ ^
- |           |                     +-----------+                   | | | | |
- |           |                     |     3     | ------------------+ | | | |
- |           |                     +-----------+                     | | | |
- |           |                     |     4     | --------------------+ | | |
- |    PMD    |                     +-----------+                       | | |
- |   level   |                     |     5     | ----------------------+ | |
- |  mapping  |                     +-----------+                         | |
- |           |                     |     6     | ------------------------+ |
- |           |                     +-----------+                           |
- |           |                     |     7     | --------------------------+
- |           |                     +-----------+
- |           |
- |           |
- |           |
- +-----------+
+Deduplicated tail pages are not mapped read-only. The mapping layout is the same
+as HugeTLB.
-- 
2.54.0

