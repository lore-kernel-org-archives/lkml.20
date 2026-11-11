Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794410688;
	b=TJU2gfR0TMB663heMlZ6QSxJIeZaB7oGPKipAS6akk7x1kCz8fmmvGabRBgsBZb1pBz+
	 NPcb4CIRdVw0GOjuBDk4yxVqFotDI8/NwvSMhg3ZmTnGpc9OSWc3z1cpAMH64L50bp41e
	 K3vnODsnS0KaIwwYEZvhy2syqTFkdnFRqE1B8H0wLe4JNHuap7LYmkwEZ01YV5Yj4fYhZ
	 ro98Mkpl7xpTfOdWSUvzzI6JOFoH8Jc7esXRd16SIPLIMlhA3GcLstgYfP9DaGnRce5NH
	 +ViZEF6Nj/P1AVKT7u8nH+e498gJ3cuMhN5f08tgl1xsDTLbTbqWXjntVAVASIqw9zQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794410688;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=n4i9xV6coeC0dw23WHMaqm6dfnSZyHsCImBOodlCWGI=;
	b=AVFhdBUz05EJ5DXBrKISfgQrz29XvWesVm6TaMcbdThxtybEUxS7zn9m8BeXfEASFXgG
	 R2aX4y0126bC3eL+gZ6hWYKOmXJ0IYry+galRyNXr1rJeha+SMvbrsw+GRwHfT8HSp40r
	 fuwrA7xrvqOBJvIC9BSdpVBYR5fcFBEbtyAvZQ6bqkCxhi12roAV9OaGmKf8IVYikBNrp
	 HbbCJdY6052pKuZDnq/HY8ctINRXQCdwFhKSces0LZPIRCXCjib9dRlZkKQEDIWda95oS
	 8AlGmEVy57MKzeoxtEMngjKqHfA8CzE4q26NBlMbrfNA9U6U7G6HsfjW1V9PvpGI2eQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rToyuMs2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EFA606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:24:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3EFA606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rToyuMs2
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-67990a45e02so3306023d50.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:24:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794410687; cv=none;
        d=google.com; s=arc-20260327;
        b=p6iwXjguJStjKhSf7VU+RlkbkYuzwdzMXp4/0oy6YgncH6+8kD9rHmt7kRqcjdBArZ
         cnQC6wvvXmqi2SGMenIgaWExerd2FFdPnKBOX+x+yK+HXYgrP2al3IoNUJ+x/J+NQC4O
         Y90N0i8S2gtT6Mi/CiXpEfB2jCyWDIVOO2bgo1Vk3dJQzMpmBk9wvTIfzTnS0jBYHcE0
         PflGP/ZHkPowbvCti+ho6LS/Ybp6CbyILFmQdYziGlyfDmnxjF+nrTQEr2v5HIa8zFti
         MZTUfEXvlYxUMt6mRGuJGA53tkm5kjHGdu+PiUwbVX4oh6YMbwYR1ftou6aC//4C0LGW
         PirA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n4i9xV6coeC0dw23WHMaqm6dfnSZyHsCImBOodlCWGI=;
        fh=rtrNBH82NLeHjhhSMSyQaGyoFwR3tMhyn6TzNSrE75E=;
        b=YEJVSlZfhaOja9EJKvDRmAoSt4flM6VGfm4AuIVMoFS4+DhxLD0rn5RKMldEysZFiT
         yuPgATN9CmAY8u4VSMWt7m46eKdGNit2Rl2n1/O5b1kDDGpfLyK795bzgYxhrecZwatl
         i5lK97bOZFovhTU1ple8JWWQzkAD3IIz6d8pgD8KEoDkQfskQMTCBRP4GQkyyEqcbCuH
         tM2ypWkEJW/ofXxBgF3cpYZJWoa4fbY3JWQn6nTtH86Xs9gjQoJUYddRLWKB7QAFLmsV
         FbkRlOOk7pwf6tCWUYQXSrdWO3xZUxI33qlueMK21iVRU4e+49Jd6kD6cmb8Weiq4GBd
         qUCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794410687; x=1795015487; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n4i9xV6coeC0dw23WHMaqm6dfnSZyHsCImBOodlCWGI=;
        b=rToyuMs2OSr2TCYP532sQALRu830BkM7UYIDWfU2cR7ONAGox+n1E2h7hDAflbsiEp
         MWmleTs6MFm+g6C1nvf8GFEwMRuyEClvN6Ta3aairwMV0ykYsqIngN1ttCjUoWRJ47y7
         emxZg5cDKf1XnmMhSjyap+SIXOxzjFvOkgwRg90iP4SiOokkciHlsDHQkFoTk5iZuU68
         hl4Lwea7zfF/RsL7bGVUIp/YRj7WXbzZ4Tb7FRaw4FkuZQQ7eM03lvAugaBV3AFt9rxX
         NALcKElMXYJg7/TOpibcqebFTGdAAPJUUGm+M2xwbFdLXyNnWO72RndGmqts9Lwu4+GK
         SyoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794410687; x=1795015487;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n4i9xV6coeC0dw23WHMaqm6dfnSZyHsCImBOodlCWGI=;
        b=L6suS2qx346XDXwzaddlespc9P1OLvw1VMFr02ISGWi+4sQoP31ef/MzvB5ObWiR7N
         ev6cy5CFo+Gt+YeCmwZ4QJIx4iiOPF0rU8x24whUQSvcHCI12ZVCNVGQFlg8FDtnZI6J
         0+EMByGaD59LyCB7HRZ+P3FfiHpcucE2TVIIQqHZ1rw92EriDsOBos+aUN8+55B8FceX
         yPg/n9kn6j/C9guGWUDH/HkcqzGD2DEVxfbCS7FzAyErznAcTOLAVSQ5hGB/iE2wzKHE
         3VzEKjn3hv34oR5E3DXt8k08aGswYVPnOQHdsrICpnmWdH8r2jyfpob374ZIWQnNS8+O
         tO2g==
X-Forwarded-Encrypted: i=1; AL+hErEzTgRisJvF46P20g7+LhshWJ1wwF2ZBmJ3exkFtDg3hqbRbh/DQTzFCFS1q8E5xVjfEzhEbCCTy5wU9YY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ne+2VTnA6/sFUmWp0ua5j7Ef5FwjP1utiQdCqG0OHdAVzEXGE
	uRru37kEJW8RIL4yMHGHsNJIqHs207YMRT5XLqDojlXnL9h2APmEJh7XKmYrtnsPlGVPKVSGF+5
	9DkTHMZ8Fudtkiew/cqqe3zETUXeB87Y=
X-Gm-Gg: AYBFou0hDUAYZr+T36WBNFkzIpWRFZRXf0V6Yqb0AyiL5xrXuDJbVoaR32ZFN5Lzq8o
	9+c0s7fnfRUOwpedqhMibN4fGpMYOKp0CV+J4ztE3lBo4iJNGufXnpxGpqkc7Gb0mWRIoTh07AZ
	bF8EeDwX0MmHejV7JQCWt9zdl9WMI9jHi0Wr2yjD6r++H30uCLYxVwEwG/pk/1LKNVJ4h8KZHbn
	zKwB0H1104Q2544m+X9GVcctmCcYeMpUpFurfC326RVRTKYq/bsmPjbqap6N6RyLMVhEIWX7bYW
	eXRW32eX3IUtejydRFc8qY1uQHmMKE2pq16Oa39+M4bZqDW40EEgGHZer7cxMDRSf55sHQXHq8/
	x+bKBX7ZqafMysXG7q1ZCXWgbkEH2esX0kmL9yNu1FYjZsj4HxbE/+a8E8+gk2l4vvQ==
X-Received: by 2002:a05:690e:1504:b0:677:da43:28c1 with SMTP id
 956f58d0204a3-67c67f95cdcmr1887314d50.61.1794410686353; Wed, 11 Nov 2026
 07:24:46 -0800 (PST)
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
 <CABFDxMGJ+Uum7dde3AN5Ab+H4Gwb23Upj7r9=SO21NWCo+Mhow@mail.gmail.com> <87mrrf8o4k.fsf@igalia.com>
In-Reply-To: <87mrrf8o4k.fsf@igalia.com>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Thu, 12 Nov 2026 00:24:34 +0900
X-Gm-Features: AclHuK9pJt9whdPT0W2osC63TiBxJY3kQf0Ig_irSJmHZwpSbOdmq-OOp5cP5hI
Message-ID: <CABFDxMEuH399Q5CPp_Pnvx1ZCpr0MAaBLDmVz2aoKqJ26ng4ZA@mail.gmail.com>
Subject: Re: [PATCH] fuse: defer dentry_tree_work until fuse_dentry_tree_init()
To: Luis Henriques <luis@igalia.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Miklos Szeredi <mszeredi@redhat.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 11=EC=9B=94 11=EC=9D=BC (=EC=88=98) =EC=98=A4=ED=9B=84 10:58,=
 Luis Henriques <luis@igalia.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:


>
> On Wed, Nov 11 2026, Sang-Heon Jeon wrote:
>
> > 2026=EB=85=84 11=EC=9B=94 11=EC=9D=BC (=EC=88=98) =EC=98=A4=ED=9B=84 8:=
27, Sang-Heon Jeon <ekffu200098@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
> >>
> >> Hi, Luis
> >>
> >> 2026=EB=85=84 11=EC=9B=94 11=EC=9D=BC (=EC=88=98) =EC=98=A4=ED=9B=84 6=
:28, Luis Henriques <luis@igalia.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
> >> >
> >> > On Wed, Nov 11 2026, Sang-Heon Jeon wrote:
> >> >
> >> > > inval_wq_set() schedules dentry_tree_work when inval_wq is enabled=
.
> >> > >
> >> > > But inval_wq_set() can be called at boot or module load before
> >> > > fuse_dentry_tree_init() initializes the work, so __queue_delayed_w=
ork()
> >> > > warns and the work never starts.
> >> > >
> >> > > So defer scheduling the work until fuse_dentry_tree_init() sets it=
 up.
> >> > >
> >> > > Fixes: ab84ad597386 ("fuse: new work queue to periodically invalid=
ate expired dentries")
> >> > > Cc: stable@vger.kernel.org
> >> > > Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
> >> > > ---
> >> > > QEMU based test result
> >> > > - booted with "fuse.inval_wq=3D5"
> >> >
> >> > Thank you, Sang-Heon.  I've sent a fix for this already[1], but sash=
iko
> >> > still has some race complains which I haven't looked into yet.  But =
maybe
> >> > Miklos is happier with your patch, in which case you can add my
> >>
> >> Sorry, I missed that thread.. sashiko also complains about the same
> >> race condition between init and sysfs setup. But I'm not sure it is a
> >> realistic scenario. So I want to hear other voices as well.
> >
> > I also checked the other sashiko's complaints from your patch, the one
> > about race between module cleanup and sysfs. It looks easier to
> > reproduce, but still I'm not sure this is a realistic problem. If it
> > is worth fixing, I will sent v2 with serialization between module
> > init, cleanup and inval_wq_set()
>
> I agree that the first race doesn't look realistic, though it could be
> fixed by adding an extra spinlock (which could protect both inval_wq and
> dentry_tree_is_initialised).
>
> The second race would be easier to fix by setting
> dentry_tree_is_initialised back to 'false' in fuse_dentry_tree_cleanup().

But I think race can still exist with that.

CPU0
                    CPU1

                       inval_wq_set()

                        READ_ONCE(dentry_tree_is_initialised) // true

                        <sleep>
fuse_dentry_tree_cleanup()
 WRITE_ONCE(dentry_tree_is_initialised, false);
 cancel_delayed_work_sync(&dentry_tree_work);

                        <wakeup>

                        mod_delayed_work(&dentry_tree_work) // already
false but executed


                        fuse_dentry_tree_work() // later can cause
UAF?

IMO, if we need to fix the first and second race both, then I prefer
to use lock. But if we need to fix the second race only, then
disable_delayed_work_sync(sashiko's suggestion) looks better.

Please correct me if I misunderstand something.

> One thing I like with my version of the fix is that it replaces the usage
> of schedule_delayed_work() by mod_delayed_work().  But maybe that's out
> of the scope of this fix, and I should send that separately.

I do believe that is a great enhancement. But as you said it could be
applied separately :)

> Cheers,
> --
> Lu=C3=ADs
>
>
> >> > Reviewed-by: Luis Henriques <luis@igalia.com>
> >>
> >> Thanks for your review :)
> >>
> >> > [1] https://lore.kernel.org/20261106155512.24801-1-luis%40igalia.com
> >> >
> >> > Cheers,
> >> > --
> >> > Lu=C3=ADs
> >> >
> >> > > 1) AS-IS (before fix)
> >> > > [    0.011073] Kernel command line: rootwait root=3D/dev/vda conso=
le=3Dtty1 console=3DttyS0 nokaslr  fuse.inval_wq=3D5
> >> > > [    0.011114] ------------[ cut here ]------------
> >> > > [    0.011115] WARNING: kernel/workqueue.c:2704 at __queue_delayed=
_work+0x11a/0x140, CPU#0: swapper/0
> >> > > [    0.011124] Modules linked in:
> >> > > [    0.011128] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 7.4.=
0-rc1-00010-gab9787d7e66a #1 PREEMPT(undef)
> >> > > [    0.011130] Hardware name: QEMU Standard PC (i440FX + PIIX, 199=
6), BIOS 1.17.0-debian-1.17.0-1ubuntu1 04/01/2014
> >> > > [    0.011131] RIP: 0010:__queue_delayed_work+0x11a/0x140
> >> > > [ 0.011133] Code: c4 08 48 89 df 5b e9 85 28 0a 00 90 0f 0b 90 4c =
8b 42 08 48 8d
> >> > > 42 08 49 39 c0 0f 84 1c ff ff ff 90 0f 0b 90 e9 13 ff ff ff 90 <0f=
> 0b 90 e9 ec
> >> > > fe ff ff bff
> >> > > [    0.011134] RSP: 0000:ffffffff82e03e00 EFLAGS: 00010003 ORIG_RA=
X: 0000000000000000
> >> > > [    0.011135] RAX: 0000000000000000 RBX: 0000000000000040 RCX: 00=
00000000001388
> >> > > [    0.011136] RDX: ffffffff83a3f320 RSI: 0000000000000000 RDI: 00=
00000000000040
> >> > > [    0.011136] RBP: 0000000000000000 R08: 0000000000000082 R09: 00=
00000000000001
> >> > > [    0.011136] R10: 000000000000000a R11: 000000000000000a R12: ff=
ffffff82c09fd0
> >> > > [    0.011137] R13: ffff88807ffcfb89 R14: 0000000000000000 R15: 00=
00000000001388
> >> > > [    0.011140] FS:  0000000000000000(0000) GS:ffff8880fa26e000(000=
0) knlGS:0000000000000000
> >> > > [    0.011141] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >> > > [    0.011141] CR2: ffff888003a67000 CR3: 0000000002e30000 CR4: 00=
000000000000b0
> >> > > [    0.011142] Call Trace:
> >> > > [    0.011143]  <TASK>
> >> > > [    0.011143]  queue_delayed_work_on+0x6a/0x80
> >> > > [    0.011145]  inval_wq_set+0xc4/0xe0
> >> > > [    0.011149]  parse_args+0x299/0x3c0
> >> > > [    0.011151]  ? __pfx_unknown_bootoption+0x10/0x10
> >> > > [    0.011154]  start_kernel+0x3b8/0x7c0
> >> > > [    0.011156]  ? __pfx_unknown_bootoption+0x10/0x10
> >> > > [    0.011157]  x86_64_start_reservations+0x24/0x30
> >> > > [    0.011160]  x86_64_start_kernel+0xd1/0xe0
> >> > > [    0.011162]  common_startup_64+0x13e/0x158
> >> > > [    0.011165]  </TASK>
> >> > > [    0.011166] ---[ end trace 0000000000000000 ]---
> >> > > [    0.011173] ------------[ cut here ]------------
> >> > >
> >> > > 2) TO-BE (after fix)
> >> > > - no error while booting, and also fuse_dentry_tree_work works wel=
l.
> >> > >
> >> > > ---
> >> > >  fs/fuse/dir.c | 10 ++++++++++
> >> > >  1 file changed, 10 insertions(+)
> >> > >
> >> > > diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> >> > > index da23ccd8685c..6965a77a871f 100644
> >> > > --- a/fs/fuse/dir.c
> >> > > +++ b/fs/fuse/dir.c
> >> > > @@ -39,6 +39,7 @@ static struct delayed_work dentry_tree_work;
> >> > >  /* Minimum invalidation work queue frequency */
> >> > >  #define FUSE_DENTRY_INVAL_FREQ_MIN 5
> >> > >
> >> > > +static bool inval_wq_ready;
> >> > >  unsigned __read_mostly inval_wq;
> >> > >  static int inval_wq_set(const char *val, const struct kernel_para=
m *kp)
> >> > >  {
> >> > > @@ -62,6 +63,10 @@ static int inval_wq_set(const char *val, const =
struct kernel_param *kp)
> >> > >
> >> > >       *((unsigned int *)kp->arg) =3D num;
> >> > >
> >> > > +     /* Defer the work until fuse_dentry_tree_init() sets it up. =
*/
> >> > > +     if (!inval_wq_ready)
> >> > > +             return 0;
> >> > > +
> >> > >       if (num && !old)
> >> > >               schedule_delayed_work(&dentry_tree_work,
> >> > >                                     secs_to_jiffies(num));
> >> > > @@ -224,6 +229,11 @@ void fuse_dentry_tree_init(void)
> >> > >               dentry_hash[i].tree =3D RB_ROOT;
> >> > >       }
> >> > >       INIT_DELAYED_WORK(&dentry_tree_work, fuse_dentry_tree_work);
> >> > > +     inval_wq_ready =3D true;
> >> > > +
> >> > > +     if (inval_wq)
> >> > > +             schedule_delayed_work(&dentry_tree_work,
> >> > > +                                   secs_to_jiffies(inval_wq));
> >> > >  }
> >> > >
> >> > >  void fuse_dentry_tree_cleanup(void)
> >> > >
> >> > > base-commit: ab9787d7e66ac7e6e94fc975b37c5b56fff98ca9
> >> > > --
> >> > > 2.53.0
> >> > >
> >> >
> >>
> >> Best regards,
> >> Sang-Heon Jeon

Best regards,
Sang-Heon Jeon
