Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A6E3FF1A9;
	Wed, 30 Sep 2026 22:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790807454; cv=none; b=VU2G8H0T27xoRMgH37NianD7T1DgQsCpvoCKi4XsTR+PdfXRrYyKZ4XhuYvj1TozU9VKsDtCc7loN1i3Ij7e6cbI8TF0VAg5RAv5TUP0jeYU4StHUkFmq1vrqGr3mpJntfIipcKd2wn2jaRHaoEaGXQ7o2I2j5gASvqUNnwc5hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790807454; c=relaxed/simple;
	bh=8v8nPvOOFg7ux4DjRqAyJLHu+tMtcVxLNwj28cEsxk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qTqElgNtdIgg9rqVlUbfJwRjKOO6fFm4+9svqtpMKomb9/urYzvB6+c39tUSRAKpslwxu1EzBKpNOg7Tz5SCanU+uIXU/FDIiedLzeIKyw6anHGZ1hCfj1aEft0VwAGrdrSqi7gJVAd7Xcq+SK61PyzncOqinAhgViy49LHik+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=E3W6CVWm; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="E3W6CVWm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=uagXdD5ciqWTaFMPdi5UdXHkMYzb1UdXrcKzNq3ujLI=; b=E3W6CVWmY+yb8nnlbSnwl2yKMK
	tLYbkZFBZeMNpQe9dh8OHn/4X5XN0oKY82AJ8Ee7CXfEj+jqI/lgc1Mcw09nhUSYatq6lzHVzFrsS
	kcgeGXg3DF/N2pd4UNAF8lXTPgR952v9CH/kUhzo1HX2DP8MZHN528WnLl8e1kTpUCuaXYYE0fjw3
	OPHkkwyiMJZLFNLa84ulcOSCGfDExKZ0D6PHcdT2PI+BbHU/lefiIJh0mgd6ylZ6haDTyFlS//fQT
	eYpKaPmJ92myblzvAU656TF/+67u0oueq0h18RKGgl0azpzsk0yd9Ffe/94IUl288r8VETclSjh8A
	M/1/+WwQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/2] arm64: dts: rockchip: Add MangoPi M28K
Date: Thu,  1 Oct 2026 00:30:34 +0200
Message-ID: <179080743116.2419406.13197098568454460130.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260801080018.3220034-1-amadeus@jmu.edu.cn>
References: <20260801080018.3220034-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 01 Aug 2026 16:00:16 +0800, Chukun Pan wrote:
> Information about the MangoPi M28K is here: https://widora.cn/m28k
> 
> MangoPi also has a version called "M28K Pro", which replaces the
> RTL8111H with the RTL8125B.
> 
> Changes in v2:
> - Add USB 2.0 support
> - Remove merged patch
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: rockchip: Add MangoPi M28K
      commit: 4de49bae600f265a8b214cdd33f7d018a171c007
[2/2] arm64: dts: rockchip: Add MangoPi M28K
      commit: fa932a9b632ff0d80390b940e6aabe38ac305fe1

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
