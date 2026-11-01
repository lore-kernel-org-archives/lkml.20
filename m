Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571405;
	b=Ceck/yzY5IkvxBWUSoZPRtR6V/lkfiIbe1Is5Zbs+PPjcp3AH4fTELl5DDbky0E8aKus
	 lEVWfzoYzK8KBEZdBPS5/Y3HibsGRfSiseq0dmvy69EpaarRYnfz8O00RSdTBZ3cwuKzQ
	 ocqvfzePCilP9+AFxEsvEbR7JVU+jmyWL6pZ+k8fd5ugb6ywQyc6x3p5KDosABoOehZgS
	 toO5sqbG2YaMGtU/+zf+hpwlxMW4kHuy0UhgA2q2vl0+d1xRsoVU4+0W85Iri/UuS2+jw
	 38I4exQZfmDgoqI+h7vVNFhP7N6344+KqnDKu0RbEVfL9UyGN5tkRwk9RgICn6I92/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571405;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=P0/aAmuW0CyqaK3PactR+FND9DgMw/5CGgOfekT7jEU=;
	b=lL+kMnls9Xi67Ts7RGKP9nam6fmuS+Xzm9E9RxU0HjmAUOuan2ljH6yIPlkBUX2jnIQc
	 g/3iogNCMtBf5zNV98GEqpHCfCnJgXe8+75zgNW1ZJ/umPVhmrIbe8LXIuKg4wD+dpFGk
	 4Rhz1Ka2ExpJY+w5Uwm+8OdAnJAoMFTwnFG9WeH4gndvUseQ9iQdHsSsCdIl9s/0i4qML
	 ws8VECju6VHPwgP1zwvp8xImL8YLAfe8s7dMkiydsRRZcembz+SW/DqT7VVPswmIbsVCr
	 5KXG/TJd5WaHBqeqPl5p7FjhB6X4wtL8K/g/vNubfmnxaLG1sY5nBgthX/k6HoQcLMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b="jQ/cLWVw";
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45CA606D103;
	Sun,  1 Nov 2026 22:16:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D45CA606D103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=jQ/cLWVw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=P0/aAmuW0CyqaK3PactR+FND9DgMw/5CGgOfekT7jEU=; b=jQ/cLWVw1VGy7cg3FZP6Dt2sPa
	fuCq8FAq+WocEnRYcK4eM0adoCG4B+ClDnApOIxd9sxhSgQH7p6nzuo9FavcnaYpXbQQuLuRgtXl5
	t2LuOfUptrsgiwVK5Ed9yYhxYGrjfxy2a6ev7RQf0ZcVT/FDBO+aZJWoaKn72uBbyCcIxNvakD7Dh
	xFiuIqkKVvjR/LcJjOgpOx6o0SrrQWWAXv/gR9Gyy9DDfY3yIVv2e/2YBEe74pDiDWF1G5LlVxsDY
	PDhqR8H7CIpnAi+HS3JTGVqZCUQfXaY/MlpIQ/jZA/Z5yp2XhKkEDxnawWOPt86jbFbmbI6KS+klM
	GCvTYdIA==;
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
Subject: Re: [PATCH] arm64: dts: rockchip: Add the battery charger to Kobol Helios64
Date: Sun,  1 Nov 2026 23:16:30 +0100
Message-ID: <179357139334.4108484.16394732199796045492.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261004-helios64-dc-charger-v1-1-0eabf0274d47@iav.lv>
References: <20261004-helios64-dc-charger-v1-1-0eabf0274d47@iav.lv>
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


On Sun, 04 Oct 2026 22:39:58 +0000, Igor Velkov wrote:
> Helios64 has a battery backup built around a BQ24133 charger. The
> charger works on its own; the SoC only sees two status lines:
> 
> - VCC12V_DCIN_GOOD on GPIO0_A2, a divider from the 12 V input, high
>   while the mains adapter powers the board;
> - CHARGER_STATUS# on GPIO2_D3, the inverted STAT output of the charger,
>   high while the battery is charging.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Add the battery charger to Kobol Helios64
      commit: 5a4ee10520cd66f294b86645423885c1845ccdd6

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
