Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793763631;
	b=DiGbk19DrsulFgJKTRYDQWmxWHTwx3/tIEDDBWopoguSCZW6ZQtW2agYOpUbaG4F5rN+
	 W6w56sOweIWGxZscFsfV39JKR6AhdbqaQH7cD7ToGzkykOBc68WJn7ILh7nzC+utJKiS/
	 pZTkh5YwI45S7WaFoliCyPE3nuduLtCXO1m5lx1STPGMxCQVNTbUDT2rnvYEezGFCFlyB
	 /PWUSr+S+0AfAxd3KNpuOLZfQ8fMRk4912HkJltSkCxPN2Zr26mxatwEC4TrH3vWOn+YQ
	 fZd/fc2XM4zVLSi13cHPrWU2BcL/wZedRhw0l7x0+b1cdLNwddd0gADksJPCZbIRiTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793763631;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+tZw0K5+jfSV2aRm7WOFqugUNHNTb6GHxCzlpfjuQew=;
	b=CE4mGvYPNflM+c/zAo0EOIjWo3UlVA+QQMYvBiL25LJ6xaiSwWF4vQUI1oiPJP8HJgVp
	 2iQoKZck4qV43Qs4MH77LZvTo/VbVjSW9B+8AWVTSyeEfjZ226FrQO+qnyoFtuLf4CgH5
	 fw8PV5EKh4fA0VSGnnFicj0+Ma/Xof7CuEhx6GFTrzdKjaeDdxhWxeEPW6U33d07TMy70
	 HyGBOSzpkx1NDJMMGGilgTS1tEVmjp0wJAv8Foy/5GA3x0Qlebv88vofl97FYox2aBn1R
	 UOukqUr87VYZZiJ1Lsjv8nJArZCMwYGSCJXMvfgqOAw2I5lFWQxJyEVoRaxmYCIumPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MogoHxc1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE52606A329
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 03:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MogoHxc1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C61D1F00A21
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 03:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793763630;
	bh=+tZw0K5+jfSV2aRm7WOFqugUNHNTb6GHxCzlpfjuQew=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MogoHxc1lDU2P1JZYWhARSR1ywNNKCZ8EfaS02CKoiTvz5PrWZR2PF50pgo5KbwYr
	 4DB+o0PIXodT0XRysk7/W/FJ3GssiEo3GZe/I8DRjr5VScVGmrzSYpXy8wb3EZAQRn
	 N9yFj/iSV7VxQu8MJctXaBVZLxgx3IDugiJDaiDqBGYTHmatKwSKUdZxPPde6mlugc
	 5lkROUH1J+Dg/qvVOJRx3E5QjYc5tYut+NwMQvAuR0nOAnB5/8lPtBKHQR5G28Cs75
	 A+bAtJCW7H/5vy0OicCC+tBWWZYzBvNK0tLnn0XSqgIqRHFfx7drVEGhKsKVgF7Ml/
	 Np3l598dUmasw==
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93f20b304c0so29537785a.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 19:40:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwKS0C3zzhqZHHDLa8+W+rPoaAweP7sv5t1tNBqXTC126V+1NuDV+Xm/tQGiKBirXPmZFVmX2AGnPE1PEk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bJXEBp1sHxabkQGV/Fje1yciPF/fbPa7/y1tyAxqgB0nnAqdI
	xDi+niBW2DFI/nhJ+zEIFWp9VFXfatEyOY0E0YsQZXCYlVeGrEdxOKp6OslKC31ZZO9YaMaFOoS
	ZAYaSGPffHiE6YIl5G+0eDiAx+1vgmy4=
X-Received: by 2002:a05:620a:1a07:b0:93e:c12c:9dd3 with SMTP id
 af79cd13be357-94421796eafmr2530707085a.83.1793763629745; Tue, 03 Nov 2026
 19:40:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103113711.1832834-1-max.kellermann@ionos.com> <20261103113711.1832834-4-max.kellermann@ionos.com>
In-Reply-To: <20261103113711.1832834-4-max.kellermann@ionos.com>
From: Barry Song <baohua@kernel.org>
Date: Wed, 4 Nov 2026 11:40:16 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4y+LX-CSnDJ59VT2nc-i=rB=4iMuBQYawMCktk-_SPykg@mail.gmail.com>
X-Gm-Features: AclHuK_7q4sg1JpsDk1OEkyOWm8WF60WPZ6zY6tzDeYRFIK1cRTEyQLp5iaugqM
Message-ID: <CAGsJ_4y+LX-CSnDJ59VT2nc-i=rB=4iMuBQYawMCktk-_SPykg@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] mm/mglru: cache the last memcg node, make tail
 insertion constant time
To: Max Kellermann <max.kellermann@ionos.com>
Cc: akpm@linux-foundation.org, kasong@tencent.com, qi.zheng@linux.dev, 
	shakeel.butt@linux.dev, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, baoquan.he@linux.dev, baolin.wang@linux.alibaba.com, 
	david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, hannes@cmpxchg.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 7:37=E2=80=AFPM Max Kellermann <max.kellermann@ionos=
.com> wrote:
>
> Rotating or onlining a memcg currently uses hlist_nulls_add_tail_rcu()
> which walks the destination bin to find its tail while holding
> `memcg_lru.lock` with interrupts disabled.  With thousands of cgroups,
> this takes a long time and causes severe lock contention.

This is the main cause of the soft lockups and RCU stalls,
right? If so, we may want to add a Fixes tag.

The fix itself may not be directly applicable to stable
kernels, but based on the logic of this patch, we should
be able to work out a backport, right?

Another option is to leave the cleanups in patches 1 and 2
out for now, and make patch 3 self-contained as the first
patch in your series, if that makes backporting easier.

You can then move the cleanups from patches 1 and 2 to
follow the new patch 1.

>
> Cache a pointer to each bin's last node, making tail insertion O(1).
> This requires remembering the bin number (but the new struct field
> occupies a hole, so it does not grow).
>
> In a micro benchmark that creates 1500 cgroups and repeatedly writes
> `1024M swappiness=3D0` to `memory.reclaim` in 8 threads, the request
> rate increases by a factor of 9.5 and the average duration of each
> write request is reduced by 89%.
>
> All writes return EAGAIN in both runs; the benchmark measures the cost
> of reclaim attempts that cannot meet their requested target, not
> reclaimed throughput.

I'd appreciate it if you could also mention Ridong's earlier
work in the changelog:

https://lore.kernel.org/all/20251119083722.1365680-1-chenridong@huaweicloud=
.com/

>
> Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
> ---
[...]
> @@ -4561,21 +4561,37 @@ static void lru_gen_add_memcg(struct lru_gen_memc=
g *memcg_lru,
>                               int gen, int bin, bool at_head)
>  {
>         struct hlist_nulls_head *head =3D &memcg_lru->fifo[gen][bin];
> +       struct hlist_nulls_node *last =3D memcg_lru->tail[gen][bin];
>
>         lockdep_assert_held(&memcg_lru->lock);
>
> -       if (at_head)
> +       lrugen->bin =3D bin;
> +
> +       if (at_head || !last)
>                 hlist_nulls_add_head_rcu(&lrugen->list, head);

Do we still need at_head now that MEMCG_LRU_OLD has been removed?

>         else
> -               hlist_nulls_add_tail_rcu(&lrugen->list, head);
> +               hlist_nulls_add_behind_rcu(&lrugen->list, last);
> +
> +       if (!at_head || !last)
> +               memcg_lru->tail[gen][bin] =3D &lrugen->list;
>  }

Best,
Barry
