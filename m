Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571356;
	b=0oL3r30Y4NzRmJJdREHrR39IVJHdwFdO3k9vEUaGi4rZw6gT2X0JhW+Mel/8l0lq2OFm
	 KTrxjBSaF7N+jMqjSTqdNEnQmp/Ahp4xm8/1zn88RptQjx86Y+MRTYBoA7M481wRdWtsA
	 vJ+v5KPIjKtoyUtBMlaUORtyyN/hAaojijTXpOInH+Rz/Vx1qnd/EiG7wysg7lOWT3GOC
	 27HA8QiRNlraSloHGWJeK0l3ndl9oYpMep2+OC+EFWEZ1TebTJje5PvmJNNXnPIyoI+J0
	 9Y1ttTk4PrIj+9njH9yXfrErVKm0wlMK3rflYg5WfUJ/yvwWltXUklI3VXo6p/vW8mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571356;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=/rAbfbo0sbqC0IaBa1BlKo2l+kbF0qrFhj597CNVJsw=;
	b=Lv3M/zpyCU3ppzc9x8eNGThN66THldbsYb77q0qJZzDBqoZdxW6OdSZGnueeOD6yJTSE
	 OE4o4+tQm2i/s8v7tA0yl0EE4Mz3r9CXLszq2NQBMuErEJWYRfbUvOvvYBbtPV2wCpeil
	 xnBACAJyEqjaE44GsHnH6djAG2UFrxouFz6E4F3No1xN/6IiD4eKpC2rn+shgscvSrqc5
	 q4B6LoKEk3l+m254aIPQtlkL9MWMpCdrOrHstmevF9oxrfh5/WC1azDOLofMrEK1v4DI3
	 PrxgkNRKOLwfDVz5zlP/YQ+dQse5J+scq3GhhBqaTDAcobpb78kFRqKWSKnTwtYOG3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=TuQNWuUN;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52451606A33E;
	Sun,  1 Nov 2026 22:15:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52451606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=TuQNWuUN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=/rAbfbo0sbqC0IaBa1BlKo2l+kbF0qrFhj597CNVJsw=; b=TuQNWuUNzCW8lMfyzUY6T/5Ggu
	P85UjS1z5Ss/B5adnOY+BkFcLgtqEkuf7HHZMLWTX4y2P/WbcaPxvsemvwkdaP53jYKdu/QfWEouM
	JX8hgVJWbC+Fw1rNnUav7G0IDtgcuNxOPcOQGr6+sCckggx0fIhFNBA0kxioK+rQRMX4wVvaf8apn
	9mn7nDlVEOo6mZAznz/mCwVrjsJ6WaRTDFLBpDVmXUJfAC0kyCdE/M2rBMw52ZA/RXNtUFEWbFfEr
	ZXHE785PZrk5SQszDTEgChlVfv9F46qFMnZ5O8xD83qEb2KvwqUeX4puFoKY9ndsTYj3C4Uf38zAe
	JKwnlxcw==;
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
Subject: Re: [PATCH] arm64: dts: rockchip: Add the buzzer to Kobol Helios64
Date: Sun,  1 Nov 2026 23:15:23 +0100
Message-ID: <179357131397.4107717.15989067428088831380.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261010-b4-helios64-beeper-v1-1-6235643158cf@iav.lv>
References: <20261010-b4-helios64-beeper-v1-1-6235643158cf@iav.lv>
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


On Sat, 10 Oct 2026 23:00:16 +0300, Igor Velkov wrote:
> Helios64 has a 2-pin header, P4, for an external buzzer: pin 1 is 5 V,
> pin 2 is switched to ground by a MOSFET driven from GPIO4_D3
> (BUZZER_ON), active high. Describe it as a gpio-beeper.

Applied, thanks!

[1/1] arm64: dts: rockchip: Add the buzzer to Kobol Helios64
      commit: 1f8c17240e23a37072793267cbb64587f24d4f2f

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
