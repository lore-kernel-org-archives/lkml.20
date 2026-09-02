Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45664AD4DE
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 21:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788385427; cv=none; b=HfaTUJcfTw42i+8D8bulWn27yZhzni+hodZrxX0xR79uYe16jOGQbGtUJLv548LgbJ4W9/9cAtjS+PnVh8ugjMaMUqrKD03MxMi9hiZZH+hp+fejQNzMatAsAORWbe7JRs5+ywCgvmNSFxpOlVsWYefHw8el0goxuIstta4Ag+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788385427; c=relaxed/simple;
	bh=WYWD6k3/YTt03ju4RohZzAu0j+nseurIlRHs8IH6mZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r7SM89X0iufH7xrlumkAh9xFxdyrzW1BAdAwyzbEcH68B6aQvthaarFn7D77nxllVgDI5pv3QSM6L4eVnDq4bwRQcJz67mmvWcqpbps3y6yQXmRtZ5dD/PsSIJYvfSmNtS6JrOd1mqM4etZZ8H58vpORpgD+CO5Hsh6RX+7BRpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=nXp3WuOV; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="nXp3WuOV"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-52f1a320162so15028701cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 14:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788385414; x=1788990214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aBR0UsO8ZWY8yOqrzQKul+zJVePMezCNhp4pXn9LfXI=;
        b=nXp3WuOVDRro2KCDaDkRxvEmmNIx+er9G+rp6KyGAZk7PJdArGEB8FflL17rVtof6q
         4/fENoUe1/xsW1hRVFTW9mBsqHATTOAuiWOCSUmumaDSUs6mHtIFrf9wxxxjcbOI7/j3
         2PET8ZLXBw7SzEeaCHpd8zVXSpVXTLKz8FCSzWb1giAzKrfh2EluafmVl+NwABAZHTIK
         odk9F5ddsCbsKNZ9VsXw9NBrFRJQBM09JO66DFe+coqbGtL5PisudkVjhITDkc9AO+P0
         o0aJyHoD9U7ZyPF7+Out0AQtTUTsC+qCkveOCzazPhOm2FoKPd7TS9ewyo/z93/VQVxn
         y1Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788385414; x=1788990214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aBR0UsO8ZWY8yOqrzQKul+zJVePMezCNhp4pXn9LfXI=;
        b=CmqSxhapqGBqphzBTzvbDODZePlsMk4cqyvwb/ZEZdyj+kadevgrLIZmVBir6pSSGM
         BVyxc9KBemxfnjSySWlTCQggI47y5DhA1j/W3wjBg+S3HYvab1yJZmiwyZp9IqNhw5ZQ
         J8I0Ejww3fwUbF3oMJbGemLOlspbm4U/PrlnMVaPHcOd81knozM0OjPlhG82gTcWcO/J
         CIKzgv5TKu6h/PgMya106vJyizWzjzt5Dp/Q2ulxM16Xi6ZiB/ZrZvAwZE7PtAfPWh9A
         X+AHriuyeoghTirWMz2cVNlhnZyFYhro+xa6BlEyERbnvvZUfmOVRmE//hQES4KCV4wW
         3FPQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdzXjPtp/Ss1nq/EpWGh9eFdVpMBJdUaBDXht0d4UXJgDWK8LdnxmIxKq7SOlRNUkC1TWeyL57BLB1u5M=@vger.kernel.org
X-Gm-Message-State: AFuF++lW58J0auMA/LSAdOhxGQBCSC1wz7YNRtgvnR56AcLAr8AMRt1T
	Qiwb2f8v1gys9aoHgjp5Ng30o8W42SM6TBnxAm0KAL+TYT1V09ypkWUYDAvl34T+XXo=
X-Gm-Gg: AYBFou008Vm9+UnyTVdoQzZbMOwwmfaeEP01fndKY94N56LPHl1RqLJ/tAD7P7gM+0l
	sfgA8jrRgfGgRNjn52k5s48OCelALkfusb/AFYVRBeo+WUkdLkcGqgTX/covnW7gTbHydhqfIUO
	xEhfHhmE8e6aDf3ixcVCaBCFAiDLJtVbzVaa99X2ceG6u0beQR1koGRjaupgVYCu/bySOnmAcw7
	NtGVPc7KN9i07dO+JnTOVcK9pkVk8DFYVeU/QCZouwWAmFhd044Wc0JebEr+Q1Nmd38KBhCuhyl
	7q/r4Z3UA3vbcOvbXgP0IK9B4nAxllXSxHMcdpKWaDLwlua+wTYA5mdzRzOLY8NepLS1DmQcXz8
	Nk3sV1pQG6Z8dXTiFHuep2dzm4M7pmxiLVi9ihJH4iSIlGXrk1GDXWMe8lmmQdvnvMbYjDGb2W4
	ZuCeT24Sy/gF8dLf0PZXdP16Bbt7otT9vybW232j3bHglQXYKTRFaWkKkgFuEjX0Q4kLpCI3HXC
	lk=
X-Received: by 2002:a05:622a:c0c:b0:50d:e471:2d1e with SMTP id d75a77b69052e-53036d4d21emr94060931cf.35.1788385414076;
        Wed, 02 Sep 2026 14:43:34 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9ee06d30sm28372546d6.6.2026.09.02.14.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 14:43:33 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mani@kernel.org,
	krishna.chundru@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	sushrut.trivedi@oss.qualcomm.com,
	umang.chheda@oss.qualcomm.com,
	rosh@debian.org,
	jsandom@axon.com,
	daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH v3 6/6] arm64: dts: qcom: qcs8550-rb5gen2: clean up PCI function nodes
Date: Wed,  2 Sep 2026 16:43:20 -0500
Message-ID: <20260902214321.1721477-7-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902214321.1721477-1-elder@riscstar.com>
References: <20260902214321.1721477-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Qualcomm RB5gen2 devicetree source file defines a node representing
a TC956x chip which contains a PCIe switch and an embedded endpoint that
implements two PCIe functions.

The devicetree nodes erroneously include a "pci" device_type property
for the two PCIe functions.  That property should only be used for a
PCI device "that implements a PCI bus".  Remove this property for the
two function nodes.

In addition, only PCI bridge nodes should be named "pci@" (or "pcie@").
PCI endpoint nodes are typically named based on the functionality they
implement (e.g., "ethernet@").  In this case, the role of these PCI
functions is not (yet) specified, and furthermore they will be used
with PCI endpoint buses.  Rename these to use "dev@", following the
convention used in of_pci_make_dev_node() for dynamically-created
devicetree nodes.

Finally, these nodes define #address-cells, #size-cells, and ranges
properties, which are not normally defined for PCIe endpoints.  Remove
these properties as well; they can be added back once they are actually
needed/used.

Fixes: 33cae252054a6 ("arm64: dts: qcom: qcs8550: add QCS8550 RB5Gen2 board support")
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts b/arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts
index 9df8dcd6c62b6..e6340f7d30dd8 100644
--- a/arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts
@@ -1126,20 +1126,12 @@ pcie@3,0 {
 			ranges;
 			bus-range = <0x5 0xff>;
 
-			pci@0,0 {
+			dev@0,0 {
 				reg = <0x50000 0x0 0x0 0x0 0x0>;
-				#address-cells = <3>;
-				#size-cells = <2>;
-				device_type = "pci";
-				ranges;
 			};
 
-			pci@0,1 {
+			dev@0,1 {
 				reg = <0x50100 0x0 0x0 0x0 0x0>;
-				#address-cells = <3>;
-				#size-cells = <2>;
-				device_type = "pci";
-				ranges;
 			};
 		};
 	};
-- 
2.53.0

