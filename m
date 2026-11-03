Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793693710;
	b=B2CxG/OUXTWQIIpM2TFE2hDDRfRjrpQcgYXR2Aw4KnAsl17RJ5yprdPenb48KX7wOeJN
	 SsN0JQI4h78dOWX/bOcbIGxQG5KxlYWpnP30bv5vrHrBN8rcrwD7c5nhyp8YFC24XakLE
	 ecnZftx83Q3/lSXKkPc1lpxyGCjBpKnFN7+04DGFJbxtwNzRZuef4iwi6LtyMxhwUm4LK
	 u3wUV75w4fd11WR8/E+m9wSmOgNBfHVr7gaKbB1QDZnvxYa/QlzTvM5UlmqG7GXJ+wMfn
	 WYE7bOGEBiZHftRlpTFblf+X5EiqFBS3X/YbBaDrj3b4YnpuHq931+0VDPfFNwpZVww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793693710;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=TONs+Q/DijSR2FXVzY4H5fpiXv+7PHbmWchCwxnjqw0=;
	b=cM55LZM1o9aCf8uhmlzlBqPMBnbD8a4pwFMTy6IaXpYs5glr3rR+yTyx5Q9un7WP2RyF
	 NaavicFo9zlWRnZphV0yi5sW+MKGdeX+9lxlMBhBcKK5/EWaG5M6M71IXeuRzNZ1iYqNM
	 w7k+16O4cg/ec2hDwJs+6Q89v3tWkRl7pJ9QBDxSXXvxa/q2K5HMWFyD0CNxYRvJTA9eY
	 AGDDv7qLFc94eZkyhQAdtXy3o/z4SHhrE5Ye1atxlB6YtvGHRBJCuv7MQKFbFim3ueD6R
	 Rkh77dPoibxVODfBUiPEwktKj1oUjb8MFylvuL4W0KrkLzGegYGHB0rA/4W6nVBOIww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.25
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9B6606A330;
	Tue,  3 Nov 2026 08:15:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF9B6606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.100.98])
	by APP-05 (Coremail) with SMTP id zQCowABH4LX3l+lq3fQ9AA--.19826S2;
	Tue, 03 Nov 2026 16:14:49 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Wei Fu <wefu@redhat.com>,
	Drew Fustini <dfustini@tenstorrent.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>,
	Han Gao <rabenda.cn@gmail.com>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH v4 0/2] phy: add support for TH1520 USB PHY
Date: Tue,  3 Nov 2026 16:14:42 +0800
Message-ID: <20261103081444.1983071-1-zhengxingda@iscas.ac.cn>
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
X-CM-TRANSID:zQCowABH4LX3l+lq3fQ9AA--.19826S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZw4xWr1rXF4rAr1fGFWUCFg_yoW3CrbE93
	W8ZrW7Aa1Duas5GFWjyr1xXayjyF4aqFykJF1Fqry3Zrn7Z34Yv348uF13WF4kGr45GFn3
	J348ZF18ArnrKjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb3xFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
	C2KfnxnUUI43ZEXa7VUbGQ6JUUUUU==
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

This patchset is split from the "Add TH1520 USB support" patchset,
with only the PHY binding/driver part.

Icenowy Zheng (2):
  dt-bindings: phy: add binding for T-Head TH1520 USB PHY
  phy: add a driver for T-Head TH1520 USB PHY

 .../bindings/phy/thead,th1520-usb-phy.yaml    |  75 ++++++++
 drivers/phy/Kconfig                           |   1 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/thead/Kconfig                     |  12 ++
 drivers/phy/thead/Makefile                    |   2 +
 drivers/phy/thead/phy-th1520-usb.c            | 179 ++++++++++++++++++
 6 files changed, 270 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/thead,th1520-usb-phy.yaml
 create mode 100644 drivers/phy/thead/Kconfig
 create mode 100644 drivers/phy/thead/Makefile
 create mode 100644 drivers/phy/thead/phy-th1520-usb.c

-- 
2.56.0

