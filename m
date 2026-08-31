Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8DEB3AC0E4
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788155275; cv=none; b=Y8Y8/lkN+AQkkcOOTcHxv+FFCYHE1k3KtjbWGPmcALtbsR4cR5u7E19gfyYBcPQakLVVDTTGyZ3N8aI0WcwIsdtb6/H96cGnLdx6uLFv7GXfI8PhcMkyh1b+2yS+Xzv8Jh2csVEsXxYT8gu1xUhksetFe4tjYusT1kAhw4u5DRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788155275; c=relaxed/simple;
	bh=1Cr9Crhi92bFoZ6dXFFfRGLhsqecPCYqOkIc3s/639s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hHc0MAL3UZVgkGxT9DSJVS6PQNhXh8fe3lyqwynGUa0V0nL+RuYD7N/q34/kNpG9KjgvWEWYWHnnjwXnU/bbi4gQRTP7YDFNrpgu3M4PRpIK0k8ixmeJbaX2zNFkjXMvdqL3XDQjN5slI5+QNjc0bphuR22jEzFEMbZYPUJZahU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AsFaSNLv; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AsFaSNLv"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so2182994a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 22:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788155273; x=1788760073; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sN03zBsAwTdmYoLVtESuJo5a7SPFn2gcdu9r933yMXQ=;
        b=AsFaSNLvazdfkRHbCC9wYpr769C49YlDPx+pVDBpyHBPZkhLfzrnTBRYqwmXtJnXE3
         CFpQTfnP//pviCwQxL9sUTW11eGfyBVvRuwl0a1V5Ult6ULuue7sjNv+k8HZSoTw5Kar
         h89/ITbMc1G0vzEC1K9XXiR4vggatciKj7Me/ie5iUgRYb6+HW1V4KlgFzB7ooNr7AmX
         /ApkA/w64qlUvl+xK+j8FeF54xHpJOo/ygGJXUedfuLlzOIwdvf+iRcsvaS9sHD+5FI/
         JQLDzI84xkCMRBqx+XGT2z8Wq2NJfhnm5aaR4wYmlvII6Db/LgT5GgIuLc5n4zemlBOq
         Fmaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788155273; x=1788760073;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sN03zBsAwTdmYoLVtESuJo5a7SPFn2gcdu9r933yMXQ=;
        b=oTv4D7qURo3ZwgHeREb7ujdEg2ie8w+wbH//PZsmifGLL6GKjJSXyH2QrVl+fZ4TFy
         wE2AK7jMqqOTQW3J+/SFFnHk19Lzr/x/4KXap9esywvFVKRp/bsFP5F3Nesb5ZZ/CoTu
         4HHfEZb2WBl/wBor5hfEHuD+2phApxsIO8wxOIdC3V3aFce9otPb6Hk7LuJ5P2Lp/gT7
         rEKZDTcpGsg76mdYIdGIoW1rvGTCv65+4CdmRgrT+8vbiPQ5c/+TAmjg3N+NkIF54Hfl
         O3b1M++95nrY7vBQbrka2sinTskPvbzduvZMKHjS1phOaV/ciyZwi+Os8eSZ2T6P6cMo
         TvRw==
X-Forwarded-Encrypted: i=1; AKwUvBz/8vtCbVY/I/nxUCOUMr7nmzum2k45M1UqqdAtvY07t50Rsz6tqJBOMPUgeabhM6YX5Wq+5umkBwywtJ8=@vger.kernel.org
X-Gm-Message-State: AFuF++k1ylgrKKPL1MawToQUxwqrVErgbeFTiK64Z5O29l1qcNJCmnWZ
	+JtjvmFqaXIodtSnT5bg/NoJpX0kT6JyUJK6ISVNu+j2mDWhYMpwioZY2Yx89S7xGbA=
X-Gm-Gg: AYBFou2HffTvbT8ZN68UMuLt5hMy7GHywIYNuR0HH+23MbWqaoI+WRZZa1XNcWQnJUm
	TZW9RY90B2mvVJdWLHFSmYn5HU494oMHCT38tk1mkYaV+LU9heNWKwi//abjwZ2e4xinFQuXOGu
	R7UzyuiHU6VTqR7w7X6JkpOHFKq/8O+5HvsmoYT09ydSyFikD3bw6xMV8F0ny1TeW01znOEpLar
	dlKg6U7KDj1EiShqpPKdNepJvjKnf0THkhg4la0qFFWE4nCoo6toYSpRCDzNLliJM7HjU3axTe+
	NoOpmAJGrePpNxk0mV/HK8TOjNmsppxUKA3CMa/FfQxFO43iOXNfMETB2Yk6PWcsp5CzHBzJmeV
	HS5S1g18a6TaZVtjqohAEHbofVLi0MxHWl34BS1zbp9KGa1OL/y1O/NH0xY+UbN0p/7fXwAruZM
	/7FIofdfaDVv8TqXI+ccxyRzUeGmCu0Fu6Ald1+dLk3EwzVxt3TIp/ocVqQn55Wok=
X-Received: by 2002:a17:90b:5585:b0:398:9be8:ea64 with SMTP id 98e67ed59e1d1-398f858d5f4mr1616469a91.17.1788155273028;
        Sun, 30 Aug 2026 22:47:53 -0700 (PDT)
Received: from localhost ([122.172.87.224])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0de4de3sm34648207c88.12.2026.08.30.22.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 22:47:52 -0700 (PDT)
Date: Mon, 31 Aug 2026 11:17:49 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Xueqin Luo <luoxueqin@kylinos.cn>
Cc: rafael@kernel.org, zhongqiu.han@oss.qualcomm.com,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] cpufreq: sparc-us2e: fix frequency table index
 copy-paste error
Message-ID: <apUVhZnScyPdP_t_@vireshk-B250M-D3H>
References: <20260831054438.3632612-1-luoxueqin@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831054438.3632612-1-luoxueqin@kylinos.cn>

On 31-08-26, 13:44, Xueqin Luo wrote:
> In us2e_freq_cpu_init(), the last two frequency writes both use
> index [2] instead of [3] and [4] respectively, and the terminator
> uses [3] instead of [5].  This is a copy-paste error where the index
> was not incremented, causing the divider-6 and divider-8 entries to
> overwrite the already-written divider-4 entry.
> 
> As a result, only three frequency steps (div 1, 2, and 4) are actually
> available to the cpufreq core, while the intended dividers 6 and 8 are
> silently lost.  The struct us2e_freq_percpu_info::table[6] has room for
> 5 entries plus a terminator, matching the 5 hardware dividers.
> 
> Fix the indices so all five frequency steps are correctly populated:
> table[0]=div1, table[1]=div2, table[2]=div4, table[3]=div6,
> table[4]=div8, table[5]=TABLE_END.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Xueqin Luo <luoxueqin@kylinos.cn>
> ---
> v2: Correct commit message per Zhongqiu Han's review, no code change.
> ---
>  drivers/cpufreq/sparc-us2e-cpufreq.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)

Applied. Thanks.

-- 
viresh
