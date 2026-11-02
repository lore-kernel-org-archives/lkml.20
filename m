Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793646411;
	b=MdeTzYBBIMmkTz+OAtjjeyAvC50TgLQ8THntrFKL2TaiHJzvCNScAq8xE/6kLlcgBbYJ
	 mv2XB+kUz+wxA85NHixzTlgsvy/dJJ55xDnfjfp4MUGGd7PQr8nYwxkcibatSovaGSzPt
	 PUzC3InvWyvcSVwlbhACUjJyODFQe4vOEDlQQEeWeHj0zzT3zTNfPVYkKJle+sxJig3RQ
	 rLKIbqh4oPrFy6z48/dXT3Hfx0R98KtNkOl+SKeKTwfgESZrK8XyXwXPAF3HUkWVoiYN0
	 xdyjv+xPwxNw44K5wpTtm7t/DXvbJ7kC3c6xccUuf3NpasAWz6XsPY0rnCUFm5YsqEQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793646411;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CoGzdrvvaViECSeg3PiBflj+0qzs8BGFy96FG4d/cj8=;
	b=eGA//A+zg3X1FbqYH376JHH5tOeZnaM0MPmJrpm4a+tZDPAr9p7ycmQyaw5ZjMlEG16K
	 gUI/w2N3JrzZEgquyT3mKUAsYipca38aHoPNsAy0AczIk3vW3XOGTZ6hpUSFlqslTkZHU
	 9Rg7aV2tl6yqv+P/q4PrqhTgV8uraIvS6+OgAP0JyKgC/RronY8EH2JRm0I9/nyqB3rMB
	 QEpZnEO5Ntan5OuyYoG4J0gI50Vsnou67s2keeASiwE70i2nIHjTjdtSQebe3h78bkhyj
	 QtcFo496YtwgatIZwLpkeMcVhoT4QSVSoNHkEYHuP+45/liAfzfLs9+V/wTeEMZSnBg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tnNnjlYE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5A5606A329
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:06:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC5A5606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tnNnjlYE
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-679e6ab6471so3934583d50.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:06:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793646410; cv=none;
        d=google.com; s=arc-20260327;
        b=WaImSDnAHxMeibtnYN19trVSTvRa0t1n5NS2wKr6k7X45k1cRaNHy2kdQY1ltL9B87
         SGDpQt57LN5qW5Pbr52Ef8Huzjl7PwJyGrCTmvaVGnqAdZMmDmK3zPfr4HTerqYl47Kx
         d8BR2zVPt+mPuNu7ecauFZifKUAjBZBQ+jctMHrHqdlD2Lal7qOuzynRlE7fl698kHf7
         iXesAZascZ85fqGeHujrFJkKSZ6+5dzImtmkWszwaNr1EVPeZI/gX6PREJos99s+qkwm
         duzyTJkO1asLHVlnliQrzY3Z0Euie1CLqsZgWQ+s7u6t0kVGg6nr+f2bsE2f2MUiuNuA
         kj9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CoGzdrvvaViECSeg3PiBflj+0qzs8BGFy96FG4d/cj8=;
        fh=Pkm7ttGBRbUSILSTIStPU1+pFTcdLmDhClBFzt8NCys=;
        b=V7idmIRnpj0A7FDJDkiNTXhe6Eonr0gUK6lpJdgFbkHvpI6uthdoiRRJ+rg6lp5Qf9
         V5chtrwbbWRD2bDnN4k2+RW11hdLfm3xWlTnwUHjGpgcDzr1+okMZKbePmCLCCTk0kms
         Gg1v4jzrOE63K2bGKVJPGqKQwYShdJtKgHpqsYbxfLUdCGvpmeK3PBh1zT8xuq168+zw
         6eZWF3hm7vTcOPZH7PAvm19FLU5WN6b3JHBvJsSvhDeSav7pMtQOy9CS/T5AQBU7UC5m
         cqSUOFYf6Wqt9V4E+ZNzul4Okng8Y4Xpj0gL42hbR2KU3WnmhAsRlrOzYRqq2wpLKnbj
         dJ3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793646410; x=1794251210; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CoGzdrvvaViECSeg3PiBflj+0qzs8BGFy96FG4d/cj8=;
        b=tnNnjlYEC10sRjaX8VVbgcAd8IKKiRclExe8oUiilq9oJbJXGXPaFX7svfDWA5VLcT
         dOrwbO+NBopmy9Rrtc6LeuIOKlv9sNYHZeMG9OC5fE9TOe9mWgw2wNWZQtspd9LRsAK2
         C6/Fd8cuZZCW6A0ONYIN37BzGXlDL9/3Cq419MKJAvuV+BEd67LaqKQwLsTh3j9I0VSq
         caiKXG/Jt2mJ+QGF8dd5beMFmncSCIGhzIqJjv2AeR6ntBD/ovF5X+Z9WgKo7D5LXKy7
         EJ1DiHzkPdusb/TESQq1QJDbStCB4CUmD/ziqBshYiv2TZsxjLh0ZHwxzhWc8cEUWunN
         yyGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793646410; x=1794251210;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CoGzdrvvaViECSeg3PiBflj+0qzs8BGFy96FG4d/cj8=;
        b=am1enRL8fcsFvgaTNn3yUkJK4t8xn/0GSy0kWyC2UNFPI/R7R82Lx1krmgl+OqizaI
         nrIMxCUKYddYTbNUxEn7Mmx7Dp0v95yzcv8rO/YQUiSvdgrX9AmezH9gdZJQL7IoAYuG
         nXr7QadIbhdPo2/Oh+MCR2hiq6pTQlBf4Ondq3eJi8pTh50lOy1SbNzLlws0deG3b2Pm
         b6Rapj2KyMC/uOILic8Yp0nHZ3U+ZVFQrsgVgp8M4XduREX5dHaTbf2VlC5SLs712Ijb
         fqmQeoXHoSKIqpPssp43IWcvOTSJNMg69iu4PiUTVxiIA5oZqH5iAK/7LhT4TamJZmQI
         iONw==
X-Forwarded-Encrypted: i=1; AKwUvBz7wxVN6poPCySPpRLJeOwrJZuAIVvrgVNXTO8eDOlpn8B3y2S5RHRH49HBcfnNaT5Vw/89Nv8Xnm2jPFM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MJELKWi+9qreoVRWJO4kfAvj6GszzSIU00fYjtsuO1jYIuRhr
	jGb3AtISeNv+bhesSwU8CPWJ3GUibWzR/PTeCeVz4ObKDNUn24vSXiVZxvwvqC0hjZGQfTg+HTG
	tRSNCf1ftEgK6DFAYMW28LdxNrpNVBSY=
X-Gm-Gg: AYBFou1yo/jecbSaJ7w/KMde2MzxMNbYXVYWqeIv2jx04vYFssCGO15yFq8e+snkRWW
	KS62cpKVLusgH8TRw3wc6H9L764O77ToqXYcBzO40QOTChjrXPzKpqTaQicjK3n+2MkVL9ZjZXz
	Y/hB7g/o9xivUqWu0kt3c4c/6BMyaViMWGY1K5NfGueytduRkGLF7jiC5OBUrRLkLFqhVOKMaW/
	RIYyIqgRjFTPXQHOSHGx3WFQaEbOcmOco+2tJLnWaktBDIRKm6EW99zCdRPezSBhwAlsMy2jw+9
	gfNOe6iMRK8OdciACI/llF4rRoVHsBBxD0eR9ZKcAf77eN9uuiVfmmP+O+IHH0fncnsk3Av1QXg
	tHUlxy7YRuoDo2DMFN2e9tNW+0txN9rR0BcatjJfS1f0SI7gvS19zP0pW+we9lxiDzOEzD8+1Vh
	G7MBGRJBMftHM2E6/R5yHcCp1jmRqy0bPev1KTb51QI0zWdZwlS4fD7JAABg==
X-Received: by 2002:a05:690e:1c20:b0:679:90f4:3223 with SMTP id
 956f58d0204a3-67a8d3987b5mr8777022d50.9.1793646409776; Mon, 02 Nov 2026
 11:06:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102130540.252894-1-omosnacek@gmail.com> <CAEjxPJ4hxdvV-r8chmF3RAi9RJX=-4AqntG01=fWUhh4-xP+ew@mail.gmail.com>
In-Reply-To: <CAEjxPJ4hxdvV-r8chmF3RAi9RJX=-4AqntG01=fWUhh4-xP+ew@mail.gmail.com>
From: Stephen Smalley <stephen.smalley.work@gmail.com>
Date: Mon, 2 Nov 2026 14:06:38 -0500
X-Gm-Features: AclHuK9UEiLULgDNF_R4Op6pxR3pAD5yp_wmeU60kO8Lo7f2jaleNkGh11hTlfk
Message-ID: <CAEjxPJ6X3Hvd5eOCxmqaNWi-vqbGEj6rULHiFJGgD41uPxAm7w@mail.gmail.com>
Subject: Re: [RFC PATCH] af_unix: introduce MSG_CMSG_SEALED
To: =?UTF-8?B?T25kcmVqIE1vc27DocSNZWs=?= <omosnacek@gmail.com>
Cc: Eric Dumazet <edumazet@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Simon Horman <horms@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	netdev@vger.kernel.org, selinux@vger.kernel.org, 
	linux-security-module@vger.kernel.org, io-uring@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 10:14=E2=80=AFAM Stephen Smalley
<stephen.smalley.work@gmail.com> wrote:
>
> On Mon, Nov 2, 2026 at 8:05=E2=80=AFAM Ondrej Mosn=C3=A1=C4=8Dek <omosnac=
ek@gmail.com> wrote:
> >
> > Currently, when a process receives a file through AF_UNIX's SCM_RIGHTS
> > mechanism, the security_file_receive() LSM hook is calledto allow LSMs
> > like SELinux to validate the receiver's access to the received file
> > (similarly to a process inheriting file descriptors through execve(2)).
> >
> > However, there are cases (such as dbus daemon/dbus-broker) where the
> > receiver doesn't intend to access the received file and merely wants to
> > forward it to a third process. In this case the forwarding process woul=
d
> > need to have the appropriate r/w access to the file in order to receive
> > it, even though it will never actually acess it. That leads to the
> > security policy having to grant the forwarder access to a potentially
> > wide range of files (in case of dbus-broker basically all files), which
> > is not ideal.
> >
> > This patch adds a new CMSG flag MSG_CMSG_SEALED that, when passed to
> > recvmsg(2), wraps any received files into an opaque anonymous inode wit=
h
> > the name "[envelope]", skipping the security_file_receive() LSM check.
> > The returned "[envelope]" file descriptor can't be used in any
> > meaningful way other than being passed forward via sendmsg(2) with the
> > MSG_CMSG_SEALED flag. In that case the original file is unwrapped and
> > sent via SCM_RIGHTS to the receiver. The receiver can then either
> > receive the file as normal (subject to the LSM check) or again "sealed"
> > in the "[envelope]" anon inode for further forwarding.
> >
> > Note that sending the "[envelope]" file is only allowed with the
> > MSG_CMSG_SEALED flag set, to make the unsealing explicit and avoid
> > unexpected behavior. Attempting to send it without this flag will fail
> > with an error. This also avoids recursive nesting of "[envelope]" files=
,
> > which would only make this feature harder to audit for possible issues.
> >
> > This patch also adds a simple read-only sockopt for UNIX sockets that
> > allows userspace to determine if this feature is present (passing
> > unknown CMSG flags unfortunately doesn't lead to an error currently).
> > The minimal code to do so can look like this:
> >
> >     #ifndef SO_RIGHTS_SEALED_SUPPORTED
> >     #define SO_RIGHTS_SEALED_SUPPORTED 88
> >     #endif
> >
> >     #include <sys/socket.h>
> >     #include <unistd.h>
> >     #include <stdbool.h>
> >
> >     bool MSG_CMSG_SEALED_supported(void)
> >     {
> >         int sock, ret;
> >         socklen_t optlen =3D 0;
> >
> >         sock =3D socket(AF_UNIX, SOCK_STREAM, 0);
> >         if (sock < 0) {
> >             /* handle error */
> >             /* ... */
> >         }
> >
> >         ret =3D getsockopt(sock, SOL_SOCKET, SO_RIGHTS_SEALED_SUPPORTED=
,
> >                          NULL, &optlen);
> >         close(sock);
> >
> >         return ret =3D=3D 0;
> >     }
> >
> > Related: https://github.com/fedora-selinux/selinux-policy/issues/3286
> > Related: https://github.com/fedora-selinux/selinux-policy/issues/3287
> > Signed-off-by: Ondrej Mosn=C3=A1=C4=8Dek <omosnacek@gmail.com>
> > ---
>
> > diff --git a/net/core/scm.c b/net/core/scm.c
> > index ae38f3c1165c..08822b2a1f22 100644
> > --- a/net/core/scm.c
> > +++ b/net/core/scm.c
> > @@ -114,10 +127,29 @@ static int scm_fp_copy(struct cmsghdr *cmsg, stru=
ct scm_fp_list **fplp)
> >
> >                 if (fd < 0 || !(file =3D fget_raw(fd)))
> >                         return -EBADF;
> > -               /* don't allow io_uring files */
> > -               if (io_is_uring_fops(file)) {
> > -                       fput(file);
> > -                       return -EINVAL;
> > +
> > +               if (sealed) {
> > +                       /* Only allow sealed files */
> > +                       if (file->f_op !=3D &envelope_ops)
> > +                               return -EINVAL;
>
> This leaks a file reference.
>
> > +
> > +                       file =3D (struct file *)file->private_data;
>
> This fails to take a reference to the underlying file but will later get =
fput().
>
> > +
> > +                       /*
> > +                        * No need to check for io_uring files here as =
the
> > +                        * underlying file had already successfully pas=
sed the
> > +                        * check when it was first sent.
> > +                        */
> > +               } else {
> > +                       /* Don't allow sealed files */
> > +                       if (file->f_op =3D=3D &envelope_ops)
> > +                               return -EINVAL;
>
> This also leaks a file reference.
>
> > @@ -365,18 +398,37 @@ static int scm_max_fds(struct msghdr *msg)
> >  }
> >
> >  int scm_recv_one_fd(struct file *f, int __user *ufd, unsigned int flag=
s,
> > -                   bool notrunc)
> > +                   bool notrunc, bool sealed)
> >  {
> > +       struct file *f_received;
> >         int error;
> >
> >         if (!ufd)
> >                 return -EFAULT;
> >
> > -       error =3D security_file_receive(f);
> > -       if (error)
> > -               return notrunc ? put_user(error, ufd) : error;
>
> Design point: I would suggest adding and using a new LSM hook that
> allows security modules (like SELinux) to still be able to check a
> (new) permission that governs whether a process can pass along these
> sealed fds so that we do not entirely lose control over their use.

One other design point: you are creating the envelope with
anon_inode_getfile(); consider using anon_inode_getfile_secure()
instead so that security_inode_init_security_anon() can give the
envelope a labelable context, which SELinux could then use to label
and control envelope use directly.
