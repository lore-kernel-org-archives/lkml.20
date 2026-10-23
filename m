Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.254.200.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792725351;
	b=rGxEOxLNLx2NOKKPt5tifFkzPbgCOZnli6+pObSWdCGgZk9S1j3aPaPOQLKgzklqY9MU
	 vla89PIrw4oNci4jwcvm/WgruMNm9qLJSZYNs2bsq7MIa7MGCMhcNMzLxCQffOFGKUkX1
	 wczxb7U4WHByUU3NMEGoRmsX1yOP6aGjJRNc7qwXkeJKTjYQnbxlLUjQWOgmyCw6Tl9xH
	 vEpI/8mWEQ6CjQ64zHMDjmMWxDkCKQqdaF1IzvKJgiaL8oF6E4sV71qwCeN8yxbErJSCd
	 BsFTpCtdU3na74aGcHhT9hrcKYQU4KrKZHasT+dttG0UzkSYjA2lj6POwCtPhhigNtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792725351;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=/+OBVE/Me7wEWOm6ldjM3ZEGj39Ns2tsxw7jm+cZTw4=;
	b=lEfPN8zg2C+mCQ9JvmYSsTP+avLSwBXH7dN2UPqzU/e7yEf6khOOgU/12FLy50UVvndD
	 v/Jgf6wsV2YQ+tN190t1k/fYTBumRZKxN+//3myNRMqPUP1n+RkpRSCiY7uRCXxZUQ4qN
	 VfSSUlfilf2nPscigGcqMkUKmJUMxRum8Tc12R5bkZ+TZtUOB3p3txEiC36vdHc7+B3ZQ
	 1Uq2yJ8v+Gtqf8VJ3dg89HqtWTpkCpFNWCQA/FZeSGPDhGhN1LRhb42MRoE8R6fSbseVG
	 4fzcKzeAGTcnSzYodLrkLaP86HPDgrIo+owx3rMyYtmp63pDdvaS3mHlOYyQG27+RZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=yIW8yyry;
	arc=none smtp.remote-ip=54.254.200.92
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE308606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:15:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE308606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=yIW8yyry
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1792725315;
	bh=/+OBVE/Me7wEWOm6ldjM3ZEGj39Ns2tsxw7jm+cZTw4=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=yIW8yyryM/IzPS/Dvrbjlzl39uIowJK3JVaOicEBX9/fBqcrd/hAGTE9y8k/nsfhV
	 5o0hfGoIkCeXzFRUWfHXUOPrdSQoEMgGJZ9WpvwyykUYhWpNBaekCzX2QpOcioBuFF
	 2fX/tkOGQ5dG72C+33r1L5mv6luXne8IhDDxRXt8=
X-QQ-mid: esmtpsz11t1792725309ta2dc2b13
X-QQ-Originating-IP: fzUFc1qThgCG/nO0+/karSV+umYCChlVbo/2w+Kkn5E=
Received: from snode5.. ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Oct 2026 11:15:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6793098632900412021
EX-QQ-RecipientCnt: 26
From: Zane Leung <liangzhen@linux.spacemit.com>
To: gregkh@linuxfoundation.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	alexander.shishkin@linux.intel.com,
	suzuki.poulose@arm.com,
	mchitale@gmail.com,
	anup@brainfault.org,
	irogers@google.com
Cc: mike.leach@arm.com,
	james.clark@linaro.org,
	leo.yan@arm.com,
	peterz@infradead.org,
	mingo@redhat.com,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	jolsa@kernel.org,
	adrian.hunter@intel.com,
	alex@ghiti.fr,
	atish.patra@linux.dev,
	andrew.jones@oss.qualcomm.com,
	sunilvl@oss.qualcomm.com,
	liangzhen@linux.spacemit.com,
	zhuangqiubin@linux.spacemit.com,
	coresight@lists.linaro.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 00/24] Add Linux RISC-V trace support via the gtrace framework
Date: Fri, 23 Oct 2026 11:14:41 +0800
Message-Id: <20261023031505.2020925-1-liangzhen@linux.spacemit.com>
X-Mailer: git-send-email 2.34.1
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
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: M8ySnbDbMtGJKj4zvyvI879OdiHX5hCS1xXb7+6QcX4KafcmtH1JY1M+
	7utCrBxLMrrqRI14g8nx5kBrZbh8ghNcJCdIWNomb9YJUYcLqL1pTORjWJfEZDAWnUgy8P5
	nERDNsVCvqZV04H4s8whKsFBOsGDmRCj/wUrInpYPu/YhXDOsrh5EQhZqQSmhTB/qwiwpkN
	BOeIoQ96dBPTrzPhihecRqilOtUH6ii+NHSVqhj74MhyNv0GlMoKvshTfucXiS0rwveP2bv
	Rh5qonarFI/c32pnZUOK73OcoeMtd+bx+lQpOflj5h77SfQvEQK6QYSUFzvuWFor3dnKBIr
	nWkDAwqCVN+H2KZZEqS2G+qUaK4CvPDqwas5je8cVy3O+Bzf/2eYRXVcSndo2xPdu9vzP3Q
	lA29VA62BIhpyS7efoMzpniMRG7EgsO+k0kHAcd2NG82TuSbeLw3FYW6QLHwxRKXd1/x4KK
	4MvBtXDUVgbzwVSOdpq1KqvEo9aau9agroxj7eMkE5U5iHhI2mMCOyk/w7Y5wQdhZQivQXn
	PJTzaMI1MD1rw7ODEgOC01Y6czyF6BuUaxXVzKTdyykpd0CjeXmtwJtiuP2+JhIbaOWF2r4
	6KnBajTMK/D4W2YJKuemLPPbkO0b9YmayXPJpPMkn/hVVAolNtwumYEqD/B8CIq8ZLYlFt5
	j/XxQNAZzcUexSIVk96+nTxVsVoI0WIeR3A6t0uOJGQclHlIMegYhflDPCW85Zjktp93nyK
	2pEAFzrCteyV8yE64tA6Y0rAvkkgGRwczQX4Gp8SzVfAgNkF1+CAEAKVfbDIv2xZGWooVEM
	KHhaAVM1DBEtckNj8/rR6yB8CwylvhD/PY5kNucQ7gfyG4aCDDslIKZRfjwm9uiDcTJERk8
	PAJq7NHM/8nxByQOWD3yjUfJGagF0wcKf4BIwzeGGufnNQfYwhnrdVvvPhJPntKPbL3/sIY
	okXmmkHH7T+OZCRa33tlv53TTfWkJkyUXRLjpMhOaFkQIpu63czhq+V/txXcZuTSAxF5OAD
	Q7WHdSt7/bGQZvM1r9ri0vLiM7CAFJ31kv7ooXcgHA7LQZe4lJjGQVcvw+xYja06d6huYmh
	OaUSDKNg6+d
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

This series adds Linux RISC-V trace support via the generic hardware trace
(gtrace) framework [1].  The RISC-V trace encoder, funnel, ATB bridge, and
timestamp components are implemented as gtrace components, and the CoreSight
funnel and TMC (ETB/ETF/ETR) are likewise re-implemented as gtrace components
so that they can be composed with the RISC-V components into a single trace path.

This work supersedes the earlier CoreSight-based RFC [2]. Instead of forcing
the RISC-V trace IP to conform to the CoreSight device, this series shifts
the topology onto the gtrace framework to achieve cleaner architectural
decoupling and shared data paths.

The series includes:

- gtrace sysfs support, exposing per-component attributes (control,
  features, and timestamp) for configuration and validation
- gtrace component drivers for the RISC-V trace encoder, funnel, ATB
  bridge, and timestamp components
- gtrace component drivers for the CoreSight dynamic funnel and TMC
  (ETB/ETF/ETR), built on top of the CoreSight platform core APIs
  (CLAIM/device registration) re-implemented as gtrace components
- perf PMU support: gtrace event format attributes, per-event configuration
  parsing, and an AUX flag marking CoreSight-formatted trace data
- perf tooling: a Nexus (N-Trace) decoder and a gtrace AUX decoder that
  synthesizes branch samples, including machine-mode instruction access

Verification on K3 SoC:
The device tree follows [1], with only the compatible properties changed for
the gtrace components.

# perf list pmu
  gtrace//                                          [Kernel PMU event]

# perf record -e gtrace// --per-thread uname
[ perf record: Woken up 1 times to write data ]
[ perf record: Captured and wrote 1.946 MB perf.data ]

# perf script
uname  767863          1                          branches:  ffffffff80d18b04 gtrace_poll_bit+0x34 ([kernel.kallsyms]) => ffffffff80d18b12 gtrace_poll_bit+0x42 ([kernel.kallsyms])
uname  767863          1                          branches:  ffffffff80d18b4e gtrace_poll_bit+0x7e ([kernel.kallsyms]) => ffffffff80d18b6c gtrace_poll_bit+0x9c ([kernel.kallsyms])
uname  767863          1                          branches:  ffffffff80d1c17a rvtrace_encoder_start+0x112 ([kernel.kallsyms]) => ffffffff80d1c196 rvtrace_encoder_start+0x12e ([kernel.kallsyms])
uname  767863          1                          branches:  ffffffff80d18782 gtrace_path_start+0xbe ([kernel.kallsyms]) => ffffffff80d18702 gtrace_path_start+0x3e ([kernel.kallsyms])
uname  767863          1                          branches:  ffffffff80d18712 gtrace_path_start+0x4e ([kernel.kallsyms]) => ffffffff80d18724 gtrace_path_start+0x60 ([kernel.kallsyms])
...

In per-cpu mode, correlating trace data with the running task requires
the encoder to emit a context ID.  This depends on writing the task PID
to the RISC-V scontext CSR on context switch [3].

[1] https://lore.kernel.org/all/20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com/
[2] https://lore.kernel.org/all/20260414034153.3272485-1-liangzhen@linux.spacemit.com/
[3] https://lore.kernel.org/all/20240329-dev-maxh-lin-452-6-9-v1-0-1534f93b94a7@sifive.com/

Zane Leung (24):
  gtrace: Move connection release into component unregister
  gtrace: Initial implementation of gtrace sysfs framework
  gtrace: Drop trace format field and helper function
  gtrace: Add RISC-V trace encoder sysfs support
  gtrace: Introduce some PMU format attributes
  gtrace: Replace owner PID with perf_event pointer in gtrace_path
  gtrace: Parse RISC-V Trace encoder config from perf event
  gtrace: add perf symlink support for gtrace components
  gtrace: Add port-level start/stop driver callbacks
  gtrace: Add RISC-V trace funnel driver
  gtrace: Add RISC-V trace timestamp support
  gtrace: Add RISC-V trace ATB bridge driver
  gtrace: Add CoreSight platform core APIs
  gtrace: Add CoreSight funnel driver
  gtrace: Only copy AUX data from the path sink
  perf: Flag whether gtrace AUX data carries CoreSight framing
  gtrace: Unify default sink selection across CPUs in perf setup
  gtrace: Add sink-specific buffer alloc/free callbacks
  gtrace: Add setup_sysfs_buf callback to setup sysfs sink buffer
  gtrace: Add CoreSight TMC driver support
  perf tools: riscv: making gtrace PMU listable
  perf tools: Add Nexus RISC-V Trace decoder
  perf tools: gtrace: Record and parse trace encoder metadata
  perf tools: gtrace: Add AUX trace decoder and branch sample synthesis

 .../hwtracing/coresight/coresight-tmc-etf.c   |    1 -
 drivers/hwtracing/gtrace/Kconfig              |   70 +
 drivers/hwtracing/gtrace/Makefile             |   12 +-
 drivers/hwtracing/gtrace/coresight-funnel.c   |  430 ++++
 drivers/hwtracing/gtrace/coresight-platform.c |  279 +++
 drivers/hwtracing/gtrace/coresight-tmc-core.c | 1111 ++++++++++
 drivers/hwtracing/gtrace/coresight-tmc-etf.c  |  573 +++++
 drivers/hwtracing/gtrace/coresight-tmc-etr.c  | 1888 +++++++++++++++++
 drivers/hwtracing/gtrace/coresight-tmc.h      |  469 ++++
 drivers/hwtracing/gtrace/coresight.h          |  212 ++
 drivers/hwtracing/gtrace/gtrace-core.c        |  165 +-
 drivers/hwtracing/gtrace/gtrace-perf.c        |  122 +-
 drivers/hwtracing/gtrace/gtrace-sysfs.c       |  452 ++++
 drivers/hwtracing/gtrace/rvtrace-atbbridge.c  |  153 ++
 ...trace-encoder.c => rvtrace-encoder-core.c} |  182 +-
 .../hwtracing/gtrace/rvtrace-encoder-sysfs.c  |  323 +++
 drivers/hwtracing/gtrace/rvtrace-encoder.h    |   61 +
 drivers/hwtracing/gtrace/rvtrace-funnel.c     |  220 ++
 drivers/hwtracing/gtrace/rvtrace-funnel.h     |   29 +
 drivers/hwtracing/gtrace/rvtrace-platform.c   |   26 +-
 drivers/hwtracing/gtrace/rvtrace-ramsink.c    |   11 +-
 drivers/hwtracing/gtrace/rvtrace-timestamp.c  |  336 +++
 drivers/hwtracing/gtrace/rvtrace-timestamp.h  |   44 +
 drivers/hwtracing/gtrace/rvtrace.h            |    5 +
 include/linux/gtrace.h                        |  161 +-
 include/uapi/linux/perf_event.h               |    1 +
 tools/arch/riscv/include/asm/insn.h           |  645 ++++++
 tools/include/uapi/linux/perf_event.h         |    1 +
 tools/perf/arch/riscv/util/Build              |    1 +
 tools/perf/arch/riscv/util/auxtrace.c         |  203 +-
 tools/perf/arch/riscv/util/pmu.c              |   19 +
 tools/perf/builtin-script.c                   |    4 +
 tools/perf/util/Build                         |    1 +
 tools/perf/util/gtrace-decoder.c              | 1283 ++++++++++-
 tools/perf/util/gtrace.h                      |   30 +-
 tools/perf/util/rvtrace-decoder/Build         |    2 +
 .../util/rvtrace-decoder/rvtrace-decoder.c    |  423 ++++
 .../util/rvtrace-decoder/rvtrace-decoder.h    |  122 ++
 .../rvtrace-decoder/rvtrace-ntrace-decoder.c  |  910 ++++++++
 .../rvtrace-decoder/rvtrace-ntrace-decoder.h  |  124 ++
 tools/perf/util/symbol_conf.h                 |    2 +
 41 files changed, 10926 insertions(+), 180 deletions(-)
 create mode 100644 drivers/hwtracing/gtrace/coresight-funnel.c
 create mode 100644 drivers/hwtracing/gtrace/coresight-platform.c
 create mode 100644 drivers/hwtracing/gtrace/coresight-tmc-core.c
 create mode 100644 drivers/hwtracing/gtrace/coresight-tmc-etf.c
 create mode 100644 drivers/hwtracing/gtrace/coresight-tmc-etr.c
 create mode 100644 drivers/hwtracing/gtrace/coresight-tmc.h
 create mode 100644 drivers/hwtracing/gtrace/coresight.h
 create mode 100644 drivers/hwtracing/gtrace/gtrace-sysfs.c
 create mode 100644 drivers/hwtracing/gtrace/rvtrace-atbbridge.c
 rename drivers/hwtracing/gtrace/{rvtrace-encoder.c => rvtrace-encoder-core.c} (55%)
 create mode 100644 drivers/hwtracing/gtrace/rvtrace-encoder-sysfs.c
 create mode 100644 drivers/hwtracing/gtrace/rvtrace-encoder.h
 create mode 100644 drivers/hwtracing/gtrace/rvtrace-funnel.c
 create mode 100644 drivers/hwtracing/gtrace/rvtrace-funnel.h
 create mode 100644 drivers/hwtracing/gtrace/rvtrace-timestamp.c
 create mode 100644 drivers/hwtracing/gtrace/rvtrace-timestamp.h
 create mode 100644 tools/arch/riscv/include/asm/insn.h
 create mode 100644 tools/perf/arch/riscv/util/pmu.c
 create mode 100644 tools/perf/util/rvtrace-decoder/Build
 create mode 100644 tools/perf/util/rvtrace-decoder/rvtrace-decoder.c
 create mode 100644 tools/perf/util/rvtrace-decoder/rvtrace-decoder.h
 create mode 100644 tools/perf/util/rvtrace-decoder/rvtrace-ntrace-decoder.c
 create mode 100644 tools/perf/util/rvtrace-decoder/rvtrace-ntrace-decoder.h

-- 
2.34.1

