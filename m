Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881CD466B57
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790582132; cv=none; b=WhCOIMh7ML4ozDEuz6WSaWUNYCDAEHvaRuA7E2Sjhk2TdBMWcp9Mpj2YL/0fc0HBxenXHcXv02e8fPDOiiubmOmAOTDAAIAa65sdTJKo2T2DOViZZgB4PUH18jXll5DH2bD/H8H6EnWul1OJxVEiRLGwrZNg70ShgErU0oSWESQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790582132; c=relaxed/simple;
	bh=IYfBliEovmHApazL8W4A9U9SKaT+AFtbRztssz+EIkM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=Z7P0YKaHa048g/Dcup8Sh6hKD9WL8ELOlAA1278ZNkjnEC/jL/kx0fKeVyhhMJ2RPXtuVvoFwfFP1cTga1CQaZPfb5/bkGPv+CdA8KaBKzIAS3AchUbSzgwwulFKn2mwe3xvq2XU3oS1WeaJSXX6GPJcKA/7+2bpcCHaUNpLRgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XA2ZXtoK; arc=none smtp.client-ip=74.125.82.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XA2ZXtoK"
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-143826c4a13so2041575c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 00:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790582129; x=1791186929; darn=vger.kernel.org;
        h=content-type:to:from:subject:message-id:mime-version:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zZjBVF/akum3LA4mMtKqOcvN3zY8xllmEp9ZKrvY4Zk=;
        b=XA2ZXtoK41JhflEDF/J08Q1rEPeZDGMYhpoPuNoHDbByY931i/d/4jFIu1Yn80Zx9r
         osJzd1MYKstIneAz1pPBL1UBgeRxAYpjXNAXzZ4Ef3W0mWmTEAci8/WCvF1GHf/eLGQi
         4EQHhS0bzUZCYwvy5K/jdaN65hFfvs7jdwL8QltRkLqMz1HLj854yFPaakENlCyGpQSm
         FsRuSXAp1IEBcPXItCZgi/MtnTqSXE8luZH5EJ0O0wDlJ+Mrl0O7OtNy7JUbljq7tbo0
         eujgNnJ+WR15nmgDZm7mvcWF1jOc3H6SNWOEG02ytDkY5RLvh5VF7gINbijoLOPVbh/7
         UZgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790582129; x=1791186929;
        h=content-type:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zZjBVF/akum3LA4mMtKqOcvN3zY8xllmEp9ZKrvY4Zk=;
        b=kipOKjSuuYRlNeUp2H5FciMe0qlHQV66QDiWhQmggwDWTewMONrnOuyuEaESEv2RdX
         +MliR3opCc25CFaMBQr1kBY1XzYdkwxBVChTq9myEhdhk6xISmvw/N/MwGsDlnlWhTsM
         NDVzp4XnLEaf4dJ9O9yA2NMxs77dsIuU7fHSBn1upJXcp2ErKwobDfcPoFXYiHecYC65
         NT1ITFrsZCOowIjRtrvbCH8vKnv6TOo9BLTp1PLB+e4vIDFnSb6ILuTpXQTrpH9O4aXu
         CnZe+hvBMGuNZJlnbz92Bi/UJ7jbTghixDJIoKWLwhBEk77wSRUeCp27pDV9gqjeNA5e
         qBcg==
X-Forwarded-Encrypted: i=1; AKwUvBzPlMgfZDN2Bk4eCgANUnhO98BeZqR68j8oQRhzECQ2t1wLnTHbTSA6snLnQt1/UDYvM/yycdHj9BJw9Qk=@vger.kernel.org
X-Gm-Message-State: AFuF++lLwSQe7JA+BVbJqzzgllXQEXOS7pmIxj8Zx1oveFT+290TpJap
	vDriuHXXLbiZ7XMve3CR2sZ+xK7/i8mPtIkInuaZa3Hbgze/jMdi5eAXxOiMWO7ycRcJUGjjn3R
	K5juSk0Me7g==
X-Received: from dlbuj9.prod.google.com ([2002:a05:7022:3d89:b0:144:d1d0:a66])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:280c:b0:144:eac6:cf37
 with SMTP id a92af1059eb24-146d0c50cccmr7772008c88.47.1790582129192; Mon, 28
 Sep 2026 00:55:29 -0700 (PDT)
Date: Mon, 28 Sep 2026 00:55:17 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260928075517.3057621-1-irogers@google.com>
Subject: [PATCH v1] perf test code-reading: Fix duplicate kernel maps and
 machine leak
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In do_test_code_reading(), machine__new_host(&host_env) already calls
machine__create_kernel_maps(machine). Calling
machine__create_kernel_maps(machine) a second time immediately
afterwards duplicates all kernel module maps in machine->kmaps, causing
dso__load_kcore()'s module validation (do_validate_kcore_modules()) to
fail and fall back to /proc/kallsyms.

Furthermore, when try_kcore is true and !have_kcore, returning
TEST_CODE_READING_NO_KCORE directly bypasses out_err, leaking the entire
struct machine, its kernel/module maps and DSOs, all kallsyms symbols,
and host_env.

Remove the redundant machine__create_kernel_maps() call, check for
!machine after machine__new_host(), and jump to out_err when returning
TEST_CODE_READING_NO_KCORE.

Fixes: 0fd4008ed755 ("perf test: Use machine__new_host in mmap thread code reading test")
Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/code-reading.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/perf/tests/code-reading.c b/tools/perf/tests/code-reading.c
index f0e8ea8754ef..c50b526f44fb 100644
--- a/tools/perf/tests/code-reading.c
+++ b/tools/perf/tests/code-reading.c
@@ -716,10 +716,8 @@ static int do_test_code_reading(bool try_kcore)
 
 	perf_env__init(&host_env);
 	machine = machine__new_host(&host_env);
-
-	ret = machine__create_kernel_maps(machine);
-	if (ret < 0) {
-		pr_debug("machine__create_kernel_maps failed\n");
+	if (!machine) {
+		pr_debug("machine__new_host failed\n");
 		goto out_err;
 	}
 
@@ -739,8 +737,10 @@ static int do_test_code_reading(bool try_kcore)
 	have_kcore = dso__is_kcore(dso);
 
 	/* 2nd time through we just try kcore */
-	if (try_kcore && !have_kcore)
-		return TEST_CODE_READING_NO_KCORE;
+	if (try_kcore && !have_kcore) {
+		err = TEST_CODE_READING_NO_KCORE;
+		goto out_err;
+	}
 
 	/* No point getting kernel events if there is no kernel object */
 	if (!have_vmlinux && !have_kcore)
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

