Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8811738239E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 21:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788385426; cv=none; b=Ejhv/FQSQ5zasKeHQJBCEDgIrC55pejcDp/u1CqhiDYikNPZLPkg5pb7A5oyDRRM6GXr+vZIzD40IkOWsDJ6rGrm2ca2jTl5I/V7YeUbPt90I7H+H7FR2fRu1aMt81BIPNTXaZ4QjuVtWXg8aVZsoXtbDxwSIRo3S1RdZzeAZy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788385426; c=relaxed/simple;
	bh=eQ9Zy7fiFKEeKMtOVVIUKWgvDli3RddZi/DwsQZnRus=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hGBKvZO0nZAw3kUUZ6uzlry2tXEcWZcpFF4ClqS9DFWwKvwHijQzXbG5dsBGU5TAe28T5SgiQbKq964fpTNM0o31XOCNdHvivMimIaOuK5BNDWLjYByt+vLwjC5xaRY3JaS3a3UqOr+ms7F+DR/QarcwZbVS7JorwDySUWnWC8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=iXBGzGer; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="iXBGzGer"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-92edb12cdf2so145441685a.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 14:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788385409; x=1788990209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fsxIaRRLmwpMLtJ5PsOHVJNZ9n/FmHMUVyfE5LlxUlI=;
        b=iXBGzGerdG2gEmQLlDs3xa3Zl87igUJsrWz1aoDPsUA1xFmOyQdkQfcsfKQnN/OeJZ
         v1CUEfQI6uNt6VlNK/2wRHVCxWHxk2U+IdjioebMzWH9TQ+AZZesA4d4YBeI70ynMdpA
         qtAR+cH3UOhS0N7kTESH7zVWQb/rh71N7+vAFWCDMYZJIvvlBIJMTwVSLF7ZWeuDQY/P
         +QPe7IL2gALG4giX5+Ak0zgV9bHbqIic39kUP75Xq8PX1PqCEUEaS8zFivD32QXMJXr5
         aWVxngMN7QG2v57oSBtdMgtn3TJ9RkOSVeuXrklTQcShX0AmCLIsb0y2Zr2DDKfTKU4Z
         06mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788385409; x=1788990209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fsxIaRRLmwpMLtJ5PsOHVJNZ9n/FmHMUVyfE5LlxUlI=;
        b=n3uyEutqbkDk6Dvk1Bf1+bddb5eAT5y2ognv8Ny6nA+bdcmPsWz0c1kqhYccGK1Vcw
         J2SuZkxw3tQAevYpgCva1zJ3ujuTkEE4zFgq4J5ac0L9sh7KBcdo1XmktnTDDXAlesxl
         uc4aQ97JqS6iDzBiAoM6SRcmyNr2wFSIfnqtmsc84KhbtIjTOZLOrC2b3Q/t80Vfey13
         /w1t+Ww8b3wXAhgNRTcxwb+F87GBUHEqN4vdMpF5q9nJClwxvQQlxHJ56oY9gITMRNP0
         4029Fg0VzlyPmlHo5lukZrMB/ZQ7MND3iYo8MPF+DeonNARsmZgFLOXYeZdSF49ihrV9
         C5cg==
X-Forwarded-Encrypted: i=1; AKwUvBw1dfVWKxuQczMqvgiTzYGoMwa2THPIv0scX9cClToZ+gd40pwtgyLjF49+7YRr5vtXQM0fcwhuBsih7No=@vger.kernel.org
X-Gm-Message-State: AFuF++leLWnrWVOTLpr7q1o95pBo1YjbG7PBIJQzV004YOTqj+8IbPlP
	oeZPs8d7baBuBGO+n35UHUdzvw3/E9rbI/V1Tdo+Ip14K0HL1PYB6hMLouwb+7FCKmg=
X-Gm-Gg: AYBFou3R/G9B9d5HslNPAqke7KziyiNc0WqmD1FEzN9bMhm7xiWRZ6KnRIquMDNWLRp
	9X8uH7FNYohJ+p3JhbBJFdF3foIdswDveMSEpTeBsg5Pgk1UV5TO57t3Ua+u8e42A2U8fb+YiQn
	kH+ibozBfyRJomZUf63vTZvrb+iQqEp3k3AnR2f2Qu5aGCLIejBS4QvNxlPnFDu3+vvCu5xEv9B
	wEqWCpOok78VAB7DoThmjI9zfmBqLLYLiLD+fZh4RADvJUdWizJDH2HyFJoqBylLvmX/nfvcWFz
	cuEKruGLf329boaxHFh81aizfZAd63XHAZZVHr6GvxAGzn4litICaRXKPURGHXeldp+8dUdGSxv
	RW39FMn8ab+cTyDhHZdvGtc/POkAXbknoMw3YCvhPRy2Km5BVK1b2cG/mF+4rTk67qf35XQcU2j
	LXtPuUOCs5Dx3zphykAtJ3Z77EIs3DXu8uVFZeaYTa84rOSLbZGkn9aMRykdQcxWMe
X-Received: by 2002:a05:620a:bc8:b0:939:6b87:9a62 with SMTP id af79cd13be357-9396b879de0mr590218185a.38.1788385409497;
        Wed, 02 Sep 2026 14:43:29 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9ee06d30sm28372546d6.6.2026.09.02.14.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 14:43:29 -0700 (PDT)
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
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v3 3/6] arm64: dts: qcom: lemans-evk-ifp-mezzanine: clean up PCI function nodes
Date: Wed,  2 Sep 2026 16:43:17 -0500
Message-ID: <20260902214321.1721477-4-elder@riscstar.com>
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

The lemans-evk-ifp-mezzanine overlay defines a node representing a
TC956x chip which contains a PCIe switch and an embedded endpoint
that implements two PCIe functions.

The devicetree nodes erroneously include a "pci" device_type property
for the two PCIe functions.  That property should only be used for a
PCI device "that implements a PCI bus".  Remove this property for the
two function nodes.

In addition, only PCI bridge nodes should be named "pcie@" (or "pci@").
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

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Fixes: b64abb26a2916 ("arm64: dts: qcom: lemans-evk: Add IFP Mezzanine")
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso      | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso b/arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso
index 6cfa0bc1440e9..e42314c648579 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso
@@ -271,20 +271,12 @@ pcie@3,0 {
 			ranges;
 			bus-range = <0x5 0xff>;
 
-			pcie@0,0 {
+			dev@0,0 {
 				reg = <0x50000 0x0 0x0 0x0 0x0>;
-				#address-cells = <3>;
-				#size-cells = <2>;
-				device_type = "pci";
-				ranges;
 			};
 
-			pcie@0,1 {
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

