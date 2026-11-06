Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793965860;
	b=z31u4sOOrdTKBmftmpSrKxpukb4yzo/81DhLmjxWacJg3CALo/XF+hk0tg4ysksSxVcS
	 NUUKK4Ue3ayMXfYvWIwzSHOtrO9nsrqHJ1s4VdWW2+MosseibLs/00AeykEnCBvyf2wup
	 IrKMBN8q6UkFURXrb+hTBI76Cf1PLluIk+fuP8M8yLWTkLhsvCfvrJ7trNU5qe23VGUjI
	 jC2COBCCbMdHD0jVYFzvO/5EGGM8IxpBRHV9nEVRUKt/4qiMTzZ2cxfKUUO9kGekg05hN
	 nmEXOXJc4ClQjGs0bSimISbF/J/azVRhTliPxFMOJtttqNR8NAX8p7NDHtqrqrJujqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793965860;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status;
	bh=gM1MjWcnGqQlHTA7Do9f7yi6ogS9ecmItrbj0c1PYw8=;
	b=EIDoE/VvGXIlKBB7G8FTaLkmKPKkZCQmZ5UXc4lAJwG/mXq6aJ8WRUXLD1GDBGtSL0/2
	 p//9Cqic33xGUrYCfYqpYPiULm5kcbqNwd26iJl0lRWdC6IMMUtzPq6yrBUFahH90xtHK
	 PGsD5JD+OPp/pn/Sv4IaQcjmg6PbAJri8M1eOKw0O+HntNqT62lVGov0vb2pnY3gD/gGw
	 dHsaJ12obXv6R3uv/Urg3kGsCbNHRQ4Z/yScEw9WiwSjEhcqFJnJLeU9O6Znb4MO44wG8
	 e0RCN0Oz56beF13fW0C8ri3WmAm/L2h4s8qAly7py0wHsTg6aLUsxrkzj3JL8o9XoWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=jmu.edu.cn;
	spf=pass smtp.mailfrom=jmu.edu.cn;
	arc=none smtp.remote-ip=45.254.49.198
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B46606A329;
	Fri,  6 Nov 2026 11:50:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4B46606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.. (unknown [14.220.232.26])
	by smtp.qiye.163.com (Hmail) with ESMTP id 53c584876;
	Fri, 6 Nov 2026 19:50:46 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: coiaprant@gmail.com
Cc: amadeus@jmu.edu.cn,
	bigfoot@classfun.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 5/6] arm64: dts: rockchip: fix USB OTG power on Photonicat in battery mode
Date: Fri,  6 Nov 2026 19:50:40 +0800
Message-Id: <20261106115040.1199269-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CALj3r0ijsuzadYoi0NPkSpT8smRyi607APfxLS8_u3JSH3+dPg@mail.gmail.com>
References: <CALj3r0ijsuzadYoi0NPkSpT8smRyi607APfxLS8_u3JSH3+dPg@mail.gmail.com>
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
X-HM-Tid: 0aa1b0b26f7a03a2kunmdfed847049a20
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZGksfVhhJSE8aQhpDQh9PS1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKT1VJSUtVSUhJVUlNWVdZFhoPEhUdFFlBWU9LSFVCQklOS1
	VKS0tVSkJLQlkG

Hi,

>    (5V_BOOST and 5V_OUT). Adding a `vcc` prefix would break the 1:1
>    mapping between the DTS and the schematic, making it harder for
>    anyone tracing the board power.

I didn't mean to change the nodename, but rather aliases.
BTW nodes should be sorted by nodename (placed at the top).

>  ... However, 5V_OUT
>  is a distinct net in the schematic. Keeping the node makes the DT
>  power tree accurately reflect the hardware and clearly documents
>  that both the USB VBUS and HDMI 5V domains share this OR-ed source.

It is not an independent network. 5V_BOOST and 5V_OUT are on the same
VOUT, only separated by a diode. The device tree describes the hardware.
5V_OUT is not a regulator, it has no enable control, so treating it as
a standalone regulator is incorrect.

>  ...  For now, chaining
>    `vcc5v0_usb30_otg0` -> `5v_out` -> `5v_boost` is the most accurate
>    representation.

Adding a fake regulator is just a waste of startup time.
