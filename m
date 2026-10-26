Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793049128;
	b=feYlUjNOMdYKcahNOGfbdlSDyZjOa3gUrG86rK7J/VvEL7MCPIFD1qyhmuMPvSPbDGnH
	 3K8MO524sDx6U/VQ4Vhdx2mrdmNumbIhRq16AtBl3ttFz1ApCeTRVwh+k8TPCOEH3hfo5
	 q9K1C7dLPfqyUdK5UEP8IVc6ClzZd9LW/olUSFGM5sAU9qtPRHii8HkT18dV6vUzpR0XS
	 /4f82seL/Vh3PRaes1JEhvmNz8A7Rn6mW3pcUqKOd9Fzxo27Gwfk/w29X7kF4IfY/BMGV
	 g+zASb8qSPPZJ4Cc5OL1fNExVFx5HscJ1Gd1ZDdll2eeYxMfM4GCCnesBGmMoZTORAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793049128;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=QkAGfe/UDsHGvMGKL2L3uZbprb9NTy21LdH6RR7axyA=;
	b=PqeaVxG4PBWo6yov0lMDXUsUYPwJSho0vCYJVHCTU40Evs+/L6Eg+kRhyKtASapm2MZ3
	 o+aLSCKCNpOSFCKZl9pCGGT8UZ5VqR7tb/nxEluTdjSxENQjHgWDrLupE2Ua6IDqoVf8X
	 +hErNmlSTk/rOLKeF94xjRUwoWXxgIXUI9oIUP+tQLoCYLHL08CnwxjoewTYrA4BUTvm+
	 MZClGpRhhruGj5p5D3Z46+ajNfh7ypFML79kSJt/tOweQ1JrmAxT0n+k7tN6SJ3Ye41nP
	 lX7HTq3LUZjsxwtD+elyg9Q6ioF7Z9k62u3pH1jMzTk5u4H/REVaX+QwyFIvtBNLvpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=PfhwGTgB;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2E5606A326
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:12:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B2E5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=PfhwGTgB
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3aded3c6103so1097565a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:12:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793049128; x=1793653928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QkAGfe/UDsHGvMGKL2L3uZbprb9NTy21LdH6RR7axyA=;
        b=w+9FDxkvB4iNgqVN2MOgPvpcjDkuW8KnY8UsiGW9mBzjypBScI469/iQ4FX7+ZduqP
         wTYw0wOERQOpE5RW971i9YrauE0equowO1RBn6PH89gLCggik6okH+JBLR1mntUB4aM7
         2kTf3fYpWMwQrXb2x2Cr+uaTbBXz9mGpRgXJ2Iv9c2l9p88w/DlH989Hk4OeCqVz4Db6
         UpXhOOzuIc91mre5ekTw78Q12BYFMnr9yiKSLE/PdQIDkjY3m/AaSC8T10ndlAfi1Tzs
         Y2KwKhbVQ3avPFdk7K+pHlmRuAegaD+H1EWfpAWzxVsUnLzIZhLvmS+5/ePno3a6VKdB
         a41A==
X-Gm-Message-State: AFq9FYIiqeXIOYRW9C4jBIuSyPoKZ+mJ2AkxbZPJrg9l5i0t4szUymB+
	AX63/I13B8GcwafJ6zWlNlm9toRCfrqaG9kBS/MYx4LYGefcOWP7d/s4SGRcZbz207vn1Yaqvzs
	DKu7k90s0z32tfANJtTF3HifeqXn1JbcoT+BUQg9hkwmRRLO50g1uw9Y0qFn7zn1d4oqKrTM2xf
	kulKKfQv0tpkjVemg1zPLvB1ltBX9aGojsTLOoYkdv8K1Vt/iDIXMzdJKel3UlCBP3moyf+w0Z+
	qdFuWVK/hYIW90/UXJnp+yq
X-Gm-Gg: AYBFou1GsavJEomnHPNVTtJheMdz2JW913vXmtrO2ON8Kcmab4PZaXNKZ5P1xWVaBCf
	PJsTMijypWyQq47I2CYTcny167OK9LCoqGv6DWsx6FuIkYOe12isGnirFQVv/WM/nKFJIds1QRV
	QieEs5EbGDJeSfHXArjFjRNoHOm7F/d/i0byGEAPreRO46SF7eLydZt6zPOKuWVUXUT7WY/6u5y
	bpTaY05gsc7nHE+3Cj5jeIVltvjMgsZohmxTX6z+PlxpvKr1HjfM1gqylNSRtDZgXQuPdqxA5Ca
	OIY4fj6dxeIF3THrJcSSDITH3xz4xZQbwd9M8sem4QCYfBrv17TQJOrbTMC4/UgTWSaLVCvMqIR
	AJQZ+O9jLdku49r8A/SC2+Ls+GXqwUv7s2C3cZeClLmw+O3273XW6Hj6QIlWKInvg1xI/BI45sQ
	pcZXRy9Mv2bb850QW0+FXLj7Bb5Jq4108d6PH9pUzV
X-Received: by 2002:a17:90b:3905:b0:3ab:be66:ddbf with SMTP id 98e67ed59e1d1-3adeb131801mr6408817a91.54.1793049127656;
        Mon, 26 Oct 2026 14:12:07 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3adeb83a327sm3599984a91.0.2026.10.26.14.12.07
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 14:12:07 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1665200f4c2so4093028c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793049126; x=1793653926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QkAGfe/UDsHGvMGKL2L3uZbprb9NTy21LdH6RR7axyA=;
        b=PfhwGTgBUJ5zVQWhxz7I/MWHGTjwtEFi9lj8OhLboPwwYtWFCEHd6vrlAKSuoPTfNQ
         PVmETTYCdSTnH2Kn5A2I15wJ80v5D5POqMQVujnoUbNWV+cplC0XsBh9VxycTzpjOeTd
         7YXlmUeWiyFXpMMax+eVFNra0ZwM13Sq8eX9w=
X-Received: by 2002:a05:7022:eb50:10b0:191:a5b2:ef4a with SMTP id a92af1059eb24-1993677ac8fmr11277921c88.28.1793049125817;
        Mon, 26 Oct 2026 14:12:05 -0700 (PDT)
X-Received: by 2002:a05:7022:eb50:10b0:191:a5b2:ef4a with SMTP id a92af1059eb24-1993677ac8fmr11277868c88.28.1793049125085;
        Mon, 26 Oct 2026 14:12:05 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0f81ea9sm31915678c88.11.2026.10.26.14.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 14:12:04 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-perf-users@vger.kernel.org (open list:ARM PMU PROFILING AND DEBUGGING),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Subject: [PATCH 3/3] ARM: dts: BCM5301X: Enable AXI PMUs
Date: Mon, 26 Oct 2026 14:11:51 -0700
Message-ID: <20261026211151.3212237-4-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026211151.3212237-1-florian.fainelli@broadcom.com>
References: <20261026211151.3212237-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Describe the three BCM5301X AXI Trace Modules and enable them on the
BCM5301X base DTS file.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm/boot/dts/broadcom/bcm5301x.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm5301x.dtsi b/arch/arm/boot/dts/broadcom/bcm5301x.dtsi
index f06a178a9240..dcae7cba37c4 100644
--- a/arch/arm/boot/dts/broadcom/bcm5301x.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm5301x.dtsi
@@ -10,6 +10,21 @@
 
 / {
 	mpcore-bus@19000000 {
+		axi_pmu_m0: pmu@3000 {
+			compatible = "brcm,bcm5301x-axi-pmu";
+			reg = <0x3000 0x1000>;
+		};
+
+		axi_pmu_m1: pmu@4000 {
+			compatible = "brcm,bcm5301x-axi-pmu";
+			reg = <0x4000 0x1000>;
+		};
+
+		axi_pmu_acp: pmu@7000 {
+			compatible = "brcm,bcm5301x-axi-pmu";
+			reg = <0x7000 0x1000>;
+		};
+
 		a9pll: arm_clk@0 {
 			#clock-cells = <0>;
 			compatible = "brcm,nsp-armpll";
-- 
2.53.0

