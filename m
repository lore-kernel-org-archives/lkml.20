Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9613E5A2C
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788177585; cv=pass; b=KW4byS35NKShTq/6lQsdpodxMhm267UpV24HPwfltsnKGtavxZhiFMB0B7tstjU2hKpM3yeSySBNHx4CV5lfrZYDm80jwGYoQI4EN4Kc/yrIoSNr9wednosBFCQzOR1GwIi34PzCfL1KSVHCOBkFDfbt3hZYUl+qy7sbxi7eZ1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788177585; c=relaxed/simple;
	bh=XtJMReRayz5u01/Y3Wpc4UtRjykDXRN/p8mH13avm/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gGMOautsk4cB8igAGsZiLDUQyl/MtyEmMAt7Vw2YCTTkok7AtF2EoebCEoakrvZpV5P0ygQnHhjiBUt4a/Wiir1kB3yG4D8M1+GKC6RxMAtLUSACWWFvMEd2DraGs1TbNRfJpCrZE6oDFkZbEhdOw5T7n/PIENIcAwsyExrDLdE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xy/E+XSr; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ay7fBVhy; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xy/E+XSr";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ay7fBVhy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788177582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YpUyKt6NKpZOqi2PHbUzsqSHu/r4oFmeIS7Q+YbCn84=;
	b=Xy/E+XSrh71kXZu59maxYKDw3JlHiG+HciQk1nJMf/WHb25YIGnJSfe5ZLZ/cxrwt+JorI
	dCpGSTuHR8xI0/91ui2lP+6+FIKUvw51qqKXJIBbsR18tooKL6d1blU2oEnPk/lcEbZ2ur
	ijniync+IMo+yGGzg1EqLpEio6Hezn0=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-mWV4olAtNYK85jpBdPx9IA-1; Mon, 31 Aug 2026 07:59:41 -0400
X-MC-Unique: mWV4olAtNYK85jpBdPx9IA-1
X-Mimecast-MFC-AGG-ID: mWV4olAtNYK85jpBdPx9IA_1788177581
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-81e6abfca68so49869857b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 04:59:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788177581; cv=none;
        d=google.com; s=arc-20260327;
        b=UJdbZuuICQWwT3kBA2IN4Z5AjlZQse03Yr9Yhx7eLlqo5hF7Kkq7AZFWZ5pYB8uOma
         w8M4sYB0x6dXWP5TS/Xr0cK1gfJ8CJz3VkHLlkLRR3Q7bwCDrJRgm6Q8H1SPqGf0ZbSe
         A3VFaYKE3mXO9vfD8YnxGPHvNiSdplbfRSkFe6hc5N4lV+vS/vbDv6/TCYDs6IbVwqyk
         seDYX0fEeTGODkSF04TSzeKHr6JqnCja+OMKndrW1BxnBCkgetPle3reUf1ITewJ5ECX
         55ILzWIEbwZZXAiivSGux3Kv0dIXrNL0eDIdeqM0O5kk7jgRV+hPKIVayzJvYChIUM/7
         aO+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YpUyKt6NKpZOqi2PHbUzsqSHu/r4oFmeIS7Q+YbCn84=;
        fh=6jUQWnpoC1bybFYo0lfaAVolZbVN8bUQhIFHw4DR/WY=;
        b=QZLW3WHiatavmaXNAD654+EQ2rj0dIsxE5AEqBpTfbpegdYTtg6GYRy06XT085J6fz
         Bm4LW1NBiCChe3KWXwTD8XAEiiVIPVgy/dmydhwVHU7JCBlu4Tq50++CLbEVimEplG1i
         O+lDGNCxjE+AIlMu1BUnPcXyNUoQQ7kxLQ9X/xbFBxi2+Sjgu6q0NAY3IZbGYOMNs2l+
         gsKh6Nf/B177/fq/ZwVOe9L7yXHsuK6NhDGNg7YuGjwKoheTThYFpjocCNIrcDgRVJ0V
         CchnEj5qYlh+9MlPx2NJ0CS4si1MN07G4enQE0/9Ifj1lU5DgjtMlzpVpi7Fk9+vGwor
         QIMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788177581; x=1788782381; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YpUyKt6NKpZOqi2PHbUzsqSHu/r4oFmeIS7Q+YbCn84=;
        b=Ay7fBVhyfwkxXPSkQ3yb/pI9ZM+eN6AGpmrgLGXXTbHO5/ZMIvAp5lgN8ehOkMNKWU
         iLD2++nWeWPeKmUv0YyWAURRzPP0jf194quygHDDUDf9viUtjYWNLu3GabS5AR07Aqcl
         uvcUWvxkk2iGB7TuQthPEsq0+pHkxX4vDAqlc7xrt3mhWv9DNK8EVdBXKASgzqiofM3i
         hXqIJuJPdS1FkGN52W3jZebrBE9Fj+NPi4JfGmgVmQ9wKmKfawCtVmx9chh9zHBdRBrh
         Akv2AE8FkF+aI5TXuZOtluT9GsXI19SL/xrUlhzlVLHM+LNKdT9OPtRYwDzS040IoRwW
         qSUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788177581; x=1788782381;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YpUyKt6NKpZOqi2PHbUzsqSHu/r4oFmeIS7Q+YbCn84=;
        b=fRvwFe3IW/K3wpqsFogZ9R6is3wByRDNK4d1f6bGXwLFZog5leh1Q23NEQ0rSKCySB
         lJ4fD34ud2M+RGakiieu8kueLpXv2m6hs34zbBck8YZLV1FU1uIPnTFQoAQTHQ+DLxf2
         9SD8Fa3hXSIMS+lJJEggLuoAx3oJjhrhbISVo9ECDJYjKTgfeZ2oyzsFNz1Qo33UOgRT
         L06B/lDX3mu6feCdvxL7IIlKfM0yyCm2/6I1JcCOn26wWDcHULaPtjUfrVkbi/uK0zyF
         jQ8ap7GaNU8gzQSAWO8MJDFhapTPWBHl8FCoZFGxx3pYTmLtBwqxC3DYw1a3k1clwF9e
         V9Rw==
X-Forwarded-Encrypted: i=1; AKwUvBwbYXf3bmwvmsWQudmlf6Dyc6WGN/G6wuk7ED1osMKE0EH5hwHI79KH59UluTPs8sKtlub29oNstKQia1s=@vger.kernel.org
X-Gm-Message-State: AFuF++nZA7e77DT+tJ7ilGLm9aTWuCI1dvLHZJaISOx9Ghyom8nJGEMM
	G3qXYOt1xPMA0DOzF14yricJa+CXsNDcaI1j+qH/mLmHHcmyjMhECIVoCDKsrR6NiZiDROVnIww
	cMxnCGkXK6lALZluMCsrkVTXtkABAvL40TzviBaMAgi+v+cdda8pIPGYDfTj5t1Wo3RYa53EsbZ
	vR96X1CITLONpb5YXhcbt0bKTOWQKbXVRIJQdjgu9k3LID1WBO744=
X-Gm-Gg: AYBFou1yXXysasywuiJmwZRh9+Liw7csV3JOvtO1/cgH+Qa4F35hFuB3ZGJFAMmg9K+
	+vEwHqJW/YLWL92Q3cmPFCp9p1vRVI3GKOwcBY1v7MJtt+kW+X69Nhk9BSrRM807dp1sRybDLow
	k7+uXlbYu3A18WTZjiwZVM+V5FT1IHm8Bu1W2wORITHRrOXnoFtmgM9GZfJ4gNc6vQP1wWlhUbN
	huU0ye9bMYnSE3NzFZfSvdqTZ2aFXabwsDE1sZ+ofwo
X-Received: by 2002:a05:690e:43c6:b0:66f:80b6:e954 with SMTP id 956f58d0204a3-66f80b6f278mr708893d50.42.1788177578170;
        Mon, 31 Aug 2026 04:59:38 -0700 (PDT)
X-Received: by 2002:a05:690e:43c6:b0:66f:80b6:e954 with SMTP id
 956f58d0204a3-66f80b6f278mr708883d50.42.1788177577730; Mon, 31 Aug 2026
 04:59:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831105425.622254-1-r772577952@gmail.com>
In-Reply-To: <20260831105425.622254-1-r772577952@gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 31 Aug 2026 13:59:26 +0200
X-Gm-Features: AcwNN1XEYDO6BbANnYdL4InXzS-PGISlnDhdt4_420VqSyNsR953nV8_5jm--Yg
Message-ID: <CAHc6FU7x8J_pPKzbmSJEpB8AbcV1bJuEx5+i0nqMpboZ6xDF5g@mail.gmail.com>
Subject: Re: [PATCH v2 RESEND] gfs2: reject oversized dinode sizes before i_size_write
To: Jiaming Zhang <r772577952@gmail.com>
Cc: gfs2@lists.linux.dev, anprice@redhat.com, linux-kernel@vger.kernel.org, 
	syzkaller@googlegroups.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Aug 31, 2026 at 12:54=E2=80=AFPM Jiaming Zhang <r772577952@gmail.co=
m> wrote:
> A corrupted GFS2 image can store a dinode size that is larger than what V=
FS
> i_size can represent. gfs2_dinode_in() reads the on-disk di_size as a u64=
 and
> writes it directly into inode->i_size. If the value is larger than S64_MA=
X, the
> incore i_size becomes negative. That negative value can bypass the existi=
ng
> stuffed inode size check:
>
> inode->i_size > gfs2_max_stuffed_size(ip)
>
> Later, gfs2_quotad may try to sync the quota file and unstuff the quota i=
node.
> gfs2_unstuffer_folio() reads the negative i_size into an unsigned length =
and
> passes it to memcpy(), turning it into a huge copy size and triggering a
> out-of-bound issue.
>
> Reject dinodes whose size exceeds sb->s_maxbytes before storing the value=
 in
> inode->i_size. Also make the stuffed inode check use the raw on-disk size=
 while
> it is still unsigned.

applied with the changes noted below.

> Fixes: 70376c7ff312 ("gfs2: Always check inode size of inline inodes")
> Closes: https://lore.kernel.org/lkml/CANypQFaF6bvORKKbRALvEL0k_epFaneFiOQ=
qco4gjdmKVbdURg@mail.gmail.com/
> Assisted-by: Codex:gpt-5.5-xhigh
> Cc: stable@vger.kernel.org
> Signed-off-by: Jiaming Zhang <r772577952@gmail.com>
> ---
>  fs/gfs2/glops.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
> index 28f32424ee64..8c5d257451d5 100644
> --- a/fs/gfs2/glops.c
> +++ b/fs/gfs2/glops.c
> @@ -393,11 +393,16 @@ static int gfs2_dinode_in(struct gfs2_inode *ip, co=
nst void *buf)
>         umode_t mode =3D be32_to_cpu(str->di_mode);
>         struct inode *inode =3D &ip->i_inode;
>         bool is_new =3D inode_state_read_once(inode) & I_NEW;
> +       u64 size =3D be64_to_cpu(str->di_size);
>
>         if (unlikely(ip->i_no_addr !=3D be64_to_cpu(str->di_num.no_addr))=
) {
>                 gfs2_consist_inode(ip);
>                 return -EIO;
>         }
> +       if (unlikely(size > (u64)inode->i_sb->s_maxbytes)) {

The (u64) cast here is unnecessary, so I'm removing that.

> +               gfs2_consist_inode(ip);
> +               return -EIO;
> +       }
>         if (unlikely(!is_new && inode_wrong_type(inode, mode))) {
>                 gfs2_consist_inode(ip);
>                 return -EIO;
> @@ -418,7 +423,7 @@ static int gfs2_dinode_in(struct gfs2_inode *ip, cons=
t void *buf)
>         i_uid_write(inode, be32_to_cpu(str->di_uid));
>         i_gid_write(inode, be32_to_cpu(str->di_gid));
>         set_nlink(inode, be32_to_cpu(str->di_nlink));

 Also, I'm moving the additional consistency check here.

> -       i_size_write(inode, be64_to_cpu(str->di_size));
> +       i_size_write(inode, size);
>         gfs2_set_inode_blocks(inode, be64_to_cpu(str->di_blocks));
>         atime.tv_sec =3D be64_to_cpu(str->di_atime);
>         atime.tv_nsec =3D be32_to_cpu(str->di_atime_nsec);
> @@ -462,7 +467,7 @@ static int gfs2_dinode_in(struct gfs2_inode *ip, cons=
t void *buf)
>                 return -EIO;
>         }
>
> -       if (gfs2_is_stuffed(ip) && inode->i_size > gfs2_max_stuffed_size(=
ip)) {
> +       if (gfs2_is_stuffed(ip) && size > gfs2_max_stuffed_size(ip)) {
>                 gfs2_consist_inode(ip);
>                 return -EIO;
>         }
> --
> 2.43.0
>

Thanks,
Andreas

