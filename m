Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793876980;
	b=b1HMHyMnTvGeFXE23a5fYLeKCc03+tsx3R/f9tn5Cbk8FXdPntDfRvaF3Qi/utcPCn1Y
	 gY5EtR/ixJBHoUwMIBxB/33AVZqP5GgrGMnFMhJRo5aGIUe17qFA//1Fn3aROEKwEwvj2
	 xbEhPerqKrA/z8tRXnWeIf8v8GFGzTuVHWjqNC7HeWua9N6E4v7MESQ51QTgdG/5iKPiO
	 TbFPgYktl5cU3RzYYLx6Msi+UImmtQOAA25lG4dRP4PcF0ExJTc0dsI00lT9Z3ieHGVGM
	 NysF5i5KRtpig0QfDLANh0Vp6iMlw3GcVEXMDjBs3KdgYNow8YGmW/yB6Ftm2q2JMnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876980;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=NLxUrhb+i0y7kx7MWfP3g7AgEu7tvuVh8LKyS1nXFQo=;
	b=qUOAzrfTTY9CNIlp3uUS2ro45OSx7OoGOk3vzBI2GnVyTmqSZ6FkSAidTaXhsxeew44u
	 mYIeyceBHtGdNwOyezfMyz1+PXzRq9NectHO4x2OPlkUDWpYIQndweJjKEF4DPva/8ul5
	 G8DLiazJXlKrnAePpgjyVxHVydz7i7Oca8ZUf+Neq2qFotfWXZGASUCGJni+OHirjGuPt
	 9EDF3moLjUmfykTkexokfS2nN2LxOHooQL4gyTRW2gpbOHsQk+toMqWZq/G8BHEZQehCP
	 efPLRGo0qCDqyzxMIGoIhOfidwJb96WUPrqdO3DI6QNGvtyX+xaLOj9SFr9kwKB5hZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=G4U556jF;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FD6606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:09:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7FD6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=G4U556jF
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1aefd1bf74aso523289c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793876979; x=1794481779; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NLxUrhb+i0y7kx7MWfP3g7AgEu7tvuVh8LKyS1nXFQo=;
        b=G4U556jFlp89CAG0kpO+nXkhzuB5j9uRMx6IDe3U10M9iFXcZUqF8vIwHFIGbwY2XM
         g9SzdmKawDDbh0U0fwa7oC8r4dvSoD3Eb4ssuoZZYzDacpEMjNK6ni4s5hTKFnD4rwUb
         fqIyu/yUdylnrnMzn+L0g9pujw/DGE5BmWO/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793876979; x=1794481779;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NLxUrhb+i0y7kx7MWfP3g7AgEu7tvuVh8LKyS1nXFQo=;
        b=X9EvHG56XdiNYBsNboQVJUfsj8iaV6UfjfJMJAtgEwCwj/f/N8ttJopm3Egi/Ju7xF
         OBAIsSPpAw0P75uMPcqkIeI29hNPOJYjh14nWOCko3NynDFUIRyUf04ozlI3LPyptb2g
         IxTEQB9ZKwmu9+0w82lkncrsqtXQeYjWq8wW5GO9RdjU8I2LG926KBujo831FNxOPz3Y
         9+8ltpoKT8i0fte8y/IH8N3x5WbTcM48qIiXwX1nXGxjXEaH3tMTTD3I1K1o+B0hAklt
         U+k5AhpN5AU29PgZ4MyBC6FsPirmuHqTwQKVJJ/+ZrQCIesDr0WdcBqS6vm7b8TZ3r0b
         zSsA==
X-Forwarded-Encrypted: i=1; AKwUvBwBGDZ3V3FdZvma2uDTEU9KBRordYGCuNSONBe/MIZfLSawmFMA/wPUM+PWyhx9vPha0r5kpZ0IwRD4EWE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+phvonZ6erMDr88PtBEeL985h4mFHZo/t+XXX+FDOrIE2Adp1R
	yibO7q3majKgj6F/UfTPN/FPGuJoorIzIAnkDJJRTGlVJnGQ22+vJ5m/EtOdiP/MNA==
X-Gm-Gg: AYBFou2wZ81zKdAdGbhMzatGgjV6gPyFI70lbvctVSY88rTd8sWRPdQHW6voIglCygp
	XRiyovGEWDYST+haYQksRCjgNvCx2ytnbWGpNLsxW3W0lf4n5YajqfEK7/7Z7mWTRUh539d6xxa
	QE7bX8uF+Kdbie4RElKG8vAPYl3bKrKEaLTMGTBput8nPnnv6idgNACtsmvqPX5soNi0+CkSxVQ
	1je2FspwknRWpF12WpDY4hST+PIlNYdbRbjLG4BVz+aY4qjwryAaaIXTMnq47TWh34+6TC1w3fs
	0HlDbWDDOuIdD64xcH/PX2EZAmTKSRVY49FF9zT4WccO1wT1glt+sxum/1UAO8gK7f3BUkcox5u
	c2hcs1Fti0GbJmqB77DP06PHtU0juPBKwbblSEuxTlDatTaRTeS0kI9f/OrSqJbhIdIlOlFF+jW
	OMa5E4NDcyEved++yom+pPjd1Vpvxh78wPiL4gxVWgaf9byL3RGk6oRyw9stwq0eIOV7IbrlAwn
	tWljQ14H9TUAb8fyST71cDZbRvOIgOzs4Z19zAkMH+l2ICVGpp+7cBsVixV1e/FpogDlpAnLqZH
	c6OabYECesLZtxVxmZ3B+pQ/iR/gA/MCq+CXxWGIJm+JFHdb1TI57Ki76Ge/n5eYFgc=
X-Received: by 2002:a05:7022:5e08:b0:1b2:42db:8a5d with SMTP id a92af1059eb24-1b24f42dcf9mr2938410c88.3.1793876978922;
        Thu, 05 Nov 2026 03:09:38 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:8bc:6b25:484c:8975])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245b8822fsm18931590c88.2.2026.11.05.03.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:09:38 -0800 (PST)
Date: Thu, 5 Nov 2026 20:09:34 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Jenhao Chen <jenhaochen@google.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Minchan Kim <minchan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, minchan@google.com, liumartin@google.com, 
	benwei@google.com
Subject: Re: [PATCH] mm/zsmalloc: inline obj_malloc() and obj_free()
Message-ID: <auxjJapQ4j8518aH@google.com>
References: <20261030121700.260975-1-jenhaochen@google.com>
 <auwR7gnuLsF0lpmG@google.com>
 <20261105103947.7521-1-jenhaochen@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105103947.7521-1-jenhaochen@google.com>

On (26/11/05 10:39), Jenhao Chen wrote:
> On (26/11/05 14:23), Sergey Senozhatsky wrote:
> > I suppose there is performance benefit?
> > 
> > I guess I don't mind in principle, one thing to note is that this conflicts
> > with [1].
> > 
> > [1] https://lore.kernel.org/linux-kernel/20261105044752.1997895-1-senozhatsky@chromium.org
> 
> Hi Sergey,

Hello,

> Yes -- in a steady-state microbenchmark of paired alloc+write and free
> operations across 8 compressed object size classes (384..3136 B):
> 
> 1. On current mm-new (zs_malloc + zs_obj_write + zs_free):
>    - Clang 22 -O2: -7.7 (arm64) / -11.8 (x86_64) retired instructions
>      per pair (-3.2% cycles on x86_64).
>    - Clang 22 -O2 + CONFIG_AUTOFDO_CLANG: -13.0 (arm64) / -17.5 (x86_64)
>      retired instructions per pair (-4.8% cycles on x86_64), while
>      shrinking zs_malloc() from 2,872 B to 1,828 B on arm64 (-36%) and
>      2,088 B to 1,474 B on x86_64 (-29%).
>    - GCC 15 -O2 (x86_64, without AutoFDO): GCC leaves both obj_malloc()
>      (306 B) and obj_free() (120 B) out-of-line while inlining the
>      single-caller slow path alloc_zspage() into zs_malloc(); the patch
>      saves -23.7 retired instructions per pair and shrinks zs_malloc()
>      from 1,738 B to 1,441 B (-17%).

Cool.

> 2. Rebased on top of [1] (zs_store + zs_free):
>    In [PATCH 6/7], the new static obj_write() helper has two call sites
>    in zs_store(), so both Clang 22 -O2 (360 B on arm64, 219 B on x86_64)
>    and GCC 15 -O2 (obj_write.isra.0, 229 B on x86_64) leave obj_write()
>    out-of-line as well. In the zs_store() fast path, obj_malloc() packs
>    (m_zpdesc, obj, zspage->class) via location_to_obj(), and the
>    out-of-line obj_write() immediately unpacks obj_to_location(),
>    recomputes offset_in_page(class->size * obj_idx), and re-checks
>    !ZsHugePage(zspage).
> 
>    If we also mark obj_write() __always_inline alongside obj_malloc()
>    and obj_free() (with noinline on alloc_zspage()), the compiler CSEs
>    those redundant operations across the fast path:
>    - arm64 (Clang 22): -31.3 (-O2, -4.0%) / -34.7 (-O2 + AUTOFDO, -4.5%)
>      retired instructions per zs_store() + zs_free() pair (vs. -8.4 for
>      obj_malloc() alone), shrinking zs_store() under AUTOFDO from
>      3,144 B to 2,448 B (-22%).
>    - x86_64 (Clang 22): -26.6 (-O2) / -31.8 (-O2 + AUTOFDO) retired
>      instructions per pair (~4.0-4.5% latency reduction).
>    - x86_64 (GCC 15 -O2): -37.1 retired instructions (-5.1%) and -5.3%
>      latency (-5.5% cycles) per pair, while keeping zs_store() slightly
>      smaller (1,997 B -> 1,943 B).

Great, I'd love to see that in v2 commit message.

> Would you prefer that I send v2 rebased on top of [1] (including
> __always_inline on obj_write()), or send v2 against current mm-new
> first?

If it doesn't trouble you too much, can we finalize [1] first so then
you can send your patch atop of it?  I can ping you when [1] is done.
