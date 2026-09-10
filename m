Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2BD3D969E
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789032705; cv=none; b=ISedx8Prz/7V/5TbDhTcP50HyYGpLtKQFz1sBIF01D2q2eWr762TThH/SfnI97pq95jNC3EsC6+c7IOn1UcwObWKzKb5cTSomqSFPlSmu9ATGZ2kHd81LpkaxtDUhZi41K9pZzN+hmJegYUVerC+NVl8G0rjxWkSKtZAQdm/1w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789032705; c=relaxed/simple;
	bh=6WS2gG4eQGvXIRMEkRovIFW0AaWwhRZ2tj+ICuFq6Q8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nuxb9ElCw/Rtj9FWPdbthtmjosEi76UpBBq8lYQsImBF87MSiLUlcfDiapRCzAJSZQnzZqhm3CtDZjBOeN4At1ghwer9VeOo3CkA2i10XkyHxrLJ30wHCV/ukMBeP4aGMUzwiB4URxSY19CnWN/UdGORifLxpyuyDbu4oiaTrGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=PlKqjpk1; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="PlKqjpk1"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-482e257a23aso4551418f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 02:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789032698; x=1789637498; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eC2Iu7WVN9Kv8E55jimB5I9lAFW6apWINO+cxwm+DSo=;
        b=PlKqjpk1n5h7yzEQwty/xB9VYAUshz6v0YPGI2B17P1+pDTs2vdB/6UYLbsxEzU0e7
         T6y0FWeAF44lLxlwJSpEBs2RRPYZZM5FUlLVVIiaSACFW2yhIn7V4ZADj/FZnUQ1hJqo
         a/5aYJRRABFAyJgI68PFhNf/rcBmjhdwyx24yKmR1L8kUYkUYGS33Ifn03lgKWwAs10E
         NL+YFMfrFLusEIhqXMrDbJe1MnaltHt5hziFAVJTxOWesuhtxoo6acTgnHissbzMsFj/
         L3h4O306Kh/zThoYE+M6PUas4bzmA1TlZ2/zi62kiYZGF1tdf/OCHQ9Is0QY0snMNhIO
         c1dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789032698; x=1789637498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eC2Iu7WVN9Kv8E55jimB5I9lAFW6apWINO+cxwm+DSo=;
        b=BtYf+MRo/zdF7DgkKywF0431sdKW/M+ZYoKABC1DjhsXcJ43EsoPWYVT85PO+CJFbS
         c/22VWXY4i/1O9zbp10dqFIauMw4iInhOpd8z8A8k+TgBQWMon587SyLlRbQqbSMr/CQ
         pr+KWf5TJD0VHshRDMCtSBjQDgGfM5HlYag0Hgh2ZhVYRGjy3dBwr8hm0wePRm3BR1Uz
         ot2KvQ+EYOjV4gYBz4/fftUergmcGxHUcny2Q8nd4HOIJA+4Iii/OV0qvA9lmRUM8lEV
         uqIeZNrookkTmt8o43/lmCE5+t3mO5/gCAYSF8YI3aHB1Qt+wOHU+qXdZQjz2UgAOqNj
         cQTg==
X-Forwarded-Encrypted: i=1; AKwUvBzX/Vb/YpV6BEPLNXaC8YwmebYq0oliDerQ6fAkst3GqmUZ0/QoS8gTHj5pN7So+80snMB1fIiTqJVuUhQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kgMz3oB3IpMP/UCVmEVsFj8/k8HO0z0mscWWba48BuM9z0Cqc8
	nuCw92GeTwF7POxlY15bR2FTnEgnKBpEZTbIn889sgnBF/1D+7R02N/UM+q2RVK5N20=
X-Gm-Gg: AYBFou1CGBujxrppf2jdoos0BjM9qY8Zm4vO9LZOWixOjM4qdIgDgfQvYGEVows3Ujw
	g0MznBQ0Tq0ndZO1i3KHcqMVRuDABCmfuGUie97AEaWKbQuqAzFD4pSiW2fcS9GXdcRSSS7ZucV
	OXJzdh4jrXxU0Hjoo49a0qn3DjhKCJNqkfv19cLf6GKT6fKw/dQ1E7bOQlk70Cm3eNdqVLTa0q2
	Yrbh2fCgbj/1cbk2ZZxJ+t3/+1vJZxUgsBrjCFu5o1NnqCao5Qhzpg1RqnUvRoblVgdBgHQneRb
	XfrJkPxszHahKPc/F7i+ow7LHz8sOwQJPZnHdTUrsrHkcD7kBBlE/2NEcpxTXIa0zBtUMH+9/F+
	K3FYROQd3Tp92ztKDjQ1B5umh5L36kYnAbhP8YBHViPG8Cw1V11Fqo0vy9Guv+X+JXM4s9keMDl
	pXoENOIf/GOt5CTpTZU/0UP0m5ALZF/g38g3ICULL7r65vwzapkogGPRktUEYQU2bGsvyMAuYY4
	X+k4CzXbezt1UZWPLVBhX3aAcSc
X-Received: by 2002:a05:6000:491c:b0:486:e727:d4a9 with SMTP id ffacd0b85a97d-486e727d4bamr267531f8f.55.1789032698493;
        Thu, 10 Sep 2026 02:31:38 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858dd90e1fsm54098918f8f.28.2026.09.10.02.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 02:31:37 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 10 Sep 2026 11:31:08 +0200
Subject: [PATCH v7 1/5] mfd: axp20x: Constify axp313 and axp717 cells
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-axp318-regulator-v7-1-de720ceb9bac@baylibre.com>
References: <20260910-axp318-regulator-v7-0-de720ceb9bac@baylibre.com>
In-Reply-To: <20260910-axp318-regulator-v7-0-de720ceb9bac@baylibre.com>
To: Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Hans de Goede <hansg@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 mfd@lists.linux.dev, linux-sunxi@lists.linux.dev, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1161; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=6WS2gG4eQGvXIRMEkRovIFW0AaWwhRZ2tj+ICuFq6Q8=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqonjuqKxu8UNJHq0DCQAWeUf5/7Y3PNX51fj8j
 RwHioty2leJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaqJ47gAKCRDm/A8cN/La
 hfhdD/9PQSp8YB79F9eYZ31MRivxo7VTk8yHo2WHgTfXaGtRTfjp9JvsSb/KXSnXm1mkXgSDKF/
 1qKGGwWOg2SDh+0/gc195UoHaT7SBPOGUOS7WuyIuXdLAIEURQpsUjuNlmK2aKITGtlSXu7IlfK
 6EZZapEDo5HMn7h07BKKCdaraVW0Dnkw3Q29VHrnU4Vt+2Y1fL4IhwK+mVvjYtrzmwL+Cj89hcn
 8BziLEW2Id7SUD3TNpb/t+kfqdQ507IKS3Zh4y1Sx2zmS/R7MggQQjm5jVmL5KHLM4DTTKIJnLK
 GcdngZL14h1BzQRc6VyJjoD4iJnShD7BkcnFE9LnFq4HdHxP83iC0ki1E28iApVmmD843/Pr+ud
 XyNn5mTkpyjSvMFsUdpJwu/S8/5FpSiHTbHqxM4AXEtmsvHYvraEj0GsTBrUtmduGL2w6ncFW6I
 5gMOWdniEQXZRDBNUR74eBZG5yJKAjHdzl7YWazuo8IyVtcRVgFpKQmZxI7UgLK0MONTR2RSDrE
 q/U03CaNG7XBfU2Y/p+vZWek4zxBiATbJksSPsb6I2bOlURjlc2BPa7YUAD7woYaGVIR8qfxue5
 o2TYBOrh6ODPkxuTU+VwqGvFc3h6K7iq9HL2NdzIFs4SPtpgwW42j/OF5vhkjLuOpjufjyR4Ume
 LVznEVirXAmuMUg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

mfd_cells array should generally be const and there does not seem to be
anything against it for the axp313 and axp717.

Constify the mfd_cells array for the axp313 and axp717 to be consistent
with the other supported chips

Acked-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/mfd/axp20x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index 50df66de24e0..4d770e718716 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -1055,13 +1055,13 @@ static const struct mfd_cell axp152_cells[] = {
 	},
 };
 
-static struct mfd_cell axp313a_cells[] = {
+static const struct mfd_cell axp313a_cells[] = {
 	/* AXP323 is sometimes paired with AXP717 as sub-PMIC */
 	MFD_CELL_BASIC("axp20x-regulator", NULL, NULL, 0, 1),
 	MFD_CELL_RES("axp313a-pek", axp313a_pek_resources),
 };
 
-static struct mfd_cell axp717_cells[] = {
+static const struct mfd_cell axp717_cells[] = {
 	MFD_CELL_NAME("axp20x-regulator"),
 	MFD_CELL_RES("axp20x-pek", axp717_pek_resources),
 	MFD_CELL_OF("axp717-adc",

-- 
2.53.0

