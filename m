Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794333462;
	b=MwL8EIMenRZO2VCiu5MNd4DL7ctPg2Q+wUfAIlLPjnVGiIS43lY4KR3E5lqYrl1XZYhL
	 BRNzfPk5K21L6B/E9QcZbrdyn9Gd/AhE0BIWSOvhO1DFS0+JWmxy0wnslaR3Mr4y15KZk
	 8behCQAqNojj+dR5UEqjqLtXw4/Zui/F0E69q6p60ZfRSmJwuPZjaB8J3uwrS/aoWmhK6
	 Jho4mumm7sZX9je2E0BtVMeLnctQarz8jVueTAC0+Z1w4ipOVQye8mnLYvoANsoXU1PSO
	 2Ze7ToTEsxM/w+aDR11YygOmRM+lZhPhvGyoO4zI6Sg18ROb9dPAOPJLucDaWL1fj0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333462;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=I9He/fnvIveKiIdStskM2jtFd2W+NnS+TFAR9JUlqKA=;
	b=v64Puje9E3cd6/G2RXHhRiwvicnMX5S9fRCb+rypFS7YvGVcdJLT3UcqyxiXpO0uTI/h
	 z6TwFMQRUGodmUm10Tm9LOViUU+fd0DZcVnC/+PczMLo5x3KAsF69gAbFqhxB/rOtPr83
	 E/Mo3uguqcJN+Uk25svic7gVq6VZLOaSbczILzV9UBbyaOptJDagVeZgmXJgohgcjFZ4n
	 zkItVaaY0o6ap/LyahFKb8QzD3boVYs7iw6A3zfAJfwcKeCCkCkQkp35d2LB+iBBq9eOk
	 gEEPsef+eqRFqt9hjyP0EyQ9xmSO3G4iqxNwD04hexco1IXBLBOzcant18MBD9lUTnQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a1DLQpEY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.177
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F4B606A202
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:57:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4F4B606A202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a1DLQpEY
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3acef9307c7so18803771fa.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:57:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794333460; cv=none;
        d=google.com; s=arc-20260327;
        b=ihjlE7uGEawkgcHFoK6EjSKY+fI2Ou92zluN/pNF8e6L+MJkplY5YLpNbORpdRm5O+
         +vvn/WuKhR+vSXkMs4ia+5AhWy32jdqAKi1qNQBklJ4T9TRXzTDARgVn5y1B5p/jQu62
         2frXHrGcw6uK23yKFCWjqrm9jfwfYuV12PhW7hcFSANVJs/mjn0R3tUvj5jQGqFR2J8V
         bi2gcitirjeUx3tSAYxgslwkbuiumS0BkWdko/Tf/UM29Vy8r38R/Bdfo536ELgrerev
         IVTwnUbQsUhD86bQabz0atg/qJPVQlxNf+w0CEI0NiA9nkTfgetjFUb4epfZQ8tZcoss
         DP6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I9He/fnvIveKiIdStskM2jtFd2W+NnS+TFAR9JUlqKA=;
        fh=DCwTHFnmt+L2HniMw4+D2tj+xAlpD4KU955s0jQ3VUk=;
        b=SOlSyT6rQsAlnBDMCbvlXlXdiqrKrT2hWvcubkYqneQxE9WU5cw1fchoU5TnToz7e6
         ETcB5hLp5HzLkfCUqtQIFPvbW3Q6GFClsPFu7umeHGxYPrMsOc7vTBB8PEc3zg1n8xTx
         Cvm8G4oGe9qYCT6hGsaQdl8UZf5pNQLhjDNY/kikOvsvSllQTVo93TgtJbdOI4KVWCui
         B9xFfe7t26F/0Z9HVLMqnCfNNVppTRx5xGTAL2agFYCpsHw/L56iiRlq7E1zN6HLiZfL
         bhtNll+7+YuxkCqv+ViKDMLmUw7xrKOg7qStjpTA9OS+2BSqzUszdd9KXsU3A6dvnyvE
         5BbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794333460; x=1794938260; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I9He/fnvIveKiIdStskM2jtFd2W+NnS+TFAR9JUlqKA=;
        b=a1DLQpEYFoQwvFxzStr8kdwy6qf6ubO+R4cGWipFwY1LSCjuZeLZX0j4Hn3KX7Bz06
         cQXQQ5CkDJDsJFfRBL6lDgVp5opOs35OQEuDlCrpXoIbJnZwBvF7Ak4jo3KudYguCLcb
         KFUyY4mpPT9JlsJ5c35tnwedbEuC7rsNtb5ERC4VQXTesDgGXghmwu9+Nv7CoMHHjlGn
         4uD47FX86dvCncx/zuPOLii0qUcCbm70Oh09O4/H2NBtTsKMYBrM4IOUl26LO6E/h0jN
         WXMJ7l01lr1NjXYBuaHNEG2XWlUpDTpcQw2AAL3lgZNqG1d2chaZo1S8WkKvnfmECGWp
         zZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794333460; x=1794938260;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I9He/fnvIveKiIdStskM2jtFd2W+NnS+TFAR9JUlqKA=;
        b=upio+WPtrlifks1tLUr4Gb5PUWmSV2fgUNcwlqFWr93zD/HZP9z8ZI5+E/Zm7faIwQ
         6HnRj3wdlLx5nUIlaGI7g/6BFu9f0VjnVcZvV+iZwimXO0um96rpNolzxJFz6OavHICl
         lKHk37uUZJsqslPnEHLFpSP3VWY6LvMJSTfNoBerJbfZUdA5BDpf6vhFW4TK7D1sqicw
         6NzgSYRz8tjCG+J1cp1SjJW2cz0kQi/vhGatfr7AAXltzPT874HvNdIZbjfKqWy6oEkK
         df6dXUlUhLGyVJ/yw1gFdfx+BYKbsX3+7829nzueoIeKxkaM7m0C0EU/fAxDzSdGWISP
         +vjw==
X-Forwarded-Encrypted: i=1; AL+hErF8qKpbpY3jEYzD7fVIr2i+3/Ddu8AqmPY/+P369bl559cTn7/jY+eEAABLqkiY9grp/yoR3l3ibHnQgE8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Q23aRT1EE0AqUCfFpYEOgvR5KDw5NXqF3fRxCIF/MxuE/Cp4h
	u5+2BO3DncU2XQ1OX0oFGcL0tQ0GR5JsOFEmlCTdlW+aceQp/i2QLs6P9NgVRIkO+FFy3F/ds0m
	8EHeDldtXet1O+FU0CGQ8uR19Vb3LlmE=
X-Gm-Gg: AYBFou0u3ErFTvryGPggwUmDfIu1hJSBCDoNnsfKC4Tmnw5J91OR235smNyfLpQMNWg
	NDzS17oyQACfW22MTxDCVsl2auuuPtw+Vv6sNo6IPcUC7VszgQv385Jp9OKO2S3yRl5qMNp3tCE
	CT2DuTlppEyw2/GX9C9/LXshZolOVJle9T823cQXfvjRsUlat26HSYYXPQRubZ85qHZTM4pc5Xd
	kKRUOEoxEn4Xq8azFrQKkpT0NtySUg4bQdlG3on9aB3WWjdINGhp1yh2gwnNmzhngxJEd6bC3G6
	hkXFdxLt5ecIPOjkfB+idHpoJK0xrbGLV20QWOg/KWhpNWJ7nJURRxi3K3RA7cl41G9uxyh63q2
	9C2Te9z+jmw3w7ukf0WxbMGeFUw59tDbAwsKjdrpn3NE80yae6LYsITApsALHF4UZbtQkmv27LA
	T0HP23cAYhPLSPnDiG+d1UreKNtnL3MlKub8QYn4a3v276FFI9DWTj
X-Received: by 2002:a05:651c:158e:b0:3ad:f0bb:344c with SMTP id
 38308e7fff4ca-3ae0961f342mr5818461fa.10.1794333460012; Tue, 10 Nov 2026
 09:57:40 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110054836.1515030-1-senozhatsky@chromium.org> <20261110054836.1515030-9-senozhatsky@chromium.org>
In-Reply-To: <20261110054836.1515030-9-senozhatsky@chromium.org>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 10 Nov 2026 10:57:27 -0700
X-Gm-Features: AclHuK8pPFE0hpuvuz_PzsjrrD8lcbAsp3pcgD0h8PmRUyeyRyhQq1XIFPx1444
Message-ID: <CAKEwX=OhvH80f-6emK0fBhbm2d4Er0rQ8oXX=FmfG0vrTdvZdA@mail.gmail.com>
Subject: Re: [PATCH v2 08/11] zsmalloc: encode 1-based obj_idx so valid obj is
 never 0
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
> The next patch embeds struct zs_handle into zram and zswap entries,
> and a handle is considered allocated when its obj is not 0.  But obj
> can be 0: object 0 of a zspage whose first page is PFN 0 encodes to
> 0, and some platforms do give PFN 0 to the page allocator.
>
> Store obj_idx + 1 in obj, so that a valid obj is never 0, and adjust
> ZS_MIN_ALLOC_SIZE so that the largest index still fits.  Unlike a
> separate tag bit, this doesn't take any bits from obj.  zsmalloc did
> the same before handles moved to handle_cachep, see
> commit 67296874eb1c ("staging: zsmalloc: Ensure handle is never 0 on
> success").
>
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>

Bit convoluted, I assume the this is so that we can use obj's 0 value
to mark unallocated state?

Reviewed-by: Nhat Pham <nphamcs@gmail.com>
