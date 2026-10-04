Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F14414DDB;
	Sun,  4 Oct 2026 21:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791148654; cv=none; b=gIHttatfS+qIkQUQ+BC78oKyCh6lnhg2IEaSWlagHoR6tbJOMoH/d7BvLUVVi+Dd/KH6bw80VVl0ohW4j2BQF9zdqId9z8mvLbnOwVsAj4O06kDOh1V4n9+42GfII5qQ8ZRqg1oScUCVPJOKZwrmz4Z/F2SDmtbybNMboz7PEs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791148654; c=relaxed/simple;
	bh=LNHUyhlsViOH+JhZ8QSVe2qVU8/r+8mAOBhxKYhJzTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uNN3sv/InbBtAftTUzT0K4JKKNAMZSAbYRdqX+1gmvdN9aPgfgV+9FLjqgaTatakQr0sUCOuuNagf1kmXEc88gXrQtREI9Uxt8RepYe2JTSzbzg+n1Jy2nBqJMWHlbsUw54Y0qTSgdHbqeRr4vYAoB3s+7j2jT79DY0+KTmcVmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=U8Kri3H0; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="U8Kri3H0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Jd4VHP8Wahob2y4nWiCEs5CV0DeZkhS5T6k11qjWGHM=; b=U8Kri3H0wqf5Ake/uNakeou7jZ
	qxFRcWg0o0/GT1wYe6l3BKRO2oV5gBMLddZ9vqsXf7Q1c37qjqV2GpeRSz5yYwaLOvh4MW20VFi1h
	EiLGjm+UXtxcehDbGYo4AjOpvXh5CQK6gN/HsOSgN/d0QuySeoG3SrpdF5RvBB23J1lCiQ2hJ966I
	coYvY7pRDjv/OxUlbw42c6Dpid3aDB4161ZUOWxoxGoxJb+r8QqI94PkoHrCSHm7FPErWB3U969cT
	zaO2maLVk07P47OtWOeEwWVYgTWA6DVUTPmNhqNmA45HIoCQWbl+srsn9cEHsK8dTCVq4J2DGodma
	mSJmoY1A==;
From: Heiko Stuebner <heiko@sntech.de>
To: Youngwon Son <yoson5375@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Enable the NPU on ODROID-M2
Date: Sun,  4 Oct 2026 23:17:25 +0200
Message-ID: <179114864090.3283966.7430942053173707754.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261004172115.5105-1-yoson5375@gmail.com>
References: <20261004172115.5105-1-yoson5375@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 05 Oct 2026 02:21:15 +0900, Youngwon Son wrote:
> Enable the NPU cores and their IOMMUs on the ODROID-M2 and wire up
> the vdd_npu_s0 regulator.
> 
> As the regulator is now controlled through the NPU power domain,
> remove regulator-always-on. regulator-boot-on is not needed either,
> since the RK8602 state can be read back.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Enable the NPU on ODROID-M2
      commit: bda971ceb9aa263512b46a785abc9218d3e08d17

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
