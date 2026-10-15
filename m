Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD5449BD81
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057128; cv=none; b=ChNqMOvhPRfAGNpkkNxwHyQ23bri3pWKm958c1SYZq0GWh1IbWCIh0H05Ee5nn6rsXsKXmWXxlHCF2LuVq3Xtwdqhmq8B8veEG4nEh77ZGr+LH8oewv45pvqWJOOQxbj1wcmdSornEpQ1N2mVjM7ZefkxPzliG1bwsBE/Vk2RZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057128; c=relaxed/simple;
	bh=uwYU0vyY7jBxTkYD57tEKF76LhbCufiagl093haOXQw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZP6HLygs69fTewM5y7Og+EL08Ese4W+77J15t/fy4Ps3GWCzCgP5M1snurSLOpESlGAkCvKi4srZCht5RIXws7iHRMps08Siu7evSRhT3XjvWq0x7K/L7T+JIfgk2r/4gfySZw+brKe2vBSllo1qVypE7JunN6pfeA9nMDEKLzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=Kdv1rLWu; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="Kdv1rLWu"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5e941201909so442157e0c.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792057122; x=1792661922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IPTzG9yeWgp2JFe+s9iO1cWtEwA5iuP2nn+kITzaTP4=;
        b=Kdv1rLWu56UD0xotR7hdJq+7hBb0jMvUAQ46vaunYpTX2UpIq3xjWEGIZkVyH9K+ec
         nSfNReK4CfcbXZP9j8lreAW3SuLdtjqhtl7mC+dyrnrADNA2FL1EP4D4yaJtzkxdlRgL
         Y7Sw22MtYtkzFtnQIqqmwpxOO4ZY2uzA4bYukyRwBEJ9fEoDnUD64nR/CKD3JHzGfDV1
         q4IFVCmxP6Gq4SMC1K5itp5MOTqIjZEHmpHJDLzUg19BB65IG+II3rUf3DBMYdsjPK/q
         a0l/Er0riJXxLtWLwp16QmvI1jHJ8V4oVTT/OHJw5aH3rYJHcA1HrCew+BsxcC/tzQfa
         rs6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792057122; x=1792661922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IPTzG9yeWgp2JFe+s9iO1cWtEwA5iuP2nn+kITzaTP4=;
        b=HIG2Oy/5bb7nHRAlOwMqv/S49918z3P/XC8pOsO341NvgmddntDTb9AACz1QDssRMJ
         +/R1XRAHcH/PlWtnWkFTIgL71kw6anoNXUqoTEAxgbOgL5L9UD0LCl6Yqa4PGHKL0wXE
         nWnbyFdGfzf9MVBAkLuhImTG5q29eBDimpGfWvE2IdKPc6bq8nLWSk+VMcLwMNU0/eWk
         RFccNDD+tSaY89jXoidoJSr9ThGUaW4TR8M8vLBeNM19wo9M5m6hHOId+UMSAAVeYDXg
         ym3MIoX5V8evyfvOdHu2gvhIGO5qe8MPcAMypSg3RdgD+z99FEmeIWpumobxKGmabj6t
         +h9Q==
X-Forwarded-Encrypted: i=1; AKwUvBzxPTjbJ1nZrr2baQsQBWaPlnlOF0w2zqVN5hADg5M6S/fNYY16u1ZtZA3uaqVU6k8JFQbL/EynrZEPv/s=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7LJCkQVsZqfWXwIGNz8OKlEs/qlaAAGXJmYxlyiXSwzBJMGxA
	azx++HRT9CH2XmQBqKvDMd3YRsIgu4fC+PJZbvfS9xgyeT+T6T4RxA33HcQEKaWBFwk=
X-Gm-Gg: AYBFou2u6v2/4hpj54n+hWJI23rCXBKb1eEq2VcRdLNYDZKSIjRjeTIfUaLvLTSJpMe
	oJnclIpT6bqXP65AIagkm7sbLPB/3hk8JreUTDmOvmkUgk+gmlkKha7gNCbLGW3V3nK7VdnnhFC
	KIvb08m1EwbS7XMiFaUQIY+vPeHTUOXuUhLmLhS8ImXPfrVVivY9YVlE4WR83t4u3WXkOCBsGxT
	7S/4rT0QGVySumkftsMZ3YBG0MYJWuHpb/DEslc/o+ofdGGSRGfas+tow2mORLkHNrmuvFZq52Q
	AiYNhpq03SZKNHso9lJarGKmszZd3w7BVp/VKbwcCTNP4ab7Rgsqv5GVg1NrqSszkinGTX0Z2NC
	YKP+6u1YudwnkEC/9ns50uA9K3Vc0EojJWvTdOVevYPDFCssJheiAeMprVsrBw3pEZQ/5wtbX2y
	YYfTFYpkVbCtgaOYT09gXEnROkbor5bYUHjOPcEHpA+IepgwhthQcBjypaL5oN+OWFB9jjJvMbw
	O4zobPlg4FoyqK3Ndk8mPicayT1q75Sm6Z6ML0PJO1nEZByj1RFnTspPCZ49LnjLmvLto7toFTM
	sZBF2jmIcHn5CcNhRGE=
X-Received: by 2002:a05:6122:4b8c:b0:5cf:1e68:6015 with SMTP id 71dfb90a1353d-5e91f4cc080mr5669513e0c.15.1792057122304;
        Thu, 15 Oct 2026 02:38:42 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99003d37009sm12275672241.2.2026.10.15.02.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:38:36 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	vipinsh@google.com,
	linux-kernel@vger.kernel.org,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	graf@amazon.com
Subject: [PATCH v1 7/7] selftests: liveupdate: Add test coverage for tmpfs preservation and retrieval
Date: Thu, 15 Oct 2026 05:38:16 -0400
Message-ID: <20261015093816.2438942-8-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
In-Reply-To: <20261015093816.2438942-1-pasha.tatashin@soleen.com>
References: <20261015093816.2438942-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: David Matlack <dmatlack@google.com>

Extend the multi-session LUO test to verify preserving a path-backed
tmpfs file and retrieving its contents to a newly created empty tmpfs
file post-kexec using struct liveupdate_memfd_retrieve_arg with
LIVEUPDATE_SESSION_RETRIEVE_FD. Also verify that retrieve argument
validation errors (passing an argument when retrieving a memfd, omitting
the argument when retrieving a tmpfs file, or passing a read-only target
tmpfs FD) are retryable and allow a subsequent valid retrieve call to
succeed.

Signed-off-by: David Matlack <dmatlack@google.com>
Co-developed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 .../liveupdate/lib/include/libliveupdate.h    |   2 +
 .../selftests/liveupdate/lib/lu_utils.c       |  44 +++++++
 .../selftests/liveupdate/luo_multi_session.c  | 110 ++++++++++++++++--
 3 files changed, 147 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h b/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h
index 8a38268e89dee..dc5c01408462d 100644
--- a/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h
+++ b/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h
@@ -37,6 +37,8 @@ int luo_session_retrieve_fd_arg(int session_fd, __u64 token, __u64 user_arg);
 
 int create_and_preserve_memfd(int session_fd, int token, const char *data);
 int restore_and_verify_memfd(int session_fd, int token, const char *expected_data);
+int restore_and_verify_tmpfs(int session_fd, int token, int fd,
+			     const char *expected_data);
 
 void create_state_file(int luo_fd, const char *session_name, int token,
 		       int next_stage);
diff --git a/tools/testing/selftests/liveupdate/lib/lu_utils.c b/tools/testing/selftests/liveupdate/lib/lu_utils.c
index 5c6f8bf80b297..1b1a556287d3a 100644
--- a/tools/testing/selftests/liveupdate/lib/lu_utils.c
+++ b/tools/testing/selftests/liveupdate/lib/lu_utils.c
@@ -347,3 +347,47 @@ int luo_test(int argc, char *argv[],
 
 	return 0;
 }
+
+int restore_and_verify_tmpfs(int session_fd, int token, int fd,
+			     const char *expected_data)
+{
+	struct liveupdate_memfd_retrieve_arg rarg = {
+		.size = sizeof(rarg),
+		.fd = fd,
+	};
+	long page_size = getpagesize();
+	void *map = MAP_FAILED;
+	struct stat st;
+	int ret_fd;
+
+	ret_fd = luo_session_retrieve_fd_arg(session_fd, token,
+					     (unsigned long)&rarg);
+	if (ret_fd < 0) {
+		ksft_print_msg("luo_session_retrieve_fd_arg failed: %d\n",
+			       ret_fd);
+		return ret_fd;
+	}
+	close(ret_fd);
+
+	if (fstat(fd, &st) < 0)
+		return -errno;
+	if (st.st_size != page_size) {
+		ksft_print_msg("Size mismatch! Expected %ld, Got %lld\n",
+			       page_size, (long long)st.st_size);
+		return -EINVAL;
+	}
+
+	map = mmap(NULL, page_size, PROT_READ, MAP_SHARED, fd, 0);
+	if (map == MAP_FAILED)
+		return -errno;
+
+	if (expected_data && strcmp(expected_data, map) != 0) {
+		ksft_print_msg("Data mismatch! Expected '%s', Got '%s'\n",
+			       expected_data, (char *)map);
+		munmap(map, page_size);
+		return -EINVAL;
+	}
+
+	munmap(map, page_size);
+	return 0;
+}
diff --git a/tools/testing/selftests/liveupdate/luo_multi_session.c b/tools/testing/selftests/liveupdate/luo_multi_session.c
index aac24a5f5ce3c..46889676d9f52 100644
--- a/tools/testing/selftests/liveupdate/luo_multi_session.c
+++ b/tools/testing/selftests/liveupdate/luo_multi_session.c
@@ -9,7 +9,15 @@
  * files.
  */
 
+#include <errno.h>
+#include <fcntl.h>
+#include <sys/mman.h>
+#include <sys/mount.h>
+#include <sys/stat.h>
+#include <unistd.h>
+
 #include <libliveupdate.h>
+#include <linux/liveupdate.h>
 
 #define SESSION_EMPTY_1 "multi-test-empty-1"
 #define SESSION_EMPTY_2 "multi-test-empty-2"
@@ -23,6 +31,7 @@
 #define MFD1_DATA "Data for session files 1"
 #define MFD2_DATA "First file for session files 2"
 #define MFD3_DATA "Second file for session files 2"
+#define MFD3_POS 42
 
 #define STATE_SESSION_NAME "kexec_multi_state"
 #define STATE_MEMFD_TOKEN 998
@@ -31,6 +40,8 @@
 static void run_stage_1(int luo_fd)
 {
 	int s_empty1_fd, s_empty2_fd, s_files1_fd, s_files2_fd;
+	int tmpfs_fd;
+	void *map;
 
 	ksft_print_msg("[STAGE 1] Starting pre-kexec setup for multi-session test...\n");
 
@@ -53,25 +64,50 @@ static void run_stage_1(int luo_fd)
 	s_files1_fd = luo_create_session(luo_fd, SESSION_FILES_1);
 	if (s_files1_fd < 0)
 		fail_exit("luo_create_session for '%s'", SESSION_FILES_1);
+	ksft_print_msg("  -> Preserving memfd (token %#x, content: \"%s\")\n",
+		       MFD1_TOKEN, MFD1_DATA);
 	if (create_and_preserve_memfd(s_files1_fd, MFD1_TOKEN, MFD1_DATA) < 0) {
 		fail_exit("create_and_preserve_memfd for token %#x",
 			  MFD1_TOKEN);
 	}
 
-	ksft_print_msg("[STAGE 1] Creating session '%s' with two memfds...\n",
+	ksft_print_msg("[STAGE 1] Creating session '%s' with memfd and tmpfs file...\n",
 		       SESSION_FILES_2);
 
 	s_files2_fd = luo_create_session(luo_fd, SESSION_FILES_2);
 	if (s_files2_fd < 0)
 		fail_exit("luo_create_session for '%s'", SESSION_FILES_2);
+	ksft_print_msg("  -> Preserving memfd (token %#x, content: \"%s\")\n",
+		       MFD2_TOKEN, MFD2_DATA);
 	if (create_and_preserve_memfd(s_files2_fd, MFD2_TOKEN, MFD2_DATA) < 0) {
 		fail_exit("create_and_preserve_memfd for token %#x",
 			  MFD2_TOKEN);
 	}
-	if (create_and_preserve_memfd(s_files2_fd, MFD3_TOKEN, MFD3_DATA) < 0) {
-		fail_exit("create_and_preserve_memfd for token %#x",
-			  MFD3_TOKEN);
-	}
+
+	ksft_print_msg("  -> Populating tmpfs file at /mnt/mfd3...\n");
+	if (mkdir("/mnt", 0777) < 0 && errno != EEXIST)
+		fail_exit("mkdir /mnt");
+	if (mount("tmpfs", "/mnt", "tmpfs", 0, NULL) < 0)
+		fail_exit("mount tmpfs");
+	tmpfs_fd = open("/mnt/mfd3", O_CREAT | O_RDWR, 0666);
+	if (tmpfs_fd < 0)
+		fail_exit("failed to open tmpfs_fd");
+	ksft_print_msg("  -> Preserving generic tmpfs file (token %#x, content: \"%s\")\n",
+		       MFD3_TOKEN, MFD3_DATA);
+	if (ftruncate(tmpfs_fd, getpagesize()) < 0)
+		fail_exit("ftruncate tmpfs_fd");
+	map = mmap(NULL, getpagesize(), PROT_WRITE, MAP_SHARED, tmpfs_fd, 0);
+	if (map == MAP_FAILED)
+		fail_exit("mmap tmpfs_fd");
+	strcpy(map, MFD3_DATA);
+	munmap(map, getpagesize());
+	if (lseek(tmpfs_fd, MFD3_POS, SEEK_SET) != MFD3_POS)
+		fail_exit("lseek tmpfs_fd");
+
+	if (luo_session_preserve_fd(s_files2_fd, tmpfs_fd, MFD3_TOKEN) < 0)
+		fail_exit("preserve tmpfs fd");
+
+	close(tmpfs_fd);
 
 	close(luo_fd);
 	daemonize_and_wait();
@@ -81,7 +117,10 @@ static void run_stage_1(int luo_fd)
 static void run_stage_2(int luo_fd, int state_session_fd)
 {
 	int s_empty1_fd, s_empty2_fd, s_files1_fd, s_files2_fd;
-	int mfd1, mfd2, mfd3, stage;
+	struct liveupdate_memfd_retrieve_arg rarg = {
+		.size = sizeof(rarg),
+	};
+	int mfd1, mfd2, mfd3, ro_fd, ret, stage;
 
 	ksft_print_msg("[STAGE 2] Starting post-kexec verification...\n");
 
@@ -110,6 +149,8 @@ static void run_stage_2(int luo_fd, int state_session_fd)
 
 	ksft_print_msg("[STAGE 2] Verifying contents of session '%s'...\n",
 		       SESSION_FILES_1);
+	ksft_print_msg("  -> Retrieving memfd (token %#x) from session...\n",
+		       MFD1_TOKEN);
 	mfd1 = restore_and_verify_memfd(s_files1_fd, MFD1_TOKEN, MFD1_DATA);
 	if (mfd1 < 0)
 		fail_exit("restore_and_verify_memfd for token %#x", MFD1_TOKEN);
@@ -118,14 +159,65 @@ static void run_stage_2(int luo_fd, int state_session_fd)
 	ksft_print_msg("[STAGE 2] Verifying contents of session '%s'...\n",
 		       SESSION_FILES_2);
 
+	ksft_print_msg("  -> Creating empty tmpfs file at /mnt/mfd3...\n");
+	if (mkdir("/mnt", 0777) < 0 && errno != EEXIST)
+		fail_exit("mkdir /mnt");
+	if (mount("tmpfs", "/mnt", "tmpfs", 0, NULL) < 0)
+		fail_exit("mount tmpfs");
+	mfd3 = open("/mnt/mfd3", O_CREAT | O_RDWR, 0666);
+	if (mfd3 < 0)
+		fail_exit("open tmpfs file");
+	ro_fd = open("/mnt/mfd3", O_RDONLY);
+	if (ro_fd < 0)
+		fail_exit("open read-only tmpfs file");
+
+	ksft_print_msg("  -> Verifying retryable retrieve errors for memfd and tmpfs...\n");
+	rarg.fd = mfd3;
+	ret = luo_session_retrieve_fd_arg(s_files2_fd, MFD2_TOKEN,
+					  (uintptr_t)&rarg);
+	if (ret != -EINVAL)
+		fail_exit("expected -EINVAL when passing arg to memfd retrieve, got %d",
+			  ret);
+
+	ksft_print_msg("  -> Retrieving memfd (token %#x) from session...\n",
+		       MFD2_TOKEN);
 	mfd2 = restore_and_verify_memfd(s_files2_fd, MFD2_TOKEN, MFD2_DATA);
 	if (mfd2 < 0)
 		fail_exit("restore_and_verify_memfd for token %#x", MFD2_TOKEN);
 	close(mfd2);
 
-	mfd3 = restore_and_verify_memfd(s_files2_fd, MFD3_TOKEN, MFD3_DATA);
-	if (mfd3 < 0)
-		fail_exit("restore_and_verify_memfd for token %#x", MFD3_TOKEN);
+	ret = luo_session_retrieve_fd(s_files2_fd, MFD3_TOKEN);
+	if (ret != -EINVAL)
+		fail_exit("expected -EINVAL when retrieving tmpfs without arg, got %d",
+			  ret);
+
+	rarg.fd = ro_fd;
+	ret = luo_session_retrieve_fd_arg(s_files2_fd, MFD3_TOKEN,
+					  (uintptr_t)&rarg);
+	if (ret != -EACCES)
+		fail_exit("expected -EACCES when retrieving tmpfs into read-only fd, got %d",
+			  ret);
+	close(ro_fd);
+
+	if (ftruncate(mfd3, 1) < 0)
+		fail_exit("ftruncate non-empty tmpfs file");
+	rarg.fd = mfd3;
+	ret = luo_session_retrieve_fd_arg(s_files2_fd, MFD3_TOKEN,
+					  (uintptr_t)&rarg);
+	if (ret != -EBUSY)
+		fail_exit("expected -EBUSY when retrieving tmpfs into non-empty fd, got %d",
+			  ret);
+	if (ftruncate(mfd3, 0) < 0)
+		fail_exit("ftruncate empty tmpfs file");
+
+	ksft_print_msg("  -> Retrieving tmpfs file (token %#x) from session...\n",
+		       MFD3_TOKEN);
+	if (restore_and_verify_tmpfs(s_files2_fd, MFD3_TOKEN, mfd3,
+				     MFD3_DATA) < 0)
+		fail_exit("restore_and_verify_tmpfs for token %#x",
+			  MFD3_TOKEN);
+	if (lseek(mfd3, 0, SEEK_CUR) != MFD3_POS)
+		fail_exit("expected f_pos %d on restored tmpfs file", MFD3_POS);
 	close(mfd3);
 
 	ksft_print_msg("[STAGE 2] Test data verified successfully.\n");
-- 
2.56.0.385.gd3acb90ef8-goog

