Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC61515990;
	Mon, 21 Sep 2026 21:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790026942; cv=none; b=m6MDAvD053G3zZjkJdYTa6MoHKvCgotHPzqZNFI7X2Hz8FvOyxD5c/+GNVJgXbXmqq276jwevKMgsS8IX+5s7DuX41Od9wHQfIhPQFtR+dYSkgoHfQuDexCMQZ1+Hz5KKM8VJKe/S5hMgT88GdGElUSjXKp1dV4wY10Rfr1Lo38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790026942; c=relaxed/simple;
	bh=cb+z73BYCxZ9ugG399ntJNj0XrgGfSiQE/VNIsrXcuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T+8HmrVqwKecSEfyEVUZAQ8LhyC/Y1ev7g6Qly573/3yRDRD4HPvEiwOtW/jTcGhLUaO9O11G3OCzn/OgjRyBo5W/jHwG4rfkT4giurra0VlhqPPsKOaDJLZyGZiaqt2pFpmXj0kNZKya2iWFc5o5P3bOoqxe5ryYucOfinGd+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=fLz4pkLb; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="fLz4pkLb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=3+YlNT04wuL7W5HJgKLHPJrW8rii6yAHjR27a80KkNw=; b=fLz4pkLblNBR0y/c78KP+DzbWd
	QxeTaz7QHEAFVco7GZdSpbjgufOdVbAExtVEtfcxiGibW4RLM4YgHG2pPKOGcNJtXP8ZSdkbxyW6h
	rHuwPGEx7wTvTBzHviOv2R9oVD3oChfQ54RuNddw65vUsKdyitbXXfzOx+Lq1EHtUlEYuvj4j/PxX
	RgxeAzYIc4CPL+AzqqbJ1NGp9KoRPP2gJDWs+capzZ5929s3VjMBLFvsqT0z8qZhKqozqo5L/Fqpu
	TFWGrLdOfoYqxCIOSkXXBXcAxuYh82QEEQTEIf09Y+pOQd54VWRT3VpCQtDXqGlEJHdceT3uULgLW
	4sTYCLpQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexey Charkov <alchark@flipper.net>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Set gpioN aliases on RK3576
Date: Mon, 21 Sep 2026 23:42:02 +0200
Message-ID: <179002692015.1033956.17489310377805341851.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260914-rk3576-gpio-aliases-v1-1-ce5f86f9ae0e@flipper.net>
References: <20260914-rk3576-gpio-aliases-v1-1-ce5f86f9ae0e@flipper.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 14 Sep 2026 12:47:15 +0400, Alexey Charkov wrote:
> With no alias, the OS is free to number the GPIO chips arbitrarily, such
> as in probe order, which is what Linux kernel's rockchip_gpio_probe() does
> if its of_alias_get_id(np, "gpio") fails.
> 
> This results in GPIO chip numbers arbitrarily shuffled in userspace,
> causing confusion and pain.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Set gpioN aliases on RK3576
      commit: c818f4a85a40c12a5536d6016395a7eff5b44f8a

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
