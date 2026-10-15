Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A026259B663;
	Thu, 15 Oct 2026 20:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792096247; cv=none; b=ONGOesYCLxNbNswz70ZzCMzIczK6mjUptpObX423qq3+aWTSk3yCqOP5dlRGW3G+lpoxzE7zcRgTPNNAdfjzjBhZyIw1+Oh8mgVl+THUyQlISI/ojhbkiWwd7LLrqtvRE3yfxfSzlqZEMAeTdJYXRcu/XKaY1f1BVK4rsyzL4ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792096247; c=relaxed/simple;
	bh=Llya/iCUXE9QBGzYm70nguitOlGi8JAaUxBlY6NGYnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tV+booaGqvpODLQYv561yuTxoJ615u3ouEictHbMrPdKy+Kke47++VF86fCdBqIquxmgGF3jAO3CJnIyqRHCf7AaVr0Z/Yj9HiupsgNRFE9ytaMTQCKZtBB5LLQ+M+ECNC4aPA8Ceo7t7C311vMEW9bJnsb+YgFrDai/CEH6emM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aM3qhn2J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aM3qhn2J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB0211F000C4;
	Thu, 15 Oct 2026 20:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792096245;
	bh=URfziB+RyIP02hVDIQqdBJwppVeDD9L3S3oe92U9tBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aM3qhn2Jv+MxF6pn7Q4eodY6rAS2Po1i2tj5SPhIJm0gS9XpOBBbFW6QEMTtijmdt
	 7v24a2QT3fUgwCkOYOrSFov1KInJHvfA8VAi9x5ir2tLUqaSRWmF4ya4vDRQCcRxZ4
	 pouQM2nkBItybpN3NZrV9m6KxDPzb3/bxllCOjwF9IoO5FaYOnRKMq72iCWQZ3C9Lg
	 sfEG3SV3R7JT/0+vPLEmabT0isItZ4eO4Ohf/pdqONpirZlLm6X3pa3l/Ml/yGhxjM
	 WBRBp7bL7fg1yJ8KGA90V9PHvqq0bxF1sVh+LZTb8kgvLoMJGaNCWcM4TCWTC2Zdon
	 iZjik/DiI4/vA==
Date: Thu, 15 Oct 2026 15:30:43 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Luo Liu <Luo.Liu@cixtech.com>
Cc: vkoul@kernel.org, linux-arm-kernel@lists.infradead.org,
	EastLake.Yang@cixtech.com, cix-kernel-upstream@cixtech.com,
	mani@kernel.org, linux-kernel@vger.kernel.org, conor+dt@kernel.org,
	gary.yang@cixtech.com, krzk+dt@kernel.org, p.zabel@pengutronix.de,
	Wuyi.Shen@cixtech.com, devicetree@vger.kernel.org,
	neil.armstrong@linaro.org, linux-phy@lists.infradead.org,
	fugang.duan@cixtech.com
Subject: Re: [PATCH v3 1/3] dt-bindings: phy: Add CIX Sky1 DP PHY
Message-ID: <179209624254.3079823.9194269374126037719.robh@kernel.org>
References: <20261013095900.758464-1-Luo.Liu@cixtech.com>
 <20261013095900.758464-2-Luo.Liu@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013095900.758464-2-Luo.Liu@cixtech.com>


On Tue, 13 Oct 2026 17:58:58 +0800, Luo Liu wrote:
> Document the dedicated DisplayPort PHY on CIX Sky1, including the
> optional cix,edp board property to select the eDP swing table.
> Add a MAINTAINERS entry for the binding and driver.
> 
> Signed-off-by: Luo Liu <Luo.Liu@cixtech.com>
> ---
>  .../bindings/phy/cix,sky1-dp-phy.yaml         | 56 +++++++++++++++++++
>  MAINTAINERS                                   |  8 +++
>  2 files changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/cix,sky1-dp-phy.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

