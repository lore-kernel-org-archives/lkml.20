Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792508177;
	b=0QPAJMSo5G3MMGXKzG1Szex6CkkrkNHTxcdNzeZyotN6F5JjVeZGEMyaprssUdhvAu9Q
	 8PUXRqVII34M5N7kpC9D5+RBr+xztfzkdlbg+XsHAKA8tFR24rp9fsq0UJaKqRyvdJyua
	 kZAtuX4yAx/wDAw/38VVXkkZYgyRlid7ZkHDzlWxJvhg2R98MdJGmi06QqhDklPJ41vDp
	 28YrOGzAhNc2ncmucc2v+D6BumtHN0YrBJKifOLQbbs+YDfclMb2Ue4fuZxCFhM2zI50A
	 Hu+VIb82XPB2dY/KZj9bYKd9oXhFVTVBbLN259atw6+GDNyPUbVXbOA79fplKTk2piQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792508177;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=eiEwhWr3XYxLbSW4Mrcitwl/6JDMFOEBaL5OtTFKJ9Y=;
	b=LEs7fe78zhd7etnOzlTpJQ1olOZAeWbmdA7EoSX1Q2tps0yVMg/YpmrlZc3u8w4pCJRj
	 LSn2sZTtcm3Qx+xireydQzcXI1PQVGFgFuHo3MJxcQfUS1ODskbjwbrjKSTqmqw7c1dVf
	 DhG2H7/Mb7owb0h/3+uXkvDQ+luuc81IDvmmQb7ljr1fwMulMdlF1baAbxQBOyQIAYHa2
	 Mj4SoRKV9SRgpJDYkdxnzsdIdTwUZINE7tVACsGh7U9To89PvxfKZYFSgIfYfSwuy74hE
	 OoEBhsAhaonoYs3LzrKEMLaK6Kvz9AztzY62HbiBzjUVNEetmtIQosscrKMrTK5oM8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=TcnMgWG4;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50F5606A329
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:56:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E50F5606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=TcnMgWG4
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c38ac26cc5dso498687166b.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792508175; x=1793112975; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=eiEwhWr3XYxLbSW4Mrcitwl/6JDMFOEBaL5OtTFKJ9Y=;
        b=TcnMgWG4iQ74Gv/8+ntE/N8vkBnLN8KxuneoHXQINvbHeKoymnUsSMe8yvoVMGbd2K
         EfW5VQXeTwXbDkD2+Ycr45f/xfnLrQkw/WBmdwXwAD794E+2gJeH+QW4MtfRcghIcFcW
         POHROthhepFhUgfWClrgFyOesk5Tb7QqxJUjzH1FKBzBmTPnYAyKKx5UgCS+9OSb872K
         TxtKH33PkbfhZtiZILsjBjqyRvkXbz063hQpPUYiV6egwxPqhNcwe0b/rJzSifoFzwvn
         ACP+zxTVjA8IbwZnr2HSQ3MBHusF1DROFIzUFoOtrgFBQMb3J11XvhifwzOk060M1IIk
         jHRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792508175; x=1793112975;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eiEwhWr3XYxLbSW4Mrcitwl/6JDMFOEBaL5OtTFKJ9Y=;
        b=Gs39sdpzA5ax9pvgb0hCTFNMhOLq+inMRmCh9vV4C8Y4kpEdnu0a4Rz0nLRv+s6KsX
         Q0Vn6q/DSnoBRehkUlqHDtJNMMeqI967MDLtC6H5BkxYe+yJGf2BnpSufZAUKW4irlzT
         D8KH+jUDxHZcwKlausHWyCVfOM4T4CZ/n4jN5rQ2FxfyXz8FMToMWvXKdrdWHmw93JEp
         cYvoFQV5KOCBqQ71eg+eaoxW7RcLShr9WoadfKknWWk2jAXcR6fJuG4ozeUSkNnve1tv
         /nVo8uBXzMrPHOPYpIjyt2YhqUiuDqdcTdX028LCWP4+57mnu6QTsvkNFFesff9OGouM
         /Mrg==
X-Forwarded-Encrypted: i=1; AKwUvByhxzalVIA/TLaijv1r782QbG5myiaLOxXzvD6+RiRSXiuv2YxrTKkxKkOI060IUPgYUocpxotPsQRO4js=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+MLvmc0xC4ePJoodtDKo2fdhTICyvzdAxMa1SJclU4mWPZ9pz
	8Oq4zmVB8/1vLsGt0To2AGDdfpxotYF0qrppj2Ud6sLA9hQCF6yP4rH9mh0SkyNEog==
X-Gm-Gg: AYBFou3ihEig1MGxYoC4lXkOAF6Tg/EU4xMP2Rw8xRHDNnFfOaJV2fkMbWfLcsCMlwP
	ogxr5ET3WYUdrmTpszTerQ0RWHjxiQxL7wP8CWJ91WZypjdS/ENKUUMaje6YyzOdM6Q+MLNNcPb
	fGY6kLvbT2rpgjitdReOOwTsjdvM/lMi1vbpDai3wnZggjuyzZoG9AUjXQ48d+nNT7v0GUc5jxM
	NhALABolfKHp+BKJfCDlJAv1QndzvA0S9gYtFWmZgEmzuvVlyux8If2WU5xOJfJQ7aUGqSpqq6R
	O1TMdH+w3gZyPh8EXjhu3J5VlT9i86XYa3VozCeT3IRK/1tsZcotkOeI96dpJDJz6C1P01v8LjE
	rfY9HCg+o+mj/sK48DIpXYdnqSP3Sj8dt4eDCTqjxtj5GkXraUVBN4WTPa2sbNfLHkasKc6HWnR
	hX0blQNxD/sCgYClU4OtfdaE7mCXfD5xX9QqaPNfw9oLCZjdwvGllqu0FDSX3qZDcy34/71vDtJ
	1eJSRb+y4FKRUE396MjOpnxiYzXFv6YIU47YPkS
X-Received: by 2002:a17:907:5c9:b0:c2e:7fe7:288e with SMTP id a640c23a62f3a-c419ef256camr6224966b.32.1792508174841;
        Tue, 20 Oct 2026 07:56:14 -0700 (PDT)
Received: from elver.google.com (11.26.205.35.bc.googleusercontent.com. [35.205.26.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c409239b3acsm502151866b.86.2026.10.20.07.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:56:13 -0700 (PDT)
Date: Tue, 20 Oct 2026 14:56:10 +0000
From: Marco Elver <elver@google.com>
To: Caleb Kan <calebkan1106@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
	Vlastimil Babka <vbabka@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Oscar Salvador <osalvador@suse.de>, Caleb Kan <ckan@cloudflare.com>,
	kernel-team@cloudflare.com
Subject: Re: [PATCH RFC v2 09/11] stackdepot: add architecture hooks for
 compact frame storage
Message-ID: <ateBClusB8nSEnAr@elver.google.com>
References: <20260908-stackdepot-trie-v2-0-1996d5cef732@cloudflare.com>
 <20260908-stackdepot-trie-v2-9-1996d5cef732@cloudflare.com>
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
In-Reply-To: <20260908-stackdepot-trie-v2-9-1996d5cef732@cloudflare.com>
User-Agent: Mutt/2.3.2 (2026-04-26)

On Tue, Sep 08, 2026 at 02:13PM +0100, Caleb Kan wrote:
> From: Caleb Kan <ckan@cloudflare.com>
> 
> Path-compressed trie nodes can reduce their frame storage further when an
> architecture can represent kernel text and module addresses in 32 bits.
> Add architecture hooks that compress a frame only when decompression
> reproduces the original address exactly.
> 
> Store arm64 frames as signed 32-bit offsets from _text. This covers the
> 2 GB module relocation window without depending on a 4 GB high-bit
> boundary. On x86-64, store the low 32 bits when the upper 32 bits are all
> set. Keep other frames full-width, and provide a generic implementation
> that always rejects compression.
> 
> Make the generic header available to architectures without a specialized
> implementation and wire it explicitly for UML. Add KUnit coverage for raw
> fallback, arm64 boundary round trips, and native x86-64 prefix compression.
> 
> These hooks do not change stack depot behavior until a later patch adds
> trie storage.
> 
> Signed-off-by: Caleb Kan <ckan@cloudflare.com>
> ---
>  arch/arm64/include/asm/stackdepot.h | 42 ++++++++++++++++++
>  arch/um/include/asm/Kbuild          |  1 +
>  arch/x86/include/asm/stackdepot.h   | 37 ++++++++++++++++
>  include/asm-generic/Kbuild          |  1 +
>  include/asm-generic/stackdepot.h    | 19 ++++++++
>  lib/tests/stackdepot_kunit.c        | 86 +++++++++++++++++++++++++++++++++++++
>  6 files changed, 186 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/stackdepot.h b/arch/arm64/include/asm/stackdepot.h
> new file mode 100644
> index 000000000000..df8959d59336
> --- /dev/null
> +++ b/arch/arm64/include/asm/stackdepot.h
> @@ -0,0 +1,42 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __ASM_STACKDEPOT_H
> +#define __ASM_STACKDEPOT_H
> +
> +#include <linux/types.h>
> +#include <asm/sections.h>
> +
> +/*
> + * Modules are allocated inside a 2 GB relocation window containing the
> + * kernel image. Store a signed 32-bit offset from _text so compression is
> + * independent of 4 GB high-bit boundaries crossed by that window.
> + */
> +static inline unsigned long arch_stack_depot_frame_from_payload(u32 payload)
> +{
> +	long offset;
> +
> +	offset = (s32)payload;
> +	if (offset < 0)
> +		return (unsigned long)_text - (unsigned long)(-offset);
> +	return (unsigned long)_text + (unsigned long)offset;
> +}

'(unsigned long)_text + (s64)(s32)payload' avoids the branch and the
potential UB if 'offset == S32_MIN' on a 32-bit 'long' (though arm64 is
LP64, sign-extending directly is simpler).

More importantly: why not use these 32-bit frame compression hooks
directly in the existing hash-backed 'struct stack_record'? That gives
most of the memory savings across *all* stackdepot users with almost no
added code.
