Received: from sender-op-o17.zoho.eu (sender-op-o17.zoho.eu [136.143.169.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E202431E82B;
	Tue,  6 Oct 2026 04:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791261012; cv=pass; b=FQeqvoy/u81b37AVJJfk9/rldOcG9lV001YTiT24gM0BYL+bFixr6GschjjLJVUIz6FnzC0vN+CYcbiZE9jO9jVyryEqwTgIb9Bcr0OZf9EWBIBhMWOkozs6Wa/Eyo3yBgaYQvxrSwCFio4+YpzMMrh2jq9qRG1nxxGkoyA3zok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791261012; c=relaxed/simple;
	bh=HLJZx8skdSTkwlOQto9p1gF7ZlGkvsinMZLCxnN3xic=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=hTkm3cpzDVaWMRjjbJk90vsIVtZvBn/ETE1pCymPKeT9uvhEDzmIbUrjCC6gcynh9b2RGDF6sQZdpPVjiNE419cQD36t0NzzA1zLnBkhwv3a6JWxIdJoEtSI/2IHRtSN8Z85BfJBmHfqVoDtN1Zb7w43LrF1ClYDQirUHIyklrs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iav.lv; spf=pass smtp.mailfrom=iav.lv; dkim=pass (1024-bit key) header.d=iav.lv header.i=iav@iav.lv header.b=KHEEUrMg; arc=pass smtp.client-ip=136.143.169.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iav.lv
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iav.lv
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iav.lv header.i=iav@iav.lv header.b="KHEEUrMg"
ARC-Seal: i=1; a=rsa-sha256; t=1791260981; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=FjS0TW+EogxwysMgu43M48cHmsunBJV755U8qj0eLoU2xnt446vHXJ6k+RxMC20Vfqz5IT8gzykGZwoGU56+TLI5S9Z4kKktRcaITgkfg1o3XiNagma7Bv+ZpIC3JFeUBNU3Q2KYt7W8G0Frw50ruDfW5KHMUNWhJkhUiOx5ltE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1791260981; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=HLJZx8skdSTkwlOQto9p1gF7ZlGkvsinMZLCxnN3xic=; 
	b=dmtHOwLwAq6uxsjTH+CH78o7lADM2C97jXMCVm1bChwUk9fbfjzz1fWV+VnRQbho0GyPXtk2/nrEhExYAkGVCeUdRQGffzxshUd/INSMsikFDq24qVB0YeArXJbMHQuTGJuZMxpMyR4owkStSXkMjZbNW1LwM100osj2pJLz2dE=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791260981;
	s=zoho; d=iav.lv; i=iav@iav.lv;
	h=From:From:To:To:Cc:Cc:Subject:Subject:In-Reply-To:Date:Date:Message-ID:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=HLJZx8skdSTkwlOQto9p1gF7ZlGkvsinMZLCxnN3xic=;
	b=KHEEUrMgJFfGYQ1NsPIxFV4bAdKT5pkGcmGxFGBfEtQ08bZri839n+6QsOikLcMY
	Ii6hMK5SN0EX90ScsBLRPpQYDy6phg93mwMxE/vNmXsjNX3elPBGNssD/JGZdpvsRAH
	APXH7iJwNcmxZaArpg0+nRPbPnyAxaquHK8FxMJk=
Received: by smtp.zoho.eu with SMTPS id 1791260979404351.6587551574256;
	Tue, 6 Oct 2026 06:29:39 +0200 (CEST)
From: Igor Velkov <iav@iav.lv>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Christian Hewitt <christianshewitt@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
Subject: Re: [PATCH] arm64: dts: amlogic: meson-sm1-odroid-hc4: add the fan tachometer
In-Reply-To: <20261006041733.8C4081F000FF@smtp.kernel.org>
References: <20261006-hc4-fan-tach-v1-1-4e7cecf0b45b@iav.lv>
 <20261006041733.8C4081F000FF@smtp.kernel.org>
Date: Tue, 06 Oct 2026 07:29:02 +0300
Message-ID: <179126094299.1095177.4869656735733059341@iav.lv>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 06 Oct 2026 04:17:33 +0000, sashiko-bot@kernel.org wrote:
> Without an explicit pinctrl-0 property in the fan0 node, will the fan
> tachometer silently fail to read the fan speed (always reporting 0) on systems
> where the bootloader leaves GPIOX_7 configured as an alternate function (such
> as uart_b_rx or pwm_f_x) instead of a GPIO input?

Checked on the board: with GPIOX_7 muxed to uart_b_rx, the interrupt
counts edges as it does with the pin as GPIO (452 vs 445 in 5 s).
U-Boot leaves the pin as GPIO. The PHY interrupt on this board is
described the same way, without pinctrl.

Igor
