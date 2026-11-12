Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794468600;
	b=3EDm0V2MSqtn06CO5fwLVyNd/yBxJ75FnpCVToQr2jcqdCCn4Uh/yanRpmKwmghm5W1V
	 arFB2ZElx2vFOuysZbmV0eUdSSvO5D2H4u5iSKvWcdOZiBO3J1paVERPcFoMvuBZxi5/0
	 FjHsESXJTR5BDWRuy60lW90trK5aehjjcVKh/TTAQawVGY9HR/hkfPBqWnP15kK6R4ful
	 xOz8VObz2AmdrKQR9KopuJDuUi1CJipU63PAgFIQJocNBoK6BrlHKruxucJwZPcwLGi1Q
	 36olqWHAwhNwGHvJ8YWIw8U1dMloL3K/UbPvvDOmlRZOQ4wRgsk6k7DlPvZg0OZyC8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794468600;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DcZmLUJAwAjqfM/zYxpWQX8wFxBZvk+yTA7YYt7ARWc=;
	b=nmP70UNBYXEV/EZhE9hEWN0Q8Sc3gAOEOqjnURq5zq5Ue7dChvz1E0biUSiymYLoQJ37
	 6iXh0tlCKPWQ21ZaBM30f/QfkwtuVj/W6rhS33De6CEfMCnaSOhdxH422KY6TSUQrLBh1
	 MUnMYJv/XSGFw1nSD8mLdRfMHZTWqsIp0YUQM3MVNckMxRugeuUSxRJvwyMUEavbDBSyz
	 4I9OQ8wrbJfA+nb8fYP1zleYY2qKNhoVLkfrrcgYqc20398p/8OhSIxGAV05Bz5kL4gaL
	 zqmyyRfxCBFi+g6nds4KjABJJf1S6WZMMipUsP2TRNlPi85k4zJyk+ciRRMneJ9uHIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OfJ1j1S5;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7787E606A8AA
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:30:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7787E606A8AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OfJ1j1S5
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4b467581b98so36047185e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794468599; x=1795073399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DcZmLUJAwAjqfM/zYxpWQX8wFxBZvk+yTA7YYt7ARWc=;
        b=OfJ1j1S5+BgvVBAETT8hfBLxfRr4RV0PmCTZRMaJ2dAvq1oXrUGQlaZ5U58E71Ybjg
         93NfzP1c+pgdXugcq6Jwu4XhVvXb2ERf2rM+Z8n0R5NcHthV6W7902DzAniUaf9ukoAs
         7Kx/WTwkiHVtAwXqAkclbwtSUD7CeNvD1gMmlw5OvKplNi0LEghjqeVGSbV8F3Q4oFXy
         JFCX0yCZBz5TQaqgDXWQRvHsurCFjvrtSEZZFBN2i1btWoC1o5lz5J7+xdT13MNIiae4
         PXd1XYQbwkVkMYqbIpYKMacOodu/6SFbE25fSiK3kTp0ok54k/qcA6UDmeqwm5vJf4Kl
         KYWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794468599; x=1795073399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DcZmLUJAwAjqfM/zYxpWQX8wFxBZvk+yTA7YYt7ARWc=;
        b=OawLykL8QnTwrQ9VdAajmzCxGNwxFlva7XtiXpASwD0AjwSo3uXjw+IVcs+ftlXw+a
         sxXYQ443EqTC6gEKMP0ngLmhyFuTY1m4bf6K+tLdzshWGmUtmCWFh1XFi0SbgaPWVxdQ
         ofDBOMp1GY7nB3XLHU/D1EasL4jxew0sM0CzK/nt2jHDknuGtvKb01syvhHiiVG9LcNl
         XFJMcXImnFlUjtU9RK8RDTPUnsvaxlT8Hz5nP6C3IHUQyagyTvPaXo5KZv20Z8ZQ2EC5
         7hu9o0w730ltGFlEmxj1L3JYAfWrUJepRlxMVX6nNvy3oYqVjCiuBsll+3yLycBBGNnt
         juTA==
X-Forwarded-Encrypted: i=1; AL+hErFFzOgixz13OMv+EWaqfZU7w9nsFHekIfuGWr51fkSj9FApjHSQ8aCL0CM16FIZbKcrYBkWaYw17/AwQoQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8exnj3xeudpWEQKVsz9rV26YCQhZmYkgd2i0iqHrnbOLttnV7m
	8nIlTcyuvZvTbNyI0D6cAt8iu+T20L0Wuiswe2ESLxWGv69T2PUU1e+i
X-Gm-Gg: AYBFou1qojh3iD4Hmwn+XnXi03i8fHW5zKQ53jyKgJI3S6IkKolBsAWkFcNhkxZhdXH
	qPkgVA4xeEOI0nkCCrgXWnD/7KFDCr09URWY48X91wRj+p9E4LPnjQYr1iwP5J1qMjPNs6NzHS0
	9/pTqBKMjp4mVSjEswba73DszcR+9nTxhTeWM1KSiAQ3N9QOKKOmZI0ihJ6/3/hwtZojXL0lW7Y
	jfGBlKF+GHhloRzPnvsmvD7+IcCKMrpBd2lUtIa5p/U8jr8Fu/fK4KVyWh1bxwe+sHp3sGyU6LT
	1b8k+Ov6Y9liFIFlP/p21R9LW4H68OBP/VjKBtc/C0ffdqMu9WZoA0sc1igQAZsMovx49r+WH7O
	NOp8GCsKRkbsGMyThvlg7sbNf7JNn+JhVFcMBUqTBXedGG+8EsKgn2M+/F/R3ndlnEw+Ym6yo04
	A466Jbp7d6xw7Rmx9HKIE0S5SxNPTG1pVvixahPK1wnPLQZqNGJXVDAbt/MSqOwtnj7P071yreX
	zRWtG+MUcgBNQsJ+ETgRga62/rOniv2cTvlYZW1qbn6lZ47GX/HLIJFKVVYBvtmCqI2N++P1lwB
	NNMeNty6iMPbKkSQJcM2u3/U3lkNY6Y0IWI=
X-Received: by 2002:a05:600c:5251:b0:4a1:e250:b191 with SMTP id 5b1f17b1804b1-4ba09392980mr80173815e9.17.1794468598725;
        Wed, 11 Nov 2026 23:29:58 -0800 (PST)
Received: from dev.Default ([86.127.229.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0951bf2asm81897575e9.4.2026.11.11.23.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:29:56 -0800 (PST)
From: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] ARM: l2c: honour status = "disabled" on the L2 cache node
Date: Thu, 12 Nov 2026 08:29:53 +0100
Message-Id: <20261112072953.989664-3-isasmendi.agus@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20261112072953.989664-1-isasmendi.agus@gmail.com>
References: <20261112072953.989664-1-isasmendi.agus@gmail.com>
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

l2x0_of_init() looks the L2 cache node up by compatible and enables the
cache whatever its status property says, so a device tree cannot keep
the L2 cache off.

On the ZTE ZX279128S (dual Cortex-A9, L2C-310 r3p3) a PCIe read on one
CPU deadlocks against an L2C-310 line operation by physical address or a
Cache Sync on the other CPU, and the board hangs within seconds of WiFi
traffic.  Running with the L2 cache off avoids the deadlock, so a board
needs a way to say so.

Honour the status property, as the newer cache controller drivers
already do (drivers/cache/ax45mp_cache.c, starfive_starlink_cache.c):
leave a disabled node alone.  The firmware is responsible for leaving
the cache disabled in that case; the kernel does not check.  No in-tree
L2 cache node is disabled, so nothing changes for existing device trees.

Tested on the ZTE ZXHN H3600: with the node disabled the cache stays
off and the system runs normally; with it enabled the cache comes up as
before.

Assisted-by: LLM
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
---
 arch/arm/mm/cache-l2x0.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/mm/cache-l2x0.c b/arch/arm/mm/cache-l2x0.c
index 470867160076..5d6a4c040a50 100644
--- a/arch/arm/mm/cache-l2x0.c
+++ b/arch/arm/mm/cache-l2x0.c
@@ -1772,6 +1772,11 @@ int __init l2x0_of_init(u32 aux_val, u32 aux_mask)
 	if (!np)
 		return -ENODEV;
 
+	if (!of_device_is_available(np)) {
+		pr_info("L2C: disabled by the device tree\n");
+		return -ENODEV;
+	}
+
 	if (of_address_to_resource(np, 0, &res))
 		return -ENODEV;
 
-- 
2.30.2

