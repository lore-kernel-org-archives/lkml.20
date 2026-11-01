Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571409;
	b=4UkX382QU/79JfgX/PRRQE3VYN+CE4eEbPjLjyzdjlMAyUahpRdsUot2hF6pEzO1Pua2
	 sbzwY+aXMaZ59rDRs/VQptWhT36Qo2MgatlbIGfAJFDW2/NaVXGaLxcBcg9Kiko9Gymai
	 58WQmTYE3mmy2q/346j/Mg76yYjJnh3HjZUB8ZOskV3Nmuso9jjHSPgwr0WAchnzpyomg
	 UEUE144fOncFeKFv94qISskH36r7N4TsIOuZc1kK9KTYuYLZLndG+Yv8nGNfkC+ZOrPJa
	 3RHgBuVmwF049AZqr10l28hHEuIFK1v52F3HhnOh5/frpyakxgIZ/mNe3HnRbcRbE3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571409;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=H4mpy8fCxgcQpV0HEH+hde8VVOated1fMyKTSDNaznc=;
	b=N+DTGgRSsVPMN+YsLpp+1QDFlNcJfiVgtTJ0fkn6pveJxF4i907+G4C6K3ttO0HCIZc9
	 GfKOCSSNQdB722ylaKceJTgf1bdDpeiTg9ds5iu4qiA69yucGe3BBPQHZjEQ6eq9jsjst
	 LGDTYOxmVHNy7tQdIXbJg2NFbO914ReHaC3opiIzgZ75K0qOViLa0loXdIeD9zzCpHiaX
	 zudLIUcODRKMCJv3TADTybh1deCfjND4WApum6RubAnJSIG3o9NxN4tKrFPWw4LsEEszd
	 nUbPu9F4D5ALNE6n4cUuHcf168Atx33tHKTlQEJRf/ZqeH4Zs2N05f6zr6Kxzqm65qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=CgMIMrh0;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B2B6071841;
	Sun,  1 Nov 2026 22:16:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55B2B6071841
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=CgMIMrh0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=H4mpy8fCxgcQpV0HEH+hde8VVOated1fMyKTSDNaznc=; b=CgMIMrh0QhPXvK4FzOvve3dYJG
	KueWhP6x49zS87OwPuWjIJH9SM0CULldhoM3Rllxx9b1iSgNeWpQ67Gf/WqqHr59WzdF6KREjDG6j
	qS7ZCDkuY6+ybfVues2Rcm/8dAw6dVPGKSDBgr7j3J9BzdiWOmuCGZNngOSMQok8E1p5NQ9vQtEZO
	DKfdn5duF7A/C2U3rKvcsOS7X3W6ivpB3UBcjx0lXoamo8lFGaYLGJc0keTnjZdilxMFUViE+sCTr
	Ypy5MHC2ceJu6EF7DLOJ771IcXVde9IZ0IaLJAjjNRSgXQnGjTEjVCWBXlmlOOIES1usTaFDHXu4v
	O42RxJdg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryan Leung <untilscour@protonmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: add maskrom and recovery ADC buttons to NanoPi M5
Date: Sun,  1 Nov 2026 23:16:38 +0100
Message-ID: <179357139350.4108484.2629575162026110096.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011-nanopi-m5-adc-v1-1-822edeb1acf4@protonmail.com>
References: <20261011-nanopi-m5-adc-v1-1-822edeb1acf4@protonmail.com>
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


On Sun, 11 Oct 2026 06:27:42 +0000, Ryan Leung wrote:
> The FriendlyELEC Nanopi M5 has MASKROM and RECOVERY buttons connected
> via SARADC (sheets 6 and 19 of the schematic for both the LPDDR4X [1]
> and LPDDR5 [2] versions). Add the two buttons to the device tree.
> 
> [1]: https://wiki.friendlyelec.com/wiki/images/1/10/NanoPi_M5_LP4X_2411_SCH.PDF
> [2]: https://wiki.friendlyelec.com/wiki/images/9/97/NanoPi_M5_LP5_2411_SCH.pdf
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: add maskrom and recovery ADC buttons to NanoPi M5
      commit: bc2e69f575631cb7b6528ad25990406a6339e8a9

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
