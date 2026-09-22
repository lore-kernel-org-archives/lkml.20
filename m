Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9660F4119E0;
	Tue, 22 Sep 2026 06:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790059816; cv=none; b=VGVrnXtNjiiWJeGPZJUO9HQe3TvttgFPhuWlWdOOv4IWtAWVQKYi+5TLzCJcMD7s0LmFRf9oPF2mT7dbKQUqxspbhcpnTBHuASu5veuuxDy8/AL0KUdG66KeQL4/gOY0vN3Vjy2Odb3u20bfT+u0l1anqZOGrSKWQMo5pd4fA1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790059816; c=relaxed/simple;
	bh=KyPkuLmmMKTjvDOFGsw8Mq7P9vKr0nZHryZUUHgxshQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SkoupaIUyPhSWViGnrvreM3MBfKjQV2f0bjgR5xDyo/8VrKajfpdDp9AwhCSTq8o2hQCvddwwoEnhOzKKbzwd+mjWqRSFYsnPIIJebNq93EVduV4ggROBpBeNb7n++0QlIj+4WiCAiBrsNrOvCK24RzyN+S8ROHj3wZSWqN2P+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.. (unknown [14.220.232.127])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4eaf44e16;
	Tue, 22 Sep 2026 14:50:07 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: dlan@kernel.org
Cc: alex@ghiti.fr,
	amadeus@jmu.edu.cn,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robh@kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: set ETH MAC from eeprom for OrangePi
Date: Tue, 22 Sep 2026 14:50:01 +0800
Message-Id: <20260922065001.1888961-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260921124206-GKI297024@kernel.org>
References: <20260921124206-GKI297024@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0c7e1019503a2kunmdae442db36297
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCHktNVh5CH0JIHh9OH0tPGlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKT1VJSUtVSUhJVUpJTFlXWRYaDxIVHRRZQVlPS0hVQkJJTk
	tVSktLVUpCS0JZBg++

Hi,

> Could you point me where the u-boot patching the MAC address?
> I'm not fully aware of this problem..

This is handled by U-Boot's fdt_fixup_ethernet() function:
https://github.com/u-boot/u-boot/blob/main/boot/fdt_support.c#L639

do_bootm_linux()
        |
boot_prep_linux()
        |
image_setup_linux()
        |
image_setup_libfdt()
        |
fdt_fixup_ethernet()

Thanks,
Chukun
