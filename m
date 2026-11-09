Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794219454;
	b=FIWkqcQcQecmszgLRUArC5JBbKj1OuV1PmnENKK/iClhaAKxYIqpaBC/9I2yW/HWS4/s
	 C3TrigTFwy7TCwn8NQzUbNi6TG7LiCUDWh7UWYx1+7ya9U4GIQh/Nt6S8QVJ4Oj/pEe4E
	 F6P4qMTInV7TWA3ZDtYXorzoi2tFw1zFSrckzPHsF7u/U+4O86U/4JR5EfnbmB6BiYw1A
	 qedHjLsEod2CoUZ72Z/GaVArkdZXqj2dBLssJB8/OHov5w6tPOx6OMiSKR9eYSR27FjRj
	 OuncbSrBY/zKMG/fhvytD2NRI1vc1IfThq6eOkf0yIXAsjI40AnA91Srj3fUjcDuOqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794219454;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=/m0V48FJw/lvX4pgffc6GzzQCToF+5niRtdUzDuDo0A=;
	b=ctPSxUdlBnAe3sOtsYAvWIR8fqJSBotwTvbKtwCrMnbb7cK6R1yujC17SdPoVEQMY9WE
	 KTAdXyhv3WEftjudquMAppMi7A+HRWVZ2pnY6MnlO+ZTF9f+2a9ZqNlWjXl255n9+cj5d
	 w/hst1ux8CHxq34CW3U5e2Uai6GXq+BVrYWp5W73EF46beXbk01Q0xpoW1ojfJTD+NuxG
	 nb+ee2Zk2jXqI52XG3UwZR2IfaruUonwle0jyBKNgtH6g6f0WstzdxzA8JXQ1zViFgeTb
	 U+dLi91UUOzzwbE8CjpmjrwrVWOU47Rdv3ZJrQ8NJTCljuD/h/GFPFO/1Z8RvbT0cUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TNjSNAmM;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6072606D824
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 10:17:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6072606D824
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TNjSNAmM
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so566085f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 02:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794219452; x=1794824252; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/m0V48FJw/lvX4pgffc6GzzQCToF+5niRtdUzDuDo0A=;
        b=TNjSNAmMMXzyJZhRIK6HYeF7ws9vWkYWs2aRf7ten1rvXKOs3cFYN1l1goHadFmrg6
         xrBfugzoxf9roNUed5ZbQDyg+Syc0oMiTxBsh0NbAHeHenfFdElEp0QtejvTv38eTHlD
         OvjvlA68nvcttVMxhhZY1U1SsHm87wjaK6Nrj6FjK67RVx2+C8pXtv0UCY7acmsC1nLh
         k2jcrE8/zb/HzLFNPlg7KU2yqdDrcjqdo0JKHeVUDV4uUY/SeneRiTwvxl+o0cyssaIP
         6PTwNvZ+xDMF4Pb8XWT7FsiGg++TJseUI88CZXGTWJwFT+RSLIzxEv1e7UQChNuQzZrO
         J9nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794219452; x=1794824252;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/m0V48FJw/lvX4pgffc6GzzQCToF+5niRtdUzDuDo0A=;
        b=ZQX2Z2Mt0akiLzdwDN5BDbciFvwkQFq95qa4XdfGHhvRWp9h9e73RrRp36mciZQb4S
         1wZtx5P751sDMvzRQ9dh7xUFgR1e3uUtBk+629y36R3nDKs+2fdbXWR9SGpfpRtNOjSg
         oQb6NU+WKh2epgJTST1Gqr3NIgfkJUhX5zOfc3kwavidA/fvG+m87JWQanMk3MHIpRCI
         L7KT8lmy+sdqbXuxqJOf6c814t0fNrR7EpD1PFGZqKL/mYgoA2L8sTnKE8R2nfp8/72k
         C0RsVctBsNexn+GKdCwRXNpfgLIncpwJ7AL+EpzASDb4U0fhYZvZ2EaiSChK7A9Omy8f
         +3Pg==
X-Forwarded-Encrypted: i=1; AL+hErFX8/LKeazhfAt+3l6DTqsEI+hqcfw/6+KJzbP2eSATKMkil4KO3oWu8UJK7opxlM6BcwBmfzvUrLbN8Y8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hW5P1QU4boVyb25X9mPTXjVxo19DNlvSXwrSID7ukUNk7eVKD
	iO6DKhNRAWnxys4Y4sqQxxeqXPAKfOyE8I25qKIc57dxYM+XfQUPxGZhtTaHh4oETE0=
X-Gm-Gg: AYBFou07BUYJWL/KjvpnQtHIF40DiWCmwtbMmrSgJfiTQTISFOPjooy8BzFymecEaw1
	+YaV7HhcVtdIKsxa5jZ30B54wTn0nMx4WQVn+jMji17bW+wSbtjaQpFNiJcy4kQ1gUcvWTMWLEw
	lB10/0EXteQPBmssftm3R1S4LgMOdZg3EnAbSkh7wOQ/ML+ZGCEO9qVOpPGBzxybzdmv3qRi32V
	7fw4StFqdR67ejJxRpEjsAaIj5cSPbn6eS2fbYh+0Yz8iB2UkbYacl7OxAqfxI5y+gov0WECHfr
	AakoCS/JP9/1l1UGp1Vpbn/C1qqLmEB9EbNe2rc1x2Zm3ykkIRn3tqYZpHWP7D95ohPNX7wYh28
	9lC6EFhl5nADEsRdDA+WZ4OwWW0Pg+C7U3qjsJAh8ln1wxDbdFzkCRqPOAabQDdIfOnvjg5QwmB
	rPfFDHR7XPozEcVj2sgYvmt8ofFwpDPwo8eB6zvG/K8RS7shaMdUbkvrmp1R6SrIEKPBwUqx+JB
	y2JmM5rS4j1P9mzPhMlnEHDlu8k6nUvydrgvHUFmeiGkJbQbwhz6f+iQzl0Xo2C9NTCtZ7uZVnY
	2g4Aip6LeUFIzzLW4xd8+ZWZZW+bFOPPmg==
X-Received: by 2002:a05:600d:19:b0:4b6:bb67:bb9 with SMTP id 5b1f17b1804b1-4b963c9be07mr46813785e9.29.1794219452257;
        Mon, 09 Nov 2026 02:17:32 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90ee1de2esm121575795e9.5.2026.11.09.02.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:17:31 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 09 Nov 2026 10:17:03 +0000
Subject: [PATCH v3 3/4] perf test probe_vfs_getname: Fix missing debuginfo
 detection
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-james-perf-test-fixes-v3-3-e8d0a65e618a@linaro.org>
References: <20261109-james-perf-test-fixes-v3-0-e8d0a65e618a@linaro.org>
In-Reply-To: <20261109-james-perf-test-fixes-v3-0-e8d0a65e618a@linaro.org>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Jakub Brnak <jbrnak@redhat.com>, 
 Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2

skip_if_no_debuginfo() looks for the errors that 'perf probe' prints when
there is no debuginfo in the output of add_probe_vfs_getname(). But since
commit 92b664dcefab ("perf test probe_vfs_getname: Skip if no suitable
line detected"), add_probe_vfs_getname() returns early without adding a
probe if 'perf probe -L' doesn't find the line, which is also what
happens when there is no debuginfo. The error from 'perf probe -L' is
discarded, so the debuginfo errors are never found.

This causes the debuginfo dependent subtests of the
"perftool-testsuite_probe" test to fail instead of being skipped on
kernels without debuginfo, because test_adding_kernel.sh calls
skip_if_no_debuginfo() unconditionally. The other users only call it
when add_probe_vfs_getname() returns 1, so they aren't affected.

Fix it by doing a dry run of a probe that needs debuginfo instead. This
works without libdw too, where 'perf probe -L' isn't available, and also
avoids adding a real probe just to check for debuginfo. This fixes the
"perftool-testsuite_probe" test:

  $ sudo perf test -vvv "perftool-testsuite_probe"
  ...
  -- [ FAIL ] -- perf_probe :: test_adding_kernel :: listing added probe :: perf probe -l (output regexp parsing)
  ...
  -- [ FAIL ] -- perf_probe :: test_adding_kernel :: wildcard adding support (command exitcode + output regexp parsing)
  ...
  -- [ FAIL ] -- perf_probe :: test_adding_kernel :: non-existing variable (output regexp parsing)
  ...
  ## [ FAIL ] ## perf_probe :: test_adding_kernel SUMMARY :: 3 failures found
  ...
  189: perftool-testsuite_probe : FAILED!

Fixes: 92b664dcefab ("perf test probe_vfs_getname: Skip if no suitable line detected")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/tests/shell/lib/probe_vfs_getname.sh | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/perf/tests/shell/lib/probe_vfs_getname.sh b/tools/perf/tests/shell/lib/probe_vfs_getname.sh
index 57a59ae7d4ae..98cfb02cf7c6 100644
--- a/tools/perf/tests/shell/lib/probe_vfs_getname.sh
+++ b/tools/perf/tests/shell/lib/probe_vfs_getname.sh
@@ -64,7 +64,11 @@ add_probe_vfs_getname() {
 }
 
 skip_if_no_debuginfo() {
-	add_probe_vfs_getname -v 2>&1 | grep -E -q "^(Failed to find the path for the kernel|Debuginfo-analysis is not supported)|(file has no debug information)" && return 2
+	# Dry run a probe that needs debuginfo.
+	perf probe -n -v 'getname_flags $params' 2>&1 | grep -q \
+		-e "^Failed to find the path for the kernel" \
+		-e "^Debuginfo-analysis is not supported" \
+		-e "file has no debug information" && return 2
 	return 1
 }
 

-- 
2.43.0

