Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793346514;
	b=HvJd7pMyMFBzz0DIWgU0Zwken1+OpVfKOYgdekhu/ExFgO9LWcRkYg8Q9oU+SoXTHc9P
	 u3x6GqDVBMVb+Lg/0c6yuIXOVT9XXCbiUFn+d0BJVrWqCohpzQmD+k+sHe1s8ZCwM8dGt
	 zp4AO0KWGIf7/KYl0q2VZBWRrX+I5ywL2xVc7kVrrUxNyUYS5WfIK88n7JUe7MoJQ0dTJ
	 /XgDoOg1DCnIMZpd9R3zp7gjAzH4KEUgPYk8qT/YpHIli1wjWCBuXgiSyY/52DJnfx4qR
	 JUp+U+SP3ovvwEzTCQQVndMwBzfXBJBxc0VWp+xmpaVicZ3J6uqSiPqCIpdjiy1Dv5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793346514;
	h=DMARC-Filter:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:
	 X-CM-SenderInfo;
	bh=l7MKHfjM/GW6yOyE5At/ew2VAID44/Vca7c9Dv1HJBo=;
	b=p3nI900t7FZGwsrTQyE77neTTZVts+alJqYprgsUjQOo9XC5SLVGVKC3qysQCbJRmVsb
	 uN1vcmg+EYAa4YXefdHVpILJ25lKaWQ89mUWccVgdWkzwMUn6SR4QtVz2Eqds0me63inF
	 ZaYUK5jHNnfq5vErFDxw3q50VGpembEMtpYhszhv1bSn3SoEUd5tgi7koq+WCaxdpu9UT
	 MbIztU6RcWpPe+EvBMIpkQCl5dQvKs3gJYRXkpjTtelmDfe2EbEfByq41h9ki9CiufdRq
	 9djmakKHa9iNS57ildYR5/tQB6XkVXacUgRZ6tE3jmQzojwkBMHe0aKzWtSk6oSpXSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.25
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC23606A31E;
	Fri, 30 Oct 2026 07:48:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BC23606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.150])
	by APP-05 (Coremail) with SMTP id zQCowABn0TusS+RqhTm6DA--.1494S2;
	Fri, 30 Oct 2026 15:47:57 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH 0/3] drm/bridge: add glue driver for T-Head TH1520 DW MIPI
 DSI
Date: Fri, 30 Oct 2026 15:47:48 +0800
Message-Id: <20261030-th1520-dw-mipi-dsi-v1-0-753f34fd304f@iscas.ac.cn>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMywqDQAxA0V+RrA1kUsZWf0VcVCfWFHwwsQ8Q/
 71jXZ7FvRuYRBWDKtsgyltN5ynB5Rl0w316CGpIBiYuHF0I18F5JgwfHHVRDKbobxR8y9eS+xJ
 SuETp9fuf1s1pe7VP6dbjBPv+A7nOOaF2AAAA
X-Change-ID: 20261030-th1520-dw-mipi-dsi-580d5b2792f9
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andyshrk@163.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 Icneowy Zheng <uwu@icenowy.me>, Han Gao <gaohan@iscas.ac.cn>, 
 Icenowy Zheng <zhengxingda@iscas.ac.cn>
X-Mailer: b4 0.15.0
X-CM-TRANSID:zQCowABn0TusS+RqhTm6DA--.1494S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tryfKw1fKr4rAFW7Gw4rKrg_yoW8Zr4kpa
	nrGFy3AFykJrs29F9ayF48XFW3Jan5JFWrGrW7Gw1vvan8u3WrXrZFkFZ8WFy8Jrn7ZF42
	vFWIg347WFnFv3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCT
	nIWIevJa73UjIFyTuYvjfUUo7KUUUUU
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

T-Head TH1520 contains a DesignWare MIPI DSI host controller paired with
an internal DesignWare PHY, as a similar design (but with a different
PHY) with the Rockchip DW MIPI DSI.

The functionality to write to the PHY is shared between these two
implementations of DW MIPI DSI, so it's extracted from the Rockchip
driver to the common code. (The same sequence could be seen in the
HiSilicon Kirin DRM driver, but that one hasn't been converted to common
DW MIPI DSI.)

Tested on a Lichee Console 4A (with a Mingjun MJ070BI30IA2 panel) with
further pending DT patches.

One question remains: I have to copy the extra lane bandwidth headroom
from the Rockchip driver, otherwise the Mingjun panel cannot keep sync
to the display signal; from my testing, changing the hardcoded
PHY_STOP_WAIT_TIME from 0x20 to 0x2 (which is written by the vendor
driver) can also make this panel to work w/o the extra headroom. I want
some advice on whether to keep the extra headroom or changing the common
code to make the PHY_STOP_WAIT_TIME parameter adjustable.

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
Icenowy Zheng (3):
      dt-bindings: display: bridge: document TH1520 MIPI DSI controller
      drm/bridge: dw-mipi-dsi: add PHY write function
      drm/bridge: add TH1520 DesignWare MIPI DSI host controller

 .../display/bridge/thead,th1520-dw-mipi-dsi.yaml   | 102 ++++
 drivers/gpu/drm/bridge/Kconfig                     |  10 +
 drivers/gpu/drm/bridge/Makefile                    |   1 +
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      |  21 +
 drivers/gpu/drm/bridge/th1520-dw-mipi-dsi.c        | 530 +++++++++++++++++++++
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c    |  86 ++--
 include/drm/bridge/dw_mipi_dsi.h                   |   3 +
 7 files changed, 700 insertions(+), 53 deletions(-)
---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20261030-th1520-dw-mipi-dsi-580d5b2792f9

Best regards,
--  
Icenowy Zheng <zhengxingda@iscas.ac.cn>

