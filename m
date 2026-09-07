Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B0E503BC5;
	Mon,  7 Sep 2026 17:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788801838; cv=none; b=oRZwS/FmacGc5XCergDMmzaPs2aWdP0AGqsfprNdK2/kLozA35OX5cizTKfnwuwyagu/Rx3D0XBMI9ACX/TYLJOz5edTnv/1Rk2bMVT8hXPVk4GKHiFxNq9bSlTJhQzulKZDyAsvOiWn4So3oxb58togKRVTe35ho37Nx8Eah0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788801838; c=relaxed/simple;
	bh=VPIix+7AnaBedj/9o6f9YRK+QLjnUUv24fnzZhVoMeY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G/IZvc4rzwuKSADFrluak+vUJeVyH3bE64c6notNs9OWKq2XCEwhzn6RWWU5JhFtS4fi2uAmjS1TeN2QeZ7qQzpn2h3N2HpLWE/S9vCf8LaQGxraCDdsB/bg2mtKDFSTaSIxAXaGOraOdG2/1TZYQOVjef38dIbUdKonb3lcwL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AJvMuifV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AJvMuifV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 674201F00A3A;
	Mon,  7 Sep 2026 17:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788801837;
	bh=VPIix+7AnaBedj/9o6f9YRK+QLjnUUv24fnzZhVoMeY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=AJvMuifV/ySOJl35bWcRxUaZJ5UPFD8LTnXwHqNkE8397RX+9FesEOyfk1YcJrz4n
	 Fx0Mf1BatExxqtDFrIOyrWYHXW/WwZ717n8XtUOb34tx+X4dmXGgs6SEeWBOrza71H
	 +WZw7XZzG7fNsl4AKsXW/wpO5I8KEq4gYw128qr3oePlvnPPyorqklx7Hdtq08lMTf
	 oRnPazAmw1GUUeueqLoAaRWgE2amzDnP1tvVP+Q/cY0Q8bvjmINIJjyRriqt9ZjFGD
	 cBLUpT8P0xIIH/7xVZbKOhf6MMzN34Sx/xMf1akGFfOHRsiPdug63huToARwjGSyJO
	 yLxHrpLGPm2YA==
Message-ID: <4c10971a-6165-49e6-b97f-978bbe6e1cb3@kernel.org>
Date: Mon, 7 Sep 2026 19:23:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] nvme: apple: add t8132 (M4) ANS2 NVMe support
To: Yureka Lilian <yureka@cyberchaos.dev>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org
References: <20260906-apple-nvme-t8132-v2-0-ac0328590823@cyberchaos.dev>
 <20260906-apple-nvme-t8132-v2-2-ac0328590823@cyberchaos.dev>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20260906-apple-nvme-t8132-v2-2-ac0328590823@cyberchaos.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/6/26 22:15, Yureka Lilian wrote:
> Add support for ANS2 NVMe on the Apple t8132 (M4) SoC.
>
> This variant requires the IO queues to be registered using additional
> MMIO writes. The qsize of the create_{cq,sq} command is now ignored, and
> instead a write to mmio_nvme+0x1210 (which was previously known as
> APPLE_ANS_MAX_PEND_CMDS_CTRL) sets the IO queue sizes.
>
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
Reviewed-by: Sven Peter <sven@kernel.org>


Best,

Sven
