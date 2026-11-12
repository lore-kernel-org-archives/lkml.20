Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489801;
	b=JW2OqJx0bucDsOFFpuhjJK1MOIC8XQb6AhZktZgSi7LdM9fGLsHphlezfSvgmfdrGBL7
	 rcCSiNN911Ucwkq2Df4sYiWzqiWywAtMs95vHViE+qcsv8R/YU2qRIsixIAhSSGyKbXHc
	 RlNsKUkLtKlfau6qgVIJ58sh9rG5EU38nDtBKIYqHpwc09ZMWy7ddYUiw5sGNb8LHAU5f
	 IzdpZuBk2CupZWiylvC7ShAOF3DbTJKaXlgmz9Nrr7/aHjrojNlwz91FMx7j7ppE9lOoa
	 8fh/NvzoUNLZg9LIKrcBek5J90ny97RkFGJamJJ/ovE++ZEv46hO/Lg8BHS4XcxOVyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489801;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XyKog9AQppShEJliLLK1T6Sbi2JcYrMEsnM8YpdfsIk=;
	b=zkwufpDkA3JOHoqZQNlYULF/ndqIRuybop2bE+RARPZGVWYK4tuMrWSHfKYCMA9dSuV4
	 4NddDREja2e+RVJVxuLWrCw0O61wOJmPHwrfkce1Jel4BmIQc0RLbaUecOEiF3kYa3Msv
	 5svanfIe6mkKlv/owWzebnhp1RJal8c1MBqUaSg+3pgw10/cl9G5nUSpkc+6SKiPsOeIw
	 HSG+DGWn5qCpE5jYjruuXiu6EDh6O52aiDcQyuwNxIW02SBtJb1k1lf82tyXu8rlB6THR
	 vF+9omjViLKltcDekXEF9mNClPEZ2QLQtBKcvaUqsSyZBGJuNEc1+sB/iuAtJqFu5bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZOgb4TOp;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348FB606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:23:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 348FB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZOgb4TOp
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c169ae1cb26so152208666b.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794489800; x=1795094600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XyKog9AQppShEJliLLK1T6Sbi2JcYrMEsnM8YpdfsIk=;
        b=ZOgb4TOpMJayI3n5uoax2RdY4eO4hWPJnYLz7ekSI9bxc4wJKYBi7L5/3iV/nz4g2D
         qty0zPr/xwqEDBflfzPm0QIYP7hQihvCFT8WzBRX7H92eDpoKleWiOE2yTookssSpYp1
         4iOkk6LT/bF61Ni87OJg2yZo+kc1rWnJvgHAWtiqYjs4bI8oDdq4Q7kwPwStn5Xa+sNL
         /XYbjDrAGG5z+BHCrPv0byVDqS6XDxyb1EhIAfEMsEAQALBG6RKwzdVHn/i4SHeThqiD
         +G3CkbtZuoTAYP/yZWk1ykRRH3K6lhrmi8s0nMDKBDAmeRrHTUoxyLLBuIKHJhNsAeWz
         Wi6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794489800; x=1795094600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XyKog9AQppShEJliLLK1T6Sbi2JcYrMEsnM8YpdfsIk=;
        b=gUiiY0+Pmjt7XZzE+Nib+/S+AF8kxMydgBJBTZ4JMQVdmiPgJCMpzLQfTDUQTZDeml
         jzXlnVxxebgu+KtAH70KsJMT11mvzCx8R3k7XITNiTiMtH+aD76u4xSPcUCDVU1+SG+p
         1p6iu2jTzkp4VSKGKQPFsJnIZ/sUTrvjf2/cM+fIeW7um6DCakXjlPcNI2U1m3QietcM
         +jRJjG/XIm+ohhC6Yc8o2rT4tqADLglVZIrAVwSP0xZkJvX11XI+S7AbBKZOPmqwEdIT
         KdIsQ8woVGdNo26OE9H9O4I+X0t2Y9TQrJuk82B0367p9ylWsQcqMtmUtqnsx3G61gzb
         St8Q==
X-Forwarded-Encrypted: i=1; AL+hErFN9l00L531es+QGOroR2n0clVpIKv4eoqPmLnLWOB0XUFANS1iMZTCFLZ2FqrkQfMx74nl17n2Zuktgq8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vSovMutZHqGvH3mb5bwBG+XAIpZaeoczSmA8LskNOkUv/mt7P
	R3H5dOrHdK1e+7tBsAPJ/tTtMIFzlTS0dySfOI1Qis9/F0YaRo5o1go0
X-Gm-Gg: AYBFou29IXtklWf3gysSrLMO/J3dvI0Xhisj851o/lYS9Rgk5qg8Br85q93oHsJYpK5
	Ub4j8rKvduDjJ6sN/tVA+prLFEJoylsUzONFkd/L7FYp95qpMTbxji1cvz/614SNntorZ0/SKKM
	e8shqFoTZVZcalxZchLvML16FovaCuNsXoAly7UwTlSeRwE7RMj++CYzIKsu3jpB7ba8kiUY72S
	/0ZQaFLPK1pBQAEmvr//OlitA4W9RwwJ/xwbKObXpiNt4bPEkZR6GS5sHYnPOXlUo4YG46omNXk
	m6OMR1hdhb4axDH+jhguYXZtc8eV8L2cvmUMnmp5f/KdQdyrMid1tEvttDXdmu9dgNfNPBkHBSE
	H/Ym5FBtAc4jCy6NBlWAfpw0A3OxDmKs6Q2Wvursn3QddIGiEar/FaI9yikMiHGdG0oW99q9/tN
	i4I+sxVuxKKRZ2XodV2jp9SSuKAim3dTrThsh5woFoXqA784+ia0/v6CYxzqO/rIGK1kaEOWMJy
	YMcNsRPrJlQZ5zpHlLc4cuqf4wCnLm0CwWGkWywtunjKRdclaxETNWppH15GYhRtaNQKfx5SAmM
	Tv04Vob74zZkC2Bkf/0zn2iYDn3bMmrkwAcGlSZynbxeDKX5B2EyZzSeCMa0Cd8YD9FHN+aQV2n
	I
X-Received: by 2002:a17:906:6205:b0:c40:9b35:ad91 with SMTP id a640c23a62f3a-c507b60db8dmr249279366b.13.1794489799362;
        Thu, 12 Nov 2026 05:23:19 -0800 (PST)
Received: from localhost.localdomain ([2a13:e746:396c:c600::31a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a5704c3sm341545966b.26.2026.11.12.05.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:23:18 -0800 (PST)
From: "Kordian Chmielewski (mlody1212)" <kudzo51@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	bcm-kernel-feedback-list@broadcom.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 0/7] net: bcm4908_enet: TX ring and DMA fixes
Date: Thu, 12 Nov 2026 14:23:08 +0100
Message-ID: <20261112132308.340291-1-kudzo51@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109235700.2586821-1-kudzo51@gmail.com>
References: <20261109235700.2586821-1-kudzo51@gmail.com>
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

A correction to the cover letter and to two changelogs: I mixed up what
I had seen fail on the hardware with what I had found reading the code.

Only patches 1 and 7 come from failures on the hardware. Patch 1 fixes
the TX stall under load (seen twice, none in 8 runs with the fix).
Patches 2 to 6 come from reading the code and have no reproducer.

Patch 7: the skb_over_panic was seen only after I raised the RX
channel's MAX_BURST to 32 by hand on a running channel. I tried that
again today on my 6.18 tree with the patch: within seconds one frame
was longer than the buffer, and it was dropped and counted in
rx_length_errors instead of a panic, but the DMA then stalled and the
board needed a reboot. With the driver's own value, 8, there were none
in about 18 million frames. So patch 7 is hardening and belongs in
net-next rather than net.

Two changelogs say too much. In patch 3, the TX skbs left on stop are
leaked, not freed: the stale descriptors could send buffers nobody
freed. In patch 6, I have no test of what the DMA does at a descriptor
being refilled. With the patch, a 16-entry RX ring under more traffic
than the CPU can take gave no RX or checksum errors in about 14 million
frames, but I have not run that without the patch. Also, the panic in
patch 7 passed 3388 to skb_put(), so the descriptor said 3392 with the
FCS.

In my earlier plan mail I wrote that RX buffers were not freed on stop
and that RX frames longer than the buffer were passed up. Both were
wrong: the RX buffers are freed, only unmapped with a size of 0, and
such frames end in skb_over_panic, seen only with the raised burst.

I will send a v2 with these fixed.

Kordian
