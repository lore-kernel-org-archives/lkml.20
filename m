Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.169.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793733627;
	b=EpN0bSMgMjH8FtQLBxwRPVHGw9rcS1LDP29T6m3O2KxsnDP6BtxYcOLNHtYj7gn/Hy5+
	 4ts7bbNGMvvZNABoo/4Ab5L64WcrsRSTW5kDaKtFdbZNuldZbKid/hqtNxoLqIT6INDgr
	 VcUFZCl/zwkAhK2jzFqngu6559JMygV8IogPs4ZCzJx7mkGZTXkpo4ZP1ch+WsA8f8XAe
	 yN686fk3L6pqNBo8qxU/fe7Yhq3DlyiT0VrI+wyV6DWPFjMqZJZtXZuHkAKwc6RG+MJVj
	 cW4Cfvjm8JCKJUV0goQ5Wis35i3/pOVAkLRoDlA+/oX37rtf2bZ71l+L9iDyslfY+Mw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793733627;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=YhBfBa8Pny6kFuQ4E8aewbRLvPI4dlsdbD5dTiRQ7Gc=;
	b=gkuG8xU4zE7u7FeoeLqZj/jAv7R/Hp5Kd0YB4bzQywjXkDIllD2Ibx+me16z+7m7jsvj
	 IkCoW8ckZLJVV0kxXQMUWddCbqsaz+s5j7PMlBPst7Cc0MtMNzsUZvOdtHK6ZrKW7wTIG
	 L0C9ZOPNLHsD84WgNFoLDxVqIvcGOEy1+9wDa8U1OymjmU+GRVc6TE7z25kuQIQQuu9UA
	 V8HjLRlM5Z0/8zIc+woH/2M5+m/cNrfi7qjQaiMaKgXYSYktcwQlREMOJQPc9wOKkzeVR
	 7FwQX47KIiGRVA4skYz/mZhxRMZUhPI/JeuihGdLrTekA8kkg6Fvr8MZ/f2gtvXWh0g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=iav.lv;
	spf=pass smtp.mailfrom=iav.lv;
	dkim=pass header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=LM3QOEpR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.169.17
Received: from sender-op-o17.zoho.eu (sender-op-o17.zoho.eu [136.143.169.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB7B606A31B;
	Tue,  3 Nov 2026 19:20:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DB7B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iav.lv
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iav.lv
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=LM3QOEpR
ARC-Seal: i=1; a=rsa-sha256; t=1793733598; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=YY2YI4CHmoRMtnhUzV0HUozrcEpzv4UjVwsf3eUGBEjF1mr8c6/9SEPQFcwjnCHEv4TfWWr5Q+k5PdWp5fGFSli/3jZ4nR55bAPVyCEr5SulybRau2CbP1ATn5pi6Lt9EW4nHsHkQNO0mSECNIWxuh6XyvMW9Qe/ibrGKs35+5s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1793733598; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=YhBfBa8Pny6kFuQ4E8aewbRLvPI4dlsdbD5dTiRQ7Gc=; 
	b=iMVeAHL4jegNpWP9+3oSxp+pm9RSdirqX/5qs/hwWCDljo1Q9/jfO6aTyZb0BS71/P7usuA0Z0jWbmrCzJoRFgIObEzvOMwFXsO1+hNK/CB8ZXXDZTxuYiwMovUBhuaMOi/TwWu6A1wcEUX5TVWXArR4RkpJP8On0qG14k7saII=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: a=rsa-sha256; b=LM3QOEpRp5Djr2FLet4alvtrLgPm0FiOJsvXKm7AL+pq8Yr81TdtQo8eTLVF88zFqtRfLtMZEylMC4ZMZVMORG19cU+lmz+gp8kdlzqXbqJ6q5GIy9Jr8ZuEiUZZsPpCCcOxH4N4MwYoRrkurZLoHoJSxo1mIK2k3KTVvl6eDUw=; c=relaxed/relaxed; s=zoho; d=iav.lv; v=1; bh=YhBfBa8Pny6kFuQ4E8aewbRLvPI4dlsdbD5dTiRQ7Gc=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.eu with SMTPS id 17937335969083.55780142088463;
	Tue, 3 Nov 2026 20:19:56 +0100 (CET)
Date: Tue, 03 Nov 2026 21:19:55 +0200
From: Igor Velkov <iav@iav.lv>
To: sashiko-reviews@lists.linux.dev
Cc: iav@iav.lv, Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Enable SD UHS-I modes on ROCK Pi 4
Message-ID: <20261103-re-sashiko-rockpi4-sd-uhs-1@iav.lv>
In-Reply-To: <sashiko-outbox-194667@kernel.org>
References: <20261103-rockpi4-sd-uhs-v1-1-fa394d2046e1@iav.lv> <sashiko-outbox-194667@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

The RK808 sleep voltages do not take effect on ROCK Pi 4. Its SLEEP
pin is wired to GPIO1_A5 (AP_PWROFF), and nothing muxes that pin to
AP_PWROFF: the DT has no ap_pwroff pinctrl (NanoPi 4 has one), and
U-Boot passes no suspend GPIOs to TF-A. Read back on a ROCK Pi 4A:
GPIO1_A5 is a GPIO input, low. The vcc_sdio sleep state is also the
same as on rockpro64, roc-pc and other RK3399 boards with SDR104.

The io-domain race is what the PCI patch linked under the commit
message fixes:
https://lore.kernel.org/r/20261103-rockchip-pcie-async-v1-1-4dcadb94af64@iav.lv

Igor
