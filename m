Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4985476E2
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 19:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790710665; cv=pass; b=MO8XHDGphRgzkaz+OGz2X/Tsprk5XrNVqC9Kdb2cnzwpVyb+gqzb9BZVTpeFlGJ3jXhlNf1RtmzLWCmhR2+MdTHib/hJFcHDlR9TpRAC7kFMLdSqGKGHer1yQMy9wJWzXmZoF2KbFSF6fZZCJk1urY7CUgUfcOuZVVt20m3D7Ws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790710665; c=relaxed/simple;
	bh=zPOl7hZyApEXshKMSylpZ2BULcyQnFZvV6/jjsZB5Iw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z4rmHwmjBYx+g0FqhInyj3V3d3adoE3Dfl0MVmaRwgGj2m1VxcFl1HiwsoHDsFORXQt9xwnXfq1QqFTjz5J1xBNFVOR9qRyAc8eCZDjKDw9TqzYb5UziZqWvEW9Crp+ssLPfDDWDWoexLUCYDMmBzEJJoI48lX8ZV0wAz+lQCZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OYMvml9E; arc=pass smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OYMvml9E"
Received: by mail-yx2-f42.google.com with SMTP id 956f58d0204a3-672f4b7091dso2437246d50.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:37:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790710663; cv=none;
        d=google.com; s=arc-20260327;
        b=ZeJu+Upy8O+NEfZIggFstN5o8XIAdVh9C2/SFE8yr0do89No2KBu2pqp5kKW+h9a7/
         DmXg/3YlkQYO+22b0lDyDTRQ7nxkr4Chg0Jk8wPybSmYbXiJPYAhtViqR6t9WodHfTqO
         XwpMu7lqYsyHRvOM1/VxLghB4+95rltqlQHrKGEgCG7Q7CjqQHCZaaWzqIRDXYYm5b6L
         xb+PpTB9ZcvOHVjWitWsy1wCIHRPVysu4dQDHccY3807l83Hw3LOHTvVBGkmmjhregrj
         HK6JkuQe9djDIM0P8kyPuPs2qv2lKW6sq6+nYepkPMEz6ABqzKWMBtMVja/I+Zo9Piwr
         G8Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GX+Eejk6Gbdd0dI1GiNKkTeKVvseDXezn0hf+TkyYJ4=;
        fh=EHkZY5pIf7Z9VB+8DC4IlaDccpF+h15xwQDGst6iKZo=;
        b=qKbEO034eo7ZbKNvO2BEFV73uYYMiSh5Fa6XoNH84HxQy67ssoKOOYozmvP+0Kle/C
         tlatKhxeAWT9FYWzbBx87uOfZz1QOFFoelCu9xLrVZsop2+hDrAcaB81E8MtlReWHx6a
         Azuu7TGM3xTalenNSuw/Q9yzUkGw+LGFJcyB/Dcy0Vi8dkONn1S+VImJky/rAe+U/7LJ
         xxeCfT9Pi9QP1vU0tbmxUyIt0vKGRBn5CJJ9eMvTVOOFj3rfWLj2VWBBx0A90WBJFvvL
         0Aqad0pZUc/FhKEoXTxrIMdlc8vxgOTBSfVaLCHOHmeDYqHyB1VSpFWMKAk+SGJ8yOEa
         Hviw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790710663; x=1791315463; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GX+Eejk6Gbdd0dI1GiNKkTeKVvseDXezn0hf+TkyYJ4=;
        b=OYMvml9E0u6kcD5oHzcjgQNegTxOAAJQ5aOulBjbWiirvhrsTsLsrDUU0b6uQrAQJT
         WAYT08yffLeZP5tf93Q6sewqslrk5awR7QBb1iC1vCSc8l1hIMC9kb5NPkE6y5ON1tkq
         AuFvgyJQDMMcFOhh6ONGIP8TVZR2rG4vYjS0JC0+fAJHsybGmksBBuU6VbW0r+flSzQt
         OgKddlFgGGw3r7bJqVtjZLA9K/wsLm/NS7PQykSH60xJx+RMLuuuASYbVjzMyNyr4Ldw
         5hHoXHTe96VY1PKnmN2ba/iugDQLiObzMPjK9sGrFQ42PnM+/UYGrIHY77jhdVxY/fu/
         mhTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790710663; x=1791315463;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GX+Eejk6Gbdd0dI1GiNKkTeKVvseDXezn0hf+TkyYJ4=;
        b=rL1+sy7e7b5usxVDk03geaV1CjMGlVDKb3e8WNEvpOxkIpBBjcC9oSsFjolXydlwlJ
         nCgAPd1CZYRhyfFx949FpnlAROoI0zBii8XOel+7LiXn2weS+hliDLLQyFlmgWX+FVmY
         4zB0UqyByeBchUSXdYI+FrT9jaJ6tcjvq8esr1/pPQ/0plvrB9aIhtQRz2TjZ039Kkaa
         Biqews9VthjunVAql8F63r55fw2NrKTXb1+qFL6YHnoV1gdmSM0HmX59Aq2/RaYrGNBu
         WdXkmh6cw2KDHjm8GKiPHLOL8sQ6r4lkPXBj5RUjcPkFn1Sfa3kh7dBMZQZRscVq3DWm
         LQRg==
X-Forwarded-Encrypted: i=1; AKwUvBySdORerO4Ar656Y6v56qlpO+/FXJUld4sbB5WgGDpjLH/C3dVghBsVPEs1WpjkE0GbANVv/JFzcOwz5iE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjlAgAG9eeckoKoOVbIFh+jJO1+acAFhtIIdF8RtqT/g7NxsIp
	PsCedXj1hdLh2Kt7CpcRWWlcwWhZc9KXYH2RFpjBBrdaYLxAfUyzmnfQLBuQhPT9T2DdwO1Fzk2
	g3RjhM0B8K4sIAn333z7J+pV45N2MX6k=
X-Gm-Gg: AYBFou0Evg6TR2bD1IJRKWZ+uVPYtIdj0j2wsBk0F9a3RSGYJpUpYCMsXRXZGIWxO/5
	TI9jO4WmLQpiR2Lzm9k4tomHKGZGJvdD5A16cb7kYfyur6a657z6qkn/8Z5xywJlHzzO6SVkELk
	mairfguRfnYgTwFaIeI0eCgW+XBbvTkibTkIE1BBj6gyJy+VYOQ8fedIBgB21eWaAguNFrE3ELo
	qaRqzc+1zjZ8/zcvnIQ1yKr+PGhj9Ik5Ek+ZB9cZdK1wn7hhT0S56S6S3jQoVhBHGj6S1aEooul
	US8uap9G7lcFHHrwZc5KnkOik1dQiuuaRWzQcmIk6D4gUEtYHTar3K0=
X-Received: by 2002:a05:690e:4889:10b0:674:1556:4979 with SMTP id
 956f58d0204a3-6763ab23a59mr82376d50.7.1790710662756; Tue, 29 Sep 2026
 12:37:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922060048.13158-1-ginger.jzllee@gmail.com> <arsnHB6Ak3q4Ztsn@p15>
In-Reply-To: <arsnHB6Ak3q4Ztsn@p15>
From: Ginger <ginger.jzllee@gmail.com>
Date: Tue, 29 Sep 2026 21:37:29 +0200
X-Gm-Features: AclHuK8HGiKwNFs3_ik20qNDsJApVWkeRh7QZ2qvciJw1z2DCH5ZiX4SeXHtWbA
Message-ID: <CAGp+u1apjPVOkk0zkaPbbkFbtkNOU=RrMN9947xWgT_LdabOhw@mail.gmail.com>
Subject: Re: [PATCH] ocfs2: Protect local_alloc_state updates in load/shutdown
To: Heming Zhao <heming.zhao@suse.com>, Markus Elfring <Markus.Elfring@web.de>
Cc: mark@fasheh.com, jlbec@evilplan.org, joseph.qi@linux.alibaba.com, 
	ocfs2-devel@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Heming and Markus,

Thanks for checking this patch. According to Heming's response, I
think this patch is not necessary.

Sincerely,
Ginger

On Tue, Sep 29, 2026 at 4:59=E2=80=AFAM Heming Zhao <heming.zhao@suse.com> =
wrote:
>
> On Tue, Sep 22, 2026 at 02:00:48PM +0800, Ginger Li wrote:
> > My static analyzer identified a potential issue in 'fs/ocfs2/localalloc=
.c':
> > osb->local_alloc_state is documented as protected by osb->osb_lock in
> > struct ocfs2_super, and most of the code follows that rule:
> > ocfs2_local_alloc_seen_free_bits(), ocfs2_la_enable_worker() and
> > ocfs2_recalc_la_window() all update the field with the lock held.
> >
> > ocfs2_load_local_alloc() and ocfs2_shutdown_local_alloc() update
> > local_alloc_state, and local_alloc_bh next to it, without taking osb_lo=
ck, so
> > those stores can race with the reads and writes done by the local alloc
> > reserve path.  Those two writers predate the locking convention and wer=
e
> > never converted.
> >
> > Take osb->osb_lock when updating both fields.
> >
> > Fixes: ccd979bdbce9 ("[PATCH] OCFS2: The Second Oracle Cluster Filesyst=
em")
> > Signed-off-by: Ginger Li <ginger.jzllee@gmail.com>
> > ---
> >  fs/ocfs2/localalloc.c | 6 ++++++
> >  1 file changed, 6 insertions(+), 0 deletions(-)
> >
> > diff --git a/fs/ocfs2/localalloc.c b/fs/ocfs2/localalloc.c
> > --- a/fs/ocfs2/localalloc.c
> > +++ b/fs/ocfs2/localalloc.c
> > @@ -342,8 +342,10 @@ int ocfs2_load_local_alloc(struct ocfs2_super *osb=
)
> >               goto bail;
> >       }
> >
> > +     spin_lock(&osb->osb_lock);
> >       osb->local_alloc_bh =3D alloc_bh;
> >       osb->local_alloc_state =3D OCFS2_LA_ENABLED;
> > +     spin_unlock(&osb->osb_lock);
> >
>
> This function is triggered during the mount phase. The la (localalloc) is=
 only
> active after this point, and the fs is still in the initialization state,=
 so no
> inodes can be created. Therefore, we don't need to worry about any race c=
onditions.
>
> >  bail:
> >       if (status < 0)
> > @@ -392,7 +394,9 @@ void ocfs2_shutdown_local_alloc(struct ocfs2_super =
*os
> >               goto out;
> >       }
> >
> > +     spin_lock(&osb->osb_lock);
> >       osb->local_alloc_state =3D OCFS2_LA_DISABLED;
> > +     spin_unlock(&osb->osb_lock);
> >
> >       ocfs2_resmap_uninit(&osb->osb_la_resmap);
> >
> > @@ -441,8 +445,10 @@ void ocfs2_shutdown_local_alloc(struct ocfs2_super=
 *os
> >       ocfs2_journal_dirty(handle, bh);
> >
> >       brelse(bh);
> > +     spin_lock(&osb->osb_lock);
> >       osb->local_alloc_bh =3D NULL;
> >       osb->local_alloc_state =3D OCFS2_LA_UNUSED;
> > +     spin_unlock(&osb->osb_lock);
> >
> >       status =3D ocfs2_sync_local_to_main(osb, handle, alloc_copy,
> >                                         main_bm_inode, main_bm_bh);
> > --
> > 2.43.0
> >
>
> When the code enters the umount phase, the VFS layer ensures that there a=
re
> no other references to the fs, so no race can occur at this time.
>
> At last, if you have reproducible steps, please provide them to help us
> understand the issue better.
>
> Thanks,
> Heming
