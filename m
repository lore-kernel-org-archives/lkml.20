Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571364A9D42
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 19:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789154566; cv=none; b=opF0bHKGUzRISRZrbNBEWme0m3IlJZwT/6FUOPuGFpSIe+YmsEbno2aQMvgkV44uxOC+/bb1arXzzF+dI7UyI2M44O9lPkt+X3P1W0Rgh25dRed04gkwI0YMLu9Lcx5XbS67lSfZCkEeWe6cRQTt3H98eIhwI5ZJXhszCyCmPUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789154566; c=relaxed/simple;
	bh=SjqVUcClyaoSghgoqURaG31bIRC48pa5N+lDRfufibY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k7lyU/TRHevWKJ/dpU3CW8Ba9cmn66WDE3U2o412uFH0twkPOdq2t4Y3EkucGQpOuv0oKG+M7XBZjhHwe4T4L2EkWPynDHPFb7WqBy86cJGcXQtM02N20gOcA7gsCeEMzghJdPpEN1mS/17Cae0ntBMa33f5vlu9F6Ybvgs/MK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=crUKiDpF; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="crUKiDpF"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-92edb12cdf2so90424885a.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1789154554; x=1789759354; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M0EoHccTp+TMQFIefzO5qRUOI8W90Xabolm9/fCqvXs=;
        b=crUKiDpFg8Dd5itc+sev4/9iXHHq3u5AMmfIZRpeRosIEroQiTHxkuXr42o0MLQxqj
         J5pdeZPuwcgxchAHiejrnGOUR/5Je8Ht86DM8yROjbA+MI2cVdx8VCJgdnQ04QVdGQQa
         wNgx7NSFgJvyD+gqzQ7JYG1vfIaa25bKi+G4r7GmfINwJx5coEMY/eHj2et5+IBliTwY
         SfTIrzQYFUcD3z9DUhVnPXh6dh90BL+2FDQWVWCPbHL+Z5Dj8mfAUjVurJHq0Z0p2jkj
         PInSwk1uT166ROiPsdfu62flheS9SwMNSfSUfUpd72m3B0+dP5EeoWgAeyn0sd3G85p5
         rCsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789154554; x=1789759354;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M0EoHccTp+TMQFIefzO5qRUOI8W90Xabolm9/fCqvXs=;
        b=aiK1oMdN9j6fzYgruDXGuI/HkrTcg+HU9I9TkmZ1qvNbz2dyZFxgzSrWtH1ohpbFy6
         p9HOsUixMqMXuImrADfsA8aGHyMQZhDeQ9Fv6a6jzQhnFASKGSi7y6FE4y+x+ROR7dLZ
         AGgTsYFZU0J3GDeWTbX45reaW2QPhrr9rybwNWMAbUPTycOMhIQFB5IbTPYZTkus2QcE
         6X25fGNf98uCTb1YaIDvdvGpbH9qR1lLc3xrFijenREzc4AjSjWc5nKFrfOQOJ0OklB3
         HSSxrmcmr0KPEw5sFZAho75b0dkjje5fQMGgHP9ff5OfzEU67dZEPdSq9qgQRtcBmYU0
         IMGQ==
X-Forwarded-Encrypted: i=1; AKwUvBw02+/Zu5FbUWMLzM/HSRE+uPKnwBDm7//Tinjdw8u3jiLz5wJDUNOBgX9d18XPCj7wjKa001c7J1U/zl0=@vger.kernel.org
X-Gm-Message-State: AFuF++llxw50AKusRq13eGLTcALnicjOnS2tcIA3YqHuDwW91iFokpLF
	mj0SGWH+QfY0jDyWks/+biZzwtJ18p37qx1mRmEIcf8dwbbjeIUIdJIjI1GTatRm1g==
X-Gm-Gg: AYBFou11xILiyrDbNbfL+LpOCXrLjL2for8g/WxdxGuUnu4o2stWuFQ1CQ14qgaICdq
	TIOIRLa0XcRqtv9ssG4J4eAQ/SP1XshVurGEBGjVFJlNguKyxCxdbMU3fUSs+XDVU/xyOELQ73U
	zCqpxIMqg9NFWMuNfxJafQ/rlgS/ekjAXAXT8T1s3LDqoJaX3lObdHQGxyy4if10w+36UEMsy3c
	aBea671LCCA0+1jsY+Ckh0lXtzawPGYhU7jzXC02Ber1CHSMG6RMl5p7PN+TcM+Y4RUzxHbcxLc
	b3Ngrk70Xr+grAaaCCc20FDXQVPkMiOxi/CkbcVfVF0ERUJXqAsl9wKRqrIrxKgKIuOv2DQ0xK7
	sQjvvJIsa9OVJoorYQf8COZ8zbGE4GMkwZJAKKyNQTlvNYmGEZ9DtgKrqAYreQofQ9R2pTaFh+W
	F9LYZrfXjVpumCxOkGcV9bf3R+Px1KUXIUKFcOeMYsM0/54UkO+MdjJkAdyjViPBoODUcZzeTC
X-Received: by 2002:a05:620a:7087:b0:939:15e:1a5 with SMTP id af79cd13be357-939ea24729bmr820094985a.35.1789154549125;
        Fri, 11 Sep 2026 12:22:29 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e8080404sm312628785a.28.2026.09.11.12.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 12:22:27 -0700 (PDT)
Date: Fri, 11 Sep 2026 15:22:24 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Minseo Kim <neck3922@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrey Konovalov <andreyknvl@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, syzkaller@googlegroups.com
Subject: Re: [BUG] usb: gadgetfs: KASAN null-ptr-deref and intermittent UAF
 in ep_aio_cancel()
Message-ID: <0b6b13ff-789e-4ba4-9765-1052a154ef27@rowland.harvard.edu>
References: <1b92cd86-fe64-43eb-9539-53a559cd14e3@rowland.harvard.edu>
 <CAFmvuTWw90k+Fvs5Ve=1nxCDSQrzH7rytY-3vjGwv=edQOCBPw@mail.gmail.com>
 <fb56064c-6481-44b3-88e5-8e5ff7b85703@rowland.harvard.edu>
 <CAFmvuTXWxQJUZfAAC=vs5QM=myDLE-o0jZZ8OXdqiGioPkRwfA@mail.gmail.com>
 <f928b74b-ce57-4454-bdd4-511b823bf742@rowland.harvard.edu>
 <CAFmvuTXwUiap39-FHv6aqGbJVzORRx8tV1QfN0BDjJaPsbfKHg@mail.gmail.com>
 <cec9b2a0-3454-45a6-b128-51d708cc8cbc@rowland.harvard.edu>
 <CAFmvuTUwGr-=joWrsYMu-Ra3XpHTe_HFhaY5inJnhg=e5b=1PA@mail.gmail.com>
 <1a93bb26-9ded-4b71-b409-62896a2681a6@rowland.harvard.edu>
 <CAFmvuTUogd8MyQM02VpM7iHaopzrOoex+X-McQE28X1fgb_AeQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFmvuTUogd8MyQM02VpM7iHaopzrOoex+X-McQE28X1fgb_AeQ@mail.gmail.com>

On Fri, Sep 11, 2026 at 11:00:00PM +0900, Minseo Kim wrote:
> Hi Alan,
> 
> Thank you for the questions. I reran the tests to distinguish the
> request's endpoint-queue state from the callback's execution state, and
> the unbind flush from workqueue destruction during module cleanup.
> 
> > I didn't think this was possible.  gadgetfs_unbind() calls
> > destroy_ep_files() before doing the flush, and destroy_ep_files() calls
> > usb_ep_disable() for each active endpoint.  usb_ep_disable() doesn't
> > return until the completion handlers for all the outstanding requests on
> > the endpoint have finished.  This means no copy_work items should have
> > been left to queue when the flush occurred.
> 
> With both patches applied, this ordering was possible in the dummy_hcd
> test because the target request had already been removed from its
> endpoint queue before ep_aio_complete() ran. When gadgetfs_unbind()
> subsequently called destroy_ep_files(), dummy_disable() found the
> endpoint queue empty. The request associated with the already-running
> callback was no longer on that queue, so nuke() had no queued request to
> give back and dummy_disable() returned while the callback was still held
> at the gate. The unbind flush then returned before the callback queued
> copy_work.

Aha!  In other words, usb_ep_disable() doesn't guarantee that the 
completion handlers for all outstanding requests on the endpoint have 
finished -- it only guarantees that they have started.  That's an 
important difference.  Guess I should update the documentation for 
that routine.

> I confirmed this with markers recording the request and endpoint
> pointers. The gate was inside ep_aio_complete(), after the request had
> already been removed from its endpoint queue. It used a bounded,
> non-sleeping loop. dummy_hcd had already released dum->lock before
> calling usb_gadget_giveback_request().
> 
> In a control with the host-side transfer delayed, the request remained
> queued when usb_ep_disable() began. dummy_disable() called nuke(), which
> removed it and invoked its completion callback through
> usb_gadget_giveback_request(). While I held the callback at entry,
> neither usb_ep_disable() nor the ep0 close returned. After I released the
> gate, the callback returned before usb_ep_disable() did, matching your
> expectation for this pending-request case. The AIO request produced
> exactly one completion with res=-ESHUTDOWN.
> 
> In a separate run with GadgetFS still mounted, the unbind flush and ep0
> close returned while the callback was held before queuing copy_work. The
> reproducer had no GadgetFS file descriptors left open in userspace, but
> the module usage count was 2. rmmod was rejected because gadgetfs was in
> use, and gadgetfs_cleanup() had not begun. After I released the callback
> and the reproducer exited, the count was 1; subsequent unmount and rmmod
> succeeded.
> 
> > What prevented rmmod from completing after iocb->ki_complete() had
> > finished?  Was it waiting for the flush to finish?  If any additional
> > work items were added to the queue after the flush started, they should
> > not have blocked the flush.
> 
> In a separate worker-tail run using the same late-queueing ordering, the
> unbind flush had already returned before the callback queued copy_work.
> I then held the worker immediately after iocb->ki_complete() returned.
> The module usage count was zero before rmmod started. When rmmod was
> started, it waited in destroy_workqueue() during module cleanup, not in
> the earlier unbind flush. The relevant part of the blocked rmmod task's
> stack was:
> 
>     __flush_workqueue
>     drain_workqueue
>     destroy_workqueue
>     gadgetfs_cleanup [gadgetfs]
>     __do_sys_delete_module
> 
> The __flush_workqueue frame came from drain_workqueue(), which was
> called by destroy_workqueue(). Thus, the late copy_work did not block
> the earlier flush_workqueue() in gadgetfs_unbind(); it was already
> running when gadgetfs_cleanup() called destroy_workqueue(), and
> drain_workqueue() waited for it instead. Markers confirmed that
> destroy_workqueue() returned only after I released the worker, and rmmod
> then completed successfully.
> 
> This is consistent with the entry-gated ep_unlink_worker result in my
> previous message. In that test, unlink_work had already been queued
> before the unbind flush began, so the flush and the ep0 close remained
> blocked until I released the worker. In the late-queueing run above,
> copy_work was not queued until after the unbind flush had returned. A
> separate control with copy_work queued before the flush likewise kept
> the unbind flush and the ep0 close blocked until I released the worker.
> 
> Thank you for asking me to check this more closely.

These results explain a lot.  They mean that flushing the workqueue in 
gadgetfs_unbind() not only doesn't do what we want, it also isn't 
necessary -- because destroy_workqueue() will automatically do a flush 
for us.

Also, it isn't really necessary to flush the workqueue when the user 
program closes ep0 or unmounts the gadgetfs filesystem.  We merely have 
to make sure that when the module is unloaded, no work items are running 
or will be started.

Here's a revised version of the second patch, which omits the 
flush_workqueue() call from gadgetfs_unbind().  I expect it will 
eliminate the "module unloaded while work items are still running" 
problem just as well as the original version did.

Alan Stern



Index: usb-devel/drivers/usb/gadget/legacy/inode.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/legacy/inode.c
+++ usb-devel/drivers/usb/gadget/legacy/inode.c
@@ -237,6 +237,7 @@ static const char *CHIP;
 static DEFINE_MUTEX(sb_mutex);		/* Serialize superblock operations */
 
 static DEFINE_SPINLOCK(aio_lock);	/* Protect aio cancellation info */
+static struct workqueue_struct *gadgetfs_wq;
 
 /*----------------------------------------------------------------------*/
 
@@ -514,9 +515,7 @@ static int ep_aio_cancel(struct kiocb *i
 		spin_unlock_irqrestore(&aio_lock, flags);
 		return 0;	/* ep_aio() will call us again if needed */
 	}
-
 	priv->cancel_state = AIO_UNLINKING;
-	spin_unlock_irqrestore(&aio_lock, flags);
 
 	/*
 	 * We are called with the aio core holding iocb's context lock.
@@ -527,7 +526,9 @@ static int ep_aio_cancel(struct kiocb *i
 	 * For this reason, do the dequeue operation in a work routine.
 	 */
 	INIT_WORK(&priv->unlink_work, ep_unlink_worker);
-	schedule_work(&priv->unlink_work);
+	queue_work(gadgetfs_wq, &priv->unlink_work);
+
+	spin_unlock_irqrestore(&aio_lock, flags);
 	return 0;
 }
 
@@ -597,7 +598,7 @@ static void ep_aio_complete(struct usb_e
 
 	if (new_req_state == AIO_COMPLETED) {
 		INIT_WORK(&priv->copy_work, ep_user_copy_worker);
-		schedule_work(&priv->copy_work);
+		queue_work(gadgetfs_wq, &priv->copy_work);
 	}
 	if (cancel_state != AIO_UNLINKING) {
 		usb_ep_free_request(ep, req);
@@ -2245,10 +2246,17 @@ static int __init gadgetfs_init (void)
 {
 	int status;
 
+	gadgetfs_wq = alloc_workqueue("gadgetfs", WQ_PERCPU, 0);
+	if (!gadgetfs_wq)
+		return -ENOMEM;
+
 	status = register_filesystem (&gadgetfs_type);
-	if (status == 0)
-		pr_info ("%s: %s, version " DRIVER_VERSION "\n",
-			shortname, driver_desc);
+	if (status) {
+		destroy_workqueue(gadgetfs_wq);
+		return status;
+	}
+
+	pr_info("%s: %s, version " DRIVER_VERSION "\n", shortname, driver_desc);
 	return status;
 }
 module_init (gadgetfs_init);
@@ -2257,6 +2265,7 @@ static void __exit gadgetfs_cleanup (voi
 {
 	pr_debug ("unregister %s\n", shortname);
 	unregister_filesystem (&gadgetfs_type);
+	destroy_workqueue(gadgetfs_wq);
 }
 module_exit (gadgetfs_cleanup);
 

