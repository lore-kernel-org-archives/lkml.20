Received: from zg8tmja2lje4os43os4xodqa.icoremail.net (zg8tmja2lje4os43os4xodqa.icoremail.net [206.189.79.184])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0481E3D0934
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=206.189.79.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791858982; cv=none; b=gfRm8EOb7OYiSXknRiuzDyzb2XQCaDMSePhOdwTXCmYGX01ZO8WHDbP3OaRXs25MTWrRtF0t8RqsET0122TCgpkBUeKWCcksawqMtM8cSVZVMoqfXYiURGogPTtIqC4pO9+AURqzXjZ3dx85PgIPsoxnwtd/jHp3vOW3bA26koE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791858982; c=relaxed/simple;
	bh=UEF902eB+wpFxJ4VsI5H23knouz25ZkW8/n5VNMknHU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HMNmi+/p7jaIIX2zRoISsBCFNpE7jX9xul/1wXmUf0VE+PVKFKuOsXl/NmN6OWnLn8hOJs+ovmGg3hgP32wfSqWaFq/ffigo91hFrX1ZtdeSOOKy9K0YVSKo/kIRMZ8JO6+AZM6M7rJRy/fRXfbWKtZ11rgf3TEI9QLxo3+yc3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=206.189.79.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from E0002472LT.eswin.cn (unknown [10.12.96.78])
	by app2 (Coremail) with SMTP id TQJkCgDn_aAVmc1quFyGAA--.23313S2;
	Tue, 13 Oct 2026 10:36:07 +0800 (CST)
From: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
Subject: [PATCH v2] riscv: kprobes: free insn slot in arch_remove_kprobe() to avoid memory leak
Date: Tue, 13 Oct 2026 10:36:05 +0800
Message-Id: <20261013023605.317-1-yuanxiaofeng@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20260731100940.2330-1-yuanxiaofeng@eswincomputing.com>
References: <20260731100940.2330-1-yuanxiaofeng@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:TQJkCgDn_aAVmc1quFyGAA--.23313S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw4UXr4DXry3AF1rCFWruFg_yoW8XFW5pF
	s8Cw15Xw4rXa1fWryxAw4kWw1Fvan5Ww42grW8A343Xw43Jr1rZws2g3yUJrn8Kr9Ykr1a
	vFn0vFWrZ347Aa7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUva14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI
	8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
	xVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
	8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280
	aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyT
	uYvjfUr2-eDUUUU
X-CM-SenderInfo: h1xd05xldrwv1qj6v25zlqu0xpsx3x1qjou0bp/1tbiAgETE2rNDCkCZQADsl

When a kprobe is removed, arch_remove_kprobe() does not free the
instruction slot allocated by arch_prepare_kprobe(). This causes
a memory leak every time a kprobe is unregistered.

Other architectures such as arm64, x86, and powerpc all free the
slot in their arch_remove_kprobe() implementations. Add the
missing free_insn_slot() call for RISC-V.

Registered and unregistered a kprobe on kernel_clone in a loop
inside a QEMU (RISC-V virt) guest: before the fix the number of
kprobe_insn_page entries in /proc/kallsyms grew by one every 512
iterations (each insn-slot page holds 512 eight-byte slots), and
after the fix it stays at 1.

Signed-off-by: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
---
Changes in v2:
 - Drop the stray blank line before the closing brace.
 - Extend the commit message with a reproduction/verification note.
 - Rebase onto linux-next 20261009.

 arch/riscv/kernel/probes/kprobes.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/kprobes.c
index 9e2afabf9..a76eab297 100644
--- a/arch/riscv/kernel/probes/kprobes.c
+++ b/arch/riscv/kernel/probes/kprobes.c
@@ -128,6 +128,10 @@ void __kprobes arch_disarm_kprobe(struct kprobe *p)
 
 void __kprobes arch_remove_kprobe(struct kprobe *p)
 {
+	if (p->ainsn.api.insn) {
+		free_insn_slot(p->ainsn.api.insn, 0);
+		p->ainsn.api.insn = NULL;
+	}
 }
 
 static void __kprobes save_previous_kprobe(struct kprobe_ctlblk *kcb)
-- 
2.34.1

