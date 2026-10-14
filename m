Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728C04A5EB7
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 22:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792017288; cv=none; b=eRDQReo9Yt85WqqJaafEjX/+ika7gqSNlYqGq3LmPJbb9a2opMyjdKmk1iNvJ5exCCRdVNfynxgHLKrBZukoh8YC5YG2iCGJaflAERvyjQ49QnhmV9ua/xXob73fYAGgaeO48UNSCy2Pfn4OyIC95bLTXgbhYDBWuwuc/U3TLeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792017288; c=relaxed/simple;
	bh=jvKieiN/MIDL0uMKt1BBJ3kYZRkWcRytAyOG613frss=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rDVSZE4YQlRCMlXfSB41b9ywRW4/yjHf8CjuNX28Y9Mli3SaxF8H2mwl+WVRJwA56gqY0zpJBlnJHGOOA0l0IYvDcYmNmYalX9oqZJwa/nfJzE/KTNuQZKFf0iT9DOtsq9gS/+vnJciI3MOckq/HSFcH48skH2no9BqftX3U090=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F6U+usxO; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F6U+usxO"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a17ce1dc00so9566765e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792017285; x=1792622085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SmSt0lwwYpzoU3Z3FsPgmpJmsS1rTW6phAJMbyBSMEU=;
        b=F6U+usxOSc8VA472o1QG4dbRVlIH/2J0kkMZHH6/tWlae5DaCaN+6hiAL3PQ+Bszm/
         ecBXnUrH529WTZKiKh4ijr+6GE5IWxKHy0g70t4V0zkK+MQxNg23VDT3Pec8jw1EnF3i
         VZZ1gD1J27d5+a9t++tQoGxb2Gno7KP7Y/zl/dBvD8vxCyy1Gz+aTmFZX3Vu0ZmaMSVj
         t/eqhXGOyqUG6mG6dI0j5V2j4RK+LNtApPj4TfMDkfYZhBKZ4fxcn2NvRHF73+LtlqSm
         lqHVXxZlQpaMVt0ISSzLbl2XpcUKAhUXJ3rJrqK7y0MQOc8XUwNUHH/bUzok+3ChFzF9
         M14w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792017285; x=1792622085;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SmSt0lwwYpzoU3Z3FsPgmpJmsS1rTW6phAJMbyBSMEU=;
        b=aynIllJp0R58kHq90Re7g/n+A1xzU/+iSh1bpVUOxqpj+GJGXr/MYo2QDZVTFOYZJc
         eR3TaN777xk5TBLg12Cnft/mq0D0nlkRzTx4XRptdKyTB1vKsojRK7Zi8SZlg3NbdN4F
         wUed0rN0IIJX1Kva+WmZfFs8Sj4NhYmpzASxznpP5AXzV4DpFDuFcmuxilmbSedLjbXo
         exzCGpLBUMYko1HapmbFjH+1UOSlxJjC21BijV4h0AePNYwWyZnIs23QHqUCj0K9veye
         4Y+RXC93fj+RVwHmvVaY8gICjxab/yBX+9Y0YnQ1MMeD8EuOhHJb/T7+Xj3LjntYVGNl
         VAxg==
X-Forwarded-Encrypted: i=1; AKwUvBzNHG1HBRG3GC11wlnr9+4EcGYGg5NZW9nKnmbAThBhLUMO0hzxMbq3y+kQ/HxouxQgfh/6d/riEqfA44c=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3gHn8fYopYPlSXO/0bRSt0S7TJh+wG1kmWnKuzRNDhk0UcdmB
	cL7htt2p6qdiDZnYIwQDYHczNFTa6lHOr6IizwOasKNXXrmses8ylrUW
X-Gm-Gg: AYBFou3MHrX/O6d6wTVZk58xE+IpQQvgLfpN1PqMq0APOH1KzQSNMnsDFX+3HfHBCpM
	GhGn5xjxnmcKvn6TdrvNkf9PiXrEqlbAEoxfXinAy08K4p30u9Qv6kZnJjD7SNbR0TsLZoxy4Dv
	nVAQwcZ9Yq07FMyxhJEcyBIzhetvU56SUKr9XX3Wz1iDLtGdhVOFpK0kRotzQq/jh5Ow/dj+Krt
	hS5y2+7VtL2BjaUDpIOi8PzS9NC7UpSaPoNu3Il7yLOCZtV+N0TbtN1xrDGdV/bFjhpLqX7GyCP
	iBrEvXFQkKaAruJwoomsGRoNch+re9Li4TUjOPogmOXO/Oya4qJ/oay901J9lMr8ihifyT6oE0s
	qMBZPUYVOVzXZklftn/KFClHkEaVBFsnMnqrJrxIbH8cGhOMZ69xLwo58Pd1wTgVXqZEOX4pOM/
	HQ+1cdIqdYeN6xc2RfCDcr2D8n1HNU7+5HejhNlB6D95f0ddRDVGu/wKaCb3/EHotiY0/cV1KTP
	1cE6gNIGhxw+E1llbr8aIUzrHvsy2UiH3ZoDbg1
X-Received: by 2002:a05:600c:1912:b0:4a0:1e9f:64f6 with SMTP id 5b1f17b1804b1-4a18e3ef211mr319239075e9.0.1792017285347;
        Wed, 14 Oct 2026 15:34:45 -0700 (PDT)
Received: from Nuel20.localdomain ([105.118.9.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c1eb3907sm1071785e9.7.2026.10.14.15.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 15:34:44 -0700 (PDT)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	mchehab@kernel.org,
	paulmck@kernel.org,
	linusw@kernel.org,
	Julia.Lawall@inria.fr,
	gary@garyguo.net,
	emmaonana18@gmail.com,
	hemanth.selam@gmail.com
Subject: [PATCH v2] docs: kdoc: strip DOMAIN_NS() wrapper in function prototypes
Date: Wed, 14 Oct 2026 23:34:37 +0100
Message-ID: <20261014223437.16164-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kernel-doc fails to parse functions whose names are wrapped in the
DOMAIN_NS() namespace macro, e.g. in
drivers/iommu/generic_pt/iommu_pt.h:217:

  ... expecting prototype for iova_to_phys(). Prototype was for
  DOMAIN_NS() instead

function_xforms is the designated place for unwrapping function-name
macros, but it has no entry for DOMAIN_NS(), so the macro name is kept
as the prototype and the real name leaks into the parameter list.

Add a transform expanding DOMAIN_NS(op) to op, following the existing
DEFINE_IDTENTRY_IRQ precedent.

Add a regression test for the wrapped iova_to_phys() declaration.

Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
 tools/lib/python/kdoc/xforms_lists.py |  6 ++++++
 tools/unittests/test_kdoc_parser.py   | 22 ++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/tools/lib/python/kdoc/xforms_lists.py b/tools/lib/python/kdoc/xforms_lists.py
index 15f6f21c7a9e..c9ce9bddebba 100644
--- a/tools/lib/python/kdoc/xforms_lists.py
+++ b/tools/lib/python/kdoc/xforms_lists.py
@@ -92,6 +92,12 @@ class CTransforms:
         (CMatch("__diagnose_as"), ""),
         (CMatch("DECL_BUCKET_PARAMS"), r"\1, \2"),
         (CMatch("DEFINE_IDTENTRY_IRQ"), r"static void \1(struct pt_regs *regs, u32 vector)"),
+        #
+        # DOMAIN_NS() wraps a function name with a namespace prefix
+        # (see drivers/iommu/generic_pt/iommu_pt.h). Unwrap it so the
+        # real function name is parsed.
+        #
+        (CMatch("DOMAIN_NS"), r"\1"),
         (CMatch("__cond_acquires"), ""),
         (CMatch("__cond_releases"), ""),
         (CMatch("__acquires"), ""),
diff --git a/tools/unittests/test_kdoc_parser.py b/tools/unittests/test_kdoc_parser.py
index 4baa78ca02b3..768a5f01231b 100755
--- a/tools/unittests/test_kdoc_parser.py
+++ b/tools/unittests/test_kdoc_parser.py
@@ -444,6 +444,28 @@ class TestContextLockStruct(GenerateKdocItem):
         self.assertEqual(entries[0].name, "debugfs_cancellation")
         self.assertEqual(entries[0].warnings, [])
 
+class TestDomainNs(GenerateKdocItem):
+    def test_domain_ns_wrapped_function(self):
+        source = """
+            /**
+             * iova_to_phys() - Return the output address for the given IOVA
+             * @domain: Table to query
+             * @iova: IO virtual address to query
+             */
+            phys_addr_t DOMAIN_NS(iova_to_phys)(struct iommu_domain *domain,
+                                                dma_addr_t iova);
+        """
+
+        kernel_doc = KernelDoc(self.config, "test.c", self.xforms)
+        patcher = patch('builtins.open', new_callable=mock_open,
+                        read_data=dedent(source))
+        with patcher:
+            _, entries = kernel_doc.parse_kdoc()
+
+        self.assertEqual(len(entries), 1)
+        self.assertEqual(entries[0].name, "iova_to_phys")
+        self.assertEqual(entries[0].warnings, [])
+
 #
 # Class and logic to create dynamic tests from YAML
 #
-- 
2.43.0

