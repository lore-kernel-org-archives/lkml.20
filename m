Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793620218;
	b=UzMBc0LTk+SYg2K0CGcGDrmdX+uuADMUv1We7W8WqxR8ZyvGllZC+07dhv9my1PIslj/
	 gD/pTkrvz4DagrsJtnxjBwn7FN9R3DnkgQRmftaxM2i7pUn27QOXEVipyO9KolAAvjXNm
	 NygGamdLIjHrknuGUPTkUeX1L0Rr6FsEDNm0pCmatMvwQLpXeUthpm0n53KNVuQdi+IGm
	 9JRm+Toqmlkettw9mj7vo1TIGgT9ryX2+a/dUiGQFQH+9KyTWUGotuntOPqpyRV0FsMrW
	 FHZCu/LFITijACuLKAJpzhGSz8jEtHhG5xIH9lWgt8mDVXYLs3MktT3W8mpxMCLXWuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793620218;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status;
	bh=A3GjgjLPBUrnD3kzEtH7HKFnqwNdS3wRA6X8t8xa4es=;
	b=J1ZKBsVJZQ9ZlotO95+OoIUOrTtg0B9JTx5J07GB+Oct6Ezqgrhe+F7AB/TyHHYAuQqL
	 X/AwmrbFZ1L7/gyPk8j6Q8Afn7oiJnnufArZ6saLoo7kAwo3dR/TlRhNbPPMdhsE4IxOa
	 fJgVPTs1eeoMEVHfdbEtcC6RMBo2yJj8qD2Sc97d0N/QncvMWWlzarsVfhcF+XL4/T7QR
	 oVF/OkSFYrgYWMLGW6CEmBhBqz0+uu8j3ejp3as6+fOBAvykxThEqUyHvFYhPs7+0LA33
	 W3TNQXmW3vCqBVUCSorSG5PlVnOuCY7Qj2iwKLtCNqiXCxUwnIHl3eE8Ikx9P6hAuSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=jmu.edu.cn;
	spf=pass smtp.mailfrom=jmu.edu.cn;
	arc=none smtp.remote-ip=45.254.49.197
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347FD606A327;
	Mon,  2 Nov 2026 11:50:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 347FD606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.lan (unknown [IPV6:240e:3bc:2e87:1c50:1c8e:3f10:8458:b32f])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5330b226c;
	Mon, 2 Nov 2026 19:50:11 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: coiaprant@gmail.com
Cc: bigfoot@classfun.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [PATCH 5/5] arm64: dts: rockchip: fix USB OTG power on Photonicat in battery mode
Date: Mon,  2 Nov 2026 19:50:01 +0800
Message-Id: <20261102115001.1820171-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261101192807.897562-6-coiaprant@gmail.com>
References: <20261101192807.897562-6-coiaprant@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa19c18750403a2kunm632ef75ce7f31
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTE4ZVkNJHxpPSR5MS0wdS1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJT0seQUgZGEFJHkNMQUoYTktBShhDHkFIHUpLQUNPTkNBGU
	hJHVlXWRYaDxIVHRRZQVlPS0hVSktISkxMSVVKS0tVSkJLS1kG

Hi,

> +	/* actually fed by vccin_5v, dependent on vcc5v0_usb30_otg0 */
> +	vcc5v0_usb30_otg0_boost: regulator-vcc5v0-boost {

This is incorrect from the schematic:

VBAT -> 5V_BOOST / 5V_OUT regulator
                 |
Boost_EN ---------

5V_OUT -----
            |-> VCC5V0_USB30_OTG0 -> USB3 VBUS
VCCIN_5V ---            |
                        |
USB_HOST_PWREN_H -------

So you should modify the vin-supply of vcc5v0_usb30_otg0.

> +		regulator-name = "vcc5v0_boost";

vcc5v_boost

> +		vin-supply = <&vcc5v0_usb30_otg0>;
> +	};

vccin_5v: vbat: regulator-vccin-5v {
vin-supply = <&vbat>;

> +		vcc5v0_boost_en: vcc5v0-boost-en {

boost_en
