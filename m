Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792673495;
	b=Xr3fRpbjerwPf3jJ8/ISU/BBHqan6h2x8rOMHLhTncFATY5o6kflsh9m4qt8VAZ1dKyd
	 GqpVuEmOxG1Ir4BTda/04WyAnkJHgXaIs0rWtSZ9cz/2rvijUTvdH6PMIsmx19nhFcx1u
	 Dfg4cN2HbVQUcjW60olnK/UQSqQxIWtz8AlMH08p1m0VQCL2si+o9nPAi7iDqVu4QCl2U
	 irX2Oozjfqq/YRyq3geY6uixO1fuZLa85mhF5MbvKvrySbSvHTCAhUBouG80dPecmxAHF
	 4FWJmP8WUWUPcP/LH99PV7EiJO7T+q0G17ROtZdehlvogKPVtAuf7X6IN8BnhKMIZKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792673495;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=CTIydlDjwaTx3lfLxh8PmRec7L6PCrLK/369X9etdCw=;
	b=zOOetbXNluLRi0GRTMSIrgs5jWTyQYLu/HYDmyvkaxcUF74K3SSIpSGek1e+L2R+U6Xk
	 fSvZp4Pq2MpthDzUKzutovp53UE8RrI+4MeZDdsEpVwZS+SHxhuhJMHsIVzJFOMBMBwli
	 /9ME5QDkLNyd7on/07NvAXhrsMN0uK9jMrWXUuoGGivtSRsBQdbkqgdFpS5wp2KQqhFCn
	 E4N9hhPzHVczd/rHgTdnXjqIHVncktAR732UaKgLh3sq2a7Qbl2l2x5azKPKOcpODJbv+
	 B3IZjJkqupiBZt0yIgt+84rCjNuT8QKVdS74h/rzBk1snepsNz3EbaVqYt0Nxn//72A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="jwzX5/Uv";
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A104606A33D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:51:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A104606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jwzX5/Uv
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1ec92f655so10652835e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792673494; x=1793278294; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CTIydlDjwaTx3lfLxh8PmRec7L6PCrLK/369X9etdCw=;
        b=jwzX5/UvcovxAnJbfHqJ0Ou2yQqqGl+TsaNZ8fhJdJLmoSAGhNKrNiofi98bqP4d4+
         4mTtMwl4POKfRjiqmmrc40bYzcRmD1d8i7jFDwxer/Md8BI53CiretADMBhNlgcmqZ/z
         L+xV8dfU+7AztiNRX8wDODbMLW7lwRDRzwLW1z1rTt2p0SLkm4mQ3Uixu44k5my7YrrU
         d70JYW12w/hGMWGIjfLn6BokQseubSp0ro5BUqJT/7vSxTT6QYY3e+U33vfiG3St2wec
         Om/LMV62QeDOCN25880BaIwoxv8iVsGQ/bkTeoWJYU4DumO/bd7RbrvvO68ocfh2dfCZ
         G3OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792673494; x=1793278294;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CTIydlDjwaTx3lfLxh8PmRec7L6PCrLK/369X9etdCw=;
        b=M886NsMbnc6TO1Q+KWWTNfbCZxeD0kT9V4l7U05b5dG/suFIRi+yGN6BPauI8hjfm1
         F2a8nhh/UUMU8TiKYJf/ecRPGFEAyDPfZQvPX+c9PXhH9HYbihYNL5SjvwAOMvdFgB7k
         trzY8zMcR+hPz//lxNXfxvx/PJa0RnPCLgTCQYnUfJ5dX71a996fHkQEkQfvnPqoe3Du
         WAeNCzoZIeAi7aPCfiUup26pHO2ZPlr2o+I9JtfIjh0PEHSW+eNhFjePRQhd0M/2ImZr
         21vTD5fAOzcFYUvFFQ47bdXAHDfA70t/e5nU87xYDPP6swaBMzn0RlEnKNV8+epesFOI
         ZDfA==
X-Forwarded-Encrypted: i=1; AKwUvByUZxw4GNh0Zv/K7LsUJzqhR2Ck2Fa8mz20w1XLrsAZLIQ5ArpYZgMtCm0hxuOUEGFSTIfnW/jpWyl6Jxs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDatd8ZSv5zB3qGTr9dH0IWUPskXISwWu6m4wJk3NfAARgLtFE
	r/CTAJhWGbpQh9RioP7vkfVB0z+w2L1VqUEDrhO/6PHet+AU3n9nSPLm
X-Gm-Gg: AYBFou2aMwwauCUkppZf6CV/PERtx1TPKn37MklCnEBeviDy7tP8wuGYVqCHXR+PNOP
	k/+Y7k3oJFaxGm2p1Q9dkyBJjrTEkg+efKGP7PE2mBHJP7yCUkPus5Ay4b/ttvidSFEgfo/klxb
	1FLaMfQnk8BaCqTuSt1KsrPXC9DH0vNuF/NOoBRyT+bsI6ZILgG1iy5qsiWDTAidrgtWsZGWEVB
	aGZRwcAd5h2dsiK0RwwNJZefxgzuOTmE87eDJuIHSH3L8SDFYbSG5dUxFH6+wJQztjcB6Y/NUE+
	n849ABWgvzkF0tDcWmdMkGHJicNBbbXPZmz6MnCeUSvnS64eXfZXQVHNQ/VTf3KgS6ZMTiPhAqD
	zVsq6lvMOhY2cDsxeMss8x5pwP5OrYj1TbR2zpGh/u+aewxMWVSkWJ0IF2cNXL7ToGaVklax4I9
	0KS8BkcYNNHE8j44oNBXx4RNS6Y7FVxrj7tMA8OlA5h3+dxJLN9IukFTpCSfgH/bJzOBgNliX0U
	oi7wZQG42u+wszeOZWhqdEwxAkqRFJGUOFjZmDOYcVEw87c4BHRxF4HrlGkOvQH9xt8ZEm5AtxF
	wChXzHdOB9YHYLWr8+bKy9YFcx9bKe/Klmp19hPAH7TWW6HqnOIAscs=
X-Received: by 2002:a05:600c:a110:b0:4a1:7f96:9b42 with SMTP id 5b1f17b1804b1-4a204bb5994mr34273245e9.15.1792673493483;
        Thu, 22 Oct 2026 05:51:33 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203a0f243sm64112995e9.5.2026.10.22.05.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 05:51:33 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 14:51:09 +0200
Subject: [PATCH v2 5/5] arm64: dts: freescale: imx9{1,3}-lino: Add NAU8822
 Bridge Tied Load
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
Message-Id: <20261022-imx-nau8822-btl-v2-5-b4221ed43650@toradex.com>
References: <20261022-imx-nau8822-btl-v2-0-b4221ed43650@toradex.com>
In-Reply-To: <20261022-imx-nau8822-btl-v2-0-b4221ed43650@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Combine the shared NAU8822 Bridge Tied Load (BTL) overlay with the Lino
iMX91 and Lino iMX93 Development Board device trees to provide
ready-to-use DTBs.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 18d4ed73eba0..ece4fbd2a904 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -859,10 +859,12 @@ dtb-$(CONFIG_ARCH_MXC) += imx91-11x11-frdm-s.dtb
 imx91-11x11-evk-mqs-dtbs += imx91-11x11-evk.dtb imx9-mqs.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx91-11x11-evk-mqs.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-lino-verdin-dahlia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx91-lino-verdin-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-lino-verdin-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-phyboard-segin.dtb
 
 imx91-9x9-qsb-can1-dtbs += imx91-9x9-qsb.dtb imx91-9x9-qsb-can1.dtbo
+imx91-lino-verdin-dev-nau8822-btl-dtbs += imx91-lino-verdin-dev.dtb imx-tdx-nau8822-btl.dtbo
 imx91-phyboard-segin-peb-av-18-dtbs += imx91-phyboard-segin.dtb imx91-phyboard-segin-peb-av-18.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx91-9x9-qsb-can1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-phyboard-segin-peb-av-18.dtb
@@ -907,10 +909,12 @@ imx93-14x14-evk-mqs-dtbs += imx93-14x14-evk.dtb imx9-mqs.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx93-14x14-evk-mqs.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-lino-verdin-dahlia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx93-lino-verdin-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-lino-verdin-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
 
+imx93-lino-verdin-dev-nau8822-btl-dtbs += imx93-lino-verdin-dev.dtb imx-tdx-nau8822-btl.dtbo
 imx93-phyboard-nash-jtag-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-jtag.dtbo
 imx93-phyboard-nash-peb-wlbt-07-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-peb-wlbt-07.dtbo
 imx93-phyboard-nash-pwm-fan-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-pwm-fan.dtbo

-- 
2.43.0

