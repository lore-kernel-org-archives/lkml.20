Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794569647;
	b=MBVHUQhjua1rRks6jNKkEX0mXo7Q0dw4ydZDAsyHvqd+ky9yB3Eo7MlAOpQ6FR3Tzx3A
	 aCaCPmItlL6d9jZb0udmwBrpgbkw7eKULqJg/55kMhDx0k4iSJlHkS/laSOn1vIzawhc/
	 kEHLz49l62NEQniURQYUCXMAMQQIce1XI0rexvVigKbdB9lb8ZTuy1eJQIcFVlmXiDzxY
	 fX7+6Xnuhq2lFEq5ZBMMe4S2JFXQnAg0t4woa8+Hxy6It8Ywbewe6ccvmuP23rwq7jBGm
	 5wDxN7SdI4lGXqv1Htx2kavElSNPUM+rRbxNUwwKVOvzRwxgNuPZJW/ETwFTQqVUa/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794569647;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=VHd/V3qu0rqnu55hIwOwRRLtbhU8RA6QEV81DvAQRc8=;
	b=zk9ISxj+zsn5apGhAjB4cOjVAIPmn68wWjAy7hIh5lJKj47CJXb1G2r97nL7Sh4Ywqxc
	 NmGxHgshVieT+Cm9MPMmneaO5uVAfdXHia0P85I+VR0sJxuTdXhTTzP+LHaXCAHnQtkP/
	 Qt0Ui0XnqZoGRwAKfTLTHd7O11JqcL3vnx0mOKZq2kTA0OgXkI6jlPAxq1oE7nc6Zn8w6
	 0Cnp3zr6re+h3mSa973yv3JEWtgJmzQESiEX94+o/KyiaiVZi5haleKE63P7+NQhoDRN4
	 OHkTzSXiOF4nxxsGDqawOrDCz0F0C42A+h9y9VUAKUbaJgg5pD3C0b1gLNsIE0g/gYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uniontech.com;
	spf=pass smtp.mailfrom=uniontech.com;
	dkim=pass header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b="k/WBg++z";
	arc=none smtp.remote-ip=54.204.34.130
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44A4606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:34:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D44A4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=k/WBg++z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1794569565;
	bh=VHd/V3qu0rqnu55hIwOwRRLtbhU8RA6QEV81DvAQRc8=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=k/WBg++zPX00yz8cv4oeKQ64ZgkZzix9f79qtPVcuGwrTA9QR76ngxqW9XnP7jML+
	 J0UcNNUjxuef9HQZk1AnvV4ZpZgyXZVJtMiAE+Dj0XudeAvfsP1xEP0vnu9XnhpshY
	 N+iA52HElc7+X6DcSikzAsxVGIV6k5FwVTQM1ylg=
X-QQ-mid: zesmtpip2t1794569526tac643835
X-QQ-Originating-IP: wHH/jMG8YP+G/YqKf5W0TrO5Gq0k1HQV2DBYaCoz/pg=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 13 Nov 2026 19:32:04 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 9348496667323867854
EX-QQ-RecipientCnt: 14
From: Gou Hao <gouhao@uniontech.com>
To: xiang@kernel.org,
	chao@kernel.org,
	zbestahu@gmail.com,
	jefflexu@163.com,
	dhavale@google.com,
	hongbohbli@tencent.com,
	guochunhai@vivo.com,
	hongzhen@linux.alibaba.com
Cc: linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	guanwentao@uniontech.com,
	niecheng1@uniontech.com,
	gouhaojake@163.com,
	gouhao@uniontech.com
Subject: [PATCH] erofs: reject turning inode_share on during remount
Date: Fri, 13 Nov 2026 19:32:04 +0800
Message-Id: <20261113113204.560730-1-gouhao@uniontech.com>
X-Mailer: git-send-email 2.20.1
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
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: OLsBWtCIHsg6gZWVKOqX6oVeWVEPA7Ii9VkltuL8neVd/ibJ+AcmPtu3
	LT6exZQJzT9zcVdsWxSBwAukGbPyXvdXYFO8QUxQwEvtACtN/K8Xdbv9yyaJz/CUHwy7Z29
	4XU1DdXBSJ89VZCKF592LNaXlPnE0zWndLbtqWVAbyUvjnup+z4OkgALRE4Qr1FTsPqrXaO
	wrYcFLstd5CQ9tYe3va0bWkBJyr3y4ebx0zALDzuAFiDm/3qZbvtNh3607njhYJ2uefxmoc
	Q8pic+omuFufrmWQ3KkHbAZa99L5HoS4/qGWN4ZsajTq3vyPbD2myfUdb8S3PibW1kL5j1J
	VjDyvW54/EljFRs/WglN8EZTEzjH3K0+Qmq7rnuYGW5B9EXnCqOhtx4h67WosS6jbg2PMpF
	KdNaxs+HUs6A6aNnknu/mecoCCSHvpjaiwnQVimz4gWeln/POw8jIc0OLdcfBA4atGvoMul
	woO6zjXn0tZeNYsFaCWY4haXkTBKd97OxPGQk/JStLod9y1CGCkjdQyYx4qRLsMzRC+ZKCc
	Q7TfLinV5x0B5Q8EVZKQa5Uv6pSuPA0o0QfhigSkmL/Nm5y/Fy2IUUja58aY1V40wywE2kE
	3ScQYfGOSkI3zFpAogUS7jRxFqSaSTphXFzKjXMUr5ORLy2rmQDrp6dDrQYBu1ovtkYNDIK
	KfeFSOtB+8dt45ZaDy8mTiut+vLEqsN+QZ1k/Dq8dHZ9bBzdmM91VfFFwKnCZfrkA8DvF9z
	CSw6H28u2Zp6heKDtF/K/1mSFMPt8FKQO3MkDwqMuABTl4h7a3Jr4VQUpGuDTXrfnZQ26K0
	hHqx24CuG+mgul3OrnilH1bI0uUqzUyZGAy7GzbPynOJ7vDPVmT4I41wQxZJ0HSqKqatIZS
	RVXIdZxbQvJcwmyeWR1/Vbc0rDJVHAocf2POmZH7at3DNkCb7ma6KfI3kNu7yp2apHmfNzl
	pGQcGDKKPj2o1Ctnj2uEeZMpFH6EAjAlqYS4xEa3Se/1GPxQq0oiZx2GtBMsMXi21o8aviJ
	AZRhVEwZseH/K3se23GeR2M7ilFjAt8Zp/mjHIwKc6NnsmPBWW3RMUTTYQd8ytzClfvO2xI
	aRxW0ncBverGVngKTNZwrpxDOH9UX7EKg==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

The inode_share and domain_id constraint is validated when a
superblock is initialized, but remount replaces the live mount options
with a newly parsed option set without rechecking it.

Therefore a filesystem mounted without domain_id can enable inode_share
by remount.  For an image with ishare xattrs, the next lookup of a
regular file then passes a NULL domain_id to
erofs_xattr_fill_inode_fingerprint() and crashes.

Since domain_id cannot be changed by remount, reject turning inode_share
on during remount.

Reproducer:

	mkfs.erofs --xattr-inode-digest=erofs.fingerprint.v1 img  man/
	mount img t
	mount -o remount,inode_share t
	ls t/

Full crash log:

[   50.416381] erofs (device loop0): mounted with root inode @ nid 37.
[   78.553276] BUG: kernel NULL pointer dereference, address: 0000000000000000
[   78.553882] #PF: supervisor read access in kernel mode
[   78.554326] #PF: error_code(0x0000) - not-present page
[   78.554762] PGD 0 P4D 0
[   78.555014] Oops: Oops: 0000 [#1] SMP NOPTI
[   78.555423] CPU: 4 UID: 0 PID: 4446 Comm: ls Kdump: loaded Not tainted 7.3.0-erofs #2 PREEMPTLAZY
[   78.556105] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.16.3-0-ga6ed6b701f0a-prebuilt.qemu.org 04/01/2014
[   78.556942] RIP: 0010:strlen+0x0/0x20
[   78.557284] Code: f7 75 ec 31 c0 e9 40 76 02 00 48 89 f8 c3 cc cc cc cc 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 <80> 3f 00 74 14 48 89 f8 48 83 c0 01 80 38 00 75 f7 48 29 f8 e9 07
[   78.558636] RSP: 0018:ffffd2bb444afab8 EFLAGS: 00010212
[   78.559092] RAX: 0000000000001000 RBX: 0000000000000027 RCX: 000000000000000c
[   78.559652] RDX: ffffffffffffffff RSI: ffff8f2bcdef0d71 RDI: 0000000000000000
[   78.560267] RBP: ffff8f2bc526b000 R08: 0000000000000610 R09: 00000000e096ebe3
[   78.560839] R10: 0000000074d3def0 R11: 0000000085971d85 R12: ffff8f2be536fae0
[   78.561443] R13: ffffd2bb444afb08 R14: 0000000000000000 R15: ffff8f2bcdef0d61
[   78.562019] FS:  00007fe2289c94c0(0000) GS:ffff8f2f478c2000(0000) knlGS:0000000000000000
[   78.562673] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   78.563133] CR2: 0000000000000000 CR3: 000000011e6ec001 CR4: 0000000000772ef0
[   78.563656] PKRU: 55555554
[   78.563892] Call Trace:
[   78.564111]  <TASK>
[   78.564315]  erofs_xattr_fill_inode_fingerprint+0x95/0x150 [erofs]
[   78.564785]  erofs_ishare_fill_inode+0x75/0x260 [erofs]
[   78.565193]  erofs_fill_inode+0x12e/0x190 [erofs]
[   78.565603]  erofs_iget+0x85/0xc0 [erofs]
[   78.565950]  erofs_lookup+0xe6/0xf0 [erofs]
[   78.566312]  __lookup_slow+0x5b/0x100
[   78.566631]  lookup_slow+0x39/0x60
[   78.566914]  path_lookupat+0x19b/0x2a0
[   78.567223]  filename_lookup+0xf0/0x200
[   78.567534]  ? filldir64+0x38/0x190
[   78.567822]  vfs_statx+0x7d/0x150
[   78.568096]  do_statx+0x66/0xb0
[   78.568367]  __x64_sys_statx+0x64/0xd0
[   78.568670]  do_syscall_64+0x8d/0x460
[   78.568974]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   78.569367] RIP: 0033:0x7fe228b5c0de
[   78.569665] Code: 2d 0d 00 ba ff ff ff ff 64 c7 00 16 00 00 00 e9 a5 fd ff ff e8 53 c0 01 00 0f 1f 00 f3 0f 1e fa 41 89 ca b8 4c 01 00 00 0f 05 <48> 3d 00 f0 ff ff 77 2a 89 c1 85 c0 74 0f 48 8b 05 05 2d 0d 00 64
[   78.570936] RSP: 002b:00007ffec5afe428 EFLAGS: 00000246 ORIG_RAX: 000000000000014c
[   78.571485] RAX: ffffffffffffffda RBX: 0000564bf6a2c498 RCX: 00007fe228b5c0de
[   78.572007] RDX: 0000000000000900 RSI: 00007ffec5afe560 RDI: 00000000ffffff9c
[   78.572532] RBP: 0000000000000002 R08: 00007ffec5afe430 R09: 00000000f6a31900
[   78.573061] R10: 0000000000000002 R11: 0000000000000246 R12: 0000000000000000
[   78.573595] R13: 0000564bf6a319f3 R14: 0000000000000000 R15: 0000564bf6a2c480
[   78.574130]  </TASK>
[   78.574334] Modules linked in: erofs loop nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 rfkill ip_set nf_tables intel_rapl_msr intel_rapl_common intel_uncore_frequency_common skx_edac_common nfit sunrpc libnvdimm snd_hda_codec_generic kvm_intel snd_hda_intel snd_hda_codec rapl snd_hda_core pcspkr snd_intel_dspcfg i2c_piix4 joydev virtio_balloon snd_hwdep i2c_smbus rtc_cmos eni_vdpa vdpa sg fuse fsdev_dax sr_mod bochs cdrom drm_shmem_helper drm_client_lib drm_kms_helper sd_mod ahci ata_generic libahci ata_piix drm libata virtio_net net_failover failover serio_raw dm_mirror dm_region_hash dm_log dm_multipath dm_mod
[   78.578967] CR2: 0000000000000000

Fixes: 5ef3208e3be5 ("erofs: introduce the page cache share feature")

Signed-off-by: Gou Hao <gouhao@uniontech.com>
---
 fs/erofs/super.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/erofs/super.c b/fs/erofs/super.c
index ce05557bd998..c641153c5d8f 100644
--- a/fs/erofs/super.c
+++ b/fs/erofs/super.c
@@ -889,6 +889,11 @@ static int erofs_fc_reconfigure(struct fs_context *fc)
 	if (test_opt(&sbi->opt, SUPERBLOCK_SHARE))
 		return -EBUSY;
 
+	/* Enabling inode sharing by remount is not supported.  */
+	if (test_opt(&new_sbi->opt, INODE_SHARE) &&
+	    !test_opt(&sbi->opt, INODE_SHARE))
+		return -EBUSY;
+
 	if (new_sbi->domain_id)
 		erofs_info(sb, "ignoring reconfiguration for domain_id.");
 
-- 
2.20.1

