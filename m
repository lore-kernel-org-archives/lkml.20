Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94A845DF7A
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 20:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787949017; cv=pass; b=lQ/C6DqdGL7rfRJkXkfxrvpeB+TJxwfBIAlaC+3f4BKw0YpLPpZNp/fcjW5/64xG6E3QJgSN6dTvmyc5Kawr3/pS5dJP4zanXJSCmQfyeec/cu7wm4KLb3uXyDj9baMPvTInkl9KtTRPaKIHSCxs/ht8QAELnyYYPg/OY4tcX2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787949017; c=relaxed/simple;
	bh=NT1Nkch9J96Hxhyfuw4soFgaM2MDR2va6gp8hp3INbA=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bgVvZR+W0+PvKMFspKHW8QxJKJGyUYOMP1MaQGZLBQxK6tV7zB5RPTmzmfk8NOYU4iJM6vf2JgG6B2uH9HSI9FQmQ45QUXbWLVn6r+8ocI3fCMTv4Dw89UexGapFEyphyUziOwbMXVnhD5ncl0df7m9msv0TwHv6/1Qyzof1bK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dHrR8AEl; arc=pass smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dHrR8AEl"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-90c522298d2so16225106d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 13:30:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787949013; cv=none;
        d=google.com; s=arc-20260327;
        b=nmK9Y8RFju/+Afm6LpLGiPwe3f87F8T5Ut6N4w7Vt/QD76lIuHDdGkM+Ps3La1y2Y+
         J/Ko8BgGs5PLV62hGgf4de3l6MYSjqy357VG8Rnci6xGJY2ICEb2kpVS/GcVcZgmagoj
         0r248ZxsFsPjhU/7qeV22fe1aSV7gwcTGulyR6U1hHET4URwe1jlLJ08wvspAgkEXLbu
         hxJtdZsPvhcVHCgy/Yo225HH5Lx56CjNiht52LkKKwbPs4eeuQgXocV6e4vFbIwGx8sQ
         mG/xLPYTzBD5aaoFZyL9an2/5wFJksvOiKKurBcf0Fv8zya6qOBadrTspvNUp6Wawjfc
         geMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=wh5HftmFnHdxEhTDeXHvttYUVYdPN/8ePuQlW+EUG74=;
        fh=NvQxS/X9UE7w1GsWM3V/G95OzX9hZigOmTaklbnhv70=;
        b=TUEOSzBMNcNWeaiHDfOnBpgkNeaTEhDjqR6HhFPzvziHKQw/3rNkUDQk9xKgk1My2p
         5bia0Tq8VE/fYc0A4QVnEj3lXbIUKvsskSvdaq5x8K9kushMNcPHafVH/tZLitbFFXh4
         XriAqLzPtjGGoWiPs8jv1prmeRIFMA2nU7ld0dW3T5p+sa9zjGS5aOTIaAnz3rZLm2gd
         ct6i15wsLkHDFyKg1g5x93vZ8SnTDQc4Gtg2ADcDagPzBA+jDDSiFMFZQ7A0pCWZNocn
         C7eo6kqOpSXVLFu2bGmtsplKrd/EIYsrQESGov38xabsObvd5cL0G8cLds/gEgYzi6Om
         20XQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787949013; x=1788553813; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wh5HftmFnHdxEhTDeXHvttYUVYdPN/8ePuQlW+EUG74=;
        b=dHrR8AEl+ETRGU6/8hoH+WLtnE7ld31Wp2EJl0fmk3Q2rZhzcCzTRFuodB4JPosStf
         NioVxb8lUKnWeXwbRDW/ei+TeJGElHbskSRpcs3ccubpgVGqlyI8V5bjkGXBBufe6Uox
         8zoEBQ27RNwe+kAVtxKdlgGLiCHPd1KmeUNgOzo1vEsMIhgxqtESEhgyqqRTZbnGSqPo
         BRYXlrOZa2aWP2xGqNDMk4VuyaPONn15lRJIGAKROw1EG9Egdf77Rnb1xT47qPqVWzQM
         pxAU0hBZpgyuVlqPDZJgU39D41URJtMGuU+vyS6JmrdznHg1GFwNvKF3GhAps2cKZaNi
         nq+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787949013; x=1788553813;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wh5HftmFnHdxEhTDeXHvttYUVYdPN/8ePuQlW+EUG74=;
        b=jkbyAMrIcF8aarAuC/7TyfmSvjvUYd/LD7ozYVi79AtEM1RR0/cZwT+dQhlNPuY58W
         db7xdgCRVs0q6VOEvtiJWoubtgWqPuS2n8GN7tZOhPeniMxaTYgGMj+00r1nX4Wmuttp
         YaVjGB7546D9GjcFsixYvQlCxTfhy3cxF0vSDCMBRgZP/gJtJcDmNRnXABNtX5oUjRTC
         87b0WOYSXHFoDfV7fg19sjjizV9wGtpV2MatN3a1pqQgUOpvOArGVjGBkLZi0VjKqciF
         DqQHR2TLsMrTe5LK6bxsyJ3OPxMxYWQz1vLuEdioFXQNj9HOVyG2GeN2h8TqSotQTKEW
         zQmw==
X-Forwarded-Encrypted: i=1; AHgh+RoXt9twycurYfO2weePjRuN1aZ5W4UeA3HJBktRQnVVyuLHQXsgjjwkbMYEVKv/SbWp8ZqAzZGjG1TPu74=@vger.kernel.org
X-Gm-Message-State: AFuF++kdNn0BPcB+7MdT0jF7FT7RFPAWzsKgMDx9ErN2Lxk1JTwMhXfV
	mUsMb0F6SjYVtJTciyY+qBPhtkbJRvx48uzjm368UpfhO8eHRaaM79Px5TVGHL3O8/+ANf9ZQdE
	AwDk3EhBwwwlUHSRcO5vTyvYvfFkJdDs=
X-Gm-Gg: AR+sD11olYLf0lTSbkfw1FVT9x3G69X1vWPj1tpCwxVCojJcXS49IApiVN7Qp3ZuRrM
	MDllQbDXVd3wo20t0Tl+oF2yXvFk9d0oCZBjeRVm+2Srk5MCLCKuuuVk3rKMInEDxHyeiTrnjdy
	kcQxYL4VrR3Ui10LlnE3oJZ3b/RLsdCGVSJeSeEX1SRls2t3YbInzWojbsYw7/pXKRHBL1+/1Rv
	f84Djo4UvCPAMQ0zmpS4t0ZzrLwE96OB7kKWwExQRN+3PRmHT+aBa4eXfhXTcCNuIDckcFxYIlx
	Qur9agMw+P9z+Mwy0wHmfnuRuQ3XeaHWdnvIujJ4z9Y=
X-Received: by 2002:a05:6214:c87:b0:8ee:efa3:4466 with SMTP id
 6a1803df08f44-90ce0f06ea2mr104504396d6.28.1787949012514; Fri, 28 Aug 2026
 13:30:12 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 28 Aug 2026 15:30:10 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 28 Aug 2026 20:29:26 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: neck3922@gmail.com
In-Reply-To: <0305182d-5914-4022-a0a6-1ab4221b0a6c@rowland.harvard.edu>
References: <CAFmvuTXvwuUrfbvsAQ_VvC9jH5iS62J+Ei23TD0NfQ_igFRJ_A@mail.gmail.com>
 <6761b47f-0230-4f3e-942c-26ed8dd6d0d4@rowland.harvard.edu>
 <CAFmvuTW2cfj5dzkRR8ymenWoA7tw1WAYsMitorvppTwcZ+xfbg@mail.gmail.com>
 <e8655e37-02b3-40ef-9ce0-98c8fa25481d@rowland.harvard.edu>
 <15185c2d-4544-42cc-ba0a-79dd36e82a21@rowland.harvard.edu>
 <CAFmvuTU=t5TiZSpHmF1MXpVs+3K7G1VOTDeeazwGru4+1eozBg@mail.gmail.com>
 <cd57f283-71e6-4531-a311-1180ccc22ab8@rowland.harvard.edu>
 <CAFmvuTVH=mVMZNoYnU07_WA+cBc4m+UG2BBTLwF5KWhcj-z-KA@mail.gmail.com>
 <908a5b29-e6d8-4595-b451-6c328e25c60e@rowland.harvard.edu>
 <CAFmvuTU5HnBKbve=v_C7Mhw2586rR_8qsRNua2XPokgKy_o31w@mail.gmail.com> <0305182d-5914-4022-a0a6-1ab4221b0a6c@rowland.harvard.edu>
Date: Fri, 28 Aug 2026 15:30:10 -0500
X-Gm-Features: AcwNN1Uno2ELLbI6dTQ3qKG2x-hqUcx0_0hAexBdJ4YlBYaTOsXGRt5y4cdfGFQ
Message-ID: <CAFmvuTULxq6O0t7FyhEwnGVdMMpbj1yZrPN6mVRDWTgF0ODJxg@mail.gmail.com>
Subject: Re: [BUG] usb: gadgetfs: KASAN null-ptr-deref and intermittent UAF in ep_aio_cancel()
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrey Konovalov <andreyknvl@gmail.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hi Alan,

Thank you for the revised patch and for explaining the intended use of
the saved endpoint.

I applied the patch as posted to upstream v7.2-rc1, commit
dc59e4fea9d83f03bad6bddf3fa2e52491777482.

I first tested your revision unchanged. The IRQ-state fix and saved
endpoint behaved as intended. The exact pre-queue cancellation matrix
produced exactly one expected completion in every case, with no KASAN,
Oops, or LOCKDEP output. The original ep_aio_cancel() null-ptr-deref
and UAF signatures, the earlier ep_aio() submit-path regressions, and the
teardown NULL-endpoint failure did not recur in these tests.

> I think it will still be necessary to flush the workqueue after
> destroy_ep_files() runs.  The best way to check whether this is needed
> would be to put a long delay right at the start of ep_unlink_worker()
> and then run a test where during that delay, the test program closes its
> open files, unmounts the directory, and unloads the gadgetfs module.

Using CONFIG_USB_GADGETFS=m on the posted revision, I inserted a
diagnostic 15-second delay at the entry of ep_unlink_worker(). While the
worker was delayed, the test process had no open /dev/gadget/* file
descriptors, GadgetFS unmounted successfully, the gadgetfs module
reference count reached zero, and rmmod succeeded before the delay ended.
The delay was diagnostic only.

When the delayed worker resumed, the kernel warned and then panicked. The
serial log showed an unresolved work-function address and identified
gadgetfs as the last unloaded module:

  Modules linked in: dummy_hcd [last unloaded: gadgetfs(O)]

Thus, in this path, a running unlink_work item does not pin the gadgetfs
module. Teardown must quiesce pending or running GadgetFS AIO work before
module unload, or otherwise retain the module until that work completes.

While rerunning the directed cross-CPU test from my previous message, I
found that the underlying lifetime race involving ep_unlink_worker()
remained:

  BUG: KASAN: slab-use-after-free in ep_unlink_worker
  Read of size 8
  drivers/usb/gadget/legacy/inode.c:489

The faulting statement was:

  put_ep(priv->epdata);

After AIO_UNLINK_DONE was published, completion work could free priv
before the unlink worker's final accesses through priv. Saving epdata and
ep before usb_ep_dequeue() eliminated the failure in the directed test.

Based on our discussion and the results above, I prepared the cumulative
patch below, incorporating your latest revision. It also fixes an
existing native PREAD issue: the to_free predicate could skip copying an
ITER_UBUF payload while still reporting success.

During development and validation, I found two further ordering issues.
In the existing completion ordering, request cleanup could overlap
usb_ep_disable() during final endpoint release. Separately, an
intermediate cumulative version allowed gadgetfs_unbind() to pass the
completion-work flush before a callback had queued that work. The
resulting patch addresses all three issues and applies directly to
upstream v7.2-rc1.

I reran the exact pre-queue matrix and earlier regression reproducers,
together with native PREAD/PREADV/PWRITE/PWRITEV payload checks and
directed cross-CPU and deferred-giveback tests. I also exercised teardown
and endpoint-release orderings, module lifecycle, CPU hotplug, rebind,
io_destroy, process exit, and partial-read cancellation stress. Across
the tested GadgetFS AIO lifetime and teardown paths, I observed no KASAN
report, Oops, LOCKDEP warning, stall, duplicate completion, or userspace
failure.

Targeted DEBUG_OBJECTS runs were clean, and strict KCSAN reported no race
involving GadgetFS or these AIO work functions. The incremental changes
passed strict checkpatch; the resulting source passed a W=1 module build,
a built-in CONFIG_USB_GADGETFS=y build, and a C=2 W=1 sparse check.

Supporting files for the two diagnostics above:

  Cross-CPU reproducer:
    https://raw.githubusercontent.com/neck392/linux-kernel-bug-reports/main/gadgetfs_candidate_20260825_support/repro_candidate_unlink_copy_uaf.c

  Diagnostic-only dummy_hcd patch:
    https://raw.githubusercontent.com/neck392/linux-kernel-bug-reports/main/gadgetfs_candidate_20260825_support/candidate_20260814_diag_crosscpu_work_on_cpu.patch

  Symbolized ep_unlink_worker() KASAN report:
    https://raw.githubusercontent.com/neck392/linux-kernel-bug-reports/main/gadgetfs_candidate_20260825_support/symbolized_report_ep_unlink_worker_uaf.txt

  Worker-entry delay diagnostic and module-unload result:
    https://raw.githubusercontent.com/neck392/linux-kernel-bug-reports/main/gadgetfs_candidate_20260825_support/candidate_20260822_diag_unlink_entry_delay.patch
    https://raw.githubusercontent.com/neck392/linux-kernel-bug-reports/main/gadgetfs_candidate_20260825_support/teardown_module_unload_serial.log

  Kernel config used for these diagnostics:
    https://raw.githubusercontent.com/neck392/linux-kernel-bug-reports/main/gadgetfs_candidate_20260825_support/kernel.config.kasan_inline_dwarf5_lockdep

If I have misunderstood any part of the intended lifetime or teardown
behavior, please let me know. I would be glad to run any additional tests
if needed. :-)

With sincere appreciation and respect,
Minseo Kim

Index: usb-devel/drivers/usb/gadget/legacy/inode.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/legacy/inode.c
+++ usb-devel/drivers/usb/gadget/legacy/inode.c
@@ -29,6 +29,7 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/moduleparam.h>
+#include <linux/workqueue.h>

 #include <linux/usb/gadgetfs.h>
 #include <linux/usb/gadget.h>
@@ -123,6 +124,8 @@
 	spinlock_t			lock;
 	refcount_t			count;
 	int				udc_usage;
+	int				aio_producers;	/* P: lock */
+	bool				aio_shutdown;	/* P: aio_lock */
 	enum ep0_state			state;		/* P: lock */
 	struct usb_gadgetfs_event	event [N_EVENT];
 	unsigned			ev_next;
@@ -236,6 +239,10 @@
 static const char *CHIP;
 static DEFINE_MUTEX(sb_mutex);		/* Serialize superblock operations */

+static DEFINE_SPINLOCK(aio_lock);	/* Protect GadgetFS AIO state */
+static struct workqueue_struct *gadgetfs_unlink_wq;
+static struct workqueue_struct *gadgetfs_copy_wq;
+
 /*----------------------------------------------------------------------*/

 /* NOTE:  don't use dev_printk calls before binding to the gadget
@@ -392,6 +399,8 @@
 		data->state = STATE_EP_DISABLED;
 		data->desc.bDescriptorType = 0;
 		data->hs_desc.bDescriptorType = 0;
+		/* Wait for unlink work before disabling the endpoint. */
+		flush_workqueue(gadgetfs_unlink_wq);
 		usb_ep_disable(data->ep);
 	}
 	mutex_unlock(&data->lock);
@@ -433,95 +442,189 @@

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
+	int			status;
+	enum aio_req_state	req_state;
+	enum aio_cancel_state	cancel_state;
 };

-static int ep_aio_cancel(struct kiocb *iocb)
+static void ep_unlink_worker(struct work_struct *work)
 {
-	struct kiocb_priv	*priv = iocb->private;
+	struct kiocb_priv	*priv;
 	struct ep_data		*epdata;
-	int			value;
+	struct usb_ep		*ep;
+	struct usb_request	*req;
+	enum aio_req_state	req_state;

-	local_irq_disable();
+	priv = container_of(work, struct kiocb_priv, unlink_work);
 	epdata = priv->epdata;
-	// spin_lock(&epdata->dev->lock);
-	if (likely(epdata && epdata->ep && priv->req))
-		value = usb_ep_dequeue (epdata->ep, priv->req);
-	else
-		value = -EINVAL;
-	// spin_unlock(&epdata->dev->lock);
-	local_irq_enable();
+	ep = priv->ep;
+	req = priv->req;

-	return value;
+	usb_ep_dequeue(ep, req);
+
+	spin_lock_irq(&aio_lock);
+	req_state = priv->req_state;
+	priv->cancel_state = AIO_UNLINK_DONE;
+	if (req_state >= AIO_COMPLETED)
+		priv->req = NULL;
+	spin_unlock_irq(&aio_lock);
+
+	/*
+	 * If the callback has already published AIO_COMPLETED, this worker
+	 * claims request cleanup. Free priv only after copy_work publishes
+	 * AIO_GIVEN_BACK.
+	 */
+	if (req_state >= AIO_COMPLETED) {
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
+		return -EINVAL;		/* No longer cancellable */
+	}
+	if (priv->req_state == AIO_SUBMITTING) {
+		priv->cancel_state = AIO_UNLINK_DONE;
+		spin_unlock_irqrestore(&aio_lock, flags);
+		return 0;	/* ep_aio() will call us again if needed */
+	}
+	if (priv->epdata->dev->aio_shutdown) {
+		spin_unlock_irqrestore(&aio_lock, flags);
+		return -EINVAL;	/* Leave completion to the giveback path */
+	}
+
+	/*
+	 * The AIO core may call us with the iocb context lock held. Run the
+	 * dequeue in work context, and complete the iocb from copy_work, so a
+	 * synchronous giveback cannot re-enter the AIO core from this callback.
+	 *
+	 * Queue under aio_lock so unbind cannot set aio_shutdown and flush
+	 * the workqueue before this work is visible.
+	 */
+	priv->cancel_state = AIO_UNLINKING;
+	queue_work(gadgetfs_unlink_wq, &priv->unlink_work);
+	spin_unlock_irqrestore(&aio_lock, flags);
+	return 0;
 }

 static void ep_user_copy_worker(struct work_struct *work)
 {
-	struct kiocb_priv *priv = container_of(work, struct kiocb_priv, work);
+	struct kiocb_priv *priv = container_of(work, struct kiocb_priv, copy_work);
+	struct usb_request *req = NULL;
+	struct ep_data *epdata = NULL;
+	struct usb_ep *ep = NULL;
 	struct mm_struct *mm = priv->mm;
 	struct kiocb *iocb = priv->iocb;
-	size_t ret;
+	ssize_t ret;

-	kthread_use_mm(mm);
-	ret = copy_to_iter(priv->buf, priv->actual, &priv->to);
-	kthread_unuse_mm(mm);
-	if (!ret)
-		ret = -EFAULT;
+	/* Writes leave priv->to empty; reads retain the destination iterator. */
+	if (!iov_iter_count(&priv->to) || !priv->actual) {
+		ret = priv->actual ? (ssize_t)priv->actual :
+			(ssize_t)priv->status;
+	} else {
+		kthread_use_mm(mm);
+		ret = copy_to_iter(priv->buf, priv->actual, &priv->to);
+		kthread_unuse_mm(mm);
+		if (!ret)
+			ret = -EFAULT;
+	}
+
+	/* Claim request cleanup unless the unlink worker owns it. */
+	spin_lock_irq(&aio_lock);
+	if (priv->cancel_state != AIO_UNLINKING && priv->req) {
+		req = priv->req;
+		epdata = priv->epdata;
+		ep = priv->ep;
+		priv->req = NULL;
+	}
+	spin_unlock_irq(&aio_lock);
+
+	if (req) {
+		mutex_lock(&epdata->lock);
+		usb_ep_free_request(ep, req);
+		mutex_unlock(&epdata->lock);
+		put_ep(epdata);
+	}

-	/* completing the iocb can drop the ctx and mm, don't touch mm after */
+	/* Completing the iocb can drop the file, ctx, and mm. */
 	iocb->ki_complete(iocb, ret);

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
+	struct dev_data		*dev = priv->epdata->dev;

-	/* lock against disconnect (and ideally, cancel) */
-	spin_lock(&epdata->dev->lock);
-	priv->req = NULL;
-	priv->epdata = NULL;
-
-	/* if this was a write or a read returning no data then we
-	 * don't need to copy anything to userspace, so we can
-	 * complete the aio request immediately.
-	 */
-	if (priv->to_free == NULL || unlikely(req->actual == 0)) {
-		kfree(req->buf);
-		kfree(priv->to_free);
-		kfree(priv);
-		iocb->private = NULL;
-		iocb->ki_complete(iocb,
-				req->actual ? req->actual : (long)req->status);
-	} else {
-		/* ep_copy_to_user() won't report both; we hide some faults */
-		if (unlikely(0 != req->status))
-			DBG(epdata->dev, "%s fault %d len %d\n",
-				ep->name, req->status, req->actual);
-
-		priv->buf = req->buf;
-		priv->actual = req->actual;
-		INIT_WORK(&priv->work, ep_user_copy_worker);
-		schedule_work(&priv->work);
-	}
-
-	usb_ep_free_request(ep, req);
-	spin_unlock(&epdata->dev->lock);
-	put_ep(epdata);
+	/* Prevent future cancellation */
+	spin_lock(&aio_lock);
+	iocb->private = NULL;
+	spin_unlock(&aio_lock);
+
+	/* Log status errors hidden by a nonzero actual count. */
+	if (iov_iter_count(&priv->to) && req->actual &&
+	    unlikely(req->status != 0))
+		DBG(priv->epdata->dev, "%s fault %d len %d\n",
+		    ep->name, req->status, req->actual);
+
+	priv->buf = req->buf;
+	priv->actual = req->actual;
+	priv->status = req->status;
+
+	spin_lock(&aio_lock);
+	priv->req_state = AIO_COMPLETED;
+	spin_unlock(&aio_lock);
+
+	INIT_WORK(&priv->copy_work, ep_user_copy_worker);
+	/* Publish copy work before unbind can observe the last producer. */
+	spin_lock(&dev->lock);
+	queue_work(gadgetfs_copy_wq, &priv->copy_work);
+	--dev->aio_producers;
+	spin_unlock(&dev->lock);
 }

 static ssize_t ep_aio(struct kiocb *iocb,
@@ -532,11 +635,13 @@
 {
 	struct usb_request *req;
 	ssize_t value;
+	struct usb_ep *ep;
+	bool need_unlink = false;

+	INIT_WORK(&priv->unlink_work, ep_unlink_worker);
 	iocb->private = priv;
 	priv->iocb = iocb;

-	kiocb_set_cancel_fn(iocb, ep_aio_cancel);
 	get_ep(epdata);
 	priv->epdata = epdata;
 	priv->actual = 0;
@@ -547,10 +652,12 @@
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
@@ -560,12 +667,48 @@
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
+	/* Account for the callback before the request is visible to the UDC. */
+	++epdata->dev->aio_producers;
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
+		--epdata->dev->aio_producers;
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
@@ -1640,8 +1783,12 @@
 gadgetfs_unbind (struct usb_gadget *gadget)
 {
 	struct dev_data		*dev = get_gadget_data (gadget);
+	unsigned long		flags;

 	DBG (dev, "%s\n", __func__);
+	spin_lock_irqsave(&aio_lock, flags);
+	dev->aio_shutdown = true;
+	spin_unlock_irqrestore(&aio_lock, flags);

 	spin_lock_irq (&dev->lock);
 	dev->state = STATE_DEV_UNBOUND;
@@ -1652,7 +1799,21 @@
 	}
 	spin_unlock_irq (&dev->lock);

+	/* Wait for unlink work before disabling endpoints. */
+	flush_workqueue(gadgetfs_unlink_wq);
 	destroy_ep_files (dev);
+
+	/* Wait until completion callbacks have published their cleanup work. */
+	spin_lock_irq(&dev->lock);
+	while (dev->aio_producers > 0) {
+		spin_unlock_irq(&dev->lock);
+		usleep_range(1000, 2000);
+		spin_lock_irq(&dev->lock);
+	}
+	spin_unlock_irq(&dev->lock);
+
+	/* Wait for completion work queued by the callbacks. */
+	flush_workqueue(gadgetfs_copy_wq);
 	gadget->ep0->driver_data = NULL;
 	set_gadget_data (gadget, NULL);

@@ -1677,6 +1838,9 @@
 			shortname, CHIP, gadget->name);
 		return -ENODEV;
 	}
+	spin_lock_irq(&aio_lock);
+	dev->aio_shutdown = false;
+	spin_unlock_irq(&aio_lock);

 	set_gadget_data (gadget, dev);
 	dev->gadget = gadget;
@@ -2125,10 +2289,25 @@
 {
 	int status;

+	gadgetfs_unlink_wq = alloc_workqueue("gadgetfs_unlink", WQ_PERCPU, 0);
+	if (!gadgetfs_unlink_wq)
+		return -ENOMEM;
+
+	gadgetfs_copy_wq = alloc_workqueue("gadgetfs_copy", WQ_PERCPU, 0);
+	if (!gadgetfs_copy_wq) {
+		destroy_workqueue(gadgetfs_unlink_wq);
+		return -ENOMEM;
+	}
+
 	status = register_filesystem (&gadgetfs_type);
-	if (status == 0)
-		pr_info ("%s: %s, version " DRIVER_VERSION "\n",
-			shortname, driver_desc);
+	if (status) {
+		destroy_workqueue(gadgetfs_copy_wq);
+		destroy_workqueue(gadgetfs_unlink_wq);
+		return status;
+	}
+
+	pr_info("%s: %s, version " DRIVER_VERSION "\n",
+		shortname, driver_desc);
 	return status;
 }
 module_init (gadgetfs_init);
@@ -2137,6 +2316,7 @@
 {
 	pr_debug ("unregister %s\n", shortname);
 	unregister_filesystem (&gadgetfs_type);
+	destroy_workqueue(gadgetfs_unlink_wq);
+	destroy_workqueue(gadgetfs_copy_wq);
 }
 module_exit (gadgetfs_cleanup);
-
