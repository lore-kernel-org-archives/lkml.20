Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F193D9DAC;
	Wed,  7 Oct 2026 06:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791354327; cv=none; b=kR97Nl8IgqcQlrw4W1JBSGALEGG/jH+mfgX3++5cj9aEpTg9CqbFbbamIrtKRggSJJJsKjbU5492ZrNWTMwD2MLJMtIatvFQahgN/lwxIBdR0M8cyseEVzwiblAMIMw4ibTh6exDeYbrNYqTcPHMC+1XTNngzBtjVrokkDt3lgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791354327; c=relaxed/simple;
	bh=/uPd5NySCOy42SqeiauxedVJtr5HTm2epUe2L5pQVUA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dBLx+5QvuBKiX/XUd2Q2pNhh6OgbMHL7/xYmLPfDDJdxW2b7nJ523P6YC4oiTJYJlPBk9x0eCR8i03lI8olksxssBF95iZK7RgOLu6l4AA2wD1nKPMghycQmWKRyf9X1Ne7Q23ugYSiQG3K1IQDMriEPCHazABIRxFYXiOEynI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=OEVEFzv8; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="OEVEFzv8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=MmWP2vge6LnbvH4d8lOidjYjO9CgllmRxPD5ReASLWE=;
	b=OEVEFzv8GIFiONK0sMa2bA+z4jE8QtTDMzEzqkg8gicZS0MFORRFug+t+b0mu2
	w0jI9lp4yjwqJD1qrhb/xmrRYsjBphfILhQSoax55XxbQ9VSYtyXC7ze6ztVI+Nm
	GceES9Ivw2ji4ZMSfGbtW2w8MM8/p86FaPXg6fDPs56ig=
From: Bob Hui <bg9oxa@163.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v8 2/2] arm64: dts: rockchip: Add ALIENTEK QuarkPi-CA2
Date: Wed, 07 Oct 2026 14:24:43 +0800
Message-ID: <179135428374.23998.13252521177249770220@163.com>
In-Reply-To: <sashiko-outbox-162642@kernel.org>
References: <20261007-quarkpi-ca2-v8-0-b83192bed07b@163.com> <20261007-quarkpi-ca2-v8-2-b83192bed07b@163.com> <sashiko-outbox-162642@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:QCgvCgDnT32r5cVqwrrxDA--.58191S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUj1v3UUUUU
X-CM-SenderInfo: lejz05rd6rljoofrz/xtbC3gywHmrF5az8XQAA37

Hi,

Thank you for the review, that is a good catch on the wording.

To answer the question: the board does have two LEDs.  One is the work LED
(GPIO1_D7, heartbeat trigger) that the gpio-leds node describes; the second
one is a power indicator that is hardwired and not software controllable,
so it has no device tree node.  Nothing is missing from the description -
the sentence is accurate, it just reads as if both LEDs were
software-controlled.

I will make the wording explicit if another revision becomes necessary, but
no functional change is needed here.

Thanks,
Bob

