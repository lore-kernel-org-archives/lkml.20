Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621744;
	b=0CSZEa5J6Z9VwW3xkUjPAPe7/is4u11k06wpJa96fLRZcxHb13RFCF4JUr9brdtYOxXu
	 XCceJdELZEfMGyrlpxezewanhj9M6aLZX8a4Mjij1IrY5PGWCLc1kvdtqilCjsoSJe8r6
	 32oH74fRxXEaAif3g6tUbMoMT3uvRVLrVQ/USwxdLJjkTT8zN+4e2Q6Q8q8tEu3c4twF4
	 2HImKfF5p9z++n3rDf22lD2Nz/eiyogEJqe4m7QZ8lOsts47uscIc8EZrLjlOyMC/S1Vt
	 0dVeiXEstb1OrJ1dJXNoF+08Wu38jX8L3MZ+JRgeq106QGIGKB0PXLLfDQyfjTXI5cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621744;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=mCLnsLSirANrZFkZpSvJ6WBM/VWZNAB053qbWLRSeJQ=;
	b=BscIvldMiFJe4gcbFY6nxKRChPmMvvjPIPiN3XQ68nIgrMHyvQAJSMgCz428zbisP2VZ
	 JL2OYd0iA7n+sqUnEo0fSqoRfVB9Rfsnp5bUO6eA4q1ykWRCOAvGAhqU58sm7wcE1Tsbg
	 72FqhBdnPtSZ+F/PONbqMy5IiR2kBnoJxLzSxGr5IQogJpUwGuQA5r5HtK8C17GyCYb5Y
	 KjCBAzdf1cS5wEKwOzxw/f9+E9Lbbym7qm9Iq78JU6+YXRDbk22BRAq9hVfH1g8ZfLPWC
	 KNuSI7rRkFCKRWLj3qythFCSV7y0qwtGGl/I+p31PpT6HfLPpmzcwp2KxmiyPSAh1Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SDRVsbBE;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5C7606A32C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:15:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC5C7606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SDRVsbBE
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a210470b49so23415905e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793621742; x=1794226542; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mCLnsLSirANrZFkZpSvJ6WBM/VWZNAB053qbWLRSeJQ=;
        b=SDRVsbBEba4/1xZEakpe30lqmFSdjuNmoyL+qrLSCfU7O4Pf/M6aVyKI1utHy+acrA
         QpZMnwLss1CsMghsnzYv5zcHWYIGJTjX8t6B8Sd8v08nKHnopj6eH9IqLJ888NXABly2
         y060eqPV9e39wVz1lMRKkxwWtklIHWTszG1r36BmW9OB4VOMyW5GFyGxasq7R4Bd4sr/
         Eft3Vy5CeJv29t5MBxT1taJFf8UbKyRdeeD8HpZkVRcCV7zkyb72D4s0giIZBJcevhmN
         WL/o+tASPmc41syf8aFoaqpI4/L0ZYgelmIwqi1WLlrgbJPEk/uRQFqGBeBx+ftglLiy
         TCCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621742; x=1794226542;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mCLnsLSirANrZFkZpSvJ6WBM/VWZNAB053qbWLRSeJQ=;
        b=sTKpw0KdouQtOJ/2aFB7bObbzBj7LOJIIdKhSxZiP40xw/iarPzFRaS8jRAhv6jWc7
         9hf7x21Oh068PvTbzQRfJz43JM7re09o6r25Uo43nQxSyqz32iN9r+P4hi8vo9abxmkR
         fqbaO2AiIzz6py+kwETC3hxt+yPQCfVGr25sDFTma4v1TVtdYD3CyCYdgRLGupBcGRRZ
         Z/KAGAFvZukGIAc56/tOHYy9qzWZplER33CoeeGYFO/gcwNPUNWiuWXWrLxPNFStQQUb
         iVQ9cbRZRylQNF6dF+cBiZMffjsGlZro6PlGU3uyFDwOwS74zdQohVYbrquusbsFMxfL
         N5hg==
X-Forwarded-Encrypted: i=1; AKwUvBzTTJLCG1p/g8WtEhWj6/ZQcB+hO/S85MGiHrdLFeVh7uSGA2I9UkjVkMl2qEba2I8QHEOPVSEhq1eR8kg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLuYkZ0BleHvMjMEg86KcBdTCy+twwrkOxmRMgXSjCfvvi8dOcZ
	YbevyfoYcUYC24VCu4kM8qIIfUBWOAA65dLcHhwUFo3yH2RS7xZVSmZi3fgZso0amfdC62zyxPO
	kPc+0ZJA=
X-Gm-Gg: AYBFou2o8cpXO/MzvWD4r8gKen7M4DxAY0y+HFEVXV2aX8nxa9OkcQ4oFYzQ+LcpN4s
	H3CWS4k8s72TtnZjRQzyTJp8+KYCJrXpVQFRdBzYOdYGa62UsaxlnhwN8A+lVYdhm1PoGjXN9Uy
	z7ddMyrHBtmx1HidOB3g3EDTDr90PgSt0TxgZ/dstTR5TlG6Ju05UFYqAovHZp2jat2EoOyG+RE
	HWcdfr+6zNRsnQVuJ6hiuWaBO/JbpbGPMIUtQFQK47njzKsJbV/CgImSOqyLropKnrayPkUN4cb
	tI+xTt+TeKJVwi3A6vtdjJ4faALnbyc6pTyrJbgFCndzUvQMRBUA6Kx50Nkf1WdqSt/BsfwNpc8
	AXZtVQUFCtEuIlntxUrHQ3rbYu9n5iUecIviIhwUVS/lzdi5g1cgNAHVjGAv6/yAL/B4WuLwBhA
	Ngqm4f8lcrsLIpz1X/4etrxHQ97mhQ6q2RgYzPJpWJOuaKfT10C7WwgyJjDABNHB9g9dt0+1o91
	Lv7J6j/PWA3n4xdGC8D/WP6TDt2Z8isuTGtk3vNHAo0kn50k9q664tRspuLyo70WN1Ioyx5sms6
	5aqQ61LdnMdlFtjAaxKvDrEoWa2PdcHK
X-Received: by 2002:a05:600c:3554:b0:4a1:e7ce:107b with SMTP id 5b1f17b1804b1-4ac150b20eamr237179415e9.2.1793621742230;
        Mon, 02 Nov 2026 04:15:42 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm434974855e9.3.2026.11.02.04.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:15:41 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v3 00/18] perf cs-etm: Per-thread mode fixes and snapshot
 wrap support
Date: Mon, 02 Nov 2026 12:15:14 +0000
Message-Id: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
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
X-B4-Tracking: v=1; b=H4sIANN+6GoC/43QwW6DMAyA4VdBOc+VEwjQapr6HtOEAjhttpF0S
 Yo2VX33Gbhstx7tw/fLvolE0VESh+ImIs0uueB5KJ8KMZyNPxG4kWehUNVYo4Z3M1GCIcHV2xA
 nkzONcKEI+RzJjGDdN2ikRpXGNBZJsHSJxOu18vrG89mlHOLPGp3lst38VsqH/FkCwh51rUvZW
 m3b46fzJoZdiCexBGb1B1UPoopRxKGyIzYo++ofet/OiPR15R/l7RbBajLrjw7F81KTWOIC225
 IHeWpY7nzwXfZfJCHueRGU6t9r5XpsWqOJk67IUwvXLj/AoXO2TWNAQAA
X-Change-ID: 20260605-james-cs-unformatted-per-thread-fix-50e723aa7f0e
To: Leo Yan <leo.yan@linux.dev>, Adrian Hunter <adrian.hunter@intel.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>, 
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnaldo Carvalho de Melo <acme@redhat.com>, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, John Garry <john.garry@linux.dev>
X-Mailer: b4 0.15.2

Fix a few issues with per-thread mode:
  - On nVHE, everything looks like guest trace instead of host
  - Tracing multiple threads didn't really work

After adding a tests for those, it turns out there were some snapshot
bugs not picked up by the other snapshot tests. That showed that the
different snapshot searches for Intel BTS and Arm SPE were inconsistent
and I think all tracers can benefit from using the same pointer fixup
logic, so that gets refactored into the common auxtrace.c. Then SPE can
just share the Intel BTS search as it was obviously copied from it
originally. IntelPT keeps the more advanced duplicate data search, but
in the future that could probably be made the common one and all tracers
would benefit from using it (except maybe BTS if it always has a very
small buffer, but I doubt the overhead of the duplicate search would be
an issue). For now this is more of a refactor rather than behavioral
change so don't do that yet.

Signed-off-by: James Clark <james.clark@linaro.org>
---
Changes in v3:
- Keep the find_snapshot() callback instead of adding
  snapshot_has_wrapped() and monotonic_snapshot_head boolean (Adrian)
- Add auxtrace_record__default_find_snapshot() for the simple search for
  BTS and SPE (Adrian)
- Add auxtrace_record__snapshot_fixup() for any snapshot search
  implementation to use to update the pointers (Adrian)
- Reword UINT64_MAX timestamp comment (Leo)
- Fix disassembly test after rebasing onto exception sample fixes
- Only take 'perf_guest' into account if there is no PIDFMT_CTXTID2
- Improve decoding of old files by hard coding queue 0 for per-thread
- Link to v2: https://patch.msgid.link/20260821-james-cs-unformatted-per-thread-fix-v2-0-00c4fd0701b4@linaro.org

Changes in v2:
- Remove stale "may be reset to -1 in per-thread mode" comment
- Set CPU when queueing auxtrace fragments otherwise
  auxtrace_queues__add_event() overwrites the queue's CPU
- Link to v1: https://patch.msgid.link/20260811-james-cs-unformatted-per-thread-fix-v1-0-90565318f5f8@linaro.org

---
James Clark (18):
      perf cs-etm: Fix nVHE per-thread decoding
      perf cs-etm: Warn for invalid timestamp option
      perf cs-etm: Turn on context packet timestamps in per-thread mode
      perf cs-etm: Use per-CPU queues for per-thread mode
      perf test: cs-etm: Increase window size in disassembly test
      perf cs-etm: Don't drop previous target for kernel samples
      perf python: Expose sample instruction length
      perf cs-etm: Use instruction length in disassembly script
      perf cs-etm: Increase default timestamp generation period
      perf auxtrace: Turn Intel BTS snapshot search into a generic one
      perf arm-spe: Use generic snapshot search
      perf auxtrace: intel-pt: Use common snapshot pointer fixup
      perf cs-etm: Queue partial AUX records
      perf cs-etm: Don't print missing buffers in snapshot mode
      perf auxtrace: cs-etm: Capture wrapped snapshots
      perf test: Allow infinite named_thread loops
      perf test: cs-etm: Add test for per-thread mode
      perf test: cs-etm: Test multiple per-thread threads

 tools/perf/Documentation/perf-test.txt             |   2 +-
 tools/perf/arch/arm/util/cs-etm.c                  |  34 ++++-
 tools/perf/arch/arm64/util/arm-spe.c               | 147 +--------------------
 tools/perf/arch/x86/util/intel-bts.c               | 115 +---------------
 tools/perf/arch/x86/util/intel-pt.c                |  21 +--
 tools/perf/python/arm-cs-trace-disasm.py           |  22 +--
 tools/perf/python/perf.pyi                         |   1 +
 .../perf/tests/shell/coresight/per-thread-multi.sh |  76 +++++++++++
 tools/perf/tests/shell/coresight/per-thread.sh     |  48 +++++++
 .../perf/tests/shell/coresight/raw_dump_stress.sh  |   5 -
 .../shell/coresight/test_arm_coresight_disasm.sh   |   4 +-
 tools/perf/tests/workloads/named_threads.c         |   7 +-
 tools/perf/util/auxtrace.c                         | 145 +++++++++++++++++++-
 tools/perf/util/auxtrace.h                         |  18 +++
 tools/perf/util/cs-etm.c                           | 113 +++++++++++-----
 tools/perf/util/python.c                           |   1 +
 16 files changed, 418 insertions(+), 341 deletions(-)
---
base-commit: 790454475c15508d68ccfc4b023642305100f18f
change-id: 20260605-james-cs-unformatted-per-thread-fix-50e723aa7f0e
prerequisite-message-id: <20261030-perf_cs_etm_fix_non_taken-v3-0-7629b52ab047@arm.com>
prerequisite-patch-id: 4ef889ad751e344ae47c1d75a2a2e6cb2eadf6e1
prerequisite-patch-id: 636b39730334cbc5a76642c070e704ffe178e7be
prerequisite-patch-id: fb58f6daebdf5a194f8aa56ccc4022f932a5a6e5
prerequisite-patch-id: d240c10c6824f8ae6c3f10a1da01226a957f05fb
prerequisite-patch-id: 17b291db261e32dcb0d6f1ab2ed0adb7e0411813
prerequisite-patch-id: 45ae1d523c9e5c8c573309f1dab107a598f3d4f8
prerequisite-patch-id: 39a3eb25b3a45f4481760c25fa270773bcfd94f5
prerequisite-patch-id: 5723a15636c2a28ec40eb6b5c9836d162e971786
prerequisite-patch-id: d18054b586fc38bc832ead185e8c1fbb0ce46f39
prerequisite-patch-id: 6735b192189d7945613458abce3da871cb79b35d
prerequisite-patch-id: 387cb2c6181bef8f45a8fb167e8ef86e4a54ff69
prerequisite-patch-id: 50243a8d1739141aa24aa371a8452d4d2d078a99
prerequisite-patch-id: 2ae6f1e7707ba0c71a0678331b02d738fb25cb3c
prerequisite-patch-id: 1fa0a90cfbc904c4429c1427409125ac44b27aed

Best regards,
--  
James Clark <james.clark@linaro.org>

