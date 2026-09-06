Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E9B2E7367
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 09:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788687245; cv=none; b=hkAMjwnYNwef0Bm4sAPCC5KpLwWElFlBp3ZmI88GUHkHtpb2YdLhvO1FaycHVwZ3zdrDIrMnBrgSF1bKvdiJY4qgWvDO6WXV4xhsMoBOwrOt9bR4kYSwtAAUCC2bNCTgQssLMYWXQg+788sA5vbYh93YJTZ4MAxuzdETOiGR8bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788687245; c=relaxed/simple;
	bh=hilEVd8ul6m3JKTfhkSHsr0Cslnn0G4vY5ntF4Ef4P8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JLo9lb6fyqX9Pvob4H9VP/69PUBohXNExzgFrCiYIrATU7WRyC6eWg6ibSyEC2kAWDzGpfURN2kRzMsFHneZAjix/NKD5K5I3oi5n8ba+I0cbuZsnZPjbJ3V8M53eV+FpQq8/4ratxEJ3ssn/TO8Y99fjiHNxdSZa5oHFLWoX9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fMH7SPKY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fMH7SPKY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E27191F00ACA
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 09:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788687243;
	bh=hilEVd8ul6m3JKTfhkSHsr0Cslnn0G4vY5ntF4Ef4P8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fMH7SPKYwBbIw4fWGtP+dXxlmm7+p//YylAJyVBmuo2l1kNhsz0xv3/I13zTdSSbN
	 I6pNq9ZH5b6pISBFpmJdcyXeGF/GdBjQF2Q8Xl7VIAcWkFCV/ZA6SuQjcppCVqSzRi
	 ccP9W0Ttd3oM6AvhwBub1DkK1TehpvnoyGrFyTS4vGKfXSdbxCY3x2Qe3lYrrhFl0M
	 UIguKPpzQs9NVoYbPsZsWP6my7va9Igv8Z+FDZPS2B/SbJVEh9Ch208gsCytnTlz/r
	 gbV1K9OHsY7O96edpzB9+nLBhc8X4aCALP/p4U76LJssF1z6PG+NIwkCvrC77xLND7
	 OORsBAVQRzuiQ==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c255c58156bso474529866b.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 02:34:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxoF1Rdh0+lCstwWxC5wH2iueyufe1oumDJt3osRLMSlhzenxBKVgG/W1y+Z4xb4ToYHCSQTEXvKFGcmKE=@vger.kernel.org
X-Gm-Message-State: AFuF++l3STuf1w/F0Qoy8u/Lg2qfWrfHguIBe+rWUWH7tlOzk4LzQQ8d
	HmRrJAInFN0dyAtAlrDhe38ETDJ5O4mejrud0x5vO5qlR+iBL+6Ip2VseFp+W41BGu1PZUM+DN3
	pnRyXrPspi67QNClucS9SIox0Ygb28LY=
X-Received: by 2002:a17:907:1c90:b0:c26:19de:9ad3 with SMTP id
 a640c23a62f3a-c2619dea762mr534286466b.43.1788687242859; Sun, 06 Sep 2026
 02:34:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906-shrink_zswap_entry_v6-v6-0-ac4cf61565fb@gmail.com> <20260906-shrink_zswap_entry_v6-v6-3-ac4cf61565fb@gmail.com>
In-Reply-To: <20260906-shrink_zswap_entry_v6-v6-3-ac4cf61565fb@gmail.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Sun, 6 Sep 2026 02:33:50 -0700
X-Gmail-Original-Message-ID: <CAO9r8zMBYv=_Rd_vSRHnZn1KqnxU9eNfhuA-aWfiDOGfxtkwaw@mail.gmail.com>
X-Gm-Features: AcwNN1VqoyNkZSh0Ex_D1Od1IyHBhtySEWsBIkwlfXBjpxaGQw_R0ENTuud7GJc
Message-ID: <CAO9r8zMBYv=_Rd_vSRHnZn1KqnxU9eNfhuA-aWfiDOGfxtkwaw@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] mm/zswap: reference the pool by id to shrink
 struct zswap_entry
To: Jianyue Wu <wujianyue000@gmail.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Nhat Pham <nphamcs@gmail.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Chris Li <chrisl@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 12:47=E2=80=AFAM Jianyue Wu <wujianyue000@gmail.com>=
 wrote:
>
> struct zswap_entry is one allocation per stored page, so its size is
> pure overhead. It currently embeds an 8-byte pool pointer, even though
> the live pools now sit in an allocating xarray keyed by a small integer
> id that fits in a u8.
>
> Replace the per-entry pool pointer with that u8 id and resolve it
> through the xarray with xa_load(). xa_load() does its own RCU-protected
> lookup, so the caller needs no rcu_read_lock() section of its own. The
> resolved pool stays valid because a live entry pins it via percpu_ref
> (taken in zswap_store_page()), so its id cannot be reused. A live entry
> never uses the reserved id 0, so a zeroed id resolves to NULL and trips
> a WARN rather than aliasing a live pool.
>
> The u8 fits in the padding after the bool referenced field, shrinking
> the entry from 56 to 48 bytes on 64-bit. This raises objs_per_slab from
> 73 to 85 and saves about 2MiB of metadata per 1GiB of data held in
> zswap.
>
> Suggested-by: Chris Li <chrisl@kernel.org>
> Signed-off-by: Jianyue Wu <wujianyue000@gmail.com>

Acked-by: Yosry Ahmed <yosry@kernel.org>
