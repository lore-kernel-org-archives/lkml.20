Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8100E388860
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 02:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.30.2.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792203689; cv=none; b=BOGk4KzP01Z81JGCnC6pXSeheq7p/wt4unPJxvPRjMZC+8DxfMmI61mMl7VrYI1mjoU2WXJlP+TqPfoUzA1oVBZnO7dSOQ+pgzHlE9TilDlyp7XBdL9AO0qG9/UnX92+lopGnD9yCAZzpoucyNXtavGmZJF4cwA+X167Nnp6lS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792203689; c=relaxed/simple;
	bh=dU4Ga5fgz0ZhWVdt5zYpF/rV2MXuB99vWQRS1jxAqkk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D7IdzHhZxf89D0/wU/CbDpNrl/uv2EKUPjurQ0u4CWXnpusoRyzS8HDG1Da/baao01cp1RP3UKkQS2qH4kXjAcf5+srnwPja5KAs8qmiwGDAjqrjwdV7YwunYMvokTehXQ8eW7cjJh9+g/PIvFVR8wJ1xm30bYiUci/kBr8tJFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu; spf=pass smtp.mailfrom=csail.mit.edu; arc=none smtp.client-ip=128.30.2.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Received: from escalante.csail.mit.edu ([128.52.128.198])
	by outgoing2021.csail.mit.edu with esmtp (Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xHu2u-00HRgx-OL;
	Fri, 16 Oct 2026 22:21:16 -0400
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
To: Richard Weinberger <richard@nod.at>
Cc: Zhihao Cheng <chengzhihao1@huawei.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nickolai Zeldovich <nickolai@csail.mit.edu>
Subject: [PATCH v1] ubifs: drop the obsolete ULONG_MAX assertion on the wbuf timer delta
Date: Fri, 16 Oct 2026 22:21:16 -0400
Message-ID: <20261017022116.792684-1-nickolai@csail.mit.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On a 32-bit kernel, once root sets vm.dirty_writeback_centisecs to 4295
or more (43 s; raised on flash-based systems to reduce wear), the next
journal write of every mounted UBIFS file system fails its write-buffer
timer assertion and, with the default assert=read-only, switches the file
system to read-only mode:

  UBIFS error (ubi0:0 pid 1): ubifs_assert_failed: UBIFS assert failed: delta <= ULONG_MAX, in fs/ubifs/io.c:516
  UBIFS warning (ubi0:0 pid 1): ubifs_ro_mode.part.0: switched to read-only mode, error -22

The create, write, unlink or fsync that started the timer returns EROFS
and so does every later one until the file system is remounted; with
assert=panic the machine crashes instead. 64-bit kernels are not
affected. The assertion has been reachable since v4.10, when the timer
started to follow the sysctl.

new_wbuf_timer_nolock() computes the timer slack as

	delta = dirty_writeback_interval * 10^6 ns

in an unsigned long long and asserts delta <= ULONG_MAX. On 32-bit
ULONG_MAX is 4294967295, exceeded from 4295 centiseconds on. The check
dates from commit 2a35a3a8ab3e ("UBIFS: set write-buffer timout to 3-5
seconds"), when hrtimer_start_range_ns() took the slack as an unsigned
long and the value was a compile-time constant that could only be checked
against truncation. Commit da8b44d5a9f8 ("timer: convert timer_slack_ns
from unsigned long to u64") widened the parameter to u64, so nothing is
truncated any more, and commit 1b7fc2c0069f ("ubifs: Use
dirty_writeback_interval value for wbuf timer") then derived the value
from the sysctl, which has no upper bound. The assertion no longer guards
anything and fails on a legitimate setting.

Remove it. The timer is started with the full 64-bit slack exactly as
before.

Tested on a riscv32 QEMU kernel with UBIFS on an mtdram-backed UBI
volume: after "vm.dirty_writeback_centisecs = 4295" the first
open(O_CREAT) fails with EROFS and the assertion is logged; with this
patch the open and fsync succeed and the log is clean. 4294 works on
both.

Found while reviewing the users of dirty_writeback_interval for the
formal verification of the periodic writeback code.

Fixes: 1b7fc2c0069f ("ubifs: Use dirty_writeback_interval value for wbuf timer")
Assisted-by: LLM
Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
---

Notes:
    The write-buffer timer start is the only user of the value in fs/ubifs; the
    softlimit next to it, ms_to_ktime(dirty_writeback_interval * 10), is a 32-bit
    product on all architectures and wraps above 429496729 centiseconds (49.7 days),
    the same wrap that fs/fs-writeback.c has at its two msecs_to_jiffies() sites;
    that is a separate issue of the sysctl's range, not touched here.
    
    Reproducer (32-bit kernel, any UBIFS mount, root):
    
      sysctl -w vm.dirty_writeback_centisecs=4295
      touch /mnt/ubifs/f
    
    Before: touch fails with EROFS; the log shows "UBIFS assert failed: delta <=
    ULONG_MAX, in fs/ubifs/io.c:516" and "switched to read-only mode, error -22";
    every later write to the file system fails with EROFS until it is remounted.
    After: touch succeeds, nothing is logged. 4294 works on both; a 64-bit kernel
    never trips the assertion.
    
    Run here as a freestanding init on qemu-system-riscv32 (-M virt,
    CONFIG_MTD_MTDRAM=y with a 16 MiB device and 128 KiB erase blocks,
    CONFIG_MTD_UBI=y, CONFIG_UBIFS_FS=y, "ubi.mtd=0" on the command line): the init
    creates a 4 MiB dynamic UBI volume with UBI_IOCMKVOL, mounts "ubi0:v" (UBIFS
    formats the empty volume), creates /mnt/a at 4294 (ok, fsync ok), sets 4295 and
    creates /mnt/b: open returns -30 unpatched, 0 patched.

 fs/ubifs/io.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
index 6c6d68242779..da4eb0a82e62 100644
--- a/fs/ubifs/io.c
+++ b/fs/ubifs/io.c
@@ -513,7 +513,6 @@ static void new_wbuf_timer_nolock(struct ubifs_info *c, struct ubifs_wbuf *wbuf)
 	delta *= 10ULL * NSEC_PER_MSEC / 10ULL;
 
 	ubifs_assert(c, !hrtimer_active(&wbuf->timer));
-	ubifs_assert(c, delta <= ULONG_MAX);
 
 	if (wbuf->no_timer)
 		return;

base-commit: 70dd4ee72eb2d5793c62e71c14e3aba78e5a4e56
-- 
2.53.0

