Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D982448664C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401432; cv=none; b=O4/qBzbOCeS90IdCNrb6kQpC4SJUT07dCdzPAGta6v2+3Sw+JNujoWo+j19F+kjww9712KdTAuyHkiw2hgOyuUzhZ0F7RapwYZaK2f1OJW8tld5rVXlFBA7UW+1MKM7BrQTuL7H+lpgNlDCNTu2H/D0W/z/8pNdojekJu6ugsSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401432; c=relaxed/simple;
	bh=ywhjiYa8sz83VLckyrtdhzFmvCtPRCP4Hc4K0b9W5kM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fiOctwWokH5zSOOY1mF4jvME+6z+q9jebIgoY8mBpGmf2IapJgH9PC8b+YlFfWr5z7rwEkWHVAiaEPeuDzxK4uVPucWHygZqQZqUckncp8YMX68izqIWEvBM0qqnrYkW+8Npfb2PHOWI4Y3+YUMMTuqfM7EF0UJvYSExYYQx2J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y1omn6uf; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y1omn6uf"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e71974de4so683065e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789401429; x=1790006229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tamt12O2uhKCFMMbIkEpJmlX30Wke4onDdSC/Kq2BvI=;
        b=Y1omn6ufOmc6TMlYctDhWyQL4V0fiPDtr4OPJz12u7h/dqorDa4z0/3veP3eVU+E2l
         lIHxTkyebhYrUB6SZfe5djhUOU/jPXiaGCj2GS8S6MffLUAKLRcQOYaoIxW2XuL9VqJd
         8xsXLe2klBnrDsYI4/BMvqAiPpTUJsE/gDefPij0GFMVkoqPqZ7+ps9uIg5TwvwkkGWU
         IiEmgzMJicqztKRML7fhbY6MLrBO+shWdig93H2IUoZEEsokg9LdeUYCmUdW1CXyZALa
         4HMEgoUsKRTMUQJSs8EEvf8dUJgrx/bFhtUz/0TLRMvDjNp2N05rIj1i1BB8JL4KtL5Y
         wFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789401429; x=1790006229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tamt12O2uhKCFMMbIkEpJmlX30Wke4onDdSC/Kq2BvI=;
        b=Wt+984SMYmMf34CS1Z/sxx0Pxd16DJ7I1ZpMhWY93f5RI6hdjMGwa5eIFfjzGK9hGA
         DO/3dhpCT18bWVRlCE7pFSHqCgdcXo2/5AYNeEzct6qafnh9CbeSlwF1+5bk3IvY8q7Y
         vxJNouk40UnCW8Y4UVZUrwpI9HVQ0z/k6m8CB4VtoAz0/qWE1EPk0pWOgm/hjPzLHU9N
         WKoa/rQV38/WrRs0NAV6Rj97u5+lMniQCYOMQ2gIigi86TaczPMYVDYSjBTwk8rBK6LO
         wxO7NzvAGbONFVr+Z2JUzKeTfGqMmakV4GxH2xNugEg9Uyr590eJ5dfc6oJ09s3MV7Pb
         A8jg==
X-Forwarded-Encrypted: i=1; AKwUvBxmeIFldzTKqmgnpNE63ClLqRcaDToCeKM7yZR6jMteRXjKQG+HQbo8E3dUbMPRN57bvX5GeuKur41+yBs=@vger.kernel.org
X-Gm-Message-State: AFuF++n/uvpopcYsRU9tE9MCLfnZ97dzCpZyidVKnXK4zjnKs/gSNXl/
	BHPyl6cjOducKP3YXw9qzzjffHn6YTBNKS32NFQoSLuMkpRpWzJO894I
X-Gm-Gg: AYBFou1ynrG1TMBNzStvVwfdZ7cXZoOX6l/1c0hmN7VWsSnijvtULKriGTtcoih0ilL
	An6JfGFVmLrnsOP+IyfhF6JVFxKCXgIu8jdQs/RoK0NZEWU9rBntrikJ0OK23G3uPKm3eOuo6oE
	dBSV16VY1WBZIHIX96DukRrPaR+xeJSLhKbyRh9Xpu9q13/iE732i2/iLNsAP7qspD1oMgX7frH
	3YKpQsDwH3i89sZ24euIjFdtDmBV/SfOf0g46D9d1GfJUOTH1ICLnmRd+Zs9IuLcTc+tyyh2fOB
	RhU7uFzvHVCsTOdS06Jok04mks6mxSGo7XtdZ4wBYFjc2/L0iklMlXiSazBCa8atRfQtr8dcYu4
	/4Suxdt/6YKSRxZ1byZKQXeOlLN5+qT2qQ9dBHaOkhtVp0Jdw+ELLSjjH6i+CBOH5KkzTgkhTmS
	x11cZZLFiQN+J83gUb4Qkwl5yv99VFXvMh/7yB1DYjOhGiKiC+INn0ZnH4ECh8DqVVgRV0g7j6G
	P95sNXvN0fRpcA54D0f
X-Received: by 2002:a05:600c:19c8:b0:49c:f9b8:bae0 with SMTP id 5b1f17b1804b1-49e7a68a919mr41608245e9.2.1789401428854;
        Mon, 14 Sep 2026 08:57:08 -0700 (PDT)
Received: from Nuel20.localdomain ([105.113.61.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d6aa69csm787275e9.11.2026.09.14.08.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:57:08 -0700 (PDT)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	mchehab@kernel.org,
	aleksander.lobakin@intel.com,
	aleksandr.loktionov@intel.com,
	tudor.ambarus@linaro.org,
	emmaonana18@gmail.com,
	bvanassche@acm.org
Subject: [PATCH] docs: kdoc: fix struct_group_tagged() parsing regression
Date: Mon, 14 Sep 2026 16:51:27 +0100
Message-ID: <20260914155127.21515-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kernel-doc reports struct_group_tagged() members as excess because
the macro transformation rewrites it to an anonymous struct and drops their
member names.

Keep the tag and member name when transforming struct_group_tagged(). The
nested members are then recorded as names such as fast.order; accept the
existing unqualified @order documentation tag during validation.

Add a regression test based on struct page_pool_params.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Link: https://lore.kernel.org/all/0cf8ea5f-418f-45f0-907c-3d1ed4f03e9f@infradead.org/
Fixes: 2f07ddbd5793 ("docs: xforms_lists: better evaluate struct_group macros")
Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
 tools/lib/python/kdoc/kdoc_parser.py  |  4 ++-
 tools/lib/python/kdoc/xforms_lists.py |  2 +-
 tools/unittests/test_kdoc_parser.py   | 37 +++++++++++++++++++++++++++
 3 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index d9ad1ddc87dd..ced09504f3d7 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -635,7 +635,9 @@ class KernelDoc:
                 continue
             if param_name.startswith("{unnamed_"):
                 continue
-            if param_name in self.entry.parameterlist:
+            if param_name in self.entry.parameterlist or \
+               any(actual.endswith('.' + param_name)
+                   for actual in self.entry.parameterlist):
                 continue
 
             hint = self.get_suggestions_hint(param_name, self.entry.parameterlist)
diff --git a/tools/lib/python/kdoc/xforms_lists.py b/tools/lib/python/kdoc/xforms_lists.py
index e3dda2fe8a53..9e8b3a6b1da1 100644
--- a/tools/lib/python/kdoc/xforms_lists.py
+++ b/tools/lib/python/kdoc/xforms_lists.py
@@ -60,7 +60,7 @@ class CTransforms:
         #
         (CMatch("struct_group"), r"struct { \2+ };"),
         (CMatch("struct_group_attr"), r"struct { \3+ };"),
-        (CMatch("struct_group_tagged"), r"struct { \3+ };"),
+        (CMatch("struct_group_tagged"), r"struct \1 { \3+ } \2;"),
         (CMatch("__struct_group"), r"struct { \4+ };"),
     ]
 
diff --git a/tools/unittests/test_kdoc_parser.py b/tools/unittests/test_kdoc_parser.py
index c4a76ed13dbc..1a8287e99f2e 100755
--- a/tools/unittests/test_kdoc_parser.py
+++ b/tools/unittests/test_kdoc_parser.py
@@ -418,6 +418,43 @@ class TestSelfValidate(GenerateKdocItem):
         """
         self.run_test(self.SOURCE, [self.DEFAULT.copy()], self.EXPORTS)
 
+
+class TestStructGroupTagged(GenerateKdocItem):
+    def test_nested_struct_group_tagged_members(self):
+        source = """
+            /**
+             * struct page_pool_params - page pool parameters
+             * @fast: Fast path parameters.
+             * @order: Order of pages.
+             * @pool_size: Number of pages.
+             * @slow: Slow path parameters.
+             * @netdev: Net device pointer.
+             * @queue_idx: Queue index.
+             * @flags: Flags.
+             */
+            struct page_pool_params {
+                struct_group_tagged(page_pool_params_fast, fast,
+                                    unsigned int order;
+                                    unsigned int pool_size;
+                );
+                struct_group_tagged(page_pool_params_slow, slow,
+                                    struct net_device *netdev;
+                                    unsigned int queue_idx;
+                                    unsigned int flags;
+                );
+            };
+        """
+
+        kernel_doc = KernelDoc(self.config, "test.c", self.xforms)
+        patcher = patch('builtins.open', new_callable=mock_open,
+                        read_data=dedent(source))
+        with patcher:
+            _, entries = kernel_doc.parse_kdoc()
+
+        self.assertEqual(len(entries), 1)
+        self.assertEqual(entries[0].warnings, [])
+
+
 #
 # Class and logic to create dynamic tests from YAML
 #
-- 
2.43.0

