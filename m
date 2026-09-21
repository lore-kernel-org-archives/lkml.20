Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8284D4893
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790009278; cv=pass; b=etVFv/dGAW8Rabg2yCDKwQu+H3IXPuKOHWMY10QcW+uqcQqRpbf+MRXIjnXDXrAdov/E/R7FV2KJiuOy4DDtogw5Ff7aBx1t27KzqZXByzc47cisTNpK3T5jOP08t5D7C4x13GABCqwWAp/jKoAgTyjwu/3vI+Q4DaYpqoexnlk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790009278; c=relaxed/simple;
	bh=RwZnQQhFtAM7evdQmSZFlOB9sFdlZveU2LX6vUMde7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kYNSSwWCoXRx8NOfZwINchCGIEfjmS7lw1qnCGmsgZbwc2W0VpwU/NsddaHcF3Erwilc8U+hIHIMV413LpMX3IldP2h/A5bvRksZ0ooJ1jK2ImP+9cbijzMveP2X3u/VTOGAD6aXgCUL8Bxs8SvR+4F6ceBXmHfuXrEgdXsAiJE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s42svd9T; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s42svd9T"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d3b445a84fso149415ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:47:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790009276; cv=none;
        d=google.com; s=arc-20260327;
        b=RYLTtqav39G8dJcVgtNlfN5066Ifac5ixNSmckcVFhwNGocSnXc/Ogh5uZNsRwGooL
         qIjft3ksJqBxip8Wjl1F4Gm+unRRGJwhvFFS0cU3PG5Dx4V1CV4hMt7rDMZronxCSkky
         D6ATkARzdl6ch8BzQCbSCS5OgBjzvdUgQYXBMW92+fioCKsqPZS+MYOyaSLWhF36Wy3Q
         6mEmJu0H6UA/uwGbVlTGqV+7gFk9V59ne5ua/2FMFXDPDi7+lb2NgtNNrZPwZI3qhWTa
         4Ql5m/Jpw6kRfWi/BnkuBW8UOz2W2T3Unl8sVpE6ITfv2b0lmhqHvQ7e37MmZ8QM2aPk
         gt6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j0vE4kZPOKuoqChBoEWd7u0oHqRVqQKnzo9W4sUzGbY=;
        fh=HiV3f77PVCLSwrJW3VeX6aWPCJJR1d17zOtKZQeISTs=;
        b=FO7//wBEoy6TmkjvpeLFCC9vNbq17BS3cenSH0UuHOtcfw0X/mA5rhSAoI4G4OCq2q
         /UaUd3Vb9MLt1NtEhOuF+U+42rTMm3q1sJxEmQhA52yV1XxbZA2wYlxfPFlk+aLBt42i
         ypCsscu4LNyhrCCAH+rJCn6LBSBCwcinYT51yBXXTTZNtdYIfgO2OnydKOOo+ir05DE8
         Sk4MHpqzZ5Zq7xi8pqQ4oVE0/a5jNTHZj58hjIsUFcN84FFxSvr4wmFJBGJ4L6wFtyeU
         RsaHgdMWt0yBQNQAEQEacgET6JWLlujk0oBjEHm8y+J+5bY/5+AHfOhFa3G655PTPryF
         DJ2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790009276; x=1790614076; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j0vE4kZPOKuoqChBoEWd7u0oHqRVqQKnzo9W4sUzGbY=;
        b=s42svd9TYqpSfHg2EF2dWwjc5WXqzhEyla1skLnFXnxRT0QFqfiEGThIW4Ruvn17ct
         T/CoOkyJV4jUeDiy783GJ8/KCX9rrQ7E27WRrRUMjaeM7P5jrkD469PsT+yRaEJm0jRS
         ArKZZpYMXi7IifTwSvJMZPyV/3encSQ9yVCVBXD/cFaTHg/prt9E6hkyIo0APYJHPKBc
         kkv7laT3dc/ThaeYmxDvr/pkrjQGZK5m3BGv7wGI0TF4TxwNhYByB4ZV+dnbeBXfsfVx
         q5PvzH8nmTffXl+kMY4dapaYhSYeTt/aBZR1uIElvgumo1NsKIawdvgh3BhGVxDt81CH
         pjiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790009276; x=1790614076;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j0vE4kZPOKuoqChBoEWd7u0oHqRVqQKnzo9W4sUzGbY=;
        b=buoGvKqHUdizojwXJuRXvP47nZYMM8vR5qWj0xAQ2pIMu/SVbPobEc9h2EUA/6Eo7k
         9keVGNJiZ+C4juIYeTfXN9o7/1BI9HZ3X8srzyCWQQo9CdOOPc+YTfwRooW5xMMMB0L3
         9ryZNDKOL23c95JcPuH+oRVlsgx//4qhEGQ5iOPDfWUSs9tfNCuA3K399cAW0CKjE59u
         T72y7OgL5CPRHRxNAv9nEx5NL48rSWP4oIOKBTg8Dbk/1fM2FusgDnDV4csPHjwJSo3k
         qLHuAdcpeW6Xyf4TgKow2j0C1uueEVT02ctj5c2/brw0U9XM5tJUvSH6zMqmEcAzAWao
         rZvg==
X-Forwarded-Encrypted: i=1; AKwUvByDHzx4derG+g0ZrsflkebnopcmM4ElEa+P/Vcc/lB/8I+XMjtEJxwhbrlq3QhKCQdQm3Bq4MXvEVY36mE=@vger.kernel.org
X-Gm-Message-State: AFuF++lkEL06LL0jVEBkgrvdNTdfQLgD6QvKEkVqnxnEQ8gH/SXZlS30
	U/X22Xqf6XBx3Vw49G+GICsPYSTTJ0J4sgjgrecEz97q6hxH913G3hXwFjMTxpdDr3fcO3Wwyda
	7hXOUrrVND6aYKtCwezI+kd3vWHFh5TcRXfYdbQfq
X-Gm-Gg: AYBFou0EE/h+WX/1t0ZNoPSrzqL5+7uf+Z/CubSX0iNQtKPd3Z2fJUgOrvPRLcpj9jM
	l6lhOrw/PTbik7EN8dioW8o3DpoaWu+si89r4jPcDttugDi3CIOPgL4+GDFdS0TIVyHZRvH6W8F
	NDmITrR6NWYSenMR5Pv7tznSzl4gh7i6HTbxEJ47/2E45b0WkI64FRweVR2B5kNnkzBZ2i+7YI6
	qpZcFBqmRS1wLnoRQMx9Lu+1rGJ8+eW8HiMs/PXmSL3UFb0xdG56dF4zSeicSfTBnR7Ey0nxpcy
	XF9V8TyaIxjsY4lcf7M+BpERLjeTRZ++ytgITIrY/qXHAxHG3IcPoTByLQ1QVoCYHZso8naf0Er
	SImdCVO50OSbw7fGHKYy5ziIhG/QysXA+LmVRRYCE
X-Received: by 2002:a17:903:1a10:b0:2cf:9ec1:ea6e with SMTP id
 d9443c01a7336-2ddc1703951mr12870035ad.8.1790009275675; Mon, 21 Sep 2026
 09:47:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911-uring-fdinfo-tighten-v2-1-fa24d517035e@google.com>
 <178914981183.662923.3814591941846027409.b4-ty@b4> <de0221c0-80e7-499b-b46c-66a2adc78db9@kernel.dk>
In-Reply-To: <de0221c0-80e7-499b-b46c-66a2adc78db9@kernel.dk>
From: Jann Horn <jannh@google.com>
Date: Mon, 21 Sep 2026 18:47:18 +0200
X-Gm-Features: AcwNN1WR8IhxT4hGSiQT8g1ydMaTBIgMm469wwiCUSFeC3f7b2SE2WiOkoQQuW4
Message-ID: <CAG48ez3bX03GfFK_HJpMP8ZWEZ0x7Q8qtaMbL9=z5ZyeqqtmnQ@mail.gmail.com>
Subject: Re: [PATCH v2] io_uring/fdinfo: ignore IORING_CQE_F_32 in last CQ
 array slot
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dominik Maier <dmnk+artist@google.com>, stable+noautosel@kernel.org, 
	Gabriel Krisman Bertazi <krisman@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 6:45=E2=80=AFPM Jens Axboe <axboe@kernel.dk> wrote:
> On 9/11/26 12:03 PM, Jens Axboe wrote:
> > On Fri, 11 Sep 2026 19:56:13 +0200, Jann Horn wrote:
> >> A cqe32 entry spans two CQ array slots, so the last CQ array slot can'=
t
> >> contain a cqe32 entry. If the CQ tail points at the last CQ array slot=
 and
> >> the kernel wants to write a cqe32 entry, it uses io_fill_nop_cqe() to =
pad
> >> the last CQ array slot with a dummy entry and make the tail wrap aroun=
d.
> >>
> >> However, malicious userspace can directly set IORING_CQE_F_32 on the l=
ast
> >> CQ array slot, causing __io_uring_show_fdinfo() to read the second cqe=
32
> >> half from beyond the CQ array. Change __io_uring_show_fdinfo() to
> >> explicitly ignore the IORING_CQE_F_32 flag in this case.
> >>
> >> [...]
> >
> > Applied, thanks!
> >
> > [1/1] io_uring/fdinfo: ignore IORING_CQE_F_32 in last CQ array slot
> >       commit: ab394388d05977f369e8e8d1beceae47fc3c5e72
>
> Back at it, and wanted to move this to 7.4, as there's no point
> expediting it for 7.3. While doing so, I took another look. And
> cq_head is the raw ring counter, not a masked index. Hence I think:
>
> bool is_last_cqarray_slot =3D (cq_head =3D=3D cq_mask);
>
> this is incorrect, as it won't work past the very first run around the
> ring. I fixed it up as:
>
> bool is_last_cqarray_slot =3D (cq_head & cq_mask) =3D=3D cq_mask;
>
> Just a heads up! Let me know if you disagree or want to send a v3
> instead.

Ah, bleh, of course, my bad. Thanks for catching that!
