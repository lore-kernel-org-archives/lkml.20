Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDEE44063D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394523; cv=pass; b=X5Iw6YeNTFu2yHO+47J1QjarRLIOK1k5zkUCYJRFIy42PfH9zG73PjRxoetmAJoyTPiFBj9TjxDMDYO9hEszpaP3vaCDzaUKA6CWM8RTndACff5kTJ3jeGq9drPA/6/qJjAEO57I8AorqSiFBNCs83aXfXT5zvxLqvVwArj5DrY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394523; c=relaxed/simple;
	bh=n/EaScN9MoRV8PZ+c8kj8NR4leBSAxXeyKiNesTlvaY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fkbY8ICbj2SfoCZrkDEPxEq5kCqcaIgxuw4KFGabyHBsRtIeYM7wohOF5F8XCtKeARFrJd4Bnd9cUA6GR2ZWRYNY/Hc8L0XIgNGF0ib55JcRJuZJqoVvA5l8uwaesOz3DeoK9iWpjIOjgUoUlMxr+6/4sPlSJbQx7l7QFUOfjAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZA0f/Arx; arc=pass smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZA0f/Arx"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-9809ce25a29so2133714241.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:02:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789394520; cv=none;
        d=google.com; s=arc-20260327;
        b=TH4haUCvMoIWIM/RNwdmDdtF2jt9EivHq77vqZJ/BQS/NdOgp1+e/nXoePrkHMPYJv
         Yd2/34re3xIlyCQp3YbG+KhSvvLu0EdcXpwHfVpsRlj29KuMph/2l1Jjq7gNCPgAzsGO
         M7bN5AX/oF3RLMWF9ZI+b0dPwUJb0DYkeZRmJ1A1mmdQbwlE887YHuI5dzUQ3I0BbutH
         RMa/mVhG8SQG7ecPDuugsZERVRPJH+pR10gmRzy8BkR2IZD7TA8lNIA8LTyqRk0Lo3g+
         f1kgifjDhkBQUKKYeFJRjO7PHygl0UG5h/EGuPdQCd6D/e8M5aSTCQatzQmYuU4kbQJ0
         s+fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=psmnJCev7iIwswL35syLQ47I/8GLWWKXEvnbx0Xoqvg=;
        fh=W9WZFS3PBAPwBObZloUgWNeUqmpIIQeOeueAsB5njYk=;
        b=fyty4issNEV0dmTcBsrdxnH85xIdnVQtRvyX4FLVRdBWLhAlTKWYoxrzk2qvRLrhcF
         CFrGEJA/aK//bUahJZmED96DtilgdKG7NG20oxiwD1hQ2m3wyxxMaFFGSRXVaV7uuUuL
         yQOFACIbfowT/m5A/+wTplBhU5jHPtstQAG/2CQjm/cdUFnIveDe2WuU+ChjwbkR0JEj
         USBFEtNpoWIpWeTu1IfG/72RpSJWpND78Ph9PnyzjVU7xt/AheGmlExXfgG8779M3+jT
         5U/spoBpconFJft1dJrgd+vRHH/NZPrFPUwPuiAXyYQjzq/usntgZWf7Z0Cn+ndVQLay
         9PRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789394520; x=1789999320; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=psmnJCev7iIwswL35syLQ47I/8GLWWKXEvnbx0Xoqvg=;
        b=ZA0f/Arx54XR6kAl+Fs0xBzSpUdf84w0FbJAxZU08rO+H3P+46CSV8KBpbLNu8T27G
         8VzNswn25SJyci0w799aSbP6KTtCrL1VmW9K1qXke9BITFElq+ySp3M8aQI/fYtd6wdN
         UaCoM7Ok6komAI8PY7eIFMmbcdLlPNVZ6jIEZEdZTG/gANDsvK9mPVProeBA8y7xew2t
         PbKYDSolZwvpIVDrOGPuuIpWSsKnvm9gMdJtCXBgrHMaQRSGeg/yTlX42aG9Jf/gcBQy
         1RlpwrxWuN7oOAPENt6TRcswcUBIKAo0Keq8eydj5zEudXn14lhfMRgTDoyyKQ6PY1ia
         KYHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789394520; x=1789999320;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=psmnJCev7iIwswL35syLQ47I/8GLWWKXEvnbx0Xoqvg=;
        b=Zi8+tavKyShTqlSzc1u9mhtcayqj16EkhgRv0leGGFRrWPpGoSJq2Wo2YcQ4uvUI+E
         2ncXDrEKoY5z5vTin8xpyoVo+I7Y41zK2M9cyfuQT10uZ/PQtnyoSNaGNB+2kzBsP41Z
         sGpCcU4f3+9Mn1d4Y6t/BGLZ/JxVejFpRvLVCHr7mp7DbkIcaKKRS/rDrHhT+Rr/mMYm
         eKuZsKpiDOS2LSvfCZm7ioxGTLYBNxSwXFCPSbiiB5GNhYzpLlSgdUgyxe7HX/DgjU+M
         uP6DFhiGzFZIV0/uvMjVI6bvtDUNERnUGhMee5cLj/uHxQaHNxn/bPQMzZTRIAHsFaWu
         egVQ==
X-Forwarded-Encrypted: i=1; AKwUvByb3gr50uFoDRZ6ifAq6qop4f6bmSrd/YBCxUEJwQ6RvCe4F0Hfu1X2FoqV7MckHDyijPy0H/JudlWun3M=@vger.kernel.org
X-Gm-Message-State: AFuF++lSiB1ya8BuKXixHQNjg0wvwFUqDxUZAJxDmumcvZmJMW3p83xD
	6ZWlZNG1a55HbB7sgs6vqko+MaMy5ANZBpLB/22ASQpYtP8XUm692nXT/Pz5RIQxovMF9gH0k9E
	IspdbRoeJ7e4JUP9ILvNGHrzeEufNVrMjs5eJ
X-Gm-Gg: AYBFou0oeWrNJb5ahrGoVvmGeuhnXwQmYGdVaKM3ZyytrF3OcVC0shg1i73dbpfkrvH
	mHT1gxAcRN4+zCPdATNeO7DvRO8srVSj7XBcIsckdjpYlrrLU+pdItbJl5BV4j8yhKJDuNjSdjn
	0KHSdLuqQPkHUFbCNJk+L995fQNynqcJ2Krmh5uQodi6VwHMNLSxf1Ml5VkFymKtcJ0ezoLQBUv
	+HNMMZiNKDCp1cg4cux9XPYGuZYVYSY+0kiJFCvvyNLYzfUE8g3J4Wu/IF+WgSXklHu/ybxYV7I
	4fTQTJlgMFIdHsTWL7cIsWHR1abcBjz7hbt7Zk2CEXLy6/5pfawHEUWGjaQSCC/clF8lrKaXWHp
	+Ywa9KXVWpuavAfdFxvMP0G+495kMLa9q1MqeMJFJK8kpktXE/QOxFkxpQOkEIctPdm6Ty4G6EP
	v4McXB/w==
X-Received: by 2002:a05:6102:a1c4:10b0:79c:ab2:6f6c with SMTP id
 ada2fe7eead31-79c0ac1d50cmr601381137.3.1789394519569; Mon, 14 Sep 2026
 07:01:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1b92cd86-fe64-43eb-9539-53a559cd14e3@rowland.harvard.edu>
 <CAFmvuTWw90k+Fvs5Ve=1nxCDSQrzH7rytY-3vjGwv=edQOCBPw@mail.gmail.com>
 <fb56064c-6481-44b3-88e5-8e5ff7b85703@rowland.harvard.edu>
 <CAFmvuTXWxQJUZfAAC=vs5QM=myDLE-o0jZZ8OXdqiGioPkRwfA@mail.gmail.com>
 <f928b74b-ce57-4454-bdd4-511b823bf742@rowland.harvard.edu>
 <CAFmvuTXwUiap39-FHv6aqGbJVzORRx8tV1QfN0BDjJaPsbfKHg@mail.gmail.com>
 <cec9b2a0-3454-45a6-b128-51d708cc8cbc@rowland.harvard.edu>
 <CAFmvuTUwGr-=joWrsYMu-Ra3XpHTe_HFhaY5inJnhg=e5b=1PA@mail.gmail.com>
 <1a93bb26-9ded-4b71-b409-62896a2681a6@rowland.harvard.edu>
 <CAFmvuTUogd8MyQM02VpM7iHaopzrOoex+X-McQE28X1fgb_AeQ@mail.gmail.com> <0b6b13ff-789e-4ba4-9765-1052a154ef27@rowland.harvard.edu>
In-Reply-To: <0b6b13ff-789e-4ba4-9765-1052a154ef27@rowland.harvard.edu>
From: Minseo Kim <neck3922@gmail.com>
Date: Mon, 14 Sep 2026 23:00:00 +0900
X-Gm-Features: AcwNN1VuCUgL_CUDlFNknPFYzvgT86hGkOAFVgtuMIDjMk_XupspcZtX0AfQ1g0
Message-ID: <CAFmvuTXeg2LykJa060WUYAhhQpdwGV74VFkMb6Wu5zjyqWzxmw@mail.gmail.com>
Subject: Re: [BUG] usb: gadgetfs: KASAN null-ptr-deref and intermittent UAF in ep_aio_cancel()
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrey Konovalov <andreyknvl@gmail.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Thank you for the revised patch.

Following your explanation, I focused this round of testing on how the
revised patch handles module lifetime.

I applied your first patch followed by this revised second patch to
upstream v7.2-rc1, commit
dc59e4fea9d83f03bad6bddf3fa2e52491777482, using
CONFIG_USB_GADGETFS=3Dm for the runtime tests.

With the unbind flush removed, I held ep_unlink_worker() at entry.
gadgetfs_unbind() returned and the module usage count reached zero, but
rmmod remained blocked in gadgetfs_cleanup()'s destroy_workqueue(). After
I released the worker, rmmod completed successfully. Holding
ep_user_copy_worker() immediately after iocb->ki_complete() likewise kept
rmmod blocked in destroy_workqueue() until I released the worker. In both
cases, the blocked rmmod stack showed __flush_workqueue(),
drain_workqueue(), destroy_workqueue(), and gadgetfs_cleanup().

To check whether module unloading could begin before a callback published
its work, I held the completion callback immediately before it queued
copy_work. At that point, the reproducer's file descriptor table contained
no GadgetFS descriptors. In two runs, each starting from a fresh boot, a
direct umount2() call failed with errno set to EBUSY while the callback was
held. The module usage count remained 2, rmmod was rejected because the
module was in use, and gadgetfs_cleanup() did not begin. After I released
the callback, it queued copy_work, the AIO request completed, and subsequen=
t
unmount and rmmod attempts succeeded.

I also held ep_aio_complete() immediately after iocb->ki_complete() on
the PWRITE path that does not queue copy_work. In two runs, each starting
from a fresh boot, after the reproducer consumed the AIO completion event
and closed all GadgetFS descriptors, unmount remained pending, at least
one concurrent delete_module() attempt failed with errno set to
EWOULDBLOCK, and gadgetfs_cleanup() did not begin while the callback tail
was held. After I released the gate, the callback returned, unmount
completed, and module removal succeeded.

In another cancellation test, both unlink_work and copy_work were
outstanding on gadgetfs_wq when rmmod entered destroy_workqueue().
Releasing unlink_work alone did not allow cleanup to return; it returned
only after I released copy_work.

Using the GadgetFS source with both patches applied and without the
diagnostic gates or markers, I reran the original NULL pointer dereference
and UAF reproducers and the relevant AIO cancellation, payload, teardown,
CPU hotplug, rebind, module reload, and partial read stress tests. All
completed with the expected results and without a KASAN report, Oops, or
LOCKDEP warning.

In these x86-64 QEMU and dummy_hcd tests, module cleanup did not begin whil=
e
a callback still had work to publish, and destroy_workqueue() waited for th=
e
remaining GadgetFS AIO work once module cleanup began. I did not find a new
failure attributable to the revised second patch in these tests.

Thank you for examining this issue with such care and for the time and
effort you have devoted to it.

With sincere appreciation and great respect,
Minseo Kim

2026=EB=85=84 9=EC=9B=94 12=EC=9D=BC (=ED=86=A0) =EC=98=A4=EC=A0=84 4:22, A=
lan Stern <stern@rowland.harvard.edu>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Fri, Sep 11, 2026 at 11:00:00PM +0900, Minseo Kim wrote:
> > Hi Alan,
> >
> > Thank you for the questions. I reran the tests to distinguish the
> > request's endpoint-queue state from the callback's execution state, and
> > the unbind flush from workqueue destruction during module cleanup.
> >
> > > I didn't think this was possible.  gadgetfs_unbind() calls
> > > destroy_ep_files() before doing the flush, and destroy_ep_files() cal=
ls
> > > usb_ep_disable() for each active endpoint.  usb_ep_disable() doesn't
> > > return until the completion handlers for all the outstanding requests=
 on
> > > the endpoint have finished.  This means no copy_work items should hav=
e
> > > been left to queue when the flush occurred.
> >
> > With both patches applied, this ordering was possible in the dummy_hcd
> > test because the target request had already been removed from its
> > endpoint queue before ep_aio_complete() ran. When gadgetfs_unbind()
> > subsequently called destroy_ep_files(), dummy_disable() found the
> > endpoint queue empty. The request associated with the already-running
> > callback was no longer on that queue, so nuke() had no queued request t=
o
> > give back and dummy_disable() returned while the callback was still hel=
d
> > at the gate. The unbind flush then returned before the callback queued
> > copy_work.
>
> Aha!  In other words, usb_ep_disable() doesn't guarantee that the
> completion handlers for all outstanding requests on the endpoint have
> finished -- it only guarantees that they have started.  That's an
> important difference.  Guess I should update the documentation for
> that routine.
>
> > I confirmed this with markers recording the request and endpoint
> > pointers. The gate was inside ep_aio_complete(), after the request had
> > already been removed from its endpoint queue. It used a bounded,
> > non-sleeping loop. dummy_hcd had already released dum->lock before
> > calling usb_gadget_giveback_request().
> >
> > In a control with the host-side transfer delayed, the request remained
> > queued when usb_ep_disable() began. dummy_disable() called nuke(), whic=
h
> > removed it and invoked its completion callback through
> > usb_gadget_giveback_request(). While I held the callback at entry,
> > neither usb_ep_disable() nor the ep0 close returned. After I released t=
he
> > gate, the callback returned before usb_ep_disable() did, matching your
> > expectation for this pending-request case. The AIO request produced
> > exactly one completion with res=3D-ESHUTDOWN.
> >
> > In a separate run with GadgetFS still mounted, the unbind flush and ep0
> > close returned while the callback was held before queuing copy_work. Th=
e
> > reproducer had no GadgetFS file descriptors left open in userspace, but
> > the module usage count was 2. rmmod was rejected because gadgetfs was i=
n
> > use, and gadgetfs_cleanup() had not begun. After I released the callbac=
k
> > and the reproducer exited, the count was 1; subsequent unmount and rmmo=
d
> > succeeded.
> >
> > > What prevented rmmod from completing after iocb->ki_complete() had
> > > finished?  Was it waiting for the flush to finish?  If any additional
> > > work items were added to the queue after the flush started, they shou=
ld
> > > not have blocked the flush.
> >
> > In a separate worker-tail run using the same late-queueing ordering, th=
e
> > unbind flush had already returned before the callback queued copy_work.
> > I then held the worker immediately after iocb->ki_complete() returned.
> > The module usage count was zero before rmmod started. When rmmod was
> > started, it waited in destroy_workqueue() during module cleanup, not in
> > the earlier unbind flush. The relevant part of the blocked rmmod task's
> > stack was:
> >
> >     __flush_workqueue
> >     drain_workqueue
> >     destroy_workqueue
> >     gadgetfs_cleanup [gadgetfs]
> >     __do_sys_delete_module
> >
> > The __flush_workqueue frame came from drain_workqueue(), which was
> > called by destroy_workqueue(). Thus, the late copy_work did not block
> > the earlier flush_workqueue() in gadgetfs_unbind(); it was already
> > running when gadgetfs_cleanup() called destroy_workqueue(), and
> > drain_workqueue() waited for it instead. Markers confirmed that
> > destroy_workqueue() returned only after I released the worker, and rmmo=
d
> > then completed successfully.
> >
> > This is consistent with the entry-gated ep_unlink_worker result in my
> > previous message. In that test, unlink_work had already been queued
> > before the unbind flush began, so the flush and the ep0 close remained
> > blocked until I released the worker. In the late-queueing run above,
> > copy_work was not queued until after the unbind flush had returned. A
> > separate control with copy_work queued before the flush likewise kept
> > the unbind flush and the ep0 close blocked until I released the worker.
> >
> > Thank you for asking me to check this more closely.
>
> These results explain a lot.  They mean that flushing the workqueue in
> gadgetfs_unbind() not only doesn't do what we want, it also isn't
> necessary -- because destroy_workqueue() will automatically do a flush
> for us.
>
> Also, it isn't really necessary to flush the workqueue when the user
> program closes ep0 or unmounts the gadgetfs filesystem.  We merely have
> to make sure that when the module is unloaded, no work items are running
> or will be started.
>
> Here's a revised version of the second patch, which omits the
> flush_workqueue() call from gadgetfs_unbind().  I expect it will
> eliminate the "module unloaded while work items are still running"
> problem just as well as the original version did.
>
> Alan Stern
>
>
>
> Index: usb-devel/drivers/usb/gadget/legacy/inode.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- usb-devel.orig/drivers/usb/gadget/legacy/inode.c
> +++ usb-devel/drivers/usb/gadget/legacy/inode.c
> @@ -237,6 +237,7 @@ static const char *CHIP;
>  static DEFINE_MUTEX(sb_mutex);         /* Serialize superblock operation=
s */
>
>  static DEFINE_SPINLOCK(aio_lock);      /* Protect aio cancellation info =
*/
> +static struct workqueue_struct *gadgetfs_wq;
>
>  /*----------------------------------------------------------------------=
*/
>
> @@ -514,9 +515,7 @@ static int ep_aio_cancel(struct kiocb *i
>                 spin_unlock_irqrestore(&aio_lock, flags);
>                 return 0;       /* ep_aio() will call us again if needed =
*/
>         }
> -
>         priv->cancel_state =3D AIO_UNLINKING;
> -       spin_unlock_irqrestore(&aio_lock, flags);
>
>         /*
>          * We are called with the aio core holding iocb's context lock.
> @@ -527,7 +526,9 @@ static int ep_aio_cancel(struct kiocb *i
>          * For this reason, do the dequeue operation in a work routine.
>          */
>         INIT_WORK(&priv->unlink_work, ep_unlink_worker);
> -       schedule_work(&priv->unlink_work);
> +       queue_work(gadgetfs_wq, &priv->unlink_work);
> +
> +       spin_unlock_irqrestore(&aio_lock, flags);
>         return 0;
>  }
>
> @@ -597,7 +598,7 @@ static void ep_aio_complete(struct usb_e
>
>         if (new_req_state =3D=3D AIO_COMPLETED) {
>                 INIT_WORK(&priv->copy_work, ep_user_copy_worker);
> -               schedule_work(&priv->copy_work);
> +               queue_work(gadgetfs_wq, &priv->copy_work);
>         }
>         if (cancel_state !=3D AIO_UNLINKING) {
>                 usb_ep_free_request(ep, req);
> @@ -2245,10 +2246,17 @@ static int __init gadgetfs_init (void)
>  {
>         int status;
>
> +       gadgetfs_wq =3D alloc_workqueue("gadgetfs", WQ_PERCPU, 0);
> +       if (!gadgetfs_wq)
> +               return -ENOMEM;
> +
>         status =3D register_filesystem (&gadgetfs_type);
> -       if (status =3D=3D 0)
> -               pr_info ("%s: %s, version " DRIVER_VERSION "\n",
> -                       shortname, driver_desc);
> +       if (status) {
> +               destroy_workqueue(gadgetfs_wq);
> +               return status;
> +       }
> +
> +       pr_info("%s: %s, version " DRIVER_VERSION "\n", shortname, driver=
_desc);
>         return status;
>  }
>  module_init (gadgetfs_init);
> @@ -2257,6 +2265,7 @@ static void __exit gadgetfs_cleanup (voi
>  {
>         pr_debug ("unregister %s\n", shortname);
>         unregister_filesystem (&gadgetfs_type);
> +       destroy_workqueue(gadgetfs_wq);
>  }
>  module_exit (gadgetfs_cleanup);
>
>
