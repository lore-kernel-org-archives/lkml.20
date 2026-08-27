Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF1640E8D7
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787821216; cv=none; b=X5yXITNXZpUSAJoKy1Upc31DCPdf3uRf5XtB9/zp+QcvOa20PhVrnvodOFnxoWomhHnNJLownfP/lrQ8dAiVqUPNmxY6ri8S6CytX1SmAy6FI2k4+tyhh5j2tCKbuDpCeNmQNgTO6yntCKF9NrmUp+YqHOvKgWGuiOKQ3cj5/9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787821216; c=relaxed/simple;
	bh=ULL0WSE+VnO9meH9P9SHFZ/5ECm8VRmPNFjsu7sTbZw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hKib7J3x1R4Q264j5VWFCuttqf1A9+BnvWVCstikG5iS7BZEsjmjkSLb7TQFLWa/4xOxK4dQt8QcqXK2q2SwZQDNfUkNqsXkP5dVV8zdNRd0F3tx+DpxFKRH6MvBuh1W9r85lbCy4hhDfhJg3k3UHjdvlSzZEZei6M9SRqcaYrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jeE/EgOm; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jeE/EgOm"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49b8e527d63so2386645e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 02:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787821211; x=1788426011; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Cm05Jqi50ugmia6yOpX5uH7qKzSDAmXg4hbuH3KqhN8=;
        b=jeE/EgOmL/BsZ3fQtM3srvFZs9GDjvtJzuAJL4DfKzQ7jmjU4Tmi/En8bjSK+bAUpb
         v+Q4WT4u0I7asMLTG4TsxKLq5WY5aCuMFKcyDoDQ3FhPKI+VvBdKI9h12ogS9rrLIFXW
         2a9y5UOIN9qLRhvlVHbcaNIsKGs01AR9mCC0IobJdu+EUaRbRK+qKUiQdnrC04Ma0u2k
         1bwznLwKRKoDnU5BZTkE/o7m5goS3FbVFfzANj9mVuzEUFd3KYUAR8biaJJLqQSlKh/w
         Qg1hwfHEZidnX4l8RFcdsNdPxIJGHH9itPGw5h8VkRQEDePousvxQMEK78vGgSB2/QS2
         rEDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787821211; x=1788426011;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cm05Jqi50ugmia6yOpX5uH7qKzSDAmXg4hbuH3KqhN8=;
        b=i+2g2aiLwVXDYLFVYXMu5bdj+WMskH+V3+WZjCrEoZsvPLA1WFd/KVjaFTVYHg7v/f
         6yLnzj/4ySe3zDBSLdzVjf2qHtPotIIZAf4S+yddj9KnmbyRj1fZIXnHy1UcahF2zZt2
         If4GxtCQoDoAwur0aSe/F3YH87TVJ7vWLZGOxSBpchu45HIRpeCwI1Pqh/sTgNkkIwr1
         c85n7BaVTFhfNfCdquNoZMH8R9e8raT0zBfDM+NqqZhbnp6PKsB63gbN2jDg00sV3lxG
         5OgaUdqAt732nsBCePtQyZNY5xQNuvkTtBtjRy+UXf9xsE4ihTvYmNufkI8ogRf3UnVz
         nmdw==
X-Forwarded-Encrypted: i=1; AHgh+RrFmUJl7Am23fFa5Cugls2ECDzpmGSV99y9U0Eg1rYsweQavPTXBM/bILyIJEZ8NJ0scFx/u2OGcv9/MBU=@vger.kernel.org
X-Gm-Message-State: AFuF++m7VPdh1b0/q6svZyAyJcwLaYYEWPADesvXwu2uyvt09GalgAoC
	5GpTZyimZPHubGNOeoyvfMppxfw/5XyTu/53vR12iX2WN3tWmShEkiA7
X-Gm-Gg: AR+sD113AT9+Q9NwP+er5qoDoMRw5wbti4SBrGmw0lugidVM8daN5VN57jML54oy6EF
	hKJxQ8FORsbDxfAkXJPs8O5WeAjc/S15ak/mf9wUS3Cn+9hcoFwWy9u4rMhW6r3zSx+mQXbZsIj
	kX1RVAmBwxdK4xQEzkm4RGCBT6Qyl+BvJRxzMm7Eh0AS9nohLYQEZ7tkhs6w2UuVsQ+jC1eKIx3
	7aF4EtlaOp7q8LDZijp8lYRvwmetTv5S0XoYBB1o5QlhhUclaIYrpPOP0o+mMim20mt3TEuigGm
	xgyjncEBs1q25MrcCtw5I+mawvwTvws4fCnhtKpRcTuSGGFWrb9vTy+Mmj2Ky3SoQMd7t1STFjp
	cx/fDH6OJu+XTTqDFb+tpBfqOh3JI/ABIP+qIvt3e3tTMPQkprkXNnHbBMuZOy2IKVv7XiNHKIk
	of5zrJm1D3779jZtjGsDnOVPTEzyepz+VCoLSFZQiCeccmuKEDakj9AkrrlQZIHmflfBE=
X-Received: by 2002:a05:600c:3b0c:b0:499:b01e:911c with SMTP id 5b1f17b1804b1-499dc6ea9f4mr154197375e9.2.1787821210834;
        Thu, 27 Aug 2026 02:00:10 -0700 (PDT)
Received: from foxbook (bfk5.neoplus.adsl.tpnet.pl. [83.28.48.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dd56dfb8sm51305175e9.3.2026.08.27.02.00.09
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 27 Aug 2026 02:00:10 -0700 (PDT)
Date: Thu, 27 Aug 2026 11:00:06 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: syzbot <syzbot+fd7be5ad9795b7f29df3@syzkaller.appspotmail.com>,
 dakr@kernel.org, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, rafael@kernel.org,
 syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] INFO: task hung in unbind_store
Message-ID: <20260827110006.66b07ea4.michal.pecio@gmail.com>
In-Reply-To: <2026082307-negligent-lusty-750a@gregkh>
References: <6a8adc31.ae6ddae5.3da009.0064.GAE@google.com>
	<2026082307-negligent-lusty-750a@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 23 Aug 2026 13:46:43 +0200, Greg KH wrote:
> On Sun, Aug 23, 2026 at 04:40:33AM -0700, syzbot wrote:
> > INFO: task syz.4.23:6285 blocked for more than 143 seconds.
> >       Not tainted syzkaller #0
> > "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> > task:syz.4.23        state:D stack:27592 pid:6285  tgid:6285  ppid:6213   task_flags:0x400140 flags:0x00080002
> > Call Trace:
> >  <TASK>
> >  context_switch kernel/sched/core.c:5510 [inline]
> >  __schedule+0x17d4/0x5630 kernel/sched/core.c:7239
> >  __schedule_loop kernel/sched/core.c:7316 [inline]
> >  schedule+0x164/0x2b0 kernel/sched/core.c:7331
> >  schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7388
> >  __mutex_lock_common kernel/locking/mutex.c:726 [inline]
> >  __mutex_lock+0x7c1/0x1550 kernel/locking/mutex.c:821
> >  device_lock include/linux/device.h:1104 [inline]
> >  __device_driver_lock drivers/base/dd.c:1170 [inline]
> >  device_release_driver_internal+0x93/0x880 drivers/base/dd.c:1369
> >  unbind_store+0x1a1/0x1d0 drivers/base/bus.c:244  
> 
> Ok, I'm going to add a new TAINT flag for when unbind is written to as
> that is obviously not a normal operation and is only for debugging
> things by kernel developers.  Adding loads of work-arounds in the kernel
> for this not-real-workload-path is just not required.
> 
> If syzbot could stop hitting this path, that would be great, as it's a
> root-only thing for debugging and not something "real".

The root cause is probe() call of one USB driver (sisusbvga) taking
an eternity to complete on nonresponsive hardware, which is actually
a pretty real and not so uncommon annoying behavior.

And something is also wrong with those timeouts, because 20 times 5s
should still be less than 143 s. I asked Syzbot to try 500ms instead,
which ended up being over 3s in practice:

[  566.662036][ T6636] usb 4-1: sisusb_send_bulk_msg()
[  569.717341][ T6636] usb 4-1: sisusb_send_bulk_msg()
[  572.777761][ T6636] usb 4-1: sisusb_send_bulk_msg()
[  575.845365][ T6636] usb 4-1: sisusb_send_bulk_msg()

Same on my system, but patch below reduces the timeout to 500ms.

I have no idea what's happening here. Looks like a bug?
Is it known that jiffies are totally unreliable like that?

Regards,
Michal

--- a/drivers/usb/misc/sisusbvga/sisusbvga.c
+++ b/drivers/usb/misc/sisusbvga/sisusbvga.c
@@ -225,9 +225,13 @@ static int sisusb_bulkout_msg(struct sisusb_usb_data *sisusb, int index,
 
 	/* If OK, and if timeout > 0, wait for completion */
 	if ((retval == 0) && timeout) {
+		u64 time = ktime_get_ns();
+
 		wait_event_timeout(sisusb->wait_q,
 				(!(sisusb->urbstatus[index] & SU_URB_BUSY)),
 				timeout);
+		dev_info(&sisusb->sisusb_dev->dev, "sisusb_bulkout_msg() waited %lld\n", ktime_get_ns() - time);
+
 		if (sisusb->urbstatus[index] & SU_URB_BUSY) {
 			/* URB timed out... kill it and report error */
 			usb_kill_urb(urb);
