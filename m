Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4905B5013B7
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 18:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788459072; cv=pass; b=sOWLFfOEElsgItuLOj+1j50M1DISBLzzjc7WYK5bXLQeSBlAdlMjGVLec9Flz9tqGNBh9UgF35z9Z4yeWp3IwNl0P1sysIdwqG+t+Ej9rZqLn5XAbqdAfdn/qa1aiSbmTpwYPw9jz1EzDGM7AmVz5Bm/bniCzY+q0khIdt8xDZo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788459072; c=relaxed/simple;
	bh=fXxBVZFHxevQj8B2WKb/l5YHw97kqKkmToXCtWsCBCE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K9CJ5PvKt7OeIRhMQAyXHM3lAjX2AthCPSbP1NPa3jkcXvO22kH4jN4m+c+nhTYXuMQsPzGcqfzuKcAhERWVYtfvR1+oFT9FmPpc08UwvSpjRunSAl5z2iLEkOl72Pf+iDYHEUdYI4YTO3RlegS5JweMLc1wnipPhBCD3qlKTpE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gisZZoLH; arc=pass smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gisZZoLH"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49b96837ca3so1218375e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 11:11:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788459068; cv=none;
        d=google.com; s=arc-20260327;
        b=eIf9fDdWIGxZwnfNe4ytXLYJXsG0GRSmlUZu8pZrx2euWMvlreoe64y9TyL4h3gbj1
         5bVaM4Xv/X3Xjo7JWf+nrms0k3m+kJDd2wy/Ii1/Y36HsQ8Bj/iWvahiX3/vhRoTB1x6
         glv120l4f0gRu42ToSl4X48T0kWKrVA3J/K27Ni3rG82HA3m/IgbzjFALv2iBwAGFoaN
         7Sn02np7MAMx+niIK2FfYth3DjFao6B7oyN47VUzZYelCoTMYF6GUOtIFDuZKizumetL
         7wYIeSKOyO8m1Z3Ef1/onMpWy6tOvoB/jChO6R790dH5io1NZru+4IkUNt4ID3qmYz4c
         ZrxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GNUdEEWKQVjdN7q8W0TVhZs4T4y8jeYY4j1GTYsuFeU=;
        fh=CWc7vONYYOwcxz2TRAEzK3E0ntWCj/636ejqFedZX3Q=;
        b=QFQ2w98Yusm8vB4mnFWMUWP2tsojDGmlywGnGGB7lip2ynthqWIWtGk67RNlKgKpeS
         M0GC6XC/v71tc3xjVseTIPGBPorR4iJoACAvmcgIgFq9/TkE9v9IQDbFWTfIB0jf20e/
         67qypqcsei8Hfv7YN6S6Iz1w52YVaAmE9XPNNb1A2SbfPN0IGqUFBYpD80vUfH5D2RLm
         7NRxCIXeA82i2+SLWguGSEv9kO4VE8dkjjlpyQhEJpvbUQvG+yi+KWBt62TTHfwpdPHx
         x3lZmk5FkhJGOjvMJp7MgIBqlP+Y7akyOvEVxVN6HVCEyj9vFrS1gyD5C5UNG4vyftx6
         /NQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788459068; x=1789063868; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GNUdEEWKQVjdN7q8W0TVhZs4T4y8jeYY4j1GTYsuFeU=;
        b=gisZZoLHY11v8NMjqTv1Ri6KYmcDG9cqJ+uYj8XsCAizk/X0Dy6gMQE1+OCpxy5BF3
         TWx2/dl2Pds3alDtoiv/QlwZH5DTor+UnK//cc9bjk2Jz3z6jnl0kVmgsJYo1iWYqhZ9
         3sF10kKkTk2XIDYKIvSxl1ZzOJ2FIxM+phzIM5q5ucyfL8yLOf1mCZFoJxG49E9GgWZs
         MftkeWyNN9kQYiAvc/yu1rV9aLJBGk2rkl1g8M6mLpSeiGYp2wqbS3JZcZNXG/gfElAX
         S2AP0p8VbNcRNALxqwzcuZ0VzfRBOIwFoMur9Juw+B/FDnGfVKwnG1h5H7EjdQS43or3
         FtPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788459068; x=1789063868;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GNUdEEWKQVjdN7q8W0TVhZs4T4y8jeYY4j1GTYsuFeU=;
        b=qUzX9KC2iY4xNF+iyuqdlW5qS1efwbCIUmIujdOmoK3y7RAHFOfMaA9Q/VLkH5Dn7J
         5rw+WbzXBY+f4ICHVfhpL06D1WV90uZ2qb37WhDuQzi1Vs4IVZfFwBdl3d2Ty5xd6GaG
         LvyHZs5rYMafIRKZ1b8jRSkO0y4R9Llw8fpI6rNDsNx/xQEe8PX9kywE+RK7rc23p5Iw
         qUhyM6JXgQxxSxp8rpc/OsG6Y7EteeOT5Fc+TXuedWQg1AUIjNoV1jMPBaYipeEm/nXr
         rK/vmjaVu8drxFEowphUk0Aez0d+rHbCfYsNusPRo8tcrXCAOK+gk8D2zsCDDCAS6qAP
         +Qrw==
X-Forwarded-Encrypted: i=1; AKwUvBxqupEnm4dmclqEeEqYft6b+Srv3MslWrfbsM1O07+viAg8fI6ICyqdq78JKq9FKeQxGgnOgYhRH+565a8=@vger.kernel.org
X-Gm-Message-State: AFuF++lsAJwx0nLnFGNrG+a+gHTohuTj7Ri9PwP19U3p8ZhU8TStPkUr
	ZtHvYO0XiEgLq5fgEUXewI25bKz0vvkJmVm3ms4oVRhgAzMiZ5+a5cInqkwdo0Hiwo4/OBL3hb6
	VTlcDytqv7YL/trcdYLdytC4Siv0IqkM=
X-Gm-Gg: AYBFou0ygqCDrMYHe0gD8ylbT+METLJ75IccELLWy9sxu2+Ex6H1Zet6kCuVLmdLjA9
	ygCJv6eSI7LZ4BMDb3YInelJTqNpqce21WmNVPsmJAOBbPj/U9x9hp3KMPZ85qAHadsqysa3wxe
	wGlSrZmY2KDLxIWP1VJ3czoi6msY3G5Cjm+6agJ5ikFjnBNZwv2nJ+2TRjuJT+LpPpkvL8y0MLu
	KwvaV6FnlS33GybCf229UsPTmXGSfXNxfEAzU4nEBpo7HyD4N9jjNTbFoL7/WWchl6G2BLamehs
	uibKGf2k1nYxDZ5rywdc1evrcUBLrsHBvwsModDJ42/jaHIBtrIrkayxYZXyhzF0YH6LMjbN8fd
	YCKiCPs6IRLeGCzkm7gQqsBn0s5E=
X-Received: by 2002:a05:600c:3587:b0:49c:cee2:1697 with SMTP id
 5b1f17b1804b1-49ce583bc25mr243260895e9.16.1788459068282; Thu, 03 Sep 2026
 11:11:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902225708.2379840-1-csander@purestorage.com> <20260902225708.2379840-2-csander@purestorage.com>
In-Reply-To: <20260902225708.2379840-2-csander@purestorage.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 3 Sep 2026 11:10:56 -0700
X-Gm-Features: AcwNN1Wk1maw-DrWq2_P78Fm26WaqGkngFVI3rHwve7qSgVEiY7UO24DLet1Cpo
Message-ID: <CAJnrk1Z=JgOGH3m8aMRcK0fBRtnHLQutHGc5aqht3OU3uMQ_qw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] io_uring/cmd: split io_uring_cmd_set_res() from io_uring_cmd_done()
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
	Sagi Grimberg <sagi@grimberg.me>, linux-nvme@lists.infradead.org, io-uring@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 3:57=E2=80=AFPM Caleb Sander Mateos
<csander@purestorage.com> wrote:
>
> In preparation for setting the io_uring NVMe passthru CQE results from
> the blk-mq request completion rather than the task work callback, split
> out functions io_uring_cmd_set_res{,32}() from __io_uring_cmd_done().
> io_uring_cmd_done{,32}() now call io_uring_cmd_set_res{,32}() and then
> __io_uring_cmd_done(). This allows __io_uring_cmd_done() to be made
> CQE-size-agnostic, with 3 fewer arguments.
>
> Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>

Reviewed-by: Joanne Koong <joannelkoong@gmail.com>

> ---
>  include/linux/io_uring/cmd.h | 23 +++++++++++++++++------
>  io_uring/uring_cmd.c         | 33 ++++++++++++++++++---------------
>  2 files changed, 35 insertions(+), 21 deletions(-)
>
> diff --git a/include/linux/io_uring/cmd.h b/include/linux/io_uring/cmd.h
> index 331dcbefe72f..67f2ef700c43 100644
> --- a/include/linux/io_uring/cmd.h
> +++ b/include/linux/io_uring/cmd.h
> @@ -50,19 +50,21 @@ int io_uring_cmd_import_fixed_vec(struct io_uring_cmd=
 *ioucmd,
>                                   const struct iovec __user *uvec,
>                                   size_t uvec_segs,
>                                   int ddir, struct iov_iter *iter,
>                                   unsigned issue_flags);
>
> +void io_uring_cmd_set_res(struct io_uring_cmd *, s32 ret);
> +void io_uring_cmd_set_res32(struct io_uring_cmd *, s32 ret, u64 res2);

nit: it doesn't look like anywhere else in the header omits the param
name for the cmd, so maybe worth also having it here (and below) for
consistency?

> +
>  /*
>   * Completes the request, i.e. posts an io_uring CQE and deallocates @io=
ucmd
>   * and the corresponding io_uring request.
>   *
>   * Note: the caller should never hard code @issue_flags and is only allo=
wed
>   * to pass the mask provided by the core io_uring code.
>   */
> -void __io_uring_cmd_done(struct io_uring_cmd *cmd, s32 ret, u64 res2,
> -                        unsigned issue_flags, bool is_cqe32);
> +void __io_uring_cmd_done(struct io_uring_cmd *, unsigned issue_flags);

Maybe worth adding a comment that any caller using this api needs to
set the res themselves before calling this?

Thanks,
Joanne
