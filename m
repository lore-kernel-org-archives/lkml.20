Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793803994;
	b=oYWkhdw78uadgszAG3CQTZgo8s6S14kVN4vO9xGuh91rc/qDvUm0nqKamC176y6pM3rZ
	 lAHtkVAPO4b6VrC9CIG/7PfU3gqA4oh5xCKRyWf8UtfM0pDJ7+ro2If0YTNXBHM/9XZL7
	 XaHlSNuAdoy3RtwxFXdkbeWaVwKUZwMIIqt0QuHH8MdfGeuqU7MlPNmypGZPzH7sUFEuq
	 Gai+H9x0ouzSNIM8PTswukKyHsyoE6aLVTiloGUtDMBJ5iuu259csZTUPa9Fu95JYqQU7
	 nDnXcwX99FSEku8MFaSk+t7pphMyg0meQL9EiTmw1AdxeS78SAY/HY+wuAXa3B9YpsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793803994;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Bdpb7DkbNvx1cd2LuIdKPUEVWFbLibGs47NkSZrjc4Y=;
	b=Kig1yDOGjeI7x18SHMDm/2hejZ4/Om1mIgHPl8kXCu/qt3JIu4IymCMcjJTe0u6wD8rE
	 /jOPxcUGme60r/+IlXIU2YQeoRITIKTym5TCd32iDqt2pJ3qLjti0Xg7yD+xczA7w57lB
	 ocdmBrKLI9wDKlOBd8IKwzU8KjgMpo4a0TAhOu2VftfWgzTYitbg3Zz8BEFTDM+hChqhT
	 vr1h5LJEIpgIZSydvXJ01NfSJ/pkN72EjHA/MvGJ43KqY3U2T8zHWVKqOXkHYxdxh3zr4
	 qsWOQnbdRsLdED/NULa5+UK6WS5Ok8W/rPuVNxLuqMuzYJF3Blixt36/ZP7RMSUzVWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=nhCkXx55;
	arc=none smtp.remote-ip=74.125.224.53
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0413606A329
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:53:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0413606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=nhCkXx55
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-67c00f291e1so62703d50.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793803992; x=1794408792; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bdpb7DkbNvx1cd2LuIdKPUEVWFbLibGs47NkSZrjc4Y=;
        b=nhCkXx556Tk5e8a3HmNRAJC683ua7/RYJLcvl12sYCREFXjyUA0Ys6CRjrtY+yDUlr
         Mlywezs4Pd5paq4wehu1BHjzzLtc7RNXwUFaekezQhi62MFjyDzBrpMBqNMvrnDWQS5V
         vBtzmvUr1iJh6Ycb9SKwSccJnvnyd4UdXtTVVPqP91hZKb5lcb/XNmzHoJp2vZ5E1CSf
         hqmCEUqxFtVPho7lh6ZrHyinZiWi7uCdpgu2S0CxPvBRsLGbGyakGNzgaHhjTuVgy590
         QgLfSAiGJdV/rC03FphIRnar0B+sMHdr+2IMs41aTvzGcq4lzZE6wnEJ2ia3rZqlD2oD
         OfYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793803992; x=1794408792;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bdpb7DkbNvx1cd2LuIdKPUEVWFbLibGs47NkSZrjc4Y=;
        b=p7Zb0x8RJ+YIKo0QIQYjKHFIagjwsPAVQ6jlmLHloLuaXBwUR674arPmvWYJ26iF3R
         VYiL64GZZDcV61Ep397acixfkNRM0lXU0a4Jq41IuBcygCy2PCJyjL1bzrZl2KymoKB/
         xjuILnTwHRZdSp2p48dW0HARk9oEQQ1lgi9+rZMOX4Lqm/0TUmtHmJ9APKoTvXQYRCf6
         c+D0EeDqPwPAE+UkbwW1j0tWzLN6fHe0A6wHIWa9yBmUG6c5hVDNtOrBLrTkTeR9K5Sw
         uM3N89a4ip025jtTJVnt8Oal6+RBL5jRxseQL+v/PtDnXvDZqH2HpR7xQPzV72yP8++V
         tt3Q==
X-Forwarded-Encrypted: i=1; AKwUvByVl7i9W3s7Mfqx+GgJq/yRT94rdfsPkh5qmHQYQDV5j8LRN4A/nmaif4xguMQt0wHoTkpzYdRpNVroFNk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CVDkHPwlOB2vqDbS5aNkEHaDqq1A8H7O80kRJ50tA1KqKzNbT
	SOB3TaR5SnT7Uqe9bxZzztWn6MEDoecR3ddmitSvP3hgh4kYwYPTOBQeb0QeOJJuaKo=
X-Gm-Gg: AYBFou21okElF16HlAkGmN14E09W+PggkNEVgjdU6vqYoUid6szHmL7AcH2L7DwV/xA
	GqdfEaDRTVQ80rY7mVjcWNipBsSWu42dMbaTvfHIWRHUCRtQltyzd9PvsO1DZ0Tjc+wftaxyAXF
	e1MM89aylo5ObrTlghiF6jnE+F4AVhg193ubTn36tz2FHRUHrQ90p5UoOVbNxsdCwK9Zt543Yca
	KnLTPIscF1c3qCQH7zeGppg9b/ovFtyZn48c4ME5c+Vn4nwv5Qw6cuovm01hQDKIksOkpfhGhVb
	LuQt+RsDAhQgF8gS8O1zyrbLF+3ksqEmUApcNJXPuKWlLaCnZkkn5SC/F4DdqyDJm1PgyWwEiMe
	yMjm5wT8NuydII5xwlIPgd+IZwCmSBhLrC4amAtSypRuEZuL6gqtajWYQSPzG6IuMbHUm5TnIpm
	Gp4wX67PSqte++jHf47ys7TLicf8WZRpsCpldA720yp+agMZ0ri6DUP6kDvIecLrV4tOaOpGcJw
	HWJf++kJDVjUvZIs81Emder/n6WD1EtzOI69umSHr4GcxQfSJSlRcESu7FdcTqdiOy5ea0loE/9
	UOrh/VbCF0rjwsP4GVbj1HCQ14A/edG2aTW/jar9paf3igkab/eNcZklI8KoZqHVpVFHCyoNRId
	ibA4dIL20/5Dv3w==
X-Received: by 2002:a05:690e:16c1:b0:677:b9d8:a475 with SMTP id 956f58d0204a3-67ba50cc6a5mr6545943d50.147.1793803992459;
        Wed, 04 Nov 2026 06:53:12 -0800 (PST)
Received: from [127.0.1.1] ([2804:14c:4c5:8bf0::33ca])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67bee24498dsm1569080d50.10.2026.11.04.06.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:53:11 -0800 (PST)
From: Hiago De Franco <hfranco@baylibre.com>
Date: Wed, 04 Nov 2026 11:52:34 -0300
Subject: [PATCH v2 2/2] riscv: dts: sophgo: add Milk-V Duo ethernet DTB
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-milkv-duo-eth-overlay-v2-2-e3d2d39cf229@baylibre.com>
References: <20261104-milkv-duo-eth-overlay-v2-0-e3d2d39cf229@baylibre.com>
In-Reply-To: <20261104-milkv-duo-eth-overlay-v2-0-e3d2d39cf229@baylibre.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Chen-Yu Yeh <chenyou910331@gmail.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0

Add a DTB that applies the shared cv18xx-eth.dtbo overlay to the Milk-V
Duo (CV1800B) base DTB. This enables gmac0 and the internal PHY MDIO mux
on boards with the Ethernet IO board, matching the existing Milk-V Duo
256M DTB.

Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
---
 arch/riscv/boot/dts/sophgo/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
index 440acd0aa55a..3c9f3530526e 100644
--- a/arch/riscv/boot/dts/sophgo/Makefile
+++ b/arch/riscv/boot/dts/sophgo/Makefile
@@ -1,5 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
+cv1800b-milkv-duo-eth-dtbs := cv1800b-milkv-duo.dtb cv18xx-eth.dtbo
+dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo-eth.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += cv18xx-eth.dtbo
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-s.dtb

-- 
2.53.0

