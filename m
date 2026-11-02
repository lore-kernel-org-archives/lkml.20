Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793605879;
	b=veZ4yNjS7XHsJ7dGegHlWC36yVSkcB9D98Pw2ZDocV54KimeZaBTFY8fabwIm+/f1t2B
	 npQjVeBnIcvTnsZJFwENxgRdm9mFUpf0Cp+cfMMgmLDs8PPp2X68HTd6bkeoPoUZOWrQv
	 7i/K+XJ365m+cqZJkdQTuorWyiXZyT0IET9tK80fH6lABn9Rat7yFaN3VILAbaqrSB01l
	 lSU+kYFoJcTVqAAjF1ipZgj5HWucO1P/b7h3XYEOcJl7cX9v9z1fdquvBh89wcLwV767t
	 T1MDEZMtV/PacITx2+riq5baONLk2sMxtwIlUB90OOwYT2V74M0yUpSyUYd7A6Qdg/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793605879;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=qFmWwE/MyJZ42ZQHTeVUHFZv3R+Of1XsGPpIbsWFJaI=;
	b=sym21uB0NpfCqf3ODyUC6jf4uo3Of+mDVLqcrSGovShZu294S1jGXlDKbO/RP/PvlyhM
	 68G0d3RvCb0GNfIpgfzCik8T57i3QMpOyCBtkJuMNoS0awkibSaCgKsvlWG11JlqxIwJf
	 I4jwR2e98zxcvyxDoQ7vrjIzLO4vG1hV8Gm4B6huk1c+rdL59kKNJF+FexBohKTUKDbu9
	 La2+rSzs3WNfdFQ29O9bqnqv3famJ/mGQJc0Zd5+QObZui+BKr6UGlalDebz5FmrnJ8eb
	 mE2ob+HW67ZwXrrfdAkTpJoxJPrBr015C+7NNvPhFvjHrFNrEX5s4RwR5NOANsgaSXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=etsalapatis.com;
	spf=pass smtp.mailfrom=etsalapatis.com;
	dkim=pass header.d=etsalapatis.com header.i=@etsalapatis.com header.a=rsa-sha256 header.s=google header.b=MSRrhXCb;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFEE606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 07:51:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EFEE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=etsalapatis.com header.i=@etsalapatis.com header.a=rsa-sha256 header.s=google header.b=MSRrhXCb
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a06b27bf9bso835183b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 23:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis.com; s=google; t=1793605877; x=1794210677; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qFmWwE/MyJZ42ZQHTeVUHFZv3R+Of1XsGPpIbsWFJaI=;
        b=MSRrhXCblmmK3m7i40Azvryyx/ncgyk1l0Z9OyvkL0wOUxRkhJvZnOiaJCEryuTub4
         PqaHL3Fy8zbcAl6+6ka9G45bqWPShSBijC1vWtrx4/a9NeOLINs7iHhoEZ1gWJ2hxAv+
         LJJUfyx/5xcZze/HPHq8oVhHyEws0ej9Fx9izJ4hmSDidMOaUSbzxctdk0PNS9eqxzDK
         K9G6SxxKRV/qtdKf6dv5Jx8DrDFkbJAjzjERdzmMzXUA1rn+FVgRosrS5Rbe6k55WaOS
         iwk0ffBS/JDKTshteG6uA9E6wjrSoHe7CQQ28Fhk1DYlC7/ul50P//1L72VWMe8wunmg
         TZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793605877; x=1794210677;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qFmWwE/MyJZ42ZQHTeVUHFZv3R+Of1XsGPpIbsWFJaI=;
        b=ReBcWwOCqo8mbtvFsPw0lm7jbQem9v/bKS79LFaEghBZw5CExdGCo82qIH5ax5jzA7
         cQeN7Gx6igCZlsLRFq2gRNhJtDh7x6rEEUYrpVvH8c9EukU31eNcO3xvAsQEUaeTNLp5
         q+dsqtuMSRNFF6Usl97oxhzyzGFUtL45C4FoqQVLLctCXNIAGA6XUPceEEgBKKOX8Lly
         XNUAG+t2bs5kQ3Wf8gyPNRFl3dLCyvB873We14gxBtzJyByX1UYZtBAtlEZUhR5WsG47
         7voXLj24vXLk2M6H0Ovts37PPxCyQIeWtZLg0/g4n0ya1dg69pMZev7Bis/r9dcZYwAZ
         RdmA==
X-Forwarded-Encrypted: i=1; AKwUvBy84UvxeBFDRI8zyz4lM/YrdBOgwF6VFz+RtNHbpGPTThbuhKr2VBSOWm1n4H0YvaxwsXFOFnQeRRNiCPA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJlDI7yU350L4TqDDLpPYPAM3iEHtBzptFM0uV92dfPRPoOKns
	8fdanwvm7RRVMogyrTzWPbEPy8Hl3z5W+zCxWIchyyWzIq2KUjf7CZoMghgcX+Jx+Is=
X-Gm-Gg: AYBFou32shk3f2SMTxecnH3KCyray5fABylalqSYiWNKf45i8AwT2BCHTnKc2fc/LEM
	CJbnIF4blOyTK3VOHxgshq1U2ui0XHCFImEEZqeoyZ8mfEDsyIom+dYlBVdTa4nMX2K8Mgl1HYo
	Fk2gAB+8B1+VyMAwnOvW2uggJeoz+7nXdPqEuK6qWkxFtkS8vlCo2EtAYxewudVcypHlg0LgGvL
	3m6Q49xiJbPqJRCZ1aWCtNI/69Zgrg4LZEL8VN9zMGXDt8qIIzO6my+MuQ7o2wko78Z7cfdrrT2
	F41SNFfFa+FLSh4S9CviLBfkdnXsZ2rns6eGz++rYLs5HfhKc/m0NyChBdss96O7rfzurqZ87oI
	qHjbuzNLSzfa6WTgfhxPi4xU2gVQMm0hX6Us0BpKgnwuDcR0NRRSPcdCkYPtO9kK69EuI8R4sSU
	Su2qk4rpbLsPkMjc8q6HwEdge+rES+cseqWG3ufD66/95XvK63ULpVi85psnr+yN/1Gtv1GpDut
	KKd8EMbKEou5z3yoALHiSXYkMbs1UmdHpDHf0E6WMw7ynSfcYWBfnsBzh3SiTKI6s7xogKretbN
	uR7MvdoQPMtw7EOlwvQMSXSJk8CfdCmjDajb/U71CuV1t4yHM+B2bcwe6Q==
X-Received: by 2002:a05:6a00:4f8c:b0:874:705d:f63e with SMTP id d2e1a72fcca58-8a9bf0472a8mr7293625b3a.32.1793605877437;
        Sun, 01 Nov 2026 23:51:17 -0800 (PST)
Received: from localhost (107-190-31-93.cpe.teksavvy.com. [107.190.31.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad9d047d2sm1658546b3a.25.2026.11.01.23.51.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 23:51:17 -0800 (PST)
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
Date: Mon, 02 Nov 2026 07:51:16 +0000
Message-Id: <DMKK7WGBASS7.2VBQTIIX6YEGS@etsalapatis.com>
Cc: "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "Ihor Solodrai" <ihor.solodrai@linux.dev>, <david.dai@linux.dev>, "Gavin
 Guo" <gavinguo@igalia.com>, <bpf@vger.kernel.org>,
 <sched-ext@lists.linux.dev>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH bpf-next 1/3] selftests/bpf: libarena: Order equal
 rbtree keys FIFO
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Changwoo Min" <changwoo@igalia.com>, "Alexei Starovoitov"
 <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii
 Nakryiko" <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Shuah Khan"
 <shuah@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>
X-Mailer: aerc 0.21.0
References: <20261028060046.549097-1-changwoo@igalia.com>
 <20261028060046.549097-2-changwoo@igalia.com>
In-Reply-To: <20261028060046.549097-2-changwoo@igalia.com>

On Wed Oct 28, 2026 at 6:00 AM UTC, Changwoo Min wrote:
> An RB_DUPLICATE tree links a new key to the left of an equal one, so
> rb_least() and rb_pop() return the newest of several equal keys. A
> queue of tasks keyed by vtime should instead serve equal keys in
> arrival order, as sched_ext's vtime-ordered DSQs do.
>
> Send equal keys right on insert, as the kernel's rb_add() does. A new
> node then lands after every node with an equal key. Rotations and
> removals preserve the in-order sequence, so equal keys stay in
> insertion order without a tie-break field.
>
> Add a selftest that interleaves equal keys while the tree grows and
> checks the pop order.
>
> Signed-off-by: Changwoo Min <changwoo@igalia.com>

Hi Changwoo,

  Patch looks fine to me, one nit below.

> ---
>  .../bpf/libarena/include/libarena/rbtree.h    |  6 +--
>  .../bpf/libarena/selftests/test_rbtree.bpf.c  | 37 +++++++++++++++++++
>  .../selftests/bpf/libarena/src/rbtree.bpf.c   | 16 +++++---
>  3 files changed, 51 insertions(+), 8 deletions(-)
>
> diff --git a/tools/testing/selftests/bpf/libarena/include/libarena/rbtree=
.h b/tools/testing/selftests/bpf/libarena/include/libarena/rbtree.h
> index 486428911d96..00e63b12d82e 100644
> --- a/tools/testing/selftests/bpf/libarena/include/libarena/rbtree.h
> +++ b/tools/testing/selftests/bpf/libarena/include/libarena/rbtree.h
> @@ -45,9 +45,9 @@ enum rbtree_alloc {
>   * the existing node.
>   *
>   * RB_DUPLICATE: Allow nodes with identical keys in the rbtree.
> - * Finding/popping/removing a key acts on any of the nodes
> - * with the appropriate key - there is no ordering by time
> - * of insertion.
> + * Nodes with identical keys are kept in insertion order, so
> + * rb_least() and rb_pop() return the oldest of them. Finding
> + * or removing by key acts on any of them.
>   */
>  enum rbtree_insert_mode {
>  	RB_DEFAULT,
> diff --git a/tools/testing/selftests/bpf/libarena/selftests/test_rbtree.b=
pf.c b/tools/testing/selftests/bpf/libarena/selftests/test_rbtree.bpf.c
> index 856c484a009a..1e2a0fac1e4f 100644
> --- a/tools/testing/selftests/bpf/libarena/selftests/test_rbtree.bpf.c
> +++ b/tools/testing/selftests/bpf/libarena/selftests/test_rbtree.bpf.c
> @@ -248,6 +248,43 @@ __weak int test_rbtree_duplicate(void)
>  	return rb_destroy(rbtree);
>  }
> =20
> +#define FIFO_NR_NODES	64
> +#define FIFO_NR_KEYS	4
> +
> +SEC("syscall")
> +__weak int test_rbtree_duplicate_fifo(void)
> +{
> +	const u64 per_key =3D FIFO_NR_NODES / FIFO_NR_KEYS;
> +	struct rbtree __arena *rbtree;
> +	u64 key, value;
> +	int ret, i;
> +
> +	rbtree =3D rb_create(RB_ALLOC, RB_DUPLICATE);
> +	if (!rbtree)
> +		return 1;
> +
> +	for (i =3D 0; i < FIFO_NR_NODES && can_loop; i++) {
> +		ret =3D rb_insert(rbtree, i % FIFO_NR_KEYS, i);
> +		if (ret)
> +			return 2;
> +	}
> +
> +	for (i =3D 0; i < FIFO_NR_NODES && can_loop; i++) {
> +		ret =3D rb_pop(rbtree, &key, &value);
> +		if (ret)
> +			return 3;
> +
> +		/* All of key 0 in insertion order, then all of key 1, ... */
> +		if (key !=3D i / per_key)
> +			return 4;
> +
> +		if (value !=3D key + FIFO_NR_KEYS * (i % per_key))
> +			return 5;
> +	}
> +
> +	return rb_destroy(rbtree);
> +}
> +
>  static inline int
>  clean_up_noalloc_tree(struct rbtree __arena *rbtree)
>  {
> diff --git a/tools/testing/selftests/bpf/libarena/src/rbtree.bpf.c b/tool=
s/testing/selftests/bpf/libarena/src/rbtree.bpf.c
> index 7f0f6dc3e17d..e6c9430f734b 100644
> --- a/tools/testing/selftests/bpf/libarena/src/rbtree.bpf.c
> +++ b/tools/testing/selftests/bpf/libarena/src/rbtree.bpf.c
> @@ -161,8 +161,14 @@ struct rbnode __arena *rbnode_find(struct rbnode __a=
rena *subtree, u64 key)
>  	return node;
>  }
> =20
> +/*
> + * Find the node to link @key under. Smaller keys go left and everything=
 else
> + * right, so a new key lands after every node with an equal key and equa=
l keys
> + * stay in insertion order. Rotations and removals preserve the in-order
> + * sequence, so they keep that order too.
> + */

I think this description is more harm than good let's remove it. Can we als=
o keep the
old name? The new one sounds like we're inserting a parent.

>  static
> -struct rbnode __arena *rbnode_least_upper_bound(struct rbnode __arena *s=
ubtree, uint64_t key)
> +struct rbnode __arena *rbnode_insert_parent(struct rbnode __arena *subtr=
ee, uint64_t key)
>  {
>  	struct rbnode __arena *node =3D subtree;
>  	int dir;
> @@ -171,7 +177,7 @@ struct rbnode __arena *rbnode_least_upper_bound(struc=
t rbnode __arena *subtree,
>  		return NULL;
> =20
>  	while (can_loop) {
> -		dir =3D (key <=3D node->key) ? 0 : 1;
> +		dir =3D (key < node->key) ? 0 : 1;
> =20
>  		if (!node->child[dir])
>  			break;
> @@ -255,7 +261,7 @@ int rb_node_insert(struct rbtree __arena *rbtree,
>  	if (rbtree->insert !=3D RB_DUPLICATE)
>  		parent =3D rbnode_find(parent, key);
>  	else
> -		parent =3D rbnode_least_upper_bound(parent, key);
> +		parent =3D rbnode_insert_parent(parent, key);
> =20
>  	if (key =3D=3D parent->key && rbtree->insert !=3D RB_DUPLICATE) {
>  		if (rbtree->insert =3D=3D RB_UPDATE) {
> @@ -278,8 +284,8 @@ int rb_node_insert(struct rbtree __arena *rbtree,
>  	}
> =20
>  	node->parent =3D parent;
> -	/* Also works if key =3D=3D parent->key. */
> -	if (key <=3D parent->key)
> +	/* An equal key goes right, after the existing ones. */
> +	if (key < parent->key)
>  		parent->left =3D node;
>  	else
>  		parent->right =3D node;

