Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D746E3D6497
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 14:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792246128; cv=none; b=Eg4txNteXAgdrD8xoD9ryR/lKAu7YETCFCw1Q1H4q16PukvpW+PqyI+v5PH+a7CXBQ6D7kFC54x5rqXNK9oPqsxCV1j4coooPnQtxCqCbATHhhPhJjsJcWWWLuklLOFb5YQSynOUUddvOHKPWFjZrYc5nTFjhgueWiSjYhaPcgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792246128; c=relaxed/simple;
	bh=baFpLjnTskatCXH5nIOz3bhNyATV82dn+7vltbCAXcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ilVsY/wCeMhQ72/2Vw/KSFGvKtEjUYIGUPPfiCP7cDEMfZV973U2bLGAOsRaFbsiokVVbklJ8jrBDxVCSA8oRuy0iNKw1mQcl3kmhJ2YElLn8px8sVTfTIyRw4GzHx8AT41Sx+1Lxi5eXxkV+v5h1Vdk1uPvsoWT6uV6zBxokaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XbZ8CXlR; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XbZ8CXlR"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so9901395e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 07:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792246122; x=1792850922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B9YVPWXQ1AxunRapx6pi/difSuiJYO0pfCJBVjjClPo=;
        b=XbZ8CXlRgf5AnuuKVrKEyV9h70xYDxsTaw+VlT4EZyl4/ljs7itsdUmFgOSz3nic6a
         tZxkBpsuxX0z3oUkZY+hkqxoDnO7L07jfro43RZeOevUUzB6keN2tCZxAo8QLxw1/G9w
         CrsDEvQcsQpSTte+rSWyLJhzyK3+fKPRT/j9KBX0Z3YSQx8ji5LUW1Hi9ZeJUuAJYBEl
         HdBEmrXEZmZV4xEy81OcE59GVa2po9/NMnZEuvsCkTHDhlOPWZNt1b/UC4+x8qnJHG1a
         0Qcv+psF2N/sDnP17ytqIohGea9VfCsH45amFzNJPS6Gb5GrILDh5Y/9Mo3bKW8lHST/
         /O5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792246122; x=1792850922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B9YVPWXQ1AxunRapx6pi/difSuiJYO0pfCJBVjjClPo=;
        b=SJ2CNFY2FMp1ZG8mmEMUkLU/kMepCI0u+CWtCVKvxEzPxaDla4huMlB02iSyLzRJxa
         5R5ecNLMdm9+hBRTkfJybGws+S2jO/NElRxuVFwpMYimI6ipmeuxA+iuybpFv0lCCBGL
         J5Mq5Xh9fDFrakat8gKaXIbiMAyYS2gmRAvZKDeDqjFzLMVDgBt4Mw2QKrqedfTB7JpU
         Ijn/+Ilfw1XCJfePHeNdAB+4KwwmPUFPk/c0Gm/UCGFroviP2pwHV7pkS6Jrtsbr6c0R
         fFTDKAWeqCWoosh2e7snQX0ols1gEX7e8CBI3QtIUMSMov8XJeZdBBo7giYaXnRFILL7
         /VuA==
X-Forwarded-Encrypted: i=1; AKwUvBwYL2jJBT4dbnLCD4stMoogUfeefXBMYnzipT1BfXaXCuVjvxZzzf8z7jvHLnz6J85LkMYxolpcceBAsYM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKm8MDWJETjiIs8P59rj0ToD9y9ZX6HPy1kws097JLoHBIZRyWv
	MFmd316CHHxHCx7o1DJ8P54yYH7Wg+8LUklVUUqP28ga996W1Yss46lT
X-Gm-Gg: AYBFou0pfoe/Ghg9T9XMNXUG78e3MxhglVSSkgUFiAwb0jRTuc9FXqi1Yt7anynly1D
	UF+Y2qY66l2/YvkRYO1hpSRHU52Of+tBGvAIQgNeI1gx5/ZX61M7nfdanqg/GRVFiu9+sGob2/t
	jjewZsN/+dzAe9hdDyCXdqq55JLPkGsFeAKTugMkQYZOtlWAvpUic/JEFyWyeU1EOzVe5B4fBv1
	JlZK5rXi19ELrpNbKdcGRf2ndrQK8pqaj6mf46vNUMZny3MicZOBbbjCeQQ3crFoFkC2pQv+5BK
	31NvF2iTee8ON+DJXQj6WNpJNhphSt98bbeMyhUVwLvh9PTeJBPkpGcIb8FODaG/h7NYir439tp
	5icLAoQLRwlDZDaZg3SZPI24t+yjpySI7GRq1HC++ErfVbiGXRd+e3xMGGPKoN0RI+R9U4l/mnz
	/xTmP1XJ/PgdRc5P4+1nfZleMtUrNIaNmaiWAPRWWzRmj+Q/g8nktaJJXGMIDKLKpyU4GLfQpHO
	ebTOA/DogHlGPHJzC+bP0681VgtKmmkEMiBHEzAd+bfPDrt4ROPXt5wOPVD6yGsrkCPFcRsAoyz
	YQ==
X-Received: by 2002:a05:600c:8a0d:20b0:49c:fed6:cd3f with SMTP id 5b1f17b1804b1-4a1d7616d29mr40954785e9.23.1792246121666;
        Sat, 17 Oct 2026 07:08:41 -0700 (PDT)
Received: from machine.home.arpa ([2a0d:3344:57f6::1046])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ce3302b5sm84430745e9.4.2026.10.17.07.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 07:08:40 -0700 (PDT)
From: Luka Panio <lukapanio@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>,
	Douglas Anderson <dianders@chromium.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Luka Panio <lukapanio@gmail.com>
Subject: [PATCH 4/7] Input: edt-ft5x06 - allow a chip specific touch data register
Date: Sat, 17 Oct 2026 16:07:52 +0200
Message-ID: <20261017140827.290666-5-lukapanio@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261017140827.290666-1-lukapanio@gmail.com>
References: <20261017140827.290666-1-lukapanio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The generic FocalTech path reads the touch report starting at register
0x00 and expects the points from register 0x03 onwards. Over SPI the
FT8722 only returns the report when the read starts at register 0x01;
a read from 0x00 returns the static register block instead, the
interrupt is never acknowledged and no further touch events arrive.

Let the chip data select the register the report is read from, keeping
the points at register 0x03.

Signed-off-by: Luka Panio <lukapanio@gmail.com>
---
 drivers/input/touchscreen/edt-ft5x06.c | 6 ++++--
 drivers/input/touchscreen/edt-ft5x06.h | 1 +
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index e57611e48217..7bcc48e07d62 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -149,6 +149,7 @@ struct edt_ft5x06_ts_data {
 	struct edt_reg_addr reg_addr;
 	enum edt_ver version;
 	int (*boot)(struct device *dev, struct gpio_desc *reset_gpio);
+	u8 tdata_reg;
 	unsigned int crc_errors;
 	unsigned int header_errors;
 };
@@ -1037,8 +1038,8 @@ static void edt_ft5x06_ts_set_tdata_parameters(struct edt_ft5x06_ts_data *tsdata
 		tsdata->point_len = 4;
 		crclen = 1;
 	} else {
-		tsdata->tdata_cmd = 0x0;
-		tsdata->tdata_offset = 3;
+		tsdata->tdata_cmd = tsdata->tdata_reg;
+		tsdata->tdata_offset = 3 - tsdata->tdata_reg;
 		tsdata->point_len = 6;
 		crclen = 0;
 	}
@@ -1244,6 +1245,7 @@ int edt_ft5x06_probe(struct device *dev, struct regmap *regmap, int irq,
 
 	tsdata->max_support_points = chip_data->max_support_points;
 	tsdata->boot = chip_data->boot;
+	tsdata->tdata_reg = chip_data->tdata_reg;
 
 	tsdata->vcc = devm_regulator_get(dev, "vcc");
 	if (IS_ERR(tsdata->vcc))
diff --git a/drivers/input/touchscreen/edt-ft5x06.h b/drivers/input/touchscreen/edt-ft5x06.h
index 7eaeb562d11f..c55686e288b6 100644
--- a/drivers/input/touchscreen/edt-ft5x06.h
+++ b/drivers/input/touchscreen/edt-ft5x06.h
@@ -18,6 +18,7 @@ struct regmap;
 
 struct edt_ft5x06_chip_data {
 	int max_support_points;
+	u8 tdata_reg;
 	int (*boot)(struct device *dev, struct gpio_desc *reset_gpio);
 };
 
-- 
2.55.0

