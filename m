Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE43747F3A4
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790671101; cv=none; b=U+/0V1TFVrXgtxByzOqFQOhAl/JIG0zWWjhzIlJccdtWEcr2TJY2mUM9//1AfemQqvXVTqk4EelmAKkHkowze7XpwQhr0yeB+cSn46azRaKGRN9vasyfdiy6FseH7TB0AmwPbqpBpkhYO2Z9idVLbieKxuFqWt/aj781QiKVtGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790671101; c=relaxed/simple;
	bh=L3fsKyGi5rpLNg8G/ROz7kxtpDKTfFUi8q+A7hQ20Dk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kn1bF4S+LcvJQpD4oPi8WTjQzD9YG74MvwA1UrComopevM4NxtraAjfGmvhTf/yAodd2ZtZLgbis6niQp9jHsSip8ptKG45U/jLAmfuXx/5qK+Lf+3m1jBJDerb7sHBhJ7TJ/uPivaxqEt3qwWPlQoLXyUCM0x5j+kngAw1I9Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DfLf0uyW; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DfLf0uyW"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccd4f99dso2535029a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 01:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790671098; x=1791275898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7AEeGlWy9uXP/q/PPr93GfqgOECgNHQd0LWMUmr1tVw=;
        b=DfLf0uyWUU5DYCLeqZXxmnCbBMN8XZfYhdj2XXgoLkQpaN4Rfk/3a8q/ujgZcpohtu
         PFEUCIM0fb3bkSUmB7AhBX1GjpbPPElQvTEK5bL8nT/0wAXVTHgu+aWYZkwF/YPPCIoY
         DP0k4STUBwTea3C1e1p/DYVWIAAjK11tjo61MmjGfoY39Rc56RdwpcapGVoqnDKuCjbn
         +iSTkSTpAC4M+e3FLDeDpX2ufWNpoXo2N0IhlDD/KlAYxGOVdD+nOppzOdaQyKKJ6k4K
         CKE3ql6ZRw4OTkSGnr50g9T7UH1DNEgm3IWtQg0Hmtu+I0emaNgHoC+4P2CptcMWdxbM
         HcAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790671098; x=1791275898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7AEeGlWy9uXP/q/PPr93GfqgOECgNHQd0LWMUmr1tVw=;
        b=Wyoic4NaU0FqGS5160tIoWBWvK44DidshZygZNO5+WnZ1G3rPNLPYr+g1ETo0ds/rb
         P6sho5HmJ1sm9nnQxReJDicdwkFGHDILyBaqWZQnIQO7qzpCe3c6A5nZX7oxIb2GzgoG
         hy4fxG5f6402rgU9R1DcVjRHfsCOgqtZicwraPDWAtdmYr7deOw6NEX4iq3j8akhEZCF
         5vKxZO8HHJJ7GIfRXBp3PEFxP2VgFendsZxwwue0Mk+7fSzSC7CcTjR/b5s0g/qYNOeC
         YRghl+ORLxH2vZGaFzVRIxsDkZ5fP8MUUxyubaGBcMIWU6OBll2xipLvdSrWhMcoVfuB
         584A==
X-Forwarded-Encrypted: i=1; AKwUvBxIoCJmxW4cIew1QWPbToiZLwfhILsMlovLGYzifbX+wlxZdyIPb0257YjQmfBx1zMPKtQpj7FcIMLCOQA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMwQ0enRGAyofvpK7E5VQsYaThUeBYTKLKAmr0qowJ/U9GHTBe
	bVB2sqzl4nDFHIKn4qoES8go1ZQqNA+uwdtPrn9rTjJEvBCoAT7ew0dM
X-Gm-Gg: AYBFou0dHEppl+4DuOHVWmTKgCxIX0g7RFx1mibnYsSkQ6RGkUJStaEFYPRRYUKVyc4
	jZ8EbGfu/81wgtEKnCOgd+mE6QJJ9Y8kchsJ8OQE+YgpbDZK9U4fJkym+F+nQRukKNmpmf2eS6o
	UBRpDfj0uwW7SbDr12RdhBSMHre/eigQJXeu1elCApw16YWFwJq9JCpxX+DIRR5eLwzEuw/Qqs3
	hzFkhPR7OQ3THLiTHuWQqDk5BRLzmZYy6b4Kt689ImBsUHdHiMFjnDehFvS9zVaD7IhWZofCQA4
	vOqJ6u72ZBNlvbYOQNTIbX3+rd6jUnrAz9vYB+B5WO4YphzwGarvIWQTWiQNCs72m3979dirmbX
	27swqA7waVPTT/lPlWDBHH5aCkh1+23fJUgUarnWHMfSPzO60+Wu9+IHPnmAWj5XS+dFCVeJPIB
	GeAI4Ux7N3JHjxInsI8q6iDQH9Hz9MEXYOP0UOFRiv1e/dB17ctaCGqxwHnd1EISEBuLSp
X-Received: by 2002:a17:90b:2251:b0:3a0:9640:8031 with SMTP id 98e67ed59e1d1-3a098d4364cmr12391254a91.8.1790671098293;
        Tue, 29 Sep 2026 01:38:18 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7a3b8d70csm3751988a12.9.2026.09.29.01.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 01:38:17 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Niklas Cassel <cassel@kernel.org>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Randolph Lin <randolph@andestech.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Alex Elder <elder@riscstar.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v7 4/6] dt-bindings: PCI: snps,dw-pcie: Add msi-parent for MSI handle check
Date: Tue, 29 Sep 2026 16:37:50 +0800
Message-ID: <20260929083755.458238-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929083755.458238-1-inochiama@gmail.com>
References: <20260929083755.458238-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IMSIC device on RISC-V based system does not require ID
remapping for MSI. So this device only needs "msi-parent"
property for IMSIC-based SoC, and the "msi-map" is not a
necessary property.

Add new condition for MSI handling on IMSIC based SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml b/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
index b3216141881c..91bbbc8924f6 100644
--- a/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
@@ -27,8 +27,11 @@ allOf:
   - $ref: /schemas/pci/snps,dw-pcie-common.yaml#
   - if:
       not:
-        required:
-          - msi-map
+        anyOf:
+          - required:
+              - msi-map
+          - required:
+              - msi-parent
     then:
       properties:
         interrupt-names:
-- 
2.55.0

