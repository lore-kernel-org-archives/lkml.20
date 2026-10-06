Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2337120E023
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 14:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791297571; cv=none; b=guh1IeXW9hXlOZGLAnhUkenKPCd71ePOJR/j4v2xFBXVDoQKEDgqwjordiwEBWRrAXAPQgS9OIf8s8XWgcavh/OCnoxqEXsod58/rhVkuk4GvfaLxSpQ4jI2aeaWz+5XgDAncG/ISrGWUKmTJdWO/yDaYQoXtrEFDmGLu3k1+eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791297571; c=relaxed/simple;
	bh=Pu7WTY7MmpsD9mdLdmHkrZTnvI7mDXTk3KCmT90Q0So=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=XXjLZ4/3LHaKzi4Y/HiELglrP1vLEAVKk4JgFVjoPCnAbULrfe9GAbTtT/DEjk8xJ3+XTJ/NjmJROU0NjYR6d6/o0aaDdBdcl+Zb79w/ivOBXkRrhEp9jifcAYOgdPIQMmkcAbesVQXVPVbQUVBPJJBDog0TLhc9VoVVMPV4E3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hGz4w35y; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hGz4w35y"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-88b8f0a1bcdso508783b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 07:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791297569; x=1791902369; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rtubQD4LqITfIrFfA/P3yu9Ux/hrtk4QomOO1gzV0vA=;
        b=hGz4w35yN/1QAaVw0yNaHXEN6EC9k8fLTo7Dlsw8t3C6xfvbuxzLkC8Tq6WM58w1bS
         5HiQYjj2XkY0J15aKPD8BczlD9f8yG6INQk02ozFYdyTikBA7+EMzYCaiWEjnBsb/Cl5
         oH+jAo4URAg99mjuzXTyTl4yWGV39bPvjltJqctXkbiNLX+jlfZVhv4GlpyTOL/1EfF2
         v65dbzftnpd12iwmV9uU4g3Sl0dJfrQUXK7T0rCjbW383wvwW9UjAWPSnU4jggAyvcec
         +xFp7hAbKpPbjjUEKJmc1a1AQO5O389SNBPHPOpzdHm3BrOMUrhi8saFe5aonXvgPMCg
         x2fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791297569; x=1791902369;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rtubQD4LqITfIrFfA/P3yu9Ux/hrtk4QomOO1gzV0vA=;
        b=S9cjY5jpkBn4sVAcqIPxh3Slaz+/YnveFHDAUiLDYxvREbuOjMzL1iEdpqFStXC5pR
         VnnZSoLtVBR/1+NtrZao1TpD7MwE22+dGTa2tYiVxIfsKu9pcaVMuYpz9XIapUzvRoL/
         vOBILMY+SDNXx+tekY9O+OtYyYUiso5e87iouZwxlOXcucJb48Ij+eKpulSS7bg8H5iz
         EcQo3eK73sUvPJlgyOwQSYWdyfMg1UOHl5U3OIwPwwX7FJNb2d+MwC0hzDP8a2G8mLni
         WP5kVm9pMYxG5zGcbaZekvhMu67NxUmIftUDLSbzgH4rZpAAzSEK2sjw9RNZY866T8ch
         U3hQ==
X-Forwarded-Encrypted: i=1; AKwUvBwUMWD9hP4hfUJVArwrkp+ZvhAeB9GCt6nUTdfRg5Df5R/M2/KlaAOVo2fsEJgBh/ybPBJrefduHU65rqk=@vger.kernel.org
X-Gm-Message-State: AFuF++mBJ+1XJ3uB1vHovTPJN/tmKML9Y9/gtB04+AdBdqNqSr4JevVg
	tmigqEkwUnwx0pTiZwaFz2cH8xPQTq6Ir9qeWK46OdznH8dL14yMSCWD
X-Gm-Gg: AYBFou3sTfTz721ow3GwPrNrvmrs3ZNAR6ocqG77PIGgMZbPBt3oQZNtrh5UOxGfanB
	RtLeeN9dh1MopDwT2/xf0KvY4lGvYv+/jOsxHCBe3C8+hmJ1WXapb1TekltzztI3C+aWmNXGT79
	WmN3YZSxw6Xdm4vs8xRBe1kiwar5D8EPSxpLw+QPkJt/ggwIaKuGp53lZD+0jDYBAX4MdH2g8Ed
	Ov2pI4TwlVt3i6dYEFitxCQzEGHG/7JNmhr0Zyct6p74ujtzF0GG1SNhazKknqYQyK6dgFBspN3
	GoBDNDhtrUjRhMzZ+IF9ssDALqhMBKxUMazphooMHkD4b1diqmB/IQ1N3CxX8Bigrcc/5lw2iZl
	eUgitcYkB5OLTkHyZkJLNegFZ72o8ZzYd37YfDYmNnQ1quPey1JGMsgPwq31tFuDA8cY4QvCLDZ
	LPajN0JQFVBjGu+HpIBs9HxRzmTXOdkfJdd9d1fDpFjDm2AM9lBcPOdghnMAwQMCkfiA==
X-Received: by 2002:a05:6a00:3492:b0:880:d0d9:feb3 with SMTP id d2e1a72fcca58-890dfa92974mr1129681b3a.49.1791297569341;
        Tue, 06 Oct 2026 07:39:29 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88cb27d93bdsm3762902b3a.30.2026.10.06.07.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 07:39:28 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH] Bluetooth: hci_sync: Serialize devcoredump reset during device open
Date: Tue,  6 Oct 2026 22:39:21 +0800
Message-Id: <pm-bluetooth-objects-candidate-0250-v3-f85e5bae9c76348c88b7@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

An ACTIVE devcoredump's buffer cursors must remain valid from the
packet handler's state check through its copy. hci_devcd_rx() holds
hdev->lock across that interval, and hci_devcd_reset() requires the
same lock. However, hci_dev_open_sync() invokes reset without taking
it.

A registered VHCI controller can collect a dump through its debugfs
interface while the controller is down. If a successful open overlaps
with handling a nonempty dump packet, reset can run after the receiver's
ACTIVE check and before its copy:

  hci_devcd_rx()                    hci_dev_open_sync()
    dequeue nonempty skb
    hci_dev_lock(hdev)
    handler observes ACTIVE
                                     hdev->open(hdev) succeeds
                                     hci_devcd_reset(hdev)
                                       dump.tail = NULL
                                       dump.state = IDLE
    hci_devcd_copy()
      compare against old dump.end
      memcpy(NULL, ..., skb->len)
    hci_dev_unlock(hdev)

Reset leaves dump.end pointing at the old buffer and purges only queued
packets, so it cannot discard the skb already dequeued by the receiver.
The bounds check can pass with a NULL tail, leading to a nonempty copy
to address zero. KASAN reported a 24-byte NULL write in hci_devcd_rx().

Take hdev->lock around the open-time reset. The receiver then finishes
its state check and copy using valid cursors before reset, or observes
IDLE after reset and skips the copy.

KASAN report as below:

    BUG: KASAN: null-ptr-deref in hci_devcd_rx+0x5d5/0x1a80
    Write of size 24 at addr 0000000000000000 by task kworker/u17:0/496
    
        CPU: 0 UID: 0 PID: 496 Comm: kworker/u17:0 Not tainted 
    7.2.0-rc6-pmb-bt-functional-v1+ #1 PREEMPT(lazy) 
        Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps 
    fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
    Workqueue: hci0 hci_devcd_rx
    Call Trace:
     <TASK>
     dump_stack_lvl+0x93/0xd0
     kasan_report+0xe0/0x110
     ? hci_devcd_rx+0x5d5/0x1a80
     kasan_check_range+0x105/0x1b0
     __asan_memcpy+0x3c/0x60
     hci_devcd_rx+0x5d5/0x1a80
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __pfx_hci_devcd_rx+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? lock_release+0xc8/0x280
     ? srso_alias_return_thunk+0x5/0xfbef5
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
    ==================================================================
    Disabling lock debugging due to kernel taint

Fixes: 9695ef876fd1 ("Bluetooth: Add support for hci devcoredump")
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---

diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
index 1fe11d3ef1aaa8118811fb778b591e0413b4b3f0..8e4fc26b3c42d72a33393bd0b381414c4c0f927e 100644
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
@@ -5454,7 +5454,9 @@ int hci_dev_open_sync(struct hci_dev *hdev)
 		goto done;
 	}
 
+	hci_dev_lock(hdev);
 	hci_devcd_reset(hdev);
+	hci_dev_unlock(hdev);
 
 	set_bit(HCI_RUNNING, &hdev->flags);
 	hci_sock_dev_event(hdev, HCI_DEV_OPEN);
