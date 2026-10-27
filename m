Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793116029;
	b=dLHye9rt4R2JuGSJXQ8NdKiAT8UMMWhEtatIIgr98Bp6chcvj92Appwz9eDm+1b+zuuw
	 qoxhyAMS+vcXpDdGWONN/POWbxke7f7r1W8PXIY9LfH7u+Yitl+AufqHjOjCE4TWol/Tx
	 6OgeUw4XrYrH+ImFcP05Q6CWZY5Se3cDOgOWJJo4BlynNnGAO8g+EMVc2KDnuS450eO5s
	 0MvXN2EG4Maci3FSUdcqM6KWRdk3YS4Rs6Qg/mp59G/4Ad5RMbiDpQGykj+ObHsZwdxLb
	 B/OABGgr3LnTfs8lbwIgWfjIU47VFQdBlUcqrqdb72oOyl4Bl6JNu7Q7ciH1M9UtRqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793116029;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=I9tKrbL54EVqcIFPPtB7uxrxNAXJtibM80HAzpUcWLM=;
	b=JX36qFA3t/QQvTo2uUNWNg6oZ5ABHiZNn+dBYumnFMG+gAoKG0gZol/WJX5VxeoSlpIS
	 kH0YGv0ahtvJUneh8ouByBLo+L4N1yJKyY0BmvXYOT0lpZb/BCpT2coLrDsV6hNzrX+Iy
	 AoUTXJeuES7t6icxNDPJI1DevUwMpvkn3Ig5kAHjMGADLJHKMgR4SnZN06UA94F+iCUHU
	 wyhs4DLyMRyz2ckYY/fiOnHBFtVvYXdlPoUUqjCFNV9VlgWdxHDAcHaOrw4/l8G11s393
	 m6RdUcaStLPJo75aQA7uQwbc7VJGBZy31oA82/ukV0G1sXZWaY5TzzOOH5CVQHkJ/zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yRmVMWZO;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA7B60A2617
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:47:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EA7B60A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yRmVMWZO
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso776896f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793116027; x=1793720827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I9tKrbL54EVqcIFPPtB7uxrxNAXJtibM80HAzpUcWLM=;
        b=yRmVMWZOSgYOouFJ3XXj5aw0KaSgckQYEvRlJmiAj5iMaleGe121rSWoqxNhtg5N14
         hX5jZ8iCw6nxxKWsfk/jfcRNcK4D5RPZtrs/ZHpXMxQdJwUxLv/D02GyG9ly0itjET0l
         QYJWU9CIDnW5SAScmWpFXXCYGxlIWaup/cyg16ZIu7O9e5Jaz34+seo9RmRvx9F/GpWp
         7s0vaOvPuzftBCOXtxey5t+MSQh2D/edaVW4fxD59EZn55DdlWfybRHvnQ7jdJCtNXnA
         aMKrIfeza+LyTAm3fNuJlj9oeBD8wLhxs5ehug6UvNlcUaWev8fOiNZ+aFqThE2FqT+j
         rlEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793116027; x=1793720827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I9tKrbL54EVqcIFPPtB7uxrxNAXJtibM80HAzpUcWLM=;
        b=XxElNLKJerY171x6ge/hj0ImRzLqb8BkCV5ZcZuySPZ30deQLelhZgFz1rECfwn15F
         +DbZOpAqMBmVH8jGpWKaXO1aW/iHVaemGMnXu0WBZuu3PnaTVi8VDaIeUZpx0PCoyRdh
         KHV/DPV2U+8lWEiQwraa7s+IuHkCOzV4t7gX1QkcvmYvxgmUDEOx+9UgC9B4YDP68Eiw
         YPJ7SxUzbXuhlX1YRJEfn5uFWDA9ORYDDX+oztv0LeW5w4E4J46IldLzsNZnPjtrc0WZ
         vwvpBOq8tOszTf18FOvXh+XOfC2cvByWwxOSDayH0G37xEQbAtK2QH4OUjJGduIU3Hlw
         5geQ==
X-Forwarded-Encrypted: i=1; AKwUvBwrbaA7PSUPlaYaqNVxOT/XkLR69v6WaKJR+tuhw5saZENl/xrfF5qBxIOCiCB+WZGlti9DPyWv4rl9jWY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLBba5voTHP6X/Ds8GFHGD2gcyd7Vyapidh4y48OkSFZcVo6XJ
	BOfZPVzc0Axc8sY1LBdSeKU0HfcA9l907sLArjL2a4Do94SHI6xZOzzy
X-Gm-Gg: AYBFou2AOaVV5kxI5UXgXo297ELKOQUi7kxbCRN8lAn0MGiwrXFQ0BeCrdKGaFvdqmX
	zPY+ZlDBW7uksagx9ON9ZLtEDS76nWtb/tMwhpIBvj//zllMDPl95x+jYbNSITIH7WEOhaIW/Qs
	pJfAyNyEXNFDsh4yQRP0frD20x4+fyJXB//iwDYgnlqxgtWLXszMjStUhOA6zBu66qRAugEbAcW
	kar4+nrWu24tZ7kczoSjwzhnGafs4dS5/32PDY2dbSjdtLiZ1Iq3h61rH7/96Gq1HDdPSgtxtRH
	iHAc8/4dMPBn6VVQ9NcG14MCO7DXgD08QeqhifJlAZLrdhSAYZvQsAMnkNW3yp4M+Aap29x36hn
	C+DqZqhesL4egEX+tfs8iCf5PpW0DJWUHycklZYrBrhOHI3Z2GDguz8pHHFVJJYPHcWYUYNmHZr
	IKRjxvWDTLZrpCuQsMxh8g9Gx9aXtOzKvriBuQhyr4wn6NH031hgH705MLVXpx1nbFJocejiT5g
	5n/BybA2e17cS1O/CxHkuIvPl9qRIcFGmJ1MjYJlgaNo4/3PyhmZPAYAgv2OwkZtTD+DyCGp6vU
	IPpiWBEorLp6OyxoUmI2IXzX6tm+RPp4sXxSIIDceJy1Z8HdF59NKDI4FdMNluSEpjOJOL5ykM/
	4OKAWogcErQkiOQuq63fTjAGEaMNJrG4dbe27cg==
X-Received: by 2002:adf:ebcd:0:b0:48e:4ad2:32e0 with SMTP id ffacd0b85a97d-48e55a5a8bemr4605062f8f.29.1793116027147;
        Tue, 27 Oct 2026 08:47:07 -0700 (PDT)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb958sm23845574f8f.21.2026.10.27.08.47.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2026 08:47:06 -0700 (PDT)
From: Fred Griffoul <griffoul@gmail.com>
To: Ackerley Tng <ackerleytng@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>
Cc: Alex Williamson <alex@shazbot.org>,
	Alexander Graf <graf@amazon.de>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Alexey Kardashevskiy <aik@amd.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Ashish Kalra <ashish.kalra@amd.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Baolu Lu <baolu.lu@linux.intel.com>,
	Bill Wendling <morbo@google.com>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christian Brauner <brauner@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Connor Williamson <connordw@amazon.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	David Hildenbrand <david@kernel.org>,
	David Rientjes <rientjes@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Erdem Aktas <erdemaktas@google.com>,
	Frank van der Linden <fvdl@google.com>,
	Gregory Price <gourry@gourry.net>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Hugh Dickins <hughd@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	James Houghton <jthoughton@google.com>,
	Jan Kara <jack@suse.cz>,
	Jianxiong Gao <jxgao@google.com>,
	Joerg Roedel <joro@8bytes.org>,
	Joey Gouly <joey.gouly@arm.com>,
	John Starks <John.Starks@microsoft.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Justin Stitt <justinstitt@google.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Michael Roth <michael.roth@amd.com>,
	Mike Rapoport <rppt@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Oliver Upton <oupton@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Tarun Sahu <tarunsahu@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Tycho Andersen <tycho@kernel.org>,
	Vishal Annapurve <vannapurve@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Yan Zhao <yan.y.zhao@intel.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	x86@kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	llvm@lists.linux.dev,
	iommu@lists.linux.dev
Subject: [RFC PATCH 06/14] KVM: guest_memfd: Report the size of holes in export lookups
Date: Tue, 27 Oct 2026 15:46:41 +0000
Message-ID: <20261027154649.91571-7-griffoul@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027154649.91571-1-griffoul@gmail.com>
References: <20261022-gmem-alternative-providers-v2-0-5dd1dc6c660a@google.com>
 <20261027154649.91571-1-griffoul@gmail.com>
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

From: Fred Griffoul <fgriffo@amazon.co.uk>

A lookup reports a hole as a single page, so a consumer walks a large
private or unbacked range one page at a time, and cannot map a large
hole with one entry, e.g. to a scratch page.

Report the largest aligned hole around the page, up to the order the
caller asks for. The search checks one half-block at a time, so it
costs about one lookup per page of the hole it finds.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Fred Griffoul <fgriffo@amazon.co.uk>
---
 virt/kvm/guest_memfd.c | 48 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 46 insertions(+), 2 deletions(-)

diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 015f6657c386..1c5826c5384e 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -1417,6 +1417,48 @@ static int __kvm_gmem_export_lookup(struct inode *inode, pgoff_t index,
 	return 0;
 }
 
+/* Does no page of [start, start + nr) have a frame to map? */
+static bool kvm_gmem_export_is_hole(struct inode *inode, pgoff_t start,
+				    pgoff_t nr)
+{
+	unsigned long pfn;
+	pgoff_t index;
+	u32 attrs;
+	int order;
+
+	for (index = start; index < start + nr; index++) {
+		order = 0;
+		if (__kvm_gmem_export_lookup(inode, index, &pfn, &order,
+					     &attrs) != -ENOENT)
+			return false;
+		cond_resched();
+	}
+	return true;
+}
+
+/*
+ * The order, up to @max_order, of the largest naturally aligned block around
+ * @index that lies inside the file and has no frame to map.  Each step checks
+ * only the half of the larger block that does not hold @index.
+ */
+static int kvm_gmem_export_hole_order(struct inode *inode, pgoff_t index,
+				      int max_order)
+{
+	pgoff_t npages = i_size_read(inode) >> PAGE_SHIFT;
+	int order;
+
+	for (order = 0; order < max_order; order++) {
+		pgoff_t n = 1UL << order;
+		pgoff_t first = round_down(index, 2 * n);
+
+		if (first + 2 * n > npages ||
+		    !kvm_gmem_export_is_hole(inode, index & n ? first : first + n,
+					     n))
+			break;
+	}
+	return order;
+}
+
 /**
  * kvm_gmem_export_lookup_pfn - The frame behind a shared page.
  * @e:         The export.
@@ -1424,7 +1466,8 @@ static int __kvm_gmem_export_lookup(struct inode *inode, pgoff_t index,
  * @pfn:       The frame.
  * @max_order: In: the largest order the caller can map.  Out: the order of
  *             the naturally aligned block around @index that is contiguous,
- *             shared and of the same @attrs; 0 for -ENOENT.
+ *             shared and of the same @attrs or, for -ENOENT, that has no
+ *             frame to map at all.
  * @attrs:     The GUEST_MEMFD_PFN_* attributes of the block.
  *
  * Takes no reference and allocates nothing, and may be called from the
@@ -1438,6 +1481,7 @@ int kvm_gmem_export_lookup_pfn(struct guest_memfd_export *e, pgoff_t index,
 			       unsigned long *pfn, int *max_order, u32 *attrs)
 {
 	struct inode *inode = file_inode(e->file);
+	int order = *max_order;
 	int r;
 
 	if (index >= i_size_read(inode) >> PAGE_SHIFT)
@@ -1445,7 +1489,7 @@ int kvm_gmem_export_lookup_pfn(struct guest_memfd_export *e, pgoff_t index,
 
 	r = __kvm_gmem_export_lookup(inode, index, pfn, max_order, attrs);
 	if (r == -ENOENT)
-		*max_order = 0;
+		*max_order = kvm_gmem_export_hole_order(inode, index, order);
 	return r;
 }
 EXPORT_SYMBOL_GPL(kvm_gmem_export_lookup_pfn);
-- 
2.47.3

