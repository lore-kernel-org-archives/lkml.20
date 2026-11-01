Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571355;
	b=iE61wQ8tnB2oWEOAAkAmE/B+CuSIp3aMy5ugC3e7Dz8sPmKEUXgJR7lq3tApQ96KEbFZ
	 3Uvyx0Sr7xmJ1NfZ2Q5g4ghAAMqChSmPnjg4gDElu6Ghi6ednniae4OWHjya9YhArIAtf
	 KXeFOxlwj/4Ntr2YBGaXnEXNUMO7xidGRU3+tCRX1VW8vfH6yh03S7rZzMGhtLkINwqf9
	 Ro5PNhR+UFANtIGjOCHrbDmhPK5pyzd4XPXNuc0nSkIw7xlVpT7fOxb22edSsJONBJhQV
	 L6D8rVaCFeT3veCxd4sqh6UaBMFQwlV92zOKDR14lecG6B/XyE6pqyobQ6Tmd9zholA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571355;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=cX02P8ZnTabknV6WIxatZgPYI8Lrd5opy+28EBBQ4Ww=;
	b=vkn+b2aOPAEyxVYN7NXeLbs57p6SJdAdCGJZxU24cOVKw7uBGYCllDBOg3O2OFd+M9rG
	 O2yu68YTV9XhT+dgcW5OsyAuj1OhzmtRrZDGGQRcjB+3MDEN6PkgXlElDFd5zeRCwUE3B
	 hwYJ6PTpMI1qoD9PtzGVS405frap7dmOLyQDQQyfdWwB+t9W48FrOEhIIS7UsMU+vw4A9
	 XK0vMDYRkIO33sdmcNgNOOBuHdSEk11fw/zP6fSlar5+9U07Hc1qLuHVn7QNWhWYEpwpl
	 QN+JWVTuXrsQ3U6Gcq0U9gK2UfeTVuTmL5QlAU8E6ittdVLJAVwgHHtmKhbxbQT9XgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=jGdv0HbM;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4ABC606A329;
	Sun,  1 Nov 2026 22:15:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4ABC606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=jGdv0HbM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=cX02P8ZnTabknV6WIxatZgPYI8Lrd5opy+28EBBQ4Ww=; b=jGdv0HbMp5Ar1mmZcemj62b3Bz
	IqfKVoQq3Y7uOoh4nesoe0YPrEQ8KHBKnCfNpSVz5ieRPsZtJptJdEV4h2VGYfxtO9Edkz+xcmyfU
	+M6Om0aXubmbUPOtvsbCcGt4ljvkq2uC0kMN2DDwCrJ67/kyV2jzBr6cs3116CJfvJJtrqrkrPD5i
	lHt5grw/apXIEJQOOD3NmupJs3IetHJnXvhm8kVxsGsN7/EWtu/8CVAaE5xEFSLlpk4F3+0PFrOi+
	3/Jq6G2F+7NeTrymp7vJggcYEC6MD5MVuc9O5FZBe3aJOA7FICmeTc5Aa8E+dQQn6CWwvNUdeQ8yf
	R49CAPSA==;
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
Subject: Re: [PATCH] arm64: dts: rockchip: Add the front panel LEDs to Kobol Helios64
Date: Sun,  1 Nov 2026 23:15:24 +0100
Message-ID: <179357131398.4107717.5871351415650721805.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261009-helios64-leds-v1-1-6c58a66bf0c6@iav.lv>
References: <20261009-helios64-leds-v1-1-6c58a66bf0c6@iav.lv>
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


On Fri, 09 Oct 2026 03:40:48 +0300, Igor Velkov wrote:
> Besides the system LEDs, the front panel of Helios64 has a network, a
> USB and five SATA error LEDs. Each is switched by a MOSFET from a GPIO,
> active high: NETW_ACT_LED_ON on GPIO0_A4, USB3_ACT_LED_ON on GPIO0_B3
> and SATA_ERR0 to SATA_ERR4 on GPIO2_A2 to GPIO2_A6. The Kobol wiki
> gives the colours: activity LEDs are blue, error LEDs are red.
> 
> Describe them next to the system LEDs. The panel labels the disks
> HDD 1 to HDD 5, so the error LEDs are numbered from 1.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Add the front panel LEDs to Kobol Helios64
      commit: f78fc7aca073241b9d477bc0190ac02f3242e45d

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
