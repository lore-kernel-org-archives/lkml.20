Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830C3381EA3
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 18:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791482938; cv=none; b=QGoWUHv7yYeQt+SMn4qtfH7sQKfREfbPQ42MjcUOO9Rhw3sa+HZ93osSqckmSIqnqcsjewFhL+YswPiTs6DOsfZxZuGA4DfAUJ07Td3XFvf8wraXaUoOiC0vCZd8i2uCqGMPGKn50DXX9yUlBsOpZxwWH8pITtkIcCUjaqhY97s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791482938; c=relaxed/simple;
	bh=B5nRmyFYA9nCob5vEYWxJh8TyJF6F4b++ewazmwrXcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kqn+y17lZBOxyO1mbnozXY2xKp+OyPzA4xRRnMhkWd5wMpV7P/6jvi7/HrToKMsBdWBMLoW7vi9ptk/BpIjp1c9u5oDHhBqdzNyYxwLa14G47IT2Ea15njA+HWkwYi0BgRBXiB+K5BvB4WtYyWxj5FGtHue4XM5CgjWShWc4E7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=YndwBeLg; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="YndwBeLg"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=4z66aqJo1l1YspH17oLJxoIeFufDzkwqCpOg6u8MQ6g=; b=YndwBeLg1/XhS/cOGCFIDVErsf
	uClpxm+fDnQeNi4DJdF1+dvHOinXuPM5a0IzRMQRLdYyMqTfz0PnHJDM7egQh0mlL1TC96vkzHlkg
	KpsDYcU62MfU5vR/piMMcFM2lGQPVPKEZxAo6ewpkRaqLiklUIvEN1cq/6BlehjCoUgA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xEsXu-009fjF-Gf; Thu, 08 Oct 2026 20:08:46 +0200
Date: Thu, 8 Oct 2026 20:08:46 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
	Jason Cooper <jason@lakedaemon.net>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: mvebu: mvebu-soc-id: fix missing clk_put() on error
 path
Message-ID: <1d32e115-17c4-4bd2-9689-907ac8f324df@lunn.ch>
References: <20261008171410.2717704-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008171410.2717704-1-vulab@iscas.ac.cn>

On Fri, Oct 09, 2026 at 01:14:10AM +0800, Haotian Zhang wrote:
> get_soc_id_by_pci() takes a reference on the PCIe clock with
> of_clk_get_by_name(), but when clk_prepare_enable() fails it jumps to
> the clk_err label, which only drops the device node references and never
> calls clk_put(). The struct clk and the clock core reference it holds
> are leaked on that error path.

	/*
	 * If the PCIe unit is actually enabled and we have PCI
	 * support in the kernel, we intentionally do not release the
	 * reference to the clock.
...

Given this comment, you need more detail in the commit message to
explain how your change and this comment goes together.

    Andrew

---
pw-bot: cr
