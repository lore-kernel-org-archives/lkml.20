Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794577741;
	b=AgQQH7A1Wk8ut2Kp0O168o2cSQqRUOwgozueAAAnF3hrtmNUWTdhp2046L5ZtgIj1cbi
	 X13WbqLHQAVhjIcuuODNiLD1H1VYQWNuKZhWWgFeSpzFj/SxAB3Ey4U9NWwOfmB9XYdRt
	 ieY6QYeTTrvuv878r9hT1Yspt+ShtvTH0BtZWcjX9ml6/hptMwBgAbt2rf/2SARK+Atlh
	 W1lOok+NUCXxA+wC4uaJPT1gGD+An+eyrC0i3csEWrDP4hobRfzooMN2UjwGp9w3S86XV
	 kmcosTmskW9xQqIrixR2CfC6EHP8XlfSXsd7ROPW9ZMnkT9zbuMM0jRpfSUZmkCyf4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1bhPViXt1pRD/+G0cozJg3X1gM1h4MG3wea7XTuXsrc=;
	b=ta3usg/C2W/34MColx8v+MSWQnAcEOCkxbckbf3b92VmG2PknAvKwukMlyDogLNak4Ov
	 CCR36lDYPDYLvyJmRVbIaoo++tsYHT/PJBcochpPUD68h+WMhdjZ9dHSFDEnjxHvMqgMa
	 XTk7jyacNf0iAeXg2pVjE8EhZdsc9b2waQxrUxHWuJxUIu7Y8kYR327mwOmWc4n8L4xQg
	 3aDd5MakZLRIqBxjcb+3kqZlaYH5zXG4CdKVjEK1PXU71Ss6vSXrKsLp8mIDsGodSEhBI
	 RojeOG6xsbcXyxChfz1Ft8o3uYTIgQJnRNvPdtOoTkzRGsOnBm1Wki7SgGiuW8uFXFQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IDaBJi6E;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3537260A260C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:49:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3537260A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IDaBJi6E
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a9f9473029so1421194b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:49:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794577739; cv=none;
        d=google.com; s=arc-20260327;
        b=GQMbxi/U9NTdFnJpWQ1fjrgaDo8eL2+n46WdputEGwgm6dkYa05wj3+GuoMrA1huRR
         ZaIbKDbPJa0PlvLiZNDbKnJR6m/fMzV8Y1b0ywlA1lFF1bKiUazJl8uK8alCN7rtu5Wd
         dKslAMvo5w4qPHiL1EiWaOzVhKUy7pvEQu9Ln9zlAkvje8T9mnBxYsaUlQ3lXIzy/sl3
         cLNwLn/oJw7fZh4LtPUpHmT7bRCBTM6cmOglrTxq1WjIlUQeD64JsHi+m5L6u7x7N85/
         esN7NaSmAt4CRtIyijWudfAvIAGg9NKfHiwX9/4ieyK1h2/LhBOYBlFJF/qS9bSXxrcc
         PF/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1bhPViXt1pRD/+G0cozJg3X1gM1h4MG3wea7XTuXsrc=;
        fh=vyrQF4IOPacQYdZOhE3hVJ+jsaTUbLle8BsbUbZaJ+k=;
        b=gqo1gkD+7X1903THeEIFL4Yj4/8AxFlYPbK7P1bTy31xEvgqK4DoniozBvPxW0YvSR
         cb7gBpNo/9dPPKUmqcWVYddzQqnAje9AaLWUyYUy8dpgzNCgn6l/LHtiPDxQK4hvTeIK
         r1GL/NAIn4ok1Ql3c9ghifGthDamNw3xqtGU6I40U79ixvv+3AYPzhUKlGpGP6tcZeci
         ubR3OyZn2VLDYH3Z4orI6va8xuZvY/pskN57DS5RAWSTy5n6hhL+M0ii9w8GVq/c+2jJ
         WrV4V0bqyAQU55ekT/zTrjsMIKoIpadp7VJ1rSz1a7fOQ2u8A9Lb1oaEqQal/+MUuKHW
         0tZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794577739; x=1795182539; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1bhPViXt1pRD/+G0cozJg3X1gM1h4MG3wea7XTuXsrc=;
        b=IDaBJi6EnzYWBbfLMiIPr0Hr9fUbFucDOD5m0rjktHtv4g65mORdut5ERKbwL3+WdB
         Ebh98AmvbnRMDB5UNnyQWh0hqd6x9Lv/vmnaDNCw0JqxFBUeoDpXKz4lTndlo/XHrvpi
         N/I7ww+bA3R+GVpMMfkFGheCSAaZ/BG1iIfgs8r+xIG0umJ8Q2Mmh1VpTOBS07jjZqTz
         nAJgyVzCIyaklyNxiek0OKHskIrA+FjsbNJgYwzHgxK7+Wl8x/c1WAVZPZpkcAVL+/sS
         xZLCb4uuHJ40hxymUgOM3U1c328PfYaV0Nj9Q5mB0ZEffdzBeJ/uyt01pd2SwV5StXSr
         l6xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794577739; x=1795182539;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1bhPViXt1pRD/+G0cozJg3X1gM1h4MG3wea7XTuXsrc=;
        b=m1cAvcIUW0jVHObtVHzTGMdyDbMTbiwwfKGqS/RqDvq/4TAnNVKSlImAV5SAt26hB3
         lG3l9Ywads4fg6gcfvjxaV6yILTT0EpVgB0lUDduqvah8uip0hedIOHCfsJDrmUBtZpV
         5Ml2fpSLbFKFtLwLMQ8vGxMcS/ziaSL2KnXST4xnOV2R6mzGG92/WWdfLtLOdtzk/4Qt
         8zRzml3XbPFPO82b7LmjHxdJ87MKzdFtZxZYNDjnECk2x2rmUDxEJo74YwIg/BFyVuIN
         2osfOUIKNOwnP1kf/EEm2cB++Ac42PHhsrdA5GIzabEXxN/35VFkikjozG8lt623ZiRW
         tzoA==
X-Forwarded-Encrypted: i=1; AL+hErHTyj7t0h5A+EO6tZuIiKhglXs8qRp+RzaNYhFNKYMy40mHRkW02WQdLm8zCXZNSp4drI9H0joktff0IPA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jqU8dvq9qGXk9bITUGzQHZ9yGc4nDyQ5MUYxnjCdcAJUVApkg
	G59uctzjIaxkIP8CyhIvavtDeE40AA1q/82vRWYEJWsoh7iFYUxIqR7e3IpaSuklF0zkF/Xr+Df
	J8TfLOm3RnOGfCtWpEXhPViC9sc0d6do=
X-Gm-Gg: AYBFou2uHG8+kk4QNAPYLPKhvrA0d84V9kOrXygaS+fvay+9U7rOnzd6jK5RhneZEba
	IhPHRzr34RArzlzu7fM4x18xZSXGVq4ZhtVMVlAKGhSPxeh/k7L2oF3TATkqM/yoJ5z5AYy5bSN
	WONkd+Ib2fnJ5UPV5L3cubd/SUT+Ny5wy8XciQDuO783IDNNGj9rlQHYL6mLWrYpF8U49EBY6MV
	sKNAFJhe93hE5eYyyjXcVf5HY1xznjmc+4V5zxz149U9IDkceHqutze8w8CFYzAV1nGb4/JaCHF
	tRvJ2TbKMlyhF7Zk53l7e22oxuSEFjUjAYrNXFCRh0G3yxKD21piprgykcN13k2vdEUgj/yvsO8
	mY1nXDB/vPMhYBXyG6oOQJb7A53ev+KFinu12O7HiWMGQAL4cKafAAPzquEc5bfwG7FdXuBkt3s
	aXiPP14frtARn510dKdm9axAu9gsX14G3cS2Z25le/lZcTLPLDkp3+pCRh
X-Received: by 2002:a05:6a00:893:b0:8bb:1b05:dd39 with SMTP id
 d2e1a72fcca58-8beb58bcc45mr2934303b3a.11.1794577739414; Fri, 13 Nov 2026
 05:48:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112172149.27355-1-yves.bieri@theori.io>
In-Reply-To: <20261112172149.27355-1-yves.bieri@theori.io>
From: Xin Long <lucien.xin@gmail.com>
Date: Fri, 13 Nov 2026 08:48:47 -0500
X-Gm-Features: AclHuK8PfN4ou0sIEU-hFGhRyxEEh94jLa5NJ3yVhQe-fdSo_K9CA5s6bPZ98fo
Message-ID: <CADvbK_cetnuX7=VDEh9hE4db3BdYWr9es28jVorMXOQsTfrxGQ@mail.gmail.com>
Subject: Re: [PATCH net v2] sctp: do not free a new asoc peeled off while
 sendmsg slept
To: Yves Bieri <yves.bieri@theori.io>
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, linux-sctp@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 12:21=E2=80=AFPM Yves Bieri <yves.bieri@theori.io> =
wrote:
>
> When sctp_sendmsg() creates a new association and sending on it fails
> with anything but -ESRCH, it frees the association. The send can
> sleep in sctp_wait_for_sndbuf(), which releases the socket lock, and
> meanwhile another thread can peel the new association off to a new
> socket. The wait then returns -EPIPE, and sctp_sendmsg() frees an
> association that now belongs to the peeled-off socket, without holding
> that socket's lock.
>
> If the peeled-off socket frees the association first, e.g. on close(),
> sctp_sendmsg() frees it a second time. Otherwise a syscall running
> concurrently on the peeled-off socket can use it after sctp_sendmsg()
> freed it. Both are reachable by an unprivileged user. The double free
> on net with KASAN:
>
>   BUG: KASAN: double-free in sctp_tsnmap_free+0x5c/0x80
>    sctp_association_free+0x1eb/0x750
>    sctp_sendmsg+0x15ff/0x2020
>   Freed by task 836:
>    sctp_association_free+0x1eb/0x750
>    sctp_primitive_ABORT+0x85/0xe0
>    sctp_close+0x22a/0x8d0
>
> Commit dfcb9f4f99f1 ("sctp: deny peeloff operation on asocs with threads
> sleeping on it") fixed this double free by denying the peeloff.
> Commit cea0cc80a677 ("sctp: use the right sk after waking up from
> wait_buf sleep") replaced that check, and commit a0ff660058b8 ("sctp:
> return error if the asoc has been peeled off in sctp_wait_for_sndbuf")
> reverted it to return -EPIPE, without restoring the check.
>
> Fix this by holding a reference on the new association while sending
> on it, and by freeing it on error only if this socket still owns it.
> asoc->base.sk only changes in sctp_sock_migrate(), which runs with this
> socket locked, so the ownership check is stable. The reference keeps
> the check safe if the new owner frees the association meanwhile.
> Userspace still gets -EPIPE, and the association stays with the socket
> it was peeled off to.
>
> This was found by Xint Code, an AI code review agent, and reproduced as
> an unprivileged user on net with KASAN (trace above), without modifying
> the kernel or using error injection. With this patch the sender gets
> -EPIPE and the association keeps working on the peeled-off socket.
> Without a peeloff, a failed send that created the association (EAGAIN,
> EINTR) still frees it, and a peer ABORT while the sender sleeps still
> frees it exactly once. The SCTP selftest sctp_vrf.sh passes. The
> reproducer is available on request.
>
> Fixes: a0ff660058b8 ("sctp: return error if the asoc has been peeled off =
in sctp_wait_for_sndbuf")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yves Bieri <yves.bieri@theori.io>
> ---
> v2:
>   - move the hold to right after the association is created (Xin Long)
> v1: https://lore.kernel.org/netdev/20261110224233.82977-1-yves.bieri@theo=
ri.io/
>
> Tested on net at b71c101bbb98.
>
> The fix and this message were drafted with Claude, and reviewed and
> tested by me.
>
>  net/sctp/socket.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/net/sctp/socket.c b/net/sctp/socket.c
> index b5a57f6..6ed184e 100644
> --- a/net/sctp/socket.c
> +++ b/net/sctp/socket.c
> @@ -2063,6 +2063,11 @@ static int sctp_sendmsg(struct sock *sk, struct ms=
ghdr *msg, size_t msg_len)
>
>                         asoc =3D transport->asoc;
>                         new =3D true;
> +                       /* sctp_sendmsg_to_asoc() may release the socket =
lock,
> +                        * and the new asoc can be peeled off meanwhile. =
 Hold
> +                        * it, and free it on error only if sk still owns=
 it.
> +                        */
> +                       sctp_association_hold(asoc);
>                 }
>
>                 if (!sctp_style(sk, TCP) && !(sflags & SCTP_ADDR_OVER))
> @@ -2084,8 +2089,11 @@ static int sctp_sendmsg(struct sock *sk, struct ms=
ghdr *msg, size_t msg_len)
>
>         /* Send msg to the asoc */
>         err =3D sctp_sendmsg_to_asoc(asoc, msg, msg_len, transport, sinfo=
);
> -       if (err < 0 && err !=3D -ESRCH && new)
> -               sctp_association_free(asoc);
> +       if (new) {
> +               if (err < 0 && err !=3D -ESRCH && asoc->base.sk =3D=3D sk=
)
> +                       sctp_association_free(asoc);
> +               sctp_association_put(asoc);
> +       }
>
>  out_unlock:
>         release_sock(sk);
>
> base-commit: b71c101bbb9814d163c00234d43c41f0a17907d4
> --
> 2.43.0

Acked-by: Xin Long <lucien.xin@gmail.com>
