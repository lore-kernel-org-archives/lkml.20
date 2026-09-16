Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 144E14B0CAA
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789499266; cv=none; b=APBL710K+oerJ1I1q/7Zhl8yNYK6Lnm/T9cL0v1Gwwou53NFRrmOvRLGvr1fIuk8/ysVxBpXmHlYINUi2q+nRSyDJz4hn/HbVAI/QlLbV8+KclQ6xSau4NOGgCnTy6DjcwUKJtl+k5+rwJMGBwHXJ5nccsMC+5j3hW9BzWn8jdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789499266; c=relaxed/simple;
	bh=Nw/rrxVtJgyBbpfuY2oArZ6bQKwbS8jJxnE5J7+xsEw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Pm8xPM6YyqxNhI7uhNMNBeCHd9oWNEk0gMrDJpB69Yr4yWkZE+OoYftQpRfZG2Vglz/tnacfHqNhMTWJ6s9sBVdv5Hhsi2cC10yJIpzc8EQaV95eZFoko/0DLdPFSdtAyHmgm4Rhj3LriaasYjFJzE55pAmPEEXxWm+pa4/vV/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ZjOEjkgI; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ZjOEjkgI"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82219152B;
	Tue, 15 Sep 2026 12:07:39 -0700 (PDT)
Received: from fedora (LJ9QCPV96V.austin.arm.com [10.118.150.127])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CBB563F7B4;
	Tue, 15 Sep 2026 12:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789499263; bh=Nw/rrxVtJgyBbpfuY2oArZ6bQKwbS8jJxnE5J7+xsEw=;
	h=From:To:Cc:Subject:Date:From;
	b=ZjOEjkgI831pw6kfI5sMsGQwhOkS4iZarX5bntSa+rENICdie3QuKK2Ea5wDY7CSF
	 3t0SktW4jTWeQXAPlPPSV9UCXMe9+BEPd+aTMJU74Od1Szx3icwgFJfMrv0S+cP3vG
	 rnzEgsMWvB9lIyMN7jbuGksGumSTLFd/0XpEakkg=
From: Bill Roberts <bill.roberts@arm.com>
To: Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>
Cc: jesse.huang@sifive.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Bill Roberts <bill.roberts@arm.com>
Subject: [RFC PATCH] riscv/usercfi: fix shadow stack locking argument
Date: Wed, 16 Sep 2026 04:32:26 -0500
Message-ID: <20260916093226.1524954-1-bill.roberts@arm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The API for arch_lock_shadow_stack_status, is that the argument contains
the feature bits one wants to lock, including support for unknown bits.

The API was documented in:
commit 91e102e79740 ("prctl: arch-agnostic prctl for shadow stack")

The current code expected the argument to be 0. That would mean nothing
is locked. Note that glibc has not merged the riscv support yet,
so now would be the time to correct this behavior.

See the patch series in question for glibc here:
Link: https://inbox.sourceware.org/libc-alpha/af2bbbac-5421-4b7c-af4b-4feb84b87629@foss.arm.com/

Signed-off-by: Bill Roberts <bill.roberts@arm.com>
---
RFC Notes:
I ONLY compile tested this. This was meant to strike up a conversation
on this before it gets baked into the kernel forever. Right now, seems
like the time to change that.


 arch/riscv/kernel/usercfi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
index f027e6e05251..a688e3b942a8 100644
--- a/arch/riscv/kernel/usercfi.c
+++ b/arch/riscv/kernel/usercfi.c
@@ -440,10 +440,12 @@ int arch_lock_shadow_stack_status(struct task_struct *task,
 {
 	/* If shtstk not supported or not enabled on task, nothing to lock here */
 	if (!is_user_shstk_enabled() ||
-	    !is_shstk_enabled(task) || arg != 0)
+	    !is_shstk_enabled(task))
 		return -EINVAL;
 
-	set_shstk_lock(task, true);
+	/* transparently handle unknown bits, this is part of the API */
+	if (arg & PR_SHADOW_STACK_ENABLE)
+		set_shstk_lock(task, true);
 
 	return 0;
 }
-- 
2.55.0

