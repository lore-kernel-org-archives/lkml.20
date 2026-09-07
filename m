Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73D738B7D9;
	Mon,  7 Sep 2026 06:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788762634; cv=none; b=aDdyBGPL/W/WKYjmGW2zbw4HS/W2H7CqAKNwt5uu5ELfBkUOOplY/P9qlsNRrb1rXAskn+uyXpIpeNiWju9zWSMmJuZhjfRtUSJS2ezlt4Sw+rxo32N7BiEVElt7XLIIAABe7CdUfQWnlurs+xaCj2A8fFF2f4JohZI5hAWsoJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788762634; c=relaxed/simple;
	bh=rs27ygsYJCGDtfxVVxP/oIq8K0T2ks5aIvLOIkjg8RU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aVb35zTx0RVwrFh/8WLu0tltFXXWwWulrnA9EXxSAyfpBbPX/n8L9i4wFleKRg1ML7AvxmFxA6FSDS2WnOq4QvHZSYWmiOP+U3jJYbHoWntKhO2l0R1f1Zs7DxZyL5cG5Y47REyF36SqtLeDZSehZ61LC9oBBh8u6ZeVfTcfu6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.. (unknown [14.220.232.127])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4cc5f275b;
	Mon, 7 Sep 2026 14:30:20 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: gsh517025@gmail.com
Cc: alex@ghiti.fr,
	amadeus@jmu.edu.cn,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dlan@kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	pjw@kernel.org,
	robh@kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: enable onboard eeprom for OrangePi
Date: Mon,  7 Sep 2026 14:30:10 +0800
Message-Id: <20260907063010.1882362-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <4e8e6f90-9731-4416-8b1a-be1cef12bb72@gmail.com>
References: <4e8e6f90-9731-4416-8b1a-be1cef12bb72@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa07a8f81c903a2kunmf8319171daf5f
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCQ01OVkhOTkgZSx8dTEIYSVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKT1VJSUtVSUhJVUpJTFlXWRYaDxIVHRRZQVlPS0hVQkJJTk
	tVSktLVUpCS0JZBg++

Hi,

> -         mac-address {
> +         mac_address: mac-address {

This requires removing the aliases for Ethernet.

> But I am not sure whether this wiring should be part of this patch.
> Without such wiring, the kernel falls back to random MAC addresses
> on this board.

Currently, U-Boot patches the MAC address using the Ethernet alias
from the Device Tree. The vendor U-Boot reads the MAC address from
the eeprom. I think the mainline U-Boot will add this feature, so
we don't need to add this one?

Thanks,
Chukun
