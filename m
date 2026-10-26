Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792977042;
	b=WmyBsaJ0DHLIID0oUjGYM13588h+WXS3k8j0TQIQfKTKbZ4cya1S4synXbx3Bu/64ZCL
	 ibLM9PyjvQJZpjxlXB6JjRvvmGIz9SL24R273YQS8R+2U69XH2p66JphsoRXVTKmd+ch7
	 2G+HGm9sAzF4NAv6pxMHlqH6SfPBCzniCUBJWzL6CrxcXqDVlGYkr/CxZD46a8JkbYHSJ
	 kNeUbD9R2hv+a0fj2Xm1KaAdifPB/GQ/hrfu9guNj7T8sefWJM/DfchKiiRX4Wlaxakum
	 Ds1h19eIU77yEGibhwBPavBzv86O5tNtmt97drFkHoRiimvrRl+/kTlFK4fE2DqqYNg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792977042;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=serC0Qr3v1AkQ41cs9qFoAlejUw/dVTynlDISylCuz8=;
	b=pzD7xg4ISCc3jY8AGS8PFm/Z+nXT67w4tfdb0H71KXH/DxS2MDyBhXUDT4kXo1At8dcb
	 BbzJ03nRv5IJbr44H7cImMdRiTwqSWF2rfam8MBUfjO6OsNxwIlXoqF2LFwBVPeSYvGbX
	 hkNbtKeF/9xhw8JrBOt25fm9xqv8U2uIfzuB7eGAxnnQMCb1ZyyFKv20h5gMtDBIJP+8M
	 SMKSWkAnVVbDb2d6mqwsWvNUVQicEUvAeZBrKnz7N6CoYYyx4Yt36zC/En5Bg3XFpPuqc
	 IJyvgqNeAZIZV1PDBKMa88Y8wDiaLFjc9USsx58nFv2yIGcYURylXum32heTqGgLHRg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=br+Ue3PJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF5D606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:10:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DF5D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=br+Ue3PJ
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b1ec41d8e9so2491858a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 18:10:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792977040; cv=none;
        d=google.com; s=arc-20260327;
        b=XFZB29fhya4tDMhWC9Gi+M9YzkHJIRRmMxQGB45Z6gWyegFaeVTVk9yqinjqvK3tWK
         xlY+4ryL2jFTWvoxjCmEgfUnc/QPAvXikOZnsn2zBf6eyDEWokXhJMv6RWhXvAj5DwsH
         008yQpzAZykOdQ/RJldInn2MaNZx8QByJq0jtv1hSONnu+cgxI5zlRXaBbsUSN+msU69
         FZP6G0rDTRUh/jQ92HE0iBWDDFG4oBMPMZGa/C4bde37AKzFlbsmdz6NxSof9qJ9jvdN
         Y6fwgU7YEC6waVQee3oSiO8QFtG1kVbaKuEsJ0oMyH6l8sFe+QwiZHdzNITt8w8tnzYn
         34gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=serC0Qr3v1AkQ41cs9qFoAlejUw/dVTynlDISylCuz8=;
        fh=XaIIrL/mDixiJpWuyMnI3YmRM/qT1if7bNR/zWS64Gw=;
        b=OR2O1LKD0AuqzZQlenvGCf9Lb7MYEbZlzfEZzDNJOUb31kI+yVIHSkHDKRHELmK0h2
         ReBK/L53c+KSTtcJrcHl/9Y1llFk6qVqNVGlWgD/Zf5cS6VRLTRIcDwMuW6ShvfvbPc9
         Gfsa1vZKNvT+uNDEDgfY5UICdbZTj2pcXHgsPuwXhPE+1EKaEIGj6jHELkOy0Y5y6yU2
         IaxiYfFVzVuKowkl5VJ+ssvJVLJC6vQoIqYaCwQ5qOkWIpxcB450NyFqwSxw/rIrCm2t
         oLzCI+p6XVGS+nqBLoNk8C/zre9yOhO5mUSZwU1rBs6y+78L9MpSHdkLCZaeajEMaKmU
         frkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792977040; x=1793581840; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=serC0Qr3v1AkQ41cs9qFoAlejUw/dVTynlDISylCuz8=;
        b=br+Ue3PJQpGcd8GInxLVZG4vHJuACWu0SsJliX3CpZFvh6IeACLKqGSTl4zZUqfK4U
         om/IB9LbJu4SRvZxvuTXN/WYzHNKrXPTjz4KtYTVtr+fgDfKwYk17ao/DGU88cKmycgQ
         1Cq1/rfphPX9oaOfjozzj8oWVq6eBbKrKft3iPbLNcalnTwRkNFxOU9O85Jir1/ZGV2B
         GWri79rKSD6Nb8bgfhy5LdvT6JFpLzJ73K85B9jc2XszHrSE+NdSOFLdPKqqoHiV067l
         cPq57ySVwn1y3o569b4y7LmnIRoaPELdWUt+W7A/y0mM8BnWgq52jvb5jTl3Ui4xN1Z5
         dbpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792977040; x=1793581840;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=serC0Qr3v1AkQ41cs9qFoAlejUw/dVTynlDISylCuz8=;
        b=0IEJuinI3EuMaF7Mwn2fjZITaQZU9hzq33GyJngWFi/wDc1iF/hrXkgcczpXoXrzrj
         yz6D0C4xVyrhv65rypBtD8vD8zoWxAqyouDx/LJeDMso06uk2Hd/Yf2qGviOFCb19CbB
         ViDQT+DVAvHxqnnHX7Yk2mxWo+0D/CC3DwrQgbX2YBILM2kO/YOimMH8n0QDb0n/AZQY
         BRlmbZsU+CKFs9R0zV15LYzTYNsk855+w/XJShIOP52nNvJw1fal+nDZZaGgbV14DYQ7
         J7S1+XyegTu8qxNTy2DKeYikRvo3+Pe58lzU9YZgvyWLtBAj1bjzX87C6X8NUC52AWTl
         NDfg==
X-Forwarded-Encrypted: i=1; AKwUvBxy1QyfltbrGLZFNKs+hiOb957dd7CHfVnLFyH8G8qEhsKnDg7yZM1x9frXF1MaKOOPPW5bU//8oh9OqI0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZkArkJdAYTLdS39j2l13nmYaW/RG7Gv4ih4bgzf0/JvROZbRM
	nTnlbLZeVLUM1BbIiPNrnT9poPuwG4GKAdDLasQ2e/iWA05zK8jEkpbXMiVNPQkmV44sb7DCIPw
	yPcITv4gusm0/KWeSZkbCpmNsQSe3r3e5sZK9jfFWIQ==
X-Gm-Gg: AYBFou0vLhwN42qNFJ5SUWqFF00xCRH85KG5K15qwDuNhbBFTLA2fZyTjrv1M3bwcug
	p+7pV/eaF+hK/r9ZQsC1LYNuk47VvtudJPb11UGKO/glARxD753GgCBDPPCP1FBQSsNeqIxIOL3
	8bh7IJZ5qjylucveNLb7u2H7snueb+Q84Cl7S4GGOe+Eye1NAPfAlxwFnDCenlvILlAUxlyEqav
	DGVGX2k+V6XWdTX2FaCVWz+96+OdcKjbXmVu3oALKriSGN/7TvaI16I+Ho7SopsbGVtEKeYzWj+
	2Bg9LruAr74EpFhJ9o6eZEETVhLtlEmrmMAi5yYjnpX2GLosXpMSGJU5LqHMU73ImyPLX2SU3KV
	oxLpFcf6lVfJsZ1yYmjeRtH0iUwUK63G8gHEw+svyJrYwjYLVA5ipRNfvywrYCwcl3F9GZA==
X-Received: by 2002:a05:6402:440b:b0:6ac:62c2:bd39 with SMTP id
 4fb4d7f45d1cf-6b442fe12famr6368009a12.10.1792977039532; Sun, 25 Oct 2026
 18:10:39 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020144710.4154339-1-pasha.tatashin@soleen.com>
 <20261020144710.4154339-2-pasha.tatashin@soleen.com> <atsMZW4ChOWj7Lqv@kernel.org>
In-Reply-To: <atsMZW4ChOWj7Lqv@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sun, 25 Oct 2026 21:10:02 -0400
X-Gm-Features: AclHuK-SGyJEu7JWPJQ5FgiFjB9NPuO2-XlJh__utMnCfsTc4KvmMW8PdPmX4kI
Message-ID: <CA+CK2bD_=gwB-py6U3Y9pdc7RRoACeK9cqyHo65Q2ZKTyKaC2w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] liveupdate: Add LIVEUPDATE_SESSION_FREEZE ioctl to
 freeze sessions early
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-kselftest@vger.kernel.org, shuah@kernel.org, 
	akpm@linux-foundation.org, linux-mm@kvack.org, vipinsh@google.com, 
	linux-kernel@vger.kernel.org, dmatlack@google.com, kexec@lists.infradead.org, 
	pratyush@kernel.org, graf@amazon.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 3:27=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Tue, Oct 20, 2026 at 10:47:03AM -0400, Pasha Tatashin wrote:
> > Currently, LUO sessions are frozen automatically only inside the
> > reboot(LINUX_REBOOT_CMD_KEXEC) pathway, where luo_session_serialize()
> > iterates through all outgoing sessions under global write locks and
> > freezes them serially during shutdown. Allowing userspace to decide whe=
n
> > to freeze a session once it is done with it (and to freeze multiple
> > sessions in parallel, since luo_session_freeze() only acquires the
> > per-session mutex) avoids postponing this work to kexec shutdown and
> > reduces blackout time.
> >
> > Introduce LIVEUPDATE_SESSION_FREEZE on session file descriptors to free=
ze
> > a session early. The ioctl runs .freeze() across all preserved files in=
 the
> > session and serializes their metadata. Once frozen, no additional files=
 can
> > be added to the session, and subsequent freeze calls return -EBUSY. Fre=
eze
> > is only valid on outgoing sessions and returns -EINVAL on incoming ones=
.
> >
> > During kexec, sessions that were already frozen early are skipped, whil=
e
> > sessions that did not invoke this ioctl auto-freeze as before. If an
> > early-frozen session is released before kexec, its files are rolled bac=
k
> > via .unfreeze() before being unpreserved.
> >
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> > ---
> >  include/linux/liveupdate.h       |  3 +-
> >  include/uapi/linux/liveupdate.h  | 25 ++++++++++
> >  kernel/liveupdate/luo_file.c     | 73 +++++++++++++---------------
> >  kernel/liveupdate/luo_internal.h |  9 ++--
> >  kernel/liveupdate/luo_session.c  | 82 +++++++++++++++++++++++++-------
> >  mm/memfd_luo.c                   |  5 +-
> >  6 files changed, 134 insertions(+), 63 deletions(-)
> >
> > diff --git a/include/linux/liveupdate.h b/include/linux/liveupdate.h
> > index 6051abc0612c..851692571e13 100644
> > --- a/include/linux/liveupdate.h
> > +++ b/include/linux/liveupdate.h
> > @@ -59,7 +59,8 @@ struct liveupdate_file_op_args {
> >   *                compatible with the given file.
> >   * @preserve:     Required. Performs state-saving for the file.
> >   * @unpreserve:   Required. Cleans up any resources allocated by @pres=
erve.
> > - * @freeze:       Optional. Final actions just before kernel transitio=
n.
> > + * @freeze:       Optional. Prepares final state before kexec (via
> > + *                LIVEUPDATE_SESSION_FREEZE or during reboot).
> >   * @unfreeze:     Optional. Undo freeze operations.
> >   * @retrieve:     Required. Restores the file in the new kernel.
> >   * @can_finish:   Optional. Check if this FD can finish, i.e. all rest=
oration
> > diff --git a/include/uapi/linux/liveupdate.h b/include/uapi/linux/liveu=
pdate.h
> > index 4043d4038712..1644c502521e 100644
> > --- a/include/uapi/linux/liveupdate.h
> > +++ b/include/uapi/linux/liveupdate.h
> > @@ -60,6 +60,7 @@ enum {
> >       LIVEUPDATE_CMD_SESSION_RETRIEVE_FD =3D 0x41,
> >       LIVEUPDATE_CMD_SESSION_FINISH =3D 0x42,
> >       LIVEUPDATE_CMD_SESSION_GET_NAME =3D 0x43,
> > +     LIVEUPDATE_CMD_SESSION_FREEZE =3D 0x44,
> >  };
> >
> >  /**
> > @@ -236,4 +237,28 @@ struct liveupdate_session_get_name {
> >  #define LIVEUPDATE_SESSION_GET_NAME                                  \
> >       _IO(LIVEUPDATE_IOCTL_TYPE, LIVEUPDATE_CMD_SESSION_GET_NAME)
> >
> > +/**
> > + * struct liveupdate_session_freeze - ioctl(LIVEUPDATE_SESSION_FREEZE)
> > + * @size:     Input; sizeof(struct liveupdate_session_freeze)
> > + * @reserved: Input; Must be zero. Reserved for future use.
> > + *
> > + * Freezes the session early from userspace before the reboot kexec ph=
ase.
> > + *
> > + * When this ioctl is called, the kernel executes the .freeze() callba=
ck on all
> > + * preserved files in the session and serializes their metadata. Once =
frozen,
> > + * no further files can be preserved in the session.
> > + *
> > + * During the subsequent reboot kexec, this session is recognized as a=
lready
>
> Nit: kexec reboot

Ok

>
> > + * frozen and is skipped from the late auto freeze.
> > + *
> > + * Return: 0 on success, negative error code on failure.
> > + */
> > +struct liveupdate_session_freeze {
> > +     __u32           size;
> > +     __u32           reserved;
> > +};
> > +
> > +#define LIVEUPDATE_SESSION_FREEZE                                    \
> > +     _IO(LIVEUPDATE_IOCTL_TYPE, LIVEUPDATE_CMD_SESSION_FREEZE)
> > +
> >  #endif /* _UAPI_LIVEUPDATE_H */
> > diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.=
c
> > index a39992da504f..7f79890beb31 100644
> > --- a/kernel/liveupdate/luo_file.c
> > +++ b/kernel/liveupdate/luo_file.c
> > @@ -31,9 +31,9 @@
> >   *   - unpreserve(): Cleans up any resources allocated by .preserve(),=
 called
> >   *     if the preservation process is aborted before the reboot (i.e. =
session is
> >   *     closed).
> > - *   - freeze(): A final pre-reboot opportunity to prepare the state f=
or kexec.
> > - *     We are already in reboot syscall, and therefore userspace canno=
t mutate
> > - *     the file anymore.
> > + *   - freeze(): Prepares the final state for kexec. Invoked either ea=
rly via
>
> Nit: I'd drop "early", it seems relevant only to the current change, but
> will be more confusing than useful later.

Good point, will do.

>
> > + *     the LIVEUPDATE_SESSION_FREEZE ioctl once userspace is done modi=
fying
> > + *     the session's files, or during the reboot() syscall.
> >   *   - unfreeze(): Undoes the actions of .freeze(), called if the live=
 update
> >   *     is aborted after the freeze phase.
> >   *   - retrieve(): Reconstructs the file in the new kernel from the pr=
eserved
> > @@ -48,7 +48,8 @@
> >   *    handler, calls its .preserve() operation, and creates an interna=
l &struct
> >   *    luo_file to track the live state.
> >   *
> > - * 2. Freeze (Pre-Reboot): Just before the kexec, luo_file_freeze() is=
 called.
> > + * 2. Freeze (Pre-Reboot): Either explicitly via LIVEUPDATE_SESSION_FR=
EEZE or
> > + *    just before the kexec during reboot(), luo_file_freeze() is call=
ed.
> >   *    It iterates through all preserved files, calls their respective =
.freeze()
> >   *    operation, and serializes their final metadata (compatible strin=
g, token,
> >   *    and data handle) into a contiguous memory block for KHO.
> > @@ -74,15 +75,16 @@
> >   *
> >   * 1. Abort Before Reboot: If the userspace agent aborts the live upda=
te
> >   *    process before calling reboot (e.g., by closing the session file
> > - *    descriptor), the session's release handler calls
> > - *    luo_file_unpreserve_files(). This invokes the .unpreserve() call=
back on
> > - *    all preserved files, ensuring all allocated resources are cleane=
d up and
> > - *    returning the system to a clean state.
> > + *    descriptor), the session's release handler unfreezes the files i=
f the
> > + *    session was already frozen and calls luo_file_unpreserve_files()=
. This
> > + *    invokes the .unpreserve() callback on all preserved files, ensur=
ing all
> > + *    allocated resources are cleaned up and returning the system to a=
 clean
> > + *    state.
> >   *
> > - * 2. Freeze Failure: During the reboot() syscall, if any handler's .f=
reeze()
> > - *    op fails, the .unfreeze() op is invoked on all previously *succe=
ssful*
> > - *    freezes to roll back their state. The reboot() syscall then retu=
rns an
> > - *    error to userspace, canceling the live update.
> > + * 2. Freeze Failure: During LIVEUPDATE_SESSION_FREEZE or the reboot()=
 syscall,
> > + *    if any handler's .freeze() op fails, the .unfreeze() op is invok=
ed on all
> > + *    previously *successful* freezes to roll back their state, and an=
 error is
> > + *    returned to userspace.
>
> I think we still want to say that freeze failure at reboot cancels live
> update.

OK

>
> >   *
> >   * 3. Finish Failure: In the new kernel, if a handler's .finish() op f=
ails,
> >   *    the luo_file_finish() operation is aborted. LUO retains ownershi=
p of
> > @@ -440,12 +442,11 @@ static void __luo_file_unfreeze(struct luo_file_s=
et *file_set,
> >
> >  /**
> >   * luo_file_freeze - Freezes all preserved files and serializes their =
metadata.
> > - * @file_set:     The file_set whose files are to be frozen.
> > - * @file_set_ser: Where to put the serialized file_set.
> > + * @file_set: The file_set whose files are to be frozen.
> >   *
> > - * This function is called from the reboot() syscall path, just before=
 the
> > - * kernel transitions to the new image via kexec. Its purpose is to pe=
rform the
> > - * final preparation and serialization of all preserved files in the f=
ile_set.
> > + * This function is called from LIVEUPDATE_SESSION_FREEZE or from the =
reboot()
> > + * syscall path. Its purpose is to perform the preparation and seriali=
zation of
>
> Nit:                                          ^ final?

OK

>
> > + * all preserved files in the file_set.
> >   *
> >   * It iterates through each preserved file in FIFO order (the order of
> >   * preservation) and performs two main actions:
> > @@ -457,22 +458,20 @@ static void __luo_file_unfreeze(struct luo_file_s=
et *file_set,
> >   *
> >   * 2. Serializes Metadata: After a successful freeze, it copies the fi=
nal file
> >   *    metadata=E2=80=94the handler's compatible string, the user token=
, and the final
> > - *    private data handle=E2=80=94into the pre-allocated contiguous me=
mory buffer
> > - *    (file_set->files) that will be handed over to the next kernel vi=
a KHO.
> > + *    private data handle=E2=80=94into the pre-allocated serialization=
 blocks
> > + *    (file_set->block_set) that will be handed over to the next kerne=
l via KHO.
> >   *
> >   * Error Handling (Rollback):
> >   * This function is atomic. If any handler's .freeze() operation fails=
, the
> > - * entire live update is aborted. The __luo_file_unfreeze() helper is
> > - * immediately called to invoke the .unfreeze() op on all files that w=
ere
> > - * successfully frozen before the point of failure, rolling them back =
to a
> > - * running state. The function then returns an error, causing the rebo=
ot()
> > - * syscall to fail.
> > + * __luo_file_unfreeze() helper is immediately called to invoke the .u=
nfreeze()
> > + * op on all files that were successfully frozen before the point of f=
ailure,
> > + * rolling them back to an unfrozen state, and an error is returned to=
 the
> > + * caller.
>
> Don't you want to say that reboot is canceled here too?

Sure

>
> >   *
> > - * Context: Called only from the liveupdate_reboot() path.
> > + * Context: Called from LIVEUPDATE_SESSION_FREEZE or the liveupdate_re=
boot() path.
> >   * Return: 0 on success, or a negative errno on failure.
> >   */
> > -int luo_file_freeze(struct luo_file_set *file_set,
> > -                 struct luo_file_set_ser *file_set_ser)
> > +int luo_file_freeze(struct luo_file_set *file_set)
> >  {
> >       struct luo_file *luo_file;
> >       struct kho_block_set_it it;
> > @@ -506,9 +505,6 @@ int luo_file_freeze(struct luo_file_set *file_set,
> >               file_ser->token =3D luo_file->token;
> >       }
> >
> > -     file_set_ser->count =3D file_set->count;
> > -     file_set_ser->files =3D kho_block_set_head_pa(&file_set->block_se=
t);
> > -
> >       return 0;
> >
> >  err_unfreeze:
> > @@ -519,28 +515,25 @@ int luo_file_freeze(struct luo_file_set *file_set=
,
> >
> >  /**
> >   * luo_file_unfreeze - Unfreezes all files in a file_set and clear ser=
ialization
> > - * @file_set:     The file_set whose files are to be unfrozen.
> > - * @file_set_ser: Serialized file_set.
> > + * @file_set: The file_set whose files are to be unfrozen.
> >   *
> >   * This function rolls back the state of all files in a file_set after=
 the
> > - * freeze phase has begun but must be aborted. It is the counterpart t=
o
> > - * luo_file_freeze().
> > + * freeze phase has begun. It is the counterpart to luo_file_freeze().
> >   *
> >   * It invokes the __luo_file_unfreeze() helper with a NULL argument, w=
hich
> > - * signals the helper to iterate through all files in the file_set and=
 call
> > - * their respective .unfreeze() handler callbacks.
> > + * signals the helper to iterate through all files in the file_set, ca=
ll their
> > + * respective .unfreeze() handler callbacks, and clear the serialized =
blocks.
> >   *
> >   * Context: This is called when the live update is aborted during
> > - *          the reboot() syscall, after luo_file_freeze() has been cal=
led.
> > + *          the reboot() syscall, after luo_file_freeze() has been cal=
led,
> > + *          or when an early-frozen session is released before kexec.
> >   */
> > -void luo_file_unfreeze(struct luo_file_set *file_set,
> > -                    struct luo_file_set_ser *file_set_ser)
> > +void luo_file_unfreeze(struct luo_file_set *file_set)
>
> I went several time back and forth trying to understand why we remove
> *file_set_ser here.
>
> Maybe add a preparation patch that does the renames and moves file_set_se=
r
> handling?

Yes, this is a good suggestion. I will add another patch  to rename,
and change the argument.

>
> >  {
> >       if (!file_set->count)
> >               return;
> >
> >       __luo_file_unfreeze(file_set, NULL);
> > -     memset(file_set_ser, 0, sizeof(*file_set_ser));
> >  }
> >
> >  /**
> > diff --git a/kernel/liveupdate/luo_internal.h b/kernel/liveupdate/luo_i=
nternal.h
> > index dac6644bfb18..b3fc3dcf5f36 100644
> > --- a/kernel/liveupdate/luo_internal.h
> > +++ b/kernel/liveupdate/luo_internal.h
> > @@ -64,6 +64,8 @@ struct luo_file_set {
> >   *              previous kernel) sessions.
> >   * @retrieved:  A boolean flag indicating whether this session has bee=
n
> >   *              retrieved by a consumer in the new kernel.
> > + * @frozen:     A boolean flag indicating whether this session has bee=
n
> > + *              frozen early from userspace.
>
> s/early/explicitly

OK

>
> >   * @file_set:   A set of files that belong to this session.
> >   * @mutex:      protects fields in the luo_session.
> >   */
> > @@ -71,6 +73,7 @@ struct luo_session {
> >       char name[LIVEUPDATE_SESSION_NAME_LENGTH];
> >       struct list_head list;
> >       bool retrieved;
> > +     bool frozen;
> >       struct luo_file_set file_set;
> >       struct mutex mutex;
> >  };
>
> --
> Sincerely yours,
> Mike.
