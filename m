Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796031;
	b=bimZhumqrW1twMtc1fpdavtSu5ZWZZU4A6ENYE9fLGfYOfxSrjgk48KzuJHGTONisZpX
	 c78vAMx6qZ3GbnK2IdiRh1gJ7b6yCr1q2RGrgyQ7PR97oQRSMDaZPKq8FL15EaYfiks1i
	 cCTBlUS2kNRq4SMq/j8pUqW9temJFdGV75xiKmiJwy8VHF0Lq4/MJ6sbih0oPYKPsHD2M
	 wQd8YkblpTCycVnpGcmnG+QnMOYPemGr/uFv7hCLPhkOzMAcCIRR3w3YtzNPJwmlU8Y6X
	 8fAkNSOX6IMywx+rAlW2XZKVriYR96osHzY4sdXDEpRJVS6DBXTniUTjAaL4LbqtvXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796031;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status;
	bh=hGdRVfQcdtQSbKgueRKAsfkTIP1tHUDFQLDjBcke0wA=;
	b=bjh9dWUYVsI964CnYZlNfaQaLFvlBxxLaG65+BBrWEuNq9nZYajTIfctdV7xXUBsZrBk
	 s6itV/KCho98DVwYKzdcU7G9gq8P98W4Q+1oq8geIhAqjg9O2HSTHZBiT6WeDG7xgHpwr
	 2/sv6jGB/6X3qE/tErt7PF5d6yPVqVPuPzH9FYXgAMNd4gmyf7Qwq0ozUxLRYgAAc5h8C
	 RZcmstEeKlyouMjMCiahXHsFSHYnl2XiQjBTZ0WUwxgwbiIkWpLQoFRdNEJy0GHv/Ir0X
	 vDi9gpRtCdMI4irREjOyTHx8XtfZbg2UXkNtXGSDA5GIQOM37wkBsdQazu3QIeH02Jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=jmu.edu.cn;
	spf=pass smtp.mailfrom=jmu.edu.cn;
	arc=none smtp.remote-ip=45.254.49.198
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AB0606A33C;
	Wed,  4 Nov 2026 12:40:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70AB0606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.. (unknown [14.220.232.26])
	by smtp.qiye.163.com (Hmail) with ESMTP id 537c3cf4f;
	Wed, 4 Nov 2026 20:40:24 +0800 (GMT+08:00)
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
Subject: Re: [PATCH v3 5/6] arm64: dts: rockchip: fix USB OTG power on Photonicat in battery mode
Date: Wed,  4 Nov 2026 20:40:20 +0800
Message-Id: <20261104124020.3546166-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261102174450.3000397-6-coiaprant@gmail.com>
References: <20261102174450.3000397-6-coiaprant@gmail.com>
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
X-HM-Tid: 0aa1a693295003a2kunm0429b5521628f4
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZSR1PVkhITEtIShlOHRlPS1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKT1VJSUtVSUhJVUlNWVdZFhoPEhUdFFlBWU9LSFVKS0hKTE
	xJVUpLS1VKQktLWQY+

Hi,

> regulator_5v_boost: regulator-5v-boost {

I prefer to use vcc as a prefix for consistency.

> +	 * 5V_OUT is the OR-ed combination of the VBAT boost (via D5002)
> +	 * and VCCIN_5V (via D16).
> +	 * It has no enable pin of its own.
> +	 * Model it as a fixed regulator depending on the boost converter,
> +	 * so that VBAT is boosted when running on battery.

What are the benefits of doing this? This is not a real regulator.
It is the same path as 5V_BOOST. D16 controls which channel the VIN
of VCC5V0_USB30_OTG0 comes from. 
