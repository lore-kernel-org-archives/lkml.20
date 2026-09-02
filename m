Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C554AFE09
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 21:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788384384; cv=pass; b=h+bdE4H/qOEiGLcRz2DgMFwdoN6I2W/kJp8mFkBUmOEXyRFiyl725739Khn1xIOAAmdtkj8aS+DJ1NJ1JBEeEUEgatBm3vGKpJrBFb/FPBrmZbB3zJgjpsh1JwoqOxRrO0Gy1PgHWGZLTdd0p1uWSdI6xpTfz0+v3Seg7KS2JqY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788384384; c=relaxed/simple;
	bh=ISgVzKL38j++CmVV718kv6idL92c8Zxw083Nw0B4lyY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GEGJDqncHwn9N83odpAqIrsx9Rzc23A0Pe9EEfXisx7pTAHJUIFZ6sD9s+QVDLd7qXsFVvEilyTPg8DDTtXzhFkgGxF/yDjL1PB9v4RZrRSG3y6b6K4Q3Ak16UVXSF+A+pnDATgU3nFg3nhnUQtPZ6JXFnH4VZjMCFdP4m6e1MI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=PVsGywyQ; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="PVsGywyQ"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5301db51586so18743251cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 14:26:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788384379; cv=none;
        d=google.com; s=arc-20260327;
        b=Ht5q7PtZCk7s8xKZxAlDVeJgSOkrXImFlnlLktFenXsw0vI0LN452Dsg3vh3E8H48G
         1U5Ed7jgAaSuEBnQ2rg3b6VpCcpZX9ISnVgXR08LdYctHV892U1uc0fKxkdcJvYDusRU
         SeyJC59SBjjF4a+I5eFGDAs45iPY1jasIbgZhPIaTGUTJKVlFUgx7vp5v1K2N/QVnnt7
         Ej5AALHmRQP6vRwDONWGlPYQ7Q2Tl1X+BcjFeUhi0JkuWHEIaXQMeyjI9qt3Ih6OunNz
         f+VkkGwjP9z9YWGCkThyQzxCXgoN7Vh+UOsxwMspPX3Zflpr1RTMHqWTtJgPIXQjc/wP
         06kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BzEZU3zeMRYJSpuhNSZ/KarCUxW8+F0Dr/9w7Hweq+0=;
        fh=bEKusMgRP3vYDwS+NavNigDQbN/ugnFsEmBTmA1poPg=;
        b=OMwm8r7DPI1BNDGLs1hKfQiRfIx0Y+N1u+LJkXvYq61/sIQZXc0zOCxHP8gVnfz22g
         s5RHPaKhQVkFIp0BMzM8AoUeFfx5U/oy4JGimxxCqM3wlLlVGnCJlOG21VFaZWPFJTJo
         qBKxa+kxRyRsUJ57ihJj+Xz6VwgXva1cKgtdHLU4zx3JtA7TRC0HQ0NLXhBjF1x5CyeF
         qTiTMr2NGn/PhS07TaNaXAPYT83uSTBDLyCxnuyoxZySw7WsJOE+mMZ6m6usMrIwz5XM
         EPTpCi8bZHrA0IZL6wPAZxbdHTZIV46tNXwEFd32q7LbyF7CBX6duIgm6mxtz2paUn7u
         /dbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1788384379; x=1788989179; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BzEZU3zeMRYJSpuhNSZ/KarCUxW8+F0Dr/9w7Hweq+0=;
        b=PVsGywyQPBW5tFM9yFx04UmmD7fj/mAY22ikNbWkBkF/j7pSlCq22JAv6WIiRV6Vj/
         XQ0wmMbc2lpwUTf5t244lwfQd602QYv8giUMVhkqyrgf3o4mos8/l83ZyEdeNt//B7vk
         5x96CUNbqtCfEEUNSp0UHZh+xdskpOLdNf/lAybpLx2WFL+TsQXmh81/nQ1Dbp1SQ9ru
         vQ+BeVy6acLPP6AJeHQhnntYWTpbKh9qf29NrlHy38SF9viOdGZoZrp4Z2i91OEKtglN
         RXpnl9voN04/v5ItKcPEE0f+vn2FN+c8XGXwRYgdY+argItJBIEGyMH+T3xEwcjdSeIx
         hZNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788384379; x=1788989179;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BzEZU3zeMRYJSpuhNSZ/KarCUxW8+F0Dr/9w7Hweq+0=;
        b=pw4CuJzGIlUCKrfyIdJLdbjw/d4XfFkOWJRyOV89vmkAHVpZ5qLHpsIOw/H+5VEYDa
         DirXXKTxl36ze3GdFy1WDl4SlDIxU6F3mAYZ3hDcR4uNcaMn4+cOtqNBTZx82nDq6wzM
         dm/SIdEg9WrYAIquUR2Oj+EZM5yiXh8QC21+fTSEQ0og4trdvPvPeuNjW3npRIL9eQ4k
         K9dKQYnzAMJNuKsLRJJ6QAnC2tQvzmndaE7WC7h2LeXE1YYHQ0fBJzsO++m78uwtHEcO
         VsMK/GBx2R9VqN34M9vsDtEGg3OiRYzIdDhKPbK19mftrX6tFGu0XCwQZdlnyJII2+Ai
         KlYg==
X-Forwarded-Encrypted: i=1; AKwUvBwPxJsfJqISbrr1FZWGI1YjghClVq8qBfP6NYYRMZhumZRIXWw+T/C7v2/XK7CHFicULt/gqDhWUdZl+FE=@vger.kernel.org
X-Gm-Message-State: AFuF++nfkilWYaIyNiFvmo0D4L91JtCKhYl/QO2M7pfkhvSbL2wlGtWQ
	Qi6p/sJ1PFQuDR0lZCoGRp3DOUjFZdogZ5wf9U530ZkjykW3d0/N3mT9PDp6Q8e3u3AcTVcA1io
	kU3EwcnQTk/ifGJu2Fcj4KQw2gFX2J43ZkhqA9uzIfA==
X-Gm-Gg: AYBFou2ycYjTvF+oLi6u6KkwyUdptBDlW0DYLNB9Ib6G3/gSVTUEoSCXUfYceRE58+I
	eIA4i0jjtsQ4r80Qtfjy/aP7wwiyppmJM7jVf6iINA4bb1EM2kIsjHVqr9JKgikMC1CWpwCwI5l
	o7Dlc/6M6JU47DZtfuIgjYVA9jVTkW7dHDokVgjVdpTmiOsxVxQKfsqg6bqbi5iAhJMiZTz8HPA
	SjPJDFT3TofF4WjkrgzF9u9x/gFBVzWdKZjPOqsMbDgPS0FD2uetdUQQZEuzj0nSbBzmsYO1DH7
	4zWZI05raNE4XW1n54Kqkn5KrlZ1eTQbp0OcYIZWgMif
X-Received: by 2002:a05:622a:2295:b0:51e:47a4:4851 with SMTP id
 d75a77b69052e-53036b727f7mr105890781cf.8.1788384379448; Wed, 02 Sep 2026
 14:26:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824225648.316962-1-sgogte@purestorage.com>
 <20260824225648.316962-2-sgogte@purestorage.com> <d55e8223-44cb-42e7-bb41-d659f206d573@grimberg.me>
In-Reply-To: <d55e8223-44cb-42e7-bb41-d659f206d573@grimberg.me>
From: "Surabhi Gogte (she/her)" <sgogte@purestorage.com>
Date: Wed, 2 Sep 2026 14:25:43 -0700
X-Gm-Features: AcwNN1W1Jo8WhaqrqGF3F7_3mFTcz7nsh0oki4TgJRxBqDXnt4EGpkyQItoB3jI
Message-ID: <CAMof9cWp4dv9PqvP4E6hO-arvKBmuBnHoeZ8JVybjM49sZt4_A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] nvme-tcp: refactor I/O queue setup path
To: Sagi Grimberg <sagi@grimberg.me>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
	mkhalfella@purestorage.com, randyj@purestorage.com, adailey@purestorage.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 30, 2026 at 2:56=E2=80=AFPM Sagi Grimberg <sagi@grimberg.me> wr=
ote:
>
>
>
> On 25/08/2026 1:56, Surabhi Gogte wrote:
> > Split the I/O queue setup helpers apart so that the individual steps ca=
n
> > be called directly from nvme_tcp_configure_io_queues():
> >
> > - Queue count negotiation moves out of nvme_tcp_alloc_io_queues() into =
a
> >    new nvme_tcp_io_queue_count(), leaving the allocator with just the
> >    per-queue allocation loop.
> > - TLS PSK validation moves out of __nvme_tcp_alloc_io_queues() into a
> >    new nvme_tcp_tls_check_psk().
> > - nvme_tcp_configure_io_queues() now calls the three steps directly in
> >    the same order as before.
> >
> > Signed-off-by: Surabhi Gogte <sgogte@purestorage.com>
> > ---


> >   }
> >
> > -static int nvme_tcp_alloc_io_queues(struct nvme_ctrl *ctrl)
> > +static int nvme_tcp_io_queue_count(struct nvme_ctrl *ctrl)
>
> Strange function name... maybe nvme_tcp_set_io_queue_count?

Yeah, that works better. will update in v3.
