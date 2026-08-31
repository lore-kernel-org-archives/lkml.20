Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8634442CAE7
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788183026; cv=pass; b=ZO251xQxZCdrGS4gxRbd/R7AQLV32kKplSYUwKJA+nLWL/MwOVTXY0Ua7SZGtrJE/SG0f6dfwjZIlytRm9w/hpLNcF5mGRSE0lCOeSD+S55cBtp/UkYx9mo/I9KuB9hJHpfi76bnNN1wjlA0TUZeWO8Oo9eewx5/0bgTo8G78GM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788183026; c=relaxed/simple;
	bh=ukTYMNbuwE/keazidIyB1jBFFdn8dCj3wKE9nrANL8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nuZQmuV8EfDAE8PjZCerp5oq12rrK1t1qQpZ7uFovIdquXXdSvYSALqGwcehRxkVTF16m1IIPxqU8aVDpqmQD4Q/1QeXpGiAzNg59frXIQK4TvBLn2gYW7Tkr/szbKk4euX3RubQIRKg/KKwEhAXzl9Hg8W3Z0p/Mb945WUVLg0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DJliYGQ8; arc=pass smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DJliYGQ8"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-90cbff85fa9so30786536d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:30:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788183023; cv=none;
        d=google.com; s=arc-20260327;
        b=nU47Y7nSs3AJ9d1UsyQjEnS/D/52UMTLOntNydaEcUkdwHEdreS5L+31w7D5bXz9uP
         UlKeV81kDpvOCFQFY/m76eAjxIYy3PwR6i+0gn1qWj/Zel1gCeLeHftQuclOPkAj6uEV
         Itrsm+tZwIxsXpAOBVsDV3qYQydR9/sHR5lz1oQHgR73PEFjnGpKcI7dYMphXfPRmzBQ
         rJWYB6mATg0zuV6KWMnt9za0782tAb3bNCNqeEcEmmTBF4O8QGZ1lwIJHiGglXRk189m
         xYryJvLSkUtE8tkRgbVGgvsgxuAr0r8Qkl3l/yVOUVwLQBQhVTZ9TUFWbO8CZPMbJ3Qq
         JqSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ffwSQjuOFPtOoE2npfL854hjC1DceBLovGgAXn3l8KY=;
        fh=JhK9l9CAXRg8hY9S70FU9RPvF1mvvsd3dVSs8aA0Md4=;
        b=m65NBnw51cESSJHJt9DDA9QzB2KaN4rgU6W+goYJHPqFfB9mRPizl0gBnhGV8OCry7
         k2jBY7AROZ10uvtCk9c5Wme5vkFWV/6M7+mHninhCHnhxiBMcZsdCbIzXFLpDFxWuBmN
         2fJcvnzJpdkujwtnpmOXcHyusnKoznIDt2gmYdFFbiejHvvpom9T9NE2KCfyZ2vCq4NR
         1jztCnK9ozs4bC5HePXTZqGmUduLSnrUbTLzptclJuJ4jdLgEa68HoS6Fn3IM64WJAtd
         CYrcHnMgf0GDwJnlQuBb3A9JoEMq7fBScMWsLOb9MPiCTeCqXlMygBCLWTrky04gTkYR
         Ddmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788183023; x=1788787823; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ffwSQjuOFPtOoE2npfL854hjC1DceBLovGgAXn3l8KY=;
        b=DJliYGQ8k4OlyS4zyhr1c62DiYtyzjLAr7A59gK0dZZZ9Bzdd4bRQ1/gDdU8xig9E3
         1TwQ4Q1IIZG9NUSpn9zeAunjfxeQ7HBnxTBYMINOZ+0fdnp60JnUpp8F1Q981TcPDi/Y
         Y2E6AOmtqayoE75FvA7/9fKegm1SUCNoX74T+W/i52xYIsDrFpqplLFtNshv4BUYsjQ6
         NHPlqqFay/yhA17XkfJ/BPHsRYuYZeh1iMQT2FZrRON+QX8ZoHKSWM7heRQAOINfeWrL
         TEfLwgd92MfYBSuYiP4xnHwMIKHYMSnHVJUU2vzBwgjDNr3T9CeadGiO5I9imE299koJ
         rcKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788183023; x=1788787823;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ffwSQjuOFPtOoE2npfL854hjC1DceBLovGgAXn3l8KY=;
        b=Sp3xXRpxhRmS31ht1h7Of6whlHUPGiMijexi8Ydiuk1TI+XieeHonuC25No1FIgOki
         TYLSXMST31P7kEQAySNbQzP00dwu/Cozf/oqqMSLxBDeIcez1jwK/cd/47RrxdyLsjlE
         A3+jpz1PZndg+9plylLI0hSXf39CfvA55Gbq73MnDqn3HOk7PaN3SMDpEYWiDNrMI0AK
         I576Jzul83PNnwFKi2jJAetK59gsIZV6z3pX8UpwqcqZzl+ffT234nT6ysh8dFOFV3TJ
         SWfYWzUUmetb/DuG145mmFfnr1+kDWzwBYWBAUFj65A28d/R1Du7sPuOjJdqYC+Pm0rs
         3syw==
X-Forwarded-Encrypted: i=1; AKwUvBzIJjOzt9CPXiulsJJpR2vvjUV7OWw+fhMDkwVoiAn5BBybGs9ahbahDROkGyud5V5d5+VU5Am2MO/HeZk=@vger.kernel.org
X-Gm-Message-State: AFuF++nyvxyKs4FHdcUN0daZJX88w8LD7OJgQwBA62AFarc+cveDd19y
	BRDGrTKTKtIMJl8glKAV3lKf2UcyvKHiPt5IkTZH8gTmd8BvdXK/ozFgQCofT9Bn7DYOW8jjz9t
	8OMF1oXm1LJlTPC7mmSUSvRNj/AU/Dog=
X-Gm-Gg: AYBFou265kj6Is+hfVo6IoRObkPY6YTlHZ68YawzcpzB1CXXoYvln1Yo1z7yWSHy6/4
	VpOnnEWUQU7SZJDl3zx5X8Mwwc1qvv0yI8a4+kdej8klkw7BWBIeGYItSb6VbJ73UT+i53MUbw5
	Rjrf63gBjep6VlP27glkBrc+VqjM64w3/s9+AAREmO1OfR/fijNns1knNxhlHwdOaHzDbb7B9ae
	xCJeiv9jr1uJaif8vPUHM37QKY0NAQaUAFqeI3fYGqb7dREiCjAfFt8jw8emOa7K+Q1P7DDDSy0
	9TqfksTxWpG1ncfsqKgFsx5ZxNEpAh5+agbj5Pl1xSrl
X-Received: by 2002:a05:6214:4902:b0:90a:9683:841c with SMTP id
 6a1803df08f44-90ce0e56f1fmr341815876d6.6.1788183022595; Mon, 31 Aug 2026
 06:30:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFmvuTW2cfj5dzkRR8ymenWoA7tw1WAYsMitorvppTwcZ+xfbg@mail.gmail.com>
 <e8655e37-02b3-40ef-9ce0-98c8fa25481d@rowland.harvard.edu>
 <15185c2d-4544-42cc-ba0a-79dd36e82a21@rowland.harvard.edu>
 <CAFmvuTU=t5TiZSpHmF1MXpVs+3K7G1VOTDeeazwGru4+1eozBg@mail.gmail.com>
 <cd57f283-71e6-4531-a311-1180ccc22ab8@rowland.harvard.edu>
 <CAFmvuTVH=mVMZNoYnU07_WA+cBc4m+UG2BBTLwF5KWhcj-z-KA@mail.gmail.com>
 <908a5b29-e6d8-4595-b451-6c328e25c60e@rowland.harvard.edu>
 <CAFmvuTU5HnBKbve=v_C7Mhw2586rR_8qsRNua2XPokgKy_o31w@mail.gmail.com>
 <0305182d-5914-4022-a0a6-1ab4221b0a6c@rowland.harvard.edu>
 <CAFmvuTULxq6O0t7FyhEwnGVdMMpbj1yZrPN6mVRDWTgF0ODJxg@mail.gmail.com> <1b92cd86-fe64-43eb-9539-53a559cd14e3@rowland.harvard.edu>
In-Reply-To: <1b92cd86-fe64-43eb-9539-53a559cd14e3@rowland.harvard.edu>
From: Minseo Kim <neck3922@gmail.com>
Date: Mon, 31 Aug 2026 22:30:08 +0900
X-Gm-Features: AcwNN1Wq_S7MiOAXMOhN6vmDcQ9_uKea2tOoUBUY8l9Ww_ZqHOKke57SfoVMvxg
Message-ID: <CAFmvuTWw90k+Fvs5Ve=1nxCDSQrzH7rytY-3vjGwv=edQOCBPw@mail.gmail.com>
Subject: Re: [BUG] usb: gadgetfs: KASAN null-ptr-deref and intermittent UAF in ep_aio_cancel()
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrey Konovalov <andreyknvl@gmail.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Thank you for the comments and for pointing out where my explanation was
unclear.

> Are you saying that this test in ep_read_iter():
>
>         if (!iter_is_ubuf(&priv->to) && !priv->to_free) {
>
> is wrong, for example, the && should be || ?

No. The && condition should remain as it is. dup_iter() copies the iterator
state into priv->to. In my tests, native PREAD and a one-segment PREADV use=
d
ITER_UBUF. Since ITER_UBUF has no separate iovec array to duplicate,
dup_iter() returned NULL while the copied iterator remained valid. My
two-segment PREADV test used ITER_IOVEC; there, a NULL return would mean th=
at
allocation of the duplicated iovec array failed. The iter_is_ubuf() check
therefore distinguishes the valid NULL return for ITER_UBUF from an allocat=
ion
failure in the ITER_IOVEC case. In a control build using ||, valid PREAD an=
d
both one- and two-segment PREADV submissions failed with -ENOMEM.

The issue I observed was instead in the later completion test:

        if (priv->to_free =3D=3D NULL || unlikely(req->actual =3D=3D 0)) {

As I understand it, this later test treats a NULL to_free pointer as meanin=
g
that no userspace copy is needed. In this path, however, to_free stores the
pointer returned by dup_iter() and tracks separately allocated iterator
backing, rather than whether the saved iterator has a destination.

For this issue, the relevant change was to base the later copy decision on
iov_iter_count(&priv->to); I did not change the ep_read_iter() condition. W=
ith
the original test, native PREAD reported res=3D511 while the destination bu=
ffer
remained unchanged. After this change, native PREAD and one-segment PREADV
copied the payload correctly, and two-segment PREADV continued to work.

My previous description of to_free as a predicate was inaccurate. I was
referring to its later completion-side use as a copy/no-copy indicator.

> I understood that it was okay to call usb_ep_free_request() after
> usb_ep_disable(). Was that wrong? Did you see it create any problems?

Your understanding matches the behavior I observed under dummy_hcd. For bot=
h
PWRITE and PREAD, I kept a completed, unqueued request allocated until afte=
r
usb_ep_disable() returned, with no intervening usb_ep_dequeue(). In each ca=
se,
the request completed exactly once with the expected result; the subsequent
usb_ep_free_request() produced no KASAN report or Oops.

Separately, in an intermediate version I observed usb_ep_free_request()
running while usb_ep_disable() was still in progress. Because that version
moved normal request cleanup into a worker, I used the existing endpoint mu=
tex
to prevent the worker's usb_ep_free_request() call from overlapping endpoin=
t
disable while I investigated the ordering. The mutex eliminated the overlap=
,
but I did not reproduce a failure without it, so these tests did not establ=
ish
that the serialization was required.

The endpoint-use ordering I could reproduce in a directed dummy_hcd diagnos=
tic
was different: without waiting for unlink work before endpoint disable,
ep_unlink_worker() could call usb_ep_dequeue() while usb_ep_disable() was i=
n
progress. In matched PWRITE and PREAD tests, the variant without the
pre-disable unlink-work wait produced this overlap; with the wait retained,
usb_ep_dequeue() completed before usb_ep_disable() began.

I did not reproduce a KASAN report, Oops, or userspace failure from the
concurrent dequeue/disable overlap itself. I retained the pre-disable wait =
in
the narrower test version as a conservative interpretation of the
usb_ep_disable() requirement that no other task be using the endpoint when =
it
is called.

> This is probably because you were flushing the workqueues at the wrong
> time.

Yes. In the callback-gate test, the relevant workqueue flush returned
while the completion callback was stopped before queueing its follow-up wor=
k.
In the narrower test version, I incremented aio_producers before
usb_ep_queue() and decremented it only after the callback had either queued
the required follow-up work or completed the immediate AIO result without
leaving deferred work to publish. If usb_ep_queue() failed, the submission
path decremented it directly. With that change, gadgetfs_unbind() remained
blocked in the producer wait while the callback was gated. It proceeded to
flush the completion workqueue only after the callback queued the follow-up
work.

In the delayed-worker test, module unload completed before the running
unlink_work returned. This confirmed that module unload must not complete
while such work is still running.

> For the final submission, I think the workqueue management stuff should
> go into its own separate patch.

Separating the workqueue management changes from the AIO race fixes makes
sense. Thank you also for the reminder about -p.

> Second, why did you change ep_aio_complete() to make it queue up
> ep_user_copy_worker() even when nothing needed to be copied to
> userspace?

My reason for routing every completion through ep_user_copy_worker() was to
make a common deferred completion and request-cleanup stage visible to a
workqueue flush during teardown, not because every request needed a userspa=
ce
copy. In the normal non-unlink path of that cumulative design, the worker
released the USB request and epdata reference before calling ki_complete(),
and then published AIO_GIVEN_BACK. Since ki_complete() could drop the last =
AIO
file reference and allow ep_release() to begin, the intent was to prevent
teardown from passing the completion-work flush before that cleanup had
finished. A gate placed between cleanup and ki_complete() confirmed that th=
e
flush covered this no-copy PWRITE cleanup: unbind reached
flush_workqueue(gadgetfs_copy_wq) but did not return until the worker was
released.

I agree that using the worker for every completion was broader than necessa=
ry
for copy handling. The narrower behavior I tested retains aio_producers but
queues copy work only when iov_iter_count(&priv->to) and req->actual are bo=
th
nonzero. Nonzero PREAD and the one- and two-segment PREADV cases invoked th=
e
copy worker, while PWRITE, PWRITEV, and zero-length reads and writes did no=
t.
This indicates that no-copy paths do not need ep_user_copy_worker() merely =
for
copy handling. Their cleanup ordering and the separate teardown lifetime
issue can be considered independently of that routing decision.

Looking back, trying to address all of the observed issues in one cumulativ=
e
patch made it harder to separate and review the purpose of each change.
Considering the issues independently may also make it easier to identify a
simpler approach for some of them. I hope these clarifications and test
results are useful.

Thank you again for your comments.

Best regards,
Minseo Kim

2026=EB=85=84 8=EC=9B=94 30=EC=9D=BC (=EC=9D=BC) =EC=98=A4=EC=A0=84 1:08, A=
lan Stern <stern@rowland.harvard.edu>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Fri, Aug 28, 2026 at 03:30:10PM -0500, neck3922@gmail.com wrote:
> > Hi Alan,
> >
> > Thank you for the revised patch and for explaining the intended use of
> > the saved endpoint.
> >
> > I applied the patch as posted to upstream v7.2-rc1, commit
> > dc59e4fea9d83f03bad6bddf3fa2e52491777482.
> >
> > I first tested your revision unchanged. The IRQ-state fix and saved
> > endpoint behaved as intended. The exact pre-queue cancellation matrix
> > produced exactly one expected completion in every case, with no KASAN,
> > Oops, or LOCKDEP output. The original ep_aio_cancel() null-ptr-deref
> > and UAF signatures, the earlier ep_aio() submit-path regressions, and t=
he
> > teardown NULL-endpoint failure did not recur in these tests.
>
> All good results.
>
> > > I think it will still be necessary to flush the workqueue after
> > > destroy_ep_files() runs.  The best way to check whether this is neede=
d
> > > would be to put a long delay right at the start of ep_unlink_worker()
> > > and then run a test where during that delay, the test program closes =
its
> > > open files, unmounts the directory, and unloads the gadgetfs module.
> >
> > Using CONFIG_USB_GADGETFS=3Dm on the posted revision, I inserted a
> > diagnostic 15-second delay at the entry of ep_unlink_worker(). While th=
e
> > worker was delayed, the test process had no open /dev/gadget/* file
> > descriptors, GadgetFS unmounted successfully, the gadgetfs module
> > reference count reached zero, and rmmod succeeded before the delay ende=
d.
> > The delay was diagnostic only.
> >
> > When the delayed worker resumed, the kernel warned and then panicked. T=
he
> > serial log showed an unresolved work-function address and identified
> > gadgetfs as the last unloaded module:
> >
> >   Modules linked in: dummy_hcd [last unloaded: gadgetfs(O)]
> >
> > Thus, in this path, a running unlink_work item does not pin the gadgetf=
s
> > module. Teardown must quiesce pending or running GadgetFS AIO work befo=
re
> > module unload, or otherwise retain the module until that work completes=
.
>
> Indeed.  Quiescing won't be easy to do; it will just have to wait until
> the work is complete.  In other words, flush the workqueue.
>
> > While rerunning the directed cross-CPU test from my previous message, I
> > found that the underlying lifetime race involving ep_unlink_worker()
> > remained:
> >
> >   BUG: KASAN: slab-use-after-free in ep_unlink_worker
> >   Read of size 8
> >   drivers/usb/gadget/legacy/inode.c:489
> >
> > The faulting statement was:
> >
> >   put_ep(priv->epdata);
> >
> > After AIO_UNLINK_DONE was published, completion work could free priv
> > before the unlink worker's final accesses through priv. Saving epdata a=
nd
> > ep before usb_ep_dequeue() eliminated the failure in the directed test.
>
> Ah, yes.  I should have realized that last time.  I just didn't think
> hard enough about how the ordering could interact with those tests at
> the end of ep_unlink_worker().  (Or maybe I did and then forgot to
> include the changes into the patch -- I can't remember.)  Anyway, my
> version of the patch has been updated accordingly.
>
> > Based on our discussion and the results above, I prepared the cumulativ=
e
> > patch below, incorporating your latest revision. It also fixes an
> > existing native PREAD issue: the to_free predicate could skip copying a=
n
> > ITER_UBUF payload while still reporting success.
>
> I'm not sure what you're referring to.  Are you saying that this test
> in ep_read_iter():
>
>                 if (!iter_is_ubuf(&priv->to) && !priv->to_free) {
>
> is wrong, for example, the && should be || ?  In fact, I don't
> understand the reason for the iter_is_ubuf() check at all.
>
> Note that to_free isn't a predicate; rather it's a pointer to a copy of
> an iov_iter structure.
>
> > During development and validation, I found two further ordering issues.
> > In the existing completion ordering, request cleanup could overlap
> > usb_ep_disable() during final endpoint release.
>
> Yes, I know.  I understood that it was okay to call
> usb_ep_free_request() after usb_ep_disable().  Was that wrong?  Did you
> see it create any problems?
>
> Note that usb_ep_disable() doesn't return until all the requests queued
> for that endpoint have completed.  So ep_aio_complete() will have run,
> but the work routines may still be pending.
>
> >  Separately, an
> > intermediate cumulative version allowed gadgetfs_unbind() to pass the
> > completion-work flush before a callback had queued that work.
>
> This is probably because you were flushing the workqueues at the wrong
> time.
>
> For the final submission, I think the workqueue management stuff should
> go into its own separate patch.  Straightening out the various AIO races
> is already complicated enough by itself.
>
> >  The
> > resulting patch addresses all three issues and applies directly to
> > upstream v7.2-rc1.
>
> I'll review the patch later.  For now, there's two things to mention.
> First, when you create your patches, it would help to add the -p
> option to the diff command.
>
> Second, why did you change ep_aio_complete() to make it queue up
> ep_user_copy_worker() even when nothing needed to be copied to
> userspace?  It's a bad idea to run a workqueue routine if it isn't
> necessary.
>
> Alan Stern
