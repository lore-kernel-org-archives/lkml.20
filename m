Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571384;
	b=Aow9Q90PLIwamOmUouhnslMHkkyKn90O1Lgxx5ngmAxmCPecp6028GvAFpHxihpTWqFr
	 kTxkmi0Bq6hYSve62a52usAmlXfEoyeZAsy3CYDDjHdmYA/2MgR7EQrMR2fmwsxxTdhK1
	 V83Axy6iO+4WEv2ITyGJ4O10EX6Wa5ZVA3+K/BW6AlGXT3J14dmlN1COHaQoq6VVt2kCp
	 zrip+/mMj6JalgwK4yTL4AcbOZFY5C/SO47KVr2PSAG8EB8H85N+MUwPoqpq3wwX8oZUO
	 5KGL23wH70MS1VZ9WasJgtUnqoDtrz/csYpPbNspYdTIl6ilcjTYI735oJfM0Ct7tjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571384;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=gmi5uewuXMed4CloBbecG8Sst+u3j+UWzS8NSli01pM=;
	b=czskDJuZ370M+g6A9dLKFIXYuyoCJUidynEoTiTCklvQdgEf/K/JNfzcBBLl+ytEqc77
	 hqGChtwX1D7dFSTLgIZOlbtemYjJZQnhckb0k6xc9HHtH62no/gmCI+4G0eZou9l7ViND
	 c/W4e0HM4VBKP8bdUyDLBMboB4s5tD3LJMuN15vjSJ0uOB4je28P9uZvs9bxkF3/iEvS7
	 ihT/N23IIKU/vtfUlJINhvezqT54Ig55sCOt489srOiEwluy+FFCdriPbVsf36c2tL/2H
	 7PPpc/ZCWs0Y/hi5Tloi35t9tEhX3Wz4VRrCrWSF5pW4pmJEfpinY02RVqhgqjharfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=nf3L9ctJ;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF3E606B9F3;
	Sun,  1 Nov 2026 22:16:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAF3E606B9F3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=nf3L9ctJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=gmi5uewuXMed4CloBbecG8Sst+u3j+UWzS8NSli01pM=; b=nf3L9ctJZheEiENewBWgF4O7d4
	w0woJPQP2GTmpWl74VRcox9MjZ2Deb0eqUSRtStoHXGL9DhHxYq/zlQ0L1r4t9itNO+dCC0ZdsZ8n
	W+9LJEcSSTVgssUnhNQiuK0NPTpjWQ4Nbv3mOzBC/MVuPYSf+pJvnH3bjamx7eHC6ePCrl6WXPiic
	+lj8Zub9f/PBFK9xwwmUasaTIwJhyjq4gviI/ZIo2RtaslKRJ/ANY3i8hKlbIV47ivDGORK6jO5XC
	ys8iroOQVCQIM2Wvc1Yj/kQFog6AZUqcQjtAQ623egtCoMp0dq8k7xjmlKYynPNJqpmIm3gT6/YAQ
	OsCudwrA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Igor Velkov <iav@iav.lv>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Add the GPU to Kobol Helios64
Date: Sun,  1 Nov 2026 23:16:06 +0100
Message-ID: <179357136494.4108155.12651749876898512929.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011-b4-helios64-gpu-v1-1-bd83c6ecd19e@iav.lv>
References: <20261011-b4-helios64-gpu-v1-1-bd83c6ecd19e@iav.lv>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 11 Oct 2026 00:53:01 +0300, Igor Velkov wrote:
> The GPU core of Helios64 is supplied by U12, a Silergy SYR838 on i2c0
> at 0x41, with its VSEL pin on GPU_SLEEP_H (GPIO1_B6). Describe it as
> silergy,syr828, the way vdd_cpu_b (a SYR837) is described as
> silergy,syr827, and enable the GPU.

Applied, thanks!

[1/1] arm64: dts: rockchip: Add the GPU to Kobol Helios64
      commit: fb33952897e8a998bf026fee7f184b474a8381f1

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
