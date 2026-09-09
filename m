Received: from out203-205-221-236.mail.qq.com (out203-205-221-236.mail.qq.com [203.205.221.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8710339D3C0
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 04:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788928995; cv=none; b=YRFvqHBWboOXr2C3Tx4IkWjzX37a0WksnPjf42qlxsqVn+dI3NY04pO0rIR9nAytDsk6ZkFxaEr8f29QUuBCd0HxyOImj9Y1xc83qnYuD3qxZVAwQUtsne6Ndcvcvv8QDMHB2Wqr4pvVBMkUm+POvkTAdu8Mo7VUPVb/s5hmKfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788928995; c=relaxed/simple;
	bh=r78R4UlGluGVcW2mWCbQiC1AwVrqeK0nYMQuMZ2ZyKo=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=pCabvDp32D0bch8ZDg1hHYh75mFmP2bvLg41Arr6cP9mUBTk9KkKbbYJLmoqcuzKYwf6AhuBD+QutM1Ou1BmvZaiEl+dlz1wAm2rb4LcSiJzL7IviczJxyOH09KWMEaHWiGRcy1HT9WHzGKqLtqLhg/BV5JtPJFNWkwJtZxitCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=kQ8fVcJH; arc=none smtp.client-ip=203.205.221.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="kQ8fVcJH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1788928989; bh=lH5IXN2ceBcHMTHqBV+AIVgEgQN9eNu+ZHV3+2w5mx0=;
	h=From:To:Cc:Subject:Date;
	b=kQ8fVcJHu4FE3zZ6UA1hN55+P4PxvSbzdtLMc+rZ2EI0MZNyz+Mu2soFpOO7BkkNx
	 aBwPIq1sQK64q5bAjPlVeQFMHc8KoPB1HRcUSN0xzHHisUeCDiZm1uTq/Vv9d33iXg
	 QbnA0SEiX22G4CiicdskODrOs4PwCHIovHa2BcTc=
Received: from LAPTOP-7R15B00L ([183.220.99.26])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id AC607059; Wed, 09 Sep 2026 12:43:06 +0800
X-QQ-mid: xmsmtpt1788928986tmhcx1u2r
Message-ID: <tencent_0F7ECDD4429624B3213BD758BED2F788490A@qq.com>
X-QQ-XMAILINFO: MvkQ4+1sQve7ZBBNo/VzFgtVOuGjkPOFpk6XnbAZ5bKKusMwGb4E3wMRl3nMSu
	 3psG7ih7dEvl/qigeqeONwGIvUWxNZ/YugjQhQ3QD5zsdJeYGkY13KUYf7klzbmf8wQ+tWaA3o3m
	 abZxj6uyMzJZisWvFbEX+Q7Usi8i42TMrPO8wRrZ3DvGwVt0KqbrUzVLJ5Sgx8OmjLstln2NskOn
	 G2Tpf+u3zN5J5A7SmS356LKNtAdLDLtOa8hm25Gf1pPZXh/pKAa8un7j/wzcJdAwI7lLo+MNo2vr
	 zBYKzGk2BRvYs5HxxG2VsXpGy9mJKDgeKlytfz8jtkVL41qcKZ3ytXilImglntOhkj4Oo+GOurct
	 FE1gGSEBAUeoBupmZGcz0/JFE6B0atxDgglCytizhl2SgDmqbs4XcxFhvxiEcdPhqD/tujGHEO7w
	 pbJR1yxHpeiwYbUi3b3nyCqkc9zMlHBJffNyQZ8KHkxlmm76bGwVaNGSTWFOmV8sjG1lG5TWgc8I
	 fjM4BFjLNCau8AgZ1Ql0IV2lniajNWdv4gsEDW1SIWQK5nmLhqERsRhpZQ3jtiKZbM9641+1RIsl
	 YkgbxjFyQLC1/QGB2oXrSYqD5jum4pJ+q/8UvxwE8tgEtrCbTy8RAk6LPcuevTBQJDP6saOzpIIZ
	 AA3yiLielIjJ3+H7dI2BWQ7eF+BsRo52YvtNQhlv/PNHyZT0iGZLZILjTB7SE+4P1aJqJvaNEqA/
	 H8lNyZmbGWdcIok03mU+li5ZjHBOGmFg6ydjmkeyg4eZlJO3bTOZdF4sI5uQcJrE8zm4VNngKXkW
	 cQf50x0POwQJdSt6wr0ls+9yk9Vz+G6EpusNkgFbx8sq40sLt4Wem0S8Btu3hiFLH+3uyHs1GKWp
	 eLXIc8JUVArHUW5tYsSys1vF9ZJ9tNH660lYysb32eaf49bsvyNG9J7TBivDG4efM4769bAMdF10
	 iL4Ynnphtz3xvuB1jQrf47FpNVR3hKlD2fz66K0XcrTI6m+D11lQsdtDZbXParrs5+Kz4vIH/Ymj
	 rz8YZK57hIQ62pDgPMPgxCW/q4zSMNixWOtO20l9yKcoNXhz8yjJ92xYS9vG+/3jvPWGSoOuC4nF
	 FHuLG2WwXswJbBrns=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: blaze <1466528493@qq.com>
To: vgupta@kernel.org
Cc: linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	blaze <1466528493@qq.com>
Subject: [PATCH] arc: kernel: Fix clk reference leak in show_cpuinfo()
Date: Wed,  9 Sep 2026 12:42:59 +0800
X-OQ-MSGID: <20260909044259.1754-1-1466528493@qq.com>
X-Mailer: git-send-email 2.53.0.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In show_cpuinfo(), clk_get() acquires a reference to the CPU clock, but
clk_put() is never called to release it. Since show_cpuinfo() is the
seq_file show callback for /proc/cpuinfo, this causes a clock reference
count leak every time /proc/cpuinfo is read.

The frequency is extracted via clk_get_rate() into a local variable, so
the clock reference can be safely released immediately after.

Fix this by calling clk_put(cpu_clk) right after clk_get_rate().

Fixes: 98f2892607c5 ("ARC: [cpuinfo] Add clk info in /proc/cpuinfo")
Signed-off-by: blaze <1466528493@qq.com>
---
 arch/arc/kernel/setup.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
index 0000000..1111111 100644
--- a/arch/arc/kernel/setup.c
+++ b/arch/arc/kernel/setup.c
@@ -593,6 +593,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 				   cpu_id);
 	} else {
 		freq = clk_get_rate(cpu_clk);
+		clk_put(cpu_clk);
 	}
 	if (freq)
 		seq_printf(m, "CPU speed\t: %lu.%02lu Mhz\n",
--
2.43.0

