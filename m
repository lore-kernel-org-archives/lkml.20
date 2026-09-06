Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255F92F8E99;
	Sun,  6 Sep 2026 22:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788733088; cv=none; b=ZqX8chTwhjf0caRrqb9wM1nvDtogL5rFq74z40GFxEpkPPrqh4PAWmmi21veNOYD/6NIi+2qNRdLr5ix0cQ80798kAX+0Jlcr8uXTSbKzCfHvksZGKsQ1EiLpyY4WvoRhGIYBWlUda06I0vKLGRC9NB8nb/CiP82e4rd2sBvpe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788733088; c=relaxed/simple;
	bh=KL2fhbAx6O2B336nK8kev8CoNurklIOWsePhA8ms2tQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VCNGoGEAgS0o5dNAjUrocrxs6134K9cDBoLwwc8QBbZ5cH0m+EWPu3FwjRKCbMc+mvAJhNPP2vCqm53H87FfEXb0nGVggRxDTeTYaKVYeC6+olZjVewpw5p1+mPWeb4UckAc6NLzRg1X8uuaphGncejE0vQMgLtYPgiwKCIh4lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oos3MjvM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oos3MjvM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F29A1F00A3A;
	Sun,  6 Sep 2026 22:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788733086;
	bh=+7p7btSCYhDSdZs/Bh+9xSEG4TmZ0dUXb7Y2iSuC/5o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oos3MjvMWFegc5+grwHGWAK6WQdTR0qM/HCagHgtXJrG7qazW/WRu4bT+HX9k9DVX
	 LvDt8HwIl8A8bNwVlERunhO3BaFtnGLyC2MYFh+wijrurxpihI7StsNBFNA84aW6m0
	 Nusidts+k4Y2gXiq/mUuS8xuaprXHKw2Yig2qij2xRZx2dtLymBgdE+y3r+DiW7LgG
	 AjjhIXlW4xrzC3nj4xJhD/WCC4bEEpIaTAl/oFg99t9mQF+sIFSJRBtxTNt2KRkSzc
	 xIPgb24wi0vLsGRTn3Xg7Sc7lIE065w/NS4GAaX4SXCkjCPbOh4mp5y5y9fjJA7F7x
	 lbC2Smg3KP1DA==
Date: Sun, 6 Sep 2026 22:18:04 +0000
From: Yixun Lan <dlan@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Add Troy Mitchell as a SpacemiT SoC reviewer
Message-ID: <20260906221804-GKB2330@kernel.org>
References: <20260906-spacemit-add-reviewer-v1-1-b2ebba238ec5@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260906-spacemit-add-reviewer-v1-1-b2ebba238ec5@linux.spacemit.com>

Hi All,

On 21:29 Sun 06 Sep     , Troy Mitchell wrote:
> Add myself as a reviewer to help review patches for SpacemiT RISC-V SoC
> support.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

Having an empolyee from the company to help review would be beneficial,
It's an honor, but also means more responsibility, thank you

Acked-by: Yixun Lan <dlan@kernel.org>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3a19da74d00c..97ca10e2b7b7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23589,6 +23589,7 @@ F:	include/linux/mailbox/riscv-rpmi-message.h
>  
>  RISC-V SPACEMIT SoC Support
>  M:	Yixun Lan <dlan@kernel.org>
> +R:	Troy Mitchell <troy.mitchell@linux.spacemit.com>
>  L:	linux-riscv@lists.infradead.org
>  L:	spacemit@lists.linux.dev
>  S:	Maintained
> 
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20260906-spacemit-add-reviewer-7b1660880f58
> 
> Best regards,
> --  
> Troy Mitchell <troy.mitchell@linux.spacemit.com>
> 

-- 
Yixun Lan (dlan)
