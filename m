Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243517;
	b=4wxNVJHEB7TDjym44MJZLklzelr7HNdDa6fjYGT2N4p4Cw0FrhT3aYlvIlAt+V4zWPdB
	 VLvmUSi6qQIYLd+EULa/ickE0aLdvRuC4y9aWnzjHeYFGZ82AM4Pjwqy9CRx2U+rgGLzC
	 NWJfi9mPeYPagrrTeJBliM8eazjqNumet7vuACK6ejbtGkRfqwawUAhtzq662gIFaD7g+
	 BKwbvNRdpwX96ez/UlqxEm7ZEj8apwPC1rp21WMf+GPfcbbdXU1yF+Y/G/XTSrHE156nj
	 JMyY2pcDjS5DTKfakNM1Ti/pQ71XNWPykmO03n5jzRWpNChn5gRmvnbPUj+31+gc8YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243517;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mnYSdfRu+c56LQgrzrZ7H2MZoKEnk1Re1+H57vWpHJU=;
	b=VR7NuWtTIi1TCwTfe32RcytUfUL+XDTyo5u8pB9QxQcNtht/EyrdLm05q/IBrv4rgMRQ
	 +yybWKZ7KDW4aFRoB/lsvgXQgQkK1q5M1V08K9T4Q+ZpPcKI5HHGJLNdCpDIMeIz0JlJJ
	 U603ccOyAgsCTtLU/7rfvYv9GwfuKRGhFzRklJ1/sJq/gt/fqf22LZoysEAkwqWHIJh2o
	 MX0qUcANamTDQoOct0PFUyXiycAc2bjiSSmAFdgaGJk9ctzzgiovEc0DUfGyxzakCPt1L
	 DJT3C/QMqS9YGdUwoT0CdnozeNEuB4GzWGg8OBb1ekRuOhAVqKPM85BhjUekdibX79g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JQ7SOrBJ;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329AE606EEB5
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:58:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 329AE606EEB5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JQ7SOrBJ
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b09a65c76dso801822a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794243517; x=1794848317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mnYSdfRu+c56LQgrzrZ7H2MZoKEnk1Re1+H57vWpHJU=;
        b=JQ7SOrBJWjn5bTTRuIVBEckh51beyH3mtLx4icnHVXiOagftE+COtGGrPJqpeEshF3
         Uirlwz4+YJ5Luo4HtnsL5+YWC23ILkRt0QSEEdZhV8/p1+IYy9Yp1C19HrLAItxLS90D
         brYC+sbErOamxKsmakGbSqeYj4KZzwC8ORigViuGSCKo4IrNiLFuOVxVJD1oSNV4JVO1
         d6l9G35iYCqZ6dsz7Mv0+PTJE74v9N3CvtBebw8OpAxe3LTjWqBAKKK+cgAoW2yBzOl3
         w6F/sih23fW9e5X+4jhIgyZO7WSBOVgvsEEVV5qorFFvbswg3hJATS5EepqOyTm9HECv
         SjnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794243517; x=1794848317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mnYSdfRu+c56LQgrzrZ7H2MZoKEnk1Re1+H57vWpHJU=;
        b=ikfQNMEkSDdE4kg40iKoIsuNr26j+bn2OqkVcAEg3YY851XToyY6vHOmAviAKQJ89O
         0rrurheDxw1OOM3XKu8rcn13MeBgrfmiefdCqPkwT1sLZswIz6RZfXRhcHwYFI/Yx22Q
         pG/4YGezdMDF3LSpLi1VJujgbnYalKSjAiPTeJTnIBEByy4B3cAAt/lAxNLy+wIFE6oj
         s4MM78VNy3Cy5jiePeG2J3gi3RW7ecK1mbe3qSWLtXjy76iAj3HJJ0QJ8WjdP9/+gK7w
         b7Lf+lpnrjB7utNcHrOew/erUquPYLq0C7mT2ijPyyc072BDQY8Mliw+KTJjyDxx6nd4
         POQg==
X-Forwarded-Encrypted: i=1; AL+hErFTgeRLZgWOZk5wP2ou5Dt7MChtold7MkXIdy8+sFbNgRc1eNIn5vdqRyYYxI0VUIMdevphNCGAfjQDTtI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ofQ2eYfUxJyl9c2eLcoupk4z9SrXccAFTFAF/Ib8/Zr4nRTgi
	wOwIAJWHD66Funi5V2SKaE8ejm38h59FWrQmQ/MFx3q6Ju/nVOnhhAkb
X-Gm-Gg: AYBFou2OaxRU9zTXD+9zlrQ/a7Cb8Zd1QCDNQEur2/WLQeRctavUF6TVzoiSwqgCHpt
	UuubYRfG67l++D2k/1GIXT95gATNvy3TPE2u8hyMffzGTOUCeyrMyMQYt8n5eiepsO0b24GRVg4
	D9obNYrP1F6CgfC+JeSv6iAPEKTFet9BC8x0y5UeP3kqSpNnGDPAntmOuPkP1/1CH5i1NgqEwEJ
	ITGdNSvK3YWeXhWwkv0v27UWQZBqXhkTPcyo6jgB7/NLuA2wF6KqvcEZpn1oiDBjhBG9fn2nn45
	my4PcivPCQOEzfZrSE08TbNeJ6qrCRpjiGAvI+1TW4NyXU1335QClRzEHbsE5W4l0DmoJ69S4U+
	SRhujRytvMjiNZUDvNdVkvAgGxM8fJCeNdby14Jiw4KPtzTVDiToD8VnxB1ziNPl38VtqDn8ao6
	JNavgYtPga0mCN7cpmRbETDJTJ0mnz8onCuJJVKKZMMpHjqC0Fd3fPv1YaYqcAq6YHQQVLeyfMj
	rEzzI9x7bPVApIQ7hCZY8vxJy6+6zxD/QG3zwMaWq31uieT/Qn+IfzGVZ7pX+3VGeU8IYjm4B8v
	Ic2W+Rmr17+WwNQdmTQTjv/y3VaHMO3v2ewMVa4Gz56Yz1O30mnkV79RW+wy7KTq+GcukyH9RAr
	dFmwP2THqn5F9IJxpATGCR5K61A==
X-Received: by 2002:a17:90b:5101:b0:3a4:b0f3:6597 with SMTP id 98e67ed59e1d1-3b1669da216mr358991a91.0.1794243516607;
        Mon, 09 Nov 2026 08:58:36 -0800 (PST)
Received: from debian.ari ([152.56.156.124])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16779cf05sm138766a91.3.2026.11.09.08.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:58:35 -0800 (PST)
From: Archit Anant <architanant5@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	andy@kernel.org,
	nuno.sa@analog.com,
	u.kleine-koenig@baylibre.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	joshua.crofts1@gmail.com
Subject: [PATCH v6 09/11] iio: adc: ti-ads1015: use managed runtime PM setup
Date: Mon,  9 Nov 2026 22:28:03 +0530
Message-Id: <20261109165805.31160-4-architanant5@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261109165805.31160-1-architanant5@gmail.com>
References: <20261109165805.31160-1-architanant5@gmail.com>
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

Use devm_pm_runtime_set_active_enabled() to combine setting the device
active and enabling runtime PM.

Previously, probe explicitly called pm_runtime_set_active() followed by
devm_pm_runtime_enable(). The managed helper changes the teardown
semantics by associating runtime PM enablement with the device-managed
lifetime.

The runtime suspend and resume callbacks only update the conversion-mode
bits through regmap. They do not manipulate runtime-PM usage counts or
other shared resources such as regulators or clocks, so this change does
not introduce an additional runtime-PM reference or resource-balance
operation in this driver.

Signed-off-by: Archit Anant <architanant5@gmail.com>
---
 drivers/iio/adc/ti-ads1015.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/iio/adc/ti-ads1015.c b/drivers/iio/adc/ti-ads1015.c
index a65da3742bec2..93a8318e950e2 100644
--- a/drivers/iio/adc/ti-ads1015.c
+++ b/drivers/iio/adc/ti-ads1015.c
@@ -1064,12 +1064,9 @@ static int ads1015_probe(struct i2c_client *client)
 
 	data->conv_invalid = true;
 
-	ret = pm_runtime_set_active(dev);
-	if (ret)
-		return ret;
 	pm_runtime_set_autosuspend_delay(dev, ADS1015_SLEEP_DELAY_MS);
 	pm_runtime_use_autosuspend(dev);
-	ret = devm_pm_runtime_enable(dev);
+	ret = devm_pm_runtime_set_active_enabled(dev);
 	if (ret)
 		return ret;
 
-- 
2.39.5

