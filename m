Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793417245;
	b=AfjlX3Uj7wcj5V0Mte3Xr2Uk2YpxnhIaw6q8hg5BUXLhZI1Xq4qdo2XWCoDysbSQPee3
	 SgJA3URzyy3JwaFh6qEQ4v8hbbKP/jV8cppsTJBvgqWBYIIM1BrlCenGMUxi4zC2bcM//
	 vykulvLkSHy2jV3adjKc6XbWNdxmUJxZJxaBG4KAaNHlZ2m62jdpNZ8NA9VK5g77Z3Cj3
	 3KRU1HxRFWsy/+2YWubGLnnlOEOz02sbZYVmzVwdBtViOQJh0ZsZWEHz9c8NLB7uZISOT
	 nRzP+Di8Pn4k+kpBQ2tJ3sUQLMMIl4rNJT4nAq1bmxMyrF3bUUsjLP9fk3wPHGJMmHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793417245;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SfJSeQMEyrSl8TrWVW2x1shy/UkqWuiEJl8Abe5S1GI=;
	b=vBv5pbs3kFRmua2pZbTAGIbiQYF33XoOclEoKNVsK0fId06joZ9Ij5dETGWEKIng5vUg
	 YtbSxC4qSwjElCp7YVdkm6p2jB0WvOvpK0H/I1O9MMj4l6rXKVBF7ZeWVq7Q9C48aPw1P
	 yW9gvv+lzSOcbD39+gTYCJEEqAKw2qDCltGm8HfEifvhJjWOMYIztNn93siIcoMuJnb+d
	 AazU0EZWTOVWW0lrTVmxuo/5WdS/Yp3iYLkmQwEM51DZDqSdXCnF6Y2gBhYC4IjQJPvNM
	 NMwp6TFcJaESSN02r/+UGsOyDrf2pA6i2AT4bOInm7yjDmnyyTBsG2c3fvKlICTopjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="bEYv/Ip4";
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AB9606A333
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 03:27:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55AB9606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bEYv/Ip4
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e9f6a16aedso9142865ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793417244; x=1794022044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SfJSeQMEyrSl8TrWVW2x1shy/UkqWuiEJl8Abe5S1GI=;
        b=bEYv/Ip40KUVMLsF7IcgAs7bwRnQN7pRgyWaJJWk9sIwDp+8nokap62iaea9sE7Zp4
         +OUZa+0PV02SO8iAzPYvSKc3zRivVQsLDXSuoL2hrEtH2RZyRDS6rFHF9mtcu0dPDRJG
         tso/HFcIwm+ja0NI9nyGhRB5KM59qC/UUYaaB3wKJDAB+7hQFtc+i73+d9jZRA7NBC8i
         xeRvQDT/uh7NJ0njgW67cKP4evssQhYq2wdH53HiUcXf5KE6Ok0SVK+FejJr23t5BXeM
         zJBpEvHZvnLhMGGDbPplmoLvkQaB/vJnSacjGrYvnFKvNtkhmqdXaFEjc67FX/y0ncyt
         CFYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793417244; x=1794022044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SfJSeQMEyrSl8TrWVW2x1shy/UkqWuiEJl8Abe5S1GI=;
        b=m5U2bbutfhLLinhmjEh1Jytvthx22yt18N22G09VUUYEV5DGKlBIJqdsh8En5OHSQJ
         wkHKqvyt+nNk6gWB9ieYz4Mm90+6GiLbO5CWEaxU9qSeFHsgWAmy/h1DU/4vb8zRtzS+
         MLjr06FBCviPRpCxFx21zYi25HDrQqY3Ue5H6PInjhQiCNJ54T1g+/510mGbmkB3JKRa
         N9tT8boQDCnYHb5qHaQKCS9vnrs1WLjUyc5FhbfDrlB+zU0mpA6ZVYSknKgi542pfeYi
         uw14q0oOzJW/LdM7UAAEkyfeNqz220i3HIgns/mHqklLugMhYB3Q79E+vpqz50XvA4H2
         z8Kw==
X-Forwarded-Encrypted: i=1; AKwUvBzWbDt9vEhXRppsQ/x+3ajzvD//JpOd+aNO1JuisecAnx70avQ+fcmUq1/Kea3vXsFlkdbvr4xQaBsqb00=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6AklQaWv6zDov1YAeLfDoCWy/Z3WjzoG0cr+irkFhxI+3QWSA
	s/BJH8WsFAUjl4E80SPIT08S2aMn2778oon1IMACvzA0d9b7V8VqOrEEM+UqNt1zJ/ruBQ==
X-Gm-Gg: AYBFou3QOZLbsfxZFwQ4ovbyAyZuzvaKui5PSW+iyVnRxSsPjQKFjglHx94ZQt1aGBx
	20Qe2fWhEW+PYmGmV0Rj5uAXpNS+leSIVywm9Jh4ZLOWt/XWOHxM6J4u4AA2d4LEXKa0uM8yZDe
	mQWvZPk3b3oWblXGRgEBgbvty2YXgAYs222sFWfke4QPnhy+v6aMb8CTRbPXkxYmxJ6bhWj5s9K
	EGvodN0NyuWe1jGbCTcJFB9rNf2dBgdBKkdfMyYNkBA/ZYaKKbTgMx110b7qEFZdnL+zKS6y0fQ
	2T0GX11pDTDJA8D0nFb8Go86FylCa710H0SxirlwNtK77WZrOz28DT4uAyDtyKafWc5bz5rvb0d
	8/dxcd89n/hitARGUzPXYBUvWqa91NgRw7EoZ+sn4boe9KtLRouFEwBY0+BU/Zl5rhy1Ky6iFWO
	+uqLZxA2mOnkMkPxaULoX897yMtdmJq0PLCr59PvF59GNfy5HteiLJKJM/UhiHeU2vp2Wy8eJYc
	gE8ceiUrMWNB35F2gHUsx00HHKkSoT7RHOWMDvYiswZPBUADOxMFmiT2mghYnWd5Vym//adX8J5
	ueED2a7RszOeK1P6R2NAZoQzbcpP512jgdjdMKoDjgSMGw==
X-Received: by 2002:a17:903:2b0e:b0:2dd:c100:4257 with SMTP id d9443c01a7336-2eb3648a4cfmr41460845ad.59.1793417243596;
        Fri, 30 Oct 2026 20:27:23 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39231422sm13203495ad.23.2026.10.30.20.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 20:27:22 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v2 1/2] Bluetooth: SMP: Serialize forced BR/EDR channel changes
Date: Sat, 31 Oct 2026 11:27:13 +0800
Message-Id: <pm-bluetooth-objects-candidate-0184-v8-60106ad0c49170f5bfb4-1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pm-bluetooth-objects-candidate-0184-v8-60106ad0c49170f5bfb4-0@gmail.com>
References: <pm-bluetooth-objects-candidate-0184-v8-60106ad0c49170f5bfb4-0@gmail.com>
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

The force_bredr_smp debugfs switch creates and removes the BR/EDR SMP
root channel in hdev->smp_bredr_data without holding hdev->lock. The
other users of that channel hold the lock: l2cap_connect_cfm() looks up
fixed channels during HCI event processing, and hci_dev_close_sync()
removes the root through smp_unregister().

Enabling the switch can let a connection confirmation use a root that
is not fully initialized. smp_add_cid() publishes the channel through
l2cap_chan_create() and sets BT_LISTEN before it assigns the channel
operations and the parent lock nesting level:

  Debugfs writer                  HCI receive worker
  smp_add_cid()
    l2cap_chan_create()
    l2cap_add_scid()
    chan->state = BT_LISTEN
                                  hci_dev_lock(hdev)
                                  l2cap_connect_cfm()
                                    l2cap_global_fixed_chan()
                                    l2cap_chan_lock(root)
                                    l2cap_new_connection()
                                      root->ops->new_connection()
    chan->ops = &smp_root_chan_ops

Disabling the switch can race with power-off, which releases the same
channel:

  Debugfs writer                  Power-off
  smp_force_bredr(hdev, false)
    chan = hdev->smp_bredr_data
                                  hci_dev_lock(hdev)
                                  smp_unregister(hdev)
                                    smp_del_chan(chan), chan is freed
                                  hci_dev_unlock(hdev)
    smp_del_chan(chan)
      reads chan->data after the free

Hold hdev->lock around smp_force_bredr() in the debugfs writer and
annotate that requirement. smp_unregister() leaves HCI_FORCE_BREDR_SMP
set, so after power-off the slot is empty while the switch still reads
as enabled. Disabling it then passes NULL to smp_del_chan() even without
a race; skip the deletion in that case and only clear the flag.

Both reports below come from test kernels with scheduling hooks that
widen these windows. In the enable case lockdep also reported recursive
locking just before the oops, because the root still had the default
nesting level.

Oops report as below:

    Oops: general protection fault, probably for non-canonical address
    0xdffffc0000000001: 0000 [#1] SMP KASAN NOPTI
    KASAN: null-ptr-deref in range [0x0000000000000008-0x000000000000000f]
    Workqueue: hci1 hci_rx_work
    RIP: 0010:l2cap_new_connection+0x16c/0x320
    Call Trace:
     <TASK>
     l2cap_connect_cfm+0x46c/0xe60
     hci_remote_ext_features_evt+0x67d/0xbd0
     hci_event_packet+0x894/0xc70
     hci_rx_work+0x367/0xf00
     process_one_work+0x908/0x19c0
     worker_thread+0x65c/0xe40
     kthread+0x34f/0x460
     ret_from_fork+0x659/0x940
     ret_from_fork_asm+0x1a/0x30
     </TASK>

KASAN report as below:

    ==================================================================
    BUG: KASAN: slab-use-after-free in smp_del_chan+0xd2/0xe0
    Read of size 8 at addr ffff888112a2e4a0 by task sh/493

    Call Trace:
     <TASK>
     dump_stack_lvl+0x93/0xd0
     print_report+0xce/0x630
     kasan_report+0xe0/0x110
     smp_del_chan+0xd2/0xe0
     smp_force_bredr+0xda/0x200
     force_bredr_smp_write+0xc9/0x130
     full_proxy_write+0x11f/0x180
     vfs_write+0x25a/0x1010
     ksys_write+0x111/0x200
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f
     </TASK>

    Allocated by task 493:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     __kasan_kmalloc+0xaa/0xb0
     __kmalloc_cache_noprof+0x251/0x610
     l2cap_chan_create+0x47/0x930
     smp_add_cid+0x309/0x4f0
     smp_force_bredr+0x17d/0x200
     force_bredr_smp_write+0xc9/0x130
     full_proxy_write+0x11f/0x180
     vfs_write+0x25a/0x1010
     ksys_write+0x111/0x200
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f

    Freed by task 496:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     kasan_save_free_info+0x3b/0x60
     __kasan_slab_free+0x5f/0x80
     kfree+0x307/0x580
     l2cap_chan_put+0x273/0x3a0
     smp_unregister+0x59/0xe0
     hci_dev_close_sync+0x4c9/0x1150
     hci_set_powered_sync+0x4a7/0x680
     set_powered_sync+0xaa/0x150
     hci_cmd_sync_work+0x1b3/0x450
     process_one_work+0x908/0x19c0
     worker_thread+0x65c/0xe40
     kthread+0x34f/0x460
     ret_from_fork+0x659/0x940
     ret_from_fork_asm+0x1a/0x30

    The buggy address belongs to the object at ffff888112a2e000
     which belongs to the cache kmalloc-2k of size 2048
    The buggy address is located 1184 bytes inside of
     freed 2048-byte region [ffff888112a2e000, ffff888112a2e800)
    ==================================================================

Fixes: 300acfdec916 ("Bluetooth: Introduce force_bredr_smp debugfs option for testing")
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
Assisted-by: LLM

 net/bluetooth/hci_debugfs.c | 2 ++
 net/bluetooth/smp.c         | 2 +-
 net/bluetooth/smp.h         | 3 ++-
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/net/bluetooth/hci_debugfs.c b/net/bluetooth/hci_debugfs.c
index cd5ef398f2382..f513731053d28 100644
--- a/net/bluetooth/hci_debugfs.c
+++ b/net/bluetooth/hci_debugfs.c
@@ -525,7 +525,9 @@ static ssize_t force_bredr_smp_write(struct file *file,
 	if (err)
 		return err;
 
+	hci_dev_lock(hdev);
 	err = smp_force_bredr(hdev, enable);
+	hci_dev_unlock(hdev);
 	if (err)
 		return err;
 
diff --git a/net/bluetooth/smp.c b/net/bluetooth/smp.c
index 984b2d0b5e3e9..0e442cc2a35da 100644
--- a/net/bluetooth/smp.c
+++ b/net/bluetooth/smp.c
@@ -3356,7 +3356,7 @@ int smp_force_bredr(struct hci_dev *hdev, bool enable)
 			return PTR_ERR(chan);
 
 		hdev->smp_bredr_data = chan;
-	} else {
+	} else if (hdev->smp_bredr_data) {
 		struct l2cap_chan *chan;
 
 		chan = hdev->smp_bredr_data;
diff --git a/net/bluetooth/smp.h b/net/bluetooth/smp.h
index c86c463890078..13fe40c0cb244 100644
--- a/net/bluetooth/smp.h
+++ b/net/bluetooth/smp.h
@@ -193,7 +193,8 @@ bool smp_irk_matches(struct hci_dev *hdev, const u8 irk[16],
 int smp_generate_rpa(struct hci_dev *hdev, const u8 irk[16], bdaddr_t *rpa);
 int smp_generate_oob(struct hci_dev *hdev, u8 hash[16], u8 rand[16]);
 
-int smp_force_bredr(struct hci_dev *hdev, bool enable);
+int smp_force_bredr(struct hci_dev *hdev, bool enable)
+	__must_hold(&hdev->lock);
 
 int smp_register(struct hci_dev *hdev);
 void smp_unregister(struct hci_dev *hdev);
