Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6E5D3D9533;
	Tue, 13 Oct 2026 10:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.38.64.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887384; cv=none; b=sRA/Pg6QyerCOQaUjOkx8TLVQIcDzL7l11yKGz/lMQCM5mAw+WO6cNz9vTICItAaq1Lu+8ZUS6GBxuO8aOJty3nPpcCgiqRT3l3WKFK32AXpok03o3jP4wQI6sNQ6hEoE0VfVwYeq35OQ6kvlEyQ6J+d35me/Szxn488JEwd5KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887384; c=relaxed/simple;
	bh=xNbYklef+JsQ9pr1qpIPk1sGQhpTRgcQSMM8volJsB4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZyPR5YDnf9RB5V6iRy02bB3YLEMmwWOgebjL39rnHwYnKIaWROYY+q4MPW/Wi2Zip80Mn2U4vxv/WuVNn8Qz0ZmZL5V2e/IRzuD9PYelYAVRsCDfyNUaDCIknz0/m55jDJfYpVu9k0ms8Yl1z74nNobY8sm7C6ctDq56Nr1LMg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn; spf=pass smtp.mailfrom=mail.ustc.edu.cn; dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.b=j33ZQDSQ; arc=none smtp.client-ip=202.38.64.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.b="j33ZQDSQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Transfer-Encoding; bh=Dkg8q02PSF
	T8dqWMdYWmVeVYe6KS5uoSpzYS8G8kLvM=; b=j33ZQDSQ1tgdDmxJHtriv8uGPu
	BqJaD6cr7ncvHDJUIjEDdY/6+cYOZA7DNL/DvPwpG/K3pW7sbC2C1GP8itx4Gkbd
	Aga/CNps4PwjT+QSeIInr0Yi7Ms7aKIzxcu9zcMVn6Nd7QTRPFjBeVM5dkfDnLz/
	3fyAOSmTi+Z5zdlso=
Received: from 5700g-x8664.ustc.edu.cn (unknown [114.214.192.228])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgAXEikHCM5q2w3hAQ--.890S2;
	Tue, 13 Oct 2026 18:29:27 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	linux-usb@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xu Qianhui <xiaqinghuan@mail.ustc.edu.cn>
Subject: [PATCH 0/3] usb: dwc3: support two connectors sharing one HS data bus
Date: Tue, 13 Oct 2026 18:29:24 +0800
Message-ID: <20261013102927.1141696-1-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:3pYKCgAXEikHCM5q2w3hAQ--.890S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AF1fGryrKw4DAw1DZrWfAFb_yoW8Xw17pa
	45trZ3Cr1vyrWfAwnxCw17Gr1rZFZ7JFyDtry2vw13Ga1rGF18Wr1xKwn8Za4UGryfJryY
	yr90grWjgayxuw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
	CwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
	nIWIevJa73UjIFyTuYvjfU52NtDUUUU
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiARETB2rNcIlM4gAUsg

From: Xu Qianhui <xiaqinghuan@mail.ustc.edu.cn>

Some boards wire the High Speed data lines of a single DWC3 controller to
two receptacles and select between them with a GPIO, while the SuperSpeed
lanes stay per connector.  This series makes such a design usable:

  - patch 1 documents "usb-psy-name", a property the dwc3 glue drivers
    already parse but which the bindings never described;

  - patch 2 describes the two-connector HS data path: "port-select-gpios"
    plus a "ports" node whose connector endpoints carry "mux-state" (the
    logical port-select level of that connector) and "usb-role-switch";

  - patch 3 adds the driver side: one role switch per connector, mutual
    arbitration between them, and a data-path switch performed after the
    previous host/gadget instance has been torn down.

Single-connector designs are unaffected: the mux path is only taken when
"port-select-gpios" is present.

This work was developed on the Qualcomm SM8750 (Lenovo TB322FC) tablet;
the board device tree is not upstream yet, so no in-tree user is switched
over by this series.

Xu Qianhui (3):
  dt-bindings: usb: snps,dwc3: document usb-psy-name
  dt-bindings: usb: snps,dwc3: describe the two-connector HS data path
  usb: dwc3: support two connectors sharing one HS data bus

 .../bindings/usb/snps,dwc3-common.yaml        |  65 ++++++-
 drivers/usb/dwc3/core.c                       |  30 ++-
 drivers/usb/dwc3/core.h                       |  22 +++
 drivers/usb/dwc3/debugfs.c                    |   4 +
 drivers/usb/dwc3/drd.c                        | 177 +++++++++++++++++-
 5 files changed, 294 insertions(+), 4 deletions(-)

