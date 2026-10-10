Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD0E442135;
	Sat, 10 Oct 2026 11:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791630875; cv=none; b=ef2lImB7H7e3QYV6P9nU0Ovk4y9C3Xn85EqMBN9lXAwGSLtaV527h813jZMpcExHvWpro5fP+Fxzi3XxFZKIL+8xes099KZP5We8WzcxEfw40aeZCxCFX9v5cxI1E873NfOHOIcoOrCULCLTvHLCB4Q2cSRkEqAZsi2G86UYUGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791630875; c=relaxed/simple;
	bh=7VgJKvnUntriWlL59nprpD46gbRgZ6OoBf66bdvPB7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qGHz2qQv50t/DpyedgtHjYAkhLyej858Ndo0VLi1Tlz/NZ7rK5DPnPn76vV/9YzEJWuMvPz+HiAPHckHc19uoGBXkMWLA/KEmkESpb+AAVV5vRacFiJTC5u68cSKxf7/FaWKat4vXW945xla1jegT+7InHfqb1YaJddU4mofuWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=kZtjQvAH; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="kZtjQvAH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=rRvOqyoa2yGlfCD6zElvclBcIrUaBdOVdd/2GnBR7tE=; b=kZtjQvAHyRZZBrt4oeO+HQ/QE6
	G9ydsbXj8mzw6jrGPOqfpRYADvpDHhXfzFi8f3VAz0k3vwRpKdDL1DDTIUEI47XQm1t/M207MGE79
	1G+Txy9UIBNtO0QNnSaYO51Peok7ZRo44gvUAkk8+JmPsWsShHr8ZX+xue0j/x1yakt1ZNPBfmLcM
	RnsQwfsuqpnhTW6BzLUiH9H4J7El3uwHi45C0c7WzhZsVQ1C+G8xbesRu2Md+wFco5/WeXMF+6cyr
	kG6ya5n0lAa34vvlJFpvc37N6WED9dsO+MQBL636rHRLtUDhdU9S1iLrobuovQDZfqgUdVDIOgSNo
	fF5ohTqg==;
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
Subject: Re: [PATCH 1/1] arm64: dts: rockchip: remove FRL GPIO for 100ASK DshanPi A1
Date: Sat, 10 Oct 2026 13:14:09 +0200
Message-ID: <179163084343.3536058.11998324830928383594.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261010100000.2236931-1-amadeus@jmu.edu.cn>
References: <20261010100000.2236931-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 10 Oct 2026 18:00:00 +0800, Chukun Pan wrote:
> According to the schematic [1], the 100ASK DshanPi A1 board does not
> have an hdmi_tx_on_h pin, so removed the non-existent FRL GPIO.
> 
> [1] https://dl.100ask.net/Hardware/MPU/RK3576-DshanPi-A1/DshanPi-A1-RK3576-SCH_V1.1.pdf
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: remove FRL GPIO for 100ASK DshanPi A1
      commit: 99feb764fa6c3b260e03903f5d30e15428fedc08

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
