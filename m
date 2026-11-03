Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793701102;
	b=0aqXqjjsbd/LZ2EL07HfGAsGinW7Wth+4o6QIOP7suD5oNBLGrVT57KhV4/2XJzEiv9L
	 aW9pdJJwLEGEaOto09wVWvcHk6h8PeSe4X9jcTqZWP1qPOLU9tEnZ4rakqSHaTtp+DVwb
	 8UveuEMGZ3QBJq0ULUxRktdVkfR76vFG1+DFwhM5BXI4WTqfJtiUmVtGlHk1Y+ASCOA+t
	 2MWnr6dN8yo+T9l1bveIJatxFXwbYUytXYxt1AwAF0YL8wAAPBG2XITR8Gc0jtYFOKV1d
	 w9KgQ6JR8uh9nt+YzKG2FvRJFHm0D4/r9hWjj9wB5W8GzqC89ZUiVnpH5DaqyD6byMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793701102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2UxkzZOuXMzEW1DRxwfP1Y2akfSOt2A5NGCydHJqRyY=;
	b=vyHbfrJeK2UiIRGKNFzETu+dz2OwK0C0/iGQAr1qvzBJArZLHygCmnf6bLgKjlHZ+XGI
	 XiI9zutAVnulf6lKHDjHJgxoqOIJi8Hv1lLDCmKG1OblGJJDON5sLWyZlTKcugWY9LMb0
	 uW8KR4PxmpgHma3DjPSCAXb9rtOo1vp8tFjB0pdwmeM0fb4ea0SzctZCQ0f2m+wkQ5aw7
	 0fDjRZuYYEcX3WS+1wYlzVW6Pzsi9FLarQF/nbz539uLVDeNoP4XYR+GNaIV7UzfEcCEi
	 RgUfhC2CtQczdY2xxMywseDyfZ9oVtIlhQPtrb9EQnLw4Z48CN39BQ28ALql9VVV0DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OTCljPyA;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796DE606A834
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:18:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 796DE606A834
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OTCljPyA
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1adbf62dd31so4337456c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 02:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793701101; x=1794305901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2UxkzZOuXMzEW1DRxwfP1Y2akfSOt2A5NGCydHJqRyY=;
        b=OTCljPyAWpB2PW9aACuxPMT/jnmCOsYsrUEf+xS9SiYEoFLzahvBKr4TvPa2rnkCIJ
         Fe3z6R3RPAu1wP2WRBjdYvA//qnueF9vwSjMiv/0A9Fq3jQ6qZKb6FWlw5QzGL3aYvWp
         rF6mKQkFuE0eGub/CB05GKMJoDzikwRJ6CFajhtCMF0uzJxKqZQG3je/boqaunQ32bCM
         zKqQXtcdoXPRK2pijiDSPfaissjLduQ8wf/vRBMkcdJ8v4GjWp4857XasZAYM+SdCkv5
         fRi+F5DO86r8LnHueYyhAVCdO3c/G3spXkGxF6VVDZbYpvJ4KKfr4r6shzAMEn9i6xN7
         Xoxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793701101; x=1794305901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2UxkzZOuXMzEW1DRxwfP1Y2akfSOt2A5NGCydHJqRyY=;
        b=puhiQggHjIQcULC2B/ddw6+vJ46D4TEY4w840pSrIMbGsTVPdXx1V/hdAQylaoZD0S
         hg9bU1nlxiuoPrVmMEH+ECdql3tM+EXZrmxzoKzwEdr2Iz/ovkNqv43seN08uwNXMJT+
         y0a4c4R4pxfOy0J/QESpR0u219SNaqae1EDk8Y1VuIxnWYObCxxisNMb556UqnPJDhuX
         ukVQeqo/1STtWbwYs+pCM1IhSwTPFrlkxHWVRewiHeqWssN4bacUWigNXuNfCFkpfhsw
         +GtOiyaFEArr89SsznN+J5hNGfO5LClZHlUec1RHyqw4px86V2lZUnATyn3dMgu0CLWz
         ZJ3w==
X-Forwarded-Encrypted: i=1; AKwUvBz0u+1hE48wxEPyOJ56AKPxLtcNLPEQKhaBDkC6bCCrFHOz/gyKFaGKOqfc5KFFg5UUhUSXPVsmCIBnUl8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DWEAxA3q1OBAWBf/g7WsWo8lBOZNhxTuQCziTDPum5JrCzxKE
	ral1TVZTrMTjy8opkRU3RF1UPcPjee4VUdrSIYj0LjvH6ISAqWzzJoJM
X-Gm-Gg: AYBFou0EnwjtfctF2fezOl0/XPWSAwvkpd1eauIUjIOv3Y6PWl28IKdK+hVSjXSrqj+
	LzS5DU3J2jFei/BqdLMBkx+INXF+HnJ4X7wmBNk8lOMIIGxB+eme9jSCpbdxOVHNgLsJ3pQr2Ee
	TepueKSWdnOflb1zBToTn4n/2G7lafOqQgHpL7iZSjZTAnOhjAmS9JZKyi3zKeAtzUAMHDm3xMO
	pb3OItYWA7qg3BPIfAQhO1jz/15L5CUJTI7mSbEZuzp4Vbf7jTd+e9OYvEE3JyV+fOU8BZk53o9
	3mGPJmponxQKJns7fU519YSIOXY2zITsr+gAxyIaL94klt8ccutx0VDcELN57LfdjyU5gMh7k+a
	sSHO4KL7BwxqvsfrhL7XMez2/OHEVWJpsrMDEghJXF2gn/d9cwjHYvWve2S6ztuxwqogM7PMs9v
	rFmZEyzEmA5FCAlgcHLcmbaon68L904IXjth3d6WmRq9o3irq3I9wQpreHSy1VvFmxK5QmRZjlh
	nmOEtkYXJqVaNenc7Wo2s0H+wkF8q2M3bj5IwHngiHpU7dgI627goywfQgKZTGZbXC6o5Hka2xe
	QObpFaiNvc8LnvdjLxddOBdxmW/s9A==
X-Received: by 2002:a05:7300:c019:20b0:36b:f09f:924a with SMTP id 5a478bee46e88-36bf09fa41emr1926474eec.14.1793701101482;
        Tue, 03 Nov 2026 02:18:21 -0800 (PST)
Received: from 027.. ([2409:8a20:4a5:7150:84fc:ce3c:7b09:dbca])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4291e38fsm53145387eec.15.2026.11.03.02.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:18:20 -0800 (PST)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
To: akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	linux-mm@kvack.org,
	urezki@gmail.com,
	will@kernel.org
Cc: Xueyuan.chen21@gmail.com,
	ajd@linux.ibm.com,
	anshuman.khandual@arm.com,
	baohua@kernel.org,
	chleroy@kernel.org,
	david@kernel.org,
	dev.jain@arm.com,
	jiangwen6@xiaomi.com,
	leo.yan@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: [PATCH v11 10/10] mm/vmalloc: align vm_area so vmap() can batch mappings
Date: Tue,  3 Nov 2026 18:16:58 +0800
Message-Id: <20261103101658.766905-11-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103101658.766905-1-jiangwenxiaomi@gmail.com>
References: <20261103101658.766905-1-jiangwenxiaomi@gmail.com>
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

From: "Barry Song (Xiaomi)" <baohua@kernel.org>

Try to align the vmap virtual address to PMD_SHIFT or a
larger PTE mapping size hinted by the architecture, so
contiguous pages can be batch-mapped when setting PMD or
PTE entries. We do not expect any significant overhead for
this.

Add __get_vm_area_node_aligned_caller() as a wrapper over
__get_vm_area_node() to simplify repeated calls with fixed
arguments.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
Reviewed-by: Dev Jain <dev.jain@arm.com>
---

Sashiko review: raised two concerns:

- Hardcoding GFP_KERNEL in __get_vm_area_node_aligned_caller() strips the
  caller's ability to prevent blocking, reclaim, or warnings.

- The speculative PMD-aligned allocation, on failure, could trigger
  spurious vmalloc purges (reclaim_and_purge_vmap_areas(), synchronous
  TLB flushes, shrinker storms), a possible DoS for vmap() >= PMD_SIZE.

Both follow existing behavior: GFP_KERNEL matches the adjacent
get_vm_area_caller(), which hardcodes it the same way. The purge concern
is not new -- __vmalloc_node_range() already attempts PMD-aligned
allocation in __get_vm_area_node() with the same fallback through
alloc_vmap_area() overflow/purge, so vmap_get_aligned_vm_area() adds no
new purge behavior.

 mm/vmalloc.c | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 42b3addd20f9..e15bcef804fc 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3361,6 +3361,14 @@ struct vm_struct *get_vm_area_caller(unsigned long size, unsigned long flags,
 				  NUMA_NO_NODE, GFP_KERNEL, caller);
 }
 
+static struct vm_struct *__get_vm_area_node_aligned_caller(unsigned long size,
+		unsigned long align, unsigned long flags, const void *caller)
+{
+	return __get_vm_area_node(size, align, PAGE_SHIFT, flags,
+				  VMALLOC_START, VMALLOC_END,
+				  NUMA_NO_NODE, GFP_KERNEL, caller);
+}
+
 /**
  * find_vm_area - find a continuous kernel virtual area
  * @addr:	  base address
@@ -3692,6 +3700,30 @@ static int vmap_pages_range_batched(unsigned long addr, unsigned long end,
 	return err;
 }
 
+static struct vm_struct *vmap_get_aligned_vm_area(unsigned long size,
+		unsigned long flags, pgprot_t prot, const void *caller)
+{
+	struct vm_struct *vm_area;
+	unsigned int shift;
+
+	if (arch_vmap_pmd_supported(prot) && size >= PMD_SIZE) {
+		vm_area = __get_vm_area_node_aligned_caller(size, PMD_SIZE,
+				flags, caller);
+		if (vm_area)
+			return vm_area;
+	}
+
+	shift = arch_vmap_pte_supported_shift(size);
+	if (shift > PAGE_SHIFT) {
+		vm_area = __get_vm_area_node_aligned_caller(size, 1UL << shift,
+				flags, caller);
+		if (vm_area)
+			return vm_area;
+	}
+
+	return __get_vm_area_node_aligned_caller(size, PAGE_SIZE, flags, caller);
+}
+
 /**
  * vmap - map an array of pages into virtually contiguous space
  * @pages: array of page pointers
@@ -3730,7 +3762,8 @@ void *vmap(struct page **pages, unsigned int count,
 		return NULL;
 
 	size = (unsigned long)count << PAGE_SHIFT;
-	area = get_vm_area_caller(size, flags, __builtin_return_address(0));
+	area = vmap_get_aligned_vm_area(size, flags, prot,
+				__builtin_return_address(0));
 	if (!area)
 		return NULL;
 
-- 
2.34.1

