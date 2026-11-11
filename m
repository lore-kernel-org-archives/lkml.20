Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794383605;
	b=I+kHUR9SSQoovIXuozc/MbdVe5eSl76nf7d+DClZyw44M2c7m2Gepk9XrnlDi7KjVKoc
	 v6OVtQrkkRwWvKFiGcyu5166MumB1QQS2DCMkqsBbDTElRsoU2dIjHCHvd1E5Fq8qWam8
	 yRKxTZJSWLdbBmdc5DayH6mglTeYuxEHmux+mL9dhLfO4qmz8L3eehYAQrlw3YHecqeDH
	 gCiymDSHR5tvQU8Kq3CDm6Jh0NfSdTdymcsycORWSyZFb2Qol2wmYlvRGjo8E9dlZJAuQ
	 ZQaNJEokAPgp1Aj4g8GhzMFbWwXeFJCCc/mawBK5FU2mqNTIu/9QscA72cANs6+rjCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383605;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=oahx99XEloIqEujazr6llRd2iV3ppRMwlmYjmySRohQ=;
	b=o5o79O8U7OgyTSK0sa58qoM5VV3qhSCWX30fT+59S2i5g3aQukzBdhLEvvQnObP64FE6
	 GL9jf8CYZPJzSCTuQBeGFnt4IKjEuIdleDhGIogUQp5cA6NbcF3XIX4kMWdreY0KdIBYn
	 cvvQFZLQJlJ+wnJsJQ+lDWZ2Fn2fxrTfw80zIJmYsW2wpRLlVTVAC6V5ZgrXkmw7IPjMl
	 eFSkGoNxontrqjVxxEKdmPwNUggOYAsvcbnWyVgDtq/XDWsTuNznAZXVkK60nT3ovIyFN
	 qkEVTktaPz0ZcMGFQcMz4W206OKiv5e79HZMXT1oMX0iIpNtDP6bJdkU7TbqDt8LxhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=sc3wVv44;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2365D606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:53:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2365D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=sc3wVv44
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cd60c5da24cso1522261a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794383604; x=1794988404; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=oahx99XEloIqEujazr6llRd2iV3ppRMwlmYjmySRohQ=;
        b=sc3wVv44DcuqFiFWb9yifroWPzvGQVB7bqnHX2rJJ9cSC78gYGn9dyLoWAPnCD2KnK
         xxQ++Zpr4oyOpnNSg8gwxaYvhCQY0eKSuKmbkj31bVraVjg4U583iDgzhB4h0zlagi0Y
         fYGb1/C5iWHxwCcAvIxnF9F9gwPRT8SaTaoaM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794383604; x=1794988404;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oahx99XEloIqEujazr6llRd2iV3ppRMwlmYjmySRohQ=;
        b=xrXGe3Pub+cSGxL3zrwEr+TbskOLKsNkUVwsZlRYDFeWDO6RorS3kyM4yg89n4/+O2
         6aHX4pC8qrn2pC8+9MvSu+vGRCPBxR+41nXqHGpBF41B6+J4lrJRaHLN+8lxY/A9mbSa
         /FaeZ3H7Mdc0H9P20HqBRGmQJ6+SOyC828jnJV8pmwygsYUEWHysM40OsG4Yvsj969bj
         2ufe9AjsCEHHCFE5wMW82LnuHjDVNaDVHzXcfqIx6ynpuWDmHiHq5f2rU/S7lNOk1wMo
         mRiIo8RgyhRO1biRN5Js2fLXtB5lm2CEgXt2JPiy6BVSVEBVz7+bRSsB+pvAjrFPY4U5
         9cpg==
X-Forwarded-Encrypted: i=1; AL+hErHjicdASbBniKXfKTM7DJDW2tSLAxUaVb5Df86QJCP7uc5b1bTKQ7ur5G6JQ6bDP6tnCtJEgSbsps/rFKs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hTEKVa0Pj6Weg1AWqud0BgFBw40Jwwt/PsZKcpC7+AebPAurK
	2HuU3BsB8YlYB6RHMkCU9H9PpY1k4Q+uajBlPBF4HBP543SoJbaJtK6I8eIuge01Kj4=
X-Gm-Gg: AYBFou0psNxlmlOIOqYUHEF14UNViGcWPJtVPlHa4iovx5EhkKCDgqOXdhE+s5C84ep
	rXk4DnrBPw3F1+gINt5K7ZntIRhyLszRSFdI8Y/hlu9A9eXjbH+7yWo0xAWDkPlfSRLqGyaLSJR
	ZkhtXz6sjlP+N2UCRWSzfrjBOt2on2PX7G+e57g0e/vcumlyu+R+iiK3juhwA6TA8Ex9T1DZtCv
	3Q3rjOTTMd08vNBDX0bHQjxTzAeVgOoZoSvemNwlon63tii5FBFpWRCFzFJJthalOnvM5v0KX20
	KVdoVfTb/jS8EcgRVMrL+oGjaNAp8n+A/lku8hznwouZSnAwJzN70LU8YBGDQlUn+WJ1aOxBYnx
	1llZTXK2c79XyDaD99+lKJjLlRIE8i0D04ZTr2SxEaUqOz9N3c8pqBvUzarx530eSHdfFZcbybH
	aoqznBxEh4E8T9dECZ9jiREZ5C2Lp2i/VXsTeSs8kj9w87wUjofek0c9YEu55+I/UfEGLVywAab
	N2E4XehIjPmrl3933EKBI1RpkZvXuzRG/tklNB0soji3w0UjLsdwFLbY6ePi9oJ6JqWeodnXUC+
	MTJZ0h7Gvnf7onHSFOCoxfTmf+uImHqtdaNUbZGBGe3vDFmcsJ+FLXnkrQOkC86Tqf6V+UVcwF7
	FCEb4zHJu+7/Vr1sXhP1GewIfH4nuG/BNX1T5z5oh7TIpvuG29HR/B+6uoxQPc4gucLpjpdWamQ
	cn7gU1+niJzKXH/+FL/S7aQ0AQxBlqUsFZYcTzeJnpo4aP7QwvNxyHmNt7BJnrfZS5eiRdT5STr
	A==
X-Received: by 2002:a17:90b:3ecd:b0:3b0:ae41:2706 with SMTP id 98e67ed59e1d1-3b182defae2mr1841105a91.4.1794383604238;
        Tue, 10 Nov 2026 23:53:24 -0800 (PST)
Received: from localhost ([199.201.64.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17dba5ed0sm3393597a91.17.2026.11.10.23.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:53:23 -0800 (PST)
Date: Tue, 10 Nov 2026 23:53:20 -0800
From: Chris Down <chris@chrisdown.name>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: Alexander Graf <graf@amazon.com>, Baoquan He <baoquan.he@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, kexec@lists.infradead.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH 4/9] selftests/liveupdate: Catch incorrect file accounting
 across kexec
Message-ID: <d339c0af9c4ee54a5ee8052d5fe59c81302d82a7.1794383544.git.chris@chrisdown.name>
References: <cover.1794383544.git.chris@chrisdown.name>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1794383544.git.chris@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Check that each retrieve is counted while the session is still open.
Finishing the session should count its unretrieved file as dropped,
while a file in an unclaimed session should still be held.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 tools/testing/selftests/liveupdate/Makefile   |   1 +
 tools/testing/selftests/liveupdate/init.c     |   5 +
 .../selftests/liveupdate/luo_handover_stats.c | 198 ++++++++++++++++++
 .../selftests/liveupdate/run-vmtests.sh       |   1 +
 tools/testing/selftests/liveupdate/vmtest.sh  |   2 +
 5 files changed, 207 insertions(+)
 create mode 100644 tools/testing/selftests/liveupdate/luo_handover_stats.c

diff --git a/tools/testing/selftests/liveupdate/Makefile b/tools/testing/selftests/liveupdate/Makefile
index 634211c66652..78a4419ff610 100644
--- a/tools/testing/selftests/liveupdate/Makefile
+++ b/tools/testing/selftests/liveupdate/Makefile
@@ -2,6 +2,7 @@
 
 TEST_GEN_PROGS += liveupdate
 
+TEST_GEN_PROGS_EXTENDED += luo_handover_stats
 TEST_GEN_PROGS_EXTENDED += luo_kexec_simple
 TEST_GEN_PROGS_EXTENDED += luo_multi_session
 TEST_GEN_PROGS_EXTENDED += luo_stress_sessions
diff --git a/tools/testing/selftests/liveupdate/init.c b/tools/testing/selftests/liveupdate/init.c
index fb08bd58b9b9..31bd8f0ec3a9 100644
--- a/tools/testing/selftests/liveupdate/init.c
+++ b/tools/testing/selftests/liveupdate/init.c
@@ -37,6 +37,11 @@ static int mount_filesystems(void)
 		return -1;
 	}
 
+	if (mount("sysfs", "/sys", "sysfs", 0, NULL) < 0) {
+		fprintf(stderr, "INIT: Failed to mount sysfs\n");
+		return -1;
+	}
+
 	return 0;
 }
 
diff --git a/tools/testing/selftests/liveupdate/luo_handover_stats.c b/tools/testing/selftests/liveupdate/luo_handover_stats.c
new file mode 100644
index 000000000000..f18df79dda55
--- /dev/null
+++ b/tools/testing/selftests/liveupdate/luo_handover_stats.c
@@ -0,0 +1,198 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/* Copyright (c) 2026 Meta Platforms, Inc. and affiliates. */
+
+#include <fcntl.h>
+#include <limits.h>
+#include <stdio.h>
+#include <string.h>
+#include <unistd.h>
+#include <libliveupdate.h>
+
+#define INCOMING_DIR "/sys/class/misc/liveupdate/incoming/"
+
+#define SESSION_CLAIMED "stats-claimed"
+#define SESSION_UNCLAIMED "stats-unclaimed"
+
+#define MFD_RETRIEVED_TOKEN 0x51
+#define MFD_DROPPED_TOKEN 0x52
+#define MFD_UNCLAIMED_TOKEN 0x53
+
+#define MFD_RETRIEVED_DATA "retrieved before finish"
+#define MFD_DROPPED_DATA "never retrieved"
+#define MFD_UNCLAIMED_DATA "session never retrieved"
+
+#define STATE_SESSION_NAME "handover_stats_state"
+#define STATE_MEMFD_TOKEN 997
+
+/* The first open starts deserialization. */
+static char state_before_open[16];
+
+static void read_incoming(const char *name, char *buf, size_t len)
+{
+	char path[128];
+	ssize_t n;
+	int fd;
+
+	snprintf(path, sizeof(path), INCOMING_DIR "%s", name);
+	fd = open(path, O_RDONLY);
+	if (fd < 0)
+		fail_exit("open %s", path);
+
+	n = read(fd, buf, len - 1);
+	if (n < 0)
+		fail_exit("read %s", path);
+	close(fd);
+
+	/* A full buffer could hide the rest of a malformed value */
+	if ((size_t)n == len - 1)
+		ksft_exit_fail_msg("%s is longer than %zu bytes\n", path,
+				   len - 2);
+
+	buf[n] = '\0';
+	if (n > 0 && buf[n - 1] == '\n')
+		buf[n - 1] = '\0';
+}
+
+static void expect_state(const char *state, const char *expected)
+{
+	if (strcmp(state, expected))
+		ksft_exit_fail_msg("state is '%s', expected '%s'\n", state,
+				   expected);
+}
+
+static unsigned long long read_number(const char *name)
+{
+	unsigned long long val = 0;
+	char buf[32];
+	char *p;
+
+	read_incoming(name, buf, sizeof(buf));
+	for (p = buf; *p >= '0' && *p <= '9'; p++) {
+		if (val > (ULLONG_MAX - (*p - '0')) / 10)
+			break;
+		val = val * 10 + (*p - '0');
+	}
+	if (p == buf || *p)
+		ksft_exit_fail_msg("%s%s reads '%s', not a 64-bit unsigned number\n",
+				   INCOMING_DIR, name, buf);
+	return val;
+}
+
+static void expect_count(const char *name, unsigned long long expected)
+{
+	unsigned long long val = read_number(name);
+
+	if (val != expected)
+		ksft_exit_fail_msg("%s is %llu, expected %llu\n", name, val,
+				   expected);
+}
+
+static void expect_counts(long retrieved, long dropped)
+{
+	char state[16];
+
+	read_incoming("state", state, sizeof(state));
+	expect_state(state, "deserialized");
+
+	/* Three sessions, including the one carrying the test stage. */
+	expect_count("sessions", 3);
+	expect_count("files", 4);
+	expect_count("files_retrieved", retrieved);
+	expect_count("files_failed", 0);
+	expect_count("files_dropped", dropped);
+}
+
+static void run_stage_1(int luo_fd)
+{
+	int claimed_fd, unclaimed_fd;
+
+	ksft_print_msg("[STAGE 1] Checking state on a cold boot...\n");
+	expect_state(state_before_open, "none");
+	expect_count("sessions", 0);
+	expect_count("files", 0);
+
+	create_state_file(luo_fd, STATE_SESSION_NAME, STATE_MEMFD_TOKEN, 2);
+
+	ksft_print_msg("[STAGE 1] Preserving two memfds in '%s'...\n",
+		       SESSION_CLAIMED);
+	claimed_fd = luo_create_session(luo_fd, SESSION_CLAIMED);
+	if (claimed_fd < 0)
+		fail_exit("luo_create_session for '%s'", SESSION_CLAIMED);
+	if (create_and_preserve_memfd(claimed_fd, MFD_RETRIEVED_TOKEN,
+				      MFD_RETRIEVED_DATA) < 0)
+		fail_exit("create_and_preserve_memfd for token %#x",
+			  MFD_RETRIEVED_TOKEN);
+	if (create_and_preserve_memfd(claimed_fd, MFD_DROPPED_TOKEN,
+				      MFD_DROPPED_DATA) < 0)
+		fail_exit("create_and_preserve_memfd for token %#x",
+			  MFD_DROPPED_TOKEN);
+
+	ksft_print_msg("[STAGE 1] Preserving one memfd in '%s'...\n",
+		       SESSION_UNCLAIMED);
+	unclaimed_fd = luo_create_session(luo_fd, SESSION_UNCLAIMED);
+	if (unclaimed_fd < 0)
+		fail_exit("luo_create_session for '%s'", SESSION_UNCLAIMED);
+	if (create_and_preserve_memfd(unclaimed_fd, MFD_UNCLAIMED_TOKEN,
+				      MFD_UNCLAIMED_DATA) < 0)
+		fail_exit("create_and_preserve_memfd for token %#x",
+			  MFD_UNCLAIMED_TOKEN);
+
+	close(luo_fd);
+	daemonize_and_wait();
+}
+
+static void run_stage_2(int luo_fd, int state_session_fd)
+{
+	int claimed_fd, mfd, stage;
+
+	ksft_print_msg("[STAGE 2] Checking state before and after the first open...\n");
+	expect_state(state_before_open, "pending");
+	expect_counts(0, 0);
+
+	restore_and_read_stage(state_session_fd, STATE_MEMFD_TOKEN, &stage);
+	if (stage != 2)
+		fail_exit("Expected stage 2, but state file contains %d", stage);
+
+	/* The retrieve must count before the session finishes. */
+	expect_counts(1, 0);
+
+	ksft_print_msg("[STAGE 2] Retrieving one of the two memfds in '%s'...\n",
+		       SESSION_CLAIMED);
+	claimed_fd = luo_retrieve_session(luo_fd, SESSION_CLAIMED);
+	if (claimed_fd < 0)
+		fail_exit("luo_retrieve_session for '%s'", SESSION_CLAIMED);
+
+	mfd = restore_and_verify_memfd(claimed_fd, MFD_RETRIEVED_TOKEN,
+				       MFD_RETRIEVED_DATA);
+	if (mfd < 0)
+		fail_exit("restore_and_verify_memfd for token %#x",
+			  MFD_RETRIEVED_TOKEN);
+	close(mfd);
+	expect_counts(2, 0);
+
+	ksft_print_msg("[STAGE 2] Finishing '%s'...\n", SESSION_CLAIMED);
+	if (luo_session_finish(claimed_fd) < 0)
+		fail_exit("luo_session_finish for '%s'", SESSION_CLAIMED);
+	close(claimed_fd);
+
+	expect_counts(2, 1);
+
+	ksft_print_msg("[STAGE 2] Finishing the state session...\n");
+	if (luo_session_finish(state_session_fd) < 0)
+		fail_exit("luo_session_finish for state session");
+	close(state_session_fd);
+
+	/* Finishing the state session must not drop anything. */
+	expect_counts(2, 1);
+
+	ksft_print_msg("\n--- HANDOVER STATS TEST PASSED ---\n");
+}
+
+int main(int argc, char *argv[])
+{
+	read_incoming("state", state_before_open, sizeof(state_before_open));
+
+	return luo_test(argc, argv, STATE_SESSION_NAME,
+			run_stage_1, run_stage_2);
+}
diff --git a/tools/testing/selftests/liveupdate/run-vmtests.sh b/tools/testing/selftests/liveupdate/run-vmtests.sh
index 6f592aec0f85..bce7679279d4 100755
--- a/tools/testing/selftests/liveupdate/run-vmtests.sh
+++ b/tools/testing/selftests/liveupdate/run-vmtests.sh
@@ -16,6 +16,7 @@ failed=0
 skipped=0
 
 TEST_NAMES=(
+	"luo_handover_stats"
 	"luo_kexec_simple"
 	"luo_multi_session"
 	"luo_stress_files"
diff --git a/tools/testing/selftests/liveupdate/vmtest.sh b/tools/testing/selftests/liveupdate/vmtest.sh
index dea5a6fb2abc..76ffea7d4eb8 100755
--- a/tools/testing/selftests/liveupdate/vmtest.sh
+++ b/tools/testing/selftests/liveupdate/vmtest.sh
@@ -145,6 +145,7 @@ function mkinitrd() {
 	cat > "$workspace_dir/cpio_list_inner" <<EOF
 dir /dev 0755 0 0
 dir /proc 0755 0 0
+dir /sys 0755 0 0
 dir /debugfs 0755 0 0
 nod /dev/console 0600 0 0 c 5 1
 file /init $workspace_dir/init 0755 0 0
@@ -157,6 +158,7 @@ EOF
 	cat > "$workspace_dir/cpio_list" <<EOF
 dir /dev 0755 0 0
 dir /proc 0755 0 0
+dir /sys 0755 0 0
 dir /debugfs 0755 0 0
 nod /dev/console 0600 0 0 c 5 1
 file /init $workspace_dir/init 0755 0 0
-- 
2.54.0

