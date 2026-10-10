Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2529381B0E
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 02:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791597930; cv=none; b=tj6vr5tU+Yt9zK0nz9Z5cOWpPUvf0j8Z8/9Fp++JHTxC/jddiFop5QSP4EOpEK5lw5fZwTzfQ4OpkIKpRohcE8zShSLGOEYgr2sNlfuOF/a2IF0KgCsFs746Omw9XNPvYAqiptt8xOKLD0gRHkH1Yyz10HhfYFr0zPaxeDuP9EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791597930; c=relaxed/simple;
	bh=RtNJ+XWJK6eSr1fba8eizstY+FWi1d6ftiywfKe/zuM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Gt7UGxsV+Q78/lMJfJq2S3SEHuVWdOFjfeCT//4gFkmAdji1LHIroMoyIoFkx70kWlKvul+vncx03Kb1VnqlItoYeWMzxstRG6z0lspf+x9QFY8d9klSECtsnC4Ip3bWWEPEtfdj+LsbLLma/f7ivZTYpXHEUxULBg0H6vMGTN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IWUJIIxw; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=GlP00Rhx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IWUJIIxw";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="GlP00Rhx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791597927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=w+tGYwl2znmnp8WIdQYcLZIZyvGyAsTyeavLHMYpyQU=;
	b=IWUJIIxwdvJhwykkBFt1HgqrVHKdnFewyV1m+pZs5OVztoX+hT/ziO/0VOaXAeeACW2ROQ
	4brxRI4VI2y7+IRz+b4l6TWT2ebdKDC95Q1nr3xkZz6gN3ouR2KbIiUxTWMjUgqQM7oKYW
	ftxVUTmNxCBcQ/MVjLxfgTFDEGHl07k=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-67-Wuf1n77HP-mnpvVtnv18Og-1; Sat, 10 Oct 2026 02:05:20 +0000
X-MC-Unique: Wuf1n77HP-mnpvVtnv18Og-1
X-Mimecast-MFC-AGG-ID: Wuf1n77HP-mnpvVtnv18Og_1791597920
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8ae99a44bdbso2902107b3.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 19:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791597920; x=1792202720; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w+tGYwl2znmnp8WIdQYcLZIZyvGyAsTyeavLHMYpyQU=;
        b=GlP00Rhx8xPUb8ZHOxxfO0ysVhk8FSK6yqso//2FS9EoMnRl6ZbxlRNMWJn92OuCdv
         BvqOfquCWLSLGgKTKa/CnE/m/y2f9Av2d9iij9Ak6KXl9HFZC+HDKrlBRoQCiPMWVn7D
         hRZsm3GjhoEGL0rQm/GI9AHpXcWy9KyKx1MmlzAM6QrQ4aeodbuA2uU3QR1a+iptz7nn
         g7OJOj+v+otCVxBRJ/BJ0vNCdK8dKNPN7TRHi2vQMb0RbdaaVH4b/G49S91AgzqPoQ/I
         oYDw3RWLJd9d/zczUYLHfOJrI1oT+aHgaFzr8KhxNvOL47GPOe1wQzpPGxTS7ukm8PYa
         pUMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791597920; x=1792202720;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w+tGYwl2znmnp8WIdQYcLZIZyvGyAsTyeavLHMYpyQU=;
        b=RZaLDIPmhhav9YjZg8cId6TTVrcUqavfzWMSVXP6dVVKCAK3WznJzvQ9MxrkgFa4ZR
         DRkOissrFPwJPwah9eylmQGyCJuhP7mtK4/qWUMLHEsu82s96T020o/UsCnFDzoZy5OU
         q/ZOB+5SQJxSXZ+OyiWYUDysXDQzCE9nXIvbNijHKvRHaWmsR6Ci0tsScFDCEhQdO1zi
         ndaUsapTLKZ6W+ljQrTsaqIdl6fu30UWj8AMzs8t2quvyyq3xmFOZ1ZSUN492mp7uxCm
         AfeYxtAKrT7NttowXQ8sQIKh7qmMHa9dyCduMKjYDGyjmd13L4wDApb+J1kHHvHRC48D
         wg/Q==
X-Forwarded-Encrypted: i=1; AKwUvBw7xWlfwkP7UmPCh+kqUWVTE8lv3OHmjy+i+j0h2PbWOR/PNSqimVmIdUNnfn8D69iDfIO3E+59GzLXPHg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIP6mNhS+GCeTQW2hI3Kzv/aehLOiRp5WoH2YjiD0gBs3H/MB2Q
	x9zr/m/515jgk1hU3+zoFiQqF6w7mVHBN1r9jlmqBDLEbia9YTfM2hg8eZ4j+EjgWNtnlZDb1Sa
	pNm5rjvr5TWFkf258yLO5s8yses7WgOOQJJOQk0XgsfoX7F742V+ExXC/HGyLVdKnPw==
X-Gm-Gg: AYBFou15nSNQBxjgKnkidLxoGxCGgKMh4DW6wk+KTmLJir7J3WeNhVCtYQttOmS52ey
	9d4tTM40JrNE79HAB+TQrtBKq3fGlfuu6BuLpHF9CgN1A+tenU0hR7OPamz5stQ1fswhYtgI1Gt
	289alEfrke5cIK6p5vC3inrYH3CZkun8asujCRTWzOZKKDWOHSn5b5i0uCjeFHFIBY1o3juH9y5
	OTCl3Ns+kyADxb11FWf3G3aapCG4iq0EhjPbFM9AdxweP4itSkJVs3Ajndxiht/7OeW+9g3tZox
	1SLQ4vqMKgPvSwfttEQN2Le2ylsoJPQXUd5Iyz94rCqZiAtTiS95
X-Received: by 2002:a05:690c:4d81:b0:8ae:6740:999 with SMTP id 00721157ae682-8b07ed90a18mr10609297b3.20.1791597919950;
        Fri, 09 Oct 2026 19:05:19 -0700 (PDT)
X-Received: by 2002:a05:690c:4d81:b0:8ae:6740:999 with SMTP id 00721157ae682-8b07ed90a18mr10609237b3.20.1791597919575;
        Fri, 09 Oct 2026 19:05:19 -0700 (PDT)
Received: from rhdev ([2600:1700:f361:20bf::14c1])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b07ee8c257sm14463027b3.3.2026.10.09.19.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 19:05:18 -0700 (PDT)
From: Jennifer Berringer <jberring@redhat.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jennifer Berringer <jberring@redhat.com>
Subject: [PATCH] riscv: dts: spacemit: enable USB2.0 controllers on Milk-V Jupiter
Date: Fri,  9 Oct 2026 22:03:17 -0400
Message-ID: <20261009-jupiter-usb2-v1-1-ab84a00d3b64@redhat.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20261009-jupiter-usb2-b888e544520a
Content-Transfer-Encoding: 8bit

On Milk-V Jupiter boards, usb2_0 is connected to a Type-C connector
which cannot act as a power source. That port can act as USB host if
connected to a self-powered hub.

usb2_1 has vbus output controlled by gpio 127 and is connected to a
FE1.1s hub, which drives four ports: two rear Type-A receptacles and a
9-pin header for two chassis ports.

Signed-off-by: Jennifer Berringer <jberring@redhat.com>
---
This patch depends on
https://lore.kernel.org/spacemit/20261009-b4-spacemit-k1-usb2-v4-0-2d98e5324d9a@linux.spacemit.com/

This conflicts with the Jupiter M1 patch set but can be applied on top
of it if all instances of "k1-milkv-jupiter.dts" in this diff are
replaced with "k1-milkv-jupiter-common.dtsi"
---
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 35 +++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index 635e95aad14a5..913c2170bf6a2 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -82,6 +82,16 @@ reg_vcc_5v: regulator-vcc-5v {
 		vin-supply = <&reg_dc_in>;
 	};
 
+	reg_usb2_vbus: regulator-usb2-vbus-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "USB20_VBUS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&reg_vcc_5v>;
+		gpio = <&gpio K1_GPIO(127) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	regulator-usb3-vbus-5v {
 		compatible = "regulator-fixed";
 		regulator-name = "USB30_VBUS";
@@ -443,10 +453,35 @@ &uart0 {
 	status = "okay";
 };
 
+&usbphy0 {
+	status = "okay";
+};
+
+&usbphy1 {
+	status = "okay";
+};
+
 &usbphy2 {
 	status = "okay";
 };
 
+&usb2_0 {
+	status = "okay";
+};
+
+&usb2_1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	vbus-supply = <&reg_usb2_vbus>;
+	status = "okay";
+
+	hub_2_1: hub@1 {
+		compatible = "usb1a40,0101";
+		reg = <1>;
+		vdd-supply = <&pcie_vcc_3v3>;
+	};
+};
+
 &usb_dwc3 {
 	dr_mode = "host";
 	#address-cells = <1>;

---
base-commit: e5e04726cdd043e309677071ab1b65a4b18f422b
change-id: 20261009-jupiter-usb2-b888e544520a
prerequisite-change-id: 20260812-b4-spacemit-k1-usb2-97adfc283d58:v4
prerequisite-patch-id: ccc56cd7363a39566f74b3628fbe2ccf01c76774
prerequisite-patch-id: ee646b8712bc41793579b8abc30d8d3f616d36e7
prerequisite-patch-id: 793abd51f18ae96cc2cbcb447721ca9ae1e6fa49
prerequisite-patch-id: 67bf74a44fd81390c82c07921d808a58a5211fb7
prerequisite-patch-id: 801c65013a1e55dfdbf3d3b061752ddb972afb18
prerequisite-patch-id: 2321f949dcfb2609932da94cabc969812f11669f
prerequisite-patch-id: 0843cac1ae192e99f2562f5ac882dfc4f9a10637
prerequisite-patch-id: 7ce394f4284c628b7d6187d8ee555726c94675ad

Best regards,
-- 
Jennifer Berringer <jberring@redhat.com>

