Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793749541;
	b=X5vvfyNEXBsxmBoLs2X3PofaCevf4uXcgHFXPV/s4rcX/qFC8Bb7LMO38MRkC3glnCwY
	 zIaXxS2wPRXFyM8vBAgEr1/rPAXquSmiDEMBnKzO2HMcZS/grs++HroDxhx82Tpu8wuY4
	 MTifBXC6tSjlUypOOZ8nGigOhZxG2MNpGGRapZAluxTxDPWLdKS70+W4zO+W7xi07/FtZ
	 EB6YvV4NOLCosWwhtx9o9x7uE6HVuZ5PWkqquXEwRkQfM11e8qKqVLAvnCNHPcyg5RGdy
	 iOWkzx7n1MgRUts4igIlymNxzmesGWongYftp5QCvr1jpFHmuBNACp7DcIRMaCldFZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793749541;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=IF7V8sxDy6cgnQTFSKHmtTWDonO4IW8GRaCyN5gvOjA=;
	b=vVqE3x8sRHGxOojzOoJEelYGElbHyVYRrT5b08PO/yha3DO2HBhcEIJ+5I8cKlNdJYOS
	 +jGp/RozUkUxPPBQk2Y4Rd7pLHvM9waBXYYdUEAgzoPSeKed8D6gbg8T22slIyqk+zqzX
	 4p/nKpKzRFTG6Th6OiKbGzTqJlvHSZz/XDc4ZiGEZ0jyn4O4G01AwbWXXL7Pf0pZLwyCf
	 GiY1rMM5UGYFp7WUyMNJDO4I1ZTo0jFbzyZwvQFnOzwR2UUm0/Dx/hE8+mkDpdFOG0S14
	 5L/AfjQGlMBVr01ChwNfylBCp2SMLDO+auXsrcxfDyqzuhA02MF6x7E+WjzMISBgcxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DA4BwjsV;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08CE606D829
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 23:45:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B08CE606D829
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DA4BwjsV
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36ca254ca2cso149045eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 15:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793749540; x=1794354340; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IF7V8sxDy6cgnQTFSKHmtTWDonO4IW8GRaCyN5gvOjA=;
        b=DA4BwjsVrDOhR9y+2LT/STSL4JHHxCJtZLyK6r2KAuDp8q3hMntw2iv+2ZOv/+/Utr
         J6JlrWywIj5d4icHQFDxVazKd3GYpXJ5mfoucyz5R0ZIP0Cd7FA+Xiq80m5InG5JvGxW
         niSrDS9wjb77g4w8SgEiWwzGn7si+QADxrNuX5g8xiDRGv12CtsE26wma9J2RArsdmDA
         1CcdMT3Q+SPLgyGfcsHEaGpNB3OgEAbW/3KOJ6juI4/xaf4rHixUY896JvL2luMYg+Gc
         FoYROGRKmOySVuPTwW3iSo9mPcMMubY9/vxV1xkZDekfoPtk7EeTDpCh+gSETNZQHg+P
         VVWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793749540; x=1794354340;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IF7V8sxDy6cgnQTFSKHmtTWDonO4IW8GRaCyN5gvOjA=;
        b=WGzGDxsZWgG4M94l++oJV7FdhtLD7y+4rYMxZbRrpkFEn/ojdu4cfHGPqfNH83IXQ5
         v7biU/ER1W7UOknB7UKvCEQkyOBAxXuCa9r/SQXwZD4rkvcHA67+nSa4a25B5VT9URZD
         FsvgtrAodcBKwCeAs2HyB1qcKrhRdCvURMRm3D/BSUe1SKkqUPrQ8esRWf7F75hTqx+7
         btOnmGfrlWiNYjJpyo2pDHmFLuLJzUIrtNnBPwclUvuY63wXG5HWasoFfKxtehaaSRUR
         nUgYK+cQJQ62LcHPUx9gajE+ojdo0widuYJRZpDFZB0wuukPCHhUGx0xK2LY48Zu6nVy
         0bJg==
X-Gm-Message-State: APuU4Z+6rifdX6gDGoHfhoBndWDJLGk7cgYJvnPTtM1GO9sMcZZevKNO
	3QUGAybeU69VNUOOKQ+u2iHZ94L6639b4XmouPmWZYN2qn4tlqyUfW/hzFST7BrvFH44rd1ERwo
	YnE4htLRVHQ==
X-Received: from dybgn33.prod.google.com ([2002:a05:7301:2521:b0:34c:9660:9612])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:41c8:10b0:367:185e:867a
 with SMTP id 5a478bee46e88-36a4242366fmr21892131eec.38.1793749539575; Tue, 03
 Nov 2026 15:45:39 -0800 (PST)
Date: Tue,  3 Nov 2026 15:44:28 -0800
In-Reply-To: <20261103234502.1008382-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261103234502.1008382-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261103234502.1008382-13-irogers@google.com>
Subject: [PATCH v1 12/41] perf test: Add CPUID matching tests for other architectures
From: Ian Rogers <irogers@google.com>
To: linux-perf-users@vger.kernel.org, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Kan Liang <kan.liang@linux.intel.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Thomas Falcon <thomas.falcon@intel.com>, John Garry <john.garry@linux.dev>, 
	Will Deacon <will@kernel.org>, Leo Yan <leo.yan@arm.com>, 
	Athira Rajeev <atrajeev@linux.ibm.com>, Thomas Richter <tmricht@linux.ibm.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, Sandipan Das <sandipan.das@amd.com>, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Test strcmp_cpuid_str() for the ELF machines other than arm64: exact
matching of the test and common tables, x86 stepping specific and
stepping optional matching, PowerPC PVR matching, conversion of x86
and PowerPC HEADER_CPUID strings, and regular expression matching for
RISC-V and s390 CPUIDs, where RISC-V's hyphens don't imply an x86
stepping.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/cpuid-match.c | 79 ++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/tools/perf/tests/cpuid-match.c b/tools/perf/tests/cpuid-match.c
index e3d4a349f393..826380241a0f 100644
--- a/tools/perf/tests/cpuid-match.c
+++ b/tools/perf/tests/cpuid-match.c
@@ -36,8 +36,87 @@ static int test__cpuid_match_arm64(struct test_suite *test __maybe_unused,
 	return 0;
 }
 
+static int test__cpuid_match_exact(struct test_suite *test __maybe_unused,
+				   int subtest __maybe_unused)
+{
+	/* The test and common tables are compared exactly. */
+	TEST_ASSERT_VAL("same", !strcmp_cpuid_str(EM_NONE, "testcpu", "testcpu"));
+	TEST_ASSERT_VAL("different", strcmp_cpuid_str(EM_NONE, "common", "testcpu"));
+	TEST_ASSERT_VAL("no regex", strcmp_cpuid_str(EM_NONE, "test.*", "testcpu"));
+	return 0;
+}
+
+static int test__cpuid_match_x86(struct test_suite *test __maybe_unused,
+				 int subtest __maybe_unused)
+{
+	const char *zen3 = "AuthenticAMD-25-([245][[:xdigit:]]|[[:xdigit:]])";
+
+	/* Stepping specific entries. */
+	TEST_ASSERT_VAL("stepping match",
+			!strcmp_cpuid_str(EM_X86_64, "GenuineIntel-6-55-[01234]",
+					  "GenuineIntel-6-55-4"));
+	TEST_ASSERT_VAL("stepping mismatch",
+			strcmp_cpuid_str(EM_X86_64, "GenuineIntel-6-55-[56789ABCDEF]",
+					 "GenuineIntel-6-55-4"));
+	/* The stepping is ignored when the entry isn't stepping specific. */
+	TEST_ASSERT_VAL("ignore stepping",
+			!strcmp_cpuid_str(EM_X86_64, "GenuineIntel-6-(97|9A|B7|BA|BF)",
+					  "GenuineIntel-6-B7-1"));
+	TEST_ASSERT_VAL("model mismatch",
+			strcmp_cpuid_str(EM_X86_64, "GenuineIntel-6-(97|9A|B7|BA|BF)",
+					 "GenuineIntel-6-55-4"));
+	/* HEADER_CPUID is "vendor,family,model,step" in decimal, model 85 is 0x55. */
+	TEST_ASSERT_VAL("header stepping match",
+			!strcmp_cpuid_str(EM_X86_64, "GenuineIntel-6-55-[01234]",
+					  "GenuineIntel,6,85,4"));
+	TEST_ASSERT_VAL("header ignore stepping",
+			!strcmp_cpuid_str(EM_X86_64, zen3, "AuthenticAMD,25,33,2"));
+	/* 32-bit x86 uses the same comparison. */
+	TEST_ASSERT_VAL("i386", !strcmp_cpuid_str(EM_386, "GenuineIntel-6-55-[01234]",
+						  "GenuineIntel-6-55-4"));
+	return 0;
+}
+
+static int test__cpuid_match_powerpc(struct test_suite *test __maybe_unused,
+				     int subtest __maybe_unused)
+{
+	TEST_ASSERT_VAL("pvr match",
+			!strcmp_cpuid_str(EM_PPC64, "0x004e[[:xdigit:]]{4}", "0x004e0200"));
+	TEST_ASSERT_VAL("pvr mismatch",
+			strcmp_cpuid_str(EM_PPC64, "0x0080[[:xdigit:]]{4}", "0x004e0200"));
+	/* HEADER_CPUID is "pvr_ver,pvr_rev" in decimal. */
+	TEST_ASSERT_VAL("header pvr match",
+			!strcmp_cpuid_str(EM_PPC64, "0x004e[[:xdigit:]]{4}", "78,512"));
+	TEST_ASSERT_VAL("header pvr mismatch",
+			strcmp_cpuid_str(EM_PPC64, "0x0080[[:xdigit:]]{4}", "78,512"));
+	return 0;
+}
+
+static int test__cpuid_match_regex(struct test_suite *test __maybe_unused,
+				   int subtest __maybe_unused)
+{
+	/* Three hyphens in a RISC-V CPUID don't imply an x86 stepping. */
+	TEST_ASSERT_VAL("riscv match",
+			!strcmp_cpuid_str(EM_RISCV, "0x489-0x8000000000000007-0x[[:xdigit:]]+",
+					  "0x489-0x8000000000000007-0x0000000000000001"));
+	TEST_ASSERT_VAL("riscv mismatch",
+			strcmp_cpuid_str(EM_RISCV, "0x489-0x8000000000000008-0x[[:xdigit:]]+",
+					 "0x489-0x8000000000000007-0x0000000000000001"));
+	TEST_ASSERT_VAL("s390 match",
+			!strcmp_cpuid_str(EM_S390, "^IBM.209[78].*[13]\\.[1-5].[[:xdigit:]]+$",
+					  "IBM,2097,705,T01,1.3,002f"));
+	/* The whole CPUID must match. */
+	TEST_ASSERT_VAL("partial match",
+			strcmp_cpuid_str(EM_S390, "IBM,2097", "IBM,2097,705,T01,1.3,002f"));
+	return 0;
+}
+
 static struct test_case tests__cpuid_match[] = {
 	TEST_CASE("arm64 MIDR", cpuid_match_arm64),
+	TEST_CASE("Exact test and common tables", cpuid_match_exact),
+	TEST_CASE("x86", cpuid_match_x86),
+	TEST_CASE("PowerPC", cpuid_match_powerpc),
+	TEST_CASE("Regular expression", cpuid_match_regex),
 	{ .name = NULL, }
 };
 
-- 
2.56.0.385.gac671c819a-goog

