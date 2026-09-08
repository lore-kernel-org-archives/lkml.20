Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F030233F5B1
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 18:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788892794; cv=pass; b=kuvldgNZi3JM4moU71GpfeKpU7Xv4Z105uCzhpLQ8O5EuC2Jh2DzibSXBqdK4ResI6L0pLNzOgT/+DQYAmM0eF5Co0IlLKq5De+UYFR4PkYNW24kTgG9Z2r/S2+Mt42af3TU8W31J7GBEswj81xQdtjDrStqAqCPIjreqW4dxkk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788892794; c=relaxed/simple;
	bh=oDK1zDg/oSey2EOVLolfzuplOiYAA9At+21vSxpayKs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rcLQG5BG3z2SZNS/VlA12efp7EC5Tne2/uIbY8PDGPJi2Jq5ZIV6k2g3H3F/mqNS+hScK0tqHyAXzwoVBUtk5KC6Y41Vt8veGBE4w1G2+hP92iNff8Vuw4BViZYomWSFy442hex56bhbZXIIpgPBAx5OeSwQD/IqnP6ReSQcWtk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Csj5J8Wx; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Csj5J8Wx"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49d0d2d37ceso16636115e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 11:39:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788892791; cv=none;
        d=google.com; s=arc-20260327;
        b=jMh8k45NmSLr5Wui8RXkRy7RiaYPqxTslDzdK8TGhFAWdRCKAW+g3EUBuYpin3vju/
         6ggCFwNnCltfUgzofQ1eCYex4wQIL0uBxFC9RiWJIV0hQk+70wjgtmfvHRAgk3FSbp4J
         TbLo4i51gJO9iM6vh9vK5ILijc8Ablohp40yMRUbSJhKgm5Sgzlh0A2TNmORlWTBiv1D
         BdluR+EILiun2pagvl1+zXtAZ9XIiPDIRpp3SfH9dv3cetEziK/3aCr/xcXt8ZPEQagH
         14Rm2E7d23zM6y3J+xgi7xFBlPHCCljhT9kf8bBuNtnQVtwAJUf82c+REVx1khpqA0Zp
         ygnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TRHHPtqnAHNoNBtGQy93BNsOG6GDWejrubjBMOtK5uk=;
        fh=loYU6lmenUxTAzvLoNMrRlAYm2UYul8Ls2gjGeR79UM=;
        b=DNH6FaA2QLzyDaSJHNoi7gP93UO0NUMh5Y3Mu+5qURVUQD5mvnIZ0mbkd3mniBBeKY
         Wu1C3DOaCupTwqloRcWrWKSshBysA5lTfkqk54lUbOEt6vzQBP0wbVQnCuYAD8X1MaYq
         ulFGb5kZJdeN35IeizMQSuh8KOUzKvwzLktyFFnBYQJST/BpQLMoqA2t7J0pI2QK/yLt
         TGq3Le8ABB4q4bpL6vG1N4EUHMwO0BF+pyzWL6KeMPml/S5yojEgx8/HUwrBaQ9fOP2n
         e7lAzR4roERavc4CW3qt7RYCj1Kws8K2HUTMIEZ47Hb3Zr1joznz4dfnVhqhgem1iwO3
         JDaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788892791; x=1789497591; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TRHHPtqnAHNoNBtGQy93BNsOG6GDWejrubjBMOtK5uk=;
        b=Csj5J8WxkMm8R2EqCFomh0kAcCdz+sUYZPIFzdUKf0fykkQVUjgBPs2M2Syg7zCJYv
         s+Tkp7iaiUreUtraHsYnEBupFh3MECX/3g3IthYWrAQfPcMpH+QMf+IdfeKFGCwWvPMQ
         15VYir/ackzr08xgllwWQEmCumeNW5hmGy0lE9lKEWRB9ijtDirK32spxN0m628YjiPR
         EUm7R8QG0XFp8xoQABPrz5w5tkmcHSSU7m+v9Oo/YapoXC0s1MjncEZkDyEzhIF6IP2B
         4LRNCULlZHz6y5ifUHqb0FrOke7dRTF5y8CFfdgkVKqmc+fRkmz6kF+uLMenEexGQNU0
         htsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788892791; x=1789497591;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TRHHPtqnAHNoNBtGQy93BNsOG6GDWejrubjBMOtK5uk=;
        b=FYnP8tFetqwhXV4LbzpEfycEZdS7/3ge8mNXMJsCnfb+uiOuuhJL8uClXvpECWhOMa
         IojNct8UFwWCWQIfgy0O5hdJ1IFOArDAaCka+nmukWI4/3rQTekeS9Nrz5IlTj58sYKC
         fdFHKDXjHThOdQKFe6rTVWrALeR0zkN3TXGHtumNwL+w+iJmBLCTPumsDVLuNfIKvWna
         M8J+ZRyrgSh5jJm+NXMK1RyNgaVliD8BHM04czgvq39DVbQWLSOYhpqf8JQS/b3bkXeU
         rtvw0VmuiBqLLzHI+818OszZl64T1rdyWtaQBVGcmVv3Vu+qn0/TqmoCRHFmpolWbjS+
         KjLw==
X-Forwarded-Encrypted: i=1; AKwUvBzgKYSYqj7MJjuhQWkY/lptqLGpvcFXvgngTh2rntbAsum6EUMvQ5OyNYA5efzEo1VyQzZ7jR5WbFcCL+k=@vger.kernel.org
X-Gm-Message-State: AFuF++mccEPUeeYjGbcNYDAqqVQw1OV1rW25eNVKkWnYQoXFWQZGdFtF
	TA+3/e4i9El9fzQ5weeMFGX/91HYO3ggTNyU5s8bd9GHoT37ONK2UbHIfgd4+dvGt+WfwvuE5uJ
	9fpHxb8Mr5KWI+Cmplo437XunpHtXpL8=
X-Gm-Gg: AYBFou3aupLNEJdnrZDciFrAv7JF1pvqhIM+hIclZkeBIfpuYe6p6UtVKF/frgJZCLZ
	DtyTF5rNQ3XnzYrdTHnVoKOlaW+qVI5drTsR18VkIxDKaYp/7sK3140WCaKhT156jjlbC5LC5/s
	Hmk7HscTji+TTrHCPKt12CaGeJMg3sWru64Dl6wXP9eI5avv5fgTL+vm1h5PsvffpKZ1G4Sn1Eb
	UTLt0CiNtPJ5Kb3vFSTgJdv6yqrdEBc+oGs+FrlwDw7Ki3J26sszHbmKDsSC/1/iZa7GM07UDsK
	H+DjQhUk2ncojTXziRV8c1xWe8Ij50LkE4Azm/05uxQOohIAvmzwLHy9mcrEvZe41PfvRCCc4ew
	H
X-Received: by 2002:a05:600c:4f89:b0:49c:e1df:79a4 with SMTP id
 5b1f17b1804b1-49cf822c827mr275918375e9.5.1788892790894; Tue, 08 Sep 2026
 11:39:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825135209.3135169-1-alex@ghiti.fr> <20260825135209.3135169-3-alex@ghiti.fr>
In-Reply-To: <20260825135209.3135169-3-alex@ghiti.fr>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 8 Sep 2026 11:39:39 -0700
X-Gm-Features: AcwNN1UgwciD1I-qE2yD_ZK2P3jH-A8WPIpVEy3cs7LbzeEfivAviywv0_QerXY
Message-ID: <CAKEwX=NUFMjHHbeeRnUm0Ex9YQaesYTM-22WMGRJMXSKTkc6uw@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] mm: swap: drop dropbehind swap cache folios on
 writeback completion
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
	Yuanchu Xie <yuanchu@google.com>, Kunwu Chan <kunwu.chan@gmail.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 6:54=E2=80=AFAM Alexandre Ghiti <alex@ghiti.fr> wro=
te:
>
> A PG_dropbehind folio is dropped from its cache once writeback completes
> rather than left for reclaim to find later; this is implemented for file
> folios in folio_end_dropbehind(). Extend it to swap cache folios.
>
> The drop takes the folio and swap cluster locks and may sleep, so it
> cannot run in interrupt context. Set BIO_COMPLETE_IN_TASK on the write,
> as the file dropbehind paths do, and drop the folio directly from
> folio_end_writeback().

This BIO_COMPLETE_IN_TASK thing is really nice! I'm glad we have a
proper infra now and no longer have to roll our own solutions :)

>
> Suggested-by: Yosry Ahmed <yosry@kernel.org>
> Suggested-by: Johannes Weiner <hannes@cmpxchg.org>
> Suggested-by: Nhat Pham <nphamcs@gmail.com>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>

Mostly LGTM FWIW. Just one query below:

[...]

> +        * Gate remove_mapping_reclaim() on folio_test_swapcache(): a rac=
ing
> +        * swapin may have freed the swap slot (folio_free_swap()) and dr=
opped the
> +        * folio from the cache, and it must not run on a non-swapcache f=
olio (it
> +        * would trip __remove_mapping()'s mapping =3D=3D folio_mapping()=
 check).
> +        */
> +       if (!folio_test_swapcache(folio) || folio_test_writeback(folio) |=
|
> +           !remove_mapping_reclaim(swap_address_space(folio->swap), foli=
o, memcg)) {

remove_mapping_reclaim() and the likes seem a bit confusing to me, but
I don't have a good suggestions for the naming...

(also I'm hoping we're fixing the weird shadows behavior of zswap
writeback soon :))

Anyway:

Reviewed-by: Nhat Pham <nphamcs@gmail.com>
