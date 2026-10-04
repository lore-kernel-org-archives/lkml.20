Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FE137C0EC
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 15:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791128762; cv=none; b=uv7975Yi98atnBkmPIe9Sv15zM2bkgk4KZpbXC+SKbbHti1wKZq4TYNXvMzsPUV3RStxdZscz5p0J7Id7eDlPV12T0nhAQPQ4j1m7StVSybZmlh2ZttU2Hzwp85jfp+y9Z/1epFwcJAClzAmhIMX5EAovgUPJATVUN4YlhpNZ/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791128762; c=relaxed/simple;
	bh=hJce8KkqJxPTE3J7Vzepo/98v8LFPJybkOZQxttxP38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HFghotVWffllzrOHvPyKJcMZtKGKq67SbdyK3BEQDrkNXF0XmJRMJWRqT/y/FA7j/5twXZJrgq4vsndjPhSH539H73bb2P/ahEtRzhlBMGdCFzWk5RFBR/Xe8O0VPchgM7VYELRsUqlDhnZSOHEtDhzyM0A5iZBBQcJfMJoMKXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R+8PdtuU; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R+8PdtuU"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a11603310fso10135585e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 08:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791128747; x=1791733547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DzRrET+2CK6J9+3R0nvrRXkHdDyhShxAssXo4w7Y3Wk=;
        b=R+8PdtuU4eRegHubGNz3nu6vE9W54fpV+9otvoIpf3QhScV51kaLZpH5Yrm/zjiDzB
         2Wq3VqDsZG4GZdE2R8OK5XdHsHvnJ8EMuDz9BlHaVIkfE3COJ3N6hxpx1hQeNc2qr3HR
         XDFOfxzY89sZSazW+l3gZoXzrSMGDPhjIU5EfTKoHaZc/rHIXGEBJ6IrGZ514QBxMYve
         WKrnY8+eivjV+oJQlBbhuZMdgTQQjeWf43nHcYkamNOlhyHD7T7F7L6Xa6CB74UiwKqW
         c1ZHYTQzuvOemdZnk2pzZmXPBbDPu6JkGqFzt3U4bMMH0s6iv5ZoDDheeKG3X9+pYzm3
         sJzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791128747; x=1791733547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DzRrET+2CK6J9+3R0nvrRXkHdDyhShxAssXo4w7Y3Wk=;
        b=waPWJ1VeoIwKnJczpC2K7e4pdjSnRT8QA0K/TEAicgbVPBoaviezeEva3O38DyVYWH
         nf0vO2C7786rEIKZ6SwmKZ/DCKV06SQ8MSZouxh19amYJbmci9FWoN5CUY38O+7qHRQE
         wUByDSX4euoinDhAkQ+r2qn2/Jh8yVOvfSQYAlf4O4J72yZrrekiCngxXv6m+Sw5WmCJ
         8V2iUlQATChPVT/2+3HzfBz3vy+ftPf55tzquX54Dz3nbdlDRf2lqPr6uHlEVG+Ig2zU
         Jh2RdeDnwvWG2mWyJypmfbE/OfWz2IxjOeI676vXmPp/kOHDG7gIeSluf7x8TDhveNnj
         5q1w==
X-Forwarded-Encrypted: i=1; AKwUvBwdOkjm42FzwRiyvH4reQ0MGLS9r57O9OuOZQuyiH5DWYQvJFYXZHA6E1MI7PJfkQhSu+Xvx6DOkq5AlRU=@vger.kernel.org
X-Gm-Message-State: AFuF++kcwNj661c3+On5/db1FjCylP20YqbvGtPfwVIfvX6bn/zV63Cb
	n1Q70OMnfxc4wVcI/DBoiKNAAu0HSYX0XhK4gRiDOKgKbYVu3k09rZni
X-Gm-Gg: AYBFou06Eri1mieDZraHuiZ3A66sHkduzUxtNR3DkFio2qd1VRw3P1ONgKWdFidyki1
	1aprsj6YYVCZAfzM3Qqln12wWtYX1JU5d6Zk3EljnQ59B4FI0Axs4lhUJ3YSVOcIDVgk4g9cbME
	Pgh5AEmo7s7CdYJnrjkuD48i86F4mb0PH1UbNgYTzZjO1D18VOejVTXtioA5zy7j+5+jfMg1gur
	XRRH0KPXKVO77Zvj/dL02epYKNvSoMImfgE4wBNZ+oJ23/+URNDlL9UQ3bzZwP/yGpRBrBOz9km
	iqW71oORv8hRrrlUdTQxjGQ1VYgQ1W6sGnCHiIgnnjtoOSHTd8X1QG9ObWjD72tfzZzVhzYPFf7
	+HxvieFYIlh66UjvE1wOEN7InPi9rMwp1g5V/7OQMb6OrtUrdNhBhdclQq0CwgsrA1vJVhb+HqU
	6dlgAChABzMk582Oh+o2suGMHzwLXoPHjRimwiwg0Xo24JPwKwrY/LSpXhjI1hsnYyruBikTAXO
	Qq6zyiVvrUlNkJx87k=
X-Received: by 2002:a05:600c:a011:b0:49d:17d4:aff2 with SMTP id 5b1f17b1804b1-4a0275107e2mr139184455e9.1.1791128747297;
        Sun, 04 Oct 2026 08:45:47 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0394ca0f0sm168639935e9.1.2026.10.04.08.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 08:45:46 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 8/9] ARM: tegra: lg-x3: Update USB configuration
Date: Sun,  4 Oct 2026 18:44:55 +0300
Message-ID: <20261004154456.145362-9-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004154456.145362-1-clamor95@gmail.com>
References: <20261004154456.145362-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update USB controller configuration and link it to MUIC.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
index 2dbef0185a0b8..e334473b7635a 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
@@ -1215,6 +1215,11 @@ muic_to_charger: endpoint@0 {
 					reg = <0>;
 					remote-endpoint = <&charger_input>;
 				};
+
+				muic_to_usb: endpoint@1 {
+					reg = <1>;
+					remote-endpoint = <&usb_input>;
+				};
 			};
 		};
 
@@ -1788,7 +1793,19 @@ usb@7d000000 {
 		compatible = "nvidia,tegra30-udc";
 		status = "okay";
 		dr_mode = "otg";
-		extcon = <&max14526>, <&max14526>;
+
+		hnp-disable;
+		srp-disable;
+		adp-disable;
+
+		usb-role-switch;
+		extcon = <&max14526>, <&max14526>; /* vbus, id */
+
+		port {
+			usb_input: endpoint {
+				remote-endpoint = <&muic_to_usb>;
+			};
+		};
 	};
 
 	usb-phy@7d000000 {
-- 
2.53.0

