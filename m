Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616143A0B2E
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789014680; cv=none; b=AsfxjRb0m3WI6qW5GmC5SYDChul0rDEf1ymr++00ft0IitPbfBE10C0Tifowk56J4jLHbUyd9QwN/+6d3q8bVn4RbOj4MxAKqtkK8KwnwtuCXY2o6duRXtjWe2LEHYCabFUsVpUvg9lJmTjBfJVTnDlVzNvYIDoMjQ/Ik7WnjQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789014680; c=relaxed/simple;
	bh=KsIoKJWnFpTP1QqcLS2ahGyzsxSWbGwq020JU74xWZg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Sbtld54k5wEtPHWhPOTkM3W55UiTdF24RXRX4U2KHKCTnYkLOD+QUr+oOm1I+ksdioclwrNjqqKK+ZskmR6XiA4PDXhg09fFnmfG7PHbPvnbuhiIFj3p1RcpYJBuxobu7pHnFdG/uNTJsMDFs0FlZsdPCa+s8tdok0ffuutxoUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=FO3VO3u8; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="FO3VO3u8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=KT
	QU5wwOgoyx1VpyqCpFm3lgO2ZriMIQJJ0cehW7kzQ=; b=FO3VO3u84DpcA5aPQG
	n04P55yuOE8NfY9B+Q1VqCeVkwP9b4/mEaTmLV1pn1PsY6tLWRMxxpFDIHlSqrOK
	wdiGbzyDCuqlxOejsXx3dqaLwnngfSDJSnDYrMO3PLUVaYNZ32DiGrkju7m4W+Xg
	K/OMKbbcbS28hYmP1RwsGXU6U=
Received: from zhaoxin-MS-7E12.. (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wAXgp5AMqJqap0YBw--.51115S11;
	Thu, 10 Sep 2026 12:30:06 +0800 (CST)
From: Xin Zhao <jackzxcui1989@163.com>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com
Cc: linux-kernel@vger.kernel.org,
	Xin Zhao <jackzxcui1989@163.com>
Subject: [RFC PATCH RESEND 09/10] sched/fair: Not goto more_balance if newly idle and has pending task when LBF_NEED_BREAK
Date: Thu, 10 Sep 2026 12:29:49 +0800
Message-Id: <20260910042950.1619727-10-jackzxcui1989@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260910042950.1619727-1-jackzxcui1989@163.com>
References: <20260910042950.1619727-1-jackzxcui1989@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAXgp5AMqJqap0YBw--.51115S11
X-Coremail-Antispam: 1Uf129KBjvJXoW7KF43KF4rWF1DWF4rXw4UXFb_yoW8Jw4xpr
	Wv9F45Za1qq345A39ayF48ur15uw1Sk398uFZrArWfJrn0qFWjvFZYga9xWFWjvFykA3Wr
	ZF1jg3429340yF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziqYLQUUUUU=
X-CM-SenderInfo: pmdfy650fxxiqzyzqiywtou0bp/xtbCvw7i7GqiMk7xdgAA3M

When LBF_NEED_BREAK flag is set in env.flags, no longer unconditionally go
to more_balance. Instead, we exclude the case when it is newly idle and
there are pending tasks. This helps avoid unnecessary CPU wastage caused
by repeatedly going to more_balance when the task load is too high during
sched_balance_rq().

In another 'goto more_balance' case when LBF_DST_PINNED flag is set in
env.flags, we do not need to add the check. Because LBF_DST_PINNED flag is
only set within can_migrate_task(). Before setting LBF_DST_PINNED flag in
can_migrate_task(), there is a check to see if it is newly idle.
can_migrate_task() will exit without setting the LBF_DST_PINNED flag if it
is newly idle.

Signed-off-by: Xin Zhao <jackzxcui1989@163.com>
---
 kernel/sched/fair.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 8a1d2763a923..1ae351ea5949 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -13561,7 +13561,9 @@ static int sched_balance_rq(int this_cpu, struct rq *this_rq,
 
 		if (env.flags & LBF_NEED_BREAK) {
 			env.flags &= ~LBF_NEED_BREAK;
-			goto more_balance;
+			if (!(env.idle == CPU_NEWLY_IDLE &&
+			      (env.dst_rq->nr_running > 0 || env.dst_rq->ttwu_pending)))
+				goto more_balance;
 		}
 
 		/*
-- 
2.34.1

