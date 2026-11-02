Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793648379;
	b=0GM3nT0Z6aVuOq/tgODKI7wKNjdIDrlvGrQn5Yf34UeQVgtnly36i8rPScUgp1NI8SzM
	 4xNRG9uspGfSryt7VQe9MxBBkVFKU3usCjFJr2T1SjLDnQCLQBfC65Et+XXLHLy/j/Bwu
	 LOJOJoEpI8O38LSHQFdFSY0XmbZ4U4zBla5E0ahgpjKsZZ0GSrQOPuBKB5c4hquw7hq1W
	 DwmQHcAlKrY1F7dZgtCFw3G5r8r6pewjnLSkPXVQgmnj0HEOnA0cmqNsH+e537BhS6reR
	 02Hm9XtuY4/4Dk7Txm937qhsRA5eOiuOAyj9MEjMDNHGPc0rhDqxlXbqpgJGfp37wYA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793648379;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fILK0wI2UqUr5itU/0Cq58lsYc1ISo7g+t7NVEUk9BU=;
	b=IqqSOozFGVpBmN7WtOSeW2gAfK3fA0U030Tv4Ks6CfB4QVhG3oLt0Qf5sITKBrTPf4yp
	 5YW3SuFpIV6fWDwPqk+RWcoFt3b1VEE6JVSWE20/BuYxxR+GyUUk5cU8Qp2w0P1Yh8N/W
	 4f5kZLRiaHO9jdLQLHpows3366sZ3vDxw35eWRPTx8KjgTwvE0RQaueM0wi4KKpHAFwAW
	 TCgM+a4TorOn391Lm3upCIHpaHKJzymnSHI4BQdTFYiejz2WZU6kK3RIAqbRb2kQxl2Mr
	 bcsElHlecS3vj4r3osctcqzXcl1F7Bh8/MNEEDKkS9BdauX0wM6tK7XHuhaA64UBJcQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paul-moore.com;
	spf=pass smtp.mailfrom=paul-moore.com;
	dkim=pass header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=NhlqvCEA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E62606A32D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:39:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5E62606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=NhlqvCEA
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8a60f90a924so1221719b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:39:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793648378; cv=none;
        d=google.com; s=arc-20260327;
        b=E2vVyTddzNrYXmZnrwyjKuDx4zOVhKRP/g7GXTXkj0rT/79rpQtA/jQ7r3je+xqyu6
         KXWQYqHq0W+y/E8pMHziFQ5PCbwiBEv5OMZSXZIuFL8lYllAMkJPJUp9Ev+PYyca87O+
         1JD+GYJ5+MkgDrtfrT4MSaUjdP5JlzYKJI4VGZrcYAxSUVxLhGGPld50P+XLijGU1Rc2
         MsPSAMeK4cgYEKRXwiuHV4ujAxb5dmZIWw6uWYkVrYUxfGS0fN2jKPVqO6u3Am+yo02l
         nTRngaMbkV4+HG4Voi5aTNat324rvMfogc1r2M9HpBtfSyIkCaOTBuwjrTlcq58Lu4dh
         qbPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fILK0wI2UqUr5itU/0Cq58lsYc1ISo7g+t7NVEUk9BU=;
        fh=lsELnyAreOXvRZZMTuyh610mbXr6iPb5s9lzy/w5znA=;
        b=CQgrgrr/1M9dxPSyRPegySSlV+ek+kFZnJaRlICItmibot3DgDiI5lUP8vLsWiVHIG
         IZg4biLnKP42L8/1WFvyp/bEeTh2REAf601lHeQZsEjOsdj5tTA4r1US4s6tP7eo2Oyf
         oKHDR9jNBWX/bEWTAn0Oi7Qb0dAQgYhylxzn7dc6mSuVBo1rbw4MqaGtxmHhqN/+1Brz
         2rLnOVgNjOeehrJ0uHjv+J4P25AgX0tNM1+kCLrMvLbmSvovB8eL9Xt3Y7IKHDnhexZf
         v4xb1Drn5OaW0mu8+OgINI7h7SFxrbJD4+b7YaaJspvidbpr2Xg49hdNeJo/I9P8ATid
         5YCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1793648378; x=1794253178; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fILK0wI2UqUr5itU/0Cq58lsYc1ISo7g+t7NVEUk9BU=;
        b=NhlqvCEAqNeQh82h66VjeQRCvmLs88bUiMN8vsKnqKJ9wOlSOkwk3pTRZNEo2Wk7dK
         HZv/BWl8uEe1rlLq4Esk4h0lNwnLc7ae2Ug4sIcT0bKI7VrNR03T1LZQUc4K6ZwzXmn6
         He3DDsns3zqXONgEkB7fjVVE0uQ4EfO58HLmbhylcYi+XV4OsEafFtSN66UNdGEqLvGf
         6+P0rp5Bbft2KMHvVeggiGD6wOnDjs5EEn+ovAV85fjamgZf+13AnKK26O49HqVD+JId
         Nx6Te9tI8mE+yrOdmnPFjh4Tt7FpFJqRk8cVNQb3naMOyfjmKyriiJkGVwtVtYKbw4fR
         FC6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793648378; x=1794253178;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fILK0wI2UqUr5itU/0Cq58lsYc1ISo7g+t7NVEUk9BU=;
        b=RNYPQ+EP1+o24PQvxA4S2NcRkUQlf5uk6k+XkFMf0Klt66nJ8woEKY0YZc8GvUxL8n
         m/hZoazx1kjuMPEYcmBydwHw4SnCOFLAmQ5stmhl99n81X3XsiqpT/veaood5fPDNPTo
         cGKaDZ968BRlhw4XJ1pi7yVM6EY6u/ofFVqxYO8aB8QHAe6pMH9NgE6DdpqV7IAZwTYI
         xdnnWeN4PWX5itVI0R+SBMvmCSfS0hTlf6kxZthPTd4QdzRpEj6JMxA0tnPq34NOwLe9
         jKjdOxoUnYYpFYi9AV8rWMsho+K9hveDpIrHLSlVpk+wZKwlgsGrosEQfsOrVdEVbCBL
         wnlg==
X-Forwarded-Encrypted: i=1; AKwUvBwpr/h+YSAjfjBl99DsBoGcBHDzKAkFys7sO3ggBxBZqhicJn5QqxTz7LsigVv6WmDKA+kkc5MXY+iSot8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pmtKgnc5RJ8IQNVKbB2hZb1ld12sGfx65u/S0/8MfSEKjKEnL
	Fplxy9TDvuwCDn5RBFAF3RYy/EBXnC2EN0NVRjv0mIe61y0U+e2ZbuvXKno5ob1jN/4rSnY9p3G
	yxrWJ+f9bHdaGiC0f1CS3x+5pbjAvdN/TXH0mE2TU
X-Gm-Gg: AYBFou2k9fGZspbOeqK8jUzNWLI4k78S4Yo9Mhxr3zsXXtbVgF5ojOif+sLoXLwIzuO
	KaIdJ0xyUnKPH3U0pRydCgfTY1HD95gl3NA7uVDso0ke76Dm3OfYhll/NcPX4vN0NXXlg7FJJxE
	q6Mb/MwjaKT8f3FsEwR800gi2F/oSJhLhlYff+Sr+BLo+FNAYNqTZ+jOaJCTVW93y1/Z+71D/pt
	y3YwJkQHKsw4Zg5izT7KCaH08PS9SuOAhx0T/F4aneMYMxyu2NKS4G5D0SJcigAr+MSWqTTCwYi
	9rrb2Iu9xawMEyL5Q8ownuIx/vN/pjtySwBHGsFdB5YrHw7AWJIEHAZqQ08WR/IYb+wausCy2Fg
	RBISRzlG/k4R38mJ/ejtVhOElfAdX4MWtUIam19+Bcs2GV9yhZKckFGnqs3sMkKK9sQPV
X-Received: by 2002:a05:6a00:3c89:b0:8a0:3307:c46c with SMTP id
 d2e1a72fcca58-8a9bea6b19cmr8445171b3a.36.1793648377853; Mon, 02 Nov 2026
 11:39:37 -0800 (PST)
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
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 2 Nov 2026 14:39:25 -0500
X-Gm-Features: AclHuK_N7t88qS7YSGZ1TxDpP4hXHc3j5T0g0RysETh1DoLdW5UuZOpzEfeNB98
Message-ID: <CAHC9VhRU1WZrsnw4q+vA_pKGGPs6kydHZsLbycWzbN27ygLXdg@mail.gmail.com>
Subject: Re: [RFC PATCH] af_unix: introduce MSG_CMSG_SEALED
To: Stephen Smalley <stephen.smalley.work@gmail.com>
Cc: =?UTF-8?B?T25kcmVqIE1vc27DocSNZWs=?= <omosnacek@gmail.com>, 
	Eric Dumazet <edumazet@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, Jakub Kicinski <kuba@kernel.org>, James Morris <jmorris@namei.org>, 
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

I've only given this a quick look, but I'm also not excited about the
LSM hook being conditional on the "sealed" flag.  I'd prefer for the
security_file_receive() hook to catch all the files, but take an
additional bool argument indicating the sealed state; this would allow
individual LSMs to decide how best to handle this.

  security_file_receive(struct file *file, bool sealed)

--=20
paul-moore.com
