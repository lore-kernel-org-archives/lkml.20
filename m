Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EE237D110
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 05:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790575133; cv=none; b=FFrgmX9zz/cI+o95R2mpD8ty5nbnrvRhJuGrhyJXEhuOVQZW+bG8USdwXiqHAAcolkeNVRJXCfi56bPWyDX9lrbe2rLZ8yZTvQTznT6QFlYLsDT9iFs+QaVeVK/jNMMl6qpaZGuTXryCopOm7r4qQZR7RDuRcO8enlgklINobJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790575133; c=relaxed/simple;
	bh=b2SOxY6IlRw72YGf7IGDV0f1H0AvrYKkaImEuwoiuNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oBW8nObnO9fLhoXYMnatVUuv1ZQ6nKNA+mN58YQMCj8foaOiV5cnuXUltt4Jd6KAAgVNzRzxqmL/9C5MrrOCKqeA0xdmc9x9ZjyjT4KpGEo9iXLjyjfdv7GZYhK2SnvMzByeuCWQ1/Xt5Z1Z4sSSYLTm9vrPWUf8OXaBmXPep94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E6H60ywS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E6H60ywS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27FC41F008A1
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 05:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790575132;
	bh=srfQqHtFz8qMgjHgFSb/Ele5F879D92XNe4pdLC/vrE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=E6H60ywSuN/2sAFIcIxAUdPMZAiZE06BrzymPjID8yGUFso2aOFQ5k0t0MUU9hRp9
	 itAW8DxYkJapAKCmagEuE0pxpOvIJ03MBuJEH3IuKZ11OKfqAN0fNi8w4e8gpCc8XF
	 GJtj00SX/Fzz3MEwmXFtzLMrdSDkxVp1iUbCX8j6TE5ZLkcKpzcr2jV+lpNjgNLfsX
	 7fR1LZonKIIrQqfCNK0MTsKQU5L/ulq5hGwcTSIR42NJ8tpMJ4eh6Z/UEkKC5xsWC7
	 IPjKU3CK8iF6WXs/emFI60D1rjzYENy90uqDPwmo8Yo6a5TuO9kJ4tPhTHhx56Sx/a
	 A1Axd42G3oYtA==
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c2940ff2313so166136866b.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 22:58:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByqq9lA2j5tRLTDyiMlOdeUVJ52TsgrBtqilc3poPVplAALqUCh+PQUV0ppYblqZL6iVDqytFnWbKVKhr0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJseRtqNnhnf0m3FszMpxXBak49RlssOI5cWtiPjv9CxiRGFG25
	Sf9DgIgkOz4AM69QA4bJFmRP1YPGMBjzO7FJlXCUf5UeLAC58XVMiDaoTg3UPuEBHklSi2XH6qR
	Rdp2O4lbzGxinmjnU2WT6Vr/Hae/n6SixvakJ+r6P4Q==
X-Received: by 2002:a17:907:960d:b0:c25:f7db:4bf0 with SMTP id
 a640c23a62f3a-c2ac238a8d0mr1079000666b.22.1790575130941; Sun, 27 Sep 2026
 22:58:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916101929.149106-1-hebaoquan@kylinos.cn> <20260916101929.149106-11-hebaoquan@kylinos.cn>
 <CACePvbUn4xBNkKBjyniG0TLb5bA8wGNBiJ77JTF8FDGN9EgCWQ@mail.gmail.com>
In-Reply-To: <CACePvbUn4xBNkKBjyniG0TLb5bA8wGNBiJ77JTF8FDGN9EgCWQ@mail.gmail.com>
From: Chris Li <chrisl@kernel.org>
Date: Sun, 27 Sep 2026 19:58:39 -1000
X-Gmail-Original-Message-ID: <CACePvbU9PfTuVqzsJisa3S9DX7AssaUCRT2qk=tj83ACGUobXA@mail.gmail.com>
X-Gm-Features: AclHuK8Nttla48_gCpAztfqY5DyhHBX_oGqq8i1YtMK7SH7KobM-TpczZoxSPGE
Message-ID: <CACePvbU9PfTuVqzsJisa3S9DX7AssaUCRT2qk=tj83ACGUobXA@mail.gmail.com>
Subject: Re: [PATCH v3 10/14] mm, swap: refactor swapoff and add xswap_destroy
To: Baoquan He <hebaoquan@kylinos.cn>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, kasong@tencent.com, 
	nphamcs@gmail.com, baohua@kernel.org, youngjun.park@lge.com, 
	hannes@cmpxchg.org, yosry@kernel.org, shikemeng@huaweicloud.com, 
	chengming.zhou@linux.dev, baoquan.he@linux.dev, david@kernel.org, 
	linux-kernel@vger.kernel.org, kunwu.chan@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 27, 2026 at 7:40=E2=80=AFPM Chris Li <chrisl@kernel.org> wrote:
>
> Here you relocate the swapoff function and causing a lot of diff
> context due to the code movement.
>
> I move your swapoff code back, right after
> flush_percpu_swap_cluster(). Then the diff is much cleaner around
> swapoff.
>
> For example, here is what the new diff showed:

I am sorry I messed up. Please ignore my last email comment for this
part. It is still benificial to have the swapoff function move after
flush_percpu_swap_cluster() from the diff point of view. II messed up
my patch by relocating the `pweroff` function in the wrong patch.


> SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
>  {
>         struct swap_info_struct *p =3D NULL;
> @@ -3391,6 +3393,11 @@ SYSCALL_DEFINE1(swapoff, const char __us
>         spin_unlock(&p->lock);
>         spin_unlock(&swap_lock);
>
> +#ifdef CONFIG_XSWAP
> +       if (p->flags & SWP_XSWAP)
> +               cancel_work_sync(&p->xswap_shrink_work);
> +#endif
> +
>         wait_for_allocation(p);
>
>         set_current_oom_origin();
>
> It means we will need some swap_ops->swapoff() for handling the async
> workqueue canceling.

Never mind the above comment.

Chris
