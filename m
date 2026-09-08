Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D523A5E71;
	Tue,  8 Sep 2026 07:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788851564; cv=none; b=MGkjeyWfynDR8RY42Hm8L09mOeuKYYw+dYLBcf9A3jAbH+ARYI7LeE5ShU3Ap9tCzNAAGdEXJl6eiuGGfg2GFS1rr/uFlDMf8atVdX+UjXeERxj44tALd5HpgP3wEVwN2s/92EirZs4XdL8CLfzgp1MQ0E48zAEfAiewBt7MAjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788851564; c=relaxed/simple;
	bh=mbZit9u0igRW3Ez59tv3PUZpJvS2CPvENWt+oVCRU+Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Yut+vSBX3rYPCtGeuF526lR3HOol5f7gvi9WEKFAorTyna4BZQ4f8p2Sv4kEkKDV/pKQEvODO8eAcaUcj+fFB6RVUYwCDSxdBNXrbu1rNXjIyv2sK1dhQcBBZsJE39hzdIQUJ+Q1Rv4Qe/hJZKzbARaQ8T+Sjq+649Ve3XEOH2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=lH6okMJ7; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="lH6okMJ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788851560;
	bh=mbZit9u0igRW3Ez59tv3PUZpJvS2CPvENWt+oVCRU+Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=lH6okMJ7s6x/rWtTmAQeWehqTlVOSMQ1++DTLxkz7Ekrls89gq/eEyHxRe69kqNx9
	 tSIPhgkVWft8/8Q6uF8zxj4cE65yuUg5ht6vO7OheXDMz3twBm3+iYlbUdMMd0GHsQ
	 /6GHLKz8GRzC0j+bdG6sJQVkNSOzUMdBhyRG96Bafu6DFyqnJnxgSxRUOmSo11e0nx
	 ZEuwGdx66oHrpAfxlDjicLlFdZCbOKAKj8xSbuEoESLdq9eW+Th7cd0Npw5S2QtuCh
	 F2+WfXYawNLwGr34dUE6gWN7E8CZzz+SzztOT6oTBfWb5CrEIOdRow5Hznxi21UQck
	 msNj4+XRR2llw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 52C5417E0B0B;
	Tue, 08 Sep 2026 09:12:40 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Andrea Pesaresi <andreapesaresi82@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sam Shih <sam.shih@mediatek.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20260829151955.3661893-1-andreapesaresi82@gmail.com>
References: <20260829151955.3661893-1-andreapesaresi82@gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt7986: correct timer frequency
Message-Id: <178885156025.9724.13515391246937590450.b4-ty@b4>
Date: Tue, 08 Sep 2026 09:12:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0

On Sat, 29 Aug 2026 17:19:55 +0200, Andrea Pesaresi wrote:
> The MT7986 architected timer runs at 12,986,200 Hz rather than 13 MHz.
> Firmware reports 13 MHz through CNTFRQ_EL0, causing the system clock to
> run slow by about 1062 ppm. This exceeds the kernel's 500 ppm NTP
> correction limit and leaves clock discipline saturated.
> 
> The corrected rate comes from MediaTek's downstream OpenWrt feed, where
> it is applied to both MT7986A and MT7986B. Since upstream mt7986b.dtsi
> includes mt7986a.dtsi, add it once to the common timer node so the
> architected timer driver uses the actual counter rate.
> 
> [...]

Applied to v7.3-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt7986: correct timer frequency
      commit: 1cf18e4b9815beaf0439c5b57b65b45151c82ad7

Cheers,
Angelo


