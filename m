Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42827480DEB;
	Sun,  4 Oct 2026 21:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791148655; cv=none; b=P1Aid+uwZn/ZE30VNHi3t8lgIOJweOtvtIunxVw10LunD2Zy5aq4J4lh0bRVa67yOVSKYg4nh35L24JQMKflp1J1Cgqk3RhcubiD9NZ6vQ/xv290MVKmc3cLDUPhD5MCdJr6xtcMv29OJwusX8vK5cTcPYxKVDWsHbe1y6HsdOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791148655; c=relaxed/simple;
	bh=UH87DjbnQIFGekMduSNQPihFvqz3pzNOedgqCeD4E2k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kZVooHDZqFFGuulQQM0x5zBCZ8oh8Jc69UIj82K3loYQvqszGBdL1GQ+WAgiunMn+YKMXEGvcaVUgz5/leULvCiNRL/0CMXX3DV6xZpSQrUSZqkO4GntdMelYnQyR851MoFgXFjBrZXH7r8MBRlGjgcDsfyYqWPTHGAJPQ9n/Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=bAhYDCCZ; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="bAhYDCCZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=yOs3JdADmAyNGWFJhNPdC8IGwM8wLmZFBDUB6QhP4zk=; b=bAhYDCCZXn/8QocPw0WyD9YPuU
	4OGcH5rL0iU/nL8UamucbU1xRB3tt5nuXgokGbfpv4OAm1Ou9bZDHlS3GUySBd0IFa2QX2vEZlNr0
	rEeNw22DJrEtcb+AhMw2CkHVzbYzvrIbJWhVzFfFXDFAfNo8txsIV2kICl8w3trG7PtC9k4lPwL8y
	p4V9wPP1f4QKTHi3uCT5uku6+nwTg7jLc0AK9o0/HBhLHaU6E0UcERR2yh3BXBt8qLGdxfVp3l1pY
	aH/pOFARIiH+asg+1MHoibsEhsw2M8YAqDYY82F4hX8QA6JWNW/9GUtiG+kJqJGW2SMS139sXTjva
	E+Su2EuQ==;
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
Subject: Re: [PATCH] arm64: dts: rockchip: Add buttons to Kobol Helios64
Date: Sun,  4 Oct 2026 23:17:23 +0200
Message-ID: <179114864095.3283966.16002793742772296547.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260930-helios64-buttons-v1-1-d76249064003@iav.lv>
References: <20260930-helios64-buttons-v1-1-d76249064003@iav.lv>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 30 Sep 2026 05:52:03 +0300, Igor Velkov wrote:
> The Helios64 front panel has Power and Recovery buttons. Power is
> wired to GPIO0_A5 and Recovery to SARADC channel 1. The board also
> routes a User1 button signal to GPIO0_A3 on front panel header P3.
> 
> Describe Power and User1 as gpio-keys and Recovery as adc-keys.
> The SARADC reference is the 1V8_S3 rail from RK808 LDO_REG3, so add
> that regulator.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Add buttons to Kobol Helios64
      commit: 1e0a0365c73177d55365cdde3a1a179b4897a77b

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
