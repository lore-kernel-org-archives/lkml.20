Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794474222;
	b=5kW2nMCQe5MDK5v6nFIkzwbjy8kBxolIwxZ11LWfe5Elq3B2G0toWT9rcMDR3W5OLS3x
	 k2SEK/gaquG2/IZi1oNprDTQYobQ5UulFbutE9L1T+jqjZZ4wJ4ZOb0K0KaYfXbkqOVnr
	 7xuRIHD838+Vy04BK686eGnJ9VDiPXK7gpHehFBMiNOros8uelHASHqqtV9ldi9Znd0Vq
	 R3Fn0QC2PZGhOYvxmYliB+hc9yxAQJjPafJtSJOKnIMqVMxPo7pt1M+q+GLB6v7d7xX9K
	 0S8fEHYJ7KC1BinbDjE1/hL0q+qBKkl42p8VcQ1p3hazMM7eAIFx3UiT74fV0jj/KNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474222;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=4TzZAoqysIzaqY5zMZCOlG6RH0kDdxH5O/qMNybhu/s=;
	b=sA+UekV56s+lei2nIEKcEGJNnCduvCYEmxkuQG1lTQDPtHTB49q4Za2O/zQpep6p5U6d
	 UsFEmImJiNS/o22BzgupJsrzvu9MdnP6Pb8rftrR4PlTtw+9QA0wqP6r5e92ISNOOOpt6
	 I74C9nKywhpoM4gUyPjoFNFwobHjU0re1P/3qj0oFelLMPJ5dh7u10Dz4iovux8UyZEdC
	 6t29pQ727z/joe4UED2fnWG9yP/9JGMOkG3c+bH6VQ03HC1JF1oTbYBCNIWS/9fuC/ICJ
	 xQzAFS4lytC3dGg65+z/MPd5Z8kcYS/R/k3pW00v7faV2nAuJvd4jG2f8jkYDz4UGqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SuNPzHjH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A94606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SuNPzHjH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E4421F00A05;
	Thu, 12 Nov 2026 09:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794474221;
	bh=4TzZAoqysIzaqY5zMZCOlG6RH0kDdxH5O/qMNybhu/s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=SuNPzHjHvWtalDSiykqLa1Ab9VaWjm3jEK31H2lSO+1rJrZvmU9LsTdmRl6f+nBcd
	 yRp5WiZKdBYHzhvnxPyhQESL7Qh05hp7lNOUenCBJvlxp7/ufFOMLN2gpT0K5y0AMw
	 FY+DYhR9L4YORBRcM3TmwVS3ntNneP0E+1FgemGjtP5XjxUvnG3E0Hd9TxMxYUUcBB
	 n0K3b27+K5BKqZhhDpblaONO5vFXdD64zFyrvhoBa1oA2ghqX2+uM+SeQtbWwGzJp9
	 AOifOcJ8eTAeZet6PiG4+ToW2TKGjWavwUEQBCD/GRDGqyG/UxZR6AUWYMidgwalDX
	 dO5k4m7oFGzqA==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 =?utf-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0_=28Zhou_Yanjie=29?= <zhouyanjie@wanyeetech.com>, 
 Paul Cercueil <paul@crapouillou.net>, 
 =?utf-8?q?=E6=BC=86=E9=B9=8F=E6=8C=AF_=28Qi_Pengzhen=29?= <aric.pzqi@ingenic.com>, 
 Felix Gu <ustc.gu@gmail.com>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260906-ingenic-v1-1-2311f3df8ddc@gmail.com>
References: <20260906-ingenic-v1-1-2311f3df8ddc@gmail.com>
Subject: Re: [PATCH] phy: ingenic: fix unbalanced regulator disable in exit
Message-Id: <179447421909.428158.1735484115225895590.b4-ty@kernel.org>
Date: Thu, 12 Nov 2026 14:33:39 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Sun, 06 Sep 2026 21:30:31 +0800, Felix Gu wrote:
> exit() and power_off() both disable vcc_supply, so the regulator
> gets disabled twice for every power cycle, causing an unbalanced
> disable WARN.
> 
> Drop the regulator_disable() call from the exit callback and leave
> the regulator to the power_on/power_off pair.
> 
> [...]

Applied, thanks!

[1/1] phy: ingenic: fix unbalanced regulator disable in exit
      commit: 71c1be5cc4e083852c8437bd6afcb99ee3050e8e

Best regards,
-- 
~Vinod


