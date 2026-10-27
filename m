Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793132563;
	b=W45bjzX/ZOcNfOF/MilGH+U9OXjvQGbeONHKGNWTBpPag4qLi2POi4MTTBFw3CkvSArj
	 69hxyDuzrBIccAdH8gbFRgfJd5VX8+BcknGIBNxrPhAuv313XvRMYgAsMbujdfwwS0g7c
	 BZ++1heeqFZyxEGxpnkaGFlvODEg1zpW6dUzFL5JyFO8i1LCAvMtYU+rxioQy7rZ+TWll
	 A+35T0bLfyIWCMEuw66DINBLfoIw42lsgO7h1S3Ba4pkkpQZOfbjOGyk+o+tRzRDU1t8f
	 DaNGFUQKff4x+cFL4g3cpG4s0jrZ3CwDOTcsn0Vxz6VOVFOftaGirFpynHI8r1Q3oeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793132563;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=ck+4woNz9CpLu2b06cLmv8mjKj5XuRT43XbS2D6B5Z4=;
	b=YTzHlSEXCYOqzmgJu7mg2ApC0qXkcN7A8RVDN/MncnkndeQDP19VKIBnvN6pl2QPlxtj
	 MRn3tFsCmg5YDkM5E/uhaFiyd34hLtpDl188mIadYQOPDmkfZ7xlOHzjL5AWQcSbsAWgd
	 9YCZShM6fzPViYZyPgmFmhB/qIbaIOBDN8uDhgaZMUjUA5+HZyFnkz10OBD9XPhGJicvA
	 rvTiG0fVF5/3gdmf7ybs/fK7q8PoKBwvIURQ1ZIVNNcVatWmahZS4rxem6OpIASPL8nyz
	 4MTA0Q2XYLOlGN8ObTiBTYpgxJE/Nmo0MId7OLP/gpK1I2h+UWD5YIA/WtD6wcZ4y6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="hShE/HIs";
	arc=none smtp.remote-ip=209.85.215.228
Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26C860A3808
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 20:22:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A26C860A3808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=hShE/HIs
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-cd5c9e52398so193788a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:22:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793132562; x=1793737362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ck+4woNz9CpLu2b06cLmv8mjKj5XuRT43XbS2D6B5Z4=;
        b=iT7azebyXK06QKvZrty7sLLCxVcJTnWvc4ShC6yRY72TYWKpZdYViKMAzIrI9AWOo/
         anMMPNYOdGiSsEIaDoWd5gb+rxxzKUTlQ1AUDz/le0+przdouR0oy63s9g5n7wGR/inC
         TmtJh+ZFJQ77B94KBEgwyaWVBu8u5igUrrbOfFixMv5SKFLdNWc8z+iPP8MIJan1+RBb
         J0JSaOyj5qZmF3v9pEmtuDkZksGhg9MKXEEz+l00g37ex8Vq33p1U4xUU2t+kgWuDnwf
         kHuM5gzwHiOkd+hPrU/cItbQEzAi+UnfEd4Ea1JfhAfnniWkEjBCMfB7V4P7xq/e6/IX
         Pg/Q==
X-Forwarded-Encrypted: i=1; AKwUvBxi/Xu81K739FSL0LLdiin/MmN7X2eDp7WuQpEryxPErgp9JdSnDYTACfzPRzEvOsBq9RvX9iuYRIOkixA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIY1epjr0RirJpZlE2X56S3nog8eOdECFVBeH7jl4r1OHUuwUug
	fpRDmHq3jHOqDgVZIJVUID/EPj6c0r7dW0g/RhNYQRgr6WwIYOMgchYtAFHzZYvG3rEFAwCVsF8
	0cWKtIjPhAKij3FgJFRCttUyUy6f2G3sdHCHgTRyuqOZrf1hNU/3snHD648KTw7oIpHlGx6zWol
	Fvsx0SZh8P5m53mAG1Aw9Z3da+I234CuH9eS/JCK9rSrkBetn8FFq+SYesdGOBVe7zN4bV7L1sy
	oytZMlo/x6w6qLQ+MJ/sAWaMXo=
X-Gm-Gg: AYBFou2iRgXEZ7ScS3uuITRzpRuhMqMUIgm2r8v97L2DrrA+DybH94cI09/IXLGi9Pa
	9rlfI/YITbMK6hzFEXIsZx6O1PtBsW8h78ceoanaJDGDo9yljdSDLI5hFKnHdl25I96yZ37aStb
	vMusNHiPYnbgn4DGtgkVY3k7ztH1gWEqjSbazrXCNTNuSy9pu4YWDgJ+qTZhpxTVfaAzbSG+Rv0
	l/a+ytZ8YuI8RvOnIMe/WcDO812ZVe4XOOlcn9OY4ICgPtR3Giry6+0vAO7MBAkNM6NEQ45P8gV
	TLXa1g5KZPN5ca+U1mffOVrB1RV+RaDGDjJmO/xH+ynkftnfQnnhVxkWZOCODLPcQHa4y1FEdmF
	yssPL+uaLoB2msCNeZdAH+tH++24Ea7DyTGkHrWkDNCe1qXDjeQUCya5Wy4lZB0GdKJpghV4lM2
	gYgKtnjlq1jvnGtgeXNyIBJ6Z2W6wddisae0DMOYkU
X-Received: by 2002:a17:90b:5110:b0:3ad:c482:ae9a with SMTP id 98e67ed59e1d1-3ae57e2ed70mr159896a91.1.1793132561869;
        Tue, 27 Oct 2026 13:22:41 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-23.dlp.protect.broadcom.com. [144.49.247.23])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-cd8ccce9fd7sm149021a12.24.2026.10.27.13.22.40
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2026 13:22:41 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d5dbso240284a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793132559; x=1793737359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ck+4woNz9CpLu2b06cLmv8mjKj5XuRT43XbS2D6B5Z4=;
        b=hShE/HIs4/5x1plGH2KlK5NsweHXOon2FHshQAEap5SgyxNshxOsjjJCEWLC9sOm/k
         IYrKv3w9WOcT5Hv06MAn20O8LroTI8TO2h8nmfhnnXG5qeqiiqdWYW2KHW+Kc8nBVm6m
         An7JAa/1QMmjMHXW6E9i6CFlEdfciSyaBUdGU=
X-Forwarded-Encrypted: i=1; AKwUvBy8yQ8Xzpvzn//zRdKx04xrc1iEvj5GaMnBkDhQWzegbPzmvEdOlI7DY/+0IJ0NZRA84FB/MnMnd8NWVv4=@vger.kernel.org
X-Received: by 2002:a17:90b:2fcd:b0:3ab:189b:6980 with SMTP id 98e67ed59e1d1-3ae5824457cmr114017a91.39.1793132558946;
        Tue, 27 Oct 2026 13:22:38 -0700 (PDT)
X-Received: by 2002:a17:90b:2fcd:b0:3ab:189b:6980 with SMTP id 98e67ed59e1d1-3ae5824457cmr113997a91.39.1793132558504;
        Tue, 27 Oct 2026 13:22:38 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae55d1650csm275486a91.1.2026.10.27.13.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 13:22:37 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net 1/5] net: dsa: b53: initialize the jumbo frame size register offset
Date: Tue, 27 Oct 2026 13:22:26 -0700
Message-ID: <20261027202230.3539646-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027202230.3539646-1-florian.fainelli@broadcom.com>
References: <20261027202230.3539646-1-florian.fainelli@broadcom.com>
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

The chip data specifies both the jumbo port mask and frame size register
offsets, but b53_switch_init() only copies the former into the device.
Since the device is zero-initialized, b53_set_jumbo() writes the frame
size to offset zero instead of the chip-specific size register at 0x05
or 0x08.

Copy jumbo_size_reg from the chip data along with jumbo_pm_reg so frame
size updates reach the intended register.

Fixes: 967dd82ffc52 ("net: dsa: b53: Add support for Broadcom RoboSwitch")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/dsa/b53/b53_common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index 0880310c9ce3..559d4b360c82 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -3109,6 +3109,7 @@ static int b53_switch_init(struct b53_device *dev)
 			dev->vta_regs[1] = chip->vta_regs[1];
 			dev->vta_regs[2] = chip->vta_regs[2];
 			dev->jumbo_pm_reg = chip->jumbo_pm_reg;
+			dev->jumbo_size_reg = chip->jumbo_size_reg;
 			dev->imp_port = chip->imp_port;
 			dev->num_vlans = chip->vlans;
 			dev->num_arl_bins = chip->arl_bins;
-- 
2.53.0

