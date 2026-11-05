Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879121;
	b=MZpmWJP4VNdnTmy/bIK0JmGdC62pbb7LhA86xyj/Vfqlcd60Uudog9Yf4AoXM+rhMB8+
	 l7wMXFsGgnlQlQELzIoT9N3DCRpB9WcC7KaJoVvcFnk7B/pwAnhuPvpPfg+3qAXjJfUK+
	 LqDe/n2z8rozVat/m3D6CZpIow9JdCn3s4l53LAUrKry0RBpEv3Sj70ItGnOjx7tFym0P
	 DIJOnmTHAkVGpWd6M//LeABmPbZjSodx1/DwD1T/suetObG6LoI2P2iOSPejoQ/ZyxLjQ
	 M4jkVKXgrTgt2GH59EYEXQ1GyBBRlcSdSFDpLszOh2y8hLfCbpncyqkjHT3Lyt8gg7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879121;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=wkXcoerwl72ld/nPiXesFgETWpZwTzTrpPsVrFQKphs=;
	b=3bOEMexwqGa1MeOl2gR6JCbGnKorimxR/HZtgSJgHFMUzfAokn9kqwFoqL4HYNhsqNNa
	 VHRtwdie3In6rZNPE3wj2tm0bsPkPir05eOLXBkdTNP81Ndy0W9KZx+st0pIx9gTuZ17R
	 gLBNaItFPeee6dDvgJeyhAkq/pX2TpNCAYytlbvujh3vXHXzt7UHRPjgD2jCh3DaZQrdg
	 Dkf6y02TAknO3sQZLKzquKM4C1bgB6G+iEElNXoZOxZDVm/wF6OFrbMDih80NVl881ljR
	 EPYMvsGvv7imShtUw7MfvxFz4WmwewsUj17ZRIvWmznnrVKTNxOvteoaVJmW/JcpGbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=C79oBavf;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCA1606EE9A
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:45:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BCA1606EE9A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=C79oBavf
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e4831c028so1602725f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793879119; x=1794483919; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wkXcoerwl72ld/nPiXesFgETWpZwTzTrpPsVrFQKphs=;
        b=C79oBavfJTQ96/SeVgPtQrB4HRfRcODb+0y2si6NV53CzbOeTC2AdFCUJ+tfZbL9x6
         p6DVB0STsUxd/IR2HoV05cSPgdXc+1DyodbAuHzCQDDp+9kRfXdbZpvKRea+xm0cio8e
         Pkkm5ABHvSQ2sgLyKXKWXYJT/nw7rPG3yUDUoJvWcpCv0okIKTDg/UJClh9PZVKSbqmD
         M8uj03DlpEYLavf4IITIfKq+D3lkXjM+AfumBNThJVARxHJHjBwc27hnBOd1tJdpG8Fb
         M4lqwcJli1qeW3CDJAF7g8ZQAqX6UGMf8Y3t505NnhKVsdsAw1v5YYTlWMCEnUQbTuw3
         BRKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879119; x=1794483919;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wkXcoerwl72ld/nPiXesFgETWpZwTzTrpPsVrFQKphs=;
        b=mXqRyU8hoTZ8IEyZLrMEHYeXEGKsaGSAo2z9KrTZLZT9znShQJEa88s5T7W84rXQkG
         Xo4jLCOQK5eudFQqYJAcA2qKhX33aR8imvRjKzMrVNuVxyUt6n8u8S0U3/t3yWha5QCC
         60+sXotQnqvMCyzWWm0fkga8BHUNOdFFTtxapURTcoWmvckMhCHuMZaSTgwuJpmzulpG
         i4q0sbk3uDGBQqcs3jsyem3OK98yEcHNXOE04tk5yCB8/DOTXz9/dO6ngEvOuUnKmvk6
         u77nOrdWYlr2DAVuTfI5Fkfvv8MfbFqdPNuOSGePzQOcfH78eQNn+WeXKZTeyG928NvK
         6qRA==
X-Forwarded-Encrypted: i=1; AKwUvBzEAUD38e40AhHM/wf3zrWkovnMcCX9ldhb0NUfrOt0589ta/dii4MCM7mADR3pxUjhiGe2x5IrpXCtQ9c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IsCZcLvcMju0bUm+idDK/2+vyngFCCrv5ylgSeMpN9tq/7yiT
	Kw6YesUfMLLogcJgcjZKhK8GVgK/ADep/vXuLVwGxqN/PGQ5Nf3ZH8rLyZvZGLENrrQ=
X-Gm-Gg: AYBFou1oqEUObnnT7PYtmKKg1iurXsMU0WbcAgZlLO4RgHV4PjxSIEwPgzcJtmzg3Az
	7xfmTFVqtIQK6vnCrS5W2jiLE2y5aja6qy/lurOxGMqEBX01fs6ZmIpqrRKM7vb32TGJnXUu1Rw
	9Z2Nf2QYMUSul9bakf9vBceYaiSGb7jFfjmlajr7kn48T7lWuWKjqpnYr/8W6hIKQaGcgSuB5NC
	IzRga8vt5DU/L+FpZy9FNTNeWkjVWjZvh5wHNVV4+R+g6ByNRdYeg2qCCKKwWQKvIVwhD7mrPpW
	58Cvshf9rvqTp0B5fDo+nOC81JEmT1IJlJsqDuke6In67QF0k5GFUl0qzMwvfGZepketzn5E96g
	BzK9j5Gjd3oFa1lYrLkb3JQsydCgrZmMukp6vP73uObQ/hqn5abu3xoh81K78Tk+6/yvc/xdj82
	sd9JNjaDyyjpLvUH3Ul/Qo5gC2aiPEAYm0gZdajBFTptZeNLDTuoP7UJ8nhOPSTXpKISRAsgUtd
	W5PyK7MIPQg4SNDir4eLJINNqsfY0+7jubcFmiCaFFrpFx1bPzDxhh+EEWFV7aaNzuZRquqIpQn
	RAuxvJxJPOLcrWn1YJ8qPBywNksm79Zp
X-Received: by 2002:a05:600c:19d2:b0:4a4:4d57:8487 with SMTP id 5b1f17b1804b1-4ac1737c51dmr404872225e9.5.1793879118947;
        Thu, 05 Nov 2026 03:45:18 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm56679525e9.5.2026.11.05.03.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:45:18 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v4 00/19] perf cs-etm: Per-thread mode fixes and snapshot
 wrap support
Date: Thu, 05 Nov 2026 11:44:48 +0000
Message-Id: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
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
X-B4-Tracking: v=1; b=H4sIADFs7GoC/43QzUrEMBSG4VspWZvhJG36M4jMfYiUJD2ZRm0yJ
 pmiDHPvpi2I4qbLcxbPC9+NRAwWIzkWNxJwttF6l4/qoSB6lO6M1A75Jhx4DTUI+ionjFRHenX
 Gh0mmhAO9YKBpDCgHauwnFYANL6VsDCDJ0iVgfq+V55d8jzYmH77W6MyW7+a3jO3yZ0aBdiBqU
 bLWCNOe3q2TwR98OJMlMPNfKN+J8owC6MoM0ABT1T+0/EEZA74PLTM6KK1A85apTv1B79s2AT+
 uefi0DUSyGuU6/LF4XGtQwgKbXsce09RnuXfe9Um+odsaTc07JbhUUDUnGaaD9tNTLty/AUgmt
 L7iAQAA
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

This series depends on:
https://lore.kernel.org/linux-perf-users/20261030-perf_cs_etm_fix_non_taken-v3-0-7629b52ab047@arm.com/

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
Changes in v4:
- Change test snapshot size to 128K for 64K machines
- Put patchset depencency in cover letter text
- Link to v3: https://patch.msgid.link/20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org

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
James Clark (19):
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
      perf test: cs-etm: Increase snapshot size

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
 .../shell/coresight/test_arm_coresight_disasm.sh   |   8 +-
 tools/perf/tests/workloads/named_threads.c         |   7 +-
 tools/perf/util/auxtrace.c                         | 145 +++++++++++++++++++-
 tools/perf/util/auxtrace.h                         |  18 +++
 tools/perf/util/cs-etm.c                           | 113 +++++++++++-----
 tools/perf/util/python.c                           |   1 +
 16 files changed, 420 insertions(+), 343 deletions(-)
---
base-commit: 28ef93607ad52acc8f8be25199711153ba11a0c2
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

