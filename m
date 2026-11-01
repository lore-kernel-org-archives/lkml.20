Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571416;
	b=UL51JpAIZP45WT+kWZF/hkJf+VBenycCwACHntaxHj2IUdaM5bdjjVoTcTe2y4fG+rXz
	 CxuAbsZRhToGjuU0bg3trWG/2CM3+0CsTTvz/d3UOuA0WKegkbMedUCM540i6vz34UC1S
	 vMKDML0LU/2bS8vmqW20jO/Ne77d094/HbJSlPrRGTUPGrG+f6u87V5ClAOm5MoSjqv9p
	 ZJC/V4rtSZLAsArp4WR8+KY01VMo0U6wPMqJElqJBXR/xQ6mIl7Uiawm6/tKOJTtBdNXI
	 bRIs/gDBQOlbun9bDCyPiXvE4s56UypYATFN7M2171bkOMPip0pJiF43cZHodi0m3qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571416;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=oih8i0WIyQznYHZo2vL+7dttn3r29EGnZfW+AikIH9c=;
	b=bNCDASCMtMPatgN2fOHRFSvC/deGPaSFJUWJSAYxzGhikAGJ9V2AqNiZDYlInZgOprRe
	 wcgyTZl7hk70sudVQUwrGWo/mZi4ooLHbwopvgvKA/HExepdKD6WjaxnlIoBqFos6kjKZ
	 MEASVP7Bcx6N9odx8sSWwpNtP5ZOQkQPva1Htp2vd6bkHT+CFfFrb9+5QwoXkrbX3EzMz
	 siT1VCmdAkJOlD2KfUA6fRgbzZL6afzenGy7dp59o7j/XaMIJtere2SfxW6LiAGYkylI8
	 FtWRgmVIowZP9rEaDSoWq1RZuFjUQ9hTyU/Zy4NipjKD3Ds5BQmHVL67WaO6u9219OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=pBxPxn5n;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803F16072B25;
	Sun,  1 Nov 2026 22:16:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 803F16072B25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=pBxPxn5n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=oih8i0WIyQznYHZo2vL+7dttn3r29EGnZfW+AikIH9c=; b=pBxPxn5nRbIjhCTk7PI7SrOmJu
	Ylf9GViTlBEPjuBEOaX0EInTxAW0Wv7HF0sVeRO8u4+ncCOm32vxLsUTy4DcL6PKMBgZ5JqymDISt
	h0hXNPaQIFDUWKUgwpXX/DP7lufM+EATMu010sf0oJ10ry6wUZw6hLXDlC0V5x97+nWjJcjsFXNUF
	TQ8c0gm+aGhMC73ON4aVBJfTFUzEf60B0k6F1HMbHL7a9ZSW57iz4L3oqXy04Vn5TrSJidDHrwDRY
	jnKCU1mJsx8qGlZc5ZHtu+dRjEukt3vb4tLKJBbYHbRFtL0EPNDTQ+GN9aoQTMVDBIzJlt+gqu15R
	kGxOJPlA==;
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org,
	Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Alexey Charkov <alchark@gmail.com>,
	Amin Gattout <amin.gattout@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Coia Prant <coiaprant@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=E5=AE=89=E5=AE=B9?= <HystericalDragons@proton.me>
Subject: Re: [PATCH v2 0/2] arm64: dts: rockchip: Add ArmSoM Sige7s support
Date: Sun,  1 Nov 2026 23:16:34 +0100
Message-ID: <179357139346.4108484.5874650464024401479.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261029082541.469999-1-liujianfeng1994@gmail.com>
References: <20261029082541.469999-1-liujianfeng1994@gmail.com>
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


On Thu, 29 Oct 2026 16:25:19 +0800, Jianfeng Liu wrote:
> Add support for the ArmSoM Sige7s, an RK3588S-based single-board computer.
> ArmSoM confirmed that it purchased the CoolPi 4B hardware design and made
> no hardware modifications for the Sige7s.
> 
> Keep a distinct model and compatible so Linux identifies the board under
> its marketed name, including when a kernel-provided DTB replaces the
> firmware-provided DTB. Retain coolpi,pi-4b as a fallback compatible.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: rockchip: Add ArmSoM Sige7s
      commit: 3a1d774014392d4f5f83ed73c2237b3c4a9f525a
[2/2] arm64: dts: rockchip: Add ArmSoM Sige7s board
      commit: 718ce9703d90c061e2574d11b8e5e8a50c089243

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
