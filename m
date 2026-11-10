Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794299269;
	b=SiUOXVVe+MGbjZJeDFZFALEkfcu8G2/HW2OK1dYqM3Sd7yt8CVp8/td0/kX4w80BYW5a
	 pvLBP42M3FsE1zmBrl1zgthtZemEKw8W46hLGtQ2IINBxyQfCl4DMIJc+YB+n8XKuk13y
	 8FzqFw02aPGtTOF86UNroTNDoleHsqkC+LH3xrUrrpXGanxZ3oKXgI8MGGri+TjsZXIsI
	 1i2UIVNKhQVJPRirP42Imq3OUcSYHOX/+kRb8LHj5uqYOKmljOwqf+PSe82ieDcfIvhkF
	 wX+IDW7uHAKFoGsncmLirVszOo0Fhk1yIdXS2sGtZQaheg7IYHpUCm/7WRMEAkESKdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794299269;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XJd1FBKDVsSxZhIE6xre9cpQW3ehpWs32eSf98wT1Go=;
	b=suAbjgtuXNS8YhtrVQ2FRQJLWJKICThgW8j4bxXB7xZMDNTi/hReDMg6IveT7C3BC9tA
	 2fbEE8sVVw9QUDNT6ZKH629PRbZvuZl4e0sFUsitW+PDaCYqg0ydleoi8E6cDtxqwMapu
	 zmH3esWO0z4QiDCjc/v9tecT4ttoPRS+e9+EKNgU+gcdIKxd0x1OmjP6yNO/k6B57KFAD
	 +OC1y6f6Yacbp3EIxUb8kfYsoWHB6jBUq0cqE2L8muyGvo/ELdRkC5GNTwdF/NRY+S6gB
	 AVsH6BN+2tH0pDJTYp04j4yHbQEFX0x6WgiI9dmsQNVEV54lkV0RJw6wiKSnA8VzuqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HtwkkRY2;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C7C60A260A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:27:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37C7C60A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HtwkkRY2
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a599e9110eso4701195e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794299267; x=1794904067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XJd1FBKDVsSxZhIE6xre9cpQW3ehpWs32eSf98wT1Go=;
        b=HtwkkRY2V+MO/y9G/rQZ0bDToA0n2FHZOXpaSG2p5JIUfMofrCjGSaafZNrL7Fm6CF
         XTTcmHzdpna2PPqAWOErN0L6gAUhG+Yu1Hk41XfVRyKGE55BVflX4kw1Esq8GYeeoixE
         lUFxY85TIRpWnNXVwzTsP8dznH4yJcDqYhhJGRWF4Ju5Kzel+goJE5z8nnJ7MVQtHIGo
         V3Y4gF75aPCyo94XA3i92ZR/EnmpQO3B7p1WXqJSgZ3DOx34vQQ15Pe/Y2mAGhrrkUCb
         vg050K3YyZGoDtL+3exSBXMZZAtNe+HrnRDXmB268Jcs2ktcGupbcBVDZ99h0YJpuLMQ
         pHBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794299267; x=1794904067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XJd1FBKDVsSxZhIE6xre9cpQW3ehpWs32eSf98wT1Go=;
        b=TLaKNtGQ+s3/iih5+7JfmHe3L/RIDKvNZetFLxoNmPgQ2Cqcjk9/jaEw1ITopTkK8F
         9G+gni4Bl1qmMODE7cRNx7h/5YdDpBbzExBtPrdfswZFw/0/vWCREzpgtLWNKc1cdHWm
         pKGIyarMZbf0+q3hTEQZdLiX9sNumPlJRNlgO2PqHpGUSTLEXEb87AgRBba5mC4O5GCG
         kQ56jTW94fKeG6OiGcLBPlh2BwCcUONuZRni6hlSIXnQmm7D8fS4CVIR270ggx8HbhiD
         fVIghRjenQRmXt+aKcYt8XJXiuAoBJLdznpMqgK8lWKxHaEX8JE+47MUVidKT+IV+Yps
         19Iw==
X-Forwarded-Encrypted: i=1; AL+hErHEIniLX5b9/Dv1vuRKvG+E1SK/y9R/5Fc64YFyA67qOPFzw5Pv2GkFOHqVoH9obPm91JALH9y0p7rUZN4=@vger.kernel.org
X-Gm-Message-State: APuU4Z99ifIpdBGmvcwN96CjOW++RaWRTwlvUUyyjjDbZZoC4xq60wyJ
	ywG1fXSBEhmY3ftCoz7jcStJfz5FWAYIADc1VuM1locrzXIr/MgKDOxNMC/vUQ==
X-Gm-Gg: AYBFou170K1WsDeWu9IakT5Pm+/JUFrIHFuyoNyeWflhbsqTacS3Ts3dvef8QIfpARs
	yK65b+5N1Hlxuses6S5CVfek2EJgXjrqqv3nUA+zVKEaLJYAXFkI1dGy/JplItbJr8wFanY/zg1
	uujvyqjlTsTVB8eSLpqlyJ8smGL6s26Zr4rHv4NN1eoILw3ShoYiU+9qYLLEPlkUUiOvzdHGIBL
	OMjvGhJftuG5enbVxH3iKlSZxky6JsMeLE3cjvr+r9vJybPM4v+TAaiK+HFXoy+N0CdSb+9R11Q
	dCRuM3tbRb+gWk6k1C640JOjuqqHbTZkJm6E6oxwbb2FnW3CDEt1qw+mgFht4WlQPhJqhGVX6DN
	+d/P/td0hH4k2pdlM/rSnWakvhM+VStgkLxQfMemX0wQXbRVXtJC7QsSzMYLZeLtSKQJHNColkD
	36SHK3tBQHwRm+NOtijJ2fqvWFwJuYCtwa9n+Mv4MDIFXB69QkSsgOALoOz9Q6l54w8lt6d2YNX
	WKEW3nD4nGDUxxsJTRLeLx3lPNQ6mP5sEVGmJ8HMproAEaF6DkKM/Ez07rqH4yLv+u7AILr++wY
	8M9OEHYPLlhAy0N/iBceRGfC/AQeL0egVqM5q2mZsZYRN8GuUg==
X-Received: by 2002:a05:600c:13ca:b0:4a1:e015:6441 with SMTP id 5b1f17b1804b1-4ba022c9d83mr18304505e9.0.1794299267228;
        Tue, 10 Nov 2026 00:27:47 -0800 (PST)
Received: from L-P-ITAIH2-L-RF.rf.local ([193.169.70.108])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983585923bsm3885849f8f.11.2026.11.10.00.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 00:27:46 -0800 (PST)
From: Itai Handler <itai.handler@gmail.com>
To: mwalle@kernel.org,
	pratyush@kernel.org
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	takahiro.kuwano@infineon.com,
	tudor.ambarus@linaro.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v5] mtd: spi-nor: take the flash lock around spi_nor_restore()
Date: Tue, 10 Nov 2026 10:27:07 +0200
Message-Id: <20261110082707.556862-1-itai.handler@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029210153.3986211-1-itai.handler@gmail.com>
References: <20261029210153.3986211-1-itai.handler@gmail.com>
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

Hi Michael, Pratyush,

Gentle ping on this fix. It still applies cleanly on top of v7.4-rc2
and spi-nor/next.

Could you please take a look when you have a moment? I'm happy to
rework it if anything needs changing.

Thanks,
Itai
