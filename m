Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794377458;
	b=cIvEda9mnEMahc6nW4W0cXuDp9BfGRXtSP4HEBkLcaIEAvAw+83xRpNs7WH0NYbdPWdh
	 SaQVJdIQ6TW+YV9N0qFaJjAJrEKa7xD4qMqmvojWNyW/EzyB/srF8xE7o7jyelpIH3wjZ
	 GtPlnm6lCvqvnk4Dg9fgo0n0LUNvcCjzLX9ghT06L/1D2o565F8soj3VdXj7aDVVoqMjL
	 EHk8AZhnTuun56o7KTgxhBag7aALvltovpmrNHSk1CbX1SM2SU+R6OorAu7uJ7lKvaV9R
	 D4qp7mBWo6M0iNYFvwfIH9FVMeH9EXgBLsuSkik83nxDLAO1TGzBgcY/JGi3HSyJMMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794377458;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=fK4euQL/sXyPal5+J+hrdUFIpsb4ZufsR9tCvoLGNPE=;
	b=rYlGhuxaWYGI8xl8vjf2ftk2IC4Su8FL3TUpSFJ+0bWU53B9bPnL6Yp78l4wW+OLJlPx
	 MQiWGiWFjRnBXakBB0OGHze3OmS/FmvryqTTMCHgneN7uCglRasbeSFXkADwY6jFF+9bn
	 utARIYL7d3PqY9/2h6Pa+XHH2D86qpfvQpXBBr97SdjqyLkW4dfCcqNH3cETuwMEBfFyi
	 3m4DjYsPmKFsvMRd5hwQrkKdPVJAAfXCwcKH1+0PCUVPelnTKGTCY/AaO98egMd8MWVpb
	 +WdSPm3HllV1XQl9U2T60tVoKHWGsDQhZ2XApA96KsJaV85HB1Y2owlDMf4l3OhdSkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DMXffora;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCF860A2606
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:10:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CCF860A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DMXffora
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b16896b8ceso921823a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794377457; x=1794982257; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fK4euQL/sXyPal5+J+hrdUFIpsb4ZufsR9tCvoLGNPE=;
        b=DMXfforaP70umyE3P04GZoti074NwGxMlo9cq8jyCjiDHk9VqMDQ5hBN4cf68KK4qc
         f7AYVrDUwk3X7XyxBxwOBC2RL96daNd3d5LrNoLT4siBnXYbhH7MceJakAvlK1O4c86I
         oMsWYho0nCKS0jdXLdMcKm1TyLIs3OLxdW53KmHJtbncdP+SbuEWGolgQwy51pZkga5H
         p5r6bUSM10QOjdCPC3Vv7ijFu3+Zwwzy6pLa76aT/W+ifbk7a/VENFonw8SeGFQaf0Wp
         kXh2DuiS7MkkZYnYPZ7Ab8sJRwvQlFrkvT92VwPbYLiG8KS/UtWeQ1fdIWFBDY7VxqIi
         DGRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794377457; x=1794982257;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fK4euQL/sXyPal5+J+hrdUFIpsb4ZufsR9tCvoLGNPE=;
        b=BRVRf3z+CZhVkp+sB4gmBO42zx+YhGi7q8pR0doGV+RBLCV2NipmvPLETiXhdn3eqc
         LgGw7kqJFyBab6ps/PGWO7niAvEVa5KZ5pBgSahcQFVQVMpplGGVgDbSOb3DgN3jEixX
         nhu4RKYXKDpJqUhXWJ5cfFQBnxxLG6+zqI8NeS9W54TysKk692Piaba9EhSshOnw4i36
         6Tm3PpvCbKMN0dS7095PGy73/QPoJiv1hS4RIQ4TebwnqzJ7O3q4R4reEaXahEMijHnm
         Qh1jImYIKXw/Ido6LwOaTdmRBR022FVLT0/+bbf5FDteS9XZ5n8lM2zbVx8j1yCnK6A8
         gkOg==
X-Forwarded-Encrypted: i=1; AL+hErFU3lIRvThWuHWFuo4bTuG5BnGK4EphY4Tq/gst9Frf16DUej0ALxTInunnmkHjcKw25sAnxAjDcJjjyA4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aVFgISl63fYBOFHmSzOFsd4k+9sGtFuFFu0FmqRBq0h9lRJjz
	9/gpHsdyI2VWIDfxpktuOH4NunB+PRJsOFuO46xzg3a+S+j443ab0JL/
X-Gm-Gg: AYBFou1J1CSzgXntpAuDJBhygd9NPOOE5Ew2+FFx0M7DRLCMAnOmgrURfJ+Gt7h9ppY
	/gbZP89xd33TrxpewttgfBHJkSjqic+suz/CQlq1X8eLcVPTkUA6f/Ol+M4d2DZE7Kkwnome1pI
	rxaKwJ1hXfci7OEfMP5cd5Wszy85NvzFT23p1XgvSI8soSCxGe7WpirgOF6IdvC5cc+v7jcNa2R
	wbuNCCyTo/LEDchHzy7GfLyh/P9oofXNYLVmkWLbdSYPHolpbX3KxUFzln3Ij2YuplvkXI6Rit2
	vkweehdMDx01nlcr1SqeIg5R6Jocn/NVnOg9+A0pMed83q0IwndPPs6EBrAwjpio/fbKTmkHg+p
	24Cb6tiqzbR3PFysmlKLhvZDiKw/fcq5Z4OPwQoKmEMobz+fA6PmzHum3sndZy4w/1zY2oyb0n9
	ZyinCe7+for9IkQrPbIt/YcWwPZPfeOTUXcXlKbsOHexkn+unrcMWw3pAlW5yjtuAfoNGmNunot
	0qjYeBQVXEWbg8Ppnc6+2tUWqmkkHLJxXagFEJZZfGQrEL6tesJgNwYCMGxGW+zOu4QVMu1CNcN
	LrJ3jgY8s74GRD0VbxM0hRklb8tw6Swb698JgqgF/B6l5SH9DAeN9rZr5U3VXZbLQVi0
X-Received: by 2002:a17:90b:2e46:b0:3ac:aa8d:19eb with SMTP id 98e67ed59e1d1-3b182e0f256mr1318971a91.3.1794377457428;
        Tue, 10 Nov 2026 22:10:57 -0800 (PST)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db7e8b1sm2978557a91.12.2026.11.10.22.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:10:56 -0800 (PST)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Wed, 11 Nov 2026 14:14:46 +0800
Subject: [PATCH v2 5/5] ARM: dts: aspeed: ventura2: Name the 88E1512 PHY
 reset GPIO
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
Message-Id: <20261111-ventura2-dts-update-v2-5-bce5b5dafc1f@gmail.com>
References: <20261111-ventura2-dts-update-v2-0-bce5b5dafc1f@gmail.com>
In-Reply-To: <20261111-ventura2-dts-update-v2-0-bce5b5dafc1f@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Kyle Hsieh <kylehsieh1995@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=993;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=xxMp1/Ez1x0+u4gEwcM37HZ9S+6j5lTG4LB8OtJfTVM=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBq9Af26OzcycIkzFNsHXF4FJMNd5XIH5LUASwIA
 6mD6yK5pEWJATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCavQH9gAKCRClg0K3CVbE
 gTq3B/9YCHNGgux2LFrmmQhjhNtjCf3sYPpiQCl+wbB3hl5P18p1+BE5tmoWffF8zEbIEKFp1Hv
 Muo+kaAZc6Thx/QsJRcIw9MOsWo1b1WSIBjmYzbdc3uw5wB4s3hdzNqxyZVfKShvw6+238sUSyh
 QLYHpqe7rTQJprLHTtyA9qKJ7EYSckZwx/D7VkPys1Cn3AveHyIChLsITJ/cmhKUFI6bTMTt+J/
 O1SAOCk4wMJHgCLjMaTptjyC22H+MA61k8WCHvULsm3WWZAz1zWZIOh9hdBF/tegK/YTW29XOY3
 K8jE3xCp+6coF8UfdN3+njmgO2NoCDOoUYBXeOpg5lxz76Em
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481

Line 10 of the PCA9555 at address 0x67 on I2C bus 10 drives the reset
of the Marvell 88E1512 PHY. Name it FPGA_RST_88E1512_PLD after the
schematic net so userspace can reset the PHY during network bring-up.

Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
index a5e6cc94b280..aa83233f1710 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
@@ -2486,7 +2486,7 @@ gpio@67 {
 			"FPGA_TRAY37_PWRGD_BUF_R", "FPGA_TRAY38_PWRGD_BUF_R",
 			"FPGA_TRAY39_PWRGD_BUF_R", "FPGA_TRAY40_PWRGD_BUF_R",
 			"FPGA_ISO_CARRIER_BOARD_PWR_OK", "FPGA_UART_MUX_SEL",
-			"", "",
+			"FPGA_RST_88E1512_PLD", "",
 			"", "",
 			"", "";
 	};

-- 
2.34.1

