Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3502EEE67
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 20:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791664755; cv=none; b=FGBP4Ub/uqgIzaWzjMGWRByCkaQypxSNhba2fOhbWpUDW9rIJ3dqMm0cco5YspbiRxMI5/o35nP92PFpXfNDBM/4NpMCWhUVUWP6sqlymY5xrSC152jz+3uVTFCa2IIxKXRx2xBF7XZ/aq5DctzlKNVc3WPL3+5oXsm9I/V7FU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791664755; c=relaxed/simple;
	bh=R/f2TZIdBR9/jHqI8EJtzO1QDnSh53xYdyBSfcMVXxE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=m15isJuYXdfGzRPb6DUTzAkz2i+d+m+5PziPo8pedGGTbDl2V1+zbVgPIrnKbEu4vuRbZIBV4gRkNptLR0CisiJFJxFgNOIPNGod16QrnDnXLL9BOYUXk5vu6+NkY8tsG0hPPC6O8aavS/p7hfvaQ1dDLshiVurL6xcOOIpn+XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EJECMalr; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EJECMalr"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so9812435e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 13:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791664752; x=1792269552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JNuMer0adZ1K0ed6Vf60DHY2owT/YxK/mEmjSJifHAw=;
        b=EJECMalrxlBxV2CWoNk3QGQ3Og3/09ShperahhfBu1K5SBe/42crf/me9hkuCF5KmC
         UaNFMmELOlOWY2OQgoCA1elY7lZP4d0TjrsnANWysTiPP3iXDumnS3M1NkR1oKfbuBgj
         MANp6bxkZaQzavStLSwivRXOWmBWd33O4rJu7S4M+844Z39/NqEEcbyBsGxbhcGO8VNH
         EQOZj/v+KuP/G9pFCfS3fLVwLpaVp4xkWDVYWybF+U0PfCa/6SpplCwUjI2mdnVEmh63
         LqXVCHOjznErYG1jYDK/0cwZulVEf3IA5roscCAL3w8l1LK6f1VtVH12rmDipG9QoMDF
         0yOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791664752; x=1792269552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JNuMer0adZ1K0ed6Vf60DHY2owT/YxK/mEmjSJifHAw=;
        b=qk22SBZZKm38GUJhiolHix2+0cDN7YH5+InS57dtdpL7/Q3UWAchk8CB/+x9HCOeiZ
         yg2TkURvM4eUJGlsw2pJ7FHEqrXHL89hpR64n1gynPVjTHW3cuJe8uavZdKDDCrksJyE
         2Zbhilrue7MW3LBzAnvgImqFjYsMMe0zCRdQzub/HXPsQsUrzr01SBloZZrcOyK7/WY3
         hJi7Ug3ZbpLlDxojqTkS78SWA/uG4oasCruV32EU+022XkxxSOfGdw+vMmIIa6CClsxx
         meWeB5lOSVQjfdqMqfhSxKMv2r9DOunxOCLRwh7bWSW8p85UOUyLoW9Q1iv1FoAyP8TY
         cJsw==
X-Forwarded-Encrypted: i=1; AKwUvBwKOXRMmId4STKTvF0+pvtSj6k67xaQLeD4N7pLmRC0tWHT0WxdZz/nDUrIgiL5ELb8um5u/ro61/Vk3Sg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVUGXB9jAY2znNUGGetIbZSa6+4N+WV7tVqgbcrkewf3MuTHWl
	0WYDNLXM32fjQ09Z9q2U4/XvaGPjscxHZjmTvPZHFHNdgvhG2H9yzZBM
X-Gm-Gg: AYBFou1E9WO9NFufZGyp9D3Aivh8857XokPJQCmn4cPFKDtAxEUOA4JPqkvhBIW5ZWg
	Cfa65kKdQmcKlUExWEDD9R3p9bZnyxhhm4dsm3UEdrxjDVOMNU7i9qH/+0yZDOzNsU8OWq533Eh
	3dHDgNDWr0MvV9gJDMg8WxZcaXXABfSRJn3QnRpd5Qie9dB87JKRO95zgb5W5fGKIGCWQOVUald
	W8tBEF8TwvOzFATwm18/vJ+SAI0Vi4OFSraK0z1DAZYCHJHGTDZDcO8J/wrMlYz+a9vCg41lUM5
	CKSPT8aegCjL42k3ibG1GjJ11W3wZN39c9kdl9PxcTwW9tlcMvWbGzcDXbI3PBpKsw2niJhUtt/
	PbmrhDmn/vqO7MJRpkYK71Na9IaptEPl0VhG4NF57mHqr8t0vxioZ9uL5uQIwe4mlIdwLJgWKps
	1/j+PdjcyqgU+EhPXDxLSRYqvtuowPbwUe1aNRuBr+HCXgqcMnOxVNtUYlCEr9JjeFqK1xb0Zne
	D12eoGBIIUPTpGF7Rc7zwudgexlpxNOR443isRYWUOnDQrLRvXGNWxlx/DbEhU7FsCLmi/2Q/Bl
	0KDM8JK9Ib3/wq+3xg57/Gezod7ZpBrZJ1W9jDarfL4/1U4A2p6eksqPounV61z7R070cXhXAJU
	=
X-Received: by 2002:a05:600c:4709:b0:4a1:7baa:7303 with SMTP id 5b1f17b1804b1-4a18e4a5237mr105971385e9.7.1791664751688;
        Sat, 10 Oct 2026 13:39:11 -0700 (PDT)
Received: from imx93-evk.localdomain (dynamic-2a02-3100-9d3f-0d01-48c7-5d76-0ec6-9dac.310.pool.telefonica.de. [2a02:3100:9d3f:d01:48c7:5d76:ec6:9dac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be96549sm217808145e9.6.2026.10.10.13.39.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 10 Oct 2026 13:39:11 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Vlastimil Babka <vbabka@kernel.org>,
	Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shengming Hu <hu.shengming@zte.com.cn>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mm/slub: initialize the free pointer of the bootstrap kmem_cache_node
Date: Sat, 10 Oct 2026 22:39:06 +0200
Message-Id: <20261010203906.93156-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With slub_debug=FZPU, validating kmem_cache_node reports

  BUG kmem_cache_node (Not tainted): Freepointer corrupt
  Object 0xffff888000140040 @offset=64 fp=0x5a5a5a5a5a5a5a5a

and taints the kernel. Poisoning places the bootstrap object's free
pointer outside the object, where check_object() checks it even while
allocated.

early_kmem_cache_node_alloc() previously took this object from a
freelist with an initialized pointer. It now takes it from the slab
iterator and builds the freelist only for the remaining objects,
leaving its pointer filled with POISON_INUSE.

Initialize the bootstrap object's free pointer to NULL.

Fixes: dc795d4c0282 ("mm/slub: defer freelist construction until after bulk allocation from a new slab")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
QEMU x86_64 and custom QEMU SH7785LCR model, slub_debug=FZPU:
validation reports "Freepointer corrupt" before the fix, clean after.

 mm/slub.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/slub.c b/mm/slub.c
index 54ec125033571..9a20aa820bb0f 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -7777,6 +7777,7 @@ static void early_kmem_cache_node_alloc(int node)
 
 	n = next_slab_obj(kmem_cache_node, &iter);
 	BUG_ON(!n);
+	set_freepointer(kmem_cache_node, n, NULL);
 
 	slab->inuse = 1;
 	build_slab_freelist(kmem_cache_node, slab, &iter);
-- 
2.53.0

