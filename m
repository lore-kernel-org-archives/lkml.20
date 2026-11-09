Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794232109;
	b=d1Rw2r0dx+gRNF4O7SYgVHcqJrMvXV6lgUGbehLa6US5qpcx9QyUM7V4QxrgasXLJd2V
	 2cMC8/g2AXEAwbnWIjZJZopQCEktdBINUkrwbImwV7YzSH5vwCDDqDcu4IRFX9Uz6k8bO
	 bcMUsG228M435rKV0XdbSpADvGYfv3EojT/7nrSD44q6LO+YpS40CeUu+uGLYR9ab2qpA
	 lf02UdPAqHBOsSQNleX6Z0QnEuTNuvhvabtaXnbX6a0/ibD/fNBv9l5+WuytDVFp4XXw5
	 9z1bWzE72DhvuSKk41gCfltyBfoK+lx6pDzmr1ZArn7QUlVzAE/5xFqoiKHxPkY+kBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794232109;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=AASYYYdB1Pn2NzJax5aMjK+QD0+VSp5X1qY7y17uZnI=;
	b=Vkg65VkGBGSLyj6gNNz9KIvAiPQjLqmTdYILKtjRx4BoQTzRa0JqWDkSDFo6x8fR+VRV
	 dPiP8oxLXblwKxADwsz7bEPC0/UQoBuHIgWXwyia/We/vg1/79hS2+JbA4XL4BGRhzKec
	 +RmHFPo5GQk3u1iJLs817loVNkE19o4xt12oVth+278wj44WXZZ6xRDcr7BQFM6He8eYv
	 utyRLnvux9CCIJnjmKltEXVCmghOzi1C09JL3A4H1IPQT8qn4xaUjQYePuzz8TvSU0+3r
	 /znlBjzgSIGRh3Jc+V81TZLOpHRuGlMwyiKxXy1GcCp1LZ6pWm6CVcUO2q7uf623ZGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZpxuU7UQ;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C5D606D818
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 13:48:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8C5D606D818
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZpxuU7UQ
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a215e64962so10401835e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 05:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794232106; x=1794836906; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AASYYYdB1Pn2NzJax5aMjK+QD0+VSp5X1qY7y17uZnI=;
        b=ZpxuU7UQZNVDV/kb5KASzh7bP+AlR42b7CNOnrEjDvd1gmmQE/o+xIXA393TcOSMr2
         kqXYGE51sPnLetu8pNLSdsPI87PiwmIEE5QBnWll8QQrI4UJwwZIjg2qRC1W/i/qVIZX
         i2VUEjUOzkqnnDUUfUBDFQuU+v9SkiygqhyRPAk8O+o4mG0OmKEikOJkDR6buCry3p6C
         Hh/sFh6PMNFxqCX2oqgWS/6XEeNOqndgXb8KipxKsyaSFRvxg/fx7GN4/QTJKpbG6k06
         FTRT0UVHRGmWdWYqLM3DSCJLvvfDayjFIDSG4pLm07ogna6gcpj95vaOg92axbkyZhGp
         v/Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794232106; x=1794836906;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AASYYYdB1Pn2NzJax5aMjK+QD0+VSp5X1qY7y17uZnI=;
        b=CqGqeFmlVVfWaddI9Ybh+3WETNJyr85ThzHmaDH2AEF+Buw4KEociGiV+0QR9Z5owk
         JZQzfYG8r9ADv12HTwDs3E/SDbmngzp9SP67OtFqUBrTPNoH7n8LmnzEKwIYdMzMMoiT
         Hu05lMMsAKVWnDRulVKL4TgyBAEk85qkPDDiQA0hPvf46UogxRgGqya0Tmf6kTqO4vK3
         HoF5smlZ/KOKN+9gCTitf5WqNYXMlUuzT+SpVaKZNc/2qbRKyTVfyB3f0auCC8cj+3Us
         BTXY7NZSwCFuDkwJXuGsVdT4CZO3aXKdLljSewePMv8Ly5EeVEKZ7VXarFsODUNO5tCb
         XgdA==
X-Forwarded-Encrypted: i=1; AL+hErGNwDi+0FugADgNtmDp9fJNMs0tfs+HLWBpW2cqiiSi4kud5jnqqaULfSA67Pabv4mmYtMzbVpSQPvg8vE=@vger.kernel.org
X-Gm-Message-State: APuU4Z++rmxqEJwtEVn4rYQOoQ3St8mFXHe7eDisRV9Y31v9X4TZv/r6
	/JwY7uKGdypHsQkIs0lu8wyq7AD+VN5o8SGCaYQAreshQ7s5mj0L7wK+Rp9oDDprRbA=
X-Gm-Gg: AYBFou0jqjbM4QpcYaHBtJSgQsA4fWfnidmxH2vsKI9bqSQvVfywpYiR+rgFNjLOSdC
	ds8AzfkmJ6w6jDckYS14UWaLgteFn8pwYomiVG+W11hHWR9rwRjs1NIS91LFTBckWZzjFwIfT4+
	HVFcLUCTvbK9uxrYDeZenMrNSyAFFw9gXjY6TGlDPFR5pgDEolPsT1ZsFbfE3iZhz7ckXN0wRaD
	C+LapmUITs1aVxBWu7DcCXuBVssYFTIbJKIdR8yXeg1q0IkX4RbmQ2kPOgo46dt+zXOy8NOD3+2
	4BCRMid1aaVei19nIO82Im6+3jUiDB32EBQSESxQrMWMYGASgUSJ9805ks85/Kn1LnfS3nGumGP
	mQ02nm1MIPziVL7USRIvaC4YYxFwQhMXQj7aBYKXzKAqZ7Dw8NsqmR0MRFb5pZg2//8Ksr1YAUT
	1Q6Q3xKF658m69qIDe4/x2l3U1plLofSZHYA/QQv4V/Ye1KaqGBiWRSa5HEfutIKSz2qjcB39j4
	KFUJQrtDDxb+fU/bWMQfA+n0tBcwoIUG1KqTx/Kv2rl/tZLve3hw1AFFfbpYzzQISeZ8+jJhmdY
	0BdFvA8m07rVIZk4YqT/CjSZkskWYt8v
X-Received: by 2002:a05:600c:3b93:b0:4a1:813f:2a60 with SMTP id 5b1f17b1804b1-4b963c76714mr97886875e9.11.1794232106186;
        Mon, 09 Nov 2026 05:48:26 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7bb101537sm98522045e9.0.2026.11.09.05.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:48:25 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 09 Nov 2026 13:48:10 +0000
Subject: [PATCH v4 3/4] perf test probe_vfs_getname: Fix missing debuginfo
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
Message-Id: <20261109-james-perf-test-fixes-v4-3-355ee6b81917@linaro.org>
References: <20261109-james-perf-test-fixes-v4-0-355ee6b81917@linaro.org>
In-Reply-To: <20261109-james-perf-test-fixes-v4-0-355ee6b81917@linaro.org>
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
avoids adding a real probe just to check for debuginfo. No more
remaining users of add_probe_vfs_getname() pass an argument, so remove
it to fix a shellcheck warning. This fixes the
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
 tools/perf/tests/shell/lib/probe_vfs_getname.sh | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tools/perf/tests/shell/lib/probe_vfs_getname.sh b/tools/perf/tests/shell/lib/probe_vfs_getname.sh
index 57a59ae7d4ae..d13b8a8e3b18 100644
--- a/tools/perf/tests/shell/lib/probe_vfs_getname.sh
+++ b/tools/perf/tests/shell/lib/probe_vfs_getname.sh
@@ -28,7 +28,6 @@ trap cleanup_probe_vfs_getname exit
 trap 'exit 1' term int
 
 add_probe_vfs_getname() {
-	add_probe_verbose=$1
 	if [ $had_vfs_getname -eq 1 ] ; then
 		local func=getname_flags
 		result_initname_re="[[:space:]]+([[:digit:]]+)[[:space:]]+initname.*"
@@ -59,12 +58,16 @@ add_probe_vfs_getname() {
 		fi
 
 		perf probe -q       "${vfs_getname}=${func}:${line} pathname=result->name:string" || \
-		perf probe $add_probe_verbose "${vfs_getname}=${func}:${line} pathname=filename:ustring" || return 1
+		perf probe "${vfs_getname}=${func}:${line} pathname=filename:ustring" || return 1
 	fi
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

