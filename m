Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793431966;
	b=yv6RqW8XEw5ey9ATeZxnusC9CeEly0UG465pnwB3MfykPVNHP3haEDfGiIKUQ0o4Oi99
	 KsdbUpW8tbSu0Afy+QBRm15McDoVGoYka2ZwXH5mQhEcocg/3YkgOfkcGFErgjI/4jEZ4
	 Z+wgWGyKcY4W7uRZqQ03/uH7ZgvnIMi3CriL9adFTc4xrnAR0+NoXF9u0JiTlHbbP/DvC
	 F8vSIvlqJ+hk+qb+kXgL4j5AdnyCHlowD/CD2x78UHsuV+p5SBLdMirDRNIus6W8ynC6e
	 tLxrnmt0Brtq6b5pcYy3H9nn9Z0nOXpmWLwn+4FkMTBqH9z9fTDaepTBodZrZxElzYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793431966;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zpHIcbEE/TDPdpGdOrloXo2HbuZ8/2Ofww5DgysnmFs=;
	b=dVrTb4vW3jztR/Fn0/4cfIcPfPUWmtkInol6351HmFVuI1SLsY3HdnZc5N3kuq8zLLXV
	 Uy7lCCXgqxuzP9oexoCHIXxkAc20iY10HoPoR7qAwpCrm/AMR+XgVvzlKtOaCGBtBvQHl
	 aOuRE/j9zKVVOH8n0oX385qPo2QjEDRtWfEujR56OnaZvfzxygkbJg3/mY58H3FHiH37f
	 kH/kQg//EzGN0E2+QXF6EvIn9u9djtClvSCyGQrtQhzHkow3TYAKndhZchYCEDpbvIQqU
	 kM2JQ5QqcXixkcbL9GYiQDfwZzAi7ongYXSm6fCK/9hjW7bQgOo7h8lYNSQ2u/tGz5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mVc9cnis;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C63B606A320
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 07:32:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C63B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mVc9cnis
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so714191a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 00:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793431965; x=1794036765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zpHIcbEE/TDPdpGdOrloXo2HbuZ8/2Ofww5DgysnmFs=;
        b=mVc9cnisoi/2LLKmuNlgvgy2+RkyPWlN5mscY56Cm7h3Pb2CG1+pycsqeZ2DflUWUv
         5+vHjh8yONqdUntOiNA3NV9EShaUT8sqfTAQG02q5jsbSTtPW5vqCp5z51hJhQR6HZ23
         xae0rp3jnwjHwGST6QjTKy0s0YFcW/VRGP4bTPDkCmWFTENzRz0wR85CcEK3ex6s11BE
         OyZnk0A4vnt+6afAvaKfjjyY/IGAqcR2K4vM+4v620xkc74Wn6f/0mvyjypK5iW369PH
         TXSscbZ/ulipv96JvKWmUSEtj/FWNGh0+pxo3eN2P39CdkITL5BySYr2aC/MNjZha6uJ
         Wu2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793431965; x=1794036765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zpHIcbEE/TDPdpGdOrloXo2HbuZ8/2Ofww5DgysnmFs=;
        b=Bf9kGWPiD9U8E+YdTZuXWf75xMtFRtPnqbJfhundhn/6QxGezfNoXgNJ+vY14OJmI7
         1HrW0Nsw07r0TGZ8SSUasN2Do6hq0Dh87sOA1HrgxOVsadmf9Y8XOLgcZmaGwGwPYzO0
         rEko7ZSixvys+g0wgf4RQUcwUN7gXP+QWWnvHpLZ5hfZoIlzGMK6hbUacK27jV6tswJT
         a4/6F2C7niF+8Tm8V3CZAqFvxnN5Z6Yqyfu3dawkXgOuV64ePijhROcjzaNLPuhnC2TW
         w0iTO1+gG1JXBvtD1b38zZAnZgEZcjhAmWkB6Nwt+1omkh346Zj7iZX8WuqsE1VYeG+D
         x5Yw==
X-Forwarded-Encrypted: i=1; AKwUvBz4GsOTpldK3jq+QgeurM2ZTD5kkbf2YQuKfqZZMkWcHNDZBVMNRmGfJa1Kd3AxZkfXhFrI9yvxwJRvEu4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtmJ4znoDfK4Y4rq0gZXHvX+qTzzi2w+UI21hgfRgrGUlSUuss
	M2CWN3y/j39GzYZE1bt9T14HzJnpLKmymjgN21b2XIgqzMB1qHqQ/HFS
X-Gm-Gg: AYBFou1TGpl641MJuM7GzbZ+HFjqsk3L+vJECCxVaH0aweXr15OgPktZIv0uqr31Ikb
	BirbPIKsGamVNvaF2pEGPj94wfIUYkDb17JJtJh8FHHD1thqr1tekUwMy1K4ea5vsOoeuJc0R3j
	tX5IO36+XoSWJifzM0rG4tWaAStG7TcR+y8cW4MlzhxaOYPBOrVAHHDyo+vgVvtk8cxp/914p4u
	xFhhTLEPwk67VE50SyPl+EgjoJOcIZLfNHp3CuCS7Y4b+50xJ77XbzBqKKIagxB6DYYMDygEz/1
	dEEgg7ckQs34ovJl5IsYZf/p5WYUSm/2WleDisL14f+EE3Q48Fca1ZOkcf7WkiN7YXTLzY8hIih
	Qw+CDcvuNYPiHI2se7nJaLcKUEbATYtl2kEgVxv/xkUO/yR+gx2PhBpWtztDdJXP8wL6V1RtkSH
	/w+lw4gjRV1CemfunBMOvQnT0gvSg664q8Fdlg4Y00QncFa3KUkpG/CRKyKsquOCAuBItPoTDpy
	0qv9t/fE0zYfhl0CreSIFP8jNOKgeD1DW9KAcdkiAaMnW1eC40SCNM+d/uTZeMGbWd9nKVNY87A
	9vZn8HVCDYF9T/salsjYwzNR
X-Received: by 2002:a17:90b:2d84:b0:3ac:b867:81df with SMTP id 98e67ed59e1d1-3ae8983517dmr3737629a91.39.1793431964910;
        Sat, 31 Oct 2026 00:32:44 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae841dd1b9sm6691486a91.0.2026.10.31.00.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 00:32:44 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v3 3/3] Bluetooth: SMP: Serialize root channel replacement
Date: Sat, 31 Oct 2026 15:32:24 +0800
Message-Id: <pm-bluetooth-objects-candidate-0184-v9-4094fa28af7bd56a283a-3@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pm-bluetooth-objects-candidate-0184-v9-4094fa28af7bd56a283a-0@gmail.com>
References: <pm-bluetooth-objects-candidate-0184-v9-4094fa28af7bd56a283a-0@gmail.com>
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

smp_register() replaces the SMP root channels when they are still
registered from an earlier power-on. This happens when management
powers on a controller that is already up with HCI_AUTO_OFF set:
hci_power_on_sync() clears the flag and runs hci_powered_update_sync()
again, which registers SMP so that the channels use the identity address
chosen for this power-on. The WARN_ON() in smp_register() fires on this
path, and the old channels and their SMP data are freed while two kinds
of users can still hold them.

HCI event handlers read hdev->smp_data under hdev->lock, for example
smp_irk_matches() when resolving the target of a directed advertising
report:

  HCI receive worker              Power-on request
  hci_dev_lock(hdev)
  smp_irk_matches()
    chan = hdev->smp_data
                                  hci_powered_update_sync()
                                    smp_register()
                                      smp_del_chan(chan), chan freed
    reads chan->data

SMP receive callbacks run on hdev->workqueue without hdev->lock and use
the ECDH transform of the root, for example smp_cmd_public_key():

  HCI receive worker (SMP)        Power-on request
  smp_cmd_public_key()
    tfm = root's tfm_ecdh
                                  smp_register()
                                    smp_del_chan()
                                      crypto_free_kpp(tfm)
    compute_ecdh_secret(tfm, ...)

Before commit 2ff13894cfb8 ("Bluetooth: Perform HCI update for power on
synchronously") moved it to the request worker, registration ran from the
completion callback of the power-on request in the HCI receive worker,
which serialized it with both users.

Run the registration on hdev->workqueue again and hold hdev->lock while
it replaces the channels. smp_register() waits for the work and returns
its result. Its callers hold the request lock but not hdev->lock,
including hci_power_on() when it updates a controller in the
HCI_AUTO_OFF window. No work on hdev->workqueue takes the request lock,
and hci_dev_close_sync() drains this workqueue only with the request
lock held, so the registration work cannot be queued while it drains.
Users that run under the request lock, such as smp_generate_rpa(), stay
serialized by that lock.

The reports below come from test kernels with scheduling hooks that
widen these windows. The WARN_ON() in smp_register() was printed before
each of them.

KASAN report as below:

    ==================================================================
    BUG: KASAN: slab-use-after-free in smp_irk_matches+0x2fb/0x310
    Read of size 8 at addr ffff88810c35f4a0 by task kworker/u17:0/520

    Workqueue: hci0 hci_rx_work
    Call Trace:
     <TASK>
     dump_stack_lvl+0x93/0xd0
     print_report+0xce/0x630
     kasan_report+0xe0/0x110
     smp_irk_matches+0x2fb/0x310
     process_adv_report.part.0+0x2ce/0x1680
     hci_le_direct_adv_report_evt+0x2f8/0x4c0
     hci_le_meta_evt+0x30c/0x5c0
     hci_event_packet+0x4e8/0xc70
     hci_rx_work+0x367/0xf00
     process_one_work+0x908/0x19c0
     worker_thread+0x65c/0xe40
     kthread+0x34f/0x460
     ret_from_fork+0x659/0x940
     ret_from_fork_asm+0x1a/0x30
     </TASK>

    Allocated by task 522:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     __kasan_kmalloc+0xaa/0xb0
     __kmalloc_cache_noprof+0x251/0x610
     l2cap_chan_create+0x47/0x930
     smp_add_cid+0x120/0x4f0
     smp_register+0xa7/0x400
     hci_powered_update_sync+0x88/0x720
     hci_dev_open_sync+0xae0/0x2060
     hci_set_powered_sync+0x2a9/0x720
     set_powered_sync+0xaa/0x150
     hci_cmd_sync_work+0x1b3/0x450
     process_one_work+0x908/0x19c0
     worker_thread+0x65c/0xe40
     kthread+0x34f/0x460
     ret_from_fork+0x659/0x940
     ret_from_fork_asm+0x1a/0x30

    Freed by task 522:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     kasan_save_free_info+0x3b/0x60
     __kasan_slab_free+0x5f/0x80
     kfree+0x307/0x580
     l2cap_chan_put+0x273/0x3a0
     smp_del_chan+0x9f/0x170
     smp_register+0x2e8/0x400
     hci_powered_update_sync+0x88/0x720
     hci_set_powered_sync+0x5e5/0x720
     set_powered_sync+0xaa/0x150
     hci_cmd_sync_work+0x1b3/0x450
     process_one_work+0x908/0x19c0
     worker_thread+0x65c/0xe40
     kthread+0x34f/0x460
     ret_from_fork+0x659/0x940
     ret_from_fork_asm+0x1a/0x30

    The buggy address belongs to the object at ffff88810c35f000
     which belongs to the cache kmalloc-2k of size 2048
    The buggy address is located 1184 bytes inside of
     freed 2048-byte region [ffff88810c35f000, ffff88810c35f800)
    ==================================================================

KASAN report as below:

    ==================================================================
    BUG: KASAN: slab-use-after-free in compute_ecdh_secret+0x856/0xa50
    Read of size 4 at addr ffff8881071f4f00 by task kworker/u17:2/500

    Workqueue: hci1 hci_rx_work
    Call Trace:
     <TASK>
     dump_stack_lvl+0x93/0xd0
     print_report+0xce/0x630
     kasan_report+0xe0/0x110
     compute_ecdh_secret+0x856/0xa50
     smp_recv_cb+0x3acf/0x93b0
     l2cap_recv_frame+0x13cc/0x8830
     l2cap_recv_acldata+0xe9f/0x10e0
     hci_rx_work+0x5a6/0xf00
     process_one_work+0x908/0x19c0
     worker_thread+0x65c/0xe40
     kthread+0x34f/0x460
     ret_from_fork+0x659/0x940
     ret_from_fork_asm+0x1a/0x30
     </TASK>

    Allocated by task 497:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     __kasan_kmalloc+0xaa/0xb0
     __kmalloc_node_noprof+0x2f2/0x7b0
     crypto_create_tfm_node+0x92/0x390
     crypto_alloc_tfm_node+0xf5/0x220
     smp_add_cid+0xc1/0x4f0
     smp_register+0x9d/0x430
     hci_powered_update_sync+0x82/0x680
     hci_set_powered_sync+0x4f4/0x750
     set_powered_sync+0xb8/0x210
     hci_cmd_sync_work+0x1b3/0x450
     process_one_work+0x908/0x19c0
     worker_thread+0x65c/0xe40
     kthread+0x34f/0x460
     ret_from_fork+0x659/0x940
     ret_from_fork_asm+0x1a/0x30

    Freed by task 497:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     kasan_save_free_info+0x3b/0x60
     __kasan_slab_free+0x5f/0x80
     kfree+0x307/0x580
     crypto_destroy_tfm+0xdd/0x230
     smp_del_chan+0x8b/0x180
     smp_register+0x29d/0x430
     hci_powered_update_sync+0x82/0x680
     hci_set_powered_sync+0x4f4/0x750
     set_powered_sync+0xb8/0x210
     hci_cmd_sync_work+0x1b3/0x450
     process_one_work+0x908/0x19c0
     worker_thread+0x65c/0xe40
     kthread+0x34f/0x460
     ret_from_fork+0x659/0x940
     ret_from_fork_asm+0x1a/0x30

    The buggy address belongs to the object at ffff8881071f4f00
     which belongs to the cache kmalloc-128 of size 128
    The buggy address is located 0 bytes inside of
     freed 128-byte region [ffff8881071f4f00, ffff8881071f4f80)
    ==================================================================

Fixes: 2ff13894cfb8 ("Bluetooth: Perform HCI update for power on synchronously")
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
Assisted-by: LLM

 net/bluetooth/smp.c | 36 +++++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/net/bluetooth/smp.c b/net/bluetooth/smp.c
index 0e442cc2a35da..552b6b3713c3a 100644
--- a/net/bluetooth/smp.c
+++ b/net/bluetooth/smp.c
@@ -3369,7 +3369,8 @@ int smp_force_bredr(struct hci_dev *hdev, bool enable)
 	return 0;
 }
 
-int smp_register(struct hci_dev *hdev)
+static int __smp_register(struct hci_dev *hdev)
+	__must_hold(&hdev->lock)
 {
 	struct l2cap_chan *chan;
 
@@ -3419,6 +3420,39 @@ int smp_register(struct hci_dev *hdev)
 	return 0;
 }
 
+struct smp_register_work {
+	struct work_struct work;
+	struct hci_dev *hdev;
+	int err;
+};
+
+static void smp_register_func(struct work_struct *work)
+{
+	struct smp_register_work *reg =
+		container_of(work, struct smp_register_work, work);
+	struct hci_dev *hdev = reg->hdev;
+
+	hci_dev_lock(hdev);
+	reg->err = __smp_register(hdev);
+	hci_dev_unlock(hdev);
+}
+
+int smp_register(struct hci_dev *hdev)
+{
+	struct smp_register_work reg = { .hdev = hdev };
+
+	/* HCI event handlers use the root channels under hdev->lock, and
+	 * SMP receive callbacks use them from hdev->workqueue. Replace the
+	 * channels from that workqueue while holding hdev->lock.
+	 */
+	INIT_WORK_ONSTACK(&reg.work, smp_register_func);
+	queue_work(hdev->workqueue, &reg.work);
+	flush_work(&reg.work);
+	destroy_work_on_stack(&reg.work);
+
+	return reg.err;
+}
+
 void smp_unregister(struct hci_dev *hdev)
 {
 	struct l2cap_chan *chan;
