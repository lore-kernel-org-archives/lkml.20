Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794396476;
	b=E0AXltcGYnyF0lLjo/vVgFK3f1A9pc40ucXnvJruiipddOg0LhuD2vCtv+BTTJ+xacsH
	 RXXxbT7PsY3x/L0ycxZTM/MR7TEJNIGNuAaVotfvFHEvlZDppMQFQ/5bw9SxyB5+fH7Zq
	 +TjzFVHHwRNzEjqRFEEBSSdazvTlZLavkZxUa5f1HhH6Xh9e83iHGSpbbaD+lDlEBHHb7
	 w1UUXJtKd70eTMrfqR1mqQTP0Kjn+TArOW6GDpKu/n+761L9lkI+uvQEc4rKxWH6646YL
	 epGBEBLB4Fo3f9q3wragA3M6A0SKaKmPWaaLaLux3En3YAYzLJzow6oXMwmrx+yL7jQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794396476;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0EBxvvqXHIPO5CH2r1qI1PLw1SVaqc0qdtiXgsZTdiM=;
	b=jeDoAhYpUugUpex8+MCu9aUjchfmqNIKavHL5O7YSqm8NSJUHwwQwin2J0xOnG5jz2Ef
	 NPFAWUX9W47+Q3XhSeMTnLbN1mRdRtyBU2EkGwACH/w8cGK658usPWwiVrkWjnrJsMheI
	 f4JKuEY4xUcnMcnLIQ5G4ZyMh06y3L29EEsVD4k4gjNTlWxkbGLquHcG6JeYbX/iVYwEP
	 CrGpLVYPLmRoroA8VaCUbO9PVgKSW1HpJ9SWF/C9k0LHRhkp1RYHu/Cg5bH5vzKAl2G1R
	 UdC32uovnMS2nbtBCSnY/ovZh4Gk/AK5Ak4kduo28/6HzdWax3FcV2PIbMgt5yW/USQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=raytzfGr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21833606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:27:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21833606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=raytzfGr
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-6798eb0d190so2528630d50.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:27:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794396475; cv=none;
        d=google.com; s=arc-20260327;
        b=MOwslXvAP0j98iyfuYvC5E9Ge3qPFCQAqvMhpp1krUvGUpE/0QDCwK4dhgLG2nWDUW
         NfcCTDd2WoDYn/9pqR3z2dKnlPeU3A/e0JbROI4iqQg8lI+h2ZIaZqxvJoWV2Wln3P8Z
         10spBSLpMa4wyCYA2OcG2CiEeiABBikVN9VGDoEcRBPFwd1POT+TJie17z95giYAGOYs
         RqeqOkuL/7tVU9Q8Gn8ofFL0Ok/4ueCR7HmCKAPP/PXO7aDVDwz4ddnLVlIRE9Jgf/AM
         aG5aqB2q51OoOsM4DetSTdhprE5z+7ZVVHH1xGz54LEtr70hDdQ3naTD+BX3mkf6qtnn
         urLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0EBxvvqXHIPO5CH2r1qI1PLw1SVaqc0qdtiXgsZTdiM=;
        fh=l3JGZltrTjyPRoRd/wxqYKLDjhP0KpderEtCw6kiOyg=;
        b=ebCKdZwWCC2yhh9alXg/o/gUWGSld6xJbyL9GLU3pnXuzl5Ilw7NlRMy9pGunctbTW
         UCb/U2Yb8X85TGH4nmADDvR01dBKvVKdpkuhStlkZ+UqdjYNGZc826CAJsh5sDMSp8x0
         y3T+hu3orOFzaCKa5QcwYZFt6zeDhvWm54CK+Vu/CV8w54Rd9GnM6Rn5aGnTZU3BWf++
         cG7QqSNmxRY8Fss7QIMKZXSVqMCEWWFxZMlLXaVZntW2cq8yq/Dji2gsMBtNJWeDdXjo
         yvIvztd0Nn61/U+jxQLvK61x7h+2zVlnptR65MRHVsF8y1Y4T02JbqJobvh0eOYMEbv9
         +fqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794396475; x=1795001275; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0EBxvvqXHIPO5CH2r1qI1PLw1SVaqc0qdtiXgsZTdiM=;
        b=raytzfGrF+/XLGb8+HEvRsggFid2xn1CZwWB2mRuLSFNZcBrVRtEjJvfseCBXQ0N53
         Kv8KBNkEPY3o38kZbYqSqwicKYgRpxNJZmqJe0Q2YqoQqtpix8RlnZx0kGOdKt3ry49C
         R9T+EZfHwYJTwcMUA+BzmywNN3Y8qM+CKO9BwikxFTnOWfJjiLNJ98ZAPLHxgakP+kLP
         H6nZF0R8Ra3xdeE+ZX80L+4zcg9BFIHis84l6ZVr13PhANe+7ksIgXPSx0RmbJbP4ark
         r3C2+jg6a0KA8BfhTRxXvclgz53tC7MWepf3Gs95H3X23mPMuS41O4F9MpsEWUJM5Rkb
         GJrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794396475; x=1795001275;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0EBxvvqXHIPO5CH2r1qI1PLw1SVaqc0qdtiXgsZTdiM=;
        b=jEUWf7bp8R0q4uBoWePHNCmVDUTX+yRF8uvreKrDRnokYO41AlWTv8fyXBfP3Ge7a4
         9GInyswsKVgdJSxEXqb7QQfFVh6rsAV4K18xyMsGZeptCfP18rB4aiRGu+aej0x7EELP
         /AJSaDwmqkbO9AwtC+PVzsjqnjD+hFSCYt8d8i3P5t1LS3d5PObKrHX30BcUUOJSB4gC
         7l+VNPe/Ooe/TcaIyz59jeEqjlj3QnWS1uX58x8K6bDRgbqadv24MaJAvg5NWHhPP7aE
         LCedH1mzYwEh28MCnWbO7k074nJPGvIp/I5JtWVGgpl7bnIgEJG+YwSsEWfUNFPAcH4M
         /IeA==
X-Forwarded-Encrypted: i=1; AL+hErGV0nPUy6l3g/59J4bENmHnXG/ZfTyOO4uxt6hZmXe7dUwB01FPdivpkzOr4+UfVcgGaPFXXQt2J0939Yk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rOFLu7SfsIY2aR40V/Si8N/Z5v/4T6J6Qu0zltUWwD+0tTaHJ
	fZo3Cu2j/4YTyFne0GpbCtsnaH0hZx1tMOZ0/lNo6R4JM1hDGQc8JWf91M4ug51FJi7RwHw9LQ2
	247DXrhhQ0Mj6v78taQ+Ta6aLYDrEgoC/igsp
X-Gm-Gg: AYBFou3ng27Qi11citTvuk9bEMYj9+PfN6JhohD83OhPk68ebtEAf310aVQuNjorwzV
	pCf1pTV72mb14lEzQNFyXkG/kvHeYbxBfAC3Kby3MI0k+AJB1U237sqDFLo7viliNfIHB/HWTbP
	tmA9TD+Pz8IicqWT1I9xr7kN55KFI3rYkNU4EYkC5aWvy6WHS4zjWG9/znH30nMKXi3/qbv6/uB
	eztFeS8PlXTLAsbMMSm5vQTcyX4K8ZMEZOHjZE0H8EsX/GLhS9Wvp/loBvwd/q6zDol2ar08IP8
	iNup0C0A0VW4JbQ4GG4NBx5SKrZneb4EydgGPturvGC0kD8+NEiDfBW+QeF72mSC4DSTYDJiLhb
	iLRAguUZJAajUzVLlnUC1z3WwxEdlpiU3xS2CGQu1nAZjr43b8NMbKUVCxiLHWIk2jxenoN4yKt
	rYv1NM4Ipy5yA=
X-Received: by 2002:a05:690e:4509:10b0:67b:f332:3030 with SMTP id
 956f58d0204a3-67c67ea2783mr1208582d50.26.1794396475030; Wed, 11 Nov 2026
 03:27:55 -0800 (PST)
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
In-Reply-To: <87cxsbg1fs.fsf@igalia.com>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Wed, 11 Nov 2026 20:27:43 +0900
X-Gm-Features: AclHuK9BiFb6sNzHQ9jjn5eMBNmWcB62rZUWBjlZHzqw5mESL9SL1A56UNQEYP8
Message-ID: <CABFDxMHOy2JRYfCk0ovp3nzXWMjpXyiYsLGO3k3Up3e76Z-wXw@mail.gmail.com>
Subject: Re: [PATCH] fuse: defer dentry_tree_work until fuse_dentry_tree_init()
To: Luis Henriques <luis@igalia.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Miklos Szeredi <mszeredi@redhat.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Luis

2026=EB=85=84 11=EC=9B=94 11=EC=9D=BC (=EC=88=98) =EC=98=A4=ED=9B=84 6:28, =
Luis Henriques <luis@igalia.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Wed, Nov 11 2026, Sang-Heon Jeon wrote:
>
> > inval_wq_set() schedules dentry_tree_work when inval_wq is enabled.
> >
> > But inval_wq_set() can be called at boot or module load before
> > fuse_dentry_tree_init() initializes the work, so __queue_delayed_work()
> > warns and the work never starts.
> >
> > So defer scheduling the work until fuse_dentry_tree_init() sets it up.
> >
> > Fixes: ab84ad597386 ("fuse: new work queue to periodically invalidate e=
xpired dentries")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
> > ---
> > QEMU based test result
> > - booted with "fuse.inval_wq=3D5"
>
> Thank you, Sang-Heon.  I've sent a fix for this already[1], but sashiko
> still has some race complains which I haven't looked into yet.  But maybe
> Miklos is happier with your patch, in which case you can add my

Sorry, I missed that thread.. sashiko also complains about the same
race condition between init and sysfs setup. But I'm not sure it is a
realistic scenario. So I want to hear other voices as well.

> Reviewed-by: Luis Henriques <luis@igalia.com>

Thanks for your review :)

> [1] https://lore.kernel.org/20261106155512.24801-1-luis%40igalia.com
>
> Cheers,
> --
> Lu=C3=ADs
>
> > 1) AS-IS (before fix)
> > [    0.011073] Kernel command line: rootwait root=3D/dev/vda console=3D=
tty1 console=3DttyS0 nokaslr  fuse.inval_wq=3D5
> > [    0.011114] ------------[ cut here ]------------
> > [    0.011115] WARNING: kernel/workqueue.c:2704 at __queue_delayed_work=
+0x11a/0x140, CPU#0: swapper/0
> > [    0.011124] Modules linked in:
> > [    0.011128] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 7.4.0-rc1=
-00010-gab9787d7e66a #1 PREEMPT(undef)
> > [    0.011130] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), B=
IOS 1.17.0-debian-1.17.0-1ubuntu1 04/01/2014
> > [    0.011131] RIP: 0010:__queue_delayed_work+0x11a/0x140
> > [ 0.011133] Code: c4 08 48 89 df 5b e9 85 28 0a 00 90 0f 0b 90 4c 8b 42=
 08 48 8d
> > 42 08 49 39 c0 0f 84 1c ff ff ff 90 0f 0b 90 e9 13 ff ff ff 90 <0f> 0b =
90 e9 ec
> > fe ff ff bff
> > [    0.011134] RSP: 0000:ffffffff82e03e00 EFLAGS: 00010003 ORIG_RAX: 00=
00000000000000
> > [    0.011135] RAX: 0000000000000000 RBX: 0000000000000040 RCX: 0000000=
000001388
> > [    0.011136] RDX: ffffffff83a3f320 RSI: 0000000000000000 RDI: 0000000=
000000040
> > [    0.011136] RBP: 0000000000000000 R08: 0000000000000082 R09: 0000000=
000000001
> > [    0.011136] R10: 000000000000000a R11: 000000000000000a R12: fffffff=
f82c09fd0
> > [    0.011137] R13: ffff88807ffcfb89 R14: 0000000000000000 R15: 0000000=
000001388
> > [    0.011140] FS:  0000000000000000(0000) GS:ffff8880fa26e000(0000) kn=
lGS:0000000000000000
> > [    0.011141] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [    0.011141] CR2: ffff888003a67000 CR3: 0000000002e30000 CR4: 0000000=
0000000b0
> > [    0.011142] Call Trace:
> > [    0.011143]  <TASK>
> > [    0.011143]  queue_delayed_work_on+0x6a/0x80
> > [    0.011145]  inval_wq_set+0xc4/0xe0
> > [    0.011149]  parse_args+0x299/0x3c0
> > [    0.011151]  ? __pfx_unknown_bootoption+0x10/0x10
> > [    0.011154]  start_kernel+0x3b8/0x7c0
> > [    0.011156]  ? __pfx_unknown_bootoption+0x10/0x10
> > [    0.011157]  x86_64_start_reservations+0x24/0x30
> > [    0.011160]  x86_64_start_kernel+0xd1/0xe0
> > [    0.011162]  common_startup_64+0x13e/0x158
> > [    0.011165]  </TASK>
> > [    0.011166] ---[ end trace 0000000000000000 ]---
> > [    0.011173] ------------[ cut here ]------------
> >
> > 2) TO-BE (after fix)
> > - no error while booting, and also fuse_dentry_tree_work works well.
> >
> > ---
> >  fs/fuse/dir.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> > index da23ccd8685c..6965a77a871f 100644
> > --- a/fs/fuse/dir.c
> > +++ b/fs/fuse/dir.c
> > @@ -39,6 +39,7 @@ static struct delayed_work dentry_tree_work;
> >  /* Minimum invalidation work queue frequency */
> >  #define FUSE_DENTRY_INVAL_FREQ_MIN 5
> >
> > +static bool inval_wq_ready;
> >  unsigned __read_mostly inval_wq;
> >  static int inval_wq_set(const char *val, const struct kernel_param *kp=
)
> >  {
> > @@ -62,6 +63,10 @@ static int inval_wq_set(const char *val, const struc=
t kernel_param *kp)
> >
> >       *((unsigned int *)kp->arg) =3D num;
> >
> > +     /* Defer the work until fuse_dentry_tree_init() sets it up. */
> > +     if (!inval_wq_ready)
> > +             return 0;
> > +
> >       if (num && !old)
> >               schedule_delayed_work(&dentry_tree_work,
> >                                     secs_to_jiffies(num));
> > @@ -224,6 +229,11 @@ void fuse_dentry_tree_init(void)
> >               dentry_hash[i].tree =3D RB_ROOT;
> >       }
> >       INIT_DELAYED_WORK(&dentry_tree_work, fuse_dentry_tree_work);
> > +     inval_wq_ready =3D true;
> > +
> > +     if (inval_wq)
> > +             schedule_delayed_work(&dentry_tree_work,
> > +                                   secs_to_jiffies(inval_wq));
> >  }
> >
> >  void fuse_dentry_tree_cleanup(void)
> >
> > base-commit: ab9787d7e66ac7e6e94fc975b37c5b56fff98ca9
> > --
> > 2.53.0
> >
>

Best regards,
Sang-Heon Jeon
