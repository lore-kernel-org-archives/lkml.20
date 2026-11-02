Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793662962;
	b=Uxl+QNOAifC4N6ftwaYBRCtdnKXvSIDfFWoVyOfl3VXJ4TuSPsDGNhlQxCqllzqWboz4
	 xJ7xFoZIuv57t5HRx8CzH/oX2ni/+sProkZOGPvHao9uvR41jxW1flN64D6Pt/vO+YYgC
	 Xs7p+d9kSzSVfqPRVFWAAUBd0n6eI3nzkI1byMPKx4haFAQd09HY8kvUigZxGtIgunjNm
	 W518k9tO8UH2qPJ7JoesNNPRbCIFezFKO2e3lu/O6d+8L0Tf3QhmKceK+SNTLwm5VTClc
	 WbPXeqfEAxOwFrj7qez3FcyrgsEsqpq6fcZG9ECZodVb0HjvAq48AACYyCbobquQOQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793662962;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=ozF3h4aUekaFNOe7DRyg0a3bh7Yt4mQLO1saPU6M4xE=;
	b=PAinOwSs0khKB6QXwIdkAzgWC6q2SUxePEt9cCttMV5ratyYIuVpJdfEwZBwqgMyfOAB
	 vc6r+YCZ9OkCQ1kzXPJzpzhld4k7ywOf91jOH3nBrkFxAipIldyUG3o/k1aYe4cMQyxta
	 3Xd5qnYIorr0kTE2QiYm8VZGAmAUR1X0zzSDqcpIlTryEVmgWKGiJS7UED7kVOA2egPEl
	 CzjlrM6N/2Yr5a+V5gKil8fM5ebASoq3g8j4sT7GiVkQsca9uPKOEGxVXw3J40yPSZ+TX
	 BvFwLzdU3mUXHDHmak4ViRs2FomJ57eDgTpVaXQlNZiSwpCvYbgo/p1QJXEH/sXwRWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=gWUj0o1K;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42C7606A329;
	Mon,  2 Nov 2026 23:42:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B42C7606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=gWUj0o1K
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3690BB1A;
	Tue,  3 Nov 2026 00:40:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793662823;
	bh=wAQ2GsgCD/YQbE45EYrTMRsnhVSS61FPzdNJs1TgxY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gWUj0o1Kms6l1VLKnhTo6f94CoPkynqMsMINex1oVsbdXynf0+v1F0br2jDDty1aE
	 xqjTIiVcZmsIirZnG7OlMKxcxxNTLaTgUIpgrhpH2lUXFDHoV/CXIEYtL+g2dAnKU8
	 GWEebUM2t1mKqXLfiWaY1IMeF5eY7em2SfYV2bKE=
Date: Tue, 3 Nov 2026 01:42:38 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Igor Velkov <iav@iav.lv>
Cc: Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: rkisp1: Depend on PM
Message-ID: <20261102234238.GD3559911@killaraus.ideasonboard.com>
References: <20261102-rkisp1-depends-on-pm-v1-1-35a26cb2bbce@iav.lv>
 <20261102223316.GB3548113@killaraus.ideasonboard.com>
 <20261103005500.rkisp1-pm-reply-1@iav.lv>
 <20261102231206.GA3559911@killaraus.ideasonboard.com>
 <20261103-rkisp1-pm-reply-2@iav.lv>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261103-rkisp1-pm-reply-2@iav.lv>

On Tue, Nov 03, 2026 at 01:25:45AM +0200, Igor Velkov wrote:
> On Tue, Nov 03, 2026, Laurent Pinchart wrote:
> > What does the driver bind to when running on a system that has PM=n ? On
> > which platform can that happen ?
> 
> None that I can name: the nodes exist only on Rockchip and i.MX8 boards,
> and those select PM. The patch came out of the rkvdec thread, where Nicolas
> pointed out that with PM=n the first MMIO access can hang and asked to
> check similar drivers [1]; rkisp1 and rga had the same pattern. If that
> case is not worth guarding, I'll drop it.

Given that it can't happen on any platform, I don't think the patch is
needed.

> [1] https://lore.kernel.org/r/8aafdbbf04a0d939c6b4d7d5577d97bb58d1c439.camel@collabora.com

-- 
Regards,

Laurent Pinchart
