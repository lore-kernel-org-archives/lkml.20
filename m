Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920269;
	b=FT4VoGzPYQrKZPmUEVRm6SFlrzWEy3Sd+VI9n+f8TS9Wpl+KF0T2oxRD4GrOfATJGnNc
	 7fI1OPOjNkf1nC3E0XJl+qM+wKlZ9bea59ytFrp1PieAvISaDMVBpFDtr/zG9GPXpiAnc
	 NnCxPNBmUj0wppBqQ6phkE1pGcNAstpbiK5GXxGAUSN7F3ow/DkxS24/y1f5CXEl0Thn/
	 870IX/ncRDElU7G6NxtVFx3UgRisJ9W9KThG3zob2vAEXk1r8CyENPaBEHXPbmPg4Nkt5
	 ePoKsh4xY3MLoBVJTWmx6Td4WoRoNc68h/YYXAoF3EbuyiWDB49NmxENNMNfsIShknw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920269;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ZlelFqtSwzH7qLeRIoPSb1dB65eEiaq1xmBL8y2J6Sk=;
	b=VIfiPvK+JRx94OkNVkkxe/J/dl//gTwC08hNwV/ezCuvgAZwjqbKfen3JsbeY5erxWBR
	 AAXmHtlhl+T5bE225UjI4oHT8zuqu+QpOVUY/cuGsmV4XqcxPq1yfTHMhT7c70i9MVZ1O
	 Xb24k1uEl+EAjH0f9pcABaabNeaPn3ucdSdNdcroAWnSqlt9anBqGxrTM06cqhznXE8Gr
	 1OC4C9g/vpWHxlA5rO5q82XDGkI4qZeZb0rbRETXNP3xXktZTo8Q1egM0GRkEYxVDCsAG
	 gChxVb2Rk2qEZ6bB9nB7vOAOrOD+1Xw7uydak/8TcMFqZ8D9FubDvJMg+PVKi2OlO0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=DQbT0sOJ;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E95606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:57:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8E95606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=DQbT0sOJ
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-38190551625so868870eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794920268; x=1795525068; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZlelFqtSwzH7qLeRIoPSb1dB65eEiaq1xmBL8y2J6Sk=;
        b=DQbT0sOJQ7QP2QSpio2o9wdDmE/fEoD7TkjFqt9pLg+kidMYB7mWpnHPZ+38Fo5pOo
         pSefdBrNecz9uCbYFbmVP0TYvoQwQFb/50s+SfoDO5UeE4kkNl3jjKyS6siv8CHVmCep
         DlaHs1wubkm29ejkWHosp/6doJ3BrZCqw/rOWNxjthh9+WnaaPxK6nN5rvwO6AcqH8LI
         EFy0cZkysJWFSiJ7uRP5S+IPN3iuC05HymhTwibT/ZnL3g8C19RfbHZY5gsVmwyr33t2
         fEAGxVQhEpDoAx/Gp68qAWZ35L+iY2geEyPn7PqSIH/ugldcJu5a0zi0sQv1JBKv8QOZ
         vJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794920268; x=1795525068;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZlelFqtSwzH7qLeRIoPSb1dB65eEiaq1xmBL8y2J6Sk=;
        b=iKJkcxIHT/Jc3APZPPXW8b2g/H444Yoe+qlfxshHqeY+gfB8ePzJUYI5lHjH6GTuwr
         aAkhd+ZzT+Z0A/jwOM48U8Ag0cKCmLF7p8nKMwKjb1YnT48CylLxk9REISZHIQaDnD98
         HBJigD94uVYZOrRMrS8eJYEfp7YNFbuSh9ZXuhlm4Q7+ig5mHaG4KQz3GBqY06aXu/yR
         cR88KGqWtJ4SSZgdhigrf4DkeJ6FmCZZQcdmfIFnLRiRDRQKLu+Um6HOJKZUb5EC2Mjd
         k2FD8Q6y95yN+EdQVDfmxpUIAEXl46aI8nNC1FNAoqW5Hv0/+5cWIhfdzt1zJ/lwdOeW
         7KCw==
X-Forwarded-Encrypted: i=1; AL+hErG+x0HU+w9pn1hp3Qgl7YPqdzjodrQikRvYyfa/T/425K5uaZeUl32ZSENjOFUWe2iZ9/DdqqnGlYZs6E4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9V3rwJ0Fq/1Jyr/YxXzu+Ihnh8KXgFSj47RejbaoV46GjdP1e1
	6IPqjYVTIUfLYWN4rfXTACYD9tVOo0RSs8uEedPYXmrHItVBWlxIVKk2viL0rAlioso=
X-Gm-Gg: AZFdTZe63++AzIGBfB3o0GpR++t8YUGJXS2kuOKXZ9aMA1KOTDJ1GjvOdAjqZiR5dfj
	3fgQpGt98Ue4Djbi0Nh3jhDQ/sJ9NBMGHcF6Md1x3Cqcjxif3B2AfFDyXN8d4esTMbsak1Tac7v
	vj7YQZL837IoYihZUgmc80CIqX5SpkUu5ENk5PzHZUKrYDbHI3LTvSkxTIiVKcKfGSDwS+eF/H2
	op1ssR+U/w0LzgVT+Yspuqfg5yBycl3XiULNIPmpbNp4htyiJpSVQVKmCoTd9eRopliDBfer1u0
	1ng39N4itcaA9BPdBb2VD9D83tsonijvBi+N0V+j/MWPrKkK/oBmxuSnsCUI/KcqTk8YgovVU7A
	Ph8z4Hknu5NSojupnAHACQS1Yr8vrU9bgeUeFHrvBdn3dlAEu7esxTxNmoWEgSG5+loFoXn0Gla
	0JHJxzUA2On/8IGNNmofV3MEQ8qMZTrs2fY+sTimwJVhoyl/7N5gATVWdvTBNMGHPBQdyeFqUtG
	gMKDXdWY/CaXxxKP3KznVj1lbFm3tEV0wEvWbfRQZ8KlsPB+MDh/mK8HYx7lxvLlaGyAp0b4ZKn
	n8qY5K5pU/HcBoVwWwu+o2Ot+eGUUimz1R43BYONgv2521hqmN9i8WlWd0eCqdW/KChEpMn9fUZ
	zPDKKYafLPHNv7A==
X-Received: by 2002:a05:693c:4097:b0:36f:d53:cf2f with SMTP id 5a478bee46e88-379635648f7mr13425750eec.1.1794920267749;
        Tue, 17 Nov 2026 04:57:47 -0800 (PST)
Received: from [127.0.1.1] ([2804:14c:4c5:8bf0::a1aa])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379559189e8sm44767034eec.11.2026.11.17.04.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:57:47 -0800 (PST)
From: Hiago De Franco <hfranco@baylibre.com>
Date: Tue, 17 Nov 2026 09:57:15 -0300
Subject: [PATCH 3/3] riscv: dts: sophgo: cv180x: add PWM controller nodes
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-milkv-duo-pwm-v1-3-3f1786ea57b7@baylibre.com>
References: <20261117-milkv-duo-pwm-v1-0-3f1786ea57b7@baylibre.com>
In-Reply-To: <20261117-milkv-duo-pwm-v1-0-3f1786ea57b7@baylibre.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Chen Wang <unicorn_wang@outlook.com>, linux-pwm@vger.kernel.org, 
 devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-Mailer: b4 0.16.0

The CV180x/CV181x/SG200x SoCs provide four PWM controller instances at
0x03060000, 0x03061000, 0x03062000 and 0x03063000.

Add the corresponding nodes to the shared cv180x.dtsi, so that they are
available to every SoC including it, and keep them disabled by default
since the boards still need to describe how the outputs are wired.

Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 40 ++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index d2ec70fd515e..c478e7eb549f 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -160,6 +160,46 @@ portd: gpio-controller@0 {
 			};
 		};
 
+		pwm0: pwm@3060000 {
+			compatible = "sophgo,cv1800b-pwm";
+			reg = <0x3060000 0x1000>;
+			#pwm-cells = <3>;
+			clocks = <&clk CLK_PWM>;
+			clock-names = "apb";
+			resets = <&rst RST_PWM0>;
+			status = "disabled";
+		};
+
+		pwm1: pwm@3061000 {
+			compatible = "sophgo,cv1800b-pwm";
+			reg = <0x3061000 0x1000>;
+			#pwm-cells = <3>;
+			clocks = <&clk CLK_PWM>;
+			clock-names = "apb";
+			resets = <&rst RST_PWM1>;
+			status = "disabled";
+		};
+
+		pwm2: pwm@3062000 {
+			compatible = "sophgo,cv1800b-pwm";
+			reg = <0x3062000 0x1000>;
+			#pwm-cells = <3>;
+			clocks = <&clk CLK_PWM>;
+			clock-names = "apb";
+			resets = <&rst RST_PWM2>;
+			status = "disabled";
+		};
+
+		pwm3: pwm@3063000 {
+			compatible = "sophgo,cv1800b-pwm";
+			reg = <0x3063000 0x1000>;
+			#pwm-cells = <3>;
+			clocks = <&clk CLK_PWM>;
+			clock-names = "apb";
+			resets = <&rst RST_PWM3>;
+			status = "disabled";
+		};
+
 		saradc: adc@30f0000 {
 			compatible = "sophgo,cv1800b-saradc";
 			reg = <0x030f0000 0x1000>;

-- 
2.53.0

