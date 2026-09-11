Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596653346A0
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789135264; cv=pass; b=hYRGVTka8b1JV/0PxYq6z8nifs7lRcxqIwJm9ePVz4Bi5ImizZjwZtj6MHryPt49Lfp6ERmvjt+Fw88EdDf85MCZ/SAj99F8wsG+GTeC5tifclQ2gR/3lVVOPeZ7k/RwNSdqfNhwipWAj1lrmeUkfoHegOcO4xI4OdHiNHkdGao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789135264; c=relaxed/simple;
	bh=NRvv2CvBhQfSSHuxoZHX834hrUfwPP0XyLc6xmcOP4g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dFKoyTW5viGmuCaJsx1YxY62MNWwIYTEqAaHWV6oZPHttk5KLpEQHk6IYltmzzMlfHl/KRQXXdIJ7K7uZS68YpDuUsU1JQGk/VAnhXvW2L0Idj9WLEEygBULAMajGNUKIkhAF1Yw1PnmDD/C1gbzYugU6nPww/P7/GPJyxu+Thw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iA9naKCW; arc=pass smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iA9naKCW"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5c8386a01b0so633247e0c.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:01:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789135261; cv=none;
        d=google.com; s=arc-20260327;
        b=bVzYCFws6ODmxQK22bjwh1OAz/UNBUYb0Pe8IHsLjYjgwWubvP6BxwdK9PpA3ywumj
         GUtlN27Ixj65xPuOSF4vBOmn58FYIbiB5dXu/4PXTIcJEBY1WLdxOTb6pTskBDwhXF1N
         e42KAiIw7153Qzo7RxEb+qMI4yTosQzjRrEOzHISk5nFXURPENX9vW2snJemq3VwabfR
         S4ksgOa32PDEV71pEa8defn4h4HdSDzvYSrHS4dQw5NLFMBNMMKm5874W0CCzp5Vd+b8
         sW6PZDJNXeHSR2yODJZ2Yi4mm6EBV6qpRMSb/IVMpF/ue6jglXhzjoWjqULbsrB++hLR
         qHYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AFZKX0Bh8yI6tq49fsjAsZ3QlB7gksDmYTTq4uLYACo=;
        fh=V98FoqyEGdVQVFYlkQdPN0cp2JTnXkT0Doso01pCAOU=;
        b=quTI48cWdPPxy5qe+V6YMYKFpeMGYBDR9KrzQrINPwffv1KTKbnig+OTGzqaS1dF4h
         ve16KLkBoIBY8YEJ45C5HgmCYB2CoRJSVD1wY5IFE6JGUQ13UMH7QYPW6EM0m9qV43Xm
         OowG0UmMgEmdalp1KDtpM6k5+skpajxbhKTJVuX4NPqSJzvOlB58yY9ygnL/hAplNWdK
         DkaIQll/cMGyNh5Arx7phmmavwuza/gec39LMkRYTpkiF8bwT/Ek72vylAHox0MOYYmC
         mibemOAWua/srt2UI4I2C0cOnZNyc/m+B5tH7yyPXu1/bDTaAa7fA9q0rf0g//hD8Pl1
         tT7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789135261; x=1789740061; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AFZKX0Bh8yI6tq49fsjAsZ3QlB7gksDmYTTq4uLYACo=;
        b=iA9naKCWUNT38ks20/TkO3uobqUdlNoizFZAHTOm+zGu49oxzJjBEIqbXnlYeA7FDF
         vhhKg0pq+UhI8ZiGrlgOlnrqLBHeqjoHT7YySJrKziTI2kZYZtJ2YltT10zpKKwZpaRq
         wEfbWwWu3f5egvt5E607pfTe9k96E81Io2Og2hwGWJGVWZVwJzVHuuFN3ROaFlNHNWWJ
         //tspaXzcLhiUtn4jfdU6uKfuMmtAFRxp5UbF5fZOWdDGZbO/v4OHMS9PI9EIimX89xe
         y6ZBqEDkMn4un86cmwj7XizCbmaFH8Mli6O4S99ejMxbEg7ACYexXN1HFktkcwxURaPd
         2w9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789135261; x=1789740061;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AFZKX0Bh8yI6tq49fsjAsZ3QlB7gksDmYTTq4uLYACo=;
        b=dHKW0Mf+OR1KECPAcOazGwoIifdrYMYADus0F9H0o08ZVbV1BQVrq+C7efjeU0Wecu
         vV24irDD8GBBkOiV/+8Dbvc2N70PD1IdaTxKf6Z7M1yaCsrFFHy5gdh34QxLI0HuNNOk
         YWWzo/aA6cqFV7uITDZcHgJkteGU7C9p60N9dcRZDDNyrW7XAAqzF+IO6mMG9v779SE5
         QarwGfmcCf4ppl25LKPXwNuqxv+qOrYyuGYkfrS1ENQIezape+2omig4Q/aCQIYv+Nn3
         fBIw/kOF5HH8SkNXzzDKbUYzxDDKVqHFQJJLo3KkBGKKCJnjTod+Z7Pj2HtGI8cVHYw+
         PVmA==
X-Forwarded-Encrypted: i=1; AKwUvBzdwCqYwBkvQENQrK1pokClzXarDzlN/Nu5Bg7Y6cKMaRpCWs4J64aAVTk5B8WWfkgyF1pN+2C301qh4Ns=@vger.kernel.org
X-Gm-Message-State: AFuF++krV0wI1fIvkhK5fiiJfiBSYkcSTiKQ1Q5VeXnFiYA49PaA+v3X
	HVeX3r3dPiBBoALEAVXbig8Mt7CPtRXfQFsZCug9YO5wMev01b200AFr0Q0PDpB372NGhKb/IeN
	UtOfHR7BHJncc1Ts7zHAuoRHOFQgmlQs=
X-Gm-Gg: AYBFou2731vC4ktb2NrreTdtGblWZ9giT0yWm/ddekOa9g7EGsIAwhY7aKR5L2Kc/mS
	1wMBZCzy/B5GLGD3LgjRfMCOHm0ZT0k9umGQgNOUIkJpSP2usSSXgkVPb9l5bwM+qi40ue/Lh1U
	PsxoG5/eMVK8yWJtr0og27zuHAYFghAaXX4zHPjm7WfunuN71j22zaeTL0JCsJ2V3odvsNAAYeU
	8Y2TABCSY17hAqULKhak2z9p/dOD6dBrkY2lU9ldRXVv11e4EAZH3e15chbsFAIDr9fKZkTCvhF
	R7mYRaSIkPeb2bOp4lIdyvxJ4W62D2x5pVBsTiS+1+ZWbnI8J8bW0VZ3W6mXiqPxsMeZC/ARiEk
	Jvv9R9mKEZMcAbM9InoGWQwSQlgPJCH6PDEj//i6lkFndEZofor+MFN7myLClhalTj+Svewe58j
	xtTFY4aQ==
X-Received: by 2002:a05:6122:428a:b0:5c7:a9ee:dcfb with SMTP id
 71dfb90a1353d-5c8462c1d9cmr6354196e0c.5.1789135246821; Fri, 11 Sep 2026
 07:00:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0305182d-5914-4022-a0a6-1ab4221b0a6c@rowland.harvard.edu>
 <CAFmvuTULxq6O0t7FyhEwnGVdMMpbj1yZrPN6mVRDWTgF0ODJxg@mail.gmail.com>
 <1b92cd86-fe64-43eb-9539-53a559cd14e3@rowland.harvard.edu>
 <CAFmvuTWw90k+Fvs5Ve=1nxCDSQrzH7rytY-3vjGwv=edQOCBPw@mail.gmail.com>
 <fb56064c-6481-44b3-88e5-8e5ff7b85703@rowland.harvard.edu>
 <CAFmvuTXWxQJUZfAAC=vs5QM=myDLE-o0jZZ8OXdqiGioPkRwfA@mail.gmail.com>
 <f928b74b-ce57-4454-bdd4-511b823bf742@rowland.harvard.edu>
 <CAFmvuTXwUiap39-FHv6aqGbJVzORRx8tV1QfN0BDjJaPsbfKHg@mail.gmail.com>
 <cec9b2a0-3454-45a6-b128-51d708cc8cbc@rowland.harvard.edu>
 <CAFmvuTUwGr-=joWrsYMu-Ra3XpHTe_HFhaY5inJnhg=e5b=1PA@mail.gmail.com> <1a93bb26-9ded-4b71-b409-62896a2681a6@rowland.harvard.edu>
In-Reply-To: <1a93bb26-9ded-4b71-b409-62896a2681a6@rowland.harvard.edu>
From: Minseo Kim <neck3922@gmail.com>
Date: Fri, 11 Sep 2026 23:00:00 +0900
X-Gm-Features: AcwNN1Xqh3GyctgJruY5InWmnsoX-qNccIhI0RH8WTu6wKnaxxMjL09bKKt9J28
Message-ID: <CAFmvuTUogd8MyQM02VpM7iHaopzrOoex+X-McQE28X1fgb_AeQ@mail.gmail.com>
Subject: Re: [BUG] usb: gadgetfs: KASAN null-ptr-deref and intermittent UAF in ep_aio_cancel()
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrey Konovalov <andreyknvl@gmail.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Thank you for the questions. I reran the tests to distinguish the
request's endpoint-queue state from the callback's execution state, and
the unbind flush from workqueue destruction during module cleanup.

> I didn't think this was possible.  gadgetfs_unbind() calls
> destroy_ep_files() before doing the flush, and destroy_ep_files() calls
> usb_ep_disable() for each active endpoint.  usb_ep_disable() doesn't
> return until the completion handlers for all the outstanding requests on
> the endpoint have finished.  This means no copy_work items should have
> been left to queue when the flush occurred.

With both patches applied, this ordering was possible in the dummy_hcd
test because the target request had already been removed from its
endpoint queue before ep_aio_complete() ran. When gadgetfs_unbind()
subsequently called destroy_ep_files(), dummy_disable() found the
endpoint queue empty. The request associated with the already-running
callback was no longer on that queue, so nuke() had no queued request to
give back and dummy_disable() returned while the callback was still held
at the gate. The unbind flush then returned before the callback queued
copy_work.

I confirmed this with markers recording the request and endpoint
pointers. The gate was inside ep_aio_complete(), after the request had
already been removed from its endpoint queue. It used a bounded,
non-sleeping loop. dummy_hcd had already released dum->lock before
calling usb_gadget_giveback_request().

In a control with the host-side transfer delayed, the request remained
queued when usb_ep_disable() began. dummy_disable() called nuke(), which
removed it and invoked its completion callback through
usb_gadget_giveback_request(). While I held the callback at entry,
neither usb_ep_disable() nor the ep0 close returned. After I released the
gate, the callback returned before usb_ep_disable() did, matching your
expectation for this pending-request case. The AIO request produced
exactly one completion with res=3D-ESHUTDOWN.

In a separate run with GadgetFS still mounted, the unbind flush and ep0
close returned while the callback was held before queuing copy_work. The
reproducer had no GadgetFS file descriptors left open in userspace, but
the module usage count was 2. rmmod was rejected because gadgetfs was in
use, and gadgetfs_cleanup() had not begun. After I released the callback
and the reproducer exited, the count was 1; subsequent unmount and rmmod
succeeded.

> What prevented rmmod from completing after iocb->ki_complete() had
> finished?  Was it waiting for the flush to finish?  If any additional
> work items were added to the queue after the flush started, they should
> not have blocked the flush.

In a separate worker-tail run using the same late-queueing ordering, the
unbind flush had already returned before the callback queued copy_work.
I then held the worker immediately after iocb->ki_complete() returned.
The module usage count was zero before rmmod started. When rmmod was
started, it waited in destroy_workqueue() during module cleanup, not in
the earlier unbind flush. The relevant part of the blocked rmmod task's
stack was:

    __flush_workqueue
    drain_workqueue
    destroy_workqueue
    gadgetfs_cleanup [gadgetfs]
    __do_sys_delete_module

The __flush_workqueue frame came from drain_workqueue(), which was
called by destroy_workqueue(). Thus, the late copy_work did not block
the earlier flush_workqueue() in gadgetfs_unbind(); it was already
running when gadgetfs_cleanup() called destroy_workqueue(), and
drain_workqueue() waited for it instead. Markers confirmed that
destroy_workqueue() returned only after I released the worker, and rmmod
then completed successfully.

This is consistent with the entry-gated ep_unlink_worker result in my
previous message. In that test, unlink_work had already been queued
before the unbind flush began, so the flush and the ep0 close remained
blocked until I released the worker. In the late-queueing run above,
copy_work was not queued until after the unbind flush had returned. A
separate control with copy_work queued before the flush likewise kept
the unbind flush and the ep0 close blocked until I released the worker.

Thank you for asking me to check this more closely.

With sincere appreciation and great respect,
Minseo Kim

2026=EB=85=84 9=EC=9B=94 11=EC=9D=BC (=EA=B8=88) =EC=98=A4=EC=A0=84 12:50, =
Alan Stern <stern@rowland.harvard.edu>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1=
:
>
> On Thu, Sep 10, 2026 at 11:00:00PM +0900, Minseo Kim wrote:
> > Hi Alan,
> >
> > Thank you for the second patch.
> >
> > > In your earlier testing, didn't you find that with the unpatched driv=
er,
> > > the driver module's usage count remained elevated as long as the
> > > ep_user_copy_worker() was pending on the workqueue? And therefore it
> > > was impossible to unload the module while a work item was still queue=
d
> > > or running?
> >
> > To check that point directly, I tested the unpatched upstream copy-work
> > path using diagnostic gates at two points in ep_user_copy_worker(). The
> > module usage count remained elevated when I held the worker at entry,
> > before iocb->ki_complete(). When I held the worker after that call, the
> > usage count reached zero and the module was unloaded before the worker
> > finished; the kernel then warned and panicked. This suggests that
> > AIO may not retain the file reference throughout the worker tail after
> > ki_complete().
>
> Okay, it's good to know that.
>
> > > Could you test it and verify that it prevents the problem you observe=
d
> > > with only the first patch installed?
> >
> > Yes. I applied your first patch and then your second patch to upstream
> > v7.2-rc1, commit dc59e4fea9d83f03bad6bddf3fa2e52491777482.
> >
> > With the first patch alone, I reproduced the earlier module-unload
> > failure with ep_unlink_worker() held at entry. With both patches applie=
d
> > using the same reproducer and ep_unlink_worker() entry gate,
> > gadgetfs_unbind() reached the flush point and the ep0 close remained
> > blocked, while unmount and rmmod attempts were rejected. After I releas=
ed
> > the worker, the close completed and subsequent unmount and rmmod attemp=
ts
> > succeeded. Holding ep_user_copy_worker() at entry with both patches
> > applied produced the same result.
> >
> > I also tested the boundary where gadgetfs_unbind() reached the flush
> > point before the completion callback queued copy_work.
>
> I didn't think this was possible.  gadgetfs_unbind() calls
> destroy_ep_files() before doing the flush, and destroy_ep_files() calls
> usb_ep_disable() for each active endpoint.  usb_ep_disable() doesn't
> return until the completion handlers for all the outstanding requests on
> the endpoint have finished.  This means no copy_work items should have
> been left to queue when the flush occurred.
>
> >  After the
> > callback queued the work, I held the worker tail immediately after
> > iocb->ki_complete(). In this ordering, rmmod did not complete while the
> > worker was held; after I released the worker, rmmod completed cleanly.
>
> What prevented rmmod from completing after iocb->ki_complete() had
> finished?  Was it waiting for the flush to finish?  If any additional
> work items were added to the queue after the flush started, they should
> not have blocked the flush.
>
> > I reran the exact pre-queue cancellation matrix, the original
> > null-ptr-deref reproducer, the directed cross-CPU UAF reproducer,
> > deferred giveback, forced dequeue failure, the earlier NULL-endpoint
> > case, payload checks, and CPU hotplug. With both patches applied, all
> > produced the expected results without a KASAN report, Oops, or LOCKDEP
> > warning. Strict KCSAN did not report a race involving GadgetFS or its A=
IO
> > work functions.
> >
> > In my x86-64 QEMU and dummy_hcd tests, the second patch prevented the
> > module-unload problem that remained with the first patch alone. I did n=
ot
> > find a new failure attributable to the second patch in these tests.
>
> All right.  So once these last few questions have been resolved, I will
> submit both of the patches (with your Tested-by: added to the second as
> well as the first).
>
> Thanks again for all your hard work running multiple tests.
>
> Alan Stern
