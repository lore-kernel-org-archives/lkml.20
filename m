Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C1F49B1E0
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141506; cv=pass; b=Rvzbw0Cw8vBGcBHof1DDg+/DlvlS7Jo5qKRya7DkQx8eBFJo9xdjZIaJ5MRgPHiBKspNV4tWd78Yf0r8XZ8PildenFLlD5qgUdCzc7Uw6VjEYGctZzzOXacDj04n6ONxfw6polsZICFVhOpkqDKHklnXTu99VpSkH2iBeW3Jg/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141506; c=relaxed/simple;
	bh=eR+DZtjxTGHsnzJaTy1dHb0uzl5eFl3JiNNFfBIoHpM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=puY05Dbn624NR/k1RhBIXOpzqO5iBWgd6s7YwsLXGBddPgx7wfiC3v2kGf/Jr54BA/LqkKCqKc3IXJl3Y59qfE9dkQXByN1M0vlr33/RJWLhpFtVruw6Q8mBWr00K0VB0IL6TXm6BCZVfjY/3fXbnIBVaPLMwW5FG7acvZymgkw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=m0yJXpyo; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m0yJXpyo"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db425c9050so10635ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:45:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789141504; cv=none;
        d=google.com; s=arc-20260327;
        b=ncCQhrEXahji/ODZpBmIrBTiScJApUFXAj1andIwGyAS9pE5RM2uIQ3aYRYz9IdkEc
         phmHbeZz/CyTU97ysr6j5utTcCKWO0F3StADjmhwSsUjO0A59vkuhB87KBurk454AZuW
         EaoMSidio7wpTfVKJjQGPlFFAhsd91OhYDSaljBWXr/uxI5rGFaFr7LlMHijgsEsHA6e
         wmzyhQXo7d53A8PTVHOAhFfaKFIFGo4Un9/5wYXPD2aQNae5ZEJ69YHjhaU5kK7qr6B0
         CjbksucQ5zBAMu9ry1lg8LFZm0xIrlp0q2xOb3wAjlTlqH0+d2FMhd4hUjjZvs1e34Ua
         JKkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l5edhVg2tXWRMX3roRkpySjER0cDjb+C0WlaE36JMtM=;
        fh=nlQg2WZEweu7PZceBmyZDcUpC/+xCPqQ28q7jLZ4nfw=;
        b=Q99Ign9jPbj/Bowi0r5RqW2aGXwH4C2ruSSSkUPyco9nHJq5+G6ZGmpRF6Z8hv7n1c
         sVVZ0JBIt+YYqmbA+zhykLGjjqRrDXEvjACK+itZO9ppkEsXlndZUuBMLay21L2x8dPu
         6W3zF/x4I+RQrL0SB7cqz8fRZHgcgxV4KoOPL/Qem05CyM1xoETq08soHOVeJeF9s0zZ
         QTL0Ov39cQwUe5C8CmpXJuQ/PpwtXjDjmocfojAZM+B8ZLj5xU5bvc/ulXy6t9VLL6LJ
         ljME/WcrSoomPNt0py/P5kHy9IFcD2pmXcvqlDdu7BYLOJVWmVwc3/HCta6Vr20M06XT
         MItQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789141504; x=1789746304; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l5edhVg2tXWRMX3roRkpySjER0cDjb+C0WlaE36JMtM=;
        b=m0yJXpyoZENCFLYprd6KfU5Nz82ynxYx1fpIzDbsuzUOB/a86AvSI2EDrX+3IO99jH
         WwHuISCy0XtBBYNoZ6hIvuFbL1kN8hbyn986CNHUJnOiPriJhYC3vjYpZhGwYEcOjLVI
         /oUYq1PyQHgd9/I9gRxkOJllefDost0GQA0OejMO/EniTGyeWVvU+hi1hwDNtj+7GYl4
         V2FlK0YzhF5v3UeQq8jOov25bx2+CQrTljvoIIhm9V4lcl7/UzULXRM9tsdJ1lheOp3z
         DeDy5e4sTWQftInT0AFWKopbQBFabEkBpf+PIk9WG9ps+r0oh8tYTZsRZK2GKeGwHpsQ
         ltLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141504; x=1789746304;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l5edhVg2tXWRMX3roRkpySjER0cDjb+C0WlaE36JMtM=;
        b=GvoOPO8Zc54pKUtC25K9lRBd5GCG3bKELnHJYEqkoT0gnWOjwTRJapx5wIm/xW2z16
         nT5LPPGgRz40ucyq7hL+3v/TXciehZpogYOz9Y9Sy3jevSBKsVw/FBMFZ4CRTXlTSgAg
         x3s1O1olBNQEhhEnzcHYvlAq6Xr2YZ3+lYJLUw+mo2fGPZIgigFWEXtgmFT6Kod3FiVN
         VYK99TOwNcqQt7aZ3IZLKfyjTdVrFpTXm0KCGvSKpjy9N3q0nemXIykn7HVbXlRE6ADm
         Npc4C4I7sG784gMy+S7bt9jK4g5VU4sICzi5992IPdasIUYM59mLzZRzf+nMpoPwpCkV
         FYRw==
X-Forwarded-Encrypted: i=1; AKwUvBwjt/dFB4Hgs27BPGZv4FLHeR7Z7fEeLPp6w06Uw3VqdxLmR44dHoBQYqba+Wh7q5zhOhIzlA4Y4uu/ZiY=@vger.kernel.org
X-Gm-Message-State: AFuF++lhR11k9RjKPN89eu0L6uuNAJAhhktg3LRkjTKtPo8EjJear/Li
	3pIGObc3svIrm+zfM4tdjqZP1IX62u8LM22XYx7wvqxWkHqg9jDrRgASICcNb+Rl3W8kdOH6YtF
	ERZKBqaTe/Arbjw4PQB7XE/E1vWqEu8mZHwDBHGaZxb2uHjB77y3zOzvq
X-Gm-Gg: AYBFou01SBsbbZvFUAi+O/Ejm1sW1f0TLn+s/cSElWJbCAzNgiD32ViTbovFaBxTu4s
	4i3a3pV5h55e+o7ZeyS75pJ6SeSVFLXj/z1Sl+rDufsbXGrg4mkKy7kDEBeubTg0TGKiXfLIpaL
	XYN2QZqn37J3NRrXWPpSG1z1KoGDDL17zXCBURfvF1VTtaQQdzNoCkSDTyd6V621ccPnu7+UD24
	v/Xjh3BNODL/toJvZVh0XAX8E9Ov5BcQzxCsGcj8xn+DFYrz/soKqUhO3fYdgSTCHnfa79Nt53x
	pknP8uRjOt2CYehL4YtkkNoGxhviZmSgz5wBVy7kgl3M5aBiPXHyntKzckLNreWIgLPcSRuKgtL
	AtoXlrADCiqvvnTLIdSHvsif3ukYxQiUt5bk5+I1hYQ==
X-Received: by 2002:a17:902:f60f:b0:2d5:cad1:a2e8 with SMTP id
 d9443c01a7336-2dd2c9342f1mr8684325ad.6.1789141503667; Fri, 11 Sep 2026
 08:45:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911-uring-fdinfo-tighten-v1-1-47c62a154aca@google.com>
In-Reply-To: <20260911-uring-fdinfo-tighten-v1-1-47c62a154aca@google.com>
From: Jann Horn <jannh@google.com>
Date: Fri, 11 Sep 2026 17:44:27 +0200
X-Gm-Features: AcwNN1Ulz6FVkSYBUki9FpHmMBQr4IeI2P7Odkxp60h8A2YAlYBmqO2GdtEHPXw
Message-ID: <CAG48ez1dbEXQgvvAxchiiakym7KJntGFJ3f_obfnDwFouYZQnQ@mail.gmail.com>
Subject: Re: [PATCH] io_uring/fdinfo: ignore IORING_CQE_F_32 in last CQ array slot
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dominik Maier <dmnk+artist@google.com>, stable+noautosel@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 5:35=E2=80=AFPM Jann Horn <jannh@google.com> wrote:
> A cqe32 entry spans two CQ array slots, so the last CQ array slot can't
> contain a cqe32 entry. If the CQ tail points at the last CQ array slot an=
d
> the kernel wants to write a cqe32 entry, it uses io_fill_nop_cqe() to pad
> the last CQ array slot with a dummy entry and make the tail wrap around.
>
> However, malicious userspace can directly set IORING_CQE_F_32 on the last
> CQ array slot, causing __io_uring_show_fdinfo() to read the second cqe32
> half from beyond the CQ array. Change __io_uring_show_fdinfo() to
> explicitly ignore the IORING_CQE_F_32 flag in this case.
>
> This is not a real bugfix, just tightening the code a bit, because:
>
> 1. the number of CQE slots is always a power of 2, see io_uring_fill_para=
ms
> 2. the ring_region region consists of:
>     - a 64-byte header
>     - pow(2, N) CQE slots (each 0x10 bytes)
>     - optionally, the SQ array
> 3. the ring_region size must be page-aligned because it is shared memory
>
> Together, these properties imply that the last CQE slot can't be close
> before the end of a page, so the "out-of-bounds" data is

Oops, sorry, somehow I forgot to complete that sentence, that was
supposed to be:

Together, these properties imply that the last CQE slot can't be close
before the end of a page, so the "out-of-bounds" data is in memory
that is anyway accessible to userspace.
