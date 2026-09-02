Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DAE04AA1ED
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 21:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788385432; cv=none; b=WrK6mgPJLPUlokghKVrUGtUr/olIm8lcqHfJFuGu/lW1KYVi5joIh824RuIJNzD9FyPiiwL5wZ/hRDLYDQ8f249RvvehW4Zz9I2lJa3YB3mFgyclyXuNyBuvz7qNazSMYViJBpMYlaqVm3HxAiy1hAlFGDB0gDXLPt3c0h5eM+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788385432; c=relaxed/simple;
	bh=eTWwfVHCz35mEZtL09c2ZHDDc37fkZg4MEAHwT7r+1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kP1aC1pgCU+HKgM/DFA5c+oFvZEwn31w5HLv1gTxVsRrJ75Qs6XEOKJhGj6Q8AbJdIHSKqvEdr3QSX64dX/ruwVJE2q5Ny1qDoH63GDs1KNgl1V3KsTRDiwh60QFx4358eIzWpn736UIarjFXqCah2b2OotukDPGnJYLetH6jOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=W7EJGhC5; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="W7EJGhC5"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-530420edf1bso6755011cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 14:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788385408; x=1788990208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IlcQCyWFtoBvuAEwrMQkxRbMNlzUSBJWEQdcfS+nHxY=;
        b=W7EJGhC5hkOlzRG5xbiu026SpL2+rGmw6Hja9QO17vafzcvP/HJSN/LOD6DnGZcfyM
         q6yecN2L4VwQg6k59FZYq6wQkfLS06lLj4/jbnwAtgHjnsvP9TmcdCFo4lC4KxisKNPu
         s5JWOss7r6lwqP10qkkOAg6qdm8uEFpWCEwTbdY+PvO50eqwgMv7521ez6kivO1F0mPq
         QsDaS6uMlOsrQPNPg0tnSFi0+GdHY/3lkBpWCu1Kw0GwK8eZ3rq4Z0II4a2muCNQ8GJp
         LSBdlOmO7S+P3yDpTgwRfMwv9NGm3faphUvUzY4Teb+m8B6HYrjDS8KFfx7uVBk9VaGX
         h1kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788385408; x=1788990208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IlcQCyWFtoBvuAEwrMQkxRbMNlzUSBJWEQdcfS+nHxY=;
        b=kSH7YUylSQ0DDOw/bY48JG9NsgA9VSTHU6ngTzrhlSEra8D1q9YOgFN0K5Sa6F0Dv1
         1aMGPQYODJhPocOfjgx3LmHqlIs4nn1lI42knKdV+KTNt6XQWOmL3/UtRRZ3R/XRmj9l
         shlcp5TXUNtDiO6BqBAznx9ORB1qQOtLc8CO2bQBoauFJxKkicrD5xmz8KEyr31RpkEs
         to9CVBAvN5hVLpUlzdUvLgxd5MKp0zTTHxaT27OyKfHT4PxLTG+DkO92hQLYB9qaTqx1
         grA+sngP/aLUf9NVKjj4c8Dxu8uUgp2swK9k6bkioNgLxu8EkbQF6jYWUy9J8XIUUmWq
         YnAw==
X-Forwarded-Encrypted: i=1; AKwUvBxl64REACG4cG+DmV7lornhw4pEF7dgf88P/q3dyisWidW395xQ6Cx1dgC46zCeX5SJC0Hr2FUQWutifVQ=@vger.kernel.org
X-Gm-Message-State: AFuF++k7HLzlu2kA8fQ4MMRPM+mumWV0fCh9P6mzbsgBRJdytKJJlcZK
	THnwMTcpOLBxlWWb7oH5CEyP0+ruNkyl5I9fVumnuIb7c0ej3DrGu2x2kjD1SPu2xBA=
X-Gm-Gg: AYBFou0rJcdcxRRbNES0bx4sKNHT/ToolIBoU+A5GC2VrXeAWdzBka9rybRKJoaKbmU
	ETFQ6aDk7pOhlJaFC9sKeFaEvGpTHXvg0fn1LXHM/4cuP1X9pmQ6cDKE+1KaiK7snbrSPmRmt0r
	FREGfv2UMBUEX8YQCTn1eqNwaoQAFSr9Ii8XIqVT6HIqhELPCck4qdswWe+Fpw5LOEo7mNCV3Du
	flqq3yp2vCNYECfih50PjrKnSXz+isnGqVFZzNS+WAiTr5iSo8TRSkZlJesd425+id7Y2RHHfWP
	9zwhE77kMnM2xMovIYJZM4oJyEkJ2BwWQb0pcKa5ig8XAH/7x9NTtznYiFLsThcMkPFhsaB0FGz
	XvebYKWechYO6irjtrIKu8FOvENvNUh2F5N0ngL8CFzKj2Qmt5HoP8dWgnwciT9WfkaXmpY9zsi
	TJ+2wJBDCsWo9tGtxK41ssF13ldGz226c2YM3xzTFI+M8Ds1O5o2qpZAVZKFsSZBLO
X-Received: by 2002:ac8:5a96:0:b0:52d:6c92:b5e1 with SMTP id d75a77b69052e-53036cf3749mr89495631cf.27.1788385408032;
        Wed, 02 Sep 2026 14:43:28 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9ee06d30sm28372546d6.6.2026.09.02.14.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 14:43:27 -0700 (PDT)
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
Subject: [PATCH v3 2/6] arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: clean up PCI function nodes
Date: Wed,  2 Sep 2026 16:43:16 -0500
Message-ID: <20260902214321.1721477-3-elder@riscstar.com>
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

The qcs6490-rb3gen2-industrial-mezzanine overlay defines two nodes
representing TC956x chips, each of which contains a PCIe switch and
an embedded endpoint that implements two PCIe functions.

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
Fixes: 4559b435f741b ("arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: Add TC9563 PCIe switch node for PCIe0")
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../qcs6490-rb3gen2-industrial-mezzanine.dtso | 24 ++++---------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
index 46bb52c667a4d..5259f4f4f8574 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
@@ -130,20 +130,12 @@ pcie@3,0 {
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
 
@@ -225,20 +217,12 @@ pcie@3,0 {
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

