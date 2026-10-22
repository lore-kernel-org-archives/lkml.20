Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792669709;
	b=TKkXVmlZFXMSWdUnfysz3HRBR0rdX1Fe3DjoSMEYT9gms9nNcsw79Oc5nP4Vvm/uNLg9
	 OUS7GNjvYppbaLD0mJ5HCKae8BT6ZTTCaK+iDTAO8WnTfn2eGGkO0Y7UuQCaHL5Ur88rQ
	 38Fh0uygqHyvU9jIQjnvFd8hYvkC/pTq/gwhJnjRuSTNm4g3hQY6X+Wsf4lkQugQvuKZb
	 OJDAWEw+deDHXxLOy3/Y2h64gDjSDkLmj0q8BSi48Fl2Cq9+xPPmhrQ+XCMBD/nzVfGzv
	 hFCDWSW24yj2Ws+m/hPMAG9NYCv2wW53l+/mR1HvhV24AokSglo2XjeY0ugYqwnhg5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792669709;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Oh7rrgGUJ4JtljrvDgVPIYGbh4nki2Q2qiaFyL6YTYc=;
	b=SzCL6IDrg5ZzjsvhgFesTUJFluXbP0bITxRzs/1byF9TN72O7/0P3B2uFd929tIKKsvk
	 YRaUgrs7oO6pZo5pl4gZeJpWc0d+9SvgJ9ya3tweuzSUDVmELtKPK4NBvtt7Mvp26BKlx
	 gIhcpOLqWcXfuHM8nP04Wp2OKZByEty7vN6akAg8G9taeZ8G3HT8/z7dnwCdWO3VhrZQu
	 kSn9R7pVZTvmv0/MkTRGbw9/vobQoMq+Kb16bHTGrSP7NMfNBA7ExpB21FxLv0eKnf5tG
	 kmmnLjWTqAXEkkDMK6R2hUMaYrTIfyAGJfk0q5xmfYfgZ+q7UDsbXD7Y3UY/vVZbtJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A7jW3z7G;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFF2606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A7jW3z7G
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F05111F000C4
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792669708;
	bh=Oh7rrgGUJ4JtljrvDgVPIYGbh4nki2Q2qiaFyL6YTYc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=A7jW3z7GJlsaRW5WpTm2sDkx3AsgrMcmbFo9DSA8T/7Z27lSmp2o9LE0GvmTiAUSw
	 dUdqD6LkpORGJvNREWB7+i0ruhksdfvclfc7vhMBkcc5H6tLbz6WH12uuKwHVwe4z8
	 yicOcN1ugL61374GReyN8YCR6TaaeYCytVrkwcKem7ckoT0uzGRJg0oeodpCoPBuPS
	 o+K1WX4BrvyRi9UFPltUhGFq6mAg+vNCVoq1B7Uc7gmFunBOnrClS8okF0hgnrFMNh
	 sH0aKZfD0WYxh2YRxezAeFcY/tnstVV03X70XYbB1KAnhJ0M7QXDYq1Vp5W37ayjl6
	 VHBhGQ9ZauPbw==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c2acc1e170cso251515266b.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:48:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByDHkjckU/YnsayTys8k8Mh6Iq2yvTDwiJmqkEWB+5sf4s7qdinn+b44yUkWEFZTKOUsU5wtT+SpdjoBYQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKrItkOIIU+LbjU5rHkP+sRtItpHtBzUMPWcNNmE4dMK9yht8oA
	+QuGLiXPgfLB0/n7hQKsEqM0SN3SNStsYe9SrOFWhkyITzfRI/cYpAtG3FPKFNLH2YtwiOMDDVB
	t0h5i9xyyTNWFf/5Sab+A+6xUn76KS2w=
X-Received: by 2002:a17:907:3cc5:b0:c40:231:6eab with SMTP id
 a640c23a62f3a-c467961c72bmr533703966b.16.1792669706666; Thu, 22 Oct 2026
 04:48:26 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021115400.30885-1-mike.michalo@gmail.com>
In-Reply-To: <20261021115400.30885-1-mike.michalo@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 22 Oct 2026 20:48:14 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9_B=QvrmzV-40HGwt=tuw8nZC2ZhgjrrAgOJFhGBKo2w@mail.gmail.com>
X-Gm-Features: AclHuK9_GGVxl8eUb066-OANBotXn2OW_iZaRg71kLZYQ9bJ0MjX7XK_lH9Uwks
Message-ID: <CAKYAXd9_B=QvrmzV-40HGwt=tuw8nZC2ZhgjrrAgOJFhGBKo2w@mail.gmail.com>
Subject: Re: [PATCH] ksmbd: restore Kerberos logins with released ksmbd-tools
To: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Tom Talpey <tom@talpey.com>, 
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>, linux-cifs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 8:54=E2=80=AFPM Michail Andreas Michalopoulos
<mike.michalo@gmail.com> wrote:
>
> Commit a47634cd729b ("ksmbd: expire SMB sessions when Kerberos tickets
> expire") added a __u64 session_expiry field to struct
> ksmbd_spnego_authen_response, growing it from 156 to 168 bytes.
> ipc_validate_msg() requires the response to have exactly that size, so
> the 156-byte response of every released ksmbd-tools, up to 3.5.7, is
> dropped and Kerberos session setup fails with STATUS_LOGON_FAILURE.
> The other way round, kernels without that commit, including the stable
> trees, drop the 168-byte response of current ksmbd-tools master, and
> ksmbd-tools has no way to tell which layout a kernel expects.
>
> Pass the expiry in the reserved area of the embedded struct
> ksmbd_login_response instead. ksmbd-tools releases with that area
> (3.4.4 and later) allocate the response zeroed and never write to it,
> so they send an expiry of 0, which ksmbd already treats as no expiry.
> The response is 156 bytes again, so it works with those releases, and
> every kernel also accepts a response that sets the expiry. Use two
> __u32 halves, as the reserved area is only 4-byte aligned.
>
> Fixes: a47634cd729b ("ksmbd: expire SMB sessions when Kerberos tickets ex=
pire")
> Cc: stable@vger.kernel.org
> Closes: https://lore.kernel.org/all/CAO+rqLhpPvY0NLrAnZjFXz0gOXnA6zsXxK8x=
CgtA42XUkSsAeg@mail.gmail.com/
> Assisted-by: LLM
> Signed-off-by: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
Applied it to #ksmbd-for-next.
Thanks!
