Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793010509;
	b=vwdNRmHLMb+tjrq5AcBpE87YEt4Kj9cBqeFgKd48AB2hfNUAK58+ZqQ2fEuXU5PN9QOn
	 gr97oCoj6PKjh26hCF5F1GBZ2kOPsTOT2zDQ2UAB43towyFBHhxie895UFzAcK8cP5k23
	 lGBZ2BJucGwaOi2rTmzvLoc+jVB+orbHxzdXzNTZTwM7slJUi1+kWpS9bQ7j5LSDFzUUV
	 Pv8w3Xe3Jvj9iZUE5GlvEkIZrbdAGYwGbcJNr/5bCCFftHvW9orLj2oEGFfzGqz5nGUfz
	 xePJbAF9eDg86oAyudlpKjEazs8yz0z0T+MO8qB81hmo96dZVUY7mJHAoxlQAou9GxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010509;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Z/Nx//XuiuZSu05RUpnkPaT9G9UcEiJqWLgdwhD3/Cc=;
	b=dN6wzBE86BnK35pzD0+Of/SlQSAEbS+beC0KEsMxhkt9aiyrGZ0O6TJ5jTsTC5hpzKNb
	 JkkJm4PAzY6ZAXNIlSZRPu99FVUQlLe9sKnPpADJHNrHOrF0Iq569ZKRP0JvDyCnBKhVZ
	 MSpA0jyXSDwOM4VNxWP8iJVJ6+UFiux61YpWIhhV5y4DIKhi1+k1ow1s7F4ZCWxRkkZ24
	 1iLRA31dqSYFRRYRTYXz/OaY48+sMJ+T0WXk2S0RG1fRXX+KnFwXLcyEJnS0wi5pgx7An
	 1niLVJf5OqrSKXpfaNnrycUk5Je7NriEFdBXxK2ai3DNUpqWm9PlvJmmLvK1ELzxzsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ddpGZjyA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70083606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ddpGZjyA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 049AE1F01828
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793010508;
	bh=Z/Nx//XuiuZSu05RUpnkPaT9G9UcEiJqWLgdwhD3/Cc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ddpGZjyArUV3lMPf3+abTXA2RxrX7mbnck4xVxteZXt6rcbX8IZG4Wn8BBaZlTsIp
	 iZIG6XY0gaxWP61LyYYFLqfdN6wTtwjY8o7bNMweP4ryx5xqecl9K8YtkbszT4FH3X
	 FDcH0xfvBNgknyjKa6WzXv6qq2o8ZjKeEeNFL6Oo1txAxbl720MU6PEgj4wK1R7zXf
	 mo6ho36rvr0GaZyViZsxF0t/F8QRTm4EfmqKGax+yGskx9lo/C10iUO7BbohLf3wOQ
	 gaUt2lDG3Qdb+ypsL6TOJaU+2Y99xcuAgtIiWGqsQN2EYDTKZD7BS1q3wWShpzaXzL
	 7NVr8bBLNB/CQ==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c40f29667e6so447378766b.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:28:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz5UVNA6ltf4UJ/CXCoJ9Ln7Kv7YjYGaFf0Ixgiw+F5MihqDJFkNSpeeqKoYtwm7apwoPL+FjiSOADIY3w=@vger.kernel.org
X-Gm-Message-State: AFq9FYIiE5GhORZiaKFbs0aO5ERgM9mEXpip77GzHg7NgHkuwfZQIplh
	jjg2/HO6f2sKSHTg5B8jKjA4gWPgEh4Gzxje1PSPqakqNgY8iaqmkqINpnmD5aVW1mOamCgQmfR
	Ck7gFcFzPvj7VEZLudtPnk6G2hDsCPTU=
X-Received: by 2002:a17:907:100c:b0:c46:8063:220c with SMTP id
 a640c23a62f3a-c46bdbefbf5mr535736366b.11.1793010506723; Mon, 26 Oct 2026
 03:28:26 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026053422.61138-1-icb@fastmail.org>
In-Reply-To: <20261026053422.61138-1-icb@fastmail.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Mon, 26 Oct 2026 19:28:14 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_muFKkpGfhLuWgXyKuzX6QpJmBBueNa=7SE0SjZwmixQ@mail.gmail.com>
X-Gm-Features: AclHuK-f9k0Uqwon8K6YmJaDhDSPEnRRv4EIXQhAmDV9X7iJqeJ6j76El9biHj8
Message-ID: <CAKYAXd_muFKkpGfhLuWgXyKuzX6QpJmBBueNa=7SE0SjZwmixQ@mail.gmail.com>
Subject: Re: [PATCH] ksmbd: fix app-instance non-durable supersede session UAF
To: Ian Bridges <icb@fastmail.org>
Cc: Steve French <stfrench@microsoft.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Tom Talpey <tom@talpey.com>, ChenXiaoSong <chenxiaosong@chenxiaosong.com>, 
	linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 2:35=E2=80=AFPM Ian Bridges <icb@fastmail.org> wrot=
e:
>
> ksmbd_close_fd_app_instance_id() supersedes a prior open that has the
> same AppInstanceId. It reaches that open's session through opinfo->sess.
> This pointer is not refcounted.
>
> Session teardown detaches durable handles before it frees the session.
> It does not detach a non-durable open. That open still points at the
> session through opinfo->sess after the session is freed. Another session
> can supersede the open at the same time. The supersede then takes a
> write lock through the stale pointer, in the freed session's file table.
>
>   BUG: KASAN: slab-use-after-free in _raw_write_lock+0x71/0xd0
>   Call Trace:
>    _raw_write_lock+0x71/0xd0
>    ksmbd_close_fd_app_instance_id+0xd9/0x670 [ksmbd]
>    smb2_open+0x3e10/0xd910 [ksmbd]
>   Freed by task 212:
>    ksmbd_session_destroy+0x38d/0x480 [ksmbd]
>
> Fix this by looking the session up by opinfo->session_id. The lookup
> returns a reference, as smb2_break_collect_channels() does. Recheck that
> opinfo->sess still points at it before using it.
>
> Do the lookup without m_lock held. destroy_previous_session() takes
> m_lock under the session table lock, and taking them in the other order
> here would deadlock.
>
> Fixes: 16c30649709d ("ksmbd: handle durable v2 app instance id")
> Cc: stable@vger.kernel.org # e0386cd6498b: ksmbd: validate AppInstanceId =
takeover target
> Cc: stable@vger.kernel.org
> Signed-off-by: Ian Bridges <icb@fastmail.org>
Applied it to #ksmbd-for-next.
Thanks!
