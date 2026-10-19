Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792440903;
	b=RgSt/QgngkC+JjU3ujJKrzHxv+7dIloOJimcFXKmAkEP1J7HFss154Mc+XUpBMkz9/1B
	 jNi6l2Wc9DBNMth1Jg87qUFcPnvCiLMMRQmF5ogGbZZEOeIScGi8Kt8xtpHDyNPdZALZZ
	 vdeq/Rn5exTDnkCl6qU68nh23xA1RJmUDhg/kQ0etyLLfv7K3idbV1ep8Eqc9ybIauDQj
	 XomLppzHr2GBs7ZFOi83lvL+IJWmuWk+SRv9jM4asXJbuxn7Di4drGtLq14DfCo5HJieq
	 eN02N3emAldlWLp9x+xIYWemqbsay82WqHACYWpjpNH1WZYmSawYQoXmEotILPM3PVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792440903;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=AhIlOjs985Zg+2gE7dl6XqY7gUTcdF1bgwJNykVLqps=;
	b=ehnQrZlc7pA+33WtKtkkPUZjWFLZCnetuiX7dftNaDqTC+VlBiOZi8qoBxvCNHBzo2t1
	 ZDuX6+2plNwTIPPNzuPf99XNH5Lz7LWhcoOFm3VA8WLUnaqAR0jXvRvwaDweImnnVl7hn
	 bnsitVW06l1RXYMRxNvXXjqbusXaez3ktTk1xoQ6dNwFE3qB5GRGorArF5Q/T2eSs52lN
	 Q6/texACgxHkYxJRnDvC25kQHS0zSAC4Vx9sk08tBURD0WBANaEbTWjL+bLZgMdcfikLx
	 VztUTW+2LHkVtBVfyr1nDdyjkM5z30WkdXwoLKjrAbgem95hiT03zd1eebOZ7UH9bpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N89tUUBh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E38606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N89tUUBh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8A7A1F000CA
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792440902;
	bh=AhIlOjs985Zg+2gE7dl6XqY7gUTcdF1bgwJNykVLqps=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=N89tUUBhdnnH4cRVRReEG+7AuUKZ8bKhQos2XKMIeLuzhaIGgzFU1MEsL8El2o65z
	 Oso89jldU/IXvE8y68G21qYTfPEVAADmVl34Zn6xE3dvMU0IrHuWBcy0SuipjdFA97
	 D6ZKA3DD18ObVzYo16lGPenP9m2kxEsrMG4HIP4tWlHNBhNPQW9s/6Iy4j0KAel6Ey
	 ufbibbVvHW+G72xqzudynCFcO2sgODS04H1Gz/lmY/oFXkFSWFuVUnxeUV3QMwxR/C
	 l1n/TKQt+JjUawCkXwPzd7BjKov9GeWKlWMJltuDepkdn6RKzgblcKCEsmePoJN3xL
	 KHen8zb1olhTQ==
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93e64d52949so249666785a.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:15:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz14cSNrT6jn1SnfwjB7/UzHTug5X+C539BLWT3JtytJ4tICAD/yMBmUFpJdkP6PIxJw8pBvB/7iFkihgg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJiKW7PQnS2WrgGcWjK/TNlOt2MTcmVKO+Xu8eMst/XsseAnZJ1
	lxk4SM6sqe6DaJllhMFJVDPyVV7gn9MdP1iEM9ReV9Q9Tty5zNdM//obmLuke8yrGmFlW4URAw+
	tRJG5YFiD7B3RrEQrckoiZjOeoyh/aT4=
X-Received: by 2002:a05:620a:4891:b0:93e:a8c5:132f with SMTP id
 af79cd13be357-93f29c98743mr1615223985a.29.1792440902055; Mon, 19 Oct 2026
 13:15:02 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019185002.3428594-1-gourry@gourry.net>
In-Reply-To: <20261019185002.3428594-1-gourry@gourry.net>
From: Barry Song <baohua@kernel.org>
Date: Tue, 20 Oct 2026 04:14:50 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4wqoGNOmijowgWPc9qBhQCN9EhoxFKgFKuF_ruW+YK8xA@mail.gmail.com>
X-Gm-Features: AclHuK_j7CrYt7emO50ZmEB2M4Ny91OZbg0vtrIa8RG5q-BZ0RYFwDdSzdFngkI
Message-ID: <CAGsJ_4wqoGNOmijowgWPc9qBhQCN9EhoxFKgFKuF_ruW+YK8xA@mail.gmail.com>
Subject: Re: [PATCH] mm/vmscan: reclaim every zone in per-node proactive reclaim
To: "Gregory Price (Meta)" <gourry@gourry.net>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	akpm@linux-foundation.org, kasong@tencent.com, qi.zheng@linux.dev, 
	shakeel.butt@linux.dev, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, baoquan.he@linux.dev, baolin.wang@linux.alibaba.com, 
	hannes@cmpxchg.org, david@kernel.org, mhocko@kernel.org, ljs@kernel.org, 
	dave@stgolabs.net, roman.gushchin@linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 2:50=E2=80=AFAM Gregory Price (Meta) <gourry@gourry=
.net> wrote:
>
> user_proactive_reclaim() limits per-node reclaim to
> gfp_zone(GFP_KERNEL), which is ZONE_NORMAL. Proactive reclaim serves no
> allocation, but that limit makes shrink_node() skip every ZONE_MOVABLE
> folio, so writing to /sys/devices/system/node/nodeN/reclaim never
> reclaims a node's movable memory. A movable-only node, such as dax/kmem
> or hotplugged memory onlined movable, reclaims nothing and fails with
> -EAGAIN.
>
> To reproduce, fill a movable-only node with clean page cache and write
> 200M to its nodeN/reclaim: the write fails with -EAGAIN and the page
> cache stays. The same write to a ZONE_NORMAL node frees 200MB.
>
> Scan every zone, as memory.reclaim does.
>
> Fixes: b980077899ea4 ("mm: introduce per-node proactive reclaim interface=
")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
> ---

Makes a lot of sense to me.

Reviewed-by: Barry Song <baohua@kernel.org>
