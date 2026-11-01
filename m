Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793567022;
	b=cu7MXITGxQV9RgptdLAtNE1S60Vyd0dslbvZ3nkA2aRZ8YaRifQM2DLTIMBC+eyACofn
	 kL4deJl6fVlscnrOul5byZlCpFVzytgiXztdMbMfaGjaBjcLLebwhdZ2gHmhj4I1uFN2H
	 5g3iFiCQ5a5BJNwyx//tQCJ311tw3m4c8/JFYIJFXHUkmiPn/bMwcEq5DtwMkdRoQQDoX
	 yH1BUKHxdSoVlsEJmWSjuyI0BMv163omQzH6h5L1Dq1MP2WCe7A2LQFxmoOdl+XZCdKea
	 uSShAyQtk9sRQ1ixJCwseAblhDf42eb9WMd1hp8Su4JOAGZgd5yJ6MYBTycIHEln+7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793567022;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=L1KaEDjFsWvGvMrTGkRaCJc21/TfVIdv9OIWGbl/AE8=;
	b=esvERFfOMFsqbDeUQtYM1m9wD5OJe3Li/b9DNwdCmuko2A3nXy1Vo6EM0PqM4sI362Zi
	 XWMNjrvtMBQGSJRYThN2+u0GBgGwlVBUX5ijA0zBDz0DrAfXQnKrT1eI7NRyrau2KS9HV
	 I4dmoL5KiVbr3NE8k8KvCnmJsmx/OMCLAeacNn7xrvws44sIFQJgJ6I+Ptr5Tevriq+vN
	 8naCf4Ln2EMoHeOyGztuN8Gt7nhMb0JbR49e6LZ+SFKPEl1J6o3lYwis1vT9++6Bk5xmZ
	 yrwyzHBk9krsHz/65INSmOGG/RP9ALickzqemax1k57r41HsxHiZ9beXOOIPWhvUtNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dar2SFo3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5E0606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 21:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dar2SFo3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF5201F0093A
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 21:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793567021;
	bh=L1KaEDjFsWvGvMrTGkRaCJc21/TfVIdv9OIWGbl/AE8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Dar2SFo3WrBnMjg/Wi9AxrLDYq9DWwa7uJBUlcAQLwyr70WFSaNbTQl75OPMmNglW
	 MeKaqhOFSQ2JzeiCtwoEDa+GDXV/xWfqogeX7NISoEzCF68cp+2j6T6L7eJjejoq/c
	 emu5q3LK9Jy8kBAdtrHSrXAq6E+fjWFMHnoY/Ov2DIkW2a95Y9Bwl3YoxX1V6XP5AE
	 iIdgIQgoirvdxK9JDo9d1YeAVkhS8BAkI1bG0USpIIcudnqjt1yqvVgI1ElrliLWbB
	 /GeWDTbuJGOGuPKIEe/8q2NKEbUaLYR5p/x6Gnt9wDvuqu21p61WPh53jrrSiZoJJw
	 134escY1GMp9Q==
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-945ae2daa66so70936985a.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 13:03:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxHfvYAcai8iPGgX2RxhPvrMZ40BKfClkXuvR76OB0D7R5oUTZrJGckB0mEHUBS7lb0v4oiVCBX40WZqOA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKhRr0vFWDE0KZMUnr2pa6ChrDvv15WwewzG9ahq3JGNnNuxZt
	sciAfk2/zCJfF06UcZtFXFaZQXkSb4uVh/II9IwfPAuywho4IvLHWv276sSXjR9gFNfw81ZvcFJ
	sDJn5oEiUUEp/tBWST2Pnv7wOMvcFfoo=
X-Received: by 2002:a05:620a:2806:b0:93f:5892:e5fd with SMTP id
 af79cd13be357-94421585e50mr1455648685a.1.1793567021240; Sun, 01 Nov 2026
 13:03:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261012205447.2717801-1-max.kellermann@ionos.com> <20261012205447.2717801-3-max.kellermann@ionos.com>
In-Reply-To: <20261012205447.2717801-3-max.kellermann@ionos.com>
From: Barry Song <baohua@kernel.org>
Date: Mon, 2 Nov 2026 05:03:30 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zQh9HrvgaqD32_A=bSdqmPqP4oV_SxMXMEDBrHe4jjhg@mail.gmail.com>
X-Gm-Features: AclHuK8OqXgKSVdL2WuIVJgz5P-HEa2lSTPqglBGQNxXGO5x-V4zhAlTU4Zabl8
Message-ID: <CAGsJ_4zQh9HrvgaqD32_A=bSdqmPqP4oV_SxMXMEDBrHe4jjhg@mail.gmail.com>
Subject: Re: [PATCH 2/5] mm/vmscan: move code to lru_gen_{add,del}_memcg()
To: Max Kellermann <max.kellermann@ionos.com>
Cc: akpm@linux-foundation.org, kasong@tencent.com, qi.zheng@linux.dev, 
	shakeel.butt@linux.dev, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, baoquan.he@linux.dev, baolin.wang@linux.alibaba.com, 
	david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, hannes@cmpxchg.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 4:55=E2=80=AFAM Max Kellermann <max.kellermann@iono=
s.com> wrote:
>
> Preparation for the following patch that adds tail caching.
>
> For simplicity, hlist_nulls_del_init_rcu() is now always used, which
> is also valid during rotation, because the entry is immediately
> reinserted under `memcg_lru.lock`.
>
> Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
> ---
>  mm/vmscan.c | 36 ++++++++++++++++++++++++++++--------
>  1 file changed, 28 insertions(+), 8 deletions(-)

[...]
> +       lru_gen_del_memcg(&pgdat->memcg_lru, &lruvec->lrugen, old);
> +       lru_gen_add_memcg(&pgdat->memcg_lru, &lruvec->lrugen, new, bin,
> +                         op =3D=3D MEMCG_LRU_HEAD || op =3D=3D MEMCG_LRU=
_OLD);

T.J. series[1] removed MEMCG_LRU_OLD, i guess you will need some rebase.

[1] https://lore.kernel.org/linux-mm/20261028010611.3929937-1-tjmercier@goo=
gle.com/

Best,
Barry
