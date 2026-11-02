Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793653737;
	b=R9+OUDhMHkx8LR9akVxk04BocorX6CmPM8cjQ0I3SKUdhMJcrCMxO+ELyVGt3GxSu/68
	 JDyfj2J9RzuVWJtt9oMr9+tfYS5g5BEK/3iCvRsOoOhNkn9Qs8JmXq8U/1RGJJKl1zO1L
	 phK7JV8q86Hpfm5fp9UEyTZIwk/fAGhRanjbwzrua8XCR+k8yk4ObtmkRLl6SjEHnZ/Iq
	 TM/jR79/oguD7u2+DVrMkXSMBgtR4NgKz6TkI0r1X9TVH58ULSaA1lpdzzluIiwn+y3lL
	 Ll8Dynr21NwoF6u2ocOrYYWqQ26crf56kdHN5JvYEaAjDfSE4zYEPot9i18HkjGAc1g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793653737;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QGD7MhFVk1bv3I3FAIE488QygLRtUHvj1HzdJadYoHA=;
	b=RR/Jc/qBwwU+HS9fe9HuBCv/31byuzCSeFsSrAVii22691QZockNRRPmF7RjJ/b1gGLk
	 x6CFnduSK1RjUQWpUlJe96XRTnAvY2XIZeSUC/pm20kahBOzvdW9ROfGvOxOmoac72/Tc
	 zZF5rtFRlBzIILNkxXROwttXamgm9Yhk1IlZnv/RJZ44dWTHs/KqxMNSRAnvkWsfY1eQT
	 ZFAFLk96BToUVWp+S0mP2Ljnjyxhhfl9LRDIwTZm1mtumrSwPGRnwiVyGrlgYrFC3Lwsd
	 DzyjwGJbgnMj3bmt2IZ0FXXA0CAHVy39YXLK5Dwrr80VYVImjYTq2KJb26pkY8xq03A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Je2WuyDY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.42
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1287606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 21:08:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1287606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Je2WuyDY
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7ce6cb4c6faso2045039137.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 13:08:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793653736; cv=none;
        d=google.com; s=arc-20260327;
        b=XgKnzzw0DDhkvJh5H1Cz89tf1q0xIMSHyWywoW0q0muD66p58z5b6Y0GoLkNFsfNM0
         quLAFAxpZ3go3gjExccFD+fS2qk64y83OE16m3xSmPRgfmaTgJhV6PrTUr1VbG29VqM2
         uCJavAG3pjyu+CVLqKj1iwkTRpAr3iUwz7ZkwoLOMqR9aBND0atb3kCuOJ/86VgRb3kz
         hgQ6MoNa/KXAH6bBM1Y14PhxkteWk5GQl0kN5sM3RDSBk1G/x6COatP4ZD8bVZnpMJzW
         S46Hk64nLxI/yNmeNJAOfYi9V1GUkoY61gyF1KHF4bZQx0/ZeuPXwOR20jIwgYoktzjy
         qbsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QGD7MhFVk1bv3I3FAIE488QygLRtUHvj1HzdJadYoHA=;
        fh=oO8SiXtbJ+FXcPT0mUtRShmxjMWUptzRH7Rrtp76Kxs=;
        b=ZXJzqo0o72jv5NVGYXyuTox+G2lylMd9F9SzRVWGYI8QSIZt52BbS+IptFadIB/5Fz
         J/LCDPsTld5cTtHZTgrBcJ4LfrOVoRyiM4kYiAQz4xCAzzVvRoiCOgSY2K/vpuRxUVnT
         t6QcCYe1L8Guxurh4qtQchPB1hrkoTSnuoWNO02MWh2dP7eAE8dDBF9ZEXbsCjxmQsT6
         Os08pnvWfcuplhqo/dvn2iEXvThCApkvkgsGP3sExDk5kRQnLM4UZ2H5CoJoT8auk6Sk
         +5MNEyHmbFAk6WJD/pxccs0TKdb0wB6pvONWjCr4AZBAacjQaZp+YFKXFI+JYz/YepVy
         Yprw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793653736; x=1794258536; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QGD7MhFVk1bv3I3FAIE488QygLRtUHvj1HzdJadYoHA=;
        b=Je2WuyDYanAdaei3Z5xuc+nZGwnpXpv4gtbnKDQvC6+EFqCMGjJGyb5sgtLcg9luLx
         3wXA6QEMykjZcOPbssGQuAJ37FHrDPX8/mvyUctntwQt6buhIx4n0o4qSN8hyqX/SFIj
         HEtdvcVrSOAWfnPIv2uxn5MlDz34wTVmtbki7Gl5TKHAo0UhGDZBFuJIU5Bu4+NDCDtW
         a1CEA8LZ04DxNRmmywtPCIJhWZcHqf8vBOgDeSNC0BABBzk5ojhjBU9Xcp4Rv8IheR5N
         yyh4G+hQwBpJy4HE/viMR4TOeBHlcQu5qgTbwFfsYalQ3cskOxMUzMjOYAwgHSlWLxpF
         rtXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793653736; x=1794258536;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QGD7MhFVk1bv3I3FAIE488QygLRtUHvj1HzdJadYoHA=;
        b=QJrTziLevK+FEXYvrkdgPimP49BeSDOBB1pPUY8j6FJPPKMX6RCKBFd/+jBBf/tWVi
         dqK9hvm+2tDWKx3oKJdwmd9CfYT+z03BOuKkxVa1zTzX9tp1sfSRfW5UUwP/ayI8AQKc
         FK67lx5LkamYIra1e7B3pK8bUvcvPQa3Q0SY3QbT4f6zmjDhmIqmq/sgto2rYW3ATl6w
         kpricp2uvhTimoeG+ZDaBJZdycffUYpS1LGzG24JnZwdkLj2JA0WqPisSLzzML37PxF5
         +J3bFqkjzxCL4tL6UyaPcZ7Tq/K65uCi8beMxNIHXJTDAy8ixcQJWGgxWrFYyEGgSKIP
         g9/A==
X-Forwarded-Encrypted: i=1; AKwUvBySVkNJ0LpzqIJ63dqK9VQEvWoz65Q9W+8wlB8CK/V5aA3YDhnxcpwYYm23cPadYlG7yPrB0xl51l1/B+4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+d+3XWWVptybXCseNYR3tDg/dr/UHCUDQ8QeyR+8LG22RTX/nS
	gTu46IKlXAIJQHeqXX5jKuKUz/uUMpLEk2BsbPixTqj1meb73kAcSBpZyMmVyGJ7hx4U2OkMb2W
	Ieka90BANVn+XeOEhBdmLteI/6rYCxZ0=
X-Gm-Gg: AYBFou1cH9Sd5xBy44xnzywF42Vj2JmQ4b1KjWp577ddbVgJEb5+2rXynZZOFhiE2sS
	Eq2fPOFJpL7pQCePxk3IYx8hWPCV1TKg+NdMgGSNCdBLVBAHvuJpAJufnm+DAuP0lYJ2xZXKnTI
	DdWcYWAx/7G7U/WiULFS5TaVRhBL9TxX7QHkU2pUAQ3y+MVeoILQTRqeLms7yhafQslgm3S1mVV
	hhwLILlOL/3XsEE9XMFOVX0ZXyBITFhQC10S97+/c9s6pxX8tIIyVm0uGJP6eUUJ0aUwtasT8bQ
	mGbGUrg3zsg/JUDVXAEk2b6EOpMT2P+mA2xLLQwKBlY9153qYJm31P7sXq2H8aDy9X/wWgPBVuz
	qTezaf9m27p/y1IbHK1eJD0fQDaZLW8zp4eTDo8EYH8jnI3Yq103CyQ4yxViYAVapZk7iWQNHxp
	TiPWSo18di8vjl1rV4wg==
X-Received: by 2002:a05:6102:370e:b0:7c3:2168:d603 with SMTP id
 ada2fe7eead31-7d071f40bc7mr4465939137.0.1793653735698; Mon, 02 Nov 2026
 13:08:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260910123951.1241279-1-max.kellermann@ionos.com>
In-Reply-To: <20260910123951.1241279-1-max.kellermann@ionos.com>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Mon, 2 Nov 2026 22:08:43 +0100
X-Gm-Features: AclHuK_PiPKWF4q2Nwn7LD0p5r5C2AXzqyrRzuUqyoEaVhZH22H5uFHAPxl8LHk
Message-ID: <CAOi1vP9mrDMaABV=KtLRwrGVkBrPrGGBU8mUUnfm6wpdn_rM7Q@mail.gmail.com>
Subject: Re: [PATCH] net/ceph/messenger: print TCP connect error
To: Max Kellermann <max.kellermann@ionos.com>
Cc: amarkuze@redhat.com, xiubo.li@clyso.com, ceph-devel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 2:39=E2=80=AFPM Max Kellermann <max.kellermann@iono=
s.com> wrote:
>
> A non-blocking connect() usually returns `-EINPROGRESS` and fails
> later, asynchronously; the actual error is then only visible as
> `sk->sk_err` in the sk_state_change() callback and was silently
> dropped.  All the user got was:
>
>  libceph: mon4 (1)192.168.1.42:6789 socket closed (con state V1_BANNER)
>
> Save the error in the new field `ceph_connection.error_code` and let
> con_fault() print it next to `error_msg`:

Hi Max,

I wonder if saving the error that way is actually needed.  Can
con_fault() just reap it with sock_error() at the time it runs?

Thanks,

                Ilya

>
>  libceph: mon4 (1)192.168.1.42:6789 socket closed (con state V1_BANNER) (=
-ECONNREFUSED)
>
> Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
> ---
>  include/linux/ceph/messenger.h |  1 +
>  net/ceph/messenger.c           | 23 ++++++++++++++++++-----
>  2 files changed, 19 insertions(+), 5 deletions(-)
>
> diff --git a/include/linux/ceph/messenger.h b/include/linux/ceph/messenge=
r.h
> index 6aa4c6478c9f..f3aa977d7886 100644
> --- a/include/linux/ceph/messenger.h
> +++ b/include/linux/ceph/messenger.h
> @@ -482,6 +482,7 @@ struct ceph_connection {
>
>         unsigned long flags;  /* CEPH_CON_F_* */
>         const char *error_msg;  /* error message, if any */
> +       int error_code;  /* errno (negative), if any */
>
>         struct ceph_entity_name peer_name; /* peer name */
>         struct ceph_entity_addr peer_addr; /* peer address */
> diff --git a/net/ceph/messenger.c b/net/ceph/messenger.c
> index 212e7797f9e4..f989e043686d 100644
> --- a/net/ceph/messenger.c
> +++ b/net/ceph/messenger.c
> @@ -398,6 +398,7 @@ static void ceph_sock_state_change(struct sock *sk)
>         case TCP_CLOSE_WAIT:
>                 dout("%s TCP_CLOSE_WAIT\n", __func__);
>                 con_sock_state_closing(con);
> +               WRITE_ONCE(con->error_code, -READ_ONCE(sk->sk_err));
>                 ceph_con_flag_set(con, CEPH_CON_F_SOCK_CLOSED);
>                 queue_con(con);
>                 break;
> @@ -448,8 +449,10 @@ int ceph_tcp_connect(struct ceph_connection *con)
>         ret =3D sock_create_kern(read_pnet(&con->msgr->net), ss.ss_family=
,
>                                SOCK_STREAM, IPPROTO_TCP, &sock);
>         memalloc_noio_restore(noio_flag);
> -       if (ret)
> +       if (ret) {
> +               con->error_code =3D ret;
>                 return ret;
> +       }
>         sock->sk->sk_allocation =3D GFP_NOFS;
>         sock->sk->sk_use_task_frag =3D false;
>
> @@ -467,9 +470,9 @@ int ceph_tcp_connect(struct ceph_connection *con)
>                      ceph_pr_addr(&con->peer_addr),
>                      sock->sk->sk_state);
>         } else if (ret < 0) {
> -               pr_err("connect %s error %d\n",
> -                      ceph_pr_addr(&con->peer_addr), ret);
>                 sock_release(sock);
> +               /* reported by con_fault() */
> +               con->error_code =3D ret;
>                 return ret;
>         }
>
> @@ -501,6 +504,7 @@ int ceph_con_close_socket(struct ceph_connection *con=
)
>          * shut the socket down.
>          */
>         ceph_con_flag_clear(con, CEPH_CON_F_SOCK_CLOSED);
> +       con->error_code =3D 0;
>
>         con_sock_state_closed(con);
>         return rc;
> @@ -1613,12 +1617,21 @@ static void ceph_con_workfn(struct work_struct *w=
ork)
>   */
>  static void con_fault(struct ceph_connection *con)
>  {
> +       int error_code;
> +
>         dout("fault %p state %d to peer %s\n",
>              con, con->state, ceph_pr_addr(&con->peer_addr));
>
> -       pr_warn("%s%lld %s %s\n", ENTITY_NAME(con->peer_name),
> -               ceph_pr_addr(&con->peer_addr), con->error_msg);
> +       error_code =3D READ_ONCE(con->error_code);
> +       if (error_code)
> +               pr_warn("%s%lld %s %s (%pe)\n", ENTITY_NAME(con->peer_nam=
e),
> +                       ceph_pr_addr(&con->peer_addr), con->error_msg,
> +                       ERR_PTR(error_code));
> +       else
> +               pr_warn("%s%lld %s %s\n", ENTITY_NAME(con->peer_name),
> +                       ceph_pr_addr(&con->peer_addr), con->error_msg);
>         con->error_msg =3D NULL;
> +       con->error_code =3D 0;
>
>         WARN_ON(con->state =3D=3D CEPH_CON_S_STANDBY ||
>                 con->state =3D=3D CEPH_CON_S_CLOSED);
> --
> 2.47.3
>
