Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571356;
	b=RCw5eVqn4733BDhS08OLhSM40PvSFDFM4hj7tvFKxXlfLiyJ85Q4xCI6SGAd9kt61fX9
	 /8AAEPdXCSLIhUkywjzD2UhnAYpRiNcMcI68r97zg71ToZcVxVOkr2G6Tw/9gwOFNMgIj
	 jLhBTp/YN2EhL0Wm7rsdHSiRkWbc3xnmk9TxeOaKxpPIfFjt0nVEpioEHLsoSrxWOmzaY
	 OcERI6M7IRwPMO30GQPhj9a4PwOTwVM+JfhpuSpmbJGcfV+nw0BnQPCrLOwkGPT4fT/zz
	 M0EUuF46MJNzYwciVoNfWdB7jqrVh1RwQOQwgiBm1bcQYjB4QJQp335p57bVMp1HrBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571356;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=eYtcCAUAyxcdw2cmJ7zq1Yfe3NPneNfyPaYN6IdyrTM=;
	b=NT2OzuFvJMpvDlT8VDKlIvB29m1x7jaNqZdDoqJRDAAUYWilE6fVwpUUzJLRBAm/2HpO
	 51If+5EaoYJbWHLD9ny4r0+L6FzsgKc0Fj7r0nDO7KozMfZsNEXZ0WWUn0DGRHTl2l9xR
	 4fxNXxLUXJwgVdgyv7Bn92m7m9Gz4WI31l4t5opWSzvtt6xUo47WYK/obESjOzcoyahj5
	 1N5NhQ9NZlmlZtnT8z7k5x2L551Xb+4k+jYXBREgiPztTO1yorwjNzkiHsDBlmWDhZ4NG
	 h1HY6HvstsJM2yHcQ+CZTm3fmDqzSEWDrFnyCmWBy5yXP6jB2j+vrUX7knCChglq3zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF401606A33A;
	Sun,  1 Nov 2026 22:15:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF401606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=eYtcCAUAyxcdw2cmJ7zq1Yfe3NPneNfyPaYN6IdyrTM=; b=rqn+WFU6tfNopmG6DEe9s4Vi7k
	u+bbYY+z1arpxea6QCsrzpUK07zRh+4MFM+agupOh2KmyxvtXRFdnUP1ebLzTcROrKT2ZXcR3hbWG
	za+rdsQFZTNLuhvQ+6OoHRHGS0t+jECbxkwgEmsd0aamHVHWSXUCnMfgVSqelOcioCAbkKVG6RwF2
	qhcBavqDqzWidieTXZzPYEOLzGKD4hpeuoPeHohujKTU/qzhosAB+gtu8aEP4vuw+bDhBwtD3Betu
	jFvTlDXg78L0gRK84TtM89ZALXmtG2SHGEKGh82pVhYkW9JcR+WM07D4DucErQovLCgd9uoz/GVsx
	IkvWHBmQ==;
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
Subject: Re: [PATCH] arm64: dts: rockchip: Enable HS400 enhanced strobe on Kobol Helios64 eMMC
Date: Sun,  1 Nov 2026 23:15:26 +0100
Message-ID: <179357131394.4107717.10877160497446825996.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011-b4-helios64-emmc-hs400-v1-1-36951d319229@iav.lv>
References: <20261011-b4-helios64-emmc-hs400-v1-1-36951d319229@iav.lv>
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


On Sun, 11 Oct 2026 00:52:37 +0300, Igor Velkov wrote:
> The eMMC of Helios64 runs in HS200. Run it in HS400 enhanced strobe at
> 150 MHz, as on Gru. The strobe line goes straight from the SoC to the
> DS pin of the eMMC with no pull-down on the board, so enable the one
> in the eMMC PHY.

Applied, thanks!

[1/1] arm64: dts: rockchip: Enable HS400 enhanced strobe on Kobol Helios64 eMMC
      commit: 0b1be7859dc26611558e4bbb7f42e4a1238af59a

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
