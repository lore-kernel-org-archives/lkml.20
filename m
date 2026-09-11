Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3F430566A;
	Fri, 11 Sep 2026 05:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789104308; cv=none; b=dYbXmuPRa5k/rR8CTWk/5SBya/W1bPa8o/qByJ5WdqpLFeBLFHHIIh1Yisev2xSc83p0vFOIbykecGsEYcqtKCq/Q4yApd1kFtOKcCak2n3+R3q6wKM9H4qeUv3gpXwOSsaMbJAPgBQkdiYcA1VDxHAi0TLaAyGOMqUHPH4pJoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789104308; c=relaxed/simple;
	bh=6d98ZDEUAmdRP+PXtqFw9GUWuz+te0V/xY/XTQ48DcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dIHjMM2RcOlc28Vdqu6GNOKg/U/1ZvJYxa9nBFze7ftUrJuOr3hmLNAqOzlBVQhw5UrSnZi4D2FgsCux51FFscUqwkC0e39O0T1qIiB0ZjeSS7/Ss2JXxij/3+FygcLJWJirs4YLhRoQ9uSMBxOmwUtwHk0fCqImjoXD726z1qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BYbY9SCS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BYbY9SCS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 818381F000FF;
	Fri, 11 Sep 2026 05:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789104307;
	bh=SBjJkWUnyP5rvZt8DFV/tYXDDBlvGlmDya2PBqMAKV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BYbY9SCSOuqF/R1MWxssoJyxk9Lx8GpgiAnMaz/pvCsLiKM7Maf/zlUbbwWcz/zfx
	 oU9+2717R/rj0wY3JT+EtaXhGeQrtVx8aWB9jRRblHntGsfxyPbwpNEF6meVHQemvw
	 3JX1W+b/8Jlht/kKO7oGwPF28CbkRASqNOkhBHHtImVSVHmSIw6sd2iOsz+2xULH3M
	 7QyTM211hQv6rm853yzSklI22eGsTGCZSwrPP1Z7qXcfm49L0SqGhcP0xdgz0R0/B6
	 YbySSiyyrn8MEUJcKnTpGNPy3nnw4dhmMWvEWlbs+6JuK7IgeNNOuRgofbYfXm95te
	 YQ/kZoDeMaSXw==
Date: Fri, 11 Sep 2026 07:25:00 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>, 
	Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH v4 4/9] phy: qualcomm: qmp-combo: Add hardware-specific
 DP PHY config fields
Message-ID: <7g6jz5lxcvwhq6xhbhovvszblil4z7whco2gnz62npv2kojq7e@5fahqmtsqn6h>
References: <20260908-glymur-phy-v3-v4-0-ff22e5150538@oss.qualcomm.com>
 <20260908-glymur-phy-v3-v4-4-ff22e5150538@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260908-glymur-phy-v3-v4-4-ff22e5150538@oss.qualcomm.com>

On Tue, Sep 08, 2026 at 07:30:57PM +0530, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Add dp_aux_cfg2, dp_phy_cfg1, and dp_mode_ignore_reverse fields to
> qmp_phy_cfg to allow hardware-specific DP PHY register values to be
> specified per-platform rather than hardcoded in the configure functions.
> 
> Define named constants QSERDES_DP_PHY_AUX_CFG2_V456/V8 and
> QSERDES_DP_PHY_CFG1_V456/V8 for better readability and maintainability.
> 
> Populate the new fields in all existing DP PHY cfg structures:
> - V456-based platforms (sar2130p, sc8180x, sc8280xp, x1e80100, sm8250,
>   sm8350, sm8475, sm8550, sm8650, sm8750) use V456 constants
> - Glymur (V8) uses V8 constants and sets dp_mode_ignore_reverse = true
> 
> Update qmp_combo_configure_dp_mode() to honor dp_mode_ignore_reverse,
> so Glymur can bypass TypeC orientation-based lane reversal.
> 

I believe this dp_mode_ignore_reverse should be in a separate patch with
relevant fixes tag.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
