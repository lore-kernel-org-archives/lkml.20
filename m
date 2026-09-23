Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085542773D;
	Wed, 23 Sep 2026 06:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790145638; cv=none; b=OP/MTnNFbqwCHfQ0mxjPlfcVlEpmxNtATpBOv39TkAR/sACoRvVtAD5YDKsvPt4GyiRWm8wDF+i+0F8gcU6v5n6PKX6i6U+GszXHuOHT/IW+CvMFZktHnJZtOxqhYNlGiL3/E7d7GBcKmu58QxMhH7Hz2XN6Kcn9OOZ3x1Rnwpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790145638; c=relaxed/simple;
	bh=IkxXwRhPR1hKjCD1EX3tRkdvMw33DfJIfWTZfOVmEBg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VFzGIDv0EhO0LykVfz6T5/9pvObNJh+KXICMJqijrpXjC8jxR1I0y1CNiDpaZzMDB/nl1lw4/OQXLUBDrXwMIVfji4YD8iBhJNhTbINj/c1IudFCGuE11ro4by/002V9tPSBu9221HcaEPXqEBGaN3CNclX1oUdWnKo5s5UHsUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.. (unknown [14.220.232.127])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4ed5b22fd;
	Wed, 23 Sep 2026 14:40:24 +0800 (GMT+08:00)
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
Date: Wed, 23 Sep 2026 14:40:20 +0800
Message-Id: <20260923064020.210794-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260922072910-GKB353745@kernel.org>
References: <20260922072910-GKB353745@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0ccfe7abf03a2kunma5b305ac7f7e3
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDSh0eVhlISk5MSEwZGUNMQlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKT1VJSUtVSUhJVUpJTFlXWRYaDxIVHRRZQVlPS0hVQkJJTk
	tVSktLVUpCS0JZBg++

Hi,

> So checked the code, it's not a direct problem of /alias, but due to the
> env variable provided to override the mac address, see

> In this case, I don't think it's necessary to drop the ethernet alias,
> I mean it's totally fine if there is uboot ethaddr env and it wins

Once U-Boot overwrites the MAC address in the DT, of_get_mac_address()
will return 0, and of_get_mac_address_nvmem() will not be called.
Then I think this patch is useless.

Thanks,
Chukun
