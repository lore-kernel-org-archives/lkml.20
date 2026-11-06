Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793968143;
	b=icso61B3nw/TNO9v1GGXXdzzXpr2uPvGniMBu0IWd4a8DTNsNdTEL1xq0VyPNqcZXBD+
	 ibvCBFCqFQSt7ebX5eJuzQzas9teZU6d4eCWNkXfZ/wFIP1FiZ1OnmOyIsdBuV1bGyNZs
	 jv/8UIOMIvWUjxVv+b5Z7ncEphY0kIun6x3GVOl12YFMRqW5f4dh9fwOPkCTtYN8fd6Ug
	 ypl8DZatyUWHssrGexgt1+D1Q5sNIU5sI5GApwfvQd3hPdYrYoAkNV1/1VHPzoBPLLLY0
	 ZwI6H2C4UdVKnFpwHR6xeiIyyPS4/xmIeLAIo/EBuDku/socIEO7qAvEjbegd3cb4zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793968143;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=jVC/KGcJa8KGWOEH6o3QL+JqNyke1bKdIxAB7WhcXLM=;
	b=BaKpOdvq2FG1fP30ygCRQadogSZRBfHQrc0hvOSaSXitYJhLwDGN2SUwgEFJ7R4VUYsy
	 Mfkf+yWaBUe4amLUQyytatTUaNKj7rlE+gE1FhGtpZg1SFNO+tmue2p6gg1Fft8/JqReT
	 A8CE3yS3Ib6O6Doyn6M5bIHmbNJH6VcylcVZSYSTDrSkMc7r/n4H6v8kShAkPHttu0FY8
	 OIPVZFh+4TXPlF4pFjAx9lkTvcy7m110mmFTcbTT4c3rpL5/SHV4uW5+KgXqKJKfUqLkA
	 jJwhf9ICZr7MJL4fhEgmDtK6LJHf5OxzX0NkwoGtet5CsjDD5aK+KtDYrlFGyToiPiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=MvZy8n9x;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFA2606A326;
	Fri,  6 Nov 2026 12:29:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFFA2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=MvZy8n9x
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=jVC/KGcJa8KGWOEH6o3QL+JqNyke1bKdIxAB7WhcXLM=; b=MvZy8n9xEqEqYJPTSiNa33GzYA
	PRizDDcL7Eb6Xmc8IweGoWlaUFYeh01I+SXYW2j5tB+7YpQ7tM2IPjrICskL0KVL4ciytYsTehMEP
	CvJtfT74M7ANKLOzW9s/oCLVCF3yvHMdPR4CmsEO5BGVPd9nQYW+JBtBNWyxYGfdDlT0O5znFAzKw
	7LCD1LXSTFL449brmOdjKcNyrKaBOnaGOyVLFM1FnskypGfi0ibESYfyNSE1CUw3qeDTkpRh04uNd
	0J4dsJYbI+lDOHWj9VCXFjlY42ExlibPxz81yvpNcgx96N/PT9orMHl10BHYbHjErvhDEUho2qPSM
	wu/IeWlQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andyshrk@163.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Daniel Stone <daniels@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Daniel Stone <daniel@fooishbar.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	kernel@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Sashiko <sashiko-bot@kernel.org>,
	Igor Paunovic <royalnet026@gmail.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: (subset) [PATCH v6 00/15] Support 10-bit YUV422 and 8/10-bit YUV420 color format on DW HDMI QP
Date: Fri,  6 Nov 2026 13:28:37 +0100
Message-ID: <179396811444.1260748.9451141898652783370.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com>
References: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com>
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


On Thu, 05 Nov 2026 03:00:34 +0200, Cristian Ciocaltea wrote:
> This series extends the output color format support of the Rockchip DW
> HDMI QP controller to cover 10-bit YUV 4:2:2 and 8/10-bit YUV 4:2:0.
> 
> Patches 1, 7 & 15 improve VOP2 robustness on RK3588, helping recover
> from exceptions and preventing random display output glitches observed
> when switching modes that also change the color format, e.g. from RGB to
> YUV 4:2:0 and vice versa.
> 
> [...]

Applied, thanks!

[15/15] arm64: dts: rockchip: Add RK3588 VOP2 resets
        commit: f245313cd545f58dbb777fcfc6aaf33376e25c0a

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
