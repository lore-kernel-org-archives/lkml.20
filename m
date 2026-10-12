Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAB91DA23
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791783111; cv=none; b=rDAgfu27vLRcCpn+ye9EmYtNVnfgp7UM9aZlNp+so1OLxrkjloZKEnJcXUgk8L2JYUgobTyqeyWhMI1nodLzbkQ1pDEqCMGRaJpCgxdExBX/s664tIxhtVRj+OnAzhsJ1ycltxha2G8CLpTDLKAaKHmpp5KXidJlw0FphFtrO7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791783111; c=relaxed/simple;
	bh=7nkADHEp5x0DBoPoZtKbSuxWtdaKOt2lVNr1L5cD6dQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Eo6yaQpSlxWH7IJZkxe/kEn2VV6xObKIVGHC/K5YqFvH7/lk0tQ6DfMa90xOlSO5DQgwRXrYwPK7qwjwBnbGk5taFApV87HMKfgSHmWru63kwK4wxnJvATOETd6GWlsVDp88ebOj2grlXxc0OYEascrRnMmFAnLJUVohDKEQZCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VDyE+9lt; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VDyE+9lt"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso5360885eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 22:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791783109; x=1792387909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WUHR+jwX20wnPasopncz+EdY4KBemgqmO+gzErpgMVo=;
        b=VDyE+9ltZ/gVpHegSLOcDQ00wXpXyRlS6oUf45exlaD5d2MCGAt0cC3kcrTcpiYLuK
         JDHkV7bExNzF4bFG57PZti4ZOyw8nQyOoesIBe9U1sFuY8K3+m+j29MYcms2vaHZoqL8
         X0dRK3mtz8MWp3a+tXlKvcpMN2wHKiMfOiEYmnssDbDIWoJBG1D/FNL3N3FGXoOnlM3s
         Vkvv0yoCftE/QbrISlv9DfviIX464l/5K1EziWwlgtbXHLc+pjG7BCkjnuC5B5pib5Ra
         hKM4ccJ5bbXJ6fMP2hGYSxuUoA2++F393/ZSFWSjGRGFa3RxRBmu4oZVK8zNSdN0S0fW
         SG2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791783109; x=1792387909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WUHR+jwX20wnPasopncz+EdY4KBemgqmO+gzErpgMVo=;
        b=fw7Zjfglm2xQlF6zHce5Rhil/RmqkaLk5PYkAhWHtJMqel0utxTMsQ9TRPZ5gjydDI
         NbEWTpLq+tzrEEB4VySm+fFyTCAxs2/7mZJXwv+GSzIn6RkNlj2uxscmRF4rIHOn0npV
         NC+1NdWFtnH+es6DrkMeqEm7Kkur1rPlqevnmTLUDBzCaHdnng9iPZAcvNjCGs0A/Psa
         CAtk1rLBCUxUMgqPcYXTgzJjJ1GwxBgEuVIyfv2WVfdjF2g3fTm+pb0u/RXfCrQP1uaF
         YUmdQrnuxFm8f+oeDCezyIES+T8qdx+og60BmBek46N+6ex8gI9OdPpb+6QXjm7nsqrJ
         hhuQ==
X-Forwarded-Encrypted: i=1; AKwUvBy+okSICOZs/xEq4RhrvfnbCGIzBuADrgx3xY5mHPOqh7lb8Rg18G44qN1qNcoTL9RfMSiwwc6rpWj3hB8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPCKoVGqg9zXcreUXSiOjntELEcTdZnaQsu7m/gJHVuF8tRvJB
	EkFv596sx+aM1A51E3bk7kudVg2gTgcILLdc+2Rxe+afKMdHJSeVWd7W
X-Gm-Gg: AYBFou3j9HYKwcdUHnWtEITcp6QYquHy/ykv2/2Y8VOtsrCHssbS/ikr6bniISkNUF0
	gT+hWPgccsT0qt38Ivf3CVM/OTHJx0W4/AeCLTZPSqpda6oI5/QaXr6IGhDFpOLe+nWOQPVGkmb
	+wec/xqxX845kw+ZlnkyMXFa4l3WoYyeCODawvR2wFGNcOERzTZd2JTmkRkiGnuDhH/ZEP2CQTH
	aHLYZCAMT9Qy632WOVdyp5dSLzlF6FvVXNEyhbp7AZK6n6GM7OLgvoLf7afGKovDdhA41B52CK4
	vWlummJHUbEbI/yM7dX5Cz7uc0iIzHfY+fzQ9rrPQN+ijftaDycMu762Ct1yVbNsEHZiL68Via1
	GgYRx5PcvtlEXz823+J59PvUON5VPMrlHl9bWQDI/ZaHXWb4veDU5EOtKEEx8rBZ+hCP7ILKQmW
	jeO0aw4e4elHVkGvtTcnQIHO3aXI04itq3etrFZK57F8TgszsAnsb4wJkncIkpJF807427bdx2S
	vMBzlZz
X-Received: by 2002:a05:701b:2510:b0:13f:c85d:17bb with SMTP id a92af1059eb24-16a5888c49cmr12926299c88.1.1791783108925;
        Sun, 11 Oct 2026 22:31:48 -0700 (PDT)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a2f17feasm33513653c88.9.2026.10.11.22.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 22:31:48 -0700 (PDT)
From: Priyanka Mani <priyankamani2100@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-sound@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: mediatek: mt8365: Fix out-of-bounds read in get_iir_coef()
Date: Mon, 12 Oct 2026 05:31:19 +0000
Message-ID: <403cc04bb103dff096edf72b99ae6868ee91f359.1791782072.git.priyankamani2100@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

get_iir_coef() looks up a resampling coefficient set by reading an
index "k" from iir_coef_tbl_matrix[][] and using it to index
iir_coef_tbl_list[], which has 8 entries (valid indices 0..7).

Before the lookup, "k" is only rejected when it is >= IIR_NO_NEED (11),
or equal to IIR_RATIOVER (9) or IIR_INV_COEF (10). The value 8 is
neither a sentinel nor a valid table index, so it falls through to the
else branch and iir_coef_tbl_list[8] is read one element past the end
of the array. The bogus coef pointer and count are then returned to
mt8365_dai_set_config(), which dereferences coef.

The current matrix never produces 8, so this cannot be triggered today,
but the bounds check is wrong: it relies on the matrix contents instead
of the size of the array it guards. Bound the lookup with the actual
array size so only valid indices reach the table.

This was found by Smatch:

  sound/soc/mediatek/mt8365/mt8365-dai-i2s.c:271 get_iir_coef()
  error: buffer overflow 'iir_coef_tbl_list' 8 <= 8

Fixes: 402bbb13a195 ("ASoC: mediatek: mt8365: Add I2S DAI support")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/67af3580-a907-403d-8bfd-76b5c304ab99@stanley.mountain/
Signed-off-by: Priyanka Mani <priyankamani2100@gmail.com>
---
 sound/soc/mediatek/mt8365/mt8365-dai-i2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c b/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
index a058973662b3..2e678f4aa4b1 100644
--- a/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
+++ b/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
@@ -267,7 +267,7 @@ static const u32 *get_iir_coef(unsigned int input_fs,
 		if (k >= IIR_NO_NEED) {
 		} else if (k == IIR_RATIOVER) {
 		} else if (k == IIR_INV_COEF) {
-		} else {
+		} else if (k < ARRAY_SIZE(iir_coef_tbl_list)) {
 			coef = iir_coef_tbl_list[k].coef;
 			cnt = iir_coef_tbl_list[k].cnt;
 		}
-- 
2.43.0

