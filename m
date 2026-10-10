Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D869A439F99
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 10:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791627298; cv=pass; b=YBN9GpjUD5rHJawIiExnf8UPHUBLM23zOK6jCmO+9HZ7vObi4V4p5eJBaRTpR2O+6XYzz1vsPcC9yRsHWusRqKzGzS0l+LjSvWYCCgPUO97vHM8eSIYjKRgG5OjMCGZ9PO1ATT7B7dzs3row3QWhhTqhdDGQFlJQN5UTPhIxml4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791627298; c=relaxed/simple;
	bh=to0DTtAZWnV/meuGGusMEzel5dBXd8LQTc50qPpb4A8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tY30cikUnlGxLzB970pH1RZkc7tFJcr0OPvtAxm7LXV7Ry4HhCoVWoHqs9eHFBnviru1FUFusjU+/9ZX57wIc2SaCRKwLD3Rd9TEj+/E21eIWeWGSkA5vyMQE/3ODeSuBGUA7v9zaHAjBJEmassuR5GLSfaZCxODYZwCbAhtbto=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NMCoGtcQ; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NMCoGtcQ"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-487048857f6so490723f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 03:14:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791627295; cv=none;
        d=google.com; s=arc-20260327;
        b=O3fWVf3OmhnKs2nfr5ywaiYzsvwi+B0K4WMfAYa40PMVYPBp/Zl4a0jJsL7hpnKX9E
         lKXc/mKm+fBTzl5qlCtlQD7vONb1OQ3RurnREVbLEe6Oyia2z5WgmCkKz2vkJP7fLMSd
         LYdgjXzo0lL72pQiyN3oiH5XPye/4IWPaQ/eVyaqrf79p0wDJSU+12/p2so3ok8bFRrI
         mR10fY729wJS+Rb8K93QiS2Xlb9Seie/TEBFXWxCD+2KEUowYjqpNOL2V8/xJMGgUDBq
         Co6uyRIqdPjb9EbYv6t76k/GU7SXsC94dAydybBvUSUDg5YWH8Nx+ZruafEk5nGUMSqu
         2IGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4ZCwz3KK4ioGo2sblpjh0J8bdLeG8IsOrV/Z4ACQP54=;
        fh=X587D9eiQrv6hr6NIkhpMN5vXjEUAejnNxckdbvheKk=;
        b=QgZ3RzsBlx/SzGRSG7eft6Ug+f0RuySj517nq6XZURBxtzHFh5Jyo9BK/ScixEsEt5
         nKW3+vttQsCKUwp+MTGhz0u3PQHO+Fthyz2FHP8UqRO3IEEJgeaF/vgo8TF1QUU/As9X
         YYF1HDz0MFIK51QOs+Ol/1yofIXHRvMnLUNGr6NuczlbCKxMfV4r0uuwJ9RuYd/aCwRw
         4qzuGGs3LeBOfZCr4kOd9Vz2rZbfz54hbbnr77yOKqs8MfnrBpVOox6t4EtJB7rJzAF4
         dEOzh/rqSmaeeLK4+rppnNx7BcYu6tk0CNgqkiaHaPM4YWzDSxtVEAHwaGkhb0krOijd
         f9jw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791627295; x=1792232095; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4ZCwz3KK4ioGo2sblpjh0J8bdLeG8IsOrV/Z4ACQP54=;
        b=NMCoGtcQ0QY+nCy8fRACIZuo0G4YycaFF6FzJyqBf4KJmDt8HkHnas7PtnkOYWm4Ki
         0lKLyE3+5dnG+c2lLgyHKS7hVCYJUkIt6FpGv19VDpdMVCAmHy6wndDsMuJO/MuzdB+6
         app9oROrc1/+t8dQY0I7MJdZbor6tR4hMVLreSpiAGdMZxTHcX7v6XKfPWGU3rtH/0/H
         92LRxuER/emjnd1qKvby1E1/cyrhR7+yQfRTu0Mqoi25w7T+qlum3m+K7DXPu37RI3kx
         BTezhG055u6ENLe6d32gFxq0Xg1dQe0XmRCUwdoiNOu2o+RRDD9zi1TPb/YXs/p1KdUk
         MkfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791627295; x=1792232095;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ZCwz3KK4ioGo2sblpjh0J8bdLeG8IsOrV/Z4ACQP54=;
        b=j3RG5z0lerDLab5xQbrLQSIOfuZJ4gwDSiLFjH11BEIXOhgY/9yI4MNG6hbyn+/2h6
         l/f/J+1TCv9qz24t4FDZ7DKVsvdgrFKmMgHk9DP3W6vFELNb6xMWeqFjEZ7tmjGKaVHP
         cYBLvAgvq59I/eAXzet5UTlh1DTiHKKm7RFdzgj3InIugVKOV73uYWIAuFVdwX1gWKNN
         vu1yqYtNfoLJZhEHHj+fuS5dbJ4nLDukwvLqBYJwVHaEedPLdc3LaFC5UBBVm5xRisyC
         HAsA8i26psKe3IIL+4pNpEet3DHlYjTRC/++/SthFNnNK/GQRkbrWsRetnyea8YXmUwC
         iH2A==
X-Forwarded-Encrypted: i=1; AKwUvBxfmf1rLhDFBV4mQsGby0XAYKOl4/USg7B6XkaRQreRj7x/1NrbIQR1rFjqK3CEtM4LmnKqTEyKw5LUU1o=@vger.kernel.org
X-Gm-Message-State: AFq9FYKF72QVe6VnUh9IypTvnnPPJpQPKiaGP41SExiZq6FZaBOtyia2
	NE+Luek9wBo/n/3StHYPbGY48AqEPBq74RB6U9EE9mznK88Us2OeH7IpYCxI5THQD2Aqo85SoEP
	386gRWHUk6eSWMjJStAm5NSdN3gSDx2s=
X-Gm-Gg: AYBFou2XtUe6+rv3ZKKhvvQdHt+RRNUG37kJsngEWZ8xnc2snAOFjdnHNVhV7Cp7Wy2
	k0yxkYn+YNdCRgt0zZaTk8IA0HKhAEfe7Mt1I5Yc1WaYotMvV+vRT5hE3bxJQAXFLPL6QS5Hf9j
	2x303MWwtLRro/xlyO+16IYuyWQ4K1MwinRvRdL7Jf0PlLgGFc6FH1rwi4JNBMeSyc5Cmls7AoW
	msz/di2dCfEh283z8ZE3xgKyXyOXMsna6nwTsBnT7IlLffP6XKx6n0WFRr8TY6o9JEqv2zLV60s
	IZ13Vdhh+SooYKre6G7KECpoI0Uq5PUavi6Iis+yOK340M6qR5WeKt7hSuLrU0dRU34uv+rSpyL
	GR/i/esE1aw8=
X-Received: by 2002:a05:6000:4917:b0:48c:7302:96ea with SMTP id
 ffacd0b85a97d-48dbace4edemr8358190f8f.51.1791627294664; Sat, 10 Oct 2026
 03:14:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009163146.83112-1-usama.arif@linux.dev> <20261009163146.83112-2-usama.arif@linux.dev>
In-Reply-To: <20261009163146.83112-2-usama.arif@linux.dev>
From: Nhat Pham <nphamcs@gmail.com>
Date: Sat, 10 Oct 2026 12:14:42 +0200
X-Gm-Features: AclHuK8eHrKrxCU2Kz0-csCBZga-KHX89XLvw82csYCAbhZVbUsSPi6LOzolr2M
Message-ID: <CAKEwX=NFGr9hwavYof=zGtZ-nXGcWWsxnt6xQE_F5D1ZO1MnBA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mm: zswap: use separate compression and
 decompression requests
To: Usama Arif <usama.arif@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, chengming.zhou@linux.dev, dsterba@suse.com, 
	hannes@cmpxchg.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	terrelln@fb.com, yosry@kernel.org, riel@surriel.com, shakeel.butt@linux.dev, 
	alex@ghiti.fr, senozhatsky@chromium.org, 
	Herbert Xu <herbert@gondor.apana.org.au>, davem@davemloft.net, 
	linux-crypto@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 6:31=E2=80=AFPM Usama Arif <usama.arif@linux.dev> wr=
ote:
>
> Stores and loads serialize on the same per-CPU acomp request and mutex.
> A low-priority store can be preempted as soon as the compressor drops
> its stream lock, while it still holds the mutex. A higher-priority load
> on that CPU then waits until the store runs again, which can take a
> long time when other tasks are runnable.
>
> Give compression and decompression their own request, completion wait
> and mutex. Since commit e2c3b6b21c77f ("mm: zswap: use SG list
> decompression APIs from zsmalloc"), the per-CPU buffer is only used for
> compression, so group it with the compression request. Independent
> requests can share the per-CPU transform; the codecs and drivers
> synchronize their shared state internally. Loads can still wait for
> each other on the decompression mutex, and stores still serialize on
> the compression mutex.
>
> acomp_request_free() ignores NULL requests, so drop the check in
> acomp_ctx_free().
>
> This follows the proposal from Sergey Senozhatsky for the same split
> for zram [1].
>
> [1] https://lore.kernel.org/all/20261005122036.718976-10-senozhatsky@chro=
mium.org/
>
> Signed-off-by: Usama Arif <usama.arif@linux.dev>

Acked-by: Nhat Pham <nphamcs@gmail.com>

Herbert, does this also look good to you?

> ---
>  mm/zswap.c | 108 +++++++++++++++++++++++++++++++----------------------
>  1 file changed, 64 insertions(+), 44 deletions(-)
> +       if (zswap_acomp_req_init(&acomp_ctx->comp.areq, acomp_ctx->acomp)=
 ||
> +           zswap_acomp_req_init(&acomp_ctx->decomp, acomp_ctx->acomp)) {

This really breaks my brain...
