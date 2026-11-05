Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793900222;
	b=Uw0yovO9TaFrnJUzFRFrQw6N2kqkkL+4xUmG8mKnw+lWImQMi2GL0J9CtHsnfdsZu8A3
	 +p9EJuEsLDE7wW79Ugo4kYvsqVxpVp9MBDkS0Db16GVQRNSmdks0aR9t4pU/yOpqdN9NZ
	 sq3+cYvao9ZMR/9LiogFF4syP1GKbt0/WwZ4XnUzqMt1Qc5hh6lbD2XIQvTPmu671JVuu
	 ObMsNLSFKGBruD3GYA2fqOvHMMH9sIEIoBHDNosFuzU3Fdi9E4fkOFBoFwyIJYT1md3Fb
	 bkaYC+4NVYwypSBuvt5QAZ0fx0lpfKwsr9m69etJ3hw36gFRtFrXFPvfWuxGkkvWPFQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793900222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dk4g+BGecR/++NTUwlCVXRBVFsZCz/QDtiIPUnrLB94=;
	b=hlZoy+YDjL0wBDHrX/ydDFncYtaeLp5vUTHAnwEdIEY1PY3UoHl5+CqDesCTsU/9ynvt
	 5GlVTC961Bv47c+Nyim89PgUhWBaPghOmNEziPPxo2yhm20wjTe7ar2Yx3Vui3ma+Uzj2
	 MYSDa4Mq+s5Lcvoc7mnlw+jEgHmYu2Hq4JGW1RO1ofodzjQBlMNwRwXec+4a7IBwBO93+
	 zRPi70Su/+shQ7od+xxojGSZ6f1+wZlhwqvUYNRO1+tCsIIbftt4RDUBmo8kSK2Y17yWQ
	 DzffJ5q7iuS3hg/Rf60eW8hKt6Ry/16AYxT+KuhmBEeTlG4cCIBVQ4yDm6A+VKgvtQg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K7kVu37R;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CB0606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:37:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0CB0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K7kVu37R
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-491971ac844so724512f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 09:37:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793900220; cv=none;
        d=google.com; s=arc-20260327;
        b=KPiG++BtZUvgGlpqw9Rl0JoxaWxH7pqAqP5zcyQ/oFWGz8fxx5C4x64NHk1LXAmtxh
         FTODNWSwHflhcG8wYUsH2ucrvBBcAQlOT4OJd+wcslUWBAqewvd+9ZDl5cCtNJM6/jVO
         j7+tbZPmEzOB89pagtstGRvaYN4cUzT1dGoQUDbVl1nJYfj2eH3KHysgNZKlV9EOHgM/
         aciqY92SRdMxSpmtV9Yrd+UVKg5JQc7HvrzcE92oDGVE6U2asFArBCJvZgDqzg1yc2Tz
         gjvxRuLk5B8gUym2U6RrFNSK3EfNrjjcm2nfWNmECi8Y17/+QvdFShsarglpNuN6Elgx
         eZRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dk4g+BGecR/++NTUwlCVXRBVFsZCz/QDtiIPUnrLB94=;
        fh=h1qzhLNbvWP6/wf9qRswdIbaRwx/vh3q4D+D4AZndY4=;
        b=f5sARhJMPzRvj5AFM0TACcRPMmjKxVLX/z5WWmNifV+hpSmYi2byqpdVihRM7+sUpN
         sS8AwuXnm91ROs8Bobg3CT2LJSpm9FJeSa9BUjeLWzpB2PCvO+Wq26YF3dND8RWD0YEq
         RP83y3EmWMjsyhW0U1+A7lMuzRmvB0SuNCCj7bNSevCMyYpCzYp/4+Jho2tjQpgzTrQc
         XFDRcyLq8VQr11m6Fbo7msqjXNK6PsvFBOy0ruXQXaWC2cDu09ZPApOzgno7lF+iKgT5
         FSqTy84IRi5hfa6u9sOv1tQYfWWplCR/qn/2nQ6SV5JgUdwk0/tnAUmYsHQmYoDd4UEM
         yhSQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793900220; x=1794505020; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dk4g+BGecR/++NTUwlCVXRBVFsZCz/QDtiIPUnrLB94=;
        b=K7kVu37R0eWcnSO0nBQjh4vfKVIHcpK2fP3N0EtYEzkTz7qfhrhVYnY666xgSibE+f
         9du+WOr5uZSRmv4vyS61JdP8oeWn3Pt03UFE1F4EfZ+pFngBtIFYeq/zvLgSrFvwgn2k
         VxjBlyP9T3COCIeGbCIrj//I4wYnBmap0quoSF7996rFURyo7+R8gXlmAjNDwcfEKjwL
         NVNa09Qn4n5CGNBIJ+iKwoMFCte/35X+ZkW1JDB3qTqFk9eksOB8SPQgi2HK1dfFKo9Q
         UvK+1U3/FgzMnu9r0MA54GVypSX6L3SJ5UeLiDPw7k9TXvaZ+KiNNSL6yB/My7R9G/Cw
         Uvsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793900220; x=1794505020;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dk4g+BGecR/++NTUwlCVXRBVFsZCz/QDtiIPUnrLB94=;
        b=p+Ct4wl6eTt/KaE0tNB21B6oXQP7Dtp4GFMoQZm5qEA3WA3eJAHVk9L56UBbGW0bHw
         MOfT+EYd53Cn9atkO+UXtC4Ucfbn9EXCDA4XCDpZ1BGMtvmE4RzYYXGWAJqTDJqOYu3i
         NmUaM2Ek6UXXbo2iXdUF18t3gbON+KKvC14Bn10rs0WBpK9O+KXYPQbmL693Kvvk1/Oo
         Al7Lx+3CuwOHgG7c3Q5dvmy8RxaUZd2wQ7ibezA/KTGdMqaj2kBV81leePgzXa1dS4Ue
         /VZbN90KHsMXIcu8TnDHAoCPOaMhRfg7mnrS4LZIqi9juDb2GXJ+xxg9W5zvnBJU/9JN
         Po4Q==
X-Forwarded-Encrypted: i=1; AKwUvBySP+/ugcjSsH6ZBkrV4IRbJKPvX6ZX2XK3cE8oTUQPISSEly2+Nz5qBZ4MwDQwSOm33oAeUV5TsikuI5I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+afHEhk5B04fHlXWXA9OaRzZ+LWebEeCxO8Kno2MOUbdAJBH6B
	RuX2F+gBiQFvvQZOqu4/izVepOgyjx9Kd9gElx/qDwI3ukN+ZWiQxF7h3XRVSEwUcfNvE1CDiRT
	s/WxbpfiivsJRXTWc9HoVjaprvKAi4lg=
X-Gm-Gg: AYBFou0Zq4QOMDuPdb3cJ38Fx8jlL7Vf/R6IDjnmfhrY3nVBotuhjddL7ry32BmvoiD
	aEe5U8DoU1aAOlhhLnDPsvntZ4ZaMt3bKtWc/wwhRRGY6CQjRqyMvtZ+lH73+W32nCU6E5Dt/ua
	lmiJoXLiS0i1s+IswVRn5F3K9Y6F/pXxCtOkC1JnXn/AhjrUfxMkMIS+kKfKR38dZPUU5cTVywW
	Qod9Ln2zsor8TOk3lkMd8nlZI7Djw+Kb81BQ8BRB2DRH3wdDQczR40EmruH84V0hA8U5btX5nkZ
	wdm0LiUiBJg8a+jFTuyrmGiTw10lCejAusI6ofz4U3ZGtjj3Qns1gzkje0QeUj8CtE+xto6b0ka
	sevaQcvQxcJXsYb5ceoTqYh8tAdPgF+5f/Rdpz93nnzVqy1TE4SOKXoy0u987o96wD47v6MRQZq
	EvqaQyYuQXzlodi/9/sKkb4CN9vPsYLk/bn3aKysp1QCer53MfbMzJ
X-Received: by 2002:a05:6000:2901:b0:48b:59f:db9c with SMTP id
 ffacd0b85a97d-492775f03ddmr690889f8f.53.1793900219836; Thu, 05 Nov 2026
 09:36:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105044752.1997895-1-senozhatsky@chromium.org> <auy9UfB30AlYabV8@google.com>
In-Reply-To: <auy9UfB30AlYabV8@google.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Thu, 5 Nov 2026 10:36:48 -0700
X-Gm-Features: AclHuK_riEVsVvEc_LND-HcPqE5QdPWZJpeStDe2FO2VdPoa8v6ez4SntyVogl8
Message-ID: <CAKEwX=Nao4jWtY04FXEjxiHUNUhJU2A6nCZLqhRRm-dPBZTmcw@mail.gmail.com>
Subject: Re: [PATCH 0/7] zsmalloc: redesign object alloc API
To: Yosry Ahmed <yosry@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Yosry Ahmed <yosry.ahmed@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, 
	Brian Geffon <bgeffon@google.com>, Minchan Kim <minchan@kernel.org>, 
	Richard Chang <richardycc@google.com>, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 10:31=E2=80=AFAM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> On Thu, Nov 05, 2026 at 01:47:30PM +0900, Sergey Senozhatsky wrote:
> > Both zram and zswap already have per-entry structures that store zsmall=
oc
> > handles, so allocating a separate handle_cachep object per stored page =
is
> > redundant.  This series embeds struct zs_handle directly into zram and
> > zswap entries and drops handle_cachep, saving 8 bytes and a slab
> > alloc/free per stored object (2MB per 1GB of swapped out 4K pages).
>
> I always hated that extra layer of indirection, thanks for doing this!

+1.

The mental load saving excites me more than the memory saving :)
