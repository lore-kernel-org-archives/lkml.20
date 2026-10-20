Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792508040;
	b=sCQMuMCfpzrXPA10gc8Ef5evfTIYkXPRLKbjcH1rLXT4cK10dX1IWc5IzcgmKAEMrLYO
	 ayPWUHJQCgBZZbk7gy8j7JFsyjm3G0XVS+X6R4Z5D2eBtidY0JvOSroIxJs+R4j6JT1tF
	 uW29GrOXdLaYd8P5WXtq1MkNXtwbWKFAf8HmxYhd++dAHib2E2yoUPj0kA4N3sK8r9kz6
	 W1if6dCsbzoD38U1iyq6dRgjwZ7Gk8qkXRXQm33dHHK0dP9kHfF92OoYp4qL50fjdokyw
	 Gm/h4fUeDCj9g2bftzJn1DCZsGCmIPVTpoZyLcvlfXydd7WvbUYDnAaZP++sy1fGlkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792508040;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6eEx0sG1RnJ7BXSu4j6o+gX5Sfc9sLmpCWgg8b1O618=;
	b=RAtrj9VQXp0/7Q+qW4tlrimDKbOebFmwFf5V6kv4aypuevqJMl9LQkuovbF4rETKzQfU
	 Yqc55k3go7LtIsYIoepDnAShQEAK5sfxnAD1JlaMlUPD5BT32IyA+7hUK37aDT+DpcKoo
	 NrTyu56IjmIOG92/Xqp7PglwfEdZREjWK4UJPBRS1bV6bggjjkWsDH2nmXLw6XubirNRn
	 5rFVKpqoAG8w2WMpDjJI4djhFQIPZsyRNHqc4GwckhCfAPNRJt0q4DGF1rZWusupCi/+V
	 68YHMaNl5yynZQESU/HCu/Bm6LvZnJlHynDdj0quVxpSCrtQHvmR7inkYKbueTVpFsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Nhij1uXx;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4FA606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:54:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C4FA606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Nhij1uXx
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e8ad5b31c7so18932935ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792508039; x=1793112839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6eEx0sG1RnJ7BXSu4j6o+gX5Sfc9sLmpCWgg8b1O618=;
        b=Nhij1uXxIGsKuaEApqTeFhtDYwOPGOpLuDYQIQNmxzJXEiqTD7XpnuTKF8yICcamr6
         Wz+5PUkQSNGcsFwo1smPcCrVinR9bmHITs59c3vlXrUVC+rlppxm/gsWIYtk9jWoWFnn
         Jv45eycXc2svMhH5WdeiCyG2RHjgZZmJGMhv94pkVq1LU2T8j47xMAzrgdaQDuKxbSqY
         Jn75BxZUapP3n0YQ6EeeYeQPyS49LX/HZdnakj0eSId0FAMdNhPmpu758AHwXnk299XI
         ddQHM/f8Rqk+/DcF3FpCOWU1J+1ysZBrboLPX7Hh3Pkv9SWwEAFfQi674CLSkBD8+xxJ
         uEEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792508039; x=1793112839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6eEx0sG1RnJ7BXSu4j6o+gX5Sfc9sLmpCWgg8b1O618=;
        b=S+dKMIw+B/O05Qa8SunrKZxPpSqZK39P2LVVybIIVe99+QKCPVPzPye65ICJQKAOOP
         iyhF49cU2OrIztxMWEkfO+OxFCeUKZtSkKFOQ/pkVAtr4Sh9O7Szw/nO+essfUU8xzTK
         PZ3k2reeXiRPY8Tl/IATtXURpYWwm47yIlmEMSmVeiO/8yfqWVkKAPBoBAtMOrTw6qah
         SPRgNgMTqZlKK1rSjUqRIcj7zqW2aBZr9htUw2pdYyJ+106mtvRbzeoaA0Ygd810UVQu
         XvADaKxyQc+MaBg1pwDqovMwucoixjqK6h6xwgQg65ndvheW8XF0+BHMX51Re8cOFhgL
         CePA==
X-Forwarded-Encrypted: i=1; AKwUvBx2DYt35Fv1EeKWBAoCksIv0p/0Co7ECA1mWqqHltCH77wMWPiFyj24UWfMHVTm9NuoybJgj31rfMwdPvs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIV1GllOc753w+IBYlTlvGUSvAFZoADQyLBBqsfT91Z36BBBpit
	Aj/hOQt2KyDFMTyIahJyMJ8F7C0eo3GiWWE8ua+kQr3K+T6JBhNuCJNM
X-Gm-Gg: AYBFou1g8/T1HHdf5sU7vx6sL0C4pz8z8vg6GnFNcYVqPVsryXT0oEYRHH5KBh00g09
	j0LkE7/FWE7WvFD/muPw6YGbCrxLr+Zc6mzxfHRBbll5CEeq1gF5JsXM8BujSyXM8FnYz7NiAvj
	xwgfUoFiAjVFdhwUZR1EJF5/ytPujvvEpbdezMo2Wcvq/00HOJUsNAyumhHWWM9gpXEmkVQUE+E
	Z8ZKmrLd9p8hA+FGnPhuhyCcjLppbe0gsgZh00YjKXdG1eW7V2tmAsTAdgw7tswDifjVtf+qTyd
	OeWuqQd9wDD/Vqeg3tzocxLj+uT/CDI6O4dzpN3kLYWH3zp7IOxVNW3dsVS87kCxeDXWtG4MDkI
	qWH9+Se3mItbfoQje6WoBZUir4y/TjsH+JNiOqo9RYyoyXnHv8RzHzcakrUzjNAUE2xTzgfNUl5
	wUpzy+9t5DDqOlq9WXE70eXb/mrOVxxvUEmIT+bya5Mg6fcpfm35jB/+2qZ8Xykbr1kiw=
X-Received: by 2002:a17:903:2304:b0:2e2:dfb8:818a with SMTP id d9443c01a7336-2e9a7059eedmr96198495ad.62.1792508039470;
        Tue, 20 Oct 2026 07:53:59 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b307c43sm343975ad.1.2026.10.20.07.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:53:58 -0700 (PDT)
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
Subject: [PATCH v2] ocfs2/cluster: freeze heartbeat configuration during device setup
Date: Tue, 20 Oct 2026 22:53:50 +0800
Message-Id: <pm-ocfs2-objects-candidate-0077-v7-34980443ec254b2a1ffc@gmail.com>
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

A heartbeat region's geometry must remain stable from device setup until
its thread stops and its buffers are unmapped. The configuration stores
check hr_bdev_file before changing blocks, block_bytes or start_block,
but separate configfs opens can run these callbacks concurrently with
device setup. The buffer mutex is per open and frag_sem is held for read.

A delayed blocks store can enlarge hr_blocks after the slot array has
been allocated. A block_bytes store can change the block size and shift
after hr_tmp_block and the slot pages have been sized, so the heartbeat
thread copies or clears beyond its buffers. A start_block store can
change the I/O location after it has been validated, including to zero.

Device setup also writes hr_node_num before acquiring the device guard.
A second dev writer can overwrite a starting region's node number and
return -EINVAL if the local node has been disabled. The heartbeat thread
then uses a different node number when releasing its node dependency.

Serialize all three configuration updates with device publication under
o2hb_live_lock. Validate the required geometry in that same critical
section, so a start_block update to zero during device open is rejected.
Keep the node number local until the writer wins the publication check,
then publish it with the device file. A rejected writer leaves the
region's node number unchanged.

Keep device open and failed-start cleanup outside the spinlock. Clear
the device under the same lock only after the thread has stopped and
the buffers have been unmapped, allowing configuration writes to resume.

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
Cc: stable@vger.kernel.org
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
Assisted-by: LLM
---
Changes in v2:
- Serialize block_bytes and start_block updates with device publication
  under o2hb_live_lock, and update block_bytes/block_bits together.
- Validate the required geometry in the publication critical section,
  including a start_block change to zero during device open.
- Keep node_num local until the writer wins the device guard, so rejected
  dev writes cannot change the active region; retain the blocks protection
  and failed-start cleanup ordering from v1.

Link to v1: https://lore.kernel.org/r/pm-ocfs2-objects-candidate-0077-v6-eb25e73523a3cb94fae0@gmail.com

 fs/ocfs2/cluster/heartbeat.c | 65 +++++++++++++++++++++++-------------
 1 file changed, 41 insertions(+), 24 deletions(-)

diff --git a/fs/ocfs2/cluster/heartbeat.c b/fs/ocfs2/cluster/heartbeat.c
index b45adc39aacc..63a538b66feb 100644
--- a/fs/ocfs2/cluster/heartbeat.c
+++ b/fs/ocfs2/cluster/heartbeat.c
@@ -1681,16 +1681,19 @@ static ssize_t o2hb_region_block_bytes_store(struct config_item *item,
 	unsigned long block_bytes;
 	unsigned int block_bits;
 
-	if (reg->hr_bdev_file)
-		return -EINVAL;
-
 	status = o2hb_read_block_input(reg, page, &block_bytes,
 				       &block_bits);
 	if (status)
 		return status;
 
+	spin_lock(&o2hb_live_lock);
+	if (reg->hr_bdev_file) {
+		spin_unlock(&o2hb_live_lock);
+		return -EINVAL;
+	}
 	reg->hr_block_bytes = (unsigned int)block_bytes;
 	reg->hr_block_bits = block_bits;
+	spin_unlock(&o2hb_live_lock);
 
 	return count;
 }
@@ -1710,14 +1713,17 @@ static ssize_t o2hb_region_start_block_store(struct config_item *item,
 	char *p = (char *)page;
 	ssize_t ret;
 
-	if (reg->hr_bdev_file)
-		return -EINVAL;
-
 	ret = kstrtoull(p, 0, &tmp);
 	if (ret)
 		return -EINVAL;
 
+	spin_lock(&o2hb_live_lock);
+	if (reg->hr_bdev_file) {
+		spin_unlock(&o2hb_live_lock);
+		return -EINVAL;
+	}
 	reg->hr_start_block = tmp;
+	spin_unlock(&o2hb_live_lock);
 
 	return count;
 }
@@ -1736,9 +1742,6 @@ static ssize_t o2hb_region_blocks_store(struct config_item *item,
 	char *p = (char *)page;
 	int ret;
 
-	if (reg->hr_bdev_file)
-		return -EINVAL;
-
 	ret = kstrtoul(p, 0, &tmp);
 	if (ret)
 		return ret;
@@ -1746,7 +1749,13 @@ static ssize_t o2hb_region_blocks_store(struct config_item *item,
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
@@ -1878,19 +1887,18 @@ static ssize_t o2hb_region_dev_store(struct config_item *item,
 {
 	struct o2hb_region *reg = to_o2hb_region(item);
 	struct task_struct *hb_task;
+	struct file *bdev_file;
 	long fd;
 	int sectsize;
 	char *p = (char *)page;
 	ssize_t ret = -EINVAL;
 	int live_threshold;
-
-	if (reg->hr_bdev_file)
-		return -EINVAL;
+	u8 node_num;
 
 	/* We can't heartbeat without having had our node number
 	 * configured yet. */
-	reg->hr_node_num = o2nm_this_node();
-	if (reg->hr_node_num == O2NM_MAX_NODES)
+	node_num = o2nm_this_node();
+	if (node_num == O2NM_MAX_NODES)
 		return -EINVAL;
 
 	ret = kstrtol(p, 0, &fd);
@@ -1904,20 +1912,27 @@ static ssize_t o2hb_region_dev_store(struct config_item *item,
 	if (fd_empty(f))
 		return -EINVAL;
 
-	if (reg->hr_blocks == 0 || reg->hr_start_block == 0 ||
-	    reg->hr_block_bytes == 0)
-		return -EINVAL;
-
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
+	/* Freeze the geometry and node number before starting setup. */
+	spin_lock(&o2hb_live_lock);
+	if (reg->hr_bdev_file || reg->hr_blocks == 0 ||
+	    reg->hr_start_block == 0 || reg->hr_block_bytes == 0) {
+		spin_unlock(&o2hb_live_lock);
+		fput(bdev_file);
+		return -EINVAL;
 	}
+	reg->hr_node_num = node_num;
+	reg->hr_bdev_file = bdev_file;
+	spin_unlock(&o2hb_live_lock);
 
 	sectsize = bdev_logical_block_size(reg_bdev(reg));
 	if (sectsize != reg->hr_block_bytes) {
@@ -2036,7 +2051,9 @@ out:
 		o2hb_unmap_slot_data(reg);
 
 		fput(reg->hr_bdev_file);
+		spin_lock(&o2hb_live_lock);
 		reg->hr_bdev_file = NULL;
+		spin_unlock(&o2hb_live_lock);
 	}
 	return ret;
 }
