Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEFA4AD7D6
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790107530; cv=none; b=sYBY6dB41k8Ju5r7rqQFStuYPr+rdVnAMB71hqq9v3iQ4rg9z1okJEYSxS8cHi4jaGfPbGduxrvQe0qtQ1hNEvoANU9QxZjMxer+AZsH+BZ7eFQluEqQcZqEmg9LBmXG+/JrmRDs3bHsy+Oel9R7YbjAhn0HqXk5xptiBVULR1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790107530; c=relaxed/simple;
	bh=bFw02r6jaNHaixJWkVpkqw5kzInfhX7ALGYlfWx0JxU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nZIDSPdm36dvjcBvbtMcwZiMIJQdTaBqHbKoYF9riAwr8gYtZ8L8IKMLCVrIsgIz6RwNvVnDx+aA6JE4P1FmjRe8Ro+7sFMYAZS81aMe5/OOfyMbvYLE6lrgILkvZ0pgiP/1N8AYCxbj4299GfahvwTB+nBkLfJo6arvXiurwxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=QBsn78Bg; arc=none smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="QBsn78Bg"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-328664e051fso199773eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1790107493; x=1790712293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uyRungl+NqmtYNgL/8dH71XCYpq6TtSAT/snP5PAQEU=;
        b=QBsn78BgjpJcmnggRqdiZ7VA86NmropjefaQcSEznCpE+jZdF0E8ppUsN7K5CbRgo/
         eJS6dp1tvQ4Blg81vhRdNxEp5Rp5V+6KlMu4CkdbolgDEoTrwxQzMmEth1OYSLDrEzDt
         1tcqlL2pwI2O0fZzM13BBwL1U0nvBhCNTsQf3FlbmvMWg7O2mvIc2AaXeSfCttefzLj8
         cAwtB33TG21cmyKWUvwxliR89HDKTgJL71dowMlM5+L7j/oMfuf3sZH1jjpGzo4lq7HP
         rmxcVQjGuHu9BlQXu5ySRMHRlYyc5x08J/TKoDeYirVbtNcOlQukJPmVC4s35rDEUMh0
         e/sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790107493; x=1790712293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uyRungl+NqmtYNgL/8dH71XCYpq6TtSAT/snP5PAQEU=;
        b=p9Th36Z953VUI9zS6PoFOj0uPM7g56C/E8zXnAfSQB3eo+PqhBedlAC4wBCKMd/ypM
         7tLcxuEdNrdHZuU/UxoWyYMWOK3N4llJPmHaU3yguDsyIoCbjGHbS24/JiJyv2kmYj13
         GouICZPOPn3deP/2ube0cZKlTX59SecBH5RPS771KPkf5QAwDXRDzTAcUf3NcnwZE4Gm
         cfxrdqUEf1rShCBYrKH7+EZ7LWkGw+2R1Gk1bnKYdePAIU3y/BBfY6rqSawk8GO1XRik
         kVF6lTAKY0B10jj9Scuf3xyWFAivz1lpW4+tQ/cVhRh8QMm2uZg0Gh0gQc+7I1eQNOJG
         aQVw==
X-Forwarded-Encrypted: i=1; AKwUvBx6MXWSvkkvorXT7xbQEDVHlEjpBNSg7tZ1/8O9VTI6Efrqm+xwJ85JX/eGMlJ6bsmwLEmCW89+tgeuPk8=@vger.kernel.org
X-Gm-Message-State: AFuF++kOjgl4n9aorJds2RHc84CWJRyVz8hOy0q9YyLxXe2j4vQgEH/v
	eelLVK0/wLAcrFKXmQG8oYfby2QbqvwcenNyYqXBhT7Mj140mwTLq+biX2uj696jSKA=
X-Gm-Gg: AYBFou3wdql7YMJp1w181/O0JxwXAlY1DcHNjYXgFH3IV4sMuVZKCMapVEhcLJvNWWp
	dmy5ad23KQaNNa/g9faAeh3mypKejKy2YusHMglZLZJGcL906XhhL8TGNBhNaSVWeydomyljuhU
	ZAZa6rmB7lAxWFS5Hs3fgbHcoEDzEY3ZNGbkceNYDFjNbZ6q56U1eySshxMtzr0okdgK2tSlSWC
	9BP9K5JguFehvizmF4x1nlGmC1sJzpEHSrjtNbZbi5vRHF/O0U1wQIpINiylMPrlrIeHN2x2mDj
	Ne9Gg8/DUJ3FAn9l3wUz2qrYmH3c66X8YQymDOJsACVawVQymzZMBWeLpd/EO/pjHULmm6bBjBn
	HOyURj3o8MI9zmsdI9pHMFp0A+z5oaBQbT/n2oPl94JPDVYljpwp8++jyPxUGgO2x9QMSGaiHNV
	Yb2Io9HdSOk8bSwCKZiIxiieNudGgRZUImEM7P9CKPJISbJmthDVi6xNZWC3GYlAsNb7RLYLSSw
	WXPuKSLEvQp5fyU+FkTbBLpF/lf46ZivVTpDj/G2914Gp40OEKhzCygYVSuo3ytxixIOr8=
X-Received: by 2002:a05:7022:3a08:b0:143:4710:a84e with SMTP id a92af1059eb24-144f9186b23mr505519c88.15.1790107493262;
        Tue, 22 Sep 2026 13:04:53 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:c016:77a6:d382:7611])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f983c5a1sm852614c88.7.2026.09.22.13.04.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Sep 2026 13:04:52 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Gao Xiang <xiang@kernel.org>,
	Chao Yu <chao@kernel.org>,
	Yue Hu <huyue2@coolpad.com>,
	Jeffle Xu <jefflexu@linux.alibaba.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Sandeep Dhavale <dhavale@google.com>,
	Will Shiu <will.shiu@mediatek.com>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Will Shiu <Will.Shiu@mediatek.com>
Subject: [PATCH 6.1.y] erofs: Fix detection of atomic context
Date: Tue, 22 Sep 2026 16:04:36 -0400
Message-ID: <20260922200448.27724-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sandeep Dhavale <dhavale@google.com>

[ Upstream commit 12d0a24afd9ea58e581ea64d64e066f2027b28d9 ]

Current check for atomic context is not sufficient as
z_erofs_decompressqueue_endio can be called under rcu lock
from blk_mq_flush_plug_list(). See the stacktrace [1]

In such case we should hand off the decompression work for async
processing rather than trying to do sync decompression in current
context. Patch fixes the detection by checking for
rcu_read_lock_any_held() and while at it use more appropriate
!in_task() check than in_atomic().

Background: Historically erofs would always schedule a kworker for
decompression which would incur the scheduling cost regardless of
the context. But z_erofs_decompressqueue_endio() may not always
be in atomic context and we could actually benefit from doing the
decompression in z_erofs_decompressqueue_endio() if we are in
thread context, for example when running with dm-verity.
This optimization was later added in patch [2] which has shown
improvement in performance benchmarks.

==============================================
[1] Problem stacktrace
[name:core&]BUG: sleeping function called from invalid context at kernel/locking/mutex.c:291
[name:core&]in_atomic(): 0, irqs_disabled(): 0, non_block: 0, pid: 1615, name: CpuMonitorServi
[name:core&]preempt_count: 0, expected: 0
[name:core&]RCU nest depth: 1, expected: 0
CPU: 7 PID: 1615 Comm: CpuMonitorServi Tainted: G S      W  OE      6.1.25-android14-5-maybe-dirty-mainline #1
Hardware name: MT6897 (DT)
Call trace:
 dump_backtrace+0x108/0x15c
 show_stack+0x20/0x30
 dump_stack_lvl+0x6c/0x8c
 dump_stack+0x20/0x48
 __might_resched+0x1fc/0x308
 __might_sleep+0x50/0x88
 mutex_lock+0x2c/0x110
 z_erofs_decompress_queue+0x11c/0xc10
 z_erofs_decompress_kickoff+0x110/0x1a4
 z_erofs_decompressqueue_endio+0x154/0x180
 bio_endio+0x1b0/0x1d8
 __dm_io_complete+0x22c/0x280
 clone_endio+0xe4/0x280
 bio_endio+0x1b0/0x1d8
 blk_update_request+0x138/0x3a4
 blk_mq_plug_issue_direct+0xd4/0x19c
 blk_mq_flush_plug_list+0x2b0/0x354
 __blk_flush_plug+0x110/0x160
 blk_finish_plug+0x30/0x4c
 read_pages+0x2fc/0x370
 page_cache_ra_unbounded+0xa4/0x23c
 page_cache_ra_order+0x290/0x320
 do_sync_mmap_readahead+0x108/0x2c0
 filemap_fault+0x19c/0x52c
 __do_fault+0xc4/0x114
 handle_mm_fault+0x5b4/0x1168
 do_page_fault+0x338/0x4b4
 do_translation_fault+0x40/0x60
 do_mem_abort+0x60/0xc8
 el0_da+0x4c/0xe0
 el0t_64_sync_handler+0xd4/0xfc
 el0t_64_sync+0x1a0/0x1a4

[2] Link: https://lore.kernel.org/all/20210317035448.13921-1-huangjianan@oppo.com/

Reported-by: Will Shiu <Will.Shiu@mediatek.com>
Suggested-by: Gao Xiang <xiang@kernel.org>
Signed-off-by: Sandeep Dhavale <dhavale@google.com>
Reviewed-by: Gao Xiang <hsiangkao@linux.alibaba.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Link: https://lore.kernel.org/r/20230621220848.3379029-1-dhavale@google.com
Signed-off-by: Gao Xiang <hsiangkao@linux.alibaba.com>

[ Backport to 6.1.y: the source change is unchanged; only its location
  in z_erofs_decompress_kickoff() differs. ]
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi Greg, Sasha, and EROFS maintainers,

I am continuing backporting CVE fixes still missing from 6.1.y.
This fix is inherited by v6.6 and every later mainline release, but 6.1.y
still has the affected code. The target-specific adjustment is described
in the bracketed note above.

Could you please queue it for 6.1.y?

Thanks,
Artem Dinaburg

CVE: CVE-2023-53231

Build: This patch was included in an x86_64 allmodconfig and
CONFIG_WERROR=y build.
It produced vmlinux and modules with no new warnings or errors.

AI assistance: An LLM helped find, adapt, and validate this
backport; I reviewed the patch and test output.

 fs/erofs/zdata.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/erofs/zdata.c b/fs/erofs/zdata.c
index 66c323cbdd73e1..49b7c77488415a 100644
--- a/fs/erofs/zdata.c
+++ b/fs/erofs/zdata.c
@@ -1271,7 +1271,7 @@ static void z_erofs_decompress_kickoff(struct z_erofs_decompressqueue *io,
 	if (atomic_add_return(bios, &io->pending_bios))
 		return;
 	/* Use workqueue and sync decompression for atomic contexts only */
-	if (in_atomic() || irqs_disabled()) {
+	if (!in_task() || irqs_disabled() || rcu_read_lock_any_held()) {
 		queue_work(z_erofs_workqueue, &io->u.work);
 		/* enable sync decompression for readahead */
 		if (sbi->opt.sync_decompress == EROFS_SYNC_DECOMPRESS_AUTO)
-- 
2.39.5

