Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794819614;
	b=qx9LIMFk49hZI4JJI5PArpV0GFq39Y2OZrgHyHoq3q8lWdy7CxLZCpuJdt7aGS8EG9Gn
	 ji9u7JfYi9fLJCXY9ZCHLR/n8O+ESmdEM+PQBt6PGzkhGRCQIj2jQJkmRjiS2meYvwdHF
	 olOOmK31IkLn+YrakWuKFtsyTMt6JBsEhSQLSlvolsb/F+TR6HB6kfyEIGgladZWSXZa1
	 U6HBLV1VHWKIZMQjkajbpawQqDBvxBdu7DtXyh5fa15uf3KcM2h1l/USaoWektlU9DnW4
	 3UY0hS2YRSog++/ozpcWiixwTZ9Xm+5J0dCbOhgeR6IVuD7R2t5VDQzBUBRJB6+NE8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819614;
	h=DMARC-Filter:DKIM-Signature:From:Message-Id:X-Original-From:Received:
	 Cc:Mime-Version:References:Content-Type:To:Date:In-Reply-To:X-Mailer:
	 X-Lms-Return-Path:Content-Transfer-Encoding:Subject;
	bh=70z/WI0McbinqpG+yd/C6iK+RigsJ/gp7vM2rkwjXR8=;
	b=Y0nAOzjjZefs+QSGc8wgoCihku+GPspQ0MW9fDbYMQaWOBTy6Ro/uRgVU0jruelgvaF9
	 +LBn1bObWha5H5zfG2RuWf3MgMvZGtl+1WAPmTLnsrYT+UAm0rpLt8s3qshl2SFj7a+Tt
	 bRZ3zPCph1w0mctath7wbAFPbU3V1idrJgwCuVXxzWHjVBokXOWqM8SNpd6rQDa/7HypD
	 q6uICORNmIncVF2xEzGf3z4vZlLqpL1+zLb8zb02y31okk6yOButSt3n5nAgTyuLbfF0F
	 lz6Qmsvh/1AJHkchKi+iviXYRwW5qd3/hD0Ofp5CFcDQ289Hwzid9Oan16YZwWU61Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=FSqZ+UAd;
	arc=none smtp.remote-ip=209.127.231.28
Received: from va-2-28.ptr.blmpb.com (va-2-28.ptr.blmpb.com [209.127.231.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8D7606A337
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:00:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB8D7606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=FSqZ+UAd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794819602;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=70z/WI0McbinqpG+yd/C6iK+RigsJ/gp7vM2rkwjXR8=;
 b=FSqZ+UAdMtrYBd8YAom/an2rtDRtOjJyQ1rLAW2iRUOX0mWbEeYYkIMHoIBEleSCOgbHqD
 EdGjlaEI4BKXxvBigTnHnLNkcC9iMvkg2gxBwpnY99Pj6C3+NM1A+huRp2gPnH3qQSxoFc
 awLnLvsK0erLl4v2Bvhp8ubctAzwwh5spGw54ZaE6tBaFe0bYYDGF5Iq/QWhQ1gXD+XzEr
 XixWqlNDO9zNvCEMsAjZ/UqHhWWGbqj3fIMIsT5igYrKBECBCbsx3OVFK3J+Zb6pTVtMF3
 /gwnGWmScBt35zyMJMdNnuGmxetYJQe9ljiLX0lFMrrJ7+dtBbDXhefEGA956Q==
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Message-Id: <20261116085952.951331-1-sandie.cao@deepcomputing.io>
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
Received: from roma-Laptop-12th-Gen-Intel-Core.lan ([183.23.101.74]) by smtp.feishu.cn with ESMTPS; Mon, 16 Nov 2026 16:59:58 +0800
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261116085725.951253-1-sandie.cao@deepcomputing.io>
Content-Type: text/plain; charset=UTF-8
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
Date: Mon, 16 Nov 2026 16:59:52 +0800
In-Reply-To: <20261116085725.951253-1-sandie.cao@deepcomputing.io>
X-Mailer: git-send-email 2.43.0
X-Lms-Return-Path: <lba+26afac610+cc6d9c+vger.kernel.org+sandie.cao@deepcomputing.io>
Content-Transfer-Encoding: 7bit
Subject: [PATCH 4/5] riscv: dts: spacemit: k3-deepcomputing-fml13v05: add WLAN power regulator

The WLAN module on the FML13V05 is powered from a 3.3V rail gated by
GPIO41 (WLAN_PWREN). Model the rail as a fixed regulator.

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 .../boot/dts/spacemit/k3-deepcomputing-fml13v05.dts   | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
index 8c12fd01227b..2e1ad0929ee5 100644
--- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
@@ -31,6 +31,17 @@ reg_aux_vcc5v: regulator-aux-vcc5v {
 		regulator-always-on;
 	};
 
+	reg_wlan_3v3: regulator-wlan-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "WLAN_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio K3_GPIO(41) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 	rfkill-pcie-wlan {
 		compatible = "rfkill-gpio";
 		label = "rfkill-pcie-wlan";
-- 
2.43.0
