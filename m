Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793644957;
	b=FDNI07YNO5jj9ZetfynVoi7qDnlvyMG89GmSinoANXjIWKVCEsf/VfZAWRnlbHqINWXf
	 yl55g6vMIEFGY4Hw9IDwrcJG33wcflBqaVzCZzo6b4eAW/EL1mJNL1BBIXRq2AkDQEsGE
	 ubtmPkCoePDGexll3ZFDUbjyEQIE5WQTJ1sz+Om9G3vj45Wtr1IRrMi95Fpwq6JIjBlRS
	 R+hsJw6pe5jELOH/MzWHWyZs5Fi5ZJW/J8DgIqs0NKD541e3Pr2mofmS1JpzUUMS5ybek
	 3NvMJe62ZoJ/1GvvWr/uBJtX/Wrf7Y3xJx169otKoSC5F9vdQK+xAvyGcnkLPfEwqtg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793644957;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=OffO7dkB7rQHK4T1MzrGHUKDeBIQijFGky1S3tl0aq8=;
	b=LDQhjOZ/7xuHWPDJDU0Lb0SFh8pGElX1GWyg+O6bBQloZdvMOrxeTbY0cs2WZznksnGn
	 m2qTljgovQv09viBv8g/wmk1tkCEFab7jo9l+bXhXgibeBN4v0FmAxeDd4GV0WNdIm57t
	 VerUy/H92ykQaQiEz/Rn/IbJ+2b8XLLcO3jpAon4Adoo9nhmq+Fs480z6/bQ1ru8dsY8B
	 vFKlLtF+kVqSZ4JEboJiC5mxxf+i/ezi9o+3TCFeobXnsTQCe/vTqqoOWP1rhpHpGFAou
	 Z7b6jXuiMBaLZFBfX8ffJnVApkSCM6tMg2tEdMdmP9NmCyljTPrvOJ34VvHuQ+rrovw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OCI6Bfjk;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=fx6bvYg0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B061E606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 18:42:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B061E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OCI6Bfjk;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=fx6bvYg0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793644955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OffO7dkB7rQHK4T1MzrGHUKDeBIQijFGky1S3tl0aq8=;
	b=OCI6Bfjk2arUFyHFITtJqRfmUgA2eODr/3r+Wk9OCSIwTkAh93pkkqOHA9sy+onbPYECfB
	J3gBbTiw826grbbZ9T4kwBZMDjNcGIHf/o6DfDogzKmp3FsdAXjzaVaA8HhWlpGG4MJXzY
	qsSeR5ZhmkOtHQkuTrs82t47RW/jLFE=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-FYMMoCkWOKOipQ-VVatMeg-1; Mon, 02 Nov 2026 13:42:32 -0500
X-MC-Unique: FYMMoCkWOKOipQ-VVatMeg-1
X-Mimecast-MFC-AGG-ID: FYMMoCkWOKOipQ-VVatMeg_1793644951
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-3ab353585f1so12809451fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 10:42:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793644951; cv=none;
        d=google.com; s=arc-20260327;
        b=KOSjr66D8guwW3w2soODCppRWxy0q/O1qbZfZgznNiQ1fbB8emouJTmFh/2CIRQ01X
         rSxP7CHGT1xcZSkPhyeaN0EKaoHOHOIRuSWWBlN1sZks88rRha3Ho8vs/35fPlMzBkjK
         ipI9AbRA6U8zjmylqrgYFOYzyUNod94BlO2xQ7TXhtB+7boNjAYcYqdKZ+gJzim04WR8
         JRykppJLnn/jPGz1VcJjJnX8luVYktByPK00VbVERYraq7TgLXcT6VQvmN/AUaXbDLzQ
         tOuUlUXiHZzLkfgQwztMZ74hNb1Kv0Ta26PI7KoUTo8T50fiyPEWTmM+MOjTeQjighrW
         CK4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OffO7dkB7rQHK4T1MzrGHUKDeBIQijFGky1S3tl0aq8=;
        fh=tGVEZyN36XwOHjFH1Jonhx842mYNOCOw8lHQLnTVMXs=;
        b=KsGrn7Nc+Gc2QkOUTnmPjbOJvg6cg6aqNmGzJZOHywh6U4toCG8yPQdNfMDGF9r0tO
         nE0WOs9elPi6yxfcn292xYtwunjp0ZNH5bXAxQ7nPtLkx0f6IDMn+u/Rxam4QFpyeTWD
         R/tSGd2u772e1TObJgswZTY+K0PW9V7OoXQ5Zlv4BeRY03PktJs3sX8tL7ZedAgA5Vf7
         Ius8eXys6ru4YBKQnnizzLAXVOn9FX4E3ImZ3GBAEf6zlMv0j0uk4Di1ELd9Z29kaDE7
         Itz5hl8AMyclrwIgLcnp5R/ZhE0C2XR70aSmmk3sfPpN7iPAUjrbZBVewZct4Sb5SGr0
         l86g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793644951; x=1794249751; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OffO7dkB7rQHK4T1MzrGHUKDeBIQijFGky1S3tl0aq8=;
        b=fx6bvYg0A/B7hH/ti2sCNcUcCCs97jOCe7Sb4meZm9HIwr1VP8VKvQCRD4n1Egl/uj
         HL2JG+PD5ucPCJjtDjaFAJQuxvxFKoiykudSRiOf6/N1Zjy+L/ksd5jAkKCu58NoARNd
         41G95a0PiX9jcuwD6GCMCNax/RIMaJEiWeO9AdIrWGvXgle1EHULNgYY++Ia/qjMNI71
         SBFteaXPNgVmz+4IFMiyGtYqqztA3FiShgch/ICrEfXDInpRvWEJNHPFZAAtbmQ9moSh
         o0nceRNEVr458LcoVQi1I8V5aO5mqD2rjyd4T5BqLtatE8QM51hFm8oMdSibFLwRSRxx
         +zTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793644951; x=1794249751;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OffO7dkB7rQHK4T1MzrGHUKDeBIQijFGky1S3tl0aq8=;
        b=deR6nkfNk7j6trMqFoeS1j3/n0RCEdaGApbP7L/njTz9ykFUSCrnLt7gLotIWliPFk
         slukE2EI5Cx8WJCYUFqQ8nSZ0Ao8n0Lr4cLefuqK6G090M7Ebs41S71dYbhkFlzuJlXJ
         lzXLzjanoyHQdXnx/icMewOwY3IQ4sq4AUuG1MXcSfXX5cDdFF5tBOoEDKFKxW6ciVVv
         ZousJOh5nDtfOODb4YDwXMCtuuuuEjfZCHu6mPWk7It1dZO5JRlsJzPUADPFBI3Ri2Nv
         +v22Jo+EPd87b5FYwdQGtPXJffuXIWTuz9cfjQ8Vn/ycHHiRfMAQG4U/4xLtZ5VwsX58
         o+QA==
X-Forwarded-Encrypted: i=1; AKwUvByl8pmyPcryec3CM7igw7L54oXTq3FrDFtSUZT1Fhnkl5Ij0SBJpO+/Z1W01Eaz8wjzB8VDZpC3QBECJ1o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lwtqX6UtkiS+5tequI/VlaIjW7F5TrODb5T/GPOvz3QAvN08u
	Zr9+W1B4SeV396Q5r6Z8ziZlNMR7aAhudP6FfYSQ+URyKlIbFOQnxSp0m8nFdXDIvgngh7XRz5W
	+XQe0X1tYr0qZ3XjBKrgRCwicyOiiSSsJdIov0fQAD4LEmuq/f5c+Ctg4W3Ce5SZ338Mv1+52Fv
	iV8gCeQik+1xwpgkRapNFu2SnTXLtIfk0f+1xpMEy1SjNw5O1GEkc=
X-Gm-Gg: AYBFou032iCRNSfobW5S9M2rDc0efFvN7aHZjpoPb/E2RgZXwSth9skVvKEah25Yfnq
	/ttZDDUXm5YJeikBbHY4AYbSOBw3FMlDDYIuEcHgKYNnO7cZebEfPKruGhTGnP2CBLhuj5X1GDT
	WWEt3yFWe52MvRRk0mO2fsGoWl5ZCxqUlloEYGBxNSX86XTy0n9Rt/ylHh
X-Received: by 2002:a05:651c:31cb:b0:3ab:690f:829f with SMTP id 38308e7fff4ca-3acb7a634ebmr23219821fa.15.1793644950918;
        Mon, 02 Nov 2026 10:42:30 -0800 (PST)
X-Received: by 2002:a05:651c:31cb:b0:3ab:690f:829f with SMTP id
 38308e7fff4ca-3acb7a634ebmr23219771fa.15.1793644950503; Mon, 02 Nov 2026
 10:42:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261004051912.1045-1-yogeshgaur.83@gmail.com/> <20261007113155.1982-1-yogeshgaur.83@gmail.com>
In-Reply-To: <20261007113155.1982-1-yogeshgaur.83@gmail.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Mon, 2 Nov 2026 13:42:18 -0500
X-Gm-Features: AclHuK8rBGB5wbaRzCDWzUOnSPFNBECgyTWFrxDUcXK4DB8L9ZuxuP_bS5Bz1no
Message-ID: <CAK-6q+gXQgw8s4PAuR-FR=TscwC-OMwL+XVaeiWBVPgk3JV51Q@mail.gmail.com>
Subject: Re: [PATCH v3] dlm: don't publish a lkb in ls_lkbxa before it has an rsb
To: Yogesh Gaur <yogeshgaur.83@gmail.com>
Cc: David Teigland <teigland@redhat.com>, gfs2@lists.linux.dev, linux-kernel@vger.kernel.org, 
	syzbot+da6dc573ce5e6624f505@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Oct 7, 2026 at 7:32=E2=80=AFAM Yogesh Gaur <yogeshgaur.83@gmail.com=
> wrote:
>
> _create_lkb() puts a new lkb into ls_lkbxa straight away, which is also
> what assigns its lkb_id, but the lkb only gets an rsb later, when
> request_lock(), receive_request(), dlm_recover_master_copy() or
> dlm_debug_add_lkb() call attach_lkb(). In between, find_lkb() hands the
> lkb out with lkb_resource still NULL, and its callers go straight for
> the rsb:
>
>         r =3D lkb->lkb_resource;
>
>         hold_rsb(r);
>         lock_rsb(r);
>
> For the userspace API the lkid is simply whatever was written to the
> misc device, so a lkid can be aimed at a lkb that another thread is
> still building, and hold_rsb() reads res_flags off NULL:
>
>   BUG: KASAN: null-ptr-deref in rsb_flag fs/dlm/dlm_internal.h:386 [inlin=
e]
>   BUG: KASAN: null-ptr-deref in hold_rsb fs/dlm/lock.c:334 [inline]
>   BUG: KASAN: null-ptr-deref in unlock_lock fs/dlm/lock.c:3333 [inline]
>   BUG: KASAN: null-ptr-deref in dlm_user_unlock+0x2ab/0x690 fs/dlm/lock.c=
:5956
>   Read of size 8 at addr 0000000000000050 by task syz.3.570/7893
>    rsb_flag fs/dlm/dlm_internal.h:386 [inline]
>    hold_rsb fs/dlm/lock.c:334 [inline]
>    unlock_lock fs/dlm/lock.c:3333 [inline]
>    dlm_user_unlock+0x2ab/0x690 fs/dlm/lock.c:5956
>    device_user_unlock+0x1ca/0x260 fs/dlm/user.c:321
>
> Make it impossible for ls_lkbxa to hold a lkb without an rsb, rather
> than filtering such lkbs in find_lkb() or reserving a NULL entry that
> every walker would have to know about.  create_lkb() no longer touches
> ls_lkbxa; attach_lkb() sets lkb_resource and only then allocates the
> lkb_id and stores the lkb, so the lkb becomes visible already attached.
> dlm_debug_add_lkb() presets the id it wants and attach_lkb() allocates
> exactly that one.
>
> attach_lkb() can now fail, and each of its four callers releases the
> lkb on the error path it already has for a failure just before the
> attach.  On failure attach_lkb() also clears lkb_id, so that
> __put_lkb() cannot erase another lkb's entry when a requested id was
> busy.  All four callers hold the rsb lock, and nothing takes an rsb
> lock under ls_lkbxa_lock, so taking it there adds no new lock ordering.
>
> As a side effect an lkb has no lkb_id until it is attached, so
> trace_dlm_lock_start() and the validate_lock_args() and
> receive_rcom_lock_args() error messages report 0 for a new lock.
>
> The unchecked r =3D lkb->lkb_resource goes back to the original DLM
> import, but an untrusted lkid only became possible once the userspace
> device interface was added, so that is the tag below.
>
> Fixes: 597d0cae0f99 ("[DLM] dlm: user locks")
> Reported-by: syzbot+da6dc573ce5e6624f505@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3Dda6dc573ce5e6624f505
> Suggested-by: Alexander Aring <aahringo@redhat.com>
> Assisted-by: LLM
> Signed-off-by: Yogesh Gaur <yogeshgaur.83@gmail.com>
> ---
> v3: Incorporated Alexander Aring's review, don't reserve a NULL
>     entry in ls_lkbxa either.  The lkb_id is now allocated in
>     attach_lkb(), after lkb_resource is set, so ls_lkbxa only ever
>     holds attached lkbs.  attach_lkb() can fail; all four callers
>     handle it.  _create_lkb() folded into create_lkb().
> v2: https://lore.kernel.org/all/20261004051912.1045-1-yogeshgaur.83@gmail=
.com/
> v1: https://lore.kernel.org/all/20260909112108.2281-1-yogeshgaur.83@gmail=
.com/
>
> Not runtime-tested. Built with W=3D1.

I tried this, and it seems to run without problems. Although there are
questionable things like [0] as now create_lkb() does not add the lkb
to the xarray and [0] will call xa_erase() on a lkb that has not been
added if set_lock_args() fails. It probably will not harm as lkb_id 0
is invalid and never be part of the lkb xarray, so this xa_erase()
will do nothing.

I am willing to ack this patch because I think the cases where an lkb
has no rsb set have already affected us several times in the past and
it seems to be going in the right direction. We will just see what
happens.

Acked-by: Alexander Aring <aahringo@redhat.com>

- Alex

[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/fs/dlm/lock.c?h=3Dv7.4-rc1#n3412

