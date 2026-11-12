Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794505906;
	b=bwdiNEZ0TymJCz6bRrsrebcfQV0MLx60iOlF/UlD9tvjAZTf0SmWRVvGNoIGVo3Q+Pi4
	 k7Pq1JDXi/zGQK/nXeC27+nrAeyOAfPqsSYvcFa+orBBIMtWqlOPV5VYdduwPCRTXBOGd
	 gpCCLgvpg8u/X6x5TTyY1kH3upX55epVTvSJQvD6Z0MvEi1UdDu1w46QoXpqgsvG1UsN8
	 +CatGF45gWX0a3f60H9JKxaCet70S8aC3SdHMb3L8ENySzK3b5INhNGDTgN7711BegNlH
	 TpQqwxh7j6OCZnzDHPoajce0JPR2LEWAcBtt1sDnaJFkt6xCK74ck87j02CwDTnTLbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794505906;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=G84wSK0nUUfLUVTY4c0GD6hajZc/iWKJjasXJCCFPjQ=;
	b=Zr93dkbED74Kuh6wGHqvhNU7br2jWVhk5BFGI1kqfI4FMFpVyoSF1JUIH8ytaMi8ykee
	 ZzT8grN6+5fkjZiDh3hJAh5WiS8LOz1P/aqGJqHNcpKNG64ppYFyG5Aqcnu3dNeMJtbAV
	 dyJHz/pJAlP5/fsdRq+wVZtsBEZ7L7ycCP7CILl5ktxIfdShiP89EP4MzX35Da4Oacwk6
	 1g1bC64q3arPQ65D/ERKfkDgLw+nUvX4nNANExFK+uhmT9WPm6RU1KqlJ9/ob+qzvjXpj
	 KCyCF7Mfdl0u4Ea6iYCueLIBC0bhIhqzK8HEm3AVUVFhmyNdTIZ3PXmJVQJ799vToxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FuMkdfEd;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE4A606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:51:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AE4A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FuMkdfEd
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-37123334649so16262eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794505904; x=1795110704; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G84wSK0nUUfLUVTY4c0GD6hajZc/iWKJjasXJCCFPjQ=;
        b=FuMkdfEdlT1P3ev4PXKojTkMlNnor+zR4f51g4QXzaiybAr3MJuD2VEwcHXwMRzkpB
         IpPNuAoLeKgkVngpP8BEayNI11G07++miWdVFE92eJONoz33xhxqDcUv3CLM6a4rumGU
         23Bwj13+8MvpX4SA4s/gw8Arg8rxYUQIOb2PcxkpVmzEEM/I16PEmkUiD7qKtbuFt1Gc
         TkDg6PwMExUNpMY84GPEXCTyT059IZL+OSHLHm33wKWRK368ltivq7eoqGhWYm07dMsd
         1xiR/FwcP8m9+c96Hc1IGnNpAg3ieVFKT7S2zUSccoYVmYWoYHh3eG4J3BcJ44lP7dZf
         1Epg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794505904; x=1795110704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G84wSK0nUUfLUVTY4c0GD6hajZc/iWKJjasXJCCFPjQ=;
        b=MB+U6j6FGLEeOU6/dRrjFdxxU/hZ0YQlHVIgeqewR/U5z+OAHdwX/ASPxla+UN7hZc
         /kkyYF4W0NizWgFsieOsBerT7KIGHh/Bd/dz/6l+5dfETT4o7LNs/6LBIvkmDfsD7zYk
         hRWnuSyZLieDvht7Kj1azgo9IVkTgGXY8QR8XfZ00lq+G/ojaXZ2V0MGo/aXOTPpiCRa
         6uA+F/cj3pAPFmcoVfnE9uuf2adR0yKt7GRCclGxTyoQQ13+ziC0iV2QUI9ut2EbCOJa
         k1YwYjhoE7t+nMdMCvbdTgajGsc8qzEKRk0BvH2jzz0S57UUAV14f9vMdGQ6biTBruLx
         yySA==
X-Forwarded-Encrypted: i=1; AL+hErEDquPcbauaXq74Q+sLQlJSG1zuvXtJab6DuEkjwgaLYW5POXBqSpOM25wqhd9EXeVDKjB7Q6eVYRj71gk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GISt8mbdccKv8MsQQX+NTrhIdltx8xnJZRo3uUqUYKVk2f15m
	Z9oKSMduGFiAVU+NLS1DNFmr6TaRIweFvv0gmDDV7nYuznlCHSpyyI/2
X-Gm-Gg: AYBFou2KeZxmfNtHJOf0ELjKCnEKdamFOe7xT7lBY043PbkyPHbTGw1h7t+1DgR6yUF
	hzXop2F1H7yR7qnIBfka3GxKziEEkue3joXPwiZlkVwKovAXtTWnVPBkf0MUE+zOXjWTMS4v9Bm
	xtYC/ltZZ3uGhFxQ3iUde1MjfmMlVGpP1DP7q2ZmtQ8A+hLmOKzV4+N3Os6MitT+KT9r/B4hXuC
	RTxHuZeWuuc05FF22MYniweaxsNv7L6d/W6/xXoSY8OIR4ezcKSTRCLuFQ5WkVFxUmQpUJE3zCq
	nTJhFmt8sxA8WxPV/ep0GJlik2trlcpv9tdGS4HUZz4TzKiS8tTztZaD5R4vuulJghn/7iqY+/x
	WbW7JuwBEsq5X7K5rkKQmpfs0+xJqDQHUWzYLdUxc0ZH4dFhKQ9+JVr/mrfOdjx+6sMhcKhfB9O
	cy5Evh4EGTFn2lRBwUFt52fS5erfFIfqIe8kfeq+X6sv8jNa7C7CQwHEMhk/VlYagBKShrFUnx5
	yGFRtPQI4nCrkGkwX4ltD165HXEb2ElCqBt8+BjHlXqbqdQou44UbeuKRwavkpA0/DXXONXBBsb
	gAZiBz1xopomj8peqjsqWWgBOVvzExRxawjbSA==
X-Received: by 2002:a05:693c:26c5:b0:35e:d21c:f33e with SMTP id 5a478bee46e88-3768460b9dbmr8682787eec.1.1794505904425;
        Thu, 12 Nov 2026 09:51:44 -0800 (PST)
Received: from [192.168.1.4] ([2401:4900:881d:321d:eb39:71d3:15f6:5fe0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm237865eec.21.2026.11.12.09.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:51:43 -0800 (PST)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Thu, 12 Nov 2026 23:21:21 +0530
Subject: [PATCH v3 1/3] ARM: dts: omap36xx: Add unit address to ABB
 regulator node
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
Message-Id: <20261112-ti-l3-noc-v3-1-7281b1af8030@gmail.com>
References: <20261112-ti-l3-noc-v3-0-7281b1af8030@gmail.com>
In-Reply-To: <20261112-ti-l3-noc-v3-0-7281b1af8030@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Santosh Shilimkar <santosh.shilimkar@ti.com>, 
 Sricharan R <r.sricharan@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com, linux-omap@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794505884; l=884;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=mRJd2FscObSZq+5xKtM7LxfhPVQc620l8Gz6i2pWC0w=;
 b=73oBRMlA0aezchojrsi8CDd4YUWZTmGd3KfiThi3FVMNXut3eaeP4Vpx7Iiqnm8AEN+HkOgzQ
 z3fo53GUh2uA7OlcdF3z/Tp27siGOYFxTa3YVcqCwgICd1lne2/bdsO
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

The ti,abb-v1 node abb_mpu_iva has a reg property but no unit address,
which violates the devicetree rule that the unit address must match
the first reg entry.

Add unit address to the ABB node in omap3.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 arch/arm/boot/dts/ti/omap/omap36xx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/omap36xx.dtsi b/arch/arm/boot/dts/ti/omap/omap36xx.dtsi
index c217094b50abc..6df66eb7e7eeb 100644
--- a/arch/arm/boot/dts/ti/omap/omap36xx.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap36xx.dtsi
@@ -92,7 +92,7 @@ uart4: serial@49042000 {
 			clock-frequency = <48000000>;
 		};
 
-		abb_mpu_iva: regulator-abb-mpu {
+		abb_mpu_iva: regulator-abb-mpu@483072f0 {
 			compatible = "ti,abb-v1";
 			regulator-name = "abb_mpu_iva";
 			#address-cells = <0>;

-- 
2.56.0

