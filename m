Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793948895;
	b=hUyQlOtUGFIAcScb2UusF59tSgtOMwahavDQoDrDP7k28pbOvBousjeCBF1Eh1bZIg93
	 JcrxCJ0Kt3+BKeMo8C9vcRasUpNgApK6Bsns4RgH01rd+15I3TFbUPcphXNm9Dl1r7fR4
	 NmoLEDr8kdFQ1RqlAG2zeVPBVHwPRV0KdYkXpycUC1VgCxStTBp/5T7HvXwijABRVQGTb
	 6rZb2XU5PjWN4M9JxT7mcCBjBJuVttDAvyaUY7NIBvcvzt2tcWjoaDzViekAPFtImp4fH
	 MDQ4J0uKTQUUA3qUjSLSy8DKTRvEuzSd4sV3EQVqwq6sLae2zAcap2gsP7U4hRX7rPw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793948895;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=S80Aki1MZIKsaLrEPPSq4R+7BMxNgCPLgicxZ7e4X9Q=;
	b=FILXkpf/tofpe/mPVC3ao++l+jemzZZZ9zqB9V3q/pk/MDNq0mFzx+NqB3ttf7MELbWk
	 A9AeuliJ36xEBPn0GutEcGat14ei6l7jYYLA+7JqlABQCL5oYy6OGY7YNGDD5+LoC8oNK
	 Ryz/msT6LwZ4dRRQMpk5ERKdJCg3zZIjVVOzJ4inzXQLpiF+L1JogmKgsDoup+NQJnshB
	 BfPT6oFoMgBD5ICvc8y9NmZXA993pc03ixEhQEV73w/4ww8dTtnijbEb9lVZ2nLnMeC6m
	 L35bIs0eZfNP2HUm25+4Xcw65L+mfxMvXh7FE6MoxtpzmkUuNTPJ3LDRCEWhHZedMvw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloud.ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=cloud.ionos.com header.i=@cloud.ionos.com header.a=rsa-sha256 header.s=google header.b=NN1PAoGR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449BA606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 07:08:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 449BA606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cloud.ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloud.ionos.com header.i=@cloud.ionos.com header.a=rsa-sha256 header.s=google header.b=NN1PAoGR
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c40aa03a96fso1299866b.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 23:08:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793948892; cv=none;
        d=google.com; s=arc-20260327;
        b=Xc0Cie+W5f0VioZQdd2rtkARfYOAevyEpKMZhebGzZrq5xi36F3z3J+813PHRyR7K/
         hLIQ61M1f9FjLcuFQv/6AkmgDVyxaum8fbI8cesDz1NXJD/cMqhmSBgxOw0brJeVhPJA
         bpicwfcORFBfZO8I4qNSCmMdqwoEwGGDrmx4Yw6UblbB1QFywr5UConPNayg2DV/DfEv
         9D4DD3Jw/f8B5KDOnbqd6/S5qo3fn3tq98tHvI5Gu3nX4gXBkF1brBWrCJp2ZsJCN0mF
         NG9qOxmjdWKn12BfU/U/mGwt9DaGEOI884SE261DB6OOidiMNtAIvAZ70LzR3RG2CDMm
         Xh1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S80Aki1MZIKsaLrEPPSq4R+7BMxNgCPLgicxZ7e4X9Q=;
        fh=X+9pELoMr+yr/DKIvDypCzv0+qBESf3Pbv9Mv0cyRos=;
        b=G6CG6P+gXxDeQK3OVzjirDl2jvkzyXJm6Q1lK173mA9CNXpuH9mWCxN0lJrMsToxk5
         FrWE44Fh5ijZMXDmRGJtc8Frmjc+gG3o1yuRm/nX2EpT11Vaz6gwii7C7pW81eP1wMH3
         hXQf75JKhAmxQ+rs/oAHSil3tGMCrvmTLMqoFNlhwp26GDwHmQIgMp8UY6pVYKnZyZDZ
         DwBa3PFjFiLujJ73dMh1KBRdnTYMZ5nsY95b5QVRDhzsCWsIFYW/PEiQd49KOyO4vA5c
         4sh/Eaer8epyatEFet9FINkjNIsenLe/qT2/T2Oi/RV2VMOTsBOijBXbOr3iNJsLbcbW
         /Hvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.ionos.com; s=google; t=1793948892; x=1794553692; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S80Aki1MZIKsaLrEPPSq4R+7BMxNgCPLgicxZ7e4X9Q=;
        b=NN1PAoGRaVMXQJMrBCGqbtbalWa4Bap1MNHTxghdMw3pSLOmbk8Qo8aFn0VltyhVBe
         BiCqJ1Zk/SRo+fmKhMHCOOBgx2huZmw1ZVtlqzbTTxx8UKlwEoPpgC0LjIZJA3pBevca
         SnhySWcInUafYU/Q00RBmbtl/Yyus859ZTj5VXIlwqR15zuL90L9wzDWzkwvGVIhq5LY
         /qCFKA4y1RkauzDDbUxmnYJjLmXRx105x1rcHIm6z8sTmH/ohFIvdLSlRvw8k7hkNxEC
         m577hzKqc+XPVF4mWMqsWQ0EtokRPKPJjQVHNnA/Z0otDOHGYpVkQ4IfVLWGG5HuCjwc
         ANOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793948892; x=1794553692;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S80Aki1MZIKsaLrEPPSq4R+7BMxNgCPLgicxZ7e4X9Q=;
        b=CW0YcLo9u/5N30Mt/XDZgsud+USoEGBRjefhibZehsySPy8aL1QEsize5XpX1PfU+/
         Xb6Y74yeS80ArB/EO2caPno5DnB/5/KCed+PBs+VFAKVVsszJHc95eiNnHbtsWx1/lWv
         r0wxz33Va9Jaru5rs2eItuM8Ip2NMB89iGjf0ejNYRlaJWAs7+MdgQmd2ffwalN9CW8U
         qqyI9wkmKMbllZjoeNZBCuZT+6KuoVGzz7fG3oc3ETIP3OJ0nH1hHNYQkjZnHFnPQNV8
         JiB8YP5/OksYYf+jAr11tz9LDVN3BYBYO868mC58tKh9zn9wITOmux1ASKzJpuIi/9Fp
         5uGA==
X-Forwarded-Encrypted: i=1; AKwUvByzg2j4fz/M6z3yjUE45CDHWYIl/8b2PGi+5PnIBz435ZeyMhOSxCYQDkM0egRi5WOoGNkivdJjOoXTUSQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ga/c88bRtv7wwCZBcUxveLcHTWp8PXrfiAc+nrbL1jgH72bd7
	me+QGpfeToQw+fKZNb3wm/3KCqIehXdufjyKAry0VgexSM8RDFFC0a+HfiQ4wq1RMJyGl6VXU5k
	41TMjT7QPYwFt1kwgpPFDN0WUNzasF25x8kgfw0n+ow==
X-Gm-Gg: AYBFou3xAa2kz/qi4l1GUjHV9uvRiBIC3dG7CDM4u+++gZYybXOcRblhbtT9K9bMO0x
	anLVd/FT9gyERHWzboZA8ZVsD716PTiioHvmY2sClTMVNi8d7a24dlrZ3QhcuTTOZmvVkbm4Th7
	USwg1qeUYU1OUvWYsyGb3mpiSr9/sYstujTDHUTJ2y8UZTK+C+rrqyCvq0ebMvewYPIrUauiBMW
	cQKC6rgBi5uQMup7bJ3ZhBTkE1RhoHhph0eceQIGmcz8NTecmWds2alY+oRLF8EB9Dt22+PIO/E
	kXk8carAAVHJrTncDVoi9NzBTE8It3Auw1gUdgycEqYLYJkpcTADlcvkNkHKbYZkC8Ne28Bl1cZ
	N1hHKGTm/x7bMpUvwNNi+6m48xDbvhekLfiLKxsUx/+I+cRlGS/gVF+M7tdpy2hJ99/6Q37nWfb
	p+Hbk+CAvCc9qVcCU=
X-Received: by 2002:a17:907:1258:b0:c4d:1501:ac3a with SMTP id
 a640c23a62f3a-c4d352df5a2mr135981666b.2.1793948892542; Thu, 05 Nov 2026
 23:08:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <eded31de-2e92-4a3b-9384-03dbebc5e9e7@fygo.io> <20261102073555.53941-1-jinpu.wang@ionos.com>
 <54d9c6e7-7467-4c68-b34f-4a984f7fb318@fygo.io>
In-Reply-To: <54d9c6e7-7467-4c68-b34f-4a984f7fb318@fygo.io>
From: Jinpu Wang <jinpu.wang@cloud.ionos.com>
Date: Fri, 6 Nov 2026 08:07:59 +0100
X-Gm-Features: AclHuK9aQXEbLTrSPM8e4jm8ymLgFvT0Vnmp-FN3vyaG3ScuxQ70C6P0VANqlfA
Message-ID: <CAMGffEmw=24WVqVXwsMMAQF589+njxDXFUAKD4VmiFv3CBmVbw@mail.gmail.com>
Subject: Re: [PATCH v3] md: clear MD_CLOSING when array_state_store() bails on
 interrupted lock
To: yukuai@fygo.io
Cc: Song Liu <song@kernel.org>, Li Nan <magiclinan@didiglobal.com>, 
	Xiao Ni <xiao@kernel.org>, linux-raid@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 2:42=E2=80=AFAM yu kuai <yukuai@fygo.io> wrote:
>
> Hi,
>
> =E5=9C=A8 2026/11/2 15:35, Jack Wang =E5=86=99=E9=81=93:
> > From: Jack Wang <jinpu.wang@cloud.ionos.com>
> >
> > Writing "clear", "readonly", "inactive" or "read_auto" to array_state
> > calls mddev_set_closing_and_sync_blockdev(), which sets MD_CLOSING to
> > keep the array from being reopened while it is torn down. The flag is
> > only cleared again at the tail of array_state_store() (for readonly /
> > read_auto / inactive, or the failed-clear case).
> >
> > Between setting the flag and reaching that tail there is an early retur=
n:
> >
> >       err =3D mddev_lock(mddev);
> >       if (err)
> >               return err;
> >
> > mddev_lock() is mutex_lock_interruptible() on reconfig_mutex. If the
> > writing task catches a signal while blocked there, it returns -EINTR an=
d
> > MD_CLOSING is left set on a still-running array. do_md_stop() /
> > md_set_readonly() never ran, so the array keeps working internally, but
> > every subsequent md_open() now returns -ENODEV for all callers - the
> > device shows up in /proc/mdstat and sysfs is fully populated, yet canno=
t
> > be opened, and cannot be recovered without a reboot (all clear paths
> > either need the device open or re-enter test_and_set_bit(MD_CLOSING) an=
d
> > bail with -EBUSY before the clear).
> >
> > The window is easy to hit on a busy host: reconfig_mutex is held for lo=
ng
> > stretches by a running resync/recovery, widening the interruptible wait=
,
> > and a userspace helper writing to array_state and then being killed or
> > timed out is enough to leak the flag.
> >
> > Clear the flag directly in the interrupted-lock exit. Guard the clear
> > with a set_closing flag that records whether this write actually set
> > MD_CLOSING: the set call is skipped when the array is not running
> > read-write (or mddev->pers is NULL), and in that case this write must
> > not clear a MD_CLOSING it never set. This also tightens the pre-existin=
g
> > tail clear, which had the same unconditional behaviour.
> >
> > Fixes: 99b902ac1725 ("md: sync blockdev before stopping raid or setting=
 readonly")
> > Assisted-by: Claude:claude-opus-4-8 [Claude Code]
>
> checkpatch reprot error with this tag.
ok, will drop it.
>
> > Signed-off-by: Jack Wang <jinpu.wang@cloud.ionos.com>
> > ---
> > v3: (Kuai) clear MD_CLOSING directly at the mddev_lock() failure and
> >      return, drop the out_clear_closing label; reword the commit messag=
e.
> >      Keep the set_closing guard: the set call is skipped when the array
> >      is not rdwr or mddev->pers is NULL, so this write may not own the
> >      flag. Rebased on v7.4-rc1.
> > v2: guard the clear with set_closing.
> >
> >   drivers/md/md.c | 13 ++++++++++---
> >   1 file changed, 10 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/md/md.c b/drivers/md/md.c
> > index 03e35386a802..f14a31387990 100644
> > --- a/drivers/md/md.c
> > +++ b/drivers/md/md.c
> > @@ -4671,6 +4671,7 @@ array_state_store(struct mddev *mddev, const char=
 *buf, size_t len)
> >   {
> >       int err =3D 0;
> >       enum array_state st =3D match_word(buf, array_states);
> > +     bool set_closing =3D false;
> >
> >       /* No lock dependent actions */
> >       switch (st) {
> > @@ -4691,6 +4692,7 @@ array_state_store(struct mddev *mddev, const char=
 *buf, size_t len)
> >               err =3D mddev_set_closing_and_sync_blockdev(mddev, 0);
> >               if (err)
> >                       return err;
> > +             set_closing =3D true;
> >               break;
> >       default:
> >               break;
> > @@ -4718,8 +4720,12 @@ array_state_store(struct mddev *mddev, const cha=
r *buf, size_t len)
> >               return err ?: len;
> >       }
> >       err =3D mddev_lock(mddev);
> > -     if (err)
> > +     if (err) {
> > +             /* Interrupted before any teardown ran, don't leak MD_CLO=
SING */
> > +             if (set_closing)
> > +                     clear_bit(MD_CLOSING, &mddev->flags);
> >               return err;
> > +     }
> >
> >       switch (st) {
> >       case inactive:
> > @@ -4792,8 +4798,9 @@ array_state_store(struct mddev *mddev, const char=
 *buf, size_t len)
> >       }
> >       mddev_unlock(mddev);
> >
> > -     if (st =3D=3D readonly || st =3D=3D read_auto || st =3D=3D inacti=
ve ||
> > -         (err && st =3D=3D clear))
> > +     if (set_closing &&
> > +         (st =3D=3D readonly || st =3D=3D read_auto || st =3D=3D inact=
ive ||
> > +          (err && st =3D=3D clear)))
>
> Just keep the checking of set_closing should be enough.

A bare "if (set_closing)" at the tail would also clear MD_CLOSING after a
successful "clear". do_md_stop() -> md_clean() keeps it on purpose so the
stopped array can't be reopened (except legacy mode with hold_active).

So v4 uses:

        if (set_closing && (st !=3D clear || err))

i.e. always clear for readonly/read_auto/inactive, and for "clear" only
if it failed (array still live). Does that look OK to you?

--
Thanks,
>
> >               clear_bit(MD_CLOSING, &mddev->flags);
> >
> >       return err ?: len;
>
> --
> Thanks,
> Kuai
