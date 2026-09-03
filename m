Received: from smtp153-163.sina.com.cn (smtp153-163.sina.com.cn [61.135.153.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67AA139CCFB
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 08:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788425314; cv=none; b=K+/mKvKrWpf3Wan9o8v8/tlUHpqqWH69gyNewvGZj1ix9pFxijmoAfc0sakdym88QAPCvaZm1OyTphJWlA/AxvQj79Wyz52/3wnL0VzgIwd5Sm/Npm8/3WrTYQG2v+zaj5uVZ+7WQq4TwMbE3ib9e+J66WvjUf6hCwcCI5pfAk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788425314; c=relaxed/simple;
	bh=yiJNGJlzXz0Z3NLuBipG5RXWBjWFC8ZUnSyeP51iGVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WyJb5lxdYYvLNVFXTti82mcB0SOviopPyRKSv6DFFhPk5hSmfvspad6qsgyiJKJOfUB1+i/alkLETKIQ0c6x0kBTf0GZCm4DYOjBrWR9OVTOh1VQxRbx3u+EiNNFCsYPXOZdNzg3hSWtb+2XR730emsY3kfXagYxftyINjWQydc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=istxhwkP; arc=none smtp.client-ip=61.135.153.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="istxhwkP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1788425307;
	bh=b0PlzQKXMaE/R20n8ajIUS/FKwJGb/dpFgpXUviVGvs=;
	h=From:Subject:Date:Message-ID;
	b=istxhwkP1PmuiEIQ7Qyw0FeJd57O/5he+OMhEBCQkDsweeEqBh1Aqr9Wwsqzv3bEI
	 DI1/FdF1JbBe5PIj5m3kttRkSK2O/lGXNHoC67wRlYvf/G1fcRCvXMauSzj4OArhZX
	 SlJ9MmEUwGnznjlsWAG3CwkPMt9VbFwa0QOkN6mw=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.32) with ESMTP
	id 6A993433000036D5; Thu, 3 Sep 2026 16:47:48 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 5045894456891
X-SMAIL-UIID: CE7103F251894012B6DF56B5D8D58D11-20260903-164748-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+832ce9fa3face1b7d44d@syzkaller.appspotmail.com
Cc: zonque@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	daniel@caiaq.org,
	linux-sound@vger.kernel.org,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH] ALSA: caiaq: Decoupling ep1_in_urb in caiaq dev
Date: Thu,  3 Sep 2026 16:47:47 +0800
Message-ID: <20260903084747.535367-1-eadavis@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6a97af8d.27a413cd.1e878c.0004.GAE@google.com>
References: <6a97af8d.27a413cd.1e878c.0004.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The epq_in_urb object belonging to the caiaq device is coupled within
the struct snd_usb_caiaqdev. After usb_submit_urb(epq_in_urb, GFP_KERNEL)
executes successfully, epq_in_urb is successfully added to the urbp_list
queue of the dummy HCD driver (userspace specifies dummy_hcd as the HCD
layer driver for the caiaq USB device).

When init_card() calls snd_usb_caiaq_send_command() which subsequently
fails due to a timeout, and proceeds to call snd_card_free() to release
the card, the embedded ep1_in_urb object is also freed. When the dummy
HCD driver detects that the URB has been unlinked, it returns the URB
(by usb_hcd_giveback_urb()), which triggers [1].

Decouple the ep1_in_urb object from the struct snd_usb_caiaqdev and switch
to using a pointer instead. Separately allocate and manage the memory for
ep1_in_urb to prevent the release of the snd_card memory object from
interfering with it.

[1]
BUG: KASAN: slab-use-after-free in usb_free_urb+0x24/0x120 drivers/usb/core/urb.c:96
Write of size 4 at addr ffff88803cee1050 by task ktimers/1/29
Call Trace:
 usb_free_urb+0x24/0x120 drivers/usb/core/urb.c:96
 dummy_timer+0xaac/0x4d50 drivers/usb/gadget/udc/dummy_hcd.c:2019
 __run_hrtimer kernel/time/hrtimer.c:2067 [inline]
 __hrtimer_run_queues+0x3eb/0xaf0 kernel/time/hrtimer.c:2124
 hrtimer_run_softirq+0x1e1/0x2e0 kernel/time/hrtimer.c:2141

Allocated by task 36:
 snd_card_new+0x7b/0x110 sound/core/init.c:184
 create_card sound/usb/caiaq/device.c:429 [inline]
 snd_probe+0x236/0x1af0 sound/usb/caiaq/device.c:544

Freed by task 36:
 snd_card_free_when_closed sound/core/init.c:630 [inline]
 snd_card_free+0x138/0x1d0 sound/core/init.c:662
 snd_probe+0x162b/0x1af0 sound/usb/caiaq/device.c:553
 
Reported-by: syzbot+832ce9fa3face1b7d44d@syzkaller.appspotmail.com
Fixes: 523f1dce3743 ("[ALSA] Add Native Instrument usb audio device support")
Closes: https://syzkaller.appspot.com/bug?extid=832ce9fa3face1b7d44d
Tested-by: syzbot+832ce9fa3face1b7d44d@syzkaller.appspotmail.com
Signed-off-by: Edward Adam Davis <eadavis@sina.com>
---
 sound/usb/caiaq/device.c | 19 +++++++++++--------
 sound/usb/caiaq/device.h |  2 +-
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/sound/usb/caiaq/device.c b/sound/usb/caiaq/device.c
index a16e59248480..138b58914f1c 100644
--- a/sound/usb/caiaq/device.c
+++ b/sound/usb/caiaq/device.c
@@ -192,8 +192,8 @@ static void usb_ep1_command_reply_dispatch (struct urb* urb)
 		break;
 	}
 
-	cdev->ep1_in_urb.actual_length = 0;
-	ret = usb_submit_urb(&cdev->ep1_in_urb, GFP_ATOMIC);
+	cdev->ep1_in_urb->actual_length = 0;
+	ret = usb_submit_urb(cdev->ep1_in_urb, GFP_ATOMIC);
 	if (ret < 0)
 		dev_err(dev, "unable to submit urb. OOM!?\n");
 }
@@ -408,6 +408,8 @@ static void card_free(struct snd_card *card)
 #endif
 	snd_usb_caiaq_audio_free(cdev);
 	usb_put_dev(cdev->chip.dev);
+	usb_free_urb(cdev->ep1_in_urb);
+	cdev->ep1_in_urb = NULL;
 }
 
 static int create_card(struct usb_device *usb_dev,
@@ -457,10 +459,11 @@ static int init_card(struct snd_usb_caiaqdev *cdev)
 		return -EIO;
 	}
 
-	usb_init_urb(&cdev->ep1_in_urb);
+	cdev->ep1_in_urb = usb_alloc_urb(0, GFP_KERNEL);
+	usb_init_urb(cdev->ep1_in_urb);
 	usb_init_urb(&cdev->midi_out_urb);
 
-	usb_fill_bulk_urb(&cdev->ep1_in_urb, usb_dev,
+	usb_fill_bulk_urb(cdev->ep1_in_urb, usb_dev,
 			  usb_rcvbulkpipe(usb_dev, 0x1),
 			  cdev->ep1_in_buf, EP1_BUFSIZE,
 			  usb_ep1_command_reply_dispatch, cdev);
@@ -471,7 +474,7 @@ static int init_card(struct snd_usb_caiaqdev *cdev)
 			  snd_usb_caiaq_midi_output_done, cdev);
 
 	/* sanity checks of EPs before actually submitting */
-	if (usb_urb_ep_type_check(&cdev->ep1_in_urb) ||
+	if (usb_urb_ep_type_check(cdev->ep1_in_urb) ||
 	    usb_urb_ep_type_check(&cdev->midi_out_urb)) {
 		dev_err(dev, "invalid EPs\n");
 		return -EINVAL;
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
 
@@ -576,7 +579,7 @@ static void snd_disconnect(struct usb_interface *intf)
 #endif
 	snd_usb_caiaq_audio_disconnect(cdev);
 
-	usb_kill_urb(&cdev->ep1_in_urb);
+	usb_kill_urb(cdev->ep1_in_urb);
 	usb_kill_urb(&cdev->midi_out_urb);
 
 	snd_card_free_when_closed(card);
diff --git a/sound/usb/caiaq/device.h b/sound/usb/caiaq/device.h
index 743eb0387b5f..a5f7dada25d8 100644
--- a/sound/usb/caiaq/device.h
+++ b/sound/usb/caiaq/device.h
@@ -60,7 +60,7 @@ struct snd_usb_caiaq_cb_info;
 struct snd_usb_caiaqdev {
 	struct snd_usb_audio chip;
 
-	struct urb ep1_in_urb;
+	struct urb *ep1_in_urb;
 	struct urb midi_out_urb;
 	struct urb **data_urbs_in;
 	struct urb **data_urbs_out;
-- 
2.43.0

