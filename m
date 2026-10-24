Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792858534;
	b=UwFsiVbnMotUQ9s7gq4YCSuaQA3Y+jm1Y0KC5I7mxwnvLSO1Exqxa4MRwXCbWCoSIO1n
	 BrwD+d1Z7CP2cQVmdBJ6AMgqEsxBybKqcfIPKz39Nc1jEPrIiSW0m+iaxuU1qQDxv2Phx
	 EE/7eQ2MctJa1D5dR+c1u8bHYY1JIQ9PHWNuWAnUZ50nmvs0f4J9zHYAfYZr18pe+gYtp
	 pVOpgp/mD2voOdWyI0vIOW4t7Do4cpXFdZko2+DMk/VBatrtZJSx5m59pE06wIr+mk1ry
	 fL23ydpAls1yrpRaO7UI4ckKFhLn/CYUJzhxQd8Rt5D6yIx6SUQLjLxifD5+Ixm68OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792858534;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=AxJv77P2A8G7sVV4M6imNepGwnrQ0bbEBbJ2Pw7OGQY=;
	b=T/mU8Ff/fly5qZecEjoAHMpRPwMklT5NVCpJg3tNVYYjdyMtC/WQGn2ea6ZJFxPLoPRJ
	 JL5vjH/8L3RwSdZU7J+UVJJWKH0jQy8FNpoDGrQ2iMPzuOOapLy8ojnhxMfO+/PnbUlNn
	 A/41BmQr94n43vQLT4c44a+IpCa2eehrFAXiyVGP780pGZHmFziyuT/5a7ZtryhOg3G/g
	 yPlcCgWOAAtmG0dUSXoDGbJnkDxB65PXRF7cedi2R1dOEWiQgL+6r6lD1VkmauJC9FOdV
	 PJ9WyxSwMkqYgVSaWLXkzv3HkoreTRFmLosTg0SHOns1d069xPGqYGmcvW9p6k0rLfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bWoFn1ly;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF935606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 16:15:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF935606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bWoFn1ly
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-398b3c37877so1024921a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 09:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792858533; x=1793463333; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AxJv77P2A8G7sVV4M6imNepGwnrQ0bbEBbJ2Pw7OGQY=;
        b=bWoFn1lys67WG4H5KaF6UAjNDZyuBx7EBZcOUdw/a9xoO/iVCHUzCdJfkpeDboAk/g
         zFzrTnXhMku+LYtnjo5Byh63yZwOskzJvztBqnXPu8RNgR+BcHZpjUmki9n3GQQJIUm9
         FSR3zCRJfcdsJJulq5js01a3juY3m/Cd+sVUrGmdKIhftNjj6ENYkqnhUE+sqdxLYJpC
         iW05ft0g5j0UGL1D+TqJ+4S590WuIRzDh2kbz6u0LoOTpRyFDIGLVLrnpebYW8Qgt/SF
         a3ZauPhCjg2trngHjoDQ5/cE1xZFT0wZMhk5ix7HJFZNbKyABgtnD0yG4Rpp87P9DZi4
         TjEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792858533; x=1793463333;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AxJv77P2A8G7sVV4M6imNepGwnrQ0bbEBbJ2Pw7OGQY=;
        b=zV2vwnJhCv+ZVuhAhHyBPPz5qvy32WisTHZwqBHdW1gtmCIOFXBRllFzHAAHwje76G
         7+NeEV6AgujtxiD5kqEWA/ROYLDhwTJgmSFYyHWZvI+IrSkwSpMr/24JRECaW/Lyjh7A
         uoBMgjzCfBBfx/SG5lznP/F51QYXrFrDljCImIc/9gjlhWV5oTN0U1kRx1hpyp9Ls8fV
         4iJQc2rPVnYeTi9RI75Fr3BhZX4Oy65q74J+55YDBLL2PoLrF43fiMB2+IbTF70PHzV6
         AidDpS8kI+VpWDCZp2SV6Sy2/h4sQMFjUuRTBH0Jq7SYcBx3HTyl0o7muT3Jkm+z6Q+P
         tzFg==
X-Forwarded-Encrypted: i=1; AKwUvBxcOlIBhYvWl33/jg+p1+T7IZu47FbXe+if4Jjk47KiWJdddIoee9StcwjVtT5prhy3DFf99hfUBm8I/qE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHnVC2YadIHHsK8L+BGbUgWxaVaNxX8udxstVy/kq+RIVGaXzo
	RQ1jT1RzXm8zSymRNZB0O1ngx+FBKDoEMo6wPpAM5mv4wkGM/lEK4FHs
X-Gm-Gg: AYBFou3oBwm8v1Vl9dnZ3xprdbAMgEFKzkToDOdA+J8h2RNJSUGFgrCPw+facDlEXKP
	u4jSR//Yn8UMMeRE6WUA2pYcoG0Q3Pv6eHuJRe9ANJ/XrOPBbdiA1VnNozX5ej7xuUxPDTQtMAS
	aHFfSDuXDpPPkCKER3uZ66RYudV7vKuU4otYSv5p3V0dEk6wfl77p/g4Aeogjqsqj3tSMsjMZtX
	hmU+WTsOdL1mtXnbLODrhdCSl7tY8f4NrstaKrQflLf22DjpCZhruiM852Of7ojtlR0OYG7GB3A
	nExJAe9wK7YJCyOjsG7U9vJ2aVaJ0H7w4F+Iv3gefC3gxPoa2+/GQIty4bmS4ruXeAYk6bFP1xN
	T5wSFiFlMEi/kq/RQw99ZgJvapLb9xAnLSBiGHdSBRndsxGGeC4kxSgi/uk2kIIKl/X3RMzn2IV
	sqNPX5NbPPEybMX6p0GLVDxhY1Dt85+AjbaAze7mHOJhtZicTmw5tXOYKj/KhUBQ3LjdrdhSlU6
	fsCRDIT2Z8x2tdmtNEnluqD/o5HLjQreNea9/KrrQPb/scpP+o=
X-Received: by 2002:a17:90b:5823:b0:3ac:8897:7b98 with SMTP id 98e67ed59e1d1-3adeae7644emr2310820a91.32.1792858533010;
        Sat, 24 Oct 2026 09:15:33 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adeb82761esm1972001a91.0.2026.10.24.09.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 09:15:32 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH] Bluetooth: vhci: Flush suspend work after removing debugfs
Date: Sun, 25 Oct 2026 00:15:17 +0800
Message-Id: <pm-bluetooth-objects-candidate-0146-v7-4a901c7fb65111f006fe@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The VHCI controller must remain alive until suspend_work finishes.
vhci_release() flushes the work before removing the force_suspend
debugfs entry, so an active writer can queue work after that flush.

A force_suspend write changing the suspend state can overlap the last
close of /dev/vhci as follows:

    /dev/vhci close          Debugfs writer        Suspend worker
    ---------------          --------------        --------------
    vhci_release()           force_suspend_write()
      flush_work() returns     [not queued yet]
                               schedule_work() -->
                                                   hci_suspend_dev()
                                                     check powered
                                                     check !HCI_UNREGISTER
                                                     hci_suspend_sync()
                                                     unlock(req_lock)
      vhci_debugfs_remove()
        wait for writer
      hci_unregister_dev()
      hci_free_dev()
        drop last reference
        free hdev
                                                   hci_clear_wake_reason()
                                                     lock freed mutex
                                                     use-after-free

The controller locks serialize state access but do not retain the
allocation. Unregister drains HCI-owned work, but does not cover VHCI's
suspend_work on the system workqueue.

Flush suspend_work again after removing the debugfs entries and before
unregistering the controller. Removal waits for active writers and
prevents new callbacks, so the second flush drains all remaining work
while the controller and driver data are still alive. Retain the initial
flush to preserve the existing teardown order.

Runtime testing of this change was not performed.

KASAN report as below:

    ==================================================================
    BUG: KASAN: use-after-free in __mutex_lock+0x1e68/0x2590
    Read of size 8 at addr ffff8881011b80b0 by task kworker/0:0/9

    Workqueue: events vhci_suspend_work
    Call Trace:
     <TASK>
     dump_stack_lvl+0x93/0xd0
     print_report+0xce/0x630
     ? __mutex_lock+0x1e68/0x2590
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __virt_addr_valid+0x20d/0x410
     ? __mutex_lock+0x1e68/0x2590
     kasan_report+0xe0/0x110
     ? __mutex_lock+0x1e68/0x2590
     __mutex_lock+0x1e68/0x2590
     ? hci_suspend_dev+0x1ff/0x650
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? mark_held_locks+0x40/0x70
     ? _raw_spin_unlock_irqrestore+0x44/0x60
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? lockdep_hardirqs_on_prepare+0xea/0x1a0
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __pfx___mutex_lock+0x10/0x10
     ? _raw_spin_unlock_irqrestore+0x44/0x60
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? pmbd_gate_site_armed+0x31/0x1c0
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __pfx_pmbd_probe_hit_cookie+0x10/0x10
     ? hci_suspend_dev+0x1ff/0x650
     hci_suspend_dev+0x1ff/0x650
     vhci_suspend_work+0xa5/0x190
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

    The buggy address belongs to the physical page:
        page: refcount:0 mapcount:0 mapping:0000000000000000
    index:0xffff8881011b9040 pfn:0x1011b8
    flags: 0x200000000000000(node=0|zone=2)
        raw: 0200000000000000 ffffea0004073308 ffff88818863f180
    0000000000000000
        raw: ffff8881011b9040 0000000000000000 00000000ffffffff
    0000000000000000
    page dumped because: kasan: bad access detected

    Memory state around the buggy address:
     ffff8881011b7f80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
     ffff8881011b8000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
    >ffff8881011b8080: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
                                         ^
     ffff8881011b8100: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
     ffff8881011b8180: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
    ==================================================================

Fixes: d16e6d19ccc6 ("Bluetooth: hci_vhci: Fix calling hci_{suspend,resume}_dev")
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
diff --git a/drivers/bluetooth/hci_vhci.c b/drivers/bluetooth/hci_vhci.c
index 8f7db0102b25f..bedba3c140ac2 100644
--- a/drivers/bluetooth/hci_vhci.c
+++ b/drivers/bluetooth/hci_vhci.c
@@ -701,6 +701,8 @@ static int vhci_release(struct inode *inode, struct file *file)
 	if (hdev) {
 		if (!IS_ERR_OR_NULL(hdev->debugfs))
 			vhci_debugfs_remove(hdev);
+		/* Drain work queued by the last force_suspend writers. */
+		flush_work(&data->suspend_work);
 		hci_unregister_dev(hdev);
 		hci_free_dev(hdev);
 	}
