Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793424196;
	b=PZmBPFFYZRl8Nus2P6f0xVgzYHey854KOHN7/BL25vU1cUShpReh0NwZtYUQZkw7u7EY
	 95t8WfdR3cIcDA8cgu177SRZILwc72S73RAGg4CH5oBhOBnYO4qkAi1pE8m01fO8PdUCe
	 QhMvuz15W/Zv3YbaZ/mQoBmAdcW54ADJuRk7QJxh9c+WaULaZyGHKtegjnMPjp5ng403Y
	 ZOlJI0HqCZHFNGz3tcsfaEAfMd4uAdizlz1mPY9IL5hqa5aggnVTRMSVatvUGnADywqaP
	 LuksKq2PVofrsG7p2tBFNt8MH+IvRV+pA/Xhwv4P3eEI0sZ9epehxenamWMOpGucZhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793424196;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ndHQhMAnuk+3vPnB46R1fNj/fOYITSyLIoBaiNAdNMg=;
	b=Nqelnr+lGM2XyZKiNliWzfhz52VeWdFzUT8kDr1Ktgg0nVrGxN0b+elhUuBCqUAp7UJd
	 UXfrgigTynr2NoOERgy94taKb7sG8ir4LoJ+y7VTrxOkFeX+maC8GYJZ8pwKK1dHLcTdG
	 J/RKxyT5p0eO3naGANeVvMRA7xS3iTAHxVbphOMSuQThEhHs5ooY8tD2jVuoy4vtXmTNf
	 +DEgRu/KrwbIMkaX6an/b9dXXlIHIkfQ4hodBslEXo0uXjBK8q4cQatxSFCIcomFs5Vnm
	 lU5AZ9KAy1wg4s3Np+tfDg/pHJIdTbFEiLgv1wdYi7oU14r7nGs0W45Y9f+IdIW9d3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SdkgJCbh;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84582606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 05:23:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84582606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SdkgJCbh
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3acd21ba21aso1094922a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793424194; x=1794028994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ndHQhMAnuk+3vPnB46R1fNj/fOYITSyLIoBaiNAdNMg=;
        b=SdkgJCbhuIljRSEwiOkmc4M4cs+/yZv6wWfFYalBKaxbc/v+YA8zdQcoUdMCir32F0
         40Y0BATAlxSevl0SSdBfNADrbBnQcLrHAXYovUXxEHMEYD3z/IQi/7JFgzK1GFX/Qq1l
         1PXnMRNNVhaTHRuCSyVEJdWxCX+kSUucXlva3Ftz8CfO0IBZtY2Xrkv8SVXUnpwcAxoT
         kdDPxesXnuE+aMs4/UW4m1AmYt/onJTDmScNe3mip5pWwYCB6i2AY6KR6VuHyBGN4wuK
         2TCbdaL53L9WDLGHYxywr4FTmp6kPNY5Ly9D2J3VwPlUTngP3iQU5lXyGeZ7zR6ge9gM
         z6YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793424194; x=1794028994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ndHQhMAnuk+3vPnB46R1fNj/fOYITSyLIoBaiNAdNMg=;
        b=EGzm0ic2jvi9sFBGDxfCgEC+5ahB4moVidvgK9BiEkBz+72Ha9aq6DU8xgcnuCSCps
         Lf6WFPgKB7iV936149eAHOI9ymjpsEkMFk/RSts96PnwaqPm00SBBIn0ojv4/HlqfyFg
         6VqLZj3HGl4iM9SrgnywStygv8KDT8vVTh/3QLS7GEfReI5WgaEiwJkMFfDFa2h97D0h
         pVYijpuRNdocvV39JtQh7kqfHgneFLxEDa611MjjcWu3huYkxtuhqhhMXCw7WNRQdKjm
         RKmShQukEwuwu9d044+V+d/vqjb7QUmXXHnP3q0NlVmPtoxij17azsaiJBGXLhgDQo80
         pZZw==
X-Gm-Message-State: AFq9FYL+Pyo6hz3x9DTilFx2mD/BT70DF9fI7QvXIQL6ivpR92Xi7FgS
	7cs1jOejZywt7wGetMTMnuNCJAf9hFM9zRoKsfALK4EX9Usl1swjo5Zz
X-Gm-Gg: AYBFou2GPziKo6Rvs2nzehmDWgGFlxmIp05rHEfo2vpID2mXb3yIIp4ZqljDQnfGqwm
	s2xTgkrY3tPT0qm1XKvsBJ1nQ1C9KsaKLqz9eziA28i7F85SWgbgZW7TVOk26iJczb547sZMRgz
	JbzwogV9JjA/dD5mIjx1Qd5sYfryzt1R6iSxZifLZ+V3Z3w56RsGurpaXxGH/B9XsnKuEOKYV0+
	P3JlCJRqqyThxCAUIH0vK5WqPdeN4zS0x1i73V+S9IEKQ9L+hZPYMHaX4WDHWyJZSniChjiVdn7
	X5+8k3dDWxo8l3v4CBYR3KO7gK3zrJY96yBnc/KThiZhFrl+VEZWpnccstYU7266azhQ4Q2Lxn1
	Po89SqdPzYir9CeE9e4Si9i5UefMr6bB7jnk5Ld8E0JksJdJ3Ca1XdvPlAeKH8kbgdy0EwSNiRw
	DXh30A3dLokJ3Yx5/sWBLOs/EAu3Xxvd72fpoeKKbvkla9NIdDiQ+EpIiQCcMoGdjkuFNACpfGu
	dmNYdfzLP5XrEwgsNuMHoq/yN1Tc/SFpAzmcrQM6CVHvDOWNy43H54IThzd6BWb1hKKJUkIcSpP
	MbzxrjQBTi/TYYcKqgihSHHIx3nWcYDGQYyMUeO79A+nZe8owT72UtZTMOXkQE0/JIeylddwsGy
	8SA==
X-Received: by 2002:a17:90b:5868:b0:39e:6c68:c77a with SMTP id 98e67ed59e1d1-3ae8984b11bmr3633964a91.48.1793424193678;
        Fri, 30 Oct 2026 22:23:13 -0700 (PDT)
Received: from LDYT9Q2G2M ([2a09:bac5:cad2:3228::4ff:28])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845429e6sm6222456a91.6.2026.10.30.22.23.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 30 Oct 2026 22:23:12 -0700 (PDT)
From: Zhiqi Zhang <zhiqizhangg@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	kunit-dev@googlegroups.com
Subject: [PATCH] lib/ts_fsm: preserve token types when exporting patterns
Date: Sat, 31 Oct 2026 13:23:07 +0800
Message-ID: <20261031052307.23533-1-zhiqizhangg@gmail.com>
X-Mailer: git-send-email 2.54.0
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

fsm_init() replaces each token type with an internal character-class mask.
fsm_get_pattern() then returns these masks as if they were public token
types. Exporting a pattern and preparing another FSM configuration from
it can therefore change the matching behaviour or fail with -EINVAL.

For example, a single TS_FSM_DIGIT token (type 2) becomes the _D mask (4).
Preparing the exported pattern interprets 4 as TS_FSM_PRINT, so the new
configuration accepts "A" while the original rejects it. The text ematch
dump path uses textsearch_get_pattern() to return patterns to userspace.

Keep the public token types in the configuration and look up their masks
in match_token(). This preserves the exported representation without
adding another pattern allocation. Initialization still validates every
type before it can be used to index token_map.

Add KUnit coverage for exporting and recreating all token types and a
sequence with a repeated character class. Also check that exporting and
recreating the pattern leaves the original configuration usable.

I identified this issue. OpenAI Codex helped confirm it and drafted the
fix, KUnit tests and changelog. I reviewed the fix, built it and verified
that the tests passed.

Fixes: 6408f79cce40 ("[LIB]: Naive finite state machine based textsearch")
Signed-off-by: Zhiqi Zhang <zhiqizhangg@gmail.com>
---
Validation in isolated QEMU TCG guests:
- ARM64 GCC 13.3: the same KUnit test and config change from 2/15 passing
  before the fix to 15/15 passing afterwards.
- ARM32 GCC 13.3 and ARM64 Clang 18.1.3: 15/15 passing.
- An ARM64 rtnetlink smoke test creates a basic classifier with a text
  ematch, dumps it, restores its payload, and dumps it again. The DIGIT
  token changes 2 -> 4 -> 151 before the fix, and stays 2 afterwards.
- W=1 for the changed objects: no warnings. Sparse reports no diagnostics
  for these objects (an unchanged ARM64 vDSO object has a declaration
  warning). Strict checkpatch passes after suppressing the new-file
  MAINTAINERS reminder.

Packet traffic, module loading and throughput were not tested. Resolving
masks in match_token() adds a lookup on nonliteral matches.

 lib/Kconfig.debug                |  14 ++++
 lib/tests/Makefile               |   1 +
 lib/tests/textsearch_fsm_kunit.c | 137 +++++++++++++++++++++++++++++++
 lib/ts_fsm.c                     |   7 +-
 4 files changed, 153 insertions(+), 6 deletions(-)
 create mode 100644 lib/tests/textsearch_fsm_kunit.c

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 2d22638ec..416d033b0 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2531,6 +2531,20 @@ config STRING_HELPERS_KUNIT_TEST
 	depends on KUNIT
 	default KUNIT_ALL_TESTS
 
+config TEXTSEARCH_FSM_KUNIT_TEST
+	tristate "KUnit tests for FSM text search" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	select TEXTSEARCH
+	select TEXTSEARCH_FSM
+	default KUNIT_ALL_TESTS
+	help
+	  Test that exporting and recreating an FSM text search configuration
+	  preserves its matching behaviour. Exercise each public token type
+	  and a sequence of tokens with a repeated character class. Check
+	  that exporting also leaves the original configuration usable.
+
+	  If unsure, say N.
+
 config STRING_KUNIT_BENCH
        bool "Benchmark string functions at runtime"
        depends on STRING_KUNIT_TEST
diff --git a/lib/tests/Makefile b/lib/tests/Makefile
index df0537e1b..fa47ef5d3 100644
--- a/lib/tests/Makefile
+++ b/lib/tests/Makefile
@@ -54,6 +54,7 @@ CFLAGS_stackinit_kunit.o += $(call cc-disable-warning, switch-unreachable)
 obj-$(CONFIG_STACKINIT_KUNIT_TEST) += stackinit_kunit.o
 obj-$(CONFIG_STRING_KUNIT_TEST) += string_kunit.o
 obj-$(CONFIG_STRING_HELPERS_KUNIT_TEST) += string_helpers_kunit.o
+obj-$(CONFIG_TEXTSEARCH_FSM_KUNIT_TEST) += textsearch_fsm_kunit.o
 obj-$(CONFIG_USERCOPY_KUNIT_TEST) += usercopy_kunit.o
 obj-$(CONFIG_UTIL_MACROS_KUNIT) += util_macros_kunit.o
 obj-$(CONFIG_RATELIMIT_KUNIT_TEST) += test_ratelimit.o
diff --git a/lib/tests/textsearch_fsm_kunit.c b/lib/tests/textsearch_fsm_kunit.c
new file mode 100644
index 000000000..bbf944ef8
--- /dev/null
+++ b/lib/tests/textsearch_fsm_kunit.c
@@ -0,0 +1,137 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* Tests for exporting and recreating FSM text search configurations. */
+
+#include <kunit/test.h>
+#include <linux/limits.h>
+#include <linux/module.h>
+#include <linux/string.h>
+#include <linux/textsearch.h>
+#include <linux/textsearch_fsm.h>
+
+struct fsm_test_case {
+	const char *name;
+	u16 type;
+	const char *match;
+	const char *miss;
+};
+
+static const struct fsm_test_case fsm_test_cases[] = {
+	{ "specific", TS_FSM_SPECIFIC, "x", "y" },
+	{ "wildcard", TS_FSM_WILDCARD, "A", "" },
+	{ "digit", TS_FSM_DIGIT, "7", "A" },
+	{ "xdigit", TS_FSM_XDIGIT, "f", "g" },
+	{ "print", TS_FSM_PRINT, "A", "\n" },
+	{ "alpha", TS_FSM_ALPHA, "A", "7" },
+	{ "alnum", TS_FSM_ALNUM, "7", "!" },
+	{ "ascii", TS_FSM_ASCII, "A", "\200" },
+	{ "cntrl", TS_FSM_CNTRL, "\n", "A" },
+	{ "graph", TS_FSM_GRAPH, "!", " " },
+	{ "lower", TS_FSM_LOWER, "a", "A" },
+	{ "upper", TS_FSM_UPPER, "A", "a" },
+	{ "punct", TS_FSM_PUNCT, "!", "A" },
+	{ "space", TS_FSM_SPACE, " ", "A" },
+};
+
+static void fsm_case_to_desc(const struct fsm_test_case *params, char *desc)
+{
+	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%s", params->name);
+}
+
+KUNIT_ARRAY_PARAM(fsm, fsm_test_cases, fsm_case_to_desc);
+
+static void fsm_destroy_config(void *conf)
+{
+	textsearch_destroy(conf);
+}
+
+static void fsm_expect_matches(struct kunit *test, struct ts_config *conf,
+			       const struct fsm_test_case *params)
+{
+	struct ts_state state = {};
+	unsigned int pos;
+
+	pos = textsearch_find_continuous(conf, &state, params->match,
+					 strlen(params->match));
+	KUNIT_EXPECT_EQ(test, pos, 0U);
+	pos = textsearch_find_continuous(conf, &state, params->miss,
+					 strlen(params->miss));
+	KUNIT_EXPECT_EQ(test, pos, UINT_MAX);
+}
+
+static void fsm_check_roundtrip(struct kunit *test,
+				const struct ts_fsm_token *pattern,
+				unsigned int len,
+				const struct fsm_test_case *params)
+{
+	struct ts_fsm_token *exported;
+	struct ts_config *conf, *recreated;
+	int err;
+
+	conf = textsearch_prepare("fsm", pattern, len, GFP_KERNEL, TS_AUTOLOAD);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conf);
+	err = kunit_add_action_or_reset(test, fsm_destroy_config, conf);
+	KUNIT_ASSERT_EQ(test, err, 0);
+	fsm_expect_matches(test, conf, params);
+
+	KUNIT_ASSERT_EQ(test, textsearch_get_pattern_len(conf), len);
+	exported = kunit_kmalloc(test, len, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, exported);
+	memcpy(exported, textsearch_get_pattern(conf), len);
+
+	/* Exporting a pattern must preserve the existing search behaviour. */
+	fsm_expect_matches(test, conf, params);
+
+	recreated = textsearch_prepare("fsm", exported, len, GFP_KERNEL,
+				       TS_AUTOLOAD);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL_MSG(test, recreated,
+					 "exported token: type=%u recur=%u value=%u",
+					 exported->type, exported->recur,
+					 exported->value);
+	err = kunit_add_action_or_reset(test, fsm_destroy_config, recreated);
+	KUNIT_ASSERT_EQ(test, err, 0);
+	fsm_expect_matches(test, recreated, params);
+	fsm_expect_matches(test, conf, params);
+}
+
+static void fsm_test_pattern_roundtrip(struct kunit *test)
+{
+	const struct fsm_test_case *params = test->param_value;
+	struct ts_fsm_token pattern = {
+		.type = params->type,
+		.recur = TS_FSM_SINGLE,
+		.value = 'x',
+	};
+
+	fsm_check_roundtrip(test, &pattern, sizeof(pattern), params);
+}
+
+static void fsm_test_sequence_roundtrip(struct kunit *test)
+{
+	static const struct ts_fsm_token pattern[] = {
+		{ TS_FSM_DIGIT, TS_FSM_MULTI, 0 },
+		{ TS_FSM_SPECIFIC, TS_FSM_SINGLE, ':' },
+		{ TS_FSM_UPPER, TS_FSM_SINGLE, 0 },
+	};
+	static const struct fsm_test_case params = {
+		.match = "77:A",
+		.miss = "77:a",
+	};
+
+	fsm_check_roundtrip(test, pattern, sizeof(pattern), &params);
+}
+
+static struct kunit_case fsm_kunit_test_cases[] = {
+	KUNIT_CASE_PARAM(fsm_test_pattern_roundtrip, fsm_gen_params),
+	KUNIT_CASE(fsm_test_sequence_roundtrip),
+	{}
+};
+
+static struct kunit_suite fsm_test_suite = {
+	.name = "textsearch-fsm",
+	.test_cases = fsm_kunit_test_cases,
+};
+
+kunit_test_suite(fsm_test_suite);
+
+MODULE_DESCRIPTION("FSM text search configuration tests");
+MODULE_LICENSE("GPL");
diff --git a/lib/ts_fsm.c b/lib/ts_fsm.c
index 053615f4f..8725ea6f0 100644
--- a/lib/ts_fsm.c
+++ b/lib/ts_fsm.c
@@ -126,7 +126,7 @@ _W|_L,         _W|_L,        _W|_L,        _W|_L};		/* 252-255 */
 static inline int match_token(struct ts_fsm_token *t, u8 d)
 {
 	if (t->type)
-		return (token_lookup_tbl[d] & t->type) != 0;
+		return (token_lookup_tbl[d] & token_map[t->type]) != 0;
 	else
 		return t->value == d;
 }
@@ -288,11 +288,6 @@ static struct ts_config *fsm_init(const void *pattern, unsigned int len,
 	fsm->ntokens = ntokens;
 	memcpy(fsm->tokens, pattern, len);
 
-	for (i = 0; i < fsm->ntokens; i++) {
-		struct ts_fsm_token *t = &fsm->tokens[i];
-		t->type = token_map[t->type];
-	}
-
 	return conf;
 
 errout:

base-commit: 2a500a04d6f969318c05f46aedb6e73fc1963a00
-- 
2.54.0 (Apple Git-157)

