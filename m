Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794177597;
	b=KZS52N30DY4wQNEZOFSfAbF7CMFwoapFIwZgfZ2CoWIpLParRhqL8UpYUR7NOMJuv0m9
	 llxsWJ1V0/Y9dcSdDSu9hMglhtXaeviTCcw0OtCfSukn3le5Wi9FEAMCEnu6Cxy91L5Dq
	 m83h6dpnigtT/huPHv46AMjDw29XQiUODql/5S+dUcuZcJukdXxT1rVoWMO6Bkl4Xmoe/
	 1Qg24mKIXn5WHI3k3TAXMYES4IGhnF9fmTLZR4a4snVbyBun2PK5OIzMfanC+Gtxg4lmk
	 rF7ExaENK8HKtF4fyKE7eM6Z5zXTMaLWuHhpt/JVA+k7Hjt31xlnlTZcdPGN/1Do/5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794177597;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=B8yjlxqiZsnHs1InT2MGi8hOJCH6xDuUcZ/rw+mTA3g=;
	b=c0ro0gCoQNE390InPD9Jr42tYDrUlKQK8Yddi7QsvQZDv/Sc7KTumnS6FLinCCW3/0sV
	 hAyq8rQhJX6lT6EI6jfO//QbSTKXdM2+dlMCMmhW8OYJVF1AHEUPQtwg26usMZIThL23k
	 T+NQbHAgDcR7ilf865R9/e6mAXCzsc+pbr+nfgUHVwuSZk1G1w4YVVgbtuaaQqkTs9jQx
	 vmeIOrRXlrZkrUPt6LTUXNpiWSTMtaCY6LUkUVpC8HfNvmqc/4A90k/zvofqtIDEDV9DD
	 do1nPGE5W70ZBueV4Ic3N2TU59fIJCHOx9SPQXeXhAAk1BVCDDdfnDF+ySxq8t7TFGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AIcDVyCM;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B743B606D80A
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 22:39:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B743B606D80A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AIcDVyCM
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6dd7070699eso180530eaf.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 14:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794177596; x=1794782396; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=B8yjlxqiZsnHs1InT2MGi8hOJCH6xDuUcZ/rw+mTA3g=;
        b=AIcDVyCMD4CMxZQaALEvvx7PHNLdDnl+kXVVYfmq/I2jnUrb2mMfudBA3TBcN7PymD
         xbhmNc49SQSDHiokqZpi4iN/TdzinttT3dCdu2GG3aku/hLxXW/86Fm72uI6kee7WYzA
         Omio9YsTtGfikq5cLF2BxQw3kkQMIqZsHC2hPdstNvE4dlnA1Uj3ww5EsD7phhmnd/Rx
         W+A2Fp0vgpbXutWhNh/jytiRRnx+S5YrQ3ypfirDhpoBXtTRq/2jdNZWJvmyiZ/uexuQ
         ZPzIjiLX/xF9dqRU37AeBXS5y59tRXu25jSTDU9Nsd04r0ytnPXcXQxpAdzTu2/jUAOf
         K+7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794177596; x=1794782396;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=B8yjlxqiZsnHs1InT2MGi8hOJCH6xDuUcZ/rw+mTA3g=;
        b=hFLoRqDa/PLwqrwencjNgJSI6Wtv4mvHaX9orBnEdvWHDWbX0q/ueJ8NtXl3LVEdVv
         Kil9fYCOpD1T7iDnvCtaklclPWMWsQMbvCGA6N/8cQum27R39MFhut5NU7YMruXce/b8
         TsGV2wqmLgVYNpL4YjsYM2wf02F8tf9ENUqE1S9jGu2VZ+e8Gx4iAG/TAu073uCIg9oO
         j7iIBUyevC/ZPnQBvPxzfatka3p9oRkkGRe1w/m8ubjsgQ6iHJBj1pvjBVkTivqNRCUL
         vkPJXEmbY2ZzqOqv7F1XFP+BrA380Jfx6xuxM992iUyHgADPKy0lmvsYqwGLtEWjxT0R
         LXdw==
X-Forwarded-Encrypted: i=1; AL+hErGPW222Z45as4dUCLUHD8TXuV7o5EYju5bh2BqpiFJpiHG5duVEuzjnjoaeWIFJ98+jYoi8E18ln3/B7mo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PwDbWhAnvZjdtzodEryePPVtIvjAfl4bTzu+hgSxxwfVEaHb5
	SkTRnPui4p5//EfZeM6oW6tNUmY4kLF+28F5/uGlHLNZuJtD8D7v+7eO
X-Gm-Gg: AYBFou2EbHK8XQi24Klq9tmDYKrBMhSARAAnWJu2UbEiyyILcipoAyNnMVV/kHt7S9x
	Xjcs32Fz5kckBEIXn58kzy8tU0c9wvcj9MM/vGCkx0PcCe6PoIkmuj/UZ/mAHPI92yboyPGRjby
	I18tg79RU8P1kwgBMhzgX93b9clDPyX9sigZbi+wfsbtPGZ9vEp72vjjflKwfiIiUfnv+iZAHG8
	wQvZG7wW6LmeL7P07Dn2+tZ0qe12HU3j0YQWKtYd3O4pTDfIq8vHHNCuNgrUIh/cnJ3i1CCu7aQ
	/IEul6zIm8cDOJwV0cY8N4bNCcZhHRAIqAb/o0ktkP2byYU8ayM/qhMpoh83wZ0Ev7bELeiyjzf
	waIBwi/PaxKavEgTzpI7CeP6MfuDUcgJUD/tkvI64K1S2MnkhipPBl69VPgp7zH76sJWCb3sv+u
	xk3pzb+wqKXKsxMwN38Esm6Ml9YtSk2qvFngVD46mVWN2e5cjqDMPxY0RkUTUmsXG8Hmgmn/yBq
	fcrVhRBcPmuUnEfErjn08XcU1M0dcGhHBX25SWQHBiXRA1RzUl60Bg3CjcdT9h0HH/Jag1i7vHL
	26HgwT1CZslRLMuGal4H4RbqhQl/WooRxsSo1ORGbSIAUMHxX0YQsygQw/EUqQaF7g2AP7dS7yI
	Mz/T5MYrzIRvThETti8DHtTJvc97Go+c/y8lF2lLfWuUErqX+KBbNokUEFxZUZZWEOUCmTQOZW/
	T/R1sk8aYKTt3BPg/eJzthBVXRkZoLI8tsbPCg5ygm6nqNQlM71iSu
X-Received: by 2002:a05:6820:811:b0:716:f300:648e with SMTP id 006d021491bc7-7170f1be2bemr1233736eaf.5.1794177595688;
        Sun, 08 Nov 2026 14:39:55 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-7170f8cbcb9sm2087214eaf.6.2026.11.08.14.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 14:39:55 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 15:39:52 -0700
Subject: [PATCH] mtd: rawnand: nandsim: reject unrepresentable page counts
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
Message-Id: <20261108-submit-nandsim-page-count-v1-v1-1-63e961cc1dcf@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMywqDMBBFf0Vm3cHERbD9ldJFHmOdQkZJogjiv
 zdpl+dy7jkhU2LK8OhOSLRz5kUq6FsHfrbyJuRQGQY1GK3ViHlzkQuKlZA54mqr4pdNCu4a7za
 M2qjJeeOhJtZEEx+//PP15/r/kC+t2QxnM6FLVvzcplhC39K90FHgur4GIcqpoAAAAA==
X-Change-ID: 20261108-submit-nandsim-page-count-v1-9ad8160fbc6c
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The simulator stores its total page count in an unsigned int and uses
signed int indices to initialize and free the page array. A device size
accepted by overridesize can exceed both limits even when the eraseblock
count is representable. In particular, a power-of-two page count above
UINT_MAX truncates to zero and reaches a zero-sized allocation.

Reject page counts above INT_MAX before allocating wear counters or page
storage. This preserves the full page count and keeps the page-array
indices representable, while reporting invalid geometry as -EINVAL.

Fixes: 6eda7a55f786 ("[MTD] [NAND] nandsim: allow for 64-bit size")
Cc: stable@vger.kernel.org
Closes: https://lore.kernel.org/r/sashiko-outbox-204066@kernel.org/
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/nandsim.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index fe968037f75a..802493e01ed9 100644
--- a/drivers/mtd/nand/raw/nandsim.c
+++ b/drivers/mtd/nand/raw/nandsim.c
@@ -13,6 +13,7 @@
 #define pr_fmt(fmt)  "[nandsim]" fmt
 
 #include <linux/init.h>
+#include <linux/limits.h>
 #include <linux/types.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
@@ -2361,6 +2362,12 @@ static int __init ns_init_module(void)
 		chip->pagemask = (targetsize >> chip->page_shift) - 1;
 	}
 
+	if (div_u64(nsmtd->size, nsmtd->writesize) > INT_MAX) {
+		NS_ERR("too many pages for the simulator\n");
+		ret = -EINVAL;
+		goto cleanup_nand;
+	}
+
 	ret = ns_setup_wear_reporting(nsmtd);
 	if (ret)
 		goto cleanup_nand;

---
base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
change-id: 20261108-submit-nandsim-page-count-v1-9ad8160fbc6c

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

