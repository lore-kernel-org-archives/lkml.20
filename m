Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1E64A3F3F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 14:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788530438; cv=pass; b=tY1rPA62Do53OQyqjHs00NTb/Szio+4E4e1wMfK0vaiN7G1UNOq83vuq7U54pZfRY9NoPaEG3gN7HYPgVPknWH27Z28ur1Xzgf28V6tKuP3LaNgGgP963nL7JTQRAP5SKIgM3O9ChQuWh1msXBV//jjnWdt+PEw/XnbaGEgB/B8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788530438; c=relaxed/simple;
	bh=Oc8OS1ADmlSvCOef+yfe3PxktGwkWHtA/R/40RKq80M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XvrtpIkdBVYywt1SmO6V6KPu7JIeIWRnXi8lLM2Xuui0afmM8oo34ro3kh7TlGoe3W00qXPmyZ8DNnR1fXts3GJ/LatbJQyu+DwlOOWs9AdNAqNewvwjkMh40Q1Y7y9dcT/4DHq+LHDRTzGNJh94iaulFcflTldpVCuOas0PKGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xv87JKES; arc=pass smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xv87JKES"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-90e970f710cso11510386d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 07:00:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788530436; cv=none;
        d=google.com; s=arc-20260327;
        b=IC+3h2Urpp3g5NbztA8Rxf0sibgWUTVtXXkW/atcQ9sI3QpxxOjgsRRSc4RS4sP2zY
         nleVzcn6eHsnOXm+9UI3v8gcY3m2wizLcppjqlkDtVvCplJ1AMtdiedAujdpb5x4N1SA
         i/voggL/xAnx4K0yeshyt4FK7qJ44vwLGdVWtBhcoyNibe3cqL95PFwa5MuigoYJPmSZ
         D0RvYXjh8/cUHWQS888fq7IoJ73LGsDOYVS/HH3O226NT2QKQc204f8C0QHK4I5XfIYy
         fk1/YeNOunUiRX9k0+ebTjQ+BpuuddFPzQq7qQTze1xAva1AigzayuTe5/4Fci/jx5dB
         twPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ofDfe8jD5zfRfq4A3eDTvqFMLAmy/sulkob5dvVCeaU=;
        fh=Y05isv7LUk+W0U8vAsAWxjmHasvrps8/EgcrMH6nwLI=;
        b=pCCZ022R8aeIUyYGx5Wy8vvIJoLZJF7lAqgpvNfPmE9KF/ksIjmkWsdqiimcfSTBdC
         bwBAbxad0CbxP3HWoqUzcbhW4pSOCwGExI2WUnrwnHU7K0afyzwtE596oUe9FwZL8xeB
         Zns5fjuNmxCgDeGM5sxAMl9BXO02Ee/BaeBHgxki88clIvaagtEerlOQ0EobZwCIKItL
         oDI2g8vurGYQu5JntwE94hr4k8ek8w7ixIdA0oLNpKVcWg6LBTPcataBeTNghDZXc4qA
         8GQQmdkUri/Ws99SZrKe/4fXgvOryCadX89pMOO7VuT6UWiJkdfHRY3edrcWr54IDoP6
         ABrQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788530436; x=1789135236; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ofDfe8jD5zfRfq4A3eDTvqFMLAmy/sulkob5dvVCeaU=;
        b=Xv87JKESJs02xfEq/JYBPp++PGBs1UH+jTHLQKMcF1qpRaaAj/t25kWPKBHVIvQ8Z3
         9ExS81ZeZ14zFacDKk97xtE7ccETzC1Bhh1HvPJpD6fmbY8WEtAd1vTJXeUprzT3BQrU
         jRkIhLFgj/MwDwJ0GWL+d3Zzk7khufOCqHV7LSlGFYAU/dwOik+H/So502EG6ct5WM2Z
         sd9QYE0Spj0T/770yHmG+CPM4MttlybVXwJR/D0uygy2d23ErG9NKqplGQSIGW26AV+/
         2/eVjnvlTwczVBdoT4Tuinx9x91nkw12U8ffp1vVat2EE7C03Ze0OlkZXnm58yAUfcxG
         2ejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788530436; x=1789135236;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ofDfe8jD5zfRfq4A3eDTvqFMLAmy/sulkob5dvVCeaU=;
        b=Bg6Pxwo5sxxTfIoCeuDo2n4ZAgSlclDYLM82Ewr2QiuqiS/0BJSBcZfjwoZadJ8wYi
         6E+OOw52UI8RDYKtJbfilLP+vaAKXKaj4Whi0bceERpnj43c1Gin+C4+7Lx1wqvC/gDH
         NQUpCgyEqbl26rhzVlVFfEifzld48gYbRNQP4UZTHa3uOpSrIih3ZwdDts/BM3mi4f1J
         /dyk6xspF2ugKN0xVxJlQu1y5NCjAnTaJV4OCPT3AMt7aU3fgDhYIw4sbmMnjou6yXYA
         Sk2vkagtAmFtFEXdZZimaH+sCGt5y7h20rPEmJbTA0rrWTcrK5XUIIDRK4Csi4oA4Tk3
         K0bA==
X-Forwarded-Encrypted: i=1; AKwUvBzBnzuGjs9w0hxyQVPH3R4QkGpvq9fgK942/XQBixWMaypRFyICCirr/eoNBtexEO5u4iXW6xvSpkkNLCg=@vger.kernel.org
X-Gm-Message-State: AFuF++niHxvDcz4//wGkAUE9Xa/kRDbgHMP3ti9/6oswXDKe44S9nx9j
	zmmnvz6b1AorXh5VrdjEh5Q5foZndVtO0Ef1h2wX51pSTuZ2IsIFGwNe3PbNSExkyP6BCS6pzjo
	L3Aj4XsYY37quplln27ps2zGOpPSyPQY=
X-Gm-Gg: AYBFou0WdNYUw92Mad8kfIPGZQkMHnRdRIu8duTsL5zymzCbQk9MfjCzqsO7RoSjtW9
	UQ+a7M7TW0mVtHE5CkwW5Iibs+UR1RJlqLnyhKt3DqlFm6WEWriP2FFsd7n7ufGij8UasonH7C2
	DuMq0v+26pOpBuJk2J+OEnRpiIWJsszub+ly+KXRQ/MT4O3LQKWVCZekcluJ2Tpz1uRmq/haBbj
	OSCvcnlUSYtr4CHu5QrZxoXOiL5idBU3by2plrZpQH1CPuh7zYTc0phviEdypSd7dhfeL2XSee9
	KpSX5rlprOIN+9vPBoMHziOEiYHApOIVgwGWDPmugcnX
X-Received: by 2002:a05:6214:62c:b0:910:2f02:8c33 with SMTP id
 6a1803df08f44-9103eec3624mr69543256d6.0.1788530434915; Fri, 04 Sep 2026
 07:00:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <15185c2d-4544-42cc-ba0a-79dd36e82a21@rowland.harvard.edu>
 <CAFmvuTU=t5TiZSpHmF1MXpVs+3K7G1VOTDeeazwGru4+1eozBg@mail.gmail.com>
 <cd57f283-71e6-4531-a311-1180ccc22ab8@rowland.harvard.edu>
 <CAFmvuTVH=mVMZNoYnU07_WA+cBc4m+UG2BBTLwF5KWhcj-z-KA@mail.gmail.com>
 <908a5b29-e6d8-4595-b451-6c328e25c60e@rowland.harvard.edu>
 <CAFmvuTU5HnBKbve=v_C7Mhw2586rR_8qsRNua2XPokgKy_o31w@mail.gmail.com>
 <0305182d-5914-4022-a0a6-1ab4221b0a6c@rowland.harvard.edu>
 <CAFmvuTULxq6O0t7FyhEwnGVdMMpbj1yZrPN6mVRDWTgF0ODJxg@mail.gmail.com>
 <1b92cd86-fe64-43eb-9539-53a559cd14e3@rowland.harvard.edu>
 <CAFmvuTWw90k+Fvs5Ve=1nxCDSQrzH7rytY-3vjGwv=edQOCBPw@mail.gmail.com> <fb56064c-6481-44b3-88e5-8e5ff7b85703@rowland.harvard.edu>
In-Reply-To: <fb56064c-6481-44b3-88e5-8e5ff7b85703@rowland.harvard.edu>
From: Minseo Kim <neck3922@gmail.com>
Date: Fri, 4 Sep 2026 23:00:23 +0900
X-Gm-Features: AcwNN1XH05ar0tbJQrtYyWs02A4Lb9zPuSMxcu8rhQ3VCIg16HPN_Lxq4Ocsj0o
Message-ID: <CAFmvuTXWxQJUZfAAC=vs5QM=myDLE-o0jZZ8OXdqiGioPkRwfA@mail.gmail.com>
Subject: Re: [BUG] usb: gadgetfs: KASAN null-ptr-deref and intermittent UAF in ep_aio_cancel()
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrey Konovalov <andreyknvl@gmail.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Thank you for the updated patch.

> If you trim your patch down to the parts that only target the AIO races,
> do you get anything significantly different from my version?

I compared your current patch with my AIO-only version and found no
significant difference in the AIO cancellation state machine or IRQ-state
handling.

Both versions snapshot epdata and ep alongside req before
usb_ep_dequeue(). In the directed cross-CPU test, a control based on your
current patch but without the local snapshots of epdata and ep reproduced
the earlier ep_unlink_worker() UAF; I did not reproduce it with your
current patch.

The only substantive implementation difference I found in the AIO-only
comparison was the criterion used alongside the req->actual check to
decide whether to queue copy work. My version used
iov_iter_count(&priv->to), whereas your current patch uses the explicit
is_read flag. I agree that is_read makes this decision more explicit and
avoids requiring the reader to infer it from how priv->to is initialized.

With your current patch, native PREAD and one- and two-segment PREADV
copied their payloads correctly. PWRITE, PWRITEV, and zero-length PREAD
and PWRITE completed without invoking ep_user_copy_worker().

I also reran the original null-ptr-deref and UAF reproducers, the exact
pre-queue cancellation matrix, and the reproducers for the earlier
candidate-patch regressions. I separately tested deferred giveback,
forced dequeue failure, and the earlier NULL-endpoint case. All of these
tests produced the expected results, and none of the corresponding
earlier failure signatures recurred.

One small point in the ep_aio_cancel() comment: as I understand it, the
completion function pointer in struct kiocb is named ki_complete, which
is also the name I used in my previous message. I wondered whether
iocb->kio_complete() was intended to be iocb->ki_complete().

Thank you again for updating the patch.

With great respect and appreciation,
Minseo Kim

2026=EB=85=84 9=EC=9B=94 1=EC=9D=BC (=ED=99=94) =EC=98=A4=EC=A0=84 11:47, A=
lan Stern <stern@rowland.harvard.edu>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Mon, Aug 31, 2026 at 10:30:08PM +0900, Minseo Kim wrote:
> > Hi Alan,
> >
> > Thank you for the comments and for pointing out where my explanation wa=
s
> > unclear.
> >
> > > Are you saying that this test in ep_read_iter():
> > >
> > >         if (!iter_is_ubuf(&priv->to) && !priv->to_free) {
> > >
> > > is wrong, for example, the && should be || ?
> >
> > No. The && condition should remain as it is. dup_iter() copies the iter=
ator
> > state into priv->to. In my tests, native PREAD and a one-segment PREADV=
 used
> > ITER_UBUF. Since ITER_UBUF has no separate iovec array to duplicate,
> > dup_iter() returned NULL while the copied iterator remained valid. My
> > two-segment PREADV test used ITER_IOVEC; there, a NULL return would mea=
n that
> > allocation of the duplicated iovec array failed. The iter_is_ubuf() che=
ck
> > therefore distinguishes the valid NULL return for ITER_UBUF from an all=
ocation
> > failure in the ITER_IOVEC case. In a control build using ||, valid PREA=
D and
> > both one- and two-segment PREADV submissions failed with -ENOMEM.
> >
> > The issue I observed was instead in the later completion test:
> >
> >         if (priv->to_free =3D=3D NULL || unlikely(req->actual =3D=3D 0)=
) {
> >
> > As I understand it, this later test treats a NULL to_free pointer as me=
aning
> > that no userspace copy is needed. In this path, however, to_free stores=
 the
> > pointer returned by dup_iter() and tracks separately allocated iterator
> > backing, rather than whether the saved iterator has a destination.
>
> Okay, I see.  I had assumed that the information about the userspace
> buffer was contained in the region that to_free points to.
>
> > For this issue, the relevant change was to base the later copy decision=
 on
> > iov_iter_count(&priv->to); I did not change the ep_read_iter() conditio=
n. With
> > the original test, native PREAD reported res=3D511 while the destinatio=
n buffer
> > remained unchanged. After this change, native PREAD and one-segment PRE=
ADV
> > copied the payload correctly, and two-segment PREADV continued to work.
>
> While that's a valid solution, it would be more straightforward to add
> an "is_read" flag to the priv structure.  If an aio operation isn't a
> read then there certainly won't be anything to copy back to userspace
> upon completion.  This doesn't require people reading the source to know
> anything about the internal details of struct iov_iter.  And it is a
> better match to the immediately preceding comment.
>
> > My previous description of to_free as a predicate was inaccurate. I was
> > referring to its later completion-side use as a copy/no-copy indicator.
> >
> > > I understood that it was okay to call usb_ep_free_request() after
> > > usb_ep_disable(). Was that wrong? Did you see it create any problems?
> >
> > Your understanding matches the behavior I observed under dummy_hcd. For=
 both
> > PWRITE and PREAD, I kept a completed, unqueued request allocated until =
after
> > usb_ep_disable() returned, with no intervening usb_ep_dequeue(). In eac=
h case,
> > the request completed exactly once with the expected result; the subseq=
uent
> > usb_ep_free_request() produced no KASAN report or Oops.
> >
> > Separately, in an intermediate version I observed usb_ep_free_request()
> > running while usb_ep_disable() was still in progress. Because that vers=
ion
> > moved normal request cleanup into a worker, I used the existing endpoin=
t mutex
> > to prevent the worker's usb_ep_free_request() call from overlapping end=
point
> > disable while I investigated the ordering. The mutex eliminated the ove=
rlap,
> > but I did not reproduce a failure without it, so these tests did not es=
tablish
> > that the serialization was required.
>
> Good, so we don't need to worry about that.
>
> > The endpoint-use ordering I could reproduce in a directed dummy_hcd dia=
gnostic
> > was different: without waiting for unlink work before endpoint disable,
> > ep_unlink_worker() could call usb_ep_dequeue() while usb_ep_disable() w=
as in
> > progress. In matched PWRITE and PREAD tests, the variant without the
> > pre-disable unlink-work wait produced this overlap; with the wait retai=
ned,
> > usb_ep_dequeue() completed before usb_ep_disable() began.
> >
> > I did not reproduce a KASAN report, Oops, or userspace failure from the
> > concurrent dequeue/disable overlap itself. I retained the pre-disable w=
ait in
> > the narrower test version as a conservative interpretation of the
> > usb_ep_disable() requirement that no other task be using the endpoint w=
hen it
> > is called.
>
> We don't need to be that conservative here.  And in fact, I'm not
> entirely sure what that comment in usb_ep_disable() was intended to
> mean.  Since the function doesn't cause the UDC driver's endpoint data
> structure to be deallocated, there isn't much to be careful of.
>
> > > This is probably because you were flushing the workqueues at the wron=
g
> > > time.
> >
> > Yes. In the callback-gate test, the relevant workqueue flush returned
> > while the completion callback was stopped before queueing its follow-up=
 work.
> > In the narrower test version, I incremented aio_producers before
> > usb_ep_queue() and decremented it only after the callback had either qu=
eued
> > the required follow-up work or completed the immediate AIO result witho=
ut
> > leaving deferred work to publish. If usb_ep_queue() failed, the submiss=
ion
> > path decremented it directly. With that change, gadgetfs_unbind() remai=
ned
> > blocked in the producer wait while the callback was gated. It proceeded=
 to
> > flush the completion workqueue only after the callback queued the follo=
w-up
> > work.
> >
> > In the delayed-worker test, module unload completed before the running
> > unlink_work returned. This confirmed that module unload must not comple=
te
> > while such work is still running.
> >
> > > For the final submission, I think the workqueue management stuff shou=
ld
> > > go into its own separate patch.
> >
> > Separating the workqueue management changes from the AIO race fixes mak=
es
> > sense. Thank you also for the reminder about -p.
>
> So let's worry about the workqueue stuff later and concentrate for now
> just on fixing the AIO races.
>
> > > Second, why did you change ep_aio_complete() to make it queue up
> > > ep_user_copy_worker() even when nothing needed to be copied to
> > > userspace?
> >
> > My reason for routing every completion through ep_user_copy_worker() wa=
s to
> > make a common deferred completion and request-cleanup stage visible to =
a
> > workqueue flush during teardown, not because every request needed a use=
rspace
> > copy. In the normal non-unlink path of that cumulative design, the work=
er
> > released the USB request and epdata reference before calling ki_complet=
e(),
> > and then published AIO_GIVEN_BACK. Since ki_complete() could drop the l=
ast AIO
> > file reference and allow ep_release() to begin, the intent was to preve=
nt
> > teardown from passing the completion-work flush before that cleanup had
> > finished. A gate placed between cleanup and ki_complete() confirmed tha=
t the
> > flush covered this no-copy PWRITE cleanup: unbind reached
> > flush_workqueue(gadgetfs_copy_wq) but did not return until the worker w=
as
> > released.
> >
> > I agree that using the worker for every completion was broader than nec=
essary
> > for copy handling. The narrower behavior I tested retains aio_producers=
 but
> > queues copy work only when iov_iter_count(&priv->to) and req->actual ar=
e both
> > nonzero. Nonzero PREAD and the one- and two-segment PREADV cases invoke=
d the
> > copy worker, while PWRITE, PWRITEV, and zero-length reads and writes di=
d not.
> > This indicates that no-copy paths do not need ep_user_copy_worker() mer=
ely for
> > copy handling. Their cleanup ordering and the separate teardown lifetim=
e
> > issue can be considered independently of that routing decision.
>
> And since your decision was based on handling the workqueue flushing, it
> can be put off until later.
>
> If you trim your patch down to the parts that only target the AIO races,
> do you get anything significantly different from my version?  I did see
> that you added or changed a few comments, and I have updated my version
> of the patch in a couple of respects, but overall yours must end up
> being pretty similar to mine.  Please point out any differences you
> believe are worth mentioning.  My current version is below.
>
> > Looking back, trying to address all of the observed issues in one cumul=
ative
> > patch made it harder to separate and review the purpose of each change.
> > Considering the issues independently may also make it easier to identif=
y a
> > simpler approach for some of them. I hope these clarifications and test
> > results are useful.
>
> I'm sure they will be.
>
> Alan Stern
>
>
> Index: usb-devel/drivers/usb/gadget/legacy/inode.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- usb-devel.orig/drivers/usb/gadget/legacy/inode.c
> +++ usb-devel/drivers/usb/gadget/legacy/inode.c
> @@ -236,6 +236,8 @@ static void put_ep (struct ep_data *data
>  static const char *CHIP;
>  static DEFINE_MUTEX(sb_mutex);         /* Serialize superblock operation=
s */
>
> +static DEFINE_SPINLOCK(aio_lock);      /* Protect aio cancellation info =
*/
> +
>  /*----------------------------------------------------------------------=
*/
>
>  /* NOTE:  don't use dev_printk calls before binding to the gadget
> @@ -433,40 +435,105 @@ static long ep_ioctl(struct file *fd, un
>
>  /* ASYNCHRONOUS ENDPOINT I/O OPERATIONS (bulk/intr/iso) */
>
> +enum aio_req_state {
> +       AIO_SUBMITTING,
> +       AIO_RUNNING,
> +       AIO_COMPLETED,
> +       AIO_GIVEN_BACK,
> +};
> +
> +enum aio_cancel_state {
> +       AIO_NOT_CANCELLED,
> +       AIO_UNLINKING,
> +       AIO_UNLINK_DONE,
> +};
> +
>  struct kiocb_priv {
>         struct usb_request      *req;
>         struct ep_data          *epdata;
> +       struct usb_ep           *ep;
>         struct kiocb            *iocb;
>         struct mm_struct        *mm;
> -       struct work_struct      work;
> +       struct work_struct      copy_work;
> +       struct work_struct      unlink_work;
>         void                    *buf;
>         struct iov_iter         to;
>         const void              *to_free;
>         unsigned                actual;
> +       enum aio_req_state      req_state;
> +       enum aio_cancel_state   cancel_state;
> +       bool                    is_read;
>  };
>
> -static int ep_aio_cancel(struct kiocb *iocb)
> +static void ep_unlink_worker(struct work_struct *work)
>  {
> -       struct kiocb_priv       *priv =3D iocb->private;
> +       struct kiocb_priv       *priv;
> +       struct usb_request      *req;
>         struct ep_data          *epdata;
> -       int                     value;
> +       struct usb_ep           *ep;
> +       enum aio_req_state      req_state;
>
> -       local_irq_disable();
> +       priv =3D container_of(work, struct kiocb_priv, unlink_work);
> +       req =3D priv->req;
>         epdata =3D priv->epdata;
> -       // spin_lock(&epdata->dev->lock);
> -       if (likely(epdata && epdata->ep && priv->req))
> -               value =3D usb_ep_dequeue (epdata->ep, priv->req);
> -       else
> -               value =3D -EINVAL;
> -       // spin_unlock(&epdata->dev->lock);
> -       local_irq_enable();
> +       ep =3D priv->ep;
>
> -       return value;
> +       usb_ep_dequeue(ep, req);
> +
> +       spin_lock_irq(&aio_lock);
> +       req_state =3D priv->req_state;
> +       priv->cancel_state =3D AIO_UNLINK_DONE;
> +       spin_unlock_irq(&aio_lock);
> +
> +       /*
> +        * req and epdata are freed after unlinking and completion are bo=
th done.
> +        * priv is freed after unlinking and giveback are both done.
> +        */
> +       if (req_state >=3D AIO_COMPLETED) {
> +               /* priv may have been freed already */
> +               usb_ep_free_request(ep, req);
> +               put_ep(epdata);
> +               if (req_state =3D=3D AIO_GIVEN_BACK)
> +                       kfree(priv);
> +       }
> +}
> +
> +static int ep_aio_cancel(struct kiocb *iocb)
> +{
> +       struct kiocb_priv       *priv;
> +       unsigned long           flags;
> +
> +       spin_lock_irqsave(&aio_lock, flags);
> +       priv =3D iocb->private;
> +       if (!priv || priv->cancel_state !=3D AIO_NOT_CANCELLED) {
> +               spin_unlock_irqrestore(&aio_lock, flags);
> +               return -EINVAL;         /* Already completed or cancelled=
 */
> +       }
> +       if (priv->req_state =3D=3D AIO_SUBMITTING) {
> +               priv->cancel_state =3D AIO_UNLINK_DONE;
> +               spin_unlock_irqrestore(&aio_lock, flags);
> +               return 0;       /* ep_aio() will call us again if needed =
*/
> +       }
> +
> +       priv->cancel_state =3D AIO_UNLINKING;
> +       spin_unlock_irqrestore(&aio_lock, flags);
> +
> +       /*
> +        * We are called with the aio core holding iocb's context lock.
> +        * usb_ep_dequeue() is allowed to run synchronously, calling the
> +        * completion handler ep_aio_complete() before it returns.
> +        * But ep_aio_complete() may call iocb->kio_complete(), which
> +        * tries to acquire the context lock, leading to deadlock.
> +        * For this reason, do the dequeue operation in a work routine.
> +        */
> +       INIT_WORK(&priv->unlink_work, ep_unlink_worker);
> +       schedule_work(&priv->unlink_work);
> +       return 0;
>  }
>
>  static void ep_user_copy_worker(struct work_struct *work)
>  {
> -       struct kiocb_priv *priv =3D container_of(work, struct kiocb_priv,=
 work);
> +       struct kiocb_priv *priv =3D container_of(work, struct kiocb_priv,=
 copy_work);
>         struct mm_struct *mm =3D priv->mm;
>         struct kiocb *iocb =3D priv->iocb;
>         size_t ret;
> @@ -482,46 +549,62 @@ static void ep_user_copy_worker(struct w
>
>         kfree(priv->buf);
>         kfree(priv->to_free);
> -       kfree(priv);
> +
> +       spin_lock_irq(&aio_lock);
> +       priv->req_state =3D AIO_GIVEN_BACK;
> +       if (priv->cancel_state !=3D AIO_UNLINKING)
> +               kfree(priv);
> +       spin_unlock_irq(&aio_lock);
>  }
>
>  static void ep_aio_complete(struct usb_ep *ep, struct usb_request *req)
>  {
>         struct kiocb            *iocb =3D req->context;
>         struct kiocb_priv       *priv =3D iocb->private;
> -       struct ep_data          *epdata =3D priv->epdata;
> +       enum aio_req_state      new_req_state;
> +       enum aio_cancel_state   cancel_state;
>
> -       /* lock against disconnect (and ideally, cancel) */
> -       spin_lock(&epdata->dev->lock);
> -       priv->req =3D NULL;
> -       priv->epdata =3D NULL;
> +       /* Prevent future cancellation */
> +       spin_lock(&aio_lock);
> +       iocb->private =3D NULL;
> +       spin_unlock(&aio_lock);
>
>         /* if this was a write or a read returning no data then we
>          * don't need to copy anything to userspace, so we can
>          * complete the aio request immediately.
>          */
> -       if (priv->to_free =3D=3D NULL || unlikely(req->actual =3D=3D 0)) =
{
> +       if (!priv->is_read || unlikely(req->actual =3D=3D 0)) {
>                 kfree(req->buf);
>                 kfree(priv->to_free);
> -               kfree(priv);
> -               iocb->private =3D NULL;
>                 iocb->ki_complete(iocb,
>                                 req->actual ? req->actual : (long)req->st=
atus);
> +               new_req_state =3D AIO_GIVEN_BACK;
>         } else {
>                 /* ep_copy_to_user() won't report both; we hide some faul=
ts */
>                 if (unlikely(0 !=3D req->status))
> -                       DBG(epdata->dev, "%s fault %d len %d\n",
> +                       DBG(priv->epdata->dev, "%s fault %d len %d\n",
>                                 ep->name, req->status, req->actual);
>
>                 priv->buf =3D req->buf;
>                 priv->actual =3D req->actual;
> -               INIT_WORK(&priv->work, ep_user_copy_worker);
> -               schedule_work(&priv->work);
> +               new_req_state =3D AIO_COMPLETED;
>         }
>
> -       usb_ep_free_request(ep, req);
> -       spin_unlock(&epdata->dev->lock);
> -       put_ep(epdata);
> +       spin_lock(&aio_lock);
> +       priv->req_state =3D new_req_state;
> +       cancel_state =3D priv->cancel_state;
> +       spin_unlock(&aio_lock);
> +
> +       if (new_req_state =3D=3D AIO_COMPLETED) {
> +               INIT_WORK(&priv->copy_work, ep_user_copy_worker);
> +               schedule_work(&priv->copy_work);
> +       }
> +       if (cancel_state !=3D AIO_UNLINKING) {
> +               usb_ep_free_request(ep, req);
> +               put_ep(priv->epdata);
> +               if (new_req_state =3D=3D AIO_GIVEN_BACK)
> +                       kfree(priv);
> +       }
>  }
>
>  static ssize_t ep_aio(struct kiocb *iocb,
> @@ -532,11 +615,12 @@ static ssize_t ep_aio(struct kiocb *iocb
>  {
>         struct usb_request *req;
>         ssize_t value;
> +       struct usb_ep *ep;
> +       bool need_unlink =3D false;
>
>         iocb->private =3D priv;
>         priv->iocb =3D iocb;
>
> -       kiocb_set_cancel_fn(iocb, ep_aio_cancel);
>         get_ep(epdata);
>         priv->epdata =3D epdata;
>         priv->actual =3D 0;
> @@ -547,10 +631,12 @@ static ssize_t ep_aio(struct kiocb *iocb
>          */
>         spin_lock_irq(&epdata->dev->lock);
>         value =3D -ENODEV;
> -       if (unlikely(epdata->ep =3D=3D NULL))
> +       ep =3D epdata->ep;
> +       if (unlikely(ep =3D=3D NULL))
>                 goto fail;
> +       priv->ep =3D ep;
>
> -       req =3D usb_ep_alloc_request(epdata->ep, GFP_ATOMIC);
> +       req =3D usb_ep_alloc_request(ep, GFP_ATOMIC);
>         value =3D -ENOMEM;
>         if (unlikely(!req))
>                 goto fail;
> @@ -560,12 +646,45 @@ static ssize_t ep_aio(struct kiocb *iocb
>         req->length =3D len;
>         req->complete =3D ep_aio_complete;
>         req->context =3D iocb;
> -       value =3D usb_ep_queue(epdata->ep, req, GFP_ATOMIC);
> +
> +       priv->req_state =3D AIO_SUBMITTING;
> +       priv->cancel_state =3D AIO_NOT_CANCELLED;
> +
> +       /* Not allowed to manipulate the aio context while holding dev->l=
ock */
> +       ++epdata->dev->udc_usage;
> +       spin_unlock_irq(&epdata->dev->lock);
> +
> +       kiocb_set_cancel_fn(iocb, ep_aio_cancel);
> +       value =3D usb_ep_queue(ep, req, GFP_KERNEL);
> +
> +       spin_lock_irq(&epdata->dev->lock);
> +       --epdata->dev->udc_usage;
> +
>         if (unlikely(0 !=3D value)) {
> -               usb_ep_free_request(epdata->ep, req);
> +               spin_lock(&aio_lock);
> +               iocb->private =3D NULL;
> +               spin_unlock(&aio_lock);
> +
> +               usb_ep_free_request(ep, req);
>                 goto fail;
>         }
>         spin_unlock_irq(&epdata->dev->lock);
> +
> +       spin_lock_irq(&aio_lock);
> +       if (iocb->private !=3D NULL) {
> +               priv->req_state =3D AIO_RUNNING;
> +
> +               /* Cancelled before or just after submission? */
> +               if (priv->cancel_state =3D=3D AIO_UNLINK_DONE) {
> +                       priv->cancel_state =3D AIO_NOT_CANCELLED;
> +                       need_unlink =3D true;
> +               }
> +       }                       /* Otherwise already completed */
> +       spin_unlock_irq(&aio_lock);
> +
> +       if (need_unlink)        /* Redo cancel that was too early */
> +               ep_aio_cancel(iocb);
> +
>         return -EIOCBQUEUED;
>
>  fail:
> @@ -618,6 +737,7 @@ ep_read_iter(struct kiocb *iocb, struct
>                 value =3D -ENOMEM;
>                 if (!priv)
>                         goto fail;
> +               priv->is_read =3D true;
>                 priv->to_free =3D dup_iter(&priv->to, to, GFP_KERNEL);
>                 if (!iter_is_ubuf(&priv->to) && !priv->to_free) {
>                         kfree(priv);
