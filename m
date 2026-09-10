Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA33D485CE6;
	Thu, 10 Sep 2026 12:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789043797; cv=none; b=bdSwVDsvgYclKVNg3+4Z3nTpiR0u5YkLXyBEHTR9qAydx9QjB57jw3qO8E2RVltEmNv5hZKHrg0JYgQzohOnclhImc3caupUiNI/b+ACtEVp9WaqY7cBUlCOfJipxbTyPA1xU6xYbLbwplPeI9lkamz2TZMO2iCPJpk5RN3Dt1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789043797; c=relaxed/simple;
	bh=GGWoMtEMJOOna8BsWvzLxAt+XCD4g3D8B15ultRE7ow=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Rc/T20eeXv+LTh5loF5KeYc55eKAwpJa7vI1V4Rgp/JeYrIYZ7GvC3bCF3O76byBlzW2d0xurX69606TvgdY/0izhLhx5+I2JerDc4jV7/e79oDKfRE9HlC82/iVmzNf39Juz68xwLhTS73RObPtcHfzepLhId+N/xOY6siHHJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.. (unknown [14.220.232.127])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4d4a79e9b;
	Thu, 10 Sep 2026 20:36:27 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: dlan@kernel.org
Cc: alex@ghiti.fr,
	amadeus@jmu.edu.cn,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	gsh517025@gmail.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	pjw@kernel.org,
	robh@kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: enable onboard eeprom for OrangePi
Date: Thu, 10 Sep 2026 20:36:20 +0800
Message-Id: <20260910123620.2886557-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260910122344-GKB20735@kernel.org>
References: <20260910122344-GKB20735@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa08b51c5ae03a2kunm82f4832b1ac55a
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaQkJMVk0eGEsfQ05PS0tOHlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKT1VJSUtVSUhJVUpJTFlXWRYaDxIVHRRZQVlPS0hVQkJJTk
	tVSktLVUpCS0JZBg++

Hi,

> Just let me know if you guys want to do in another separate patch, so I could
> take this patch first, or want to squash together and send an incremental
> version? P.S checked k1-bananapi-cm6 board which already done as suggested..

I will send a separate patch for the MAC address.

Thanks,
Chukun
