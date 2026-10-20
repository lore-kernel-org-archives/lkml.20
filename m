Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.101.248.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792478523;
	b=dSpZAVwk+k378gD+uUYcqw3YdoN8Pjd31xWbiPvoFAfGwYb+3YHoQ8NgHL9rdiAsLOoY
	 WIwx+bQ2mIfcE8W6Z02uOv/rAikkfNAAHc6cGKPNA4/HQDC1jpx489Ayu7Wx98/tKOsVF
	 eWSMnKKZJeqyhLKp2jbHL9XTpvIv1A+SsbTqpu45ldD13g5o2EIsImYtMzHAnkXbPoPr8
	 16TZVKpn2UEUb+7HXR1n1qaR/yF4ncvl8XReTQEdWcV65lcdv7XLjyLhs00irpPHEeD9t
	 WseFuzfzh1Vu+2WiZV2ge3TsGhTxhxzgs170B0NwfIaq5ObKJ/aGufotPTQFXBYXjIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792478523;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=0sGhfVf70RmnAcAzk6y7Lb3xZXdCmux3/eQgjBBlkKs=;
	b=GgMsAHq4Mzsl35csZs+YiqP0p/n4RS7xnT3Y6qOFN1UyfTVLkWZGf9ANWQeNmwHnMrOP
	 eumodtBQnU1y5qHdHvIlRmaEeLABW/BcOFxh0a8gVSCbSsAhm3eWpQptuX5ZLM6JjWTow
	 7tRp3El1CiepmvhuM1p9SXhMtwIkAlR1TTuJLVIvsIEDs8YdvJcmxc5tz/apIDSZcvuoL
	 w+aXr7sDnk/ZwDgq6t7+41KFsms/bm3Tm9GMrSSku1MB5fvITL1Vo6GPYiZ5or0uRisNR
	 LSS3uQ12iIiYnu/HUQCH75/T8qiNy3C6W0wav5fK4Zh9sL4uFe4D8SgoMP48/x4ShDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=eswincomputing.com;
	spf=pass smtp.mailfrom=eswincomputing.com;
	arc=none smtp.remote-ip=46.101.248.176
Received: from zg8tndyumtaxlji0oc4xnzya.icoremail.net (zg8tndyumtaxlji0oc4xnzya.icoremail.net [46.101.248.176])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7D3F606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:42:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7D3F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from E0002472LT.eswin.cn (unknown [10.12.96.78])
	by app1 (Coremail) with SMTP id TAJkCgDniXMgDddqfWGHAA--.19571S2;
	Tue, 20 Oct 2026 14:41:37 +0800 (CST)
From: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
To: Nam Cao <namcao@linutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
Subject: [PATCH v4 0/2] riscv: kprobes: simulate nop and c.nop instructions
Date: Tue, 20 Oct 2026 14:41:34 +0800
Message-Id: <20261020064136.665-1-yuanxiaofeng@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
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
X-CM-TRANSID:TAJkCgDniXMgDddqfWGHAA--.19571S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJFyfWr1DZr47Xr4xur4xtFb_yoW5WF43pF
	sIkwn8Kr4kJwnxC3sxAw4xZFWrKws7Jw4fJF47t34rta1UKF13tFn2g3y5ZFnxWw4Fg34a
	vF17Wryvkry7ArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUva14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI
	8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
	xVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
	8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280
	aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyT
	uYvjfUYCJmUUUUU
X-CM-SenderInfo: h1xd05xldrwv1qj6v25zlqu0xpsx3x1qjou0bp/1tbiAQEGE2rWRjQeDAAAsJ

Per-hit XOL out-of-line execution of a probed nop costs an extra
exception round-trip (the slot's trailing breakpoint traps back into
the kernel), and for uprobes that round-trip is a full
kernel<->userspace one.  Since these instructions have no
architectural effect, simply advance the program counter inside the
breakpoint handler instead.  riscv_probe_decode_insn() is shared by
kprobes and uprobes, so both benefit.  It primarily matters for
uprobes on USDT sites: under the SystemTap SDT ABI, the recorded
probe location is by construction a plain nop or c.nop.

patch 1: simulate nop and c.nop in the breakpoint handler.
patch 2: extend the RISC-V kprobes KUnit test to cover both.

Measured on QEMU (RISC-V virt, emulated): per-hit cost of a uprobe
on a USDT-style nop site drops by roughly 80 percent; a kprobe on a
nop by roughly 40 percent.  (arm64 commit ac4ad5c09b34 measured ~2x
on real arm64 hardware for the same class of change.)

Changes since v3:
- patch 1: drop the NOP/C.NOP encoding comment (per Nam Cao's review;
  the other macros have none, and the encodings are in the spec).
- collect Reviewed-by from Nam Cao on both patches.
- re-ran the QEMU benchmark on a next-20261019 base: uprobe per-hit
  cost drops by roughly 70 percent and kprobe by roughly 30 percent,
  the same magnitude as v3.

Changes since v2:
- patch 1: no code change; commit message reworked per Nam Cao's
  review:
  - dropped the kernel-text nop motivation (jump_label text sites
    cannot be kprobed; register_kprobe() rejects them via
    jump_label_text_reserved()), and the mcount claim (the function
    entry instruction is an auipc; the nop sits at +4 only).
  - corrected the attribution of the arm64 prior: ac4ad5c09b34 was
    motivated by uprobe/USDT benchmarks, not by a generic "single
    step is slow" claim.
  - described the per-hit saving precisely in XOL terms (one extra
    exception round-trip; for uprobes a full kernel<->userspace one).
  - added a USDT-form uprobe measurement (ftrace uprobe event,
    emulated QEMU), in the style of the arm64 series numbers.
- patch 2: unchanged.

Changes since v1:
- patch 1: add use-case justification and benchmark result to the
  commit message.
- patch 2: simplify test functions to load KPROBE_TEST_MAGIC
  directly (per review).

Verified by cross-compiling for RISC-V and running the kprobes KUnit
test in QEMU (ok 1 kprobes_riscv).

Xiaofeng Yuan (2):
  riscv: kprobes: simulate nop and c.nop instructions
  riscv: kprobes: add nop and c.nop to the KUnit test

 arch/riscv/include/asm/insn.h                 |  7 ++++++
 arch/riscv/kernel/probes/decode-insn.c        |  6 +++++
 arch/riscv/kernel/probes/simulate-insn.c      | 14 +++++++++++
 arch/riscv/kernel/probes/simulate-insn.h      |  2 ++
 .../kernel/tests/kprobes/test-kprobes-asm.S   | 23 +++++++++++++++++++
 5 files changed, 52 insertions(+)

-- 
2.34.1

