Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D631041612A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 16:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788280738; cv=none; b=XtL7leBPAw+bvyNcKN+wvFE1czjexi0wqYBuoEZ+0q4utg6rMpUyJFWBKonuyKRHkrK1RlmWgq8MG76OI1PZ8SAXo3DQOCpur1wTwk7j9pRz8N4er9BOf3ZnJWu7AnZcPQteNFyT6QkYhu0JWGs+AH2d4SjJzyv8B0vrOXmVI0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788280738; c=relaxed/simple;
	bh=9p9dH37muB7+UwwMmHjZ+w8JlyYEwAjypEeoPgnqW84=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=G7weGpc30uYI4NHaHxrYVWEIpoQi4s+KjOlnWgnfxocxoCvXqNgK+2Fj6t8LLY6d20600aCYei1i+D9qmyyiHe4LoeU7lZOY3+1ubiw31SxaFDwOKqKvTgPKjhW7uQQGuFrvijtcjOCzE6BVPmgf2phhlSkdhADsWbWOspE2v9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VwXcytPB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VwXcytPB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5229C1F000E9;
	Tue,  1 Sep 2026 16:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788280736;
	bh=7G6wtywXBL6Oe+BNpE1IC0BYK1ju486mfyAnAvrnvno=;
	h=From:Date:Subject:To:Cc;
	b=VwXcytPBB3xq01bgtsYzDRiy8R9ma/O5g0JxY2fteVEoAZn5d6M81G1w+LWVqFhO/
	 +54vsJX8If+o6KLQ4wehshD3MsopiGGohqOOOCQZygcKvnlUPT8ua32vwfM7P4ojLB
	 FI47pDgyRt2wWceVY/x1zLRO3X8IICDcgM/hTvlvl84CpOQP8XXjKOEaGb1jmd6E6m
	 rUKCb2wr1l78w5N/eDwR4IGCWYh+1qMkg5I65L/5g1nNOZVnELSgIqrRTl6tY10L07
	 AydEQF56bUzzz8ZZk74QOdZjp4DKVoxLkeqsab7thqH5zlIbqC65FIniiom5yK3pF2
	 Ac6SH7vmRdmKQ==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 01 Sep 2026 17:38:43 +0100
Subject: [PATCH v2] arm64/sme: Disable TIF_SME when loading state
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-arm64-disable-sme-v2-1-b53fa3c41840@kernel.org>
X-B4-Tracking: v=1; b=H4sIAJL/lmoC/22Nyw6CMBBFf4XM2pq2Qgmu/A/Doo8BqjzMDBIN4
 d8FdOnyJOeeOwMjRWQ4JzMQTpHj0K+gDwn4xvY1ihhWBi21kbkshKXOpCJEtq5FwR0Kn9mTUVa
 hCw7W3YOwiq+9eS2/zE93Qz9uoc1oIo8DvffTSW3er6/kn/6khBJVmrtMF8F4l17uSD22x4FqK
 Jdl+QCmnLurxQAAAA==
X-Change-ID: 20260709-arm64-disable-sme-c5a361a1ebdb
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2866; i=broonie@kernel.org;
 h=from:subject:message-id; bh=9p9dH37muB7+UwwMmHjZ+w8JlyYEwAjypEeoPgnqW84=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqlv+cDu4KNad0WZZfZwBx6SYcoRxPCMu+ARkss
 bjBZUoq3gqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapb/nAAKCRAk1otyXVSH
 0ImDB/9CGl6Gpq2QFkcuqAtS9+1TA601ekhIHBwvSsEdzUYspG/kjGl3huPGLpHNNav3S0Ib1kh
 F4HGzujyWQn5yehp+6zpTkzZ3sba+RZ4M/Iax1CwLdNkcsguoSXSz3yGQMQ01KH6+7Rf+lcGUZJ
 nmoZBLTSTg59YPDQBN6dLjSy29oIQoHNezsdytckjAybwmGLZIbXqbXJjjrohvYFeDqowGRsu6n
 4uWJ1oNRY1PekrWbyD8J9/AyUHcfKjP86xCZYXGDYumUjjPlZXETVEnX8oCB2eMrjoHrAZyttb/
 +vK7BwhEHYVq+exjcXJEa9DTpKK42k6zpZaSnRPfFhTdjlcT
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

Normally once we have enabled SME access for a userspace task there is no
real overhead from leaving it on, unless userspace has enabled either
streaming mode or ZA there is no additional state to load and save beyond
SVCR. For systems affected by Arm erratum #4193714 this is not the case,
we must issue additional IPIs to CPUs running tasks using SME to ensure
visibility of memory accesses.

Mitigate this by disabling TIF_SME when we load the floating point state
for a task that does not have streaming mode or ZA enabled. These tasks
will then run with SME traps enabled until the next time that they
attempt to use SME or we load SME state via signal return or ptrace,
allowing them to avoid the overhead of enabling the erratum workaround.
CPUs are only added to the set of CPUs that require IPIs while in user
mode so will not be in it while the floating point state is being
loaded.

I have not directly verified the performance impact of this on affected
systems with practical workloads, hopefully users with such systems can
assess the impact and confirm if there is any benefit or not. Tasks that
use SME intermittently will experience additional SME access traps but
will not cause additional IPIs while SME has been disabled.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Changes in v2:
- Rebase onto v7.3-rc1.
- Link to v1: https://patch.msgid.link/20260710-arm64-disable-sme-v1-1-f47b529d6cb4@kernel.org
---
 arch/arm64/kernel/fpsimd.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index e7f1682a3059..a9a09ac3923d 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -204,6 +204,10 @@ static inline void sme_free(struct task_struct *t) { }
 
 #endif
 
+#ifdef CONFIG_ARM64_ERRATUM_4193714
+static cpumask_t sme_dvmsync_cpus;
+#endif
+
 static void fpsimd_bind_task_to_cpu(void);
 
 /*
@@ -404,6 +408,13 @@ static void task_fpsimd_load(void)
 	if (system_supports_sme()) {
 		unsigned long sme_vl = task_get_sme_vl(current);
 
+#ifdef CONFIG_ARM64_ERRATUM_4193714
+		if (alternative_has_cap_unlikely(ARM64_WORKAROUND_4193714) &&
+		    cpumask_test_cpu(smp_processor_id(), &sme_dvmsync_cpus) &&
+		    current->thread.svcr == 0)
+			clear_thread_flag(TIF_SME);
+#endif
+
 		/* Ensure VL is set up for restoring data */
 		if (test_thread_flag(TIF_SME)) {
 			unsigned long vq = sve_vq_from_vl(sme_vl);
@@ -1354,7 +1365,6 @@ void do_sve_acc(unsigned long esr, struct pt_regs *regs)
 /*
  * SME/CME erratum handling.
  */
-static cpumask_t sme_dvmsync_cpus;
 cpumask_t sme_active_cpus;
 
 /*

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260709-arm64-disable-sme-c5a361a1ebdb

Best regards,
--  
Mark Brown <broonie@kernel.org>

