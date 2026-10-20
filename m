Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792484595;
	b=rx1gfV4X1lbzViTAlLdLlDBqxicFNn5QYkul3wYDKzmBsrC5sGPn44yB15blJrEiQBlP
	 yjJPGsHY6EQezyJRrsx6XL7Qz2o0r/A5LBgTv6ho4VSD9QDvzstYRx2/dBWhlyEHEYgr+
	 UX/F6OF/HYuezTXGRFmUprGZWPA1xgs43I25iZTtSZyWiikIZTXDwCwHqvXj/et+EiapL
	 GJgDWT0oKEDLJ78bNZNGZVeiv+vyrNCchlm5xC/MUSbP/A5Ph7F7pG4Nlt8jjBy7gofm0
	 NgqaXU5pSEiirM9GYLYTtiTkFI+5GYhwQVPPRiWSZm5llsOCxCSl8W9deO+meWwoTrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484595;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AYAooeFUC47HXA3GtiinK14fsxDzY9i4mk2b1PHqREI=;
	b=F02jHlEhzrwqOaMbzkndNv57KkAvS8oz0j+6t6k+SubLmSqYOPvrZ83cN7k7CPH9vd/L
	 VXidnG5tthhfBllO3LAwqpYppipzoIREU0/rY9uBQoE1hmWYcLiiTfhLxMMSabELvUN76
	 M2OGWvdsbvGOg4JcLKhQSm5LvXiKGBPiE/pkVBar5qC2NOH+ltlCBz1cetpG0Sv6Dgs9d
	 IPNz95GiEeZMlZfID1qsPFKcHUeEeHfVhMxejWVo2LoOXAO5XoCLCnEy9gc/+l+k54Z/W
	 TvvIYzuAFM9zN3FOQUAdx1Lb2L/2Wi4vQ1VfHfE8D85Przu/K52xd8RoDKUGJcpe7ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20251104.gappssmtp.com header.i=@jclark-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=gD2xpTjM;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B666606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:23:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B666606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20251104.gappssmtp.com header.i=@jclark-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=gD2xpTjM
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a070755c8cso737029b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20251104.gappssmtp.com; s=20251104; t=1792484594; x=1793089394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AYAooeFUC47HXA3GtiinK14fsxDzY9i4mk2b1PHqREI=;
        b=gD2xpTjM9L1rM9vIDd+fr0c33p17qtK4UKtBmkwVeOTiZF2apFqPJ3ej/g4d48ymBx
         qqUp9qCz5+4XvRO7NLkjhu/jzz3VlBLs1G865azYa29sWnWiFSWzwFANDAruJWli3Bwq
         4SiHeAUw+b8EAbhFExKvSao0OA1Qtlhw4TR2usSbrUxczLSCg3YQC6G9IOZXEtqIzMEj
         Fv+iBq3wwpgl8lggXng7v2zpJwqNekJSFNoEyOfkWJidQUIXMa/D+BfO0vkcMbjef375
         2OxcHho9MpKkaYt3KgSQxNJIvm/ju42ly5hGDPD97Hv6JUoKcjBcK9ZdoXwsA/Vn8nqe
         t47Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792484594; x=1793089394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AYAooeFUC47HXA3GtiinK14fsxDzY9i4mk2b1PHqREI=;
        b=iweBilmFIpgVPhaQ+QkgVGS25CRUTIvXr29UKRlT2jLJmvUsYuz6prf93AFnD6JDsf
         oa4y959z/pGHc4vu+B5dxoT3a2vglRDdfUT5NTt/ZVFOSkMzMg1RO2C6x5uUjgUl+xKh
         12beWc9W9DkMqjFTrGycOuJdEAXx+YY5Jqfg2uXnF009TmMkIAMxjTtuYi/pB98R7IKr
         L2Gdkb4jZkrPpPxDlnqAxc2k+UpQ/xoovLH8lJM7yT8UGCXnInItibJo+jPkp3yv9BD8
         6xqPlIaP42/k6pnliqfWEBIfRiXAQMPB1/HC3HCO1GFhMGwJ/4saZr/MFaW2qy2cpmDe
         lJxA==
X-Forwarded-Encrypted: i=1; AKwUvBysMLyBgPRrOuNWCKfzm3w5z0yR8RlbIavT93GlsF5dQquD0riWID/mNZiPaJ2BfLkAkwavBIH7RwWtOdA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRDtjvtaysZ2vXmWM9fNhEYl+Ugz9ifrkv+q9XcjNCaJd8RQ1N
	4QdBChMCvB0qj5RX2Oq5rUJTH1YwYHBsfba57bxO0EQ4S4veGT6EM+f1M+ctFLJpng==
X-Gm-Gg: AYBFou2aQqsQw9l6PdGv21dyLibS+NQk1S0OgdCR9rIIL13GA+X57S5/jp7A+wdjr/V
	7fNyzrMemC3axWOK3/p59ZBPoDFOhIsZQTyadVGYjfi/U63rY4Cv0JAYNBZ5BAYdoQmmiEDxx9b
	UvgDMpoiadqVbSLh7S05oHBatmHw1nObrzm1fxCqlZe6S+W6cXMdrUbtvXj25N/D9LlePZ0f+b3
	2CIM6pnsBMR1/By1xTbMDlEnE5TwBQeCKrULC2cmJOQerHuxrNrXhVek7EP6NgJPF3yX/qrDuzl
	BTd5yQjjYeTyERICTc5F/NvO1BsJg2NWOWlTZQEUKTegZWy9rjHzZJkEGTP8HltkbgzM2O12jxP
	RLTFDIze1Zr+GakyKLw9VBXwmjI3cTaCjKu4FONo0ZonNp2hq9ZrKiOm84Z8EnoIw/nVETqFEmY
	1f7U+H10BPUoARnh8sGESgPiEz/fnJOsXn7a5MC9ltAYk84RvL0fkplbGWUV0i+/j4gwhqMCIHH
	9I6XFyQaqUa+/cvzNZt+l7lhOaahwktsUj05kQiT4215cykOc8x41t58O8eTh7B
X-Received: by 2002:a05:6a21:7a46:b0:3e0:da23:8746 with SMTP id adf61e73a8af0-3e225f355f5mr8247362637.18.1792484594268;
        Tue, 20 Oct 2026 01:23:14 -0700 (PDT)
Received: from cantal.lan ([58.136.73.153])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549ee946sm4419397a12.20.2026.10.20.01.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 01:23:13 -0700 (PDT)
From: James Clark <jjc@jclark.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Richard Cochran <richardcochran@gmail.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Chintan Vankar <c-vankar@ti.com>,
	Aksh Garg <a-garg7@ti.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: ethernet: ti: am65-cpts: fix support for PTP_EXTTS_REQUEST2 ioctl
Date: Tue, 20 Oct 2026 15:23:07 +0700
Message-ID: <20261020082307.1267591-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020003525.1237742-1-jjc@jclark.com>
References: <20261020003525.1237742-1-jjc@jclark.com>
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

On Tue, 20 Oct 2026 07:35:25 +0700, James Clark wrote:
> Commit 7c571ac57d9d ("net: ptp: introduce .supported_extts_flags to
> ptp_clock_info") modified the PTP core to validate the supported flags
> of external timestamp requests, rather than relying on each driver to
> check them.
>
> am65_cpts_extts_enable() ignores the flags, and am65-cpts was not given
> any .supported_extts_flags. Since PTP_EXTTS_REQUEST2 always implies
> PTP_STRICT_FLAGS, the core now rejects every PTP_EXTTS_REQUEST2 for this
> driver with -EOPNOTSUPP, where before that commit the same requests
> succeeded.

Adding Aksh Garg and Sebastian Andrzej Siewior, whom I missed on the Cc list.
The full patch is at
https://lore.kernel.org/all/20261020003525.1237742-1-jjc@jclark.com/
