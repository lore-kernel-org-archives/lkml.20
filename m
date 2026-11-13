Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794570152;
	b=T9OCkn6XGvAvuCAu9X/6OP9BnZJvbiG+auUSIKs3IpBLD+/pW0ElmDHQ3xLXhKbzFJBg
	 3gvEcbZ5ip8mzMt3sGRDC2761Pf/vAj8mrtqT955dcgVzOcDZ3Kwgp8aA37dasv8zii+n
	 ft0fMSoKKACuQGRwN6WKVxGku+u3+t/U0g4E+mhB6GsvYMdw71kTU/LRo40/6zTt3iddv
	 PyOwpSs6mqy8wNwxcBuOdLatlT3O66XmX2BXR2DMYFboDDNQLoRqHNw3VLzaN56qyejAE
	 ol0kSvRaf8H3+GT4BtSu9ReAra32Pp+Ps6hgsfBM4sb32NHrcpkTXlGoFPY5zUJ9ZCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794570152;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:Date:
	 Subject:Message-ID;
	bh=GkfjZtGpjcjZtys/mwSpi5hx436XAXHBdQQU3vB4joo=;
	b=V3ZjlMiIxSg03OIuIFirJHzO1BL/HcUZSxkz/4H3Vn6eYJHBoQ+jN1ptLmkB049PEGLt
	 LEqZRosdz0gMJl2Dd7NAha2nTciZtXC25n+NmwhC+e8HuViyNmAeNXT9BNoGY9c8P0f5f
	 uVJ26Xgcts9enqj39QG6KKjZ58O+U+cQ/Bh/4Je41mKxtN624WXvrbM0rxmIssnXjKMUg
	 PBV8fvs3KyGxHb49nI6ksjbZEpemQTTPdifgBGKlR2s6wEz0JXcRmrIWoDYCkQ9DJhcQQ
	 j4d7A/nZlg+7mHcUve8VUZVkMMmO39pG7Kl7/9PQYK99Hkmzel9hT9dmFpKMuPfdKeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ARHnHhdp;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B123606A33A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:42:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B123606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ARHnHhdp
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b0d0b80fb9so762240a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794570152; x=1795174952; darn=vger.kernel.org;
        h=message-id:subject:date:cc:to:from:content-transfer-encoding
         :mime-version:content-type:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GkfjZtGpjcjZtys/mwSpi5hx436XAXHBdQQU3vB4joo=;
        b=ARHnHhdpPzM4CruisRP4WClBPxlG7esqgAQ+RW6z56PxLFBu3unB/Pg32ZNhE885Vu
         6ZpPYaGiaAl6be2G/YO/zcxXsebinXNdSq6ryPHqrBW7NBpS/BCKp5N3lWYOon8p/wJ5
         Oyj8/OI/ACd+mY+XODFnheU0UiD7x6lFT+4TuZeydmwUt7oJ5cskVmoAYlXpf2M+RY1V
         0vLFcvddPsBIEwIuGmPPlLGm/K6JqK1VH/oAwklftJ4bSTuTtRZ8Y8u3iKCCBVtMbK4d
         hmMY2s79kKmc1EIQThv3cfrpRvfqzwWLAmMiY5jyE+flpaj1jPfLj8lHIQzTljhy2NKU
         s37Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794570152; x=1795174952;
        h=message-id:subject:date:cc:to:from:content-transfer-encoding
         :mime-version:content-type:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GkfjZtGpjcjZtys/mwSpi5hx436XAXHBdQQU3vB4joo=;
        b=D+DQKLECA0V30Zj6VSes/bpgCCxT9B8L50KfR3iXip5Jaizy/jWM67qfkdDYjeAfl3
         43KhP7Rgn31jpEtephWSYFN/dDLlb0orf5/yKN632+pbSU9+RkABh9prdWOt0xePSgAJ
         V6XFcyZkL0xLd+nF8OW/dPTpVMmb3E4/LarGWoOTib+r0EwCTuF1SjJ+ze7MYj8+8coV
         kLFj9ooNxc1cws2Ehc8B/3N+CE02JDmnriLymg6iKv8SpOm1TvlxGI9tfxy3QYWs99Ar
         7/mxXk1Eyz6dwGNLgH7DAPhyHArJ/IxRKvgwlKdxa/JJMS8q86B0CgnCq25fN1e186A9
         qUBg==
X-Forwarded-Encrypted: i=1; AL+hErGDuSZ4QEYb4DImiQIaKOEr0UTRo9pAVOzRgG46/aEd+wDgyDgTUAKEzk3GBZBNixzb8YW5XYrua4ijW9M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kHOCgoZk+9NzefTSnhGjUARCWcslQSXaz3x22QE6n6rWtLEEA
	33eUJNWBUcyn+NZyiXjhJ7KiMI80FUN4FJtkuXDeb7M60jq1TKtpWY83VBxgyg==
X-Gm-Gg: AYBFou0fSpV0jH/D6k/sMrOcWqH61PgyPIV+lwl/0v5wFHJXVvP9j9NWyNp0PSSUuRn
	sY9gblZtUDlZgHlBUSd9WMXk+Hhr8HV8FKfwPXHPEmuc3VD3kFf7MuRvf7A6CNrVag5b3SOLoV7
	Fe9GCg/39UeRPM8JP3SiAwUDlqWQrkf5I1MjBV9oJj+NyKTEoMkte6znxAn96iOEYuxQhlEyjrh
	SXG3hb4ebCIUVcu/mgrPYJospsvsCrV8jxxCZdCBmLOnkKrfKDZNXM0iG2N+3anKr46uo8a73Z9
	mMF1avsnCxyHeJg/a06d/ftU3MWxQuH2OUXSX7j1HAbNSLawC5qtu5xHu6YoWy7V49sbgdAq8jx
	aoV7k1P3Y6RmbibYizpAxs9tilckA1bh1vdo9cChptpfFBPrjtMiPHejpeyH09j4qWi6J5luKge
	Du912cXHPtNHopIAIp9uVe3xdOkSSHEaK7yr80oGhhol5SQSsVzdVaJo9Eps7jIZ3zKrZj2uDyW
	tz9D2CanX9nlPq9H3S13wvvtczrpsm9ROtP+q7RIiOrCz3t9cbFmfDYsqKD28ezF+saqYNuZnUe
	ggRwjKsNSNY2KD+1Leqv1Erm8uuEN7Gq/MZr5w==
X-Received: by 2002:a17:90b:2cc3:b0:3ac:8af9:4a73 with SMTP id 98e67ed59e1d1-3b1b0a0db9emr1816819a91.28.1794570151823;
        Fri, 13 Nov 2026 03:42:31 -0800 (PST)
Received: from [58.206.202.11] ([104.28.215.69])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1ae981c55sm4347234a91.1.2026.11.13.03.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:42:30 -0800 (PST)
Content-Type: text/plain; charset="us-ascii"
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Haoran Wang <haoranwangsec@gmail.com>
To: Steen.Hegelund@microchip.com, daniel.machon@microchip.com, UNGLinuxDriver@microchip.com
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 13 Nov 2026 19:42:25 +0800
Subject: [PATCH net-next] net: sparx5: check DT port reg against array size
Message-ID: <179457014579.23820.10657909253312598784@gmail.com>

From: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
Date: Fri, 13 Nov 2026 19:42:25 +0800
Subject: [PATCH net-next] net: sparx5: check DT port reg against array size

mchp_sparx5_probe() reads the 'reg' property of each ethernet-port DT
node into portno and passes it to sparx5_create_port(), which uses it
to index the fixed-size sparx5->ports[SPX5_PORTS] array:

    sparx5->ports[config->portno] = spx5_port;

The value is never validated, so a device tree with an out-of-range
'reg' value (runtime overlay, corrupted or attacker-controlled DTB,
kexec-supplied or bootloader-fixed-up DT) turns probe into an
out-of-bounds write, potentially far outside the allocation.

Add a range check while parsing and skip nodes with an invalid port
number.

Fixes: f3cad2611a77 ("net: sparx5: add hostmode with phylink support")
Signed-off-by: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
---
 drivers/net/ethernet/microchip/sparx5/sparx5_main.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
index 08a398adf121..6616e76bd0e3 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
@@ -845,6 +845,11 @@ static int mchp_sparx5_probe(struct platform_device *pdev)
 			dev_err(sparx5->dev, "port reg property error\n");
 			continue;
 		}
+		if (portno >= SPX5_PORTS) {
+			dev_err(sparx5->dev, "port %u: reg out of range\n",
+				portno);
+			continue;
+		}
 		config = &configs[idx];
 		conf = &config->conf;
 		conf->speed = SPEED_UNKNOWN;
--
2.43.0
