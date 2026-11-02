Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634871;
	b=DcdsNSBtiAMqrzYfKsqbb+smKXb1k1YYgjN8Aegd4G4SC3bBcxkUk/FVNwICzUpbWPx/
	 sz7K/4d9kGNKJNqj6WrSdTR+mcqTd1iO+O+1uidXkxPHsOa+7HDfWvrw/Rm4MekYH/AXD
	 F4MnIoqMSNdxXFDnS7XXJMvaD/fSR9Ot+O+aGCYjLw2abzGH5eBE/vFpe+0wVrK3+smAF
	 KGb3sppw6axNP97HtP6qCA8w0gQQovNrim1h5a6kkn339YO25e9jtwd/RD1A+XhHYCd9n
	 /NKSQS+BOtOk1OkszZ0mptNbHp2z7urktAuT7FiO4vcabz83IZHeSPaur7s8q68+EBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634871;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=OQxrJVTSX9yU+997aECUavgu21v7JWvUGozeyzoCeIM=;
	b=Cf3ia89aH4lwQFCflVUtyaEybs2cg5D6WctmSYkHowd9RlsfFsKDQbdVZglgZp4UaTgm
	 mjN9w8oLQUtC5XVRYvbf7olPoewHuhFXb/pVYLynRnl7482lgNUp1z1/bs2UeUXJ2HSua
	 YGjf99fE2a7oJmLr2Uges13eSqdZ0ws8DnAi66d4URZCt+u0TImxTMzM+36E5jyUhyI9P
	 uOklb1DfasYnLn2zQPB5GIsS8f4NQq9OiVSw2U5aORPB2AuEg/cAJklPfqvVsPv45N5IZ
	 FsOhm8nH5UrUiuEsGcfcphlhGzhzffTjnjb7QE6d6cHT5iw3JGlfKV7TSi6HX+SfL4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HoW3NeMg;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769DC607B40F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:54:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 769DC607B40F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HoW3NeMg
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so25803305e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793634864; x=1794239664; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OQxrJVTSX9yU+997aECUavgu21v7JWvUGozeyzoCeIM=;
        b=HoW3NeMgcGDe/GfHOBN8QghQgSTPIDveX0dhFVqHv9lO9kBcyQUVRk4R5dbVgFK4s6
         TYGQmbJIszC8tX06k8PGVgIikKUTg89X+3vef27r+3lPo1BIXdRKVNA7hM/9EGOVaBKu
         S73OFdQVjoCBKg9r1LJUGIfZov6jH0YV+KGDCccCHZ1K7MwsEg3H6tGH2B14ynYD1G/W
         1h5e4bwECL77/axo1+P1t/Wcb6NGlG7hGyXp/RxgTpDOYgoxQlRUyoTDyUb678pT3x8x
         WnPVK4BedYtGimeV756EY6dCJX6Aa6kGMH0qZXN9SdGyxDROUunGxVH6ihYglEkMkW+L
         kpkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634864; x=1794239664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OQxrJVTSX9yU+997aECUavgu21v7JWvUGozeyzoCeIM=;
        b=rJiVE4Z349deZBJCBGB941nqmWcfQowe3WN1XPgKL+4NmXOfddYNnCm5aeMytTOmVz
         rkmLLbtdIc/h0hAriWCHWMNtEFA++10Lkxtpuzdbwx9++VqapZAFH9g2eaNKINc7ZXdU
         QSqtTIIv7m20rsmPCEg7yjyigLtKdhfuLgMG5tIOXO1ygmqCLUg46m/aep4CWl/lAH4W
         b24rmBktZFnV2TD746NIV0aBToZDQJdJPupxy0BUhgRRPCXqsVDFkBbbNGC3aJDDKs+0
         6vjGMpqwWGEuJzZJTW1uwKxtHL/PrOPwWD9wDlV0zMS/Cq+O5hoFI1b7C3TFQxuKpbUc
         KJ5Q==
X-Gm-Message-State: AFq9FYIXKd5r74Y8GbrIdrG8rJGMZnNo9DR02WWH/AnZrqM4AyzOwXPM
	SIzOOEZMk6kUjYatQraz3ZbrTZeC0rMvC9W3yrtRquw0bfUYFmKD7UJwGiuWY7SZ2qk=
X-Gm-Gg: AYBFou1o8C61iR7Xggpag2JVxQaBYd3bZmENWsr7pQ99nOIwKf2fEyXrIj3rTE903EY
	BkzE3n+3887sNATgzyt2whwnXKpUEi1ijvYgGYm3GgLf1j0GnjZ/oSbwP+jv5Vh27WJ+EwSlNUm
	mJW9j72B63L5HIvQEZo2KDnMc0/jk8pBkY76CAsBQErVcZMlpKDleJNcB1ArJJOK2GkT2H9eoup
	lP4y81u3hpaPLG4TSEp0OSm3OXI212ul5u3u2ePjamkhaqP/gyaCpVeCNz8mLOYuGl8seRl2GqH
	6K+jO1UB76SqgNVv16YZS25v2h4L563Csrxl5fPCrrBsXEaZjbNPI/YPAE/cr4bnr3OH+UCurp6
	qH/uGbAK+PmCPsqxz3Qm9+5QPVb8KND5C/4/9dnGlcH03XUWRT5B8oa/eK4JjN5YATV7Vhb0B+l
	IwT3g8ZTL3rYjtKWsdM/CXotoP+UIS15Rhm+sMqRnYYpr84F2akKPZh+P8nyF4y8/WAzR2vQj8s
	wgTICRSEmvNhOpPDZcaRunhOBTLNGBwFP8aBjcSNaAjZKy9kkcluSHDJeORP8nUDdzRa0Y5CopZ
	E/TRbyiAbKDtCg2LEbggpMLxb3HlbBW1dbVp/j+jNC+gu7nNeYmXMm2X
X-Received: by 2002:a05:600c:a00b:b0:4a2:180b:3153 with SMTP id 5b1f17b1804b1-4ac185bcc7dmr252990315e9.14.1793634863799;
        Mon, 02 Nov 2026 07:54:23 -0800 (PST)
Received: from [127.0.1.1] (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e71ba24f6sm21229288f8f.51.2026.11.02.07.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:54:23 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 02 Nov 2026 15:54:17 +0000
Subject: [PATCH 1/2] regulator: mt6363: Use 8-bit register values
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
Message-Id: <20261102-rgp-67-mt6363-regulator-fixes-v1-1-420789a3113e@baylibre.com>
References: <20261102-rgp-67-mt6363-regulator-fixes-v1-0-420789a3113e@baylibre.com>
In-Reply-To: <20261102-rgp-67-mt6363-regulator-fixes-v1-0-420789a3113e@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?GIBEOM_LEE_=28=EC=9D=B4=EA=B8=B0=EB=B2=94=29?= <rtx4060@gmail.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.16.0

The registers are 8 bits wide, but the regulator regmap uses 16-bit
values, so every access also covers the next register. On little-endian
CPUs, each regmap_write() also writes zero to the next register:
disabling VS2 or a VBUCK rail through its clear register 0x212 also
clears the enable bits of VS1, VS3 and three VSRAM rails in 0x213.

Change the regmap values to 8 bits. Store the BUCK and TMA keys as
__le16 so that the low byte goes to the first key register on any CPU,
as it did on little-endian CPUs.

Fixes: 3c36965df808 ("regulator: Add support for MediaTek MT6363 SPMI PMIC Regulators")
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
I had this patch ready when GIBEOM LEE posted the same regmap change:
https://lore.kernel.org/all/20261101164405.1743177-2-rtx4060@gmail.com/
The only difference in behavior is the BUCK_TOP key: that patch keeps
it as a u16, which a big-endian kernel writes high byte first; this one
stores it as __le16.
---
 drivers/regulator/mt6363-regulator.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/regulator/mt6363-regulator.c b/drivers/regulator/mt6363-regulator.c
index aa6a8eb7ac4b..ac79ad6698bf 100644
--- a/drivers/regulator/mt6363-regulator.c
+++ b/drivers/regulator/mt6363-regulator.c
@@ -381,7 +381,7 @@ static unsigned int mt6363_regulator_get_mode(struct regulator_dev *rdev)
 
 static int mt6363_buck_unlock(struct regmap *map, bool unlock)
 {
-	u16 buf = unlock ? MT6363_BUCK_TOP_UNLOCK_VALUE : 0;
+	__le16 buf = cpu_to_le16(unlock ? MT6363_BUCK_TOP_UNLOCK_VALUE : 0);
 
 	return regmap_bulk_write(map, MT6363_BUCK_TOP_KEY_PROT_LO, &buf, sizeof(buf));
 }
@@ -482,7 +482,8 @@ static int mt6363_regulator_set_load(struct regulator_dev *rdev, int load_uA)
 
 static int mt6363_vemc_set_voltage_sel(struct regulator_dev *rdev, unsigned int sel)
 {
-	const u16 tma_unlock_key = MT6363_TMA_UNLOCK_VALUE;
+	const __le16 tma_unlock_key = cpu_to_le16(MT6363_TMA_UNLOCK_VALUE);
+	const __le16 tma_lock_key = cpu_to_le16(0);
 	const struct regulator_desc *rdesc = rdev->desc;
 	struct regmap *regmap = rdev->regmap;
 	unsigned int range, val;
@@ -539,8 +540,8 @@ static int mt6363_vemc_set_voltage_sel(struct regulator_dev *rdev, unsigned int
 
 lock_tma:
 	/* Unconditionally re-lock TMA */
-	val = 0;
-	regmap_bulk_write(rdev->regmap, MT6363_TOP_TMA_KEY_L, &val, 2);
+	regmap_bulk_write(rdev->regmap, MT6363_TOP_TMA_KEY_L,
+			  &tma_lock_key, sizeof(tma_lock_key));
 
 	return ret;
 }
@@ -811,7 +812,7 @@ static struct regmap *mt6363_spmi_register_regmap(struct device *dev)
 {
 	struct regmap_config mt6363_regmap_config = {
 		.reg_bits = 16,
-		.val_bits = 16,
+		.val_bits = 8,
 		.max_register = 0x1f90,
 		.fast_io = true,
 	};

-- 
2.43.0

