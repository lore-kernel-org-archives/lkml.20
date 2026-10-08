Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0663F4DA9D2;
	Thu,  8 Oct 2026 15:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791472354; cv=none; b=OeWxLMU4GjDJN8Me+bhy/V/M/jx9QZQp2Q0sgDwsb1wXfKCeXL134ZRULKmIlG6uiTOT40guL7bmlIQNmA/ELBh3thu8G5A0Ypo++2j/E9JV8NC679jK/3NpEKAZN9ZsWsIRWLrnZi9hUkJFM9HZXHX2VbPZZT8OHyCGgEDP/v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791472354; c=relaxed/simple;
	bh=/jYb8CEh67SDMd+Xb7DzdkGjTH8+v58kX0R5ePbcmKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uqOpWWqenAglrpZy/0ibJN8JGZBnjYp+R+BQXpn5AZBR/7ysf1xBWrSHySsyALw2FvzrKuhbkNofJtvu5FFBtugH9tcDUMY9a8Srlvtsg5tvKm5JOMTXsxmr8UP/eRAZzXo6urQXGKvJZL2lUnyC2B7znsHcYgE3MGGAzE8wxS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=ht6FEC96; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="ht6FEC96"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=3B0mHhf+tucMipCoCNuU/qvaCcnXfH+FNicCEU1fu9I=; b=ht6FEC96ux3DhnPn+54IleZF35
	q5tWEsykFh52f4T4XIXpbFttQUGTX/GDw94gNpEFvly/t8iL2Jrqfv7gzUW4YFMLdRVYvBxA3Uq/v
	gVuPy0lV1sBKZqhjkJanmkgVbIilQefu3SixoA4fGOjPyG4jQ/3jcbscgsbjdp6UhGXo0luIOkW58
	2roBm0QRP13NwEsP/zbF75REF5I+Iq8+45Z/99IPTvh1Qkl1V3XE6s9M+SNMWGLCtWgbOoDMeilBa
	RYIFpLOfGFMpncpMiviECCwZbpB7Fuh7Y26w0LEeAB61r5i3cyRvGmo4gAe1KEHC7n+o+voBRpQhX
	GmkxAvXg==;
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
Subject: Re: [PATCH v2 1/1] arm64: dts: rockchip: enable NPU on Radxa E52C
Date: Thu,  8 Oct 2026 17:12:03 +0200
Message-ID: <179147232047.3420474.6626937665444807668.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260816100000.3707339-1-amadeus@jmu.edu.cn>
References: <20260816100000.3707339-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 16 Aug 2026 18:00:00 +0800, Chukun Pan wrote:
> Like the RK3588, the RK3582 has NPUs. Enable the NPU cores and their
> MMUs, and connect the regulators. Remove always-on and boot-on from
> the regulator because it is connected to the NPU power domain.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: enable NPU on Radxa E52C
      commit: f204f28bd1fa9b4cf3e47488ba3ba25251aba18a

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
