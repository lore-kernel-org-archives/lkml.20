Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793576843;
	b=g2GqjcdMDZxnSduyOMBXMW35Jtu1Ir5p8T/cgwJVCmjYPFUR3YuwhgsR4UGG0NIlYTVR
	 nM8sBk5rsHQF76xnqaBFPyptzkqZDaWfkbWLuXHYt0RQT2FZwnGJdu3G4y0T5BJrWWBtf
	 Kt9p3aOhrFXrLA8Oy9U2bSfo0idhEI2pdf0/vch0Eo82OrWRQOaJ1Ehk/v/fo3ARkq0M5
	 A1yL3b7H+VE7orUmSD40TOoDe+rS/rLM4fosHChGAaNwHvmQGX9D77zE+fOKv7Mv7VDIM
	 Icf3uNIDKvdG9T0Qp4YHx4/YF9HpXRB4/Ki5cclGT5sLsi+GbPqtNa7+aFsTIQROIKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793576843;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=NGKq3X08/HBTqu+TtIKLeW2xAMA2Xfd1c0mdem9B3G4=;
	b=MmfiDIFJwmrRdSarWoWJRPbhtz9xyQMpsLpqmS0jaBHxJVpCGbHu92lK34gsHyYbs4IP
	 +1/wy8o8BIpUvIs8RW3pCd2lp2589VqtOAA2Dcdg7+zqGnpD/pJuJCr0nCpm6fkBnKQsM
	 McCF0pAZlns7JpJmellZrzwjH/56px6My58OvPBNxjp3+Tb1MM9Sk4T0r0jslqqnzuSPh
	 vT40L3aFsLrfRDmuAQcul+AcfJlOIdOpnvW0i1B0J8c15GjeetsmXebK0jwGn1t+NceJG
	 0GydrGvjigwz8E12bMGaVKP1s7MZzTJ5dhnqtI+6NZsd4vIv31zg/T9fFdOptbjRUxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=gO6egM5N;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F22606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 23:47:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54F22606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=gO6egM5N
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36a315ed211so2984406eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 15:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793576842; x=1794181642; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NGKq3X08/HBTqu+TtIKLeW2xAMA2Xfd1c0mdem9B3G4=;
        b=gO6egM5NJuQYZPMiU0+/bMwq982NOFOx5ZBRm/m8n6eBE9LZScKWp17tyPJZ82towm
         egf1SqbGBXIvX68NO72iNDS00WWtyNLU+3uSazBjTUKX27rNwOpK2srUpLblKYVVELrj
         TQ1/0lw+noLTxdBj+FHeCrDURQovYgVgz39U8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793576842; x=1794181642;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NGKq3X08/HBTqu+TtIKLeW2xAMA2Xfd1c0mdem9B3G4=;
        b=CKBZTGSaDUNlrMU6zhCyOv7BEs0AHULVXrWu2dVer+nls8iqavP8GkBi4LEbMhGQw5
         8cMBn9m7offFYUga8dNO3z03BZgUOma6kR7rdrObZXx6g4igLDdFYcVLUEQ/76IVJSGc
         Via1mshV/KVx6EgICUA02XQu6lYfDPFQ4OPmizSglPYteuXw1ES4WvPuB3XKy2Eijkdc
         FeID87jQHgsLaOQqnw2HOHVUcoE2CgFBvaPv7HbB8g+PtXr9l9uRlTInKFBR+Z753Eny
         0sXwt2s7yHK2uI8v5ipn0Ll6jj3+HVh0fWjd9LOsRGDyyxgcdKd0hISkdey97wbV5Nat
         shdg==
X-Forwarded-Encrypted: i=1; AKwUvBxAVqPqtWVsN/IZeUJr1O1aGgcgSmwBlN6KAy0cqPPBuxckgn/mvs/22zNAmQORYAUE3MomfOfihoNyfOI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CxM2nDREZaEQTDcWGIQ/F2adXhXgrqWuTb+gp4146h52033/1
	nXHFL1VonzW6sQICEDvOqIdm1lEWasMn8IFWMCpPKl502jG9sc5ujG28ReZJK6zU9Q==
X-Gm-Gg: AYBFou0lBLIUhagxGUtZR7VrQg1muiZ7w1WnGSmg4FqQhFCiONP2srxpAG8U5ywXZ9h
	O16XHcRB5sgKZuIVMewK8Y1EsKEAGOu0zVg9txrTqvnJNYQyRfep7KOr8AJzqkMS0+Bg/PMF51A
	MdYhJPqb2JCkhzTGZgPhfbulORDEp5gPHBRtO7JX33fvKaLjc0g8NIEh4UhhzwGFP068arjEcZ0
	uEtvYVR1VY6NCoaKfneQDFcGJrCHwWnUlyiWy8YeWpW3LU7W4+UB8vaMX6PgHjfwMfrtZO5WFF0
	3XDzZi93LxRxMwLwMW7USGCHJ3bJIofuoC6ZREVuLv5odOIDEB3T3thdWx41maPQroiw3lpneYN
	FY7mlY3mAtXxjCffn58AjZjTsfTO10IaVRT1n9cUiaARYvG0c6twO/8E4/U/Ef6KQcT9pD13rVr
	dfqBn4X/S63cXZHMsfJ+05emuRSu+GGTZWQmj/2VYwZUcB0UtaVToZbf9fKw3BP5w1RgVJdGr6b
	PyOLtHyaDu1lT3dnAw0reDY3ApNdoGi4qoVfM7DOqz9fY2OAjjsvn2n/uXwGwb/dR56AsZIjQzw
	DMjzHiBDe49VLY0GMd52E942SLiXV57rxJYK7R0tfLoJlky3ZPLBBho9eSabbKvGRrkE
X-Received: by 2002:a05:7300:f40c:b0:351:606f:2832 with SMTP id 5a478bee46e88-36a42340896mr11385000eec.3.1793576842036;
        Sun, 01 Nov 2026 15:47:22 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:2bf9:d7d2:dcf1:c2a2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42662f23sm35840147eec.2.2026.11.01.15.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 15:47:21 -0800 (PST)
Date: Mon, 2 Nov 2026 08:47:17 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Nhat Pham <nphamcs@gmail.com>, Xueyuan Chen <xueyuan.chen@vivo.com>, 
	Barry Song <baohua@kernel.org>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Chris Wiseman <chriswiseman@google.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Brian Geffon <bgeffon@google.com>, Minchan Kim <minchan@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	xueyuan.chen21@gmail.com
Subject: Re: [RFC PATCH 0/2] mm: zsmalloc: make shrinker compaction
 budget-aware
Message-ID: <aufPMirl4cD7tz0X@google.com>
References: <cover.1786003779.git.xueyuan.chen@vivo.com>
 <anVWZVOt-xeD0dMH@google.com>
 <47ed45b5-de67-41aa-aa21-a3ba3479a7cc@vivo.com>
 <anXJ-5_vO7-toSe1@google.com>
 <CAKEwX=Mm2tXcen-quRXHf1Y2qSHYvpEUe4xiw-mHYaJnRUR-EA@mail.gmail.com>
 <auKqt6b4AxCLziIH@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auKqt6b4AxCLziIH@google.com>

Adding Chris for visibility

On (26/10/29 11:26), Sergey Senozhatsky wrote:
> On (26/08/07 09:25), Nhat Pham wrote:
> > Hmm we'd need to collect more data in our workloads to determine, but
> > if we can compute compactable ratio (freeable_pages / total_pages) on
> > a per size class basis, can we just skip the size class whose ratio is
> > too bad? Would that at least cut down on the vast majority of
> > fruitless memcpys and lock acquisitions etc?

[..]

> ---
> 
> diff --git a/mm/Kconfig b/mm/Kconfig
> index afff1b25b543..72542946bc53 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -157,6 +157,17 @@ config ZSMALLOC_CHAIN_SIZE
>  
>  	  For more information, see zsmalloc documentation.
>  
> +config ZSMALLOC_SHRINKER
> +	bool "Enable zsmalloc pool shrinker"
> +	default y
> +	help
> +	  This option enables the zsmalloc pool shrinker, which allows
> +	  the zsmalloc pool to be shrunk when the system is under memory
> +	  pressure. The shrinker will attempt to free up memory by
> +	  compacting zspages and releasing empty zspages back to the system.
> +
> +	  If unsure, say N.
> +
>  endmenu
>  
>  menu "Slab allocator options"
> diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
> index 7ef80e0da626..e0d7ab9142bb 100644
> --- a/mm/zsmalloc.c
> +++ b/mm/zsmalloc.c
> @@ -276,8 +276,10 @@ struct zs_pool {
>  
>  	struct zs_pool_stats stats;
>  
> +#ifdef CONFIG_ZSMALLOC_SHRINKER
>  	/* Compact classes */
>  	struct shrinker *shrinker;
> +#endif
>  
>  #ifdef CONFIG_ZSMALLOC_STAT
>  	struct dentry *stat_dentry;
> @@ -2050,8 +2052,9 @@ void zs_pool_stats(struct zs_pool *pool, struct zs_pool_stats *stats)
>  }
>  EXPORT_SYMBOL_GPL(zs_pool_stats);
>  
> +#ifdef CONFIG_ZSMALLOC_SHRINKER
>  static unsigned long zs_shrinker_scan(struct shrinker *shrinker,
> -		struct shrink_control *sc)
> +				      struct shrink_control *sc)
>  {
>  	unsigned long pages_freed;
>  	struct zs_pool *pool = shrinker->private_data;
> @@ -2067,7 +2070,7 @@ static unsigned long zs_shrinker_scan(struct shrinker *shrinker,
>  }
>  
>  static unsigned long zs_shrinker_count(struct shrinker *shrinker,
> -		struct shrink_control *sc)
> +				       struct shrink_control *sc)
>  {
>  	int i;
>  	struct size_class *class;
> @@ -2105,6 +2108,10 @@ static int zs_register_shrinker(struct zs_pool *pool)
>  
>  	return 0;
>  }
> +#else
> +static void zs_unregister_shrinker(struct zs_pool *pool) { }
> +static int zs_register_shrinker(struct zs_pool *pool) { return 0; }
> +#endif
>  
>  static int calculate_zspage_chain_size(int class_size)
>  {
