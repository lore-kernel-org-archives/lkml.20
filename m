Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B3C94EC665;
	Mon, 19 Oct 2026 13:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.38.64.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415937; cv=none; b=KIFwvKZfHvFMWOF/sLLVte+DNE1VIFSPVIWaq8ZjO0hiEOmBPeifkpTLAKaWvmGSG6SwPQHV/WKqoUhFKe838V7K0NCtdWQAo4ozxHfoYNzRlt5kVLrj7en7WL+p4BYHirvfUCwgH9pEvyS/4BXtPKTXEgaiSp+b4xZsHLFXRvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415937; c=relaxed/simple;
	bh=ie2xRdvhW6XEpWHVnEjd1mxBQnEX5/KxMdAhk8NRWm4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Im1qottPw3/BEmCBbGs9Q37mQslkZhVUy854ThTZup+v/Ww3qHzA/VWJSZorU1qFKlLgPt+d6ArUBJjQGXKgQT1NybqUUDQRi22uBXMUO66OYHzV5QMRzZMOUJLEogE0rGl4aDvqgwRhhoQmkdt1NGA5YxK2WFCtG0QOATm5/zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn; spf=pass smtp.mailfrom=mail.ustc.edu.cn; dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.b=qxEI6b6P; arc=none smtp.client-ip=202.38.64.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.b="qxEI6b6P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=xR3GgYpgStYUF1iuqM1eQngTFywt2HRYv3
	7KJeA9g1U=; b=qxEI6b6P3KEImeOCcQxi1sQovRwOayit9sQUWHcvUrMJS062s8
	IEtfhIbBjXZ86iLdPaIWFrDarKAqUWzate/WKULT0R/9vlK10ivZrRG0cjUq9/wJ
	Rx99gcrx/DR6UK0yrTwrpe1zAv+Ni/2OfVAd3xVGwamn/DKdZA2b0/wqE=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.183.93])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgAnoze4GNZquR0TAA--.3173S2;
	Mon, 19 Oct 2026 21:18:49 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v3 0/2] USB: describe two connectors sharing one DWC3 HS data bus
Date: Mon, 19 Oct 2026 21:18:46 +0800
Message-ID: <20261019131848.344689-1-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261017081320.220525-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261017081320.220525-1-xiaqinghuan@mail.ustc.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:3pYKCgAnoze4GNZquR0TAA--.3173S2
X-Coremail-Antispam: 1UD129KBjvJXoWxurWDtr4rXr13JFy3ZrWkWFg_yoW5Xry7pF
	ZxKrWrtr4DtFWfCwnFv3W8Ca4rua1kGFW7Jr4DXw1UAa15GrWrWrWxtFyYvFyUCrsaq34Y
	vwn0g3s8W3ZrurJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvIb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r1q6r43
	MxkIecxEwVAFwVW5GwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s
	026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_
	Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20x
	vEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE
	14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf
	9x07bYtCcUUUUU=
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREFB2rVHlSR7ABIsS

This is v3 of the series describing two USB-C receptacles that share one
DWC3 High Speed data bus.  It is deliberately an RFC for the shape: the
driver part is not included yet.

Changes since v2:
- Drop port@2.  The shared HS bus is now port@0 with two numbered
  endpoints, endpoint@0 and endpoint@1, so "ports" keeps describing the
  controller's own buses.
- Require "ports" when port-select-gpios is present, and reject the
  endpoint properties when it is not.
- Constrain the two mux-state values to be complementary.
- Move the per-connector role-switch lookup into a generic helper,
  usb_role_switch_at_endpoint() (new patch 2/2).  v2 relied on the
  lookup walking from the endpoint up to the parent device, which is not
  what usb_role_switch_get() does upstream, so a consumer would never
  find the switch.  With the helper the switch is registered against the
  remote endpoint and found from the connector's endpoint.
- Do not describe driver switching policy in the binding.

Two questions for you:

1. Why not the standard mux bindings?
   The GPIO only routes the HS D+/D- pair.  What the driver needs is role
   arbitration between two connectors (the oldest active request owns the
   data path, and a connector reports its role only while it owns the
   path).  The mux subsystem can select a state but has no notion of
   ownership or of USB roles, and drivers/usb/ has no mux_control
   consumer today.  gpio-mux also drives its mux-gpio to the idle state
   at probe time, which would override the level left by the bootloader
   on this board.  So the arbitration stays in the controller and the
   binding only describes the wiring.  If you would still prefer the mux
   bindings we will rework it -- that is why this is RFC.

2. Is "usb-role-switch" on a graph endpoint acceptable, given that the
   property normally means "this device registers a role switch"?  Here
   it declares that this connector endpoint has its own role switch, and
   the new helper looks it up from the connector's endpoint.  A separate
   property name is possible if you prefer.

The board is the same as in v2: two USB-C receptacles, Super Speed pairs
independent, only the HS D+/D- pair goes through a 2:1 mux controlled by
TLMM GPIO 29; both connectors have data-role = "dual" and are handled by
pmic-glink.

Once the shape is acked I will send the DWC3 driver part as v4, including
the fixes from the review of v2.

Qianhui Xu (2):
  dt-bindings: usb: snps,dwc3: describe two connectors sharing one HS
    bus
  usb: roles: look up role switches attached to a graph endpoint

 .../bindings/usb/snps,dwc3-common.yaml        | 109 +++++++++++++++++-
 drivers/usb/roles/class.c                     |  40 +++++++
 2 files changed, 148 insertions(+), 1 deletion(-)

-- 
2.53.0

