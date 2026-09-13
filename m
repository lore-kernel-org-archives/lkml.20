Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6C1389106
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 04:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789272327; cv=none; b=iN0XIIKTDHKJyheXxLRtvxSSBRfYMH2BXNW5mqcRD8ahmnUn2kX61AldhyGfuQWCT1NtGRNfjfbnq0277naCcVM/+WIHY49vDbKmNIAlDN7oOxBQmtb4aBSL4ruyAQgyyja2ZJMmlmwYffXSepy2CKhw41PItZFinw69qlqOSVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789272327; c=relaxed/simple;
	bh=YbBF9laHAErhZzSaGZGDzYG7q1LarpeBoJ8ap1tchQo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XeRnlJZ+PZOeBlH76hVOYR74aR6JBE9pEV/VTEbhk7GZNxyFqGU/x1RpAxSO085cMTWmgOltuWYlEGFKFumYKadDoz0zH1OwDPD0Qzvm22ATANrqK70WDrg5G67tCS7Ab4vckUHT71hyh6YyiSMIPt6xf+lfwXh48AU6XoXNAOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TBahPvoM; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TBahPvoM"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-469fdb78b1cso627127fac.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 21:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272319; x=1789877119; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A0CrISCG3enxLUNERhlMVwT+4sBOgXXXdTBmRqqtC4g=;
        b=TBahPvoMU33zcyiu7G3nfeGUiv6lrnzRIGV2FcLK/oXV3yblTllYF3GurMd43GyhPI
         1tQzmAqRyfjQWIiZJPaApiEbXcHUtX997++KanuKqhmOwdc9o+0AK7lnJ1qou2Wxo0gk
         H/L4V2kKZ7AvPaBQbsMlS0mg0KAoaBxMDlzQ7uO+N3GJCcFu8nIqX+RS5a1YVkLSge4i
         bL6tOdPOoIh2lgRClQCLZIiF52lxPVhdHoA4XJe7vBHWy5Ozvt/OCNduJZNLsT6boKSB
         0K0cnmQntbB/QMYi3Bpz6WT7fQ3NFSDcPjkqXPJwniNUutUZeonU1xg+cFXDTUSfxo0g
         guYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272319; x=1789877119;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A0CrISCG3enxLUNERhlMVwT+4sBOgXXXdTBmRqqtC4g=;
        b=T7P24Rd8WYa05YJsfGXSyKQ5jGQWSF2RmozNj7IeGchKr63J7rcJ0SrlQQY1t4N+w8
         9uCEb9HHhKUVKu2bSZXdg7RJL8CwLu3XYnmBA9vGts/FYx5h9GuwVZxigOWno/ImZym8
         TX06NtPfHngrVcQvplURFmJheEyj2QyouK9mjYls6l3zKWp04oOeTQRH2Fe/W1fpVFx1
         8e1P1WuX2imDxq7Yejf0HqdN1nBQukY6LajpFs8y/YtR5iD0M/AdyLiKDJxwLnPjkaHv
         +Z3R+20tN2FAzMNtYCqK6X3j/nNo5DBJGcO1unYBMQvxuRo7n0OfWgXzW9HxGb+ypaRK
         AcTA==
X-Forwarded-Encrypted: i=1; AKwUvByptXeN+7qFbpshmWlQFP5n4A0T6obIDgH9+Hes9krWyMO+lMlXEobeHTaZ9ZPZD15vqAXGHeGVV5ezj0s=@vger.kernel.org
X-Gm-Message-State: AFuF++lg5CwkBwxh8jpEJayiN/XDu9+cbMifzXwdyOyum7gJiIEo5fTP
	54EdLU2jBkyrpfSnOYxhjUa6F1Qj7eoU1uk2Til6zrSlRweqJwq7nNYP
X-Gm-Gg: AYBFou2dg6dxRXLaeBTVg7ZnDXgGX7Fca0a5kfNAXRXHjoF0wFXnFiZvOxpiIB0SlSF
	XhDtiEKyWhHMyy8Bb5lUtszmAbQMnr3us4Dyux5vjiLyJdi301ncroVwkcFMLZsjI5nDQQHpYZq
	nsoRMfmD+R7jZ8MHPSWDASd4Ex04eqhMuzaiZEkYnyh/Ld1BPVAt3gGP41qtnCimL+d7ZpfGzuc
	fAO19qAq+Fcl0a5rAAwoNmcaqfHARJLgjUzUhRgIoJZfLgpC2g960bzZfXaFgkbmjQbEpI8dbpg
	puOJuYDoiiPzrxUOLae2I5IVk0WHSr2ASBF0MNn3qkJ4qKO/m1Je+9Zxh9i+FhKi6DB9HcjBk2q
	oQ9qAgiVdqHy/7EOPS+NF1eRbTTaghBt5VVRrAocMZGBFhLYqM4vE7qt8Ns2PYn/dLuM6DJoPKP
	y6oDo3/AA6EsX/yAFtyt4RZAIgujWQ1yowuAFzsjpIMFyvZAaHRAoh7U2i7Nv08FSq+UfVs58fk
	nECO3BoWk1bQcMWCq+vnURvp2kCD36YqwX3cdPFQ7+kybLeqWAEYy+KuxWLHs+nqL9nggQ6JTWB
	cs7rPOLdjHQrFjVf5I8FwGEBvfwYFRWFnmEJtJbj5CRharizQ6HPMkhRM+016m3RzMwTlp7YOWY
	cKw7WyJZlR8pCD+XeRPO2xt2K4VOhqVFrPihWWIFr
X-Received: by 2002:a05:6870:9386:b0:47b:7862:c1c6 with SMTP id 586e51a60fabf-47f59a2cc34mr2957205fac.23.1789272319247;
        Sat, 12 Sep 2026 21:05:19 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699647sm6011535fac.5.2026.09.12.21.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 21:05:18 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Sep 2026 22:04:59 -0600
Subject: [PATCH v4 08/17] mtd: rawnand: sunxi: avoid redundant column
 changes for extra OOB
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-8-4a64bed94229@gmail.com>
References: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com>
In-Reply-To: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The PIO write loop tracks the absolute NAND column in cur_off, while the
extra-OOB helper computes an offset relative to the start of OOB. Comparing
these values directly always requests a column change, even when the last
ECC step has already left the cursor at the start of the extra OOB bytes.

Include the page size in the comparison, matching the extra-OOB read
helper. Keep the explicit column change when the caller does not track the
cursor, as in the DMA path, or when the current column differs.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 41d6560d7df7..13dc0af56eb3 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1509,7 +1509,7 @@ static int sunxi_nfc_hw_ecc_write_extra_oob(struct nand_chip *nand,
 	if (len <= 0)
 		return 0;
 
-	if (!cur_off || *cur_off != offset) {
+	if (!cur_off || *cur_off != (offset + mtd->writesize)) {
 		ret = nand_change_write_column_op(nand, offset + mtd->writesize,
 						  NULL, 0, false);
 		if (ret)

-- 
2.53.0

