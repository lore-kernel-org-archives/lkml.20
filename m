Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3FD3AC0C9
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790580000; cv=none; b=kA8Ry/+fgd+GPP96I+QDPNpS5lojxtXM+eg4mFHNH/RHXjWSAjWYamdaUqcHB6qE/TxHf/W3y/rCM0V6jckIK1rnDBg0vpIPERRo5hbJMj8bG2MWtbTJ1InUTwe5B28irZptGx5ako8pYYkwPRLTR4A2/YrXv/oNqKhFMHqgB5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790580000; c=relaxed/simple;
	bh=QiImgdw0a4w4mAs+u0JSMh+dP+8bE3Ouh7uPlhmwddU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aBuCuLI5VcFAbGvDAjURafBXyQzg4Nw7tDQ3nAqNtecenY3pjEgLNMIscVUUKJRj9Tdn6ue/wFt/ANqsWs8xvGmx+L9WEZ1/YZtg5RD3nielQwS2MbOp8Vsjo9N087r8TjfeZZha4JjJcM3d8HNyzT2ALLKurwhdmYtXrdcEaD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QTQh4ImA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QTQh4ImA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F120B1F000FF;
	Mon, 28 Sep 2026 07:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790579999;
	bh=LdXIHI0a65nZ2GffklqXXm3Br0b0902Xiiud5/y56Lg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QTQh4ImAowc8pNjjrpGChaBn2mMAqb49VPhd7Gfl8Rb+TA9uSKKw/lftv6UONPjLV
	 /92s99IOlIhuoyWFngMZQEwdzbikfWRrmgQ+iOPgVSdAnjh2OJ5QmlKDp0rpYAxuX6
	 d5KjUlAsmA8WMaRuwWEFmHhmkpcq4Saoci6ZFPmqZGyw8IhTRLzJ7WxH5wAZeSNpAR
	 Hf4j7ts9x1AY6sgrn0u5vpzdu65JtOMlsatmuoEH87ZTvxNtOi3IES4gPRg8Us4+FL
	 769olCYzXFnKjK5nNRtl1f6cPhPS7IRIKgS/vY5l5n5uhnVStMfYR64T0Gw8Vv7GY5
	 67ejDE1tn6WkQ==
Date: Mon, 28 Sep 2026 10:19:54 +0300
From: Claudiu Beznea <claudiu.beznea@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH resend] soc: atmel: Convert to of_machine_device_match()
Message-ID: <eccttmsgnt73gzc62hhceqw5qvnzyj4wwal4ejiod43n6ouzam@mmoori4k42gr>
References: <c3b4f8aceb5f0bc95fa10e6fa469574cfdaa8ee6.1788429505.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3b4f8aceb5f0bc95fa10e6fa469574cfdaa8ee6.1788429505.git.geert+renesas@glider.be>

On Thu, Sep 03, 2026 at 11:59:06AM +0200, Geert Uytterhoeven wrote:
> Use the of_machine_device_match() helper instead of open-coding the same
> operation.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied to at91-soc, thanks!
