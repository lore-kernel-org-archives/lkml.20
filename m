Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4333FE35C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763312; cv=none; b=PMqSlEo6BymKVqsuxY1E3pfnpd8agvP+HwVDVDK3L0jtIb5F5Xg1PbjmgR8MB/j1m4G1yi2t5/FXP0paeddft9RVjj0eIRGoY/dCHPyIH/+Q7SyDeuZ7Pmu4kw9AU4CNV0eS+Zci06kbH2DHmX88XMt2FgxDyGwlft7qwK2GoiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763312; c=relaxed/simple;
	bh=eafPgUhy9IynSAtvFbXAit1hK6ESnxmns9zqLM/jKZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lGKrPk2x4trXunmh1/igiiPVmdivSQMqsnyjQepWjruZqKCa6mJ9ODnZM3ACFe6+41wOqa56yZDM4t8fL+dqqwxAwAQMEZITO33hLz9L0ohN+wnC68H8tmBId0s3lWlLE0UyYM+AVR5GH7p4ivLK+iO1yHCJib516uSEWLnMK6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e+xAe+Bo; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e+xAe+Bo"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38e041ea211so2388239a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788763309; x=1789368109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AeK2I1AiWRpjY7VAGe4JrwBL3S2TxoFeFpHn4sVFSG4=;
        b=e+xAe+Bo0nwJI5oTNV94ciTCBgdy2KejrvEjAMDuSqgoRVOI64A62mILLxFCvhC1aZ
         /PRTqjm6Gj29RCLscxvM0fGwb+xKx//LzPP/4mVB0VGPonwPvyqXFHv8YvjV/7+2zwB2
         AMj482hST5UTYoQCQg/Co3sNVhYpGvAjhTtde3s/wJxjp2MOiIs8Xk0aiFUehuX/1kbA
         qaHTUg0eaSbyHGCNjWZhH+ukQoqA1sHk8IfOuXcdk3yIeU/fqiQbkqSiehgY8S96JXNp
         44klfgp+18i0gQWBXAiTlQH4vVvwIvFlGKo2x50shy4PomIN+0RcaWir+25YhLS86Bo2
         7p3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788763309; x=1789368109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AeK2I1AiWRpjY7VAGe4JrwBL3S2TxoFeFpHn4sVFSG4=;
        b=qbTAHYJhu6ZvzKt+OK6gPpL+kkNRdIiSmeDtWzENv10d3Zgs6C1ja6dmuB5I+GJ60g
         ZyVJYHkRHKMhlbyLADHkY6wISbuzqi9Nsjpe4jUsHbzJ0f7rMOOEwtVGLX6Cj94TWeol
         L9mGoz6vNt1YmPf4PouuLuNAv+JDdsVNTQwjlZRdseLiBj/Nb5ewLWPU9QTKrYip0r/C
         PRIzNt/N7uFGB4IN7EVdLafuyzmokBbMoisvH+M92mtYfDWHsSjeDwdcSk3Lg0URxb5k
         wwIw/eK/3BnclborJpTOL2N45zDMSgw1g9qYIaxYfJXzVaPviAAfAV/slW2BognVuNFp
         NzAA==
X-Forwarded-Encrypted: i=1; AKwUvBwNaytvxdJp1htn2DRlGTjVVmARZZDj+hBFoMO5f1oBqMR3mBtkR7ASzOulCqqguAob+wJ4Dwy2V2koGpI=@vger.kernel.org
X-Gm-Message-State: AFuF++kLt61BRhKVmcRgzMGeqd2w7MqmtX9TA0Zh3LvyD6mVeCB4rSJe
	TNjn2ZrkOf0aqeynd1BIOYSjnL6DitqvmARal1QZdoEKEnnJdyJjcWnO
X-Gm-Gg: AYBFou1VwModMsmhK2qwwBv5W5LN7mSFJcIPDackumxwrQxLdsPGxRznndt5wyMj7OT
	GySy5BvFEMqutWBgoNzNZCrPHtgrEJ0g2qXJb6cgZ2vcOUH9UbdJhufrx2E+FaRSXOlOUwIWMiV
	VEIn54domgvg8d1OU4LuuXyZq1I85iaB0KXfFkApQZdkzepcyMOvX7bV3UjdTriLKDua8I0iES4
	cuymhmaIEAhmcysm5OKnXUC5EPH+xJV0kN+ZNb5opH4Bof+uSCNPruIV0GZu0ehJhrviXFRRik5
	HFe3cNnYGDHxKSGwne7DK6tnXfMNpgL/s3mqhBemeGoZM7Bd+tC8Ph79cBtEfwPLUTcMhnsoVS1
	z7ad5RiTz3Rvm9D5g/OBsRfW8FrSNNTtbIFHVh1mqthX5izRbkQpgYg9TyGOfCpK9LPtBULzW8J
	VYRjoSB4VBFBn+lM1kinKdASZsMYRwMFiuKTCAJoy72Kr3BbDzuxfkG5gXT7FHCm4humzlx0kGp
	W3gdKrFh/WqjgQ7+739aFP8
X-Received: by 2002:a17:90b:2808:b0:398:b46d:48c0 with SMTP id 98e67ed59e1d1-39b262aaeb7mr33803957a91.18.1788763309146;
        Sun, 06 Sep 2026 23:41:49 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143240d86c3sm22413038c88.0.2026.09.06.23.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:41:48 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Shuah Khan <shuah@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	x86@kernel.org,
	Dave Martin <Dave.Martin@arm.com>,
	James Morse <james.morse@arm.com>,
	Babu Moger <babu.moger@amd.com>,
	Ming Lei <tom.leiming@gmail.com>
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-block@vger.kernel.org
Subject: [PATCH 1/2] selftests: fix typos in comments
Date: Mon,  7 Sep 2026 12:11:37 +0530
Message-ID: <20260907064138.38689-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907064138.38689-1-hemanth.selam@gmail.com>
References: <20260907064138.38689-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 tools/testing/selftests/amd-pstate/tbench.sh | 4 ++--
 tools/testing/selftests/proc/setns-dcache.c  | 2 +-
 tools/testing/selftests/proc/setns-sysvipc.c | 2 +-
 tools/testing/selftests/resctrl/resctrlfs.c  | 6 +++---
 tools/testing/selftests/ublk/kublk.h         | 2 +-
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/amd-pstate/tbench.sh b/tools/testing/selftests/amd-pstate/tbench.sh
index 2a98d9c9202e..b54b9d0396a1 100755
--- a/tools/testing/selftests/amd-pstate/tbench.sh
+++ b/tools/testing/selftests/amd-pstate/tbench.sh
@@ -103,7 +103,7 @@ parse_tbench()
 	en_sum=$(awk 'BEGIN {sum=0};{sum += $1};END {print sum}' $OUTFILE_TBENCH-energy-$1-$2.log)
 	printf "Tbench-$1-#$2 power consumption(J): $en_sum\n" | tee -a $OUTFILE_TBENCH.result
 
-	# Permance is throughput per second, denoted T/t, where T is throught rendered in t seconds.
+	# Permance is throughput per second, denoted T/t, where T is through rendered in t seconds.
 	# It is well known that P=E/t, where P is power measured in watts(W), E is energy measured in joules(J),
 	# and t is time measured in seconds(s). This means that performance per watt becomes
 	#       T/t   T/t    T
@@ -161,7 +161,7 @@ gather_tbench()
 	avg_en=$(awk 'BEGIN {sum=0};{sum += $1};END {print sum/'$LOOP_TIMES'}' $OUTFILE_TBENCH-energy-$1.log)
 	printf "Tbench-$1 avg power consumption(J): $avg_en\n" | tee -a $OUTFILE_TBENCH.result
 
-	# Permance is throughput per second, denoted T/t, where T is throught rendered in t seconds.
+	# Permance is throughput per second, denoted T/t, where T is through rendered in t seconds.
 	# It is well known that P=E/t, where P is power measured in watts(W), E is energy measured in joules(J),
 	# and t is time measured in seconds(s). This means that performance per watt becomes
 	#       T/t   T/t    T
diff --git a/tools/testing/selftests/proc/setns-dcache.c b/tools/testing/selftests/proc/setns-dcache.c
index 60ab197a73fc..70389832dd22 100644
--- a/tools/testing/selftests/proc/setns-dcache.c
+++ b/tools/testing/selftests/proc/setns-dcache.c
@@ -50,7 +50,7 @@ int main(void)
 
 	atexit(f);
 
-	/* Check for priviledges and syscall availability straight away. */
+	/* Check for privileges and syscall availability straight away. */
 	if (unshare(CLONE_NEWNET) == -1) {
 		if (errno == ENOSYS || errno == EPERM) {
 			return 4;
diff --git a/tools/testing/selftests/proc/setns-sysvipc.c b/tools/testing/selftests/proc/setns-sysvipc.c
index 903890c5e587..d03aa4838f0f 100644
--- a/tools/testing/selftests/proc/setns-sysvipc.c
+++ b/tools/testing/selftests/proc/setns-sysvipc.c
@@ -49,7 +49,7 @@ int main(void)
 
 	atexit(f);
 
-	/* Check for priviledges and syscall availability straight away. */
+	/* Check for privileges and syscall availability straight away. */
 	if (unshare(CLONE_NEWIPC) == -1) {
 		if (errno == ENOSYS || errno == EPERM) {
 			return 4;
diff --git a/tools/testing/selftests/resctrl/resctrlfs.c b/tools/testing/selftests/resctrl/resctrlfs.c
index b9c1bfb6cc02..b6d69bf4fc1f 100644
--- a/tools/testing/selftests/resctrl/resctrlfs.c
+++ b/tools/testing/selftests/resctrl/resctrlfs.c
@@ -517,8 +517,8 @@ int get_mask_no_shareable(const char *cache_type, unsigned long *mask)
 
 /*
  * taskset_benchmark - Taskset PID (i.e. benchmark) to a specified cpu
- * @bm_pid:		PID that should be binded
- * @cpu_no:		CPU number at which the PID would be binded
+ * @bm_pid:		PID that should be bound
+ * @cpu_no:		CPU number at which the PID would be bound
  * @old_affinity:	When not NULL, set to old CPU affinity
  *
  * Return: 0 on success, < 0 on error.
@@ -693,7 +693,7 @@ int write_bm_pid_to_resctrl(pid_t bm_pid, const char *ctrlgrp, const char *mongr
  * write_schemata - Update schemata of a con_mon grp
  * @ctrlgrp:		Name of the con_mon grp
  * @schemata:		Schemata that should be updated to
- * @cpu_no:		CPU number that the benchmark PID is binded to
+ * @cpu_no:		CPU number that the benchmark PID is bound to
  * @resource:		Resctrl resource (Eg: MB, L3, L2, etc.)
  *
  * Update schemata of a con_mon grp *only* if requested resctrl resource is
diff --git a/tools/testing/selftests/ublk/kublk.h b/tools/testing/selftests/ublk/kublk.h
index d98f3d612d88..88248b802c86 100644
--- a/tools/testing/selftests/ublk/kublk.h
+++ b/tools/testing/selftests/ublk/kublk.h
@@ -257,7 +257,7 @@ struct ublk_thread {
 	unsigned short nr_bufs;
 	unsigned short auto_buf_stride;
 
-       /* followings are for BATCH_IO */
+       /* following are for BATCH_IO */
 	unsigned short commit_buf_start;
 	unsigned char  commit_buf_elem_size;
        /*
-- 
2.48.1

