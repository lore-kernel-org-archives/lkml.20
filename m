Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA6D348C4B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789354913; cv=none; b=gv/E0K/kx7vx9hicmKOq8jc/81r7gAEQAd68zqFl3KBkIXRZitVm5jeFG3sEg4HWVfNw4gcZ6VDT94qQjBv1Zy5ubCl1GA+VpIZKhKQHC1ksP2VIRLoTEDYuNZHYMO7vDbvW1Et05rAlNSo0BJXgBXufhlxRd/qJZZzF+PYIOjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789354913; c=relaxed/simple;
	bh=YbBF9laHAErhZzSaGZGDzYG7q1LarpeBoJ8ap1tchQo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GoB9a2eDDNDa5apsW6CYTD4UroRClBxu6kS520EQP/k0a4El/RcxdVfpJvGdbasCVTf2HwqYXD5+awXgDQm7beVt2rhx0+xDLdQvZ/vti6dmup52gBLSJVd7nQE/5lsaGGvwM6bUAxcoNjgNrfgwc7MX5eLue36QRV1qtD9d1Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mom1tinH; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mom1tinH"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c66ba0b762so192758b6e.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789354910; x=1789959710; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A0CrISCG3enxLUNERhlMVwT+4sBOgXXXdTBmRqqtC4g=;
        b=Mom1tinHZz2SDqXo7HhMUZSwWMktQvIvDyG5owl8Irc29i3PircQuWNMMthhIxPuA6
         qcQSzfhxUIrYAbQcg2Y2K/2MeD+lH7HLMWaDOyHUz5QKVexwKnU+KLnITQj+2Na36SDG
         2dGzUGkOYS8FUX+feywlrrYAkCWLRJbUfL/TkJOxucm/kM4ajMj+fWinczN7pjDJLdHa
         x5QTJrNy0QoqVo9ycsod8NQARvzgSIoVUcSUid2ZcHHEGNpceJwiDo8qaE712egHKu2W
         jo1EHxRkrZ4A8Aw0ukokiFZCMdB/nyM3I8/PlfMsN6+OTOcfo4bmn4hHSzDQcl4xcpLW
         2bVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354910; x=1789959710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A0CrISCG3enxLUNERhlMVwT+4sBOgXXXdTBmRqqtC4g=;
        b=YtfI76EYXf/mJ/z4AGSPA+hFSZYkdJ6iuj0sR4PSXwCABypjYnn4alYsy5WluoE09e
         CDoS2mqUsdjHN6/uOSTWJqroS5D6gWQp4dkEF138UsAto8kFw5BDDJK6PNzkwHFG+l9G
         cQ5009U0GSbKqraXaqW7QEW83EfSp3F/ScqaWhACVawdlyd1YgoiD0LZkJjMtse2M0MS
         9I+7GbzJGb9KXidTDSiqg19My5l9/CPXsIU8LqZcxZDB0a4nhpgar3H5/1I2nYeHv7Lj
         Acj2lARrf+hN5YyMnLvg4APf34DjQWZNXP1Ql05Jd2dgDZiNmbQLdnVkVBkDzX3yCtYn
         pHnA==
X-Forwarded-Encrypted: i=1; AKwUvByibFm74zgDeoj2AWl1G6sR6DIC2VnwuUOTq2OQ+Sc5UyNpKF/5rFGAGr05i/+G4eI+nPNIqiyKNg0/o88=@vger.kernel.org
X-Gm-Message-State: AFuF++lBN5SwuNoPCqbc3J0iR1RkzN5buTEIJ6FANRjgYZmw02PWaNd8
	RjgxNU/tR39zfMYfsPL55yQJqC500e4RHX6MAxNElDd9SYFy7Y8qFn28
X-Gm-Gg: AYBFou1suno/qFX84UNRzLN5IVS1JhOg02Vdz892P4gUEHBin2ndGakRJX9fWO/3n/x
	jcAzyyKLe0jTsvGtbzVqSln1ZP2zsiMLx7VRZIlnmSNAPYmYZakIkH8r+hU3cbIQW93FSQp0FY+
	vAjhhbTG//1BblK/ShNZxWFCB/c/PdN1+zxGb3oxjZvv9zwMm/0j+7AM4w0284lFKvsiOFqYlB+
	l4dzhyfd2ngGv0toAVXrw8EwrklColFVHTi69VGcvyA0B44OYtQ+zIi5cFQuC9erVXU5CXH4ts0
	RHGaVMYq2URAG3yDROAXi2dI0APjGU+3eF59Ttpt7KHZD72TRxn51i2U7QK2dZYFS2KUZ22DkS+
	wCyx/uorsF1eYIiR1QgGxb7lV/eGKCzgc1d+/2/buApFTczhPcaVaIx6P9ym0Pede+m3JF7QdrX
	8lFh3J4zeFugJO9gaGqWE36MOdoJky9viqeEi2FiyjRgAh7WEk8F0qQIKse5PB1GMGezhI7o/dK
	XfDxx/qK4o5JOQBb3wP9Bu6shHjt9CaqUmhcH2buL8XFHBEwo/vtIpBAXNpmbaNiw812JWYsElb
	4kk71+UbiMd0oGDRZWJYSJepMMjLIUKzpPqfVbD2OM+Y5E372Oa9/pwkKC6aCJdqpGiMg3bjvAB
	OQRkO9uhvb/ynlAK7MtjOa88gFpuMb0Kp+uH6iBLFrw==
X-Received: by 2002:a05:6830:4486:b0:7f9:555:1def with SMTP id 46e09a7af769-808863d0ac9mr310838a34.11.1789354909720;
        Sun, 13 Sep 2026 20:01:49 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60feba1sm10619014a34.13.2026.09.13.20.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:01:48 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Sep 2026 21:01:14 -0600
Subject: [PATCH v5 08/18] mtd: rawnand: sunxi: avoid redundant column
 changes for extra OOB
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-8-7d711076a6f7@gmail.com>
References: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
In-Reply-To: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
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

