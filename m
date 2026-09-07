Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E907046AA98
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778205; cv=pass; b=plvkU9nceqtLrL02osdpTGJ/SFIUFzuBBbsNHCJe1735WhBUI28uLP3iKiTPm9/aSIoRiNQymwI134765uWNLIHDaQdgObWV7gtrUo2TROY6u3CzI1c+GmG24/hTqSeBEWOzXXmkZRNLDemv53B6yBk5PIZWExbvr++dgoK1KIo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778205; c=relaxed/simple;
	bh=m2lih3NNM3nXZvl36JBb7wUDN3xChnmzMRftKfii0Ec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J2S5FufrqRcnUY27JGM3PlP7uBxCxhEh4MnFtFHAwDUlQ0smIdf00E2aZ4yBXF2Ti6hEQDwI8eY7jRrVUu/pYz79rauexiuLr/Zw2oS1Iu/9bzXa9+f5wfSGzgR35XlvYM+zQoLibMm5rLMY1796c+gn2FEyBZq41FlCASrOVn8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mihalicyn.com; spf=pass smtp.mailfrom=mihalicyn.com; dkim=pass (1024-bit key) header.d=mihalicyn.com header.i=@mihalicyn.com header.b=Pu5lgoDn; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mihalicyn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mihalicyn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mihalicyn.com header.i=@mihalicyn.com header.b="Pu5lgoDn"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c2531f453eeso453050766b.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 03:50:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788778201; cv=none;
        d=google.com; s=arc-20260327;
        b=nOS15B9qkn4w+rwdyovddEM1Jz8O/S/t67u6kBWrNsB3FMdDMVH8DEh8lej2u8GReT
         8FErtI7Fs9m1GAsTNq0LSU44sINJEDqcTZ5E4nFuycn5XU6YWgrd9p7wtLT+OHvUnzIG
         F9351CgrLlQnK5RhuK1X9pPREjKxN8J4Zc+epwB8ygMGx+wO0iffhw0/1kDDG19LEQro
         GJaH5oq5vgU3c/Gbxpz8DD7nd7xaZUJcQQBbf5gwAotn0jfagwhl8CUQ4DGWNU/e/DIM
         rXgR1XwVzILgEYvaQDFP59T9kgVdLRb3eb8xdhI/Cg6zr8f8tHi/kp0l/1T0JcA8Egqz
         dgeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pfguWzPzl853yJtKqzuKDZlU916kkLOBY67tJF8BgOw=;
        fh=cStw7nZnIltgiQu7ucBtHZG+uvjmfCHD31n2nD7H4EM=;
        b=S3w0INAZtXMROjKvVC2bKsHjJAezBuYZxujIepIZ+INpvcFQ75Ss4SjPb75LXnjVoO
         rIhsecO5ZUVo9dUfuzDuy0Iq6GNKjn4VgHBeRkYARz1qO87wz4UgmZm23llIcx1pE8rf
         4RE2jR2Cq/adFoBcq/THNj3oVSpriHyfrYEDp3NtsVUXm3bbY88aWvui+DKDLXoPfR6+
         qU7SR8JVU7DWQkESoGACwNumozqiUAdqtVdpuZH6AztrVr/UF0nVs+g0Jzf++a25rcja
         J9koY86VobdPU0V832wAvT3Q8t9uwJXwx5tNBwfXJcVz7sy265gvgqd+ftLe61QvgCy8
         tsxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mihalicyn.com; s=mihalicyn; t=1788778201; x=1789383001; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pfguWzPzl853yJtKqzuKDZlU916kkLOBY67tJF8BgOw=;
        b=Pu5lgoDn/s8jglQTDKn/xOiSFI0BW86Brjgke+/IRuVylk89kYPoqL/KMCfiDJOVyW
         HknKYo5kWB2oKPxlpMUehS47KJ+wHpbEKNtM9dXYciXK3dZ/oXiHIvfUKrjwvIN/frjE
         wjLg6aR14MJzeEHvRv0Jq/Q5VYy4AgJkoSqaM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788778201; x=1789383001;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pfguWzPzl853yJtKqzuKDZlU916kkLOBY67tJF8BgOw=;
        b=aG/Y/ptjQ0wfcRQLeUOT8tv7gb/7V8tJkkUovRDIAtLxWl613o/T0QiJvWjPVvr7Uy
         gyrGmeZiGby31s1eNZXrtVdoM9jcpYWwFMqMStvnsCTZeGE7jt6n9aQod/eEoCMJIyY5
         FsbVl14rQtoNgKFPbT96lDlLmeO1t64zw9AQXnQbikAFktyNXFA5nm5spWbY588LireZ
         GbJr4hb8qB8gjkY6worORJA5g0rQMPQDDlC001QPxtQsYKQa3OeUVTh9Zm8gt7YfSGHH
         +GZ3UcVRXzz6uR86wPNYjPq1uASdIl5xjUip2M4Zu8b08g9zkgasGF4guWFTHVq9n3/+
         LKKw==
X-Forwarded-Encrypted: i=1; AKwUvBzi4MpW2Gp6wNeAri1mTyxd9iCRYgcATM65EI3L8gH8Hn2mz7bj9sADNH30FaFNqJU2hnQ1I+o6ysU31aM=@vger.kernel.org
X-Gm-Message-State: AFuF++mB5MiJiTSyAmGsYT19tTYw3OzoIGytRT0+1p2pcQO7WVsjZuXf
	0/mLOk09yNHrV6ZfWFN9ORpBY1xiqLJtJPGIlrm94M28iTJ2DNyNop88RgyVnOWgAGuu20dQ9F5
	kBxl5zgSJsk6bZLcpn2vH9NKWuQTZti0xBWAe+oUaLg==
X-Gm-Gg: AYBFou2bCj0wObxM6kMbPjwBo/G2RlJp/OY7qQAcrp43GuyTQNmABRUYQSd2z+e/HmH
	lejE44iVPbjIrTlEJ3wb2bcRnT36OceqRntGPRhLNGJ0aoxo9yiLt9Gav8vUPH+BdulE2PFgYa6
	T9zDiP9XYkUM02wwXMJ5uYdtXCD+Qg3cerVAEyNIfkMmB7KFp/99Rn0aQKn5613yVri4PcP/7pK
	I7h6Y60Pi2RwDMgSsdpqqtr/C4TYVVHQeuE8NXwdMx60we+8GF+E1aEMW++/k7P8N4JTnURM8f1
	F1kiWDSjQF2RXHvjoBaqdM8SXd8QsYBPY4UikkoqutEAFBen/0e0vyMPsSzm/Rn9lCfH0Ua0cZC
	dIXFslvx3Yw==
X-Received: by 2002:a17:906:7956:b0:c16:84dc:9607 with SMTP id
 a640c23a62f3a-c260ca323dcmr1544501166b.19.1788778200417; Mon, 07 Sep 2026
 03:50:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831-work-unix-passpidfd-v1-0-70cbfda0c7ba@kernel.org> <20260831-work-unix-passpidfd-v1-7-70cbfda0c7ba@kernel.org>
In-Reply-To: <20260831-work-unix-passpidfd-v1-7-70cbfda0c7ba@kernel.org>
From: Alexander Mikhalitsyn <alexander@mihalicyn.com>
Date: Mon, 7 Sep 2026 12:49:48 +0200
X-Gm-Features: AcwNN1XRQbjmt8u40rEyLnoiU1YqH4VMsoGBtHpWSXaJltkwr5aTgGVxP_BPxtc
Message-ID: <CAJqdLrr5PfwH2z6x-HK0z7bHGD0UQDY6QoY5Y=tmwcd_QQnO7A@mail.gmail.com>
Subject: Re: [PATCH 07/10] net: add SO_PEERPIDFD_THREAD to get a
 thread-specific pidfd
To: Christian Brauner <brauner@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, Oleg Nesterov <oleg@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Am Mo., 31. Aug. 2026 um 13:21 Uhr schrieb Christian Brauner
<brauner@kernel.org>:
>
> SO_PEERPIDFD hands out a pidfd for the thread-group that called
> connect() or socketpair(). Enable workloads such as the coredump server
> or a broker to get a pidfd of the specific thread that connected to the
> socket.
>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

LGTM

Reviewed-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@futurfusion.io>

> ---
>  arch/alpha/include/uapi/asm/socket.h  |  2 +
>  arch/mips/include/uapi/asm/socket.h   |  2 +
>  arch/parisc/include/uapi/asm/socket.h |  2 +
>  arch/sparc/include/uapi/asm/socket.h  |  2 +
>  include/uapi/asm-generic/socket.h     |  2 +
>  net/core/sock.c                       | 87 ++++++++++++++++++++---------------
>  net/unix/af_unix.c                    |  1 +
>  7 files changed, 61 insertions(+), 37 deletions(-)
>
> diff --git a/arch/alpha/include/uapi/asm/socket.h b/arch/alpha/include/uapi/asm/socket.h
> index bb3d534826bb..5d3524c26b2b 100644
> --- a/arch/alpha/include/uapi/asm/socket.h
> +++ b/arch/alpha/include/uapi/asm/socket.h
> @@ -159,6 +159,8 @@
>
>  #define SO_PASSPIDFD_THREAD    86
>
> +#define SO_PEERPIDFD_THREAD    87
> +
>  #if !defined(__KERNEL__)
>
>  #if __BITS_PER_LONG == 64
> diff --git a/arch/mips/include/uapi/asm/socket.h b/arch/mips/include/uapi/asm/socket.h
> index 269badcaa086..245a43f52fb1 100644
> --- a/arch/mips/include/uapi/asm/socket.h
> +++ b/arch/mips/include/uapi/asm/socket.h
> @@ -170,6 +170,8 @@
>
>  #define SO_PASSPIDFD_THREAD    86
>
> +#define SO_PEERPIDFD_THREAD    87
> +
>  #if !defined(__KERNEL__)
>
>  #if __BITS_PER_LONG == 64
> diff --git a/arch/parisc/include/uapi/asm/socket.h b/arch/parisc/include/uapi/asm/socket.h
> index 313aee10a52c..f23710e1c671 100644
> --- a/arch/parisc/include/uapi/asm/socket.h
> +++ b/arch/parisc/include/uapi/asm/socket.h
> @@ -151,6 +151,8 @@
>
>  #define SO_PASSPIDFD_THREAD    0x4054
>
> +#define SO_PEERPIDFD_THREAD    0x4055
> +
>  #if !defined(__KERNEL__)
>
>  #if __BITS_PER_LONG == 64
> diff --git a/arch/sparc/include/uapi/asm/socket.h b/arch/sparc/include/uapi/asm/socket.h
> index bd3e69bcce7a..b35b25bdefc2 100644
> --- a/arch/sparc/include/uapi/asm/socket.h
> +++ b/arch/sparc/include/uapi/asm/socket.h
> @@ -152,6 +152,8 @@
>
>  #define SO_PASSPIDFD_THREAD      0x005f
>
> +#define SO_PEERPIDFD_THREAD      0x0060
> +
>  #if !defined(__KERNEL__)
>
>
> diff --git a/include/uapi/asm-generic/socket.h b/include/uapi/asm-generic/socket.h
> index d1e5c6de146d..56fed7ab27ab 100644
> --- a/include/uapi/asm-generic/socket.h
> +++ b/include/uapi/asm-generic/socket.h
> @@ -154,6 +154,8 @@
>
>  #define SO_PASSPIDFD_THREAD    86
>
> +#define SO_PEERPIDFD_THREAD    87
> +
>  #if !defined(__KERNEL__)
>
>  #if __BITS_PER_LONG == 64 || (defined(__x86_64__) && defined(__ILP32__))
> diff --git a/net/core/sock.c b/net/core/sock.c
> index 6ada7e7eb7d7..cb2ffd329bc6 100644
> --- a/net/core/sock.c
> +++ b/net/core/sock.c
> @@ -1743,6 +1743,50 @@ static int groups_to_user(sockptr_t dst, const struct group_info *src)
>         return 0;
>  }
>
> +/* Hand out a pidfd for @type of the socket's peer via SO_PEERPIDFD*. */
> +static int sk_getsockopt_peerpidfd(struct sock *sk, enum pid_type type,
> +                                  sockptr_t optval, sockptr_t optlen, int len)
> +{
> +       struct file *pidfd_file = NULL;
> +       unsigned int flags = 0;
> +       struct pid *peer_pid;
> +       int pidfd;
> +
> +       if (len > sizeof(pidfd))
> +               len = sizeof(pidfd);
> +
> +       spin_lock(&sk->sk_peer_lock);
> +       peer_pid = get_pid(sk->sk_peer_pid[type]);
> +       spin_unlock(&sk->sk_peer_lock);
> +
> +       if (!peer_pid)
> +               return -ENODATA;
> +
> +       /* The use of PIDFD_STALE requires stashing of struct pid on pidfs
> +        * with pidfs_register_pid() and only AF_UNIX were prepared for this.
> +        */
> +       if (sk->sk_family == AF_UNIX)
> +               flags |= PIDFD_STALE;
> +       if (type == PIDTYPE_PID)
> +               flags |= PIDFD_THREAD;
> +
> +       pidfd = pidfd_prepare(peer_pid, flags, &pidfd_file);
> +       put_pid(peer_pid);
> +       if (pidfd < 0)
> +               return pidfd;
> +
> +       if (copy_to_sockptr(optval, &pidfd, len) ||
> +           copy_to_sockptr(optlen, &len, sizeof(int))) {
> +               put_unused_fd(pidfd);
> +               fput(pidfd_file);
> +
> +               return -EFAULT;
> +       }
> +
> +       fd_install(pidfd, pidfd_file);
> +       return 0;
> +}
> +
>  int sk_getsockopt(struct sock *sk, int level, int optname,
>                   sockptr_t optval, sockptr_t optlen)
>  {
> @@ -1938,45 +1982,14 @@ int sk_getsockopt(struct sock *sk, int level, int optname,
>         }
>
>         case SO_PEERPIDFD:
> -       {
> -               struct pid *peer_pid;
> -               struct file *pidfd_file = NULL;
> -               unsigned int flags = 0;
> -               int pidfd;
> -
> -               if (len > sizeof(pidfd))
> -                       len = sizeof(pidfd);
> -
> -               spin_lock(&sk->sk_peer_lock);
> -               peer_pid = get_pid(sk->sk_peer_pid[PIDTYPE_TGID]);
> -               spin_unlock(&sk->sk_peer_lock);
> -
> -               if (!peer_pid)
> -                       return -ENODATA;
> -
> -               /* The use of PIDFD_STALE requires stashing of struct pid
> -                * on pidfs with pidfs_register_pid() and only AF_UNIX
> -                * were prepared for this.
> -                */
> -               if (sk->sk_family == AF_UNIX)
> -                       flags = PIDFD_STALE;
> +               return sk_getsockopt_peerpidfd(sk, PIDTYPE_TGID, optval, optlen, len);
>
> -               pidfd = pidfd_prepare(peer_pid, flags, &pidfd_file);
> -               put_pid(peer_pid);
> -               if (pidfd < 0)
> -                       return pidfd;
> -
> -               if (copy_to_sockptr(optval, &pidfd, len) ||
> -                   copy_to_sockptr(optlen, &len, sizeof(int))) {
> -                       put_unused_fd(pidfd);
> -                       fput(pidfd_file);
> -
> -                       return -EFAULT;
> -               }
> +       case SO_PEERPIDFD_THREAD:
> +               /* Only AF_UNIX records the peer's connecting thread. */
> +               if (!sk_is_unix(sk))
> +                       return -EOPNOTSUPP;
>
> -               fd_install(pidfd, pidfd_file);
> -               return 0;
> -       }
> +               return sk_getsockopt_peerpidfd(sk, PIDTYPE_PID, optval, optlen, len);
>
>         case SO_PEERGROUPS:
>         {
> diff --git a/net/unix/af_unix.c b/net/unix/af_unix.c
> index d01ee76c8026..563d9827c5cc 100644
> --- a/net/unix/af_unix.c
> +++ b/net/unix/af_unix.c
> @@ -1056,6 +1056,7 @@ static bool unix_bpf_bypass_getsockopt(int level, int optname)
>         if (level == SOL_SOCKET) {
>                 switch (optname) {
>                 case SO_PEERPIDFD:
> +               case SO_PEERPIDFD_THREAD:
>                         return true;
>                 default:
>                         return false;
>
> --
> 2.53.0
>
