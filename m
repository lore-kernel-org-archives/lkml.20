Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6D703D565A;
	Tue, 13 Oct 2026 10:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.38.64.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887383; cv=none; b=ZgMeyqerbGdf4iWfjDdTbhKp6m+uYEay31SPTZ8PCwzobsxPd+o+jZUcG+NqG1fzclFFvCFbdvUEd9SxhLSZ9Hz7RISQW3S92NqNnma4h7v+PKLeoS5EA1Y/mN4W7N9gdgIu4PmXxPGy0gJiC6gKEtIvFjWSY/qL4OMZA3JAv5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887383; c=relaxed/simple;
	bh=KV2fhQ+VsW72SdSqkuBQ+5P9KRTk6Q9FJ/4848ulqT8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lJpOuddlXqKMAY4rCbFJhw+ozVrzdH8bmmQi4nhYAx8j3U3tT87DV8kjWmMUruJOJ5X9+ZxAvmh99NWluDN/8HSZYqA3p93WXQv2i1lh23hOagTCtmdRCh/bxWVyA9TCndEHDiTn9Goc2Zilt7HYLdap+ZlmKLt79nOUQUxHsJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn; spf=pass smtp.mailfrom=mail.ustc.edu.cn; dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.b=LwuvA/M1; arc=none smtp.client-ip=202.38.64.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.b="LwuvA/M1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=NYLS86OtLvumaJVUFdq6GXyQjyeMreAbgB
	Xg1Vwdfis=; b=LwuvA/M1bvhywh7WWRc+SM0juq6H63vdR34y+RFrUi4EGID7KZ
	yGOz9ddyB+wElS+93H8oRPMwDBJRsIELQjhYdgScMtzdp/ElMpqUi2BDAM6EefHm
	1/7lflM0U7TstnBdWdPOVZxDCvazTynPKOIOzDU+gXLKGpPwJMoQTWAXs=
Received: from 5700g-x8664.ustc.edu.cn (unknown [114.214.192.228])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgAXEikHCM5q2w3hAQ--.890S3;
	Tue, 13 Oct 2026 18:29:28 +0800 (CST)
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
Subject: [PATCH 1/3] dt-bindings: usb: snps,dwc3: document usb-psy-name
Date: Tue, 13 Oct 2026 18:29:25 +0800
Message-ID: <20261013102927.1141696-2-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013102927.1141696-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261013102927.1141696-1-xiaqinghuan@mail.ustc.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:3pYKCgAXEikHCM5q2w3hAQ--.890S3
X-Coremail-Antispam: 1UD129KBjvJXoW7urW7tFyUXrW3tw1DZF45trb_yoW8Xw1xpa
	92krWUtF4ftw1fuws7t3WUCw17WFyDGrW3Gr40qw17t3s8ZayFkrWakwn8Xr1UArn7AFWY
	9ayFkF98W3W2kr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUm014x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
	xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
	kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY
	6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
	vEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVj
	vjDU0xZFpf9x0JUs2-5UUUUU=
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiARETB2rNcIlM4gAWsi

From: Xu Qianhui <xiaqinghuan@mail.ustc.edu.cn>

The dwc3 driver looks up "usb-psy-name" to find the power supply which
accepts the input current limit requested by the gadget after USB
configuration, and while the bus is suspended or resumed
(dwc3_vbus_draw_work()), but the property is not described by any
binding:

  $ git grep -n usb-psy-name -- Documentation/
  (no match)

As a result, any DTS using it fails dtbs_check.  The property is read
from the DWC3 device node, which for the single-node flavours (e.g.
qcom,snps-dwc3.yaml) is the node that $refs this file, so document it
here.

Signed-off-by: Xu Qianhui <xiaqinghuan@mail.ustc.edu.cn>
---
 .../devicetree/bindings/usb/snps,dwc3-common.yaml          | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
index 6c0b8b6538..6609a709c1 100644
--- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
@@ -51,6 +51,13 @@ properties:
       - items:
           pattern: "^usb(2-([0-9]|1[0-4])|3-[0-3])$"
 
+  usb-psy-name:
+    description:
+      Name of the USB power supply accepting the input current limit
+      requested by the gadget after USB configuration, and during bus
+      suspend and resume.
+    $ref: /schemas/types.yaml#/definitions/string
+
   snps,usb2-lpm-disable:
     description: Indicate if we don't want to enable USB2 HW LPM for host
       mode.

