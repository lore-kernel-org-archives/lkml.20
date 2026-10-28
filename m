Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793219756;
	b=AtYCMgSNQ3aWdNARq8brFwkR7IPvRHEPbLeKDDey9D6iYnMBm0E5pr7u7SSd8LGshK7Q
	 NopIpf+6oRdEHpaFOVfUd//xNFyOFVOU5g7ZKYQFR8fanrrmT0pBugisEHh8KoaNJVbl7
	 BqSc94Qj/bdsTwdSx+HbKoTsx7U3rIKhxZrqScwhS1MVciB6uQR9wvaTl684MwwZYirJt
	 /b/Xq5fqInKrioWd0bRPyI8sGXi9MXjQugHWPIZCjgbMKKVtqK7PMHTzCYNen0t5gBlpR
	 HfDsMwOKg4ZJ7MqTkhZqWwN28y9UpvmPYNTp/HwV3A7JqJTPtdhfUO3QJDnAhN5xDMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793219756;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4QAe5SGrIPwZ0tTzn6oh4wSWtXWrJvkc6TieHYKerj8=;
	b=R/xL8SOzT6v68dBevqDmA9zHlMqMzswLqJKQRpK/Wtw75mXUwvL/N55wcp+BAKxKzWK7
	 DsIpUZfbhJ7sIo1cnOxJ2ZZafbYDXkCyaCWnqt4RP196VsohrcgqFjCoN8yV1o0JSf6Eq
	 2ToRgjwlvc3M+Zt9cdeLmCHhG55kWdDG8bEEkaC/bMxCku4HdxtoZfMqM8i4dTVnC4c9Z
	 BV2m3zlc7BIAvFaR7e6JdvZSMJd2qml5zH9PdPkcY3ruitCgM9vTNkJsB506HKGjAqCGT
	 Cka6RClEwKS5q7iR1/1TmQKmaIfOCGnDVOpnfOZ7Da35jWqnH+GcAkjAw5iGoVEbwJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OjMR2woc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D92606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OjMR2woc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8B221F031EA
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793219754;
	bh=4QAe5SGrIPwZ0tTzn6oh4wSWtXWrJvkc6TieHYKerj8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OjMR2wocoM7Ox2qkxXBhUairznGYjwxxr+hvzFGtTgF6uMo9XQ1Cp0IajDgW9HZP3
	 0iVS7OpQC+B9dgU07dSzT7xN348tTAemsVTWhywiJN7fBeX6NliTGmrcukeQlf5td+
	 ObdnFDlHTjb2Ht4zhXAO9R12oYpBOy0QPgLEVI4bY6n9+Plys4IkAAH57manEN+vY5
	 CknM+ZKT4Pxf+cMu5QpPHFFFhi99hl9xoS3ALRGpcMAqOho/PtYRZyjfJy0Kmols1h
	 BKzasg01PyuL5ExBDmP4Mo7v+DQhCfgbMGPPRCGPZZOfoKlTlk7tGuq+AckrLCiU/C
	 FQMhpBEExti4Q==
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93f2b8cf037so107679785a.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:35:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBztVkbqJPlSNCMyjlJgiAb2gEj6WbCQ8zmd3MW+iEqpmTEXtFT5nV8YmYCQNeeqfoqna7AMchM164lvRLQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYITZ/fckhFt3x9NBBo9uZ0w477p22dNRjeoBar0+NPZdG4xJZBn
	yJ21+YGRT6+zCuShrRrXtuqGsUWP31oWdGkJT7CWxP7yxNwj/wnHuRLQzNLRGFwaBRAibdYweKr
	HN0rFw77VKs8vlKs7zPTJDjzu27ZWUdk=
X-Received: by 2002:a05:620a:2728:b0:93a:1048:7d2f with SMTP id
 af79cd13be357-94408cd0363mr536255285a.41.1793219754031; Wed, 28 Oct 2026
 13:35:54 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028010611.3929937-1-tjmercier@google.com> <20261028010611.3929937-2-tjmercier@google.com>
In-Reply-To: <20261028010611.3929937-2-tjmercier@google.com>
From: Barry Song <baohua@kernel.org>
Date: Thu, 29 Oct 2026 04:35:42 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4xGy4O0GdU1xwVURjTZ+upbZYGFsKwf-ZjKKkntOiwtHg@mail.gmail.com>
X-Gm-Features: AclHuK-kz9wxt-69rhz-Vpf7nKwcRzuuxuV15spsnkGsOFzx8iPMuvTrFEMb7zA
Message-ID: <CAGsJ_4xGy4O0GdU1xwVURjTZ+upbZYGFsKwf-ZjKKkntOiwtHg@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm/vmscan: remove redundant !mem_cgroup_online() checks
To: "T.J. Mercier" <tjmercier@google.com>
Cc: roman.gushchin@linux.dev, muchun.song@linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, Kairui Song <kasong@tencent.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, cgroups@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 9:06=E2=80=AFAM T.J. Mercier <tjmercier@google.com>=
 wrote:
>
> Since commit f1cf8d2f36dc ("mm: memcontrol: eliminate the problem of
> dying memory cgroup for LRU folios") and commit 0e0ac326c511 ("memcg:
> move LRU size accounting on reparenting instead of copying it"),
> mem_cgroup_css_offline() reparents all LRU folios to the parent memcg
> and zeroes the child's lrugen->nr_pages and lru_zone_size before the
> memcg is offlined. Nothing can repopulate the offlined memcg's lruvec
> afterwards. A folio that is off the LRU during reparenting looks up its
> lruvec through its objcg, which now points to the parent so it is put
> back on the parent's LRU.
>
> As a result, lruvec_lru_size() and lruvec_evictable_size() are always 0
> when !mem_cgroup_online(memcg) is true, making the offlined memcg special
> cases in get_scan_count(), lruvec_is_sizable(), and shrink_one() dead
> code. Remove them.
>
> With the get_nr_to_scan() special case removed, an offlined memcg that
> still has stale effective protection now has
> apply_proportional_protection() applied like get_scan_count() does, so
> the MGLRU and traditional LRU behavior is now the same.
>
> Signed-off-by: T.J. Mercier <tjmercier@google.com>
> ---

Reviewed-by: Barry Song <baohua@kernel.org>
