Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794604098;
	b=rrzDP/MaJIQBtPie5B2rdI2nb5ZqqN3MNAoXvNrYHydJUF0C/Z+dOqfWgY3TmxCa2jzb
	 F6zIbNp+PLRVIR4ku4Td5Z1VvHfyPd0zK0mbbxgJMeSLAqKuYWrFNCVQVX2bCZSVkUqlc
	 YW0FatW9LAyAnkndmgNVgUxC099j0jDRa+/LYS3yEkozea7NpmUiw+FTiBKz/OzemQ6O2
	 HDo8RzopdxWAg28ub2M7F7yTW4LpJ7856bqlIEhBfeiYYr6SZDJM2lSiWFJxz4aV/hcHz
	 f0ojGbrrvJqG9wG1970wq8Ct/DunOXAGjMjsuYA634g5l6B4OTaVo42VbgwgZbzwUcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794604098;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=OeOsxZrRVRDIqTdGDpdJI5DQe9V4RgKB2bsKt5qqiyw=;
	b=afIYvaBMy5Aq0C5pc8lKvy7usFM0IOxcVKz3QtcPSV0EqQSAzLfrTkTRCI+jmibH9GDr
	 yx7yc4E6UrYwFXwfzMH7bWaEp1jKtbtX7D09O4GNvfhuvZ6GVN3xbcBB6OnJcwmZfG0L2
	 BSQ/wUV9hx/92/DlKAWQY4goeM4RvZ/iiBSJU+nWVi6lHg23vCmJE5O4oCgtlqyikytpI
	 k7GKqD5dsKlFTy/scXZxXJlbAPmG0JrSUAzymgBUrT0jIrPJvfLmcrCT+8cfpjUUb9K/q
	 NUE2Bm12VgtPwrDrmFHZ93tNMKShI7Xyl4HgXYgVe6rpYw49H0rJOMClx0SM8MZRfuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b="S8PF/b2X";
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A20606A8B8;
	Fri, 13 Nov 2026 21:08:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65A20606A8B8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=S8PF/b2X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=OeOsxZrRVRDIqTdGDpdJI5DQe9V4RgKB2bsKt5qqiyw=; b=S8PF/b2XIzZBdeBxgIu2e8xOT7
	RUj4jb5ZfUUbi5n3xl8mxvE1yJjjMr0KitMyUPIwiZ0Wuutp608PtIQAhn90ASOsLZJUM7BdzgnR5
	9FxTEfB2aQSACtV5rT5AddyyzRUJVLwLYLk09bUbZX5JHdXYHeckEaDZwic7+V3Bc1F6PGCNm/U+y
	CVDuUDOP7U8fEgxkjaQqUerDSspjNo7AUow4q4Nqtp+XoIeepWbGPy9HydHv297f2q6297q0rBnlv
	rujPtcmVu2NbEn9TpuQkShhn5DVOsAXnICWANlP3lQUU625qk4HnNjSyNYrX1yINoEbeJyp4slk2t
	3rswiM1Q==;
From: Heiko Stuebner <heiko@sntech.de>
To: Deomid rojer Ryabkov <rojer@rojer.me>
Cc: Heiko Stuebner <heiko@sntech.de>,
	broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org,
	luca.ceresoli@bootlin.com,
	robh@kernel.org,
	jin@mediatomb.cc,
	shawn.lin@rock-chips.com,
	jensenhuang@friendlyarm.com
Subject: Re: [PATCH v2 0/2] arm64: dts: rockchip: NanoPi R2S Plus: fix io-domains, enable SDIO Wi-Fi
Date: Fri, 13 Nov 2026 22:08:07 +0100
Message-ID: <179460406454.1165597.838727442879059278.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261031104714.3271017-1-rojer@rojer.me>
References: <20261031104714.3271017-1-rojer@rojer.me>
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


On Sat, 31 Oct 2026 13:47:12 +0300, Deomid rojer Ryabkov wrote:
> Patch 1 fixes the VCCIO4/VCCIO6 supplies of the NanoPi R2S Plus, which
> were inherited from the NanoPi R2S but are wired differently (see the
> schematics referenced in the patch).
> 
> Patch 2 enables the M.2 E-key SDIO slot, which FriendlyElec populates
> with an optional RTL8822CS (Fn-Link 6222B-SRC) Wi-Fi module.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: rockchip: Fix VCCIO4/VCCIO6 supplies on NanoPi R2S Plus
      commit: f889f5d1f9a809fda80d9c6a9e540d8e0e12761f
[2/2] arm64: dts: rockchip: Enable SDIO Wi-Fi on NanoPi R2S Plus
      commit: bcb95c3641b06f20e0c2ed4c849139ad72084d29

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
