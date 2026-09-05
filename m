Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net (zg8tmtyylji0my4xnjeumjiw.icoremail.net [162.243.161.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DAE1332EC1
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 01:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.161.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788572155; cv=none; b=d9L0YuAC2a3fyOuoSjQJSs84iyrytpz7CknV4tqeHlixobHFgrYd7kZoOGpCb4JT3+5t4OKrLHlPn9FaGc9GjTfYkzIO7inKgv4aB4kWj7Z5ZkhqMqm/MPswxyXUwkkTUvagaURHM70z2TemCcOuuSmdkEUKDaN8MIAsIUc7nxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788572155; c=relaxed/simple;
	bh=5tGNH0rpiDD3cULyX433fjsphOZuJ45mGAdzi4uXhuo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=orTufMXdJ13viBLy9wcoUkhMr1/Ai5mL7Pw36xrc5Uyh5GN5A1JPo48DkJIb0LMnoERjaQ11w06s8drpqoO6trzuEfYlg00q+qOkH3gQ/vW7LLmZMQr+528neWfU0DRTECJAexjsqlzGAnBNycanPcIiyTjIJmrN3r4WrzyaeVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=162.243.161.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from zju.edu.cn (unknown [10.98.66.117])
	by mtasvr (Coremail) with SMTP id _____wCXn3_scZtq3qnwAA--.9100S3;
	Sat, 05 Sep 2026 09:35:41 +0800 (CST)
Received: from localhost.localdomain (unknown [10.98.66.117])
	by mail-app3 (Coremail) with SMTP id zS_KCgB3j3HscZtqBf3wBA--.6942S2;
	Sat, 05 Sep 2026 09:35:40 +0800 (CST)
From: Fan Wu <fanwu01@zju.edu.cn>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-f2fs-dev@lists.sourceforge.net,
	Chao Yu <chao@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Cen Zhang <zzzccc427@gmail.com>,
	linux-kernel@vger.kernel.org,
	Fan Wu <fanwu01@zju.edu.cn>
Subject: [PATCH 0/2] f2fs: fix use-after-free of sbi in the compressed read path
Date: Sat,  5 Sep 2026 01:34:36 +0000
Message-Id: <20260905013438.419932-1-fanwu01@zju.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zS_KCgB3j3HscZtqBf3wBA--.6942S2
X-CM-SenderInfo: qrstjiaswqq6lmxovvfxof0/
X-CM-DELIVERINFO: =?B?wXPGNgXKKxbFmtjJiESix3B1w3vZ3A9ovKVTomAyoQazvoRs/NHSP8GI2EvgeEEW7R
	sfnZPoDCNGYdHSfuFmYJL54WNSIh3+IPQ0/noQCGy6ZI2Ln4xL/QUJvLHPsjMUn3SmONec
	kIdc81k0Mk4qmCLVK5M=
X-Coremail-Antispam: 1Uk129KBj93XoW7CrWrtw1UCFyrtw47WF1fXwc_yoW5JryUpF
	WY9as5Ar1kXrZ7trZxJ3W0gryS9rWrAa15Gr1agryfZ3WrJrnaqFyFgr1DZ3yUWryrA3sF
	vw48W34kCr90yFXCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Cb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Cr1j6rxdM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57
	IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE
	14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2
	IYc2Ij64vIr41lF7xvr2IYc2Ij64vIr40E4x8a64kEw24l42xK82IYc2Ij64vIr41l4I8I
	3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxV
	WUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAF
	wI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcI
	k0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j
	6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jbo7NUUUUU=

This series fixes two windows in which the completion of a compressed
read drops the last reference of a decompress_io_ctx after the pages
of the cluster were unlocked, so that f2fs_free_dic() dereferences sbi
after a concurrent unmount may already have destroyed
sbi->page_array_slab and freed sbi:

 1/2 reorders the direct completions (the fsverity worker tail and
     the in-task decompression completion) so that their put of the
     decompress_io_ctx happens before the last page unlock of the
     cluster, closing the window when that put releases the final
     reference.  It mirrors the ordering rule the write path already
     has in f2fs_compress_write_end_io(), and needs no new state.

 2/2 makes f2fs_put_super() wait for in-flight decompress_io_ctx
     before the post-read workqueue and the page-array slab are
     destroyed.  It covers the remaining completion, where a mixed
     bio of a verity file releases the compressed-page references on
     the global fsverity workqueue, which unmount does not drain.
     This is the design proposed in Cen Zhang's report of this bug.

Both windows were reproduced with KASAN in QEMU on the f2fs dev tree
baseline with a deterministic 10 s park inside the respective window
(the instrumentation is disclosed in the note of patch 1/2; the
use-after-free itself is the unmodified put_dic -> free_dic path):

  readahead() on a compressed fsverity file, close(), umount():
      28 reports, 0 with patch 1/2
  readahead() spanning an incompressible and a compressible cluster
  of a verity file, close(), umount():
      14 reports with patch 1/2 alone, 0 with patch 2/2

Cen Zhang reported this bug with a KASAN reproduction and proposed the
counter design adopted in 2/2.

Patch 1/2 is not a substitute for patch 2/2: the counter in 2/2 is
the complete lifetime fix and closes every final-put completion
measured here, including the worker tail that 1/2 reorders, while
1/2 alone leaves the mixed-bio completion above still reporting.
Apply the series together: with the reorder, the decompress_io_ctx is
usually gone before the last page unlock, avoiding an unmount delay
in the common case.

Fan Wu (2):
  f2fs: compress: fix use-after-free of sbi in read path
  f2fs: compress: drain decompress contexts at unmount

 fs/f2fs/compress.c | 38 +++++++++++++++++++++++++++++++++++---
 fs/f2fs/f2fs.h     |  6 ++++++
 fs/f2fs/super.c    |  3 +++
 3 files changed, 44 insertions(+), 3 deletions(-)

-- 
2.34.1

