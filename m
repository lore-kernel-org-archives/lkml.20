Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=42.62.85.75
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792748561;
	b=dgVFUpTLmpcnjgtAWB38t7G0gUaD1OFPDUo5crfxggcUW/6w2XonKquwRqwcjeoxIM/M
	 hz4ujILc2DlcKV/vQtkd/Ovgde9igup5LjSibpV7jofp0+vehs0eZVUE7L48BDuC8gp+B
	 tHwNha6qHcnflFrATwLat0I/xkQ70PsFWQI577OjRObSRhR0l+0a+huZr66xqC3u3D9wv
	 hG68uQMBCJFS6ZxA4dkmKr6eC/86JDpVkZDqQeIWbijRowoPivmOgxouCx5oIXi+S//7e
	 Z2SexeHxavyPZcAxxT8xDNVdcKPK/zT9rJC4qXy34gbD7biTvC3lkfQQk+il+IJMKmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792748561;
	h=DMARC-Filter:Received:Received:From:To:CC:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-Originating-IP:X-ClientProxiedBy:X-DKIM-Results:X-DNSRBL:
	 X-SPAM-SOURCE-CHECK:X-MAIL:DKIM-Signature;
	bh=+P4bLHrw1mEI1JJmhHH3bikIT8cEeLkwNLb/jDeLpRw=;
	b=v0Mx2t8nyIKxkle+En3D6WmaWPCNvsyg/508cfZDVIuK8hDbidfHGwBqVTt/CI8aDTXP
	 mr863/SER1dH5crX9RnwZY8OSsh6nMnIQ6F7vF6cs4jeoIJRvABP74zAgffg5HFQ+eSOW
	 6JnMhpVtyEun61WTd0DBJRrxJxuL1nUzTpGZRhrEFA1aCBIw8s05nFpQtrbp+QDwSjh70
	 yCLDl4ij6iM9529av8TXJ4+vQu/NG322vRkRG7+fucj5IpFOFD6gRRgxiPCCvGChuU4+f
	 8Qdy7xx6iN9M5IbTVkOl8FWmKGSO3905Ybxy4Fu7bkKJhM55FnKlFYZrA/1ZZDt67KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=horizon.auto;
	spf=pass smtp.mailfrom=horizon.auto;
	arc=none smtp.remote-ip=42.62.85.75
Received: from spam01.horizon.auto (spam01.horizon.auto [42.62.85.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A913B606A333
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:42:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A913B606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=horizon.auto
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=horizon.auto
Received: from spam01.horizon.auto (exchange003.hobot.cc [10.69.1.10])
	by spam01.horizon.auto with ESMTPS id 69N9gUtH024070
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NO);
	Fri, 23 Oct 2026 17:42:30 +0800 (+08)
	(envelope-from guohao01.zhang@horizon.auto)
Received: from horizon.auto (10.9.0.252) by exchange003.hobot.cc (10.69.1.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.27; Fri, 23 Oct 2026
 17:42:30 +0800
From: Guohao Zhang <guohao01.zhang@horizon.auto>
To: Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin
	<fancer.lancer@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz
 Golaszewski <brgl@bgdev.pl>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
Subject: [PATCH 0/2] gpio: dwapb: add native hardware both-edge support
Date: Fri, 23 Oct 2026 17:42:18 +0800
Message-ID: <20261023094220.2989225-1-guohao01.zhang@horizon.auto>
X-Mailer: git-send-email 2.34.1
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
Content-Type: text/plain
X-ClientProxiedBy: exchange001.hobot.cc (10.9.15.110) To exchange003.hobot.cc
 (10.69.1.10)
X-DKIM-Results: exchange003.hobot.cc; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:spam01.horizon.auto 69N9gUtH024070
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=horizon.auto;
	s=auto; t=1792748555;
	bh=+P4bLHrw1mEI1JJmhHH3bikIT8cEeLkwNLb/jDeLpRw=;
	h=From:To:CC:Subject:Date;
	b=IRkO2UMiab1/uvj2sVd3ZssUCibnfsvZJPvy3F2og/J0W3Q3SsHKt8w15FOTDuElc
	 TkEMh8caaTeXT5URgxxLewUrZ5VoGiO/7zYUeg7Q3+ZoYbMUOmRCSLFRhU7egWgrkC
	 eB8gN7XJdQG3SQEQvzOnTZRFovkQZzifoODpU+q6mrKXUMNzHV3HsjUVkpiLRFiyAG
	 mVNM8IlCmpRZcYjymMgIYqyeHBoeu60JYuradgLqW+aznWeVaTo355NVGqq4rFWMFH
	 zfhww4JlnlT54HtzGEcHUKLvMrnkZeZQnl3RkP+Pcxr5ncRGkhpVIlgmc5ZVly9VOh
	 Fw+efYAjOE1+Q==

Some DW APB GPIO IP instances are synthesized with the GPIO_INT_BOTH_EDGE
feature, which adds the GPIO_INT_BOTHEDGE register to latch both signal
edges of a line in hardware.

This series adds support for it to the driver:

  patch 1 adds the device tree property "snps,native-both-edge" that marks
          a controller whose IP instance provides the register.
  patch 2 makes the driver use the hardware register for IRQ_TYPE_EDGE_BOTH
          when the property is present, and keeps the existing software
          polarity toggle otherwise.

The capability is per-IP-instance rather than per-SoC, so it is described in
the device tree instead of being selected by a build-time option, which in a
multiplatform kernel could not express a per-controller difference.

Register 0x68 is only accessed when the property is present; for controllers
without it the driver behaviour is unchanged and no access to 0x68 is emitted.

The change was measured on a Horizon Robotics J6P board. In a high-rate edge
test the software polarity-toggle implementation lost about 2% of the
interrupts, while the native both-edge mode lost none. With the flag off, the
built object contains no access to offset 0x68 and the software path is
unchanged.

Guohao Zhang (2):
  dt-bindings: gpio: dwapb: add snps,native-both-edge
  gpio: dwapb: support native hardware both-edge detection

 .../bindings/gpio/snps,dw-apb-gpio.yaml       | 10 ++++
 drivers/gpio/gpio-dwapb.c                     | 49 +++++++++++++++++--
 2 files changed, 56 insertions(+), 3 deletions(-)

-- 
2.34.1

