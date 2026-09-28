Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F4E3644C9
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 01:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790558302; cv=none; b=jjG+6yX7MuFE84eA0r6rNoXmc0FJAB/Wg3BPBm1ubNg/yvm9TLstp4y4yrbFPlOXr+AbhymD0LV1fO1RD0rHMHZlmPzkMlIwIlbaOljqTDQdTjqrU0I4u1GFrgvypYjJOj9TBdj8V1BuxrD2MN6xqaPTJDvpH24/aYtRGWGkFBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790558302; c=relaxed/simple;
	bh=PdrNDQOCBv9Wg5hE6jv+1bfhcXsylvoaCMakOXlldRI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ui54YQsq1lV6slXoaW2yBlIXutcR7cC/C+rUY1FJokeGyJ1STOEiCBuhEXfc32KV3/NUb+UMsmRGTvZWFg1iW5nKvxBHWPVgh3m2+ucPJ9jkJ8hxw5Thc6yBw+oMJTPRPvuy6LwhjYJTuG43LnV0onqLhwPStgzC3HSrubw5PDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cMcGBYf7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cMcGBYf7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 488FF1F00898
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 01:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790558290;
	bh=GeSgmECTKuaHk2+F7oGmV2w3CiTIst6U8AwDjonsHaI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cMcGBYf76yqYpZ9sQKYtcmVuUMn8uo6Zc7rHTHrTNOnyiLl8c6gBo4tqVCpOB/4XA
	 6c4kDp5oY8dIfhTBNtXr+bKRNl83w+Y7wkaSDPYy+xDJHIBaaF3A2/wNIcTdajLjMc
	 E/qIvUxcjFQtGVylSWr33Y1yINdYHQ1MxfSnaqAM82Bk8CepWzdafczOz71I0pd2i3
	 FGrHWoMLAPw+joZR8C2gzOhgpEa9dEEUrSeeUZ85hSE4KDUKhoZALNv72yniZuqU44
	 1dgownxL+7kNaYLONEbhxUHl88ij/LDI2mCScuGKvcipkFBq1jBgpHn0soX0jTctA6
	 RIsG7xt/Z/N6w==
Received: by mail-ed2-f34.google.com with SMTP id 4fb4d7f45d1cf-6aaea178c96so2766104a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 18:18:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw8073h/Zg3SOt3tX6VK7dsRL7R0VC+cXgpJd97jQQKuid6sGR3nZ7D+KMe4G3wVlo+zpPer9eXXPRJEXg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMqjMN3Loy1uT8CAngd2g0F7cDCU70eHt40X/qR8tKG6nYSTpZ
	en4ifYlWWjUFWCGjQqg9oJFr8UZttT5QOWWOzUvBRMwI0osSqssenpNsbO7OqRcsc4/J+6NieMo
	psAvxKNN6lJ1srNbCFid00QasnthtJAdeGBKP14iCTg==
X-Received: by 2002:a05:6402:535a:20b0:6aa:e9b6:411d with SMTP id
 4fb4d7f45d1cf-6aae9b643e6mr4835243a12.35.1790558289196; Sun, 27 Sep 2026
 18:18:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916101929.149106-1-hebaoquan@kylinos.cn> <20260916101929.149106-3-hebaoquan@kylinos.cn>
In-Reply-To: <20260916101929.149106-3-hebaoquan@kylinos.cn>
From: Chris Li <chrisl@kernel.org>
Date: Sun, 27 Sep 2026 15:17:58 -1000
X-Gmail-Original-Message-ID: <CACePvbUD7rQ1=638nzku7mdu08BK0cg1aEX+2jJT+WDJ4PUV0w@mail.gmail.com>
X-Gm-Features: AclHuK9lbaxxfRu9uT3RykRdEUPVHrPVty2eqURRDIMaSXYeT4wqg8fVhgKsuec
Message-ID: <CACePvbUD7rQ1=638nzku7mdu08BK0cg1aEX+2jJT+WDJ4PUV0w@mail.gmail.com>
Subject: Re: [PATCH v3 02/14] mm, swap: add CONFIG_XSWAP and xswap fields to swap_info_struct
To: Baoquan He <hebaoquan@kylinos.cn>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, kasong@tencent.com, 
	nphamcs@gmail.com, baohua@kernel.org, youngjun.park@lge.com, 
	hannes@cmpxchg.org, yosry@kernel.org, shikemeng@huaweicloud.com, 
	chengming.zhou@linux.dev, baoquan.he@linux.dev, david@kernel.org, 
	linux-kernel@vger.kernel.org, kunwu.chan@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 12:19=E2=80=AFAM Baoquan He <hebaoquan@kylinos.cn> =
wrote:
>
> Add CONFIG_XSWAP Kconfig option for extendable swap device support.
> It depends on SWAP && 64BIT && ZSWAP, since xswap devices are backed by
> zswap, and on SYSFS, which is currently the only way to create one.
>
> Add three fields to struct swap_info_struct under CONFIG_XSWAP:
> - cluster_vm: the VM_SPARSE vm_struct backing the cluster_info array
> - nr_clusters_max: total number of clusters in the xswap address space
> - nr_clusters_mapped: number of clusters currently mapped (lazy grow)
> These fields enable lazy vmalloc-based dynamic cluster management.
>
> Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>

Can you fold this with the following patch? At least the struct
members should go with the next patch.

It seems nobody use those data structures in this patch anyway. So
this patch alone has no visible value add, other than adding the
config file.

Chris

> ---
>  include/linux/swap.h | 5 +++++
>  mm/Kconfig           | 9 +++++++++
>  2 files changed, 14 insertions(+)
>
> diff --git a/include/linux/swap.h b/include/linux/swap.h
> index b4331ca4759a..b7882aac1eab 100644
> --- a/include/linux/swap.h
> +++ b/include/linux/swap.h
> @@ -242,6 +242,11 @@ struct swap_info_struct {
>         signed char     type;           /* strange name for an index */
>         unsigned int    max;            /* size of this swap device */
>         struct swap_cluster_info *cluster_info; /* array, one entry per c=
luster */
> +#ifdef CONFIG_XSWAP
> +       struct vm_struct        *cluster_vm;    /* VM_SPARSE area for clu=
ster_info */
> +       unsigned long           nr_clusters_max;/* total clusters in the =
xswap address space */
> +       unsigned long           nr_clusters_mapped; /* currently mapped c=
luster count */
> +#endif
>         struct list_head free_clusters; /* free clusters list */
>         struct list_head full_clusters; /* full clusters list */
>         struct list_head nonfull_clusters[SWAP_NR_ORDERS];
> diff --git a/mm/Kconfig b/mm/Kconfig
> index c180d40cd671..5d6c7845c422 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -122,6 +122,15 @@ config ZSWAP_COMPRESSOR_DEFAULT
>         default "zstd" if ZSWAP_COMPRESSOR_DEFAULT_ZSTD
>         default ""
>
> +config XSWAP
> +       bool "Extendable (virtual) swap device"
> +       depends on SWAP && 64BIT && ZSWAP && SYSFS
> +       help
> +         Adds support for extendable swap devices (xswap) that decouple
> +         PTE swap entries from physical backing storage. The cluster_inf=
o
> +         array is backed by a sparse vmalloc area that grows and shrinks
> +         on demand, avoiding static pre-allocation overhead.
> +
>  config ZSMALLOC
>         tristate
>
> --
> 2.54.0
>
