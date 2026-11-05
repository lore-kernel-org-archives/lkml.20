Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793893765;
	b=0Qr3QVXutrr+p2lgu4QyNY8WxkVWx73ikBXSbRlYbf+nRqeFqntetEhwAK2qxMtFQRMH
	 WAJfquZ/gLRqHV2cNiqZcn9KhZlO5Yvyxm8ubYzyPaScAnGCsIBByEjDWwctNTaCZZpX2
	 zO7GIrl52VKc0wgD8YIm1fCemBsQMbl0wp0mWKrq7KBlHp+eEeqbMdqR/Kflgyz1wVXg/
	 vdZwSP11reLaIsXsPeH8r76E0IFFw5/vkm+GFYeAe/Y9RSLWj4vBVkhaVv4n6ltF22NmY
	 gAFhj2xyuYlAn9YTKWrLW8vKHJDemyGUCrPakTKBS/xB7KZbamQYwKqbg+0KDehDGOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793893765;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=PzGMliZ3WOBYHJV/Xe0iatQI3eyl/QNxFOq3R+DZ0B4=;
	b=tRY4LwZ+pHBI/yjXgtOGaCdfWoh6Q1pL2tR+9RlwK3pfmLbuddD+mFPj430roF8vXur0
	 3jbcqBhqL74f3lYE6jfBo0QFgAQ3H1TFkpvcYUghBIoAm8a/JeAcIAFJLV0FG5ION/faE
	 am58/xp8o7Td0mrjxRYF8EN156wRYp+w4izy7lwtpy+oB+st98amqgJ/1ZF2LuzRA3A2a
	 bTs1hBVy9QGU049F8j8TlbwamIYBVeEVjUNH38A4NOJtROLzKTte/NZXk+gByVYBEglMf
	 dyql/bxc8sni39mZZgL7oso/S6SW/UHc/vqV6yG/qsefSiXy3C1ZnP4Jfo4FNHtNfXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JLyFB9GI;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655276083635
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:49:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 655276083635
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JLyFB9GI
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-490f38e9688so753939f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793893763; x=1794498563; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PzGMliZ3WOBYHJV/Xe0iatQI3eyl/QNxFOq3R+DZ0B4=;
        b=JLyFB9GI5TTRlzsZIeifx4bcrVYPEh2xsT3YFffJH3lsGPu5e1kLggA134dYv3TBc3
         xPsXICZJkcYWt/NeuF5DDaBUToOSLqWkv3B1JsEExGF62PJqNPejV8d+VAQ9DuD5V5IW
         cekPB4x45m+CWeNEbHX0n0sWJof+TjK8I6IfHo0o+vb6fDFF+78KfhDEyxTfYAD9w6Zm
         Sg6vdYrUwIMKJmmrHAQoPkiw3Ex+MgoUjbtUEitSsCzrq4zxvx9C0neO5IBYEk3OlVWa
         d3jeqWyfL5AHePAm9Xyx24PKPKIy5Y6l4TYydwjqMPXbZTa8ZW3JpK7SgHBBp5wMgVe+
         sHVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793893763; x=1794498563;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PzGMliZ3WOBYHJV/Xe0iatQI3eyl/QNxFOq3R+DZ0B4=;
        b=eHDH1MRUpTjbS8IQ1JtGGK5VD8P+u+F/lsI6dqWE0txGv0i51Ufeqaz3adznu7u4qq
         lXWfL1QB6oOaO/asCfNOWi4Lw0++msbDDLzERbfnpxqEXy8tO/geSDXwQVzfEBzCxM2o
         BC9HXZcI5G3Awb5c76Xg8fDyTVflJgcifYrZjw3LPmwXjqT4E4P13xHAqf5Kus5wmynl
         89aHDt3JFbQksGDjeFk3Wsyjt2fW0Frn3E6E3y+mCwjxS0ywaUoNOG6SU0Tv7SdOmrww
         QTgLirNlDFCdYJulmNSrMN6fmig0lkkn9ErGsQf9Fv3SG/+9X+LOSYw3lO3C2OCjJ6lW
         5hWQ==
X-Forwarded-Encrypted: i=1; AKwUvBzuP3SKkX9t5CLA5ckoJOFKCjERiGwWxg1b9pzyYcwdDmXs9KuJX6qKWWPGWzj2KgoNU16sxtoi9JRdUbw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cE90wCC/WklEkKfy4T123OmDrx7NcYpla4rf8UtbGqvQBNdog
	QGsYa+x1eLzlRNIy4uyETXY5KOrMLNJA7xmoYswAk0LOZq1hWJyCjfaXxZI571jJ0T4=
X-Gm-Gg: AYBFou0ypU/KGeBqojS64vmwv7RF3zvLunRi5P6tL++67N+RF8n818epwYPBRLOsYV1
	sXdOCAD3n7YMC8SJASFTx1drCocOpYEjdNhf/11VmIo/BFfMeQTH9BQa2ZDL1q/DlxrkUbPtnPD
	AdyU3kpasW5/hPryuxVl5d5tGTLNrrTMIbAwWyegT+Wko/j3CieFMgqDGmTTFK49hSdH+IGaJCu
	X6bRLvCBcunKlnHaOqMufcHtwiT8iHyDws/W91EAQT+k6YYSE8w0jis8OLlBYvzB8KivN3xhXg4
	CpuuyFkJ2+L3vfeRyx0ZWhZwGvlBKMjJ6TrmuUIbDmwwMovR7tFYhUAsTyhT5UB2sFUm1UmTgQ2
	KSf5yvZmoy3SLfd6GGDuhP7rvwJHXqbMDOIy7YeSw3zEFz13JB0v1Pr8W/AvPxU+IS6Uv8ZbRAW
	wPZu6u34oRzCTdKyGYicA4LZ3Ihoe+yz1BO5oFR+l60RNdNB+dtPnZrvoxbp8TWmRQZPjISKRP8
	ajoDb2wfbUo1BXo7uzBXBQ/lm8strP2HQPZy8ORQREtQaEq2ySYzgIkGsH20+7SRn00Ahk9PJs4
	7VRfQDwcoaAYD4A5x4A4WlYsQ1J31LQa
X-Received: by 2002:a05:6000:2486:b0:492:3f98:5070 with SMTP id ffacd0b85a97d-4923f985212mr1557909f8f.12.1793893762839;
        Thu, 05 Nov 2026 07:49:22 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec9cd40csm10650462f8f.13.2026.11.05.07.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:49:22 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH 0/4] perf tools: LLVM dwarf and flaky test fixes
Date: Thu, 05 Nov 2026 15:49:02 +0000
Message-Id: <20261105-james-perf-test-fixes-v1-0-0b279bee5830@linaro.org>
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
X-B4-Tracking: v=1; b=H4sIAG6l7GoC/yXM0QqCQBCF4VeRuW7A2dKgV4kuNj1bI2Sys0Ygv
 nuTXn4c/rOQISuMLtVCGR81fY8OOVTUPeP4AGvvplCHVqQ+8RBfMJ6QExdY4aRfdzqH0DbNUXq
 J5O2UsQ2eXm+7bb4P6Mr/jNb1B39v2WF5AAAA
X-Change-ID: 20261104-james-perf-test-fixes-f72265531d1a
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

Running the tests on an LLVM build results in some dwarf issues that
need fixing. And there is an easy fix for some flakiness caused when
tests are run in parallel.

Assisted by Claude Opus 5.5

Signed-off-by: James Clark <james.clark@linaro.org>
---
James Clark (4):
      perf libdw: Find the CU by iterating all CUs when aranges are missing
      perf dwarf-aux: Support DW_OP_addrx locations for global variables
      perf test probe_vfs_getname: Fix missing debuginfo detection
      perf test: Don't starve per-process tests with system-wide events

 tools/perf/tests/shell/lib/probe_vfs_getname.sh |  3 +-
 tools/perf/tests/shell/record.sh                |  6 +--
 tools/perf/tests/shell/record_lbr.sh            |  2 +-
 tools/perf/tests/shell/record_sideband.sh       |  4 +-
 tools/perf/util/annotate-data.c                 | 27 +---------
 tools/perf/util/dwarf-aux.c                     | 70 ++++++++++++++++++++++---
 tools/perf/util/dwarf-aux.h                     |  3 ++
 tools/perf/util/libdw.c                         | 19 +++----
 8 files changed, 86 insertions(+), 48 deletions(-)
---
base-commit: 29fd95dbd25cda35ac1e38d096a85809e952274b
change-id: 20261104-james-perf-test-fixes-f72265531d1a

Best regards,
--  
James Clark <james.clark@linaro.org>

