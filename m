Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969A647F3B6;
	Mon,  5 Oct 2026 17:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791222045; cv=none; b=MDBpSUWH+MNy33azVkpp4kvnrnmKI67DYtdkSbIkYaTN4P5EqV+Gd08h6qX6ENR+uYBj+2vGh8KMusr18TWPXhpO4Bild0Z1auQv2M4H/o6kywQd1eO2K5/6TUl8edIO435kKADs9vLU11NULmgHjTLLn1aOcv584DzGScAOUOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791222045; c=relaxed/simple;
	bh=7U8m1Zca4pEKhVmN7k/bLPJQg+o2jKIWLPV960mCk6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AKuh2pXXNFD/KzUC4Yoyre62ARgWJNDfJuRbl0EDuqtp71mtEF4wCU2gGcBO+DJL5tnF2e7AnNYfDUnHDqmF1J/dqqotaYfGyLazBGkWVvflVrCkuhaUBLou8SD7tsANZTGHhBxwGSJ8pb+BfjW+PQggxihtMZTawT7LS5EME9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AYBy8r2z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AYBy8r2z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52A521F000FF;
	Mon,  5 Oct 2026 17:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791222044;
	bh=E4Jqods8IWa/ZQf++Sp/pm73Ty9twiHlBoi2wyBEMeY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AYBy8r2zPPN96iYrCxO7dDwGAshqmqMYT9Xwli1hFFpFPfx6GsrtRizCD+56Ol6Vc
	 ExMs/eTJNdmY6oMDOe9Dzk1KL1ajy7/hSvMF3R95yBKilpjd/mdk0aQEfX0Jt0Syng
	 v7bqRQMKgVEFz+Tg8ggmzT+ucRNEUC8iyvH0G4le69jll6wzHNXwYeCEty1Oapm9Wu
	 Y1kaMJCLpD7DC3CWJK3h28C5ikIryGN0+NItACht0ndP1288W5hqIH8PceEI+8Ju9v
	 y8n/Cm75k/6fEt2qGfIH46DVMeVnOVL8alYQgrVcRVWe4tMSh7NfUi6NCF/zdw2bEm
	 vPguiYKnweQGQ==
Date: Mon, 5 Oct 2026 12:40:43 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Leo Yan <leo.yan@arm.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Mike Leach <mike.leach@arm.com>,
	Michal Simek <michal.simek@amd.com>, coresight@lists.linaro.org,
	linux-arm-msm@vger.kernel.org, Wei Xu <xuwei5@hisilicon.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: arm: coresight: Limit static replicator
 to atclk
Message-ID: <179122204306.1272624.8336607920043307135.robh@kernel.org>
References: <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-0-c3edca1c480b@arm.com>
 <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-1-c3edca1c480b@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-1-c3edca1c480b@arm.com>


On Fri, 02 Oct 2026 16:07:20 +0100, Leo Yan wrote:
> Static replicators have no programmable registers and need no APB
> programming clock.
> 
> The Zynq clock controller registers dbg_trc and dbg_apb and calls
> clk_prepare_enable() for each gate the bootloader left on. This does not
> depend on the CoreSight nodes' clock references, so removing the unused
> consumer entries leaves this protection intact.
> 
> Keep atclk optional for SoCs that need to control the trace datapath.
> The unchanged driver still accepts legacy firmware that supplies
> apb_pclk, atclk, or both by name.
> 
> Assisted-by: Codex:gpt-6
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  .../bindings/arm/arm,coresight-static-replicator.yaml         | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

