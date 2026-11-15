Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794782510;
	b=Mvt7fqUtMddKqSBsF7TfqaVBBjy8WLwyLu4mN1I0eFs5Ei+NI5Y4n/sejDjDMsdlSyfr
	 8C0sIbaDvERkQEoweVkKIcvPnr2VEcDI17AxpAln8oYVbogC+2YrcZOZ2dSG9LGVdr+hW
	 jkFGNgVrJY7IT1AEmGlmmDnAVFSZ+XMHHvLtZ4BoK/NyG5j5t+VobkuvXJVq76/a+NkCv
	 Lq7P0wmRlGh9DYbuusjTYQhbmOPviDxDBh1ahJ38RA9vpLZaMMQ85Ez47QtoYdbC6ZqcO
	 7OUhlmczQINnMQWEd0/vS/ZH/JoF1JzseMhBiUGbdhJ8aE4QfebGoi01cvmY1RGmlRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794782510;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lx3glkhH9vs3/X3w1l5/CUCQpaAzGp+qGYgSRk6Y7Xo=;
	b=q6eYYC+uNbkid7SVoCppSRrZXhGyOmWlrQ76wlMsRp7IAREOsSvRH+oq8qq1pFgUel+N
	 FnspPfNJ7QPMQCtFYNLg3kvyiXJkr9SIwdGKA6dU2E3og15uobvq5hPv3DCCpAFsOODaJ
	 iw0fsdVL50lzyF/obxAbAJtJAhS03pf3nId+KgTFHMm0kOXR/bbHFVYxwFPd1RvQa9uUr
	 JfiMeW57iZyG3GT61mGbILmOEYwyWxstGskd2FQ7sJJ2M2GGlMUAI9Dwxvhh8YQOYaYgt
	 SKxlQehNnS8ZDYsdUSsJSJXTb+KVz5oiLXRO6tC/nqb3fSWWwFty8STwTO/+oqpQrlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=YqlKnmP9;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E9D606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:41:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52E9D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=YqlKnmP9
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so2557471f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 14:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794782507; x=1795387307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lx3glkhH9vs3/X3w1l5/CUCQpaAzGp+qGYgSRk6Y7Xo=;
        b=YqlKnmP9Dt1t0tpESqS+QrXrCH6dCwC6uOCahDkEqVEYJ/t0nlZZ6yS4kRgC860WgB
         Yo9zJvsFjM+9d5FL97dA4em0dGvPvGH0yHW2i/ytqt6llgDZSKGZ7aYKDY+9XY2yiSFL
         kdTEcRVka75alK7uYr7Swa3jZ7mQi0seFwBTfKZ4T6Xo8w8NZNwec9Mp58XeXhFv6EZt
         aLRW9yBHOwhFDxlCpsCjbsYJqR8iLJVxo//kFMS7zYaBlD2Lu7L4Ho42HSmIUQRMwved
         i6e2BY4ooeVl3E0fXESSFMOdvs+0GzAobSodwR+1E0SuvVr39/pwN9qni3dYDk4Tio6y
         w5cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794782507; x=1795387307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lx3glkhH9vs3/X3w1l5/CUCQpaAzGp+qGYgSRk6Y7Xo=;
        b=mCUKzSRZYWGrXALJRcZXT34dHXFTzNe+slUCNd7dkkXRD0par4KmE4iHOR8sJ5r+AC
         znLnsFnKcJTseH9t54+fXUb9L/cVsd52U1hQhakp/cEf/eAJpOFbUV/X3Yi1RYegHc9u
         7ICBNoLi5oqL/KMl1rR9a/UKMvuyCFggmjlJK/0yc7w7lFqW03LUQJ8ROuEVNiLZi4hB
         Iv4+sGWaIExqO6DXapMW+dNhiNRbu9EymU0GTuguTpcVIPyy37YfTgP43Dh+p+ErCV9x
         FTtaNJPSfr5g/g5byMhw/3gBaC1XEYeZd+HizendV0+BkWTbhtTTWHsbuPhylh8bNFja
         FTgg==
X-Forwarded-Encrypted: i=1; AL+hErHG01BVPHtEzoZJe8N8iCbhxlqEVUFcCX68/0z8vn7XmSaITWUZE5zsBqXocoHDCTg791BLpdc1Tq0k7Ic=@vger.kernel.org
X-Gm-Message-State: APuU4Z998zU5IbcjUvtq79xgxd6QT6N3uIc9Bi+JvgU4oP8A1gTyF/hE
	tgnB9HZ455AYp4SWvWVFVkgl3FFQNuPNFKsGut5LF/Oo6P0yDK7RhIMl
X-Gm-Gg: AYBFou3ko3iWLlto3Yib/BOFqGccwWHiVuINDzqtJrxARYKFc+GYW6Xiu7wvcAKQ/QK
	RrZg5Ixtnd6C8WR2n6eMXvbg8HLURX5qqDw2NjoOh79QV7KKcBHteMbp1jEarckSPrxbEbitqcD
	44HFTrfLmZKEkUa8cBYfyRoO0UAWdvz7VFpuYa6SiE4kWhG/Q19ZV+8Cd6/0CoDEeKAusgefjRk
	y0jRJVBVgDW2IeoJRZwSIiUKtMe1VzQVunb4X+Ae5VOfVboQlLPDxlfVKlhjJz7p9jYXlLKGIWw
	z/uO59no53Sg+CvnXmQz1L6p+KJ5n2R5NhWyEw+OHnZA4hKd4DVmQ0nUBRAMjp/0jJfWcgIhYlL
	mO1yUgZupm3KkLuG0l4KxS40arTmki/+lOB1vWx1toQX1gWt07r2zOqcbGnhlPLNgr27ikzEKOT
	64izFfRjFv70wvabUTtDAaEfLT8aJ5KiQgvz3uYYk5Su7A1mNuztKENkPwpx2l5Y1k6NMM8T4n0
	ISB28wBw0d8ghntDP7nX0GaN47+ctv5xRoYhMtJkbSmaKrYAq5Bd6o9Kbzm9lUDOm56Jq3SEnDf
	3qhLjs5elXtPWKxe1v5bGAoxDjfGUYNVdrGIEoKi43duAfJ7n6AnvY1MnArm3Lvy6ADe05J4QAn
	uaobpWEb5f+clxoJHubOEZgVYr2iFQwHNnTpYIg9c4Ayst3p7NRgdins=
X-Received: by 2002:a05:6000:3108:b0:492:7efe:3fc4 with SMTP id ffacd0b85a97d-49c711b7ee1mr19686269f8f.21.1794782507434;
        Sun, 15 Nov 2026 14:41:47 -0800 (PST)
Received: from blackbox (dynamic-2a02-3100-9c24-a600-021b-21ff-fe38-46c2.310.pool.telefonica.de. [2a02:3100:9c24:a600:21b:21ff:fe38:46c2])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5fe373casm17986572f8f.30.2026.11.15.14.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 14:41:46 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linusw@kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-gpio@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH] pinctrl: meson: meson8: fix I2S pin group names
Date: Sun, 15 Nov 2026 23:41:36 +0100
Message-ID: <20261115224136.818305-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.56.1
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

The I2S pin groups are registered without the _pins suffix, but the
i2s_groups array still references them with the _pins suffix.
Update the group names so that the I2S pin groups can be referenced.

Fixes: 64f6d07ba74c ("pinctrl: meson: meson8: add support for the I2S and SPDIF pins")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/pinctrl/meson/pinctrl-meson8.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson8.c b/drivers/pinctrl/meson/pinctrl-meson8.c
index 3da7f3799c3f..1f58752637a3 100644
--- a/drivers/pinctrl/meson/pinctrl-meson8.c
+++ b/drivers/pinctrl/meson/pinctrl-meson8.c
@@ -923,9 +923,9 @@ static const char * const i2c_b_groups[] = {
 };
 
 static const char * const i2s_groups[] = {
-	"i2s_out_ch45", "i2s_out_ch23_pins", "i2s_out_ch01_pins",
-	"i2s_in_ch01_pins", "i2s_lr_clk_in_pins", "i2s_ao_clk_in_pins",
-	"i2s_am_clk_pins", "i2s_out_ch78_pins"
+	"i2s_out_ch45", "i2s_out_ch23", "i2s_out_ch01",
+	"i2s_in_ch01", "i2s_lr_clk_in", "i2s_ao_clk_in",
+	"i2s_am_clk", "i2s_out_ch78"
 };
 
 static const char * const sd_c_groups[] = {
-- 
2.56.1

