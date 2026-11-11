Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794356884;
	b=h8HieNcg9o5h7avakyeT5q2sO8Y4pnJ549W2ao0V+P+KNhQMw/SHaZurhIjC1b+zavhM
	 F1LXkQDqOz2W8/F78B/JNvdTISyYcxVef4GZ+8YMSwP5S5vEuuZfwfj1CPsaCgun/uUhB
	 4RP3NF6DZ9kDt4DlyqhxzHU2QJGqPt9JzorbjjekLRsHnZlEXV8s97AdG8L7gHlJSOTsZ
	 S9586HKQ78t/urocOcX3kE17AyXXb+F5CVvmRbE/sPwIwMyvsexLt/QBLJFbZ1tb6SxwB
	 Pm9Ehjm2And7qMoD0gaYHquTO3oepfJhPDoyBKWOBgzYU0tlF27lLemmEfW+lZWCJoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794356884;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=bbBaRo/7L6iOQrhDinfNIJ3r1kvuz8qfg44WFld2veY=;
	b=EPgngcIMYTIsn96EtdoDBhsYuiTIjTpRaj+K/z1lN5lVC5Ka/jQ2uVcJbYuHUd2Ceeci
	 xcyL+xg0zGSWe0Bl2cME/m37G3Tnx4x5k4QjByY4RdKZ39LLOYTHdjlCNTeElzfqPNLVk
	 K5W6xlSn74FdRDECkOHr7/x/qU+z+vcPwG9LaVu4mICwb2lqoMA8SChavjXKlzmnCvoxg
	 wWzj+P0BKZKsJNGU/EasGAYKSLF0tbBc76sZ0KYkCCJprifuFP5dGYNJyQgEcyDv16WpN
	 9byjSUNuRX4wTbpETU6xxHQFyeDXC2fHG/e15qniCN2dF9yjqKzcheo8KB4bhsIm7kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nwUM4nyk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF27606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nwUM4nyk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA88B1F00A04
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794356883;
	bh=bbBaRo/7L6iOQrhDinfNIJ3r1kvuz8qfg44WFld2veY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nwUM4nykXPopNGTyscZh/s7QXJS/OKgc04ASib+wR47Y2WPuiWkNkx/dQzj5zR/fd
	 KdpC2qkBAGTl8LwWYm/rlheh54DOzdjT9vxQyhOeM5znZ4AXE+cnNUSX80gcPLdQiw
	 8PcPac/FGedKA40KsOEC8D+7UB8oe/mJzwNSMqCrGJ6iP3Cgrp90Ap3foEn3bo53d4
	 428fKlQ+5H1/ZDRfOKnvB2pQ+1zpjfbG2/1IQ9HbOisOOFYNfPGl6NIor4BwbtH0de
	 8kLiFMwAGC5gB9G07ADVCmQnbYydJJDpKjuhai2m6JfkEk86PW4JlcpMLgRUw4PlOm
	 QzbFUP7+5OY7g==
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5eaefe5b523so1741174e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:28:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHvdqLDGP01eg8irGvLUmPw4N1eLuMSXIUoNQYwoW3p0HJPvK/R7MNNKlMN2TTxqgD6zL5lAWzPWoX4fqs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gmPjOyLNRi6g2CyHJo5ZhwFz47+Ay7X7otzA19CMqEJ3RaUW0
	hcaDs3JXOj8NVCT8zU7vet0AYezQwti53WTWF3GlcnqzgYF7Mkwo2P6Rkf6c4PqFmBNMIdJFBrY
	smX1pJ80TOAtlOKJ8DeHUfd9ItHgSnTE=
X-Received: by 2002:a05:6123:64:b0:5ea:c98d:768 with SMTP id
 71dfb90a1353d-5ee1c3b55f5mr233673e0c.6.1794356883023; Tue, 10 Nov 2026
 16:28:03 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111000913.22943-1-shakeel.butt@linux.dev>
In-Reply-To: <20261111000913.22943-1-shakeel.butt@linux.dev>
From: Barry Song <baohua@kernel.org>
Date: Wed, 11 Nov 2026 08:27:51 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zRycX9dcW6P1J2R6f+xyO4+z6_LXz1i+qbNbMEnYm9uA@mail.gmail.com>
X-Gm-Features: AclHuK8i5C1ziLIFv7nuGyug3gNnUasxxchiBj9TPgocQ0U6mI78FyGiazCDdjg
Message-ID: <CAGsJ_4zRycX9dcW6P1J2R6f+xyO4+z6_LXz1i+qbNbMEnYm9uA@mail.gmail.com>
Subject: Re: [PATCH] mm: mglru: splice all generations when reparenting a memcg
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	David Hildenbrand <david@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, Kairui Song <kasong@tencent.com>, 
	Meta kernel team <kernel-team@meta.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Noah Feldt <noah@feldt.systems>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 8:09=E2=80=AFAM Shakeel Butt <shakeel.butt@linux.de=
v> wrote:
>
> Noah reported list_del corruption on single-node hosts running 7.2.11,
> which already has commit bf4ade7dbd76 ("memcg: keep folio's objcg same
> as its node"). The bad pointer is an MGLRU list head in a freed
> mem_cgroup_per_node:
>
>   slab mem_cgroup_per_node start ff31bfa36a3c9e00 pointer offset 528 size=
 1920
>   list_del corruption. next->prev should be ffacf881ccc70e08, but was ff3=
1bfa36a3ca010. (next=3Dff31bfa36a3ca010)
>
> When a memcg goes offline, __lru_gen_reparent_memcg() moves its MGLRU
> lists to the parent. It moves only the generations (gens) from min_seq
> to max_seq, and it puts each list at the same index in the parent.
>
> A folio's gen in folio->flags can be ahead of the list it is on. In the
> parent, the same index can stand for an older gen, so the folio's gen
> can end up older than its list. Once the parent's min_seq passes that
> gen, sort_folio() puts the folio on the list for max_seq + 1, where it
> stays until the next aging.
>
> If the parent goes offline before that aging, the folio is not moved to
> the grandparent. It stays on the parent's list after the parent is
> freed, and the next list_del() on it touches freed memory. This needs
> two cgroups on one branch to go offline one after the other, such as a
> container and then its pod.
>
> The parent always has MAX_NR_GENS gens at this point, so every index is
> valid in it. Move all MAX_NR_GENS lists, not only the gens from min_seq
> to max_seq.
>
> A reproducer that drives these steps through the lru_gen debugfs file
> gets a KASAN use-after-free on the freed mem_cgroup_per_node without
> this patch, and no report with it.
>
> Fixes: f304652609ea ("mm: vmscan: prepare for reparenting MGLRU folios")
> Reported-by: Noah Feldt <noah@feldt.systems>
> Closes: https://lore.kernel.org/all/20261110132853.71228-1-noah@feldt.sys=
tems/
> Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
> Cc: <stable@vger.kernel.org>

Thanks very much, Shakeel! I saw Kairui has exactly the same code here:

[PATCH v4 14/17] mm/mglru: reparent folios from all generations
https://lore.kernel.org/linux-mm/20261016-mglru-fg-v4-14-2106750c0bfa@tence=
nt.com/

somehow, Shakeel's patch makes us need the change earlier even before
mglru-fg lands?

> ---
>  mm/vmscan.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 6a1af9b92349..902616a3b755 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -4751,19 +4751,25 @@ void max_lru_gen_memcg(struct mem_cgroup *memcg, =
int nid)
>   * The same generation has different meanings in the parent and child me=
mcg,
>   * so this compromise method will cause the LRU inversion problem. But a=
s the
>   * system runs, this problem will be fixed automatically.
> + *
> + * Move all MAX_NR_GENS lists, not only the gens from min_seq to max_seq=
.
> + * An earlier reparenting can leave a folio whose gen is older than the =
list
> + * it is on. Once min_seq passes that gen, sort_folio() puts the folio o=
n the
> + * list for max_seq + 1, where it stays until the next aging. If that li=
st
> + * were skipped, the folio would stay behind on a memcg that is about to=
 be
> + * freed. The parent has MAX_NR_GENS gens here, so every index is valid =
in it.
>   */
>  static void __lru_gen_reparent_memcg(struct lruvec *child_lruvec, struct=
 lruvec *parent_lruvec,
>                                      int zone, int type)
>  {
>         struct lru_gen_folio *child_lrugen, *parent_lrugen;
>         enum lru_list lru =3D type * LRU_INACTIVE_FILE;
> -       int i;
> +       int gen;
>
>         child_lrugen =3D &child_lruvec->lrugen;
>         parent_lrugen =3D &parent_lruvec->lrugen;
>
> -       for (i =3D 0; i < get_nr_gens(child_lruvec, type); i++) {
> -               int gen =3D lru_gen_from_seq(child_lrugen->max_seq - i);
> +       for (gen =3D 0; gen < MAX_NR_GENS; gen++) {
>                 long nr_pages =3D child_lrugen->nr_pages[gen][type][zone]=
;
>                 int child_lru_active =3D lru_gen_is_active(child_lruvec, =
gen) ? LRU_ACTIVE : 0;
>                 int parent_lru_active =3D lru_gen_is_active(parent_lruvec=
, gen) ? LRU_ACTIVE : 0;
> --
> 2.51.0
>

Thanks,
Barry
