Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AB42BEFEB
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 03:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789873811; cv=none; b=jO0qPpjG6UQVLeH0shiXST6pUwqDB97l8b0iLnhJyNFqj1LiwFC25EgTSzmrgBLS2pwdq0j0zHuCwz0TW7kp6CA+K+PoBd1cP7tySFe49Qi8gQ+BGMG6f5a+E7QLw5TyO6onWcPfYkP9B6kY4PdzLFZjrZpYvD+Fw5oux0sm8Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789873811; c=relaxed/simple;
	bh=Q7vrX1llvn0cZ3Jj37kQmXbVjGghG5YtAIquoU3Ts60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kk0pqnmj6gNG4nIMxiqP1Ej6dYBJyMr4eDrCsF7iA1kqa8f6+ErmEmZUHkDPHxzTtIty081BgRjQqUNMZdRoY1p9jepHcR/rNNshJDgCU7w1s1bhJfN8vUPGeKDlKwpK/9W9R67/viCJRT3smXoZVjKrLwIr2ZTmizdE7E44xeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=RE7X0uw/; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="RE7X0uw/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Q7
	vrX1llvn0cZ3Jj37kQmXbVjGghG5YtAIquoU3Ts60=; b=RE7X0uw/It9kkLk400
	3/dBt28WNWsODQyqn6DbIqZJvF4QXzklteTNY7yGCXj3iuSUxXNztzQd4sbwZr+Z
	MBbyd74LZ8xXbB72UnRjNjBXb3BtW5jQzLO7ybhh/a0wwbv+cRXVUVEY6QHzhm/h
	Nk8Y2Pf4G/tcHkgxYWKihqD94=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3l9tlTq9qet5TBw--.12349S2;
	Sun, 20 Sep 2026 11:09:25 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: claudiu.beznea@tuxon.dev
Cc: nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	hppiscas@163.com
Subject: Re: [PATCH v2] ARM: configs: sama5: enable current Microchip KSZ DSA symbols
Date: Sun, 20 Sep 2026 11:09:23 +0800
Message-ID: <20260920030923.97971-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <c55123de-f466-41c8-b50e-df28ecf3bc18@tuxon.dev>
References: <c55123de-f466-41c8-b50e-df28ecf3bc18@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3l9tlTq9qet5TBw--.12349S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvj4iJPE3UUUUU
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7QUz+2qvTmX7OgAA3P

Hi Claudiu,

I checked both changes. The first removed the KSZ9477 family option in
favour of the common option, and the second renamed the SPI provider.
Please include both tags with the patch:

Fixes: 07bca160469b ("net: dsa: microchip: common menuconfig for ksz series switch")
Fixes: 4658f2fe8fbc ("net: dsa: microchip: common ksz_spi_probe for ksz switches")

Thanks for the review.

Pengpeng

