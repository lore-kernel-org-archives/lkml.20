Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794461500;
	b=d39eAHJ7hyVn2+MVvUw97U9AbMGvsviafI1FU46I/ZAMR3UC15P+o88UKOJq9/v5Kv2e
	 UKXahWv2TJNAcyoauGWSgv+jJvflaWyHUBzkQBsjPhhGOdnUt0vLMileTGZSpHRA77Exy
	 Z9MPJ5jmDz2wjjwMmr/CdBolbJud8lHvQgHXy9nUaTh7/927e/E7B0H3RIY707GfvvWQF
	 es37kAoVUf4vX3pNuAkZFVX2/OjDA+aFD3qaL4u/OBhPXj2qmzccBAumCfIwQZa5b9iLv
	 N4LOSXPrmkWHIP1KmAiI6Jfm1FSriYSGdyyEojWs8jH2stwWPQhiw9g62SO69D400BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794461500;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=prqA78QZ1Z5CeKjZtZdkDtlv7RDcpJe/NjIjUqczbGs=;
	b=1XcdArKIUQ1lKYCrVetj7JAik/Cg77S9aOmefc2dV/+0NavXmiQrMT4Nfj8ZgynzzGc2
	 cHvVdh0xh/mknJRv3CowsH7Mv31UnO6hYry4B8ndhSO6hKzivGYK8i+Z4SMUXUO4FHuFY
	 Uuo9902tJxIv/IiiYihamhAOqdBrnfqclpeLmpGbzSvFPvezNCS3HuN5FI+GoaawgxJqy
	 gfhjFn3HVPtDdcoIb/y3eS8DLV1M4dfoI2Xnni8n4JmJUrY/smM0i3YEcDdXmHBPSNj0t
	 ZFyuYDd7JyuXtjItRkZTe2EOAff/RPlhHngrATbX8cTNDf/5Ua3dtvRBUAZEr0PE88Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=aIS6cm04;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E826B606A323;
	Thu, 12 Nov 2026 05:31:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E826B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=aIS6cm04
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AC5VTjgC3463063, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794461489; bh=prqA78QZ1Z5CeKjZtZdkDtlv7RDcpJe/NjIjUqczbGs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=aIS6cm04b7MfEYqJqpKLMBw8vdrNBXnYK63RAe9K9xIod5sEsawDkcl2TAvXWj3nG
	 I6StFvlM4fLt9j0yK1kfl85wn+G3s1/8All2XxwAwagEeKlPYReiosWR7a3D0oCcH/
	 8JRqwc7rJ6O8JT7aRCKfyGYsEmhqSa5XmQA9zHI6h9FtKpCekX4drxcoHHLt+OtyBy
	 axfdJul23NDnEHDaz/LCzf++FsT4E/zpRWfNeuF9I0hu2OOUviFHPJVECx7CLSImB7
	 RylhKtv9g3hmAkr4hyNyoyShKcRuSAzPp8Ke2+yNlV5GFEYsNhAza9AS0FJwwOMOv+
	 Rh0WDRypJMEbQ==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AC5VTjgC3463063
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 12 Nov 2026 13:31:29 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 13:31:29 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 13:31:28 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Thu, 12 Nov 2026 13:31:28 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <p.zabel@pengutronix.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <cylee12@realtek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<james.tai@realtek.com>, <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>
Subject: [PATCH v16 0/3] reset: realtek: Add RTD1625 reset support
Date: Thu, 12 Nov 2026 13:31:25 +0800
Message-ID: <20261112053128.561149-1-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
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

Hi all,

This series adds reset controller support for the Realtek RTD1625 SoC.

Since the reset and clock controllers share the same register space, they
are now decoupled via the Auxiliary Bus framework. This allows the reset
drivers to be submitted as a separate series.

Best regards,
Yu-Chun Lin
---
Changes in v16:
- Split out the reset controller support from the previously combined
  clock/reset series (v15) [1].
- Extract the reset IDs from the clock binding and introduce them as 
  a standalone patch (Patch 1).
- Add "REALTEK RESET DRIVERS" entry to the MAINTAINERS file.
- The driver code remains unchanged since v11 [2].

[1] https://lore.kernel.org/lkml/20261002074331.3066919-1-eleanor.lin@realtek.com/
[2] https://lore.kernel.org/lkml/20260728142806.1954638-1-eleanor.lin@realtek.com/

Cheng-Yu Lee (3):
  dt-bindings: reset: Add Realtek RTD1625 reset IDs
  reset: Add Realtek basic reset support
  reset: realtek: Add RTD1625 reset controller driver

 MAINTAINERS                                 |   7 +
 drivers/reset/Kconfig                       |   1 +
 drivers/reset/Makefile                      |   1 +
 drivers/reset/realtek/Kconfig               |  19 ++
 drivers/reset/realtek/Makefile              |   3 +
 drivers/reset/realtek/reset-rtd1625.c       | 262 ++++++++++++++++++++
 drivers/reset/realtek/reset-rtk-common.c    |  73 ++++++
 drivers/reset/realtek/reset-rtk-common.h    |  29 +++
 include/dt-bindings/reset/realtek,rtd1625.h | 171 +++++++++++++
 9 files changed, 566 insertions(+)
 create mode 100644 drivers/reset/realtek/Kconfig
 create mode 100644 drivers/reset/realtek/Makefile
 create mode 100644 drivers/reset/realtek/reset-rtd1625.c
 create mode 100644 drivers/reset/realtek/reset-rtk-common.c
 create mode 100644 drivers/reset/realtek/reset-rtk-common.h
 create mode 100644 include/dt-bindings/reset/realtek,rtd1625.h

-- 
2.43.0

