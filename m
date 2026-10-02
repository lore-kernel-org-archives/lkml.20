Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E90D2E1746
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 04:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790914532; cv=none; b=f+r4SSlIizvbp2xHr5jyUyfoqybipi7vOuKHts6DK0MJ6LMeU1WzTJRRyYsiK/Tm/ol5HStb6GMDxuozkOaQDzU6R534HdKOS7MNu0XQ/tg4I+0KnG74F6waDkHDW/bbxvnakfyq27niTmNdANY3Lmn7cosAR19KTNWvOUz68xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790914532; c=relaxed/simple;
	bh=qEpCCNFio2iaESKTqfGgNYuFlMgPhAmm2vmNFrdbijM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VCqxvVctRTZU4NbBj0x3P3xCfmc0oNBJ+6hHsUdnwp+lzM9UikHVPGO1HIQ3ki3JKiaSCjH9wIz7NcSIltcfyo310Od0B+KWKhPKE7GkbvjwQr8pjoKuSXkiAGe6a9dvZ7EHeB5X7pI/J9+V8RpU3YO7N9HRqiXCcPPz9l/UVXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d3xg2BKO; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d3xg2BKO"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49fe8beb8adso3357435e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 21:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790914529; x=1791519329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AIDrugdzd2VRvxrjP7DNmuK/HUl0lALqvQgqwdaAuLE=;
        b=d3xg2BKOmA90d5rZ0VBaZabiLPOtldOdDrFXThx0C9O2DCQz+QVwr7Ia8L/pd/R4z9
         JWMGur/W/2m8NwIPZCHd5l1Kak3zqrGuuUNufD4mr3OrED1/7a4bl7CvZYNsjzWaETdY
         SAAKfYyoEnaxPAK3KgCbcfJkhEWhHHQKwxuXLhK9F2hwsSjqzVXds2b6GuLmpd2qgAkr
         zvE1gp3bUAtxcns6pEux8DhUlxLxJZ+Chhuisvvp3inS8PQJmnV/19nyMnWXcYgc4Sw2
         9/qVBIlqMBNp4OC5WCQ0zFzsAWhzaxsa3m9u0VPGG7HaJB8xnQlHw3rOjCqI++Oq4Ffj
         +p8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790914529; x=1791519329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AIDrugdzd2VRvxrjP7DNmuK/HUl0lALqvQgqwdaAuLE=;
        b=o41gChUq9pdmhTUs4vQnh+ErsHuQovQeVNBfYOqD8J2w5tUou42Z32w3sU39aYfUUI
         pf54X/GFREurrXBqUKU/nGgMvZ6OWzM54Ll2o0UjefAhBdvRpc2Rp3JCWytl0JkyHToU
         tFhuW5M8Jp1q7BHvrlBxDnQw5gnudhh07VBlF7FdiJGYN+bHs0jB8A1VFUow0GDCU8oQ
         Pc8IrUf8rMPwZvLzN5GDedBQArgcoLo2QDINWuiYVzVF3PArvJZAsa8ZZ47MgxoaKlrG
         0NfHLzGkcG7xTUnFY8WxhPcI8REBEdtuNXJFaU6y+Q0zw8HkMLb/jzuOlB25pBi/AT9l
         tL9g==
X-Forwarded-Encrypted: i=1; AKwUvBxvGW45rwHIzsP3WWSnmCRNnOtfIxjwNFeE4yjc06/h/lcK9CNjzxImXlwlwyl5eFCFJ/DonIksOHW6PgE=@vger.kernel.org
X-Gm-Message-State: AFuF++lY0EposedcOHgJBZye648dXdnID7vi3Ru+4hsRtaE3gIgZ8nZk
	rpUlHhGeVYobYesHBC7RmTAipQ4CCd5d7SM+pdW5C6PhuO72eMjA8VwJ
X-Gm-Gg: AYBFou1L7ec2zzzuqyxrqOi64wC1tQDNQOWxL6SwxPGa7ZnX6XjBaviiKYIsr6dxmNF
	TSfIS0iE/c7Eb9ii7dkHPYRWBMnvvh2xagGe8sgooEaDzfFnlezM3VYE8xz6OxMAHTm3u9XVYju
	wU74aZ0jsZRukZJep+r/LpnlkYH3IFe1FWeRa4EYWzDoV1cXR1CawMoyQaXqvxlMxi2B/URrpYY
	/NS8Wf9n6IIIGeIrlnSoTUMR212m6f2lBWp+sQQv4cwj90CWcnSvlAFuTnbUYL3/AedA2QsrLwI
	7kQGMhE04qT+I5oYIy2WP086MZfo2yJpD3dusAjPy3x2UYPtSSBvyc1xZA6FdGaLGyTiudPjPI2
	5BWkuhshy2kJZLgI7tCuHqrlHRuaY++0ubCl/KFlgXM4pLa0BmeZqm7TWJZ4ULEUBoG7ceOr5fz
	PVJnjykoEzQaSWIfHni5bDke2Qom65j/JiwUB82geqshAkRKaYMcvnddNUUyNFVDOltMtKAzcLO
	GtWOjFfW8XxvgaKEqnHkDXXZQwV6QY=
X-Received: by 2002:a05:600c:6384:b0:4a0:13d8:cd0c with SMTP id 5b1f17b1804b1-4a02769886emr25697315e9.2.1790914528481;
        Thu, 01 Oct 2026 21:15:28 -0700 (PDT)
Received: from Nuel20.localdomain ([105.118.71.106])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03ff3cab2sm13522835e9.2.2026.10.01.21.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 21:15:28 -0700 (PDT)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	mchehab@kernel.org,
	aleksandr.loktionov@intel.com,
	bvanassche@acm.org,
	emmaonana18@gmail.com,
	tudor.ambarus@linaro.org
Subject: [PATCH] docs: kdoc: strip DOMAIN_NS() wrapper in function prototypes
Date: Fri,  2 Oct 2026 05:15:19 +0100
Message-ID: <20261002041520.42061-1-emmaonana18@gmail.com>
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
index e3dda2fe8a53..5e8bd9117895 100644
--- a/tools/lib/python/kdoc/xforms_lists.py
+++ b/tools/lib/python/kdoc/xforms_lists.py
@@ -91,6 +91,12 @@ class CTransforms:
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
index c4a76ed13dbc..4b47a858824a 100755
--- a/tools/unittests/test_kdoc_parser.py
+++ b/tools/unittests/test_kdoc_parser.py
@@ -418,6 +418,28 @@ class TestSelfValidate(GenerateKdocItem):
         """
         self.run_test(self.SOURCE, [self.DEFAULT.copy()], self.EXPORTS)
 
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

