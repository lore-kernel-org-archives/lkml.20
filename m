Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93713F104C
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790750384; cv=none; b=hHn2u3IwgObUgbfnFraaZH3zqSB/qODQrkg1ejk3jUjxAZFU6ITbu4X1GSCof8eb8hnQL4PLfSbYoH538L79MjbJFkF/89LK7XVtTmasIoUKQRqZEVC8mxWaDh0M0TxO2tKEIm4C1LyXltbXPphQXLRLrQ4u1BrrSrIgwEw9qlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790750384; c=relaxed/simple;
	bh=pMPMtfZB8VBITwn9uHDlV1BkaeFTtWFb4ZIRKS14VJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XHkspU62EOwCR3ZjiMSH2P4E0yYxWxQdiPMkbylCzGTVKQLwpDbYe6g48WahNL1z4A2wAXD4gByCHWm1kr37pCSJIefdMDWReFFkopeJf/ueCsy0AeU/zxIlYrHQlTXku6q1EfJky9lT2mdRhZLW5VqqsPR6HYcQd5ypX7+SFbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h0PiS34F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BSXp0VX6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h0PiS34F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BSXp0VX6"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U1AVvS1264150
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:39:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JDL8L5Ufeca
	w9rYAA5nxqMzomuFEvy76+Mr0sJjLj5Y=; b=h0PiS34F0bnhUpjKoN3WG2jxjFS
	vsDNMhlyfHLJx5cCT6oQxCVNS7e4uY815j/HS2XzKMojEowDQrI2BTT+rcN+QzkU
	yXmEJ0OmQFGEYlqQ93XexIe2HevxGP3NkFNOPhGbnZ3i/w4e/YtLKGMuChFll4cc
	rKFZSaOmZzFBImzSeatw4PKLiTr2ocJebm0JXmm7+QGrTh6TddkVUEoIiHG6On7I
	VB9dwRbBheiJFUbNCM78OOynRygywDrkKqjLajgo4oYwCcVudP8vLNwvEfs9qQC3
	zWdoqMUSpAkLAQ3Soc9SGFGRdG03ktpbBWHb74PLRbROJ7hGQF1gLIwfRXw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0rheh8xn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:39:41 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-342b66c0b06so1890465eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 23:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790750381; x=1791355181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JDL8L5Ufecaw9rYAA5nxqMzomuFEvy76+Mr0sJjLj5Y=;
        b=BSXp0VX6T0e+GbdR7sKr3Ggfqz5Kb+VdA0Y9bXa8UiH8LBc2ZsIS5Bll6c8VhyOh29
         9KTsYmYt0vzq450mXqE6kc4fEaCbyGChWJbrkgIslUy86zJnu1MwBax2TkB1apK+Uz/I
         d9RJ7wh2FJuB7KBTZZmGxVTpDwMft0+tuR9JpFnACGS6VxF1ePo6v80EJQHe3DtFSOAi
         otUvNtg6IqNvHNKUZVH24OqPogk3ZXOBlNuZp1tFHDYIBPaL6Pi8m5kZgAsdyNbjbeCP
         CJmhkO8GulaxQIiRsWLeFpn0e7DBR4dWp3v6qv8K/F0PgqeP6noCiXiG37xbdiWpRavi
         oSeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790750381; x=1791355181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JDL8L5Ufecaw9rYAA5nxqMzomuFEvy76+Mr0sJjLj5Y=;
        b=buw094qDbkMGwa8jq3LD/SAXvRS1Qug3isVvnX/wOEe/Z6PDmUTmlsT8xxX9Xd6IB1
         J6LvD7dE1xlfa3r9BoFlF21OrkIvVUPAFWPFAZnHmZuTQ046kH8LcgtjvMlT9rahzf2z
         No4Ekf5mRi5egOwCO0UIsG0eMwu20Luw074Gm0kW+e9zIJg+XkVZwt6OQRuGvMTxtXcb
         1QHNLmXAMUB7+8G/eXaFHSKteSN+liFNx4VcouNi/qxHKtqI5NHRl+79eqqGELl/fjTb
         ZuQThITw4b2SPRzo1dEZBCxzCWVPx8GulFu+19DgP0saAzxF3m8ZchrCKDUI0zGAfNiW
         rqTw==
X-Gm-Message-State: AFuF++mmT8ZPQ65mWZiwsaUnkfJauS7Zr2pZRALd1uFqi0oFSP5AkRg1
	Bu+ETvfbZD0wcAFS/30L1Ep762QSX10alXQNPd6LZtWgK9oy2VRNVHnLMNd1BTfYIvkLotPCvvO
	ntJAGirifWpNkTyEkGECsJSJO1xHRn4+7YgtGnkzbtQj0j5mXP9hIg4npXOzIzF/APW15MK4WDJ
	o=
X-Gm-Gg: AYBFou1K9uWA29XmyUsUNaXPwdruKpNK4BJxYuMOiu0mzfkgjPW9bY5ud6jIakvpTdc
	9duHQzLRmbicMU6ltrgGPOz35ed728PON/f7RAMNL9AqahtZFJHQKcLV3y9dvJ3Elr4cVQObLJc
	HgEf0DA6Rmm420dj/hkK3FrIZTXCzm3atwCeLGp04ma78HXg8cxVP9Q3I9ChKHVa9h6aK5KaBF8
	uU+K8Wlpwv8Kt5WUUq20YWxvuzt0sJ9xu7xkno/YivisHvaViNroOjXH4Mg9oO1LU3Bo8VGUgcc
	CWAQC8pLL3hboUwVEbYq1gokzCJ9NcqKeRZyzd+9VBYAjI/EZXh75Qu4IpONZN8S73RHFM015eZ
	AY81Flr/vD/NlL2fm3JXaYOp1SaFRLANtFmvHl6GlGvFC+VNJ3smQp6l5X1g60msTmDOM4gKviX
	9Er7sKLVrIqzJXvm3T7in4DYvf
X-Received: by 2002:a05:7022:b902:b0:147:9ad0:cf15 with SMTP id a92af1059eb24-14d399e6230mr296178c88.22.1790750380509;
        Tue, 29 Sep 2026 23:39:40 -0700 (PDT)
X-Received: by 2002:a05:7022:b902:b0:147:9ad0:cf15 with SMTP id a92af1059eb24-14d399e6230mr296154c88.22.1790750379906;
        Tue, 29 Sep 2026 23:39:39 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14d08fb50f1sm2711531c88.13.2026.09.29.23.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 23:39:39 -0700 (PDT)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-perf-users@vger.kernel.org
Cc: peterz@infradead.org, mingo@redhat.com, alex@ghiti.fr,
        aou@eecs.berkeley.edu, jtaubepe@redhat.com, palmer@dabbelt.com,
        pjw@kernel.org, qingfang.deng@linux.dev, shuah@kernel.org,
        thecharlesjenkins@gmail.com, cp0613@linux.alibaba.com,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v7 2/8] riscv: Add breakpoint and watchpoint test for riscv
Date: Wed, 30 Sep 2026 12:09:13 +0530
Message-ID: <20260930063919.608911-3-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930063919.608911-1-himanshu.chauhan@oss.qualcomm.com>
References: <20260930063919.608911-1-himanshu.chauhan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: O_nda8ir2cVma0FD0amIMBIFofZAjxWA
X-Proofpoint-ORIG-GUID: O_nda8ir2cVma0FD0amIMBIFofZAjxWA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAyNiBTYWx0ZWRfX71nhWMc8BlKH
 plyMg6cV5d7LM9I15lPKJvXPu26pty/6aCMV2Lm8Zytdr/u4PNPYibXakLjwJO9tzfKVDxsoV+S
 JoDuiQzTRtUfKAoPmDxWayUwl41ZERN0y5UYurd6Cyz761AlZ1oTz01lFqidPlY/OStdtCfDAYu
 WsB2zJyYrfhP48qlGck5oE/IGJLxuKJiy0+biH8gqKJOm1MT8vFKMQd/2JiUBYoi109UNBUs8ch
 C1G36YSe2+71X4ymKPynaIwKTtV7UzGjN4srOQtJtZT/7dqPmPpfX99FJiwcUsoBXV1du1eEyvd
 p0vb9toJka9i4H5lKen+OZR9DJ4IX6acgut5zbG97rFToCnb5tBkT/NoiI384+hH8LXdeO3dHyQ
 N2BlMBSOkrc0eTbcgH7FUNDRkOhLhkEZZBoDNxZjqY6vRkydjYuJxroHFX5CVU24DJWYddQXf8D
 nIQTDqAUehxuREqt/+g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAyNiBTYWx0ZWRfX14dZs5QpnCT9
 yF11Yso3TCO+RzG3AtRiUNUnpUjBCSrV6g/3mH3kpPwGURsm2ajKnjkUJGNsx7b34IBDtB6YJm1
 vK3xKGfjOgsuAzoSm0XOsTDiXSzHwq8=
X-Authority-Analysis: v=2.4 cv=Tu1zFzXh c=1 sm=1 tr=0 ts=6abcaead cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=qd3H3YWZb18LjlhzOR0A:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300026

Add self test for riscv architecture. It uses ptrace to ptrace framework
to set/unset break/watchpoint and uses signals to check triggers.

Also add $(KHDR_INCLUDES) to CFLAGS for the riscv test build so the
UAPI headers exercised by the test can be located during compilation.

Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
---
 tools/testing/selftests/breakpoints/Makefile  |   5 +
 .../breakpoints/breakpoint_test_riscv.c       | 219 ++++++++++++++++++
 2 files changed, 224 insertions(+)
 create mode 100644 tools/testing/selftests/breakpoints/breakpoint_test_riscv.c

diff --git a/tools/testing/selftests/breakpoints/Makefile b/tools/testing/selftests/breakpoints/Makefile
index 0b8f5acf7c78..b32c56b3c1db 100644
--- a/tools/testing/selftests/breakpoints/Makefile
+++ b/tools/testing/selftests/breakpoints/Makefile
@@ -12,5 +12,10 @@ ifneq (,$(filter $(ARCH),aarch64 arm64))
 TEST_GEN_PROGS += breakpoint_test_arm64
 endif
 
+ifneq (,$(filter $(ARCH),riscv))
+CFLAGS += -static $(KHDR_INCLUDES)
+TEST_GEN_PROGS += breakpoint_test_riscv
+endif
+
 include ../lib.mk
 
diff --git a/tools/testing/selftests/breakpoints/breakpoint_test_riscv.c b/tools/testing/selftests/breakpoints/breakpoint_test_riscv.c
new file mode 100644
index 000000000000..0649940b709e
--- /dev/null
+++ b/tools/testing/selftests/breakpoints/breakpoint_test_riscv.c
@@ -0,0 +1,219 @@
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
+#ifndef noinline
+#define noinline __attribute__((noinline))
+#endif
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
+static noinline void test_func(void)
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

