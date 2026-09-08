Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D83058FD07
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 16:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788886611; cv=none; b=fEHToRbTbCNyrnLFewonLYHMXon81RTisEY6Ha+ydkrtM5crTp8j9bIp3XBzZVzS1UE1TG95QXK52Z71ACnPIiN9618jbr4AjQ6tk0m92PHvXUAxabsi7Ir16AW69MxI1wDPH6dCcP4LVgwOBcWAL2t9exmnEnI0VDvcrVKX6sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788886611; c=relaxed/simple;
	bh=BhHfVbgvhHIUIZMh4BkA5k4S6S5/hsY/rTysZpSwZJg=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=LOq+wLLdfQoNVuDImQZLRRQz2onrRhnPnStEtXbGRZHg74AHClrSKF7FvRQCA3zDjstTpgBf63TxLojIcbIib6jx0bXX8XE1rwBUcWKXX3H+DiR0yA5RPcrkDTkBlhK2iHZE/kiYzD0lcIDuN+KbzwzkWEW1NN3TwnQeFyLydkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=EfMEebxp; arc=none smtp.client-ip=79.135.106.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="EfMEebxp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1788886604; x=1789145804;
	bh=PdfA9GP/f0ZEroSpjfTtnQ3Ci26w/KhLBOF/4rNNqsw=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=EfMEebxpMnTonT8vinhGRVAp/Wz6SnkmlOTKenUx6WTc4GL4feIQP3DJlK179Z09J
	 HK+DOaP4ye92kdPFQfXOD7owrT7KiFzOfoYvu7g7ZuL1fVH+RW2ANVMcoZAxp3/yAE
	 7hN6YgQL+XKlhYwGnDmm9t7DIZrKRdXuX25e1KxLg1aXabF7shQAeJA+sLH8Zrmzii
	 x2/lmWUNMX+l11lHceLWExYrKs/T3vG35Pl6EHUD8eV/YnJWxvHQPrLSx8uwT5JJU1
	 eaX8mJqRcdLamljpFqA5E3WAvu27ydW2b+JNz4jfSx37WuASdfYcZq6gduYkF+sV5A
	 llvF3DzhsZScQ==
Date: Tue, 08 Sep 2026 16:56:38 +0000
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Cole Munz <Munzzyy1@proton.me>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Udipto Goswami <quic_ugoswami@quicinc.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] usb: gadget: f_fs: only dequeue ep0req when it is queued
Message-ID: <fe62c0a656fe8870248e6a17641f6841bc66d65e.1788885869.git.Munzzyy1@proton.me>
Feedback-ID: 209578162:user:proton
X-Pm-Message-ID: 6b2b373ce6c46305bd6ff545f577d0d13e7af16c
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Commit ce405d561b02 ("usb: gadget: f_fs: Ensure ep0req is dequeued
before free_request") made functionfs_unbind() call usb_ep_dequeue()
on ep0req unconditionally before freeing it. That closed a real
use-after-free: a reader or writer parked in __ffs_ep0_queue_wait()
holds ffs->mutex and waits on ep0req_completion while the request is
in flight, and unbind has to force it to complete so that thread wakes
up, returns, and drops the mutex before the request is freed.

Problem is, unbind now dequeues every single time it runs, and the
parked-reader case is rare. Far more often ep0req already completed
on its own, or it was never queued in the first place because bind
failed before any control transfer reached us. dwc3 is not quiet
about the second case. dwc3_gadget_ep_dequeue() logs "request %p was
not queued to %s" whenever the request isn't sitting on one of the
endpoint's lists, so ordinary gadget teardown, and any boot where the
host never finished enumeration before the driver unbound, prints
that error right before the "failed to start ...: -19" that follows.

The fix is to track whether ep0req is actually queued on ep0, and
only call usb_ep_dequeue() in functionfs_unbind() when it is.
ep0req_queued gets set right before usb_ep_queue() in
__ffs_ep0_queue_wait(), cleared again if that call fails, and cleared
in ffs_ep0_complete() once the request comes back. The parked-reader
case still works the same way it always did: the flag stays true for
as long as the thread sits blocked in
wait_for_completion_interruptible(), so unbind still finds it queued
and still dequeues. In the other two cases the flag reads false and
unbind skips a call that was doing nothing anyway.

Fixes: ce405d561b02 ("usb: gadget: f_fs: Ensure ep0req is dequeued before f=
ree_request")
Assisted-by: LLM sparse
Signed-off-by: Cole Munz <Munzzyy1@proton.me>
---
This is the f_fs-side fix Thinh suggested on the dwc3 thread rather than
changing dwc3_gadget_ep_dequeue()'s return, and it also quiets the boot
case that the dwc3 change did not:
https://lore.kernel.org/linux-usb/aptrIbp-p6RNGd9X@vbox/

Built for arm64, f_fs.o compiles with no new warnings, sparse clean,
checkpatch --strict reports nothing. I can't flash a gadget here, so the
runtime side is reasoned from source, not tested on hardware.

 drivers/usb/gadget/function/f_fs.c | 11 ++++++++---
 drivers/usb/gadget/function/u_fs.h |  1 +
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/functi=
on/f_fs.c
index 43962e05eacf..a2308ad7d3db 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -307,6 +307,7 @@ static void ffs_ep0_complete(struct usb_ep *ep, struct =
usb_request *req)
 {
 =09struct ffs_data *ffs =3D req->context;
=20
+=09ffs->ep0req_queued =3D false;
 =09complete(&ffs->ep0req_completion);
 }
=20
@@ -338,9 +339,12 @@ static int __ffs_ep0_queue_wait(struct ffs_data *ffs, =
char *data, size_t len)
=20
 =09reinit_completion(&ffs->ep0req_completion);
=20
+=09ffs->ep0req_queued =3D true;
 =09ret =3D usb_ep_queue(ffs->gadget->ep0, req, GFP_ATOMIC);
-=09if (ret < 0)
+=09if (ret < 0) {
+=09=09ffs->ep0req_queued =3D false;
 =09=09return ret;
+=09}
=20
 =09ret =3D wait_for_completion_interruptible(&ffs->ep0req_completion);
 =09if (ret) {
@@ -2389,8 +2393,9 @@ static int functionfs_bind(struct ffs_data *ffs, stru=
ct usb_composite_dev *cdev)
 static void functionfs_unbind(struct ffs_data *ffs)
 {
 =09if (!WARN_ON(!ffs->gadget)) {
-=09=09/* dequeue before freeing ep0req */
-=09=09usb_ep_dequeue(ffs->gadget->ep0, ffs->ep0req);
+=09=09/* dequeue before freeing ep0req, but only if it's actually queued *=
/
+=09=09if (ffs->ep0req_queued)
+=09=09=09usb_ep_dequeue(ffs->gadget->ep0, ffs->ep0req);
 =09=09mutex_lock(&ffs->mutex);
 =09=09usb_ep_free_request(ffs->gadget->ep0, ffs->ep0req);
 =09=09ffs->ep0req =3D NULL;
diff --git a/drivers/usb/gadget/function/u_fs.h b/drivers/usb/gadget/functi=
on/u_fs.h
index c280c495fbd2..be9cfc8f43a5 100644
--- a/drivers/usb/gadget/function/u_fs.h
+++ b/drivers/usb/gadget/function/u_fs.h
@@ -172,6 +172,7 @@ struct ffs_data {
 =09 */
 =09struct usb_request=09=09*ep0req;=09=09/* P: mutex */
 =09struct completion=09=09ep0req_completion;=09/* P: mutex */
+=09bool=09=09=09=09ep0req_queued;=09=09/* P: mutex */
=20
 =09/* reference counter */
 =09refcount_t=09=09=09ref;
--=20
2.55.0


