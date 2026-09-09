Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E0C58038E
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 16:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788969807; cv=none; b=QiyyRqMDqaFdLKsFy5OGjtzm4WyCtiYXb2IuZB/K5WOIxwpUwFY5NM8mv0X3SRIsHWIpllSNqnmO9OLAh7FftMx8ONu2sDRMqc7uHWnSeGXOeMneQ6I0mZsWyq+OrXCLE9lDjG4hShKtA4g1h1GdXGgCRJ3UOI/w68uJo3BWOwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788969807; c=relaxed/simple;
	bh=On06xCFs+45Cv/iSsThW0gWQ416PGgEnZnw/69MIF+I=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YRFBa9DqQA2TbxA2lUIdPVlgEGQVwwxqvTD9wYmQWNIK0K4ZcCGWCw4Zs303gR1VlY0bLF7FUlfTY0oVDlFuTv8YaO3SdAiKrdRoocewLMpABCFjElvouTi/mr/+5W0rQ2dkTRfiRPgQVMqYJiCA/sExGnJCyA9XVNsLHuqDXaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AaoIAZgk; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AaoIAZgk"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4ab19127so497795d50.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 09:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788969804; x=1789574604; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AausXKsac6c2thgVaA1TemaODiOlglfugBkNliHU0Ak=;
        b=AaoIAZgkmSISKaCcKTIxCHIdkND4IT9Q1ovu4NYKJo0TUcHdKSzno+TuLODhIdvG9u
         OxCNAQyjSdpO4WZ9m7Saqgf7FT6WCQyqikjeK88v82zZgfkkIXaNu5VZncE4NojZvl+8
         t+mDRnwv3jg/NWJNxcQmoGewwG7tv1yrhyUeP1By1UmFvIX9hzOeBVODPr3AOQYn+lAZ
         YtLmOm79yBPvoERAXd4YCeAqH2ZEgkDLnsXrRg9PyjBykoB38ePuuCGyNmQCuqjYKTmt
         7acUuxnWpzAQKpxH90+ht8CxcCKZy8/nu0atr23IEB7lgORef8xBTSU3P3DR3iFWfHhH
         sZZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788969804; x=1789574604;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AausXKsac6c2thgVaA1TemaODiOlglfugBkNliHU0Ak=;
        b=GwK8toKR0CaRO5AOK/X4gNDowEqVplV7p2ZApddWGl+qVytCLyAR0Vv5UXrmVYUxac
         7WtlOWhk3z8CkPXBGurWH92RNdWZiilb/d24eqCkS+0SLfBQmpBq7Yqytn/JSRS3puMo
         dNz5suTYoqMAh9sJUCQIrEFs/WCdACqhPUHv161IV6IhQFbD3jMp0ftc9jC82jUYFfdq
         nLikM9/b3OiT3KzoqPa/OoPgm0yLs8Gkzp53HBiBK01wQkbB2cVBiey040cLbqxI8DCj
         SJU96oQ2hO8YfeMibB+LpEHgpWKu1XVX6MZjQyHk8FHj67BkkGBDiRLlQ/wk6hpXqWQE
         Gxqw==
X-Gm-Message-State: AFuF++ns8aq7rlF4rrT5vfxCsQKEZgqRnugFu+iRetYtw9qJk0K05+7D
	6XDpQ3LWgUounB6NjVJBbe4nqF6Ub2g987J/j7NOtfdZoRMnBIiFbGgL
X-Gm-Gg: AYBFou3WwCbj9dsgXVLe1uqL8vBy02Tzpj0DimfnvP7VQzvywNHpY8GEUfWciWVf/Q1
	+5wU5jdFf2Dg8Bbszq/8oaTQNGRQ0UG8oW+TGgJhtFsHhk0zksUYpBjZI7/PN7bSc7JHfPnkJu9
	6PK9GvmuVgCtPX5fyQdeuF43nlh2evkRq/Kwh+sRt3+fMUZS6XaJe6m2tiHNOltxHIbfopiazCO
	9BiquhP3YjHsxqTneIH7wWvlsmMyWQgwKDcvrt5SsSDZbP67Mlyyihf5pJkXD8LeQyRoHIIoNj7
	gaoPk2EVx3l/Qx204ChVERc7EuBQfmjJjnKUSVTKFtHEHEZP0qlMgiO+Y0RouaFnjVraLluZSIy
	qvAeoJ6E6N2/RN5ttPt/XUgb8b7sg70eU0Ig3yeDWlp0hH5nq9RoK6krFJiacKv4RXoFO4QOJ6o
	8nbThhneWjs0uJGbhl3f0jTcSHXZTEcKx2Y6nuU9L/WUZejlqShPI/MQ6ECH8pXvTVFZc3UX/Z0
	csJHcSgkSczJclsxpKgBg412Vzw
X-Received: by 2002:a05:690e:4188:b0:66e:ac6f:cdf with SMTP id 956f58d0204a3-6710feec5eamr676251d50.5.1788969803429;
        Wed, 09 Sep 2026 09:03:23 -0700 (PDT)
Received: from localhost (c-73-105-0-191.hsd1.fl.comcast.net. [73.105.0.191])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-87149ec0e68sm111794017b3.20.2026.09.09.09.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 09:03:22 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
X-Google-Original-From: Yury Norov <ynorov@nvidia.com>
Date: Wed, 9 Sep 2026 12:03:21 -0400
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, mingo@kernel.org, peterz@infradead.org,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	yury.norov@gmail.com, kprateek.nayak@amd.com, iii@linux.ibm.com,
	corbet@lwn.net, meted@linux.ibm.com, tglx@kernel.org,
	gregkh@linuxfoundation.org, pbonzini@redhat.com, seanjc@google.com,
	vschneid@redhat.com, huschle@linux.ibm.com, rostedt@goodmis.org,
	dietmar.eggemann@arm.com, maddy@linux.ibm.com, srikar@linux.ibm.com,
	hdanton@sina.com, chleroy@kernel.org, vineeth@bitbyteword.org,
	frederic@kernel.org, arighi@nvidia.com, pauld@redhat.com,
	christian.loehle@arm.com, tj@kernel.org,
	tommaso.cucinotta@gmail.com, maz@kernel.org, rafael@kernel.org,
	rdunlap@infradead.org, kernellwp@gmail.com,
	linux-doc@vger.kernel.org, jgross@suse.com,
	virtualization@lists.linux.dev, sunlightlinux@gmail.com
Subject: Re: [PATCH v13 02/13] cpumask: Introduce cpumask_intersects_and
Message-ID: <aqGDSeGGIfJvn8uc@yury>
References: <20260909135617.871006-1-sshegde@linux.ibm.com>
 <20260909135617.871006-3-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909135617.871006-3-sshegde@linux.ibm.com>

On Wed, Sep 09, 2026 at 07:26:06PM +0530, Shrikanth Hegde wrote:
> Introduce bitmap_intersects_and() to determine whether the intersection
> of three bitmaps is non-empty. Unlike cpumask_first_and_and(), this
> returns immediately when an intersecting word is found and does not
> calculate the first matching bit.
> 
> Add cpumask_intersects_and() as the corresponding cpumask wrapper.
> 
> A subsequent patch uses the helper to determine whether a task
> has a CPU that is present in its affinity mask, the preferred CPU mask,
> and task possible CPU mask.
> 
> Suggested-by: Yury Norov <yury.norov@gmail.com>
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>


Reviwed-by: Yury Norov <yury.norov@gmail.com>

> ---
>  include/linux/bitmap.h  | 14 ++++++++++++++
>  include/linux/cpumask.h | 18 ++++++++++++++++++
>  lib/bitmap.c            | 17 +++++++++++++++++
>  3 files changed, 49 insertions(+)
> 
> diff --git a/include/linux/bitmap.h b/include/linux/bitmap.h
> index 7df1573a409c..adafbcf2016b 100644
> --- a/include/linux/bitmap.h
> +++ b/include/linux/bitmap.h
> @@ -52,6 +52,7 @@ struct device;
>   *  bitmap_complement(dst, src, nbits)          *dst = ~(*src)
>   *  bitmap_equal(src1, src2, nbits)             Are *src1 and *src2 equal?
>   *  bitmap_intersects(src1, src2, nbits)        Do *src1 and *src2 overlap?
> + *  bitmap_intersects_and(src1, src2, src3, nbits) Do *src1, *src2 and *src3 overlap?
>   *  bitmap_subset(src1, src2, nbits)            Is *src1 a subset of *src2?
>   *  bitmap_empty(src, nbits)                    Are all bits zero in *src?
>   *  bitmap_full(src, nbits)                     Are all bits set in *src?
> @@ -181,6 +182,9 @@ void __bitmap_replace(unsigned long *dst,
>  		      const unsigned long *mask, unsigned int nbits);
>  bool __bitmap_intersects(const unsigned long *bitmap1,
>  			 const unsigned long *bitmap2, unsigned int nbits);
> +bool __bitmap_intersects_and(const unsigned long *bitmap1,
> +			     const unsigned long *bitmap2,
> +			     const unsigned long *bitmap3, unsigned int nbits);
>  bool __bitmap_subset(const unsigned long *bitmap1,
>  		     const unsigned long *bitmap2, unsigned int nbits);
>  unsigned int __bitmap_weight(const unsigned long *bitmap, unsigned int nbits);
> @@ -445,6 +449,16 @@ bool bitmap_intersects(const unsigned long *src1, const unsigned long *src2, uns
>  		return __bitmap_intersects(src1, src2, nbits);
>  }
>  
> +static __always_inline
> +bool bitmap_intersects_and(const unsigned long *src1, const unsigned long *src2,
> +			   const unsigned long *src3, unsigned int nbits)
> +{
> +	if (small_const_nbits(nbits))
> +		return ((*src1 & *src2 & *src3) & BITMAP_LAST_WORD_MASK(nbits)) != 0;
> +	else
> +		return __bitmap_intersects_and(src1, src2, src3, nbits);
> +}
> +
>  static __always_inline
>  bool bitmap_subset(const unsigned long *src1, const unsigned long *src2, unsigned int nbits)
>  {
> diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
> index 4c8bb6953107..7c8f16797f94 100644
> --- a/include/linux/cpumask.h
> +++ b/include/linux/cpumask.h
> @@ -824,6 +824,24 @@ bool cpumask_intersects(const struct cpumask *src1p, const struct cpumask *src2p
>  						      small_cpumask_bits);
>  }
>  
> +/**
> + * cpumask_intersects_and - (*src1p & *src2p & *src3p) != 0
> + * @src1p: the first input
> + * @src2p: the second input
> + * @src3p: the third input
> + *
> + * Return: true if AND of the three cpumasks is non-empty,
> + *	   otherwise false
> + */
> +static __always_inline
> +bool cpumask_intersects_and(const struct cpumask *src1p,
> +			    const struct cpumask *src2p,
> +			    const struct cpumask *src3p)
> +{
> +	return bitmap_intersects_and(cpumask_bits(src1p), cpumask_bits(src2p),
> +				 cpumask_bits(src3p), small_cpumask_bits);
> +}
> +
>  /**
>   * cpumask_subset - (*src1p & ~*src2p) == 0
>   * @src1p: the first input
> diff --git a/lib/bitmap.c b/lib/bitmap.c
> index ed685127a107..d1cb8a507c60 100644
> --- a/lib/bitmap.c
> +++ b/lib/bitmap.c
> @@ -308,6 +308,23 @@ bool __bitmap_intersects(const unsigned long *bitmap1,
>  }
>  EXPORT_SYMBOL(__bitmap_intersects);
>  
> +bool __bitmap_intersects_and(const unsigned long *bitmap1,
> +			     const unsigned long *bitmap2,
> +			     const unsigned long *bitmap3, unsigned int bits)
> +{
> +	unsigned int k, lim = bits / BITS_PER_LONG;
> +
> +	for (k = 0; k < lim; ++k)
> +		if (bitmap1[k] & bitmap2[k] & bitmap3[k])
> +			return true;
> +
> +	if (bits % BITS_PER_LONG)
> +		if ((bitmap1[k] & bitmap2[k] & bitmap3[k]) & BITMAP_LAST_WORD_MASK(bits))
> +			return true;
> +	return false;
> +}
> +EXPORT_SYMBOL(__bitmap_intersects_and);
> +
>  bool __bitmap_subset(const unsigned long *bitmap1,
>  		     const unsigned long *bitmap2, unsigned int bits)
>  {
> -- 
> 2.52.0
