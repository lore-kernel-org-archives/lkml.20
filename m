Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4FC37CD52;
	Wed,  9 Sep 2026 07:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788940351; cv=none; b=BOuIlPm4QR4w1t3e2p4dgCeA05oCy3xGXptVTpNQMbzl+Ngk4U/E+TekH3+luVWliItjiUNdEOEGZ1K8/0bN3CEse84Rnh409jRxSFRb4iGXx7ZLivfP3ezSQLtmYkaani6Aja71AzYRLQ2ao1bsRi2tBT0C8Ttgo0gjlEoYLa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788940351; c=relaxed/simple;
	bh=JverGi/WJPj28dhK9/S8KJ2gmqAebnKmqsg1CXvKbCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uodUl9jZr0vR2yI2UfBb9hqd9rReQeiOwiUrvWSK33ZDXMmZzBWH01AOUSN+iItkAg83qWxzKwswvM2BWceGNRExJEnuI9bnEIoM8kkWZruWYHzzMrRDYA5lc5/DhOrisbCFdGeMbMEYQY7zn7V1qscUrF0u5swIz0m8Dy5ymyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kUcKZVTn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kUcKZVTn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DACC1F00A3A;
	Wed,  9 Sep 2026 07:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788940350;
	bh=LoDT+GUcdvRS8V4HRHzW8OXQubEURsr9zpZYmlTOACM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kUcKZVTn6hHu9hfV7jAQRDfthPODWLj8wE/wtf8qxW0+YefPWwxWP91QkbKgsQ66w
	 NRJP8MgnPBGLNAts7Ylmdiawoq7BbOlPnUCvBm5iBSQ9N3tXN96C9l9O+tDO9zcojQ
	 mN3imgMXWK6ZDknlUilQNcdNULKibjFI150dnrwEwTwDTm4aNinoujRfrJIr4tguNM
	 l5TGfBvZsDfP78CGXjCej8bac+yt6MybSqDdQW+Ty3F13WSwDsr7QBEtQGhlCPKfA9
	 DYEsS9DfC5rzAfxpQhX3n9Oq2u2+a4HNsaLZsrGeRsSS6GdxkRfJyZpjKw+Jgvyaz3
	 KbnMr5dq6f3Fw==
Date: Wed, 9 Sep 2026 09:52:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hongliang Yang <hongliang.yang@cixtech.com>
Cc: peter.chen@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	p.zabel@pengutronix.de, vkoul@kernel.org, neil.armstrong@linaro.org, pawell@cadence.com, 
	rogerq@kernel.org
Subject: Re: [PATCH v4 4/4] arm64: dts: cix: Add USB4/USB5 nodes for Sky1
Message-ID: <20260909-expert-fabulous-antelope-d64587@quoll>
References: <20260906032440.470788-1-hongliang.yang@cixtech.com>
 <20260906032440.470788-5-hongliang.yang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260906032440.470788-5-hongliang.yang@cixtech.com>

On Sun, Sep 06, 2026 at 11:24:40AM +0800, Hongliang Yang wrote:
> Add USB4 and USB5 controller nodes for the CIX Sky1 SoC. Enable USB4
> and USB5 in host mode on the Radxa Orion O6 board.
> 
> The per-controller RCSU registers are accessed through a syscon regmap
> referenced by the cix,usb-rcsu phandle.
> 
> The shared RCSU slice of the two controllers is described by a syscon
> node; each controller references its registers through the cix,usb-rcsu
> phandle with offsets.
> Signed-off-by: Hongliang Yang <hongliang.yang@cixtech.com>

So all your patches here have manually-created wrong style...

Best regards,
Krzysztof

