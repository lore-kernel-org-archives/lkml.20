Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E793ED3B4
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 11:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787745511; cv=none; b=mBRPNfPu13mKxpKSA/AA8HGrWBd8b30f6OjP8lQowNVawHltoCg5tFTN8mie6d0uISFJRjc257PCpitt+uFjxDVCIkiZV11Xu2tJGg9xt37MSt3ayg9OCFBbuC8/Exl0OMEm9zpwW47S0cLHfVcyIKV3shSC2ElrDaJv25kH5Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787745511; c=relaxed/simple;
	bh=RrTV0nQEjuA5ZZpujWVTQAw7T1grQBmQAGtF87QFU9A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IaQTxmHMsNS6jnGzMfcOtESi29YrFk8D2QCS5hG4maXHkvEKDseOk4CkhDzhVmS1fx5P+WuCS/7v+Jno7D4VqkSTRjKGLh6RdJteX/8Rj/wy+Fm+Zc0gcvpbs7IBXNQZiIfeikAguPEWAKKrEQbSeYyuz2FOquxXefINxByogtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=fEwyDB2h; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="fEwyDB2h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=qA
	ACV17824/0ISQqqSn6WdXNhbRXLtURzi1zvxcSRqs=; b=fEwyDB2hy2gi3fyXzz
	ozXl4qTkCAwb9W+8tRdSPR2B8poFfptzhSpKrvCgstXBQBfCbOgXEtCwOlwCV1Ov
	PLOnv41ZthUGc3HeewZNbRfO0+NcGv9ATVz4UW8C1tQvpsRJVjBHLfitAhSQAXb2
	v5gHTXzJruPeXH4M1JNX+9MJ0=
Received: from thinkpadx13gen2i.. (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wDnD6SZ1I5qswPTQA--.55021S2;
	Wed, 26 Aug 2026 19:57:14 +0800 (CST)
From: Zongmin Zhou <min_halo@163.com>
To: oleg@redhat.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: andybnac@gmail.com,
	debug@rivosinc.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zongmin Zhou <zhouzongmin@kylinos.cn>
Subject: [PATCH] riscv: ptrace: Zero-initialize regset buffers before copyin
Date: Wed, 26 Aug 2026 19:57:11 +0800
Message-Id: <20260826115711.86861-1-min_halo@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnD6SZ1I5qswPTQA--.55021S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KryUZFW3Jr13Kw17WF4xtFb_yoW8Xw4Dpr
	ZxCaykGrW8Jr42vF4akF48urn0grn3WFWS9a4fX3WrAry5Jr4qvF9akFyqyr4fKFy8Wa4f
	ZFyq9w1FyayDX3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jU5rxUUUUU=
X-CM-SenderInfo: pplqsxxdorqiywtou0bp/xtbC9BqZRWqO1JrP8gAA3l

From: Zongmin Zhou <zhouzongmin@kylinos.cn>

user_regset_copyin() only copies `count` bytes, so a PTRACE_SETREGSET
request with a short iov_len leaves the rest of the stack buffer
uninitialized. In riscv_vr_set() that garbage is validated and copied
into the target's vstate, and in riscv_cfi_set() it can be stored as
the target's shadow stack pointer. Zero both buffers, as the get path
already does.

Fixes: 9300f0043974 ("RISC-V: Add ptrace support for vectors")
Fixes: 2af7c9cf021c ("riscv/ptrace: expose riscv CFI status and state via ptrace and in core files")
Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
---
 arch/riscv/kernel/ptrace.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index f336a183667e..e089dd192b13 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -230,6 +230,7 @@ static int riscv_vr_set(struct task_struct *target,
 		return -ENODATA;
 
 	/* Copy rest of the vstate except datap */
+	memset(&ptrace_vstate, 0, sizeof(ptrace_vstate));
 	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &ptrace_vstate, 0,
 				 sizeof(struct __riscv_v_regset_state));
 	if (unlikely(ret))
@@ -339,6 +340,7 @@ static int riscv_cfi_set(struct task_struct *target,
 
 	regs = task_pt_regs(target);
 
+	memset(&user_cfi, 0, sizeof(user_cfi));
 	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &user_cfi, 0, -1);
 	if (ret)
 		return ret;
-- 
2.34.1


No virus found
		Checked by Hillstone Network AntiVirus

