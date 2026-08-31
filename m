Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7FD235358
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788156557; cv=none; b=LbMeRdPdIUOCfl9V5N7ZgYU8r4GgRCtPZvymTYYOHL/ZCE3BdYjYxCbq89oJ6b4w3EqhRRGQJEroU5kodCyF7mRlwADDK7MRPsCZZs9gRcI4kxV8UkFR+2PMIRskJkDKAIrv8+ESlOSntAFnRd5mgqOm78NkBW1iRHP6PT17QoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788156557; c=relaxed/simple;
	bh=g0/fWI4kaAH49ZjyjviEpK4wrWOx/yLhKN6DwAytVVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qbUpTSnj2fdzI56iL4QxQQAW2NgONuSSgIRKA1LR3Zqxfb32Khevamj9cypc02CRhebr5eZ2Fjk2kuUMlhtDplkaYChm/mQgTfNYKU8TMAcjouQPWZUQbC7XIkI/NPrdfxScWQHxBbxj/Zjm/EurPaC4+2Eg7R+gKZKS3QVZkCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=afkCIMbq; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="afkCIMbq"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-ca12086c06eso2456902a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 23:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788156555; x=1788761355; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GnV26Q/NYKfR4yRZkITW+Mqd2oTMukvcHneE1HMVheY=;
        b=afkCIMbq6yw47jhZ5QrR1ZeYg4lNjUv2RkdXWwODcy+hZIr/FeJyKX7NelsQLRNZ5n
         VxPNUxnd2X/DVPgon8zA2S3N/Hvwj7SCV4j75BhTjYH/bvw57ZTLQ8jyOG9wTaC6wA/6
         3L5shuPBe3pXkqr9G6yj4VlP8W5hXS6J7qnvIMeHImLy9t0+AfAnZdEZuROKbIB57agP
         D2N252epq+HhXtjNTyoiHWwy8fSnSjvqIUrDSoYfk+jpRB7Tv2vEqQ/LrHsoaKks2m8Y
         ml+XAyQ2hVvD0Oa138UPG0jArJGYLtZu1HAMrGro5ROyIZPABoqVczFaqnuwXSC5Ckeq
         Z3vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788156555; x=1788761355;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GnV26Q/NYKfR4yRZkITW+Mqd2oTMukvcHneE1HMVheY=;
        b=BZo5vKCNAkF4NUSHxThkFcHUiNMFWG6DwieqxcCxpov5q7/ZdSWtD5trrwl0ySdhll
         g+qI0q2KaQ8AqMUPN9N+BRII4+Lf1dxd+HEe2FylSNufAfmuD7SVOFEf6vX3503MSzH4
         2v3RPLH3u7eZQh4MxHSNtwQILZnuzIR0/Qdh11CGQnhutuK84cOAd6GShXw28SScrvPe
         cNa/8TLHu7vlSsN37Wl2Bzk4vEJr9I9imEPGHOlRW+HC7Urj74/c1E8+CG94OhFlA+NL
         ckQqKd5orWD7wcLYPky9rQKevZT742JmwmXeS8eBp5UA3Wiimnx+fDDrdDbsQz22Ro82
         7Zhg==
X-Forwarded-Encrypted: i=1; AHgh+RrLRc3X835uKWRjJNSkGOvOuEoovfHEptJolVx53nPAuyiMvMMgNm21756LuRCWQ+wAaWZ7bfKj0D20SD4=@vger.kernel.org
X-Gm-Message-State: AFuF++mAlthYWfBLYGJB0C/TJHgPciJtj6vIV4f5/PzGO/byBAPO+8zy
	wVCncWIJ045KOsUQRGm+UPEmbywdEK2oGtXRFIjrj9cnstcXY9FJRivD5olQrtZuqb0=
X-Gm-Gg: AR+sD119SO8uuBw8tmSswsDOlu0yFWmbwJah2qpX0iZILJYgnkS0qfttPwUrTd9mADz
	Iq8+s+CKduBoz0oIwy9WbnN0d7TQ49PIh6zHViHhqAuAKyM6Tbs0Svgz0Vw60g7v2XB/LlcutMj
	4pTvT+UGJDkIgZDyAWjKm1DWfcjMQ/SddUY39fs2BLMQNnFxv3eqo5UMxWgMGZs2nCZUL+mDyvZ
	1w+Tb04l/zcIE7bSaiT8FktQhfgiTlloeFpx4i/sGUHpG1BTtCydX5ZVzID93ZiZfs/XOfNg46x
	aYDxL5WlUMDJ9bUf/T9+zHs/4tkL1iCwTqO5WDzWKBDNKS8tE02gOq4UxcJYHzA3LDtB6tmtz92
	h0nMPno0yvdo0TczZhkFbn42rcc7o/iQ2boW8wF3DjiVjB1CpAmZPTJqd6grqyGOstIC5QfWq1N
	pPHmaty7ivz7Z0m9r5wsP+O5sIxi3m8pbvQttRU+/USh9cLhgQ33ysc2Ux/jHYADRUkHKULzpZF
	j4=
X-Received: by 2002:a05:6a21:6b87:b0:3cc:f008:8123 with SMTP id adf61e73a8af0-3d266582c55mr42074601637.8.1788156554788;
        Sun, 30 Aug 2026 23:09:14 -0700 (PDT)
Received: from localhost ([122.172.87.224])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7bc825sm31297019eec.9.2026.08.30.23.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 23:09:14 -0700 (PDT)
Date: Mon, 31 Aug 2026 11:39:11 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sumeet Pawnikar <sumeet4linux@gmail.com>
Cc: vireshk@kernel.org, nm@ti.com, sboyd@kernel.org,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] opp: Use %pe to print symbolic error name
Message-ID: <apUahwItxSCj-dE-@vireshk-B250M-D3H>
References: <20260829134925.8883-1-sumeet4linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260829134925.8883-1-sumeet4linux@gmail.com>

On 29-08-26, 19:19, Sumeet Pawnikar wrote:
> Replace PTR_ERR() and %ld with %pe and pass the original pointer directly
> to dev_dbg(), dev_warn(), dev_err() or pr_err(). The %pe format specifier
> prints a symbolic error name (e.g. -ENOMEM) when CONFIG_SYMBOLIC_ERRNAME
> is enabled, otherwise it falls back gracefully and prints the raw integer
> value. This makes error messages more readable without any functional
> change.
> 
> Signed-off-by: Sumeet Pawnikar <sumeet4linux@gmail.com>
> ---
>  drivers/opp/core.c | 24 ++++++++++++------------
>  drivers/opp/of.c   |  4 ++--
>  2 files changed, 14 insertions(+), 14 deletions(-)

Applied. Thanks.

-- 
viresh
