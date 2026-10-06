Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7ABD260580
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 07:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791272328; cv=none; b=k0GLqCRJGibfEtiSbijF8yQlg/VIx86B736jP58MbukBT3OHqQmdgcnqBgTDWNAPnEo/atb+drHbQjqcR4odqEFaYEI6lr6b/nHds1GE5gxRQdpIa2bcJHYpMrpjM7UmfE7bKmkBzWeXeGQylC2COEcB4WjsCeDekPQ/LR3TJMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791272328; c=relaxed/simple;
	bh=hPmcaj3H3AEM8qZpP1+5wokb8tuw7g2fNniJ7lrgX1w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=sXfS6XAF8oC/YfYWZB6Hh2wmm6bPxF+j7w2Qswvym0MqGrD/p9ac4M0Tsy4uk8RPB3VPhvYkwxGGBhtWrRrRe2uFUxM3v1Hhb3BcpTib/L56x8FGVNFgDkoNjBcdpzwyQBW3yK8retSBLe6Pf/6skcTJnaR8EeoRG+oJ2GQz12k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b87YzJ6n; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b87YzJ6n"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc4dbcf2b85so1141078a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 00:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791272326; x=1791877126; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c0ZGsfSYK4KxoPW/IvXZVYvE65dGb1kq53ZNK4HaCQU=;
        b=b87YzJ6nQgmP5dYYnyx9gvJ0JxivnV7LEWGFTJkr4AK5q+SwpLedvEwMqPOnAXw7KF
         /iocuactrfAler3VqEAGglrlVC7/yQ26qhum4L3X0+Eb3pgD0j6EYFUAJk/tOk1qt5yT
         ttFEpZDvfvt/6WfSjOPSTJH8OXLY/yJ1siDyMZtTVb6bAkFiNYhsIt/o9m17nJZZyfc7
         fHYuXS/yzMRBgayvbCyGQNokOLFixqQHQSxcnIsw9XTMVY6zGrikTGDqYM+BYgnXITi5
         c8IL1EiMYzvmoe6rSeUYgRkB8V63cTBpNQd9s8l/6+8E71uD24w3+U8D9XVybL4joce+
         lSkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791272326; x=1791877126;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c0ZGsfSYK4KxoPW/IvXZVYvE65dGb1kq53ZNK4HaCQU=;
        b=SDbw8ZeEAnagQHhb9f8H7U8i4Pl7H78C1vOc1V2Q5Yzc9bMx5oXGecKNjxLR4YxlqE
         8fdLPQRAlqIgPDWktyX4l+Phzw2jt9+mxBywydOKKG3BQf+uPrbo6XW6h5RYeEPzXf/G
         jgO/u/Db1p5/1sDx2a6bu+SAJP9xSiZIFUqCQQFOIhqlJZDLaMaxkCPbpfIKR32I0OW8
         6jK9wXA360ypiOYexGjxH8o9QoloZKIwNcz/D0eg1eWuYIGVkqeXHN81L5x4mq+IGhT/
         5xqwousoGRqTvz+xwjypmP0zTO/6B/TXpqzA0vMzkmyhjEaV0ICUmnjqmta0sb2jDxhV
         U0+g==
X-Forwarded-Encrypted: i=1; AKwUvBzPRBoTJkPwaVLYvOw+MCp++d02cjkb8ckcR7PVt5WlR2oUKHJ6OzJiBMAovIvqbEFNYA4qhU5cLS4XZ0I=@vger.kernel.org
X-Gm-Message-State: AFuF++ktbwzyeKciQNg10yaBNFO9NoO7kBa6esAQ1h0HcAAt5JCohmon
	6lONZduqhLpj12g/vdJ8ybct7QDxIF+qjT3pBb4mc4P1RqMcnERAAZUo
X-Gm-Gg: AYBFou0PYgQlacgxcgiRibkGWJdGwj6PSppqHZ6Zu3efpPqcz4vdHYCDYBwq+sFYymA
	f96gfZvZYjcp5cAH5fKEEPpoS0gAHBBhTw/YXwObrHALDt3YElueY37oPiYv/Qtxs24cV7X6NPr
	pVjeF27RaYCB078tRYA54Idl7jHHrVBQHETDFXZyh2cr7VHE3FjcLu748OCucl418jLvS4iVDF2
	Yy4tYZv+0PI0GkG7aeF3rfwMaEpVsU+RtNMf14Kh1PFZeryruBjEPgPirB6prBFOKq/B77eIIbH
	4/m7nNtRD4q0e0lPTD2tye5L5Q29ITVQWu7ZIh3yXOjUGl6fS/6nYKg8bZHXkX+5zQOM/VDWuK0
	j7qtn0UUiohiM4ScIwigSvV5w5/nbYqHB8UF2iu3L8TVpjLENOI1mVOS19M5dH6aBBym21nDWx0
	nowiH78MsxNdLD01+mxjrEbuQYJ836MaYZs3aHZznpaInXqfiIgjf5qOp0pBcaJJ14N0Q5+oWrh
	re2
X-Received: by 2002:a05:6a21:3b8e:b0:3dd:a197:7369 with SMTP id adf61e73a8af0-3e124925909mr504138637.66.1791272325965;
        Tue, 06 Oct 2026 00:38:45 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce68214cd2sm2036284a12.0.2026.10.06.00.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 00:38:44 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH] Bluetooth: hci_core: Keep RCU protection through LTK filtering
Date: Tue,  6 Oct 2026 15:38:38 +0800
Message-Id: <pm-bluetooth-objects-candidate-0123-v5-83023fa5b4741c350341@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The LTK selected by hci_find_ltk() must remain allocated while its
value is checked against the blocked-key list. The finder releases RCU
before passing k->val to hci_is_blocked_key(). The helper's own RCU
section protects the blocked-key list, but the selected LTK may already
have been reclaimed before that section starts.

An LE ATT socket security request can reach smp_ltk_encrypt() without
holding hdev->lock. With a matching stored LTK and an LTK-type
blocked-key entry present, a concurrent MGMT_OP_LOAD_LONG_TERM_KEYS can
remove the selected LTK in the following order:

  Socket security                 Management / RCU reclamation
  hci_find_ltk()
    rcu_read_lock()
    select k
    rcu_read_unlock()
                                  load_long_term_keys()
                                    hci_dev_lock(hdev)
                                    hci_smp_ltks_clear(hdev)
                                      list_del_rcu(&k->list)
                                      kfree_rcu(k, rcu)
                                  grace period ends; k is freed
    hci_is_blocked_key(..., k->val)
      memcmp(b->val, val, ...)

The final comparison reads freed LTK bytes. Entering a new RCU section
in hci_is_blocked_key() cannot protect a pointer obtained before the
completed grace period.

Keep the finder's RCU read-side section active through the blocked-key
comparison and the warning that reads k->bdaddr. Release it before
returning on either matched-key path. This delays reclamation until the
finder has finished using the selected record, following the existing
IRK lookup pattern.

KFENCE report as below:

    ==================================================================
    BUG: KFENCE: use-after-free read in hci_is_blocked_key+0xdf/0x240
    
    Use-after-free read at 0x00000000b9ee38e4 (in kfence-#249):
     hci_is_blocked_key+0xdf/0x240
     blocked_key_wrapper+0xc5/0x140 [pmbd_ltk_probe]
     hci_find_ltk+0x1aa/0x3e0
     smp_ltk_encrypt.isra.0+0xad/0x340
     smp_conn_security+0x3b8/0x8c0
     l2cap_sock_setsockopt+0x1c4b/0x2270
     do_sock_setsockopt+0x1fb/0x430
     __sys_setsockopt+0x106/0x180
     __x64_sys_setsockopt+0xc2/0x160
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f
    
    kfence-#249: 0x00000000121f2ad9-0x000000005b5bfb3d, size=72, cache=kmalloc-96
    
    allocated by task 495 on cpu 0 at 36.722380s (2.603973s ago):
     hci_add_ltk+0x1f5/0x3a0
     load_long_term_keys+0x6d0/0x860
     hci_sock_sendmsg+0x128b/0x22e0
     __sys_sendto+0x425/0x470
     __x64_sys_sendto+0xe5/0x1c0
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f
    
    freed by task 533 on cpu 0 at 36.993097s (2.339769s ago):
     __rcu_free_sheaf_prepare+0x261/0x2a0
     rcu_free_sheaf+0x1f/0xe0
     rcu_core+0x661/0x1d10
     handle_softirqs+0x201/0x930
     __irq_exit_rcu+0x110/0x1e0
     irq_exit_rcu+0xe/0x20
     sysvec_apic_timer_interrupt+0x6c/0x80
     asm_sysvec_apic_timer_interrupt+0x1a/0x20
     srso_alias_return_thunk+0x0/0xfbef5
     __asan_memcpy+0x23/0x60
     create_monitor_ctrl_event+0x1a2/0x460
     mgmt_cmd_complete+0x2da/0x580
     load_long_term_keys+0x741/0x860
     hci_sock_sendmsg+0x128b/0x22e0
     __sys_sendto+0x425/0x470
     __x64_sys_sendto+0xe5/0x1c0
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f
    
    CPU: 1 UID: 0 PID: 495 Comm: python3 Tainted: G           O        7.2.0-rc6-pmb-bt-functional-v1+ #1 PREEMPT(lazy) 
    Tainted: [O]=OOT_MODULE
    Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
    ==================================================================

Fixes: 600a87490ff9 ("Bluetooth: Implementation of MGMT_OP_SET_BLOCKED_KEYS.")
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index 05d1ca25f4..90905dabf7 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -1153,16 +1153,16 @@ struct smp_ltk *hci_find_ltk(struct hci_dev *hdev, bdaddr_t *bdaddr,
 			continue;
 
 		if (smp_ltk_is_sc(k) || ltk_role(k->type) == role) {
-			rcu_read_unlock();
-
 			if (hci_is_blocked_key(hdev, HCI_BLOCKED_KEY_TYPE_LTK,
 					       k->val)) {
 				bt_dev_warn_ratelimited(hdev,
 							"LTK blocked for %pMR",
 							&k->bdaddr);
+				rcu_read_unlock();
 				return NULL;
 			}
 
+			rcu_read_unlock();
 			return k;
 		}
 	}
