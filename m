Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922659;
	b=q32TxVD40x+OU+Bt78GaNEBQOe/+8YwJV9tVpbYyAYOWeOm59/DQNjmm2en8mdWidbio
	 6m+SyPX/2k64TcIPJ09f45GtVMIU3GBo1devD8u8ruucizIFkoGl0RjvXQnGHj63zxP1f
	 7lpDeCn7iqhiKvhn1EIpzjDE8haLEKwMB3Tntv9gsvS6eKcqENba+k98KtH73X0ZCx2mw
	 gmUzrVkqraraGYVxFuaAnmm8+SRcCXoRB1G0dV95jW12KO3H6FQfPivpm46jh6uZK3lAQ
	 FbL+ooEUBLk18ojvNwZOcEZkXA1W9vZMRBYiOdARxt1IyemP7vra2h2FIphmLqmVwNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922659;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=g7MlRucj6hzoIqlqipb4GtdWwD9O/OEsZ9EcZBH/LpA=;
	b=BSQi82CKRXIJh/3zifWLf9B9HG7w6BR6SSs8zOYkc/c8+vM16PrvYbQngYnuB/oR0x06
	 TOm75KWvf8MkDE/Xv9eGBFLKpFZNnxpgrkI3j1QVfe0dnAKwt9OPDyYYEZ3dekQIaE/A2
	 4a5LXpON1loOS3Xi3G+C3xldNnPlwazkBpmoS3qlT12/BrjjgRV46c+Y1iVUFP2aeYi64
	 wIRijRtziGkltp4y8EbXSr7wTyyW/JbQBHIYgBjeJ4riwJTXur1bzTOZkWcy/pjiIEwB4
	 s2QgswgBlVbrWtHCeW0NxgszHpmeizZ2bnrk6BN4bhK8/+h3LTeIYiqi1CtGz8emE6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=tvnr+SFq;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D152606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:37:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D152606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=tvnr+SFq
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4D2C21A162D;
	Tue, 17 Nov 2026 13:37:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 18F5F5FC81;
	Tue, 17 Nov 2026 13:37:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D972411BC0036;
	Tue, 17 Nov 2026 14:37:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794922654; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=g7MlRucj6hzoIqlqipb4GtdWwD9O/OEsZ9EcZBH/LpA=;
	b=tvnr+SFqz0ANaFeOIu2h7eLOvHj0EZWnuxud/WDxtHQ4Zpt3cbqbm0d0jztVWnscm1UMlA
	6El1kdJKO4OWPwf29oO6VWr6RwMA0BDppRnjq6DbpEiRDD0POTTkPdWuMbNuGEMMkTms69
	F9PrzKH+Mku9uLcsm/+nrLcGJsOjmCtSWpkbVNpOnNcwo7OKLGRfgQdKcbfQvJPgkBF864
	Qdm5JjcTNXrCchaBQvHMRdc/d90o1TykSneuOr/g2msMi3m2zedQxbpJe5ih6BWsoLzVaY
	bcdGbL1lqC8Tl5C4w8G0TZW19BOawLDSFtFLDcfwEBBcHbJsCABk8n5Y70RNPg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Richard Weinberger <richard@nod.at>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Han Xu <han.xu@nxp.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Rosen Penev <rosenp@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Wentao Liang <vulab@iscas.ac.cn>, "Rob Herring (Arm)" <robh@kernel.org>, 
 Alok Tiwari <alok.a.tiwari@oracle.com>, Chen Ni <nichen@iscas.ac.cn>, 
 Runyu Xiao <runyu.xiao@seu.edu.cn>, Hemanth Selam <hemanth.selam@gmail.com>, 
 Pengpeng Hou <pengpeng@iscas.ac.cn>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, 
 Triet Hoang <triet.hoang.dev@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, linux-mips@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, Frank.Li@oss.nxp.com
Cc: imx@lists.linux.dev, vkoul@kernel.org
In-Reply-To: <20261102181406.3994422-1-Frank.Li@oss.nxp.com>
References: <20261102181406.3994422-1-Frank.Li@oss.nxp.com>
Subject: Re: [PATCH 1/1] mtd: use dmaengine_desc_set_callback()
Message-Id: <179492264476.2237190.6242832755498248346.b4-ty@bootlin.com>
Date: Tue, 17 Nov 2026 14:37:24 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

On Mon, 02 Nov 2026 13:13:41 -0500, Frank.Li@oss.nxp.com wrote:
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across sound drivers.
> 
> No functional change intended. Prepare to make struct
> dma_async_tx_descriptor private to the DMA engine.
> 
> [...]

Applied to mtd/next, thanks!

[1/1] mtd: use dmaengine_desc_set_callback()
      commit: dcfabf5f3939e02d344890fe4879d8488b93890c

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

