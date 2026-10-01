Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5A63C454F
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 04:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790827655; cv=pass; b=M19wHE2WPcRtHnPwV0uoUWUk5TJSmVLbfqYpTwgTfNQLdLEfJVYoKjpxM+L0iRZpqoxBky8bCZ2ELkP6G89acPyeET3gWQ8rzIsxR/HpD02I3AKhFJiA2vGWejtjyihGtWVVnQLVC4SeXn6zVWZx2FrVAgCf7UU1qF2lXKKEM+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790827655; c=relaxed/simple;
	bh=YkjwWReI3QCWe09zXhFij7zBQpgeEk4qxmf2p0+9+QI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RqcySC+8e7uIZ394LWlXanJC7ceCW700FMsrEnl1v890jWW6/bzZFoPdWDqtVNBELootwSDB1eFD0iFD8TREz64c9q8U1W2IgRK1RPO8n/Km3s4YkUgkUh3Kg1aDHibqnv8C3yl9CbxYl1bVcobvXFGbaxVtm+itw40AGSBL5qk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JV3Z05GU; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JV3Z05GU"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33c0d931083so2314436eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 21:07:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790827652; cv=none;
        d=google.com; s=arc-20260327;
        b=Z7ca3AQVOW4qmBP/tavDRiMFJzyAjwIFE2FvmftRZKLvP+1WqhpvtRvD+wgIvK5j95
         tF8TzSaZfvuD6nV4gEOxLnzGY2ESW0fewc9c3Y87rZV1sCfC6qFPrdYcdVQbheXTntzw
         o95DOwoTFYcBUSoyPMavg2CzfD/0CWqGM7XNXsiLATXDyfbJnWXmvfr6VDe2Tuc9svKP
         Tbl74cn4YforY+5ULeHbnJ6h3bglBdTNIp1PMK189QWiPmVnOp3Y4HD2Re8hqH7VyhWp
         qoTLoZM7RcTAEzhWHnVG05YtnVYIuprHXN37pNe75us4JhxHRPSZnbdLMM4X/vdImLSZ
         z+iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l3eHEQ2bOwj9/vcLYd/rAmE7Mn4xynnjMzE65jNbwTA=;
        fh=oDzOyRS7LDS/2oGQEa5s9yZrYdq6CWbx/xm5Mnr0gJs=;
        b=D2T5XEJn7fAtE/qnWkP41L4d77BRrWaVngjkEcJsYXPQe4rfJK7klvdZ3N5yBbtA6B
         sUl6w1eBQIq6Vbbbp9AtQoPV9nHyscFhAVWmaqDmASKKn4Up1RgwtKVN2r8DCJucLaFR
         VZVUiLj19IffCLv/94EzfobGAD2dSOhNHkqhC93exfhdxC909VPac7PwFyTdaqCixfOY
         Pkve5oqqHjpsPdF16crpHxxjDO5n24dwEaRDIVYTVzPE22zco+sp11+y68S40ze6KBTE
         HxAv2xyM+kfMWrEeHRuc2N/mczU/xxPMiuGxwQFuR6R3GBf3Qx9Kv4Gq6poN/PlZgup8
         krWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790827652; x=1791432452; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l3eHEQ2bOwj9/vcLYd/rAmE7Mn4xynnjMzE65jNbwTA=;
        b=JV3Z05GUW+Y36/wF26IbWgxoD9CNE4bYeY+nw7YMNBKhaowZWnugmdsGUve768KqrJ
         5EeA3T+IvwublPwJxLHD3cJ5I61d45TXmdH1j5kEjgRi+MEkn3vIabiM/RW1lCipWSN1
         vKo2EeCoTrGWYw/1Qe1DkG+pLwvbcC3cCxELCedU3qERXC9Y2oJtgS/vvAPVgCba8s5z
         RhjASzQ61lTPUhAkr2ounEn0X8pGvggeQMIpC96Vy2ydgpMsWPg/nb7u3wvHOD4S4GnX
         Sw4scku6dr6nhQv3RqnGYxK8m8LsW/OH48Q0slDQSvAOnQ+53jINtnr7mCSKBwrQuBCP
         WY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790827652; x=1791432452;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l3eHEQ2bOwj9/vcLYd/rAmE7Mn4xynnjMzE65jNbwTA=;
        b=hzOtyc822UFrgl42W+FWI44zNOUXJGA1md62ZsWXSW9M0NEbBm0CeHnyqM4vxtjWZm
         Or/honKrarfT45eTMtsn9M6Z6jaFkAuIfajsCfcSf6Vy+TiMfnUWYfiip+N3noWacwAd
         r4qNh4uGP3Sy1ZxVZRUlWG0SOweh/RKBvLaaeOGYmC+pb9vSmS7A0LvXqBzU69e/mHsL
         0KZn0l7GcEmUQ/6+I2byexYsPR3yDR3QRccKUmBjlh/z+JNFCbPjLpjJwleu5tAW+lfP
         jDm6Yqyrez7qi3ADlrgV5g4lelryGW3XDY2quBNIdF8PVlmM71YmxGK4Q6TdhkyoEPmX
         LSDA==
X-Forwarded-Encrypted: i=1; AKwUvBw0e3PPLt+s75lVhA7jIF+f2mAwgPdWtYPYdO/weKJPlc1Ym6PCVJswcvJk6Craucj9rfD+YH9mv2uDqv8=@vger.kernel.org
X-Gm-Message-State: AFuF++mXd1lobnyRnVjZVacIKCbhDYT8+vhYMbDykWpxornfx6u4IWs0
	2Dvsyi6wdtI4jofn6F8La1Q/ViI1XVWlorGjLiYat7YJDtuWrZvWf3crAq7dht23pw0X6glnC3z
	q6v8n/UeptQMx/6ePnbFObgJqHZVdNwslV0LdN6bJ
X-Gm-Gg: AYBFou0ogEsUTixsPrb2Xw4DrjedN5FN8yBBOrOV3sah28SWIt9ztgSub2x3lDGcWjB
	SP3/x2waLGBrvxpGFxs3qnRk2OnGqTBITVNY3c1VdB9VJWEmudqpZ9jGzhOZVCI5RimV96uCIYE
	gBj8nVQJMh6eo2XE/vEPHdYyJruq2H6UYKwxMz67G1OMdcfJitewkzam1LKP/Wr9ftnCn4ijWE8
	eeKlaxe+Agnn4c5OO+9M5Ft+Vgpz097NU34HG5x5xuUjuT4Q71t6ySpGEWhbCfiJEe6WN5cGUHk
	JBxtuTUTpKoxCkdQ+4JCv9uTplchEdUkIlP+PLhe3+ajDiURUFp/AKVBtUFK+Ur1YN2M8/+x7qD
	ImPYNct/agTOy1T8lXeybM8nw/SnsZRRKeJ2N3NYwaPzQQBDWvOnflAil05CJK/sNZG9M
X-Received: by 2002:a05:701a:ca84:b0:14c:c588:ac21 with SMTP id
 a92af1059eb24-14dce417c07mr1975649c88.9.1790827650908; Wed, 30 Sep 2026
 21:07:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-work-unix-passpidfd-v3-0-532018a91b21@amutable.com> <20260928-work-unix-passpidfd-v3-3-532018a91b21@amutable.com>
In-Reply-To: <20260928-work-unix-passpidfd-v3-3-532018a91b21@amutable.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Wed, 30 Sep 2026 21:07:19 -0700
X-Gm-Features: AclHuK8CKaHPn8rIHrieWjCFAbNwMyqoXGSxvwRgSsHDQA6Esio0zaSdSQcr7pA
Message-ID: <CAAVpQUDJ=vBuXUSTyURa6-dYbpV8+ZshXW0vcVAgmLsri2A17g@mail.gmail.com>
Subject: Re: [PATCH v3 03/10] net: add SO_PASSPIDFD_THREAD to get a
 thread-specific SCM_PIDFD
To: Andrew Halaney <andrew@amutable.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, 
	Alexander Mikhalitsyn <alexander@mihalicyn.com>, 
	"Christian Brauner (Amutable)" <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 2:27=E2=80=AFAM Andrew Halaney <andrew@amutable.com=
> wrote:
>
> From: Christian Brauner <brauner@kernel.org>
>
> Currently, SCM_PIDFD carries a pidfd for the thread-group leader. A
> broker or the coredump server cannot learn the identity of the specific
> thread that sent a given message. Now that both struct pids are recorded
> a receiver can ask for the specific identity it needs.
>
> So add SO_PASSPIDFD_THREAD as a sibling of SO_PASSPIDFD.
> SO_PASSPIDFD_THREAD delivers an SCM_PIDFD_THREAD, i.e. scoped
> to the specific thread sending. This is completely independent of
> SO_PASSPIDFD, meaning you can use both options and get both cmsgs.
>
> On SOCK_STREAM sockets recvmsg() only stops merging data at a thread
> boundary when the receiver asked for a thread pidfd. For SO_PASSCRED and
> SO_PASSPIDFD receivers all threads of one process remain a single
> writer.
>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> Co-developed-by: Andrew Halaney <andrew@amutable.com>
> Signed-off-by: Andrew Halaney <andrew@amutable.com>
> ---
>  arch/alpha/include/uapi/asm/socket.h  |  2 ++
>  arch/mips/include/uapi/asm/socket.h   |  2 ++
>  arch/parisc/include/uapi/asm/socket.h |  2 ++
>  arch/sparc/include/uapi/asm/socket.h  |  2 ++
>  include/linux/socket.h                |  9 +++++----
>  include/net/sock.h                    | 14 +++++++++++++-
>  include/uapi/asm-generic/socket.h     |  2 ++
>  net/core/scm.c                        | 27 +++++++++++++++++++--------
>  net/core/sock.c                       | 14 ++++++++++++++
>  net/unix/af_unix.c                    | 12 +++++++++---
>  10 files changed, 70 insertions(+), 16 deletions(-)
>
> diff --git a/arch/alpha/include/uapi/asm/socket.h b/arch/alpha/include/ua=
pi/asm/socket.h
> index 946a5fad2691..bb3d534826bb 100644
> --- a/arch/alpha/include/uapi/asm/socket.h
> +++ b/arch/alpha/include/uapi/asm/socket.h
> @@ -157,6 +157,8 @@
>
>  #define SO_RIGHTS_NOTRUNC      85
>
> +#define SO_PASSPIDFD_THREAD    86
> +
>  #if !defined(__KERNEL__)
>
>  #if __BITS_PER_LONG =3D=3D 64
> diff --git a/arch/mips/include/uapi/asm/socket.h b/arch/mips/include/uapi=
/asm/socket.h
> index f1641dde135f..269badcaa086 100644
> --- a/arch/mips/include/uapi/asm/socket.h
> +++ b/arch/mips/include/uapi/asm/socket.h
> @@ -168,6 +168,8 @@
>
>  #define SO_RIGHTS_NOTRUNC      85
>
> +#define SO_PASSPIDFD_THREAD    86
> +
>  #if !defined(__KERNEL__)
>
>  #if __BITS_PER_LONG =3D=3D 64
> diff --git a/arch/parisc/include/uapi/asm/socket.h b/arch/parisc/include/=
uapi/asm/socket.h
> index f3a3815c7dc2..313aee10a52c 100644
> --- a/arch/parisc/include/uapi/asm/socket.h
> +++ b/arch/parisc/include/uapi/asm/socket.h
> @@ -149,6 +149,8 @@
>
>  #define SO_RIGHTS_NOTRUNC      0x4053
>
> +#define SO_PASSPIDFD_THREAD    0x4054
> +
>  #if !defined(__KERNEL__)
>
>  #if __BITS_PER_LONG =3D=3D 64
> diff --git a/arch/sparc/include/uapi/asm/socket.h b/arch/sparc/include/ua=
pi/asm/socket.h
> index 7907f3b1f0ee..bd3e69bcce7a 100644
> --- a/arch/sparc/include/uapi/asm/socket.h
> +++ b/arch/sparc/include/uapi/asm/socket.h
> @@ -150,6 +150,8 @@
>
>  #define SO_RIGHTS_NOTRUNC        0x005e
>
> +#define SO_PASSPIDFD_THREAD      0x005f
> +
>  #if !defined(__KERNEL__)
>
>
> diff --git a/include/linux/socket.h b/include/linux/socket.h
> index 5a5eb1250103..b17fdb7d38a7 100644
> --- a/include/linux/socket.h
> +++ b/include/linux/socket.h
> @@ -189,10 +189,11 @@ static inline size_t msg_data_left(const struct msg=
hdr *msg)
>
>  /* "Socket"-level control message types: */
>
> -#define        SCM_RIGHTS      0x01            /* rw: access rights (arr=
ay of int) */
> -#define SCM_CREDENTIALS 0x02           /* rw: struct ucred             *=
/
> -#define SCM_SECURITY   0x03            /* rw: security label           *=
/
> -#define SCM_PIDFD      0x04            /* ro: pidfd (int)              *=
/
> +#define        SCM_RIGHTS              0x01    /* rw: access rights (arr=
ay of int) */
> +#define SCM_CREDENTIALS                0x02    /* rw: struct ucred      =
       */
> +#define SCM_SECURITY           0x03    /* rw: security label           *=
/
> +#define SCM_PIDFD              0x04    /* ro: pidfd (int)              *=
/
> +#define SCM_PIDFD_THREAD       0x05    /* ro: thread pidfd (int)       *=
/
>
>  struct ucred {
>         __u32   pid;
> diff --git a/include/net/sock.h b/include/net/sock.h
> index 60ea55dc1885..14df0fb68259 100644
> --- a/include/net/sock.h
> +++ b/include/net/sock.h
> @@ -356,6 +356,7 @@ struct sk_filter;
>    *    @sk_scm_security: flagged by SO_PASSSEC to recv SCM_SECURITY
>    *    @sk_scm_pidfd: flagged by SO_PASSPIDFD to recv SCM_PIDFD
>    *    @sk_scm_rights: flagged by SO_PASSRIGHTS to recv SCM_RIGHTS
> +  *    @sk_scm_pidfd_thread: flagged by SO_PASSPIDFD_THREAD to recv a th=
read SCM_PIDFD
>    *    @sk_scm_unused: unused flags for scm_recv()
>    *    @ns_tracker: tracker for netns reference
>    *    @sk_user_frags: xarray of pages the user is holding a reference o=
n.
> @@ -562,7 +563,8 @@ struct sock {
>                                 sk_scm_security : 1,
>                                 sk_scm_pidfd : 1,
>                                 sk_scm_rights : 1,
> -                               sk_scm_unused : 4;
> +                               sk_scm_pidfd_thread : 1,
> +                               sk_scm_unused : 3;
>                 };
>         };
>         u8                      sk_clockid;
> @@ -2988,6 +2990,16 @@ static inline bool sk_is_stream_unix(const struct =
sock *sk)
>         return sk_is_unix(sk) && sk->sk_type =3D=3D SOCK_STREAM;
>  }
>
> +static inline bool sk_scm_pidfd_wanted(const struct sock *sk)
> +{
> +       return sk->sk_scm_pidfd;
> +}
> +
> +static inline bool sk_scm_pidfd_thread_wanted(const struct sock *sk)
> +{
> +       return sk->sk_scm_pidfd_thread;
> +}

nit: remove these helpers and use the values directly.

Unlike scm_has_secdata(), the fields do not depend on any config.


> +
>  static inline bool sk_is_vsock(const struct sock *sk)
>  {
>         return sk->sk_family =3D=3D AF_VSOCK;
> diff --git a/include/uapi/asm-generic/socket.h b/include/uapi/asm-generic=
/socket.h
> index 84ea7b92936e..d1e5c6de146d 100644
> --- a/include/uapi/asm-generic/socket.h
> +++ b/include/uapi/asm-generic/socket.h
> @@ -152,6 +152,8 @@
>
>  #define SO_RIGHTS_NOTRUNC      85
>
> +#define SO_PASSPIDFD_THREAD    86
> +
>  #if !defined(__KERNEL__)
>
>  #if __BITS_PER_LONG =3D=3D 64 || (defined(__x86_64__) && defined(__ILP32=
__))
> diff --git a/net/core/scm.c b/net/core/scm.c
> index 9b9e119c353a..ba43d76027af 100644
> --- a/net/core/scm.c
> +++ b/net/core/scm.c
> @@ -499,11 +499,16 @@ static bool scm_has_secdata(struct sock *sk)
>  }
>  #endif
>
> -static void scm_pidfd_recv(struct msghdr *msg, struct scm_cookie *scm)
> +static void scm_pidfd_recv(struct msghdr *msg, struct scm_cookie *scm,
> +                          enum pid_type type, int cmsg_type)
>  {
> +       unsigned int flags =3D PIDFD_STALE;
>         struct file *pidfd_file =3D NULL;
> +       struct pid *pid;
>         int len, pidfd;
>
> +       pid =3D scm->pid[type];
> +
>         /* put_cmsg() doesn't return an error if CMSG is truncated,
>          * that's why we need to opencode these checks here.
>          */
> @@ -517,12 +522,15 @@ static void scm_pidfd_recv(struct msghdr *msg, stru=
ct scm_cookie *scm)
>                 return;
>         }
>
> -       if (!scm->pid[PIDTYPE_TGID])
> +       if (!pid)
>                 return;
>
> -       pidfd =3D pidfd_prepare(scm->pid[PIDTYPE_TGID], PIDFD_STALE, &pid=
fd_file);
> +       if (type =3D=3D PIDTYPE_PID)
> +               flags |=3D PIDFD_THREAD;
>
> -       if (put_cmsg(msg, SOL_SOCKET, SCM_PIDFD, sizeof(int), &pidfd)) {
> +       pidfd =3D pidfd_prepare(pid, flags, &pidfd_file);
> +
> +       if (put_cmsg(msg, SOL_SOCKET, cmsg_type, sizeof(int), &pidfd)) {
>                 if (pidfd_file) {
>                         put_unused_fd(pidfd);
>                         fput(pidfd_file);
> @@ -539,8 +547,8 @@ static bool __scm_recv_common(struct sock *sk, struct=
 msghdr *msg,
>                               struct scm_cookie *scm, int flags)
>  {
>         if (!msg->msg_control) {
> -               if (sk->sk_scm_credentials || sk->sk_scm_pidfd ||
> -                   scm->fp || scm_has_secdata(sk))
> +               if (sk->sk_scm_credentials || sk_scm_pidfd_wanted(sk) ||
> +                   sk_scm_pidfd_thread_wanted(sk) || scm->fp || scm_has_=
secdata(sk))
>                         msg->msg_flags |=3D MSG_CTRUNC;
>
>                 scm_destroy(scm);
> @@ -586,8 +594,11 @@ void scm_recv_unix(struct socket *sock, struct msghd=
r *msg,
>                 scm_detach_fds(msg, scm, READ_ONCE(u->scm_rights_notrunc)=
);
>         }
>
> -       if (sock->sk->sk_scm_pidfd)
> -               scm_pidfd_recv(msg, scm);
> +       if (sk_scm_pidfd_wanted(sock->sk))
> +               scm_pidfd_recv(msg, scm, PIDTYPE_TGID, SCM_PIDFD);
> +
> +       if (sk_scm_pidfd_thread_wanted(sock->sk))
> +               scm_pidfd_recv(msg, scm, PIDTYPE_PID, SCM_PIDFD_THREAD);
>
>         scm_destroy_cred(scm);
>  }
> diff --git a/net/core/sock.c b/net/core/sock.c
> index d23333bb4f3f..3b5f28573752 100644
> --- a/net/core/sock.c
> +++ b/net/core/sock.c
> @@ -1578,6 +1578,13 @@ int sk_setsockopt(struct sock *sk, int level, int =
optname,
>                         ret =3D -EOPNOTSUPP;
>                 break;
>
> +       case SO_PASSPIDFD_THREAD:
> +               if (sk_is_unix(sk))
> +                       sk->sk_scm_pidfd_thread =3D valbool;
> +               else
> +                       ret =3D -EOPNOTSUPP;
> +               break;
> +
>         case SO_PASSRIGHTS:
>                 if (sk_is_unix(sk))
>                         sk->sk_scm_rights =3D valbool;
> @@ -1893,6 +1900,13 @@ int sk_getsockopt(struct sock *sk, int level, int =
optname,
>                 v.val =3D sk->sk_scm_pidfd;
>                 break;
>
> +       case SO_PASSPIDFD_THREAD:
> +               if (!sk_is_unix(sk))
> +                       return -EOPNOTSUPP;
> +
> +               v.val =3D sk->sk_scm_pidfd_thread;
> +               break;
> +
>         case SO_PASSRIGHTS:
>                 if (!sk_is_unix(sk))
>                         return -EOPNOTSUPP;
> diff --git a/net/unix/af_unix.c b/net/unix/af_unix.c
> index c7d423465859..6cc2873d9a4f 100644
> --- a/net/unix/af_unix.c
> +++ b/net/unix/af_unix.c
> @@ -803,7 +803,8 @@ static void copy_peercred(struct sock *sk, struct soc=
k *peersk)
>
>  static bool unix_may_passcred(const struct sock *sk)
>  {
> -       return sk->sk_scm_credentials || sk->sk_scm_pidfd;
> +       return sk->sk_scm_credentials || sk_scm_pidfd_wanted(sk) ||
> +               sk_scm_pidfd_thread_wanted(sk);
>  }
>
>  static int unix_listen(struct socket *sock, int backlog)
> @@ -2048,9 +2049,14 @@ static int unix_maybe_add_creds(struct sk_buff *sk=
b, const struct sock *sk,
>         return 0;
>  }
>
> -static bool unix_skb_scm_eq(struct sk_buff *skb,
> +static bool unix_skb_scm_eq(const struct sock *sk, struct sk_buff *skb,
>                             struct scm_cookie *scm)
>  {
> +       /* Only a thread pidfd receiver can tell threads of one process a=
part. */
> +       if (sk->sk_scm_pidfd_thread &&
> +           UNIXCB(skb).pid[PIDTYPE_PID] !=3D scm->pid[PIDTYPE_PID])
> +               return false;
> +
>         return UNIXCB(skb).pid[PIDTYPE_TGID] =3D=3D scm->pid[PIDTYPE_TGID=
] &&
>                uid_eq(UNIXCB(skb).uid, scm->creds.uid) &&
>                gid_eq(UNIXCB(skb).gid, scm->creds.gid) &&
> @@ -3033,7 +3039,7 @@ static int unix_stream_read_generic(struct unix_str=
eam_read_state *state,
>
>                 if (check_creds) {
>                         /* Never glue messages from different writers */
> -                       if (!unix_skb_scm_eq(skb, &scm))
> +                       if (!unix_skb_scm_eq(sk, skb, &scm))
>                                 break;
>                 } else if (unix_may_passcred(sk)) {
>                         /* Copy credentials */
>
> --
> 2.55.0
>
