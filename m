Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE8B3BFAFB
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788162996; cv=none; b=mtAweQvExIIET7BVU/GXKnVkQUleLdmzfbZamoGm30MGxww6dKsgC2XVDuyV/gSmVBtwds7IONHp0ucbqK33XwIDv+QGMA+Svb8/tlDkF2ivmFu4d32oHdmF0isFevIfoFLAFN8ikTplKeWPHSuX9VFyc+f09kTDjaQMW6KK0wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788162996; c=relaxed/simple;
	bh=/5KBAkXNsAoZ0dCdyXwjvLZJnV0sY2YkzB0CpxvtEFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=opVw0UD8rTM+bgJyWyYIfI8eyM7Gjo8iSqG+zVSbkY8kLTDKgOti+S8ub575uNsHoPzUTaQ+XKf9Yy2KhvA1vTB5tcViLwbzQrdTvljZsX8DoFaKJqBNK9TLXyIZYqvP+H3sQCk8BztDn45J+KWyqykDnZgTsIaUmwpJRjU2590=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FwtU1PxZ; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FwtU1PxZ"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-854f8068301so1862270b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 00:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788162994; x=1788767794; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kTj871xlqaHMwYraZdh0kFP+rAgpCuDmxV4vm0NFxw4=;
        b=FwtU1PxZ3sv00HIYkScT9jNLH1hDhZ0/bDCpL3wwVw0yXXwIWN7hkW1Qyj4Q6W27mv
         oY88V1kc8gRSgT2DE5Z4Hb+zrwc9h7sDWBYWNdHNH5KRtmRayIbEqF3g/4DjtsdWRtYg
         4yOW5d/ymUa0v0lTxkEULSow1QiKrtlY3Qlzz/ks9pvOl+p34uTzABJ3W+Xxe0hru6by
         lYWDCe0fDEju8pczRp1ONLDSlYy3j4NPAaLfivvnBGA6QFEOKsl3g3c0oRrUIYp4eGUg
         cVW1up/zG28ppOBEgzlNr7VaU1Oel6GHjneX+raCY+aB4T6cS5AXrZr70jtaMbDq4ULX
         57pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788162994; x=1788767794;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kTj871xlqaHMwYraZdh0kFP+rAgpCuDmxV4vm0NFxw4=;
        b=SLSaFHSxR+aThXyIxlcyCeNYVrEECtR09p16OhaOKpXEVSJFpVdnGe2OGie8fyQTBu
         PnEFKFPV7pKuq9qIE0AXRE0aLa7eN9ueze08NPq4S1YvLxx9tNrc23VFCfH+KfzbnDRT
         bG+xaKoTy4Lc4z/YOzDo5gOA9PVuI2fAIMRDYNXrxpoVP00FLggJSywgl7/vq3N7mcZw
         OwETHApRJlG5IPPH04PJ6IDK8/gXkH2Cj+33PhjwZGsbPrGQU3CacwCq2IszW1tGmvSs
         dSv8U3TmSJsJKv/vC7nu6vzvVq1vQ8dEWCWSDqR5RDKTCSBBbCZo7AUTehTwwvCGOCUz
         qo5A==
X-Forwarded-Encrypted: i=1; AHgh+RrBdm4FbI9h1se9NjaKofaJXeMfjyL/ZOV69fdL244lHOLo2ocIfWadKiLHsRNaUnjcg63SAAeUdTX8g0U=@vger.kernel.org
X-Gm-Message-State: AFuF++li+vVIWZI8KLijujWL6AJdzoy7zgCyWixQV832xSYBRsHXeKvr
	Ga+uqqmOiF9aZ58SaMQvujmyb0d8cK72/NGkr6sgPa/QwRpDHf1++rQsFjnEkZODDyk=
X-Gm-Gg: AR+sD10eUvkyuLWOz9Cfxvdn41lEuMEPT3GGtkLgiYTiacQtqW4utP3Bgb1GQClP3+N
	aVoM7y9nLtiUA1nfviZ8DEmZ9T8abCTInUGrHVJ/aDoR9PVZpE3kBs3Mqt9ZSrTEhRR4QwEzai5
	Jtz0GfUW2LUYNRINopXlo7T/LW9MtU60+zosyCf9iymSUL1oxoLmp9rk1JzPDo6hm8ihRda76NA
	audhZ7ogMS2f7cEuTy6BqZhLQcSthPk3UUI7C7hlGQ7FXkL9cMnVWeynY6IyIjskgz5g6kEoBeo
	hKQJmUZu7vtnh2zqxWiTuScHEyyWbEEwiwGE17F72WVKOUm6GRDuaHbvY/Cy0jic1Mx1qnDJfZZ
	cQiOKufJXrFLKbL+o+wUsNSTM6YgJ4K/IA2EDWQTz5YXG2okySKVsH6oDzELfo4T1AJGybxyFbS
	1J9wNrAe5kCCvRzL7NgOHJYqqFn9179CKy24MSPq64bb/vAUEdXH7YXAEPgbfBTzE=
X-Received: by 2002:a05:6a20:a11f:b0:3c3:6928:8b25 with SMTP id adf61e73a8af0-3d269a4d3ecmr37174478637.17.1788162993984;
        Mon, 31 Aug 2026 00:56:33 -0700 (PDT)
Received: from localhost ([122.172.87.224])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9e2a95sm26529255eec.23.2026.08.31.00.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 00:56:33 -0700 (PDT)
Date: Mon, 31 Aug 2026 13:26:30 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Xueqin Luo <luoxueqin@kylinos.cn>
Cc: rafael@kernel.org, thierry.reding@kernel.org, jonathanh@nvidia.com,
	sumitg@nvidia.com, linux-pm@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: tegra194: fix double-pointer error in
 get_cpu_ndiv
Message-ID: <apUzriIXGmxf-PLc@vireshk-B250M-D3H>
References: <20260831073009.3772408-1-luoxueqin@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831073009.3772408-1-luoxueqin@kylinos.cn>

On 31-08-26, 15:30, Xueqin Luo wrote:
> ndiv is already a u64 pointer, passing &ndiv to smp_call_function_single()
> results in a u64** being written to instead of the caller's u64 variable,
> so the caller always reads back an uninitialized ndiv.  Drop the spurious
> '&'.
> 
> Fixes: 0839ed1fd7ac ("cpufreq: tegra194: add soc data to support multiple soc")
> Signed-off-by: Xueqin Luo <luoxueqin@kylinos.cn>
> ---
>  drivers/cpufreq/tegra194-cpufreq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied. Thanks.

-- 
viresh
