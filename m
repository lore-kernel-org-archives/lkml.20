Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792502195;
	b=aQUuB3aZo8n8GB83ORFAw4lZU3XVyxAEpL4NzploUazyVy+rCrMVygKgAWQPf3tyN7KU
	 m0uNiXDmwjIqiO/6mZz7izSU/DlIXH2Ah3Q4Lql0XnIT0u7V3tB8FImsmsM6nVIvRwSx+
	 JGMMbbkBy8UMtfhhUuojU2iQs739d+rVx7zRLoNco2u9ilxzVkCfG4d96G0c/4p8Voy5g
	 hFrw4GWesU8oLpim/Nc1AicDPhV6yBOLGPOJ4ag1OA64Ci7BkdSLHb1TrQNSwPgOijEAa
	 GqOuJgmYxsw2fONCJy6vHQ6bTEQdqug79pLMC6016GJ1WCpyR5szDnkl0KpqJl59G8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=F3m/+L4fUaNtacc/BKjjfkqz9A0nN/jif39xvTqMZ1Q=;
	b=K8gZ5StLDqiXiaaAgAewc5DqpduUldZpc7RuNf3vsFnuujYfGJdAC+/zB8yQgPEmnVzX
	 LtghtUyJtb5FEfKZ0rf1QUgMuhN8u9IpOFrZgCuTXI835KDQ0Jg//OTVl+c0D8DDIld91
	 JThr7kdyTj657WaGYJ93pI7wFJQQwxW76xkD6PmVN/HYeNVHp2eDU7lvBbxP2iaiBjtnI
	 nX7Ddy3EjZ9LU/qynMaBZmmdrohNglQTbwkWpaVCtZRGLJ+Xo80iuQwk4jdebbl1Cvtjv
	 vs+ogilFYRElzjQheiE4A1GFOj8I5NIlK8alaItTMnpliJqn+zNl/3ciD876gvcN49Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TzBrFBHy;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0F8606A320
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:16:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B0F8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TzBrFBHy
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e901e114fdso15793745ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792502193; x=1793106993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F3m/+L4fUaNtacc/BKjjfkqz9A0nN/jif39xvTqMZ1Q=;
        b=TzBrFBHyBtdFSpr+MtNwS04HVn5uD758RHA8yVWKhAWbDr71w6h9jPe8+JLkQoOFwB
         DDeMdtdXF2XIZlqsGxZc/3YLmig6zEGo/1l1nPxGSZfV12T2xVkIgMCJSCZ3hcqhuAL4
         rSFJM7Sw5jLp6fLXhPBdlRzPRP6oPuNZXCj6esI0XFISowVgFKY3KR1nWRUjgOqmiU/P
         I9xTw53cnju5JQydUhs+ayrS++vYKMdlDVY3A25aRlZQoR03+zStGvRODwAw3MT4Zp8/
         KAhJOLhQt1zW0WtQ9JGmahxpFd4enFftlTNQ5cQvsZ9TyOJd845olkadThN/nmanq8Fx
         +5LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792502193; x=1793106993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F3m/+L4fUaNtacc/BKjjfkqz9A0nN/jif39xvTqMZ1Q=;
        b=Cs72Cc8kVSlSCGlPVmPTggfiggbaiQKneHg32cThO09ZXz7F9J/WFcOV3drQIfN40c
         xj1wzRAYhw4BW9K5DoicyYTcIs73ormCfhhEvLf9Ubj7AKkNwf/kaVo0YgB3KOeBKVkO
         I18DsWG9b1t/awHi74czgb92QfO4d3Dfgl/51hr0y/kaW1rAMWUToC5Jt1Yj2jhYMq5Z
         UId82s7kzN4QzaanhqfieZxmDLIKUEgTEAIkFBl8QCb0XF4sGjR8xjQhfkFSCPR9DtiW
         6EQKNFDbtOLK1e3JJrb/ziCAOvNNKIbl+ZALiKWYPYeDwOi9BF2HcPHkgPqJhAQmt3S6
         +rjg==
X-Forwarded-Encrypted: i=1; AKwUvBye7t6tt8KMu2I4/4JYZeI3nBj0fGDP5ZQUQZoOrqIS2C/HFdRUGSyi1xmERNFagi6nUqLthnDsLFvoWi4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzNGgTiFPnVyK4mz3hwQrA/YMfQA5uVwhDUf9tgfgA88j7nDCf
	CbdKjIikkWRf46NqChx6+UpUqYepM2HD5tYNsHwK661G2daXAT/PJI8uJpbKyPan1AltyA==
X-Gm-Gg: AYBFou1gjyaT3gQPO24mELpYLy6eVVy1Q7FeGfM1zojDij1DH11u/piDkzOX+2avADw
	5HHeVCmp3VWQDeTCGKuofXysNw5oH7kTH5iKtfhyRqfcOajJsf9j2CNn98SG5nLdJF5jhD1yUcT
	W8P6LmhmGtZwemZT9DaLxxKEo1osqQ+Af8gwAOq3j1K8sfIAqLm7kbfESlYBVr42qCd6UecHS33
	HF4AIpBOS3oP8wqUUB65WeNUyXw2sh9hyGT/HpJyrOEFl6vroJLSQrFAAeS0f7H4Hgvbkm4yvUr
	KShf6cZ1fLDt3TeLYMclEUexSRZ/1nN13gdglwLK2N2TuKiWI34yTq0cuvDGksR8rCLpBAr9u7T
	Jx8tqvOBVNsN4Py6EDE0c1a+3wrhjl9CwymlzniJtLpisVXNU7r82P5CfqVwIOlbhQu50qj8H4t
	xNUzpH14EwUZtH5m+kUP2Ajrau5Yz1Xxq0NJz2wsLxNGObo/MgbxrIjGgK+K/HkqFTkA==
X-Received: by 2002:a17:903:37cc:b0:2e8:4040:792b with SMTP id d9443c01a7336-2e9a6a0c86dmr94936015ad.22.1792502193310;
        Tue, 20 Oct 2026 06:16:33 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea1501e24fsm11843535ad.42.2026.10.20.06.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:16:32 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: mark@fasheh.com,
	jlbec@evilplan.org,
	joseph.qi@linux.alibaba.com
Cc: heming.zhao@suse.com,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH] ocfs2/cluster: serialize heartbeat block count with device setup
Date: Tue, 20 Oct 2026 21:16:26 +0800
Message-Id: <pm-ocfs2-objects-candidate-0077-v6-eb25e73523a3cb94fae0@gmail.com>
X-Mailer: git-send-email 2.34.1
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

A heartbeat region's hr_blocks must match the number of slots allocated
in hr_slots until its thread stops. o2hb_region_blocks_store() checks
hr_bdev_file before updating hr_blocks, but neither operation is
serialized with device publication in o2hb_region_dev_store().

Writes to blocks and dev through separate configfs opens can overlap.
The buffer mutex is per open, and both callbacks hold frag_sem for read.
With an initial count N, the following order is possible:

  blocks writer               device writer
  -------------               -------------
  check hr_bdev_file == NULL
                              publish hr_bdev_file
                              allocate N slots in o2hb_map_slot_data()
                              start o2hb_thread() and return
  store hr_blocks = M, M > N
  return

After both writes finish, normal region removal calls kthread_stop().
o2hb_thread() iterates over the enlarged count and passes &hr_slots[N]
to o2hb_shutdown_slot(), which reads ds_node_num beyond the allocation.

Recheck the device guard and update hr_blocks under o2hb_live_lock, and
publish the device file under the same lock. Open the device into a
local pointer to keep the sleeping open outside the spinlock. A blocks
write then either completes before publication and determines the slot
count, or sees the published file and returns -EINVAL. Clear the file
under the same lock after failed-start cleanup has stopped the thread
and unmapped the slots, so configuration can resume safely.

KASAN report as below:

    BUG: KASAN: slab-out-of-bounds in o2hb_thread+0xc62/0xe90
    Read of size 1 at addr ffff888107829ac0 by task o2hb-pmbd-regio/497

    CPU: 3 UID: 0 PID: 497 Comm: o2hb-pmbd-regio Not tainted 7.3.0-rc4-next-20260921-pmb-ocfs2-functional-v1+ #1 PREEMPT(lazy)
    Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
    Call Trace:
     <TASK>
     dump_stack_lvl+0x93/0xd0
     print_report+0xce/0x630
     ? o2hb_thread+0xc62/0xe90
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __virt_addr_valid+0x20e/0x420
     ? o2hb_thread+0xc62/0xe90
     kasan_report+0xe0/0x110
     ? o2hb_thread+0xc62/0xe90
     o2hb_thread+0xc62/0xe90
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __pfx_o2hb_thread+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __lock_acquire+0x5a3/0x2140
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? lockdep_hardirqs_on_prepare+0xeb/0x1a0
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? trace_hardirqs_on+0x18/0x160
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __pfx_o2hb_thread+0x10/0x10
     ? kthread+0x351/0x460
     kthread+0x351/0x460
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __pfx_kthread+0x10/0x10
     ret_from_fork+0x659/0x940
     ? __pfx_ret_from_fork+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __switch_to+0x74f/0xf70
     ? __pfx_kthread+0x10/0x10
     ret_from_fork_asm+0x1a/0x30
     </TASK>

    Allocated by task 496:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     __kasan_kmalloc+0xaa/0xb0
     __kmalloc_noprof+0x2de/0x780
     o2hb_region_dev_store+0x7c4/0x1c70
     configfs_write_iter+0x2f9/0x4f0
     vfs_write+0x639/0x1010
     ksys_write+0x111/0x200
     do_syscall_64+0x114/0x620
     entry_SYSCALL_64_after_hwframe+0x77/0x7f

    The buggy address belongs to the object at ffff888107829a80
     which belongs to the cache kmalloc-64 of size 64
    The buggy address is located 8 bytes to the right of
     allocated 56-byte region [ffff888107829a80, ffff888107829ab8)

(Page and memory-state dump omitted.)

Fixes: a7f6a5fb4bde ("[PATCH] OCFS2: The Second Oracle Cluster Filesystem")
Cc: <stable@vger.kernel.org>
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
Assisted-by: LLM
---
 fs/ocfs2/cluster/heartbeat.c | 30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/fs/ocfs2/cluster/heartbeat.c b/fs/ocfs2/cluster/heartbeat.c
index b45adc39aacc..7448ee53aebe 100644
--- a/fs/ocfs2/cluster/heartbeat.c
+++ b/fs/ocfs2/cluster/heartbeat.c
@@ -1746,7 +1746,13 @@ static ssize_t o2hb_region_blocks_store(struct config_item *item,
 	if (tmp > O2NM_MAX_NODES || tmp == 0)
 		return -ERANGE;
 
+	spin_lock(&o2hb_live_lock);
+	if (reg->hr_bdev_file) {
+		spin_unlock(&o2hb_live_lock);
+		return -EINVAL;
+	}
 	reg->hr_blocks = (unsigned int)tmp;
+	spin_unlock(&o2hb_live_lock);
 
 	return count;
 }
@@ -1878,6 +1884,7 @@ static ssize_t o2hb_region_dev_store(struct config_item *item,
 {
 	struct o2hb_region *reg = to_o2hb_region(item);
 	struct task_struct *hb_task;
+	struct file *bdev_file;
 	long fd;
 	int sectsize;
 	char *p = (char *)page;
@@ -1911,13 +1918,22 @@ static ssize_t o2hb_region_dev_store(struct config_item *item,
 	if (!S_ISBLK(fd_file(f)->f_mapping->host->i_mode))
 		return -EINVAL;
 
-	reg->hr_bdev_file = bdev_file_open_by_dev(fd_file(f)->f_mapping->host->i_rdev,
-			BLK_OPEN_WRITE | BLK_OPEN_READ, NULL, NULL);
-	if (IS_ERR(reg->hr_bdev_file)) {
-		ret = PTR_ERR(reg->hr_bdev_file);
-		reg->hr_bdev_file = NULL;
-		return ret;
+	bdev_file =
+		bdev_file_open_by_dev(fd_file(f)->f_mapping->host->i_rdev,
+				      BLK_OPEN_WRITE | BLK_OPEN_READ,
+				      NULL, NULL);
+	if (IS_ERR(bdev_file))
+		return PTR_ERR(bdev_file);
+
+	/* Freeze hr_blocks before allocating the slot array. */
+	spin_lock(&o2hb_live_lock);
+	if (reg->hr_bdev_file) {
+		spin_unlock(&o2hb_live_lock);
+		fput(bdev_file);
+		return -EINVAL;
 	}
+	reg->hr_bdev_file = bdev_file;
+	spin_unlock(&o2hb_live_lock);
 
 	sectsize = bdev_logical_block_size(reg_bdev(reg));
 	if (sectsize != reg->hr_block_bytes) {
@@ -2036,7 +2052,9 @@ out:
 		o2hb_unmap_slot_data(reg);
 
 		fput(reg->hr_bdev_file);
+		spin_lock(&o2hb_live_lock);
 		reg->hr_bdev_file = NULL;
+		spin_unlock(&o2hb_live_lock);
 	}
 	return ret;
 }
