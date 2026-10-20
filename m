Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=206.189.79.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792478523;
	b=mq8IY460NSvMxfi4O6BH5JxEM1OgAPBDzM40Eoo0HYEiq8lVunQxw4e4raZHy26RCVBQ
	 SRkJ2Qd9FG9d7hD1OpFckjuFyAiC9bWMzjRu09EDSK+GmC6bkvs/2fTbSzN4qhNq1pQHi
	 i246KAJCciQjLEOzd9fR0jcuTRNahzaugU1MITcMr7G2Jw+GbPO5Nvbr4BBcWMug2yj4g
	 E6/brcgyNmEdHdzqmPvLNfHHyW84FrDVT0LgA6+ZwVZp1dU/alEVy4Ecz7tgMryeSqCx6
	 gOvoEyZSv/opOm6L70JvvPyxqbS01UMPmnW4HJ844vZLVH8ht4GhQcyPCrSDMJNTmSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792478523;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=xKFdGdrNo8zACerHPmf1Zr6xnHH0UxWWSIT1qnvK7O0=;
	b=LhReKhnwBep9zt4epqoXUe259ILI/8pwZ7jznbntp7NakTmwfUHRU9F916P8jLJWrJHq
	 LtVX+ubbcpA8rUKldBXMfntJMm+VvEJg/3zytlCNJ5OFGxqRqjUgQPMC41EvDbWjkMWqG
	 GAf0v/jCFBhB5U/LUx/LvOYm3lV/mBwA4Ty+TiA4DtuRE6NIfYHOB7mrACByMJcXlKDzS
	 jRnkGXqwtth0mBbMTG6Ymly1uwI/yfWrhoWNT75GP96P3NywtHCIozwAayG6gRYZ79iT+
	 KCjPxyVAyJV9mrcyb8RaZVwTaXgGab9BaPlZS0radVUifDFcRMVhRqRlfX9IQ161sog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=eswincomputing.com;
	spf=pass smtp.mailfrom=eswincomputing.com;
	arc=none smtp.remote-ip=206.189.79.184
Received: from zg8tmja2lje4os43os4xodqa.icoremail.net (zg8tmja2lje4os43os4xodqa.icoremail.net [206.189.79.184])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F5AD606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:42:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F5AD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from E0002472LT.eswin.cn (unknown [10.12.96.78])
	by app1 (Coremail) with SMTP id TAJkCgDniXMgDddqfWGHAA--.19571S4;
	Tue, 20 Oct 2026 14:41:38 +0800 (CST)
From: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
To: Nam Cao <namcao@linutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
Subject: [PATCH v4 2/2] riscv: kprobes: add nop and c.nop to the KUnit test
Date: Tue, 20 Oct 2026 14:41:36 +0800
Message-Id: <20261020064136.665-3-yuanxiaofeng@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20261020064136.665-1-yuanxiaofeng@eswincomputing.com>
References: <20261020064136.665-1-yuanxiaofeng@eswincomputing.com>
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
X-CM-TRANSID:TAJkCgDniXMgDddqfWGHAA--.19571S4
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr48tr4DWr1rAF17uF4rKrg_yoW8urW5pF
	nrJw15KF48GasxtryUWr18AryFya18A3y3WryDur48KrW8Gw13tr9FgFWUtrsrKrWFv3yS
	934rXry8KF9rAFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPa14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWUAVWUtw
	CY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAq
	x4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r
	43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF
	7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxV
	WUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU
	1c_TUUUUU
X-CM-SenderInfo: h1xd05xldrwv1qj6v25zlqu0xpsx3x1qjou0bp/1tbiAgEGE2rWRqodbgAEsx

Extend the RISC-V kprobes KUnit test with test_kprobes_nop and
test_kprobes_c_nop, covering both the 32-bit nop and the
compressed c.nop simulation paths.

Signed-off-by: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
Reviewed-by: Nam Cao <namcao@linutronix.de>
---
 .../kernel/tests/kprobes/test-kprobes-asm.S   | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S b/arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S
index 15e50934b..8da0be1e9 100644
--- a/arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S
+++ b/arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S
@@ -198,6 +198,25 @@ SYM_FUNC_END(test_kprobes_c_jal)
 
 #endif /* CONFIG_RISCV_ISA_C */
 
+SYM_FUNC_START(test_kprobes_nop)
+	.option push
+	.option norvc
+test_kprobes_nop_addr:
+	nop
+	.option pop
+	li a0, KPROBE_TEST_MAGIC
+	ret
+SYM_FUNC_END(test_kprobes_nop)
+
+#ifdef CONFIG_RISCV_ISA_C
+SYM_FUNC_START(test_kprobes_c_nop)
+test_kprobes_c_nop_addr:
+	c.nop
+	li a0, KPROBE_TEST_MAGIC
+	ret
+SYM_FUNC_END(test_kprobes_c_nop)
+#endif /* CONFIG_RISCV_ISA_C */
+
 .section .rodata
 SYM_DATA_START(test_kprobes_addresses)
 	RISCV_PTR test_kprobes_add_addr1
@@ -214,7 +233,9 @@ SYM_DATA_START(test_kprobes_addresses)
 	RISCV_PTR test_kprobes_branch_addr6
 	RISCV_PTR test_kprobes_branch_addr7
 	RISCV_PTR test_kprobes_branch_addr8
+	RISCV_PTR test_kprobes_nop_addr
 #ifdef CONFIG_RISCV_ISA_C
+	RISCV_PTR test_kprobes_c_nop_addr
 	RISCV_PTR test_kprobes_branch_c_j_addr1
 	RISCV_PTR test_kprobes_branch_c_j_addr2
 	RISCV_PTR test_kprobes_c_jr_addr1
@@ -241,7 +262,9 @@ SYM_DATA_START(test_kprobes_functions)
 	RISCV_PTR test_kprobes_jalr
 	RISCV_PTR test_kprobes_auipc
 	RISCV_PTR test_kprobes_branch
+	RISCV_PTR test_kprobes_nop
 #ifdef CONFIG_RISCV_ISA_C
+	RISCV_PTR test_kprobes_c_nop
 	RISCV_PTR test_kprobes_c_j
 	RISCV_PTR test_kprobes_c_jr
 	RISCV_PTR test_kprobes_c_jalr
-- 
2.34.1

