Received: from mail3-166.sinamail.sina.com.cn (mail3-166.sinamail.sina.com.cn [202.108.3.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82582749C1
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 03:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788405711; cv=none; b=HW5ajbgexYBzR7TRoyYa7KVWDJFpAfHAPuDiFB0dzDRKuDByO422zdxdCbxQHwGk5nBUQ+w1zj3SNfxR0r3y8XVc3ew5F6aomO7IGntbpfiL7EDWKjKpr6AscJ+OUH5HTFQRV40sbkVeQ/eom30jOm4ff1JA/VXZwBaZDhf751Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788405711; c=relaxed/simple;
	bh=S8B7iDZbCM9zmGsk43sdlTxIipSqOJMUjc4CzZcsk30=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y3vYJmy7PVZ2yGD+xRn/cu9+h8uuFzvZQDc+O44RGtRL6soTq+Pspyk9QXvAxwwZLpFljk8Qq9b54xBhdN/pLy07zioEqyoKJ1IiooqldGpQ3rUdDQvTWc8nGvIKJbWvT4vMuMN33SYPZj5VN6RIS/vB2JiSqQ564f8xyOYmk0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=MN8YTGXA; arc=none smtp.client-ip=202.108.3.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="MN8YTGXA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1788405707;
	bh=rOdn3/KFG/7AMDHJCTgWP9Cm9DosmeW7Y0PaSXA8A6k=;
	h=From:Subject:Date:Message-ID;
	b=MN8YTGXAUgpfedqPiCpZONU1Qw+GV+g4ukDnx32BNxn33iLG1CNf2HFgjfgdBzIw6
	 uUWqQNsZZBVjBC2I34MBxxNeLPo/R8mjkwfCKp6o8yBCnrkqtWZo7OcqC91DZ4fZpq
	 G6RddXQQ9RIomORK1VQNIdAfRaAT6NUmDFiKliHs=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.31) with ESMTP
	id 6A98E7BC000029B4; Thu, 3 Sep 2026 11:21:36 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 671976816075
X-SMAIL-UIID: 6CB2EF81E8974ED0AC7423EC3188A5A2-20260903-112136-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+832ce9fa3face1b7d44d@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Write in usb_free_urb
Date: Thu,  3 Sep 2026 11:21:32 +0800
Message-ID: <20260903032132.511309-1-eadavis@sina.com>
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

From: Edward Aadm Davis <eadavis@sina.com>

#syz test: upstream 786262be6048

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
