Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793375923;
	b=z0a9c5tYo9L1nDMlWSGxNRWopV25xbi8UFnYymsEI/VE8JIvgLnLUYWwDB/gG9AiqoKq
	 OWaBqIAgomPYNyDxnk4f38i48S8X+nIyP7Lj8CwDOTawuM2MEvOS4Ouf72+xg+YdFB2SP
	 vPdwQz0NURCDf4jXz2g4DFOGvfyAY6W4K0leYJ/1H5TTUNqF8gpAHBc7G6aKg/UfqsbQs
	 XyJtoN2mxUgzU6tsUDvIXJxdBSqfJwp0U3Q1wiYLxBjGiSz/hAPYVQjhfeGzpzUR8hnM9
	 CEZvQ+abomijGDDCj1fW9BkYFzyzIOUHV4Q9iCLeHVe0ys7rxU1f1fauy+BqabPmoOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793375923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=LeFt7P1mVFRjUvJApqNjloRcS0qu8nw+PQFMs/A+hxo=;
	b=dxKABh4WqAtmVmDC5cdJKYdCKIdlkNZhFdAme9XmhXhT55ZOmDC1yWmNh5vr2KIgj5lN
	 uUR2kYHBzX4o6n8IaH9ppAro7nh/ljfjjyQG6FAhrrPKyVAUwCNOYaicnBqXcZkqQ/UJK
	 6jhLsWV1Nrwkqd0h+jiPsnbyovM6FmSN1yR6mBIrK3uCiHjDcixQ2o/w+gTyldGyODebF
	 ggy4r0biXJVsFtx/2cdSk7MMslRJs5gBLENHncYb/lnioSN6UI6u84/aphZMPAtOUGi+l
	 ObO3bjXf6Zf7fZee8/vF1N9WPYkhxaIrCKocMG/w7aN++wsVvLlS556jMEMufY99CgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=GLSvph50;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFF7606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:58:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CFF7606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=GLSvph50
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so7954565e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793375922; x=1793980722; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LeFt7P1mVFRjUvJApqNjloRcS0qu8nw+PQFMs/A+hxo=;
        b=GLSvph508biQjF7dTffJRAsRCpaqI8W4aG3E2x3Cj28MWcSecCq+bbuCoDDNEmNjNs
         tyevhlAR3tBS2rHYklyGsdENP4i+Tft9Xe+t+c7CRQEl0V3J1pUpDtE+MGlKHVtPOe86
         +MC9jUofEDDrHQqM++LKVJSIT+L0PZsy5NTm18kbBCnvcGsNlOE/HKZ14qb30SzD+cIm
         eR5oEiftUD3e4S5Y8CKmXfwsA5957/E2rcG1wgngSTJqrGJSgmUYhSwTFA9LjzEbfStL
         DxmUdfOJGKjsOcG45UDnFrMUwa/ylFwcxS+XtnTB9vGC73cj4U1oFokozTGKfwgRcIKY
         c6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793375922; x=1793980722;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LeFt7P1mVFRjUvJApqNjloRcS0qu8nw+PQFMs/A+hxo=;
        b=abj4O6sx7PK+s6Cw63cQ9ryQAImeiQEx0zdPgMc5yq7QDP+XfNwCSmxKZVlRXhelCh
         E9VfShfJ7KKaGw+sqLCEjO8oF0hiPPshh0+FQ4Eit54SIv2OyF+MNY6XyfNLs5Dxd+ba
         G1+4EMCcWlxlfsH7wMdvZCWe6w4Lscp5NbNG0VIqZLlqvVWGQ7+08bm8xUxE9ZMve9T0
         Tg8Js6MxE0FN9ax81h//+aHIhz07h1gEq8LbV4xEO9rxO95ZEkdhjvEgSH0PxMHtXW2m
         djzQ8geLgNQbhsrzTnydMULTBmSDhlu3fS3ZK+CNMbcvqg6PY+zDIzjQMAn4PN8krH4y
         rQ6g==
X-Forwarded-Encrypted: i=1; AKwUvBy4p5bCk8n9LlwKSDr/SZ4ZlvvpRx0baSprmZQo8Ysy0HyNmpPAO0yQPz6ciyonyiNVxti+tj43lfAq5jI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIuaOXGm7Lo2HBtkYh6+VXrmMF+1Pb+SVbZBtk74Wa4vpmcdlz5
	gWiRiKqDO/537nGpAHfdFYpaOBCsF3TxOPf/7ZB9VdLgGL3qIMf2YUQgdSuK28xpOOo=
X-Gm-Gg: AYBFou3Jjn/TvMJqvSllAwt/8D4Vk6RlycgfOgfNILUGefGSUMenRSWjlxSzAUyXcIK
	zR6t8ziM7XXRaHodDtE8EpvfUNAM3Q/92yRixNvjTREOfB/Rc8XirBY93a6AN83NSBG0p7arkzK
	QSek75D69/xejPH0BQhI/Ko7scDBO5bg5z33H2jCGBzcb55H73gYkrVeew0WpcdSwOXCFLAvTD8
	QB3nAdOlQBF/RKYBc33FlfL1NAEu/BbnSChWwYbp8weoPgJjL6q0Kwf4bf3Vwr/TjmjpRZ3gA18
	ppzQmWe/ofYwZCwliM07fhWNzdJNOTKdqALFus9R3f92AvMwwdrpcRxElHEiM1VCxTPc7dE9YW6
	J7UD5enaJAwCW3sjiNSxDdIQAq8U7wa2/GNXjt6Xd+0tbTQzZQ0JiYKi/sTjGVgrANCBm47coUz
	45QjRPpdjP6BbO8RiR9yFSB9ttoGp7Ib4c8lqtlDmS+eIk/nL5YNunfcxcbOjZ5jaOlUH853SbR
	mS7Z84Kx8DIQPS8xYQm/HisPDqxXo2KlcOHXlzrJm6BWIYdxsfRCFUBMWzf1t4sj8gK8lEjhUJf
	2CvT4IkNDlOxn8l5rVI+0AVMyQLk5jRzPCQL5iyStII0cUR9z9g=
X-Received: by 2002:a05:600c:8709:b0:4a1:9078:911 with SMTP id 5b1f17b1804b1-4ac181e75b7mr66361365e9.31.1793375921690;
        Fri, 30 Oct 2026 08:58:41 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba24f6sm3802033f8f.51.2026.10.30.08.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:58:41 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 30 Oct 2026 16:58:38 +0100
Subject: [PATCH 07/11] pinctrl: scmi: give no groups to pin-only functions
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261030-clegoffic-pinctrl-scmi-gpio-v1-7-52d92843ad97@baylibre.com>
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
X-Mailer: b4 0.17-dev

For a pin-only function PINCTRL_LIST_ASSOCIATIONS returns pins, but the
driver registered them as groups. Register pin-only functions without
groups.

Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 355ad26cb215..1a14e254f011 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -443,6 +443,7 @@ static int pinctrl_scmi_get_functions(struct scmi_pinctrl *pmx)
 {
 	unsigned int nr_funcs, nr_groups, i, j;
 	const unsigned int *group_ids;
+	bool pin_only, gpio;
 	const char *fname;
 	const char **gnames;
 	int ret;
@@ -455,13 +456,20 @@ static int pinctrl_scmi_get_functions(struct scmi_pinctrl *pmx)
 		if (ret)
 			return ret;
 
+		ret = pinctrl_ops->function_flags_get(pmx->ph, i, &pin_only,
+						      &gpio);
+		if (ret)
+			return ret;
+
 		ret = pinctrl_ops->function_groups_get(pmx->ph, i,
 						       &nr_groups,
 						       &group_ids);
 		if (ret)
 			return ret;
 
-		if (!nr_groups)
+		if (pin_only)
+			nr_groups = 0;
+		else if (!nr_groups)
 			dev_warn(pmx->dev,
 				 "Function %s contains no groups\n",
 				 fname);

-- 
2.56.0

