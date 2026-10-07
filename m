Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2C23515F9;
	Wed,  7 Oct 2026 02:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791339039; cv=none; b=Iy+IVysXAITwqu/ty+dfS/tYVRY2CCuLVGfTBnJkTTM14r0ijvo1szbe/oGS3Sv1alTOxXL0SoUPUQngvv+hbQLJC6ocqmhQ2fVWxLTEJJ1LLUfPUN+r9p6HHzEiWZSgBWTCtGmaT2bOmi4r2m3BIFB21aG/xnXK8krn1HiyP90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791339039; c=relaxed/simple;
	bh=ZSFx9e4NLCBFbnBrX/giItQeBUAw3iK1iZmuaLyAuRs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BXDNR6arF071cfw5ICkVHsqNfzPEgYu6+9Wx65KHyTpKVp2xDlSwUBGoIhWzYTFlgQbEHX1DiKPRHTwEcopZpEfphQqQPztfMNEbXVhm8PuU15P44sH9hVg0FsTovWWBsM12a3gPlPApBB9q1jXmcbfexFznY6Oqxd1HSnLADeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=LBAkptJd; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="LBAkptJd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=T0pC+g1pgTGn4VTUvhrGyt6O3bxv6jxRh/sbMmdk4+s=; b=LBAkptJdcri9ZWIhncMBNUYL/i
	5DCW2dOZp9ZHE+5Ige3qM2WZ8LpCuEjasmdGGMo7LrsnOBM8j23iFpzZxW6cy+3X6smqMqV0AOX2X
	qK8ki2us6cuk6p5e4nLusTr6cd9fEuf8SxaDsB6l+yfKw5BVngcj5iEtCBHlgubSzPU+/XTyfDfav
	jTaIaIhYbnhJ5pLBRTYwGzXJgl4XN4IRl5gPa2QM67vc1+A3pks5ImwQitAz1FYzM54layxpvfY1l
	iM1zSBehtzqSMC3Yil0Y1QChniwYZzYLTTmMzN4ouSYy65KrmxHeQJ4+FShmzhF3HULnqPzMFacSc
	g64bf/Mg==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEH72-00000001dN6-32rF;
	Wed, 07 Oct 2026 02:10:32 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] media: i2c: imx576: select VIDEO_CCS_PLL to repair build error
Date: Tue,  6 Oct 2026 19:10:30 -0700
Message-ID: <20261007021030.2247147-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

or1k-linux-ld: drivers/media/i2c/imx576.o: in function `imx576_probe':
drivers/media/i2c/imx576.c:612:(.text+0xf68): undefined reference to `ccs_pll_calculate'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Cc: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org

 drivers/media/i2c/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next.orig/drivers/media/i2c/Kconfig
+++ linux-next/drivers/media/i2c/Kconfig
@@ -313,6 +313,7 @@ config VIDEO_IMX471
 config VIDEO_IMX576
         tristate "Sony IMX576 sensor support"
         select V4L2_CCI_I2C
+	select VIDEO_CCS_PLL
         help
           This is a Video4Linux2 sensor driver for the Sony
           IMX576 camera.
