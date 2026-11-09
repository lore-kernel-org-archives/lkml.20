Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794239112;
	b=dBLEBFoUuLRJYLkDewru6g7oQisulRS6C0Zd7pBFoHeIWGlAcWdBexoQZSmt1tTGdmLA
	 Ytuff6VxbE1dhJh091a2J0jnv5Yvy50PifWSn569bmc1m8FJZv5bwNDFix6YdTnAnTBk/
	 3V4X0iWm3TOjgZQj5tCaE+coJoQ0JmbCkMHTSz+Zk7EgLrWWqlfjJ3XZjaTH/ND1DCmTt
	 lKAMxC58lrrCvTiycaLBWXkut2dHuHj8zB1GKszFrmrpB2d4vOVXEW4ukRKigD7C12mVP
	 IcMgXAfZfqzr8jLGXiTQ3DujDCR/2z0CFo2xdq8ds6Z/zTpIxvFVaGhOAGrokJ4VHJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239112;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=++xuuyWKK1G1etes6zMMtPPyYRZJNwwBAUgMD6pOMi0=;
	b=bUwXMfV+Biz85dP2QPk5+fBviNiQbjgwP0Rf4VPUSq7HufGR2/esS8IPRYoyWEPtH4Ly
	 uIJTdumwXcjO25H01d0BM5Wa7QBMt7G79y4zk6QFY5HUaCk48AQb6hu7f6ojGUMDNQVRu
	 VOlco3j+9fzmFSAS25y4aFGO9vM+O25BnlOtcP0Py+0JxRW/9zbkO64mDT7fz3Zvq4Dgk
	 DGL9tM/7N/U0CvpF0lU0wgzn7PLmc8t5OotmL+d0nuFEtwwh0t+FqVLJnITuClEx86z+l
	 B+6qsE5VwZ1FzbrB4UTGD1CWr17F1ci9X3Mi6Aa2CA7hbqu1382zY7euasb5LbgZ60g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xaOJtD7j;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F3D606EEBC
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:45:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32F3D606EEBC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xaOJtD7j
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so6978155e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794239110; x=1794843910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=++xuuyWKK1G1etes6zMMtPPyYRZJNwwBAUgMD6pOMi0=;
        b=xaOJtD7jx5mEGk5B/pZ9Exhce5KGFHlTlXdlBgbOwA8PLMypkHyTwDyag5aMOe3y39
         pSDHg6X8ek2rff9JHpDnbQ07TsroWqDA4IgkASDG5Vp2lSaW8NY9C2/QvDSpYIi7UvCM
         zzHZqxIB03YAFS6CGOzmJcf9u6cUe3D33u/wN7A1tL8IHQn0lfrGWqzm22xTrlRSqLlu
         Y38vQSBocLTXUwllRhKLQayP/lE8Ud1aumUDHTlLfTt56HhUrgss/cIMq4NZfaC+uPXo
         FdHSUbOoHqYZZJ3L07+tjToh3N3t2xQIPPLX7TyufanZwheUU2w+AXJqCQSky6W7sogI
         Sdiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794239110; x=1794843910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=++xuuyWKK1G1etes6zMMtPPyYRZJNwwBAUgMD6pOMi0=;
        b=W+ndbAonoxFSrK3Ay+49/MgFIbdH2iGR+q6zx0mLSiEtpWC7Ncdu0tWq5oc5XYdkOF
         gad3OBpC37cjzpe0ju5M3t/7bmCpCjmvtNniUcjkA1sdIfJY4cppZjRz367U3knEz+Eq
         jjqyStTWjYGYprLjcSs90zcqv4bEEOG7K4sDT+1BgBAZxa2RsKA+ix3myS2jW7XjOyYH
         wP+P9L5XRugGavlZIsaPVn/++kCyedTdYOMVF30tSCzqnrzYvmLsq+5hkaQ27lIxwb6k
         oEDlyJ5CLb2aNouvArsNfdTI7+67vajRgeYma75g8nuHh5M3qgbNHoh7FH5DroTXpRPC
         6cVQ==
X-Forwarded-Encrypted: i=1; AL+hErE0iQMPY6G+mCdFNObT8LCbeZUcnsFrtitvM0qtDd/BJkFmWSzKZrLlqMis8poZ0gLk0z7E4oVD9uMiRSA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OdRlcRro0D/rxj0OTj6HIU5fksXsC3r1hh6Ev80y3ElKj+brC
	aGfZW3xgd182vxO4hq1O8yk782QV6ZDHzrO91ZRrS3fogb0tY49zzAuW
X-Gm-Gg: AYBFou1Kt+pYqlnsvJaywng1uMRj0on4wh1ft+hHTe/vefdE/qVosrmd3WiaTIVXnqN
	OID/PeskkMHnxfqvJ9KJoETepi7zqLAy4PxtPcrsDqlhOwDd+J/RFqZrJtS72bUSfwljqN79tvb
	/umScQGj03R7Ih5vWj3xMssa0+keS4SjOlJa84G5INbhWwdUJkvDI2c824ahbaIGULoDOsVOCPC
	K2fMcW9jOV1+aQEfdcd8MjgUXMIS2F5Tf9t2UK+On4B4OF1NglQ5BiXj0qmA/Lx/ixe3RjKnbPU
	drUZF7J0Xu+ob7s3dChBgrlYzSQqD0ASpckqZy4B3indLorOVDjO6Nxm1XdCl7N/bIcBEjegng2
	AMyWohUp4SIiizKjxwbzod8Dl8YWPwp8KeD8YXgvvvJaXi111HSnBl3m32XAc/AHaGzguGs+C9x
	M2PucunCXuM9eRRjCtu4t5Dsf4gn5GWUuyjy2obRVYWPSfFhllThLrtpn4FdPHvEQHsyoNVdbKP
	91J9W2QLkgE81G4Wqnab3goLhnie0Ir8VeBHpwuB4HHYjKAH6ZPe649/cHkPleN6epqHRCLX33X
	W5qsl8YmwhWAuia8nKdHs9EiDY9VDdKlVQ==
X-Received: by 2002:a05:600c:5397:b0:4a1:78c5:79f5 with SMTP id 5b1f17b1804b1-4b963c8d7ddmr76018955e9.33.1794239110309;
        Mon, 09 Nov 2026 07:45:10 -0800 (PST)
Received: from hp-z640.fritz.box ([51.37.204.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad4d1sm257163645e9.5.2026.11.09.07.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:45:09 -0800 (PST)
From: Owen O'Hehir <oo.hehir@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Hal Feng <hal.feng@starfivetech.com>,
	"ziv.xu" <ziv.xu@starfivetech.com>,
	Conor Dooley <conor@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	E Shattow <e@freeshell.de>
Subject: [PATCH v3 4/4] riscv: dts: starfive: jh7110: Add the RTC node
Date: Mon,  9 Nov 2026 15:45:01 +0000
Message-ID: <20261109154501.63762-5-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109154501.63762-1-oo.hehir@gmail.com>
References: <20261109154501.63762-1-oo.hehir@gmail.com>
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

Tested on a VisionFive 2 v1.3B.

Signed-off-by: Owen O'Hehir <oo.hehir@gmail.com>
---
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index 82ea63f71..817898eab 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -1206,6 +1206,20 @@ pwrc: power-controller@17030000 {
 			#power-domain-cells = <1>;
 		};
 
+		soc_rtc: rtc@17040000 {
+			compatible = "starfive,jh7110-rtc";
+			reg = <0x0 0x17040000 0x0 0x10000>;
+			interrupts = <10>, <11>, <12>;
+			interrupt-names = "ms-pulse", "sec-pulse", "rtc";
+			clocks = <&aoncrg JH7110_AONCLK_RTC_APB>,
+				 <&aoncrg JH7110_AONCLK_RTC_CAL>,
+				 <&aoncrg JH7110_AONCLK_RTC_32K>;
+			clock-names = "apb", "cal", "32k";
+			resets = <&aoncrg JH7110_AONRST_RTC_32K>,
+				 <&aoncrg JH7110_AONRST_RTC_APB>,
+				 <&aoncrg JH7110_AONRST_RTC_CAL>;
+		};
+
 		csi2rx: csi@19800000 {
 			compatible = "starfive,jh7110-csi2rx", "cdns,csi2rx";
 			reg = <0x0 0x19800000 0x0 0x10000>;
-- 
2.43.0

