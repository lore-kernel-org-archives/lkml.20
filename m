Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B0547254D;
	Wed,  2 Sep 2026 11:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788347499; cv=none; b=btItS2+NpgtYA+36R+GMF5l5+yYBFe73H+zawmASE1SWCHs/V4mMC/804eu+hbSOw8j44mWPdkEdrXLE+4eBkxJWJYmuLMB2yl/VRQtbVWehpk0ZxX66bCN0mcOEkOnv0d+ZTr8sYzRqjaZILcaaev/t4SJbp8qcG0/Cz0Z/d8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788347499; c=relaxed/simple;
	bh=usGyaclsp8VZ986MnbyHDsbpr53kixm9xZ+rGv7IXfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e4+/Mom5B/5ymmXIeFPaAjNwZ98HdGugnUwWJEGi0ENCAnXff3D3kifTMo+hov/EdxkRbj4gzxL68z4BeixtqPYXc9LXI+Xo09sEcO1bnpos9Z7kQ7pvuNFA/8sH7E2Mq1ekKJHWvY0mYhOa8nDJsvyJQL/9tWn5DvTy9sNwGTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=UahfmXeq; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="UahfmXeq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=BkVfR4DpAx7oQ1YDNDR2x3wJhTHMtx0Qv6BFtq/GbY8=; b=UahfmXeqEIH5gpcc/9Hwhze4D0
	BHqgFmDPXOOdhJIvYk8OWAaqJVORRSLn/Nx+C7qa8WqUZNOCRIGrwQyQbJUfu+wv1vHIw8fU1s4Tz
	KuyafnQbnL/XelC5aEtHLBMKrZYHpme0dvrLwdCYej3b3shIBID76r567lz/XvucpoGgXm00yiGfQ
	u09HSbasaBFtw03HqfFepcpKFHkACO+5YW3DAI7NsOV8O3lEjolhul2v5rW2pX0o4L2ePx9TdvH19
	H7nly9ZxIdpspknOsctvzwsN/ayCFO1u3w1oBk6jnm8d4n9C3sR8ezptXLTWnGcJuW4/m38IBbhQG
	cRybP2iw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] ARM: dts: rockchip: rk3229-xms6: Replace spaces indentation with tabs
Date: Wed,  2 Sep 2026 13:11:15 +0200
Message-ID: <178834747213.2268650.3079565102560072255.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260829194012.107758-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260829194012.107758-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 29 Aug 2026 21:40:13 +0200, Krzysztof Kozlowski wrote:
> Replace excessive spaces for aligning indentation into tabs.  This will
> be reported by dt-style-check ("[mixed-indent-chars] too many space
> characters in indent (more than 7)").
> 
> 

Applied, thanks!

[1/1] ARM: dts: rockchip: rk3229-xms6: Replace spaces indentation with tabs
      commit: 5c44a0abd4334e5be2d8d485dd73a387c6eabb04

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
