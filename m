Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793397530;
	b=O5/8fGR2DOl2HMudzBVpK2mwMNQegoD7ZQwhf8c1KCcC9rQ9BFCGF4RHrQBbJpbXtA4w
	 JIduPopWh/9yGFQio4Hs6cMugdK/nwKIDwmAlyGg3onW7ioie9O22FDF+R36LYEx+n3rb
	 gz3suxY1r8wwQlKs8oFeKufxzpbi7lqe9YRM7mJkPU3noqUyOvLQesVBi2orM549FK0ov
	 sA2fnHkhtWRFKGtE1IaMvqDr25z07y5gOcj6qysP4UzEYSr3QtMf9E3Nte0IDuW2gB6ZC
	 1aWwbFgPeJ7jI2VLB2g0km5FsMFYC27r6XHWf3WdTShyBmcT2P/UB4LgLd/lI1S0f6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793397530;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Yx1pZLwwkBWkRpnVSBKgTH165jQvpQXHy1+6SegQOjs=;
	b=hZepn0y1sxrGnbnF4gT1b0IQXvSGY1GMEd/B6XucPXF71f9NL+kZmniCkZ3NJ2COeRLP
	 HphvxsMkezCX2uuISUfDZuJpqW+9vXXpEz5WI1/2Fs3StoQ+KnXf3BtHpMNv3BjsAN+mk
	 gIN/tlDbidYiN4qyBOFOpqTC/n1K9A9JRAuMHhPhlZRX4sNQiale6QGo0cxtUYPtcBoTw
	 lxzkfLfmgVWjWP0IBlSngUNL1WaISaJQ73B3A0iKj4uBOaqj7H5PsB4cXJis9cyyMEB5a
	 5fZpWLXJ5pdhe0JoszZX9J4l8nJ/9nQfi0BBTjTxRhqHXZEdP3xP0hh57YrR16+4Lig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i92gPEUD;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5401606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:58:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5401606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i92gPEUD
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48df4f540ebso601426f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793397528; x=1794002328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yx1pZLwwkBWkRpnVSBKgTH165jQvpQXHy1+6SegQOjs=;
        b=i92gPEUDyMGl87Bni12lIhJYA35+je6eGDu/IbhGrl7zFcJgHN70Ms7/OIyFCpPAch
         5sJ4rGyxEJsLPUxGBJEXDaGq5vx0uUN5EfuEEVQjPzIkeXXzdyuVaxxcZkupYg44rg92
         C2JFcS2DQENfuR/iH6TUaJXf9Xq+WC4S80JLVRjP7R9VkZySw1E3nLM3xx/Z9K+XtbzW
         wHSJgLt40uz+jeFIGZOQAuYfsv5Fo5lWWmi+LlxGluHoL4dv59dgkiKmITSmRqLF+EhA
         O+8vUjGeKNjs0GT7Jc26SNfLsJF3D+/N7wdE67lWwhtf+Mqj5SKzCk4y5NBe38mImVRp
         Yfqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793397528; x=1794002328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yx1pZLwwkBWkRpnVSBKgTH165jQvpQXHy1+6SegQOjs=;
        b=tDWYU8IQe42p1OcPw+FduAbW2F3iqoEv+cZ/8BdB1+wLSA+s09bxMwf8zg6Boq0pKO
         DVF9j/4STKnBLuPAlDm5/Am6qkiHwTtnruEAcZlRj+enspgxqc15W148CARQ0NCnm2Bd
         J+Kgt4aEro11lOWoaKjUcF+ERgi4Rt0h7sstQGsfTy/K9XIzaGM+MR2Zs8p1a+SeMBeb
         DqF0NpIcbP7iQosDTXRnNxiOpjk7lbT2EHZgV5+P5G2+gHXTJH7TtS+bk/vE5EcbbwTj
         OzbqNlbgt/QzhK3/AtX4m2o6mTVx3hsyB12HtXpxqvaexXSJvlY/8lurPyy9zSdUSyor
         1j4g==
X-Forwarded-Encrypted: i=1; AKwUvBz8xOR3JdRtCEtsfdsTLW/fX/+4NbWjJQyBXWXdCJNPUbbMRH9TczYwALmX34d82pj554uSJC982eRKH3Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKsMf6KZiRQEtSH/5G1aH9s5yrEa/BSi8F5mtOJXYpmRZmYZDV
	NvVJ1vlH/hECLeE5MwLhY737uz2iuNgFydeCQ+eRFIHGaz90CR327QuU
X-Gm-Gg: AYBFou0MAjsoBhyE0Bq3j8VT2QoJ7UwwHQUJDTXfpONKnoYO49TMZyJ3vPmupIJUoLl
	9AsGXkPCSFQFRWIqO379thLFbOIrBvDmVHQ6vlSgHnNT/NiA850/cz3pZZiAiO0LcPonEuo5aq9
	8gDfvFk2AMhm34T4b6iEVMdDDy21HP430X6igjg+2arlAiZKrcQ6tuizyzK6rpUG/l9IV8dKTZU
	0866wkR24+3+EBSgrIgp6+JGv4dXu+OtzEwZN1IJwo27lzDrtxmV0Zrp8VY4V5G8FQCP4THuCQo
	VXXh9MPu0JtGAVBYw1K8q3zViPQiZWzwsXjXKHzFq58bGn7tQFR1CkLBxTSh7lOsZAesDf46CZY
	R6gFgBTuY9hpzftoM7L8JY3UgSg/rGnNTfNE6o0E5GYYuRiMAZActsZp2reUPklJ+VLc7xa0Htb
	B3MB3Ty+7oB8uPyUB8lX0phGzuD1x/ea8FDBsAvBiLs/Khlw3Eghd5UxZNwRCOJjHOjvIMPwIrF
	05wISBRjFwzwwES3wArT3bOrifJVgdb+Iwy5MPqa96P/XXupBQE5iNLoToRsROL+/PttzH85wlo
	s/DFGo8BoH/iyQkdJh2Hi5M88E4hitR70jbDlFpoQSTsuTQUOH6crAZM6a3X
X-Received: by 2002:a05:6000:402c:b0:48d:f39b:83de with SMTP id ffacd0b85a97d-48e6e2bdf87mr10007670f8f.3.1793397527950;
        Fri, 30 Oct 2026 14:58:47 -0700 (PDT)
Received: from fedora.domain.name ([217.218.153.252])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b9b54dsm5312409f8f.47.2026.10.30.14.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:58:47 -0700 (PDT)
From: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	shuah@kernel.org
Cc: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kas@kernel.org,
	yeoreum.yun@arm.com,
	ziy@nvidia.com,
	Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
Subject: [PATCH] selftests/mm: handle child status safely in khugepaged
Date: Sat, 31 Oct 2026 01:28:41 +0330
Message-ID: <20261030215841.229969-1-ampr.mhd@gmail.com>
X-Mailer: git-send-email 2.55.0
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

The khugepaged selftest reports child exit status through a shared
variable without checking that the child actually ran to completion.
When fork() fails or the child is killed by a signal, the status is
undefined and the test can report a false pass.

Capture the waitpid() result and distinguish normal exit, signal
death, and fork failure before interpreting the status. Report the
child's actual termination cause in the TAP output so failures are
visible rather than silently masked.

Signed-off-by: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
---
 tools/testing/selftests/mm/khugepaged.c | 57 +++++++++++++++++++++----
 1 file changed, 48 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index 1bc7acc66a46..2dd68dde1c14 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -1007,6 +1007,7 @@ static void collapse_compound_extreme(struct collapse_context *c, struct mem_ops
 static void collapse_fork(struct collapse_context *c, struct mem_ops *ops)
 {
 	int wstatus;
+	pid_t pid;
 	void *p;
 
 	p = ops->setup_area(1);
@@ -1019,7 +1020,8 @@ static void collapse_fork(struct collapse_context *c, struct mem_ops *ops)
 		fail("Fail");
 
 	ksft_print_msg("Share small page over fork()...");
-	if (!fork()) {
+	pid = fork();
+	if (pid == 0) {
 		/* Do not touch settings on child exit */
 		if (ops->check_huge(p, hpage_pmd_size, 0, hpage_pmd_size))
 			success("OK");
@@ -1034,9 +1036,20 @@ static void collapse_fork(struct collapse_context *c, struct mem_ops *ops)
 		ops->cleanup_area(p, hpage_pmd_size);
 		_exit(exit_status);
 	}
+	if (pid < 0) {
+		fail("fork() failed");
+		goto out;
+	}
+
+	while (waitpid(pid, &wstatus, 0) == -1) {
+		if (errno == EINTR)
+			continue;
 
-	wait(&wstatus);
-	exit_status = WEXITSTATUS(wstatus);
+		fail("waitpid() failed");
+		goto out;
+	}
+
+	exit_status = WIFEXITED(wstatus) ? WEXITSTATUS(wstatus) : KSFT_FAIL;
 	if (exit_status == KSFT_FAIL)
 		goto out;
 
@@ -1054,11 +1067,13 @@ static void collapse_fork(struct collapse_context *c, struct mem_ops *ops)
 static void collapse_fork_compound(struct collapse_context *c, struct mem_ops *ops)
 {
 	int wstatus;
+	pid_t pid;
 	void *p;
 
 	p = alloc_hpage(ops);
 	ksft_print_msg("Share huge page over fork()...");
-	if (!fork()) {
+	pid = fork();
+	if (pid == 0) {
 		/* Do not touch settings on child exit */
 		if (ops->check_huge(p, hpage_pmd_size, 1, hpage_pmd_size))
 			success("OK");
@@ -1084,9 +1099,20 @@ static void collapse_fork_compound(struct collapse_context *c, struct mem_ops *o
 		ops->cleanup_area(p, hpage_pmd_size);
 		_exit(exit_status);
 	}
+	if (pid < 0) {
+		fail("fork() failed");
+		goto out;
+	}
+
+	while (waitpid(pid, &wstatus, 0) == -1) {
+		if (errno == EINTR)
+			continue;
+
+		fail("waitpid() failed");
+		goto out;
+	}
 
-	wait(&wstatus);
-	exit_status = WEXITSTATUS(wstatus);
+	exit_status = WIFEXITED(wstatus) ? WEXITSTATUS(wstatus) : KSFT_FAIL;
 	if (exit_status == KSFT_FAIL)
 		goto out;
 
@@ -1105,11 +1131,13 @@ static void collapse_max_ptes_shared(struct collapse_context *c, struct mem_ops
 {
 	int max_ptes_shared = thp_read_num("khugepaged/max_ptes_shared");
 	int wstatus;
+	pid_t pid;
 	void *p;
 
 	p = alloc_hpage(ops);
 	ksft_print_msg("Share huge page over fork()...");
-	if (!fork()) {
+	pid = fork();
+	if (pid == 0) {
 		/* Do not touch settings on child exit */
 		if (ops->check_huge(p, hpage_pmd_size, 1, hpage_pmd_size))
 			success("OK");
@@ -1145,9 +1173,20 @@ static void collapse_max_ptes_shared(struct collapse_context *c, struct mem_ops
 		ops->cleanup_area(p, hpage_pmd_size);
 		_exit(exit_status);
 	}
+	if (pid < 0) {
+		fail("fork() failed");
+		goto out;
+	}
+
+	while (waitpid(pid, &wstatus, 0) == -1) {
+		if (errno == EINTR)
+			continue;
+
+		fail("waitpid() failed");
+		goto out;
+	}
 
-	wait(&wstatus);
-	exit_status = WEXITSTATUS(wstatus);
+	exit_status = WIFEXITED(wstatus) ? WEXITSTATUS(wstatus) : KSFT_FAIL;
 	if (exit_status == KSFT_FAIL)
 		goto out;
 
-- 
2.55.0

