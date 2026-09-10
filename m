Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B8E3C1F54
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 20:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789073602; cv=none; b=XszCkJHLaZ12q4e68stgIp4zCt9i3NZ6Y6vK1HoJMcLqVvJTJ1aVKRVZwRaoTn2ubHE4lWOLHSzgElmk992CpyNFxRSOtGv84ZlwQvf0m/stH1QlmLTuyVsg5bTZNEHvrzHvCX4wRlXeNaPoYpSAbtX6LTAfwdEhcmy6J3JGpko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789073602; c=relaxed/simple;
	bh=U5QxWZAHtLux3C2Ggamr/Ic9Czjgsrz7b+m1iekGsMc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EuFf/dwoYYv2rc/DJHQgeVVomIYi4SsHyE3By6CGA2bYKnqufAtHOKCsClp6PCzLq+oWwwN2NbIVg6sIbcnS7kqhXsPTesSMv2gNL461LTubXUuJ2AFkAc0O0LXazDGw63C+rJaTr34SZRp3LA3lub/2DengL/x2450d/R0gC0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ECaYOthb; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ECaYOthb"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85368f1d484so7111b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789073600; x=1789678400; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ykVw6AeDq6KgknPvJUHHi9wiyKW1QQ8OFJp7ecp+Ky8=;
        b=ECaYOthbA2U1F+MhRpm1EaHeDtkk2zThkr8cD/ugrvZC1poWeDAT26J4RLMrl3Q+X6
         o4z4YI/wECdDYwCiNIatpMc2VpodvobhBiZ+/fuXHaVdKmEu+qghWfv2ogf5ptBzTE1g
         kuJGhCtSe4tXW/1QGXdQ4R2wYGrDl5UBxYR3XgX14v0gUsSG8x3GvW7rg2zdwStZ0eYU
         FSBSgIi0gF0Y+RS0Et6dr5m/Fg8ngN5T9+gsvMMgxi5D6vylJYydj06vpzlTMmFDmU3+
         MvetoXhFFjVv7iXuaTRw5ZmrI1mnORyQoJZkUM8hj64vLSvpiQvItsBKtpyCaAVjqIVw
         GOdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789073600; x=1789678400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ykVw6AeDq6KgknPvJUHHi9wiyKW1QQ8OFJp7ecp+Ky8=;
        b=KUfiGT8FuHqB1A09VSM0F91meWWPOwTBt5N9XAgYkGv1sJk4lXQBKYCSagckktnmVf
         VJZjXdrWvUFHy7whbXsTW6SjTRapuclK+/HNyz3jsVrhFA+HRiKKe0mHqN9YPb+ZD7zm
         F0Dwk6YMmpJlBfb3ypW1OzsI8NqFDcUESRsV+QdTURON/NUq8oUXV5Av9EFYeeL9bSEQ
         092/CIYNVVd9Lv/eVR/GPoHtRd4AoTtLXgcRb3thjnVRLh54Se6l8d9tSKjmPKNV8Mcd
         2REZ/YUgxIC5KE417An5w9pSQnkhiNlM76nPk85FH6Ylukdw4hhF058RgfCQlGc7gsHY
         dUdg==
X-Forwarded-Encrypted: i=1; AKwUvByfpERFs122MvsEJM6WkJTidzgUJfwCATltx9kURuSOjNmFCavT6ismMPHaj+NOwjFIZRxIkCba+H+Ad5I=@vger.kernel.org
X-Gm-Message-State: AFuF++mN7ls70ZW+rNaq860fwWIvHO9R6TyDx/M04Dn1iWzrlzBRS7Ef
	fYIh3d8Kj6KS+BKMuHY3H+IxwAC6ghuMSxYifnv75lG8wrVtjK3IBVw/
X-Gm-Gg: AYBFou2Bzabs319Rrpu30I9Gmr4kmvhoJKoTb1Dspo6CWJyv5C8IuJ0x+PxWS8Y8iFA
	JPIuoG2F1eIi2r/bEiNWS8eAR5WZLrOJMOf6iWTFryeni+/RFwDnqC+qp66c2gvAthwuQehc4hF
	Y6KsbbsCXZ5rpPtuyB+k28oJyLL8p8U1yCjYWMNAU3qukT7FwgmCpsgcrGfTX73SHtR2yoYqDwk
	5cakYDlcochKYiLfM9jOTkPoBuRaSgDVKhs1z8j6Lwtxojxia/SewCmaNrkmlXa004YGcELyJn7
	SqdJry0ryIGVyltaCrxyOiS1NgEmd87PA8kvMIfIzaXtxkJtJlUZC8FJrXSoaY4Y98pxiUsbXyW
	dTUc3Kvufc45WDTKjPZeSKKRIpVEz3XOyFehtZ8HCoFjWdYdGHKieu0ypzUhqrwOt1m1C5s1zW1
	Sa+5Kz9/9ab8vOVZ3TRrOw5RtRpnsT0rXCTJmOoJ2BnQSo2ycqOvZ/xzOh5lvOzaDbjmkjOkiOc
	Y7AVOfSroRd
X-Received: by 2002:a05:6a00:4791:b0:863:2fc0:4052 with SMTP id d2e1a72fcca58-86b312044bamr433815b3a.2.1789073600411;
        Thu, 10 Sep 2026 13:53:20 -0700 (PDT)
Received: from [172.29.212.252] ([2409:40c2:5431:4168:e542:5202:be02:6ae4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b250bf3e6sm150822b3a.5.2026.09.10.13.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 13:53:20 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Fri, 11 Sep 2026 02:22:50 +0530
Subject: [PATCH 1/2] ARM: dts: keystone-k2g: Add required #phy-cells to
 usb-nop-xceiv nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-ti-keystone-usb-phy-fix-v1-1-9f6e9cd649a3@gmail.com>
References: <20260911-ti-keystone-usb-phy-fix-v1-0-9f6e9cd649a3@gmail.com>
In-Reply-To: <20260911-ti-keystone-usb-phy-fix-v1-0-9f6e9cd649a3@gmail.com>
To: Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789073586; l=871;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=U5QxWZAHtLux3C2Ggamr/Ic9Czjgsrz7b+m1iekGsMc=;
 b=qOGeiLDnlzgOqFT3MXPuiSRMBTWGWKuBwOGs2MxGe9HPdKloutW1aOdKnSJ+jrJwLKKvVxTYZ
 vchzeXSi0jBDVZPWuXrGLEyBqiz4eCc+DX7OA6vAcZLsvYjdNEd8FSf
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

The usb-nop-xceiv binding requires "#phy-cells" with a value of 0.
usb0_phy and usb1_phy are missing it. Add the required property.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi b/arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi
index dafe485dfe19..5a63874090eb 100644
--- a/arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi
+++ b/arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi
@@ -77,12 +77,14 @@ usbphy {
 		usb0_phy: usb-phy@0 {
 			compatible = "usb-nop-xceiv";
 			reg = <0>;
+			#phy-cells = <0>;
 			status = "disabled";
 		};
 
 		usb1_phy: usb-phy@1 {
 			compatible = "usb-nop-xceiv";
 			reg = <1>;
+			#phy-cells = <0>;
 			status = "disabled";
 		};
 	};

-- 
2.55.0

