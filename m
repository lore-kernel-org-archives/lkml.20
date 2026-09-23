Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8363A3E73
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 22:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790202746; cv=none; b=UbsPWBTHkU8sJTNZHfnvcTIAEsyEXJ99AjjW3qCqUoUeSl2Ieo6Lgv77/aw0XDCMfdxztMmTGH/O6dOdisrHMXMwWCevWkJqQEQB8zlbCcODA31kcHEuxt0pWZF1XSbnzuR0Z0QFYfkO/9Y70Irm+ALcvp3rP/zy4o5gB0udi3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790202746; c=relaxed/simple;
	bh=dZKKBf1/yUjdqUoa4GqK26ilVjXq/Zm9pt5x/OdRU3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cTBd82Y44/qNOcfm+w2Mp6lw3jNK9/jH/+5KAYm28NhJ8/2Fpmr3wme3NGAcCsY/ba3oHscj9gBZzo4YbHg2wnaDpnp8hxNYzJ47w1I7UH8+Kdt9WLUEEbRaIZBCXs7I+zoLqRyP0QNWFAoBG80Z7aJZ6XZaoRQRqX8fSUlEw1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HTbv97X7; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HTbv97X7"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2db33db4de9so31885ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790202744; x=1790807544; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=buc8AIw70Q1k0d2thl18OR3X1pkLSFe06GlRsiO09uY=;
        b=HTbv97X79BnpMZn+4k0Cw0HVM1hneGtXe5oEFthDv+VkJqxPvDzEyF8wce73+0P+Op
         R85444p79iJ2ZK2A4+p4775nk3n+NO8FoTtux0dYEsCKPLZmo5asSuFIlmi7O12s0XdP
         TugRwuytGvnBVWrS/fWBPOePqruCP3EeAwynnbeZXTmr3FR0Dc9sFMqy8YMOiuBBaB0j
         Ieds69qOeZ35XQwgauccU8K4vm5ttsFBXbolF8sYK9joVlZEeyT06kqg7SrX73eo6hvD
         L28AJqsAywE2TC7SoUVWlUVVJAN5I78gIakhrzKVUEBoKeXfUpOsc6txzv9rNTfA9S/x
         mc5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790202744; x=1790807544;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=buc8AIw70Q1k0d2thl18OR3X1pkLSFe06GlRsiO09uY=;
        b=uw6a63uboIoqjqv7Ie7ciFSjfKBKqHObM4u821jxa3h2cUFatXteMN0p4h1Tc+Lr2m
         x5eceUXB/gkj95pA9Oel0805ZAHd+5CmZRO+1pWICFir6/8v/fIsTzZEp/QY/sSa2ToF
         1GY65RFp+3ED7uz+N9cssLo/Ie060VXf4Zrz0yjff217+pa5gtGpkjbMu7FfIRYntIjn
         gC15IEBZijhRTvZiqXAkY64wmhxCmmHyeqtCxPGNW1RIteXRprCfyu+Dw84FaVccxAlR
         MlePGm2W7OuX3Kk0VBeiJLfVHEujhdtUfVD5Rt+7V1WOjb0Fg92udvK+riGlruKjF87g
         lKGw==
X-Forwarded-Encrypted: i=1; AKwUvBz/yCxAKc/Qza77rQGJbj6kOmyQxo60Y1cQCiHLR3twucR+9QTnGmQRlf0hLpXhrf8p1Rn0ZTkH7TQymJI=@vger.kernel.org
X-Gm-Message-State: AFuF++mzyjjWDxh8XHJrAbgUSO6Q7P10Qp3ltC5f4y4myUmrQ5/ybhE0
	4eTkI+pXsoTkbhbW7IXzwSWd3makQDXtWwCvzjmnIjbQZQntpjWy7loIU7wlPSqF4Q==
X-Gm-Gg: AYBFou29zoKa4CkDFIghqX+6jzLYPP8Gd6LF8mhZIqRMpEgQWLh54pFjFSTjHi3ALy5
	y/c1Lg4NVU0BQQp7N2HsdoezFgdHJ7GWoLK4djCBAMVHGr3IASRule+nw2oLctG7wtppssQ7Nxm
	11PM/Ia/QcUlyKHVB/t808AV55dhQlrQzaKbu8Nl+4c7mO/sShqXrrv27096cLqKoJnfTTPAZu3
	GW46RYkyaxA+dhQcm3TBCnKhIbqjejSYy4AP70If1MbAYCovpa2bQD6RyaQtDxMP+KeyQrT1ctY
	l0EWEmbgDZrKNwQ9uo3yBTDqo5Hcbu+3mKm3XMWtC71RbK/j8ao1GPDJkhRxJwXAVCNdUmDHgTZ
	OSIlH9CuuqN7C//CZcCmrjC2WnXaqKx0+6SeOjTID744VepzqU7W18uHNaSn5xvvgsxORApEerF
	i0OdNowo63J1PVD+sUjwIPDaBVYOe1gclXeuf//6W4LbcZpLxp3+BTs6rfrwhskFOdicpEHhQCf
	uCpqribzeVl18RqyHbUmGsVvYcVvd5uxMUjP4larQiT7wRZRpItKjA95EFm0AIPGXjJ5VfqNGuQ
	/EIzWYD7eK5A5nGDvHCdNlk1bAX/7JgIdbn0SmMsHngZsjQ=
X-Received: by 2002:a17:903:1a10:b0:2d0:1aaf:daec with SMTP id d9443c01a7336-2df7bbc5139mr2206095ad.9.1790202743286;
        Wed, 23 Sep 2026 15:32:23 -0700 (PDT)
Received: from google.com (99.95.125.34.bc.googleusercontent.com. [34.125.95.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976c8f8dsm1082589a91.12.2026.09.23.15.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 15:32:22 -0700 (PDT)
Date: Wed, 23 Sep 2026 22:32:18 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Hui Peng <benquike@gmail.com>
Cc: gregkh@linuxfoundation.org, arve@android.com, tkjos@android.com,
	brauner@kernel.org, aliceryhl@google.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] binder: fix sender fd 0 close and file refcount leak on
 TF_UPDATE_TXN
Message-ID: <arRTcvuJ09EKWnAe@google.com>
References: <20260919213648.3316566-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919213648.3316566-1-benquike@gmail.com>

On Sat, Sep 19, 2026 at 09:36:48PM +0000, Hui Peng wrote:
> In `binder_proc_transaction()`, when a oneway transaction with
> `TF_UPDATE_TXN` supersedes an outdated pending transaction
> (`t_outdated`), the driver calls `binder_release_entire_buffer(proc,
> NULL, buffer, false)` and `kfree(t_outdated)`.
> 
> Passing `is_failure = false` while `buffer->transaction` has already
> been set to `NULL` causes two bugs when `t_outdated` contained
> `BINDER_TYPE_FDA` or `BINDER_TYPE_FD` objects:
> 
> 1. For `BINDER_TYPE_FDA`, `binder_translate_fd_array()` never wrote
>    recipient file descriptors into the buffer (it only appended `struct
>    file *` entries to `t_outdated->fd_fixups`), so the FD array in
>    `buffer` still contains zeros (or sender-supplied offsets). Because
>    `is_failure` is `false`, `binder_transaction_buffer_release()`
>    executes the `!is_failure` branch on `BINDER_TYPE_FDA` and calls
>    `binder_deferred_fd_close(fd)` (closing `fd 0` in `current->files`,
>    which is the **sender** process!).
> 2. `t_outdated` is freed via `kfree(t_outdated)` without calling
>    `binder_free_txn_fixups(t_outdated)`, permanently leaking every
>    translated `struct file` reference in `t_outdated->fd_fixups`.
> 
> Pass `is_failure = true` to `binder_release_entire_buffer()` and call
> `binder_free_txn_fixups(t_outdated)` before freeing `t_outdated`.
> 
> Fixes: 9864bb480133 ("Binder: add TF_UPDATE_TXN to replace outdated txn")
> Fixes: bdc1c5fac982 ("binder: fix UAF caused by faulty buffer cleanup")
> Assisted-by: LLM
> Signed-off-by: Hui Peng <benquike@gmail.com>

It looks like this has also already been resolved by:
https://lore.kernel.org/all/20260812195316.259136-3-tomerpo@gmail.com/
