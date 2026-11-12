Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794498981;
	b=gg1Q1CAd3ssGIhVhYxHr92Y/bz4Qe2PM2O9qmDBKCbCxlwnGuZqq2FN2N+1T51QSy2nQ
	 aywjb+ONwuNqjfXICyYs3J550JAA/Sl6ZIw/l00IFC0V2kF9QV1H0JFbMWvkzA2etgiJC
	 BcZ+wmrly61qwrbZ+DV/J2VgoGOmPSauW108ciW6KAhNgYLKcVKGGth3JbBTozCk4Ihig
	 IUHKLtpxgsY/B0KvxsTbSoBqGiop7vmsBuwi9pROf+iv43KROpCJKE20nqEAidZztELhd
	 cYoaYiqQ3P1PFAOq18pc87WwyWUQDPo7jve1Bl9RLWPCZ7NCcjejKzsi1Kl7eoNlkPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794498981;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Q6vCcmO9UnueyWU0efgozjB5WIAOqxMCCYGcp8pVZSk=;
	b=OCk8w7QOcFHTHYmKcy3Qycj8H0H3N2W0SN5BIWyTHm3jhbOpIhy4P5wDrUZcXvdjqJjE
	 jB2PCRSwIcweuVuwewszdK2jP804921nEMr6z3/a3746EqfrL7P29HjwyPx6gnO9OJFdL
	 /6UzI5+hTqtLYI80JIXG3bMSMPqkv4iupVYVIy4cRTFoFYA8SCnqRLpX81zhhWbbzD9nF
	 LhUJZlcHDM2zfvA8m3wzEhSlobFKKKFGORxIfx95mEGLnA300vhzCfKRi0v9xp47HDjv8
	 U57Ioi1qJGQGv4uCcLWqN744olsCiqr7Z/Hx83pdzXrhmLhRVrbVzTVimwCBXuxio2w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FMMQwfxn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E828D606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:56:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E828D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FMMQwfxn
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8b68e59ab33so1020042b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:56:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794498979; cv=none;
        d=google.com; s=arc-20260327;
        b=PT7+AI976sUOYmUCpjBNWKhF1daFKpP6gZzluYYRP+j6AEGpVpElH+VNtkXFkGCDyA
         WcINFnmLpscJrpu0mFbvF7Jcg/46lLk4gmWMy6oPHX4g/92ZLN02Lr226rYEAuBMKPoK
         etTuLxsGjvRU9JmbvQc8iGFXMmBtSu+/fvgS7ST3N/fYPpiAPW3ZSLrqdu5XEfbu19nH
         M3o15q/m7ZtFZe1R16ya6FjnYpH0Bc8CdOoeRbPD/ORmroNBQUcdgrAvfaGH9emvI8TZ
         Q25pdyrr/SMB9owxz5pEmoHeH+Z9pwMhKKynnfuFwAUtHcqQGbdZ86D/rbdcPslBc+tt
         WSmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q6vCcmO9UnueyWU0efgozjB5WIAOqxMCCYGcp8pVZSk=;
        fh=tus+Q3B6Z3vzajBFvRycQFL+cz89g6zCjjp4MdKhadg=;
        b=s7yQcUpQ1YMXvp8AyXiZT3mo5yYav3Z088OlaHZN6WjMnABNWD8eRFdBRmao9DOsk9
         G2lIfRri0TrHeJU1wrpl6rQoR63mtaiHhJWVO7+Pcj62KcVVqqFk0Pfb7b5DqTqtM7se
         VBk790zpZVsayo0/Np0gGh4Ho6QbYsI8LiryxpCJZ2iMJOWmdYGqlDtOoOy1HBtwtO2y
         mmSbiI8zcoWGOwLQS8wLlKyAUIE8zgHYvBM80Lf2K1L2348yvtVoGV6SVtwmieszjWEs
         pQvoQYRe9NBMpLsRnhUJwMR2XUTvyxKGl0M8Iw7yxuMS2/nMOZTo+uKYo31ogVWeuy1p
         nCzg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794498979; x=1795103779; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q6vCcmO9UnueyWU0efgozjB5WIAOqxMCCYGcp8pVZSk=;
        b=FMMQwfxnGhQl73SmXTmz3Uz/fR5DEkmGqGslOlDNHRgRQuERn1ilxuNemrRhzkBGqJ
         TC/nbvr3M/UlfSDu0l0pmWhaGHUZQekv6rpZTy/rK6iz00ZHta13GKrHNvKh5xfPuT5g
         I838dUJLIEB3vfrekuxhJlBI1FAwzgFDwVDPJ2h5ZKy4tpyqQv4/yAHUkstGe39jCV+H
         hIZKrD8EB+m1u4yeOLlXftBg2cduPxnDRmRczR9bKcrC8XSO++rYLTPEaF6he/OOqXBJ
         PudvFY1qdb4BbH/1pp3C/xdGCdyusJ5RrMhGcpEQ8k+UxMN+2bJLYbHbn1Nz3ew5b/e0
         8qXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794498979; x=1795103779;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q6vCcmO9UnueyWU0efgozjB5WIAOqxMCCYGcp8pVZSk=;
        b=0dmGqsxNsTB9ntaojGnUlrny8eBWbq+GgJuNkGi5k4sbiEa/g2f2SM3gMKR9PuBE06
         rPqKQreOR+HBgxBr9GxMHiGF7qxjOPH4n4Ml1xySxSy9kXCbiXoxR59LEZavYld7BXBI
         BwGTibmZXHRCycaRlFVJY7YAIg9CbC4cb7jQOvyQ7rDKl/aBNNnLNXC1PZ7M6NQjUBgg
         nsJznhqNaVVSOm4l2oNgb9Cqa7SwBzJld7EEXLx9YPIkzCeKCzLEZ/ZXctkamnFR9N8N
         74Oe2VTu2F7ZfMJccUyaTvakm3pa/Pl6Aw9StvIZuJA2LO5vsceWD1G+zz2bYTxKP60G
         7t0A==
X-Forwarded-Encrypted: i=1; AL+hErG61+ryF7/tMJQaJ3GZeWq8KdqCMeTGJW+sWxuAX5oKTaeU89r1BC+wOOJ2US8bSWcBZ0Mhdl0GLR6WP8Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/prUXpLaKhg4NYN794Jzde+ZU08YTWi0R8yx4x8ngVQ1k2wO3l
	y+sbFOYrg/2az/yNTTu3wXIfbY6RjjAMrl5tstsCC5aAxpbZiJ19sI1u1VixPCrTFozyljSrRDc
	jJkOCy9Qk6nSNKZ4mA6MVBZDXIA95R9A=
X-Gm-Gg: AYBFou2dvNnL39UBZTgxt8ydwR7zNw8ZAZvzxbIaxiWDqJHoBJpEm9xGg1n19A+LmfV
	1YR2EF/LIVtWDVih+IVwfGdaSn3ojT7W5jacmT790o3irgn9WuGSa7LvuqDI6N+n/WAHMyCaJAg
	M8FumoKM+K5WcGgEexNkijDpdWl67lKCDpCsaBP0gj0sJcq0QKnt6SdrcR07x+isHImSL30rSnx
	fDD3SX9UxR9o+gUOqk6pBBccMolkvYVqDoeFGrfNOav2H5VyC1knzJkaOmpEGS+JbZvZJWgYBa6
	ffjPLdX6zBKBqCFiiaf5oXjS8vxBdBGaQ4+6OdWuuwHy1QbEvRRhhUfeEbyiR53dQuGZkOJKkCb
	OpJuLpg2L24sWkSZ3OvAJz8VnJVfB3m7qReosaGtEb7Jj3t6BhBcjRiVoVe11aIMbIA/qIN5VFd
	jdSx8KZBvPXxTaORXrHsn2Ed/0Yt6/1ZUyH5O4Qg==
X-Received: by 2002:a05:6a00:13a9:b0:8a5:7006:1ecf with SMTP id
 d2e1a72fcca58-8bc1ca74f3dmr6405399b3a.39.1794498979018; Thu, 12 Nov 2026
 07:56:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110224233.82977-1-yves.bieri@theori.io>
In-Reply-To: <20261110224233.82977-1-yves.bieri@theori.io>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 12 Nov 2026 10:56:07 -0500
X-Gm-Features: AclHuK-WWnb_Avs24C603cZWJLj9kdWOrIpfiyA-Mg7U4Ik96B8IwVtXOHQS-lI
Message-ID: <CADvbK_edbUYvFXPGJzRspdG+RpV4ZnfP_WwuS4e4_sS2kbDAZw@mail.gmail.com>
Subject: Re: [PATCH net] sctp: do not free a new asoc peeled off while sendmsg slept
To: Yves Bieri <yves.bieri@theori.io>
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, linux-sctp@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 5:42=E2=80=AFPM Yves Bieri <yves.bieri@theori.io> w=
rote:
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
> Tested on net at b71c101bbb98.
>
> The fix and this message were drafted with Claude, and reviewed and
> tested by me.
>
>  net/sctp/socket.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/net/sctp/socket.c b/net/sctp/socket.c
> index b5a57f6..e7e14a0 100644
> --- a/net/sctp/socket.c
> +++ b/net/sctp/socket.c
> @@ -2082,10 +2082,20 @@ static int sctp_sendmsg(struct sock *sk, struct m=
sghdr *msg, size_t msg_len)
>         /* Update snd_info with the asoc */
>         sctp_sendmsg_update_sinfo(asoc, sinfo, &cmsgs);
>
> +       /* sctp_sendmsg_to_asoc() may release the socket lock while waiti=
ng,
> +        * and a new asoc can be peeled off to another socket meanwhile. =
 Hold
> +        * it, and free it on error only if it is still owned by sk.
> +        */
> +       if (new)
> +               sctp_association_hold(asoc);
> +
It doesn't look nice to add another 'if (new)' check. Can you move
this 'sctp_association_hold(asoc);' to after new =3D true; line?

Thanks.


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
