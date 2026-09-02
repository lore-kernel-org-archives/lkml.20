Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BF434CFAB;
	Wed,  2 Sep 2026 07:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788335358; cv=none; b=asGY4N5lr0sAsk7mThzf4Us5QVL5yGAYN1FOQPlnvcduKhJGFUyk994chfDv9yqOO37sAMRJuanJPRPt0zYYEkqQVlPGIutS8lM/cL0WP2iFZrVakeg5HYIGdgX0vAUOTygG6F3ITrQ4BT2XVDKI4nhVpXO6A0Ibn/0bJxCth4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788335358; c=relaxed/simple;
	bh=03qe3iU0xHajNwJ/JkU7x9IQhvLwEB8ffAtvkb7VM7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iexy9RdsnFL5I/bdfQ52U/wsQ9L83ahMlI+mLFgd5X0gXYMuk5IlctrAlJITg5I6I2hYx9q3axUNsGNUlxYvQWMR/n/sXSt4UhXtZKf69YusmRiktKX8uU1jWzydHZmJw8SYFYZx5oqp51XcwareEMPmX70hewK8FBXGnM+7jIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MSPWSuLF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MSPWSuLF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77D951F000E9;
	Wed,  2 Sep 2026 07:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788335357;
	bh=s8Eo7ol2MpLclIW3Ma0lRro98Gdwdec1Kmfw5HO+SmE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MSPWSuLF0lYksTPJltML1tzWwBvAzoU3G0OLlXcxLHJudeMCYu0pz7AAKTRNFo8P4
	 dYTbe3ZKOIskvQ/bUCgRa1IvxwEylNKBnDC1CHAINh14B2tNsSYgl1mwtC7XpEP5kR
	 kfhZg9aG+5KRSN3dPxx0s0S82VRhqqelwRqLujr0sRF9mdh3OxaeacsG24S+GJ7m19
	 8cCovTzAJz27XGWm8V1YeHiQDdyxLfUn4sk5al0nuXxjpBKg09KQPCZMvqG174J4BI
	 T5t5Tm3PKlo3OfVlKo4fV38yoPzN/zwAdVfK41k6pZTbcmFGAriexNvfoYlP2bPW81
	 yoNTW7O4KWm1g==
Date: Wed, 2 Sep 2026 13:18:51 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Saurabh Anand <saurabh.anand@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	Ritesh Kumar <quic_riteshk@quicinc.com>, Vishnuvardhan Prodduturi <quic_vproddut@quicinc.com>, 
	Mani Chandana Kuntumalla <quic_mkuntuma@quicinc.com>, Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH 1/4] phy: qcom: qmp-combo: delay Type-C mux switch while
 DP PHY is initializing
Message-ID: <37cs3ejjaldogjlh3oyhzxgedl2w2s6qk7sercwem5j23vdtb4@2dzhapohcgda>
References: <20260824-qcom-dp-typec-reconnect-fixes-v1-0-2825e5bf8a96@oss.qualcomm.com>
 <20260824-qcom-dp-typec-reconnect-fixes-v1-1-2825e5bf8a96@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824-qcom-dp-typec-reconnect-fixes-v1-1-2825e5bf8a96@oss.qualcomm.com>

On Mon, Aug 24, 2026 at 04:58:04PM +0530, Saurabh Anand wrote:
> The Type-C mux switch guard only checked dp_powered_on, which is set in
> qmp_combo_dp_power_on(). However there is a race window between
> qmp_combo_dp_init() and qmp_combo_dp_power_on() during which dp_init_count
> is non-zero but dp_powered_on is still false. A Type-C orientation change
> arriving in this window would proceed with the mux switch while the DP PHY
> is mid-initialization, corrupting the PHY state.
> 
> Extend the guard to also block the mux switch when dp_init_count is
> non-zero, covering the full period from dp_init through dp_power_on.
> 
> Signed-off-by: Saurabh Anand <saurabh.anand@oss.qualcomm.com>

If this patch fixes a race condition, it should have a Fixes tag.

- Mani
