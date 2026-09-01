Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6CF40F742
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277138; cv=none; b=ltAimwHpmREn30UA9WAk+SmCaIura/4jz1tj4aLiTv7Zu8TB6ohj5QBIzbm0c2I82duZwFYX9bC7yUKh9wvHTMNNMJLNru2h1q7lUx8xLc/eB3lNRobjGZ5ZMjuNGrTfipVxQnYRh1P85JJ3RDKws20079ej/snP6wMWY78IRIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277138; c=relaxed/simple;
	bh=GyArgdbG6HRpt86nq20zagJviLWwO1YA55HHuVu3vqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SW89ObSFnkQDvywa5OBPCfLIDshgc42odBDKtLVYM4vPK6PrK2e28jQezlcywwmb7gB9rbuGNWyHfhJSPgg16R1qPp2hkYX9/4NoHtKMLai94ICVDyuYb1LU9dyB5NZQdg6IwSREwTnBfOU5yigJUGTvEzbbHCHAncJZqUdUKzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=YT/9YED5; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="YT/9YED5"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-856114a8247so763547b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1788277134; x=1788881934; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0OJo9BDKzfcZA2u2cy0960w1Ox7UILmrTsclNvb0Qhc=;
        b=YT/9YED5N7WhwSfZ61IxkFCay+jxL7SFS7PS1B859fQJUSGKXY09eyECoiPk6kdwFz
         ASXNaRBIHuodcawXImXqFFuO3KHbYHdkdusVWUY1bEiAutFEOQmHeQwORPquc+R9dRky
         231muLtrwA2WFKq7A36nhVK87RUnAwCXVXCjuyrgQM94pMzXkOPrsuz6POVhiOkNkmxy
         jlGCoDNJmfOP/fypO43KEfP6Fts6B+TJhyLwpTn7fG8S0vQLgVgDRlhMFck3qaMTH08b
         Sz2ueozb77cJUjMulLYNen34BNJtTO0mJ0dTX8cSY1hZr34w8Hin4vW3qzCqmvUC+DUS
         sP0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277134; x=1788881934;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0OJo9BDKzfcZA2u2cy0960w1Ox7UILmrTsclNvb0Qhc=;
        b=KwyeCogx0xybWWUWKBvlZ7FWjp+w/q/+E2YmGbpUDnM/7E0SVafiQUwcYJfBba1SSR
         8FJOyB37TLmZFcsWgQ+HjnOd1U971H80macb4okjeJQp4FaL/vX4HIIuc2abG/jFKAQF
         ljXbvm0n40IR1EqqnOOjE7uivI8oWuJklPerOj1F3FenWFR3baQ3YRRU8MJKxWGuOJVa
         8MY4tsyRXIfYgZS3KqfI2cV5cmfeo1HLxSyV+5T1VI/cTsMIQXxeK4p9fzGEmtq//x00
         CVD8jmItAzVe4G4rP5azYS0js9cNZ4ZnEKfk8NDuFfAvRM30xR9jOmLMUBFSMGNny/FL
         oEEQ==
X-Forwarded-Encrypted: i=1; AKwUvBxf4HYsWOHozGb9WaTk8+jGcvkTGGboOJyvptbQ0gXBs8fNQ/jw9Vioe0d/pzRPqMqmj4Z6A/HH8rXhmMs=@vger.kernel.org
X-Gm-Message-State: AFuF++lE9y3B9ivgPqIgZV9wuKcr5iBuwS96vaeUN1cYyuDZ4LK37VqK
	BNNoR/dr5XOmQFNdYmCK7CM7on5VlBTl6/5WGitWd8sWKxEoVvXFuYCVGM5q3eVlVFc=
X-Gm-Gg: AR+sD12xMFUKKLaqmXiypT0qVUBqZdhfclKWJ9jmnogkor82egQXLiRqi84RN2yLYHt
	0fKhPKIQO3K2diP7Md1N6z08wHLstxehjOb2Nnv9+foV3T+ft82M3HDs+eB56WcuPyJZk6DvOAr
	cIYO+BgeB+rd5A7ywgY+4lT/2yTHO0UoICPCK4190ASkfuAZtgZHaYXbwY8unK/mrLlpVZHckbW
	nOtaejzIqYkxYVTTyUjEAYVKrD2iYglGZO7E+WO5ItPYFn7WQ4UGSn9+V9xaEr1muW2yWD5SMdt
	sH9HYXtNgzxfQRFnXOIJ3ZDezrCa0tPvHOLjSXH5SXXUM3R68zAfLfl8L0Zy/Yx5xxuHWo+tYg2
	ZsgzDu0PrKuDCSvdrERALJk74mVEfJtxH7/du4vfvK2Ym9n59kQ17Msh7JO+hpJcWobp/uv3e8L
	+hrP9X1axNz36kwcPc3E6nPjpQ2/vJ2oXqWbbb0DcIl0NZg19IEN5Z0uODS6d/
X-Received: by 2002:a05:690c:f13:b0:859:6fe3:7352 with SMTP id 00721157ae682-85d69e01771mr129530347b3.9.1788277134333;
        Tue, 01 Sep 2026 08:38:54 -0700 (PDT)
Received: from localhost ([2605:8600:200:1a83:fe59:7385:2855:8588])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8650aacd1c7sm48548897b3.35.2026.09.01.08.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:38:53 -0700 (PDT)
Date: Tue, 1 Sep 2026 11:38:52 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Jianyue Wu <wujianyue000@gmail.com>
Cc: Yosry Ahmed <yosry@kernel.org>, Nhat Pham <nphamcs@gmail.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Chris Li <chrisl@kernel.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v4 1/3] mm/zswap: release retired pools via
 queue_rcu_work() instead of synchronize_rcu()
Message-ID: <20260901153852.GH3004@cmpxchg.org>
References: <20260830114731.8322-1-wujianyue000@gmail.com>
 <20260830114731.8322-2-wujianyue000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830114731.8322-2-wujianyue000@gmail.com>

On Sun, Aug 30, 2026 at 07:47:29PM +0800, Jianyue Wu wrote:
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

With "release_rwork",

Reviewed-by: Johannes Weiner <hannes@cmpxchg.org>
