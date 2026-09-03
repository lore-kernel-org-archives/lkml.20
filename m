Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345B233F59E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 09:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788427470; cv=none; b=pBiofmvGvaYZQcs3VDCB1G/tO+8u7EdkMUWyFDWftcj7s07y1YH6sRuj7r1uzfecZGgpVvbd6rnrvsUgy12LCp7+YY5zIq14FNGap9EZuTyyBYi7VYQ7H0D1hiVsfoPwLEoaWlzHGA9qn8VURHWiu56u2fbVlOZ9gnlWnyYDhPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788427470; c=relaxed/simple;
	bh=61hznhQcwmZjzK3YKmEG6XfvPXr75t4QMWhIxe6VGig=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l2WDeAEyRO6ZXRWFYf4xFYK5+2k6tVRE9TJWFxjJPK+hIRlxoIS/9NpVZgFVU1PQV9gWAfLaxxFlMkmg3tP4pa/95STYpLjMZpAld9OTntZDsn0ceGY8/u2gG03A4AuOfcl9yO2Z/DUP2P1kwVDpeg54dLyuaVOh/y/XboVsOxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=evuQSrH1; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="evuQSrH1"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48431648f33so536049f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 02:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788427463; x=1789032263; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I4bRmfkn+NWvN5fS6qgsY/lQMFXFNzNIr1ZeJlMXD3I=;
        b=evuQSrH1SxAy8K9WFKJ5sQ/aN9QSnEflu2nFV7dk7DWFuUDTfle+XS9yE7now1JTN8
         wbYpTs1FbSMvYlzeX7FTC7baddCX1HaJiBjIqYrzAUEPEcm1tL+yPkI0rsSnkZiDdibC
         /7gCgOMnpP27B3+7QdE/tVQPrr2R0bcVrGa1XSsf3/B95/K7n3HP5YZDR0C29W12q+qk
         h2N4/StD13AqjMRzUdWKAjUoaIiwkliPAgCy2fTdGfN1zD/p+x1q3fy+RKo3x+n3CqBP
         mdBWvim9hbzJADKp4xSLt4KvpCzC7PAX6wv7dRdADa1sDJRAzxzSRrnJy9vqcECfzq4c
         XDfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788427463; x=1789032263;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I4bRmfkn+NWvN5fS6qgsY/lQMFXFNzNIr1ZeJlMXD3I=;
        b=O4FZG1+fGBtdyjf4tl6g18h/TDF5qpQVnD0LMYnCyLePXNWWd7Y4c7mfYbVMaIbBP/
         E7Q/xznZv2EM1EH2gF58cNxFtNQP6hde4Cma72H0lMhTnzmPTRlRGwvzf+SxkvAzJTJU
         rOE94DYiJlqZeuGAuLaGwJJ3fKEatiVOZ9eIrIDwdBTBm92Ut4uWEH6eHeYcZTUq11Ik
         nqcWO5U/FuKdXB/MllGiMDmo+xoaFl052fjJd38fG27XvWt+Zq+jGnG5Zornx4GTR56V
         UimpNA/q7GoRe0LTRznkIApZeO7zcyaSiOEjMxLqAl/Y37zBZzxGQlMkOQtMHVuolvNn
         u29A==
X-Forwarded-Encrypted: i=1; AKwUvBxzPrsAdB7MpiC6uctK5xLALzsHBwkq+OmvnArHnilYLmQArhB2/2XcRwfsGQKvuhnNHngEOe+UjvEZPtQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n0rboTOvLBkWNDNbTmthxF1rYa+hdpAsvRDPf8Z/+rM0HMSL6E
	V/KC3aMqEj63ZZMVp1mLj3k75Qo/jh+Ywe2poytTXA2fmSgPhPyyITcr
X-Gm-Gg: AYBFou3oweIbWshqN02gO1lImxp/BI02tY+ettkSWPYDO/jNmwPtpJBSORNQYaC37nD
	0T83JpRUCCozenbkicriEPEMidoqYeTkVt9Z7qhs0QUNSA2Rj2mPuw1bdAd7/1jQ9it13Ce5+nD
	tk9B9xTJ9si1zGcBukvxwk4d8q9jcCYb6sUKDDPG7mpbGvnjtxz5HvKeWESP7hbw3ACSDPh/KvE
	MJba1+i/v2iPMM0gA8wlpC/xmWtuf1pFDtxW7/GhADPvd/euDKO51ZEVPDlYFFeM0GdKnqYsmPK
	C1YzuM48c+Yf0JHJD6+TTpuwFfRC0sleP6niwIHjTbpSlRg1bDXKyznEiGdZonYvQfB1C2/OwoE
	dKqRI2cfpJjFmOg4hY9UqLIb9cxpaVsluY5IEw+LRQLgSdlZO42fGm9KWSFT4YuTh51Tv94fSrn
	g85OaMIGPxkjBVD3l8f2Dwul76FHvuje/loXATvpNarOjjJARploY7lE5yJBl0wytFpNdaV+jHc
	ecb7hfQSoc=
X-Received: by 2002:a05:6000:22c2:b0:484:3147:49c9 with SMTP id ffacd0b85a97d-48582315a47mr2809717f8f.2.1788427463132;
        Thu, 03 Sep 2026 02:24:23 -0700 (PDT)
Received: from foxbook (bfg95.neoplus.adsl.tpnet.pl. [83.28.44.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e80745sm12599197f8f.15.2026.09.03.02.24.21
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 03 Sep 2026 02:24:22 -0700 (PDT)
Date: Thu, 3 Sep 2026 11:24:17 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: syzbot <syzbot+832ce9fa3face1b7d44d@syzkaller.appspotmail.com>
Cc: bolewara@gmail.com, devnull@kernel.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-usb@vger.kernel.org, mchehab@kernel.org,
 syzkaller-bugs@googlegroups.com, Daniel Mack <zonque@gmail.com>, Takashi
 Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Write in
 usb_free_urb
Message-ID: <20260903112417.21b76017.michal.pecio@gmail.com>
In-Reply-To: <6a97af8d.27a413cd.1e878c.0004.GAE@google.com>
References: <6a6e9502.f794c993.27aeb.0018.GAE@google.com>
	<6a97af8d.27a413cd.1e878c.0004.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 01 Sep 2026 22:09:33 -0700, syzbot wrote:
> syzbot has found a reproducer for the following issue on:
> 
> HEAD commit:    786262be6048 Merge tag 'edac_updates_for_v7.3_rc2' of git:..
> git tree:       upstream
> console+strace: https://syzkaller.appspot.com/x/log.txt?x=12a28125580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=b454dc6b1b7acd30
> dashboard link: https://syzkaller.appspot.com/bug?extid=832ce9fa3face1b7d44d
> compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1735af79580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=135b7f79580000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/c3e528ebf709/disk-786262be.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/46f3418d2828/vmlinux-786262be.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/60ab8a27c4f7/bzImage-786262be.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+832ce9fa3face1b7d44d@syzkaller.appspotmail.com
> 
> usb 1-1: received EP1 urb->status = -2
> ==================================================================
> BUG: KASAN: slab-use-after-free in instrument_atomic_read_write include/linux/instrumented.h:112 [inline]
> BUG: KASAN: slab-use-after-free in atomic_fetch_sub_release include/linux/atomic/atomic-instrumented.h:400 [inline]
> BUG: KASAN: slab-use-after-free in __refcount_sub_and_test include/linux/refcount.h:389 [inline]
> BUG: KASAN: slab-use-after-free in __refcount_dec_and_test include/linux/refcount.h:432 [inline]
> BUG: KASAN: slab-use-after-free in refcount_dec_and_test include/linux/refcount.h:450 [inline]
> BUG: KASAN: slab-use-after-free in kref_put include/linux/kref.h:64 [inline]
> BUG: KASAN: slab-use-after-free in usb_free_urb+0x24/0x120 drivers/usb/core/urb.c:96
> Write of size 4 at addr ffff88803cee1050 by task ktimers/1/29
> 
> CPU: 1 UID: 0 PID: 29 Comm: ktimers/1 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
> Call Trace:
>  <TASK>
>  dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
>  print_address_description+0x55/0x1e0 mm/kasan/report.c:378
>  print_report+0x58/0x70 mm/kasan/report.c:482
>  kasan_report+0x117/0x150 mm/kasan/report.c:595
>  check_region_inline mm/kasan/generic.c:-1 [inline]
>  kasan_check_range+0x264/0x2c0 mm/kasan/generic.c:200
>  instrument_atomic_read_write include/linux/instrumented.h:112 [inline]
>  atomic_fetch_sub_release include/linux/atomic/atomic-instrumented.h:400 [inline]
>  __refcount_sub_and_test include/linux/refcount.h:389 [inline]
>  __refcount_dec_and_test include/linux/refcount.h:432 [inline]
>  refcount_dec_and_test include/linux/refcount.h:450 [inline]
>  kref_put include/linux/kref.h:64 [inline]
>  usb_free_urb+0x24/0x120 drivers/usb/core/urb.c:96
>  dummy_timer+0xaac/0x4d50 drivers/usb/gadget/udc/dummy_hcd.c:2019
>  __run_hrtimer kernel/time/hrtimer.c:2067 [inline]
>  __hrtimer_run_queues+0x3eb/0xaf0 kernel/time/hrtimer.c:2124
>  hrtimer_run_softirq+0x1e1/0x2e0 kernel/time/hrtimer.c:2141
>  handle_softirqs+0x1da/0x6d0 kernel/softirq.c:645
>  __do_softirq kernel/softirq.c:679 [inline]
>  run_ktimerd+0x6a/0x100 kernel/softirq.c:1183
>  smpboot_thread_fn+0x565/0xa70 kernel/smpboot.c:160
>  kthread+0x38b/0x470 kernel/kthread.c:436
>  ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
>  </TASK>

[Adding sound people]

So what happens here is that USB core continues to use a URB after
completion to implement things like usb_kill_urb(), so URBs are
reference counted. Then core decrements the count - one more use.

If a driver waits for completion or even usb_kill_urb() to return
and then proceeds to free the URB's storage, this becomes a UAF.
This driver embeds 2 URBs in its priv and does just that.

A URB can only exist as an independent allocation, core will free
it if upon finding zero reference count in such case.

This is a mechanical conversion, untested. I don't have the HW.

#syz test

diff --git a/sound/usb/caiaq/device.c b/sound/usb/caiaq/device.c
index a16e59248480..3587794207d4 100644
--- a/sound/usb/caiaq/device.c
+++ b/sound/usb/caiaq/device.c
@@ -192,8 +192,7 @@ static void usb_ep1_command_reply_dispatch (struct urb* urb)
 		break;
 	}
 
-	cdev->ep1_in_urb.actual_length = 0;
-	ret = usb_submit_urb(&cdev->ep1_in_urb, GFP_ATOMIC);
+	ret = usb_submit_urb(cdev->ep1_in_urb, GFP_ATOMIC);
 	if (ret < 0)
 		dev_err(dev, "unable to submit urb. OOM!?\n");
 }
@@ -403,6 +402,8 @@ static void card_free(struct snd_card *card)
 {
 	struct snd_usb_caiaqdev *cdev = caiaqdev(card);
 
+	usb_free_urb(cdev->ep1_in_urb);
+	usb_free_urb(cdev->midi_out_urb);
 #ifdef CONFIG_SND_USB_CAIAQ_INPUT
 	snd_usb_caiaq_input_free(cdev);
 #endif
@@ -457,22 +458,24 @@ static int init_card(struct snd_usb_caiaqdev *cdev)
 		return -EIO;
 	}
 
-	usb_init_urb(&cdev->ep1_in_urb);
-	usb_init_urb(&cdev->midi_out_urb);
+	cdev->ep1_in_urb = usb_alloc_urb(0, GFP_KERNEL);
+	cdev->midi_out_urb = usb_alloc_urb(0, GFP_KERNEL);
+	if (!cdev->ep1_in_urb || !cdev->midi_out_urb)
+		return -ENOMEM;
 
-	usb_fill_bulk_urb(&cdev->ep1_in_urb, usb_dev,
+	usb_fill_bulk_urb(cdev->ep1_in_urb, usb_dev,
 			  usb_rcvbulkpipe(usb_dev, 0x1),
 			  cdev->ep1_in_buf, EP1_BUFSIZE,
 			  usb_ep1_command_reply_dispatch, cdev);
 
-	usb_fill_bulk_urb(&cdev->midi_out_urb, usb_dev,
+	usb_fill_bulk_urb(cdev->midi_out_urb, usb_dev,
 			  usb_sndbulkpipe(usb_dev, 0x1),
 			  cdev->midi_out_buf, EP1_BUFSIZE,
 			  snd_usb_caiaq_midi_output_done, cdev);
 
 	/* sanity checks of EPs before actually submitting */
-	if (usb_urb_ep_type_check(&cdev->ep1_in_urb) ||
-	    usb_urb_ep_type_check(&cdev->midi_out_urb)) {
+	if (usb_urb_ep_type_check(cdev->ep1_in_urb) ||
+	    usb_urb_ep_type_check(cdev->midi_out_urb)) {
 		dev_err(dev, "invalid EPs\n");
 		return -EINVAL;
 	}
@@ -480,7 +483,7 @@ static int init_card(struct snd_usb_caiaqdev *cdev)
 	init_waitqueue_head(&cdev->ep1_wait_queue);
 	init_waitqueue_head(&cdev->prepare_wait_queue);
 
-	if (usb_submit_urb(&cdev->ep1_in_urb, GFP_KERNEL) != 0)
+	if (usb_submit_urb(cdev->ep1_in_urb, GFP_KERNEL) != 0)
 		return -EIO;
 
 	err = snd_usb_caiaq_send_command(cdev, EP1_CMD_GET_DEVICE_INFO, NULL, 0);
@@ -530,7 +533,7 @@ static int init_card(struct snd_usb_caiaqdev *cdev)
 	return 0;
 
  err_kill_urb:
-	usb_kill_urb(&cdev->ep1_in_urb);
+	usb_kill_urb(cdev->ep1_in_urb);
 	return err;
 }
 
@@ -576,8 +579,8 @@ static void snd_disconnect(struct usb_interface *intf)
 #endif
 	snd_usb_caiaq_audio_disconnect(cdev);
 
-	usb_kill_urb(&cdev->ep1_in_urb);
-	usb_kill_urb(&cdev->midi_out_urb);
+	usb_kill_urb(cdev->ep1_in_urb);
+	usb_kill_urb(cdev->midi_out_urb);
 
 	snd_card_free_when_closed(card);
 }
diff --git a/sound/usb/caiaq/device.h b/sound/usb/caiaq/device.h
index 743eb0387b5f..1c6f34693fa8 100644
--- a/sound/usb/caiaq/device.h
+++ b/sound/usb/caiaq/device.h
@@ -60,8 +60,8 @@ struct snd_usb_caiaq_cb_info;
 struct snd_usb_caiaqdev {
 	struct snd_usb_audio chip;
 
-	struct urb ep1_in_urb;
-	struct urb midi_out_urb;
+	struct urb *ep1_in_urb;
+	struct urb *midi_out_urb;
 	struct urb **data_urbs_in;
 	struct urb **data_urbs_out;
 	struct snd_usb_caiaq_cb_info *data_cb_info;
diff --git a/sound/usb/caiaq/midi.c b/sound/usb/caiaq/midi.c
index c656d0162432..18529484c8dc 100644
--- a/sound/usb/caiaq/midi.c
+++ b/sound/usb/caiaq/midi.c
@@ -43,7 +43,7 @@ static int snd_usb_caiaq_midi_output_close(struct snd_rawmidi_substream *substre
 {
 	struct snd_usb_caiaqdev *cdev = substream->rmidi->private_data;
 	if (cdev->midi_out_active) {
-		usb_kill_urb(&cdev->midi_out_urb);
+		usb_kill_urb(cdev->midi_out_urb);
 		cdev->midi_out_active = 0;
 	}
 	return 0;
@@ -64,9 +64,9 @@ static void snd_usb_caiaq_midi_send(struct snd_usb_caiaqdev *cdev,
 		return;
 
 	cdev->midi_out_buf[2] = len;
-	cdev->midi_out_urb.transfer_buffer_length = len+3;
+	cdev->midi_out_urb->transfer_buffer_length = len+3;
 
-	ret = usb_submit_urb(&cdev->midi_out_urb, GFP_ATOMIC);
+	ret = usb_submit_urb(cdev->midi_out_urb, GFP_ATOMIC);
 	if (ret < 0)
 		dev_err(dev,
 			"snd_usb_caiaq_midi_send(%p): usb_submit_urb() failed,"
