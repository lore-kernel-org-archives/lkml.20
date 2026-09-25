Received: from mail-yx2-f41.google.com (mail-yx2-f41.google.com [74.125.224.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3D8EEC0
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 00:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790295376; cv=pass; b=nk+iI9gz3wZgVcR6u89Z5hlGwKLna6NokW/iOu27SGbHfm/DwHqGQmZ2jQl1UJO6REq9IdAEFoFt3k+5wcQ/rTw3C9629y/c82wKI72w9szmNizu8FIurxCRKWLv+zNeU3d7RzZgFibYcouWAatzNDPUva+N31chhejqkfx9hBc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790295376; c=relaxed/simple;
	bh=J6NsS0YBb21hzvOhePaLlNVQz4MY3ClTamAaPzj0JeU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KPoaQXFrigold5EbKcoC72NNvQ/+2TVsHUbImypm1zW3rdJZ42bFZH9Lnktb+A7kIxPmWB/5kHBbTl+BXgC/q9lHpAzXSU925sLmOVnG8GI790wZIHjDgpvNnsRKoQ/sCyuTYi2x1sjQoTFglTsdkkzNJUNCcjYPOtrxoXRfRHY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bshadow.us; spf=pass smtp.mailfrom=bshadow.us; dkim=pass (2048-bit key) header.d=bshadow-us.20251104.gappssmtp.com header.i=@bshadow-us.20251104.gappssmtp.com header.b=QdepNmep; arc=pass smtp.client-ip=74.125.224.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bshadow.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bshadow.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bshadow-us.20251104.gappssmtp.com header.i=@bshadow-us.20251104.gappssmtp.com header.b="QdepNmep"
Received: by mail-yx2-f41.google.com with SMTP id 00721157ae682-8a7af43a358so3903287b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:16:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790295374; cv=none;
        d=google.com; s=arc-20260327;
        b=Ij1e8nGcEa1PGlvYDffRzHjW5MIYxu5Mr06jMqBBkTmUdJGqJ6R6evMgnhI05/FjSh
         aPXUyiJdDYey8ij+U3uu/CDOE+wFBMq2ikRJzltnUehmbQ6dZUhMjf9RykrpOyyb5EeP
         jZUUiXUME6LEUhXm56p+2FM4Ud/u/k51UjQ6EkUu/EvOej3blOOJ6GakX33K/Oj9RSHF
         IQa1UQ12Em5q25v2Qr+D8catx8YSUE2kpixV94uMRgx42nQo/ufBQZ8mTWpPtetKksRT
         ubxSp+XjtPs8pINOxSG7R6soxAIOZA+WLqClCqlde+kRpBEM9wQpsjMH7NsYiamsg7II
         Q65Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=J6NsS0YBb21hzvOhePaLlNVQz4MY3ClTamAaPzj0JeU=;
        fh=e7Xvu2uuA0ESv8IJ89+182wem8LiJ9qZR31vEYukFa0=;
        b=nllDurPzyPFgZoodFupMlWFag5bMd1sllwJ1L1HTTyOku9R/+jJQheTuY+qQVYxKBn
         i0uwECuC1QVerYPY+XJdryBsKXNi9fBMCaiBbtdFl+D+cDy51xAuGTn9HgphweeFjJvN
         xNt1HK8axgQP7fTFxFXSEvrVt4ISWQT2BG2qUOuxE6970P67ObnlDrB7zbp675Dxo1zo
         fqFvlrLrCjf/v3ftBQa6tr6CEbU97dSxlr9zw12McTDAszsPsPrRWQMrY4GiSbdF6awR
         siphGKa5Qo1KeLx8z6aVlHBp/iDXxFeXqKqOVL3K2rnsTJBST9kXrMgV1+j3pXhTrr5L
         8o+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bshadow-us.20251104.gappssmtp.com; s=20251104; t=1790295374; x=1790900174; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J6NsS0YBb21hzvOhePaLlNVQz4MY3ClTamAaPzj0JeU=;
        b=QdepNmepi39O8OE6WlLItAiDrPGD1RzRvO/KZGWcEXwPv7s1Hn0HCOv7q5ff7VynVz
         RZjmQiskYYtlcyndqnrmRxxXQSvOcJW4doM5XSwGTa2Tgpl6JBbZD0osf14ABOniv6cg
         077+pS4+KSWEHzxXKxl4C8z4ITkte3hV6nG6CoV7CyAOgus68GKCx0ZLPbr9oonM9t7H
         /ulQPGqfaxRolSqqAulrUy9sW7HJLC+oQg2sBhxHBPSD3VA2rTkM2W/RX6k5Jvm+6IMk
         K6mnRQQn6tOnilCg1Yanf/IvxOiaV9uMaT1XtgLvVXM2Pg4D2FokJfnux89PMWJ3nefQ
         ZVUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790295374; x=1790900174;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J6NsS0YBb21hzvOhePaLlNVQz4MY3ClTamAaPzj0JeU=;
        b=cPRKAknIC1b0SnF4+G/YuW3o9EKeWESPxmcpndYlxxcisxqzEr0P+L6Ct7j1DWtf1z
         EtvQ4xmGEnq/rC2ANUrmFT9cO8FepGLEe/776l/2KFf3W6eBYroyMgS+e2bM+Qi7Sris
         d4R/2Wkaj7mzXv6cXGU3KbwHpbfZ8CqBiLiAJ7DWwXUSRWW3lH+AIxHMzAf8bz3YiPHn
         voFLLXzSOLPH70K4Y2/vp1Bcilcrw2wasY+khM0ed2Fs9ZlPQfq1QW/BBOr0cbHgS//M
         wPVk2XsNgvFiqERA7Ha64tW/8MnswQ/4J7SY5IxO9kOknfZU6Jr6cKrrnAVfdhJbvFu8
         A3PA==
X-Forwarded-Encrypted: i=1; AKwUvBz8nLtowGUU7imqSm60WTniVyO+Y/TYrNZw4tgXs4aL8FVCtOhYwC/E8GSsMTDdCDyysCKUfS3/engK7Lk=@vger.kernel.org
X-Gm-Message-State: AFuF++nGMNTPoQFcZLSsIY4kuP143Gw5XrV+P9zlN6DhMNM4yOjBT/cI
	w7OdwTI3BbV6wirOZpAgsqAUPTivflPp8MU41So3q7L+UaAUE+DV1kDGsrOeXEl54ubc/ZHtdj+
	++sFZzrCDSBEM0vcxMgpQb/jbr3nYZiq17riiqqU1Gw==
X-Gm-Gg: AYBFou0mUXOJ9SjtXA2s4bOzqFdT1pZH98dEcu90i4/kdENE2NwRWBhat14/hrj1ZCJ
	NJrae/5AmzeM1dsMU5SBPLmGNOmKdl2y+lNvxwmDn/lroe8AeECGE3kOyvXSWCp1jlNmz/1rM2Z
	xRFAqzK64MP269kL9wGpGsr6J9+pH34d2Cj8bycGG24WUAbIJmWCMQXOM31+mEogw267l+G/RF9
	DKHQQiuGcIx6K23l8XJ0Cv4So64VOzBWmW+/qIuBtidS55ClXdr4YLfDNLek+5RFYI4i/bm0RPE
	1qZVlPkLEEgY7uPTVLA5z3A9rQOdYsYjadZgLo9/GN4lbGXIPP5TcDnIXu8Z+jS9xJJDjg3aSOZ
	rGfgDMuYc8+Sxzw==
X-Received: by 2002:a05:690c:e28b:10b0:89a:63da:cbec with SMTP id
 00721157ae682-8a64ad4af48mr20301267b3.50.1790295374720; Thu, 24 Sep 2026
 17:16:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924235937.148475-1-rosenp@gmail.com>
In-Reply-To: <20260924235937.148475-1-rosenp@gmail.com>
From: Robert Lovrinovic <r@bshadow.us>
Date: Fri, 25 Sep 2026 02:15:37 +0200
X-Gm-Features: AclHuK8-qQgfbz72-uMb5J0boueQc0SUvZRZGAtgZFpSELI8D9RLgL0irK2iMco
Message-ID: <CA+39HW2_=z1jggfourLfE8XmXGQx8LV233QO=m0y4Fw2774Z3A@mail.gmail.com>
Subject: Re: [PATCHv2] crypto: cesa: complete pending requests on device remove
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-crypto@vger.kernel.org, Srujana Challa <schalla@marvell.com>, 
	Bharat Bhushan <bbhushan2@marvell.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

There still appears to be a race between stopping the engine and
setting engine->aborted. An IRQ thread already in flight may call
mv_cesa_rearm_engine() after the CMD idle check but before aborted is
set, and ctx->ops->step() may restart the hardware. We can then
synchronize the IRQ and free request/DMA objects while the engine is
running.

I think engine->aborted needs to be set before the final engine stop,
so that once we have observed the engine idle, no software path can
restart it.

engine->aborted currently only prevents mv_cesa_rearm_engine() from
dequeuing a new request; it does not prevent mv_cesa_queue_req() from
enqueueing one. A submitter racing after the removal drain can
therefore leave a request permanently queued. Please check aborted
under engine->lock in mv_cesa_queue_req() before calling
crypto_enqueue_request() mv_cesa_tdma_chain(), and return an
appropriate teardown error.

The stop timeout also looks unsafe as written. If the timeout expires,
teardown still proceeds to the callbacks and cleanup, which may free
DMA-visible objects while the engine is still active. The timeout
needs an explicit failure path or hardware reset rather than simply
continuing teardown.
