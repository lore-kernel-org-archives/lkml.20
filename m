Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EB33515E9
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788169105; cv=none; b=m5WCLEtSk+vUTaNulyKMkmxgjkgetcbKCdIeNbFbO909qkg64vzGb/GOVwT5d403woBUU3dDcf/FXaaYAx6o9clJxYhLKyN0pq3iRhes4ROJTB9koDcL+zirM0dlgv/xO4EUp4pqwAuYN4OZsoMNtQlaietJxN/0jCLbRkCIBhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788169105; c=relaxed/simple;
	bh=vTLeb2dANt+uqoDhcmB3qy+iNJr68ED+PMnVlEuYXPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bppXiou2e6FViJNUm8QVBC+UGym6qk4qm8A9wZXR4nAqlm6Msly/CCI1J1EfpSquFeZT7lWAI+6GWu8PFgXEXo8yBSsqYC2P/kAnn/qbU1M3YEP8y+kCVuzS8E3HPUf9QGYPCcIgXZ+pjbN+36XijJTG5oyr93rbQdpJhkU93qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=izrbNq43; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="izrbNq43"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc1c73645a1so2534445a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788169103; x=1788773903; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CW23LQEB4WoxPcN9t72NgpaNRCQygSurIOdrvN/ogho=;
        b=izrbNq4386i7U7SQkhDTHRQec9DSipC56N4jA8bslNLjb9Eb959hapiSFfzn4snHmz
         D95tj6Ru4nkFhR1fukvxLFq4pDLHSxqpT1F/dknIFpPN6z/j1iIyHzkvgUr/L1sEX8qB
         4ziyJxGJNJpcw17d85Rpuq+GaaEGVs/Hf/yJylswLBmMvAALOFadTfbFlSEkbsXUcyDp
         TZoManHQWZoX0ecjO791FobtNRP5cc1CUjoIH+2zjhqMPrJNSOdJyYEgJ2gmoHwv4d5p
         kBXxlSWs0OuNftwqJqWGryBW1qNr/WwAZhFIk/QHLmrkYL3ILyeNecZDv/FZtFy5EvjU
         Oifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788169103; x=1788773903;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CW23LQEB4WoxPcN9t72NgpaNRCQygSurIOdrvN/ogho=;
        b=ZN6ZGVJCY/Dlzvl23qHiZY5vGh+gxHs9m63v7T86pr6XQqe33BjMp1uES5zXU2l/Gt
         I7e8QdoeU41uGPrWS9vfDSWmYCrQeThrCt3WjxjE+/Bgi+rjkB/FUC9Mlam1LMbLtRz8
         BgMqu0gGLaHStw+udHCR3kK7tzE3WrGan3Ur/YE2DLilCEp2Ik3M0u8rZ0piflkkWw9Z
         7s0JNlSe31rmG8YidkYQvg2dqUAjlTfYdQ6/UuQaVY3BqmL8IqSHh8YtJyfWGnYgWnTU
         cDuY+LeQEGenI8+c6KYmz4yv69FdVD347CkE4vG1h9fdG1ZSRvRzTmcbv6R7+Uxzjy2o
         2asQ==
X-Forwarded-Encrypted: i=1; AKwUvBx+eMX6cNxKXYH25s4NajgOJVUOeJEuYTPzqQc5busBw3nvAhY+X9+K43L1dMvFriwqmjm3igmlix4bHRo=@vger.kernel.org
X-Gm-Message-State: AFuF++kmTdLwPLm2aXU/MpS/fsF9cUX+a7CvWOAeOcbcECm4qxA5bcCN
	5anj9GM460mY3Ky/bP7Ha+yCxQ4Cg1cP9x4AlJiaY030MMyIStrZvyWpCJ4k0aFMd/Q8JzShTa2
	uk0WR
X-Gm-Gg: AYBFou23u8tmQne7b6WFfOEZoqNGMu7eXevmi/puPuurMHmyKBsRhtxnRbObXtBx8Fg
	/eNYF7zTswNMrHjNQKcWcuVyUQzz72zsMR284mcP0Q81racKMkIBQUQ+V7dWgLSYUFLrOZr/ctR
	j1ym8SaUob91fgu+TfrH7mycgGG4/yeOI+AdNTnoA3cAPxP7m90g8817k1EWlAc1NuegSoU9Jax
	mdhICt2LBPSROGl8gklL8SCuwWgZinQ+mUw0KBvfQJ+QEmp26c89kYJ+2WsKi5RtvIDHnFgfVBD
	5xay4I7Km3Yjy5tVNdRN4JK7eF0aqgv2le953BP68Yec0tCAu7nQ6QNCBiUeEC1qUd9r0gYuQAO
	uKjxFQ8jQvqp5jA5JZag3A0WVUI0+w7u/5I7LSZGVGaNLbPMvY/gJ2W0CFLBvb8gUCmP2FybA5y
	91pTQ7mGMBdAebAPpV+o7bhVAQ4heSIvitMtWzxJkaLZe6jefH2JKWAIkyry64aMs=
X-Received: by 2002:a17:90b:5287:b0:398:9c07:8907 with SMTP id 98e67ed59e1d1-3989c0797c7mr26090507a91.24.1788169103218;
        Mon, 31 Aug 2026 02:38:23 -0700 (PDT)
Received: from localhost ([122.172.87.224])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7be440sm32786117eec.7.2026.08.31.02.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 02:38:22 -0700 (PDT)
Date: Mon, 31 Aug 2026 15:08:19 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Xueqin Luo <luoxueqin@kylinos.cn>
Cc: patrice.chotard@foss.st.com, rafael@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: sti: avoid NULL dereference in dev_err()
Message-ID: <apVLi1Lej-5lwkqd@vireshk-B250M-D3H>
References: <20260831091159.3906287-1-luoxueqin@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831091159.3906287-1-luoxueqin@kylinos.cn>

On 31-08-26, 17:11, Xueqin Luo wrote:
> ddata.cpu is NULL-checked, then immediately passed to dev_err().
> Replace with pr_err() to avoid dereferencing NULL.
> 
> Fixes: ab0ea257fc58 ("cpufreq: st: Provide runtime initialised driver for ST's platforms")
> Signed-off-by: Xueqin Luo <luoxueqin@kylinos.cn>
> ---
>  drivers/cpufreq/sti-cpufreq.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied. Thanks.

-- 
viresh
