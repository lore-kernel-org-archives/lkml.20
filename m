Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFA2175A7F
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 09:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788687192; cv=none; b=dD43FYNWFXdP+RCSOMQajPAnHoZXPYLtgj1U56K2MjpG1j4psO+Bzi5aEX0+FoHl8Bc1P1Cmxko/xtMt/IYSAOR8p8g64feTT6M2+0AL/r6yFfkeKdD6C0GXBaIRTz/1eXx4dvGnLCFWlouzHuDYCBHnvu0ng33BKNweLLatzf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788687192; c=relaxed/simple;
	bh=QtJaQC53Xu+vdhNscJOrU+8pQpYtxNdNcVyiWjAO/Bo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pvyOTIEa0lIbhbvBcqd29An4jhDV45ruUROnyu8FCt8jqnUIjVA/tqb9izug4RBhDve6+66Ra5oywXThhfoRBuczr7tmtCQ/ybxRwOLdx+LKqyCgsuf7KB7OsHsQLxijNZv6xo420nvfpS2rb1t8qLBN7clJEPgjWKEEieA+hE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LSSS/VC1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LSSS/VC1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A6771F00ACA
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 09:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788687191;
	bh=QtJaQC53Xu+vdhNscJOrU+8pQpYtxNdNcVyiWjAO/Bo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=LSSS/VC1pTisr0VvLky5uFqbyjoqWhb5z2K6GGrB2mCOJLkw2uGt0Uf0htxcPreoj
	 oMRxxmX7TkODoDzd8gWkLySDh7SihtwmHxhP0aC4nvr1yK5ksm0SHwdrfIjmNUDBm8
	 zl/rPq4WVz1T5fg9yKXrPeJaR34YTBhG23WUdO0Z5dwXfnj5P8Q6o0gXjJJN1x+x7Z
	 q5KfOdDLSARI+R6vGi9Dt5Yap8c50/TR9b8rOuej3tFoW4gEPmUIna0dJggPXynoIN
	 S5pwOymjPA2kGgko98rv4Mla7uyRT3Y0gPSDN1NTCS94CLXimxDpBWZf5c4WQsnu2T
	 A2rJD2CIClVww==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c20e70a0962so304607366b.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 02:33:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByqxCufnNYkPw/7/7bzcJGzEk3ISoQ3EOPpPGh1MGF3Bw1gbQIIJ09iAa5VAyzeOFLQG1TvSU4nlMzbAAM=@vger.kernel.org
X-Gm-Message-State: AFuF++krsybgP2ib8XF5S3QzCiGMlN+BbBNMToPKbRTicq/9L+rzeG/V
	6sH0eKslH6j8eecZrnmoQ8Pf36mqHkQ1kaj2jJWc4AuC1AdNK6M/pd0uDr16yMzkGwUvUUtACj5
	8bg56zgf2VwNtkb8Z+AYBx6bho7FX3g0=
X-Received: by 2002:a17:907:c017:b0:c25:6210:84e5 with SMTP id
 a640c23a62f3a-c260c9dfc39mr1222379966b.14.1788687189891; Sun, 06 Sep 2026
 02:33:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906-shrink_zswap_entry_v6-v6-0-ac4cf61565fb@gmail.com> <20260906-shrink_zswap_entry_v6-v6-2-ac4cf61565fb@gmail.com>
In-Reply-To: <20260906-shrink_zswap_entry_v6-v6-2-ac4cf61565fb@gmail.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Sun, 6 Sep 2026 02:32:58 -0700
X-Gmail-Original-Message-ID: <CAO9r8zOm=7=1qE-7hq_L6SrdvX5uTNi-hr2VPaBWVaZyA7e57A@mail.gmail.com>
X-Gm-Features: AcwNN1Wmy8sXB0gnqeV_vKVpovj5_3Y85XL9KiBOHP7UIyqos5p705VNMCEOgWk
Message-ID: <CAO9r8zOm=7=1qE-7hq_L6SrdvX5uTNi-hr2VPaBWVaZyA7e57A@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] mm/zswap: replace the zswap_pools list with an
 allocating xarray
To: Jianyue Wu <wujianyue000@gmail.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Nhat Pham <nphamcs@gmail.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Chris Li <chrisl@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 12:47=E2=80=AFAM Jianyue Wu <wujianyue000@gmail.com>=
 wrote:
>
> Originally zswap kept its pools on an RCU list whose head also served
> as the current pool. Convert the pool table to an allocating xarray
> keyed by a small integer id, and track the current pool with a separate
> RCU-protected pointer.
>
> The xarray gives each pool a stable id for a later zswap_entry shrink.
> XA_FLAGS_ALLOC1 starts ids at 1, so id 0 remains reserved. The id range
> is bounded by ZSWAP_MAX_POOL_ID because the later entry field is a u8.
>
> Keep compressor switching close to the previous flow: look up an
> existing pool with xa_for_each(), resurrect it if reused, or create a
> new one. zswap_pool_create() allocates the pool's id and publishes it
> into the xarray as its final step, so the create call either fully
> publishes or fully unwinds on failure. Publishing makes the pool live,
> so a caller that later fails (e.g. param_set_charp()) must still kill
> the pool to erase it from the xarray.
>
> Compressor switches update zswap_current_pool with rcu_assign_pointer(),
> serialized by the module parameter lock, so no xa_lock is needed for
> that update. The pool walk above is lockless under RCU. xa_lock is taken
> only to allocate (xa_alloc_bh()) and erase (xa_erase_bh()) xarray
> entries.
>
> Suggested-by: Nhat Pham <nphamcs@gmail.com>
> Suggested-by: Yosry Ahmed <yosry@kernel.org>
> Suggested-by: Johannes Weiner <hannes@cmpxchg.org>
> Signed-off-by: Jianyue Wu <wujianyue000@gmail.com>

Acked-by: Yosry Ahmed <yosry@kernel.org>
