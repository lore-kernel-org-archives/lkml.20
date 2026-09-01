Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4930379989
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 05:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788239199; cv=pass; b=DzFkgCOLNpF4wvCmTzuR9o9Fh6Suyr+JCUumnm8pFmt+w2P9eQvioTAn/LkF6sHCGhNcytXi5EQLv1889Hzj89PQKtL+Xj0VBq18+50FuqAHnxeE15OgTzpd+FNKV075aH6o2wePA+qnq1E7LflWtsv0g25BIHB13zRzm7+QXOg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788239199; c=relaxed/simple;
	bh=DXUR1kngFuqFotBIycz37T0OKEb5ANnR0IeCXoPbnio=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H+tMjZgIrQuhaNO6+0ydchSC6BpUgdn8pBi3hUWOtu9qCvcaUK6WnPP49spOUa7juQHkPcLTHUWnAENmfVkNlnpSQWid5sBdODRtb6UjN7jf34QYGez7l5OOdQzLMJ2gK18SSMrUK6BDa3qFIwqjyfn1W9EDH54IE21mOwDe1xs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ondOQLCn; arc=pass smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ondOQLCn"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84eb992a881so409016b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 22:06:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788239197; cv=none;
        d=google.com; s=arc-20260327;
        b=UbJex7RIXOpNz12NZ4zPY5XFWmZeNRTtazUMz4wh3xRyEX/BxFMsxlGR5VoAK3u90/
         wx+3b+R96FkEhgNbC6tYpjvR+isyp+3gkboiPVsCd+dRXuEQMQt/qZaDKz8i81GKlUsr
         cSjIh4S9d8mHfcEz2vBLiAd2/KMvQeJn39a4UWPRH4mNmOCexZuxK+KpoN8QFdxcMgvF
         f6ktvveqwr/32uAkh9ME09HSR/8ww5d/8aF5rOz/E4+iohdLtk5ph1bFP0sR0hHi+J9t
         MmhC8SUYf43x6TFprq2agZ2U8kgnmy4DYuWgwc+rs6bsqcx+MPro5b5IXneZPD6YTlnI
         qJKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Uxm6VQ8DSjAEX2q/IFs3sWCsxk2wubK/8uzkDDttSgE=;
        fh=kT2cQBRK7a14OklwBOfwPcLGvfQ158UsaSJiAvF4xPg=;
        b=HTmwdT8DU5GVr3b8O+5M+P/q5ziSJIUOLDX4A3pm2ustyTPrQPK60mfjR6c3AyJ3cG
         dMszUHxIDJ1izbL9Qeug01XMA7Lr3WHPJNtbbytphEp9ul1sQGWkiXqoNgzs/gIc3bCu
         jF52OXus7/JXaJHdxaZEZ3QRz5FE7xQrkyxXY+gSbvhq21ooMumlpUTfbBnHrWBGEuTA
         zrk8Jj3dcJHjFMTlx39jB3WKjUUkKuVRXmzii1quFmqZeYlY8VH4MAN2CB/onuyfGOZF
         KA0ULJ85Pn8HuYs5BMjid6xILsMZNnX0xer88bWWucnf2VdHsvsCBg9HKErPmcJXm9h8
         3DDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788239197; x=1788843997; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Uxm6VQ8DSjAEX2q/IFs3sWCsxk2wubK/8uzkDDttSgE=;
        b=ondOQLCn/ewyMt3fbRxkwuB8Ud110wuELZe+EsK6mjjaJ3ktDppcKssqRj7BXqxxjr
         Nu8MjDivdIj75OjT98BIEqnJ4CAJXk4OEyQg3UQu7tdLe309Sruy3J1ZrB+8O0GgM5id
         BAeXfADa9n5+Bdi3NlcQNG4Ggw0ACHFLZ8pmrw4NK+zzgh9I6VrXYHgmkyvW0iYfDBxq
         OODNmt70o1/18GTF2kO6ry/Iu84jtguWsgaWsz2a/2jJVHIKNqb5auZTthjlkITTKnxk
         3MSPZab0+jtzUZM8vTc3f+faN49n1PRfVatauKpsPAlz2PZAJr5D8X5xeO3G7wuV8xIY
         0LbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788239197; x=1788843997;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uxm6VQ8DSjAEX2q/IFs3sWCsxk2wubK/8uzkDDttSgE=;
        b=d5dlETxjK1+DrWTDv6nctjFZiuzJxjOnEh0ENN93GF76fTQMJ0MzEwTiwIiyFrOVjz
         pUxN8rrGdI36mpHhpYOBj45QRx8rUlgocfZ4r8Y7PXBgnEWnEBjb/DuLHVWf0klWwlaM
         /YQrRcAYFl0RkBHa8MQ3LDDFkV0X10EDqi2Lum1bV/Ui0pkUvoaSnDdaOrg59Vew84g6
         5VXGNok1JzckkC+ZxLhkPaztDxrqTn+SJLn2ZLwQB9WZdjbFJs9HsBYJbKHkcGSXSxEi
         nNzD1Eq6pVnSY64Jw7VCQJWXClxKvT4VIr6ret+y8Eyak6LqUnnZsmya4LOEwDI6x+o6
         PTwg==
X-Forwarded-Encrypted: i=1; AHgh+RpBnLkYOFenxKaGpoh455Chq2t9RpIrSZwi5y40ECeiwzFYlc+Mg8lTi1V4iHQ/rwwSDiJfOtzlsemC9VU=@vger.kernel.org
X-Gm-Message-State: AFuF++n2xEwdYLDa1R8e43NCyXXhVmJcs5GNspoLhgRTdI3uxPWehU++
	wlCzVdH8uvTmExq6xK01C/cq90kb2ZlxhNetZkNOF5yl4GmQIp4JLdfXfwGjOfUdwd+gEY4LsVS
	9MvKipd2W5W9u8Bn7uDjancSzL95KCTY=
X-Gm-Gg: AR+sD13hPoljRdY/VV4nEtC3X3KvbhFZeak6HYzZmPMp1NtWJZGZ4dY1gwz7Olwvs6V
	29cspXcKTdGuR1kDRi/vT3nDyzpXm3xCtjBKMFkGnSXiODlrsZU/h5MXOvnzdiZmxaGNd/TtX7S
	hELOeFuZ7g31K/78yaj5+r3qDy+fQrOd3NA9W/mI4cljud/PmXIG2D2dAQR0lXrk6QANylsYovh
	91RPap+ZegQmHgVqLPNPSgxh4rMjmf8mgZx/UFcR2Ao1vv7MoFerygpu66HZT40yi0539u+KTbB
	gR5xxmOKCRgz3/aJUSeXUWQdaVfupy2m9/04YAFu9bHTMdE1F7OyFwWH+Fhcue84frlw7R3X+uV
	VzzrJP6l9v6E=
X-Received: by 2002:a05:6a20:918f:b0:3d3:ae1f:d7f7 with SMTP id
 adf61e73a8af0-3d3ae201380mr27905058637.23.1788239196713; Mon, 31 Aug 2026
 22:06:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260829011901.325379-1-rafad900@gmail.com> <991f3432-02af-47e7-b470-b21d36d09ac5@rowland.harvard.edu>
 <CALp66yH0C0WAgUDkXArbLHgwSdrJ0hfQP2id2xhztg-d=qK1Jw@mail.gmail.com> <23099c10-19ea-4626-b1a0-74a64fcb0dda@rowland.harvard.edu>
In-Reply-To: <23099c10-19ea-4626-b1a0-74a64fcb0dda@rowland.harvard.edu>
From: =?UTF-8?Q?Rafael_Alejandro_D=C3=ADaz_Cruz?= <rafad900@gmail.com>
Date: Mon, 31 Aug 2026 22:06:23 -0700
X-Gm-Features: AcwNN1U928dfwm_0v6JwN_YiF55eOuPpUsmYXGUQrlqDWPQMJQaLQMXRP8viM84
Message-ID: <CALp66yGtNY1e3DFdRxMjf1YDnCLrsH_bg4gpyu-A1K0mRgOt2Q@mail.gmail.com>
Subject: Re: [PATCH usb-next v2] USB: gadgetfs: Fix use-after-free in gadgetfs_kill_sb
To: Alan Stern <stern@rowland.harvard.edu>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

After spending a couple hours staring at the code and
asking claude for things I might have missed, I did come
up with a better explanation of how the error happens,
but not why it happens.

I began by removing the get_dev(dev) line I previously
added and keeping a mental score of all the times
that refcount is incremented and decremented and found
that in most cases, they are even. Except in one case
inside gadgetfs_bind():

static int gadgetfs_bind(struct usb_gadget *gadget, struct
usb_gadget_driver *driver) {
     struct dev_data *dev =3D the_device;
// ........
     + get_dev(dev)  // HERE
     if (!dev->req);
         goto enomem;

     if (activate_ep_files (dev) < 0)
        goto enomem;
// ......
     - get_dev (dev);  // Move this up
     return 0;

enomem:
     gadgetfs_unbind (gadget);
     return -ENOMEM;
}
Somehow the reproducer is triggering one of those two
if conditions and sending the execution down the error
path directly to the gadgetfs_unbind(gadget) and skipping
the get_dev(dev) right before it.

Inside gadgetfs_unbind() we call put_dev(dev) which
would be an uneven decrement. I can confirm this was
the problem by first making the change above and
then triggering the reproducer on my local QEMU which
does not trigger the UAF.

Yet, I don't understand why this is being triggered since
from what I can see, none of the syscalls coming from
the reproducer are directly related to this. And these
.._bind(), ..._unbind() functions are not part of the UAF
stack trace but rather, something that happens in between
the reproducer triggered by the usb protocol.

Not sure if this is good enough. I don't know what else to
look into.

On Mon, Aug 31, 2026 at 7:10=E2=80=AFPM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> On Mon, Aug 31, 2026 at 09:58:57AM -0700, Rafael Alejandro D=C3=ADaz Cruz=
 wrote:
> > Hello,
> > Sorry for the confusion. I assume I can just address the
> > concerns here and create another patch once the message
> > is clear.
> >
> > I suppose there are actually two errors but because they
> > are triggered by the same syzkaller reproducer, I'm
> > treating them as one. The initial problem is the UAF on
> > the_device pointer when put_dev() is called both by the
> > error path of gadgetfs_fill_super() and gadgetfs_kill_sb().
> > This is triggered by the fault_injection in the reproducer.
> > I'll assume that one is clear.
>
> Yes, that's okay.
>
> > The second underlying issue is still related to the_device
> > but not itself, rather the_device->count variable keeping
> > the references. The syzkaller reproducer still triggers the
> > same fault_injection in the reproducer but the
> > fault_injection might fail which leads to the success path
> > being taken. This means that the gadgetfs_fill_super()
> > will succeed and the the_device->count will be initialized
> > with 1 as you had mentioned. However, at the end of
> > the reproducer close() and umount() will each be called.
> > This leads to the following:
> >
> > close() -> dev_releave() -> put_dev()
> > umount -> gadgetfs_kill_sb() -> put_dev()
> >
> > the_device->count =3D=3D 1 at the start but is decremented
> > twice. refcount < 0 triggers second UAF.
>
> But gadget_dev_open() increments the refcount (it calls get_dev()).  The
> increment caused by opening the device cancels out the decrement caused
> by closing it.  And the initial assignment to 1 caused by creating it
> cancels out the final decrement caused by gadgetfs_kill_sb().  So there
> shouldn't be any erroneous accesses.
>
> > This is fixed by incrementing the reference on the success
> > path of gadgetfs_fill_super(). That is what the get_dev(dev);
> > call is for.
>
> If you do that, what will cancel out the increment caused by
> gadget_dev_open()?
>
> > As a side note, I'm part of the Linux Kernel Mentorship
> > and I appreciate your feedback! Please don't hold back on
> > the suggestions. Every bit helps me!
>
> Don't mention it; we all have to start somewhere!
>
> Alan Stern
