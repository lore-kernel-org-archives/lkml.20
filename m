Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8ED3D5663
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 07:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788939675; cv=none; b=YYFKAPeWdwGkLxn+AzMlkHmCe5C+MzhHnvjkYat05xYquU82GcSSiB3ulsIs6nlyjlAiUL2UJncr53uwQV8qXtprq9SVRvDDD7elKaw29GRh3q/P3rfU+1H6FZ1Rq5qo90ni2XV6IxMadvdNbLpC3z5tu0U2m/IxrRcObN4vIpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788939675; c=relaxed/simple;
	bh=MlcVH8AYjIrsfuFaNwlFo7SIgqFCihQaoevoEAWBcAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j1veaBswRI9XL4JF9lM4Pk4t4gnmurl68XH54OzFNXSD2MKmmAeY7jQ4BI294JzUlaUkeSe9Cao6TPWLkaxy6xPEDhyP6DJ81RuXmJ8lnPrVgRrMWPvhk5QuJ0h3LotxJx1zud1JhcRnFns1fowCe1cMxrZhoHap34BAyibSNcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RjZMoR3N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RjZMoR3N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5137A1F00A3A;
	Wed,  9 Sep 2026 07:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788939673;
	bh=lSeFjDW5eiBGIVae8tX1ju2okgaGaYVEwgaaxEkYskg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RjZMoR3Nf4/Wv0M+CqCWKgdOfCRbVGjtRB+2VRTRPq0nqKlEar9bFX/AG4yQ61CT0
	 oPTmDI2RZrYC1mqkzgmNQy89SuetLM7Pc+LVUOlpSNvmTjG0BHKVvgAOXvh34rXEdT
	 PmGxiliYMFkIJgQXCKrzGqOD72TycJWYaQ6JHps7qtmYx/pWyGi1wec3oHN0qWBD7d
	 3SYp6Oje+1+IJaeZxF6oCAW0jpxo6+Ukfa3+0BUrggMPFufa/2euNlXTxEpMuLY21B
	 hZUnw8jZJI/4PnjyJ7PMPXn2FXraL3h6QP5mez6kbXsXwlkbBdEBzI7csDNtmv8q5T
	 7u0JxlPaBYVoQ==
Date: Wed, 9 Sep 2026 09:41:06 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, johan@kernel.org, 
	kishon@kernel.org, rogerq@ti.com, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, zhongling0719@126.com
Subject: Re: [PATCH v6 1/4] phy: ti-pipe3: Fix ignored clock enable return
 value  in init
Message-ID: <rws3cizw777sqpaioxhxmzbzs6ofifnq4ja7nzswotwqir6sfk@47kay4qi2fut>
References: <20260619030214.1779043-1-zenghongling@kylinos.cn>
 <20260619030214.1779043-2-zenghongling@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260619030214.1779043-2-zenghongling@kylinos.cn>

On Fri, Jun 19, 2026 at 11:02:11AM +0800, Hongling Zeng wrote:
> ti_pipe3_init() ignores the return value of ti_pipe3_enable_clocks(),
> which can lead to:
> 
> 1. Unclocked hardware access if clock enable fails
> 2. Unbalanced clock disables in error paths
> 
> ti_pipe3_enable_clocks() returns an error code when clock enable fails
> and rolls back any partially enabled clocks. If we ignore this error
> and continue, we access hardware without proper clocking, which can
> cause bus errors.
> 
> Additionally, if we reach error paths later in the function and call
> ti_pipe3_disable_clocks(), we'll be disabling already-disabled clocks,
> causing unbalanced disable warnings.
> 
> Fix this by checking the return value of ti_pipe3_enable_clocks()
> and returning early if it fails.
> 
> Fixes: 234738ea3390 ("phy: ti-pipe3: move clk initialization to a separate function")
> Reported-by: Sashiko AI <sashiko@kernel.org>
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

One comment below.

> 
> ---
> Change in v5:
>   -Add Fix ignored clock enable return value in init patch
> ---
> Change in v6:
>   -Fix all clock leak paths comprehensively
>   -PCIe syscon update failure path
>   -SATA DPLL lock check path (also fix incorrect return logic)
>   -SATA errata path in ti_pipe3_exit()
> ---
>  drivers/phy/ti/phy-ti-pipe3.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/ti/phy-ti-pipe3.c b/drivers/phy/ti/phy-ti-pipe3.c
> index b5543b5c674c..b8c055893742 100644
> --- a/drivers/phy/ti/phy-ti-pipe3.c
> +++ b/drivers/phy/ti/phy-ti-pipe3.c
> @@ -500,7 +500,10 @@ static int ti_pipe3_init(struct phy *x)
>  	u32 val;
>  	int ret = 0;

Now this initialization becomes redundant.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
