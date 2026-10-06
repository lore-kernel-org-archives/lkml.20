Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0193BB9EB
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 20:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791319343; cv=pass; b=VRxIUOXvt38Pqm2hwqpe6gmPt0s2S3h0jzPKcTbhvIWuyokIiP4MwVF7A7EeLZwnw+ZxUXwTNbkLtpNPLkwMEdm1LaUVbVBmZjGRIj0givKmwNemFnb+kf4PBffbtGOGQUU2Ud4jbNRV6J9iyyvH69zVg/d6rJrVXIS6vsym2eo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791319343; c=relaxed/simple;
	bh=+nORsYlS7Yv+mwbjfI/EW2E88iULyaaBS/+y0CFsdOk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u+cCbrHwkrZV5U3/FWhSd56y3/KG2vTvAwJYCq2hAXWIlj4paHHuBmVWpBkd23E2eq8aBrH7Y8cproIg1QqtbUXJVHGFilzmvGhQeNvqyG3ojZqVkGbKIS1a8V/yyC7cT/vtQOcU1S4F/wzyW5j9y2O1lmHIsJiKd1Y6HUA9icE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fT0XkXaY; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ke+xGiNG; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fT0XkXaY";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ke+xGiNG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791319339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PFT7m0xKcvqNQAKmV39ppldm2c+AaUkF1Lbywy1q/kA=;
	b=fT0XkXaY3VyvFs5B3txZ89Q/k+/zMPdcTuA1X4CUiw1nA7HvwaGyZmOgPI0KSRN+AqG5t8
	Z4hwnSiy9IBDzNsNxhTIh/AIuDGX362Dk8vXPvx/TCh+xePpuhrtg83aKO4fR/1C1LJC3Y
	sB+4PWMeoQiJJqy4Ial8oBumSFy8Bxo=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-540-f23HbznoNia5GT3JqUQEuQ-1; Tue, 06 Oct 2026 16:42:18 -0400
X-MC-Unique: f23HbznoNia5GT3JqUQEuQ-1
X-Mimecast-MFC-AGG-ID: f23HbznoNia5GT3JqUQEuQ_1791319337
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-3a87d45b84dso18674121fa.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 13:42:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791319337; cv=none;
        d=google.com; s=arc-20260327;
        b=fdOUUEHXI+VzZOH36J0DYrp18D6lpIUrmkmu90En7T8zsufj9qqbC01RjAWXjz1b1H
         mVgBWVh/Y0QLeV0c43hiWINNqZFfnYQqtEjEqw458UBTiBqNFaSIss0p99TkaQ6dciub
         vBqa0PXDFKMKwsAjxWBnbD/3VSi3Bcmj00vgUwwS83wa6dAhJ5CFMvdfJ7HpCKscDTud
         8vNRAr0Dviiz7hMBz3nNWbCi06z9xzFZT2mgQTRAZDuPV0Pugu8uvBanun5aRtIzaWvd
         RJNtc+o1+O6rdbcXxnVD4Z0bloIt9c9kSAB8p/dYRR1IBlQSRU8USq9jrEXN1Ui/k59F
         M23w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PFT7m0xKcvqNQAKmV39ppldm2c+AaUkF1Lbywy1q/kA=;
        fh=GjyAE2WOJE+6Ew7WPp5H3OpJQOjLWbxHrHMi/OYAJO0=;
        b=dkta0EEusxTtGUZDSbhsveCz2FgkXJR4L2CTw4lCcQo4FFgqTiPOMRBJ1OTT56RxG5
         RP3Kg7DR/6lvmugMzyPR5IRhiEmDo2Ym48SXwkQ+HIR8XrrrVZ3sPMQnGw7dvwoM0KUl
         AhUxgAJChR17PJbJOjCbICNbt0VCCIt8NnfIFedxmiTX/sFbB1NmZmv6HmA4Y51a+/vP
         sgrDO9Xls9ekA3JjJob6pU8KMv3fPz4TQhgUPTAgjUBcU/9Pw+YmAj/H+VLPTYpinhfO
         A27LFLPIYsf2AqWWVyhKhdRa3gbI+cDyj8oF13qIjV7YbUe+2Sy8nD/e7eyyAZxQPa0G
         Sm8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791319337; x=1791924137; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PFT7m0xKcvqNQAKmV39ppldm2c+AaUkF1Lbywy1q/kA=;
        b=ke+xGiNG9plodcRLWbFCuiib1tMCG4jqNZKKNZge4RbOYP7NPTe6N5wp9whH6Ijhn4
         lEV7hktfeT7IrcvhHCZIf6T6LP+vUBSkCEcKt4ty6pRsmbjADBWVnHLKneMAlQGPKrsE
         D2zQOIeCw5zEsPjUed0al0ZfyR51DT6H6/THoSugJmKGSmxQtnmk7giQF47UUP3IxjO0
         sPiNhsc5eOstJjaQ7xv8kBxdQMCUi7XefVMLHKsQX78WAQ1QonWUqFdDVr8wTsGNY5w+
         ccMbxUON0svZYnk/8Cz7z56DGcPkg0a38aiyRIoR0P75uIMmQTfnBhkIioKaTZv/S5dJ
         OwMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791319337; x=1791924137;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PFT7m0xKcvqNQAKmV39ppldm2c+AaUkF1Lbywy1q/kA=;
        b=kQJf4J1cs6q5Y0KSq64BQ7uZbXQNzLSXjFqYaunNR7Oh9kqr2oHLElADAMYxoRQeGF
         7+xZiSPMlY/mV3oPMGDkd0E+h/UXfWwEc2AnAr8pz2m501hkHkYGkGVjvW+af/1CYZlY
         VJTlNCaRcuPrDXbb+iR7v56BNqonDgVQ5aIKrCPTmtjVVIecoqpgXnXea8d2MCAYMWDL
         iAV8EP7HFhD/FLasJ6nww/Rx6/IjUlmRWkMaJY1B1KCWe+5llb6wPb3220pn1yjUBjDR
         eOahRh6k2BUwDeMn4T+JBHyJlgdWzuwprw+ud1Xlwguk5DJZ/JrhhxqCuuYw+ht7/g3c
         EI5A==
X-Forwarded-Encrypted: i=1; AKwUvBymWnHiv/zlWdRCYpAPEkqNJBjtH3q9zqmpqZG/9kAUx0SO+/uK13COzSGAfwuAcUE3LFu5+a/dwPeYQl4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIh8T7hIvet+o/OllpfR08vFKqWkCfsCu6fJSF5htmIF0cVdSIq
	kwH6rV4DC2tjpUGvPdu+iILV+L/8/oQN7BLPcT3vmbM8RLejUJ7Vg7Vy6g2ynVDvQ3DiLx9aacY
	SbQXFdPPyhEe9ZsQZCR7ykDPFOCiEfF+w777vwntvC4VyfI6Q9U4pg4dxb3tOeQsPJvG53cRrpN
	lSf+cIQ2tTuFQ7OCcc3H8fO76P4WqfSER34PC78zG5
X-Gm-Gg: AYBFou19TNv7rM8N8hBnYIWJOo5hXeBmfNRij5pQ+1JwozQKNy35Pzw59Ya1Hqgvgl6
	T0zp/CUhvHy8/IisjRb2EsrbjsBlIMOJsDIrSxKOWnra/9AOxgascg/SFO1XoNgjL7a/LZYVAkw
	DWFnymMRAO8f+bufGS4VkjtzG0an4R722cW+yZ8hrJnTsXPIGdt+guRKKk
X-Received: by 2002:a05:651c:2106:b0:3a7:812b:cec with SMTP id 38308e7fff4ca-3a9a2a7b138mr366741fa.0.1791319336827;
        Tue, 06 Oct 2026 13:42:16 -0700 (PDT)
X-Received: by 2002:a05:651c:2106:b0:3a7:812b:cec with SMTP id
 38308e7fff4ca-3a9a2a7b138mr366701fa.0.1791319336338; Tue, 06 Oct 2026
 13:42:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909112108.2281-1-yogeshgaur.83@gmail.com> <20261004051912.1045-1-yogeshgaur.83@gmail.com>
In-Reply-To: <20261004051912.1045-1-yogeshgaur.83@gmail.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Tue, 6 Oct 2026 16:42:05 -0400
X-Gm-Features: AclHuK9zRWsg9g2pZlcc1R4T_aayXvkIoFMFVaZS1a7QD2EKuiHEd0bOPe31Y_A
Message-ID: <CAK-6q+i9WbR0qTAzWPFHGvFQM-Lv0JJcu8rvt+_ZTBS7TSJMzg@mail.gmail.com>
Subject: Re: [PATCH v2] dlm: don't publish a lkb in ls_lkbxa before it has an rsb
To: Yogesh Gaur <yogeshgaur.83@gmail.com>
Cc: David Teigland <teigland@redhat.com>, gfs2@lists.linux.dev, linux-kernel@vger.kernel.org, 
	syzbot+da6dc573ce5e6624f505@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Oct 4, 2026 at 1:19=E2=80=AFAM Yogesh Gaur <yogeshgaur.83@gmail.com=
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
>    device_write+0x905/0xed0 fs/dlm/user.c:590
>
> Make it impossible for ls_lkbxa to hold a lkb without an rsb instead of
> filtering such lkbs in find_lkb(). _create_lkb() now only reserves the
> lkb_id, by passing a NULL entry to xa_alloc(), so xa_load() returns NULL
> for it; attach_lkb() stores the lkb once lkb_resource is set. All four
> attach_lkb() callers hold the rsb lock, and nothing takes an rsb lock
> under ls_lkbxa_lock, so taking it there adds no new lock ordering.
>
> An lkb that never gets an rsb is still released by __put_lkb(), whose
> xa_erase() frees the reserved id as before, and detach_lkb() already
> copes with a NULL lkb_resource. The lkb_id is still assigned at create
> time, so it is available to tracing and to the caller as before.
>
> The xa_for_each() walks in lockspace.c skip reserved entries. For
> lockspace_busy() that means an lkb still between create and attach no
> longer makes the lockspace busy. That is the same as the request
> arriving just after the check, which can already happen; the caller
> holds a lockspace reference, which remove_lockspace() waits for.
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
>
> ---
> v2: Following review, stop ls_lkbxa from ever holding
>     a lkb without an rsb, rather than filtering such lkbs in find_lkb().
>     _create_lkb() now only reserves the id; attach_lkb() publishes the
>     lkb. Subject changed to match.
> v1: https://lore.kernel.org/all/20260909112108.2281-1-yogeshgaur.83@gmail=
.com/
>
> Not runtime-tested; syzbot has no reproducer for this report. Built
> with W=3D1.
>
> ---
>  fs/dlm/lock.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
> index 2609e4fdeba8..2b7f3ff94310 100644
> --- a/fs/dlm/lock.c
> +++ b/fs/dlm/lock.c
> @@ -1488,10 +1488,22 @@ void free_inactive_rsb(struct dlm_rsb *r)
>  /* Attaching/detaching lkb's from rsb's is for rsb reference counting.
>     The rsb must exist as long as any lkb's for it do. */
>
> +/*
> + * An lkb only becomes visible to find_lkb() here, once it has an rsb.
> + * _create_lkb() just reserves its lkb_id in ls_lkbxa.
> + */
>  static void attach_lkb(struct dlm_rsb *r, struct dlm_lkb *lkb)
>  {
> +       struct dlm_ls *ls =3D r->res_ls;
> +       void *old;
> +
>         hold_rsb(r);
>         lkb->lkb_resource =3D r;
> +
> +       write_lock_bh(&ls->ls_lkbxa_lock);
> +       old =3D xa_store(&ls->ls_lkbxa, lkb->lkb_id, lkb, GFP_ATOMIC);
> +       write_unlock_bh(&ls->ls_lkbxa_lock);
> +       WARN_ON_ONCE(old);
>  }
>
>  static void detach_lkb(struct dlm_lkb *lkb)
> @@ -1525,8 +1537,9 @@ static int _create_lkb(struct dlm_ls *ls, struct dl=
m_lkb **lkb_ret,
>         INIT_LIST_HEAD(&lkb->lkb_ownqueue);
>         INIT_LIST_HEAD(&lkb->lkb_rsb_lookup);
>
> +       /* reserve the id only, attach_lkb() publishes the lkb */
>         write_lock_bh(&ls->ls_lkbxa_lock);
> -       rv =3D xa_alloc(&ls->ls_lkbxa, &lkb->lkb_id, lkb, limit, GFP_ATOM=
IC);
> +       rv =3D xa_alloc(&ls->ls_lkbxa, &lkb->lkb_id, NULL, limit, GFP_ATO=
MIC);

Now, all potential iterators need to check if there are reserved lkbs
(being NULL) in ls_lkbxa which makes it not better.

What I meant what ls_lkbxa should contain only valid lkbs (not
reserved as being NULL) that have a lkb_resource set up and not being
NULL. An lkb should always have an rsb.

- Alex

