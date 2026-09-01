Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C2D48989B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 17:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788283269; cv=none; b=Z9OOuVRN5Ok9+pZ/2+YhOS5FKlkdRwGgPpx05mW7Qxqe1sUzwQ168n5EY50DfBrIcOhe8WbP8LkICiWe5FVITl5tc9k2W5SfSVqLAixJuPz2I8Ij+bvDTczs7V4ZXn96faX50UZa7pBQ8NPtM6tTS6v3wcCRbgQcxo7YBpTUS0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788283269; c=relaxed/simple;
	bh=00fk2d4bFTlZ83rXDe3waL00PuwEXFQI8b8viicDX8U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rFrYVEW1bLavqRvyqQ7fdb+alPU1tsdi1ZmRRMwtQRQKwg3RPMPb2XueUikwHxb6//gsW3JwGjBptY+wP+I8T+ZOsvxHlJLqQQTUk6cxQNe9whn7mGqZxU5KHMpC363l5xH7ngMcTHkubC1Kd1pbSNOfBj7QUX+04E8iH3U0lGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=T34yi+8L; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="T34yi+8L"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-51c0006ea8eso359601cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 10:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788283267; x=1788888067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wPkZSzl2Bkcvu9UW0A3Dp3FDmK7DknZNc63zeKT5t/s=;
        b=T34yi+8LdpSmXJY4+o/sAXpnvV+fwXSpm2PCmZcLD72LaqVt6dIAAQIUC6/HEMyX25
         UPFAwkcLxL0HeToMmArCs1EOSEowOPZpfwgWhZhNG3OY15B+EPOK/aNZhZCAr6YElz/F
         pBV2kG3/Qyv+Pjd5RYZrHuK4/ugrA6wpS6zC9h5Gu+SBnMFFtTxsSb5u3fdQ2/VOxyAT
         zsYUuIzJ/X59hTkuo7oBI7ZXB+6AT09X5ESfFOp6yBqZYz93JhHuMCLUMWGJYOOIAqop
         4PNvJiVcBVXaRvTLBO6keA7A7CSqj9RLQ4F1VkcQMgsOb73n9cw9Kg28UzcDy7QnUMW4
         9BIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788283267; x=1788888067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wPkZSzl2Bkcvu9UW0A3Dp3FDmK7DknZNc63zeKT5t/s=;
        b=C/gujNAqeL+BS44msOfGahGmFW8O4i/zI3gHskPGjoKE0RZ7DXUduLGcrIQA4W6QuQ
         DFFyxYNhb0q+HyRwSnFjAzLOjIyP0C8VFDxlwxfBCCl5CjOcCn0x02SieyvQTGVcpAFN
         Kh9v9idYRXEYpzn/wJtKovQ5EkizJ+9Od6sA6l9NGmMh46q8RA0/dPj5ZfXMpgJdVsPD
         TpMKzDmI12EMhVLI4StwG8CCVSTtqKrCjVP9WZpDcjS7wz9p2drV3v7gCVxiPLRfut9K
         Bq+8V/3OSm+b0Q1p8s2qqJtAaRDPEWqu2yeWH7ioUTi7SP+ljI2snKg7JF+fN4QQ/MLz
         h+Zg==
X-Forwarded-Encrypted: i=1; AHgh+RodpopYFW9vnPi6fzX5+CYWtfN4xlhbeTnJV1P93l4POtRHrgUWSHTdihToI9eoknE1KNlQWpyYSpt2/qE=@vger.kernel.org
X-Gm-Message-State: AFuF++nzqVxOXUQLqkKeC2VCalYX8gAS/7UxW3DdlZje6s3Td6GGMWQ6
	9UN1KSEJzMufY4wEVZVxnV8Z0m8oEcuIFqWJcsJGoHYvT5PMKW/TubBWZV/R0MTIqns=
X-Gm-Gg: AR+sD1326T41EYWvzz7DBC64sQf3EnIJvGZoA7Cj7iy9xAV82PqVHyV/eXs1dW39grF
	bawneNuFXuTRZIo0WY0tb/F/QdAOlsrgxV00fuRP/X6v7tt3AjhM5IJzL5RAPa+AtVYrTfwQpZ+
	MbkDKrX8QibwPkC8cus4NYG8jWq78QLAOpOw5xAtcT3+/jK7SjHIGl9do1rkB4I88r7J2D/c2OX
	73Y0xDr9VcrqIYk0VZHms1asfCp+bdXnrFjfrx3Xu8bE9aQzzOa27/ovuu/bJpY9YGfVWZf3mDe
	ygPRexdk2Ow+Q9oZVOhBbny7fy8FMCVW14v3qo3SDoljIQemV8abpVZd7BckVqA03Ho4YNDKAHT
	PrZztCwvE0RdRCO4Y98RnvhIcKJ0IoUEBE0qMT1cwCjqWK1JqfnEOpbmMIWpR7WRWm7mx/771DI
	rmycp/Gm4aGQpfSndDW5Y33/ypyeU0AMVX96PJx8XlcwLdOPQz0Ux6QvodVFDNRiWf
X-Received: by 2002:a05:622a:c8c:b0:52f:a319:da85 with SMTP id d75a77b69052e-52fb96af1b0mr463638811cf.39.1788283266590;
        Tue, 01 Sep 2026 10:21:06 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530331d9cbcsm1423661cf.16.2026.09.01.10.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 10:21:06 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] arm64: dts: qcom: monaco-evk-ifp-mezzanine: use dev for device nodes
Date: Tue,  1 Sep 2026 12:20:56 -0500
Message-ID: <20260901172058.1512508-5-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901172058.1512508-1-elder@riscstar.com>
References: <20260901172058.1512508-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A recent change caused the embedded PCIe endpoints on TC9564 SoCs to
be treated by the devicetree code as PCI buses, which is incorrect.

The Monaco EVK IFP mezzanine has a TC9564 SoC, which includes a
PCIe switch with one upstream port and two downstream (external)
ports, plus a third downstream port.  The third port has an embedded
PCIe endpoint with two functions, each providing access to a 10 Gbps
capable Ethernet interface.

The devicetree nodes representing these functions were previously
named "pci@" but were renamed in the interest of consistency in
commit e806c63ba51a7 ("arm64: dts: qcom: Rename pci@ nodes to pcie@").

Unfortunately, of_node_is_pcie() causes nodes named "pcie@" to be
treated as PCI bridges, which PCI endpoints are not.  The previous
name "pci" matched such nodes as "default-flags" bus type, defined
in the of_busses[] array.

Rename the PCIe endpoint nodes "pci@" so they are not mistaken for
bridge nodes by the devicetree parsing code.  This restores the
previous behavior, and allows them to be used for PCI endpoint bus.

Fixes: e806c63ba51a7 ("arm64: dts: qcom: Rename pci@ nodes to pcie@")
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso
index ca5bf0fe5ec6e..a6e57ec8a1e14 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso
@@ -117,7 +117,7 @@ pcie@3,0 {
 			ranges;
 			bus-range = <0x5 0xff>;
 
-			pcie@0,0 {
+			pci@0,0 {
 				reg = <0x50000 0x0 0x0 0x0 0x0>;
 				#address-cells = <3>;
 				#size-cells = <2>;
@@ -125,7 +125,7 @@ pcie@0,0 {
 				ranges;
 			};
 
-			pcie@0,1 {
+			pci@0,1 {
 				reg = <0x50100 0x0 0x0 0x0 0x0>;
 				#address-cells = <3>;
 				#size-cells = <2>;
-- 
2.53.0

