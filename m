Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D771E43B6E1;
	Fri, 11 Sep 2026 06:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789109721; cv=none; b=tknmUeCKIfN/zS7W5erPC8a9UQAmJIJcEarV3OZB8c1X35VM0IRlKnXYVH8i12st7hiARZhCuedFCoMko+2tln9xsrqPQu98PrwDlObcZAqFK5vty/oziuAkz4Tck8P8uAnRGXzyZ/HEFdX6kCxmHxzHnBnCBUOOWYTC/G7E9PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789109721; c=relaxed/simple;
	bh=QrBxKFd+lCLiq4J/RpPqN89Bmwz6kY4DqM+2m0MMwtA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jx8bM631AFU9y9vuS5o7E0AA53gRNzWiSqT0KgtwJgST2L3usPYMhl8P/FAYW9/p3mc/SqZv2PngTS3HlgRISDFvVFw31yPyyxt++DGXTDoOBPNgqNtvkFwbdQGoMkU8isj8/QQHFOjBy+LGh0LvZrdarx1o907twckWEWyBk2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.. (unknown [14.220.232.127])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4d649de3c;
	Fri, 11 Sep 2026 14:55:07 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: razor1702@gmail.com
Cc: HystericalDragons@proton.me,
	amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	devnull+hystericaldragons.proton.me@kernel.org,
	diederik@cknow-tech.com,
	heiko@sntech.de,
	jensenhuang@friendlyarm.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	jonas@kwiboo.se
Subject: Re: [PATCH v3 1/5] arm64: dts: rockchip: Reset the NanoPi Zero2 PHY from the MDIO bus
Date: Fri, 11 Sep 2026 14:55:00 +0800
Message-Id: <20260911065500.3145846-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260909225002.976-1-razor1702@gmail.com>
References: <20260909225002.976-1-razor1702@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa08f3fa3b903a2kunm0979cd011deada
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDTENDVkkfTU4dTx1DGk0YTVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKT1VJSUtVSUhJVUpJTFlXWRYaDxIVHRRZQVlPS0hVSktISk
	5MTlVKS0tVSkJLS1kG

Hi,

>  &mdio1 {
> +	reset-delay-us = <20000>;
> +	reset-gpios = <&gpio4 RK_PC2 GPIO_ACTIVE_LOW>;
> +	reset-post-delay-us = <100000>;

This is an incorrect change, see also: [1]
Since you are using mainline U-Boot 2026.07, you should have
already noticed that nanopi-zero2-rk3528 is available.
Therefore, the nanopi-zero2-rk3528 target should be used
instead of generic-rk3528.

[1] https://lore.kernel.org/lkml/1e8da54f-ef87-4d31-9a0a-17c0ff66bee0@kwiboo.se/
