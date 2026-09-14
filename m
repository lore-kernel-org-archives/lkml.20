Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E9847F796
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 17:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789407508; cv=pass; b=LkRnDO3Z0fjLeBHB2OX+a/jI0php0wylRTXaIPQ7IsW47Le5CvmRIOyGkHr4EzX+HAyCiP2UkpSNkAJBQNovX63OP7aCQkruG2sYeQWqJ87GUWgOaTrYZCAOcjWWAioxDUp4Cccb5cJmbtMCodjWn6addQnRQLeNiJAtmIigVXc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789407508; c=relaxed/simple;
	bh=sEeztLbuGFyF1dhhheCGiQ+SCiNVAWKx2wrJ88/WhXE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SkwQ4DQjHMrjTcm4e8PYZTNk2xJmvky242CU8cbUcHfkIBsCHMwDfUSToNZ9yEf9lNFQUYBTaezK3USrIeoHhmSqYJb5IavKVTnv7woU1GMnBkr4Q+Vr3MjMkxgwnDAt0TLSpauTVd6vsPEPX4qIQnhnCNjWRooEpriwZv9fPIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HDygBD2R; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HDygBD2R"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4834977ae75so1299207f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:38:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789407504; cv=none;
        d=google.com; s=arc-20260327;
        b=NlXRsI/ztvq92inDQxmnomUK/aw2AlpxHn9VbqQP4SkiWLbPGBEEST7d2RpERCnd5S
         Sh0CBOUIn9PsKpEXa0b5fPIdpiIwENdz1UPv31ABvbqs2m9RwJ//8Mg2QDcQm07VLJ5O
         L0xRchJ+HP0lusUYAISxWtcCNfhgtnUpOTRneY3j/v4Rqr1xtMpbbdjnFn4/J7qF9VEI
         zSmkxepiGdqvEqO7Uw26sSJY7Bgyi/rSMJanrN8HqtNRSvxF1PjAybatrZ4Otw9CR1U0
         9P9FnKlRpsklL1DyybpTG4yD2JZPOCAdwj3vAmyAlY8bfE4M0xAgw/S00s6n/9t97XQ+
         9ejg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sEeztLbuGFyF1dhhheCGiQ+SCiNVAWKx2wrJ88/WhXE=;
        fh=6SRbm7fVIbWxRZXFIWL/8HrXikKA7wd/QfHjhBM7Ne8=;
        b=VC9JUy1ekpFSDXQK7Am20of3fzX4Fphp2C9Jwjx8FpH/SWShfznjJymEYOth8mmfTN
         WEnJ5RfTH1I7KaV8m6Wl0omT61BUAdMlAv09CmCGs2xsDOhcSM9Oq8raD4So1U7F2ovq
         siV5EjKvAld6nwPE/sGn8Ga90fvP0WcX+DGnNK6u6U0+d3ilJFgaK2JLmpIYDI3TxUD1
         8jT6H8CYHM6LZfwikGTaDO5ZfzMsH4rRF/QqGX8R/8KTxMv5Nky+f7w6mw4Gs+sHl08n
         1/lk1Ys6uQvBpkz/7a6PYHSFqzp4Kv9Us4i9OOiIsZefU2ilh3ymqe1IfBdW7Rop37xy
         KqZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789407504; x=1790012304; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sEeztLbuGFyF1dhhheCGiQ+SCiNVAWKx2wrJ88/WhXE=;
        b=HDygBD2RnIGBEFUkBnGQNxgr7HoHVNy+43GUFsz9zqgnrv/HxutFFfexWt4vGltbF8
         /qdG45CBlAUyPxPGruZXXPPgC6pNETH+IPX5LdeOCMhDPFhmY/ToLARtdRZa8DkBWU1/
         HF5v7bmoI1IEF9hFZA7MTCzkLzOBpGNWCT8q9tzMUi49+os5UxbGzCuvpGy+xuzmFLmi
         bkC1dAi1iDYVK+0q8gElQ2iG4gTzb6f/QVm6ikrnkb97EUTZx9udZdtEvONjKOXbpyZ5
         W8pEuZV+XYCnm/SE9E0cOd4h5S6SlQLkbk+X/axQnGYkQOzdb8258RF3eHXHwfS9hSaK
         /z6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789407504; x=1790012304;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sEeztLbuGFyF1dhhheCGiQ+SCiNVAWKx2wrJ88/WhXE=;
        b=FHUWWMk3ZMUT91Lx/PDgMA2hPbaWv+FS9jRL5d+5tuF6hqEgGXlu8+oOmcSSAqVIb6
         AdIIaD+K04qxVXidQBw+iYNr0pUN938O+8/nmWL37jhDOJAyKr9K+onxD6p0tRKhbxiQ
         oCqbuVMzxNxpSrBzg0qnw0WpXOddgK7YXQSm4XhBs400VS7fwI0/SXR4vfB+JI/XbaO2
         rkeQ/mvCnr5Q4csmnTLvMTyYzp6Ilk/7VWiSa0rdWRjrkO/hQ9/xns6yfhk2Xkhl7em7
         N1GekvTRyPRuS2SME/RnZC0OvUZt/mMVpjtHv11tuvFff62N3WHzpONpVWcBae8f9G93
         0bPQ==
X-Forwarded-Encrypted: i=1; AKwUvBzaHYU9cNXZrTTgiiOJ8iDbLGGgdgb9My68Bf5NUBqL9aEIE1ETE37GLT3OYgBbkVBQQE+T0RhtHfiDfrA=@vger.kernel.org
X-Gm-Message-State: AFuF++lkLapvG9u//S+4G3/qfS9C7XZEj3qy+yGVhd5MK6hvZVMP2AzI
	T9LePbplDGBynSndHdGwdeK2IoXj39B2WjH6FULoQd5y6/wIigB74bYacIwuRwDSehT9bRvRga4
	xJY6Or+X20olKg/sADzz5lvwE/U2yffg=
X-Gm-Gg: AYBFou0g6IMWiHKzeE75fdAf2NVbARQ/BLXB/7IS4SfANuOK/VMXCIREsAZm+LCJTrl
	Lk+yYhC7ITgvPe+IPApUdZVJpDyyPAwDG6EyX+Gt60MKWqNxqjjK363WY4gRCW4LSD9BxZAViRo
	HpOCjRQmGXi3jxbIq5F0cgUkd0u8f2/VU/Dbysdi0rjnmfRRLnf3CMBL6AAB+HLQMmRM4tk23Fh
	73G89glOGt0Jw34Rw9LJpwM2Al8AvO033ixSA9KEL2Wbk2H8TxrgtCTTQPNRhHiQ5ehEcXl3T/O
	FtAVL2owHXulTC6qxR/U5+FUuPGo1uiQMzplM3yLppB1R8ufywA48mSURKw2rOjNnx9mPxMXjY7
	uISiqUlveGqY=
X-Received: by 2002:a05:6000:41c3:b0:484:3310:710c with SMTP id
 ffacd0b85a97d-48702b30ad7mr9667975f8f.24.1789407504318; Mon, 14 Sep 2026
 10:38:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911121341.178028-1-alex@ghiti.fr> <20260911121341.178028-4-alex@ghiti.fr>
In-Reply-To: <20260911121341.178028-4-alex@ghiti.fr>
From: Nhat Pham <nphamcs@gmail.com>
Date: Mon, 14 Sep 2026 10:38:11 -0700
X-Gm-Features: AcwNN1VP2kc_faYmAYrbA6jzrQN4BV6EV-vGstKi49hd1f6QiPh8-BHVVwhcRhE
Message-ID: <CAKEwX=OpSG=fsw_7UsyA753cUTPTAjN3E8iRcfCzdO=Pw-xjAA@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] mm: zswap: drop cold writeback folios via swap dropbehind
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosry@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kairui Song <ryncsn@gmail.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Baoquan He <baoquan.he@linux.dev>, 
	Barry Song <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Wei Xu <weixugc@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Kunwu Chan <kunwu.chan@gmail.com>, 
	Tal Zussman <tz2294@columbia.edu>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 5:17=E2=80=AFAM Alexandre Ghiti <alex@ghiti.fr> wro=
te:
>
> zswap writeback decompresses an entry into a fresh swap cache folio and
> writes it back. The folio is cold by construction, yet it is left on the
> LRU for reclaim to find and free later, wasting a reclaim scan and keepin=
g
> cold memory resident longer than necessary.
>
> Allocate the folio off the LRU and mark it PG_dropbehind so the swap
> dropbehind path frees it from the swap cache once writeback completes.
>
> __swap_cache_alloc_folio() evaluates a refault on the new folio, and
> workingset_refault() sets PG_active when it looks recent. Until now
> folio_add_lru() consumed that flag and __page_cache_release() cleared it
> once the folio left the LRU. This folio never reaches the LRU, so nothing
> would clear PG_active and the folio would be freed with a
> PAGE_FLAGS_CHECK_AT_FREE flag set, tripping bad_page() under
> CONFIG_DEBUG_VM. Clear it after allocation.
>
> That is a workaround: the refault should not be evaluated on a writeback
> buffer at all. A fix for that is on the mailing list [1].
>
> Link: https://lore.kernel.org/linux-mm/20260911092012.92399-1-alex@ghiti.=
fr/ [1]
> Suggested-by: Johannes Weiner <hannes@cmpxchg.org>
> Suggested-by: Nhat Pham <nphamcs@gmail.com>
> Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>

LGTM!

Reviewed-by: Nhat Pham <nphamcs@gmail.com>
