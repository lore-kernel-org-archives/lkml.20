Received: from mail3-165.sinamail.sina.com.cn (mail3-165.sinamail.sina.com.cn [202.108.3.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D95337DEBA
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 09:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788428478; cv=none; b=l6cjTTdKoV1UX/xPwNXQq72+6htGowDWhlbqmYoq+Z+7rg3X1zEVNqmnUt68A5TYSsNKqNv1H/T2BqL87vfndaTrJ+2Zma0zb54nltoA2Iu1LWishuW7MRahxcmTKvrCTGfOsbQFeiuVDmZB3G0y6pwvl7J9eVNkyVR1C9HiK1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788428478; c=relaxed/simple;
	bh=w7XT7tqdRJHJv6GTPxTS9/YfRW4PTAdV3z6v+WeD4Oc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uRbUXufSJES8I+jUJDaJfNw0uKHLA6CpM5pH/xZT3YJu7ZEtmd/EI++CNwO16khx0uOhTClTb9o3+7F1og+MYlKxOfI4bftGewJ00eiPZ1oaVSQHN2beEGWBKc0HWzmSeAqKg4k/NFqJ8qtO/dces2lChYVUTF/ITrtfngICdyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=CGGiRU1M; arc=none smtp.client-ip=202.108.3.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="CGGiRU1M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1788428473;
	bh=DOnK4Nx9hl6+FcBbSwW7N2dxLUjgJ/U24pl5jA6Knxg=;
	h=From:Subject:Date:Message-ID;
	b=CGGiRU1MfixVFjY5SVLLOCwOoZ6kTu5h5q+keM4D/W2VVTzqIblcoC8N81L6fEWoR
	 HjfJ4Jl9vyLFJ4QTbs7LhighbBMkQb0bd88tLaIcXxjBtqwVsFGOhgGFvRGR+bWzs/
	 EE0mHUj4qPSR+Chl1n0LNFXWPTx/3/c9OxEMH9gc=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.33) with ESMTP
	id 6A9940B100007805; Thu, 3 Sep 2026 17:41:08 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 3288806685154
X-SMAIL-UIID: 6A6E91488387490C837E6E45F8C07570-20260903-174108-1
From: Edward Adam Davis <eadavis@sina.com>
To: tiwai@suse.de
Cc: daniel@caiaq.org,
	eadavis@sina.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-usb@vger.kernel.org,
	perex@perex.cz,
	syzbot+832ce9fa3face1b7d44d@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com,
	tiwai@suse.com,
	zonque@gmail.com
Subject: Re: [PATCH] ALSA: caiaq: Decoupling ep1_in_urb in caiaq dev
Date: Thu,  3 Sep 2026 17:41:05 +0800
Message-ID: <20260903094105.539519-1-eadavis@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <87pkyu8yu1.wl-tiwai@suse.de>
References: <87pkyu8yu1.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Edward Aadm Davis <eadavis@sina.com>

On Thu, 03 Sep 2026 11:32:22 +0200, Takashi Iwai wrote:
> > The epq_in_urb object belonging to the caiaq device is coupled within
> > the struct snd_usb_caiaqdev. After usb_submit_urb(epq_in_urb, GFP_KERNEL)
> > executes successfully, epq_in_urb is successfully added to the urbp_list
> > queue of the dummy HCD driver (userspace specifies dummy_hcd as the HCD
> > layer driver for the caiaq USB device).
> >
> > When init_card() calls snd_usb_caiaq_send_command() which subsequently
> > fails due to a timeout, and proceeds to call snd_card_free() to release
> > the card, the embedded ep1_in_urb object is also freed. When the dummy
> > HCD driver detects that the URB has been unlinked, it returns the URB
> > (by usb_hcd_giveback_urb()), which triggers [1].
> >
> > Decouple the ep1_in_urb object from the struct snd_usb_caiaqdev and switch
> > to using a pointer instead. Separately allocate and manage the memory for
> > ep1_in_urb to prevent the release of the snd_card memory object from
> > interfering with it.
> >
> > [1]
> > BUG: KASAN: slab-use-after-free in usb_free_urb+0x24/0x120 drivers/usb/core/urb.c:96
> > Write of size 4 at addr ffff88803cee1050 by task ktimers/1/29
> > Call Trace:
> >  usb_free_urb+0x24/0x120 drivers/usb/core/urb.c:96
> >  dummy_timer+0xaac/0x4d50 drivers/usb/gadget/udc/dummy_hcd.c:2019
> >  __run_hrtimer kernel/time/hrtimer.c:2067 [inline]
> >  __hrtimer_run_queues+0x3eb/0xaf0 kernel/time/hrtimer.c:2124
> >  hrtimer_run_softirq+0x1e1/0x2e0 kernel/time/hrtimer.c:2141
> >
> > Allocated by task 36:
> >  snd_card_new+0x7b/0x110 sound/core/init.c:184
> >  create_card sound/usb/caiaq/device.c:429 [inline]
> >  snd_probe+0x236/0x1af0 sound/usb/caiaq/device.c:544
> >
> > Freed by task 36:
> >  snd_card_free_when_closed sound/core/init.c:630 [inline]
> >  snd_card_free+0x138/0x1d0 sound/core/init.c:662
> >  snd_probe+0x162b/0x1af0 sound/usb/caiaq/device.c:553
> >
> > Reported-by: syzbot+832ce9fa3face1b7d44d@syzkaller.appspotmail.com
> > Fixes: 523f1dce3743 ("[ALSA] Add Native Instrument usb audio device support")
> > Closes: https://syzkaller.appspot.com/bug?extid=832ce9fa3face1b7d44d
> > Tested-by: syzbot+832ce9fa3face1b7d44d@syzkaller.appspotmail.com
> > Signed-off-by: Edward Adam Davis <eadavis@sina.com>
> > ---
> >  sound/usb/caiaq/device.c | 19 +++++++++++--------
> >  sound/usb/caiaq/device.h |  2 +-
> >  2 files changed, 12 insertions(+), 9 deletions(-)
> >
> > diff --git a/sound/usb/caiaq/device.c b/sound/usb/caiaq/device.c
> > index a16e59248480..138b58914f1c 100644
> > --- a/sound/usb/caiaq/device.c
> > +++ b/sound/usb/caiaq/device.c
> > @@ -192,8 +192,8 @@ static void usb_ep1_command_reply_dispatch (struct urb* urb)
> >  		break;
> >  	}
> >
> > -	cdev->ep1_in_urb.actual_length = 0;
> > -	ret = usb_submit_urb(&cdev->ep1_in_urb, GFP_ATOMIC);
> > +	cdev->ep1_in_urb->actual_length = 0;
> > +	ret = usb_submit_urb(cdev->ep1_in_urb, GFP_ATOMIC);
> >  	if (ret < 0)
> >  		dev_err(dev, "unable to submit urb. OOM!?\n");
> >  }
> > @@ -408,6 +408,8 @@ static void card_free(struct snd_card *card)
> >  #endif
> >  	snd_usb_caiaq_audio_free(cdev);
> >  	usb_put_dev(cdev->chip.dev);
> > +	usb_free_urb(cdev->ep1_in_urb);
> > +	cdev->ep1_in_urb = NULL;
> >  }
> >
> >  static int create_card(struct usb_device *usb_dev,
> > @@ -457,10 +459,11 @@ static int init_card(struct snd_usb_caiaqdev *cdev)
> >  		return -EIO;
> >  	}
> >
> > -	usb_init_urb(&cdev->ep1_in_urb);
> > +	cdev->ep1_in_urb = usb_alloc_urb(0, GFP_KERNEL);
> > +	usb_init_urb(cdev->ep1_in_urb);
> 
> The error check is missing here, as sashiko review pointed out.
> Could you fix and resubmit?
OK. I will fix and resubmit.
> 
> (The other issues reported there -- the potential-double-free and the
> midi_out_urb handling can be skipped here; I'll fix those
> individually.)
I can handle `midi_out_urb` as well.

BR,
Edward
