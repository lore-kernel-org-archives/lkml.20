Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F5B3C5855
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789027808; cv=none; b=X/jKjoGimtmOjxHwf5ERNlRi0wiOqsMduZQthw1nCGG4W8fJLNejw/jXbiMoBMrJa3TpsrQaCfnS29KDOD0nqj9GO+UcaZMfCYDcMk0FU4aW2lFgQyRXvPO/Wi9sd5sVur/55anwC4b53iZfwaNbjMfXlg2rMwC4nNHYU2Q0c4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789027808; c=relaxed/simple;
	bh=s4NszV1LAjsfPGh2AYlQJm8DMiRBqi3Wr7v2mRKxub0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NZV4NC8GTzJ2VHqbLpYobgKu80ZXYhiJ94zFnwHWle7m50D0lYerDokUgZKern0DmEQOCItuLEhQ6Syw1xWXnpcfb+SAX8nI00DULwr5KPn4u07HEmkWx8aZUAI7o/O+iUiNXaSsKBG2jkMnKJli0MZijrz1AN+zddVPTUNvBrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qf5Emd2J; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qf5Emd2J"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-855d2bfae95so275367b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789027806; x=1789632606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DcJ7z7pjuPgGZIi0pC2sSQMK73f03/U0vs3UawuRDsQ=;
        b=qf5Emd2JeT6IBwXAYGkvz0jc3TiiP4bk6tdCfF5oHMSzX+0rhmVU1tBbXOheFTFYyF
         CLkS+3tO0pVVC3ZPuh4GFjvFRU5q++nKZ8pOwwQstI3u3ZvcmHgbLj7IKc4jiHm3CsSy
         aRJxuIZrg6xJifopMjscSVoWCkc4a+tU2Ysgcu1OF0o3WSI0RqHNR2TfJYe3AvkjOdrv
         vNu9nuK3XwXqRekgl4qvgIGpFXuq1j87W/Io90SXVl/tcJCkkyDm3lKyuAm4P6fsNa4u
         tpAS886GcuPeUMMZW/xrw+Uy+bHsbui4yxo6W5YR+Jk2ZowIkqae5Tiax4AHZQFegCIu
         x+dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789027806; x=1789632606;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DcJ7z7pjuPgGZIi0pC2sSQMK73f03/U0vs3UawuRDsQ=;
        b=LlV8s3EQzgt9udCVFo9nXHUMV6sPtRZ6XKQfS0cpDvpcNr+bz5nqo7MdJtS4u4Aj19
         IBKBYkSP0bCrzNFtPGx+Vg/5in9wYpOTQChQC6zl/0Ox+orD1TsWgW4T5hhyGWnwEr24
         rCeysuF+8D5itV2l3rHRi8j71XzsztDlV4Zn19SX3TXvZM/Pw54zt+lygFMaKwmONEP0
         tRyAFEiK0pPGhOulUMkYCgSm2OJP/WZXH81rxZzeQcCt2QZeRQWvbfkDzEXMbRfIkYEl
         eKEASRqXJcs1DW1Gi/L0xfad+Ibbpl8GkKh2A51C2Elf4XudP+uy2lRqDPfKOc5gcRBV
         J2qw==
X-Forwarded-Encrypted: i=1; AKwUvBwuGk9dCEc+SiufqEBCWemDDZ8YaV0k+GsMJvmUlSsdxZBOpw152eN9cThRogquekzHuoVrgUFWzu0V2C8=@vger.kernel.org
X-Gm-Message-State: AFuF++lzXWUB7Gd7opvDbHGXxRKJJkGXO/uMxSSmF1RzuqjrT/4HrwPP
	vDlUJkHdzn5r2IqpIM/04+w/Z25jhR2uBcfDKtVByGf/ZUJvo9/Ge0Jd
X-Gm-Gg: AYBFou3WFcJUpqwyWPZILponrg/7RD90bqy6Qbtt2QHjWBnnJjq5C7PF/Vu5XDYSt9g
	cyxEjYSbWpWmG5Oq6aPd1REfrdv0ZrMePOaW3odolvgHxGa5SrbmGiIUJuCEZdnIXOaf1MKAIzB
	Y7rSXIk/ZJ54Mv74gr4a/dUzsjfvTDKVTHt/nsCsQkOnukY7rzpXMAy3WT3RyHrWt3Js0hNvs6i
	xWwjCdSouc04/xuH819X4522e7OJ85Y1Nvux1uVcglGK5lzOj9n/bzxyNk6NMayRREb5r3T5LZJ
	ZWElK2bS/pP+5DC2BdMtAPhqhF7jQ8rbrrB1UI4WcsK5LhgevkFDaUSXSaGkUE/lrtj3Ymasowx
	X5QLtOS75LcROS23ZofmxLFsgZ/1fo4NzXgcbNV4d3qR/8hif1pdUmDcVyXo+alJeMfFvwxJjwB
	TPxd3x2aGgtdCJ9JKeBgeelCHPyGVVH7b5tb236yCOKjroL0KgB7FR9E4w+UTReJ9LySJsW54mm
	3A=
X-Received: by 2002:a05:6a00:1f0f:b0:848:52bf:4296 with SMTP id d2e1a72fcca58-869b2f90564mr1570548b3a.15.1789027805617;
        Thu, 10 Sep 2026 01:10:05 -0700 (PDT)
Received: from baineng-pc.. ([117.133.183.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8615204904fsm7832757b3a.19.2026.09.10.01.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 01:10:05 -0700 (PDT)
From: Baineng Shou <shoubaineng@gmail.com>
To: Eugeniy.Paltsev@synopsys.com,
	vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baineng Shou <shoubaineng@gmail.com>
Subject: [PATCH] dmaengine: dw-axi-dmac: demote apb_regs warning to debug
Date: Thu, 10 Sep 2026 16:09:56 +0800
Message-Id: <20260910080956.2342267-1-shoubaineng@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dw_axi_dma_set_hw_channel() logs "apb_regs not initialized" at err
level when apb_regs is absent. However, only Intel KeemBay
("intel,kmb-axi-dma") carries apb_regs; all other supported SoCs
(snps,axi-dma-1.01a, sophgo,cv1800b, starfive,jh7110/jh8100) operate
without it. For those, reaching this path during slave/cyclic prep and
terminate is the normal no-op case, not an error, and the err log spams
dmesg on every transfer.

Demote it to dev_dbg to match the identical check in
dw_axi_dma_set_byte_halfword().

Signed-off-by: Baineng Shou <shoubaineng@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index bcefaff03b5c..d829b9af5491 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -574,7 +574,7 @@ static void dw_axi_dma_set_hw_channel(struct axi_dma_chan *chan, bool set)
 	unsigned long reg_value, val;
 
 	if (!chip->apb_regs) {
-		dev_err(chip->dev, "apb_regs not initialized\n");
+		dev_dbg(chip->dev, "apb_regs not initialized\n");
 		return;
 	}
 
-- 
2.34.1

