Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A985140B119;
	Sun,  4 Oct 2026 21:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791149392; cv=none; b=Gf6+SnTtueKFiAS97D1kkQJmCMadfBohHOGT4NEexFAzmKU8mZBg/X+eg0FQSyyBee1ZFjo5FN2Q0nculodVeNdBWK+2L76X7oIglZLwj5Eft585zCre8Bfuo/aN2KJp2Y8D6gVlyndX7pPEN/UwWO3geQ+Mokiof4uupyivyrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791149392; c=relaxed/simple;
	bh=TYe4rW4o2vqZO6QkMGQLiHW6+NnADcGNTuGib3Ov7yw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tEPHjq6SraE2ThpggHkDX9fm+sw0tbRsU2b1nnGFGCKJeI+SNNazGT52mFR+nxdyP2GGH1K6Rf8vcTozCc1XBLL8Z35RYrSnpgDV+00kw+JaGDsQ5BaWmWNOmxrX8yfXoL+S5th0rmK1oQSnneMm1qUU6bEauf5Clfd7YlOPK6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=jdBvLkhe; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="jdBvLkhe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=YodB7Djkxkxsr6YA3Pc28UrEIZmZxedLSYMQiXw1jHw=; b=jdBvLkheJCjQHxedaKjTcsbT0U
	RQSYlVyl7JVVq1OIUY0LwRal1qRyHtvkJE8DEXyL+XRuaIv4k4ffzjCYjEkqgnDQJamDCvlS/HU4s
	pZQoSFX9saFWVJMROoXQw+uIJrBbLqpS3GR1h9kjrDWivFPWCnSwedidqFbk2ASYVm2k=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xDTmB-008wcB-Nh; Sun, 04 Oct 2026 23:29:43 +0200
Date: Sun, 4 Oct 2026 23:29:43 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Pufan Jin <2254650260@qq.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] arm64: zynqmp: Add support for EBDEE EdgeBoard FZ3A
Message-ID: <f1e7750f-7057-4430-9783-83dc8a8a2e23@lunn.ch>
References: <tencent_E9086080313181C5F806E5543C9638DC270A@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_E9086080313181C5F806E5543C9638DC270A@qq.com>

On Sun, Oct 04, 2026 at 03:46:22AM +0800, Pufan Jin wrote:
> The EBDEE EdgeBoard FZ3A is a development board built around the MYIR
> MYS-CZU3EG SoM, based on the Xilinx Zynq UltraScale+ XCZU3EG.

What exactly are you describing here. The SoM or the carrier board?

Generally, there is a dtsi for the SoM, and a dts for the carrier
board which includes the SoM .dtsi file.

      Andrew
