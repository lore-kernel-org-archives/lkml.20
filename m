Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6079B2F3C3E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 11:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788263729; cv=none; b=a41GHAtdszGNrRfMDCWjNzg0aexeeAxIJaAWBK4D4ahmM/lpVdOHgmm+Q4DrPQL2FPbf8J6MUM8uaU6+XWFmb3ZevYP4RMYmRqAfGlHfZ23wKd0nDIio/Tbm02H5vPTph7aPOA/gtHIl2ODvx8fCVXKLWtitqayw0WQbsB/bfDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788263729; c=relaxed/simple;
	bh=Ff8xaxCOqSMVo+uI5aFBoVLISkk8myjUicfHj5Y5JlU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=u+wWMzvE2b99bcuvAG6cMbMqMAkSDrT7hafYbsL8cj74CZSF6Cu+/sWZl0/Q6OJvNwt+WkcJW6ojjSu3qsGxSW4L04aGWrPINItFi+7Z+nwx2s2C/qrWzpOTMLLuF0A++l3wUNxc1qpdJyqnFdmRqVlNYSqX02nhvJFREASziA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Y1QDU2dQ; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Y1QDU2dQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=wW
	coy7UZLCXe5FrO0mF2TqORQCyLVupP7SFyVEEKGaY=; b=Y1QDU2dQGWCoIRM6wJ
	bujOzGqIsiL4sjE6HTb1QWR4DT/byuXg6pTZyrnIqfH7/Xf7LnqAJaZHXNDtWSuB
	JyPxklfw7feMtFVXZeyI0qnCmYLjqI7iaPBvIGTTv/as/37cPXq/hr1gR+vvf6UQ
	527t11BmbaEJDKX8JwKp+HRJU=
Received: from thinkpadx13gen2i.. (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgDHODbuvJZqiiaqNA--.37143S2;
	Tue, 01 Sep 2026 19:54:23 +0800 (CST)
From: Zongmin Zhou <min_halo@163.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	namcao@linutronix.de,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zongmin Zhou <zhouzongmin@kylinos.cn>
Subject: [PATCH] riscv: kprobes: Reject reserved branch encodings
Date: Tue,  1 Sep 2026 19:54:21 +0800
Message-Id: <20260901115421.109573-1-min_halo@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PCgvCgDHODbuvJZqiiaqNA--.37143S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFWxtry3Cw45XFyrJry7ZFb_yoW8Cr4xpF
	sxCr45tr4rWws7Cry3Jr48WrWfKa1fKw43ur1kt3yFq3y7Ar4Yq3Zagr45WF1qyF4Sg34I
	qF1j9r4ku34UAFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jev38UUUUU=
X-CM-SenderInfo: pplqsxxdorqiywtou0bp/xtbC8w+qVmqWvO+YxwAA3w

From: Zongmin Zhou <zhouzongmin@kylinos.cn>

simulate_branch() cannot emulate the reserved branch encodings
(funct3 010/011) and returns false for them, but arch_simulate_insn()
ignores the return value. A probe on such an encoding, e.g. placed on
data misdecoded as instructions, therefore keeps the instruction
pointer on the breakpoint, and the CPU traps on it forever.

Reject these encodings in riscv_probe_decode_insn(), like the other
instruction classes already rejected there, so registration fails
with -EINVAL instead. All simulator failure paths then become
unreachable: register indices are bounded by construction, and the
c.jr/c.jalr reserved encodings are already filtered by the decode
predicates.

Fixes: c22b0bcb1dd0 ("riscv: Add kprobes supported")
Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
---
 arch/riscv/kernel/probes/decode-insn.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/kernel/probes/decode-insn.c b/arch/riscv/kernel/probes/decode-insn.c
index 433d903..c0eadd1 100644
--- a/arch/riscv/kernel/probes/decode-insn.c
+++ b/arch/riscv/kernel/probes/decode-insn.c
@@ -24,6 +24,15 @@ riscv_probe_decode_insn(probe_opcode_t *addr, struct arch_probe_insn *api)
 	RISCV_INSN_REJECTED(system,		insn);
 	RISCV_INSN_REJECTED(fence,		insn);
 
+	/*
+	 * Reserved branch encodings (funct3 010/011): simulate_branch()
+	 * cannot emulate them and its return value is not checked, so a
+	 * probe would trap on the breakpoint forever.
+	 */
+	if (riscv_insn_is_branch(insn) &&
+	    (RV_EXTRACT_FUNCT3(insn) >> 1) == 0x1)
+		return INSN_REJECTED;
+
 	/*
 	 * Simulate instructions list:
 	 * TODO: the REJECTED ones below need to be implemented
-- 
2.34.1


No virus found
		Checked by Hillstone Network AntiVirus

