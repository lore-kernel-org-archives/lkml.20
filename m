Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40F8542ED0
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792082802; cv=none; b=aMjqYXKW7BL5hdm5HOxtM/+fMcsFJggdeVNJa454aP0S7tC6jFFqCldhisjk+taV9693XYrCTr6TXjIHeZxEPgrhq4CG3TNjabjC1j4bX2xWTDmA2ykNiC4QNq82Nfdl9uRquyNDKSqiX0Kyu3oKVMWCwL0tSITTB5E30Rkzs1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792082802; c=relaxed/simple;
	bh=jkdi5QcywCYSdKu/51WGs5jsXahFqaUqx+5RgoXU3xI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gKJxDpI+Fpkqw3w8F/6Rn41Ou8GlW0/QDBQQ2a9hRbkxJ/oQcgo9Elw8ujyn/PuPtLJBux8Tei4eJo/FLtq5qplrWTgggwmZuYCHOBtG4tByiD63izY/SbgTzBPtKHH4P1iNeaTTP667MqmMRxQYZgk7rcqC528jCzExY8g7w78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T6w6SM97; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T6w6SM97"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4887dbe4f2dso555111f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792082786; x=1792687586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J9OiKqs3sSh08wicaZgXTABHq96NHbvROo2HibEzA6A=;
        b=T6w6SM97MTM6ypLiB0WgcQ8iLzgYb3yyF175paJbR1TNYsHJsEssDLJaEiQ7qpMtn7
         k7a8r8kh5mQd3XVM3VCfz+Coux+Y56ECe5Yaqwtg9lND1OSoU9e7pbCyaNe22fBlY5Yz
         YgQd6H8EErxze4NUE3im0UY3g5VaKsHd0dH+NaJDwsjHU5/rjImR3OQURD4iP5X13MqK
         hGVuT7MDljyDM2KohpRVCIUQxyf2EIl42W46rMPFxBuNX5AZkks/uuU0ZPUG914IIakC
         eObu/qPPNfmZH5sYEcaJNlXv2AY7W0r7CTdBec/9ZLsv2aY8VdBu2WxTynyvB7Q2CgAN
         UInw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792082786; x=1792687586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J9OiKqs3sSh08wicaZgXTABHq96NHbvROo2HibEzA6A=;
        b=RcLcXzQ0Zq1c8vPXaORDwE4qS/vS1K6oirz5Vo5o3ngbfILvhCGhMj2F6v+DRd8MyP
         AJFQfmRJLCeKatK7tIk0g+c7T7v3PfW8V3a70Y7inYjlRdsx2bhy6NHVPrQXUHG5ZHPV
         4uQade47k5Vnw0bcPsd6ssiIIs7W+h4w5oXMZZ3prStFJS2sxfVY6ALB7i34T59yvRUK
         kk/NrzIPnRDJzYPP42KlLKJ1jOA7SqI8l9Wgk7iiUxkEhMoulX1oav0HbcsC+8mBJJJp
         DcV7fMuvvIHIHQeVyo2AkAu9EWDRTgPm+BZ6hqRT2Zd32/kGLAsV3cX1mphZNYqqz6H5
         UFpQ==
X-Forwarded-Encrypted: i=1; AKwUvBzmIdpfwpxmvnQFI8jG8jTlFmlWghUl5RFbUmHNoqHZqqB6Le7V8jeStzJeTjrgIr6GnR8AMHs+D3NG1wI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqJ7zonlI7GEX9VoauQxVgKmqE5QuZXE/ihtrQby66Cb586Bvj
	Oc/Zcs9TNEjeo8qHGVRFzh9TtzVaBlnKssihe9OivZTxPR5hA6C/Y15d
X-Gm-Gg: AYBFou3dvGj3/pViTWkBqkgN0i2p0Nn2kzNujXeRYCJ3SKsp/1aAeez1RYctV/0Zx4S
	Hljj7xlGfpXHPRobjtudtadAsZjvc3dnbI5dmuQOt1QHu1JXPcxDCC20FPgCcjMnPfHfQLzmlc1
	3Q5b+zdnFWQ0hgxEokD+RaygT2RYeIvZtDB2FWxJA5kUYqnwDtRbnr9h/EELA6YbbLr5YgnRT9m
	czJvregTltMElCva/hLHeCN9lCfRE8md8kkWxR31tkCodwsSYc3a24asnFnRhpQIDHcT7lqMfh1
	7fDOhI56KuTC7k5wnbOT5QjpCDWt1+n74vIJ0eezxeYKXoXLqpwiW/FPOeBxZywSRZ7jUQWYT6I
	jAUBgWZO7uv9osyKmKJEX6ir32yqEAi4rhXW/jLoQOrXFokgBmviuO4PjaIaD9rAS1MJ1AYN9Le
	T149MVZufdv3e1tn7JM5gErOnu1f9o5tmKLoet8XfmMU3HX9JZg6W3klZM4FE97IMlQGZmMQ276
	46hLdOcYDeEQGh/yJrb
X-Received: by 2002:a05:6000:4696:b0:48d:f1b3:7e82 with SMTP id ffacd0b85a97d-48df1b3802emr5501546f8f.0.1792082785513;
        Thu, 15 Oct 2026 09:46:25 -0700 (PDT)
Received: from Nuel20.localdomain ([105.118.74.201])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc85b1sm19110712f8f.54.2026.10.15.09.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 09:46:25 -0700 (PDT)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	mchehab@kernel.org,
	paulmck@kernel.org,
	linusw@kernel.org,
	Julia.Lawall@inria.fr,
	gary@garyguo.net,
	rmk+kernel@armlinux.org.uk,
	hemanth.selam@gmail.com,
	emmaonana18@gmail.com
Subject: [PATCH v3 2/2] docs: kdoc: strip DOMAIN_NS() wrapper in function prototypes
Date: Thu, 15 Oct 2026 17:44:48 +0100
Message-ID: <20261015164524.14066-3-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015164524.14066-1-emmaonana18@gmail.com>
References: <8733u7t8xq.fsf@trenco.lwn.net>
 <20261015164524.14066-1-emmaonana18@gmail.com>
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
index 04dafae412e4..e4f44535d0dc 100755
--- a/tools/unittests/test_kdoc_parser.py
+++ b/tools/unittests/test_kdoc_parser.py
@@ -472,6 +472,28 @@ class TestTraceEventFn(GenerateKdocItem):
         self.assertEqual(entries[0].name, "trace_gpu_power_status")
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

