Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D474DA9B8;
	Thu,  8 Oct 2026 15:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791472354; cv=none; b=ACeD9Ou+uEBbGv5LymqvnmqktwvFrVddADFe7/VnrtTbehYlNVUGn/7fXaZYBkinF+/QZ+fTQR0XS8p4s+kiWh0mXGkDuEOFt/7YLuVOBDO5hmFhT4AG2YHCCX2tmW+nofTiEydDE8wEi4XRJEtfePOEnqccm7gnlYb8VeFJE8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791472354; c=relaxed/simple;
	bh=eP71BUgWkpJjMU7ll/t2P1WopU92BiKHDcEnedCbDwY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XvrQywORThnXSqPoQUsQhQG3hTrK6t5q0GkW2NdpqGYLUNHlByYO3qywxq9XaqE+qoq7PK0tmqke8vrfk32jwjPrdYuLpjtK4jAz9lIwckPaJsa2WsBU2XfRiegLCH5FyXCighPk9Q5D7HeoGG1Lm35XDHQ0H1UCARW4xaEJmsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=Ch6IyZgK; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="Ch6IyZgK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=vHpzv6iAx3FY+i4Ey0PY1RHcS/I7ApyfzhqLqWfAGOY=; b=Ch6IyZgKlEU0gTStzX8o3mvkYX
	ZnFzoheKscaDqzQ0XsbGFK8M0tbsMJbzj1AWxBVYyt+APc+k60NaUiklWo186+ETVUXpcdBrDFSGg
	yY3NpoVhuagYGmZIt9AZMnfBMevJXT/g5bn+a1j919jX/Uaa2twRkYpf7QVqALfOIcyh3RQ7M5OqT
	fVjzWC5hn+X/fbhvNlb+dPWUL4NnF+omS4K1vl62NG0gzEeqJMEU/1M0iR23KPyeCXayHT2EqvTaz
	9wQ4F9mvEVFUJnBiKaoQNpZSsE/GC8uOF9PKWlS6T6hFO0xxsVH+w6+MHOEeonOPKrhUN1xatIvvv
	tma/MDcw==;
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
Subject: Re: [PATCH 1/1] arm64: dts: rockchip: fix adc button voltage on Radxa E52C
Date: Thu,  8 Oct 2026 17:12:02 +0200
Message-ID: <179147232048.3420474.12269525015262029428.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260808100000.1518466-1-amadeus@jmu.edu.cn>
References: <20260808100000.1518466-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 08 Aug 2026 18:00:00 +0800, Chukun Pan wrote:
> The ADC button voltage should be around 1.8 V, not 18 mV.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: fix adc button voltage on Radxa E52C
      commit: 682baba589548b8f8df05e0a330b2ad2b8ada3e3

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
