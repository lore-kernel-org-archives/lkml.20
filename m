Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794819564;
	b=RKwA3cJwK0ZsNl3A7t7Xz7B0nt7I6RMuSjQ5IYeL+OlRDWm2voM7oCJCdm+e3UQ39qtT
	 D8RZDPSJHOTakqK3NAlpeWmNMURLeB+NwmCjb00Dm+pjgaXHGbHbBWeLPOQaLwoxi5fF+
	 Z2vK2uBCNLwKaNLA1ANaTMH04XQcBtBWTXd+1LBHeJmnvCgRKh8AQKLvqEtvLjHUNiUZU
	 Je3MhZcMNf2ELc6WQQ67dn071VclWoReOSy05BfE1q6hJQxISYHqsTW6FHjdCKhH1Q11Z
	 dJG0IQr0Zh/C6v33auyyRiK6jp6BA3wQwFTab2MJAGF6L52hgv4l67WBTbHCj/neI5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819564;
	h=DMARC-Filter:DKIM-Signature:Date:X-Lms-Return-Path:In-Reply-To:
	 Content-Transfer-Encoding:Message-Id:Received:X-Mailer:Content-Type:
	 To:From:X-Original-From:References:Cc:Subject:Mime-Version;
	bh=p4DpLO4bTnuVUXS4e/jXglOT3Dz6s8obdebqkuUomVs=;
	b=jAxdpED54iYcN/lBc0LsfUF3iyrcQ/rVVKUXPe1kx9q/jdoaxCNiVvewsRcMBuc9wn6+
	 32KPiU9++HYACCYALaCerkzKbrW4kuaKPAOOmpZDTaOxAyMPUk6tdesgnrgiVj3O5CBpk
	 ZaIGKsqxQ5Vyjt7c1lv4VDPNclfglhQInd+2WWmtvzo/RKmdWmtoD+zI5cWwJTJVDQYBp
	 WUGRWo7wXQsedh/yzpEN0EBxS3C4W4Wg+1T4CTtxtKz1R9Y56nDBfksUgG3dyHevY5gdy
	 9u73TqBluO9uJnySi5eD88WuwBdK19LunKziIPVZS1nk4tYw/jWH6dM4rMWq4+BHyxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=rFAVqFjH;
	arc=none smtp.remote-ip=209.127.231.35
Received: from va-2-35.ptr.blmpb.com (va-2-35.ptr.blmpb.com [209.127.231.35])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F997606A881
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:59:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F997606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=rFAVqFjH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794819558;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=p4DpLO4bTnuVUXS4e/jXglOT3Dz6s8obdebqkuUomVs=;
 b=rFAVqFjH+7l58QG4x0f4bERb85yghQzn75dTcd1eLvmuGc1z45eXB6TOqb9UzNLYQIREGW
 u1rIAbNkpNDZlm4wqRMk2/K/YW8CDD/FfM3TiOfupd9PkfeaS2d3DcmxJygZegQ/XfGin3
 pguU4KbLMC118rQaDhx/UdxR+a1quL28KHfq8Q4L6w2rV3Y/U30NgZBZNFsXKmLKN6ytYq
 uZ05CCbVK84H1SD0b1Oy126AUBv2WHa/6OcVakpY0EcffeYtNRBVPq0MkGJdwWQxHXfxip
 Qf0x2R/t1yJ3vWstuZw4jfKglIGY8h3uvLIguyU6AOEsNx2+SQSqSJ4MDxNA3w==
Date: Mon, 16 Nov 2026 16:59:06 +0800
X-Lms-Return-Path: <lba+26afac5e4+182f27+vger.kernel.org+sandie.cao@deepcomputing.io>
In-Reply-To: <20261116085725.951253-1-sandie.cao@deepcomputing.io>
Content-Transfer-Encoding: 7bit
Message-Id: <20261116085906.951287-1-sandie.cao@deepcomputing.io>
Received: from roma-Laptop-12th-Gen-Intel-Core.lan ([183.23.101.74]) by smtp.feishu.cn with ESMTPS; Mon, 16 Nov 2026 16:59:15 +0800
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
References: <20261116085725.951253-1-sandie.cao@deepcomputing.io>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
Subject: [PATCH 2/5] riscv: dts: spacemit: k3-deepcomputing-fml13v05: add rfkill node for WLAN
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0

Expose the WLAN enable signal of the FML13V05 as an rfkill-gpio
device so the WLAN driver or userspace can toggle it, following the
K3 Pico-ITX board.

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
index 804a9e64cf6e..f84225cda1e9 100644
--- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
@@ -30,6 +30,13 @@ reg_aux_vcc5v: regulator-aux-vcc5v {
 		regulator-max-microvolt = <5000000>;
 		regulator-always-on;
 	};
+
+	rfkill-pcie-wlan {
+		compatible = "rfkill-gpio";
+		label = "rfkill-pcie-wlan";
+		radio-type = "wlan";
+		shutdown-gpios = <&gpio K3_GPIO(35) GPIO_ACTIVE_HIGH>;
+	};
 };
 
 &i2c8 {
-- 
2.43.0
