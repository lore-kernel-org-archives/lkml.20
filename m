Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793606829;
	b=R1fpyRYKoMzZGA57jGJVwuC12+uGgkgGNNhvPKwB2WeTlivZT2Joa2M3F4mOwKqKeSBG
	 m8eUB2zz6wMxBatW6QcuywrmzusjL1gpQ2VgwtbY9XXYg9qk7/zH9xeTQjIz5Z6y3uJIp
	 u1yV5exMRLABmAz4H3cWvlKXz52TnwP1RsFsC4zCmYRdVz7/l3faO5GcsYC3FzA+DfPMQ
	 mGcAVwelVQCmANZ9mDwzMMl8ym6bwnTtsjGBCN1sD4lCd7r76rZRs2r8UCCW14pssk1+g
	 80qXSvpUjhzgs/aTbsizEGCxqR3uSiNrADzVa3xc8vLTxqVAf5zCPkKkIb6LJwf/cXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793606829;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=ZFKEz2Iu0aOPt9Nq3i/pKYGCNKHVigLA2BmD6KDbRRo=;
	b=uIUfEf6orjov8i2giOeOitRQkvIYIOpe5V7dG0o4mGUM/ttL0bZJPL3ScMwaqKM6TzcM
	 poPdlk38Yx4MYZsc4ylgvzDWmuRCjpLO7jx4MrzPbgiCiFProl5iKyKjjwNsSafWpod1u
	 Ts5yDeL9N+MuwKhyeDxujMGRb/D0q6p+jI+tFxKCV75jwGalarpexj8L8mCzyxXeV3RFU
	 ulSmFvKjq+4ZP6g6IYIVu90oMbn4F/fV77JvzMBB+sghyCQ1W6nARkY7Fc8ToiI/K/Ff6
	 3Yy+v5SqJhtpAKOEN7/FRD6xwQ9vWVEV1/QY0rAYdMh2HbRwO15op/qTUMkNC70hINQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=etsalapatis.com;
	spf=pass smtp.mailfrom=etsalapatis.com;
	dkim=pass header.d=etsalapatis.com header.i=@etsalapatis.com header.a=rsa-sha256 header.s=google header.b=oYOQJQwo;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE53D606A32C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 08:07:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE53D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=etsalapatis.com header.i=@etsalapatis.com header.a=rsa-sha256 header.s=google header.b=oYOQJQwo
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e946155442so23932405ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 00:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis.com; s=google; t=1793606828; x=1794211628; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZFKEz2Iu0aOPt9Nq3i/pKYGCNKHVigLA2BmD6KDbRRo=;
        b=oYOQJQwoCDvsXxt2wNBL0Qu4ZX7aOeuq5MtfITPE1td7BT+iegjg9OjLdxBT/HisCV
         q8rqC54AX7s6PfNUe1eERfL9dfJrtAP1S+7wTT6DSc2DdMkhjAJbYesWgoQABQMkl1iH
         TsA80djQxuoZchaxQNp2eToC+qtWu9DHtFvlmY4ILdtFH5d2zEYJoijiIwC2Co7/iFXF
         jXV2HvbJZqC5kATgAWvJhsutbCGf258UBq9uA65fdjIIf+b1wMhtGBnptXqV+fYuFZqy
         xc/emEngGzDn7fHG2e1nzK8/7uxztaoTiGmxEvZeckvFcsJTRs96+2sb2WM58mZhfQol
         cZgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793606828; x=1794211628;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZFKEz2Iu0aOPt9Nq3i/pKYGCNKHVigLA2BmD6KDbRRo=;
        b=qDIjsAK6Qj9nkL2wPxSWQhKjQ2bySNHbbFyl79ctmWhK5dTRZyng8He7t5igEdao//
         3/TdFWub4ilkJDDLI7vVzicMXkiXC7IcnooGhXqHfZG4QGS8TS6bMWpEBdJ3z6ew+nlF
         hYRthujLfqafpBB3SOM4HkMqshYOHx1aUrLL9t9GZY2iTwny79OQXk6huu9Ajn+muzYP
         U6XwDVMUXCXKB8QLTyLtjgysNi8MYXGU0IdIPhHdqXoB+bHQlPg4CN1mo6ZUlxdR+7Wq
         mxLlUWbPhys7rqkW/uD7eAliGCZ3uEoOl/NVUz2J1ayzPZNuWnVhkQmv3V/RuSEyP9Wj
         tjQg==
X-Forwarded-Encrypted: i=1; AKwUvBwtLbZFYyVuei3977yUb1tYfhjob7LCXA53sF+AIWUvWeT9q1rF16Q/BpzCITbtgq97lFaaOG3LN92lC1s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6gitJ+XBAtzrvyw7V/qCAxunEUwPC2IAMU8OgOxv2ivs/wuWK
	3Ik7wbpHSQVi5uCXLpDCO7HgX5hRnrQhIkYukKP4VkZAsLdpGhIrgdkHWnbHcLLGZNU=
X-Gm-Gg: AYBFou1TPWYG61JeO+Qplb63H/6XI5VECj6v9M2XJoys3juWa1tzAUKI2D7VVyjoE4n
	GMtjopfgJ681uRGBkAJZcxg0CPmVnf0RlRXcesCb/rYv7DJCuTEI1IDqpG0W/VY6i3udZU82U35
	Ayy6eEBs+GFZUZvByagQb6pEOlS3uyOYVNlFnzbjkWBZrtx9FTLwDLzcWEfuBhGD8GRpt46SnF7
	+BQzjvjqKach2pJjnJibbJEGYTq20Hf9JCiXLTKHw8BFaDG8IPO+EQE8ENKqVbHVsV5SrY0q1d/
	yNTpaUc9Kwd9r7YFqON+ZXw/V6wAtxsVYhmfCMHzqzPaitCnlqznNnzHE8qDxuwwJw6guoWFqFx
	ER1fi7r/6wZy9ILY5v6t82Tib9w7UIFBd/orUJ8Lwj+IePqgcl8vd+Az9k1OUtjEluT4ra9YYPV
	7c7vgmFBN48jkikQdxWINGPHkA30q321A/U4M56n7vtGcWQPRk6KLRor9w465q+PqsdCj4s0YFu
	ntPnQbCIAqt4C31DU4SnP0eqpS+/uw5GPUyAqex6oGtnfDgm2nTq00d/fE2Fhdl7Td65orT0KGb
	D6um8+ZlZwPal+E5QUdOPNvcFYKQHjddSonBsY3aF2lX7iBTCJIp3RGVxUYvWvnz/0wcF+1+uy/
	HvZvP
X-Received: by 2002:a17:902:eccb:b0:2e5:d2b1:c70b with SMTP id d9443c01a7336-2eb36536d3amr90256725ad.60.1793606827873;
        Mon, 02 Nov 2026 00:07:07 -0800 (PST)
Received: from localhost (107-190-31-93.cpe.teksavvy.com. [107.190.31.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39265090sm23623165ad.41.2026.11.02.00.07.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 00:07:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Nov 2026 08:07:06 +0000
Message-Id: <DMKKK0ZLYSKU.3UZ614ZC9DH05@etsalapatis.com>
Cc: "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "Ihor Solodrai" <ihor.solodrai@linux.dev>, <david.dai@linux.dev>, "Gavin
 Guo" <gavinguo@igalia.com>, <bpf@vger.kernel.org>,
 <sched-ext@lists.linux.dev>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH bpf-next 3/3] selftests/bpf: libarena: Add rb_next()
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Changwoo Min" <changwoo@igalia.com>, "Alexei Starovoitov"
 <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii
 Nakryiko" <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Shuah Khan"
 <shuah@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>
X-Mailer: aerc 0.21.0
References: <20261028060046.549097-1-changwoo@igalia.com>
 <20261028060046.549097-4-changwoo@igalia.com>
In-Reply-To: <20261028060046.549097-4-changwoo@igalia.com>

On Wed Oct 28, 2026 at 6:00 AM UTC, Changwoo Min wrote:
> Add rb_next(), the in-order successor through parent pointers.
>
> Add a selftest that walks a tree with repeated keys and checks the walk
> against the order in which the head leaves the tree.
>
> Signed-off-by: Changwoo Min <changwoo@igalia.com>
> ---
>  .../bpf/libarena/include/libarena/rbtree.h    | 23 ++++++++
>  .../bpf/libarena/selftests/test_rbtree.bpf.c  | 54 +++++++++++++++++++
>  2 files changed, 77 insertions(+)
>
> diff --git a/tools/testing/selftests/bpf/libarena/include/libarena/rbtree=
.h b/tools/testing/selftests/bpf/libarena/include/libarena/rbtree.h
> index a8dd8c2e7596..956b4a24b52a 100644
> --- a/tools/testing/selftests/bpf/libarena/include/libarena/rbtree.h
> +++ b/tools/testing/selftests/bpf/libarena/include/libarena/rbtree.h
> @@ -103,6 +103,29 @@ void rb_node_free(struct rbnode __arena *rbnode);
> =20
>  int rb_integrity_check(struct rbtree __arena *rbtree);
> =20
> +/*
> + * Return the in-order successor of @node, or NULL if @node is the last =
one.
> + * Walking from rb_first() with it visits the tree in key order, equal k=
eys in
> + * insertion order. Call it under the writer's lock.
> + */

Let's move this to the main *.bpf.c file, with the rest of the traversal fu=
nctions.

> +static __always_inline struct rbnode __arena *rb_next(struct rbnode __ar=
ena *node)
> +{
> +	struct rbnode __arena *parent;
> +
> +	if (node->right) {
> +		node =3D node->right;
> +		while (node->left && can_loop)
> +			node =3D node->left;
> +		return node;
> +	}
> +
> +	/* Climb until we leave a left subtree; its parent comes next. */
> +	while ((parent =3D node->parent) && node =3D=3D parent->right && can_lo=
op)
> +		node =3D parent;
> +
> +	return parent;
> +}
> +
>  /*
>   * Lockless reads of the head and the node count. They need not be calle=
d
>   * under the writer's lock, so they are advisory: the tree may change be=
fore
> diff --git a/tools/testing/selftests/bpf/libarena/selftests/test_rbtree.b=
pf.c b/tools/testing/selftests/bpf/libarena/selftests/test_rbtree.bpf.c
> index 57c4395c046a..784cc9edea17 100644
> --- a/tools/testing/selftests/bpf/libarena/selftests/test_rbtree.bpf.c
> +++ b/tools/testing/selftests/bpf/libarena/selftests/test_rbtree.bpf.c
> @@ -425,6 +425,60 @@ __weak int test_rbtree_first_update(void)
>  	return rb_destroy(rbtree);
>  }
> =20
> +#define NEXT_NR_NODES	64
> +
> +static struct rbnode __arena *next_nodes[NEXT_NR_NODES];
> +
> +SEC("syscall")
> +__weak int test_rbtree_next(void)
> +{
> +	struct rbtree __arena *rbtree;
> +	struct rbnode __arena *node;
> +	u64 seed =3D 0xcafe;
> +	int i;
> +
> +	rbtree =3D rb_create(RB_NOALLOC, RB_DUPLICATE);
> +	if (!rbtree)
> +		return 1;
> +
> +	/* Pseudo-random keys with repeats, so the walk crosses equal keys. */
> +	for (i =3D 0; i < NEXT_NR_NODES && can_loop; i++) {
> +		/* LCG using Knuth's MMIX constants for determinism. */
> +		seed =3D seed * 6364136223846793005ULL + 1442695040888963407ULL;
> +		node =3D rb_node_alloc((seed >> 33) % 16, i);
> +		if (!node)
> +			return 2;
> +
> +		if (rb_insert_node(rbtree, node))
> +			return 3;
> +	}
> +
> +	node =3D rb_first(rbtree);
> +	for (i =3D 0; i < NEXT_NR_NODES && can_loop; i++) {
> +		if (!node)
> +			return 4;
> +
> +		next_nodes[i] =3D node;
> +		node =3D rb_next(node);
> +	}
> +
> +	if (node)
> +		return 5;
> +
> +	for (i =3D 0; i < NEXT_NR_NODES && can_loop; i++) {
> +		node =3D rb_first(rbtree);
> +		if (node !=3D next_nodes[i])
> +			return 6;
> +
> +		if (rb_remove_node(rbtree, node))
> +			return 7;
> +
> +		rb_node_free(node);
> +	}
> +
> +	return rb_destroy(rbtree);
> +}
> +
>  struct rb_embed {
>  	u64 pad;
>  	struct rbtree tree;

