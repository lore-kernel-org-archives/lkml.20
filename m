Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D317A3B1B4;
	Sun, 27 Sep 2026 00:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790467725; cv=none; b=e+bylhWQK4Pa5YVFDB024zTWH2ybie0G4g1LtqqVJPI0Qt2UGGx7/mVHaJMpQNO12F2oWAWJnZtaDcT7uVAHSAgQOkJn6JpoJ4N0g/CYhdSb2L9C8kwaIRUt9B8Ob26NDOBI6/ZL3w0BTQIk+3z0/E/5EtDtIj47rLfT8q2KbE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790467725; c=relaxed/simple;
	bh=m0fxoRT6EEkGC7cAzpzoy12Yrk9pfKkMNlCo5wYr8OQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FdpYtxVKXCozc2CUjAwh6UMUfLRYBIM//OyTkvasZxjFPnaKhdefTc1f8wpdZEecrvuF3cQVC0wPvSyb4USp5Q9gTUwT68UiiCKhIh4fD/xcqIwaJ5PVq8o/xvgrjNclAqiCfJh+2C2z8YZ9lYeMg9bPRCijHJxgS7Vyprtv5zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=gxq8amE9; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="gxq8amE9"
Received: from seu.edu.cn (unknown [58.241.16.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4f363ff9d;
	Sun, 27 Sep 2026 08:08:38 +0800 (GMT+08:00)
From: Slavin Liu <bolin.liu@seu.edu.cn>
To: error27@gmail.com
Cc: andriy.shevchenko@linux.intel.com,
	shengjiu.wang@gmail.com,
	xiubo.lee@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	bolin.liu@seu.edu.cn
Subject: Re: [PATCH] ASoC: fsl_asrc: check the second front-end DMA channel
Date: Sun, 27 Sep 2026 08:08:37 +0800
Message-Id: <20260927000837.10151-1-bolin.liu@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <arfYxD95RJRcKCbZ@stanley.mountain>
References: <20260913125147.109920-1-bolin.liu@seu.edu.cn> <arfGajXmMUeew0fr@stanley.mountain> <20260926141011.451552-1-bolin.liu@seu.edu.cn> <arfYxD95RJRcKCbZ@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0e0313ded03a1kunm718d2f09198cf1
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCHUNKVkwfH0gfSh4dQk0fQlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlOQ1VJT0pVSk1VSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhOQ0
	NVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=gxq8amE9UZiE8tCY4kpg++XrI/9ASn3V/B6Xp81XWMamSv/9Xrzig0YH4qPWkO3s1WooOBS2nVu9aXv2Dzp6nVv+RNMtn8w0+FhTEUqEsYnlkBXu8A1T0F7H4aQ+w+NOTjaUbHbbaRb2Du8fK/ShoT0BIILFyzknCeaKkr2wPZg=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=5wX2zHmVieIbX9IZliot43YE98VxjQn+jLn3httBBt4=;
	h=date:mime-version:subject:message-id:from;

Hi Dan,

You're right, sorry for the noise.  My v1 was written against mainline,
where dma_request_slave_channel() still exists, but Mark applied Andy's
conversion (b045248399d0) to for-7.4 three days before applying my
patch (b4136c0d69ea), so there ->get_dma_channel() propagates error
pointers and the !NULL check is ineffective.

I've just sent an incremental patch converting the check to IS_ERR()
("ASoC: fsl_asrc: fix second front-end channel check").

Best regards,
Slavin Liu
