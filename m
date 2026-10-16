Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817215226B6
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166974; cv=pass; b=f92mQPehukKK7oo/4U1ajHSdajH4u5BYxwYsp5I6bRDYNZ+N4LJgQuFwd5dGu8XepKmJgl8zL3vryn+nv3M4hQJ5yNSYo5U2tM58NVT3S+hgzSzBRvLHyieL/jhnIxyWyIyCKwi+LEL9pp9vHJ/xAw7omF0IAIyBXYxiw0ogRaQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166974; c=relaxed/simple;
	bh=JK1d3K7g5Jktfb+qNEOacma+tvhF8sNAGrJHfx8GOGA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HqCuavSip4puwkEYBR8USTwkXl5IiSFRFSRNQiLtiYvWSCtDS37lTj7yruN+uYpTV5FvvN4A7eecn15fIaMxAB51qddinZRUvRL8vgD1U4GuRBnwtobpHPZf9HDIjeZBZYpOQUJyGTmsmhhQ51chUyhICSfZQz/YvxOL4cdAAng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p+BnD9PS; arc=pass smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p+BnD9PS"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49fbb2acc90so1166515e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:09:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792166970; cv=none;
        d=google.com; s=arc-20260327;
        b=AXe2KzV3wIj3Lu8DKJn1MJgjvPEmVWvRqY2bw1bJd0GtZm/XXJ0bW7pRHsAeYhEiCj
         kzELRWB82f37o1pPE1aAEW0cezEPT5QwdkkCJgPmHhai8pNTWBsznW4fvCaF81d6z7Tm
         SuESQSX0Uf/n0Mg0+wdha+ItjFuSvBMQu87wWo5uGV3Xpnu0kAscriS7abrN77Y+925N
         bo4qBRPsfoBLepg/MyPZnzIK/K0q9fpXQMp8TVV0/JP32EedTUX5ghkob7XFYXKfskz3
         PFOALqo++bYT750MKJil4Pe//+8dPpTO40ttBjKGXE+KOVVsMLPHozb4KjJNecocyfjY
         Dlpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=01clFvS8PqYDYJUml8Ul3JDl8oOLRSNhVNdWYi0v5ig=;
        fh=KK7ME0kxoBq4yqWmkrThAc6IwDLWCIRto2j7VP3jwbs=;
        b=kWWkXT3m/Ca/vFHa37591ctfPs8mwa2TA//UEZtCjGh4HuWUzBnNWEBWQYSW5wrfGq
         n5rB9WGt7+ocpI2HM++2fQl0zYU9mS/cmCMdaE8VXyliAa2DVMYuz5EINksjDIKEYuBE
         xXgqI3d/gBYWJ0CCfQWX8OfmUBR4YjQD+taa9R4PBCnDmNiM2tgVA4RDyeQluCFtNftN
         mowjw1kudXboGjCHAtprHYZROFxWAiFi+d+yed51x+htJ3u076M6Qi3NBWAQOPk0waJ1
         JEMUMWvzvaR+3u2PC6YXGadHCuUMlUM3uvKrtO22hnlKqpG+tSS9BE5Jl41nLL9Qi+6I
         GAHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792166970; x=1792771770; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=01clFvS8PqYDYJUml8Ul3JDl8oOLRSNhVNdWYi0v5ig=;
        b=p+BnD9PSSMRcJuKdrC3LejFYMI6nR7EbIYmJoQwOoEdmLZznQBqATm2IDh1pijsF6q
         LZgLDsre7xnRbLHBSfSrAjCEzdMMLkMytG5dpAtlgtbPlcT0Bl+yy76B8flVmmUbB3QR
         R7cJsgqQrRfIlalslrKG03hpEA04L2ClhnUv88v/xVTjkdAT07e7csQyqyWly0WbWHeB
         YWAFtYWxj7Le+b1jK+BRJqWalSVKjwd/9s2LMHuFzs64SZJlrUVXItPt7W5wW5sxSoUF
         s5SBeczxn4hhoohd1TuqrRsTHxR7pnph3f+H5dQ8LTim6NOhWsgBkIeXmeoib88zU0DZ
         kxYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792166970; x=1792771770;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=01clFvS8PqYDYJUml8Ul3JDl8oOLRSNhVNdWYi0v5ig=;
        b=uAroDzSYyHTil/onBrrz889EnlmXKHBMSK+jqGABDztOT8g90MA4IKUuTan3+Pb17B
         how9NhKOf+StUhxwpfBsLdh+/is7irtcQkgBWukeEiP8Ddr+n9LN5ykZG4apagiH/KUk
         7MDQC7xlkLGlm7SO6+KHIXFza5WtNNkqgeb0Ji1Xk71ne0ViD6dPgWQpRx7vBcfntOG/
         qvH823dEY5UBHHF0qY2hc6M0cyPv8FU4EfcgdUSkiD8GNkCd6zcIJt8gFhwFvcqaGIGB
         XFx0JFpmbkFVpUK4DWokijhQMxMfWES4HFrgLHTh3Q+7suruM55lZ98IWCcPmDZaOeMW
         HeNw==
X-Forwarded-Encrypted: i=1; AKwUvByIiFDLcjvqKd7/NdL8HL78JhN9q1k3/gV3sVUQMeR+vqSvXRxQuBEv4pV8x4X9OP4m3jY9mAPXGYpWtkA=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3ziCEYnnCH1qOs9pnH1+tV+6gsfVt4kXgJmGhHRhLkQtDLv29
	uutgRYKRGT8rp/h8ldgutez4J3RqiNTHehzTu3MpQG8T76hd1h/WK5Y8LhQlFBtAHoKhjbUA+5a
	8VBpBRo1+0npTyDidVnO4YUZ7b0NHnsw=
X-Gm-Gg: AYBFou0gNclszf+HQDzo0S0Em7oPdG5/RW8R2PyuYdgndI8J18uAzMgQ/KwmjhCFz6Y
	z+Lf0vKWJtvk/JI42KiQAh5db2GLy0EtIj//6zi/IalnixD+k0Hk05GXv6MyUEYcf3jbW5aqFE/
	+pdiM0DES0apVAWQjbtiRETkjYfeZ6PeQxjkq0g4MVBestG9m6m2EcG/DpveF4QIYTmYsthzr5R
	bJdSeIORHQVQWOxMFDqyIFcZm3H+m+AdhpC6Z8ER1kAfPejZNHBP6HNnKKpMlIqU5hTdJ4ckMjo
	/J/HhtqQJeIQVZea8AGgAjUeV2Ai2PynEkNyHG99WM53Jh9tlbgbwatHD0ve35N93C5iBlXImTU
	FqXdc812C464o18QnriqjiLuN4XHc55vMIe4e4L3uVT3+xhyRRjOcq/zbcnBnkFkYZlbuUsAQhw
	p4jynNAg==
X-Received: by 2002:a05:600c:6215:b0:4a1:d41b:5060 with SMTP id
 5b1f17b1804b1-4a1d762b705mr4918205e9.22.1792166969428; Fri, 16 Oct 2026
 09:09:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016120927.3191690-1-hongfengchen@xiaomi.com>
In-Reply-To: <20261016120927.3191690-1-hongfengchen@xiaomi.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 16 Oct 2026 09:09:16 -0700
X-Gm-Features: AclHuK_3q4fgvpP3PqMsH4m0BzcVF-oc6GrjQvM0hL6t6dEcQtFu56enbmqvAPg
Message-ID: <CAKEwX=ONniSwdiZAe_8NT5XwVj=Mmc-WJs_rWE4Y5snjFg2=Eg@mail.gmail.com>
Subject: Re: [RFC PATCH v4 0/2] mm/zsmalloc: defer object free to per-cpu batches
To: Hongfeng Chen <chenhongfeng0212@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Barry Song <baohua@kernel.org>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Jens Axboe <axboe@kernel.dk>, 
	Johannes Weiner <hannes@cmpxchg.org>, Minchan Kim <minchan@kernel.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Yosry Ahmed <yosry@kernel.org>, 
	Wenchao Hao <haowenchao@xiaomi.com>, Wenchao Hao <haowenchao22@gmail.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
	Hongfeng Chen <hongfengchen@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 5:10=E2=80=AFAM Hongfeng Chen
<chenhongfeng0212@gmail.com> wrote:
>
> Performance results:
>
> ROCK 5B+ (RK3588: 4x Cortex-A55 at 1.8GHz, 4x Cortex-A76 at 2.4GHz,
> performance governor), single process munmap on A55:
>
>   times in ms, speedups over base
>               Base       Patch1       Patch1+2
>   size        time    time speedup   time speedup
>   64MB       13.81    3.62   3.81x   3.28   4.21x
>   128MB      28.50    7.18   3.97x   6.49   4.39x
>   192MB      42.19   10.71   3.94x   9.69   4.36x
>   256MB      56.06   14.26   3.93x   12.89  4.35x
>   512MB     109.50   28.43   3.85x   25.66  4.27x
>   1024MB    217.10   56.70   3.83x   51.15  4.24x
>
> Same machine, single process munmap on A76:
>
>   times in ms, speedups over base
>               Base       Patch1        Patch1+2
>   size        time    time speedup    time speedup
>   64MB        5.59    1.58   3.54x    1.49   3.76x
>   128MB      11.86    3.16   3.75x    2.95   4.02x
>   192MB      17.18    4.72   3.64x    4.45   3.86x
>   256MB      22.89    6.29   3.64x    5.87   3.90x
>   512MB      45.15   12.52   3.61x   11.64   3.88x
>   1024MB     89.16   24.75   3.60x   23.12   3.86x
>
> x86 (Intel Core i7-14700HX, P-cores locked at 2.1GHz with turbo off),
> single process munmap:
>
>   times in ms, speedups over base
>               Base       Patch1         Patch1+2
>   size        time    time speedup    time speedup
>   64MB        2.87    1.50   1.92x    1.14   2.53x
>   128MB       6.00    2.93   2.05x    2.21   2.71x
>   192MB       9.33    4.35   2.15x    3.33   2.80x
>   256MB      12.51    5.78   2.17x    4.38   2.85x
>   512MB      24.96   11.39   2.19x    8.62   2.90x
>   1024MB     50.19   22.78   2.20x   17.05   2.94x
>
> 1-4 process munmap of 256MB each:
>
>   times in ms, speedups over base
>               Base       Patch1        Patch1+2
>   mode        time    time speedup   time speedup
>   1p         13.18    5.78   2.28x   4.35   3.03x
>   2p         25.83   14.41   1.79x   4.57   5.65x
>   3p         35.70   22.14   1.61x   4.68   7.63x
>   4p         44.25   28.71   1.54x   4.75   9.31x

The numbers look nice, but I think it's a given that if we measure the
process whose work is offloaded, we'll see a speedup.

But would this come at a cost?

1. Would memory freeing be slowed down? Could you compare the host
memory usage over this period of time etc.? Hopefully the parallelism
would cancel out the extra overhead of setting up the work offloading.

2. Would this introduce isolation issues, especially when this work is
not properly accounted? Say you have a busy-ish host, with multiple
tenants. One of them is killed. With this new mechanism, would this
affect the performance of other tenants? (for e.g if we need more
cycles for the async overhead, or if memory is released slower overall
as stated above, etc.)

Some more benchmarking to show this would be nice!

Another thing I wonder is, how much of this slowed down is because of
zsmalloc's own inefficiency, and how much is because we just have a
larger logical footprint because compressing memory allows us to
allocate more. If it's the former, we should dedicate more time
towards improving zsmalloc. If it's the latter (or if fixing zsmalloc
is just not possible) then yeah maybe parallelism/work offloading is
the answer. An interesting setup would be, turning of zsmalloc, but
allocate just as much memory (logically-speaking), then kill the
process and sees if you observe the same slow down.
