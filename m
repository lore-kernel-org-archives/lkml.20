Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9E848F030;
	Sat, 10 Oct 2026 12:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791634235; cv=none; b=lV2PeTkBqnNZimNXZEkTpLrhrJDCNg+KqRQQOEuYq9OvDv5zImAPV7kiJvYQHhaZZnh9jE51T9TYPJjmasJH01uu+F4DOdN6w5C4Q6CvfHCFJZD9eLyZkxofd+cDkeb0mel6LZgeMTgvH/blYFwUS2IYPWIxG7fOgOOt83hlN9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791634235; c=relaxed/simple;
	bh=N4eY/Dct2dXl9PC9hcrqn8Gy/VtoQuhJBMjBpTU7nBM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AHF1YRE9oO61UvWbUDin/Ca1M1wt52B8BNugvkQRvFSQ32j5fBGRfXtjtWN1RZkwG/v4qLyBQ2v17BUwXlfg8gtI7v3hBKF4O9QY/V6q1sEm9BhxN2Ng1u0pW6RP84xWSUEuhEnCMJcbpow16yTKTXWJQeY07CJqCpJd/op1iiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=VTWpHr+K; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="VTWpHr+K"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=i3Qo4vQuldjoeK8jA2JAjzxfTebhX5t9oUEQ8z+qotY=; b=VTWpHr+KtF39azVyZIek20nMIY
	+FnSybPUCNY+P86lTxWZKiDvVoUwLAQfs86PABO9X1B6OA5CBTgAWjQ9+ulq4vwWyuQtvBciOf5LC
	kQQIkOM0c5qYIq8rzgd8YqPou+h6GbyQBtdVugkuW6ZySR0nuBbzlh2HX6eWidtzNIdNdmgvYFZN6
	/u+bXQdBMsX59PrLoiu98t0F5ZebvgkL7k07zhOZLPZxTGtBuRKjOn+agpb8hYSsb9W13Ij4PKH8C
	Y4B3yZzR6abkNMZd6Mn8LzTVRmnhl2pfOAqAw/KrMbFIA+tvHuLqMTjz6lbbxgIlcO896HHQffzaZ
	0bXg6tSA==;
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
Subject: Re: [PATCH v2 0/2] arm64: dts: rockchip: Add Radxa E54C
Date: Sat, 10 Oct 2026 14:10:21 +0200
Message-ID: <179163420722.3552553.10756820019323228213.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260820100020.3370385-1-amadeus@jmu.edu.cn>
References: <20260820100020.3370385-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 20 Aug 2026 18:00:18 +0800, Chukun Pan wrote:
> This series requires the following commit in Linux v7.2 to make the
> switch work: https://github.com/torvalds/linux/commit/9da2c8672f77
> 
> There was a conflict between eMMC and SPI Flash, so the unmounted
> eMMC was disabled. The schematic can be found below:
> https://dl.radxa.com/e/e54c/hw/radxa_e54c_v1.2_schematic.pdf
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: rockchip: Add Radxa E54C
      commit: 49b9e84fcd80bcc16f78ad8386b83f76f61f3a4d
[2/2] arm64: dts: rockchip: Add Radxa E54C
      commit: ae965b9856f033145e292b0c29082a26bcc45efd

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
