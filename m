Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032188;
	b=FSLwadnIrFodGcVXgEYLPcUy4S3VeB1eNcUFVe8RoY5UmH5wGm9sO5gXTOHwyXgi+y8P
	 H4ksZ3Gwyq225xI567VpUtT4UyPoF7obN11QxrEAwf3+hxPs8yWB0u7Z4mOy/6eKmoK2L
	 1HMJ6XbY5K+VWQ32qh6CdjzG1TA1RE2uEwMDi6Umv9VIvC5ocU/2BfdPmlGxkxrb4ep/P
	 tPsMIN/QnwQ2xdNHRKgbAbIKDkcZk8t85LQAyVW8dUmzPmGSW3Yq8XGCE1W1rV0CfYrBW
	 lzO0n3KWaVQNSYqlYec8S7/vs3uKRP2Tdae4ErB+5UDWFonJLAwbdP6IHcM77gsMJhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032188;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=RKcXzPxvin5lwIxGObv+nbNRfrLQyO7ePF6o4zMOL8k=;
	b=A3/GL6hyWqmbQRRZtfLJuRnKLsGWwsXsxVNaSHt/ZMRe4sxBze4di08Uu293SAdVcfMq
	 /6qE9S7ohjN+0YymkQaPy5I11t3gsl+WqkC4X8mMOxklywqSYmvp0dqhOmsV85w92em7S
	 bICIplbppkS6vehrknwgei6ucNcpjX2cdwxUPJlobNyh961zhzhtd0kiDmQbL9DSdhC86
	 43lBmEGuBInG9felu3mlsQf25x+OWF6QZA3U7KIAv8riI55xaarbjkzz4Hb6foNeBCXQ6
	 dhp0hmPnUuB1oi/i4eFRNf/IpIqKBEyq2V/3DHhkYtamnAuo1tiHVXp4TJd8BY9S5XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Hbro5VuG;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F92606A335
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:29:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0F92606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Hbro5VuG
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48b042c0759so1808859f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793032186; x=1793636986; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RKcXzPxvin5lwIxGObv+nbNRfrLQyO7ePF6o4zMOL8k=;
        b=Hbro5VuGgSR36QNwiREnMP4TJ/+1in3seAXuchxuGPpFx+aWPV73L7wySNGlwKsBpH
         mXUtIOq+SRl+q+s2jUBtTx/wA0Oj1cdITvV4FZLErDOpbemsqXJiokC4NhmkZZWyTMb6
         0zp48x0efFpYfd9CbKWEJ2v28VOkY7G7meLf+NsMxGkjl9HVRasTpH66j2tWnJVsVand
         zQlYw0V3//7NvXROz2NDWMINfzdU39+i87kQy4oMvTtQ41wljivZXB+8WkABT1GXJBJn
         oZDKnImufZ+UCxb8dfeqGo1BO9qcag5bwlVGCh7bceXUJ868k1QzFP0g+GjiJDW6Onzm
         hxFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032186; x=1793636986;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RKcXzPxvin5lwIxGObv+nbNRfrLQyO7ePF6o4zMOL8k=;
        b=CWL6cKi0wSef6Uq2UPH8ux/XsPOJxUpb6fGKVUSMKSGF/avWH2n/H1tqRoy4jjqN7f
         x6aC3l4n3qu8Gbqf9wN7Jtt8WIZ88eKJDYmGs/qNUITlazK89L7grb4a9wUCA/Dx3Gs0
         57oFYMvlgpcYpm3cOltiDchyb1MEZIxs+0bPQTXLGFi5HpRV8p2kER2rI+FhcXIWS99z
         /8nDPNpTdLAr+ddAWPSwMlQuSvezHp4p6yBdGNzSbr1r/UqUh9qXHNnoAznuSFX4PnW8
         U9FxdUcALPT52Q6wEIJemf2kk4tqYFC5XyveD7Xgy0Ir5sN4/5vrPfpk27eiVAu04Lhe
         /yew==
X-Forwarded-Encrypted: i=1; AKwUvBw6Yni+LmWRtAX/W29dnXbV5UF0mfZ3YjOo7higLb8KuuPdtqhjQVepfA/FFy28GwVP0XdqwY0JGnfluDE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKms6wPUkxTp2rPrgM2f/h4JCNmmOXkmb8l/j8wvB2u+v/qt0Al
	1EoW/t19qNgAgR9dpxQBwtH0yk6JwAcpDc553rMsMUwb9NtvETQi8bnMBWTL0lDkxXs=
X-Gm-Gg: AYBFou0wV9AUGGNISi/TXPeOOssCKzTevaJUjnZ9R7760zdUnm5bj6+kII+DUoH9IUt
	Y9R1puKNtU7IQomUy16pIL/oh/qctl9eg03FIaufm7AvHF/hMalN3dh47DpDN0cl3cxv6eTcvSk
	aGT9GHFXjx6JezfyBosi2NzWPchpRRHLxmK+3IOIvWyU+LGU6GntL8pQYKdC96iEA4kKYOENnu/
	H1pVX7HL12XoUIBfr3DkJwoK45RdfaxoGfBtppI4nzhAjI1Nb6DTtyaOb2FbBDpYiS5uP3Gys3H
	b18Lgj2RjGZCeaobGX6QIMoPFNK7eNUPTdmTzmlvExrI8QznwpOdmXsYI0LYr/MRs16GpGwOW1s
	KwufHPjSCsqRW9mC9BZC9Fb9+IOrvIH4Y6Rm0+PjQKp+ZlQZnwWMMR338F4IvBRV9jE63wyafh9
	N9DRV5CzdAohwXPxq0vCPhAXWaEFXoktqQLCn/sPYLj9cWbhj7lHFkYIYvOcy+kRyjg+5yksRYx
	xLCh00gyPlKE0grR929rETD7LdomXEcZbZE//moylL60lf7sNMYgfzdM9vgqlzUTmu1zBRXH1xa
	ogTkp7MZiz++/WeBJl/iGiNgvanjDfRSgbt0UGjclvg=
X-Received: by 2002:a05:6000:46d3:b0:48d:f9dd:e3de with SMTP id ffacd0b85a97d-48e3eba4619mr8542409f8f.45.1793032186149;
        Mon, 26 Oct 2026 09:29:46 -0700 (PDT)
Received: from localhost (p200300f65f19a904cbccaa7a4d73ac15.dip0.t-ipconnect.de. [2003:f6:5f19:a904:cbcc:aa7a:4d73:ac15])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e3eb8f248sm16845333f8f.6.2026.10.26.09.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:29:45 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 11/22] gpio: pl061: Use empty initializer for amba_id terminator
Date: Mon, 26 Oct 2026 17:28:22 +0100
Message-ID:  <362df5096512d5c88b6f8636bda210ea439ad24b.1793030820.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
References: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=891; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=F0NDFiED5fE2YvaHL9r7KOPlatK3tsaZ/Ub3SUOTuFA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq33+3GslnJo0vs1RP8G1Jr06MrudZvfQdNTA3a YveLTPHoTyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCat9/twAKCRCPgPtYfRL+ TotYCACkVWrecmBkqXdQmh7g9WsedfgMJ4EdWmP295ebCc3pO9CHBflnXyXkK9C0gASBAln16ql LE53XIRI7LOe7pcW6nzrWMn8D9T7t2lCzVXlDnHLT2DYvchwtwt7us+K3FcuK07pOi5rIF3pf0X nXgRElzH1axdUmW9lBj5SKwZ6p6sHvDU9BCefOAcGV1cx0WTRQ1W93EJsk5sXV9/Z3mer3Fwj8U xLPxwjxDpWV9Eqiq1wZTitPS8wctxHg42zH2n8+3QKZG6X0NG7xTs0nMPnaJYwGXdp7dBBdrDL5 H4X3QoUJwkWLNukAm133/T7G0l/38nvNzAVFLib+tcQUyY3I
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

A device-id list terminator has to be completely zeroed. Most such
terminators (also for other device ids than amba_id) use an empty
initializer for that and let the compiler care for zeroing the entry.

While touching this entry, drop the trailing comma.

There are no changes to the compiled driver, only the source looks
nicer.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-pl061.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index fcd44e34f65e..f180e5f4493c 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -412,7 +412,7 @@ static const struct amba_id pl061_ids[] = {
 		.id	= 0x00041061,
 		.mask	= 0x000fffff,
 	},
-	{ 0, 0 },
+	{ }
 };
 MODULE_DEVICE_TABLE(amba, pl061_ids);
 
-- 
2.56.0.rc1

