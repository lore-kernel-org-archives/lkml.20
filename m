Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793185094;
	b=kOgXsF1G0BR80UEiag4ud+6usCxq6+4RUA8/zpv2uLh8TSKBD+gROsfc2pdATZ1HgwfH
	 9nRERTiNe6ACVNYIbsRu6/66HApSIWEwdbIAlRQBE6GxxEo/e+5RnbBlGIpsf7OsL9HbV
	 vX6ob+dvBT6mywOx2qGGf9TLes5nKrxLLJR9VGXebbedT9cEanFsA+A5EZnTKiW7OrFDU
	 HvmMsdY4rDlZ57Ej+1Sp/rY9kJ/iVm3AGwMYNiGnkAdwhGsJ1HxwMDa+aX7IAqkLZhNKR
	 WvPVowCN0tP9wFM3WnfOhgUPLazVIKCByFPFjG3i+S9twJjOz24xe51yQ8yRbHjHCFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793185094;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Q1RsoPgnfkWmfzIcQOevxAgUv9RWbdrqvZKCjq9hQeg=;
	b=U4Vv19e0O3FlLTMIDn9gEdrwdVWwpTdQzrZvz5WsdAYukGGs37xnFsI/4bCYagcxd7/f
	 wmPQ8mOcz9qcD/6s15XLUQmAtrIAZR99peTJ6aQgrjKhmGtezZZhiiELAhJJ9fIgp5WYg
	 +KSy5KJZdNAWbWxTARroWqWONR9FzVE5048oFZZ7db2bnOq8EBgPe6a89P+yvkCrsOR8Q
	 uENzVuBlzYnOioUu+F+aCmuUcUEaxppSYzADxwRbCilPFi+apc3mMy+HrslBCLu2U/XOX
	 9cZBnF4Ao8lVD+gRn6Ju96iyctm0qWGKQ7ddkFHCYwgiVnl4x3+f3qFxJDf89gBUAyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=GivSWpYZ;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65DD606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:58:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B65DD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=GivSWpYZ
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so5661435e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793185092; x=1793789892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q1RsoPgnfkWmfzIcQOevxAgUv9RWbdrqvZKCjq9hQeg=;
        b=GivSWpYZ0b5ikL0WirNkogDtQIaJF9JnCAAB7wXuMCQm0nxYklLILmPiqrBVMyjlHK
         fIBaVv3uGdWIumdKrf6seIRCnj56owvuip6GEDmX74WBq/gM/JDoE2WwSpiPciz7hJ9n
         nA0dEafM4LG3GVapQx6FLZNTooVewlXjix6oU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793185092; x=1793789892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q1RsoPgnfkWmfzIcQOevxAgUv9RWbdrqvZKCjq9hQeg=;
        b=m1djzcTu2hAqijG/h4s//vkIH69CWCCqpIjyUpQntpWLieUuQDwhckWMbbmUOci3Og
         gsvIwVfhZnYEO0Tx7sCPP+E0aXpcSaH7cOmwzUxhMQgTbCe9E8LehnQ4nLVUqXKs1fgT
         wvGcvLlDrRgwdMalPDw5uIxabHo7Cn97x0lelOBdLkROemclSh4WMYfJtKDNUpkv14Xs
         OjSa3UTNS5BqjPBkN/FNEfia77hz+57vhv7/F+IovBHIhurZgRvao9Dc+L6gH4gj4C+6
         +AjZXu9a0kpDgysPKWNPGgfytYoW3SmEJgfzDb1f0lKXF3u3ML3LfK/W6ZUINAHXZRSo
         yBoA==
X-Forwarded-Encrypted: i=1; AKwUvBxPp2ZC3hFX4dE1ir/9AGjV/lSkebUjhjy/5xAj4+xn/tLHVDt7gqIGsvgPwk5m1kcOEHHC3DsBpwabw54=@vger.kernel.org
X-Gm-Message-State: AFq9FYIIy9IbcYLNpzpLwl+9CAbITaTq4dSsB7WjYwoaowbCgfsr2ec8
	8OON58uXSjn+lS/YMapZDHaf0kdbxAAHh4mstj8AiQbV4eYuJY1Ik1QwPnvNzFzQyLc=
X-Gm-Gg: AYBFou1k4i4Uou4Py4lRcs9rJxJVP0f8IBy9gdJLL5gaOj1GkIIMbkkL21R4sV+tJMr
	v9a5FSo6QO7Dte5UNBEqe4ve4d1Wm9dPeEER10luFWYhH0RG81dUeLB+m+oKr3fElbSrskHfzWy
	XYfISdLgbGxKnSMl40KE8CFuiEufFb6yuE9WvYp6wYOqXhUBvQ+Mx4YJHQacgrbqQ7c8CL2ULON
	oapusWdxfBrmPQC1a1N9tgyVRf247aOLwmQMch6sX5tlceWU1YjqvcuWBJOqEqJcxUbrk3maryw
	CBH90puUpap6h2jYS54MYIzWsxk6BV0HM+/EfMxE1TBDFleIRPVX54YWB5yu3vfNj/KYrpvP32J
	7DQKgOXlqRYTBEh7BOuLIrGP17K0ytlEyO4KZ+Ba0Cxwg+ZPzBuvyjxRMm56a0IjaJp1pz9YCXo
	QY47cAjpvHonrstiCAHmPjdLzap0P72Vy1dDtntkmh0g6xvIk2Nd8VPAMNMspY9K9x4oTsBYHMv
	oKtW9e6ew6GJoDRGn5VeMemrwSYtUM3dM7J8yrz2OgphteFvB4PY55Jx8u+cyQ/hv7JUN4kM3aM
	f/bbw9/MbUXdM/30bXtl49Vye4YyJON84Shbx1VsezFFbRKPHQW5ly3tuM2Gj8Xfsmm6G7Oqpfn
	v0VdygEmkRfeA2nzQthI1N10ELt2UfKx1nFpP+9UX0uB/McPqJNy1pbaNw9JrMALe/x7wLxY=
X-Received: by 2002:a05:600c:4e03:b0:4a1:e7ce:107b with SMTP id 5b1f17b1804b1-4a9640f217amr38505965e9.2.1793185092065;
        Wed, 28 Oct 2026 03:58:12 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a97c42ca77sm35782785e9.8.2026.10.28.03.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 03:58:11 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH] arm64: dts: st: add firmware reserved memory to Engicam MicroGEA-STM32MP257
Date: Wed, 28 Oct 2026 11:57:40 +0100
Message-ID: <20261028105807.2567225-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The first 64 MiB of the DDR are used by the secure firmware (TF-M,
Cortex-M33 firmware, BL31 and OP-TEE) and are protected by the RISAF
firewall. Without a reserved-memory node Linux allocates pages there,
and the first access triggers an IAC exception and an OP-TEE panic:

  E/TC:0   stm32_iac_itr:197 IAC exception ID: 137
  Faulty address (IADDR0): 0x80000060
  E/TC:0   Panic at core/drivers/firewall/stm32_iac.c:212 <stm32_iac_itr>

Reserve the region, as done for the stm32mp257f-ev1 board.

Fixes: c5ce8d7bcc78 ("arm64: dts: st: support Engicam MicroGEA-STM32MP257 SoM")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 .../boot/dts/st/stm32mp257-engicam-microgea.dtsi     | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi b/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi
index 5b4287e86def..6cd64587ecdc 100644
--- a/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi
@@ -19,6 +19,18 @@ memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x0 0x80000000>;
 	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		fw@80000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x80000000 0x0 0x4000000>;
+			no-map;
+		};
+	};
 };
 
 &scmi_regu {
---
base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
branch: stm32mp257-engicam-microgea-fw-reserved-memory

-- 
2.43.0

