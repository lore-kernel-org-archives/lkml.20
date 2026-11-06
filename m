Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962120;
	b=D9aMP3xlj1VA1BTYDI6JfHctxax05VDH5JiUA+CGG5QgaOhNU0HqId9DAP7rMfdsQp10
	 rxdCVE2R4XmygmszB4rZ/PFcnPYcsaxoEan1Avqpd3r+gN5vUc07KBBLZuAtgRTrK4qbY
	 6eSpWypp3OMGJ+StErMI+KDo+N3HnXZRV3drU6u3KkwLaVNX2GRQ1jOqekaBHrfNDyWFN
	 c+CoSRD0YccqYPJrzTfvIMWH4pA6T3VRH8FbEzeEP8p+uNDX94UY9Kef//0Ldfv7vtUOi
	 Zz0rkxL6nnPl7MgNiZSoVP86DrZsbRTIVyUSCGu9FwmRNb4YTV+knZzJItJdeZ16sUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962120;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=/m0V48FJw/lvX4pgffc6GzzQCToF+5niRtdUzDuDo0A=;
	b=V7e6m58A3A4IK1v1zvNltFtkxBO8/407yvhw6m8Ydsj9lmrKvVG3jNEuMgBmoL20+7ZF
	 VYIDeSK/RzrgibNQa15F6r7xg81OkV0nw5vHyXDsEO++hcmGV3WG9p1PeGCdUAs1xts9u
	 wWqLHZQGLW2DQBeRmGWvKFVsyAhJpOkYqq2LmF5WwRwMKIBgAJ5a4OGwPObhoH4oegan6
	 22spEZmrcfltotOsz2hEPrIUd/r/LP2xB3dn3qmgptQ0K+/WFKEOshmZZxBHwp3qyERWT
	 C1W/CuG8BGjHxXzJ2YeyrBQ/1rOKL9yoWg27T3FdipAwfG04GOQo96E5RupdVdKvslA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lux1WrwL;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F343606EE97
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 10:48:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F343606EE97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lux1WrwL
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so4319055e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 02:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793962118; x=1794566918; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/m0V48FJw/lvX4pgffc6GzzQCToF+5niRtdUzDuDo0A=;
        b=lux1WrwLfDYTO8YipNDtfR/K4BOtptm+bnx8+Tjz2wJo5dMEAr8Ic1/h8qE1SIGAo/
         RSR//k13CWg+bZMQDIQeswSIy24ro8dWNRnx0LtnWVb5qaBC3w0hUA3JUyt1rLNwAqlm
         OLLpQKI0OMBFxZIStvGtb3rydH6MgaQpBXM4r0JfpTZNoUAX9ydkCij9TUNuzZDmHa76
         +BGS2vf2uQrCfjVWDcTB3VrROUPG9+RnOpVr6PeoXvfcNDvMd4K4Ady0GgIbyAbx/KwW
         v389A3XM9kea1880biyF1c19n5ksSQsJq81zrYUC1T1ISjzQTPNMm7+1TyW5nFRBtFJB
         k3rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793962118; x=1794566918;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/m0V48FJw/lvX4pgffc6GzzQCToF+5niRtdUzDuDo0A=;
        b=Di85MNQvb1RHb1SVrwbb9YU+XvSeufsdyMqH3TdH8VZ+MBxAFDFVhnlRny/cXjTSgn
         n+vk3Tomh+DKP7rb23LSToNQF9lD3HgEPDIdeGN8e9z6acIsIlZwLekXUYPB1cCoohCy
         2pVyBPJ3vF21zqEnh90xsdY208oBHV8xr/TzQkaO149/B3X6CAydTRKI0PHY5W3E8MPu
         Uunsu757fIodnKSFuUzxsVDF2hxeZZeqYCPp3Q6uoCw7rC611cgDY1WWkMsiYQmoUwmj
         xeFQFFUJfSmgO4BfQkexCFakvFw0Sj8QZ2r6tF8AdsG5Uci1BHUy1c9uI+f7WOGVZhRA
         X3QQ==
X-Forwarded-Encrypted: i=1; AKwUvBxDWpXxvaXCTULoyUsqRvIQfHd1nZnrLKOkX2MDY65s4rqmYEqyZzjuqjZMnpy3rLDWpFjhqwvHy6zwVtw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QsBNyoBRFLifJKTBa1kRta+mOtmeShSaWDiSmXNNGtcDyEOI4
	OmxnabTXgy+DGNHmvLcgSh3pz351oEnvR+NKVuxk0D56+wfe9YEblIaE67PUf9ow52M=
X-Gm-Gg: AYBFou0GrU0/US19/QG0BTsrvLlBkbl0qH3D3OIxE5EJHjaFsV6vxqBUySWH7GH4Rm8
	HCiOuuwMQ9iLdS9YDDc3XRGlLFZhdgJTSLmuPGHWWCp6iHmopO1dSvSYmzco2pO7q/+25siCM18
	EPz4JptlcQic7MycBV0bXUT3iuALOpukBNymdD6GZq0TaJ+auIPTF6o0s8srd9uZPe2iD0fre4U
	TQhUkUUQDomUE7u0zMoQHQPUh7u6bH8MlOV3AWMhWZtLouXR/DwnvqItNLFsWZkC7xWuWwJi6YD
	75oi7lpAkCWCBJth110YjkoTh0aXKHKZFiZbU4X9bq5Fy1SysC1A54CgdV1RqP+Pdyl2dMR/ovB
	fimDOZnxA7dEeORCyMhM2Yp+OR81PeZVWMjCTR38X7qJOeyZKY0/f9iyGOFQBOeJMMEFH7zREUB
	eLL6tQlvsgUt+vD0W06VMxBm7GcKP5MuT6wrSs4VFhqRTeRPUAHqsJVi3rU6rEYSn3sfuLxGUJV
	u8Bn4r3DF94ndqsKumz7/EfU6d5E6wkLSy+2eaG3w3mWIL39qVaRTzOOuqt6/ccwDDAiOP6QQxh
	24OgVRaib8tB0AQL+0a6QbUOTiq/blFR
X-Received: by 2002:a05:600c:3104:b0:4a2:1e1:d55 with SMTP id 5b1f17b1804b1-4b6e054955emr38404285e9.28.1793962118487;
        Fri, 06 Nov 2026 02:48:38 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d6d63ae2sm3232248f8f.11.2026.11.06.02.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 02:48:38 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Fri, 06 Nov 2026 10:48:09 +0000
Subject: [PATCH v2 3/4] perf test probe_vfs_getname: Fix missing debuginfo
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
Message-Id: <20261106-james-perf-test-fixes-v2-3-9a912662f822@linaro.org>
References: <20261106-james-perf-test-fixes-v2-0-9a912662f822@linaro.org>
In-Reply-To: <20261106-james-perf-test-fixes-v2-0-9a912662f822@linaro.org>
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

