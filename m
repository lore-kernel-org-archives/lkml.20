Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793279573;
	b=ao3zDYpqM8RGX+XkUKlL3Y8kEM3HqnCgKWgryakw7bqEF9sTGA/6skr4w5EP1MYgMLpc
	 DdOt14RzLADAssPhEp6TBDJ2q4/A4WFUnb0xlP6uiXjGdqHMaopl77CJe7YUwvLnl34cU
	 7ZBIMUI1HZfCS53xpQAp7Yf34fMRK0axm/sdnba+eXxWqFnKR04F2RIjiIomCN1PihCQl
	 Y+wgOiD/lcBmpMCeuiGKcNx75AHglb8YcvzDk77rxEz/VGzuweAvOKXrl3veHOcxZeOvR
	 L0DCxg2wI6AbyALicGRdZ0C0ctLmXkOPphAtoNyQStJXLjkSnIKz5RpaIf1vGDhW67g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793279573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=V7kcc14WM90q3MZ6RQe9PPMIj84vvOquKMkRnJrax0w=;
	b=XOrRujBQTu6DcMavomNHLj+hMD7aXK/bgGtzInkwC7DnAP99QADX0GUkElypnIQ5Za+M
	 IfSW5ldl/rlIlrAqsixWec5i1sVRmkYP9ysUto+XKMJeSUUJJo8YYAUqNfj8sdSVMKLoa
	 wJuIa7NplTImHLVsMAFkSZrATy3ffbRbLwUeifaADwIifT4myusVSBLla3UQBi0m0RgTj
	 OBk+rAzwluQyCYbZnNz4qk5ZTXvyuZN1DBw5zlKrRjEUrWakt4GoTpdgLtpKaR1Qkt7n5
	 5VN4WXf0LDR3pDachbUlQcNRDmB7ISSsOeOZ8huWujDnDPH4nbkjYhZ0qSqQA5NLFLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YELZurhc;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F02606A320
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:12:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09F02606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YELZurhc
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cd67cc518a6so1524414a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793279572; x=1793884372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V7kcc14WM90q3MZ6RQe9PPMIj84vvOquKMkRnJrax0w=;
        b=YELZurhcQkuGdxbo6RicOtOdVz6fulqbfEbEJIKthGOnU/0FGpgsTI78Z/NM21bt99
         nxbW+nP4c/u/CFtW0ga85t6r8+IkA7s/o9xZXJyrLeNQF/1ivs8imwq5YVl9dBOYR7BH
         ta4oTWb84hZ/U++tm6QidyKG3x3MewjCQg8BfQ7Qb6WvJrYSuD8M88TNCS+aMUM9Wqf3
         Hs0fj3wp11tlSHaQQ3gaLqvIrxGDFxr7HLyeKVpI9VPBSx+saSI4zA1HWzKH376eqaXv
         Iy+xGq3EludE2l9Ti2tk0QVwr6qaO5g8r61LuJ/x3sbWsXvZfQ3fye99tuu0MqAdgmIN
         DgaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793279572; x=1793884372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V7kcc14WM90q3MZ6RQe9PPMIj84vvOquKMkRnJrax0w=;
        b=ebu3uTOzYcuWz74EBFQV1Y96hsdX4fEm2gyKZ/2Lf03pR+sKaFNz1H5bIRgdEf26of
         oaJEK7hZyGe3EOVF2yi8jTRdEi1/OI2Hq5SIcDUH38Hx5YgNwaNjDoo0hm/+1j+Wu3wv
         jIMClFiexd/nt5ZmmYBg58fxBE35zkprldk4WaKckzIB4B67Rhl87Z0zrCSfWZ1pLytJ
         bVTd1L/vIJ7jRg1a5a07fKPz00Urh1uZjJKScDSS0wochUEORjL/RJB792lqGUYnKdSs
         +Jj+J/bf7o7obr5EH32v8mCofM1/PG0b9E3Cy01wge3UCPSn7M1FGHyTKU2KSUunmnza
         C32g==
X-Forwarded-Encrypted: i=1; AKwUvBxw3CYjBt1if4jLBlsUWDBUBuGIxkEcmeMEp3a6OqDQv+i0/ga4o0kCR8luyrHYRHuO3ilmj17TAYkPEPM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRvkBFl+8pRNE6WmAAimxlZBVrFu6Qt58ilRXBye1SJ4AoowGs
	XArptcybZI+xyaiHsqbbd+nUYdPdzm9moqwAt78eC4INwEHm/T8YlH9o
X-Gm-Gg: AYBFou39yHE/y5rTV0vrfcDX8zpGbw11ErbhR1aWTzXbzP6xUbhwnFWCCD0Z7XA3O9w
	TSjj1ZFB92iqiyE84lGZY5BKYlQ/UosiU70lZxvQ/tqBZJWzrS6kHvBkV0rhjS7YL6NroAWmgtC
	RylzUYJRxVdCUrS1HcHYxbK4r5TtORkKOB1VwCJncuVsa+JOD/JvfMIwSGmXq7jyGtJc5gf5LDm
	yp7RgINcHjLkkaTyVjNISvFYDxO1h7w307D+1F0Rjv6gj+yXW3KRKZFkFOnCTfVYvoC9WE6ZNJr
	EeCINdgvbk5jih2kM4IQf9ah3PAYM1Heb8qYu/QSub0wAmIV4iNIXwMKLaKOBi7oBpbUSclMlr3
	Dm7qZNq+EypU6f3zvhkhdd8yw2XQ9bmRBGJB8k9p07ESpobjXmRkf4b2rqur9wzYmflFBu5T/NL
	/DTbWdrd0Ej78n+L335OLOOjtPm3SOg+jXyZY7qvICvllGMH5eBi9K/cQW/xlfUYK70eQ/J1wsO
	LhdxU3nz/B8SC0WUWE7dMpHgQbjCckTDLOzHVS8HkQ0CoEi5hd4DNn5oMIfGNhVJ/ciHIjnOQhC
	bUI2Gcr2X1f23i/dT3BMxYaM1DLHOckS8lC79+LCPAcrbA==
X-Received: by 2002:a17:90b:3f8c:b0:3a8:9b79:e6ea with SMTP id 98e67ed59e1d1-3ae5835d8a6mr4407659a91.59.1793279572382;
        Thu, 29 Oct 2026 06:12:52 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae55d555d4sm4090445a91.1.2026.10.29.06.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:12:52 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH 4/4] Bluetooth: hci_sync: Copy the resolving-list IRK under RCU
Date: Thu, 29 Oct 2026 21:12:29 +0800
Message-Id: <pm-bluetooth-objects-candidate-0122-v8-952ad9eb0ef59367ba6a-4@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pm-bluetooth-objects-candidate-0122-v8-952ad9eb0ef59367ba6a-0@gmail.com>
References: <pm-bluetooth-objects-candidate-0122-v8-952ad9eb0ef59367ba6a-0@gmail.com>
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

hci_le_add_resolve_list_sync() copies the peer IRK into the LE Add
Device To Resolving List command after hci_find_irk_by_addr() has
returned. The finder ends its RCU read-side section before returning
the borrowed entry, and neither the request worker nor
interleave_scan_work() holds hdev->lock here. The resolving-list
membership check between the lookup and the copy takes hdev->lock and
may sleep on it, which widens the window.

When LL privacy programs a peer with address resolution enabled,
MGMT_OP_LOAD_IRKS can free its IRK before the copy:

  Request worker                   Management / RCU reclamation
  hci_le_add_resolve_list_sync()
    irk = hci_find_irk_by_addr()
                                   load_irks()
                                     hci_dev_lock(hdev)
                                     hci_smp_irks_clear(hdev)
                                       list_del_rcu(), kfree_rcu()
                                     hci_dev_unlock(hdev)
                                   grace period ends, irk is freed
    resolving-list membership check
    memcpy(cp.peer_irk, irk->val, 16)

Copy the IRK value in an RCU read-side section right after the lookup,
as hci_le_set_privacy_mode_sync() does for the identity address. The
section ends before hdev->lock is taken and before the synchronous HCI
command is sent.

KASAN reported this on a test kernel with scheduling hooks, whose
frames appear in the trace. The report predates the hdev->lock taken
by the membership check.

KASAN report as below:

    ==================================================================
    BUG: KASAN: slab-use-after-free in hci_le_add_resolve_list_sync+0x8d9/0x910
    Read of size 16 at addr ffff88810d21452d by task kworker/u17:0/504

    CPU: 2 UID: 0 PID: 504 Comm: kworker/u17:0 Not tainted 7.2.0-rc6-pmb-bt-functional-v1+ #2 PREEMPT(lazy)
    Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
    Workqueue: hci0 interleave_scan_work
    Call Trace:
     <TASK>
     dump_stack_lvl+0x93/0xd0
     print_report+0xce/0x630
     ? hci_le_add_resolve_list_sync+0x8d9/0x910
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __virt_addr_valid+0x20d/0x410
     ? hci_le_add_resolve_list_sync+0x8d9/0x910
     kasan_report+0xe0/0x110
     ? hci_le_add_resolve_list_sync+0x8d9/0x910
     hci_le_add_resolve_list_sync+0x8d9/0x910
     ? __pfx_hci_le_add_resolve_list_sync+0x10/0x10
     ? pmbd_probe_hit_cookie+0xe7/0x1c0
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? pmbd_probe_hit_cookie+0xee/0x1c0
     ? __pfx_pmbd_probe_hit_cookie+0x10/0x10
     hci_le_add_accept_list_sync+0x18e/0x820
     ? conn_params_copy+0x36e/0x650
     ? __pfx_hci_le_add_accept_list_sync+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? conn_params_copy+0x3a0/0x650
     hci_passive_scan_sync+0x95f/0x1f10
     ? __pfx_hci_passive_scan_sync+0x10/0x10
     ? debug_object_deactivate+0x2f8/0x3c0
     ? pwq_dec_nr_in_flight+0x880/0xdf0
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? lock_acquire+0x17b/0x2f0
     ? process_one_work+0x895/0x19c0
     interleave_scan_work+0x11b/0x470
     process_one_work+0x908/0x19c0
     ? __pfx_process_one_work+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? lock_is_held_type+0x8f/0x100
     ? srso_alias_return_thunk+0x5/0xfbef5
     worker_thread+0x65c/0xe40
     ? __pfx_worker_thread+0x10/0x10
     kthread+0x34f/0x460
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __pfx_kthread+0x10/0x10
     ret_from_fork+0x659/0x940
     ? __pfx_ret_from_fork+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __switch_to+0x74f/0xf80
     ? __pfx_kthread+0x10/0x10
     ret_from_fork_asm+0x1a/0x30
     </TASK>

    Allocated by task 535:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     __kasan_kmalloc+0xaa/0xb0
     __kmalloc_cache_noprof+0x251/0x610
     hci_add_irk+0xb6/0x220
     load_irks+0x5f9/0x840
     hci_sock_sendmsg+0x128b/0x22e0
     __sys_sendto+0x425/0x470
     __x64_sys_sendto+0xe5/0x1c0
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f

    Freed by task 0:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     kasan_save_free_info+0x3b/0x60
     __kasan_slab_free+0x5f/0x80
     __rcu_free_sheaf_prepare+0x65/0x2a0
     rcu_free_sheaf+0x1f/0xe0
     rcu_core+0x661/0x1d10
     handle_softirqs+0x201/0x930
     __irq_exit_rcu+0x110/0x1e0
     irq_exit_rcu+0xe/0x20
     sysvec_apic_timer_interrupt+0x6c/0x80
     asm_sysvec_apic_timer_interrupt+0x1a/0x20

    The buggy address belongs to the object at ffff88810d214500
     which belongs to the cache kmalloc-64 of size 64
    The buggy address is located 45 bytes inside of
     freed 64-byte region [ffff88810d214500, ffff88810d214540)

    The buggy address belongs to the physical page:
    page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x10d214
    flags: 0x200000000000000(node=0|zone=2)
    page_type: f5(slab)
    raw: 0200000000000000 ffff8881000428c0 dead000000000100 dead000000000122
    raw: 0000000000000000 0000000000200020 00000000f5000000 0000000000000000
    page dumped because: kasan: bad access detected

    Memory state around the buggy address:
     ffff88810d214400: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
     ffff88810d214480: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
    >ffff88810d214500: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
                                      ^
     ffff88810d214580: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
     ffff88810d214600: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
    ==================================================================

Fixes: e8907f76544f ("Bluetooth: hci_sync: Make use of hci_cmd_sync_queue set 3")
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 net/bluetooth/hci_sync.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
index 9d71ce96bd8ec..9d829c20c3160 100644
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
@@ -2533,9 +2533,17 @@ static int hci_le_add_resolve_list_sync(struct hci_dev *hdev,
 	} else if (!(params->flags & HCI_CONN_FLAG_ADDRESS_RESOLUTION))
 		return 0;
 
+	rcu_read_lock();
+
 	irk = hci_find_irk_by_addr(hdev, &params->addr, params->addr_type);
-	if (!irk)
+	if (!irk) {
+		rcu_read_unlock();
 		return 0;
+	}
+
+	memcpy(cp.peer_irk, irk->val, 16);
+
+	rcu_read_unlock();
 
 	/* Check if the IK has _not_ been programmed yet. */
 	hci_dev_lock(hdev);
@@ -2547,7 +2555,6 @@ static int hci_le_add_resolve_list_sync(struct hci_dev *hdev,
 
 	cp.bdaddr_type = params->addr_type;
 	bacpy(&cp.bdaddr, &params->addr);
-	memcpy(cp.peer_irk, irk->val, 16);
 
 	/* Default privacy mode is always Network */
 	params->privacy_mode = HCI_NETWORK_PRIVACY;
