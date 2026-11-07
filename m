Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794019190;
	b=oqVpMp6umtPSh0Qdr//edTWLp1pbsYBtuEy6jg61jhd9QzFeT0FGQInaUxaNwDZF9+Wz
	 r+4p4UFvChokHtLtqhpFltysko+k3jWpb9OTU4+9SdkDxLPxnuQxRcxP3gOx1s2tWcLtp
	 ccHXMY0IwMIJYhSNVXjZFEL9QwPTZOWrOFZuewa2fLXz2qJ5aJjpUtSy3V8SkVgSxAEsX
	 0LbbtHIl1vvDnC7BiepNZxfaOMQa8DzaCAXdoqp+suhQhb9mo2dczk1oizyQKwVCaf5Ld
	 4CXHyO9oi7g2BT6NFh6p/hkK9PAH8nZN+b/PDM1vuD6eG+f4voByPVQpSHLcvM4cuQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794019190;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=L420166GSS4TE+K47OptRNcFOTisOIHTM/2QMseJ/eQ=;
	b=ocuVQtm+PR5k0N/y8+bukfpUZTCbbi01Xvu3T7gmP0MHwVdcArQxFLVok79rP4I47H3E
	 zUPfBC6PFzR9sznxA3KSeRvdBWugvx5nsuuBV217ZvhaIqEr0yvxF9f+USUMasDRnzUEp
	 Sdtew+E1TYnMrPX6tiMRGvs1tKJ7SYtLGftjtCTNguh5AlkANYrDX4mcbvE3ALQQrI+1U
	 z8MhkYVeQu7M/lUeGNULH1mM+pkTKKnyS8MQsE9+wEHx/hzIUmrKuek74fjTunsW/eRXS
	 Zg6NaXm9iOSBmWS1uBkKsW8IaoMULsdZPky01vja3LsEnR3tjWngwuXFFP+eV2bU9tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lbXY0gAz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JNPueRbZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0AF606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 02:39:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE0AF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lbXY0gAz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JNPueRbZ
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A72Xwp71237750
	for <linux-kernel@vger.kernel.org>; Sat, 7 Nov 2026 02:39:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=L420166GSS4
	TE+K47OptRNcFOTisOIHTM/2QMseJ/eQ=; b=lbXY0gAz5PjhZ53/zvhjXNUzRVe
	2M8GWGe8UczDg43WWUJiAcU22wyjOmftVZWAKG/fBBUx6RC2ZGJdQW3zl20ggfIv
	jptojMcEOJJkSiicXOzxyARK0CjvbSqTYi+u3W5FtsBXHTygxuYYyIn+Hb0GWGik
	OUzC7GcOR/Pury2piCPxQeGZr/KFSXlNJdz/j00AzbYm085PJY1og9odi1OFxaJk
	4dNQhQEFGKqcZnxGD9CPfgqtcSu52bSU6cpcBgKDmki5xTBRzuqSjEfWPFLoo63G
	DLWGWbNaP2C7TaBPQgHdHyNjv41eQPUq9QOaAinxsUDhE5bouNUB/JXXAAQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsuagr0ey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 02:39:48 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3700be873ebso307444eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 18:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794019188; x=1794623988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L420166GSS4TE+K47OptRNcFOTisOIHTM/2QMseJ/eQ=;
        b=JNPueRbZT8SL+ynqbJF1FgUeQJ1iulUCqfFfl2bCT4TRKRje8VdmO3hm2pzQB0IC0x
         gsfeY2OJk2t2G8AGZNg2QMdD2DcfdPTQNM6urUlrHvzOu15dip65UACrtBPrgyf1pmEe
         TDHjZQUCxnWne/8UBW5vn534EpXh1C4WavGkwLFQh9Xo9nOMSF7h/SI1M1X18atJ2GMK
         TofGrlJP5iikBqW0wecj74WlLZ1GmWaYvGqTaBR0aGqhiCWBzAyI4N7pRiXmnlr6RLwh
         keNiXYRwnclMyXeZpzj9YATjkR7J/2vLyXRpbAG9YAKdnZ3b4YTyRsunZXX4KLHCRSMO
         TxwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794019188; x=1794623988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L420166GSS4TE+K47OptRNcFOTisOIHTM/2QMseJ/eQ=;
        b=SwCPekhTU9RAr/AdL5sE77G/mwLXiC5kuG0ve0vEC3dc6CX59gzgDhQTDFazp5lEvH
         kRK9IBCsIORWWaRJP9N18eonRulZCZUsJydSLFdrpNiC4/XTZSesiA+blooZoxB4dT+o
         hAMoZWpG90iE0NjOme9Dkj8VqwdFbstEGrTuPLIcPgHpqUEKAhW/jRD4qIGupyk/MqgZ
         88Shwfdw8DdKxYFuLE+TcPhCsGY+W3/XnkMabZRGlbcGQmah+ixKnU+uTZgCCaUA+3Mt
         IGx66GA7cr/cGw5LbSfkT+uBrOgjRb4lSNk66QseOlPegOnUOOe9jLS48VJy0N+gcZ7k
         76Ug==
X-Forwarded-Encrypted: i=1; AL+hErFsI1+JTmVHZPbb1i/Xn4wB23wS4m7iGMzTM8lfpz51545HQUVUW8rpATaDycVzZyrP+W+QmuKoM5pgW+Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9POIaJKl/INAxrI/4zj1l8khN//ujqdf4YlQuCSVjX9PUs9ZUs
	KdFgmS4pzJh1yDHasJVsIULXzD2fsh93fwTeSdJcQWCIoE1PPtCzTYwOXfXaNb6pnp0czZAeMaK
	xdWVh3JTeSzGVoXBCxU8uyifvvc3aizSZ1hsGbv7aRsp41649ewdWWS2uLUht751PAy8=
X-Gm-Gg: AYBFou3ClM/YrVMvIVkymolzo4yLJIxH5SXG4F/w5HpjB1tItwzJy0X/Fj6nrrsSPTH
	Y8M6zgV4+Nf1vH+QsABlSLL8c5vdzZ2X0HaM1SOhAktPLvy7ZpdbDexbwCY1QPMMVAvE0AMxkgW
	j/e1nai48KDafGk7dlF1YBXe40rUWby6FagjB87R3RUEJfraP2Jj3abln9R/fns/dB5m+lKtPC+
	7QA3TX1EBIO7PPpfLgc1TcppmDNJAOn+qFpJxBlz9PHuCPrsHl4YxLiX+83GNQw/sDhMX2386rS
	7t6xUlkG9lvDYUT/RY5Sgpx3eX/fillevC1T1mRHba/xV0bdR3SE0pBG+L7qqFShm/QKJLpcZ60
	SvzvV4ZyHfwGscymbzFV6Jgs8+35kVSzqArRGPqOrfUhWOTLd/G8JaluOuwMpwpWpPWQ4a+HpVp
	LiO4rR2QtAHoN3PExX5NlXFtX0/jGFspeT0GAV1/p5E6n1xoJKMBiZGx44OZ2cMnxIlhb/iYHMF
	g==
X-Received: by 2002:a05:7301:7c0b:b0:370:7fee:497f with SMTP id 5a478bee46e88-370f8269e21mr1593330eec.26.1794019187466;
        Fri, 06 Nov 2026 18:39:47 -0800 (PST)
X-Received: by 2002:a05:7301:7c0b:b0:370:7fee:497f with SMTP id 5a478bee46e88-370f8269e21mr1593255eec.26.1794019186655;
        Fri, 06 Nov 2026 18:39:46 -0800 (PST)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faac86a96sm11069040eec.29.2026.11.06.18.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:39:46 -0800 (PST)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alex@ghiti.fr>, Jesse Taube <jtaubepe@redhat.com>,
        Oleg Nesterov <oleg@redhat.com>, Kees Cook <kees@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        James Clark <james.clark@linaro.org>, Shuah Khan <shuah@kernel.org>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v8 2/8] riscv: Add breakpoint and watchpoint test for riscv
Date: Sat,  7 Nov 2026 08:09:11 +0530
Message-ID: <20261107023917.40606-3-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107023917.40606-1-himanshu.chauhan@oss.qualcomm.com>
References: <20261107023917.40606-1-himanshu.chauhan@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA3MDAwOSBTYWx0ZWRfX9dClA+Mev2A4
 O1xcZJ37cwUBgET1QJbp3gq84oBZxYfyuQovKKdblNJ8sBugjOEhV20T1LJXG2nOcCMsb7VYE0H
 +Nt78p0GXY1nhyJ+Yv8eKwTe2w7oUmhCLQ5Mw8olyGfXLgGpPdFZZ5Uaiv4aQBlZjfGRuyUcSQS
 fk01YrzUCGjhvlNv0pthjMBAE2XOUeB4TpB51yJjPUt7MzwpUT6mlS4UScO3Qb1D8ybGU2GAsqg
 VnR+4EacXc1qfI3IpB3BDsRsHBswvj2mow33e7mEDiNRJojS5E1rwg7z+2n/Y5KQ5UdfbdItcaJ
 9Wb5VSzYgQfxRS3zRtsiQUUxRCz5be6GQyIy1U1rnUxwJYVlGJPXLFVZNlF4/3YTH/szGvp45Fn
 zy6xL1XsdarVW8jmM9wznpHtsqX//IiBKeSA1UgzxtVN1MLxz+kvkxH7TTQsVgQRf+GwGXCJSsD
 HZYDrWTN8UuicMDtd8w==
X-Proofpoint-ORIG-GUID: O7JuTC-FAQaEssuXrK1gpBpzG68p0omM
X-Proofpoint-GUID: O7JuTC-FAQaEssuXrK1gpBpzG68p0omM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA3MDAwOSBTYWx0ZWRfXzu+OAZL5V2WA
 VQ3TZWb6PI5FdKKhtBF5OTmEbUAFbjcdpAbkfo0vX9o9L2aLYgNaJb1oY9aIyFCdRDZVh0NwbEL
 VDfvj0mAFe1Pv1BQ7mccctFCT0/Ny7g=
X-Authority-Analysis: v=2.4 cv=V8LoQuni c=1 sm=1 tr=0 ts=6aee8f74 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=2Ls8_GQA_paks6FoIQwA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-07_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611070009

Add self test for riscv architecture. It uses ptrace to ptrace framework
to set/unset break/watchpoint and uses signals to check triggers.

Also add $(KHDR_INCLUDES) to CFLAGS for the riscv test build so the
UAPI headers exercised by the test can be located during compilation.

Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
---
 MAINTAINERS                                   |   1 +
 tools/testing/selftests/breakpoints/Makefile  |   8 +
 .../breakpoints/breakpoint_test_riscv.c       | 215 ++++++++++++++++++
 3 files changed, 224 insertions(+)
 create mode 100644 tools/testing/selftests/breakpoints/breakpoint_test_riscv.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 73b69e8dcba1..baf97e8c39f6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24171,6 +24171,7 @@ F:	arch/riscv/include/asm/perf_event.h
 F:	arch/riscv/kernel/hw_breakpoint.c
 F:	arch/riscv/kernel/perf_*
 F:	drivers/perf/
+F:	tools/testing/selftests/breakpoints/breakpoint_test_riscv.c
 
 RISC-V SPACEMIT SoC Support
 M:	Yixun Lan <dlan@kernel.org>
diff --git a/tools/testing/selftests/breakpoints/Makefile b/tools/testing/selftests/breakpoints/Makefile
index 0b8f5acf7c78..1f28f50e8f85 100644
--- a/tools/testing/selftests/breakpoints/Makefile
+++ b/tools/testing/selftests/breakpoints/Makefile
@@ -12,5 +12,13 @@ ifneq (,$(filter $(ARCH),aarch64 arm64))
 TEST_GEN_PROGS += breakpoint_test_arm64
 endif
 
+ifneq (,$(filter $(ARCH),riscv riscv64))
+TEST_GEN_PROGS += breakpoint_test_riscv
+endif
+
 include ../lib.mk
 
+ifneq (,$(filter $(ARCH),riscv riscv64))
+$(OUTPUT)/breakpoint_test_riscv: CFLAGS += -static $(KHDR_INCLUDES)
+endif
+
diff --git a/tools/testing/selftests/breakpoints/breakpoint_test_riscv.c b/tools/testing/selftests/breakpoints/breakpoint_test_riscv.c
new file mode 100644
index 000000000000..a8a94a788142
--- /dev/null
+++ b/tools/testing/selftests/breakpoints/breakpoint_test_riscv.c
@@ -0,0 +1,215 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Qualcomm Technologies, Inc.
+ *
+ * Author: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
+ */
+
+#define _GNU_SOURCE
+#include <linux/perf_event.h>    /* Definition of PERF_* constants */
+#include <linux/hw_breakpoint.h> /* Definition of HW_* constants */
+#include <sys/syscall.h>         /* Definition of SYS_* constants */
+#include <unistd.h>
+#include <stdbool.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <sys/ioctl.h>
+#include <time.h>
+#include <fcntl.h>
+#include <signal.h>
+#include <sys/mman.h>
+#include <string.h>
+#include <semaphore.h>
+#include <errno.h>
+
+static int gfd;
+sem_t ib_mtx, wp_mtx;
+static int bp_triggered, wp_triggered;
+static int test_func_sink;
+static const int wait_timeout_sec = 5;
+
+int setup_bp(bool is_x, void *addr, int sig)
+{
+	struct perf_event_attr pe;
+	int fd;
+
+	memset(&pe, 0, sizeof(struct perf_event_attr));
+	pe.type = PERF_TYPE_BREAKPOINT;
+	pe.size = sizeof(struct perf_event_attr);
+
+	pe.config = 0;
+	pe.bp_type = is_x ? HW_BREAKPOINT_X : HW_BREAKPOINT_W;
+	pe.bp_addr = (unsigned long)addr;
+	pe.bp_len = sizeof(long);
+
+	pe.sample_period = 1;
+	pe.sample_type = PERF_SAMPLE_IP;
+	pe.wakeup_events = 1;
+
+	pe.disabled = 1;
+	pe.exclude_kernel = 1;
+	pe.exclude_hv = 1;
+
+	fd = syscall(SYS_perf_event_open, &pe, 0, -1, -1, 0);
+	if (fd < 0) {
+		printf("Failed to open event: %llx\n", pe.config);
+		return -1;
+	}
+
+	fcntl(fd, F_SETFL, O_RDWR | O_NONBLOCK | O_ASYNC);
+	fcntl(fd, F_SETSIG, sig);
+	fcntl(fd, F_SETOWN, getpid());
+
+	ioctl(fd, PERF_EVENT_IOC_RESET, 0);
+
+	return fd;
+}
+
+static void sig_handler_bp(int signum, siginfo_t *oh, void *uc)
+{
+	int ret;
+
+	bp_triggered++;
+
+	printf("Breakpoint triggered!\n");
+	ioctl(gfd, PERF_EVENT_IOC_DISABLE, 0);
+	ret = sem_post(&ib_mtx);
+	if (ret) {
+		printf("Failed to report BP success\n");
+		return;
+	}
+}
+
+static void sig_handler_wp(int signum, siginfo_t *oh, void *uc)
+{
+	int ret;
+
+	printf("Watchpoint triggered!\n");
+	ioctl(gfd, PERF_EVENT_IOC_DISABLE, 0);
+	wp_triggered++;
+
+	ret = sem_post(&wp_mtx);
+
+	if (ret) {
+		printf("Failed to report WP success\n");
+		return;
+	}
+}
+
+/*
+ * Keep a real instruction address for HW execute breakpoints: prevent inlining
+ * and force a visible side effect so the function can't be optimized away.
+ */
+static __attribute_noinline__ void test_func(void)
+{
+	test_func_sink++;
+	__asm__ __volatile__("" : : "g" (test_func_sink));
+}
+
+static int trigger_bp(void)
+{
+	struct sigaction sa;
+
+	memset(&sa, 0, sizeof(struct sigaction));
+	sa.sa_sigaction = (void *)sig_handler_bp;
+	sa.sa_flags = SA_SIGINFO;
+
+	if (sigaction(SIGIO, &sa, NULL) < 0) {
+		printf("Failed to setup signal handler\n");
+		return -1;
+	}
+
+	gfd = setup_bp(1, test_func, SIGIO);
+
+	if (gfd < 0) {
+		printf("Failed to setup breakpoint.\n");
+		return -1;
+	}
+
+	ioctl(gfd, PERF_EVENT_IOC_ENABLE, 0);
+
+	test_func();
+
+	ioctl(gfd, PERF_EVENT_IOC_DISABLE, 0);
+
+	close(gfd);
+
+	return 0;
+}
+
+static int trigger_wp(void)
+{
+	struct sigaction sa;
+	unsigned long test_data;
+
+	memset(&sa, 0, sizeof(struct sigaction));
+	sa.sa_sigaction = (void *)sig_handler_wp;
+	sa.sa_flags = SA_SIGINFO;
+
+	if (sigaction(SIGUSR1, &sa, NULL) < 0) {
+		printf("Failed to setup signal handler\n");
+		return -1;
+	}
+
+	gfd = setup_bp(0, &test_data, SIGUSR1);
+
+	if (gfd < 0) {
+		printf("Failed to setup watchpoint\n");
+		return -1;
+	}
+
+	ioctl(gfd, PERF_EVENT_IOC_ENABLE, 0);
+	test_data = 0xdeadbeef;
+	ioctl(gfd, PERF_EVENT_IOC_DISABLE, 0);
+
+	return 0;
+}
+
+static int wait_event(sem_t *sem, const char *name)
+{
+	struct timespec ts;
+
+	if (clock_gettime(CLOCK_REALTIME, &ts)) {
+		printf("%s: Failed to get current time\n", name);
+		return -1;
+	}
+
+	/*
+	 * Deadlock fix: avoid blocking forever on sem_wait() if the breakpoint/
+	 * watchpoint signal never arrives. Use a bounded wait and fail the test
+	 * on timeout instead.
+	 */
+	ts.tv_sec += wait_timeout_sec;
+	if (!sem_timedwait(sem, &ts))
+		return 0;
+
+	if (errno == ETIMEDOUT)
+		printf("%s: Timed out waiting for event\n", name);
+	else
+		printf("%s: sem_timedwait() failed with %d\n", name, errno);
+
+	return -1;
+}
+
+int main(int argc, char *argv[])
+{
+	sem_init(&ib_mtx, 0, 0);
+	if (trigger_bp() < 0)
+		return -1;
+	if (wait_event(&ib_mtx, "Breakpoint") < 0)
+		return -1;
+
+	if (bp_triggered)
+		printf("Breakpoint test passed!\n");
+
+	sem_init(&wp_mtx, 0, 0);
+	if (trigger_wp() < 0)
+		return -1;
+	if (wait_event(&wp_mtx, "Watchpoint") < 0)
+		return -1;
+
+	if (wp_triggered)
+		printf("Watchpoint test passed!\n");
+
+	return 0;
+}
-- 
2.43.0

