Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102406;
	b=vcKiQDB8Wprg9sFCsIKz3Z+Bb3mVBglgH1FmigqOuZbzZcnXwsV0KTeZ0KXZUkQP6nXG
	 YH0+Q/ho7os4m1LpDtFq2nhpuGEMfzzCcQgeqo0LIC3FT1h20WcEMM+rv2Wb53zTVCSsj
	 0l6wACpa6eTNcq3hY56xZ3CM0hdpKwYaWDAOEtQSCsKIN05mb3CfLWL7eEuP8jtXraA3m
	 5zkp59q0LCHM9qp1nr/kEM4dk8FNnxP/a12zWmeuBi9NNNWjAbjEUWxFkk7mkGfGMOBhN
	 gboDsJE6j1IL0KrLzUPNqnu+kbuwCFfm9eL9dByiqYjH1f+84ez/mRzIAyY45uY0egA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102406;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Debian-User;
	bh=22OilN3OWHAsf4ZnKYCUCqyoE4jo68G/Rnat5EPiPAs=;
	b=TgRoBw+DD/Zz6uy/0Yq9qz+s5xkSc4RxCMsR7sSSFC6rVDnyCI7mDdolrqjyPPNQ6cro
	 1/qjehp9bEB/9NNcs4CRxVYjMa3PV7ZASutau8PVvVJEb7m/rHG7GSUQ5LCeDga07qugv
	 bM66XPUYOaETabPbmXl8njO9mYFi7n7/U5ly1Gkl3OTc2soWUKTuDt7SI1ZIRlnqMqGFW
	 Ka1n00qvZuXdKPRhSbnC9zY4Jb9UG3deCb8PNgyWx5JRFkn+NpOap/dVON+kpsLZpmjFf
	 GdD8o66dDqqLCgQdTf4kCJff8Ms2XjgUFD81JdSOGRtFpl9MNwN27JixJFwXm9ok8qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b="hZ/Ow0ro";
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB5C606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:00:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DB5C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=hZ/Ow0ro
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=22OilN3OWHAsf4ZnKYCUCqyoE4jo68G/Rnat5EPiPAs=; b=hZ/Ow0roMzSE6yS/Enuvr71b/R
	dPnK8+fdUYq9MNWyNw3mFA9CBhIs0m1St9Yk2Ddl1mOzI0ghUTkS5l0LOyAgA489QRwVzkXufKIF/
	tRzXxd419Nq5fXvU35Yr6bMft+1/iuV3bYQ0gH7kOQZTa17H/fO2V7fckLIlE8ZfqQgYLxI/6Gw1Z
	wv8/3NpmC2nyEaPvJRvmLMCXtMFPkjBH2xJrZgLNn1K68bkfU0CidLRudY0jFLqozzH19UywHckQp
	4YqXz43UaUzygXk5AXuyPMku/yNa8IvggNT+rHYiZH10lYxKZqb+smsAoShzC9bYA4lngzg/WN35f
	BG04PZrw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xLfqP-001RTE-0X;
	Tue, 27 Oct 2026 11:59:57 +0000
Date: Tue, 27 Oct 2026 04:59:52 -0700
From: Breno Leitao <leitao@debian.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kas@kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] arm64: Kconfig: Don't select CPUMASK_OFFSTACK with 64K
 pages
Message-ID: <auCSG2OmNMQKp3dq@gmail.com>
References: <20261007-arm_stack-v1-1-b48dad5fa8b2@debian.org>
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
In-Reply-To: <20261007-arm_stack-v1-1-b48dad5fa8b2@debian.org>
X-Debian-User: leitao

On Wed, Oct 07, 2026 at 12:58:16AM -0700, Breno Leitao wrote:
> arm64 selects CPUMASK_OFFSTACK when NR_CPUS is above 256, which keeps
> cpumask_var_t off the kernel stack. With 64K pages the kernel stack is
> 64K as well, we have enough room to keep cpumask on the stack, avoiding
> extra alocation and possible performance penalties.
> 
> Skip the select when ARM64_64K_PAGES is set. A 64K kernel can then raise
> NR_CPUS above 256 and keep cpumask_var_t as an inline array. 4K and 16K
> page kernels are unchanged.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
> Based on Will presentation at LPC, I've decided to have a look at Meta's
> stack usage, and I found that this might be an small optimization!?
> ---
>  arch/arm64/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 5f2db2cecf9772..b73371327d2a47 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -111,7 +111,7 @@ config ARM64
>  	select CLONE_BACKWARDS
>  	select COMMON_CLK
>  	select CPU_PM if (SUSPEND || CPU_IDLE)
> -	select CPUMASK_OFFSTACK if NR_CPUS > 256
> +	select CPUMASK_OFFSTACK if NR_CPUS > 256 && !ARM64_64K_PAGES

Does this one sound sane?
