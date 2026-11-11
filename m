Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794364034;
	b=taa0+y4G1pZwyqrtbMZZsgW3nEIwFWrPgpyhYn/3bPUIVTDKRgMTOQGDDdrLUCH3InX3
	 u+yi1IQnF+HMcGNdGnnc17GpwaDjYRX5dsvMMBXBfxZXp0FntBIALxL/JzrvSg+4d6Snp
	 9c+YQTt2HA3wYjHbHaeYUZYgiG4jtNivLqj/vMfdpPbH+BEBfUbAcXV64tHhzJjnYqEk5
	 rXia7kYtmEkFP+G5CrQh9UgAl1DuwK+72gO7kQujluKR7r8CbgNW5KGj2u8ikUy2n3DT0
	 Pu5p3q2tLrpdrlfVVJy+ovAMb9Joxv2aAz+TlWGmB6C7OMSQObIrFjT62+m1ErNRMHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794364034;
	h=DMARC-Filter:DKIM-Signature:Date:Message-Id:X-Original-From:
	 Content-Type:To:Subject:Cc:X-Mailer:From:Content-Transfer-Encoding:
	 X-Lms-Return-Path:Mime-Version;
	bh=YzCVkXl0Ljz1g+ypSGRoD2tcH71bvXunUtydpCIBAWU=;
	b=OGxg+Siurhb7XpS9hVAQJbEkx6Fnoo37dAk0HHIJouyDDgrnHz418O886i7wgQCB3kI2
	 BQcNPkQhB4UkElwHYCoYnBCRN8Slm4zaySwoUDlbWFMYA9msJjHAqkx1lz/ZLIDSu9pXO
	 5ZvO63lN69sIHJeWR6PBpqBuXYPZ6EvmjL75csUQKKpKL1tRMvra3b5noUK6e+FzC2jsW
	 s3vLUaTibuRhRRrn/lrPGcBOKeLFBSA+ZouwiNlIhxzjcvC0AdjMekO8On0ayNSUMHYKw
	 k9w+22q+fcARyxKhQFlC9n0cgTKU1uYbU5tPdmezKTGdJK0v2IA5Vgz0uxJTxsEMwIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=Aa3Ofoix;
	arc=none smtp.remote-ip=209.127.230.112
Received: from va-1-112.ptr.blmpb.com (va-1-112.ptr.blmpb.com [209.127.230.112])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74341606A320
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:27:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74341606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=Aa3Ofoix
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1794364027; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=YzCVkXl0Ljz1g+ypSGRoD2tcH71bvXunUtydpCIBAWU=;
 b=Aa3OfoixQvVkWKLQ+M9dS9+mYGyzbtmqK/sZ4YX7wf09ujtug9BKVtievzna+w0DPSUfuC
 H/ngZcFyIdSpKUSrZ2WhBHv+ZJ0pgLxeerkFmgMbf9oP2rE6/exc9ksYwZWm35Uq0fFcGO
 vXyBBycIY8AaRlp9lVQbviD6PuaYN1WyaNFLCe2ZcMUt2Tymx2Itp5PMDZU0d31+T2udb+
 dCixXbq3tHocEyxlyAemhlTxZ+xto7oeHp9i6sNjhnyncinKBAQ5D1JITSI5t/SFomM+BR
 cZLbN/kwg+Xbpe+iF8kJrZpmc7lBTzEyv2RDDnK3vNgZWErN480e4Letgfg75w==
Date: Wed, 11 Nov 2026 10:26:49 +0800
Message-Id: <20261111022648.71649-2-qirui.001@bytedance.com>
X-Original-From: Rui Qi <qirui.001@bytedance.com>
Content-Type: text/plain; charset=UTF-8
To: <linux-perf-users@vger.kernel.org>
Subject: [PATCH v2] perf parse-events: default data breakpoints to any size on RISC-V
Cc: <linux-kernel@vger.kernel.org>, <linux-riscv@vger.kernel.org>, 
	<irogers@google.com>, <peterz@infradead.org>, <mingo@redhat.com>, 
	<acme@kernel.org>, <namhyung@kernel.org>, <qirui.001@bytedance.com>
X-Mailer: git-send-email 2.52.0
From: "Rui Qi" <qirui.001@bytedance.com>
Content-Transfer-Encoding: 7bit
X-Lms-Return-Path: <lba+26af3d279+653cd4+vger.kernel.org+qirui.001@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0

When the length of a data breakpoint is not specified on the command
line, perf defaults it to HW_BREAKPOINT_LEN_4:

  $ perf record -e mem:0x30020:w ./prog

That assumes the length describes a byte range that is compared
against the address of the access, which is how the x86 debug
registers and most other architectures work.

RISC-V debug triggers behave differently.  An Sdtrig mcontrol6
trigger encodes the width of the memory access it should match, and
it only fires for accesses of exactly that width.  Watching an 8-byte
variable with the implicit 4-byte length therefore never triggers:
the perf event is created and enabled, but no event is ever
delivered:

  $ perf stat -e mem:0x30020:w ./prog          # 8-byte stores
  0       mem:0x30020:w
  $ perf stat -e mem:0x30020/8:w ./prog
  10      mem:0x30020:w

The failure is silent and easily mistaken for a broken hardware
breakpoint implementation.  Tracing hw_breakpoint_exceptions_notify()
while the event is active confirms the trigger never fires.

Zero is a valid length for RISC-V data breakpoints: the kernel
encodes it as size 0, which means "match any size".  That is what a
user leaving out the length asks for, so use it as the default on
RISC-V and keep the existing 4-byte default elsewhere.

Tested on a riscv64 kernel with hardware breakpoint support.  With the
default length, watching an 8-byte and a 4-byte variable both count
10 stores, while explicit lengths keep their exact-width behaviour:
/8 only matches the 8-byte access and /4 only the 4-byte one.

Signed-off-by: Rui Qi <qirui.001@bytedance.com>
v2:
 - Update the data-breakpoint assertions in tools/perf/tests/parse-events.c
   to compare against default_data_breakpoint_len().  The rw checker now
   takes the expected length, so the explicit /4 cases still assert
   HW_BREAKPOINT_LEN_4.  Suggested by Ian Rogers.

---
 tools/perf/tests/parse-events.c | 20 ++++++++++++++------
 tools/perf/util/parse-events.c  | 23 ++++++++++++++++++++++-
 tools/perf/util/parse-events.h  |  1 +
 3 files changed, 37 insertions(+), 7 deletions(-)

diff --git a/tools/perf/tests/parse-events.c b/tools/perf/tests/parse-events.c
index 5f6f95c8a5b4..d5f0f4ca7ccd 100644
--- a/tools/perf/tests/parse-events.c
+++ b/tools/perf/tests/parse-events.c
@@ -257,7 +257,8 @@ static int test__checkevent_breakpoint(struct evlist *evlist)
 	TEST_ASSERT_EVSEL("wrong bp_type",
 			  (HW_BREAKPOINT_R | HW_BREAKPOINT_W) == evsel->core.attr.bp_type,
 			  evsel);
-	TEST_ASSERT_EVSEL("wrong bp_len", HW_BREAKPOINT_LEN_4 == evsel->core.attr.bp_len, evsel);
+	TEST_ASSERT_EVSEL("wrong bp_len",
+			  default_data_breakpoint_len() == evsel->core.attr.bp_len, evsel);
 	return TEST_OK;
 }
 
@@ -282,7 +283,8 @@ static int test__checkevent_breakpoint_r(struct evlist *evlist)
 	TEST_ASSERT_EVSEL("wrong type", PERF_TYPE_BREAKPOINT == evsel->core.attr.type, evsel);
 	TEST_ASSERT_EVSEL("wrong config", 0 == evsel->core.attr.config, evsel);
 	TEST_ASSERT_EVSEL("wrong bp_type", HW_BREAKPOINT_R == evsel->core.attr.bp_type, evsel);
-	TEST_ASSERT_EVSEL("wrong bp_len", HW_BREAKPOINT_LEN_4 == evsel->core.attr.bp_len, evsel);
+	TEST_ASSERT_EVSEL("wrong bp_len",
+			  default_data_breakpoint_len() == evsel->core.attr.bp_len, evsel);
 	return TEST_OK;
 }
 
@@ -294,11 +296,12 @@ static int test__checkevent_breakpoint_w(struct evlist *evlist)
 	TEST_ASSERT_EVSEL("wrong type", PERF_TYPE_BREAKPOINT == evsel->core.attr.type, evsel);
 	TEST_ASSERT_EVSEL("wrong config", 0 == evsel->core.attr.config, evsel);
 	TEST_ASSERT_EVSEL("wrong bp_type", HW_BREAKPOINT_W == evsel->core.attr.bp_type, evsel);
-	TEST_ASSERT_EVSEL("wrong bp_len", HW_BREAKPOINT_LEN_4 == evsel->core.attr.bp_len, evsel);
+	TEST_ASSERT_EVSEL("wrong bp_len",
+			  default_data_breakpoint_len() == evsel->core.attr.bp_len, evsel);
 	return TEST_OK;
 }
 
-static int test__checkevent_breakpoint_rw(struct evlist *evlist)
+static int check_breakpoint_rw(struct evlist *evlist, u64 len)
 {
 	struct evsel *evsel = evlist__first(evlist);
 
@@ -308,10 +311,15 @@ static int test__checkevent_breakpoint_rw(struct evlist *evlist)
 	TEST_ASSERT_EVSEL("wrong bp_type",
 			  (HW_BREAKPOINT_R|HW_BREAKPOINT_W) == evsel->core.attr.bp_type,
 			  evsel);
-	TEST_ASSERT_EVSEL("wrong bp_len", HW_BREAKPOINT_LEN_4 == evsel->core.attr.bp_len, evsel);
+	TEST_ASSERT_EVSEL("wrong bp_len", len == evsel->core.attr.bp_len, evsel);
 	return TEST_OK;
 }
 
+static int test__checkevent_breakpoint_rw(struct evlist *evlist)
+{
+	return check_breakpoint_rw(evlist, default_data_breakpoint_len());
+}
+
 static int test__checkevent_tracepoint_modifier(struct evlist *evlist)
 {
 	struct evsel *evsel = evlist__first(evlist);
@@ -1708,7 +1716,7 @@ test__checkevent_breakpoint_len_rw_modifier(struct evlist *evlist)
 	TEST_ASSERT_EVSEL("wrong exclude_hv", evsel->core.attr.exclude_hv, evsel);
 	TEST_ASSERT_EVSEL("wrong precise_ip", !evsel->core.attr.precise_ip, evsel);
 
-	return test__checkevent_breakpoint_rw(evlist);
+	return check_breakpoint_rw(evlist, HW_BREAKPOINT_LEN_4);
 }
 
 static int test__checkevent_precise_max_modifier(struct evlist *evlist)
diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-events.c
index f3ba70d4f76b..e752f41f2b36 100644
--- a/tools/perf/util/parse-events.c
+++ b/tools/perf/util/parse-events.c
@@ -598,6 +598,27 @@ size_t default_breakpoint_len(void)
 #endif
 }
 
+/*
+ * Default length for data breakpoints when the user did not specify one.
+ *
+ * Most architectures treat the length as a byte range that is compared
+ * against the address of the access, so 4 bytes is a reasonable default
+ * that matches most accesses.  RISC-V debug triggers (Sdtrig mcontrol6)
+ * encode the width of the access in the trigger instead, and a trigger
+ * only fires when the access has exactly that width.  This holds for
+ * both RV32 and RV64.  With a fixed default, an access of a different
+ * width silently never matches, so pass 0 on RISC-V, which the kernel
+ * translates to "match any size".
+ */
+size_t default_data_breakpoint_len(void)
+{
+#if defined(__riscv)
+	return 0;
+#else
+	return HW_BREAKPOINT_LEN_4;
+#endif
+}
+
 static int
 parse_breakpoint_type(const char *type, struct perf_event_attr *attr)
 {
@@ -658,7 +679,7 @@ int parse_events_add_breakpoint(struct parse_events_state *parse_state,
 		if (attr.bp_type == HW_BREAKPOINT_X)
 			len = default_breakpoint_len();
 		else
-			len = HW_BREAKPOINT_LEN_4;
+			len = default_data_breakpoint_len();
 	}
 
 	attr.bp_len = len;
diff --git a/tools/perf/util/parse-events.h b/tools/perf/util/parse-events.h
index b14c832b03a1..e8f8cdfd1052 100644
--- a/tools/perf/util/parse-events.h
+++ b/tools/perf/util/parse-events.h
@@ -291,5 +291,6 @@ static inline bool is_sdt_event(char *str __maybe_unused)
 #endif /* HAVE_LIBELF_SUPPORT */
 
 size_t default_breakpoint_len(void);
+size_t default_data_breakpoint_len(void);
 
 #endif /* __PERF_PARSE_EVENTS_H */
-- 
2.52.0
