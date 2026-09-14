Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C727937AA65;
	Mon, 14 Sep 2026 06:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789368669; cv=none; b=lrnxUjgWiUBRFqQAYxthe5KjfhMLa5vVccUDC6d8U5+yziWhJ3e8Ao4IRhrIDAlHd/1jF1oeeAPOXaJ3D/Zp4lJcMzUt0CCf4qa5mmUaaYPb52OU3f4nxYWjmvl+OBdT+4HaBWRBzo7ertkHEPQV85zcdiWG8a7UM0lbC0o4tGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789368669; c=relaxed/simple;
	bh=FH58T1cJG2QNPXTXkFCgmgj4Bw4fB/+HyjPR/fHyLFM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fCnX6MzqhwJaiELxdqoL1BjiglkzE+XpGh2SrmUKGRKRQpHu0hqXsT+ADvmK6hf/2I61KMEx8S6DqtJI178lEPk6r87w0J0urIeJ1RGghnKklxlWCfU6QJ+uV9YX1bcnJZ1JFA8dwVoBxMHPcANAWhjcaYS7EWkCMWRu9+Hf+is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.. (unknown [14.220.232.127])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4da4fe556;
	Mon, 14 Sep 2026 14:51:01 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: devnull+hystericaldragons.proton.me@kernel.org
Cc: HystericalDragons@proton.me,
	amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	diederik@cknow-tech.com,
	heiko@sntech.de,
	jensenhuang@friendlyarm.com,
	jonas@kwiboo.se,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	razor1702@gmail.com
Subject: Re: [PATCH v4 3/4] arm64: dts: rockchip: Add devicetree for the FriendlyElec NanoPi R28S
Date: Mon, 14 Sep 2026 14:50:40 +0800
Message-Id: <20260914065040.2413033-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260911-r28s-upstream-v4-3-fb6c85f226d4@proton.me>
References: <20260911-r28s-upstream-v4-3-fb6c85f226d4@proton.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa09eaef4f503a2kunm0a6ed9812a3691
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCTEJPVh9PS01CQ09OTE9JSFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKT1VJSUtVSUhJVUpJTFlXWRYaDxIVHRRZQVlPS0hVSktISk
	5MTlVKS0tVSkJLS1kG

Hi,

> +		button-user {
> +			debounce-interval = <50>;
> +			gpios = <&gpio4 RK_PB2 GPIO_ACTIVE_LOW>;
> +			label = "USER";
> +			linux,code = <KEY_RESTART>;

This is a custom button.
linux,code = <BTN_1>;

> +	leds {
> +		led-lan {
> +		led-sys {
> +		led-wan {   

Use led-[0-9] for naming.
Two of them are the same as zero2.

> +&pinctrl {
> +	leds {
> +		led1: led1 {
> +		led2: led2 {
> +		led_sys: led-sys {

Two of them are the same as zero2.
