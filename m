Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794333320;
	b=Kzl/I0lLjZfl4jasyilHHwGjXuhec8HOLAJrGPz7ebhVNLs8bnK56CDX4wWQXi0CYh/H
	 L6aIWiaNxWAiGrfeL5Q/7UqbU3g+c7LvwUxq7mg4n65h6dd8oC5W04Qa75pCdZYUKT0Vt
	 Y0Be+b0dbtg/MGdk4Z7I+EljJ/1dNMkcrIiJHTB+udk+CA/oFNGou9+oxNbnEnCwSi+Ar
	 yzPcFL630it/k6BuE64vJuejFTOOj6r7pjuWAzjtX/FdKlqZd7BBX4l5e1a5aaBMX51Ph
	 ICVjMtQBVxv59XBLwBoji/7d3VrJjx5kNmcgcYENO5k9fbllyYc5BnsyZvXDUcPsHeg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333320;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=H5aIR7GM7jF71ICZGcnmJRpWwPiNZxHyJtzFYIH9Kgk=;
	b=3O3CqxvBx8NxiZmhVOjf+kC1uAqzRmbiHGm5OHlb04C1o2AwTVBbpi/HVz39R6lMgynA
	 of3tgBqfRJm4iRL//J1tgB2vsriiwcHyAVFfVI2O9NcMJAlQ+WZ2Dr3YGP/M5QPtWzYCA
	 gHUQOHHi7vd2SSDTKAAfUc5+dg8VgXuIHuU8LBhx5WK7cuv0A5DUGJd6prdpCytQihQ/a
	 mOwSES7OconN/1qr9sia7NxpSnizgNw5PR82oiycXU7WAmqP4DkGG2B4CCrDuQbGfiNNY
	 TDm5krj0O+kT0yIS1rJHLTgMZW051J3LBc/hPaV1KaatMLJMFYJYRCYYMgc4Q1eqBcw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="d3C/eKtc";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.174
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBCD606A202
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:55:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BBCD606A202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d3C/eKtc
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3adfc004920so20035251fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:55:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794333318; cv=none;
        d=google.com; s=arc-20260327;
        b=GqtZRjln046S6ydCj6p79Sxg9hkH2xIFlDifvuOP+T12kTGiJS1o4vMwsgN+nyi0Pe
         Klfyv8dk5pgG6xCxTvQaVGqaubTZsOEsADr+sYxgQiqtPiBiREX1la75gENghqIQ/pSb
         41hxIrXkqqxujGYZSB446W0jDYEpDMXVvquMSlRvxLpXXeb9bGgOJh2vlsQqnIwQUyNS
         APZvbtsEfoLgBCXBlgkXrcjSXnnxeBVRsjPxrcku7EGgx45uSg3xalavRsor7TyTbqV4
         gIglJPoZPCJri9ey3nBejqbSOn1P5bOzOOV7vkfX3Bn3G9KoQhFGgBAxaWCak9BjtHbZ
         K1mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H5aIR7GM7jF71ICZGcnmJRpWwPiNZxHyJtzFYIH9Kgk=;
        fh=O75fYYGMW3Kgvoi5o4SimEQcfzJPbR7zjz9zjrpHjUE=;
        b=dvqeQLoQMF8HJ/RnWl457OR6XbGlvUzC+SuGcK9KdHUXKfzmsNpRz16z3AyuHoklVD
         axaFtxEYA8nLUrZFG5rRcOdnxjLaP+E+f3S7whnm9iMSae+BqYEA7+IyqkmrM306tpOT
         hjbkolg0M7zubXKle/SoCbYKGzBmkCMaI2zkrE0Z9Ryz/Z353Y7hp9b0yd+idU//sea5
         7NwGdplOEYZMuHuGPtekTxVbxzutVLGXQMn6YN3gSFTxaRWkyc5qXR0+y65ZevtHYxiU
         NipquRVjnx8ayrbYB81dgztkQDUYCASMdTb8Or4JzvCqBVlmlhN5wT8BfWWt+5J39UlU
         JbdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794333318; x=1794938118; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H5aIR7GM7jF71ICZGcnmJRpWwPiNZxHyJtzFYIH9Kgk=;
        b=d3C/eKtcj1uoOsgm8ifX7T2+HrV25xHyvQQPbG7F0Q/U9m3pCm0GCIwDJR/2Rrb0jP
         s49aXyaSocjXW1o54VrfB+aIL4+xFRxSedRWGvok8n9DPY1v0PHQET/jCDuAaFWovyGb
         PkObqLxukwzj7awlfYqs8VgRVWKMuvOJ7xGxUceg5jp0G8C0LJd0Z9U4zkg1wnO6t0bI
         /PtjilH24I+NB/GiyCVwMxzPMH4PbYuYnJ1ymtvjFGefvYlO5+wDJFI5f7TujqXVtWTL
         LXPd3fGySTQdJu0a7aQ7dxaIejXay/m3mqf9dNxGzRf/6AzGDyzlxVYDur0rU9f3FUm5
         v5eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794333318; x=1794938118;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H5aIR7GM7jF71ICZGcnmJRpWwPiNZxHyJtzFYIH9Kgk=;
        b=fyGHqUrLKSNRIgSbqoje0Mm3UMEfHfK2dVMbznFxqCGgM87As5WPbB+pkT0TX8S/QA
         P/6CbEzyV8TXix8g6zlRFSXRrPyySORzTnjD+JW3wpnB8K3jnGo5wIGpB3rW8vDUQDvU
         zPnzCq0zRlNxM3f+gy6p4pt+ZNAjD0wqkUjxc+SEMlRXRTwaKdoJS/JxD5PKSuE459fn
         6BvY0YO2xYtUokwa4HFoX2Op93d7UHdER83O4A7YiHYNWFxcCPN8ssksaNPLF2vrFRn9
         zsdynPYCTONhlwCqMUTHn1iJG9soLDJuiGN1Yan2bI44bAOjNLTZrP4m0tTQ/SzWZHSc
         pA4w==
X-Forwarded-Encrypted: i=1; AL+hErGObvg8+Iac06WhMezOnIXWUEdDnCMV0BnL1TPvkqAn8iVnhtOb/XymWrW1ASjSaPOUldldHqBrmwOSlmw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QgNWSMPWFJjW2FftKufTk6aIYkcCklBy/hAjnfYbG6SgPKSkX
	hmtcl6Dhsewv5aZQGOecyG4lgSC4ysGE61myYoDBYyuZ3vJlmxnHPu6jnkY1fjyt9UGSls7exAH
	EVJinfC5oxyNvJgasZ6wiOM7Y/7/Q8Dk=
X-Gm-Gg: AYBFou2h+UPSZ86MDsuX2F1Lz2I79/OP7pjblhb0dpfJgszBqP1Il2xg/Gxql9dH//e
	aefTRhd9uGGa6ji3v2LUzoh9qwYwNEk8uUVZLYdfYl0v5SI9FZIEz9IINmV2XbT+/xeZH9dpI+y
	bURuEDBJEQ5ElAS0YVFr8UyW2SF3OHoVyBQ28wVP8ZqPD/brFbKBr7Fc1ijK4EE6HB8VLssVs34
	jbbA4Qyz0UelpXgxQyI6l0py/hxpZx9IojO1PUuN/jVJ/5A/LpLSLQm0FbdqrQNG9kDzVnb/5ZP
	NzceSveRRXCslPb63WnqqPaQSBnzqMxwXFJFuoCTdEUI1bx9Gj6WI496p2cL2f6PmgX1a2nN92H
	gR3YLZ0nMfRFRrccjwecZ8DRNGUIISiQ1FmjolgVqiC5lwn04QKOAB/tOJVZX9y7ybzKD6pvZci
	Tqh22UEQo3+4G1Zwh0eL1nxMNUzMiWRGTCl01xJyiAcEa6bIL24aA/
X-Received: by 2002:a05:651c:a344:b0:3ab:1207:bd2f with SMTP id
 38308e7fff4ca-3ae096160cdmr7384251fa.11.1794333318160; Tue, 10 Nov 2026
 09:55:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110054836.1515030-1-senozhatsky@chromium.org> <20261110054836.1515030-10-senozhatsky@chromium.org>
In-Reply-To: <20261110054836.1515030-10-senozhatsky@chromium.org>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 10 Nov 2026 10:55:06 -0700
X-Gm-Features: AclHuK_-YWO9U5znFV7lB_KSdDYEIcp41HaPLmU_TnbiEvQvr2rPC4K4fEQZSco
Message-ID: <CAKEwX=PO3frCWftPnbdpoP+in32PFVZ5O9o-7AiNFovwXMB8iA@mail.gmail.com>
Subject: Re: [PATCH v2 09/11] zsmalloc: embed struct zs_handle into zram and
 zswap entries
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Johannes Weiner <hannes@cmpxchg.org>, Brian Geffon <bgeffon@google.com>, 
	Minchan Kim <minchan@kernel.org>, Richard Chang <richardycc@google.com>, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 10:49=E2=80=AFPM Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> zsmalloc allocates an object from handle_cachep for every stored
> object, just to have a stable address which compaction and page
> migration can update when the object moves.  Both zram and zswap
> already have per-entry structures that hold the handle, so we basically
> keep a pointer to a pointer, which costs 8 bytes per stored object,
> slab alloc/free on every store and free, and one more memory load on
> every access.
>
> Make struct zs_handle public and embed it into zram_table_entry and
> zswap_entry (their sizes don't change), so that zsmalloc writes object
> location directly there, and remove handle_cachep.  zs_malloc() now
> takes a handle pointer and returns an error code, zs_free() resets the
> handle.
>
> Since compaction and migration update the handle in place, it must be
> naturally aligned, must not be on the stack (zs_malloc() warns about
> both), must not be copied, and must stay allocated until zs_free() or
> zs_rebind_handle().  zram recompression allocates a new object before
> it frees the old one, so it uses zram->recomp_handle, protected by
> ->dev_lock, and zs_rebind_handle() moves the new object to the slot
> handle.  zram recompression is the only user of zs_rebind_handle().
>
> This saves 8 bytes per stored page, e.g. 2MB per 1GB of swapped out
> 4K pages.  Since handle is per-entry the memory savings scale.
>
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>

Reviewed-by: Nhat Pham <nphamcs@gmail.com>
