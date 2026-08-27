Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006E2328243
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 06:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787813964; cv=none; b=LP02uprOXy1fd+K90SY3lfKIS9MPCYxj8MG9Ec+0o7tevpXYjqJEkal4hW+Vb5EaYBiLcMkrOdSWagZLUCQSnvUO0vs6GEpQMvTKJowFuUN3qSiFbi5DlJYjUtfSnVBKtWwx+3k4O4S6bhCzbOmG3H/kGV/YF9M71m5d32cSyHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787813964; c=relaxed/simple;
	bh=8muSqko//3OVtfdLNuksgmorMVqiZ3PVqVWHx37Bpjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t11QYqgWBRG1EjmufpLYzV7uEQs1Bd5r05Z+XlvzNAWUKkWHo5DjA4rQcQKkfrSByrl7e+ZcNpgqQt2LoyvrwoviSMoETXMFkHKF3CqVCYgqRCd1HTtJzIvXHUjbbbpu7469/jHQZ0N3lsWCbYZLjSb611QV4Ah7k7S4eiUQa4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ht5G6c8r; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ht5G6c8r"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8534d507f59so2060233b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 23:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787813962; x=1788418762; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5mb0Gi5n7+TH6iAOQaM9yonjDSHlXqjUCGPV+z43Vvo=;
        b=Ht5G6c8rIezz3bUm58T6kxjt7N480v7/Ww0Uv0jQI62ZVZdp5QPpUPEEfJ1Juvr0hD
         Iadwev+/rgRHarqg6H21aYzuVjUGBBBpIbeu6kBWuavT4AHUvdUQlG90UdyBerckbk9N
         04Fm/OybfWHDiVTyrqcQj17WSGBa7x6vR6Ywg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787813962; x=1788418762;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5mb0Gi5n7+TH6iAOQaM9yonjDSHlXqjUCGPV+z43Vvo=;
        b=TGs2zlZjR14cUO6dswrUWzuEirbacE1se58mIOrQF51KGAFmet32+gwpUURQlteYXk
         FZBTCxZa3q1w077yEf3GrZmqux/3w/L9dq+M+H4lxwR09b9F8VPFJaU8r1DpfZN8OlOz
         rTtlkjxhKFxvvRKz5LzRP+GrjB+lmJpApH1JbesrULxJMuQnrDf+w6Yn67NuL6rIST8V
         nt+IvEVrRv/6IL7aVS3Uj+5jWXwZrDG98EtHikM4LXFJbR1XT937kUjFW5gnOZUpqx0T
         mo2RHI5tAPNvAQwZ4poPHaQPVSpIk6jLRBIyySJ/KMTbd5Hyk0Dz+IfsohJQOrf93qbC
         XGnQ==
X-Forwarded-Encrypted: i=1; AHgh+RrBFFdtn38hlRi+VHK50U3tNX/3CO7bFO/o/9mc34ILt05eo9VM2xM/6uvFkbHG3bvdrHgoF5FkAItz6HM=@vger.kernel.org
X-Gm-Message-State: AFuF++mM/DfzW+fJlTfn5i4bjdJwv4ugCiQraf3OgqQYw6x58Y8fzUx6
	9S+aG7SPIx6zhQkQOiREI6gSCq69qxxVE3OWvX9QzRNVV1A/mwYXZUdN3jA8vo3MwmdEKJV4nF9
	N0wQ=
X-Gm-Gg: AR+sD10mBOny4eXKpj0Y2D99ErECfYIxLfOGr6b6QzhT9pSWcj6HHRAejcShh/Im2Cb
	XqVUk0vZsBbo60kwZMY/dxt4JG/NuKV1c8Qa37grlwvFrNtzuaTsYEmLFa7ReF+XUdJDxkFq29l
	PKKtxmcXgtNGGhpzKaImoByTeXgf3e8uHXbjM0+rFMQQv094UlryfgVFWJCTkoAOHsABOXeAYOU
	0yrOvdk5qibyHQwf73wQeMBeOsapTqGNdJW+i0YJ7KFy5ejb5XtXn2o9BeFQqomt7x1+Q51Vrki
	3/l/W7JptaFDUewHcJBetK+S3ogKcZmaxjiFUZ68mueLPI5E9ARGpdBoFGBlY0UcwXTVHg6kuNP
	AKcHK4hxVmQ26+NMYW6SvsOwnguzJ5phr6KPTR/KBpdu/QpvIdvSiYKNo2AbXf3F5bcyr4DGmzs
	GOnniGGxzxP0EpcLnp4rPqARKYvK4wivLl2Q27g6Mdl22F3gTycA+dHCzWvSXq/Csh8FeWZtIQ6
	kaS5L4ClBQN/GIbqcwrex6yGek=
X-Received: by 2002:a05:6a00:4ac6:b0:845:e9e8:645c with SMTP id d2e1a72fcca58-85372ba1874mr25814215b3a.6.1787813962222;
        Wed, 26 Aug 2026 23:59:22 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:ff0:ad84:24b0:9e52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8535cd86fe3sm1657226b3a.39.2026.08.26.23.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 23:59:21 -0700 (PDT)
Date: Thu, 27 Aug 2026 15:59:18 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, x86@kernel.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] perf/x86/intel: downgrade alloc_bts_buffer() WARN()
 to pr_err()
Message-ID: <ao_gFsBR99s0sUBT@google.com>
References: <20260827065529.3835720-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827065529.3835720-1-senozhatsky@chromium.org>

On (26/08/27 15:55), Sergey Senozhatsky wrote:
> diff --git a/arch/x86/events/intel/ds.c b/arch/x86/events/intel/ds.c
> index 8940f0292229..29c24b2925a7 100644
> --- a/arch/x86/events/intel/ds.c
> +++ b/arch/x86/events/intel/ds.c
> @@ -918,7 +918,7 @@ static int alloc_bts_buffer(int cpu)
>  
>  	buffer = dsalloc_pages(BTS_BUFFER_SIZE, GFP_KERNEL | __GFP_NOWARN, cpu);
>  	if (unlikely(!buffer)) {
> -		WARN_ONCE(1, "%s: BTS buffer allocation failure\n", __func__);
> +		pr_err_once(1, "%s: BTS buffer allocation failure\n", __func__);

                           ^^^  compile-testing patches?  Haven't heard of that...
