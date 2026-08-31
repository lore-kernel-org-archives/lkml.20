Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921F7399889
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788195551; cv=pass; b=u2n+lTw48zW2QKHlMs4Dyy9M6E8EFXODvBFZTsnbQrXgHavi4hUye/IlBs/YZveXugj54L7g8NKwIxBzH4xPKi4c4vxrMQQXzyZV6TRCxO+8bZJWeb9b6+OrWojLip/D+OSmcH3A5plMU4x8ouBpDGJZ0nzpDCpIyNTwiazysV8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788195551; c=relaxed/simple;
	bh=O8g1SAHmmnWE8/wxuaWY6UltB+D5JOukYmyaNXWpjfc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SAz+OtEKtv7uridwh6CSrduhXSVrKKmWkB1Snd2hfOmKWDab14F9dpul4zouu8mDOZCdZLTeKfSDh0YgS6zIXGo1eFH6Gl2aaNwKAj14R12rMLSICTmxjK7A7InNa7Tfou3KERDusv3YVw8neoz8VjAegnipL+AT8g5O8HsLiSs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=liRF/oKl; arc=pass smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="liRF/oKl"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc1cc97b84bso3319679a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:59:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788195549; cv=none;
        d=google.com; s=arc-20260327;
        b=GYUTZ4zYWwbpAems5W0FdZ31LLp46kc5BJ+sMp05vUy+Zmq1FkBaawqpXcsFjPaDIr
         0zXfMOm8fnqM72+d1ArcMVg4nR7JT+RLxN/5Q7/apddth9jEGWFDhNsWuJS7uOzqiTA+
         H5skMQFbejRugtXK30kBL0EtOnFCJHSxBNJKIvHmPFafU2SWtGJM8ui9Tv8oicFegQeC
         WdNhmfXMilXkavbzyq6k5RsLh6ypvSjWHGGWWo22gRMsyCksppa1SM3oc1EwdUrii02P
         Ba09jUhq1Zdyj7ljJVjrV+9NzYNXteXVQ6R/UH/21oq5w8aoVaePHMlWsq94lBtDqWTd
         E/uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Lnj8rGRS4zyy3t2mjmHLPxQEcfwJOCyqagcfDb9wGJM=;
        fh=S37afB5gERsS4gZOVs0bSiByACLzI+U9W4XZXfbP6uo=;
        b=UepWp+vcY2e5+IQIg+2Q06mSaye/2Cvvhu8EYnGTVYe0DSK/dwkD0OfYklAVEMDabQ
         1Pf2uHd+awL0eN6lkhqGLeFJxcnTcN1Vv3FlXBZ/BL0Xk71zTmS6nyJj0vqJsCCLrAgQ
         ifuSXpcDAsz8KJkp/jX/sEDIUB0xVQaf8kALowhcCrFmGr1IE6UB1vMdkjFENX7h54R7
         oiBLsLyGzmBmZyAn/ALoUsonGQwS2UcyfExeCfrbC/L1ZCPE8TTwDCMlna9a/S9DRVh7
         BPLMgD/Av3sgpjEg/7CnhDOsADHaB/uu+3wfhIJDAqzQYFNrZ7e6P/dVmz/sxA6wawUD
         ThyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788195549; x=1788800349; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lnj8rGRS4zyy3t2mjmHLPxQEcfwJOCyqagcfDb9wGJM=;
        b=liRF/oKlMvagpo+7K6pHO70AELN95Rg64MHzaA1OJugxawTpOsZoARcXFQKFZCmpdW
         5sbFYnapn2MPnZU0cSNIkhe6BQzU9aIWFWh9yBpBVibrsBqYFO07KWhN/LuYxebYx4Uf
         SQJm+wVuBpE/2nhJt9obqTFVkDQ7o9rczHTHdOeVEgq6ssPyFoYwdQDz79FSUwmyD7kj
         V7A9j5BGNq1/n1u83af4FTRUye7exSdSdqREhk7YUnpCO4R29+5l85J1lPvKJvzf59fU
         1Rt3tQwfQSgsi3I9pi/cLs8oOUjyBjnJvLbjIj37SzYDiiUjUFN/AtTOB4Disou2uYZa
         vgbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788195549; x=1788800349;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lnj8rGRS4zyy3t2mjmHLPxQEcfwJOCyqagcfDb9wGJM=;
        b=D4rOm33eIWr//5r7OL0M9Z8hpaxOungsaTIX+QliOGw0dg64iQSMAqBTaPvy6wyWR1
         jHhpN1R05iYIcE/xMgFU055uXhAuoSd9/3u0SZdu5s/nu426RRVswORccn/DvSmotUy+
         AlICrld/VqjJ+q4HQtPVdI653sjvMIkbIhO+ltrYYFpY1bYDg48fup0z1U2Kwvs5DQNC
         kDtm5CyMSa3AH8Sauwn+yj1V6jCWo/UshdR671Vy4sCT2JlZebrpPW+g//BT6UzHyGv6
         X8NJnIEMPeJrteD7KiNcExMH5raPHINV0fkSemNo+yZU8hXu5+85T7Fbt02Yvgh6N4WI
         8p5Q==
X-Forwarded-Encrypted: i=1; AHgh+RpjGe/X1owJC9fZS60gDFRK1ROu+wMq0ewF3vCTZynUI5W12NMAjxaxagFp7h5AyqTeQhBJ5i+8LX0/y0k=@vger.kernel.org
X-Gm-Message-State: AFuF++mXDs+abyNqKcQ04ngs+4+0p6MMysmFT1Okt8ehRkou6RT/9gps
	urq/nhcQJHYWYdFi77NF2D8fp8Xcu2xnHWZQ++EqvwCPCnid3Y6IFv4pxj1zgz6/Tms5Uu23fml
	kvlQo7KjtJSEoYkuENAASthBxcfTqM0w=
X-Gm-Gg: AR+sD12CzGkNV7qzvpsGSlbQZqO0+AzYlAVDHS0wwZB1Omheq+7gN7FzdHb76MeihUJ
	bj3n+P88xhOglYnhZbwGUsZisJUOfFmiCwulg9QqN9jEIMjZvJRjGYTfXQwP7EA5kDXlSUo9SYl
	Etism/tN180N8bwiG8sDcqTgSroxiHz8wf3gBA5IbncybumHnFaM3niguREpokHr4BTOjvSji0A
	HbNNOMF6XfKVrg8F1HgqxDJ0Zvin/c1gtBOAXbou5StWl4FHEJdo/TddawgdD+0FaOGVCjAQMmQ
	E4JgqcxdTkV+Z6APLJK5n4plHnqX0c+ZnMR3pcacyTRvreMZJnB2MoJvzaP0utOtADKK2FeSWER
	ZPd4=
X-Received: by 2002:a05:6a21:a34c:b0:3cd:2e96:5929 with SMTP id
 adf61e73a8af0-3d7af831e7fmr3734718637.14.1788195548626; Mon, 31 Aug 2026
 09:59:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260829011901.325379-1-rafad900@gmail.com> <991f3432-02af-47e7-b470-b21d36d09ac5@rowland.harvard.edu>
In-Reply-To: <991f3432-02af-47e7-b470-b21d36d09ac5@rowland.harvard.edu>
From: =?UTF-8?Q?Rafael_Alejandro_D=C3=ADaz_Cruz?= <rafad900@gmail.com>
Date: Mon, 31 Aug 2026 09:58:57 -0700
X-Gm-Features: AcwNN1XU52XwzNG3k-NXOURpKqLJZm2DZf5C7B0JVw987cwLk-O_rqZRoKbdZmE
Message-ID: <CALp66yH0C0WAgUDkXArbLHgwSdrJ0hfQP2id2xhztg-d=qK1Jw@mail.gmail.com>
Subject: Re: [PATCH usb-next v2] USB: gadgetfs: Fix use-after-free in gadgetfs_kill_sb
To: Alan Stern <stern@rowland.harvard.edu>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,
Sorry for the confusion. I assume I can just address the
concerns here and create another patch once the message
is clear.

I suppose there are actually two errors but because they
are triggered by the same syzkaller reproducer, I'm
treating them as one. The initial problem is the UAF on
the_device pointer when put_dev() is called both by the
error path of gadgetfs_fill_super() and gadgetfs_kill_sb().
This is triggered by the fault_injection in the reproducer.
I'll assume that one is clear.

The second underlying issue is still related to the_device
but not itself, rather the_device->count variable keeping
the references. The syzkaller reproducer still triggers the
same fault_injection in the reproducer but the
fault_injection might fail which leads to the success path
being taken. This means that the gadgetfs_fill_super()
will succeed and the the_device->count will be initialized
with 1 as you had mentioned. However, at the end of
the reproducer close() and umount() will each be called.
This leads to the following:

close() -> dev_releave() -> put_dev()
umount -> gadgetfs_kill_sb() -> put_dev()

the_device->count =3D=3D 1 at the start but is decremented
twice. refcount < 0 triggers second UAF.

This is fixed by incrementing the reference on the success
path of gadgetfs_fill_super(). That is what the get_dev(dev);
call is for.

As a side note, I'm part of the Linux Kernel Mentorship
and I appreciate your feedback! Please don't hold back on
the suggestions. Every bit helps me!

Thanks,
Rafael.

On Sat, Aug 29, 2026 at 8:05=E2=80=AFAM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> On Fri, Aug 28, 2026 at 06:19:01PM -0700, Rafael Alejandro Diaz Cruz wrot=
e:
> > When gadgetfs_fill_super() fails, it's error path calls
> > put_dev() which drops refcount inside the_device to 0
> > and frees the objet. But the_device pointer is not
> > cleared, leading to point at freed memory.
> >
> > VFS will then call gadgetfs_kill_sb() after mount
> > failure leading to put_dev() to be called on the
> > already freed pointer.
> >
> > Fix by setting the_device =3D NULL during error path
> > before calling put_dev() inside gadgetfs_fill_super()
> > so that gadgetfs_kill_sb() skips put_dev().
> >
> > However, if the fault injection from syzbot failed
> > and it began the open()/write()/close()/unmount()
> > sequence then close() and umount() will each trigger
> > the refcount to drop once via put_dev(). This will
> > still cause UAF since refcount is only incremented
> > once on creation but decremented twice.
>
> I don't understand this last paragraph at all.  What fault injection
> from syzbot are you talking about?  The earlier part of the description
> doesn't mention syzbot at all.
>
> Why do you spell "unmount" the first time with an 'n' but "umount" the
> second time without an 'n'?
>
> Is there any reason why close and unmount shouldn't both do a
> put_dev()?  Doesn't the open increment the refcount to 2, so close
> and unmount will set it to 0, causing a deallocation but not a UAF?
>
> Why is the refcount incremented upon creation?  Normally refcounts are
> created with an initial value of 1 so they don't need to be incremented.
>
> > Reported-by: syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com
> > Link: https://syzkaller.appspot.com/bug?extid=3D4a5c87a01894ca37f25c
> > Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> > Signed-off-by: Rafael Alejandro Diaz Cruz <rafad900@gmail.com>
> > ---
> >  drivers/usb/gadget/legacy/inode.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/leg=
acy/inode.c
> > index d87a8ab51510..77efa984ce84 100644
> > --- a/drivers/usb/gadget/legacy/inode.c
> > +++ b/drivers/usb/gadget/legacy/inode.c
> > @@ -2059,6 +2059,7 @@ gadgetfs_fill_super (struct super_block *sb, stru=
ct fs_context *fc)
> >       rc =3D gadgetfs_create_file(sb, CHIP, dev, &ep0_operations);
> >       if (rc) {
> >               put_dev(dev);
> > +             the_device =3D NULL;
> >               goto Enomem;
> >       }
> >
> > @@ -2066,6 +2067,7 @@ gadgetfs_fill_super (struct super_block *sb, stru=
ct fs_context *fc)
> >        * from binding to a controller.
> >        */
> >       the_device =3D dev;
> > +     get_dev(dev);
>
> Does this have something to do with that mysterious last paragraph in
> the description?  I can't see any relation between the two.  In
> particular, that paragraph doesn't say anything about adding a
> get_dev().
>
> Alan Stern
>
> >       rc =3D 0;
> >       goto Done;
> >
> > --
> > 2.43.0
