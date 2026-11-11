Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794403608;
	b=NmkckyU20aWvMn00jCUTWSm8PndRBAdD+tgLjOhBRtNbnZZkCPwvla9Z9x432046jw9m
	 WQwm0f7G8YAMbHw7PmLtLjDkWHVXljS8eB/mmAJI+1ZLibkpN2PjUrQWX0tUYWwJq7ufQ
	 5T+E0/BiLdIbPYb3PM2q8P/tchLJ2jVTFkKSXDIEEDFxVn+XbuMULhUOigKmqxki/hAt8
	 TayuBOa9okHXOqbHf/ZVuCpYQdqcETniebvEY9AZSocKgQsoJnK4jIXEh3H/zOCbPVGeU
	 u8ajm6Eb0BvoiI3LJfScX5T7EBf3WQWHFmy9H4u2kcTFDDmxMEUCFYPlQfeTBe08eZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794403608;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=IlH/wRxG8izaY2ytsPS7cgG6zhS3AkbgKrtc8usFG4o=;
	b=JmqaBkDT5dXWbd7NhOCBdLjWsnOrkPOzWzHxcTMT4t7F3K3sBbEtGD46s0ZBfy3IoMbg
	 jYhOfTxfMwNlp95Kua3p1iE3JmqgTMepg9m2NBVMXpjaDD7TTXyRIxhdoaRV7ZUinhcRP
	 BEiHEu4O4FSjD2UMi9lbXIDGPgqiqu45Ee3R1ModZrJeV5093Ih75tkpDZsFD7TpAYfr0
	 rPzspI4WbdyImuiAO3jdiuauERPZ0k6xXw+3GnVnBFNddXvW+cuyx+H3igOv4xnmy3SkL
	 zDR0nkEaXPdY7jX7UM/V9//RWZOoLydesAjpomt5N5S2IZP8bB4e/rSkxyULRAwjkvw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sh4uXYD0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DC7606A327
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:26:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5DC7606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sh4uXYD0
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-675617e81f9so3182787d50.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:26:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794403607; cv=none;
        d=google.com; s=arc-20260327;
        b=hCJ9YBG3xdO+cFwTW1NykRTIXHZtZgmCGpuEdL9Cj4eV1vHd7QjJCYSLVDgBPnoQR0
         bS+p/gi2runi2x0Ru4MIaNeMsByqTLnAWbDSwyj2WtgzzNc+3MLYdPZGCa066cDi7UXt
         UM+10P9QD8MmkCslgzDysiTymJaueSVQOLO+vcJz0OqPNWjsrcCRN0pgkuphtiXi1aYb
         rvwEhn7u001GXEGwiz5Rg9teBnmgYs0Ic8uyNX6qxVQWTCUxmfs6GDw65hrc19YYO0U4
         dsEcOpQQkDKCYGph3LW9PZZuYGd397M+wcMsHub7wwUuMv12xMnfQ/B1UkFJApp8WfL2
         mhvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IlH/wRxG8izaY2ytsPS7cgG6zhS3AkbgKrtc8usFG4o=;
        fh=MRyYDpkrb1BE+xnoel0N1XdP+ep2Vl/1ePcRnuxgI1s=;
        b=HzGFRE7DLVhoU05TnXOnF6mc3nVJOUcIwN8UIK7nitzwVITz3pNAlxHFRkjk8PULe9
         fWBMDLwG06odcVvNVsqRlg5XkLW7mRVHwOhlMRx7yxOYhVlY5aNUReCJks1nOhSYZg+a
         WlD79iMW58lTwkPftz8DpdsciRUIKr7Yb4M7FFmMAPQiPIoheSjEWq4qNgHgQNXHo+Ld
         vLQoaTL8o5+X8qwxtVz9k06P4/XrR1F/5Y8NqjOP1901tDj/MNG7jkLuwug9LS2AN+DO
         6ia5mu0v4H+x8I+Yw+XkRvxhtlcqGeHNzh4GeceJ9G3SsorTcqfrjoV/3hZnIeFKAcyW
         C3bw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794403607; x=1795008407; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IlH/wRxG8izaY2ytsPS7cgG6zhS3AkbgKrtc8usFG4o=;
        b=sh4uXYD07rzXsx3+6MGIVjCIh6olB0QDiiRMJVeWqwWO8nqxBvzMjANZCvEo/BTV94
         Q93B9txpwrirCahF9q4j6TCbJRJjs79ag+OBt6pm/BwaNKmJt2vcXvbi9VNOBWUPmXEF
         H5YPmi7GOUngQbmmhEo/iky8l6tY6tSSe28/7tpmKycftaF+XeK1nXVJ1ZEUfahLHEeF
         D1efdQ8J36pqZcQkkSeTL4fS1ARLUoHQTBbyD+j3XXNEhfdO+WrCcYizSZuIAvZHjFxB
         wVtXZNz0WE1RXKUbuoXiyIcRgBPbXkb7ylGz3gkqFDWI7hqdaRkK5H20rqe40/jtmkAn
         7tqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794403607; x=1795008407;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IlH/wRxG8izaY2ytsPS7cgG6zhS3AkbgKrtc8usFG4o=;
        b=pFetqMlsh6jXCtFz4gV9I9b7PYO2cMSXXBvtn8LO/W7mPOcxan5PToCcizWJlZwnpL
         gnakGyRn8J+XPdxKlv1t4eNLz2RespeB6KBcq86Eybdva4UtDAa/dIC9CFWSzP808sDW
         G3rB8EJTrRHqr7OEBM5habz4jfxP9kzd5Ulskf3VuQ1oDu0Sv1yD7qRBQ3pkMN04GbDB
         9DtDepKtWjvfbTGIQf18Gc+m6LgS9q250cfyN3hJAs4YfP3x8uhu3q+qLs4YJqbDE6Mw
         t8gokQd5VF/exQDIskpzkQWdRMZ4yJsvct3Cd5OX7I66EwkzC9jRvF7Y/5/Nd4hNAEa8
         GxgA==
X-Forwarded-Encrypted: i=1; AL+hErEPyORjAAwNhRKmrvEG7PpOUqhLbXtgdNAzQyX8cTsptcK8/hgqTXonbnEOPIqbfqBLKjgC6lsSM1JEW0k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vuVkH0od5AhToJBk5F0XuWr7JeU4ZVy4tUOyY5BssVxDYGQMu
	mfffk1NmM3dD/rtPBNffN69ElFE0YcyzgUiWRzOtj6qD8D96BGsyQ/0CFxuTCvR5iD/A8Oi51Og
	ylyr3bcwGFkpo1I4oXgQzYIoT4dOFU3q9naa2
X-Gm-Gg: AYBFou2NKC2wO/FZUfieUFNZkXQsb7ROS58vJ7m9tF3Li21p/TT8B2poE09PGE5AJN4
	STfdPuJurudJ+uLvM5UMMrUBX7ZeYwMp+BeXq5lJNczAsUegqctfmmggR41hXW0y+Y6j5PTKtSt
	5IEk3vKv0hTh3nQw21ECyrmtwmsEPrSEIP3oM/iCGvPfS3luTVSpw/py1X9fuBaH+X45fmnFv35
	sEF2B3SQT71hlteOxZqSGuCf1B8T86UxtrJwoYcOeObW9lmDhXdBQZoh7iA8lRCdkI9CtYrVyL1
	E1SAAWnTDC6Z1eyphSovDSSfw7vBqsFiaUug/2/IkZMJn6FOwxBCE1ghPpYQsWZXaUWw2sB9vFg
	cJZ4stJTer0H0xEEz+IiN9JZUOsWQgMYLmky8FMR+CmqYBtDdtyTfmNdm14IaqyPX1g==
X-Received: by 2002:a05:690e:d01:b0:67c:eb7:5906 with SMTP id
 956f58d0204a3-67c67ff2a38mr1676909d50.74.1794403606734; Wed, 11 Nov 2026
 05:26:46 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110150250.71520-1-ekffu200098@gmail.com> <87cxsbg1fs.fsf@igalia.com>
 <CABFDxMHOy2JRYfCk0ovp3nzXWMjpXyiYsLGO3k3Up3e76Z-wXw@mail.gmail.com>
In-Reply-To: <CABFDxMHOy2JRYfCk0ovp3nzXWMjpXyiYsLGO3k3Up3e76Z-wXw@mail.gmail.com>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Wed, 11 Nov 2026 22:26:35 +0900
X-Gm-Features: AclHuK_RBhRvyxLj-7Lp0K_2O-7u05gQ0gJHWBwaUE7fHFx4beUXxMqWgyrR20U
Message-ID: <CABFDxMGJ+Uum7dde3AN5Ab+H4Gwb23Upj7r9=SO21NWCo+Mhow@mail.gmail.com>
Subject: Re: [PATCH] fuse: defer dentry_tree_work until fuse_dentry_tree_init()
To: Luis Henriques <luis@igalia.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Miklos Szeredi <mszeredi@redhat.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 11=EC=9B=94 11=EC=9D=BC (=EC=88=98) =EC=98=A4=ED=9B=84 8:27, =
Sang-Heon Jeon <ekffu200098@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1=
:
>
> Hi, Luis
>
> 2026=EB=85=84 11=EC=9B=94 11=EC=9D=BC (=EC=88=98) =EC=98=A4=ED=9B=84 6:28=
, Luis Henriques <luis@igalia.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
> >
> > On Wed, Nov 11 2026, Sang-Heon Jeon wrote:
> >
> > > inval_wq_set() schedules dentry_tree_work when inval_wq is enabled.
> > >
> > > But inval_wq_set() can be called at boot or module load before
> > > fuse_dentry_tree_init() initializes the work, so __queue_delayed_work=
()
> > > warns and the work never starts.
> > >
> > > So defer scheduling the work until fuse_dentry_tree_init() sets it up=
.
> > >
> > > Fixes: ab84ad597386 ("fuse: new work queue to periodically invalidate=
 expired dentries")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
> > > ---
> > > QEMU based test result
> > > - booted with "fuse.inval_wq=3D5"
> >
> > Thank you, Sang-Heon.  I've sent a fix for this already[1], but sashiko
> > still has some race complains which I haven't looked into yet.  But may=
be
> > Miklos is happier with your patch, in which case you can add my
>
> Sorry, I missed that thread.. sashiko also complains about the same
> race condition between init and sysfs setup. But I'm not sure it is a
> realistic scenario. So I want to hear other voices as well.

I also checked the other sashiko's complaints from your patch, the one
about race between module cleanup and sysfs. It looks easier to
reproduce, but still I'm not sure this is a realistic problem. If it
is worth fixing, I will sent v2 with serialization between module
init, cleanup and inval_wq_set()

> > Reviewed-by: Luis Henriques <luis@igalia.com>
>
> Thanks for your review :)
>
> > [1] https://lore.kernel.org/20261106155512.24801-1-luis%40igalia.com
> >
> > Cheers,
> > --
> > Lu=C3=ADs
> >
> > > 1) AS-IS (before fix)
> > > [    0.011073] Kernel command line: rootwait root=3D/dev/vda console=
=3Dtty1 console=3DttyS0 nokaslr  fuse.inval_wq=3D5
> > > [    0.011114] ------------[ cut here ]------------
> > > [    0.011115] WARNING: kernel/workqueue.c:2704 at __queue_delayed_wo=
rk+0x11a/0x140, CPU#0: swapper/0
> > > [    0.011124] Modules linked in:
> > > [    0.011128] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 7.4.0-r=
c1-00010-gab9787d7e66a #1 PREEMPT(undef)
> > > [    0.011130] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),=
 BIOS 1.17.0-debian-1.17.0-1ubuntu1 04/01/2014
> > > [    0.011131] RIP: 0010:__queue_delayed_work+0x11a/0x140
> > > [ 0.011133] Code: c4 08 48 89 df 5b e9 85 28 0a 00 90 0f 0b 90 4c 8b =
42 08 48 8d
> > > 42 08 49 39 c0 0f 84 1c ff ff ff 90 0f 0b 90 e9 13 ff ff ff 90 <0f> 0=
b 90 e9 ec
> > > fe ff ff bff
> > > [    0.011134] RSP: 0000:ffffffff82e03e00 EFLAGS: 00010003 ORIG_RAX: =
0000000000000000
> > > [    0.011135] RAX: 0000000000000000 RBX: 0000000000000040 RCX: 00000=
00000001388
> > > [    0.011136] RDX: ffffffff83a3f320 RSI: 0000000000000000 RDI: 00000=
00000000040
> > > [    0.011136] RBP: 0000000000000000 R08: 0000000000000082 R09: 00000=
00000000001
> > > [    0.011136] R10: 000000000000000a R11: 000000000000000a R12: fffff=
fff82c09fd0
> > > [    0.011137] R13: ffff88807ffcfb89 R14: 0000000000000000 R15: 00000=
00000001388
> > > [    0.011140] FS:  0000000000000000(0000) GS:ffff8880fa26e000(0000) =
knlGS:0000000000000000
> > > [    0.011141] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > [    0.011141] CR2: ffff888003a67000 CR3: 0000000002e30000 CR4: 00000=
000000000b0
> > > [    0.011142] Call Trace:
> > > [    0.011143]  <TASK>
> > > [    0.011143]  queue_delayed_work_on+0x6a/0x80
> > > [    0.011145]  inval_wq_set+0xc4/0xe0
> > > [    0.011149]  parse_args+0x299/0x3c0
> > > [    0.011151]  ? __pfx_unknown_bootoption+0x10/0x10
> > > [    0.011154]  start_kernel+0x3b8/0x7c0
> > > [    0.011156]  ? __pfx_unknown_bootoption+0x10/0x10
> > > [    0.011157]  x86_64_start_reservations+0x24/0x30
> > > [    0.011160]  x86_64_start_kernel+0xd1/0xe0
> > > [    0.011162]  common_startup_64+0x13e/0x158
> > > [    0.011165]  </TASK>
> > > [    0.011166] ---[ end trace 0000000000000000 ]---
> > > [    0.011173] ------------[ cut here ]------------
> > >
> > > 2) TO-BE (after fix)
> > > - no error while booting, and also fuse_dentry_tree_work works well.
> > >
> > > ---
> > >  fs/fuse/dir.c | 10 ++++++++++
> > >  1 file changed, 10 insertions(+)
> > >
> > > diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> > > index da23ccd8685c..6965a77a871f 100644
> > > --- a/fs/fuse/dir.c
> > > +++ b/fs/fuse/dir.c
> > > @@ -39,6 +39,7 @@ static struct delayed_work dentry_tree_work;
> > >  /* Minimum invalidation work queue frequency */
> > >  #define FUSE_DENTRY_INVAL_FREQ_MIN 5
> > >
> > > +static bool inval_wq_ready;
> > >  unsigned __read_mostly inval_wq;
> > >  static int inval_wq_set(const char *val, const struct kernel_param *=
kp)
> > >  {
> > > @@ -62,6 +63,10 @@ static int inval_wq_set(const char *val, const str=
uct kernel_param *kp)
> > >
> > >       *((unsigned int *)kp->arg) =3D num;
> > >
> > > +     /* Defer the work until fuse_dentry_tree_init() sets it up. */
> > > +     if (!inval_wq_ready)
> > > +             return 0;
> > > +
> > >       if (num && !old)
> > >               schedule_delayed_work(&dentry_tree_work,
> > >                                     secs_to_jiffies(num));
> > > @@ -224,6 +229,11 @@ void fuse_dentry_tree_init(void)
> > >               dentry_hash[i].tree =3D RB_ROOT;
> > >       }
> > >       INIT_DELAYED_WORK(&dentry_tree_work, fuse_dentry_tree_work);
> > > +     inval_wq_ready =3D true;
> > > +
> > > +     if (inval_wq)
> > > +             schedule_delayed_work(&dentry_tree_work,
> > > +                                   secs_to_jiffies(inval_wq));
> > >  }
> > >
> > >  void fuse_dentry_tree_cleanup(void)
> > >
> > > base-commit: ab9787d7e66ac7e6e94fc975b37c5b56fff98ca9
> > > --
> > > 2.53.0
> > >
> >
>
> Best regards,
> Sang-Heon Jeon
