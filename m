Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793659892;
	b=3LoJcSuoEoJil9DO8FzAngFIBAXMvTrZSZWbwmxcF4x282lx2OrzYAiG4QdBi6FGgAku
	 y20CUJ08fzok9D9u+9MaWP34DQocHLQUG98jNDs66Cn/ODtu7jtlbcKQGKMq3XvM5+JjU
	 mZ1BKEfXuCC0PpPaCGhELfuvjAH0ugMe/Ds7QOYPKRCQ1Ox1nq9DSNP7VLydtlXBs7pEI
	 262AwqjeK9gOuKm85iCEGjsmE396x/JmtSu/Jj1dGeNr/aG/dVk0/vjdJCptRF5UVfyVD
	 gu9ZmeDt/+zwlX+/pry0Pr3yaOfrtcWocNjrlCmXw0vV/bxC/rj/E5R1kkUgW/qGMqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793659892;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=o11cGTx98E2DDz5CDEing/Hr1U0sbD9iaRaNIFkA1rw=;
	b=HSptISzkxYMmA0xoFmNoFw5zjCCz4q0aViYwZdpJEw+2trntnCA8sCILBgp4oucAEoYf
	 R+yMNGhe/7msg5kAiaKPg2lJ9cGdHOLX4aaQSxpErQGuaCsZrqjU9aR9IfEpQ4seJDKM+
	 SUIFLLwQJqPry0FVqB5lnE8sm5DqPyyH5Fzs74uNC5mbvyuNh/p7Qs8cjTa5Qf2NN1ysf
	 +2dLXiA4c7HU34z6xXQP57PJHNJ+w5D0AuOw060WZ/x5FEBdhxq+EWaR5nJZn2Bab9CHV
	 HXgT3Lr0HhRkJcIquOsT4nh1e9ChS9/y945celLGlfY/o/n4mSpyo1X4hQ+XB1uXDfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XGB+E9rl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0571606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XGB+E9rl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DA1F1F00A1D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793659891;
	bh=o11cGTx98E2DDz5CDEing/Hr1U0sbD9iaRaNIFkA1rw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=XGB+E9rl85ndvpOjs4EMC0Ia/f8CQT06ltuHxk5uVtkYv0uMPUib/aGNF28dpT1pp
	 uaOdmMGIJPTzhKt5P/fPewFSV9u8F+2BHB9DDiIcKyNRxULEk4WNC9l1lTTsLCpKGT
	 0s978GFfY/scW59vFxXUynjsfi/Lndh5nv+2mj2Dq4T6zDebWDT7E0O3Xwsqvkgunj
	 dRfHWGvEzX4CNPjRnK9PwP/3DI8UmtI2+i3cJb4S+WqnnWcI2FLMvIHs4sHRyaL4wB
	 U53A6kvp9By74CSpVVFkHgEh42tDiAbOjzgD7xRf2IVurnPD9PNuK9t1ythOWBED8N
	 /y9xpWZkiuM2g==
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-93f1ca4132bso341722785a.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:51:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBx2d08vt0hV7pp/+X9KGR6OEVPY4XLMl9axgZ83xv6akJ8wMZj1G07ko1pFE+2L4WNYLaELccpp+7IlncU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgzUR3oBGANqtuIm5fq9hC/dXIyFRlgGUvydGC+CDeuuXpZx2j
	cOFPN2xYRJ7rQTUkY2hoBDpG4UxJ7ZKIxELpHt/pUYkIJu7wFbw3xK/4LC2Ng5D3o55ZAULcTs+
	uav6l7WWmfBAogeav0tLn2w4AYlqS9sA=
X-Received: by 2002:a05:620a:4686:b0:939:feaa:949c with SMTP id
 af79cd13be357-944216bc9f1mr1944548985a.36.1793659891015; Mon, 02 Nov 2026
 14:51:31 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026202313.63122-1-sidchintamaneni@gmail.com> <20261026202313.63122-2-sidchintamaneni@gmail.com>
In-Reply-To: <20261026202313.63122-2-sidchintamaneni@gmail.com>
From: Barry Song <baohua@kernel.org>
Date: Tue, 3 Nov 2026 06:51:19 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zVpHAGM=Sz8J+5PFv3H54CyVdpcp6cpVK+rQ5f82Q1EQ@mail.gmail.com>
X-Gm-Features: AclHuK_8xiI6y2UqHKoW4hz9iTIiB89wZy7B__Rr_i9Lirevyw1FRNqhQ2staT4
Message-ID: <CAGsJ_4zVpHAGM=Sz8J+5PFv3H54CyVdpcp6cpVK+rQ5f82Q1EQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mm: multi-gen LRU: use mem_cgroup_lruvec() in get_lruvec()
To: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org, david@kernel.org, 
	mhocko@kernel.org, qi.zheng@linux.dev, shakeel.butt@linux.dev, ljs@kernel.org, 
	kasong@tencent.com, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, baoquan.he@linux.dev, baolin.wang@linux.alibaba.com, 
	yuzhao@google.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	apais@microsoft.com, rlmenge@gmail.com, 
	Hardik Garg <hargar@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 4:23=E2=80=AFAM Siddharth Chintamaneni
<sidchintamaneni@gmail.com> wrote:
>
> Andrew Morton noted that get_lruvec() has the same pattern as
> lru_gen_shrink_node(): when memcg is disabled on the command line
> (cgroup_disable=3Dmemory), it returns &pgdat->__lruvec directly instead o=
f
> going through mem_cgroup_lruvec(), which initializes lruvec->pgdat.
>
> In practice all callers of get_lruvec() run after kswapd_init() has
> already initialized pgdat->__lruvec.pgdat on every N_MEMORY node, so
> this is not a runtime bug. Have get_lruvec() delegate to
> mem_cgroup_lruvec() directly.

Somehow, I feel this changelog is a bit weird. The earlier
description doesn't really justify the final sentence:
"Have get_lruvec() delegate to mem_cgroup_lruvec() directly."

Can we change it to the below?

The patch was initially developed to address a possible NULL
reference [1].

Andrew Morton reported that get_lruvec() has the same problem as
lru_gen_shrink_node(): when memcg is disabled on the command line
(cgroup_disable=3Dmemory), it returns &pgdat->__lruvec directly and so
bypasses the initialization of lruvec->pgdat. The MGLRU debugfs
interface calls get_lruvec(), then dereferences the pgdat pointer in
lru_gen_seq_show() and other paths, so these can hit the same NULL
dereference.

In practice, we found that this cannot happen, as all callers of
get_lruvec() run after kswapd_init() has initialized
pgdat->__lruvec.pgdat on every N_MEMORY node. Therefore, this
is not a runtime bug.

However, it would still be good to clean up get_lruvec() by
removing the MGLRU-specific code and having it delegate
directly to mem_cgroup_lruvec().

[1] https://lore.kernel.org/linux-mm/20261017050928.128582-2-sidchintamanen=
i@gmail.com/

>
> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
> Signed-off-by: Hardik Garg <hargar@linux.microsoft.com>
> ---

With the changelog updated as suggested,

Reviewed-by: Barry Song <baohua@kernel.org>
