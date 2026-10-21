Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792602917;
	b=kqVgnsU2nG3CMS5mj+LVpdqefnZAP7aYKL9xotMEA0UMU33eV0ia+FPJiWf/mmZ+EQlp
	 +b50YfH+gkhdsNLVvGvPRkRTkojo93CZ/LakskSdVcgNC9tEaaFGunG8H4BpgB6aiRLUo
	 l0Sl0Np6HcT6P1qUR964RDX0hkw4mQcC/r+VS76wdApC0f0CL13Glps/GazuGcucvHRN5
	 jcEekJg8A7HoLD+OxhdG3WuM3ewzBu8cnEgAtkCqJZdf0+J/KueBXi4c6K950w+162o0G
	 /TWfv+HBnfIlxqBAhPihTm/nDw6HI66aJGSTOVXVS0TgsAaN/mlWv8Ru+pt65kS2KJg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792602917;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1tGGVt5JpRhP2W4EJx+5ELzjqyqkrNAqI8MgC60d5J8=;
	b=JGmHTgdN1JhhiJL52t3GjVnlU4gmvxYEapfjvk2vqtMLOp513lu73DmAsd120piRo5Zi
	 /dqkHTy+HX0ilSODnRSAdw/+tDlTmMnI05ITzmZwa8ss91VlLZl3oevPFIdcri78gtHkI
	 jhcHT2wroWP2cJNLAoPH6SBdB+vI11bKSl825npemvTmE01pPImZF+GxR4PN6/yomvkvD
	 SiDV3yIaZgvas3YiB2bPbWAVEDS4Vy7jXJJ37U4nTNHgaUY3tGhK/+n/2ButmW1CyJ9If
	 Gdw9gkpRq6xLzDxy7cUk1xhJStpfkAXnY2Epa3hp0yVOZHaT/GB8xMzibXsoLtDuYoA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=unOyOiC8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3787D606A322
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:15:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3787D606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=unOyOiC8
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b1b12de661so494a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:15:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792602915; cv=none;
        d=google.com; s=arc-20260327;
        b=HrXgwhdIqwmvGl9Af20v4A+23SufMFTG1df/+sxUQPWuy8esTxF6mu3A1mtmfZ2kLX
         kx39WrfLWMOPr3SOJoIRBlJ+drzkvZVVmlCnWp1x52lOTX3mMnAGSGhTfnfKgMtOm212
         N7KtTn69JomE1ZJn6JWLrGwbymdXJpOEYFFSHg9cJsVOrnyEUT8mZUv6GOe39rWB/XuQ
         e7PTmsH8wq3CZrN40ByS7ntG1tbHK/9XJ8U8qx2/d/t2gmve+9l1xnYmKvhHlvEsS1X7
         kYKm2rlXvkC45TTdqfWrkNNKINxTvisFGs3iW6ypM7K06bNag4QML6D9hDdyY/oN5vaP
         qWCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1tGGVt5JpRhP2W4EJx+5ELzjqyqkrNAqI8MgC60d5J8=;
        fh=iyhLSCy3oMfJj97jufJXjzWTRx4orMxKBWGX8Bprwoc=;
        b=iUhcPROyI1QvfMC4l33kdiSrWvbQlJxR9/VKQJMsIKGzu75867aVRzNrNHysYmejQK
         MifmP//IvGn7AcpcfZVtVcsrSLbQ5+cFKm4wlCNtT/slR5soD1psFfqvAnOsf0DxlD88
         OcxUrYp6FgTSJOom+rHtTOrjYqxQifyE7GvfIAEgWfH5LP1uzDffsClE/tWdpFr7xatj
         9SLkAZxHRH7rEnh732xa4duGOt7+cwhneW6VXk5+XAJclQamKkWFiIcjFmOUWOLyWbGl
         lHIKoQtpO+JHwdOF9fc8ohYI9as0G4QuC1Svl7oI3RSV9JgwWz7P1aYBBc8Tyus/44pp
         3vJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792602915; x=1793207715; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1tGGVt5JpRhP2W4EJx+5ELzjqyqkrNAqI8MgC60d5J8=;
        b=unOyOiC8BZwLryVYJ6/ei52c2FCAsDZYRdhw8IpxIpw0w+Ax/ESGa7XKcqri+Y5JfU
         74kc9X3tkz0ffL/8vQzTmMGaLviiqfiOF/oPM/vauqGi1g2S+p0b4c9VDRc61tH+I44k
         2SMZFTFgQ5Lb6YUcDJK5BcTMLoKdquSLbQK5vf5b+48xKJLiqO7gX0um1Pw4llOYFgg5
         8gnHIf5pIutrDQpB4QsmCiLhLw/vZXw45vYhCFkwyWJ3Vhgvta0R8AtLPbqQp/AggAtj
         wj96wWp4ZUxV3r36mm4wbSQnjyAQ1cywOOLRLkOuCqEc7bBJkKO1mg1feiLRKhIRUS9G
         NsUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792602915; x=1793207715;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1tGGVt5JpRhP2W4EJx+5ELzjqyqkrNAqI8MgC60d5J8=;
        b=OhzAdopYrN+XixpNZ4eMsvU61h1gqdEexaF3dTx24fkG3xQN0QYk4xel5O1dZAVWby
         uvX9MKMD/bsDhZnecsabpJT2rr9pcHA5DmJgKAGL4N7A388/GTBJu06CA/lsFIGLSFlu
         XkWEqoZjCZfgmU66M2EFhEcOE7v7qRrfjMTmzNnvV6O7WxtUa+VFlqdiFGQkYOvDVHHE
         2XsJh678+mgd49+znFMqURswJSSf8A41WUjfCCjJHcwPxZHxqpF7KfX2708c/qHK+4ky
         7S4ontMBpXjHx2mdmrX0UCOAl2lLiZG/JgUEd9KbxG4WsFxQHBdHrX8/3H8HfMSW3FXo
         4iTA==
X-Forwarded-Encrypted: i=1; AKwUvBwq0tZAdcxnAKgKW+ISHst/i6b7YLCQsDhTwbS13NyYFE7saJwuTjUMPk7ERGEwHWAcv0bk75oBCvb10hc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIDy++YHJJ+DyG7SEJsxsH+kp9XO6XUxwquBakvmJStm6A2epp
	j6kfPQ7VNksEWmqo7tFFPKIw7dnLoo9mGroEI3ey/Zw022ycQDop7VMtvaKZIL7IYR/WmoBjbJR
	K15mo4gYCTG6V/g8YcutAkeq785PO7GAlEl5IjJN9
X-Gm-Gg: AYBFou2FlaxlviqdMJvESG+c8y+t2sN9Bc8g9OPf7yfLUKc16vM63o71p/kEtKvBLqn
	hwlrZAds89B05jn2bNE4lbFJy8yo6Rae8C7zIZGkyuEVpqPCphCLfDl4Ojvqfmy8DDxxLbBgW7M
	MOo51mj40kQodjcbX7Hj0ikmHpymP4hUfJsTN2BTPjgncCI5PQfaupzHs6NHL6gUokIlIGWcd/O
	XR71Gvw3vDk9bbmpwTfIPcm1e2eAnPF9pWrUugDVE3dbT0BjsJO/G4d7GvXcUsL/ryFgDASWLIR
	xAsSNGbmuRIeiR27URChQhG+V5AYbjyPIEw1JYAs8ePWLexixe86H95I2N58s/R/AaCbuVxGTAc
	m9xux70rjvsvGMbNZ4LzIreU6n1eztefCPPVIoAXb9l1snC7pzm2Z/Q+XlDw6z55VkssDj4mhNG
	XraWWNi7i9ARXz
X-Received: by 2002:a05:6402:4259:10b0:6af:afce:184f with SMTP id
 4fb4d7f45d1cf-6b3e58e0cb8mr131835a12.3.1792602914983; Wed, 21 Oct 2026
 10:15:14 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019174522.55644-1-kaifengw@google.com> <4d5e00b9-5081-4530-ade5-41570e4a5b2f@gmail.com>
In-Reply-To: <4d5e00b9-5081-4530-ade5-41570e4a5b2f@gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 21 Oct 2026 10:15:03 -0700
X-Gm-Features: AclHuK9Owbr01ebTbFz9aYLKFv95LZHGS0yoErAU0QV9EF94ce89DoEcv1Rm3wc
Message-ID: <CAHS8izN72w--+5pxxzg44eCOdaeYcJUpXSeJUoqEdZRRq7xPXg@mail.gmail.com>
Subject: Re: [PATCH net v2] tcp: reject devmem tx with fastopen and repair
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: Kaifeng Wang <kaifengw@google.com>, netdev@vger.kernel.org, edumazet@google.com, 
	ncardwell@google.com, kuniyu@google.com, davem@davemloft.net, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, willemb@google.com, kaiyuanz@google.com, 
	sdf@fomichev.me, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 8:17=E2=80=AFAM Pavel Begunkov <asml.silence@gmail.=
com> wrote:
>
> On 10/19/26 18:45, Kaifeng Wang wrote:
> > tcp_sendmsg_locked() enforces that devmem TX can only proceed if the
> > zero-copy path is active and a valid dmabuf binding exists. However,
> > subsequent branches in tcp_sendmsg_locked() can still intercept the
> > message before it reaches the devmem zero-copy loop:
> >
> > 1. TCP Fast Open (MSG_FASTOPEN or DEFER_CONNECT):
> >     If TCP_FASTOPEN_CONNECT is set, the socket may have a valid dst wit=
h
> >     NETIF_F_SG (so zc =3D=3D MSG_ZEROCOPY and binding is present), but
> >     tcp_sendmsg_fastopen() -> tcp_send_syn_data() will use
> >     copy_page_from_iter() to byte-copy from the iterator. Since iov_bas=
e
> >     represents dma-buf offsets rather than user virtual addresses, this
> >     misinterprets offsets as user pointers and copies the caller's memo=
ry
> >     at those addresses into the SYN packet.
> >
> > 2. TCP repair mode:
> >     If tp->repair is enabled with TCP_RECV_QUEUE, tcp_send_rcvq() simil=
arly
> >     calls skb_copy_datagram_from_iter(), byte-copying from the iterator=
.
> >
> > Neither path supports or makes sense for devmem transmission. Reject
> > devmem sends inside the Fast Open and TCP repair branches when a devmem
> > binding is present. Checking inside the tp->repair branch also covers
> > the case where repair mode is enabled while sk_stream_wait_connect()
> > drops the socket lock.
> >
> > Additionally, drop the !sockc_err gate from the devmem validation check
> > and return sockc_err if set. Otherwise, if a valid SCM_DEVMEM_DMABUF is
> > followed by a failing cmsg, sockc.dmabuf_id remains set while binding i=
s
> > not acquired, allowing the Fast Open and TCP_RECV_QUEUE repair paths to
> > proceed and return before sockc_err is checked.
> >
> > This pre-existing issue was identified by Sashiko AI review on commit
> > 125755776bc6 ("tcp: reject non zerocopy devmem tx") and has not been
> > hit in production.
> >
> > Fixes: 125755776bc6 ("tcp: reject non zerocopy devmem tx")
> > Fixes: bd61848900bf ("net: devmem: Implement TX path")
> > Reviewed-by: Mina Almasry <almasrymina@google.com>
> > Signed-off-by: Kaifeng Wang <kaifengw@google.com>
> > ---
> > v1 -> v2:
> > - Move the devmem rejection checks into the Fast Open and TCP repair
> >    branches directly, also covering the case where tp->repair is enable=
d
> >    while sk_stream_wait_connect() drops the socket lock.
> > - Drop the !sockc_err gate from the devmem validation check and return
> >    sockc_err if set, preventing a valid SCM_DEVMEM_DMABUF followed by a
> >    failing cmsg from bypassing the check.
> >
> >   net/ipv4/tcp.c | 12 ++++++++++--
> >   1 file changed, 10 insertions(+), 2 deletions(-)
> >
> > diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
> > index 87ef6d5cbfeb..2792923f0748 100644
> > --- a/net/ipv4/tcp.c
> > +++ b/net/ipv4/tcp.c
> > @@ -1169,14 +1169,18 @@ int tcp_sendmsg_locked(struct sock *sk, struct =
msghdr *msg, size_t size)
> >                       zc =3D MSG_SPLICE_PAGES;
> >       }
> >
> > -     if (!sockc_err && sockc.dmabuf_id && (zc !=3D MSG_ZEROCOPY || !bi=
nding)) {
> > -             err =3D -EINVAL;
> > +     if (sockc.dmabuf_id && (zc !=3D MSG_ZEROCOPY || !binding)) {
>
> I wonder why it does sockc_err checks like that for devmem, e.g. instead =
of
> failing earlier. Maybe Mina remembers?

IIRC, Paolo caught an issue where we were subtely changing behavior.
Like if someone passes in a bad sockc flags, it's usually ignored, but
if we process the sockc_err before we need it for devmem we change
behavior for existing users that were passing bad sockc but not using
devmem.

--=20
Thanks,
Mina
