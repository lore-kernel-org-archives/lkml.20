Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793036546;
	b=0sSYhiUVTqNPaoRyvO3/5r+PNNl0YlSj0nzE480lhPilNi+F1m0kgv/F5Q640RjVC1Yd
	 ZAZLs15heYLNSsnc2AtMUehdbS1GEuyz1V6yBmyays++SDVhq45rY0lv4M4QzYKFMlvsi
	 WK8rUEozhNgeIpk4OAxRTJU26dZJcjEnAWqEBIy59pccgOckl2pyZ52QAJLzAFZ+lwRZ3
	 Ajffha0rO/49SpKk05kWUPiNRqrIL17H7nGYvDFuR8UhsjeMcBFRC+jN/B4xVD3XaMyIj
	 xHjVSnBtzj00BXnMCKSvGOhMIeBi0lIWvkotWQFdAHMsBXPqt7QpK/3Y7IFeqxbn+Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793036546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=6FbknuYB2KaKiO/nAwNHeWF6UfDvsJ7xQW+UNHo6NJE=;
	b=EspBloSQrn1bir08jEuNEb0YhOMm2lPBG7G2FR5srb0Iqp94v/8Fox02WFggjAPIFGOQ
	 zyggXKcSiXvHkXomVBimpY3n70+8eooVipKaQ31MaYx0F/1yrPRcJkDIhJKaJpUG/G93e
	 Oyg+J8KTbrGxHYE2hlKqX6X/3ZYA96HhTdbTqxIi5LBkVs45J+WZuToHXwjZ+yKjukZ5f
	 3vHVFsLH/D4llHxn77hQjqiUWwQ/KVUTM1PcSok6I7x1VgGFKPt42+vVPRvn+BUoYsKgK
	 CyaGTK0EG4n560bqK7O4pyN6C6GKgc8XksopJ80crpDhRUO1sjfqXYtWjDvsH6SiqOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Dw19YtuS;
	arc=none smtp.remote-ip=209.85.218.70
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55143606A328
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 17:42:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55143606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Dw19YtuS
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c2e8c76334fso292562166b.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793036545; x=1793641345; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6FbknuYB2KaKiO/nAwNHeWF6UfDvsJ7xQW+UNHo6NJE=;
        b=Dw19YtuSCBkDZ+YV3esZ3Fwyy4DxWgbYfY7ajuc+UMo56P4l1RJi/NpNrFVz0acP37
         Radrhs9Y8dbUpCYq1Q3/BLrNaHL2zF0bDYJ0k8C50q/mfDqgVB7rkylzjkq3AxBB2Ypt
         FJyIh355MY/eXiRA+PMXy69zZ35Ti9hoMrF7mlCj5stBmm2PFEUzGAldox2Dm+K03gX7
         3cD6/ikLxWZ1qaEBvyO+0eB+fippzfgGvE7jn8cBXiQ9FKf2BcLJL9nDSH+440wj+Vva
         Mepau1xQFgRApy7cyCve8Er0IQaRebnWHnQYuVtlVzt3k9nQDMVeFdNFJrLByZGkXaWc
         DEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793036545; x=1793641345;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6FbknuYB2KaKiO/nAwNHeWF6UfDvsJ7xQW+UNHo6NJE=;
        b=uSMMRT1pSETe51AbSH1UxtvyBKU0RARHB3ECGxNPfTLzF/nnvvH4/TGQ5qmmky4jjB
         pJ0Ve26gDSozDxQtnfrWzsCvx2B64V6FDjLiZiutjaNDseNbEVTwjB2Ut1pt+YJHbyD2
         0S5JRp+k4EZkFl+AwB6jZkuXF5QOlb6Qrh/nVQDSJrgAyHwddwcvRmAzL7d85D4VZevE
         DQAwokh22FHwYi20F/gWnwonNpyrbKqTZCcIFRZ8Semp3IF4ysINrFNLnyCriTew/saq
         z8u2MKn99kepoNrL76z3woxFqMsK45AoycfnVKxKXAtKEc6Di8JT6th6tlYfrVUjXkd/
         aUJw==
X-Gm-Message-State: AFq9FYLk5HlszKiXEIfjjWnhxyyLa3U40c5/nsIfoeV1HsfxmsveczDy
	FzJB3Idp084DBr1HdgTmuYnV9NkrNskKeBmEZ88aLpIUin3hQzknq/2qgf+FInb+O152ShFYiAg
	8szysEyce9S0FgdLr0w==
X-Received: from ejczw1-n1.prod.google.com ([2002:a17:907:e001:10b0:c42:73df:9346])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:f585:b0:c41:e75e:5889 with SMTP id a640c23a62f3a-c46bde3a942mr794298266b.33.1793036543707;
 Mon, 26 Oct 2026 10:42:23 -0700 (PDT)
Date: Mon, 26 Oct 2026 17:42:17 +0000
In-Reply-To: <20261026174217.603114-1-tarunsahu@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261026174217.603114-1-tarunsahu@google.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261026174217.603114-5-tarunsahu@google.com>
Subject: [RFC PATCH v3 4/4] liveupdate: Add KUnit test for the feature header helpers
From: Tarun Sahu <tarunsahu@google.com>
To: loganodell@google.com, alex@shazbot.org, dwmw2@infradead.org, 
	seanjc@google.com, Mike Rapoport <rppt@kernel.org>, will@kernel.org, pbonzini@redhat.com, 
	jgg@nvidia.com, Pasha Tatashin <pasha.tatashin@soleen.com>, arnd@arndb.de, 
	linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, oupton@kernel.org, 
	baolu.lu@linux.intel.com, David Matlack <dmatlack@google.com>, robin.murphy@arm.com, 
	maz@kernel.org, Alexander Graf <graf@amazon.com>, joro@8bytes.org, 
	Bjorn Helgaas <bhelgaas@google.com>, kevin.tian@intel.com, 
	Pratyush Yadav <pratyush@kernel.org>
Cc: linux-kernel@vger.kernel.org, kexec@lists.infradead.org, 
	Tarun Sahu <tarunsahu@google.com>
Content-Type: text/plain; charset="UTF-8"

Add a KUnit test suite in lib/tests/liveupdate_feature_kunit.c covering
the Live Update feature header declared in include/linux/kho/abi/luo.h.

The suite contains two focused test cases:
- luo_ser_hdr_set_get_test: verifies DECLARE_LUO_SER_WRAP structure
  sizing, header initialization, payload pointer resolution, and 2-bit
  feature flag setting and retrieval across flags entry boundaries,
  including out-of-range queries.
- luo_ser_hdr_truth_table_test: verifies luo_ser_hdr_validate against
  all rows of the feature state truth table (absent, optional,
  required, and reserved 0b10 encodings), as well as empty supported
  tables.

Signed-off-by: Tarun Sahu <tarunsahu@google.com>
---
 MAINTAINERS                          |   1 +
 lib/Kconfig.debug                    |  16 ++++
 lib/tests/Makefile                   |   1 +
 lib/tests/liveupdate_feature_kunit.c | 118 +++++++++++++++++++++++++++
 4 files changed, 136 insertions(+)
 create mode 100644 lib/tests/liveupdate_feature_kunit.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 5d1b58271989..dad09961c275 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15191,6 +15191,7 @@ F:	include/linux/liveupdate.h
 F:	include/uapi/linux/liveupdate.h
 F:	kernel/liveupdate/
 F:	lib/tests/liveupdate.c
+F:	lib/tests/liveupdate_feature_kunit.c
 F:	mm/memfd_luo.c
 F:	tools/testing/selftests/liveupdate/
 
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 134b15a44625..d8208f3f4515 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2906,6 +2906,22 @@ config LIVEUPDATE_TEST
 
 	  If unsure, say N
 
+config LIVEUPDATE_FEATURE_KUNIT_TEST
+	tristate "KUnit test for the Live Update feature header helpers" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  This option enables the KUnit test suite for the Live Update
+	  Orchestrator feature header helpers defined in
+	  include/linux/kho/abi/luo.h. It checks the feature flag encoding,
+	  the flags array sizing, the source/target kernel validation
+	  truth table, header initialization and the payload size checks.
+
+	  The helpers are self-contained, so the test does not depend on
+	  CONFIG_LIVEUPDATE and can also run under UML.
+
+	  If unsure, say N.
+
 config CMDLINE_KUNIT_TEST
 	tristate "KUnit test for cmdline API" if !KUNIT_ALL_TESTS
 	depends on KUNIT
diff --git a/lib/tests/Makefile b/lib/tests/Makefile
index 3cac3b63a752..2f1f1f765617 100644
--- a/lib/tests/Makefile
+++ b/lib/tests/Makefile
@@ -33,6 +33,7 @@ obj-$(CONFIG_KFIFO_KUNIT_TEST) += kfifo_kunit.o
 obj-$(CONFIG_TEST_LIST_SORT) += test_list_sort.o
 obj-$(CONFIG_LINEAR_RANGES_TEST) += test_linear_ranges.o
 obj-$(CONFIG_LIVEUPDATE_TEST) += liveupdate.o
+obj-$(CONFIG_LIVEUPDATE_FEATURE_KUNIT_TEST) += liveupdate_feature_kunit.o
 
 CFLAGS_longest_symbol_kunit.o += $(call cc-disable-warning, missing-prototypes)
 obj-$(CONFIG_LONGEST_SYM_KUNIT_TEST) += longest_symbol_kunit.o
diff --git a/lib/tests/liveupdate_feature_kunit.c b/lib/tests/liveupdate_feature_kunit.c
new file mode 100644
index 000000000000..fc9d2de263d9
--- /dev/null
+++ b/lib/tests/liveupdate_feature_kunit.c
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * KUnit tests for the Live Update Orchestrator feature header helpers
+ * in include/linux/kho/abi/luo.h.
+ *
+ * Copyright (c) 2026, Google LLC.
+ * Tarun Sahu <tarunsahu@google.com>
+ */
+
+#include <kunit/test.h>
+#include <linux/kho/abi/luo.h>
+#include <linux/module.h>
+
+struct luo_test_multi_ser {
+	u64 val;
+};
+
+static_assert(sizeof(struct luo_test_multi_ser) == 8);
+DECLARE_LUO_SER_WRAP(luo_test_multi_ser, 32, 35);
+
+struct luo_test_one_ser {
+	u64 val;
+};
+
+static_assert(sizeof(struct luo_test_one_ser) == 8);
+DECLARE_LUO_SER_WRAP(luo_test_one_ser, 24, 1);
+
+struct luo_test_zero_ser {
+	u64 val;
+};
+
+static_assert(sizeof(struct luo_test_zero_ser) == 8);
+DECLARE_LUO_SER_WRAP(luo_test_zero_ser, 16, 0);
+
+static void luo_ser_hdr_set_get_test(struct kunit *test)
+{
+	struct luo_test_multi_ser_wrap out;
+	struct luo_test_zero_ser_wrap zero;
+
+	memset(&out, 0, sizeof(out));
+	luo_test_multi_ser_wrap_init(&out);
+
+	KUNIT_EXPECT_EQ(test, out.hdr.size, 32U);
+	KUNIT_EXPECT_EQ(test, out.hdr.nr_features, 35U);
+	KUNIT_EXPECT_EQ(test, LUO_SER_NR_FLAGS(out.hdr.nr_features), 2U);
+	KUNIT_EXPECT_EQ(test, luo_ser_hdr_size(&out.hdr), 24UL);
+	KUNIT_EXPECT_PTR_EQ(test, luo_ser_payload(&out.hdr), (void *)&out.ser);
+
+	/* 0, 31 in flags[0]; 32, 34 in flags[1] */
+	luo_ser_set_feat(&out.hdr, 0, LUO_FEAT_REQUIRED);
+	luo_ser_set_feat(&out.hdr, 31, LUO_FEAT_OPTIONAL);
+	luo_ser_set_feat(&out.hdr, 32, LUO_FEAT_REQUIRED);
+	luo_ser_set_feat(&out.hdr, 34, LUO_FEAT_OPTIONAL);
+
+	KUNIT_EXPECT_EQ(test, (int)luo_ser_get_feat(&out.hdr, 0), (int)LUO_FEAT_REQUIRED);
+	KUNIT_EXPECT_EQ(test, (int)luo_ser_get_feat(&out.hdr, 1), (int)LUO_FEAT_ABSENT);
+	KUNIT_EXPECT_EQ(test, (int)luo_ser_get_feat(&out.hdr, 31), (int)LUO_FEAT_OPTIONAL);
+	KUNIT_EXPECT_EQ(test, (int)luo_ser_get_feat(&out.hdr, 32), (int)LUO_FEAT_REQUIRED);
+	KUNIT_EXPECT_EQ(test, (int)luo_ser_get_feat(&out.hdr, 33), (int)LUO_FEAT_ABSENT);
+	KUNIT_EXPECT_EQ(test, (int)luo_ser_get_feat(&out.hdr, 34), (int)LUO_FEAT_OPTIONAL);
+
+	KUNIT_EXPECT_EQ(test, (int)luo_ser_get_feat(&out.hdr, 35), (int)LUO_FEAT_ABSENT);
+	KUNIT_EXPECT_EQ(test, (int)luo_ser_get_feat(&out.hdr, 100), (int)LUO_FEAT_ABSENT);
+
+	memset(&zero, 0, sizeof(zero));
+	luo_test_zero_ser_wrap_init(&zero);
+	KUNIT_EXPECT_EQ(test, sizeof(struct luo_ser_hdr), 8UL);
+	KUNIT_EXPECT_EQ(test, luo_ser_hdr_size(&zero.hdr), 8UL);
+	KUNIT_EXPECT_PTR_EQ(test, luo_ser_payload(&zero.hdr), (void *)&zero.ser);
+	KUNIT_EXPECT_EQ(test, luo_ser_hdr_validate(&zero.hdr, NULL, 0), 0);
+}
+
+static void luo_ser_hdr_truth_table_test(struct kunit *test)
+{
+	struct luo_test_one_ser_wrap out;
+	bool supp_yes[1] = { true };
+	bool supp_no[1] = { false };
+
+	memset(&out, 0, sizeof(out));
+	luo_test_one_ser_wrap_init(&out);
+	luo_ser_set_feat(&out.hdr, 0, LUO_FEAT_ABSENT);
+	KUNIT_EXPECT_EQ(test, luo_ser_hdr_validate(&out.hdr, supp_no, 1), 0);
+
+	luo_ser_set_feat(&out.hdr, 0, LUO_FEAT_OPTIONAL);
+	KUNIT_EXPECT_EQ(test, luo_ser_hdr_validate(&out.hdr, supp_no, 1), 0);
+	KUNIT_EXPECT_EQ(test, luo_ser_hdr_validate(&out.hdr, supp_yes, 1), 0);
+
+	luo_ser_set_feat(&out.hdr, 0, LUO_FEAT_REQUIRED);
+	KUNIT_EXPECT_EQ(test, luo_ser_hdr_validate(&out.hdr, supp_no, 1),
+			-EOPNOTSUPP);
+	KUNIT_EXPECT_EQ(test, luo_ser_hdr_validate(&out.hdr, supp_yes, 1), 0);
+
+	out.flags[0] = (u64)LUO_FEAT_RESERVED;
+	KUNIT_EXPECT_EQ(test, luo_ser_hdr_validate(&out.hdr, supp_no, 1), 0);
+	KUNIT_EXPECT_EQ(test, luo_ser_hdr_validate(&out.hdr, supp_yes, 1), 0);
+
+	luo_ser_set_feat(&out.hdr, 0, LUO_FEAT_REQUIRED);
+	KUNIT_EXPECT_EQ(test, luo_ser_hdr_validate(&out.hdr, NULL, 0),
+			-EOPNOTSUPP);
+	luo_ser_set_feat(&out.hdr, 0, LUO_FEAT_OPTIONAL);
+	KUNIT_EXPECT_EQ(test, luo_ser_hdr_validate(&out.hdr, NULL, 0), 0);
+}
+
+static struct kunit_case luo_feature_test_cases[] = {
+	KUNIT_CASE(luo_ser_hdr_set_get_test),
+	KUNIT_CASE(luo_ser_hdr_truth_table_test),
+	{}
+};
+
+static struct kunit_suite luo_feature_test_suite = {
+	.name = "liveupdate_feature",
+	.test_cases = luo_feature_test_cases,
+};
+
+kunit_test_suite(luo_feature_test_suite);
+
+MODULE_DESCRIPTION("KUnit tests for the Live Update feature header helpers");
+MODULE_LICENSE("GPL");
-- 
2.56.0.307.g5fe7bd680c-goog

