Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9E647252E
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 18:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790879601; cv=pass; b=ee+KBIq1B4MTQRZjqMYCWo2TiED4c875Aekd4/zKIIe2zVGPdvxUrJLo7yGINLT+2MMmyR44YIg//5aIGbN6JhuC+8rjWimaOaw0LOYE1PrSLXk4xkrl02KX6oK91dEfF83R2tQdJiBfoWhVJxhEGyHwmpPCrY5NNB74/D0uCX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790879601; c=relaxed/simple;
	bh=WAFsqqAFghDoay9hVBuvxqFPNBzWjsWrsZZqn50QG50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fa42WuN5sWOf9/5j8iup6XBAntTM2dPaepsnWWm0JwVnffwTYgcFIZJpeSZv+wv6i5j5+ObvOhnrsp+QQ8MHL3gw/mi6gkofqrd4FZ/yvmRfAvy3hCccdeXjzz00welITO9KqE1m/S3Ggwdb90SiiFOorkTQWI+T9jiFJzcc3xw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AhQQzfUH; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=oHZFbnjr; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AhQQzfUH";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="oHZFbnjr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790879599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dsbX+3Qe5DdiwBq4QKL6zwCanz3fxbDUJiCcszo+6nQ=;
	b=AhQQzfUHQ7fNhVPFTtXnq6bQROffDdau9YQLH+y+yNkCeF9j2iVt1rVh4DIaQdO0ih/ybe
	aVoRcLY1uyG214YO2LmbM5z/z9egewa+mykMf4h+gGEB7NedRfGqnsNVwMU1PN24+eojNY
	BN4m4aCqshG2EhRBfC2y3rOPgN0iKaQ=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-170-13LQfosFNt23JW9zUguMlg-1; Thu, 01 Oct 2026 14:33:17 -0400
X-MC-Unique: 13LQfosFNt23JW9zUguMlg-1
X-Mimecast-MFC-AGG-ID: 13LQfosFNt23JW9zUguMlg_1790879596
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-5ba44170027so609508e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 11:33:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790879596; cv=none;
        d=google.com; s=arc-20260327;
        b=iMPc6fDbPYARPARlG+hS1TB9amPeVR5mB+jiHW/ArEkBUDN+dWmIJwg8pb/Z116e87
         xu0SLPu5kUOI8QO+nWkquHXWwrvkAw7RdBPp5Ou1Orqgum2QxK+V5gxFHTBPLo0dwkdr
         +nLz4Dgfxv9icVSHFyHAbLdQf1vOIQaMW0X5NRjaFdy9678LoSasKjeqUSuVTVLjNtJl
         b38y19IRDhvnm47jD9IsVMYquPB/Fi8LxJQVabNkVPtqQdp7M9xWoPiwNkIA1LlsNGPF
         K5i5jcqisf5PoHXCInYamHiiPPIsvNNkMW7FZCPiDDv+Om3ZrF4KNNVCKm+0lBnBgRrS
         N24w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dsbX+3Qe5DdiwBq4QKL6zwCanz3fxbDUJiCcszo+6nQ=;
        fh=msjV+Yi9jsNNXbNGrm6+Pgo06Dmxs6myLWXtmijvz5Q=;
        b=AhZXxvSM4XZejwZA2BN6EDD5RW6tFzN72e+ZjXMKYJ4Oynnyf/B9mmdBlYhW3m7zya
         8PL3h409MGKEaOYYOChApu6++rs+9ZqTQSUDdqZY666XWfmhp6E4+M6eRDOJ54QG2Sn8
         JLGWgCm3Odgp78sEAuY5WwEarHY140uEeC3vhM84XbDPfwr+rAlh+KAs3z4QkoKAkin+
         eb9VXamSw89eDX/WOpgW5wCnbw3m5HF/6wwuEQ2cTXP4rH53yds6LRt5RaWnBH9Bml7N
         GpAA9yimxz4n2InpbF5HSwmz0PHCSMLaa4pchzAKJmBAtbcVR82ejRNC6AHozwI5QRYA
         DHUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790879596; x=1791484396; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dsbX+3Qe5DdiwBq4QKL6zwCanz3fxbDUJiCcszo+6nQ=;
        b=oHZFbnjr54H2sIt8eHGX3btEVueJnLRXPq+qQH1p4Mas/4lW9yS4zIekaCCAVQhiYF
         CurnfX6RoPXnTudNnXcMSJOaFyTUWyxN75B+YzehKuNsVfZAV13hMIVSpZn6IMJH6Ana
         z0pRNrAmoY7WRx6M8lJi3616gI5oJ7pOx+baOeG/NpE4AIItrq7ljy5G5sM4PcKTtNks
         5XNbyFejTEKRpqTF62bkwpJm/DLIqZKilgV6m32wEhayOt7M1ZZnOYGbol+zpGurJPVs
         WyS0brKtImVpcPrT2DGs8aviXv/UmDcv9T88DsBbnYGqiZ68KPNZuSVAoUcigfN0YWcE
         QSNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790879596; x=1791484396;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dsbX+3Qe5DdiwBq4QKL6zwCanz3fxbDUJiCcszo+6nQ=;
        b=IYdzDxBoPu98Rrn7erkC571Pg7y7VOiyObWrj6/hEy48nj5DjGUv9AnAX3GOfNrtZd
         XqE2F4CQ7GWNj4EGFUStwuBfWA3u8gpijEt/qX7PdtNXZZpvC6eYKxjg762HqVoXmo0l
         ZwzDtAUYj4Ms4dXxTE8PnDQCx2YA7MYseh7DGqlYIhMD5fZVgl7pFRLrx94/UPOrTYQo
         B6AKLFdCUaytncXjiKEleDY9Y3vakaWuqUbuIRRUgdieF0YL8a6SMCGYjSSm8h1eMCYr
         Hk1+ue+ZvvWb2tOZJ2MjYxoBu8Yh6CEKfa3Dxgt9nbH5GEYE4CdZP6OsCgfbyb79tW/L
         Pynw==
X-Forwarded-Encrypted: i=1; AKwUvBwN86Zqpf0zaVlIIPcNJHujFwIPehC7bXIDvgZqpVNGL6C6nj1D3y6NTfs7FBNL+M2dzbCNk3/XFz2iK5E=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6vaNYBvhrs4cnh5dyIFQ0yWgPdGakK5Gt9/jRu/FkgeAAbViv
	T9CbdvfjYzg1saxGYq8cZ4p2iyB+lDQrqqDUlE6e2a2BPOXzGazCNrbN2H3FOHwgrswQTX5Drhk
	hs/Y40EK+ZlJbTMoMF/Vsz9xSg3AACqVGsnTuHDaHyHX6JG0F2HigZuZ7oe895dWZxEYnv2bp9y
	/Y3lNQzPZaL49+J354VjJVvHNtxLSXlrOMBOKKti1cfQB/X1BL8I0=
X-Gm-Gg: AYBFou0FkoHza1z4aXXBDUeKKvC7OepNQKs6dez6yBmEiLKRrjn9qWM0N7byvDZW1QV
	HVDt2k88OCGAm2MnfkQO6Ix1/58hn/GjWxn9zZBXYVbSqPWhc2bOi9Z7F3pwVZxOhGy55arYDSA
	CiMvwlLzTlcsuH6BEQ3aNNpc+B6z9QQgCX2hGCFmvoF4he6/Fr8cBI4/bb
X-Received: by 2002:a05:6512:208c:b0:5ba:3c60:b875 with SMTP id 2adb3069b0e04-5bb9bc44e4amr11919e87.43.1790879596133;
        Thu, 01 Oct 2026 11:33:16 -0700 (PDT)
X-Received: by 2002:a05:6512:208c:b0:5ba:3c60:b875 with SMTP id
 2adb3069b0e04-5bb9bc44e4amr11906e87.43.1790879595674; Thu, 01 Oct 2026
 11:33:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909112108.2281-1-yogeshgaur.83@gmail.com>
In-Reply-To: <20260909112108.2281-1-yogeshgaur.83@gmail.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Thu, 1 Oct 2026 14:33:04 -0400
X-Gm-Features: AclHuK_IpbC-cQT4SPT04vLYo0uLsCMO-LZnpEw9kqK-f0pIB2awo-M9mOqBIRY
Message-ID: <CAK-6q+jbm3ctGXtJt5YRJjOdtrVTH5gxZ4pXtD+O9fp65AXu8A@mail.gmail.com>
Subject: Re: [PATCH] dlm: don't return a lkb that has no rsb from find_lkb()
To: Yogesh Gaur <yogeshgaur.83@gmail.com>
Cc: David Teigland <teigland@redhat.com>, gfs2@lists.linux.dev, linux-kernel@vger.kernel.org, 
	syzbot+da6dc573ce5e6624f505@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Sep 9, 2026 at 7:21=E2=80=AFAM Yogesh Gaur <yogeshgaur.83@gmail.com=
> wrote:
>
> _create_lkb() publishes a new lkb in ls_lkbxa, which is what assigns its
> lkb_id:
>
>         rv =3D xa_alloc(&ls->ls_lkbxa, &lkb->lkb_id, lkb, limit, GFP_ATOM=
IC);
>
> but the lkb only gets an rsb later, once request_lock() has resolved the
> resource name and calls attach_lkb():
>
>         static void attach_lkb(struct dlm_rsb *r, struct dlm_lkb *lkb)
>         {
>                 hold_rsb(r);
>                 lkb->lkb_resource =3D r;
>         }
>
> So between those two points the lkb is fully addressable by its lkb_id
> while lkb_resource is still NULL. find_lkb() will hand it out, and its
> callers all go straight for the rsb without checking:
>
>         r =3D lkb->lkb_resource;
>
>         hold_rsb(r);
>         lock_rsb(r);
>
> For the userspace API the lkid is simply whatever was written to the
> misc device, so a lkid can be aimed at a lkb that is still being built
> by another thread. hold_rsb() then reads res_flags off NULL:
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
>    device_write+0x905/0xed0 fs/dlm/user.c:590
>
> Reject an unattached lkb in find_lkb() rather than in each caller. Every
> find_lkb() caller dereferences lkb->lkb_resource -- convert_lock(),
> unlock_lock() and cancel_lock() through the r =3D lkb->lkb_resource above=
,
> dlm_recover_process_copy() the same way, add_to_waiters() via
> lkb->lkb_resource->res_ls -- so none of them wants a half-built lkb, and
> a lkb without an rsb is not a lock anyone outside can name yet. Callers
> already handle find_lkb() failing.
>
> Testing lkb_resource under ls_lkbxa_lock next to the existing kref_read()
> check is enough. The value is not stable under that lock, as attach_lkb()
> does not take it, but it does not need to be: once a non-NULL rsb has
> been observed it stays attached for the life of the reference taken here,
> because detach_lkb() only runs from __put_lkb() on the last reference.
> Observing NULL while attach_lkb() races is the case being rejected, and
> the thread still inside request_lock() has not returned the lkid to
> anyone at that point.
>
> This is the null-ptr-deref only. The refcount warning syzbot reports in
> dlm_user_request() itself, where hold_lkb() runs on a lkb whose count
> already reached zero, is a separate race on an lkb that is past
> attach_lkb() and is not addressed here.
>
> The unchecked r =3D lkb->lkb_resource goes back to the original DLM
> import, but an untrusted lkid only became possible once the userspace
> device interface was added, so that is the tag below.

I agree that the one design flaws of DLM is actually to have lkbs
around that does not have rsbs (lkb->lkb_resource) set, which makes
troubel all over the place if somebody forgets about this case...

It should not be possible to have lkbs around, e.g., in xarray of
"ls->ls_lkbxa" and the rsb is not set, however this is not what your
patch is doing. Your patch is simply to not return a lkb when there is
no lkb->lkb_resource set. It seems we can run into this case as the
above KASAN syzbot shows, although I am worried about cases where we
know it is not set and we handle it.
I would more suggest changing the patch so that it's impossible to
have lkbs around without an rsb being set.

- Alex

