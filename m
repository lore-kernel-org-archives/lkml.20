Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794478271;
	b=BgRtdtF//vdE4Zwbs2hbjSHYNO+JQAJKipWe80jhj7yb6Mtgrx4tvgnd0R5rVH0fnlhG
	 B1ZcugdTirLn1pbtv6Lm2YQbmqJMITXVIwJlTe/yM/9n9+e/MoKSOEx5yy/F/RpEEK4HT
	 u9MTC921twnElQ8V2viL7sj3hfJbkZItXq0AtC4OkBiYKQ2+bga6ZcUmvzuH0QbD/St0V
	 T0gGpHSjf/ODSTsFARwk7bLpxPb7xQlmo0KMNPfm6vrOUKlyHG0LJ3bUD8AQqTguZAzMO
	 sTozovqYd8aiQUV1lv/KjvXd5Lr6Xr3GBSIC9Vlqs9l7wYfWuwSf6pEXDvcRTf48gfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794478271;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=8Qk6qZaK3tkWe2Kgova6nUSv75sZHGXC4JSoRJF2JY4=;
	b=iLR76wgEjzurqt3r4SnPaar7WtKcPDhTVC4EHGD9APKiziFUalPQyB2SQbRz9nv5PfHT
	 c1rQcUB+ozrC8rvf3Nj0DAzOCWAqBhlNpzHyKR4Py0zCxbCJz/BQILggtR7hHqZ8U0H5K
	 h/Yy767/0n3gF/XhBZRVBNs+qR1quX4USMEnTT/P/FnX+DNG3sfMOmZk3zyhYkNQvLhqb
	 DheWmD40RtgTfbo4N1mhb82yIArU/C+jjZc9tuIO3i51lnlwnc5/cPnWGdD6Z6XXbo/SH
	 rhF602NhQp+4gubSep7Sez4zOYxt5YQMiteYnK5UC3loeymw3yt7UaYyJm1gsDxt0SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dmuAPp6q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 7D4FE606A321;
	Thu, 12 Nov 2026 10:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dmuAPp6q
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 336D71F00A05;
	Thu, 12 Nov 2026 10:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794478271;
	bh=8Qk6qZaK3tkWe2Kgova6nUSv75sZHGXC4JSoRJF2JY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dmuAPp6q+2iKC3LGZAOYV5gqT4TmieDfSiLC+tFZFNjy+G5kL6+SrjNSsSsizUHXp
	 ffrpgm6M4+VjJwAcx2lXVqiOacnR2C7yrntmdGd96CzRHEAJSqVx0lQzaRljmEURZL
	 4K0/YT/POxUCrWHCWt1XJVu8xnpigrLcCZK80Nfvtk4k1fU0LoqiiQ2J/VLXTPEGVd
	 cJ968w6fGHmxpoOhNlFu+hqqoL632XtjuRwY/lZsvH44yfH1/8SE7S25SNnmf4zFub
	 4H9zMnIElzWDtbrI0sDwL3rvOmgjo16k9F/FpWvDjoJHhTKVNr8YZfKfgxu7BOBv5J
	 yeHnAreDv3/DQ==
Date: Thu, 12 Nov 2026 11:11:07 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: nord: Sort adreno_smmu_0 node by unit
 address
Message-ID: <y3fwt2tzmnpz2qiydyov64oqafv55jtk5a3vnoyeqsrf5igzj7@yggwe45mzvsz>
References: <20261111034756.3632469-1-shengchao.guo@oss.qualcomm.com>
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
In-Reply-To: <20261111034756.3632469-1-shengchao.guo@oss.qualcomm.com>

On Wed, Nov 11, 2026 at 11:47:56AM +0800, Shawn Guo wrote:
> The adreno_smmu_0 node at 0x3da0000 was placed after ipcc0 at 0x9007000,
> breaking the unit address ordering of nodes under /soc.
> 
> Move it between syscon@1f60000 and remoteproc@4c00000.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
