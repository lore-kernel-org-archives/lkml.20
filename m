Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=176.10.93.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793358705;
	b=X0p3p6Fk0BoVl6DggPvu9JqYCex+kYYwLeyLwecuBRSoKzYd6kghg7QtFPjTi8Tresqu
	 bYMbNwZuyJ2KVk12lM1o5EEeurmD5wsWIXBSh6WqffuSKYDaE4oezsHgp7xrrntZ6cj+f
	 neKPAYuEWskBBDuw3J3Qx1SWyDNRXsbostKCkUa/aS7G/RMoRnqEMbvRcF0MIhryFDHbZ
	 t7UFU8Vhn34FRPvv2wR8U9ejPpXYNSrBNw+XFfBeQIlJ2cGp4jycuYS6dgHtvhVK1+cZU
	 ItYZ8HJIbt4ARQMZrnPkmGRNme8NwR0UI3OnsiSW6BW5TAmbDkpDg08DiXw/eIWIdhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793358705;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-Originating-IP:X-ClientProxiedBy;
	bh=y2UG5XiP3g7yITzPkEcF1pPDNm2Tb3z2RMnHFZbQ/4w=;
	b=KSHPNnMoxddEXVsFiqhDxolhh6X+mo/LgQxqm99Ahj/3cxsMEnE9WPAFpSmullUEoh4B
	 eCp9vZLr8VkZo1E02KiQjsB1iKSbsyN/UQhPxtIoqiIFnVvWr1T1Msa0NFihdIsJL2mhQ
	 PtlNl5zx4DB+Toz1Vvk2qFQnzQySsHVCAcymAEeiUbqiZwIeXDC4IDfVBsDMXDbsRbcOK
	 AZjgpCq87hNYXTE+akVsWs/yY8kKw8z3ZKikawmn7x2bYhDAvk2Eex0CmzyVpulUJdlj9
	 rN6Gy9JZE6A100p2bu/v0B543A0PxAXQL6NXgzAwQt4zX8xXr/UCFOXev6BWQ2Qt2Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cyberprotect.ru;
	spf=pass smtp.mailfrom=cyberprotect.ru;
	dkim=pass header.d=cyberprotect.ru header.i=@cyberprotect.ru header.a=rsa-sha256 header.s=dkim-r header.b="en/CuDcL";
	dkim=temperror header.d=cyberprotect.ru header.i=@cyberprotect.ru header.a=ed25519-sha256 header.s=dkim header.b=wJ5wFA11;
	arc=none smtp.remote-ip=176.10.93.31
Received: from mx2.cyberprotect.ru (mx2.cyberprotect.ru [176.10.93.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C6D606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:11:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71C6D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cyberprotect.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberprotect.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cyberprotect.ru header.i=@cyberprotect.ru header.a=rsa-sha256 header.s=dkim-r header.b=en/CuDcL;
	dkim=temperror header.d=cyberprotect.ru header.i=@cyberprotect.ru header.a=ed25519-sha256 header.s=dkim header.b=wJ5wFA11
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=cyberprotect.ru; s=dkim-r; h=MIME-Version:Date:From:Sender:Reply-To;
	bh=y2UG5XiP3g7yITzPkEcF1pPDNm2Tb3z2RMnHFZbQ/4w=; b=en/CuDcL+5jwmgnpwkKdpI5t8V
	TgTJ8YKS3fwRNGxQ2KGZMr3oATnZrgQcvcqxZ9NpSGFTCOJADSouw7fnWC/z2N4ZFKsw/Ad7lGvTH
	OUHadaiufZXXPC/M2WsdemNmPwmf7aiUKJ244i3e95vrDH793k0lekV0NERqMK7w9Lwua/8QbOr+z
	4sIZ5Mh58WGFGIx5paTq5U9+XFEmptRgr+e7ElAydQv/BGjGfGslqUH3mi1AnNWIc3HrHW+YLhG6V
	C9l85nIY0K3TpEcv63Ru3uZHGIBLyafdtMTbz50KIoTpX4diCF2c3lkLYJS75Y/+fivpICIn2POnR
	WB4ivUyQ==;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=cyberprotect.ru; s=dkim; h=MIME-Version:Date:From:Sender:Reply-To;
	bh=y2UG5XiP3g7yITzPkEcF1pPDNm2Tb3z2RMnHFZbQ/4w=; b=wJ5wFA11KvVIDlHAYVZ6ptfJWl
	gJNam8mGIePiIzeF2mmJHpkgEr4bdKq5C2duA3rZoxYh1gNXulaV0e7QLTDQ==;
From: Dmitriy Chumachenko <Dmitry.Chumachenko@cyberprotect.ru>
To: Jaegeuk Kim <jaegeuk@kernel.org>
CC: Chao Yu <chao@kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>,
	<linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>, Dmitriy
 Chumachenko <Dmitry.Chumachenko@cyberprotect.ru>,
	<syzbot+8b85865808c8908a0d8c@syzkaller.appspotmail.com>
Subject: [PATCH] f2fs: reject mount when block_count exceeds device capacity
Date: Fri, 30 Oct 2026 14:11:12 +0300
Message-ID: <20261030111112.20953-1-Dmitry.Chumachenko@cyberprotect.ru>
X-Mailer: git-send-email 2.49.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AIP-EXCH-1.aip.ooo (10.77.28.101) To AIP-EXCH-1.aip.ooo
 (10.77.28.101)

During fuzz testing, the following issue was discovered.

INFO: task kworker/u9:2:981 blocked for more than 122 seconds.
      Not tainted 7.1.0-rc4-00103-ge94869f14310 #59
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/u9:2    state:D stack:25800 pid:981   tgid:981   ppid:2      task_flags:0x4208060 flags:0x00080000
Workqueue: writeback wb_workfn (flush-7:0)
Call Trace:
 <TASK>
 __schedule+0x122f/0x6530
 rt_mutex_schedule+0x96/0xe0
 __rt_mutex_slowlock_locked.constprop.0+0x13bd/0x3280
 rwbase_write_lock+0x5df/0x720
 f2fs_down_write_trace+0xc8/0x320
 f2fs_balance_fs+0x6ee/0xa50
 f2fs_write_inode+0x5e4/0x15a0
 __writeback_single_inode+0xcda/0x1360
 writeback_sb_inodes+0x767/0x1d90
 __writeback_inodes_wb+0xf8/0x2d0
 wb_writeback+0x723/0xb90
 wb_workfn+0x8e6/0xc10
 process_one_work+0xa0e/0x1980
 worker_thread+0x5ef/0xe50
 kthread+0x370/0x450
 ret_from_fork+0x72b/0xd50
 ret_from_fork_asm+0x1a/0x30
 </TASK>

The superblock declares a block_count larger than the backing device, but
sanity_check_raw_super() validates block_count only against segment_count
and never against the device size, so the oversized filesystem mounts and
its main area extends past the end of the device.

On the first fallocate(), f2fs_balance_fs() runs foreground GC, which
selects a victim segment located beyond the device. The blocks are valid
per on-disk metadata, so is_alive() accepts them and do_garbage_collect()
keeps issuing reads past the end of the device without making progress,
while holding sbi->gc_lock. Writeback and sync then block on gc_lock
indefinitely, producing the hung task above.

This only affects single-device setups: on a multi-device volume
block_count is the whole-filesystem total and legitimately exceeds the
primary device, so the check is restricted to single-device images and
compares block_count against the backing device capacity.

Fixes: aff063e266cb ("f2fs: add super block operations")
Reported-by: syzbot+8b85865808c8908a0d8c@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=8b85865808c8908a0d8c
Signed-off-by: Dmitriy Chumachenko <Dmitry.Chumachenko@cyberprotect.ru>
---
 fs/f2fs/super.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index fabcafafabf1..ba484a32f292 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3445,6 +3445,13 @@ static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
 			  segment_count, le64_to_cpu(raw_super->block_count));
 		return -EFSCORRUPTED;
 	}
+	if (!RDEV(0).path[0] &&
+	    le64_to_cpu(raw_super->block_count) > sb_bdev_nr_blocks(sbi->sb)) {
+		f2fs_info(sbi, "block_count(%llu) exceeds device capacity(%llu blocks)",
+			  le64_to_cpu(raw_super->block_count),
+			  (unsigned long long)sb_bdev_nr_blocks(sbi->sb));
+		return -EFSCORRUPTED;
+	}
 
 	if (RDEV(0).path[0]) {
 		block_t dev_seg_count = le32_to_cpu(RDEV(0).total_segments);
-- 
2.49.0

