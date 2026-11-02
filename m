Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793645514;
	b=h+efqVQ7cP91SgZZOLv1nbmbvzoK0PnY/JU5Ms4aolfvrTpJ6bpr6w1S4P985+fDRRO0
	 EtuK+zq+uEm0/ueBcChLIqkXSMCKWJtgOzAoX+75rxDMV5xM22AAekmWNNd/aXy/imgY1
	 M0wDmide5wl5C1kPOsNl/g8JnXT+icxxmQ7PxsjyL4hnYBSct6JYbdAE3HQkRZ1IZAsZ/
	 zw4+ygZKXrkbhPnPuxOi1Qy1+4b5yF4y2Ndra0wodFaI6JIJikquBLDvSBGXeJ6Kqv/Ox
	 8eN+eMxaUkooI8NXImfw9sxw2/Ib5i2v7+qLuC4fX4DhRHKwa/K2UXOM9u2rpomEqlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793645514;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jUhK5m1lvTjtdfmztu+bilD4B6b4ERUK5SOg2m81DN4=;
	b=lUDwuV0MYfT9aD9MDigg54IsrIa1NBESE5Azccz1iAgzuEROiH7FCuBYc4anU3Vz+yHl
	 NGIQtnlmdizgdiPDRtJAIgNoBPE4hHcXQPiQ/uKKioD0qpri39Ew4NfAR5yhGdt3gCNfc
	 d0EDNYA6W8moOm2VCwjuqtav1DQrKUKkAPD2nbb4+0mUKgKAM1sWUYIibIvlaz1bnkQUl
	 JE03M/pkMZbo+OaqD4ecJ3WdkLaiXktZnopwXQHIq6HTer8t19kRSirVy9PLdvRuVh/Ra
	 g9C10QpvT3Fsb7rzRRekbldrd81TebWGr9ijhm5gUk+xoIwmi9Z+iQWnEVRp5vp03lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CqAS3Mzh;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA94606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 18:51:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFA94606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CqAS3Mzh
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48b060ec084so1992101f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 10:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793645512; x=1794250312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jUhK5m1lvTjtdfmztu+bilD4B6b4ERUK5SOg2m81DN4=;
        b=CqAS3MzhLYzg+B3jKeGN3yX4yq1SxSwhC86d6uYzoHUr89jLXMs9uLMiSJAJ7Ub+iH
         znMrNrNTfQ1Pwb+rIeySiVqrW9e/SRwcwJ2Z2VNdN9P/sa0B86STdO7qVdUx4hY+g4Vt
         vHnLQWSPCkOZL7bayIjJQf5A6NHjvXFEy+PZmZG+jHOWrQ9fHZR7MBQ5FEhNCE5MRBN3
         h7OdM79DoV3FhvRuILYZXbtFL4OGvnNuu5Oai8mlNnrrzMhHdKYJXZ2RqfI8Z18VArMl
         3ycXtja8msh7ppZopdmNbyszb9hc5nzmKaF9B9jLuBZ/CYIXZliiTUZwP6lf0EjyIA5g
         ZAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793645512; x=1794250312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jUhK5m1lvTjtdfmztu+bilD4B6b4ERUK5SOg2m81DN4=;
        b=D/FInhqo7IDCQcVXAPKVPfKNL1qoyGOszEppt7hPpN8TNpzRRk+aT68ugVJ3ZVsZCz
         eozNckLDxEzZ6I3xyxv7AWy3DIpPA02Desr9FK8My4v8KiZnm8bZQIBfY8IBHZ+jfGK7
         KGZg4yZjR6KGw9hWJoX/89f7jUVoph9Fwe9tJjxM8Swu5tJqAeNsnjCSls+EFKvm2MDI
         HyWpWd0WLNLHdP1I+ojAoSA8mj/rkYAUQ34bV70vqVHOwZ1uqPpPQw9M8Zm0OMua3oSg
         TrdRBPxXHE2wh9WeUHJaoV/D1uvgnYBuooTAoWsRgpBNKr/7Avy+cY1tXbZ76ZVyosCZ
         AnLg==
X-Forwarded-Encrypted: i=1; AKwUvBzpLsLRZ9urPGcp7HgDsHeMWpykaOtof5WJ5lxVxUiICnb6vPpnnxAyoSd2rQK/o+X5rvqdQ+klTiu2wUs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aIW+SHKYBQIf/yNJU2OjhYoFPkxoil1H8xKWxqVTo6afPFzfo
	gDgljEE+U+rzPuSNaxMwZUlEPJvBc4jCr4TlpvCxGmmOsJwSjSp7AD8M
X-Gm-Gg: AYBFou0PZzH9hgAPceoF0VD07hr4gE6HmugNErKDHtaHIgvsr+yue/J5dBCiYlZeMmJ
	9IVnsE4Ed0VQnTy2XYATDBwu4Eg8z2BxBjjERl3XvbMmxVVQIVdvWL+HwzZ9DCrCYhj62aYWWmL
	68yDVFgvYR1CFPKCCiFo/rB5jzwfC7Ok4m6lcaxvMVzVJh99h9PwpeKbPHR3SvzjU4onS0lAOer
	Ty+U1Z8a7N+nyTY/POnExlaOTD/oNtNlZEYrcY4oeIKOTm2cFWoCPmpLOlU81MSeNOeJY/s9Uz8
	f2PBCw0inAvDD+eKLxeVrqBli90KHvohtbnsx3et5tBYktdN0EbHwTNdBZ7RgbTM/UGmh5q1Gov
	ShsG5jyBhaovpZSXm39qN0FsJIScC4J9nyJ32LxxEEFk5BLHNVrayT/hyPeb8eij7u5pkaM8rI0
	I+JEevlyrtYCzLPNFH6+M18jI7siCF0GwnuvH4Xu0LTzKx4AD5qCoRhEUbfgfVwB+pNSF/6/1om
	zxwXAIPI5NUVF6/046CudBn8HJuNZ+ySk/qsQB8+caTrR5CocKxgMuGkNTZER0dj9XWXWG9mzEZ
	VQ1acfxKQvoeFAE+K6PfSDI=
X-Received: by 2002:a05:6000:4559:b0:488:79d6:a4a6 with SMTP id ffacd0b85a97d-48e6e2bc780mr16125799f8f.8.1793645512031;
        Mon, 02 Nov 2026 10:51:52 -0800 (PST)
Received: from fedora ([2a02:4540:28:4cc2:7f6a:92cc:ff40:8b84])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b728f9sm21260812f8f.10.2026.11.02.10.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 10:51:51 -0800 (PST)
From: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
To: kas@kernel.org
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	shuah@kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yeoreum.yun@arm.com,
	ziy@nvidia.com,
	Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
Subject: [PATCH v2] selftests/mm: handle child status safely in khugepaged
Date: Mon,  2 Nov 2026 22:21:30 +0330
Message-ID: <20261102185130.30504-1-ampr.mhd@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <auhvkuDO8cP9Pip4@thinkstation>
References: <auhvkuDO8cP9Pip4@thinkstation>
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

collapse_fork(), collapse_fork_compound() and
collapse_max_ptes_shared() take the child result from
WEXITSTATUS() without checking WIFEXITED(). For a child
killed by a signal WEXITSTATUS() is 0, which is KSFT_PASS:
the parent runs its own checks and the test reports ok even
though the child crashed.

Fail the test when the child did not exit normally, and print
the signal that killed it. Also fail when fork() fails,
instead of reading an uninitialised status.

Use get_child_status() in all four fork tests, and use
wait_for_child() to handle fork() and waitpid() in the
three blocking-wait tests.

Fixes: bd212a7dbdb1 ("kselftest: mm: return fail when child test result is fail in khugepaged")
Signed-off-by: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
---
 tools/testing/selftests/mm/khugepaged.c | 61 +++++++++++++++++++------
 1 file changed, 48 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index 1bc7acc66a46..b90daf008239 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -1004,9 +1004,44 @@ static void collapse_compound_extreme(struct collapse_context *c, struct mem_ops
 	ksft_test_result_report(exit_status, "%s\n", __func__);
 }
 
-static void collapse_fork(struct collapse_context *c, struct mem_ops *ops)
+static int get_child_status(int wstatus)
+{
+	char buf[64];
+
+	if (WIFEXITED(wstatus))
+		return WEXITSTATUS(wstatus);
+
+	if (WIFSIGNALED(wstatus)) {
+		snprintf(buf, sizeof(buf), "Child killed by signal %d",
+			 WTERMSIG(wstatus));
+		fail(buf);
+	} else {
+		fail("Child terminated abnormally");
+	}
+
+	return KSFT_FAIL;
+}
+
+static int wait_for_child(pid_t pid)
 {
 	int wstatus;
+
+	if (pid < 0) {
+		fail("fork() failed");
+		return KSFT_FAIL;
+	}
+
+	if (waitpid(pid, &wstatus, 0) == -1) {
+		fail("waitpid() failed");
+		return KSFT_FAIL;
+	}
+
+	return get_child_status(wstatus);
+}
+
+static void collapse_fork(struct collapse_context *c, struct mem_ops *ops)
+{
+	pid_t pid;
 	void *p;
 
 	p = ops->setup_area(1);
@@ -1019,7 +1054,8 @@ static void collapse_fork(struct collapse_context *c, struct mem_ops *ops)
 		fail("Fail");
 
 	ksft_print_msg("Share small page over fork()...");
-	if (!fork()) {
+	pid = fork();
+	if (pid == 0) {
 		/* Do not touch settings on child exit */
 		if (ops->check_huge(p, hpage_pmd_size, 0, hpage_pmd_size))
 			success("OK");
@@ -1035,8 +1071,7 @@ static void collapse_fork(struct collapse_context *c, struct mem_ops *ops)
 		_exit(exit_status);
 	}
 
-	wait(&wstatus);
-	exit_status = WEXITSTATUS(wstatus);
+	exit_status = wait_for_child(pid);
 	if (exit_status == KSFT_FAIL)
 		goto out;
 
@@ -1053,12 +1088,13 @@ static void collapse_fork(struct collapse_context *c, struct mem_ops *ops)
 
 static void collapse_fork_compound(struct collapse_context *c, struct mem_ops *ops)
 {
-	int wstatus;
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
@@ -1085,8 +1121,7 @@ static void collapse_fork_compound(struct collapse_context *c, struct mem_ops *o
 		_exit(exit_status);
 	}
 
-	wait(&wstatus);
-	exit_status = WEXITSTATUS(wstatus);
+	exit_status = wait_for_child(pid);
 	if (exit_status == KSFT_FAIL)
 		goto out;
 
@@ -1104,12 +1139,13 @@ static void collapse_fork_compound(struct collapse_context *c, struct mem_ops *o
 static void collapse_max_ptes_shared(struct collapse_context *c, struct mem_ops *ops)
 {
 	int max_ptes_shared = thp_read_num("khugepaged/max_ptes_shared");
-	int wstatus;
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
@@ -1146,8 +1182,7 @@ static void collapse_max_ptes_shared(struct collapse_context *c, struct mem_ops
 		_exit(exit_status);
 	}
 
-	wait(&wstatus);
-	exit_status = WEXITSTATUS(wstatus);
+	exit_status = wait_for_child(pid);
 	if (exit_status == KSFT_FAIL)
 		goto out;
 
@@ -1248,7 +1283,7 @@ static void collapse_fork_cow_race(struct collapse_context *c, struct mem_ops *o
 	for (; i < n; i++)
 		ip[i * stride] = i + 0xbeef0000;
 	/* A child that died reading the racing pages is a failure, not a zero */
-	child_status = WIFEXITED(wstatus) ? WEXITSTATUS(wstatus) : KSFT_FAIL;
+	child_status = get_child_status(wstatus);
 
 	ksft_print_msg("Check the parent sees only its own writes...");
 	for (i = 0; i < n; i++)
-- 
2.55.0

