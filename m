Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4354AA00A
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 22:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789684013; cv=none; b=OOMFJO8vgOQbY+fuAC/zdpt1ESDltzWDUqb6dIKWJg51WnDPa4nvpS+O2oIwFqrnI/rI4eTlwMKjhKCF6+b9SM0rDyaQDjUZzLlAMALg+qRsG90h94i63yUnvq/X6dJQZtzPb6ysLb9THnSDq2JK4wCL6E6pUaA7IVAHBcIcrTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789684013; c=relaxed/simple;
	bh=dH1M/vyc1MFAQw48E90smOwrG3W8MQm/arC7/achGFE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gOzcvBXJzTfMeZefh812wLihbd85TjFhVJ/eyEhP3fYHbuRMQT5eInvKNqhKKaJfBcbBHNxxxavRNB8azqigDTKqkLei4tZe84joLwKgw/TVyDfEW2xBxW0Bq7yFLoB6894yvzGL+5qJSTFLxViVM7gQmEN9EW2FnVI/ZJWrQ5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T8y/Jjhl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T8y/Jjhl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 583B21F00893;
	Thu, 17 Sep 2026 22:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789684010;
	bh=hyCHHGbbmA+viHCUOeD0u0cyeXuCDyyU6WJlzk8TPBU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=T8y/JjhlpqcsuT0XzMT/WOXuyt1iyrXHlbEXEY6eHFV+O/pvbriCLKz15E4FmqOSP
	 kJ8NDggqEsyvENCIKddvGWHnZRD3zDdioc9sG2EiNXu7IL/ndQKEyi54Hieyw3rzdb
	 xnbvULQqaJl65efOYuOJwpmeiq8btsE9F9r5jrLQ2uVgJkQIMQCAEhKZHn4UfE8B2P
	 LHzQrYwxy9uzCRYJ98oaaX/dhMxvsRSGjX2zRwPma9nrPr6e1bBSAQ2FhqdzGyL1MP
	 bQzVfTVZ6Gr5SPObra8rbLthIeRAe+z03tKYfgKAfg6dr4oaaCyyZuMUkniNOmiRsC
	 EmAUuYM04dXPw==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 17 Sep 2026 23:14:16 +0100
Subject: [PATCH 1/2] arm64/gcs: Move gcs_check_locked() out of the header
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-arm64-gcs-store-gcscre0-v1-1-3c9fa9213bac@kernel.org>
References: <20260917-arm64-gcs-store-gcscre0-v1-0-3c9fa9213bac@kernel.org>
In-Reply-To: <20260917-arm64-gcs-store-gcscre0-v1-0-3c9fa9213bac@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2217; i=broonie@kernel.org;
 h=from:subject:message-id; bh=dH1M/vyc1MFAQw48E90smOwrG3W8MQm/arC7/achGFE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqrGkkiiUHwca01XjWnKu+bIfxYdQhZZpvwz8D7
 At9a1pyRE2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqxpJAAKCRAk1otyXVSH
 0L6YB/9N+el8v6W58DQ9YZJ0l75X3dnnVNiTuBVkwf0/TsCo2TJAzbCcFUHvzRuXg4Jp5Gu0wP3
 iUqwtYZawXUS2Uxe+YnfQ8fOxMN+IxfCZo+PBOU2l0/Z+hsACmrWnzsoAUdHS/CBBeDjjwNojKV
 FOWDLtcNEhx2FpHnljkl6QewJO8cOfPompldLAqUynGab/K6k+n0W2tOzVAeBiz1qc8NzOvkh6C
 CiCehOTJExIn2rFLuirMhZkSo+JfAA2VLWPLdSx8rDB/xRLF/dVY53tTtIYe2KQkR8q6BQ1GTAw
 mEBNIsO2DvqdjHuiSgT1MCdQLAO5K/Up40sEhmJ90vLZWBvU
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

gcs_check_locked() is currently a static inline in the header but there
is no real reason for this, it is not especially performance critical.
Move the implementation into gcs.c to reduce the size of the header and
make future refactoring a little easier, no functional changes.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/gcs.h | 15 +--------------
 arch/arm64/mm/gcs.c          | 13 +++++++++++++
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/include/asm/gcs.h b/arch/arm64/include/asm/gcs.h
index bbc22e382cfe..3e6eeeebd282 100644
--- a/arch/arm64/include/asm/gcs.h
+++ b/arch/arm64/include/asm/gcs.h
@@ -62,25 +62,12 @@ static inline bool task_gcs_el0_enabled(struct task_struct *task)
 }
 
 void gcs_set_el0_mode(struct task_struct *task);
+int gcs_check_locked(struct task_struct *task, unsigned long new_val);
 void gcs_free(struct task_struct *task);
 void gcs_preserve_current_state(void);
 unsigned long gcs_alloc_thread_stack(struct task_struct *tsk,
 				     const struct kernel_clone_args *args);
 
-static inline int gcs_check_locked(struct task_struct *task,
-				   unsigned long new_val)
-{
-	unsigned long cur_val = task->thread.gcs_el0_mode;
-
-	cur_val &= task->thread.gcs_el0_locked;
-	new_val &= task->thread.gcs_el0_locked;
-
-	if (cur_val != new_val)
-		return -EPERM;
-
-	return 0;
-}
-
 static inline int gcssttr(unsigned long __user *addr, unsigned long val)
 {
 	register unsigned long __user *_addr __asm__ ("x0") = addr;
diff --git a/arch/arm64/mm/gcs.c b/arch/arm64/mm/gcs.c
index 680749611a9a..84add924dc60 100644
--- a/arch/arm64/mm/gcs.c
+++ b/arch/arm64/mm/gcs.c
@@ -140,6 +140,19 @@ void gcs_set_el0_mode(struct task_struct *task)
 	write_sysreg_s(gcscre0_el1, SYS_GCSCRE0_EL1);
 }
 
+int gcs_check_locked(struct task_struct *task, unsigned long new_val)
+{
+	unsigned long cur_val = task->thread.gcs_el0_mode;
+
+	cur_val &= task->thread.gcs_el0_locked;
+	new_val &= task->thread.gcs_el0_locked;
+
+	if (cur_val != new_val)
+		return -EPERM;
+
+	return 0;
+}
+
 void gcs_free(struct task_struct *task)
 {
 	if (!system_supports_gcs())

-- 
2.47.3

