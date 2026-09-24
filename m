Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F2AA48EC8B;
	Thu, 24 Sep 2026 10:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246513; cv=none; b=AgTawhyxxIAQMfo+WlOSm89YReu5kSgno361/4+C9tTYIwfbWiRVAxKwRvUpfFcdottolIjTXygqXzquFWh5CsgiDv+b9LYUyKqdWJ/iHa++4wqj5BULYSvSmdszNyXWmU5qGQFbepiaVzMepXYTTddQrZFpJ9y9lNeiq2RCWrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246513; c=relaxed/simple;
	bh=RO4bB8psM2cjw7rK1przUDf9kuwWmEqLXuVjMVsQdcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lfo23nn7YXQHUOhMxZX+aXsk6uKlqIUebcnhdYW+e/BUMHa0NFr0h/oaZgEjiF365XHWjeIFM+pb1+va5PqgWy04aP5SlQlfIfYSSCY+Pkw/woyb9K464xHiw0/qGrFZidLfRlxWCB8SOTkxSgtnf00qB76BcoGYpIwLwXNexBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p200300f6af404a00e4ccc4fdbbd66590.dip0.t-ipconnect.de [IPv6:2003:f6:af40:4a00:e4cc:c4fd:bbd6:6590])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id D9DCD1C7465;
	Thu, 24 Sep 2026 12:41:41 +0200 (CEST)
Date: Thu, 24 Sep 2026 12:41:40 +0200
From: "Joerg Roedel (AMD)" <joro@8bytes.org>
To: Daniel Drake <dan@reactivated.net>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, nick.hollinghurst@raspberrypi.com, james.quinlan@broadcom.com, 
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v5 5/5] arm64: dts: broadcom: bcm2712: Add GPU IOMMU and
 IOMMU cache nodes
Message-ID: <arT-U_Rp0ZFMyCD7@8bytes.org>
References: <20260909-bcm2712-iommu-submit-v5-0-2539c52b249e@reactivated.net>
 <20260909-bcm2712-iommu-submit-v5-5-2539c52b249e@reactivated.net>
 <29bf6c8a-1689-4fda-b605-c972e91d1c73@reactivated.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <29bf6c8a-1689-4fda-b605-c972e91d1c73@reactivated.net>

On Fri, Sep 18, 2026 at 10:06:43PM +0100, Daniel Drake wrote:
> Working on it...

Thanks, please send a v6 when ready.
