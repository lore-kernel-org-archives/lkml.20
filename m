Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803584F93D6
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791896281; cv=none; b=H3o9RUG6mTRrWWBTneIqOuyr6e1SBy/fSm6K28w2ZMZsfpkpvAbrFfmH7tGxmKLQ3mFrjXatj0a3U5Pxkz/fv80r24ctuMwNKJaz92xb/2MpDpOFk6el67wjF0a+XT0W2PX/DQNLIxCiuAS5qVw3XBTktHNOydUNCzN4c5g3HPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791896281; c=relaxed/simple;
	bh=+oi137C5v8lhZ9D/rjwYIKeb/nW7GuQAEUI5HDYvogI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nnfKJbvg39O52a+vjTwwYbg5j4bHs92QDEQ0T6ze0PZtg7mIljA3eJ+KZSLJT3GsEe+3qmypUvfPlRwm0wqQoEB9ih181TaW73uwGmgkbLXgGVG//M/E7VMkKpv/18/LT5oj3JczNblUQmqypORZI5HJViSi6MzwQ0QBjpeX5HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=sYWalRoB; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="sYWalRoB"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c2e4df2e26fso385921966b.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1791896278; x=1792501078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uKoZOiY22/hh2HRABqFxwdun7S2utwDjGnieV/Qjm4Q=;
        b=sYWalRoBeFGMvTE3WHoK+RNVkaAHq2TEOz+F4n0Frm7Up/Z0EwSvvjO6gx3GqDn9FS
         fuy7MmDxrwi9OXXtSDCZMLRLc7/1ca0HVfWPyf78FBJ97l5pxilTiA4IX2+4C1AO67CT
         qyS0wdxYmZoSEzufJb+KAP247vDnmkFhime/dlqiS18OtW5vJB4qHYSEvGSIcv2LK8Y4
         qh7YyZ3i2ct3ys0OeWyNINnSQrv6TcmgfnbzoiaBBoshC6P1Ydoj426LZCyiR2Uv0W9z
         43eklAvPBpTo7UgEMAQpBAXegl86GV48B/01L/t+u/0ikFUfqikvNC/js9a4Vns/+hvx
         nxDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791896278; x=1792501078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uKoZOiY22/hh2HRABqFxwdun7S2utwDjGnieV/Qjm4Q=;
        b=O8NvJrJbICfMBdqhqcm56ioc2vSzCXK80oMu/ciT9a26cNHKSz2PoD2h3DOATmlCY1
         ElUj3gDELWn98k2sfb3m4gcLm7+HcqnB9iHH25+TSi0Ds8K1/qLYu82hO577YxiUADoJ
         7aF3ljzdT/FGWTtxTGxaZBuzlIZOcTE8GBOOSaSrPwqANKrhDUpZ3pdKD3+ZTg+vu1Re
         B6/wUvi1OVoGqY6DUNUwcf1A+8SXcJJ8OHIKU9cD3JCxUNTXigGvI0Z11BkPxc5zowMq
         obtt1U2+gDO8yJBs1q2UbZD2BdgqySs4FFS+S/MDQsz97wWXpATS/2K5SSmj9iKwCGTh
         6j3w==
X-Forwarded-Encrypted: i=1; AKwUvBzzYHnpseuoW6Wx74JYeXZb4r3Dwrhf7uoX+PvzZlbCozsl1S67PXcn6EIi0aNmlIxg3xVXWP+A51P5kMo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJTVLJBoZnKRR9sIOtu0hRLb9upYJtc+ApJ+6w0LfgkJrG0K4RY
	+NxqewQKgDgUJjtkyTRqw7ozn5/9kUxL24vE4cxDGhxbct3Lmu4fdt3vtwEJwKFjN+k=
X-Gm-Gg: AYBFou11X1CmbEFWds5RDYSw1+WEEYTR2ez7yTAlJkFkZvJBurM8Oyxq2/d3CNpR/PJ
	Ue2V86MFhjLLAPphx1063AmVE0tRDjKz0+1HsH8nr/NCm5vzHl/T5z9PAg9oNFPvXi+1CDlT7jj
	urH+LpIq7EJ+/4LaVbUsEVHAmDgN26WV9+j66WnRoMGujmuZn6JWTNZQh5czi7b17RvJi01xbLV
	woMM8riKFu/L5NR6Ft6DadYxH8sb8a5ea22H38uGT6f8T63aw12yu4IPrrmwOWgHCg1q76XyWPU
	0jRYuGRcie5ngHNmjB5Ey2lNwANrZphoSNzozLUPm6oUTbp1R5zsE662VGLd+2h9aYrl7Xfr6Ga
	JL6hs7pfEqIU2l/yF9SUct4gi9505Uq5mHDDFP2KvddhyeGaqatK6z+zMofiXzpCMi7Co8HMnUS
	WeeLDOLcXRDuyd1U8h4O48g6eVOBrJltz1gX2TcD8ds90UP24Sg4RlTbJpRZSoCgTnpEjsmJX1E
	Kq+XVmhoGhRSglyy3UkE6ihuYNioqKihLJ8ES2g8gJ8hVaHlODVnM/q0/gGS0d6611dOY4UVcP6
	zUti7outosVrYUjIuVKR7X4HkNDysIY=
X-Received: by 2002:a17:907:8692:b0:c2e:2720:8f68 with SMTP id a640c23a62f3a-c31aa01b41fmr1097966566b.46.1791896278346;
        Tue, 13 Oct 2026 05:57:58 -0700 (PDT)
Received: from threadripper-fedora-workstation (d-zg2-045.globalnet.hr. [213.149.37.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ac9ecfsm605985766b.74.2026.10.13.05.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 05:57:57 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	lars.povlsen@microchip.com,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 6/6] arm64: dts: microchip: lan969x: add fan controller
Date: Tue, 13 Oct 2026 14:56:30 +0200
Message-ID: <20261013125735.1542349-6-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013125735.1542349-1-robert.marko@sartura.hr>
References: <20261013125735.1542349-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LAN969x provides a PWM fan output and tachometer input in the DEVCPU_GCB
target. Add the fan controller register region to the hardware-monitor
node and use the combined LAN969x hwmon compatible. Declare two PWM cells
for the period and standard polarity flags.

Board-specific fan configuration and pin routing remain in the individual
board device trees.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 arch/arm64/boot/dts/microchip/lan9691.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/microchip/lan9691.dtsi b/arch/arm64/boot/dts/microchip/lan9691.dtsi
index 52c22dd1a15d5..cf98b35912245 100644
--- a/arch/arm64/boot/dts/microchip/lan9691.dtsi
+++ b/arch/arm64/boot/dts/microchip/lan9691.dtsi
@@ -523,9 +523,11 @@ sgpio_out: gpio@1 {
 		};
 
 		tmon: hwmon@e2020100 {
-			compatible = "microchip,lan9691-temp", "microchip,sparx5-temp";
-			reg = <0xe2020100 0xc>;
+			compatible = "microchip,lan9691-hwmon", "microchip,sparx5-temp";
+			reg = <0xe2020100 0xc>, <0xe2010348 0xc>;
+			reg-names = "temp", "fan";
 			clocks = <&fx100_clk>;
+			#pwm-cells = <2>;
 			#thermal-sensor-cells = <0>;
 		};
 
-- 
2.56.0

