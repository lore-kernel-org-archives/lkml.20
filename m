Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793963382;
	b=GDsipnKFLeABtvvvkq9rV4f3J9zQTZpnJNVx/Vjc6iJ7H7jzd4mGO9uPDBDl/ioAgJov
	 MGfLjuwEXyI/V52Ghum/DkAprI/+R5WovhYEEPTTWbYPGEL5vEf4jB3TtiTnvSggSPnc9
	 LHRtD1ctb9JKYx6AFIhKHfy75kaBvVWbzfbz1hQ+aWk25zzqnbh71u6UWMyvGk2LIftcw
	 mQKDkUBvzE0npxSXecLiXYaxI/0wZG69+cPg1JS7JqZ8P+DTFXLwExi/+L3FhiWs0vnao
	 dMF1P4yyNH/qLwQ+GlaxGKF0KqKEOQyhu/1MWMV517YUZPEAuilTW32azYcBvALX9jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793963382;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kRZnFYcOPcT7Wj77cIQssMiZxFc0z0H1rY/MUaYgSUg=;
	b=5T1Dfx+tggwD+R/IShU3+/ZGUVFqRWvPF6ZzWjZwhUL+oOza/YpHa5Ujn3vlanzmw8En
	 PI/6Vz9AmjTx10oC/cWQMVjgd9oxFg4BJSNFKe8Y8pARdC499iqTM4QRAgGTTeUknheQN
	 zVuWQs2uHu1nkU1G1YblOQXzb5j1hOcAuJGpnhoXSgAfdt0M9JjIvGOVwZjkQ4LqhcV8O
	 nbD671ilNLk2PA3JuDL380pXHFa1dQJNIkVE1NwJQPfonOqtd/YYXiJZrrtjVK8ciZbG2
	 CVzYWA0ECnnHixE7U1DQN2/20aGEdwcLvmL4YipxsQhNGeR/MOAoYD7tL7fRg9vPzUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DIl88d6n;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5E4606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C5E4606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DIl88d6n
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so530407f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793963379; x=1794568179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kRZnFYcOPcT7Wj77cIQssMiZxFc0z0H1rY/MUaYgSUg=;
        b=DIl88d6nhmwOGknDnpQMw7CDUEcprSXVTAPuRqwC+aviu4k/vGuQALYjTSBcSCtDib
         A+O063FGBBxZSI4K4lMMq6PFNcG99PZP35ePyg+HwenKZPHBHiBPHcxuF+zuRfte1zOr
         WQ8Jgn2U0SWilYh+xF7PZ5bmOeBVb3P95PLFuVhKhy6OWmPK+yWFicrpRnEPLTyHUmZr
         7WU8uSJQ26KmrcpwBThcG1AeCk8uzvMrk0X1on+8fSFXeoX0eVFHpDprK5+Dva6bqySi
         0D9Dx13jA+Az5kGNfDHPQDwUSdxxmmQAECT+DVJGdOM8paiXQ6+gbYLKud+bdvkyUMVq
         39FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793963379; x=1794568179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kRZnFYcOPcT7Wj77cIQssMiZxFc0z0H1rY/MUaYgSUg=;
        b=EWiHTHjbmU4oYyr8KFmtuW/uhB7Rwd5sif8oNDVCpwROyO2EPUqmXgQOJf3PcWl8ua
         hcC7Otj4/wr+QEV+C4uS4jKhjdyPRLHGKJ9+rFTv+Ey9t/Mk9Gsuwnw7JioyhI3AWQEq
         u34d6R3oVJve5VeWAV5mibo7uKRf8mWSTJWfNJbU5Ao5nsRBctIb0ePuAmOQi5RibgLm
         JPzaXvtEaQahccCnFLCSZo8otIG2itImRJc4W25SC989+oOo+1J65dm2Hc40PfYC2Ftp
         6m3YpI0JcQ7h+sOPydc+9Hh9JludG6/YeXYVjwzHfbxDjLKYRd8ipP+TwcStgvuYuKjQ
         wWKA==
X-Forwarded-Encrypted: i=1; AL+hErGqE3oOh5AM82QRYVCdl1HhsMJo+HOchhrCuFqscbw3lj0QII25VqtLbhitDA6UcmJeUIMq+OAsDMThZwE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6BlqEQLfxsUbu+t7gtf/GtnO42Wl2J0W+Nk96yQ6sX1dw/5lQ
	0HA0s6BiZZhGlf5yHGc8YO3pmsgW2s0CJmooW/Sn+4HRLkGPG/iM9Kf4
X-Gm-Gg: AYBFou2AC49qjcx4RDSzgw3N5HQDwVw/a2CDDhsr7tvmUp/BvJgF334i7oDNrHDi6Pj
	VbbEMuo8Db+WUgwE/Pvx6Eq7aw/0ealhIZEXOOlriNPQwS7RmqyluHaWlMbCf30e+fdmmc4FqJc
	jIg/Z+TGKSQhu9g6+T69EcFILogpSSx7p70Ck1nqBaO2cyW7wckafcQMa11vCozH6dKEeVlKpF8
	x636h7vd01Eg+ABHR3gevBGey10D7agFk5ZzLlc1HKOjA5+Q3RAXwC8ImEZyVDkU83rFydcYoVX
	HqZU4hjEuQ5WF53Vi7rBQ8TcVwfP+hrdKhIqpZAkTxSAHQEZNPLEMGbuoiJslRUtCr7jigR3CAU
	+0WD1/Jk9wxcbGfu4z0EyzzaN9UGdmSK7GgdC2VtQng8VtasOo+/wmMSkXfbRQia7rMo0QBQtro
	OOjSIQd6AH0IaqlC0oEMmurdo19GryIZwXsGgG4nioLzJ3FgQ7ZdkLvIyUO7gOKcZ6KSUviRoP0
	0U2kOlf30xn/u4qBTKp0Q6WkxOi6OrKJxRtoyQ3fBTtWZlre/5tXm5P49ARAWkXTksxybyTZq8t
	p+Fnr5GGboCNrMHX/G61PRRzz3KE3RH6kk8tpi6xwjXo3P4QXNvlgVkPhUS05g50c5BKfiKX8kk
	M8S8xgFvNnczwsN6ppigRkeYfUTvbQtrPgL4w9f42pz2r7kwIv2R9pN2WNBCMBVRg7yks6m4TXw
	==
X-Received: by 2002:a05:6000:4283:b0:48e:3b53:e100 with SMTP id ffacd0b85a97d-492781748d7mr4732531f8f.56.1793963379122;
        Fri, 06 Nov 2026 03:09:39 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:1de5:ca41:50c1:3f2d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d087a3c5sm2768243f8f.0.2026.11.06.03.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:09:38 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/2] Add ADC clocks and reset for R9A09G05[6/7] SoCs
Date: Fri,  6 Nov 2026 11:09:21 +0000
Message-ID: <20261106110923.164090-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.0
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series adds the necessary ADC clocks and reset controls
for the RZ/V2H(P) and RZ/V2N SoCs.

v1->v2:
- Renamed adc_pclk_gear to pllcm33_adc_pclk_gear in patch #1
- Renamed adc_pclk_gear_div2 to pllcm33_adc_pclk_gear_div2 in patch #1
- Renamed adc_adclk_gear to pllcm33_adc_adclk_gear in patch #1
- Renamed ADC_ADRST_N to ADC_0_ADRST_N in patch #1
- Renamed adc_0_pclk to adc_pclk in patch #2
- Renamed adc_0_adclk to adc_adclk in patch #2

v0: https://lore.kernel.org/all/20260929113921.119489-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (2):
  clk: renesas: r9a09g057: Add ADC clocks and reset
  clk: renesas: r9a09g056: Add ADC clocks and reset

 drivers/clk/renesas/r9a09g056-cpg.c | 22 ++++++++++++++++++++++
 drivers/clk/renesas/r9a09g057-cpg.c | 22 ++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h     |  2 ++
 3 files changed, 46 insertions(+)

-- 
2.56.0

