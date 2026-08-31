Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839DF46C830
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788189633; cv=none; b=ms1lnG/t5rH5bwXRxVYyJQRN3HHdwbbQouNfm4O2xiA96fmC0Q8xQRwsTLRBicp1ZpZ51/IG4rqJ4QixaU6osejvjg1mcNZFuMEmqJdaQcLNKi2VtI28vX5EwapT4KY7qLGrCSdgRbL8uIuXEYAu+tqipxOHEQ09ev8I6AQv4B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788189633; c=relaxed/simple;
	bh=avelS9yxwBCzLqnCFBVGEpqk6z5pwt8rF+j41/ET888=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jMAgS1+2wx2f0ZZ99rx0KJEIsfjyHaf3/pmWK7+kjnvgxSgMyDzf8matP91jdOmFhWgUTqscMJkkW8oOZz/5chgVJW6iHwO8T+35R+DO6a11iGX+LAdaRcFZMEGDoSVG+ALYHx3zVEOMiMZnFvBDWtbw8AOH271C8E//4D+zGIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iypM/nne; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iypM/nne"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64EB71F00ACA
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788189632;
	bh=6JFS2kLm337yb3dQKB2DDrEUSXPoA2CmSEWj9anOX3g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iypM/nneyqTV8PgsspEKnf2poc5c/P9qC9IxC2HCr38g3z5G/mIEQrrL/fiuumO1N
	 r5uFBdQE/LmbI0lKGrtyud/v+OTzbgepB4R1uEQmtZ380KdTWY8iuc7tFtgC1GfYiO
	 BPWAf7ZyJsi51rlImpK83UyKd2pe/cGQanlcZxptck+2ruvnCCEeR7Cv5oJtVcvgxj
	 wOuF3b6qjEQZqulPNGbK2sAnxNBE8OaXu6m9lJUiE/2vbOmJ81YBsGnVNIsp7PHdyA
	 +L3P00j+BmRSKQNJOQYeXWGfCLF95nWLEsw9xCHPA48QW/eBSoAY9Q/Qxuc0o0999J
	 QHeMnHz8uyRhQ==
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a156627e22so8255919a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:20:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoWlULjvgJljoKyUfKNQaOmf5XMlodA1rzj2P+m5yBCxT4Jm2/Kj3zfI3B5tDlhcIta3Tgwj+JBp3tBSdU=@vger.kernel.org
X-Gm-Message-State: AFuF++lM0OGLmEEImWWwmITc3s3SUchAzP2s6GISDB4GJShBhy+UkI2L
	zC4nIx09eBX8KrYaid8R3DeiGcdqRRo82+IQ1FWIeDhiSB4s7GuQ4PZesDMkpi2SCLyqti+qfcn
	/oJyh2PymPvT23otOWe/qaigyERWJ8F4=
X-Received: by 2002:a17:907:930b:b0:c12:8a:7d7b with SMTP id
 a640c23a62f3a-c25966a3bb1mr478179866b.1.1788189631212; Mon, 31 Aug 2026
 08:20:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260830114731.8322-1-wujianyue000@gmail.com> <20260830114731.8322-2-wujianyue000@gmail.com>
In-Reply-To: <20260830114731.8322-2-wujianyue000@gmail.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Mon, 31 Aug 2026 08:20:19 -0700
X-Gmail-Original-Message-ID: <CAO9r8zPYZqZ9UsSU9xVcB6=m-uTkucSoPvA5xCB=mMrb9yVD_w@mail.gmail.com>
X-Gm-Features: AcwNN1UIzSfb5LeEBaceBs3HLojJ5C16n921xYexG7UOvAbwQ2-o_vxM5QWB-3s
Message-ID: <CAO9r8zPYZqZ9UsSU9xVcB6=m-uTkucSoPvA5xCB=mMrb9yVD_w@mail.gmail.com>
Subject: Re: [RFC PATCH v4 1/3] mm/zswap: release retired pools via
 queue_rcu_work() instead of synchronize_rcu()
To: Jianyue Wu <wujianyue000@gmail.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Nhat Pham <nphamcs@gmail.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Chris Li <chrisl@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 30, 2026 at 4:47=E2=80=AFAM Jianyue Wu <wujianyue000@gmail.com>=
 wrote:
>
> When a pool's last reference is dropped, __zswap_pool_empty() removes it
> from the pool list and schedules __zswap_pool_release(), which calls
> synchronize_rcu() to wait for readers before tearing the pool down.
>
> synchronize_rcu() is a synchronous, potentially long wait.  Replace it
> with queue_rcu_work(): __zswap_pool_empty() hands the pool to
> queue_rcu_work(), which waits for a grace period asynchronously and then
> runs __zswap_pool_release() from a worker for the sleepable teardown
> (__zswap_pool_empty() can run in atomic context and must not block).
> The grace-period guarantee is unchanged; the retirement path just no
> longer blocks on it.
>
> Suggested-by: Yosry Ahmed <yosry@kernel.org>
> Signed-off-by: Jianyue Wu <wujianyue000@gmail.com>

Why are the patches still tagged RFC?

Anyway, with one nit below:

Acked-by: Yosry Ahmed <yosry@kernel.org>

> ---
>  mm/zswap.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/mm/zswap.c b/mm/zswap.c
> index 37f34e406c8e..0bb30e58950a 100644
> --- a/mm/zswap.c
> +++ b/mm/zswap.c
> @@ -155,7 +155,7 @@ struct zswap_pool {
>         struct crypto_acomp_ctx __percpu *acomp_ctx;
>         struct percpu_ref ref;
>         struct list_head list;
> -       struct work_struct release_work;
> +       struct rcu_work release_work;

Seems like the convention is to use rwork in the name instead of work.

>         struct hlist_node node;
>         char tfm_name[CRYPTO_MAX_ALG_NAME];
>  };
> @@ -379,10 +379,8 @@ static void zswap_pool_destroy(struct zswap_pool *po=
ol)
>
>  static void __zswap_pool_release(struct work_struct *work)
>  {
> -       struct zswap_pool *pool =3D container_of(work, typeof(*pool),
> -                                               release_work);
> -
> -       synchronize_rcu();
> +       struct zswap_pool *pool =3D container_of(to_rcu_work(work),
> +                                              typeof(*pool), release_wor=
k);
>
>         /* nobody should have been able to get a ref... */
>         WARN_ON(!percpu_ref_is_zero(&pool->ref));
> @@ -406,8 +404,8 @@ static void __zswap_pool_empty(struct percpu_ref *ref=
)
>
>         list_del_rcu(&pool->list);
>
> -       INIT_WORK(&pool->release_work, __zswap_pool_release);
> -       schedule_work(&pool->release_work);
> +       INIT_RCU_WORK(&pool->release_work, __zswap_pool_release);
> +       queue_rcu_work(system_percpu_wq, &pool->release_work);
>
>         spin_unlock_bh(&zswap_pools_lock);
>  }
> --
> 2.43.0
>
