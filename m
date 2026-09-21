Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31553C871D
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 21:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790027715; cv=none; b=Gczy8JMyJvtYhVbUy7iikiwBgE2+3Nv9OsbFMzpnt9jbSQxlGZ4VDw7jBBrExQMzl9SE++8eJW3Sg+twxhDpXENIoDUZ2o0FMCXbIiOpmYuJQvIjybwnJuBvpkJCEKhyYd8Td1+kZw2ik9AZiw+JDBR7Hsw+NKjHBS57mM4D4HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790027715; c=relaxed/simple;
	bh=kWlJd8BEWOsRoua0R3YlppLTIwG6Dv2dWS5Q0gC/q5c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IgeDpKd4r3ooZfEr4Fd1KH5stJO2A7eq0o0zGZYLD5ZBWoPrDV+prAaKwB3UAKLTjnFLfw3mh5a5R69SJOHh/s5gBPU0KpeN73XPa3rXcJnWjakwtAZSz/YmWD5AsOClQMnzd7VYAXOZ6KzCoKFYee19Ze4EdgS2DBuZasdm1AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ebXo44ix; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ebXo44ix"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4843e397f74so216409f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790027712; x=1790632512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=18O+tTI1rRDvA6n53KVT0ktfEAZ7emgcAQWAHdf7HXA=;
        b=ebXo44ixLrzfyM8Qr+rAkGVqbzj/TCitIDIeSU+R98a457mSohpbaE/+pjmL/+qaBe
         APDNVkkFpl9naqJatMZzCd/0bnMBucNr0xuDKt2C5CWUxx2vNroMX6ND1TwHpbwUad19
         9FdaCXmV9TM4IkR442DfaEO6+1wn39nfKgPPLpmhagZca7TaJopR8gTJKQQI7Eldjnmm
         PL39vXXlfb4rEa/7RSoeO9lFJO+OXHeiDeMo7vcm1s0bbV6L+GIICSGFnXSPU7lwKDBM
         nyWxATMvH9zHU6p4/ehgeBN2Y1h4ZahhWcBZtxdSVIjCvw561v5afacQ7GHkc5FxpnjR
         Ghfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790027712; x=1790632512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=18O+tTI1rRDvA6n53KVT0ktfEAZ7emgcAQWAHdf7HXA=;
        b=cV8w1BLFiPo44rWV1AmDAIIqVto7BHSBTjyuWl+ve5/s1mqSoj+n4FlWu07M4yme+h
         sRIDXr3UZ4u764h6HCtZ3QsxrgPLsd0sodRZC7S7menf+pGFwyGZAc76MX5Octh2eWQV
         l/rU1qWmaeGFrLIkff68DWUkm/TWVrU+URqg/cYN8KVMkvEOGVsznIzqK/Yroq4Pm331
         L2TM/dL8RXNBXYgGrr/LlyORCGQHIt3kopmT2M+9HOHxTKi8vUvb1AB7v/AAhyLWJihO
         eV3OiVa3/M7BdGg1DuAYC7EzPgjSk7ytg4A3FszH/KMtH5KlKaDKys5b6eQY18lS1CyJ
         mOQQ==
X-Forwarded-Encrypted: i=1; AKwUvBx1VKg1ZDvDw8G8ZXumhf4vVqOYNp6Co7JtQMbOm4duDCsYb7Zvqe8cIPz/8GMr6FHY7cxnGtBIyxEawOA=@vger.kernel.org
X-Gm-Message-State: AFuF++kp4Y8f66iHWnnZF/rH1zex6aVV8LDAjEgYnOr1+Lvqv+IH4u/F
	rJH0RUhHRyqRaVX2QT1HGPHeMDI3ytf3M8vs0WP7HM8Suls28HqkjsR8
X-Gm-Gg: AYBFou2FCqMAtk2d0kqKoOpmf84m5Q9vMnRLWA9ez8YPNQACXGACo2AtuvUNltrmXNO
	TEB4CFe+l8O3V7w9LB1E2zF/1VkwgfmAd2ls4rk3qY6j+cXRjvmJc23Lqh4aLLj7gq/fBBpgZz7
	mYELOK5BEfUHu+aQbOSuUfCCfQny5GzheFf7m3AJb3iyvOBu7m4ZUCdy7ZBDIkhajlMw+P0JKWy
	iThp9dFkXvlq91hHHn4ajvOisYoQUhSPDGXz/wbtAlXFkdWS8YoWRGEZwEXkg7cPbMjSHspBHZJ
	iklz2cLES7P2GH7MOn6DNcr2FzZO3ztOQxyjYCvqc1qttoYioFcO2OUN719mzulDHtQ8AEN0Mx4
	PhzMkvkRDa68qOnp8FXPLG8LsEt9hj+0yQO9s3HvFHMdKzW+BHkZpnWZ9zaVHy/aBxdAZWwH6XJ
	TVbS4ACfsiayphShrGPQ+7xHJ7ZTLGdwzgbXzbBBKe3jCp056huJGJJdI=
X-Received: by 2002:a05:6000:2309:b0:485:a517:6287 with SMTP id ffacd0b85a97d-48860fd75d6mr1502937f8f.17.1790027711846;
        Mon, 21 Sep 2026 14:55:11 -0700 (PDT)
Received: from nobara ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886228be7fsm442767f8f.37.2026.09.21.14.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 14:55:11 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
	syzbot+a3c71b9db9c11c270f59@syzkaller.appspotmail.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH] percpu_counter: annotate lockless read in _limited_add()
Date: Mon, 21 Sep 2026 23:55:04 +0200
Message-ID: <20260921215508.141641-1-azpijr@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot reports a data race on fbc->count between the lockless read in
the fast path of __percpu_counter_limited_add() and the locked update
in percpu_counter_add_batch(), reached via shmem's used_blocks counter:
the alloc path reads it through percpu_counter_limited_add() while the
free path updates it through percpu_counter_sub().

Annotate the read rather than change the logic: the lockless read is
deliberate, only the annotation is missing. It is an approximation,
not a conservative bound. A concurrent flush moves value between
fbc->count and a per-cpu counter, and other CPUs' locked slow paths add
to fbc->count too, so a stale low value can let the fast path proceed
where the slow path would refuse. The error is bounded by the per-cpu
slack (unknown = batch * num_online_cpus()). This is existing behavior,
no functional change intended.

Read it with data_race(READ_ONCE(fbc->count)): data_race() tells KCSAN
the race is intended (READ_ONCE() alone still triggers the report,
because KCSAN reports against watchpoints set up by plain accesses),
while READ_ONCE() stops the compiler from refetching the value, as in
percpu_counter_read_positive(). The lock-protected accesses stay plain,
so future buggy lockless writes are still caught.

Reported-by: syzbot+a3c71b9db9c11c270f59@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=a3c71b9db9c11c270f59
Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
Tested with a KCSAN kernel: defconfig + CONFIG_KCSAN=y, CONFIG_KASAN=n,
CONFIG_KCSAN_SKIP_WATCH=200, CONFIG_KCSAN_UDELAY_TASK=200, KCSAN left off
at boot and enabled from init via debugfs; 8 vCPU / 4G QEMU/KVM guest,
gcc 16.2.1.  Stress: 120 s of concurrent write() and unlink()/ftruncate()
on one size-limited tmpfs (shmem_inode_acct_blocks vs
shmem_inode_unacct_blocks), which is the pair from the report.

	base/mm-new:  38x "BUG: KCSAN: data-race in __percpu_counter_limited_add
		/ percpu_counter_add_batch", first hit ~0.3 s after the
		workers started
	this commit:  0 percpu_counter reports in the same 120 s
		(other, unrelated KCSAN reports remain: d_make_discardable,
		osq_lock)

Object code (defconfig, CONFIG_KCSAN=n): __percpu_counter_limited_add() is
the same size (0x23b) with the same four fbc->count loads and identical
branch targets; .text differs only in register allocation and compare
operand order (45 of 2171 bytes).  No functional change intended.

 lib/percpu_counter.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/lib/percpu_counter.c b/lib/percpu_counter.c
index 2891f94a11c6..87b261b87b0b 100644
--- a/lib/percpu_counter.c
+++ b/lib/percpu_counter.c
@@ -328,6 +328,7 @@ bool __percpu_counter_limited_add(struct percpu_counter *fbc,
 				  s64 limit, s64 amount, s32 batch)
 {
 	s64 count;
+	s64 gcount;
 	s64 unknown;
 	unsigned long flags;
 	bool good = false;
@@ -338,11 +339,16 @@ bool __percpu_counter_limited_add(struct percpu_counter *fbc,
 	local_irq_save(flags);
 	unknown = batch * num_online_cpus();
 	count = __this_cpu_read(*fbc->counters);
+	/*
+	 * Lockless on purpose: gcount may be stale, so this is only an
+	 * approximation, bounded by the per-cpu slack ("unknown").
+	 */
+	gcount = data_race(READ_ONCE(fbc->count));

 	/* Skip taking the lock when safe */
 	if (abs(count + amount) <= batch &&
-	    ((amount > 0 && fbc->count + unknown <= limit) ||
-	     (amount < 0 && fbc->count - unknown >= limit))) {
+	    ((amount > 0 && gcount + unknown <= limit) ||
+	     (amount < 0 && gcount - unknown >= limit))) {
 		this_cpu_add(*fbc->counters, amount);
 		local_irq_restore(flags);
 		return true;
--
2.55.0

