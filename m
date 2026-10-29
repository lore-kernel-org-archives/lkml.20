Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793261994;
	b=i3PgIo8QUhXZXOciH/urG2TUtOHI96i+bWcF8hzR6sA+1lZKrnMvf8eJ1F6RNG4+YVt8
	 qU9KiaDkMkbmG1CYbeLtIL5PqmB4J/O2sr34uPyuhlMuzajw9APZYa+C0lw4eu18Shdy6
	 tG6SjQFI/B+5WdhkprHXkc5ZPwMAgdU8KMB40XFnmJrSDQmA7QPInhJl+3CgeFzGtopn2
	 a+1gUOI1QqOSt1zXzvVNpKtem0IyVecgn2BgMe/4O5OUChDbAFvl2LVOnFCd6TtjKaTdb
	 WUwd5TgVK/0EnMQsqTXdxHNhdBolK4Jz726ywKtrGAXFxIbS4+CrMcKnrPKsITsVEEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793261994;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kXOqiSQJA94Tx05bKB7kJ8VRta93p9NNx4w0EZdrfVc=;
	b=GRhhuI/tHypanciVEN2osR0QsWo3GvCLo2E2Bbev8QoEcu9rA/ZPd1g7v+FVNR8TxOwR
	 elc9yA9taxrlYptGu7osjuzghqmKMNQInHPMVxgDVg+y4TVkySxN18d9oBeTJi/iQBgh7
	 KNlH3RTBEKDxoXnBDQh/bEr9gsZNRjReEsCH9L8OxIvF6aNvGsYV1HH4Cn/Iqz3dQRui1
	 hGHBzJMqr2brKy60m3wQWLX9+j9W2uDlztzrxlJLjZ8IeerFW82DK25G1om7lnGghFksO
	 Re8bUUthaMnXbiwBy6NBvtIUzbbk7Cuimri81oLa0rkkH8crQplpHy9TUx3TYDImkww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GK1lp0E2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D71606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GK1lp0E2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 415A41F031E1
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793261994;
	bh=kXOqiSQJA94Tx05bKB7kJ8VRta93p9NNx4w0EZdrfVc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=GK1lp0E2ZVQQN/J04RE4C/lvLxHibbe40AgtuYSwZPkAJOGVZSnqYAECnOY3lVD1l
	 +Eg4vQGaBO54lxKXVlbN207sUd3AX+qE9aVExH5GAhhhmFCCcIX5TP70lnJzUfjEtt
	 SFJA182NbneiLVG49jQVj7NXtW7bGV651KwzJwjNXvmX2xB8EHBBIaZ72GE6Cv5iSH
	 bAkiV/ykVppChRs/tQfp7Z5N5BPMJHQln07U120fJv+pE2Fn87e/tXGt9XOcelTmnc
	 JaxeRIZinDw59TN4d9PBNzQ5Aoy7M3mUYopDig1BhTuRWFeGUb03E/T9Pg9IApZiLM
	 4FSWuS6jKL32w==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4301e334ceso151233966b.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:19:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzlMllaLaBEe3AkS4QZPm3+x+B2S7/nPiUngYxJIWfFoMTu0yZ2Meh9Y3GFToZexvh2w+YllnKdLm80zmc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIrhgJpxTvMFh1mrIe3tik9dhTKqngkuBYVIQ1yhUtPayJj4qL0
	+Af8kL8XU4GjmvzISkRjmiaHdVnKHYcAOyHZ2lKEsCE67pwESgckiAu8h9MXc3p51VhZUPiSomh
	n8HHujyCOJSr5Jt0vtz2LOvVgZbHX4RM=
X-Received: by 2002:a17:906:7312:b0:c29:6400:ef8e with SMTP id
 a640c23a62f3a-c49bdfd2fc1mr411845666b.42.1793261992920; Thu, 29 Oct 2026
 01:19:52 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029012803.222197-1-icb@fastmail.org>
In-Reply-To: <20261029012803.222197-1-icb@fastmail.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 29 Oct 2026 17:19:40 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_pq4_7MRnaLnKm=fz3BBTsY_+qagSo6jQZzdt-Z_EOsw@mail.gmail.com>
X-Gm-Features: AclHuK8JTTb6utrReJCmF_HwXNkxb--l1xkkIjG1hxGS7h3OLv0cKs-DFK7l2oY
Message-ID: <CAKYAXd_pq4_7MRnaLnKm=fz3BBTsY_+qagSo6jQZzdt-Z_EOsw@mail.gmail.com>
Subject: Re: [PATCH] ksmbd: revert fsids on durable reconnect and replay failure
To: Ian Bridges <icb@fastmail.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Tom Talpey <tom@talpey.com>, 
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>, linux-cifs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 10:28=E2=80=AFAM Ian Bridges <icb@fastmail.org> wro=
te:
>
> On a durable handle reconnect or a request replay, smb2_open() switches
> to the SMB user's fsids before calling ksmbd_vfs_getattr(). If that call
> fails, the code jumps to err_out2 and skips ksmbd_revert_fsids() at
> err_out1. The user's credentials then stay installed on the shared ksmbd
> worker. Later work on that worker, including other users' requests, runs
> with the first user's fsuid, fsgid and supplementary groups.
> ksmbd_free_work_struct() also warns, because work->saved_cred is still
> set.
>
> Jump to err_out1 instead. No path is held at this point, so skipping the
> path_put() at err_out is correct.
>
> Fixes: c8efcc786146 ("ksmbd: add support for durable handles v1/v2")
> Fixes: bb8bf7eb13b5 ("ksmbd: add SMB3 request replay support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ian Bridges <icb@fastmail.org>
Applied it to #ksmbd-for-next.
Thanks!
