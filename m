Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712362;
	b=adjQ4/HYS7vA8WYYcuFRrLWqcQVr+kTZc81Syx9Zp2E8Cl7TQ1i0lqQpfPwt0mFAnrGR
	 uE706xOyDc3ZDECDeKQ9lafvIuMCz2oHqEKXy2kCKWeUZw1M5wdjsNS6N5yOFlH6E/9iD
	 Ssc5Bwuozoyj65F7NIttwnOiBa9whnA/zxKumYAjmVk847Fv1UazmPW8qL3vWYRTRizC5
	 Z/PJEV50JOyIJQKWwL9C/+mJiIHXPLmb8RSJqywR9+j+alnb9i0ziTXkR8/o0nG+vNcmE
	 b7IIzqkQKfLwePYbENoW2vRvLx8S0jCQfTWlplxaC7f5f+JubD5/eoTEct0RfukVxOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4tPenR+/9h0LCzZJprU/jbaqrKPBMlOXgrDY4zMH4eg=;
	b=Vp+8SRSJb/s09xMlMWS2BCwJylDvTrfUQ39woBQvNTnKSbgPWAxqvajt5q3dmdioMPUr
	 6T0QuMIKt1P7omKatMZmMBIa0ga6+MaNeBJR1K0mb2mWyXbrJF+1jsuq94/B460grVzS+
	 QbIhHBaqKQX0lsJYm05A2ICbHlwWlvXxtFkY5JPIqs7B80dHwxj4B32oAIMfJqu0hKerm
	 ohEpXDBC90yOGsi3bP3XXQYPU/LQniQA5jCZKqJyveCfofHe1ga/1bdxjsn87x2IV+vkK
	 ifmd1Bo52yZD+s5m+j+HS9K4TBHhCKvr8eHip0CtvRxUfAQe3co8pfbciFJenbEC+CQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pr1e8+U0;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C17B606A331
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:26:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C17B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pr1e8+U0
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2d6cf958bso19560655e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793712360; x=1794317160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4tPenR+/9h0LCzZJprU/jbaqrKPBMlOXgrDY4zMH4eg=;
        b=pr1e8+U0b60Vg86WqF9hISWy2VhHBhTPV0Top3duFznVviKPcsIIhKmqTzXK9c1uKj
         C/gOOQzQRh/x8B4O/fDbE8jDc4kYFoMhZYTXVModQ30qRCIhC6fWbSWuGB9tIrtPeYyT
         Tx5FUpZjxtOJVGi8gM3AHX5FLlDIfEBGYLAoNAioAafqXk6Hx14g4AdKi9joV8+IUm4o
         arn6+HqerXCfP7AZnZSPxGnPptQD+5MvOdPUhomBG7Pr3xiB9D+TfYD/pGnHlPiCRPg2
         kkD0Isa4fk5+6P7Yir/CUgPAzbWq2loBsnDAxbkpKZIZyDJnO9uXwB9HgDTFjD3dyLQW
         9tfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712360; x=1794317160;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4tPenR+/9h0LCzZJprU/jbaqrKPBMlOXgrDY4zMH4eg=;
        b=ytkb8KM6chRgMzdqyBwjkt/9xhdhCbynK9OYHJ3amkw1E3XlaAluwHaP0w9ueQdJPv
         eKpqMAEE+MabGB92smACRhKzX9Z86cnC32xqKjcpYOr4AeIfdBDLCku6EPXAOU3Vj3hg
         Q4jHREQWvFgjgQReFH2ET/uAXfTrqGEHqj7ibi9+P0EykylQ4tRMa/gP255BauEf2SGy
         Yh/6D3jh6ZUvvfhKU3/A/Vhu0x5/LVuzsRJXtDwkYTJuMLvXKcLHjPJ1104Ju+Gu6X1Y
         PQovHkINx91QzvQcUc1TZC3yhlSPttAu/F7ZmXl/X4Bvv3SG1MYKlAb5XAJMLAqlXhNQ
         4dWw==
X-Forwarded-Encrypted: i=1; AKwUvBwG/F9WbIRlAZx7pZxjaZQjTJnPUKI103PPO3po3Av2YZq9M1s1mtJmS2akkQmoGY3n8/gm3LqapOHgJuc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CjFAgq4j6eL5nQ7uuGOgTnmrrGr5RNzdvD2uyht5iWL9I3qx3
	eTNT9TdFKPe8DzlfWTh1YgUYhl2/AzhH7k8F/szpD99kZgDyZh2oPkIifBA5LwCx
X-Gm-Gg: AYBFou3b0S90cEso8Mir9u/b+495lPMLqtavlAzSx4i24yKg8RaLDIdxRkN2hQgQ4JL
	qHCZf/h1xAhC3OFmpSKz8uaD/05MNDSLwphzmklVS/dd//VD3o1XgiRHbL0sh5u9CqNxVIz5WtX
	nJZeROna5EpNWvguJ6hn0DPyzJ4QZE76U9CZuDpXTzBVQzZry4pOwbhTwA/MId7FBvSu0/YEuit
	TKzPgjraJ7dnHQCwY5/FL+4Qx2lwUMcZDStkVB+ziOXznxxNO9WOisxe1+NfpAIjEJj1XTglie9
	Cd27yZGKrbjCM2rY9VBNbURdwLiKBl/ML+JBAP3NdMV5erFxGuSVN6fSVbWZJ3CQhU32xjE4d5M
	j29HGUEWqNtd06dIE7CAh5e8OntElGNHly5bVl2s1BeLviY3FYEzsYjDnuJDfjyETXqaYEDsjy4
	+UFLU8VJ3ZWwhH6ZcEwyu1H5JbcJXjkZ0k7xWiSezhzdIfGC/aIMxVd+Ytsc7CZxy4GUroNkWm7
	2KhdN81Dyur9p9gqmKioAuiAR3Kp3r2z9yJvlqp6H2h3XiQxc+D385gZbu9mkA/UFoYY8x2f+5T
	ONh46d1KKF6JcvRaWyHRyULrtIPyJHzLDm4H09y53ZDg5+DGUEpGLWCa6FKaiciQ+1qD5xYJWK5
	V9jOPaUnMwwGzfKbSbtRH9aY=
X-Received: by 2002:a05:600c:a00b:b0:4a7:b304:253e with SMTP id 5b1f17b1804b1-4ac1765d8abmr303491105e9.22.1793712360411;
        Tue, 03 Nov 2026 05:26:00 -0800 (PST)
Received: from kreach.multipass (nat44-21-238.net.ruhr-uni-bochum.de. [134.147.21.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a82cebc1sm84725725e9.1.2026.11.03.05.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:25:59 -0800 (PST)
From: Jude Gyimah <jude.gyimah87@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	heiko@sntech.de
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jude Gyimah <jude.gyimah87@gmail.com>
Subject: [PATCH 0/5] ASoC: rockchip: fix missing REGMAP_MMIO dependencies
Date: Tue,  3 Nov 2026 14:25:32 +0100
Message-ID: <20261103132537.3717496-1-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Each of these drivers can be built into vmlinux while the code
providing a symbol it calls is a module, which fails to link.  The
same shape in 5 drivers, so they are here as one series.

Affected: rockchip_i2s, rockchip_i2s_tdm, rockchip_pdm, rockchip_sai,
rockchip_spdif.

The fix is a select rather than a depends on: the providers have no
prompt of their own and are only ever enabled by a select, so a
depends on would leave these drivers unselectable.

Each was reproduced on v7.3, x86_64, by a vmlinux link that failed on
the named symbol, and each links once the select is added.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

The checker is at https://github.com/JGyimah/kreach, and the
reproducer configuration for each finding is published with it
under results/.

Jude Gyimah (5):
  ASoC: rockchip_i2s: select REGMAP_MMIO
  ASoC: rockchip_i2s_tdm: select REGMAP_MMIO
  ASoC: rockchip_pdm: select REGMAP_MMIO
  ASoC: rockchip_sai: select REGMAP_MMIO
  ASoC: rockchip_spdif: select REGMAP_MMIO

 sound/soc/rockchip/Kconfig | 5 +++++
 1 file changed, 5 insertions(+)

-- 
2.43.0

