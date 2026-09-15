Received: from mail3-166.sinamail.sina.com.cn (mail3-166.sinamail.sina.com.cn [202.108.3.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA79C3CB552
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789443811; cv=none; b=KqiTT7YZrEzcMoRA/cO+BHSW/E4rOHsxnKBaZgkJdB6jPe/aDgfJMvnI4FQ4vOQe2Qxo603RLUggVtmcx1MCaur1JhTn8lZRa6cyy0zdanW0/HUlEy/QEaHz1lKEz2YQ1fjaRlIOQ0l6C2h/ZeS+ZLrAecmnOFSnpjmoNXcyKbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789443811; c=relaxed/simple;
	bh=igaduFXx/1aS4F7ppjGItMaPBgQdk3zG+tpstYX/q3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ntdD13ZLYYVnnQ1O8mlDF7m2nhhXVfc2ix2Mglbtgms5W19hsA4uGuXYGBJ8TPeSKaOsm9c4pC1uNLzEPvrETO60yJql0QtRB4fEgRMTwkcXvnt0RwYrE2YIMJ0epxLpJBQhFWbBma4nB/rz84Zbd/VtDtrsPjtjgDqyxFInuPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=T8ZT0TcV; arc=none smtp.client-ip=202.108.3.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="T8ZT0TcV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1789443807;
	bh=FHFuWzKQsLwy3FwhOlWV07CuPwUNamUbN/ImZyKfNss=;
	h=From:Subject:Date:Message-ID;
	b=T8ZT0TcVBE3jkqEFBnlgNG0toDd1PvwCvYVQ8rPK7JJRiv3KkTJeCTxjumq/aJIk8
	 0u1uq6zZ9t43bPjYTsbf+n57eOeFqbnZDTN5rtlZ3I1iW/HsSMc191eMybWwK77RUf
	 lFa1V43X9EnKHKbZR5jZeRxqgjuZR4Hz158gTG9k=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.31) with ESMTP
	id 6AA8BC9900001333; Tue, 15 Sep 2026 11:33:46 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 8545546815976
X-SMAIL-UIID: B93E1268A5A44C9688278E9D19B9E722-20260915-113346-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+237f670105a254a230d4@syzkaller.appspotmail.com
Cc: andreyknvl@gmail.com,
	glider@google.com,
	dvyukov@google.com,
	boqun@kernel.org,
	tchibo@google.com,
	linux-kernel@vger.kernel.org,
	mathieu.desnoyers@efficios.com,
	paulmck@kernel.org,
	peterz@infradead.org,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH] kcov: add a missing bound check in write_comp_data()
Date: Tue, 15 Sep 2026 11:33:45 +0800
Message-ID: <20260915033345.904567-1-eadavis@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6aa87111.f81106d8.2ab401.0057.GAE@google.com>
References: <6aa87111.f81106d8.2ab401.0057.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A missing bounds check in write_comp_data() can lead to an out-of-bounds read
or write in the adjacent memory area, since the start_index is not validated
before accessing area[] in the function later, potentially hitting:

BUG: unable to handle page fault for address: ffffc90003792fe8
RIP: 0010:write_comp_data+0x7c/0xa0 kernel/kcov.c:263
Call Trace:
 __do_sys_rseq kernel/rseq.c:549 [inline]
 __se_sys_rseq kernel/rseq.c:547 [inline]
 __x64_sys_rseq+0xc2/0x2e0 kernel/rseq.c:547

Fixes: ded97d2c2b2c ("kcov: support comparison operands collection")
Reported-by: syzbot+237f670105a254a230d4@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=237f670105a254a230d4
Tested-by: syzbot+237f670105a254a230d4@syzkaller.appspotmail.com
Signed-off-by: Edward Adam Davis <eadavis@sina.com>
---
 kernel/kcov.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/kernel/kcov.c b/kernel/kcov.c
index 35420f0ac524..479a84921833 100644
--- a/kernel/kcov.c
+++ b/kernel/kcov.c
@@ -236,7 +236,7 @@ static void notrace write_comp_data(u64 type, u64 arg1, u64 arg2, u64 ip)
 {
 	struct task_struct *t;
 	u64 *area;
-	u64 count, start_index, end_pos, max_pos;
+	u64 count, start_index, end_pos, max_pos, tmp;
 
 	t = current;
 	if (!check_kcov_mode(KCOV_MODE_TRACE_CMP, t))
@@ -254,7 +254,9 @@ static void notrace write_comp_data(u64 type, u64 arg1, u64 arg2, u64 ip)
 	count = READ_ONCE(area[0]);
 
 	/* Every record is KCOV_WORDS_PER_CMP 64-bit words. */
-	start_index = 1 + count * KCOV_WORDS_PER_CMP;
+	if (check_mul_overflow(count, KCOV_WORDS_PER_CMP, &tmp))
+		return;
+	start_index = 1 + tmp;
 	end_pos = (start_index + KCOV_WORDS_PER_CMP) * sizeof(u64);
 	if (likely(end_pos <= max_pos)) {
 		/* See comment in __sanitizer_cov_trace_pc(). */
-- 
2.43.0

