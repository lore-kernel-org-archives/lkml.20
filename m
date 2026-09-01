Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B8F38A72B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 02:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788230847; cv=none; b=d8oLU3hxGLOvepk+vjyJv17pXIPbsbdhxcVnuMAnPZLsakfmar3buDm8DikS8FmZQCaUTKq8Kk4jCml0l2b/IHsJUxPo3F7wftJ9aBpEyEMCC14FQOcWYlaIeEj6TPowZM1j/b4cV5mFrMZV8Gr8xGQJty+tt6fL2GIgYhiEJcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788230847; c=relaxed/simple;
	bh=ggL6n1EMEwkS4S6UQ7vxdErAuZYLohUFJ1cvZQ+rBe8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nlctEgSLji9mZ7nz4Z25tHmQIM8LNRchQZxXnpC8gMkeoJZzXkR0SOzaWmE1Bsigb+QvDobFLz1QiICaT0hOdBFUkvv/D0rpPlG+VBwHSM/UmaX5Fdv9U8HLxuuNyIGB+sbykuafzogCX1wicYX3M5Th69H/kD4nSKCFV7f1imE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Ufs06VVy; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Ufs06VVy"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-90e7d9c747eso33132576d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 19:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1788230836; x=1788835636; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z7GmLMIVwpddaX67LhA6yl9QNGeMHtdqHkTaGH2+eF8=;
        b=Ufs06VVyqR+ajz6QKsWHrYcDpTRLxxAxZjN9A4aebXmXfobQl0AzcDKD+Ik5nIqv4K
         SRzJAh6RNYY0mzRxocS+hm0cB4mloMFfrQa/NRCkHrqcsfMQCO9mk5dVMqaIdPdKnedr
         azZ8hX4wkFwmJPmi+HFF2pm58aZF+Lg/1PJdyLIMJ8n3CY8LlJ7lTvV1tYxqNCapJr0o
         kjatAMOBd3xcKUrJWAWCGtzrjx8QXubTIVu6AoMvtfRIXpXknSbFa2dpnrt8/S4oqBs1
         ZqEl3xqVdvOIJHtZQ+YvMITjsm3jjcjig6GVFFa9a9xMEEJqdEz3ldCGJhWr6G0y30wI
         7MjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788230836; x=1788835636;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z7GmLMIVwpddaX67LhA6yl9QNGeMHtdqHkTaGH2+eF8=;
        b=P9r4BKuQYrAPvfauqyCLg3HHu69JZC7tVV+8e1B5bgQz7vgsOXdGJIJAwq9Y4ploAz
         Q61P1Q7S6XXA/zK5yGFZb6WMVyAPDS7cRxY4R/xgQZOemZEMPaiooEyiWuRlFZ1tk6qe
         otoV4YgXcEygd+spgsQt+aYuLbFIPQ9AKyr33TVdPsmVBmZ7iGWljWtsVWcNkio4tp2A
         rlGKxCFm7hU3w0BA0QFa+nFXnknyu7KW51XUO0oN3JQMVvvWjovSJ89FC/ujtvGplfoN
         h27KNcu2Q1Q4m0RPr14Tra9xSDnD5UML0EgojZDy/7wt7uJnR2+FINt9PQG3wxZQZ9Ze
         Rhfw==
X-Forwarded-Encrypted: i=1; AKwUvBwdBzHMk/dNgGiDA51cIgSujoIF1xRDhWexx343d339TiygkK025BBVvvojKiqcPli6qweNZp7+pgiiEIY=@vger.kernel.org
X-Gm-Message-State: AFuF++kwQVIN8cXuleof1Nmlmh4BBWLKgEglfjynETgJPyiPyU2f+Fqi
	GFmdHZ/aX3twFDkKBD/es5DM3lIiLiOMNZ+LzLe0pO2rvhltx8LJVpMb4IXWt2wknA==
X-Gm-Gg: AYBFou3GBeAOJGihoVDmsFyTOB3DF5RlVBT0Ikt0W8MDhOK9YCFAsrEbavh8B3a+hsB
	uMIXlp1l/PJ3nkQFVdNNYUOgAmVVWmeEUg1zJqT32GF1dwTxgtpfxrSvzhVfE80juls9fzXF0Zh
	tXk9BPWP2ajofE1Sdq17ZzRcxuDyXL1CiHTxweInlwG6049neioS6mylJwmA8zhWr/sg3wO/h97
	qEoPog9/EXEFmX54K8/uj+jQCCTOrIw75DSwnLIv106tFaVCVIHOHsDnDap0gSezrRMGtY6RMrX
	Fqo8XCJRXOgXxpy4IH3fDtHoLtZdhh8MhlnipHAEzvzsBJno2e8kUP7hrYWmnbJFfqeFStBrSPN
	bs9he1s1mKXPPg3tYsT5csQ8ZL0DFb+r3oUWz3DGO/1QIsvMtj7DjFlFkzj6neHZMnz8WgBTPjH
	wMJnBG+t/LGNGsmb1l9BoQX1pHm8w7IrR54jTzbiHGixT01SGm2fGYH8YTOHSywsuTz1M3IEV1
X-Received: by 2002:a05:6214:1943:b0:90e:8465:36ac with SMTP id 6a1803df08f44-90e92983033mr72709886d6.25.1788230835692;
        Mon, 31 Aug 2026 19:47:15 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90ce44f5ad4sm98151136d6.23.2026.08.31.19.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 19:47:14 -0700 (PDT)
Date: Mon, 31 Aug 2026 22:47:12 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Minseo Kim <neck3922@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrey Konovalov <andreyknvl@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, syzkaller@googlegroups.com
Subject: Re: [BUG] usb: gadgetfs: KASAN null-ptr-deref and intermittent UAF
 in ep_aio_cancel()
Message-ID: <fb56064c-6481-44b3-88e5-8e5ff7b85703@rowland.harvard.edu>
References: <15185c2d-4544-42cc-ba0a-79dd36e82a21@rowland.harvard.edu>
 <CAFmvuTU=t5TiZSpHmF1MXpVs+3K7G1VOTDeeazwGru4+1eozBg@mail.gmail.com>
 <cd57f283-71e6-4531-a311-1180ccc22ab8@rowland.harvard.edu>
 <CAFmvuTVH=mVMZNoYnU07_WA+cBc4m+UG2BBTLwF5KWhcj-z-KA@mail.gmail.com>
 <908a5b29-e6d8-4595-b451-6c328e25c60e@rowland.harvard.edu>
 <CAFmvuTU5HnBKbve=v_C7Mhw2586rR_8qsRNua2XPokgKy_o31w@mail.gmail.com>
 <0305182d-5914-4022-a0a6-1ab4221b0a6c@rowland.harvard.edu>
 <CAFmvuTULxq6O0t7FyhEwnGVdMMpbj1yZrPN6mVRDWTgF0ODJxg@mail.gmail.com>
 <1b92cd86-fe64-43eb-9539-53a559cd14e3@rowland.harvard.edu>
 <CAFmvuTWw90k+Fvs5Ve=1nxCDSQrzH7rytY-3vjGwv=edQOCBPw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFmvuTWw90k+Fvs5Ve=1nxCDSQrzH7rytY-3vjGwv=edQOCBPw@mail.gmail.com>

On Mon, Aug 31, 2026 at 10:30:08PM +0900, Minseo Kim wrote:
> Hi Alan,
> 
> Thank you for the comments and for pointing out where my explanation was
> unclear.
> 
> > Are you saying that this test in ep_read_iter():
> >
> >         if (!iter_is_ubuf(&priv->to) && !priv->to_free) {
> >
> > is wrong, for example, the && should be || ?
> 
> No. The && condition should remain as it is. dup_iter() copies the iterator
> state into priv->to. In my tests, native PREAD and a one-segment PREADV used
> ITER_UBUF. Since ITER_UBUF has no separate iovec array to duplicate,
> dup_iter() returned NULL while the copied iterator remained valid. My
> two-segment PREADV test used ITER_IOVEC; there, a NULL return would mean that
> allocation of the duplicated iovec array failed. The iter_is_ubuf() check
> therefore distinguishes the valid NULL return for ITER_UBUF from an allocation
> failure in the ITER_IOVEC case. In a control build using ||, valid PREAD and
> both one- and two-segment PREADV submissions failed with -ENOMEM.
> 
> The issue I observed was instead in the later completion test:
> 
>         if (priv->to_free == NULL || unlikely(req->actual == 0)) {
> 
> As I understand it, this later test treats a NULL to_free pointer as meaning
> that no userspace copy is needed. In this path, however, to_free stores the
> pointer returned by dup_iter() and tracks separately allocated iterator
> backing, rather than whether the saved iterator has a destination.

Okay, I see.  I had assumed that the information about the userspace 
buffer was contained in the region that to_free points to.

> For this issue, the relevant change was to base the later copy decision on
> iov_iter_count(&priv->to); I did not change the ep_read_iter() condition. With
> the original test, native PREAD reported res=511 while the destination buffer
> remained unchanged. After this change, native PREAD and one-segment PREADV
> copied the payload correctly, and two-segment PREADV continued to work.

While that's a valid solution, it would be more straightforward to add 
an "is_read" flag to the priv structure.  If an aio operation isn't a 
read then there certainly won't be anything to copy back to userspace 
upon completion.  This doesn't require people reading the source to know 
anything about the internal details of struct iov_iter.  And it is a 
better match to the immediately preceding comment.

> My previous description of to_free as a predicate was inaccurate. I was
> referring to its later completion-side use as a copy/no-copy indicator.
> 
> > I understood that it was okay to call usb_ep_free_request() after
> > usb_ep_disable(). Was that wrong? Did you see it create any problems?
> 
> Your understanding matches the behavior I observed under dummy_hcd. For both
> PWRITE and PREAD, I kept a completed, unqueued request allocated until after
> usb_ep_disable() returned, with no intervening usb_ep_dequeue(). In each case,
> the request completed exactly once with the expected result; the subsequent
> usb_ep_free_request() produced no KASAN report or Oops.
> 
> Separately, in an intermediate version I observed usb_ep_free_request()
> running while usb_ep_disable() was still in progress. Because that version
> moved normal request cleanup into a worker, I used the existing endpoint mutex
> to prevent the worker's usb_ep_free_request() call from overlapping endpoint
> disable while I investigated the ordering. The mutex eliminated the overlap,
> but I did not reproduce a failure without it, so these tests did not establish
> that the serialization was required.

Good, so we don't need to worry about that.

> The endpoint-use ordering I could reproduce in a directed dummy_hcd diagnostic
> was different: without waiting for unlink work before endpoint disable,
> ep_unlink_worker() could call usb_ep_dequeue() while usb_ep_disable() was in
> progress. In matched PWRITE and PREAD tests, the variant without the
> pre-disable unlink-work wait produced this overlap; with the wait retained,
> usb_ep_dequeue() completed before usb_ep_disable() began.
> 
> I did not reproduce a KASAN report, Oops, or userspace failure from the
> concurrent dequeue/disable overlap itself. I retained the pre-disable wait in
> the narrower test version as a conservative interpretation of the
> usb_ep_disable() requirement that no other task be using the endpoint when it
> is called.

We don't need to be that conservative here.  And in fact, I'm not 
entirely sure what that comment in usb_ep_disable() was intended to 
mean.  Since the function doesn't cause the UDC driver's endpoint data 
structure to be deallocated, there isn't much to be careful of.

> > This is probably because you were flushing the workqueues at the wrong
> > time.
> 
> Yes. In the callback-gate test, the relevant workqueue flush returned
> while the completion callback was stopped before queueing its follow-up work.
> In the narrower test version, I incremented aio_producers before
> usb_ep_queue() and decremented it only after the callback had either queued
> the required follow-up work or completed the immediate AIO result without
> leaving deferred work to publish. If usb_ep_queue() failed, the submission
> path decremented it directly. With that change, gadgetfs_unbind() remained
> blocked in the producer wait while the callback was gated. It proceeded to
> flush the completion workqueue only after the callback queued the follow-up
> work.
> 
> In the delayed-worker test, module unload completed before the running
> unlink_work returned. This confirmed that module unload must not complete
> while such work is still running.
> 
> > For the final submission, I think the workqueue management stuff should
> > go into its own separate patch.
> 
> Separating the workqueue management changes from the AIO race fixes makes
> sense. Thank you also for the reminder about -p.

So let's worry about the workqueue stuff later and concentrate for now 
just on fixing the AIO races.

> > Second, why did you change ep_aio_complete() to make it queue up
> > ep_user_copy_worker() even when nothing needed to be copied to
> > userspace?
> 
> My reason for routing every completion through ep_user_copy_worker() was to
> make a common deferred completion and request-cleanup stage visible to a
> workqueue flush during teardown, not because every request needed a userspace
> copy. In the normal non-unlink path of that cumulative design, the worker
> released the USB request and epdata reference before calling ki_complete(),
> and then published AIO_GIVEN_BACK. Since ki_complete() could drop the last AIO
> file reference and allow ep_release() to begin, the intent was to prevent
> teardown from passing the completion-work flush before that cleanup had
> finished. A gate placed between cleanup and ki_complete() confirmed that the
> flush covered this no-copy PWRITE cleanup: unbind reached
> flush_workqueue(gadgetfs_copy_wq) but did not return until the worker was
> released.
> 
> I agree that using the worker for every completion was broader than necessary
> for copy handling. The narrower behavior I tested retains aio_producers but
> queues copy work only when iov_iter_count(&priv->to) and req->actual are both
> nonzero. Nonzero PREAD and the one- and two-segment PREADV cases invoked the
> copy worker, while PWRITE, PWRITEV, and zero-length reads and writes did not.
> This indicates that no-copy paths do not need ep_user_copy_worker() merely for
> copy handling. Their cleanup ordering and the separate teardown lifetime
> issue can be considered independently of that routing decision.

And since your decision was based on handling the workqueue flushing, it 
can be put off until later.

If you trim your patch down to the parts that only target the AIO races, 
do you get anything significantly different from my version?  I did see 
that you added or changed a few comments, and I have updated my version 
of the patch in a couple of respects, but overall yours must end up 
being pretty similar to mine.  Please point out any differences you 
believe are worth mentioning.  My current version is below.

> Looking back, trying to address all of the observed issues in one cumulative
> patch made it harder to separate and review the purpose of each change.
> Considering the issues independently may also make it easier to identify a
> simpler approach for some of them. I hope these clarifications and test
> results are useful.

I'm sure they will be.

Alan Stern


Index: usb-devel/drivers/usb/gadget/legacy/inode.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/legacy/inode.c
+++ usb-devel/drivers/usb/gadget/legacy/inode.c
@@ -236,6 +236,8 @@ static void put_ep (struct ep_data *data
 static const char *CHIP;
 static DEFINE_MUTEX(sb_mutex);		/* Serialize superblock operations */
 
+static DEFINE_SPINLOCK(aio_lock);	/* Protect aio cancellation info */
+
 /*----------------------------------------------------------------------*/
 
 /* NOTE:  don't use dev_printk calls before binding to the gadget
@@ -433,40 +435,105 @@ static long ep_ioctl(struct file *fd, un
 
 /* ASYNCHRONOUS ENDPOINT I/O OPERATIONS (bulk/intr/iso) */
 
+enum aio_req_state {
+	AIO_SUBMITTING,
+	AIO_RUNNING,
+	AIO_COMPLETED,
+	AIO_GIVEN_BACK,
+};
+
+enum aio_cancel_state {
+	AIO_NOT_CANCELLED,
+	AIO_UNLINKING,
+	AIO_UNLINK_DONE,
+};
+
 struct kiocb_priv {
 	struct usb_request	*req;
 	struct ep_data		*epdata;
+	struct usb_ep		*ep;
 	struct kiocb		*iocb;
 	struct mm_struct	*mm;
-	struct work_struct	work;
+	struct work_struct	copy_work;
+	struct work_struct	unlink_work;
 	void			*buf;
 	struct iov_iter		to;
 	const void		*to_free;
 	unsigned		actual;
+	enum aio_req_state	req_state;
+	enum aio_cancel_state	cancel_state;
+	bool			is_read;
 };
 
-static int ep_aio_cancel(struct kiocb *iocb)
+static void ep_unlink_worker(struct work_struct *work)
 {
-	struct kiocb_priv	*priv = iocb->private;
+	struct kiocb_priv	*priv;
+	struct usb_request	*req;
 	struct ep_data		*epdata;
-	int			value;
+	struct usb_ep		*ep;
+	enum aio_req_state	req_state;
 
-	local_irq_disable();
+	priv = container_of(work, struct kiocb_priv, unlink_work);
+	req = priv->req;
 	epdata = priv->epdata;
-	// spin_lock(&epdata->dev->lock);
-	if (likely(epdata && epdata->ep && priv->req))
-		value = usb_ep_dequeue (epdata->ep, priv->req);
-	else
-		value = -EINVAL;
-	// spin_unlock(&epdata->dev->lock);
-	local_irq_enable();
+	ep = priv->ep;
 
-	return value;
+	usb_ep_dequeue(ep, req);
+
+	spin_lock_irq(&aio_lock);
+	req_state = priv->req_state;
+	priv->cancel_state = AIO_UNLINK_DONE;
+	spin_unlock_irq(&aio_lock);
+
+	/*
+	 * req and epdata are freed after unlinking and completion are both done.
+	 * priv is freed after unlinking and giveback are both done.
+	 */
+	if (req_state >= AIO_COMPLETED) {
+		/* priv may have been freed already */
+		usb_ep_free_request(ep, req);
+		put_ep(epdata);
+		if (req_state == AIO_GIVEN_BACK)
+			kfree(priv);
+	}
+}
+
+static int ep_aio_cancel(struct kiocb *iocb)
+{
+	struct kiocb_priv	*priv;
+	unsigned long		flags;
+
+	spin_lock_irqsave(&aio_lock, flags);
+	priv = iocb->private;
+	if (!priv || priv->cancel_state != AIO_NOT_CANCELLED) {
+		spin_unlock_irqrestore(&aio_lock, flags);
+		return -EINVAL;		/* Already completed or cancelled */
+	}
+	if (priv->req_state == AIO_SUBMITTING) {
+		priv->cancel_state = AIO_UNLINK_DONE;
+		spin_unlock_irqrestore(&aio_lock, flags);
+		return 0;	/* ep_aio() will call us again if needed */
+	}
+
+	priv->cancel_state = AIO_UNLINKING;
+	spin_unlock_irqrestore(&aio_lock, flags);
+
+	/*
+	 * We are called with the aio core holding iocb's context lock.
+	 * usb_ep_dequeue() is allowed to run synchronously, calling the
+	 * completion handler ep_aio_complete() before it returns.
+	 * But ep_aio_complete() may call iocb->kio_complete(), which
+	 * tries to acquire the context lock, leading to deadlock.
+	 * For this reason, do the dequeue operation in a work routine.
+	 */
+	INIT_WORK(&priv->unlink_work, ep_unlink_worker);
+	schedule_work(&priv->unlink_work);
+	return 0;
 }
 
 static void ep_user_copy_worker(struct work_struct *work)
 {
-	struct kiocb_priv *priv = container_of(work, struct kiocb_priv, work);
+	struct kiocb_priv *priv = container_of(work, struct kiocb_priv, copy_work);
 	struct mm_struct *mm = priv->mm;
 	struct kiocb *iocb = priv->iocb;
 	size_t ret;
@@ -482,46 +549,62 @@ static void ep_user_copy_worker(struct w
 
 	kfree(priv->buf);
 	kfree(priv->to_free);
-	kfree(priv);
+
+	spin_lock_irq(&aio_lock);
+	priv->req_state = AIO_GIVEN_BACK;
+	if (priv->cancel_state != AIO_UNLINKING)
+		kfree(priv);
+	spin_unlock_irq(&aio_lock);
 }
 
 static void ep_aio_complete(struct usb_ep *ep, struct usb_request *req)
 {
 	struct kiocb		*iocb = req->context;
 	struct kiocb_priv	*priv = iocb->private;
-	struct ep_data		*epdata = priv->epdata;
+	enum aio_req_state	new_req_state;
+	enum aio_cancel_state	cancel_state;
 
-	/* lock against disconnect (and ideally, cancel) */
-	spin_lock(&epdata->dev->lock);
-	priv->req = NULL;
-	priv->epdata = NULL;
+	/* Prevent future cancellation */
+	spin_lock(&aio_lock);
+	iocb->private = NULL;
+	spin_unlock(&aio_lock);
 
 	/* if this was a write or a read returning no data then we
 	 * don't need to copy anything to userspace, so we can
 	 * complete the aio request immediately.
 	 */
-	if (priv->to_free == NULL || unlikely(req->actual == 0)) {
+	if (!priv->is_read || unlikely(req->actual == 0)) {
 		kfree(req->buf);
 		kfree(priv->to_free);
-		kfree(priv);
-		iocb->private = NULL;
 		iocb->ki_complete(iocb,
 				req->actual ? req->actual : (long)req->status);
+		new_req_state = AIO_GIVEN_BACK;
 	} else {
 		/* ep_copy_to_user() won't report both; we hide some faults */
 		if (unlikely(0 != req->status))
-			DBG(epdata->dev, "%s fault %d len %d\n",
+			DBG(priv->epdata->dev, "%s fault %d len %d\n",
 				ep->name, req->status, req->actual);
 
 		priv->buf = req->buf;
 		priv->actual = req->actual;
-		INIT_WORK(&priv->work, ep_user_copy_worker);
-		schedule_work(&priv->work);
+		new_req_state = AIO_COMPLETED;
 	}
 
-	usb_ep_free_request(ep, req);
-	spin_unlock(&epdata->dev->lock);
-	put_ep(epdata);
+	spin_lock(&aio_lock);
+	priv->req_state = new_req_state;
+	cancel_state = priv->cancel_state;
+	spin_unlock(&aio_lock);
+
+	if (new_req_state == AIO_COMPLETED) {
+		INIT_WORK(&priv->copy_work, ep_user_copy_worker);
+		schedule_work(&priv->copy_work);
+	}
+	if (cancel_state != AIO_UNLINKING) {
+		usb_ep_free_request(ep, req);
+		put_ep(priv->epdata);
+		if (new_req_state == AIO_GIVEN_BACK)
+			kfree(priv);
+	}
 }
 
 static ssize_t ep_aio(struct kiocb *iocb,
@@ -532,11 +615,12 @@ static ssize_t ep_aio(struct kiocb *iocb
 {
 	struct usb_request *req;
 	ssize_t value;
+	struct usb_ep *ep;
+	bool need_unlink = false;
 
 	iocb->private = priv;
 	priv->iocb = iocb;
 
-	kiocb_set_cancel_fn(iocb, ep_aio_cancel);
 	get_ep(epdata);
 	priv->epdata = epdata;
 	priv->actual = 0;
@@ -547,10 +631,12 @@ static ssize_t ep_aio(struct kiocb *iocb
 	 */
 	spin_lock_irq(&epdata->dev->lock);
 	value = -ENODEV;
-	if (unlikely(epdata->ep == NULL))
+	ep = epdata->ep;
+	if (unlikely(ep == NULL))
 		goto fail;
+	priv->ep = ep;
 
-	req = usb_ep_alloc_request(epdata->ep, GFP_ATOMIC);
+	req = usb_ep_alloc_request(ep, GFP_ATOMIC);
 	value = -ENOMEM;
 	if (unlikely(!req))
 		goto fail;
@@ -560,12 +646,45 @@ static ssize_t ep_aio(struct kiocb *iocb
 	req->length = len;
 	req->complete = ep_aio_complete;
 	req->context = iocb;
-	value = usb_ep_queue(epdata->ep, req, GFP_ATOMIC);
+
+	priv->req_state = AIO_SUBMITTING;
+	priv->cancel_state = AIO_NOT_CANCELLED;
+
+	/* Not allowed to manipulate the aio context while holding dev->lock */
+	++epdata->dev->udc_usage;
+	spin_unlock_irq(&epdata->dev->lock);
+
+	kiocb_set_cancel_fn(iocb, ep_aio_cancel);
+	value = usb_ep_queue(ep, req, GFP_KERNEL);
+
+	spin_lock_irq(&epdata->dev->lock);
+	--epdata->dev->udc_usage;
+
 	if (unlikely(0 != value)) {
-		usb_ep_free_request(epdata->ep, req);
+		spin_lock(&aio_lock);
+		iocb->private = NULL;
+		spin_unlock(&aio_lock);
+
+		usb_ep_free_request(ep, req);
 		goto fail;
 	}
 	spin_unlock_irq(&epdata->dev->lock);
+
+	spin_lock_irq(&aio_lock);
+	if (iocb->private != NULL) {
+		priv->req_state = AIO_RUNNING;
+
+		/* Cancelled before or just after submission? */
+		if (priv->cancel_state == AIO_UNLINK_DONE) {
+			priv->cancel_state = AIO_NOT_CANCELLED;
+			need_unlink = true;
+		}
+	}			/* Otherwise already completed */
+	spin_unlock_irq(&aio_lock);
+
+	if (need_unlink)	/* Redo cancel that was too early */
+		ep_aio_cancel(iocb);
+
 	return -EIOCBQUEUED;
 
 fail:
@@ -618,6 +737,7 @@ ep_read_iter(struct kiocb *iocb, struct
 		value = -ENOMEM;
 		if (!priv)
 			goto fail;
+		priv->is_read = true;
 		priv->to_free = dup_iter(&priv->to, to, GFP_KERNEL);
 		if (!iter_is_ubuf(&priv->to) && !priv->to_free) {
 			kfree(priv);
