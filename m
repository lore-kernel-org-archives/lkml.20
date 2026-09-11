Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4BD37473A;
	Fri, 11 Sep 2026 15:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789140161; cv=none; b=FHVcE7ullF2lzdG7wEdrisAUk4Mxd8M4WxztaviU0OVe2vAELBtZ6n19SVYWhPADoxMyB30qw92863xgRyODCtbkSe+3XkmPYNk6XJyh6GlrzVmK7LXk0EjXnSOJxjrPsIM7DUeBFCZnYbG/iUxXTMgOzTqsT1kgv5P5biO+U84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789140161; c=relaxed/simple;
	bh=pnvn6VK51bsdcs9/p9eAFLbgewvU2ePUZgnsgj/rkGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=unITcAV4qNmlAE7LrMnk5aNZKq0qAdfjq8R+kFwzEY1rgApk/N0cFCaQcnYkcj546KhXvpSnUK+aCk/BY2fBzDvtk4dgVfi5qY+uLfh5avWXCohLvW70PgSG4WKNlDhpRkrhhWJOEVRrjtoI1+ofpWkVmwj2H4lwgp1GO9p4YxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DKZRuG22; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DKZRuG22"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E8EF1F000FF;
	Fri, 11 Sep 2026 15:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789140159;
	bh=q+v1gtFzTVZ9q73cE4Nq8oqrnGDKcy3JKZg27z2WKH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DKZRuG22tMKiaV1cnpgF9/BNc3PHSh2tuhVG69RHesvJPA4iTQhpuyG1IqYuHAcTq
	 YoT2RrTEiZd2GD9q0OBK63mTsteCW/akfGzq3yI4Gv93AAeeSqspopySPQMb0txPXG
	 7BIWuQMcyigy/44YksoFS6d21BdEnZeOeVd3GsK+7O1bK3aGCOm5eXz/HihjZ6iDma
	 7qJtC8Z+L32JpDW3aiDV7ApiyzZAT85Y96Zu8cRCDgEiKP4MqUFz1qSOq+H70hmJgx
	 4NTbatYQyAM8cdYhDHa2ODijPAGY8z83k0frGa4UExCM/LMfz3XSd3J786uLF6UwgO
	 bHwpY3iIPBnjA==
Date: Fri, 11 Sep 2026 09:22:37 -0600
From: Keith Busch <kbusch@kernel.org>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org
Subject: Re: [PATCH v2 0/2] nvme: apple: add t8132 (M4) ANS2 NVMe support
Message-ID: <aqQcvdAl0FA4wslB@kbusch-mbp>
References: <20260906-apple-nvme-t8132-v2-0-ac0328590823@cyberchaos.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906-apple-nvme-t8132-v2-0-ac0328590823@cyberchaos.dev>

On Sun, Sep 06, 2026 at 10:15:28PM +0200, Yureka Lilian wrote:
> This patch series adds dt-bindings and driver support for ANS2 NVMe on
> the Apple t8132 (M4) SoC.
> 
> This variant requires the IO queues to be registered using additional
> MMIO writes. Otherwise it is largerly the same as the ANS2 NVMe variants
> present on Apple M1-M3 SoCs.

Thanks, applied to nvme-7.3.
