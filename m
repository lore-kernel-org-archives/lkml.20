Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794059467;
	b=pmJRqMXY7RDjjgsAB0JkDy9OioLWA/mNERyiOUehvZ1kdAP0KB6JnQYkmyfPJjmGkgnz
	 peoXnZl0v4mxHigeWiNefWzLeE3E2NZgr0wum6bRkxw48n+n/6ODL/nLWReQQsBj9oIaV
	 O5/zetOluqVLvC3WobxNEYFhRJlQhU2OCLXT7BNpi+XEBXH0j4qpE5/EKov7KvafglCb6
	 3nL3dCr5XCf73D6OWb6ZkLcKGUbcy9a1+4b5/6xB/L8RjFqVDLvzvLvBJW0CdubQBefmd
	 XL9f3ieA3DdIc4eXvbkv32WCLN/4PR5CLBqL5CgCBVrW8JDtI0VV+KtjzIEXkfFHR4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794059467;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=baZEbrhbhDEpq9QKIXgzBR/d0LlM+jrSsgwjy5hT7Ro=;
	b=4uFkfKmXeUKdi62zLfAMHMubWbWT2uuo05DGlov2I4XCyb4Szz+aOSVCBMqZO0USy+B2
	 Q6ndl2/UNd3brAu8cTbZBgxj711yCgGgoIfJS9ejlzKjtQKUnHRdUtOt5Zfcl9Y9cOg74
	 CDOGgXr2rLGACUi2hGLyC5rzQsx2QAvLeXe/g4Zrhy9WyeXA9geIoppvsoLONKmVIKHn2
	 TkKMlDasedwcvuAxlaglfG64yjlmm90baVEPh6CoLGv0qHkbbUHazojpdj4ObFahkVW6O
	 xukgZahsBBbVMvCM6y3aSdUAfu476/8kfr6MEFBJk5xEDc3+NgpmZG93TjofOnraIcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wJLH6oS6;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226DA606A330
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 13:51:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 226DA606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wJLH6oS6
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36dbde64409so2132835eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 05:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794059466; x=1794664266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=baZEbrhbhDEpq9QKIXgzBR/d0LlM+jrSsgwjy5hT7Ro=;
        b=wJLH6oS68fDwntJFSRpU1QftFYs3cs0jiYpr9hgNApk09onHnln4zaaFwFGL2CyUWW
         CtTdvdGvXG9DckgE9lEjz+/SzERZrEyy8H6Jmaj2djoPylcUtJteoUu1EScYV49dUYhq
         vdR2es24+Pq9i7soVShUaeTYbLNSAqYDvtPrpf4DxH61wmsykcrvKQTsAU4Wteeq9cok
         9AQBm8Y4GhErPnKQaJuAOHRhmhC4sUKavpLBhD71s3NOxdhidE4hp5u2P0n8brYtGvT6
         o6Sgunw8o+3I1b8rq1mxAxiPNRhJVkkKPvOpVElR2l0q6UKdu+cy6fStLQ82X2XuZ5da
         F8IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794059466; x=1794664266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=baZEbrhbhDEpq9QKIXgzBR/d0LlM+jrSsgwjy5hT7Ro=;
        b=Nbl8rP47fRtsOScIn9eGoEaGQSTWq8a0EK5wt/5fa36Mmfr/kMpe9zlQzD66Y5tVPy
         tt2t0OhZ6vtVIeXLIJQ4T+sgjdmwd/5woHKNkz540nbEmupZ0b1Dui1xi5buXHQwnwaK
         nsHedo74LJKbCIMJaRaAPwePEgoZSaCI+hxf53P6wWeZrdn0kX6lWTqUmcshwQczI7r9
         j47a9mhHem9guxJvEYZqxLrAkHlvMtSl92XnapAMhh/TbcJ/RnuYudZqhyKH5YJf9+L8
         u2/KGD1FzTrYMS/msNNsos97/sS/JsP+gIjFaCBdP1WXmjFv5CyNR3e/JyDSmLkh1ntg
         5cAA==
X-Forwarded-Encrypted: i=1; AL+hErFvGkQKMeJHjzkTFwOQdsfPYcyViVrArSUf6/Os1MFlYlt9RBw9RxW4NrS+QIaJZkLwYZ3DL21Uu3b7YPs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Z96BAtK/iriasnDL2jxwt6dsu/Z6t9rEf/VWSVq7aUWz7x+yR
	j0dEukFTqolcSnG/V0TzeLiONEps/+gV0ttV9ECvfZUrX77xgmZxmNGL
X-Gm-Gg: AYBFou3oWaPQ6f+NkxtgQuGW+53oD14W1KkPoE5JJFqx2SqY0A2hijVs3woCUKOccxA
	y8Q4wrpyKz0G1jcLcXiw7ZQLRvlWm/fHRpzDLMsmPULo+AwuqKqcy9w25kS5eINGu1kXyR8FWH9
	QQ0wA1Ax2G/o/o3zFAC4y/OAaL0Yz6QrcSKOcdRNTkAl7mLtV39wXrEzwdlepPWEWTUJocbPF0C
	BxiHvohqXpiT5DOuiJke7RVyIF5fI1AOJN5xZQbIPp0fH44MkTCTFRB1Dxe5IbXkdOdi52vSL8G
	Gw0e5i9ppkCpk15+lrBVREnK4HW1jmNjU9klyN3tkNGogNzHhMR+ky7qVF8+c4r/5OxgPEAzKgR
	05Bp25yOv4b0F3PApMqLNYhnqkOl5aE3TpXpsah1MuQcgS+RvBVZ/O+1ljgfo08b3JdJeAr8sKu
	BX940i866mRP0JrxSP6GqjkpuD9NvYaRxfxcXSoQGOif+Wu2wZid5d9ZV6SmBzDfX+fpPeUON4r
	JaQH5JA1Wuvu9h0u3oBeRHmngDGNl8E4v0Wz47ifRUGcpNFQ3oILVk4Ti6IZPmn8namUp8yMNvK
	63gEd8Y5oetlYuNV3Uv0hHlfDisiohkXQXtvhfp9SAKOlCGZZD6pAPJ6Qw==
X-Received: by 2002:a05:7301:6486:b0:36e:97b4:1071 with SMTP id 5a478bee46e88-36f75b1f828mr7447409eec.14.1794059466185;
        Sat, 07 Nov 2026 05:51:06 -0800 (PST)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa922c6c7sm21280820eec.10.2026.11.07.05.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 05:51:05 -0800 (PST)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
To: akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	urezki@gmail.com,
	linux-mm@kvack.org
Cc: baohua@kernel.org,
	dev.jain@arm.com,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com,
	david@kernel.org,
	rppt@kernel.org,
	leo.yan@arm.com,
	xueyuan.chen21@gmail.com,
	chleroy@kernel.org,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	ajd@linux.ibm.com,
	jiangwen6@xiaomi.com,
	jiangwenxiaomi@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v12 10/10] mm/vmalloc: align vm_area so vmap() can batch mappings
Date: Sat,  7 Nov 2026 21:49:53 +0800
Message-Id: <20261107134953.748622-11-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261107134953.748622-1-jiangwenxiaomi@gmail.com>
References: <20261107134953.748622-1-jiangwenxiaomi@gmail.com>
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
 mm/vmalloc.c | 36 ++++++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 5b898da0826ad..6a150b11261a3 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3365,6 +3365,14 @@ struct vm_struct *get_vm_area_caller(unsigned long size, unsigned long flags,
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
@@ -3696,6 +3704,30 @@ static int vmap_pages_range_batched(unsigned long addr, unsigned long end,
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
@@ -3734,8 +3766,8 @@ void *vmap(struct page **pages, unsigned int count,
 		return NULL;
 
 	size = (unsigned long)count << PAGE_SHIFT;
-	area = get_vm_area_caller(size, flags | VM_UNINITIALIZED,
-				  __builtin_return_address(0));
+	area = vmap_get_aligned_vm_area(size, flags | VM_UNINITIALIZED, prot,
+					__builtin_return_address(0));
 	if (!area)
 		return NULL;
 
-- 
2.34.1

