Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9958A486E62
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 23:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790637583; cv=none; b=peGZgIPPezZPAFzhaIO4wEP6HQw2KOEDZZYnguzym/wkz0RxTygc9mUB2/ucuTVrTYhz+ey++iiqUFExhnPf7TFQE5YZBWgb5y7OvkjNbRLtrM1C3CPRmsNoMsPkp1T/INeFmhRjqt/ERfE0eAIO0qdwd3HkMFI0wUelRCz89K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790637583; c=relaxed/simple;
	bh=8zeoktIy+usUIFH1w4ionuLiRCFm3l7V7ss5bkINDA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ryJhQ6wiWiLg1ol1UT4W6op2OJHUJJ/sWGObg0BUQnLmELWLh0v7wBdZRajANYRTEelbukykjD/o1a1DGbgS/2Ggm6HoeXqmIKxulyFXxuXzFrJKdutct7XAArLoCE7QGQwTde4NG14MGgUsN6EvNUyYJQOB5GXUYFUSDPbVyRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Id/35M19; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=nyBuVHg0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Id/35M19";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="nyBuVHg0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790637580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3yDoqQ26YFmJbrXP16xbG9Lltps7LHScJ0yfk3VKi1o=;
	b=Id/35M19A7Xo3A8izIWvQZdqZwveKDHQtpku1fTlBzHqVBucbbKapirGdA/P6o1/QRDUHm
	9KrViM0l+N6/X94RyCRSw3zz27uXHVUN4e7zgKmp2YH91IcmSc04HCzMK1aOiTTeE6cqGv
	R4xTmBA4hEfdkK8kVb+GJ29TQwNENnY=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-Pwy8GAQ7MjW99vVnRo4DYQ-1; Mon, 28 Sep 2026 19:19:37 -0400
X-MC-Unique: Pwy8GAQ7MjW99vVnRo4DYQ-1
X-Mimecast-MFC-AGG-ID: Pwy8GAQ7MjW99vVnRo4DYQ_1790637577
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8a864bffd01so50303057b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790637577; x=1791242377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3yDoqQ26YFmJbrXP16xbG9Lltps7LHScJ0yfk3VKi1o=;
        b=nyBuVHg0sACxnIPNEtg1NUQtISMplQVqp7Db7r/qmPejKzNsumIk46FdW9P6bbrAFj
         4FXRiRb6R9SfJhrrJxlIoGgZ1LonJUeFesGqMnNRVSpVSs2hKRiSJ0Qn6Th1ly1OzZaF
         mxnxZ+YStbtlV6fK5Qc1qfadWYsgpEILDxCZfDeTl/NN4zoOwmztZPYljqW2UouvMTT7
         FMPZ6Cz96CckSsylh6CTfZ9mJbUmlcfkFt/IC0TA99csuX6ASehJzAedrAzHa4HLKoFQ
         GRpAxtyRxYwZCE0Ybt72/JflHpNvboWmmtV91H4yl/IYjZpn1BkLGhX/pUuVnlKvChQ5
         P/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790637577; x=1791242377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3yDoqQ26YFmJbrXP16xbG9Lltps7LHScJ0yfk3VKi1o=;
        b=n+RroXm0Xe9Ch3HHuAqhIxS1LC7Mjcs0awQ9NmoeNZfOe472rsb2sBTA3I8d9JDL2d
         B2lZuVOIEfAHstwWikuYnJH1bzOxkBgqrj/1X32vMmH7ZcL7sRwmCq2xcwZZam10p+Il
         4D4FNzUW4oKe6i7gLdL18rWLO5Tagyj3BWPyFeWWYQD1/ZVmHuLQBUkaPXzf2qTql1A7
         MDvLoavATdeaRIXsvx5E076W8B5X/LYI/kCf5SPXGSXtJYVQKcArAbmtvIKzJU8Mo6yV
         IDZoyXzXZrVnl3uk4tdNypBtdPbvNgYbFMWV1u6YQaSmyLg2JvUYy5KZSzsV3mNKBM87
         H/Sw==
X-Forwarded-Encrypted: i=1; AKwUvBxevA8H0wfniinpdDvohzSqhEM3c4CtVHjg5UeQi1JVKjFB/c0xslJunAvrXa6R5U93K82ukiGTY2gxyoI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKBZB9UUbRF3yudIec/ZSzwz1kWetyzgReJNJu/EpQe8vO+/g2p
	Exz4jX6SEDIvXHrZffGAulq33t+ftZHCRFpThNVlvdMT7Kf3VMolRwyjDyp3TuBFROkBk+dONNE
	xnFFFoEu/XQuCoROW0Fx1CgilNK+bepACOH9AAjq4e68CFbZ3SQ4Qjm9Ho2qX96wrFQ==
X-Gm-Gg: AYBFou3BT9LYPLb8bjN0D884X/cZnyKRrZbqQRAjylbJCwHfYgMrGH7YzrMCtQpQnu+
	EI56NV78HRs4SctvznUQzY2NGrRv77S5KKgyZqR2YoG2Cj65OQm6t1UwWiIQEkTGoz246EqPY6W
	SCEOaQtr/DtKh13lvz59jLhqIn57FNsSdQVw051MMLdiIXWXKJjbqkt99SC551bGgZFudQHSCpP
	omx1aUkKTUIftuWv9ZFqwb89pkjjgdT/7LIzNm5xH+R6ktI5+YqOL5tcV97KESA8q1uTYow3wQc
	9RRElDdUen2eQUreOkLzngnooETUY9+Wx1xVQUuuWTm/gPJnrwCWJA==
X-Received: by 2002:a05:690c:60c5:b0:873:5c6b:a304 with SMTP id 00721157ae682-8a86d7e29bdmr40056087b3.50.1790637576922;
        Mon, 28 Sep 2026 16:19:36 -0700 (PDT)
X-Received: by 2002:a05:690c:60c5:b0:873:5c6b:a304 with SMTP id 00721157ae682-8a86d7e29bdmr40055957b3.50.1790637576516;
        Mon, 28 Sep 2026 16:19:36 -0700 (PDT)
Received: from rhdev ([2600:1700:f361:20bf::14c1])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a860f9cdb0sm51374117b3.24.2026.09.28.16.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 16:19:36 -0700 (PDT)
From: Jennifer Berringer <jberring@redhat.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	James Morris <jmorris@namei.org>,
	Jennifer Berringer <jberring@redhat.com>
Subject: [PATCH 2/4] riscv: dts: spacemit: k3-com260-ifx: Add USB nodes
Date: Mon, 28 Sep 2026 19:18:05 -0400
Message-ID: <20260928231807.1757995-3-jberring@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928231807.1757995-1-jberring@redhat.com>
References: <20260928231807.1757995-1-jberring@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

K3 CoM260 IFX uses usb3b for a VL817 hub providing 4x USB 3.0 ports and
usb2_host for Bluetooth through the M.2 E-Key slot.

Signed-off-by: Jennifer Berringer <jberring@redhat.com>
---
 .../riscv/boot/dts/spacemit/k3-com260-ifx.dts | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
index a5c08a7a781a9..a4dfa25c837fe 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
@@ -3,6 +3,7 @@
  * Copyright (c) 2026 SpacemiT (Hangzhou) Technology Co. Ltd
  * Copyright (c) 2026 Yixun Lan <dlan@kernel.org>
  */
+#include <dt-bindings/phy/phy.h>
 
 #include "k3-com260.dtsi"
 
@@ -18,6 +19,31 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	reg_hub_5v: regulator-usb3-hub-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "USB30_HUB";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		regulator-always-on;
+		vin-supply = <&reg_5v_sys>;
+	};
+
+	reg_vbus_5v: regulator-usb3-vbus-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "USB30_VBUS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&reg_5v_sys>;
+		gpio = <&gpio K3_GPIO(67) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
+
+&combophy {
+	spacemit,apmu = <&syscon_apmu 0x14>;
+	status = "okay";
 };
 
 &i2c1 {
@@ -35,6 +61,43 @@ eeprom@50 {
 	};
 };
 
+&usb2_host {
+	status = "okay";
+};
+
+&usb2_phy {
+	status = "okay";
+};
+
+&usb3b {
+	phys = <&usb3b_u2phy>, <&combophy 2 PHY_TYPE_USB3>;
+	phy-names = "usb2-phy", "usb3-phy";
+	status = "okay";
+	vbus-supply = <&reg_vbus_5v>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	hub_2_0: hub@1 {
+		compatible = "usb2109,2817";
+		reg = <1>;
+		vdd-supply = <&reg_hub_5v>;
+		peer-hub = <&hub_3_0>;
+		reset-gpios = <&gpio K3_GPIO(53) GPIO_ACTIVE_LOW>;
+	};
+
+	hub_3_0: hub@2 {
+		compatible = "usb2109,817";
+		reg = <2>;
+		vdd-supply = <&reg_hub_5v>;
+		peer-hub = <&hub_2_0>;
+		reset-gpios = <&gpio K3_GPIO(53) GPIO_ACTIVE_LOW>;
+	};
+};
+
+&usb3b_u2phy {
+	status = "okay";
+};
+
 &sdhci0 {
 	pinctrl-names = "default","uhs";
 	pinctrl-0 = <&mmc1_cfg>;
-- 
2.55.0

