Received: from mail-244116.protonmail.ch (mail-244116.protonmail.ch [109.224.244.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4582330B07
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 16:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788538452; cv=none; b=Fck6ruW0/x8/rerfvV+Ddfifh85qJLwlLWXD4NSY8A3cUCSB4P4iBd3Cd483Z5uJqoxXPfCF9To7d00KbhtLXIGbptteyeEgeF8cT4Eus1D8O4q9Lm75JDIinnxKHYObeEZE9Zg5YSNtAFw5Z9uARKQWIJKv6IdVkRDWB7u+8rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788538452; c=relaxed/simple;
	bh=xvExJA1Wwr3lzB1nnIpGE61Mk4aN5OWxLvFE4rsmZbA=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=HY94oMx/4tQnTNYkZCfXCEESzLxTGSy1t4MRJcnVli4oaxaxkOleyzGbOyWYLZv1LDl2k4YYDVLOG86MJG4M/+IF1KlpQTbprb8ZwIav6KO8vKfisIWRSuaaLtUPpKJCLJp8La6U+4FSssa0MynUMpzAtCMY1iiXhf2C6/7Yg24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=B95fsLb9; arc=none smtp.client-ip=109.224.244.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="B95fsLb9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1788538439; x=1788797639;
	bh=te/QaH28sd0OyguWKq5q5Hf7BLddgwybX8YanyHDOSs=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=B95fsLb9VWzna/UeYBd7Ht1dQqzQygudKaVeyvlQOjqH+uptv2kWqwiB7m06hAAN4
	 f5eGkRf0FsvAmPAg95FOLjSUzKStWKfLJA6fasGvlkpjVKMxjxyaPyQe2euFIPKwCT
	 KCl/U4FcU937dplvGjVEe1xkpnv8TBKGghyuO1RZ5AdKiqxjW7XLIGri6Q3NLyfkPj
	 7Y/eVu747CaW10IqtXVTF/7fQfVWz2Fsulh+jv/JxuZtBVKrv495wbjXNaBOKF2eAQ
	 lsZPi41Oj7zjH2WCYRdX9YCnYkJODnhRudvPmRXro7+cA5LuOb8l5L8zB6gj1kveaT
	 Vs+tNciJ2jRiQ==
Date: Fri, 04 Sep 2026 16:13:55 +0000
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Cole Munz <Munzzyy1@proton.me>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] usb: dwc3: gadget: don't error on dequeue of a completed request
Message-ID: <20260904161344.2191362-1-Munzzyy1@proton.me>
Feedback-ID: 209578162:user:proton
X-Pm-Message-ID: 13b248a9b0c99cf956f1683953ed76e77d39fc2f
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Dequeuing a request that has already been given back logs an error and
returns -EINVAL:

  dwc3 23000000.usb: request 00000000ad92f1c4 was not queued to ep0out

f_fs hits this on every teardown. functionfs_unbind() dequeues ep0req
unconditionally before freeing it, which
commit ce405d561b02 ("usb: gadget: f_fs: Ensure ep0req is dequeued
before free_request") made deliberate to close a use-after-free. By then
the control transfer has long completed, so dwc3_gadget_ep_dequeue()
finds the request on none of cancelled_list, pending_list or
started_list and falls through to the error path.

Nothing is actually wrong. The request is not queued, which is what the
caller asked for, and both callers ignore the return value and free the
request straight after. The only effect is an error line in every gadget
teardown, which buries real USB errors.

dwc3 already tracks enough to tell the two cases apart.
dwc3_gadget_ep_alloc_request() sets DWC3_REQUEST_STATUS_UNKNOWN, both
__dwc3_gadget_ep_queue() and __dwc3_gadget_ep0_queue() set
DWC3_REQUEST_STATUS_QUEUED, and dwc3_gadget_giveback() sets
DWC3_REQUEST_STATUS_COMPLETED. A request that reaches the end of dequeue
with status COMPLETED was queued to this endpoint and has finished.
Anything else was never queued here, or the driver lost track of it.
Keep the error for those, and return success for a completed request.

A completed request still has to be dequeued on the endpoint it belongs
to. req->dep is set once at allocation and never changes, and
__dwc3_gadget_ep_queue() rejects the same mismatch with a WARN, so a
wrong-endpoint dequeue stays on the error path here as well.

This is narrower than the cdnsp fix for the same caller,
commit 34f08eb0ba6e ("usb: cdnsp: Fixes issue with dequeuing not queued
requests"), which returns 0 whenever usb_request::status is not
-EINPROGRESS. That also swallows a request that was never queued, since
status is zero out of allocation. Going by dwc3's own request status
keeps that case an error, which is what was asked for when a separate
ep0 dequeue was proposed in 2022.

Link: https://lore.kernel.org/linux-usb/20221117054917.30104-1-quic_ugoswam=
i@quicinc.com/
Signed-off-by: Cole Munz <Munzzyy1@proton.me>
---
Resend, no changes to the patch. The original went out on 17 August, the da=
y
after v7.2, so it arrived at the top of the merge window.

Rebased onto v7.3-rc1 and rechecked there: applies clean, gadget.o builds
under W=3D1 with no new warnings, sparse and checkpatch --strict are clean.

The Flipper Zero kernel tree ran into this on their gadget teardown path an=
d
merged the same patch downstream today, so it is in use if that helps place=
 it.

Original posting:
https://lore.kernel.org/linux-usb/18ebf019a119389870bbc7c155a00a86bf867323.=
1786985009.git.Munzzyy1@proton.me/

 drivers/usb/dwc3/gadget.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index fa944856f956..f68eb9254afa 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2181,9 +2181,22 @@ static int dwc3_gadget_ep_dequeue(struct usb_ep *ep,
 =09=09}
 =09}
=20
-=09dev_err(dwc->dev, "request %p was not queued to %s\n",
-=09=09request, ep->name);
-=09ret =3D -EINVAL;
+=09/*
+=09 * The request is on none of this endpoint's lists. That is the
+=09 * expected state once it has been given back: a function may dequeue
+=09 * a request before freeing it, and f_fs does so unconditionally for
+=09 * ep0req in functionfs_unbind(). Nothing is queued, which is what the
+=09 * caller asked for, so report success. Any other status means the
+=09 * request was never queued here or the driver lost track of it, and
+=09 * stays an error. So does a completed request handed to the wrong
+=09 * endpoint: req->dep is fixed at allocation, and the queue side
+=09 * rejects the same mismatch.
+=09 */
+=09if (req->status !=3D DWC3_REQUEST_STATUS_COMPLETED || req->dep !=3D dep=
) {
+=09=09dev_err(dwc->dev, "request %p was not queued to %s\n",
+=09=09=09request, ep->name);
+=09=09ret =3D -EINVAL;
+=09}
 out:
 =09spin_unlock_irqrestore(&dwc->lock, flags);
=20

base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
--=20
2.55.0

