Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDA225228D;
	Mon, 12 Oct 2026 06:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791787232; cv=none; b=TVaZmS3GbXDIijje8tAGQslLvg1cwh5/TaL+H3ygDG2U0MtaVIixyLMnOlTJLEzdTmiD2u/aOjVtulWSj0aLKkd1KvvWRWLPLMwCSe36u9bK6/lY3YnWDgGqYBWbMhtcOPrGQCYyNZV0MbAop0ak+L+gJpLSe2kyOM//Z8spzPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791787232; c=relaxed/simple;
	bh=jzqAnj9dQp7NNHUBLaKUmEe9895MvJL714GIHZiesNc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=vGr/PdP2WwifYztgy/W7FE1QAYOGF6k6cDkGHIE+yCYnwYdH7K2WYnud4n0c0WrUQfWqPFffMpRnueZUiAGlnjy5BcKldqN9V6dYVQ/vXcLLmIvd2gG/VDQH8agS+tq+2FzUwdhC4xlol7hsX2aHBMBToMLMcNBoyWGxxmD7kMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.. (unknown [14.220.232.127])
	by smtp.qiye.163.com (Hmail) with ESMTP id 50af51f8a;
	Mon, 12 Oct 2026 14:40:17 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: shawn.lin@rock-chips.com
Cc: amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: Add Radxa E54C
Date: Mon, 12 Oct 2026 14:40:10 +0800
Message-Id: <20261012064010.1837103-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <4903cefa-4926-4bae-93e9-1165bb9ae646@rock-chips.com>
References: <4903cefa-4926-4bae-93e9-1165bb9ae646@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa12ed733ee03a2kunmf7c7b69346eed7
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDGUsfVhpPTEJKHUpNSE0fGFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKT1VJSUtVSUhJVUpJTFlXWRYaDxIVHRRZQVlPS0hVQkJJTk
	tVSktLVUpCS0JZBg++

Hi,

> I was checking all PCIe part of rockchip dts files and wondered why it's
> marked as an always-on regulator. But if it's actually not, it'd be 
> better to improve it later. That would make reset rootport mechanism
> work better.

Please refer to page 21 of the schematic[1]. The 3V3_PCIE regulator
is enabled by the PMIC and cannot be controlled by the kernel. So I
think it's correct to mark it as always-on.

[1] https://dl.radxa.com/e/e54c/hw/radxa_e54c_v1.2_schematic.pdf

Thanks,
Chukun
