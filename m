Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793290164;
	b=BZMgDtqNf0Ng6G+b/21uLRjhZQb9RCZZYPWazC4Hi3w7pkQ/4bnb7rekNyZXvnUPQtTW
	 EJDZxU82L6hjsKWnIdngZhjAmP13BymhrerHMFo0XQKFuqrmHS8/qZBlThFkhbm6SVIqs
	 7BHJgBIGJJDWIGHs4B8EKDPiJxHOnJchzbRvEjpXwN1mAOp8N9vxG4ASOQNP+UVL2+m1B
	 7KhMGKsPAUMfX8B/VCu/71H5HcZebL0jy+t3bj+DjFDNjSgfzwkN5ABlhRlSUxBrnaG5j
	 26pWHM+f8eHAzk1nozx7NyusfxlDWdGetz5dZP/5sdlP5kmetIgiVJxnSdFUlYN4CVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793290164;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=epB8RoKxui81tx8KuP3TsTIU8ktJzNyauUMdiyfjpOg=;
	b=jwiSntIaF1boi7jT33vc1o6sFIK9zRVpXjGrUrawYPTtlCn8d3i1JHpEgN9A6rw9jZuy
	 wWtF7s1kIdomcduB3MU4KxiogpHD1ebqC21DNz5ZASS//Fz2/Pkr75eYhi+6HNHFRYA6e
	 LYWxb0sO+iarHr1TY2Fzpg6O9ZLNQ33OwL7iZFGDjVQ906qsziycI9TCtFIkqlizdvuR8
	 eTxS6zQZ0CqHMFC7peFg5d1QhsgGcIwmI+fLkeSAx0M6vzXKdZsB2jIUD9g4v7Medv29h
	 f5fMoh8k3OUltCSAedzTjLWGg/hHZ1hHfjTN/KQ1FuS+X8zCOyYDCu8IUQurmBjQWbQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XdHmfZmU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECDE606A337
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:09:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8ECDE606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XdHmfZmU
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8ae8607e8afso19120087b3.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:09:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793290163; cv=none;
        d=google.com; s=arc-20260327;
        b=Yd82RlmYTLRoLAh+Oo4pPzDSyzY3F4lwIpiIQPJPt0EWiAY0YSMCmB7iY5VvJ8PDpn
         HX4ukcU2i35b08QRu8e4Y6Ol/yDxe8qNys+PvAo6NM6fZErYo6m1pCV+rXQU1oJMZ1xs
         svdRfcZnkBB5YoA1vO8Sxcubnw2BtsYtTxziF6VIT9/pzkiDqJZH/uBe+358cUOq4gGk
         8T/9ldq/0UJf2/nhpfSGbAKTxt6aLf5DJRldn4q+Bgd2DAqtXlp6J4Wz1S2qypIcsA7l
         uakG/o/6dDnVnQNcFuThstSWEaQ4dq37qd7E6DTl87wqZMuehAgTO3y059eCVlzErOiI
         1URw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=epB8RoKxui81tx8KuP3TsTIU8ktJzNyauUMdiyfjpOg=;
        fh=GNfPplRBmdnhK2kU2yZEB7yimUIR568TlttnR71lc0Q=;
        b=stqJO4WTUttJ1aaJPIgdVEze7ULNtFmvXLpVmk4Oa0qC1QPR8CFX5mDEEI/vXr+uQ4
         76ndDA+ePPoETMU2xX1b6zguL31/WVEQ7L3SBFpKuzimpKRLsMMo3UA1eeQXCiHR0SOV
         Sx4U2aq/qS+naWmOisMp0MFlr0ZhLPuRCt0g6U2NOWvbEtiDYXehMetNBBc+g59G2isu
         dbP7fBK/Rf3bUtHvQZ0f1u1nUFfJ7hR30gNZmpiyP73NFDJWT6fEkKoqj4UKFiIqLY6j
         lXiGkZ1Q3MaNxdpAdcfEcph4l+MErjt6AIPO3m2QiILwxNf2T1J/mrLmcIArM+v/Oz9+
         jSkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793290163; x=1793894963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=epB8RoKxui81tx8KuP3TsTIU8ktJzNyauUMdiyfjpOg=;
        b=XdHmfZmUHaYtadkK8mCBg6rwoPDNBVSyW86SO5+2wkMAAXlNTo/xBN1h9EAjHQpGPG
         PMM4YwZkRdCMnOvqvDpxYyjWdE64vgmwNOKEw8Bf0sUd7Zgv8EmOyynk/H2TYWTuyW8N
         1QVJmaAnM9jvbUmaOMuwgZQZyJh8rNghYlzpTCBq0bcc0Vu4LLeZKxsAz3+YmXvzIvRn
         nSr6iSzEwrX9FZZwj6koh2AvPknLMrNo9QuLk9wZJS6svBHtk7p+1u8Mt+zeBPFB7m0+
         P06pyH/i578wl474LfGZ/Vc0RE6j6IuELN/8oYeOuweiUH2p8Q79SNBRRQRB0XV/Cxeu
         8U/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793290163; x=1793894963;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=epB8RoKxui81tx8KuP3TsTIU8ktJzNyauUMdiyfjpOg=;
        b=LZSvKWBaGhXv+tlZyrgKG71IoeoV6r+rZJ5zVQB55jGgWuhE2DWRRQiyLPrD2Qt/D4
         kUADxMYCl9KDj0ALMjL3mpLzBa/susfCiI4PB0piod1wDNWJZCjlMSs3gXP4++gTbTnU
         vFZCpCr2OIg98zNLH6Y3dDq9Z58umn2+HLX3gqfnPcZbFDwcVpcEmpya0Jp7AmP4fW5t
         UfABhJv9zSkxHf6Paz3s7aJ8TV7iRn85KQ9d9tVqzLtjWBSKRaV26YNBHXhiYTTBwzGR
         N3Sju1sc62q3qOWsCsyDmS7HApoKcDfFda0LsHBBgozG1iTw1eaLVMo/XtRqc7xo3Jd+
         IENg==
X-Forwarded-Encrypted: i=1; AKwUvBwV8tVsXPRN406WwbtZxOkPnxleJmU/HENXIfykHQE0+8nGm3i87LmfYeyg0oMTzet0iqhiQdGdK9DedhY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJe+H6+blFIRo6unedqR0CiXSuAn57hIgEnJz7748eLOB8pAx9i
	7FEVkzcori3FlXYbReOT4fxNRPNQbqwTsli0mO57J4BzlzIaz6mQGGoCGyZ4p6OabFpkjANtYFA
	sx6qQcigz5SddIrxqUS7PCUK5jc87R5s=
X-Gm-Gg: AYBFou0C9/hLdLW8FsPvghcFlUwweGQAe4MoI6DUkP0UBpxkYGM/ey8Fg+Lpu7zquFW
	B+ml48+cFi/6aTwUnF643YfBIqPTzfuQteEV6coIkxhfjpKHVwINvB2oqkJXoMI/bpL4Ry88h7F
	d20k6R0nA4yrImlKQEopCh/yIh88qYwLAzMeJN3U7/47UrS3El5eLD8DsNSedSG9VsLjNQqJf4O
	GJ9c+WeBEvMWxGqoSumvyDg88LoM/PgDCWwU3KVpfiXchYy0sGPwHoTK0IRHjJ7UmfW5jB2TSJV
	05bCqaBECqSbpW+FMoakH2cydjYQO6NjA0EKNhoNP3vDkT6ibTwtMos4bSfWgR43LrqoD1a5g5U
	B4bo+qCGTFClrVwHerGlCoWLa1C52vIG8F3XeqhO49SBOkoB7JjJw82unbd37CqQx3U1dbnfj6M
	/fdXq5XgkbCHsgjXuTVrt2
X-Received: by 2002:a05:690c:fc2:b0:8ac:b167:4877 with SMTP id
 00721157ae682-8b1b5c9ff05mr38036237b3.36.1793290163455; Thu, 29 Oct 2026
 09:09:23 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029094104.2952304-1-jinwang.li@oss.qualcomm.com>
In-Reply-To: <20261029094104.2952304-1-jinwang.li@oss.qualcomm.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Thu, 29 Oct 2026 12:09:11 -0400
X-Gm-Features: AclHuK_t1FdhNrTPRKMKSpeKGIgS_hB6YvmkkGhHzb48NiF-9DwnIvkJnl0-E9U
Message-ID: <CABBYNZJ0YZ6hZaRH4jLtKRSdcVYz9_jdaQgCg4RdfB2O9t=TVg@mail.gmail.com>
Subject: Re: [PATCH v1] Bluetooth: L2CAP: Ignore connection responses with
 wrong ident
To: Jinwang Li <jinwang.li@oss.qualcomm.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com, 
	wei.deng@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com, 
	mengshi.wu@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

 Hi Jinwang,

On Thu, Oct 29, 2026 at 5:41=E2=80=AFAM Jinwang Li <jinwang.li@oss.qualcomm=
.com> wrote:
>
> L2CAP/COS/CED/BI-28-C requires the IUT to ignore a Connection Response
> that carries an invalid Identifier.
>
> l2cap_connect_create_rsp() only checks that a connection request is
> outstanding, not that the response answers it. Add an ident check
> against the pending request so that a mismatched response is dropped.
>

Needs a Fixes tag.

> Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
> ---
>  net/bluetooth/l2cap_core.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
> index 83b622a42811..70ad30b091e4 100644
> --- a/net/bluetooth/l2cap_core.c
> +++ b/net/bluetooth/l2cap_core.c
> @@ -4480,11 +4480,11 @@ static int l2cap_connect_create_rsp(struct l2cap_=
conn *conn,
>
>         lockdep_assert_held(&chan->conn->lock);
>
> -       /* Only accept a response to a connection request we sent and tha=
t
> -        * is still outstanding. A channel waiting in BT_CONNECT for secu=
rity
> -        * or the feature mask has not sent one yet.
> +       /* Only accept a response matching a connection request we sent a=
nd
> +        * that is still outstanding. A channel waiting in BT_CONNECT for
> +        * security or the feature mask has not sent one yet.
>          */
> -       if (!l2cap_chan_connect_pending(chan))
> +       if (!l2cap_chan_connect_pending(chan) || chan->ident !=3D cmd->id=
ent)
>                 goto done;
>
>         switch (result) {
> --
> 2.34.1
>


--=20
Luiz Augusto von Dentz
