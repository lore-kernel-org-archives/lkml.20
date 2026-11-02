Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793632469;
	b=HRpPxeeJfGdAH+GJRUb+H6zgQz+vP7zF0T/eD8R0p9SClE8zELQ+GkS/5U/eEtxW5vrz
	 6X/XcGfNxFDXCjKAhPjZmH/MyR9KSEVo7GUgod54r73v+Lu1UzJAS1PuAObmakh1D2Sa/
	 siEOCs7WdMxKTBhCgGVgRoWJ2SH9npcio8nV4f/rMNLC6A385oEnzWOEuisxOI4d+CNWH
	 3X+d3atd2HWfybhNhczdU38moMRfhsBvtx01qvpb+M2CuXq5ZqiNiVgWAuqziZ4Zv5H3T
	 E0Q1Jp85bFSL+qTIZPjCHM4V42YZPwiKsKx+pO5PdqF+IXoXX1XEF0ACDgO7N7O8uZg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=aOdCxZO55hUw/6I077tI6EL/o28ur2wlUbUGRR4UyJU=;
	b=nph7WXTaJIoX+ncTsRJeYo7/RASAdwzcIm8ER+0Ju9FjfzelNY1sc+7ibDofo/fC/Hm9
	 MvAxrukwvpzBmEDbaH8TEx2dPU7QZaze1+LgyAeHx1bfj/yC2ZqM+33joyXrF5eNqEYMW
	 G7tAFqUVPPPwRbeNmVoLIkiSh5Gc6AiLlULK/aKxs5bIJGZQwD6CAQ2320kycKZTGeg9g
	 2EsXz6A9lDj5fVP2JVWbOqoLjsBodl4EXo3Ph9G7WDKLCPTFmXDKZjQIr95oz8hB1vIXq
	 P9Gyp5cgc8iOkEMZ/UkeSop1ut5/bb9AUEqu1d96WS2JhFMrVEx2UND0KhaSplZCxrw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="UK/Ov2Zm";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB506079931
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:14:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AB506079931
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UK/Ov2Zm
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-67b9bd530b7so2053947d50.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:14:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793632468; cv=none;
        d=google.com; s=arc-20260327;
        b=I7xYCwt0F4IWXt7ipFoJgzj8L/PNiDHpJnD9wYtu1oaoYqo1UEFITrwN/1L0rHwM44
         h3v2WGSAP3NubS7k2CJYbaoNMdgdI4QT8MuIS25kaO13Qc2tOV/VNlZZPhGMWRBNKL4R
         ZYRO2NP5dVk2/0wYnkznw4B0urLQjKuLvDGK2CKQArdPJ4hSjugVqnd/REauBbmVejtL
         dq2FEvxqwEK3GbslMMvIbg6y/zDaBljo65MWjqRnMrr1E3NfcQylsj1fNob7bpgaEDhK
         kMaXFf6beUpbTHCB/4knPJne4BOrFwehi40LC5IJTCT4vd0ZuXYXiQaI0FBzJnL47UKf
         lHMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aOdCxZO55hUw/6I077tI6EL/o28ur2wlUbUGRR4UyJU=;
        fh=tpQUs/JlHtuBlP8mbCnJdfoBEJjhyzvdIyM2GWjbshc=;
        b=iFyyHEOdXwJJGSRmyj9OmaEz7m+L+cznxzU1BIVgdu26wyiVB17H+kF9EHY74isadU
         8be1EJQjQc/qpbw5LhcowQCBrN8tZSOXlHWxZSsk3hB9umIsWm0d8x8bpwqPXlBmBhia
         0dEz1j2srn7neYNvUG2eYz0306r2GPdzD92zCRmmErAAm1md4kL5Yx9M1U/UJpPJuU9M
         ks+Z+wu5x+UYDP60s/Trm5yQixUHEJlF8DOca6EaCBGVhN+e4UdR/SM0AvX0nJfR8/lw
         U+eaI4t6zxER7MiX+ZOeZDGOj8CbcqiGk1butQsQCCyLMxguNwcMryHJLLH6bBlfGIwX
         HJAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793632468; x=1794237268; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aOdCxZO55hUw/6I077tI6EL/o28ur2wlUbUGRR4UyJU=;
        b=UK/Ov2ZmZrdzn6wtpyN4IuP0s2NI94uQI7yYBJibP6aHf1CPcffmPVYaLkzYSc7pZm
         Q+awmbVw7SIAx9igzH2GxMbpkJkUZWNm5FYtB1KlYDTmR1d4BJDrwn+eZuXuDN3hfkKi
         wic6ZSVgM3Y1UqylgTszFO6RuIHOCzlfX7DyBHr6w+fBZfeaHkL3L5lbBc4iRYJCXspt
         9pzWytIy2fjqQ7RVqjA8Iyg0vs6YCR+ISjcat8IZewOZC+HDkTF+GC7SBwr94lTftIlb
         iXOhyfTyOpSiHWGkM8CQhvl9wo0AmvYC/zHu1qJMn7diEAHe+U1q3JmLq16spCqaJO9l
         ToNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632468; x=1794237268;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aOdCxZO55hUw/6I077tI6EL/o28ur2wlUbUGRR4UyJU=;
        b=mNr4JtwsjFLcQs59Z2n6CeMM32ggI5uxh9296K7lz6dkk/Wm87mfFSOTG0YbFlSsor
         Er7vuP/Vf0pTpkDN3zj7i4c5ZF8wtsGoUVE8AjQeCwZ5M5fMrfe0Wi0NrEaV2cePx8ED
         nRrxmsABoku+jII4QVBSQKJTnS5aGdVAKYcPQvWecd6x0w2A3jC658CMiiLG9zp1PU13
         l7lu0BNF+QVV1ftqbNHZR6V6rMIEHnAUzEwePhWjWDCwWEgdwzfcJAq2l6QC4XtuER55
         ihGFSoVHFT1yU1ydtaYhAP81DSP70I63m6qya54+4T6k569Qgmws/RCZFcp2Jv5Hb66D
         j0eQ==
X-Forwarded-Encrypted: i=1; AKwUvBwulLnkDl5dyRCwWa/KWRPbBEl8+WH2EMzypNsej6dYAxU0c0e01F2SYZznvZxmtWqwH39eTp/lqOABXQw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lD+zXYCkJn8UUIL//zsLWtHMCxOpziYQSCwz38NVo4h0c36Fu
	cd9THhbUCs50twCuqrQwSOOCF7YiD+4LuXjxYxGLbpIA2CiyuYPkLwlsZCvIYMnXYIj327IAKaU
	rHFeWH/opMiTxOqKCyMWXHXgR+c5BCFY=
X-Gm-Gg: AYBFou197YPRDiS2p4mFPkdvtQdlgZXKUjzX7QmkjrKNne6YhJhvglIfu+SBjdZiSEY
	U0q0PDHain/2GGeIvQnwvyF32CyRhmS5vDnp5HfSbawk3/CoDGu1Gdj3oaEMfBbc1p6+8hUq7z7
	08GZIJJMdnMd77OsXH+3clZd0nGMV63oAZRVagJjf1txcCTejqGgQ9q8OEhaXy3xkj19lcVgdgF
	CzfeO1JdSmPePPlrfjUgdR7rFHFNOUJHCjQEY0T4DSuwuzOkfRHZKcVEhK+z3bGyoKrwO+8z8m/
	nktxCD3ac4rhAHIrSAeHdkcKvS76Me9UXMRrk4L6rnXOY3sQDvA9mj4hzEB5VHTnKRszQGbnv1p
	dX158Hwqp3vDQPvTdgsgEPFXHKN8eyFXUkFhtJWoHJo78ejRFBZCtAHthA6DzEYLMAfRW12NENI
	N6b39xLcfT9sUe9PwoFvSrs2v0AAhKUUD4U30eCBpQLMEYR0AqYdT0sEl6ZA==
X-Received: by 2002:a05:690e:1201:b0:679:28ad:d8d8 with SMTP id
 956f58d0204a3-67ba5118897mr8055833d50.104.1793632468374; Mon, 02 Nov 2026
 07:14:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102130540.252894-1-omosnacek@gmail.com>
In-Reply-To: <20261102130540.252894-1-omosnacek@gmail.com>
From: Stephen Smalley <stephen.smalley.work@gmail.com>
Date: Mon, 2 Nov 2026 10:14:17 -0500
X-Gm-Features: AclHuK_S3LwuvSZEIcs1e2WEC4WgX3S0M8bKoabDzHzf2mxELuht56K17Z9rPEg
Message-ID: <CAEjxPJ4hxdvV-r8chmF3RAi9RJX=-4AqntG01=fWUhh4-xP+ew@mail.gmail.com>
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

On Mon, Nov 2, 2026 at 8:05=E2=80=AFAM Ondrej Mosn=C3=A1=C4=8Dek <omosnacek=
@gmail.com> wrote:
>
> Currently, when a process receives a file through AF_UNIX's SCM_RIGHTS
> mechanism, the security_file_receive() LSM hook is calledto allow LSMs
> like SELinux to validate the receiver's access to the received file
> (similarly to a process inheriting file descriptors through execve(2)).
>
> However, there are cases (such as dbus daemon/dbus-broker) where the
> receiver doesn't intend to access the received file and merely wants to
> forward it to a third process. In this case the forwarding process would
> need to have the appropriate r/w access to the file in order to receive
> it, even though it will never actually acess it. That leads to the
> security policy having to grant the forwarder access to a potentially
> wide range of files (in case of dbus-broker basically all files), which
> is not ideal.
>
> This patch adds a new CMSG flag MSG_CMSG_SEALED that, when passed to
> recvmsg(2), wraps any received files into an opaque anonymous inode with
> the name "[envelope]", skipping the security_file_receive() LSM check.
> The returned "[envelope]" file descriptor can't be used in any
> meaningful way other than being passed forward via sendmsg(2) with the
> MSG_CMSG_SEALED flag. In that case the original file is unwrapped and
> sent via SCM_RIGHTS to the receiver. The receiver can then either
> receive the file as normal (subject to the LSM check) or again "sealed"
> in the "[envelope]" anon inode for further forwarding.
>
> Note that sending the "[envelope]" file is only allowed with the
> MSG_CMSG_SEALED flag set, to make the unsealing explicit and avoid
> unexpected behavior. Attempting to send it without this flag will fail
> with an error. This also avoids recursive nesting of "[envelope]" files,
> which would only make this feature harder to audit for possible issues.
>
> This patch also adds a simple read-only sockopt for UNIX sockets that
> allows userspace to determine if this feature is present (passing
> unknown CMSG flags unfortunately doesn't lead to an error currently).
> The minimal code to do so can look like this:
>
>     #ifndef SO_RIGHTS_SEALED_SUPPORTED
>     #define SO_RIGHTS_SEALED_SUPPORTED 88
>     #endif
>
>     #include <sys/socket.h>
>     #include <unistd.h>
>     #include <stdbool.h>
>
>     bool MSG_CMSG_SEALED_supported(void)
>     {
>         int sock, ret;
>         socklen_t optlen =3D 0;
>
>         sock =3D socket(AF_UNIX, SOCK_STREAM, 0);
>         if (sock < 0) {
>             /* handle error */
>             /* ... */
>         }
>
>         ret =3D getsockopt(sock, SOL_SOCKET, SO_RIGHTS_SEALED_SUPPORTED,
>                          NULL, &optlen);
>         close(sock);
>
>         return ret =3D=3D 0;
>     }
>
> Related: https://github.com/fedora-selinux/selinux-policy/issues/3286
> Related: https://github.com/fedora-selinux/selinux-policy/issues/3287
> Signed-off-by: Ondrej Mosn=C3=A1=C4=8Dek <omosnacek@gmail.com>
> ---

> diff --git a/net/core/scm.c b/net/core/scm.c
> index ae38f3c1165c..08822b2a1f22 100644
> --- a/net/core/scm.c
> +++ b/net/core/scm.c
> @@ -114,10 +127,29 @@ static int scm_fp_copy(struct cmsghdr *cmsg, struct=
 scm_fp_list **fplp)
>
>                 if (fd < 0 || !(file =3D fget_raw(fd)))
>                         return -EBADF;
> -               /* don't allow io_uring files */
> -               if (io_is_uring_fops(file)) {
> -                       fput(file);
> -                       return -EINVAL;
> +
> +               if (sealed) {
> +                       /* Only allow sealed files */
> +                       if (file->f_op !=3D &envelope_ops)
> +                               return -EINVAL;

This leaks a file reference.

> +
> +                       file =3D (struct file *)file->private_data;

This fails to take a reference to the underlying file but will later get fp=
ut().

> +
> +                       /*
> +                        * No need to check for io_uring files here as th=
e
> +                        * underlying file had already successfully passe=
d the
> +                        * check when it was first sent.
> +                        */
> +               } else {
> +                       /* Don't allow sealed files */
> +                       if (file->f_op =3D=3D &envelope_ops)
> +                               return -EINVAL;

This also leaks a file reference.

> @@ -365,18 +398,37 @@ static int scm_max_fds(struct msghdr *msg)
>  }
>
>  int scm_recv_one_fd(struct file *f, int __user *ufd, unsigned int flags,
> -                   bool notrunc)
> +                   bool notrunc, bool sealed)
>  {
> +       struct file *f_received;
>         int error;
>
>         if (!ufd)
>                 return -EFAULT;
>
> -       error =3D security_file_receive(f);
> -       if (error)
> -               return notrunc ? put_user(error, ufd) : error;

Design point: I would suggest adding and using a new LSM hook that
allows security modules (like SELinux) to still be able to check a
(new) permission that governs whether a process can pass along these
sealed fds so that we do not entirely lose control over their use.
