Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793349172;
	b=yCk1ORlKRb2g2TOag/o/nLqdUYEOHqL45RianE1d+hQV/km7Wx1q66WjhY/kh5Bsv2Wq
	 zP9wS6/OWeW1S3tM4lAY4YpguoXIw+U31MFzqtOt2AnWjXOn5k5MjC6ViaN7ddTaE0apq
	 ofXxlRHiteZTvQtWqY3OBLAM2Ltrjpr5WCtWayJdr9rR7sjA2dMxDGzNYjreSxdD3GnhJ
	 2Y+TH5tTeNo42M1UPPXv01Zx2OEqPCVsdjrRSpwWJzyfHVxcJ4NKBNQIbiB4o/7TuLK7l
	 AncA5PnUYo9Ne9bPYz0c1TR0tb4rC7D5XGG+72wUUihqSKhlegcQdbzhs92qvmg5a7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793349172;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=iKvZ29sEWJfZcEU9wIFw4ZTo/462jt1dW6m5fcFQf2A=;
	b=jvTBTcxFH0jAPFAeZ78vxs8ten3suaN5bkP68zCytqNxZz0vQyORY1BOrGaYT+jaBVXj
	 7T8zoLXgqrs38fwYoVPhohZ+jMVuFbR7T6T/B6t3Bne3bl4cNFhQ0RzxJxAHLvA2hLDPv
	 8XxYWr9h/rHcrr2+3tvb/S3FFCMdRDXNrG9FrNW1pmo/A2liOvcgksoYSp1d+nwASSW8b
	 d9lXR80xh8WbbMJ13aozwM8SqYpeMqgqHZlomS/jkVA1P1PptwsvIvbzIQbVG+dyDng7h
	 BsNJ5Mm4qxelkhI3tAWJY4XdaIYV175CFsfWfytQT5WoSjVvFz1NQv6+TLlu5N1cq+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hLGYpr62;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B20606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hLGYpr62
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B29F1F000C1;
	Fri, 30 Oct 2026 08:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793349171;
	bh=iKvZ29sEWJfZcEU9wIFw4ZTo/462jt1dW6m5fcFQf2A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hLGYpr62os5YaII43isVPc3LFbwRHFV19BomfIKQss3uWosrbCjkZQOVmwVFR9mKz
	 6t65/ajJwLXSNYD5nF1B9sgNxSSFnc6gEEoqpSDB3JL0mRUT8hncnMw7ZD/JohlaT9
	 RmLLom4KpWzWUcoANyPxssMKMWqhKpYlpnZ0j0Ip9x3mOm17kvF/oDewSwXMEErpzr
	 SphBfP1MCjUUaVCsQgZKTQYsOjBTI8H68Hpr6GNq0chPzDc/SQleBmNxws8s7G/8BY
	 v/8o6kYdwG1qaMUyhVB+MKceHRlWe9Ra6MJ9ZL7anbwYXdpKjZDc73wWr157uh9IMz
	 +kwRhnci87ucw==
Date: Fri, 30 Oct 2026 08:32:48 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>, dario.binacchi@amarulasolutions.com,
	Linux STM32 <linux-stm32@st-md-mailman.stormreply.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: psci: handle unsupported SET_SUSPEND_MODE in
 PC mode
Message-ID: <20261030-origami-tarantula-of-contentment-a70ab2@sudeepholla>
References: <20261029191624.1.I5f8f3d75a566b72250d629ac6f43cf0d387c0218@changeid>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029191624.1.I5f8f3d75a566b72250d629ac6f43cf0d387c0218@changeid>

On Thu, Oct 29, 2026 at 07:16:25PM +0100, Patrick Delaunay wrote:
> The PSCI specification makes PSCI_SET_SUSPEND_MODE optional. If it
> returns NOT_SUPPORTED when Linux requests platform-coordinated (PC)
> mode, Linux can assume that PC mode is in effect. Treat this response
> as success so PSCI power-domain providers can initialize when firmware
> does not support OS-initiated (OSI) mode.
> 
> Continue to report an error when OSI mode is requested but
> SET_SUSPEND_MODE is not supported.
> 

So, your platform advertises the presence/support for OSI mode and yet
opted for not implementing SET_SUSPEND_MODE ? If so, it is indeed a
firmware bug as reported.

-- 
Regards,
Sudeep
