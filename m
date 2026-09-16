Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CC94779B2
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789548147; cv=none; b=TyztWfkms+mjE/3gQxkltUXlHt3fTTyw++jQKHWjYdhB9ALR6P0+He+thFNKMXH+Fkm4DEssPom4gjpsnHYoUBqbLe0wESrxlEcvDSxZVUclxgAlDdY+kbUKytUDns0xkY1l9Q6ZnvgzGOdsJ+QHD6v4Krj8/+1VQJmo/CA4s6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789548147; c=relaxed/simple;
	bh=fjKtcLJlfJtmFpRSvMg6mGicHFdHyJY1hcyug7bC6UI=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=quxFNsCbZJl7n7tRjAwmB46vAmfwRBjoI5Oxw5jlDeDEvC3TJGjKOvT19etnOejVnxWT0bVnT+rs+uBgejcfliSxEP6Emf/tVkLCXVYfn6bTpQjh8+TyZdkDRc+quQv8igDiPrJLIfuDhD7JoBJEoSoJbMp2tW347sMEfmdpD5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Bpdc10Da; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Bpdc10Da"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4D8B54E40664;
	Wed, 16 Sep 2026 08:42:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1CFC560337;
	Wed, 16 Sep 2026 08:42:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 877B111C7B017;
	Wed, 16 Sep 2026 10:42:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789548141; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4OPwWv4AfwkFq39V089XU003s80IMC0/zFIA+U93f5M=;
	b=Bpdc10DatMCnwRbwWi8+UBAKw5prouFsN7Ih4oZn9tpTkxd1Xo9qwCeNt5IlSyEM0FjOI1
	SmDKqNyoh/ojJFIIqS8h1uVlzEUIBOLowUiFwBi6MIohK/fjulTIsHObpvIi+43OOd2GUz
	3OA9r+t62na8+V0y6vStdwj5HsDr8K9mmPVu27YVhzYJsvZOgtV1tiDdiG/HRh5wysP2SO
	d6rOn5KzmGq80iBCShgb+C8ZqS31sh9/4jxx8lgTlDX78vkkEPt3NaJ1NqUDsqo333AJLr
	WlSWR85JhAXyfBFu4mRVVOHdYATZySwkkk/dCiRj2lp2RqFbDgcr9yWjdTwAYQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 1/4] dt-bindings: lcdif: Add endpoint bus-width
 property
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260813092836.38367-2-francesco@dolcini.it>
References: <20260813092836.38367-1-francesco@dolcini.it>
 <20260813092836.38367-2-francesco@dolcini.it>
Date: Wed, 16 Sep 2026 10:42:13 +0200
Message-Id: <178954813308.214898.387135284303615232.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

On Thu, 13 Aug 2026 11:28:31 +0200, Francesco Dolcini <francesco@dolcini.it> wrote:
> The DPI output of the LCD interface can be configured with a bus width
> of 16, 18, or 24 bits. Introduce a bus-width property to the output
> endpoint, specifying the number of parallel RGB bits connected.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

